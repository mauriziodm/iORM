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
  iORM.Context.Properties.Interfaces,
  Data.DB;

const
  MASTER_CONNECTION_NAME = 'MSSQL_MASTER';

type
  TioDBBuilderMSSqlServerSqlGenerator = class (TInterfacedObject, IioDBBuilderSqlGenerator)
  private
    function GetColumnType(const AProperty: IioContextProperty): String;
  protected
  public
    function DatabaseExists(const ADbName: string): Boolean;
    function CreateDatabase(const ADbName: string): String;
    function UseDatabase(const ADbName: string): String;

    function TableExists(const ADbName: String; const ATableName:String): Boolean;
    function BeginCreateTable(const ATableName:String): String;
    function EndCreateTable: String;
    function BeginAlterTable(const ATableName:String): String;
    function EndAlterTable: String;

    function FieldExists(const ADbName: String; const ATableName: String; const AFieldName: String): Boolean;
    function FieldModified(const ADbName: String; const ATableName: String; const AProperty:IioContextProperty): Boolean;
    function CreateField(const AProperty:IioContextProperty): String;
    function CreateClassInfoField: String;
    function AddField(const AProperty:IioContextProperty): String;
    function AlterField(const AProperty:IioContextProperty): String;

    function AddPrimaryKey(const ATableName: string; const AIDProperty: IioContextProperty): String;

    function AddForeignKey(const ASourceTableName: String; const ASourceFieldName: String; const ADestinationTableName: String; const ADestinationFieldName: String): String;
  end;

implementation

uses
  iORM.Exceptions,
  iORM.CommonTypes,
  iORM;

{ TioDBBuilderMSSqlServerSqlService }

function TioDBBuilderMSSqlServerSqlGenerator.CreateField(
  const AProperty: IioContextProperty): String;
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
        if AProperty.GetMetadata_FieldUnicode then
          LFieldType := 'BINARY'
        else
          LFieldType := 'NBINARY';
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
end;

function TioDBBuilderMSSqlServerSqlGenerator.AddField(
  const AProperty: IioContextProperty): String;
begin
  Result := Format('ADD %s ',[Self.CreateField(AProperty)]);
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

function TioDBBuilderMSSqlServerSqlGenerator.AddPrimaryKey(const ATableName: string; const AIDProperty: IioContextProperty): String;
begin
  Result := 'ALTER TABLE ['+ATableName+'] '+
            'ADD CONSTRAINT '+'PK_'+ATableName+'_'+AIDProperty.GetName+' PRIMARY KEY CLUSTERED'+
            '('+AIDProperty.GetSqlFieldName+')';
end;

function TioDBBuilderMSSqlServerSqlGenerator.AlterField(
  const AProperty: IioContextProperty): String;
begin
  Result := Format('ALTER COLUMN %s ',[Self.CreateField(AProperty)]);
end;

function TioDBBuilderMSSqlServerSqlGenerator.BeginAlterTable(
  const ATableName: String): String;
begin
  Result := '-- BEGIN ALTER TABLE '+sLineBreak;
  Result := Result + Format('ALTER TABLE %s',[ATableName]);
end;

function TioDBBuilderMSSqlServerSqlGenerator.BeginCreateTable(
  const ATableName: String): String;
begin
  Result := Format('CREATE TABLE %s (', [ATableName]);
end;

function TioDBBuilderMSSqlServerSqlGenerator.CreateClassInfoField: String;
begin
  Result := '[' + IO_CLASSFROMFIELD_FIELDNAME +']' + '[' + 'VARCHAR' + ']' + ' ' + '('+ IO_CLASSFROMFIELD_FIELDLENGTH +')'+' '+'NULL' + ',';
end;

function TioDBBuilderMSSqlServerSqlGenerator.CreateDatabase(const ADbName: string): string;
begin
  Result := Format('CREATE DATABASE [%s]',[ADbName]);
end;

function TioDBBuilderMSSqlServerSqlGenerator.DatabaseExists(const ADbName: string): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := io.GlobalFactory.DBFactory.Query(MASTER_CONNECTION_NAME);

  LQuery.SQL.Add('select db_id('+QuotedStr(ADbName)+') as DBID');
  LQuery.Open;

  if LQuery.Eof or LQuery.Fields.FieldByName('DBID').IsNull then
    Result := False
  else
    Result := True;

  LQuery.Close;
end;

function TioDBBuilderMSSqlServerSqlGenerator.EndAlterTable: String;
begin
  Result := '-- END ALTER TABLE';
end;

function TioDBBuilderMSSqlServerSqlGenerator.EndCreateTable: String;
begin
  Result := ')';
end;

function TioDBBuilderMSSqlServerSqlGenerator.FieldExists(const ADbName: String; const ATableName: String; const AFieldName: String): Boolean;
var
  LQuery: IioQuery;
  LConnectionDefName: string;
begin
  Result := False;
  LConnectionDefName := io.GlobalFactory.DBFactory.ConnectionManager.GetDefaultConnectionName;
  LQuery := io.GlobalFactory.DBFactory.Query(LConnectionDefName);
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

function TioDBBuilderMSSqlServerSqlGenerator.FieldModified(const ADbName: String; const ATableName: String; const AProperty:IioContextProperty): Boolean;
var
  LQuery: IioQuery;
  LColumnName: string;
  LColumnTyp: string;
  LColumnLength: Integer;
  LColumnDecimals: Integer;
  LColumnPrecision: Integer;
  LColumnNullable: Boolean;
  LConnectionDefName: string;
begin
  Result := False;
  LConnectionDefName := io.GlobalFactory.DBFactory.ConnectionManager.GetDefaultConnectionName;
  LQuery := io.GlobalFactory.DBFactory.Query(LConnectionDefName);
  LQuery.SQL.Add('exec sp_columns '+QuotedStr(ATableName)+' ');

  LQuery.Open;

  while not LQuery.Eof do
  begin
    if LQuery.Fields.FieldByName('column_name').AsString.ToLower = AProperty.GetName.ToLower then
    begin
      LColumnName:=LQuery.Fields.FieldByName('column_name').AsString;
      LColumnTyp:=LQuery.Fields.FieldByName('type_name').AsString.Replace('identity','',[rfReplaceAll]).Trim;

      if (LQuery.Fields.FieldByName('type_name').AsString='decimal') or
         (LQuery.Fields.FieldByName('type_name').AsString='numeric') then
        LColumnPrecision:=LQuery.Fields.FieldByName('Precision').AsInteger
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
        Result := True;
        Break;
      end;

      // Verify if something has been changed in FieldLength
      if (LQuery.Fields.FieldByName('type_name').AsString='varchar') or
         (LQuery.Fields.FieldByName('type_name').AsString='nvarchar') or
         (LQuery.Fields.FieldByName('type_name').AsString='char') or
         (LQuery.Fields.FieldByName('type_name').AsString='nchar') then
      begin
        if LColumnLength<>AProperty.GetMetadata_FieldLength then
        begin
          Result := True;
          Break;
        end;
      end;

      // Verify if something has been changed in FieldPrecision
      if (LQuery.Fields.FieldByName('type_name').AsString.ToLower='decimal') or
         (LQuery.Fields.FieldByName('type_name').AsString.ToLower='numeric') then
      begin
        if LColumnPrecision<>AProperty.GetMetadata_FieldPrecision then
        begin
          Result := True;
          Break;
        end;

        // Verify if something has been changed in FieldScale
        if not LQuery.Fields.FieldByName('Scale').Isnull then
          if LColumnDecimals<>AProperty.GetMetadata_FieldScale then
          begin
            Result := True;
            Break;
          end;
      end;

      // Verify if something has been changed in FieldNullable
      if LColumnNullable<>AProperty.GetMetadata_FieldNullable then
      begin
        Result := True;
        Break;
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
        if AProperty.GetMetadata_FieldUnicode then
          Result := 'BINARY'
        else
          Result := 'NBINARY';
      end;
    ioMdCustomFieldType:
      Result := AProperty.GetMetadata_CustomFieldType;
  end;
end;

function TioDBBuilderMSSqlServerSqlGenerator.TableExists(const ADbName: String; const ATableName:String): Boolean;
var
  LQuery: IioQuery;
begin
  LQuery := io.GlobalFactory.DBFactory.Query(MASTER_CONNECTION_NAME);
  LQuery.SQL.Add('select object_id('+QuotedStr(ADbName+'..'+ATableName)+') as TableID');

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



