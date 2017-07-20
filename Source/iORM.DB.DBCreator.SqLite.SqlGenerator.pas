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



unit iORM.DB.DBCreator.SqLite.SqlGenerator;

interface

uses
  iORM.DB.DBCreator.Interfaces, System.TypInfo, System.Rtti, System.Classes,
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces, Data.DB;

type

  TFieldTypeSet = set of TFieldType;

  TioDBCreatorSqLiteSqlGenerator = class(TInterfacedObject, IioDBCreatorSqlGenerator)
  strict private
    FQuery: IioQuery;
  strict protected
    procedure ClearQuery;
    function FieldTypeMatching(AField:IioDBCreatorField; ASqlField:TField): Boolean;
    procedure RenameTable(ATable:IioDBCreatorTable; NewName:String);
    procedure CopyDataRows(ADestTable:IioDBCreatorTable; SourceTableName:String);
    procedure CreateTable(ATable:IioDBCreatorTable);
    procedure RestructureTable(ATable:IioDBCreatorTable);
    procedure AutoCreateTable(ATable:IioDBCreatorTable);
    procedure DropTable(ATableName:String);
    procedure InsertTestRow(ATable:IioDBCreatorTable);
    procedure RemoveTestRow(ATable:IioDBCreatorTable);
    function GenerateSqlTestValue(AField:IioDBCreatorField): String;
    procedure LoadFieldsState_Exists(ATable:IioDBCreatorTable);
    procedure LoadFieldsState_SameType(ATable:IioDBCreatorTable);
  public
    constructor Create(AQuery:IioQuery);
    function TableExists(ATable:IioDBCreatorTable): Boolean;
    procedure LoadFieldsState(ATable:IioDBCreatorTable);
    procedure AutoCreateDatabase(ADBCreator: IioDBCreator);
    function GetClassFromFieldColumnType: String;
  end;

implementation

uses
  System.SysUtils, iORM.Exceptions, iORM.Attributes;

{ TioDBCreatorSqLiteSqlGenerator }

procedure TioDBCreatorSqLiteSqlGenerator.AutoCreateDatabase(
  ADBCreator: IioDBCreator);
var
  ATable: IioDBCreatorTable;
begin
  // Start transaction
  FQuery.Connection.StartTransaction;
  try
    // Loop for all Tables
    for ATable in ADBCreator.Tables.Values do
    begin
      Self.AutoCreateTable(ATable);
    end;
    // if all Ok then Commit
    FQuery.Connection.Commit;
  except
    // If errors then Roolback
    FQuery.Connection.Rollback;
    raise;
  end;
end;

procedure TioDBCreatorSqLiteSqlGenerator.AutoCreateTable(
  ATable: IioDBCreatorTable);
begin
  case ATable.TableState of
    // New Table
    tsNew:
    begin
      Self.CreateTable(ATable);
    end;
    // Modified Table
    tsModified:
    begin
      Self.RestructureTable(ATable);
    end;
  end;
end;

procedure TioDBCreatorSqLiteSqlGenerator.ClearQuery;
begin
  FQuery.Close;
  FQuery.SQL.Clear;
end;

function TioDBCreatorSqLiteSqlGenerator.FieldTypeMatching(
  AField: IioDBCreatorField; ASqlField: TField): Boolean;
var
  TextFieldTypeSet: TFieldTypeSet;
  IntegerFieldTypeSet: TFieldTypeSet;
  RealFieldTypeSet: TFieldTypeSet;
  BlobFieldTypeSet: TFieldTypeSet;
begin
  // Define sets
  TextFieldTypeSet := [ftString, ftWideString, ftWideMemo, ftMemo];
  IntegerFieldTypeSet := [ftInteger, ftSmallint, ftWord, ftLargeInt, ftAutoinc];
  RealFieldTypeSet := [ftFloat, ftCurrency, ftBCD, ftDate, ftTime, ftDateTime];
  BlobFieldTypeSet := [ftBlob];
  // Text field type
  Result := (AField.FieldType = 'TEXT') and (ASqlField.DataType in TextFieldTypeSet);
  if Result then Exit;
  // Integer field type
  Result := (AField.FieldType = 'INTEGER') and (ASqlField.DataType in  IntegerFieldTypeSet);
  if Result then Exit;
  // Real field type
  Result := (AField.FieldType = 'REAL') and (ASqlField.DataType in  RealFieldTypeSet);
  if Result then Exit;
  // Blob field type
  Result := (AField.FieldType = 'BLOB') and (ASqlField.DataType in  BlobFieldTypeSet);
  if Result then Exit;
end;

function TioDBCreatorSqLiteSqlGenerator.GenerateSqlTestValue(
  AField: IioDBCreatorField): String;
begin
  if AField.FieldType = 'TEXT'
    then Result := 'TEXT VALUE'.QuotedString
  else if AField.FieldType = 'INTEGER'
    then Result := '-9999'
  else if AField.FieldType = 'REAL'
    then Result := '1.1'
  else if AField.FieldType = 'BLOB'
    then Result := 'NULL' ;
  // NB: BLOB type in the future
end;

function TioDBCreatorSqLiteSqlGenerator.GetClassFromFieldColumnType: String;
begin
  Result := 'TEXT';
end;

procedure TioDBCreatorSqLiteSqlGenerator.InsertTestRow(
  ATable: IioDBCreatorTable);
var
  AField: IioDBCreatorField;
  Comma: Char;
begin
  Self.ClearQuery;
  // Insert into
  FQuery.SQL.Add('INSERT INTO ' + ATable.TableName);
  FQuery.SQL.Add('(');
  // Fields
  Comma := ' ';
  for AField in ATable.Fields.Values do
  begin
    if not AField.DBFieldExist then Continue;  // Only fields exsisting in the DB table
    FQuery.SQL.Add(Comma + AField.FieldName);
    Comma := ',';
  end;
  FQuery.SQL.Add(') VALUES (');
  // Values
  Comma := ' ';
  for AField in ATable.Fields.Values do
  begin
    if not AField.DBFieldExist then Continue;  // Obly fields exsisting in the DB table
    FQuery.SQL.Add(Comma + Self.GenerateSqlTestValue(AField));
    Comma := ',';
  end;
  FQuery.SQL.Add(')');
  // Execute
  FQuery.ExecSQL;
end;

procedure TioDBCreatorSqLiteSqlGenerator.LoadFieldsState(
  ATable: IioDBCreatorTable);
begin
  LoadFieldsState_Exists(ATable);
  LoadFieldsState_SameType(ATable);
end;

procedure TioDBCreatorSqLiteSqlGenerator.LoadFieldsState_Exists(
  ATable: IioDBCreatorTable);
var
  AField: IioDBCreatorField;
  ASqlField: TField;
begin
  Self.ClearQuery;
  FQuery.SQL.Add('SELECT * FROM ' + ATable.TableName + ' WHERE 0=1');
  FQuery.Open;
  try
    // Loop for all fields
    for AField in ATable.Fields.Values do
    begin
      ASqlField := FQuery.Fields.FindField(AField.FieldName);
      AField.DBFieldExist := Assigned(ASqlField);
    end;
  finally
    FQuery.Close;
  end;
end;

procedure TioDBCreatorSqLiteSqlGenerator.LoadFieldsState_SameType(
  ATable: IioDBCreatorTable);
var
  AField: IioDBCreatorField;
  ASqlField: TField;
begin
  // Open empty query for Fields List
  //  NB: Prima crea un record con dei dati campione perchè altrimenti
  //       SqLite mi crea sempre campi di tipo ftWideMemo e mi manda in palla
  //       tutto.
  //  NB: l'ID del record con i dati campionè è sempre -9999
  Self.InsertTestRow(ATable);
  try
    Self.ClearQuery;
    FQuery.SQL.Add('SELECT * FROM ' + ATable.TableName + ' WHERE ' + ATable.IDField.FieldName + ' = -9999');
    FQuery.Open;
    try
      // Loop for all fields
      for AField in ATable.Fields.Values do
      begin
        AField.DBFieldSameType := False;
        ASqlField := FQuery.Fields.FindField(AField.FieldName);
        if not Assigned(ASqlField) then Continue;
        AField.DBFieldSameType := Self.FieldTypeMatching(AField, ASqlField);
      end;
    finally
      FQuery.Close;
    end;
  finally
    Self.RemoveTestRow(ATable);
  end;
end;

constructor TioDBCreatorSqLiteSqlGenerator.Create(AQuery: IioQuery);
begin
  inherited Create;
  FQuery := AQuery;
end;

procedure TioDBCreatorSqLiteSqlGenerator.CreateTable(ATable:IioDBCreatorTable);
var
  AField: IioDBCreatorField;
  Comma: Char;
  FieldStr: String;
begin
  Self.ClearQuery;
  // Create table
  FQuery.SQL.Add('CREATE TABLE ' + ATable.TableName);
  FQuery.SQL.Add('(');
  // Loop for all fields
  Comma := ' ';
  for AField in ATable.Fields.Values do
  begin
    FieldStr := Comma + AField.FieldName + ' ' + AField.FieldType;
    if AField.IsKeyField then FieldStr := FieldStr + ' PRIMARY KEY AUTOINCREMENT';
    FQuery.SQL.Add(FieldStr);
    Comma := ',';
  end;
  FQuery.SQL.Add(')');
  // Execute
  FQuery.ExecSQL;
end;

procedure TioDBCreatorSqLiteSqlGenerator.DropTable(ATableName: String);
begin
  Self.ClearQuery;
  FQuery.SQL.Add('DROP TABLE ' + ATableName);
  FQuery.ExecSQL;
end;

procedure TioDBCreatorSqLiteSqlGenerator.CopyDataRows(
  ADestTable: IioDBCreatorTable; SourceTableName: String);
var
  AField: IioDBCreatorField;
  Comma: Char;
begin
  Self.ClearQuery;
  // Insert into
  FQuery.SQL.Add('INSERT INTO ' + ADestTable.TableName);
  // Fields
  FQuery.SQL.Add('(');
  Comma := ' ';
  for AField in ADestTable.Fields.Values do
  begin
    if not AField.DBFieldExist then Continue;
    FQuery.SQL.Add(Comma + AField.FieldName);
    Comma := ',';
  end;
  FQuery.SQL.Add(')');
  // Select
  FQuery.SQL.Add('SELECT');
  // FIelds
  Comma := ' ';
  for AField in ADestTable.Fields.Values do
  begin
    if not AField.DBFieldExist then Continue;
    FQuery.SQL.Add(Comma + AField.FieldName);
    Comma := ',';
  end;
  // From
  FQuery.SQL.Add('FROM ' + SourceTableName);
  // Execute
  FQuery.ExecSQL;
end;

procedure TioDBCreatorSqLiteSqlGenerator.RemoveTestRow(
  ATable: IioDBCreatorTable);
begin
  Self.ClearQuery;
  FQuery.SQL.Add('DELETE FROM ' + ATable.TableName + ' WHERE ' + ATable.IDField.FieldName + ' = -9999');
  FQuery.ExecSQL;
end;

procedure TioDBCreatorSqLiteSqlGenerator.RenameTable(
  ATable: IioDBCreatorTable; NewName: String);
begin
  Self.ClearQuery;
  FQuery.SQL.Add('ALTER TABLE ' + ATable.TableName + ' RENAME TO ' + NewName);
  FQuery.ExecSQL;
end;

procedure TioDBCreatorSqLiteSqlGenerator.RestructureTable(
  ATable: IioDBCreatorTable);
var
  TempTableName: String;
begin
  // Rename old table
  TempTableName := ATable.TableName + '_OLD';
  Self.RenameTable(ATable, TempTableName);
  // Crate new table
  Self.CreateTable(ATable);
  // Move data old to new
  Self.CopyDataRows(ATable, TempTableName);
  // Delete old table
  Self.DropTable(TempTableName);
end;

function TioDBCreatorSqLiteSqlGenerator.TableExists(ATable:IioDBCreatorTable): Boolean;
begin
  Self.ClearQuery;
  FQuery.SQL.Add('SELECT name FROM sqlite_master WHERE type = ' + 'table'.QuotedString + ' AND name = ' + ATable.TableName.QuotedString);
  FQuery.Open;
  try
    Result := (not FQuery.Eof);
  finally
    FQuery.Close;
  end;
end;


end.


