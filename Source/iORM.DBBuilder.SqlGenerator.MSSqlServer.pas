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
unit iORM.DBBuilder.SqlGenerator.MSSqlServer;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base, iORM.DBBuilder.Interfaces, iORM.Attributes;

const
  CONNECTION_NAME_MSSQL_MASTER = 'MSSQL_MASTER';

  INVALID_FIELDTYPE_CONVERSIONS = '[datetime->decimal][datetime->numeric][datetime->int][date->decimal][date->numeric][date->int]' +
    '[time->numeric][time->decimal][time->int][varchar->decimal][varchar->int][varchar->date][varchar->time][varchar->datetime]' +
    '[nvarchar->decimal][nvarchar->int][nvarchar->date][nvarchar->time][nvarchar->datetime] [char->decimal][char->int][char->date]+' +
    '[char->time][char->datetime][nchar->decimal][nchar->int][nchar->date][nchar->time][nchar->datetime]';

type

  TioDBBuilderSqlGenMSSqlServer = class(TioDBBuilderSqlGenBase, IioDBBuilderSqlGenerator)
  private
    FFirstField: boolean;
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
    function ReplaceSpecialWords(const ASql: string): string;
    function TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
    function TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
    function ClearSquareBrackets(const AFieldName: String): String;
  public
    procedure ScriptBegin; override;
    // Database related methods
    function DatabaseExists: boolean;
    procedure CreateDatabase;
    // Tables related methods
    function TableExists(const ATable: IioDBBuilderSchemaTable): boolean;
    procedure BeginCreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure EndCreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
    procedure EndAlterTable(const ATable: IioDBBuilderSchemaTable);
    // Fields related methods
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
    procedure CreateField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    procedure AddField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    procedure AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    // PrimaryKey & other indexes
    procedure AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
    procedure AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
    procedure DropAllIndexes;
    // Foreign keys
    procedure AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
    procedure DropAllForeignKeys;
    // Sequences
    procedure AddSequence(const ASequenceName: String; const ACreatingNewDatabase: Boolean); // Not implented
  end;

implementation

uses
  iORM, iORM.Context.Properties.Interfaces, System.SysUtils, System.StrUtils, iORM.DB.Interfaces, iORM.CommonTypes, iORM.SqlTranslator,
  iORM.Exceptions;

{ TioDBBuilderSqlGenFirebird }

procedure TioDBBuilderSqlGenMSSqlServer.AddField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  // M.M. 12/11/21
  if FFirstField then
  begin
    ScriptAdd(Format('%sADD %s', [ACommaBefore, InternalCreateField(AField)]));
    FFirstField := False;
  end
  else
    ScriptAdd(Format('%s %s', [ACommaBefore, InternalCreateField(AField)]));
end;

procedure TioDBBuilderSqlGenMSSqlServer.AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
begin
  // M.M. 12/06/21
  // TODO: La ClearSquareBrackets andrebbe rimossa anche da qui.
  ScriptAdd(Format('ALTER TABLE [%s]', [AForeignKey.DependentTableName]));
  IncIndentationLevel;
  ScriptAdd(Format(' ADD CONSTRAINT %s', [ClearSquareBrackets(AForeignKey.Name)]));
  IncIndentationLevel;
  // M.M. 12/11/21
  ScriptAdd(Format('FOREIGN KEY ([%s])', [ClearSquareBrackets(AForeignKey.DependentFieldName)]));
  ScriptAdd(Format('REFERENCES  [%s] (%s)', [AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]));
  if AForeignKey.OnUpdateAction > fkUnspecified then
    ScriptAdd(Format('ON UPDATE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction)]));
  if AForeignKey.OnDeleteAction > fkUnspecified then
    ScriptAdd(Format('ON DELETE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction)]));
  DecIndentationLevel;
  DecIndentationLevel;
  ScriptAdd(';');
end;

procedure TioDBBuilderSqlGenMSSqlServer.AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
var
  LQuery, LIndexName, LFieldList, LUnique: String;
begin
  LIndexName := BuildIndexName(ATable, AIndex);
  LUnique := BuildIndexUnique(AIndex);
  LFieldList := BuildIndexFieldList(ATable, AIndex, LIndexName, True);
  // Compose the create index query text
  // M.M. 12/06/21
  LQuery := Format('CREATE %s INDEX %s ON [%s] (%s);', [LUnique, LIndexName, ATable.TableName, LFieldList]);
  // Sistemazione parole riservate SQL SERVER
  LQuery := ReplaceSpecialWords(LQuery);
  ScriptAdd(LQuery);
end;

procedure TioDBBuilderSqlGenMSSqlServer.AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
begin
  // M.M. 12/06/21
  ScriptAdd(Format('ALTER TABLE [%s] ADD CONSTRAINT PK_%s PRIMARY KEY CLUSTERED(%s);', [ATable.TableName, ATable.TableName, ATable.PrimaryKeyField.FieldName]));
end;

procedure TioDBBuilderSqlGenMSSqlServer.AddSequence(const ASequenceName: String; const ACreatingNewDatabase: Boolean);
begin
  // Nothing to do
end;

procedure TioDBBuilderSqlGenMSSqlServer.AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  ScriptAdd(Format('%sALTER COLUMN %s', [ACommaBefore, InternalCreateField(AField)]));
end;

procedure TioDBBuilderSqlGenMSSqlServer.BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  // M.M. 12/11/21
  FFirstField := True;
  ScriptAdd(Format('ALTER TABLE [%s]', [ATable.TableName]));
  IncIndentationLevel;
end;

procedure TioDBBuilderSqlGenMSSqlServer.BeginCreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  ScriptAdd(Format('CREATE TABLE [%s] (', [ATable.TableName]));
  IncIndentationLevel;
end;

function TioDBBuilderSqlGenMSSqlServer.ClearSquareBrackets(
  const AFieldName: String): String;
begin
  Result := AFieldName.Replace('[','',[rfReplaceAll]).Replace(']','',[rfReplaceAll]);
end;

procedure TioDBBuilderSqlGenMSSqlServer.CreateDatabase;
begin
  ExecuteQuery(CONNECTION_NAME_MSSQL_MASTER, Format('CREATE DATABASE [%s]', [FSchema.DatabaseFileName]));
end;

procedure TioDBBuilderSqlGenMSSqlServer.CreateField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
begin
  ScriptAdd(Format('%s%s', [ACommaBefore, InternalCreateField(AField)]));
end;

function TioDBBuilderSqlGenMSSqlServer.DatabaseExists: boolean;
var
  LDefaultConnectionDef: IIoConnectionDef;
  LQuery: IioQuery;
begin
  LDefaultConnectionDef := io.Connections.GetCurrentConnectionDef;
  // Create a new connection in database master
  io.Connections.NewSQLServerConnectionDef(LDefaultConnectionDef.AsString['Server'], 'master', LDefaultConnectionDef.Params.UserName,
    LDefaultConnectionDef.Params.Password, False, False, False, False, CONNECTION_NAME_MSSQL_MASTER);
  // Create the query to retrieve if DB exists
  // M.M. 12/06/21
  LQuery := OpenQuery(CONNECTION_NAME_MSSQL_MASTER, Format('select db_id(''%s'')', [FSchema.DatabaseFileName]));
  Result := not(LQuery.Eof or LQuery.Fields[0].IsNull);
end;

procedure TioDBBuilderSqlGenMSSqlServer.DropAllForeignKeys;
var
  LQuery: IioQuery;
begin
  LQuery := NewQuery;
  LQuery.SQL.Add('select t.name as table_name, i.name as constraint_name');
  LQuery.SQL.Add('from sys.tables t');
  LQuery.SQL.Add('inner join sys.foreign_keys i on t.object_id=i.parent_object_id');
  LQuery.SQL.Add('where i.name like ''FK_%''');
  LQuery.Open;
  while not LQuery.Eof do
  begin
    ScriptAdd(Format('ALTER TABLE %s DROP CONSTRAINT %s;', [LQuery.Fields.FieldByName('table_name').AsString,
      LQuery.Fields.FieldByName('constraint_name').AsString]));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderSqlGenMSSqlServer.DropAllIndexes;
var
  LQuery: IioQuery;
begin
  LQuery := NewQuery;
  LQuery.SQL.Add('select i.name as index_name, t.name as table_name');
  LQuery.SQL.Add('from sys.tables t');
  LQuery.SQL.Add('inner join sys.indexes i on t.object_id = i.object_id');
  LQuery.SQL.Add('where i.name like ''IDX_%''');
  LQuery.Open;
  while not LQuery.Eof do
  begin
    ScriptAdd(Format('DROP INDEX %s ON [%s];', [LQuery.Fields.FieldByName('index_name').AsString,
      LQuery.Fields.FieldByName('table_name').AsString]));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderSqlGenMSSqlServer.EndAlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  DecIndentationLevel;
  ScriptAdd(';');
end;

procedure TioDBBuilderSqlGenMSSqlServer.EndCreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  DecIndentationLevel;
  ScriptAdd(');');
end;

function TioDBBuilderSqlGenMSSqlServer.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('exec sp_columns ''%s''', [ATable.TableName]));
  while not LQuery.Eof do
  begin
    if LQuery.Fields.FieldByName('column_name').AsString.ToLower = AField.FieldName(True).ToLower then
      Exit(True);
    LQuery.Next;
  end;
  Result := False;
end;

function TioDBBuilderSqlGenMSSqlServer.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField)
  : boolean;
var
  LQuery: IioQuery;

  LNewFieldName: string;
  LNewFieldType: string;
  LNewFieldLength: Smallint;
  LNewFieldPrecision: Smallint;
  LNewFieldDecimals: Smallint;

  LOldFieldName: string;
  LOldFieldType: string;
  LOldFieldLength: Smallint;
  LOldFieldDecimals: Smallint;
  LOldFieldNotNull: boolean;
begin
  Result := False;
  LQuery := OpenQuery(Format('exec sp_columns ''%s''', [ATable.TableName]));
  while not LQuery.Eof do
  begin
    LOldFieldName := LQuery.Fields.FieldByName('column_name').AsString;
    LNewFieldName := AField.FieldName(True);
    // Find the field
    if SameText(LOldFieldName, LNewFieldName) then
    begin
      // Load some new field informations
      LNewFieldType := TranslateFieldTypeForModified(AField);
      LNewFieldLength := AField.FieldLength;
      LNewFieldPrecision := AField.FieldPrecision;
      LNewFieldDecimals := AField.FieldScale;

      // Load some old field informations
      LOldFieldType := LQuery.Fields.FieldByName('type_name').AsString.Replace('identity', '', [rfReplaceAll]).Trim;
      LOldFieldDecimals := LQuery.Fields.FieldByName('scale').AsInteger;
      LOldFieldNotNull := LQuery.Fields.FieldByName('nullable').AsInteger = 0;
      if 'decimal,numeric,varchar,nvarchar,char,nchar'.Contains(LOldFieldType.ToLower) then
        LOldFieldLength := LQuery.Fields.FieldByName('Precision').AsInteger
      else
        LOldFieldLength := LQuery.Fields.FieldByName('Length').AsInteger;

      // Verify if fieldType has been changed and check type affinity
      Result := Result or IsFieldTypeChanged(LOldFieldType, LNewFieldType, AField, ATable, INVALID_FIELDTYPE_CONVERSIONS);

      // Verify if FieldLength is changed
      if 'varchar,nvarchar,char,nchar'.Contains(LOldFieldType.ToLower) then
        Result := Result or IsFieldLengthChanged(LOldFieldLength, LNewFieldLength, AField, ATable);

      if 'decimal,numeric'.Contains(LOldFieldType.ToLower) then
      begin
        // Verify if something has been changed in FieldPrecision
        Result := Result or IsFieldPrecisionChanged(LOldFieldLength, LNewFieldPrecision, AField, ATable);
        // Verify if something has been changed in FieldDecimals (scale)
        Result := Result or IsFieldDecimalsChanged(LOldFieldDecimals, LNewFieldDecimals, AField, ATable);
      end;

      // Verify if DEFAULT setting of the field is changed
      // NOTE: I have not found a way to retrieve the current DEFAULT
      // so it is not possible to verify if it has changed.

      // Verify if NotNull is changed
      Result := Result or IsFieldNotNullChanged(LOldFieldNotNull, AField.FieldNotNull, AField, ATable, True);

      // Verify if blob subtype is changed
      // NOTE: I have not found a way to retrieve the current blob subtype
      // so it is not possible to verify if it has changed.

      // Exit
      Exit;
    end;
    LQuery.Next;
  end;
end;

procedure TioDBBuilderSqlGenMSSqlServer.ScriptBegin;
begin
  inherited;
  ScriptAddSeparator;
  ScriptAdd('GO');
  ScriptAdd(Format('USE [%s]', [FSchema.DatabaseFileName]));
  ScriptAddSeparator;
end;

function TioDBBuilderSqlGenMSSqlServer.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LDefault: string;
  LNotNull: string;
begin
  // If primary key...
  if AField.PrimaryKey then
    // M.M. 12/06/21
    // Exit(Format('%s [INT] IDENTITY(1,1) NOT NULL', [AField.FieldName]));
    Exit(Format('%s INT IDENTITY(1,1) NOT NULL', [AField.FieldName]));
  // ...then continue
  LDefault := ExtractFieldDefaultValue(AField);
  LNotNull := IfThen(AField.FieldNotNull, 'NOT NULL', 'NULL');
  // M.M. 12/06/21
  //Result := Format('%s [%s] %s %s', [AField.FieldName, TranslateFieldTypeForCreate(AField), LDefault, LNotNull]).Trim;
  Result := Format('%s %s %s %s', [AField.FieldName, TranslateFieldTypeForCreate(AField), LDefault, LNotNull]).Trim;
end;

function TioDBBuilderSqlGenMSSqlServer.ReplaceSpecialWords(const ASql: string): string;
const
  FROM_WORDS: array [0 .. 3] of string = ('GROUP ASC', 'USER ASC', 'GROUP DESC', 'USER DESC');
  TO_WORDS: array [0 .. 3] of string = ('[GROUP] ASC', '[USER] ASC', '[GROUP] DESC', '[USER] DESC');
var
  I: Byte;
begin
  Result := ASql.ToUpper;
  for I := 0 to Length(FROM_WORDS) - 1 do
    Result := Result.Replace(FROM_WORDS[I], TO_WORDS[I], [rfReplaceAll]);
end;

function TioDBBuilderSqlGenMSSqlServer.TableExists(const ATable: IioDBBuilderSchemaTable): boolean;
var
  LQuery: IioQuery;
begin
  LQuery := OpenQuery(Format('select object_id(''%s'')', [ATable.TableName]));
  Result := not(LQuery.Eof or LQuery.Fields[0].IsNull);
end;

function TioDBBuilderSqlGenMSSqlServer.TranslateFieldTypeForCreate(const AField: IioDBBuilderSchemaField): String;
begin
  Result := TranslateFieldTypeForModified(AField);
  case AField.FieldType of
    ioMdVarchar, ioMdChar:
      Result := Format('%s(%d)', [Result, AField.FieldLength]);
    ioMdDecimal, ioMdNumeric:
      Result := Format('%s(%d,%d)', [Result, AField.FieldPrecision,
        AField.FieldScale]);
  end;
end;

function TioDBBuilderSqlGenMSSqlServer.TranslateFieldTypeForModified(const AField: IioDBBuilderSchemaField): String;
begin
  case AField.FieldType of
    ioMdVarchar:
      if AField.FieldUnicode then
        Result := 'VARCHAR'
      else
        Result := 'NVARCHAR';
    ioMdChar:
      if AField.FieldUnicode then
        Result := 'CHAR'
      else
        Result := 'NCHAR';
    ioMdInteger:
      Result := 'INT';
    ioMdFloat:
      Result := 'FLOAT';
    ioMdDate:
      Result := 'DATE';
    ioMdTime:
      Result := 'TIME';
    ioMdDateTime:
      Result := 'DATETIME';
    ioMdDecimal:
      Result := 'DECIMAL';
    ioMdNumeric:
      Result := 'NUMERIC';
    ioMdBoolean:
      Result := 'BIT';
    ioMdBinary: // ##### Sentire con Marco, per me bisogna rivedere anche qui il discorso subtype (già modificato il Firebird e SQLite)
      begin
        if AField.FieldSubType.IsEmpty then
        begin
          if AField.FieldUnicode then
            Result := 'BINARY'
          else
            Result := 'NBINARY';
        end
        else
          Result := AField.FieldSubType;
      end;
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  end;
end;

end.
