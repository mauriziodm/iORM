{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}


unit iORM.DB.DBBuilder.SqLite.SqlGenerator;

interface

uses
  System.SysUtils,
  System.TypInfo,
  System.Rtti,
  System.Classes,
  iORM.Attributes,
  iORM.DB.DBBuilder.Interfaces,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine,
  iORM.Context.Properties.Interfaces,
  Data.DB, iORM.Context.Interfaces,
  iORM.CommonTypes,
  iORM.DB.DBBuilder.Custom.SqlGenerator;

type
  TioDBBuilderSqLiteSqlGenerator = class(TioDBBuilderCustomSqlGenerator, IioDBBuilderSqlGenerator)
  private
    FCreateTableScript: String;
    FAlterTableScript: String;
    function GetColumnType(const AProperty: IioContextProperty): String;
    function ConversionTypeAdmitted(AColumnType: string; AModelColumnType: string): Boolean;
    function RemoveLastComma(const AValue: string): string;
    function GetInsertXCopyDataRows(ADestTable:IioDBBuilderTable; SourceTableName:String): string;
  protected
  public
    function DatabaseExists(const ADbName: string): Boolean;
    function CreateDatabase(const ADbName: string): String;
    function UseDatabase(const ADbName: string): String;

    function TableExists(const ADbName: String; const ATableName:String): Boolean;
    function BeginCreateTable(const ATableName:String): String;
    function EndCreateTable: String;
    function BeginAlterTable(const ARemark: String; const ATableName:String): String;
    function EndAlterTable(const APropertyIsID: Boolean): String;
    function GetRemark(const AWarnings: Boolean): String;

    function FieldExists(const ADbName: String; const ATableName: String; const AFieldName: String): Boolean;
    function FieldModified(const ADbName: String; const ATableName: String; const AProperty:IioContextProperty; out AWarnings: Boolean): Boolean;
    function CreateField(const AProperty:IioContextProperty; const AAddNullableSyntax: boolean = True; const AAddType: boolean = False): String;
    function CreateClassInfoField(ATable: IioDBBuilderTable): String;
    function AddField(const AProperty:IioContextProperty): String;
    function AlterField(const AProperty:IioContextProperty): String;

    function AddPrimaryKey(const ATableName: string; const AIDProperty: IioContextProperty): String;
    function AddForeignKey(const ASourceTableName: String; const ASourceFieldName: String; const ADestinationTableName: String; const ADestinationFieldName: String;
         const ACascadeOnDelete: Boolean; ACascadeOnUpdate : Boolean): String;
    function AddSequences(const ATableName: String; const AIDProperty: IioContextProperty): String;
    function AddIndex(const AContext: IioContext; const AIndexName, ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): String;

    function DropAllForeignKey(const ATableList: TioDBBuilderTableList): String;
    function DropAllIndex: String;

    function AddForeignKeyInCreate(const ABuilderTable: IioDBBuilderTable): String;
    function RestructureTable(const ATableList: TioDBBuilderTableList): String;

    procedure ExecuteSql(const ASql: string; const AMultipleSQL: boolean = False);
  end;

implementation

uses
  iORM.Exceptions,
  iORM, iORM.DB.Factory, System.Generics.Collections;

{ TioDBBuilderSqLiteSqlGenerator }

function TioDBBuilderSqLiteSqlGenerator.CreateField(const AProperty:IioContextProperty; const AAddNullableSyntax: boolean = True; const AAddType: boolean = False): String;
var
  LFieldName: string;
  LFieldType: string;
  LFieldLength: string;
  LKeyOptions: string;
  LNullable: string;
begin
  LFieldName := AProperty.GetSqlFieldName;
  LFieldLength := '';
  LKeyOptions := '';

  case AProperty.GetMetadata_FieldType of
    ioMdVarchar:
      begin
        LFieldType := 'TEXT'
      end;
    ioMdChar:
      begin
        LFieldType := 'TEXT'
      end;
    ioMdInteger:
      begin
        LFieldType := 'INTEGER';
      end;
    ioMdFloat:
        LFieldType := 'REAL';
    ioMdDate:
        LFieldType := 'NUMERIC';
    ioMdTime:
        LFieldType := 'NUMERIC';
    ioMdDateTime:
        LFieldType := 'NUMERIC';
    ioMdDecimal:
      begin
        LFieldType := 'NUMERIC';
      end;
    ioMdNumeric:
      begin
        LFieldType := 'NUMERIC';
      end;
    ioMdBoolean:
      begin
        LFieldType := 'NUMERIC';
      end;
    ioMdBinary:
      begin
        LFieldType := 'BLOB'
      end;
    ioMdCustomFieldType:
      LFieldType := AProperty.GetMetadata_CustomFieldType;
  end;

  if AProperty.GetMetadata_FieldNullable then
    LNullable := 'NULL'
  else
    LNullable := 'NOT NULL';

  if AProperty.IsID then
  begin
    LKeyOptions := 'PRIMARY KEY';
    LFieldType := 'INTEGER';
    LFieldLength := '';
    LNullable := 'NOT NULL';
  end;

  Result :=  '"'+LFieldName+'"'+' '+LFieldType+' '+LKeyOptions+' '+LFieldLength+' '+LNullable + ',';

  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderSqLiteSqlGenerator.AddField(const AProperty:IioContextProperty): String;
var
  LRow: string;
begin
  LRow := Format('ADD %s ',[Self.CreateField(AProperty)]).Trim;
  Result := LRow.Substring(0, LRow.Length-1);
  FAlterTableScript := FAlterTableScript + ' ' + Result;
end;

function TioDBBuilderSqLiteSqlGenerator.AddForeignKey(const ASourceTableName: String; const ASourceFieldName: String; const ADestinationTableName: String; const ADestinationFieldName: String;
         const ACascadeOnDelete: Boolean; ACascadeOnUpdate : Boolean): String;
begin
  // Do nothing FK are created in CREATE TABLE STATEMENT
  Result := '';
end;

function TioDBBuilderSqLiteSqlGenerator.AddForeignKeyInCreate(
  const ABuilderTable: IioDBBuilderTable): String;
var
  LFk: IioDBBuilderFKDefinition;
begin
  Result := '';
  // Add FK in CREATE STATEMENT
  // FOREIGN KEY(trackartist) REFERENCES artist(artistid)
  for LFk in ABuilderTable.ForeignKeyList.Values do
  begin
    Result := Result + ' ' + Format('FOREIGN KEY("%s") REFERENCES %s("%s")',[LFk.SourceFieldName,LFk.DestinationTableName,LFk.DestinationFieldName])+',';
  end;
  Result := RemoveLastComma(Result);

  if Result.Length>0 then
    FCreateTableScript := FCreateTableScript + ' ' +Result;
end;

function TioDBBuilderSqLiteSqlGenerator.AddSequences(const ATableName: String;
  const AIDProperty: IioContextProperty): String;
begin
  // Do Nothing
end;

function TioDBBuilderSqLiteSqlGenerator.AddIndex(const AContext: IioContext; const AIndexName,
  ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation;
  const AUnique: Boolean): String;
var
  LQuery: IioQuery;
begin
  AContext.SetConnectionDefName(GetConnectionDefName);
  LQuery := TioDbFactory.QueryEngine.GetQueryForCreateIndex(AContext, AIndexName, ACommaSepFieldList, AIndexOrientation, AUnique);
  Result := LQuery.SQL.Text;

//  // Execute Query
//  if not FOnlyCreateScript then
//  begin
//    LQuery := io.GlobalFactory.DBFactory.Query('');
//    LQuery.SQL.Add(Result);
//    LQuery.ExecSQL;
//  end;
end;

function TioDBBuilderSqLiteSqlGenerator.AddPrimaryKey(const ATableName: string; const AIDProperty: IioContextProperty): String;
begin
  // Do nothing PK are created directly in CREATE TABLE STATEMENT
  Result := '';
end;

function TioDBBuilderSqLiteSqlGenerator.AlterField(const AProperty:IioContextProperty): String;
//var
//  LRow: String;
begin
//  LRow := Format('ALTER COLUMN %s ',[Self.CreateField(AProperty)]).Trim;
//  Result := LRow.Substring(0, LRow.Length-1);
//  FAlterTableScript := FAlterTableScript + ' ' + Result;
    Result := ' ';
    FAlterTableScript := ' ';
end;

function TioDBBuilderSqLiteSqlGenerator.BeginAlterTable(const ARemark: String; const ATableName:String): String;
begin
  FAlterTableScript := ' ';
  Result := ' ';
//  Result := Format('%s ALTER TABLE %s',[ARemark, ATableName]);
//  FAlterTableScript := FAlterTableScript + ' ' + Result;
end;

function TioDBBuilderSqLiteSqlGenerator.BeginCreateTable(
  const ATableName: String): String;
begin
  FCreateTableScript := '';
  Result := Format('CREATE TABLE %s (', [ATableName]);
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderSqLiteSqlGenerator.ConversionTypeAdmitted(AColumnType,
  AModelColumnType: string): Boolean;
var
  LInvalidConversions: TStringList;
begin
  LInvalidConversions:=TStringList.Create;

  try

    LInvalidConversions.Add('text->integer');
    LInvalidConversions.Add('text->real');
    LInvalidConversions.Add('text->numeric');
    LInvalidConversions.Add('text->blob');
    LInvalidConversions.Add('real->integer');
    LInvalidConversions.Add('real->blob');
    LInvalidConversions.Add('numeric->integer');
    LInvalidConversions.Add('numeric->blob');
    LInvalidConversions.Add('blob->real');
    LInvalidConversions.Add('blob->numeric');
    LInvalidConversions.Add('blob->integer');
    LInvalidConversions.Add('blob->text');

    Result:=True;
    If LInvalidConversions.IndexOf(AColumnType+'->'+AModelColumnType)>0 then Result:=False;

  finally
    LInvalidConversions.Free;
  end;
end;

function TioDBBuilderSqLiteSqlGenerator.GetInsertXCopyDataRows(ADestTable:IioDBBuilderTable; SourceTableName:String): string;
var
  AField: IioDBBuilderField;
  Comma: Char;
  LQuery: IioQuery;
begin
  LQuery := GetQuery;
  // Insert into
  LQuery.SQL.Add('INSERT INTO ' + ADestTable.TableName);
  // Fields
  LQuery.SQL.Add('(');
  Comma := ' ';
  for AField in ADestTable.Fields.Values do
  begin
    if not ADestTable.FieldExists(AField.FieldName) then Continue;
    if not AField.IsSqlField then Continue;

    LQuery.SQL.Add(Comma + AField.FieldName);
    Comma := ',';
  end;

  if ADestTable.IsClassFromField then
    LQuery.SQL.Add(Comma + IO_CLASSFROMFIELD_FIELDNAME);

  LQuery.SQL.Add(')');
  // Select
  LQuery.SQL.Add('SELECT');
  // FIelds
  Comma := ' ';
  for AField in ADestTable.Fields.Values do
  begin
    if not ADestTable.FieldExists(AField.FieldName) then Continue;
    if not AField.IsSqlField then Continue;

    LQuery.SQL.Add(Comma + AField.FieldName);
    Comma := ',';
  end;

  if ADestTable.IsClassFromField then
    LQuery.SQL.Add(Comma + IO_CLASSFROMFIELD_FIELDNAME);

  // From
  LQuery.SQL.Add('FROM ' + SourceTableName);

  Result := LQuery.SQL.Text;
end;

function TioDBBuilderSqLiteSqlGenerator.CreateClassInfoField(ATable: IioDBBuilderTable): String;
begin
  Result := IO_CLASSFROMFIELD_FIELDNAME + ' ' + 'TEXT' + ' ' +'NULL';
  if ATable.ForeignKeyList.Count>0 then
    Result := Result + ',';
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderSqLiteSqlGenerator.CreateDatabase(const ADbName: string): String;
var
  LQuery: IioQuery;
begin
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;
  LQuery.SQL.Add('SELECT 1=1');

  LQuery.Open;
  LQuery.Close;

  Result := LQuery.SQL.Text;
end;

function TioDBBuilderSqLiteSqlGenerator.DatabaseExists(const ADbName: string): Boolean;
begin
  // Create new connection in database master
  Result:=FileExists(ADbName);
end;

function TioDBBuilderSqLiteSqlGenerator.DropAllForeignKey(const ATableList: TioDBBuilderTableList): String;
begin
  // Do Nothing
  // N.B. Nel caso di Sqlite le tabelle vengono completamente rigenerate nel metodo RestructureTable
end;

function TioDBBuilderSqLiteSqlGenerator.DropAllIndex: String;
var
  LQuery: IioQuery;
  LQueryDrop: IioQuery;
begin
  //LQueryDrop := io.GlobalFactory.DBFactory.Query('');
  LQueryDrop := GetQuery;

  // Retrieve All Foreign Key
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;

  LQuery.SQL.Add('SELECT * FROM sqlite_master WHERE type = ''index''');
  LQuery.Open;

  while not LQuery.Eof do
  begin
    LQueryDrop.SQL.Add(Format('DROP INDEX %s;',[LQuery.Fields.FieldByName('name').AsString]));

    LQuery.Next;
  end;

//  if not FOnlyCreateScript then
//  begin
//    // Execute Query
//    if LQueryDrop.SQL.Text.Length>0 then
//      LQueryDrop.ExecSQL;
//  end;

  Result := LQueryDrop.SQL.Text;

  LQuery.Close;
end;

function TioDBBuilderSqLiteSqlGenerator.EndAlterTable(const APropertyIsID: Boolean): String;
//var
//  LQuery: IioQuery;
begin
  Result := '';
  FAlterTableScript := FAlterTableScript + ' ' + Result;

  // Skip ID Property
  if APropertyIsID then FAlterTableScript := '';

  // Execute Query
//  if not FOnlyCreateScript then
//  begin
//    if FAlterTableScript.Length>0 then
//    begin
//      LQuery := io.GlobalFactory.DBFactory.Query('');
//      LQuery.SQL.Add(FAlterTableScript);
//      LQuery.ExecSQL;
//    end;
//  end;
end;

function TioDBBuilderSqLiteSqlGenerator.EndCreateTable: String;
begin
  Result := ')';
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

procedure TioDBBuilderSqLiteSqlGenerator.ExecuteSql(const ASql: string; const AMultipleSQL: boolean = False);
var
  LQuery: IioQuery;
begin
  if ASql.IsEmpty then Exit;

  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;
  LQuery.SQL.Add(ASql);
  LQuery.ExecSQL;
end;

function TioDBBuilderSqLiteSqlGenerator.FieldExists(const ADbName: String; const ATableName: String; const AFieldName: String): Boolean;
var
  LQuery: IioQuery;
  LConnectionDefName: string;
begin
  Result := False;
  LConnectionDefName := io.GlobalFactory.DBFactory.ConnectionManager.GetDefaultConnectionName;
  //LQuery := io.GlobalFactory.DBFactory.Query(LConnectionDefName);
  LQuery := GetQuery;
  LQuery.SQL.Add('pragma table_info('+QuotedStr(ATableName)+')');

  LQuery.Open;

  while not LQuery.Eof do
  begin
    if LQuery.Fields.FieldByName('name').AsString.ToLower = AFieldName.ToLower then
    begin
      Result := True;
      Break;
    end;
    LQuery.Next;
  end;

  LQuery.Close;
end;

function TioDBBuilderSqLiteSqlGenerator.FieldModified(const ADbName: String; const ATableName: String; const AProperty:IioContextProperty; out AWarnings: Boolean): Boolean;
var
  LQuery: IioQuery;
  LColumnName: string;
  LColumnTyp: string;
//  LColumnLength: Integer;
  LColumnNullable: Boolean;
begin
//  LColumnLength := 0;

  Result := False;
  //LQuery := io.GlobalFactory.DBFactory.Query(LConnectionDefName);
  LQuery := GetQuery;
  LQuery.SQL.Add('pragma table_info('+QuotedStr(ATableName)+')');

  LQuery.Open;

  while not LQuery.Eof do
  begin
    if LQuery.Fields.FieldByName('name').AsString.ToLower = AProperty.GetName.ToLower then
    begin
      LColumnName:=LQuery.Fields.FieldByName('name').AsString;
      LColumnTyp:=LQuery.Fields.FieldByName('type').AsString;
      LColumnNullable:=(LQuery.Fields.FieldByName('notnull').AsInteger=0);

      // Verify if something has been changed in FieldType
      if LColumnTyp.ToLower<>GetColumnType(AProperty).ToLower then
      begin
        if ConversionTypeAdmitted(LColumnTyp.ToLower, GetColumnType(AProperty).ToLower) then
        begin
          Result := True;
          Break;
        end
        else
        begin
          AWarnings := True;
          Result := True;
          Break;
        end;
      end;

      // Verify if something has been changed in FieldNullable. Skip ID field
      if (not AProperty.IsID) and (LColumnNullable<>AProperty.GetMetadata_FieldNullable) then
      begin
        if AProperty.GetMetadata_FieldNullable and (not LColumnNullable) then
        begin
          AWarnings := True;
          Result := True;
          Break;
        end
        else
        begin
          Result := True;
          Break;
        end;
      end;
    end;

    LQuery.Next;
  end;

  LQuery.Close;
end;

function TioDBBuilderSqLiteSqlGenerator.GetColumnType(const AProperty: IioContextProperty): String;
begin
  //Data Type	Affinity
  //CHARACTER(20) VARCHAR(255) VARYING CHARACTER(255) NCHAR(55) NATIVE CHARACTER(70) NVARCHAR(100) TEXT CLOB	--> TEXT
  //BLOB no datatype specified	--> NONE
  //REAL DOUBLE DOUBLE PRECISION FLOAT
  //NUMERIC DECIMAL(10,5) BOOLEAN DATE DATETIME -->	NUMERIC
  case AProperty.GetMetadata_FieldType of
    ioMdVarchar:
      begin
        Result := 'TEXT'
      end;
    ioMdChar:
      begin
        Result := 'TEXT'
      end;
    ioMdInteger:
      begin
        Result := 'INTEGER';
      end;
    ioMdFloat:
        Result := 'REAL';
    ioMdDate:
        Result := 'NUMERIC';
    ioMdTime:
        Result := 'NUMERIC';
    ioMdDateTime:
        Result := 'NUMERIC';
    ioMdDecimal:
      begin
        Result := 'NUMERIC';
      end;
    ioMdNumeric:
      begin
        Result := 'NUMERIC';
      end;
    ioMdBoolean:
      begin
        Result := 'NUMERIC';
      end;
    ioMdBinary:
      begin
        Result := 'BLOB';
      end;
    ioMdCustomFieldType:
      Result := AProperty.GetMetadata_CustomFieldType;
  end;
end;

function TioDBBuilderSqLiteSqlGenerator.GetRemark(
  const AWarnings: Boolean): String;
begin
  if AWarnings then
    Result := '-- '
  else
    Result := '';
end;

function TioDBBuilderSqLiteSqlGenerator.RemoveLastComma(
  const AValue: string): string;
begin
  if AValue.EndsWith(',') then
    Result := AValue.Substring(0, AValue.Length-1);
end;

function TioDBBuilderSqLiteSqlGenerator.RestructureTable(
  const ATableList: TioDBBuilderTableList): String;
var
  LQueryDrop: IioQuery;
  LPairTable: TPair<string, IioDBBuilderTable>;
  LPairField: TPair<string,IioDBBuilderField>;
  LSb: TStringBuilder;
  LSql: string;
begin
  LQueryDrop := GetQuery;

  for LPairTable in ATableList do
  begin
    LQueryDrop.SQL.Add('PRAGMA foreign_keys=off;');
    LQueryDrop.SQL.Add('BEGIN TRANSACTION;');
    LQueryDrop.SQL.Add(Format('DROP TABLE IF EXISTS _%s_old;',[LPairTable.Value.TableName]));
    LQueryDrop.SQL.Add(Format('ALTER TABLE %s RENAME TO _%s_old;',[LPairTable.Value.TableName,LPairTable.Value.TableName]));

    LSb := TStringBuilder.Create;

    try

      LSb.AppendLine(Self.BeginCreateTable(LPairTable.Value.TableName));

      for LPairField in LPairTable.Value.Fields do
      begin
        if LPairField.Value.IsSqlField then
          LSb.AppendLine(Self.CreateField(LPairField.Value.GetProperty));
      end;

      if LPairTable.Value.IsClassFromField then
        LSb.AppendLine(Self.CreateClassInfoField(LPairTable.Value))
      else
      begin
        if LPairTable.Value.ForeignKeyList.Count=0 then
        begin
          // Remove last comma
          LSql := LSb.ToString;
          LSql := LSql.Substring(0, LSql.Length-3);
          LSb.Clear;
          LSb.Append(LSql);
        end
      end;

      // Generate Foreign Key in CREATE STATEMENT (use this feature only in the databases that provide it)
      // Otherwise implements AddForeignKey methods
      LSb.AppendLine(Self.AddForeignKeyInCreate(LPairTable.Value));

      LSb.AppendLine(');');

      LQueryDrop.SQL.Add(LSb.ToString);

    finally
      LSb.Free;
    end;

    LQueryDrop.SQL.Add(Self.GetInsertXCopyDataRows(LPairTable.Value, Format('_%s_old',[LPairTable.Value.TableName]))+';');

    LQueryDrop.SQL.Add('COMMIT;');
    LQueryDrop.SQL.Add('PRAGMA foreign_keys=on;');
  end;

  Result := LQueryDrop.SQL.Text;

  LQueryDrop.SQL.SaveToFile('c:\temp\sql.txt');
end;

function TioDBBuilderSqLiteSqlGenerator.TableExists(const ADbName: String; const ATableName:String): Boolean;
var
  LQuery: IioQuery;
begin
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;
  LQuery.SQL.Add('SELECT count(*) as TableExists FROM sqlite_master WHERE type=''table'' AND name='+QuotedStr(ATableName));

  LQuery.Open;

  if LQuery.Fields.FieldByName('TableExists').AsInteger = 0 then
    Result := False
  else
    Result := True;

  LQuery.Close;
end;

function TioDBBuilderSqLiteSqlGenerator.UseDatabase(
  const ADbName: string): String;
begin
  // Do Nothing
  Result := '';
end;

end.



