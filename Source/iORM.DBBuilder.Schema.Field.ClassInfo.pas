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

  TioDBBuilderSchemaFieldClassInfo = class(TInterfacedObject, IioDBBuilderSchemaField)
  private
    FStatus: TioDBBuilderStatus;
    FAltered: TioDBBuilderFieldAlter;
    function GetFieldCustomType: string;
    function GetFieldDefault: TValue;
    function GetFieldDefaultExists: Boolean;
    function GetFieldLength: integer;
    function GetFieldPrecision: integer;
    function GetFieldScale: integer;
    function GetFieldSubType: string;
    function GetFieldType: TioMetadataFieldType;
    function GetFieldUnicode: boolean;
    function GetFieldNotNull: Boolean;
    function GetFieldName{(const AClearDelimiters: Boolean = False)}: String;
    function GetPrimaryKey: Boolean;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
    function Altered: TioDBBuilderFieldAlter;

    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  iORM.CommonTypes;

{ TioDBBuilderSchemaFieldClassInfo }

procedure TioDBBuilderSchemaFieldClassInfo.AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
begin
  Include(FAltered, AAltered);
end;

function TioDBBuilderSchemaFieldClassInfo.Altered: TioDBBuilderFieldAlter;
begin
  Result := FAltered;
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

function TioDBBuilderSchemaFieldClassInfo.GetFieldName{(const AClearDelimiters: Boolean = False)}: String;
begin
  Result := IO_TRUECLASS_FIELDNAME;
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

function TioDBBuilderSchemaFieldClassInfo.GetFieldSubType: string;
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

end.
