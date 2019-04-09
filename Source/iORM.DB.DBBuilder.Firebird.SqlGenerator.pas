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


unit iORM.DB.DBBuilder.Firebird.SqlGenerator;

interface

uses
  System.SysUtils,
  System.TypInfo,
  System.Rtti,
  System.Classes,
  iORM.Attributes,
  iORM.DB.DBBuilder.Interfaces,
  iORM.DB.DBBuilder.Custom.SqlGenerator,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine,
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.CommonTypes,
  Data.DB;

type
  TioDBBuilderFirebirdSqlGenerator = class(TioDBBuilderCustomSqlGenerator, IioDBBuilderSqlGenerator)
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
    function RestructureTable(const ATableList: TioDBBuilderTableList): String;

    procedure ExecuteSql(const ASql: string; const AMultipleSQL: boolean = False);
  end;

implementation

uses
  iORM.Exceptions,
  iORM, iORM.DB.Factory;

{ TioDBBuilderFirebirdSqlGenerator }

function TioDBBuilderFirebirdSqlGenerator.CreateField(const AProperty:IioContextProperty; const AAddNullableSyntax: boolean = True; const AAddType: boolean = False): String;
var
  LFieldName: string;
  LFieldType: string;
  LFieldLength: string;
  LKeyOptions: string;
  LNullable: string;
  LPrecision: string;
  LScale: string;
  LType: string;
begin
  LFieldName := AProperty.GetSqlFieldName;
  LFieldLength := '';
  LKeyOptions := '';
  LNullable := '';
  LType := '';

  case AProperty.GetMetadata_FieldType of
    ioMdVarchar:
      begin
        LFieldLength := Format('(%s)',[AProperty.GetMetadata_FieldLength.ToString]);
        LFieldType := 'VARCHAR'
      end;
    ioMdChar:
      begin
        LFieldLength := Format('(%s)',[AProperty.GetMetadata_FieldLength.ToString]);
        LFieldType := 'CHAR'
      end;
    ioMdInteger:
      begin
        LFieldType := 'INTEGER';
      end;
    ioMdFloat:
        LFieldType := 'FLOAT';
    ioMdDate:
        LFieldType := 'DATE';
    ioMdTime:
        LFieldType := 'TIME';
    ioMdDateTime:
        LFieldType := 'TIMESTAMP';
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
        LFieldType := 'INTEGER';
      end;
    ioMdBinary:
      begin
        if AProperty.GetMetadata_FieldSubType<>'' then
          LFieldType := AProperty.GetMetadata_FieldSubType
        else
          LFieldType := 'BLOB'
      end;
    ioMdCustomFieldType:
      LFieldType := AProperty.GetMetadata_CustomFieldType;
  end;

  if AAddNullableSyntax then
  begin
    if AProperty.GetMetadata_FieldNullable then
      LNullable := ''
    else
      LNullable := 'NOT NULL';
  end;

  if AAddType then
  begin
    LType := 'TYPE';
  end;

  if AProperty.IsID then
  begin
    LKeyOptions := '';
    LFieldType := 'INTEGER';
    LFieldLength := '';
    LNullable := 'NOT NULL';
  end;

  Result := ' ' +  LFieldName + ' ' +' '+ LType+' ' + ' ' + LFieldType + ' ' + ' ' + LKeyOptions + ' '+LFieldLength+' '+LNullable + ',';

  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderFirebirdSqlGenerator.AddField(const AProperty:IioContextProperty): String;
var
  LRow: string;
begin
  LRow := Format('ADD %s ',[Self.CreateField(AProperty, False)]).Trim;
  Result := LRow.Substring(0, LRow.Length-1);
  FAlterTableScript := FAlterTableScript + ' ' + Result;
end;

function TioDBBuilderFirebirdSqlGenerator.AddForeignKey(const ASourceTableName: String; const ASourceFieldName: String; const ADestinationTableName: String; const ADestinationFieldName: String): String;
var
  LGuid: TGuid;
  LFKName: string;
begin
  // N.B. Viene calcolato un nome random perchè in FB c'e' un limite a 31 caratteri di lunghezza per i nomi dei constraint
  CreateGUID(LGuid);
  LFKName := LGuid.ToString.Replace('-','',[rfReplaceAll]).Replace('}','',[rfReplaceAll]).Substring(24);

  Result:='ALTER TABLE '+ASourceTableName+' '+
          'ADD CONSTRAINT '+
          'FK_'+LFKName+  //ASourceTableName+'_'+ASourceFieldName+'_'+ADestinationTableName+
          ' FOREIGN KEY'+
          '('+ASourceFieldName+')'+
          ' REFERENCES '+ADestinationTableName+
          '('+ADestinationFieldName+')';
end;

function TioDBBuilderFirebirdSqlGenerator.AddForeignKeyInCreate(
  const ABuilderTable: IioDBBuilderTable): String;
begin
  // Do Nothing
  Result := '';
end;

function TioDBBuilderFirebirdSqlGenerator.AddSequences(
  const ATableName: String; const AIDProperty: IioContextProperty): String;
begin
  Result := Format('CREATE SEQUENCE %s',[ATableName]);
end;

function TioDBBuilderFirebirdSqlGenerator.AddIndex(const AContext: IioContext; const AIndexName,
  ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation;
  const AUnique: Boolean): String;
var
  LQuery: IioQuery;
begin
  AContext.SetConnectionDefName(GetConnectionDefName);
  LQuery := TioDbFactory.QueryEngine.GetQueryForCreateIndex(AContext, AIndexName, ACommaSepFieldList, AIndexOrientation, AUnique);
  Result := LQuery.SQL.Text;
end;

function TioDBBuilderFirebirdSqlGenerator.AddPrimaryKey(const ATableName: string; const AIDProperty: IioContextProperty): String;
begin
  Result := 'ALTER TABLE '+ATableName+' '+
            'ADD PRIMARY KEY '+
            '('+AIDProperty.GetSqlFieldName+')';
end;

function TioDBBuilderFirebirdSqlGenerator.AlterField(const AProperty:IioContextProperty): String;
var
  LRow: String;
begin
  LRow := Format('ALTER %s ',[Self.CreateField(AProperty, False, True)]).Trim;
  Result := LRow.Substring(0, LRow.Length-1);
  FAlterTableScript := FAlterTableScript + ' ' + Result;
end;

function TioDBBuilderFirebirdSqlGenerator.BeginAlterTable(const ARemark: String; const ATableName:String): String;
begin
  FAlterTableScript := '';
  Result := Format('%s ALTER TABLE %s',[ARemark, ATableName]);
  FAlterTableScript := FAlterTableScript + ' ' + Result;
end;

function TioDBBuilderFirebirdSqlGenerator.BeginCreateTable(
  const ATableName: String): String;
begin
  FCreateTableScript := '';
  Result := Format('CREATE TABLE %s (', [ATableName]);
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderFirebirdSqlGenerator.ConversionTypeAdmitted(AColumnType,
  AModelColumnType: string): Boolean;
var
  LInvalidConversions: TStringList;
begin
  LInvalidConversions:=TStringList.Create;

  try
    // TODO: Potrebbero esserci altre conversioni da gestire
    LInvalidConversions.Add('timestamp->decimal');
    LInvalidConversions.Add('timestamp->numeric');
    LInvalidConversions.Add('timestamp->integer');
    LInvalidConversions.Add('date->decimal');
    LInvalidConversions.Add('date->numeric');
    LInvalidConversions.Add('date->integer');
    LInvalidConversions.Add('time->numeric');
    LInvalidConversions.Add('time->decimal');
    LInvalidConversions.Add('time->integer');

    LInvalidConversions.Add('varchar->decimal');
    LInvalidConversions.Add('varchar->integer');
    LInvalidConversions.Add('varchar->date');
    LInvalidConversions.Add('varchar->time');
    LInvalidConversions.Add('varchar->datetime');

    LInvalidConversions.Add('char->decimal');
    LInvalidConversions.Add('char->integer');
    LInvalidConversions.Add('char->date');
    LInvalidConversions.Add('char->time');
    LInvalidConversions.Add('char->datetime');

    Result:=True;
    If LInvalidConversions.IndexOf(AColumnType+'->'+AModelColumnType)>0 then Result:=False;

  finally
    LInvalidConversions.Free;
  end;
end;

function TioDBBuilderFirebirdSqlGenerator.CreateClassInfoField(ATable: IioDBBuilderTable): String;
begin
  Result := ' ' + IO_CLASSFROMFIELD_FIELDNAME +' ' + ' ' + 'VARCHAR' + ' ' + ' ' + '('+ IO_CLASSFROMFIELD_FIELDLENGTH +')'+' '+' ' + ',';
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

function TioDBBuilderFirebirdSqlGenerator.CreateDatabase(const ADbName: string): String;
begin
  // N.B. Sfrutta un parametro di Firedac per autocreare il db se non esiste
  TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).Params.Values['CreateDatabase'] := BoolToStr(True,True);
  // N.B. Apriamo una connessione solo per fargli creare il db.
  io.GlobalFactory.DBFactory.Connection();
  // N.B. Rimuoviamo il parametro di Firedac per autocreare il db se non esiste
  TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).Params.Values['CreateDatabase'] := BoolToStr(False,True);

  Result := '';
end;

function TioDBBuilderFirebirdSqlGenerator.DatabaseExists(const ADbName: string): Boolean;
begin
  Result := FileExists(ADbName);
end;

function TioDBBuilderFirebirdSqlGenerator.DropAllForeignKey(const ATableList: TioDBBuilderTableList): String;
var
  LQuery: IioQuery;
  LQueryDrop: IioQuery;
begin
  //LQueryDrop := io.GlobalFactory.DBFactory.Query('');
  LQueryDrop := GetQuery;

  // Retrieve All Foreign Key
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;

  LQuery.SQL.Add('select r.rdb$relation_name as tname, r.rdb$constraint_name as cname');
  LQuery.SQL.Add('from rdb$relation_constraints r');
  LQuery.SQL.Add('where (r.rdb$constraint_type=''FOREIGN KEY'')');
  LQuery.SQL.Add('and r.rdb$constraint_name like ''FK_%''');
  LQuery.Open;

  while not LQuery.Eof do
  begin
    LQueryDrop.SQL.Add(Format('ALTER TABLE %s DROP CONSTRAINT %s;',[LQuery.Fields.FieldByName('tname').AsString,LQuery.Fields.FieldByName('cname').AsString]));

    LQuery.Next;
  end;

  Result := LQueryDrop.SQL.Text;
  LQuery.Close;
end;

function TioDBBuilderFirebirdSqlGenerator.DropAllIndex: String;
var
  LQuery: IioQuery;
  LQueryDrop: IioQuery;
begin
  //LQueryDrop := io.GlobalFactory.DBFactory.Query('');
  LQueryDrop := GetQuery;

  // Retrieve All Foreign Key
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;

  LQuery.SQL.Add('select RDB$INDEX_NAME as iname, RDB$RELATION_NAME as tname');
  LQuery.SQL.Add('from rdb$indices');
  LQuery.SQL.Add('where (rdb$system_flag is null or rdb$system_flag = 0)');
  LQuery.SQL.Add('and rdb$foreign_key is null');
  LQuery.SQL.Add('and RDB$INDEX_NAME like ''IDX_%''');
  LQuery.Open;

  while not LQuery.Eof do
  begin
    LQueryDrop.SQL.Add(Format('DROP INDEX %s',[LQuery.Fields.FieldByName('iname').AsString]));

    LQuery.Next;
  end;

  Result := LQueryDrop.SQL.Text;

  LQuery.Close;
end;

function TioDBBuilderFirebirdSqlGenerator.EndAlterTable(const APropertyIsID: Boolean): String;
begin
  Result := '';
  FAlterTableScript := FAlterTableScript + ' ' + Result;

  // Skip ID Property
  if APropertyIsID then FAlterTableScript := '';
end;

function TioDBBuilderFirebirdSqlGenerator.EndCreateTable: String;
begin
  Result := ')';
  FCreateTableScript := FCreateTableScript + ' ' + Result;
end;

procedure TioDBBuilderFirebirdSqlGenerator.ExecuteSql(const ASql: string; const AMultipleSQL: boolean);
var
  LQuery: IioQuery;
  LSlTemp: TStringList;
  I: Integer;
begin
  if ASql.IsEmpty then Exit;

  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;

  if AMultipleSQL then
  begin
    LSlTemp := TStringList.Create;
    try
      LSlTemp.Text := ASql;

      for I := 0 to LSlTemp.Count-1 do
      begin
        LQuery.SQL.Clear;
        LQuery.SQL.Add(LSlTemp.Strings[I]);
        LQuery.ExecSQL;
      end;
    finally
      LSlTemp.Free;
    end;
  end
  else
  begin
    LQuery.SQL.Clear;
    LQuery.SQL.Add(ASql);
    LQuery.ExecSQL;
  end;
end;

function TioDBBuilderFirebirdSqlGenerator.FieldExists(const ADbName: String; const ATableName: String; const AFieldName: String): Boolean;
var
  LQuery: IioQuery;
  LConnectionDefName: string;
begin
  Result := False;
  LConnectionDefName := io.GlobalFactory.DBFactory.ConnectionManager.GetDefaultConnectionName;
  //LQuery := io.GlobalFactory.DBFactory.Query(LConnectionDefName);
  LQuery := GetQuery;

  LQuery.SQL.Add('select f.rdb$relation_name as tablename, f.rdb$field_name as fieldname');
  LQuery.SQL.Add('from rdb$relation_fields f');
  LQuery.SQL.Add('join rdb$relations r on f.rdb$relation_name = r.rdb$relation_name');
  LQuery.SQL.Add('and r.rdb$view_blr is null');
  LQuery.SQL.Add('and (r.rdb$system_flag is null or r.rdb$system_flag = 0)');
  LQuery.SQL.Add('where f.rdb$relation_name = '+QuotedStr(ATableName.ToUpper));
  LQuery.SQL.Add('and f.rdb$field_name = '+QuotedStr(AFieldName.ToUpper));
  LQuery.SQL.Add('order by 1, f.rdb$field_position');

  LQuery.Open;

  if not LQuery.Eof and not LQuery.Fields.FieldByName('fieldname').IsNull then
    Result := True;

  LQuery.Close;
end;

function TioDBBuilderFirebirdSqlGenerator.FieldModified(const ADbName: String; const ATableName: String; const AProperty:IioContextProperty; out AWarnings: Boolean): Boolean;
var
  LQuery: IioQuery;
  LColumnName: string;
  LColumnTyp: string;
  LColumnLength: Integer;
  LColumnDecimals: Integer;
  LColumnNullable: Boolean;
begin
//  LColumnLength := 0;

  Result := False;
  //LQuery := io.GlobalFactory.DBFactory.Query(LConnectionDefName);
  LQuery := GetQuery;

  LQuery.SQL.Add('SELECT r.RDB$FIELD_NAME AS column_name,');
  LQuery.SQL.Add('r.RDB$DESCRIPTION AS field_description,');
  LQuery.SQL.Add('r.RDB$DEFAULT_VALUE AS field_default_value,');
  LQuery.SQL.Add('r.RDB$NULL_FLAG AS is_Nullable,');
  LQuery.SQL.Add('f.RDB$CHARACTER_LENGTH AS flength,');
  LQuery.SQL.Add('f.RDB$FIELD_PRECISION AS fprecision,');
  LQuery.SQL.Add('f.RDB$FIELD_SCALE AS fscale,');
  LQuery.SQL.Add('f.RDB$FIELD_TYPE,');
  LQuery.SQL.Add('CASE f.RDB$FIELD_TYPE ');
  LQuery.SQL.Add('WHEN 261 THEN ''BLOB''');
  LQuery.SQL.Add('WHEN 37 THEN ''VARCHAR''');
  LQuery.SQL.Add('WHEN 14 THEN ''CHAR''');
  LQuery.SQL.Add('WHEN 8 THEN ''INTEGER''');
  LQuery.SQL.Add('WHEN 7 THEN ''SMALLINT''');
  LQuery.SQL.Add('WHEN 16 THEN ''INT64''');  // --> DECIMAL field_subtype 2, NUMERIC field_subtype 1, BIGINT field_subtype 0
  LQuery.SQL.Add('WHEN 27 THEN ''DOUBLE''');
  LQuery.SQL.Add('WHEN 10 THEN ''FLOAT''');
  LQuery.SQL.Add('WHEN 12 THEN ''DATE''');
  LQuery.SQL.Add('WHEN 13 THEN ''TIME''');
  LQuery.SQL.Add('WHEN 35 THEN ''TIMESTAMP''');
  LQuery.SQL.Add('ELSE ''UNKNOWN''');
  LQuery.SQL.Add('END AS type_name,');
  LQuery.SQL.Add('f.RDB$FIELD_SUB_TYPE AS field_subtype,');
  LQuery.SQL.Add('coll.RDB$COLLATION_NAME AS field_collation,');
  LQuery.SQL.Add('cset.RDB$CHARACTER_SET_NAME AS field_charset');
  LQuery.SQL.Add('FROM RDB$RELATION_FIELDS r');
  LQuery.SQL.Add('LEFT JOIN RDB$FIELDS f ON r.RDB$FIELD_SOURCE = f.RDB$FIELD_NAME');
  LQuery.SQL.Add('LEFT JOIN RDB$COLLATIONS coll ON f.RDB$COLLATION_ID = coll.RDB$COLLATION_ID');
  LQuery.SQL.Add('LEFT JOIN RDB$CHARACTER_SETS cset ON f.RDB$CHARACTER_SET_ID = cset.RDB$CHARACTER_SET_ID');
  LQuery.SQL.Add('WHERE r.RDB$RELATION_NAME='+QuotedStr(ATableName.ToUpper)+' ');
  LQuery.SQL.Add('AND r.RDB$FIELD_NAME='+QuotedStr(AProperty.GetName.ToUpper)+' ');
  LQuery.SQL.Add('ORDER BY r.RDB$FIELD_POSITION');

  LQuery.Open;

  if not LQuery.Eof then
  begin
    LColumnName:=LQuery.Fields.FieldByName('column_name').AsString;
    LColumnTyp:=LQuery.Fields.FieldByName('type_name').AsString.Replace('identity','',[rfReplaceAll]).Trim;

    if ((LQuery.Fields.FieldByName('type_name').AsString='INT64') and (LQuery.Fields.FieldByName('field_subtype').AsString='2')) or  // decimal
       ((LQuery.Fields.FieldByName('type_name').AsString='INT64') and (LQuery.Fields.FieldByName('field_subtype').AsString='1')) then
      LColumnLength:=LQuery.Fields.FieldByName('fprecision').AsInteger
    else
      LColumnLength:=LQuery.Fields.FieldByName('flength').AsInteger;
    if LQuery.Fields.FieldByName('fscale').Isnull then
      LColumnDecimals:=0
    else
      LColumnDecimals:=Abs(LQuery.Fields.FieldByName('fscale').AsInteger);
    LColumnNullable:=(LQuery.Fields.FieldByName('is_Nullable').IsNull);

    // Verify if something has been changed in FieldType
    if LColumnTyp.ToLower<>GetColumnType(AProperty).ToLower then
    begin
      if ConversionTypeAdmitted(LColumnTyp.ToLower, GetColumnType(AProperty).ToLower) then
      begin
        Result := True;
        Exit;
      end
      else
      begin
        AWarnings := True;
        Result := True;
        Exit;
      end;
    end;

    // Verify if something has been changed in FieldLength
    if (LQuery.Fields.FieldByName('type_name').AsString='VARCHAR') or
       (LQuery.Fields.FieldByName('type_name').AsString='CHAR') then
    begin
      // Verify if model length is >= db column otherwise warnings and statement not execute
      if AProperty.GetMetadata_FieldLength<LColumnLength then
      begin
        AWarnings := True;
        Result := True;
        Exit;
      end
      else
      begin
        if LColumnLength<>AProperty.GetMetadata_FieldLength then
        begin
          Result := True;
          Exit;
        end;
      end;
    end;

    // Verify if something has been changed in FieldPrecision
    if ((LQuery.Fields.FieldByName('type_name').AsString='INT64') and (LQuery.Fields.FieldByName('field_subtype').AsString='2')) or  // decimal
       ((LQuery.Fields.FieldByName('type_name').AsString='INT64') and (LQuery.Fields.FieldByName('field_subtype').AsString='1')) then
    begin
      if AProperty.GetMetadata_FieldPrecision<LColumnLength then
      begin
        AWarnings := True;
        Result := True;
        Exit;;
      end
      else
      begin
        if LColumnLength<>AProperty.GetMetadata_FieldPrecision then
        begin
          Result := True;
          Exit;
        end;
      end;

      // Verify if something has been changed in FieldScale
      if not LQuery.Fields.FieldByName('fscale').Isnull then
        if LColumnDecimals<AProperty.GetMetadata_FieldScale then
        begin
          AWarnings := True;
          Result := True;
          Exit;
        end
        else
        begin
          if LColumnDecimals<>AProperty.GetMetadata_FieldScale then
          begin
            Result := True;
            Exit;
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
        Exit;
      end
      else
      begin
        Result := True;
        Exit;
      end;
    end;
  end;

  LQuery.Close;
end;

function TioDBBuilderFirebirdSqlGenerator.GetColumnType(const AProperty: IioContextProperty): String;
begin
  case AProperty.GetMetadata_FieldType of
    ioMdVarchar:
      begin
        Result := 'VARCHAR'
      end;
    ioMdChar:
      begin
        Result := 'CHAR'
      end;
    ioMdInteger:
      begin
        Result := 'INTEGER';
      end;
    ioMdFloat:
        Result := 'FLOAT';
    ioMdDate:
        Result := 'DATE';
    ioMdTime:
        Result := 'TIME';
    ioMdDateTime:
        Result := 'TIMESTAMP';
    ioMdDecimal:
      begin
        Result := 'INT64';  // Firebird use subtype
      end;
    ioMdNumeric:
      begin
        Result := 'INT64';  // Firebird use subtype
      end;
    ioMdBoolean:
      begin
        Result := 'INTEGER';
      end;
    ioMdBinary:
      begin
        if AProperty.GetMetadata_FieldSubType<>'' then
          Result := AProperty.GetMetadata_FieldSubType
        else
          Result := 'BLOB'
      end;
    ioMdCustomFieldType:
      Result := AProperty.GetMetadata_CustomFieldType;
  end;
end;

function TioDBBuilderFirebirdSqlGenerator.GetRemark(
  const AWarnings: Boolean): String;
begin
  if AWarnings then
    Result := '-- '
  else
    Result := '';
end;

function TioDBBuilderFirebirdSqlGenerator.RestructureTable(
  const ATableList: TioDBBuilderTableList): String;
begin
  // Do Nothing
end;

function TioDBBuilderFirebirdSqlGenerator.TableExists(const ADbName: String; const ATableName:String): Boolean;
var
  LQuery: IioQuery;
begin
  //LQuery := io.GlobalFactory.DBFactory.Query('');
  LQuery := GetQuery;
  LQuery.SQL.Add('select rdb$relation_name as TableName');
  LQuery.SQL.Add('from rdb$relations');
  LQuery.SQL.Add('where rdb$view_blr is null');
  LQuery.SQL.Add('and (rdb$system_flag is null or rdb$system_flag = 0)');
  LQuery.SQL.Add('and rdb$relation_name='+QuotedStr(ATableName.ToUpper));
  LQuery.Open;

  if LQuery.Eof or LQuery.Fields.FieldByName('TableName').IsNull then
    Result := False
  else
    Result := True;

  LQuery.Close;
end;

function TioDBBuilderFirebirdSqlGenerator.UseDatabase(
  const ADbName: string): String;
begin
  Result := '';
end;

end.



