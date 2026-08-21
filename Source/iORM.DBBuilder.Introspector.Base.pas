{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.DBBuilder.Introspector.Base;

interface

uses
  iORM.Attributes, iORM.Context.Properties.Interfaces, iORM.DB.Interfaces, iORM.DBBuilder.Interfaces;

type

  /// <summary>
  ///  Segregates the injected dependencies (Context, Strategy): each field is private to this class
  ///  alone, so none of TioDBBuilderIntrospectorBase's own methods (and its dialect-specific
  ///  descendants, across two files) can ever touch them directly, bypassing the Context/Strategy
  ///  properties - only this class's own Get* methods do. Both are ingredients the Introspector needs
  ///  to do its real job (read the catalog), not its reason for being, so - same criterion as
  ///  TioDBBuilderStrategySegregation (see iORM.DBBuilder.Strategy.Base) and the "Field
  ///  visibility" note in CLAUDE.md - they belong in a dedicated carrier, not bare protected fields.
  /// </summary>
  TioDBBuilderIntrospectorSegregation = class(TInterfacedObject)
  strict private
    // strict private, not plain private: plain private in Delphi is unit-scoped, so any other class
    // declared in this same unit (TioDBBuilderIntrospectorBase included) would still see these fields
    // directly - defeating the whole point of this class. strict private is scoped to this exact class.
    FContext: IioDBBuilderContext;
    FStrategy: IioDBBuilderStrategy;

    function GetContext: IioDBBuilderContext;
    function GetStrategy: IioDBBuilderStrategy;
  strict protected
    property Context: IioDBBuilderContext read GetContext;
    property Strategy: IioDBBuilderStrategy read GetStrategy;
  public
    constructor Create(const AContext: IioDBBuilderContext; const AStrategy: IioDBBuilderStrategy);
  end;

  /// <summary>
  ///  Base of the catalog Introspector: owns the dialect-independent skeleton (enumerate the physical
  ///  tables, wrap the reads in a transaction, assemble the Physical schema) and delegates the actual
  ///  catalog reads to the per-dialect ReadFields/ReadIndexes/ReadForeignKeys. The Strategy is injected
  ///  only for Check_DatabaseExists. No Status is ever stamped here (single-writer: the PlanBuilder owns
  ///  Status).
  /// </summary>
  TioDBBuilderIntrospectorBase = class(TioDBBuilderIntrospectorSegregation, IioDBBuilderIntrospector)
  private
    function Introspect: IioDBBuilderSchema;
  protected
    // Shared query execution (same raw-query mechanic the Strategy uses for its Check_* probes).
    function GetRawQuery(const ASQL: String): IioQuery;
    // Best-effort mapping of a raw catalog type string to the ORM metadata enum. NOT the comparison
    // basis under reconciliation approach (1) - the raw string (FieldTypeRaw) is; this only fills the
    // node's enum for completeness/inspection, so an approximate token match is acceptable.
    function RawTypeToMetadataFieldType(const ARawType: String): TioMetadataFieldType;
    // Maps a catalog ON UPDATE / ON DELETE action string to TioFKAction. iORM only ever generates the
    // four modelled actions; anything else (e.g. RESTRICT, which iORM never emits) maps to fkUnspecified.
    function RawToFKAction(const ARawAction: String): TioFKAction;
    // Per-dialect catalog reads: populate ATable from the live catalog (ATableName is the raw name).
    procedure ReadFields(const ATable: IioDBBuilderSchemaTable; const ATableName: String); virtual; abstract;
    procedure ReadForeignKeys(const ATable: IioDBBuilderSchemaTable; const ATableName: String); virtual; abstract;
    procedure ReadIndexes(const ATable: IioDBBuilderSchemaTable; const ATableName: String); virtual; abstract;
  public
  end;

implementation

uses
  System.SysUtils, System.Generics.Collections, iORM, iORM.DB.QueryEngine, iORM.DBBuilder.Factory,
  iORM.DBBuilder.Schema.Table.Physical;

{ TioDBBuilderIntrospectorSegregation }

constructor TioDBBuilderIntrospectorSegregation.Create(const AContext: IioDBBuilderContext; const AStrategy: IioDBBuilderStrategy);
begin
  inherited Create;
  FContext := AContext;
  // Injected rather than self-built: the Engine already owns a Strategy for this Context, and the only
  // thing needed here is its dialect-specific Check_DatabaseExists.
  FStrategy := AStrategy;
end;

function TioDBBuilderIntrospectorSegregation.GetContext: IioDBBuilderContext;
begin
  Result := FContext;
end;

function TioDBBuilderIntrospectorSegregation.GetStrategy: IioDBBuilderStrategy;
begin
  Result := FStrategy;
end;

{ TioDBBuilderIntrospectorBase }

function TioDBBuilderIntrospectorBase.GetRawQuery(const ASQL: String): IioQuery;
begin
  Result := TioQueryEngine.GetRawQuery(Context.ConnectionDefName, ASQL, True);
end;

function TioDBBuilderIntrospectorBase.Introspect: IioDBBuilderSchema;
var
  LQuery: IioQuery;
  LTableNames: TList<String>;
  LTableName: String;
  LTable: IioDBBuilderSchemaTable;
begin
  // The Physical branch is a bare schema (no ORM build): the modes are irrelevant to it, but are taken
  // from the Mapped schema so both branches carry the same configuration.
  Result := TioDBBuilderFactory.NewEmptySchema(Context.Reconciliation.MappedSchema.IndexesMode,
    Context.Reconciliation.MappedSchema.ForeignKeysMode);

  // No database yet: nothing to introspect (everything will be created), leave the Physical schema empty.
  if not Strategy.Check_DatabaseExists then
    Exit;

  // Keep the physical connection alive across all the reads via a single transaction. Snapshot the table
  // names first, then read each table's structure: this avoids holding the table-list cursor open while
  // the per-table reads open their own nested cursors.
  io.StartTransaction(Context.ConnectionDefName);
  try
    LTableNames := TList<String>.Create;
    try
      LQuery := GetRawQuery(Context.SqlGenerator.BuildSQL_TableList);
      while not LQuery.Eof do
      begin
        LTableNames.Add(LQuery.Fields[0].AsString.Trim);  // .Trim: Firebird right-pads CHAR identifiers
        LQuery.Next;
      end;

      for LTableName in LTableNames do
      begin
        LTable := TioDBBuilderSchemaTablePhysical.Create(Context.ConnectionDefName, LTableName);
        ReadFields(LTable, LTableName);
        ReadIndexes(LTable, LTableName);
        ReadForeignKeys(LTable, LTableName);
        Result.AddTable(LTable);
      end;
    finally
      LTableNames.Free;
    end;

    io.CommitTransaction(Context.ConnectionDefName);
  except
    io.RollbackTransaction(Context.ConnectionDefName);
    raise;
  end;
end;

function TioDBBuilderIntrospectorBase.RawToFKAction(const ARawAction: String): TioFKAction;
var
  LAction: String;
begin
  LAction := ARawAction.Trim.ToUpper;
  if LAction = 'CASCADE' then
    Result := fkCascade
  else if LAction = 'SET NULL' then
    Result := fkSetNull
  else if LAction = 'SET DEFAULT' then
    Result := fkSetDefault
  else if LAction = 'NO ACTION' then
    Result := fkNoAction
  else
    // e.g. RESTRICT (iORM never generates it) or an empty/unknown value.
    Result := fkUnspecified;
end;

function TioDBBuilderIntrospectorBase.RawTypeToMetadataFieldType(const ARawType: String): TioMetadataFieldType;
var
  LType: String;
begin
  // Best-effort, order-sensitive token match (TIMESTAMP before DATE/TIME, VARCHAR before CHAR).
  LType := ARawType.Trim.ToUpper;
  if LType.Contains('VARCHAR') then
    Result := ioMdVarchar
  else if LType.Contains('CHAR') then
    Result := ioMdChar
  else if LType.Contains('TIMESTAMP') or LType.Contains('DATETIME') then
    Result := ioMdDateTime
  else if LType.Contains('DATE') then
    Result := ioMdDate
  else if LType.Contains('TIME') then
    Result := ioMdTime
  else if LType.Contains('DECIMAL') then
    Result := ioMdDecimal
  else if LType.Contains('NUMERIC') then
    Result := ioMdNumeric
  else if LType.Contains('INT') then
    Result := ioMdInteger
  else if LType.Contains('FLOAT') or LType.Contains('DOUBLE') or LType.Contains('REAL') then
    Result := ioMdFloat
  else if LType.Contains('BOOL') then
    Result := ioMdBoolean
  else if LType.Contains('BLOB') or LType.Contains('BINARY') then
    Result := ioMdBinary
  else
    Result := ioMdCustomFieldType;
end;

end.
