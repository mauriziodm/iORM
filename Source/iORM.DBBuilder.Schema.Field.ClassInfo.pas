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
unit iORM.DBBuilder.Schema.Field.ClassInfo;

interface

uses
  System.Rtti, iORM.DBBuilder.Interfaces, iORM.Context.Properties.Interfaces;

type

  /// <summary>
  /// Schema field implementation for the TrueClass field (stores the actual class name for polymorphism).
  /// Uses NormalizeSqlIdentifier for proper case normalization and quoting.
  /// </summary>
  TioDBBuilderSchemaFieldClassInfo = class(TInterfacedObject, IioDBBuilderSchemaField)
  private
    FAltered: TioDBBuilderFieldAlter;
    FConnectionDefName: String;  // Required for SqlDataConverter to apply database-specific normalization
    FStatus: TioDBBuilderStatus;
    function GetFieldCustomType: string;
    function GetFieldDefault: TValue;
    function GetFieldDefaultExists: Boolean;
    function GetFieldLength: integer;
    function GetFieldName: String;
    function GetFieldNotNull: Boolean;
    function GetFieldPrecision: integer;
    function GetFieldScale: integer;
    function GetFieldSubtype: string;
    function GetFieldType: TioMetadataFieldType;
    function GetFieldUnicode: boolean;
    function GetIsAltered: Boolean;
    function GetIsFieldDefaultAltered: Boolean;
    function GetIsFieldLengthAltered: Boolean;
    function GetIsFieldLengthDecreased: Boolean;
    function GetIsFieldLengthIncreased: Boolean;
    function GetIsFieldNotNullAltered: Boolean;
    function GetIsFieldPrecisionAltered: Boolean;
    function GetIsFieldPrecisionDecreased: Boolean;
    function GetIsFieldPrecisionIncreased: Boolean;
    function GetIsFieldTypeAltered: Boolean;
    function GetPrimaryKey: Boolean;
    function GetSqlFieldName: String;
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    constructor Create(const AConnectionDefName: String);
    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);

    property IsAltered: Boolean read GetIsAltered;
    property IsFieldDefaultAltered: Boolean read GetIsFieldDefaultAltered;
    property IsFieldLengthAltered: Boolean read GetIsFieldLengthAltered;
    property IsFieldLengthDecreased: Boolean read GetIsFieldLengthDecreased;
    property IsFieldLengthIncreased: Boolean read GetIsFieldLengthIncreased;
    property IsFieldNotNullAltered: Boolean read GetIsFieldNotNullAltered;
    property IsFieldPrecisionAltered: Boolean read GetIsFieldPrecisionAltered;
    property IsFieldPrecisionDecreased: Boolean read GetIsFieldPrecisionDecreased;
    property IsFieldPrecisionIncreased: Boolean read GetIsFieldPrecisionIncreased;
    property IsFieldTypeAltered: Boolean read GetIsFieldTypeAltered;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  iORM.CommonTypes, iORM.DB.Factory;

{ TioDBBuilderSchemaFieldClassInfo }

constructor TioDBBuilderSchemaFieldClassInfo.Create(const AConnectionDefName: String);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
end;

procedure TioDBBuilderSchemaFieldClassInfo.AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
begin
  Include(FAltered, AAltered);
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldCustomType: string;
begin
  Result := '';
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldDefault: TValue;
begin
  Result := nil;
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldDefaultExists: Boolean;
begin
  Result := not GetFieldDefault.IsEmpty;
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldLength: integer;
begin
  Result := IO_TRUECLASS_FIELDLENGTH;
end;

// Returns field name with case normalization only (no delimiters).
// Example: ioClassInfo for SQLite, IOCLASSINFO for Firebird
function TioDBBuilderSchemaFieldClassInfo.GetFieldName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName)
    .NormalizeSqlIdentifier(IO_TRUECLASS_FIELDNAME, False);
end;

// Returns field name with case normalization AND database-specific delimiters.
// Example: "ioClassInfo" for SQLite, "IOCLASSINFO" for Firebird, [ioClassInfo] for MS SQL Server
function TioDBBuilderSchemaFieldClassInfo.GetSqlFieldName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName)
    .NormalizeSqlIdentifier(IO_TRUECLASS_FIELDNAME, True);
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldNotNull: Boolean;
begin
  Result := True;
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldPrecision: integer;
begin
  Result := 0;
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldScale: integer;
begin
  Result := 0;
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldSubtype: string;
begin
  Result := '';
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldType: TioMetadataFieldType;
begin
  Result := ioMdVarchar;
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldUnicode: boolean;
begin
  Result := True;
end;

function TioDBBuilderSchemaFieldClassInfo.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchemaFieldClassInfo.GetPrimaryKey: Boolean;
begin
  Result := False;
end;

procedure TioDBBuilderSchemaFieldClassInfo.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsAltered: Boolean;
begin
  Result := FAltered <> [];
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldTypeAltered: Boolean;
begin
  Result := alFieldType in FAltered;
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldDefaultAltered: Boolean;
begin
  Result := alFieldDefault in FAltered;
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldNotNullAltered: Boolean;
begin
  Result := alFieldNotNull in FAltered;
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldLengthAltered: Boolean;
begin
  Result := (alFieldLengthIncreased in FAltered) or (alFieldLengthDecreased in FAltered);
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldLengthIncreased: Boolean;
begin
  Result := alFieldLengthIncreased in FAltered;
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldLengthDecreased: Boolean;
begin
  Result := alFieldLengthDecreased in FAltered;
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldPrecisionAltered: Boolean;
begin
  Result := (alFieldPrecisionIncreased in FAltered) or (alFieldPrecisionDecreased in FAltered);
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldPrecisionIncreased: Boolean;
begin
  Result := alFieldPrecisionIncreased in FAltered;
end;

function TioDBBuilderSchemaFieldClassInfo.GetIsFieldPrecisionDecreased: Boolean;
begin
  Result := alFieldPrecisionDecreased in FAltered;
end;

end.
