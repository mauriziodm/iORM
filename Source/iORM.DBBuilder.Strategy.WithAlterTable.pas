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
/// <summary>
/// Base strategy class for RDBMS that support ALTER TABLE operations.
/// This class contains the common logic shared by Firebird, MS SQL Server, PostgreSQL, etc.
/// SQLite does NOT inherit from this class because it requires the rename-create-copy pattern.
/// </summary>
unit iORM.DBBuilder.Strategy.WithAlterTable;

interface

uses
  iORM.Attributes,
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base,
  iORM.Exceptions

  ;


type
  TioDBBuilderStrategyWithAlterTable = class(TioDBBuilderStrategyBase)
  private
    // Sequences
    procedure CreateSequences;
    procedure CreateTableSequence(const ATable: IioDBBuilderSchemaTable);
    procedure DropSequence(const ASequenceName: string);
    function SequenceExists(const ASequenceName: string): boolean;
  protected
    // Tables
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); override;
    // Fields
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; override;
    // Field change detection methods - abstract for RDBMS-specific invalid conversions
    function GetInvalidTypeConversions: string; override; abstract;
    function IsFieldLengthChanged(const AOldFieldLength, ANewFieldLength: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldPrecisionChanged(const AOldFieldPrecision, ANewFieldPrecision: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean; virtual;
    function IsFieldDefaultChanged(const AOldFieldDefault, ANewFieldDefault: String; const AField: IioDBBuilderSchemaField): Boolean; virtual;
    // Indexes
    procedure DropIndexes; override;
    function IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    function IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean; override;
    // ForeignKeys
    procedure DropForeignKeys; override;
    function ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
    function ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean; override;
    // Warnings
    procedure WarningNewValueLessThanTheOldOne(const AValueName: String; const AOldValue, ANewValue: Integer; const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable); virtual;
    // Main generation
    procedure GenerateDatabaseObjects(const Create: boolean); override;

  public

  end;


implementation

uses
  System.SysUtils,
  System.StrUtils,

  iORM.CommonTypes,
  iORM.DB.Factory,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine

  ;


{ TioDBBuilderStrategyWithAlterTable }

procedure TioDBBuilderStrategyWithAlterTable.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  if taFields in ATable.Changes then
  begin
    AddOrAlterFields(ATable);
  end;

  if Schema.IndexesEnabled and (taIndexes in ATable.Changes) then
  begin
    Script.Body.AddEmpty;
    AddOrAlterIndexes(ATable);
    Script.Body.AddEmpty;
  end;
end;

procedure TioDBBuilderStrategyWithAlterTable.CreateSequences;
var
  LSequence: String;
begin
  if Schema.Sequences.Count = 0 then
    Exit;

  Script.Body.AddTitle('Creating sequences (if empty, no sequence needs to be created)');

  for LSequence in Schema.Sequences do
  begin
    // Check if sequence exists, then create it
    if (Schema.Status = stCreate) or (not SequenceExists(LSequence)) then
      Script.Body.Add(SqlGenerator.BuildSQL_AddSequence(LSequence));
  end;
end;

procedure TioDBBuilderStrategyWithAlterTable.CreateTable(const ATable: IioDBBuilderSchemaTable);
var
  LComma: string;
  LField: IioDBBuilderSchemaField;
begin
  inherited;

  // Create sequence only if the table uses Sequence for key generation
  if ATable.UsesSequenceForKeyGeneration then
    if (Schema.Status = stCreate) or not SequenceExists(ATable.GetSequenceName) then
      CreateTableSequence(ATable);

  Script.Body.AddEmpty;
  Script.Body.Add(SqlGenerator.BuildSQL_BeginCreateTable(ATable));
  Script.Body.IncIndent;

  // Inline field creation
  LComma := '  ';
  for LField in ATable.Fields do
  begin
    Script.Body.AddLine(LComma + SqlGenerator.BuildSQL_CreateField(ATable, LField));
    LComma := ', ';
  end;

  Script.Body.DecIndent;
  Script.Body.Add(SqlGenerator.BuildSQL_EndCreateTable(ATable));
  Script.Body.AddEmpty;
  Script.Body.Add(SqlGenerator.BuildSQL_AddPK(ATable));

  if Schema.IndexesEnabled then
  begin
    Script.Body.AddEmpty;
    CreateTableIndexes(ATable);
  end;
end;

procedure TioDBBuilderStrategyWithAlterTable.CreateTableSequence(const ATable: IioDBBuilderSchemaTable);
begin
  // Only create sequence if the table uses Sequence for key generation
  if not ATable.UsesSequenceForKeyGeneration then
    Exit;

  if ATable.GetSequenceName.IsEmpty then
    Exit;

  // Check if sequence exists, then create it
  if (ATable.Status = stCreate) or (not SequenceExists(ATable.GetSequenceName)) then
    Script.Body.Add(SqlGenerator.BuildSQL_AddSequence(ATable.GetSequenceName));
end;

procedure TioDBBuilderStrategyWithAlterTable.DropForeignKeys;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FKList, True);

  while not LQuery.Eof do
  begin
    Script.Body.Add(SqlGenerator.BuildSQL_DropFKbyName(LQuery.Fields.FieldByName('table_name').AsString,
      LQuery.Fields.FieldByName('constraint_name').AsString));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyWithAlterTable.DropIndexes;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexList(''), True);

  while not LQuery.Eof do
  begin
    Script.Body.Add(SqlGenerator.BuildSQL_DropIndexByName(LQuery.Fields[0].AsString));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderStrategyWithAlterTable.DropSequence(const ASequenceName: string);
var
  LQuery: IioQuery;
begin
  if ASequenceName.IsEmpty then
    raise EioInvalidArgumentException.Create(ClassName, 'DropSequence', 'ASequenceName is not specified.');

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_DropSequence(ASequenceName), True);
end;

function TioDBBuilderStrategyWithAlterTable.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FieldExists(ATable, AField), True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyWithAlterTable.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;

  LNewFieldType: string;
  LNewFieldSubtype: string;
  LNewFieldLength: Smallint;
  LNewFieldPrecision: Smallint;
  LNewFieldDecimals: Smallint;

  LOldFieldType: string;
  LOldFieldSubtype: string;
  LOldFieldLength: Smallint;
  LOldFieldPrecision: Smallint;
  LOldFieldDecimals: Smallint;
  LOldFieldNotNull: boolean;
  LOldFieldDefault: string;
  LNewFieldDefault: string;

  function IsDecimalOrNumeric: boolean;
  begin
    // The query now returns 'DECIMAL' or 'NUMERIC' directly for decimal types
    Result := (LOldFieldType = 'DECIMAL') or (LOldFieldType = 'NUMERIC');
  end;

begin
  Result := False;
  // Load some new field informations
  LNewFieldType := SqlGenerator.Translate_SchemaField_To_FieldType(AField, False);  // False = do NOT include attributes (only base type)
  LNewFieldSubtype := IfThen(AField.FieldSubtype.IsEmpty, '0', AField.FieldSubtype);
  LNewFieldLength := AField.FieldLength;
  LNewFieldPrecision := AField.FieldPrecision;
  LNewFieldDecimals := AField.FieldScale;
  LNewFieldDefault := SqlGenerator.Translate_SchemaField_To_DefaultValue(AField);

  // Create and open the query for old field informations
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FieldList(ATable.Name, AField.FieldName), True);

  // Field not found
  if LQuery.Eof then
    Exit(False);

  // Load some old field informations
  LOldFieldType := LQuery.Fields.FieldByName('field_type').AsString;
  LOldFieldSubtype := LQuery.Fields.FieldByName('field_subtype').AsString;
  LOldFieldDecimals := Abs(LQuery.Fields.FieldByName('field_scale').AsInteger);
  LOldFieldNotNull := LQuery.Fields.FieldByName('field_not_null').AsInteger = 1;
  LOldFieldLength := LQuery.Fields.FieldByName('field_length').AsInteger;
  LOldFieldPrecision := LQuery.Fields.FieldByName('field_precision').AsInteger;
  LOldFieldDefault := LQuery.Fields.FieldByName('field_default').AsString.Trim;
  if LOldFieldDefault.ToUpper.StartsWith('DEFAULT ') then
    LOldFieldDefault := LOldFieldDefault.Substring(8).Trim;

  // Verify if fieldType has been changed and check type affinity
  Result := Result or IsFieldTypeChanged(ATable, AField, LOldFieldType, LNewFieldType);

  // Verify if FieldLength is changed
  if 'VARCHAR,CHAR'.Contains(LNewFieldType) or 'VARCHAR,CHAR'.Contains(LOldFieldType) then
    Result := Result or IsFieldLengthChanged(LOldFieldLength, LNewFieldLength, AField, ATable);

  if IsDecimalOrNumeric then
  begin
    // Verify if something has been changed in FieldPrecision
    Result := Result or IsFieldPrecisionChanged(LOldFieldPrecision, LNewFieldPrecision, AField, ATable);
    // Verify if something has been changed in FieldDecimals (scale)
    Result := Result or IsFieldDecimalsChanged(LOldFieldDecimals, LNewFieldDecimals, AField, ATable);
  end;

  // Verify if DEFAULT setting of the field is changed
  Result := Result or IsFieldDefaultChanged(LOldFieldDefault, LNewFieldDefault, AField);

  // Verify if NotNull is changed
  // Check if NOT NULL changes are supported by this RDBMS version
  Result := Result or IsFieldNotNullChanged(ATable, AField, LOldFieldNotNull, AField.FieldNotNull, SqlGenerator.Supports_AlterNotNull);

  // Verify if blob subtype is changed
  // Check if BLOB subtype changes are permitted by this RDBMS
  if LNewFieldType.StartsWith('BLOB') then
    Result := Result or IsBlobSubtypeChanged(LOldFieldSubtype, LNewFieldSubtype, AField, ATable, SqlGenerator.Supports_AlterBlobSubtype);
end;

function TioDBBuilderStrategyWithAlterTable.ForeignKeyExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  // BuildSQL_FKList returns only the specific FK (or empty result if not exists)
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName,
    SqlGenerator.BuildSQL_FKList(ATable.Name,
    SqlGenerator.Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey)),
    True);
  Result := not LQuery.Eof;
end;

function TioDBBuilderStrategyWithAlterTable.ForeignKeyModified(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): boolean;
var
  LQuery: IioQuery;
  LFKName: string;
  LOldOnUpdate, LNewOnUpdate: string;
  LOldOnDelete, LNewOnDelete: string;
begin
  // Note: We only check ON UPDATE and ON DELETE actions here.
  // The structural properties (DependentFieldName, ReferenceTableName, ReferenceFieldName)
  // are encoded in the FK name, so if the FK exists with this name, those properties already match.
  // This also works when the FK name is shortened using a hash, because the hash is deterministic:
  // same input properties always produce the same hash, so a different hash means different properties.
  Result := False;

  // Build FK name using SqlGenerator's method
  LFKName := SqlGenerator.Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey);

  // Query by FK name: if no record is found, the FK name changed (meaning the structural
  // properties changed), so we exit and let ForeignKeyExists handle it as a new FK.
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FKList(ATable.Name, LFKName), True);
  if LQuery.Eof then
    Exit;

  // Check ON UPDATE action
  LOldOnUpdate := LQuery.Fields.FieldByName('on_update').AsString.Trim.ToUpper;
  LNewOnUpdate := SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnUpdateAction).ToUpper;
  if not SameText(LOldOnUpdate, LNewOnUpdate) then
    Exit(True);

  // Check ON DELETE action
  LOldOnDelete := LQuery.Fields.FieldByName('on_delete').AsString.Trim.ToUpper;
  LNewOnDelete := SqlGenerator.Translate_SchemaFK_To_FKvalue(AForeignKey, AForeignKey.OnDeleteAction).ToUpper;
  if not SameText(LOldOnDelete, LNewOnDelete) then
    Exit(True);
end;

procedure TioDBBuilderStrategyWithAlterTable.GenerateDatabaseObjects(const Create: boolean);
begin
  // Check key generation strategy compatibility with RDBMS version
  DoCheckKeyGenerationCompatibility;

  if Create then
  begin
    CreateOrAlterTables;

    // Foreignkeys are created at the end so all referenced tables are already created
    if Schema.ForeignKeysEnabled then
      CreateForeignKeys;
  end
  else
  begin
    Script.Body.AddEmpty;
    CreateOrAlterTables;
    Script.Body.AddEmpty;

    // Foreignkeys are created at the end so all referenced tables are already created
    if Schema.ForeignKeysEnabled then
      AddOrAlterForeignKeys;
  end;
end;

function TioDBBuilderStrategyWithAlterTable.IndexModified(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQueryIndexList: IioQuery;
  LQueryIndexDetails: IioQuery;
  LIndexName: string;
  LOldFieldList: string;
  LNewFieldList: string;
begin
  Result := False;
  LIndexName := SqlGenerator.Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);

  // Get basic info (unique flag, orientation) for all indexes in the table
  LQueryIndexList := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexList(ATable.Name), True);

  // Find the specific index in the result set
  while not LQueryIndexList.Eof do
  begin
    if SameText(LQueryIndexList.Fields.FieldByName('RDB$INDEX_NAME').AsString.Trim, LIndexName) then
    begin
      // Check unique flag
      if LQueryIndexList.Fields.FieldByName('RDB$UNIQUE_FLAG').AsInteger <> AIndex.Unique.ToInteger then
        AIndex.AddChange(icUnique);

      // Check orientation
      // Note: Firebird index type can be 0 = Ascending, 1 = Descending.
      // iORM orientation actually uses same values, but in the future, changes must be made carefully.
      if LQueryIndexList.Fields.FieldByName('RDB$INDEX_TYPE').AsInteger <> Ord(AIndex.Orientation) then
        AIndex.AddChange(icOrientation);

      Break; // Found the index, exit loop
    end;
    LQueryIndexList.Next;
  end;

  // If index not found, exit
  if LQueryIndexList.Eof then
    Exit;

  // Get fields info
  LQueryIndexDetails := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexDetails(LIndexName), True);

  // Build old field list from database
  LOldFieldList := '';
  while not LQueryIndexDetails.Eof do
  begin
    if not LOldFieldList.IsEmpty then
      LOldFieldList := LOldFieldList + ',';
    LOldFieldList := LOldFieldList + LQueryIndexDetails.Fields.FieldByName('RDB$FIELD_NAME').AsString.Trim.ToUpper;
    LQueryIndexDetails.Next;
  end;

  // Compare field lists
  LNewFieldList := AIndex.CommaSepFieldList.ToUpper.Replace(' ', '');
  LOldFieldList := LOldFieldList.Replace(' ', '');
  if not SameText(LOldFieldList, LNewFieldList) then
    AIndex.AddChange(icFields);

  Result := AIndex.Changes <> [];
end;

function TioDBBuilderStrategyWithAlterTable.IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): boolean;
var
  LQuery: IioQuery;
begin
  Result := False;

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_IndexExists(ATable, AIndex), True);
  Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderStrategyWithAlterTable.IsFieldDefaultChanged(const AOldFieldDefault, ANewFieldDefault: String;
  const AField: IioDBBuilderSchemaField): Boolean;
begin
  Result := not SameText(AOldFieldDefault, ANewFieldDefault);
  if Result then
    AField.AddAltered(alFieldDefault);
end;

function TioDBBuilderStrategyWithAlterTable.IsFieldDecimalsChanged(const AOldFieldDecimals, ANewFieldDecimals: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := AOldFieldDecimals <> ANewFieldDecimals;
  if Result then
  begin
    AField.AddAltered(alFieldType);
    WarningNewValueLessThanTheOldOne('field DECIMALS', AOldFieldDecimals, ANewFieldDecimals, AField, ATable);
  end;
end;

function TioDBBuilderStrategyWithAlterTable.IsFieldLengthChanged(const AOldFieldLength, ANewFieldLength: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := ANewFieldLength <> AOldFieldLength;
  if Result then
  begin
    if ANewFieldLength > AOldFieldLength then
      AField.AddAltered(alFieldLengthIncreased)
    else
    begin
      AField.AddAltered(alFieldLengthDecreased);
      WarningNewValueLessThanTheOldOne('field LENGTH', AOldFieldLength, ANewFieldLength, AField, ATable);
    end;
  end;
end;

function TioDBBuilderStrategyWithAlterTable.IsFieldPrecisionChanged(const AOldFieldPrecision, ANewFieldPrecision: Smallint;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := AOldFieldPrecision <> ANewFieldPrecision;
  if Result then
  begin
    if ANewFieldPrecision > AOldFieldPrecision then
      AField.AddAltered(alFieldPrecisionIncreased)
    else
      AField.AddAltered(alFieldPrecisionDecreased);

    WarningNewValueLessThanTheOldOne('field PRECISION', AOldFieldPrecision, ANewFieldPrecision, AField, ATable);
  end;
end;

function TioDBBuilderStrategyWithAlterTable.SequenceExists(const ASequenceName: string): boolean;
var
  LQuery: IioQuery;
begin
  if ASequenceName.IsEmpty then
    raise EioInvalidArgumentException.Create(ClassName, 'SequenceExists', 'ASequenceName is not specified.');

  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_SequenceExists(ASequenceName), True);
  Result := LQuery.Fields[0].AsInteger > 0;
end;

procedure TioDBBuilderStrategyWithAlterTable.WarningNewValueLessThanTheOldOne(const AValueName: String; const AOldValue, ANewValue: Integer;
  const AField: IioDBBuilderSchemaField; const ATable: IioDBBuilderSchemaTable);
begin
  if ANewValue < AOldValue then
    Script.Warnings.Add(Format('Table ''%s'' field ''%s'' --> The new %s value becomes smaller than the old one (old = %d, new = %d)',
      [ATable.Name, AField.FieldName, AValueName, AOldValue, ANewValue]));
end;

end.
