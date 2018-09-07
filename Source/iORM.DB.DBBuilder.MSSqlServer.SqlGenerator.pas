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


unit iORM.DB.DBBuilder.MSSqlServer.SqlGenerator;

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
  iORM.Context.Interfaces,
  iORM.CommonTypes,
  iORM.DB.DBBuilder.Custom.SqlGenerator,
  Data.DB;

const
  ConnectionName_MSSQL_MASTER = 'MSSQL_MASTER';

type
  TioDBBuilderMSSqlServerSqlGenerator = class(TioDBBuilderCustomSqlGenerator, IioDBBuilderSqlGenerator)
  private
    FCreateTableScript: String;
    FAlterTableScript: String;
    function GetColumnType(const AProperty: IioContextProperty): String;
    function ConversionTypeAdmitted(AColumnType: string; AModelColumnType: string): Boolean;
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
    function AddForeignKey(const ASourceTableName: String; const ASourceFieldName: String; const ADestinationTableName: String; const ADestinationFieldName: String): String;
    function AddSequences(const ATableName: String; const AIDProperty: IioContextProperty): String;
    function AddIndex(const AContext: IioContext; const AIndexName, ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): String;

    function DropAllForeignKey(const ATableList: TioDBBuilderTableList): String;
    function DropAllIndex: String;

    function AddForeignKeyInCreate(const ABuilderTable: IioDBBuilderTable): String;

    procedure ExecuteSql(const ASql: string; const AMultipleSQL: boolean = False);
  end;

implementation

uses
  iORM.Exceptions,
  iORM, iORM.DB.Factory;

{ TioDBBuilderMSSqlServerSqlService }

function TioDBBuilderMSSqlServerSqlGenerator.CreateField(const AProperty:IioContextProperty; const AAddNullableSyntax: boolean = True; const AAddType: boolean = False): String;
var
  LFieldName: string;
  LFieldType: string;
  LFieldLength: string;
  LKeyOptions: string;
  LNullable: string;
  LPrecision: string;
  LScale: string;
begin
  LFieldName := AProperty.GetSqlFieldName;
  LFieldLength := '';
  LKeyOptions := '';

  case AProperty.GetMetadata_FieldType of
    ioMdVarchar:
      begin
        LFieldLength := Format('(%s)',[AProperty.GetMetadata_FieldLength.ToString]);

        if AProperty.GetMetadata_FieldUnicode then
          LFieldType := 'VARCHAR'
        else
          LFieldType := 'NVARCHAR';
      end;
    ioMdChar:
      begin
        LFieldLength := Format('(%s)',[AProperty.GetMetadata_FieldLength.ToString]);

        if AProperty.GetMetadata_FieldUnicode then
          LFieldType := 'CHAR'
        else
          LFieldType := 'NCHAR';
      end;
    ioMdInteger:
      begin
        // TODO: Gestire eventuale precision per SMALLINT, BIGINT per ora tutto come INTEGER
        //if AProperty.GetMetadata_FieldPrecision then
        LFieldType := 'INT';
      end;
    ioMdFloat:
        LFieldType := 'FLOAT';
    ioMdDate:
        LFieldType := 'DATE';
    ioMdTime:
        LFieldType := 'TIME';
    ioMdDateTime:
        LFieldType := 'DATETIME';
    ioMdDecimal:
      begin
        LFieldType := 'DECIMAL';
        LPrecision := AProperty.GetMetadata_FieldPrecision.ToString;
        LScale := AProperty.GetMetadata_FieldScale.ToString;
        LFieldLength := Format('(%s)',[LPrecision+','+LScale]);
      end;
    ioMdNumeric:
      begin
        LFieldType := 'NUMERIC';
        LPrecision := AProperty.GetMetadata_FieldPrecision.ToString;
        LScale := AProperty.GetMetadata_FieldScale.ToString;
        LFieldLength := Format('(%s)',[LPrecision+','+LScale]);
      end;
    ioMdBoolean:
      begin
        LFieldType := 'BIT';
      end;
    ioMdBinary:
      begin
        if AProperty.GetMetadata_FieldSubType<>'' then
        begin
          LFieldType := AProperty.GetMetadata_FieldSubType
        end
        else
        begin
          if AProperty.GetMetadata_FieldUnicode then
            LFieldType := 'BINARY'
          else
            LFieldType := 'NBINARY';
        end;
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
    LKeyOptions := ' IDENTITY(1,1) ';
    LFieldType := 'INT';
    LFieldLength := '';
    LNullable := 'NOT NULL';
  end;

  Result :=  LFieldName + '[' + LFieldType + ']' + LKeyOptions + ' '+LFieldLength+' '+LNullable + ',';

  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderMSSqlServerSqlGenerator.AddField(const AProperty:IioContextProperty): String;
var
  LRow: string;
begin
  LRow := Format('ADD %s ',[Self.CreateField(AProperty)]).Trim;
  Result := LRow.Substring(0, LRow.Length-1);
  FAlterTableScript := FAlterTableScript + ' ' + Result;
end;

function TioDBBuilderMSSqlServerSqlGenerator.AddForeignKey(const ASourceTableName: String; const ASourceFieldName: String; const ADestinationTableName: String; const ADestinationFieldName: String): String;
begin
  Result:='ALTER TABLE ['+ASourceTableName+'] '+
          'ADD CONSTRAINT '+
          'FK_'+ASourceTableName+'_'+ASourceFieldName+'_'+ADestinationTableName+
          ' FOREIGN KEY'+
          '(['+ASourceFieldName+'])'+
          ' REFERENCES '+ADestinationTableName+
          '(['+ADestinationFieldName+'])';
end;

function TioDBBuilderMSSqlServerSqlGenerator.AddForeignKeyInCreate(
  const ABuilderTable: IioDBBuilderTable): String;
begin
  // Do Nothing
  Result := '';
end;

function TioDBBuilderMSSqlServerSqlGenerator.AddSequences(
  const ATableName: String; const AIDProperty: IioContextProperty): String;
begin
  // Do Nothing
end;

function TioDBBuilderMSSqlServerSqlGenerator.AddIndex(const AContext: IioContext; const AIndexName,
  ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation;
  const AUnique: Boolean): String;
var
  LQuery: IioQuery;
begin
  AContext.SetConnectionDefName(GetConnectionDefName);
  LQuery := TioDbFactory.QueryEngine.GetQueryForCreateIndex(AContext, AIndexName, ACommaSepFieldList, AIndexOrientation, AUnique);
  Result := LQuery.SQL.Text;
end;

function TioDBBuilderMSSqlServerSqlGenerator.AddPrimaryKey(const ATableName: string; const AIDProperty: IioContextProperty): String;
begin
  Result := 'ALTER TABLE ['+ATableName+'] '+
            'ADD CONSTRAINT '+'PK_'+ATableName+'_'+AIDProperty.GetName+' PRIMARY KEY CLUSTERED'+
            '('+AIDProperty.GetSqlFieldName+')';
end;

function TioDBBuilderMSSqlServerSqlGenerator.AlterField(const AProperty:IioContextProperty): String;
var
  LRow: String;
begin
  LRow := Format('ALTER COLUMN %s ',[Self.CreateField(AProperty)]).Trim;
  Result := LRow.Substring(0, LRow.Length-1);
  FAlterTableScript := FAlterTableScript + ' ' + Result;
end;

function TioDBBuilderMSSqlServerSqlGenerator.BeginAlterTable(const ARemark: String; const ATableName:String): String;
begin
  FAlterTableScript := '';
  Result := Format('%s ALTER TABLE %s',[ARemark, ATableName]);
  FAlterTableScript := FAlterTableScript + ' ' + Result;
end;

function TioDBBuilderMSSqlServerSqlGenerator.BeginCreateTable(
  const ATableName: String): String;
begin
  FCreateTableScript := '';
  Result := Format('CREATE TABLE %s (', [ATableName]);
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderMSSqlServerSqlGenerator.ConversionTypeAdmitted(AColumnType,
  AModelColumnType: string): Boolean;
var
  LInvalidConversions: TStringList;
begin
  LInvalidConversions:=TStringList.Create;

  try
    // TODO: Potrebbero esserci altre conversioni da gestire
    LInvalidConversions.Add('datetime->decimal');
    LInvalidConversions.Add('datetime->numeric');
    LInvalidConversions.Add('datetime->int');
    LInvalidConversions.Add('date->decimal');
    LInvalidConversions.Add('date->numeric');
    LInvalidConversions.Add('date->int');
    LInvalidConversions.Add('time->numeric');
    LInvalidConversions.Add('time->decimal');
    LInvalidConversions.Add('time->int');

    LInvalidConversions.Add('varchar->decimal');
    LInvalidConversions.Add('varchar->int');
    LInvalidConversions.Add('varchar->date');
    LInvalidConversions.Add('varchar->time');
    LInvalidConversions.Add('varchar->datetime');

    LInvalidConversions.Add('nvarchar->decimal');
    LInvalidConversions.Add('nvarchar->int');
    LInvalidConversions.Add('nvarchar->date');
    LInvalidConversions.Add('nvarchar->time');
    LInvalidConversions.Add('nvarchar->datetime');

    LInvalidConversions.Add('char->decimal');
    LInvalidConversions.Add('char->int');
    LInvalidConversions.Add('char->date');
    LInvalidConversions.Add('char->time');
    LInvalidConversions.Add('char->datetime');

    LInvalidConversions.Add('nchar->decimal');
    LInvalidConversions.Add('nchar->int');
    LInvalidConversions.Add('nchar->date');
    LInvalidConversions.Add('nchar->time');
    LInvalidConversions.Add('nchar->datetime');

    Result:=True;
    If LInvalidConversions.IndexOf(AColumnType+'->'+AModelColumnType)>0 then Result:=False;

  finally
    LInvalidConversions.Free;
  end;
end;

function TioDBBuilderMSSqlServerSqlGenerator.CreateClassInfoField(ATable: IioDBBuilderTable): String;
begin
  Result := '[' + IO_CLASSFROMFIELD_FIELDNAME +']' + '[' + 'VARCHAR' + ']' + ' ' + '('+ IO_CLASSFROMFIELD_FIELDLENGTH +')'+' '+'NULL' + ',';
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderMSSqlServerSqlGenerator.CreateDatabase(const ADbName: string): String;
var
  LQuery: IioQuery;
begin
  // Create new connection in database master
  io.Connections.NewSQLServerConnectionDef(
                  TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).AsString['Server'],
                  'master',
                  TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).Params.UserName,
                  TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).Params.Password,False, False, False,
                  ConnectionName_MSSQL_MASTER);

  LQuery := io.GlobalFactory.DBFactory.Query(ConnectionName_MSSQL_MASTER);
  LQuery.SQL.Add(Format('CREATE DATABASE [%s]',[ADbName]));

  // N.B. Il database viene sempre generato per evitare problemi di permessi
  // nei controlli successivi
  LQuery.ExecSQL;

  Result := LQuery.SQL.Text;
end;

function TioDBBuilderMSSqlServerSqlGenerator.DatabaseExists(const ADbName: string): Boolean;
var
  LQuery: IioQuery;
begin
  // Create new connection in database master
  io.Connections.NewSQLServerConnectionDef(
                  TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).AsString['Server'],
                  'master',
                  TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).Params.UserName,
                  TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).Params.Password,False, False, False,
                  ConnectionName_MSSQL_MASTER);

  LQuery := io.GlobalFactory.DBFactory.Query(ConnectionName_MSSQL_MASTER);
  LQuery.SQL.Add('select db_id('+QuotedStr(ADbName)+') as DBID');
  LQuery.Open;

  if LQuery.Eof or LQuery.Fields.FieldByName('DBID').IsNull then
    Result := False
  else
    Result := True;

  LQuery.Close;
end;

function TioDBBuilderMSSqlServerSqlGenerator.DropAllForeignKey(const ATableList: TioDBBuilderTableList): String;
var
  LQuery: IioQuery;
  LQueryDrop: IioQuery;
begin
  //LQueryDrop := io.GlobalFactory.DBFactory.Query('');
  LQueryDrop := GetQuery;

  // Retrieve All Foreign Key
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;
  LQuery.SQL.Add('select t.name as tname, i.name as cname from sys.tables t');
  LQuery.SQL.Add('inner join sys.foreign_keys i');
  LQuery.SQL.Add('on t.object_id=i.parent_object_id');
  LQuery.SQL.Add('where i.name like ''FK_%''');
  LQuery.Open;

  while not LQuery.Eof do
  begin
    LQueryDrop.SQL.Add(Format('ALTER TABLE %s DROP CONSTRAINT %s',['['+LQuery.Fields.FieldByName('tname').AsString+']',LQuery.Fields.FieldByName('cname').AsString]));

    LQuery.Next;
  end;

  Result := LQueryDrop.SQL.Text;
  LQuery.Close;
end;

function TioDBBuilderMSSqlServerSqlGenerator.DropAllIndex: String;
var
  LQuery: IioQuery;
  LQueryDrop: IioQuery;
begin
  //LQueryDrop := io.GlobalFactory.DBFactory.Query('');
  LQueryDrop := GetQuery;

  // Retrieve All Foreign Key
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;

  LQuery.SQL.Add('select i.name as iname, t.name as tname from sys.tables t');
  LQuery.SQL.Add('inner join sys.indexes i');
  LQuery.SQL.Add('on t.object_id=i.object_id');
  LQuery.SQL.Add('where i.name like ''IDX_%''');
  LQuery.Open;

  while not LQuery.Eof do
  begin
    LQueryDrop.SQL.Add(Format('DROP INDEX %s ON %s ',[LQuery.Fields.FieldByName('iname').AsString,'['+LQuery.Fields.FieldByName('tname').AsString+']']));

    LQuery.Next;
  end;

  Result := LQueryDrop.SQL.Text;

  LQuery.Close;
end;

function TioDBBuilderMSSqlServerSqlGenerator.EndAlterTable(const APropertyIsID: Boolean): String;
begin
  Result := '';
  FAlterTableScript := FAlterTableScript + ' ' + Result;

  // Skip ID Property
  if APropertyIsID then FAlterTableScript := '';
end;

function TioDBBuilderMSSqlServerSqlGenerator.EndCreateTable: String;
begin
  Result := ')';
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

procedure TioDBBuilderMSSqlServerSqlGenerator.ExecuteSql(const ASql: string; const AMultipleSQL: boolean = False);
var
  LQuery: IioQuery;
begin
  if ASql.IsEmpty then Exit;

  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;
  LQuery.SQL.Add(ASql);
  LQuery.ExecSQL;
end;

function TioDBBuilderMSSqlServerSqlGenerator.FieldExists(const ADbName: String; const ATableName: String; const AFieldName: String): Boolean;
var
  LQuery: IioQuery;
begin
  Result := False;
  //LQuery := io.GlobalFactory.DBFactory.Query(LConnectionDefName);
  LQuery := GetQuery;
  LQuery.SQL.Add('exec sp_columns '+QuotedStr(ATableName)+' ');

  LQuery.Open;

  while not LQuery.Eof do
  begin
    if LQuery.Fields.FieldByName('column_name').AsString.ToLower = AFieldName.ToLower then
    begin
      Result := True;
      Break;
    end;
    LQuery.Next;
  end;

  LQuery.Close;
end;

function TioDBBuilderMSSqlServerSqlGenerator.FieldModified(const ADbName: String; const ATableName: String; const AProperty:IioContextProperty; out AWarnings: Boolean): Boolean;
var
  LQuery: IioQuery;
  LColumnName: string;
  LColumnTyp: string;
  LColumnLength: Integer;
  LColumnDecimals: Integer;
  LColumnNullable: Boolean;
  LConnectionDefName: string;
begin
  LColumnLength := 0;

  Result := False;
  //LConnectionDefName := io.GlobalFactory.DBFactory.ConnectionManager.GetDefaultConnectionName;
  //LQuery := io.GlobalFactory.DBFactory.Query(LConnectionDefName);
  LQuery := GetQuery;
  LQuery.SQL.Add('exec sp_columns '+QuotedStr(ATableName)+' ');

  LQuery.Open;

  while not LQuery.Eof do
  begin
    if LQuery.Fields.FieldByName('column_name').AsString.ToLower = AProperty.GetName.ToLower then
    begin
      LColumnName:=LQuery.Fields.FieldByName('column_name').AsString;
      LColumnTyp:=LQuery.Fields.FieldByName('type_name').AsString.Replace('identity','',[rfReplaceAll]).Trim;

      if (LQuery.Fields.FieldByName('type_name').AsString='decimal') or
         (LQuery.Fields.FieldByName('type_name').AsString='numeric') or
         (LQuery.Fields.FieldByName('type_name').AsString='varchar') or
         (LQuery.Fields.FieldByName('type_name').AsString='nvarchar') or
         (LQuery.Fields.FieldByName('type_name').AsString='char') or
         (LQuery.Fields.FieldByName('type_name').AsString='nchar') then
        LColumnLength:=LQuery.Fields.FieldByName('Precision').AsInteger
      else
        LColumnLength:=LQuery.Fields.FieldByName('Length').AsInteger;
      if LQuery.Fields.FieldByName('Scale').Isnull then
        LColumnDecimals:=0
      else
        LColumnDecimals:=LQuery.Fields.FieldByName('Scale').AsInteger;
      LColumnNullable:=(LQuery.Fields.FieldByName('is_Nullable').AsString='YES');

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

      // Verify if something has been changed in FieldLength
      if (LQuery.Fields.FieldByName('type_name').AsString='varchar') or
         (LQuery.Fields.FieldByName('type_name').AsString='nvarchar') or
         (LQuery.Fields.FieldByName('type_name').AsString='char') or
         (LQuery.Fields.FieldByName('type_name').AsString='nchar') then
      begin
        // Verify if model length is >= db column otherwise warnings and statement not execute
        if AProperty.GetMetadata_FieldLength<LColumnLength then
        begin
          AWarnings := True;
          Result := True;
          Break;
        end
        else
        begin
          if LColumnLength<>AProperty.GetMetadata_FieldLength then
          begin
            Result := True;
            Break;
          end;
        end;
      end;

      // Verify if something has been changed in FieldPrecision
      if (LQuery.Fields.FieldByName('type_name').AsString.ToLower='decimal') or
         (LQuery.Fields.FieldByName('type_name').AsString.ToLower='numeric') then
      begin
        if AProperty.GetMetadata_FieldPrecision<LColumnLength then
        begin
          AWarnings := True;
          Result := True;
          Break;
        end
        else
        begin
          if LColumnLength<>AProperty.GetMetadata_FieldPrecision then
          begin
            Result := True;
            Break;
          end;
        end;

        // Verify if something has been changed in FieldScale
        if not LQuery.Fields.FieldByName('Scale').Isnull then
          if LColumnDecimals<AProperty.GetMetadata_FieldScale then
          begin
            AWarnings := True;
            Result := True;
            Break;
          end
          else
          begin
            if LColumnDecimals<>AProperty.GetMetadata_FieldScale then
            begin
              Result := True;
              Break;
            end;
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

function TioDBBuilderMSSqlServerSqlGenerator.GetColumnType(const AProperty: IioContextProperty): String;
begin
  case AProperty.GetMetadata_FieldType of
    ioMdVarchar:
      begin
        if AProperty.GetMetadata_FieldUnicode then
          Result := 'VARCHAR'
        else
          Result := 'NVARCHAR';
      end;
    ioMdChar:
      begin
        if AProperty.GetMetadata_FieldUnicode then
          Result := 'CHAR'
        else
          Result := 'NCHAR';
      end;
    ioMdInteger:
      begin
        Result := 'INT';
      end;
    ioMdFloat:
        Result := 'FLOAT';
    ioMdDate:
        Result := 'DATE';
    ioMdTime:
        Result := 'TIME';
    ioMdDateTime:
        Result := 'DATETIME';
    ioMdDecimal:
      begin
        Result := 'DECIMAL';
      end;
    ioMdNumeric:
      begin
        Result := 'NUMERIC';
      end;
    ioMdBoolean:
      begin
        Result := 'BIT';
      end;
    ioMdBinary:
      begin
        if AProperty.GetMetadata_FieldSubType<>'' then
        begin
          Result := AProperty.GetMetadata_FieldSubType;
        end
        else
        begin
          if AProperty.GetMetadata_FieldUnicode then
            Result := 'BINARY'
          else
            Result := 'NBINARY';
        end;
      end;
    ioMdCustomFieldType:
      Result := AProperty.GetMetadata_CustomFieldType;
  end;
end;

function TioDBBuilderMSSqlServerSqlGenerator.GetRemark(
  const AWarnings: Boolean): String;
begin
  if AWarnings then
    Result := '-- '
  else
    Result := '';
end;

function TioDBBuilderMSSqlServerSqlGenerator.TableExists(const ADbName: String; const ATableName:String): Boolean;
var
  LQuery: IioQuery;
begin
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;
  LQuery.SQL.Add('select object_id('+QuotedStr(ATableName)+') as TableID');

  LQuery.Open;

  if LQuery.Eof or LQuery.Fields.FieldByName('TableID').IsNull then
    Result := False
  else
    Result := True;

  LQuery.Close;
end;

function TioDBBuilderMSSqlServerSqlGenerator.UseDatabase(
  const ADbName: string): String;
begin
  Result := 'GO'+sLineBreak;
  Result := Result + Format('USE [%s]',[ADbName]);
end;

end.



