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



unit iORM.DB.DBCreator.LogFile.SqlGenerator;

interface

uses
  iORM.DB.DBCreator.Interfaces, System.TypInfo, System.Rtti, System.Classes,
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces, Data.DB;

type

  TFieldTypeSet = set of TFieldType;

(*
  TioMyStream = Class(TFileStream)
  private
    function GetSQL: TioMyStream;
  public
    Procedure Add(Const AString:String);
    Procedure NewLine;
    Property SQL:TioMyStream Read GetSQL;
    Procedure ExecSQL;
    Procedure Open;
    Procedure Close;
  End;
*)

  TioMyStream = Class(TStringList)
  private
    function GetSQL: TioMyStream;
  public
//    Procedure Add(Const AString:String);
    Procedure NewLine;
    Property SQL:TioMyStream Read GetSQL;
    Procedure ExecSQL;
    Procedure Open;
    Procedure Close;
  End;

  TioDBCreatorLogFileSqlGenerator = class(TInterfacedObject, IioDBCreatorSqlGenerator)
  strict private
    FQuery:TioMyStream;
//    FQuery: IioQuery;
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

{ TioDBCreatorLogFileSqlGenerator }

procedure TioDBCreatorLogFileSqlGenerator.AutoCreateDatabase(
  ADBCreator: IioDBCreator);
var
  ATable: IioDBCreatorTable;
begin
  FQuery:=TioMyStream.Create;
  // Start transaction
//  FQuery.Connection.StartTransaction;
  try
    // Loop for all Tables
    for ATable in ADBCreator.Tables.Values do
    begin
      Self.AutoCreateTable(ATable);
    end;
    // if all Ok then Commit
    FQuery.SaveToFile('Trace.SQL');
    FQuery.Free;
//    FQuery.Connection.Commit;
  except
    // If errors then Roolback
//    FQuery.Connection.Rollback;
    FQuery.Free;
    raise;
  end;
end;

procedure TioDBCreatorLogFileSqlGenerator.AutoCreateTable(
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

procedure TioDBCreatorLogFileSqlGenerator.ClearQuery;
begin
  FQuery.NewLine;
  FQuery.Add('//------------------------------------------------');
  FQuery.NewLine;
//  FQuery.Close;
//  FQuery.SQL.Clear;
end;

function TioDBCreatorLogFileSqlGenerator.FieldTypeMatching(
  AField: IioDBCreatorField; ASqlField: TField): Boolean;
var
  TextFieldTypeSet: TFieldTypeSet;
  IntegerFieldTypeSet: TFieldTypeSet;
  RealFieldTypeSet: TFieldTypeSet;
  BlobFieldTypeSet: TFieldTypeSet;
begin
  Result := False;
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

function TioDBCreatorLogFileSqlGenerator.GenerateSqlTestValue(
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

function TioDBCreatorLogFileSqlGenerator.GetClassFromFieldColumnType: String;
begin
  Result := 'TEXT';
end;

procedure TioDBCreatorLogFileSqlGenerator.InsertTestRow(
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
    if not AField.DBFieldExist then Continue;  // Only fields exsisting in the DB table
    FQuery.SQL.Add(Comma + Self.GenerateSqlTestValue(AField));
    Comma := ',';
  end;
  FQuery.SQL.Add(')');
  // Execute
  FQuery.ExecSQL;
end;

procedure TioDBCreatorLogFileSqlGenerator.LoadFieldsState(
  ATable: IioDBCreatorTable);
begin
  LoadFieldsState_Exists(ATable);
  LoadFieldsState_SameType(ATable);
end;

procedure TioDBCreatorLogFileSqlGenerator.LoadFieldsState_Exists(
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
      ASqlField := nil;
      ASqlField := Nil; //FQuery.Fields.FindField(AField.FieldName);
      AField.DBFieldExist := Assigned(ASqlField);
    end;
  finally
    FQuery.Close;
  end;
end;

procedure TioDBCreatorLogFileSqlGenerator.LoadFieldsState_SameType(
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
        ASqlField := Nil; //FQuery.Fields.FindField(AField.FieldName);
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

constructor TioDBCreatorLogFileSqlGenerator.Create(AQuery: IioQuery);
begin
  inherited Create;
//  FQuery := AQuery;
end;

procedure TioDBCreatorLogFileSqlGenerator.CreateTable(ATable:IioDBCreatorTable);
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

procedure TioDBCreatorLogFileSqlGenerator.DropTable(ATableName: String);
begin
  Self.ClearQuery;
  FQuery.SQL.Add('DROP TABLE ' + ATableName);
  FQuery.ExecSQL;
end;

procedure TioDBCreatorLogFileSqlGenerator.CopyDataRows(
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

procedure TioDBCreatorLogFileSqlGenerator.RemoveTestRow(
  ATable: IioDBCreatorTable);
begin
  Self.ClearQuery;
  FQuery.SQL.Add('DELETE FROM ' + ATable.TableName + ' WHERE ' + ATable.IDField.FieldName + ' = -9999');
  FQuery.ExecSQL;
end;

procedure TioDBCreatorLogFileSqlGenerator.RenameTable(
  ATable: IioDBCreatorTable; NewName: String);
begin
  Self.ClearQuery;
  FQuery.SQL.Add('ALTER TABLE ' + ATable.TableName + ' RENAME TO ' + NewName);
  FQuery.ExecSQL;
end;

procedure TioDBCreatorLogFileSqlGenerator.RestructureTable(
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

function TioDBCreatorLogFileSqlGenerator.TableExists(ATable:IioDBCreatorTable): Boolean;
begin
  Self.ClearQuery;
  FQuery.SQL.Add('SELECT name FROM sqlite_master WHERE type = ' + 'table'.QuotedString + ' AND name = ' + ATable.TableName.QuotedString);
  FQuery.Open;
  try
    Result := False; //(not FQuery.Eof);
  finally
    FQuery.Close;
  end;
end;

{ TioMyStream }

(*
procedure TioMyStream.Add(const AString: String);
begin
  inherited Add(AString);
//  Write(AString,  Length(AString));
//  NewLine;
end;
*)

procedure TioMyStream.Close;
begin
// Nothing
end;

procedure TioMyStream.ExecSQL;
begin
  // Nothing
end;

function TioMyStream.GetSQL: TioMyStream;
begin
  Result := Self;
end;

procedure TioMyStream.NewLine;
//Const
//  NL = #13#10;
begin
  Add('');
//  Write(NL,  Length(NL));
end;

procedure TioMyStream.Open;
begin
  // Nothing
end;

end.


