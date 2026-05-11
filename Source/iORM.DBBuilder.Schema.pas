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
unit iORM.DBBuilder.Schema;

interface

uses
  iORM.DBBuilder.Interfaces, System.Classes, iORM.Context.Map.Interfaces;

type

  TioDBBuilderSchema = class(TInterfacedObject, IioDBBuilderSchema)
  private
    FIndexesEnabled, FForeignKeysEnabled: Boolean;
    FScript: IioDBBuilderSqlScript;
    FSequences: TioDBBuilderSchemaSequences;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    FStatus: TioDBBuilderStatus;
    FTables: TioDBBuilderSchemaTables;
    function GetForeignKeysEnabled: Boolean;
    function GetIndexesEnabled: Boolean;
    function GetScript: IioDBBuilderSqlScript;
    function GetSequences: TioDBBuilderSchemaSequences;
    function GetSqlGenerator: IioDBBuilderSqlGenerator;
    function GetTables: TioDBBuilderSchemaTables;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);
  public
    constructor Create(const AIndexesEnabled, AForeignKeysEnabled: Boolean;
      const ASqlGenerator: IioDBBuilderSqlGenerator);
    destructor Destroy; override;

    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
    procedure SequenceAddIfNotExists(const ASequenceName: String);

    property ForeignKeysEnabled: boolean read GetForeignKeysEnabled;
    property IndexesEnabled: boolean read GetIndexesEnabled;
    property Script: IioDBBuilderSqlScript read GetScript;
    property Sequences: TioDBBuilderSchemaSequences read GetSequences;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    property Tables: TioDBBuilderSchemaTables read GetTables;
  end;

implementation

uses
  iORM.DBBuilder.Factory, iORM.Exceptions, System.SysUtils, iORM.DB.ConnectionContainer, iORM.DB.Factory,
  iORM.CommonTypes;

{ TioDBBuilderSchema }

constructor TioDBBuilderSchema.Create(const AIndexesEnabled, AForeignKeysEnabled: Boolean;
  const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  FScript := TioDBBuilderFactory.NewSqlScript;
  FSequences := TioDBBuilderSchemaSequences.Create;
  FIndexesEnabled := AIndexesEnabled;
  FForeignKeysEnabled := AForeignKeysEnabled;
  FSqlGenerator := ASqlGenerator;
  FStatus := stClean;
  FTables := TioDBBuilderSchemaTables.Create;
end;

destructor TioDBBuilderSchema.Destroy;
begin
  FTables.Free;
  FSequences.Free;
  inherited;
end;

// This method implements a "find or create" (lazy registry) pattern on the FTables dictionary.
// It is called once per mapped class during schema building: each class contributes its fields,
// indexes and foreign keys to the corresponding SchemaTable object.
// When multiple classes share the same physical table (e.g. single-table inheritance / TrueClass),
// the first call creates the SchemaTable entry; subsequent calls for other classes mapped to the
// same table simply retrieve the existing entry and enrich it.
function TioDBBuilderSchema.FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
var
  LTableName: String;
  LKeyGenStrategy: TioKeyGenerationStrategyType;
begin
  LTableName := AMap.GetTable.TableName;
  if not FTables.ContainsKey(LTableName) then
  begin
    // The table does not exist yet in the schema: create it.
    // Resolve the key generation strategy first: if the map declares kgsAuto,
    // the SqlGenerator translates it into the concrete DBMS-specific strategy
    // (e.g. Autoincrement for SQLite, Identity/Sequence for Firebird 3+, etc.).
    LKeyGenStrategy := FSqlGenerator.Resolve_KeyGenerationStrategy(AMap.GetTable.GetKeyGenerationStrategy);
    FTables.Add(LTableName, TioDBBuilderFactory.NewSchemaTable(AMap.GetTable, LKeyGenStrategy));
  end;
  Result := FTables.Items[LTableName];
  // Update the IsTrueClass flag on the SchemaTable.
  // In single-table inheritance multiple classes share the same table, but only the
  // "true" class (the one that owns the discriminator field) has IsTrueClass = True.
  // The setter uses an OR-like logic: once set to True it never goes back to False,
  // so if at least one of the mapped classes is the TrueClass the flag stays True.
  Result.IsTrueClass := AMap.GetTable.IsTrueClass;
end;

function TioDBBuilderSchema.FindTable(const ATableName: String; const ARaiseIfNotFound: Boolean = True): IioDBBuilderSchemaTable;
begin
  if FTables.ContainsKey(ATableName) then
    Result := FTables.Items[ATableName]
  else
  begin
    if ARaiseIfNotFound then
      raise EioDBBuilderException.Create(ClassName, 'GetTableStatus', Format('SchemaTable not found "%s".', [ATableName]))
    else
      Result := nil;
  end;
end;

function TioDBBuilderSchema.GetForeignKeysEnabled: Boolean;
begin
  Result := FForeignKeysEnabled;
end;

function TioDBBuilderSchema.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchema.GetIndexesEnabled: Boolean;
begin
  Result := FIndexesEnabled;
end;

procedure TioDBBuilderSchema.SequenceAddIfNotExists(const ASequenceName: String);
begin
  if ASequenceName.Trim.IsEmpty then
    raise EioDBBuilderException.Create(ClassName, 'SequenceAddIfNotExists', Format('Invalid sequence name "%s"', [ASequenceName]));
  if FSequences.IndexOf(ASequenceName) = -1 then
    FSequences.Add(ASequenceName);
end;

function TioDBBuilderSchema.GetSequences: TioDBBuilderSchemaSequences;
begin
  Result := FSequences;
end;

function TioDBBuilderSchema.GetSqlGenerator: IioDBBuilderSqlGenerator;
begin
  Result := FSqlGenerator;
end;

procedure TioDBBuilderSchema.SetStatus(const AValue: TioDBBuilderStatus);
begin
//  if AValue > FStatus then  // Carlo Marona (2025-10-20): Why?
  FStatus := AValue;
end;

function TioDBBuilderSchema.GetScript: IioDBBuilderSqlScript;
begin
  Result := FScript;
end;

function TioDBBuilderSchema.GetTables: TioDBBuilderSchemaTables;
begin
  Result := FTables;
end;

end.
