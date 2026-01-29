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
unit iORM.DBBuilder.Schema.Field;

interface

uses
  iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces, System.Rtti;

type

  TioDBBuilderSchemaField = class(TInterfacedObject, IioDBBuilderSchemaField)
  private
    FContextProperty: IioProperty;
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
    function GetFieldName: String;
    function GetSqlFieldName: String;
    function GetPrimaryKey: Boolean;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    // Alteration status getters
    function GetIsAltered: Boolean;
    function GetIsFieldTypeAltered: Boolean;
    function GetIsFieldDefaultAltered: Boolean;
    function GetIsFieldNotNullAltered: Boolean;
    function GetIsFieldLengthAltered: Boolean;
    function GetIsFieldLengthIncreased: Boolean;
    function GetIsFieldLengthDecreased: Boolean;
    function GetIsFieldPrecisionAltered: Boolean;
    function GetIsFieldPrecisionIncreased: Boolean;
    function GetIsFieldPrecisionDecreased: Boolean;
  public
    constructor Create(const AContextProperty: IioProperty);
    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);

    property FieldCustomType: string read GetFieldCustomType;
    property FieldDefault: TValue read GetFieldDefault;
    property FieldDefaultExists: Boolean read GetFieldDefaultExists;
    property FieldLength: integer read GetFieldLength;
    property FieldName: String read GetFieldName;
    property SqlFieldName: String read GetSqlFieldName;
    property FieldPrecision: integer read GetFieldPrecision;
    property FieldScale: integer read GetFieldScale;
    property FieldSubType: string read GetFieldSubType;
    property FieldType: TioMetadataFieldType read GetFieldType;
    property FieldUnicode: boolean read GetFieldUnicode;
    property FieldNotNull: boolean read GetFieldNotNull;
    property PrimaryKey: boolean read GetPrimaryKey;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    // Alteration status properties
    property IsAltered: Boolean read GetIsAltered;
    property IsFieldTypeAltered: Boolean read GetIsFieldTypeAltered;
    property IsFieldDefaultAltered: Boolean read GetIsFieldDefaultAltered;
    property IsFieldNotNullAltered: Boolean read GetIsFieldNotNullAltered;
    property IsFieldLengthAltered: Boolean read GetIsFieldLengthAltered;
    property IsFieldLengthIncreased: Boolean read GetIsFieldLengthIncreased;
    property IsFieldLengthDecreased: Boolean read GetIsFieldLengthDecreased;
    property IsFieldPrecisionAltered: Boolean read GetIsFieldPrecisionAltered;
    property IsFieldPrecisionIncreased: Boolean read GetIsFieldPrecisionIncreased;
    property IsFieldPrecisionDecreased: Boolean read GetIsFieldPrecisionDecreased;
  end;

implementation

uses
  iORM.CommonTypes;

{ TioDBBuilderSchemaField }

procedure TioDBBuilderSchemaField.AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
begin
  Include(FAltered, AAltered);
end;

constructor TioDBBuilderSchemaField.Create(const AContextProperty: IioProperty);
begin
  FStatus := stClean;
  FContextProperty := AContextProperty;
end;

function TioDBBuilderSchemaField.GetFieldCustomType: string;
begin
  Result := FContextProperty.GetMetadata_CustomFieldType;
end;

function TioDBBuilderSchemaField.GetFieldDefault: TValue;
begin
  Result := FContextProperty.GetMetadata_Default;
end;

function TioDBBuilderSchemaField.GetFieldDefaultExists: Boolean;
begin
  Result := not GetFieldDefault.IsEmpty;
end;

function TioDBBuilderSchemaField.GetFieldLength: integer;
begin
  Result := FContextProperty.GetMetadata_FieldLength;
end;

function TioDBBuilderSchemaField.GetFieldName: String;
begin
  Result := FContextProperty.GetSqlFieldName(False);  // Case normalized, no delimiters
end;

function TioDBBuilderSchemaField.GetSqlFieldName: String;
begin
  Result := FContextProperty.GetSqlFieldName(True);   // Case normalized + delimiters
end;

function TioDBBuilderSchemaField.GetFieldPrecision: integer;
begin
  Result := FContextProperty.GetMetadata_FieldPrecision;
end;

function TioDBBuilderSchemaField.GetFieldScale: integer;
begin
  Result := FContextProperty.GetMetadata_FieldScale;
end;

function TioDBBuilderSchemaField.GetFieldSubType: string;
begin
  Result := FContextProperty.GetMetadata_FieldSubType;
end;

function TioDBBuilderSchemaField.GetFieldType: TioMetadataFieldType;
begin
  Result := FContextProperty.GetMetadata_FieldType;
end;

function TioDBBuilderSchemaField.GetFieldUnicode: boolean;
begin
  Result := FContextProperty.GetMetadata_FieldUnicode;
end;

function TioDBBuilderSchemaField.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchemaField.GetPrimaryKey: Boolean;
begin
  Result := (FContextProperty.PropertyRole = prObjID);
end;

function TioDBBuilderSchemaField.GetFieldNotNull: Boolean;
begin
  Result := FContextProperty.GetMetadata_FieldNotNull;
end;

procedure TioDBBuilderSchemaField.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

function TioDBBuilderSchemaField.GetIsAltered: Boolean;
begin
  Result := FAltered <> [];
end;

function TioDBBuilderSchemaField.GetIsFieldTypeAltered: Boolean;
begin
  Result := alFieldType in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldDefaultAltered: Boolean;
begin
  Result := alFieldDefault in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldNotNullAltered: Boolean;
begin
  Result := alFieldNotNull in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldLengthAltered: Boolean;
begin
  Result := (alFieldLengthIncreased in FAltered) or (alFieldLengthDecreased in FAltered);
end;

function TioDBBuilderSchemaField.GetIsFieldLengthIncreased: Boolean;
begin
  Result := alFieldLengthIncreased in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldLengthDecreased: Boolean;
begin
  Result := alFieldLengthDecreased in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldPrecisionAltered: Boolean;
begin
  Result := (alFieldPrecisionIncreased in FAltered) or (alFieldPrecisionDecreased in FAltered);
end;

function TioDBBuilderSchemaField.GetIsFieldPrecisionIncreased: Boolean;
begin
  Result := alFieldPrecisionIncreased in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldPrecisionDecreased: Boolean;
begin
  Result := alFieldPrecisionDecreased in FAltered;
end;

end.
