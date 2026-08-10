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
  System.Rtti, iORM.Context.Properties.Interfaces, iORM.DBBuilder.Schema.Field;

type

  /// <summary>
  /// Schema field for the TrueClass field (stores the actual class name for polymorphism).
  /// It is NOT backed by a mapped property: every value getter returns a fixed TrueClass value,
  /// with the field name normalized/quoted per the connection's dialect. All the Status/altered
  /// tracking is inherited unchanged from TioDBBuilderSchemaFieldBase.
  /// </summary>
  TioDBBuilderSchemaFieldClassInfo = class(TioDBBuilderSchemaFieldBase)
  private
    FConnectionDefName: String;  // Required for SqlDataConverter to apply database-specific normalization
  protected
    function GetFieldCustomType: string; override;
    function GetFieldDefault: TValue; override;
    function GetFieldLength: integer; override;
    function GetFieldName: String; override;
    function GetFieldNotNull: Boolean; override;
    function GetFieldPrecision: integer; override;
    function GetFieldScale: integer; override;
    function GetFieldSubtype: string; override;
    function GetFieldType: TioMetadataFieldType; override;
    function GetFieldUnicode: boolean; override;
    function GetPrimaryKey: Boolean; override;
    function GetSqlFieldName: String; override;
  public
    constructor Create(const AConnectionDefName: String);
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

function TioDBBuilderSchemaFieldClassInfo.GetFieldCustomType: string;
begin
  Result := '';
end;

function TioDBBuilderSchemaFieldClassInfo.GetFieldDefault: TValue;
begin
  Result := nil;
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

function TioDBBuilderSchemaFieldClassInfo.GetPrimaryKey: Boolean;
begin
  Result := False;
end;

// Returns field name with case normalization AND database-specific delimiters.
// Example: "ioClassInfo" for SQLite, "IOCLASSINFO" for Firebird, [ioClassInfo] for MS SQL Server
function TioDBBuilderSchemaFieldClassInfo.GetSqlFieldName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName)
    .NormalizeSqlIdentifier(IO_TRUECLASS_FIELDNAME, True);
end;

end.
