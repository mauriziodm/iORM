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
unit iORM.DBBuilder.Schema.Table.Physical;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Schema.Base, iORM.Context.Table.Interfaces, iORM.Context.Map.Interfaces,
  iORM.Context.Properties.Interfaces, iORM.Attributes, iORM.CommonTypes;

type

  /// <summary>
  ///  Table of the Physical branch: NOT ORM-backed (no IioTable). Its name and the Fields/Indexes/
  ///  ForeignKeys collections are stored/populated at construction from the live database catalog by
  ///  the Introspector. Only the "comparable core" (Name, SqlName, the three collections,
  ///  PrimaryKeyField, Status) is meaningful; the ORM-only members (ContextTable, key-generation
  ///  family, IsTrueClass, SequenceName, the ORM-shaped AddForeignKey/AddIndex) and the diff-only
  ///  members (Force*, HasFieldChanges) are stubbed - the PlanBuilder never reads them on a Physical
  ///  table. Indexes/foreign keys are added by the Introspector straight into the exposed collections;
  ///  AddField is reused (it also tracks the primary-key field).
  /// </summary>
  TioDBBuilderSchemaTablePhysical = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaTable)
  private
    FConnectionDefName: String;
    FFields: TioDBBuilderSchemaFields;
    FForeignKeys: TioDBBuilderSchemaForeignKeys;
    FIndexes: TioDBBuilderSchemaIndexes;
    FName: String;
    FPrimaryKeyField: IioDBBuilderSchemaField;
    function FieldExists(const AFieldName: String): Boolean;
  public
    constructor Create(const AConnectionDefName, AName: String);
    destructor Destroy; override;
    // --- Comparable core (meaningful on a Physical table) ---
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    function GetFields: TioDBBuilderSchemaFields;
    function GetForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetIndexes: TioDBBuilderSchemaIndexes;
    function GetName: String;
    function GetPrimaryKeyField: IioDBBuilderSchemaField;
    function GetSqlName: String;
    // --- ORM-only members: stubbed (never read on a Physical table) ---
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function GetContextTable: IioTable;
    function GetIsTrueClass: Boolean;
    function GetKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetRequestedKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetSequenceName: String;
    function IsKeyGenerationStrategyFallback: Boolean;
    procedure SetIsTrueClass(const AValue: Boolean);
    function UsesIdentityForKeyGeneration: Boolean;
    function UsesSequenceForKeyGeneration: Boolean;
    // --- Diff-only members: stubbed (removed from the node model in a later phase) ---
    procedure ForceCreateStatus;
    procedure ForceFieldsCreateStatus;
    procedure ForceForeignKeysCreateStatus;
    procedure ForceIndexesCreateStatus;
    function HasFieldChanges: Boolean;
  end;

implementation

uses
  System.SysUtils, iORM.DB.Factory, iORM.Exceptions;

{ TioDBBuilderSchemaTablePhysical }

constructor TioDBBuilderSchemaTablePhysical.Create(const AConnectionDefName, AName: String);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
  FName := AName;
  FFields := TioDBBuilderSchemaFields.Create;
  FForeignKeys := TioDBBuilderSchemaForeignKeys.Create;
  FIndexes := TioDBBuilderSchemaIndexes.Create;
end;

destructor TioDBBuilderSchemaTablePhysical.Destroy;
begin
  FFields.Free;
  FForeignKeys.Free;
  FIndexes.Free;
  inherited;
end;

procedure TioDBBuilderSchemaTablePhysical.AddField(ASchemaField: IioDBBuilderSchemaField);
begin
  if not FieldExists(ASchemaField.FieldName) then
  begin
    FFields.Add(ASchemaField);
    if ASchemaField.PrimaryKey then
      FPrimaryKeyField := ASchemaField;
  end;
end;

function TioDBBuilderSchemaTablePhysical.FieldExists(const AFieldName: String): Boolean;
var
  LField: IioDBBuilderSchemaField;
begin
  for LField in FFields do
    if LField.FieldName.Equals(AFieldName) then
      Exit(True);
  Result := False;
end;

function TioDBBuilderSchemaTablePhysical.GetFields: TioDBBuilderSchemaFields;
begin
  Result := FFields;
end;

function TioDBBuilderSchemaTablePhysical.GetForeignKeys: TioDBBuilderSchemaForeignKeys;
begin
  Result := FForeignKeys;
end;

function TioDBBuilderSchemaTablePhysical.GetIndexes: TioDBBuilderSchemaIndexes;
begin
  Result := FIndexes;
end;

function TioDBBuilderSchemaTablePhysical.GetName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FName, False);
end;

function TioDBBuilderSchemaTablePhysical.GetPrimaryKeyField: IioDBBuilderSchemaField;
begin
  Result := FPrimaryKeyField;
end;

function TioDBBuilderSchemaTablePhysical.GetSqlName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FName, True);
end;

// --- ORM-only members: stubbed ---

procedure TioDBBuilderSchemaTablePhysical.AddForeignKey(const AReferenceMap, ADependentMap: IioMap;
  const ADependentProperty: IioProperty; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  // Not applicable to a Physical (catalog) table: foreign keys are added by the Introspector straight
  // into the ForeignKeys collection as already-built IioDBBuilderSchemaFK objects.
  raise EioDBBuilderException.Create(ClassName, 'AddForeignKey', 'Not supported on a Physical table.');
end;

procedure TioDBBuilderSchemaTablePhysical.AddIndex(const AIndexAttr: ioIndex);
begin
  // Not applicable to a Physical (catalog) table: indexes are added by the Introspector straight into
  // the Indexes collection as already-built IioDBBuilderSchemaIndex objects.
  raise EioDBBuilderException.Create(ClassName, 'AddIndex', 'Not supported on a Physical table.');
end;

function TioDBBuilderSchemaTablePhysical.GetContextTable: IioTable;
begin
  Result := nil;
end;

function TioDBBuilderSchemaTablePhysical.GetIsTrueClass: Boolean;
begin
  Result := False;
end;

function TioDBBuilderSchemaTablePhysical.GetKeyGenerationStrategy: TioKeyGenerationStrategyType;
begin
  Result := Low(TioKeyGenerationStrategyType);
end;

function TioDBBuilderSchemaTablePhysical.GetRequestedKeyGenerationStrategy: TioKeyGenerationStrategyType;
begin
  Result := Low(TioKeyGenerationStrategyType);
end;

function TioDBBuilderSchemaTablePhysical.GetSequenceName: String;
begin
  Result := '';
end;

function TioDBBuilderSchemaTablePhysical.IsKeyGenerationStrategyFallback: Boolean;
begin
  Result := False;
end;

procedure TioDBBuilderSchemaTablePhysical.SetIsTrueClass(const AValue: Boolean);
begin
  // no-op: not applicable to a Physical table
end;

function TioDBBuilderSchemaTablePhysical.UsesIdentityForKeyGeneration: Boolean;
begin
  Result := False;
end;

function TioDBBuilderSchemaTablePhysical.UsesSequenceForKeyGeneration: Boolean;
begin
  Result := False;
end;

// --- Diff-only members: stubbed ---

procedure TioDBBuilderSchemaTablePhysical.ForceCreateStatus;
begin
  // no-op
end;

procedure TioDBBuilderSchemaTablePhysical.ForceFieldsCreateStatus;
begin
  // no-op
end;

procedure TioDBBuilderSchemaTablePhysical.ForceForeignKeysCreateStatus;
begin
  // no-op
end;

procedure TioDBBuilderSchemaTablePhysical.ForceIndexesCreateStatus;
begin
  // no-op
end;

function TioDBBuilderSchemaTablePhysical.HasFieldChanges: Boolean;
begin
  Result := False;
end;

end.
