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
  iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces, iORM.DBBuilder.Schema.Base, System.Rtti;

type

  /// <summary>
  ///  Abstract base for every IioDBBuilderSchemaField implementation. Owns the parts that are
  ///  identical across all field kinds - the change Status (monotonic) and the "altered" tracking -
  ///  and leaves the value-source getters (GetFieldName, GetFieldType, GetFieldLength, ...) abstract,
  ///  to be provided by each concrete descendant (a mapped-property-backed field, the synthetic
  ///  TrueClass/ClassInfo column, etc.).
  /// </summary>
  TioDBBuilderSchemaFieldBase = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaField)
  protected
    FAltered: TioDBBuilderFieldAlter;
    // --- Value-source getters: abstract, implemented by each concrete field kind ---
    function GetFieldCustomType: string; virtual; abstract;
    function GetFieldDefault: TValue; virtual; abstract;
    function GetFieldLength: integer; virtual; abstract;
    function GetFieldName: String; virtual; abstract;
    function GetFieldNotNull: Boolean; virtual; abstract;
    function GetFieldPrecision: integer; virtual; abstract;
    function GetFieldScale: integer; virtual; abstract;
    function GetFieldSubtype: string; virtual; abstract;
    function GetFieldType: TioMetadataFieldType; virtual; abstract;
    function GetFieldUnicode: boolean; virtual; abstract;
    function GetPrimaryKey: Boolean; virtual; abstract;
    function GetSqlFieldName: String; virtual; abstract;
    // --- Shared implementation (Status + altered tracking) ---
    function GetFieldDefaultExists: Boolean;
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
  public
    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);

    property FieldCustomType: string read GetFieldCustomType;
    property FieldDefault: TValue read GetFieldDefault;
    property FieldDefaultExists: Boolean read GetFieldDefaultExists;
    property FieldLength: integer read GetFieldLength;
    property FieldName: String read GetFieldName;
    property FieldNotNull: boolean read GetFieldNotNull;
    property FieldPrecision: integer read GetFieldPrecision;
    property FieldScale: integer read GetFieldScale;
    property FieldSubtype: string read GetFieldSubtype;
    property FieldType: TioMetadataFieldType read GetFieldType;
    property FieldUnicode: boolean read GetFieldUnicode;
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
    property PrimaryKey: boolean read GetPrimaryKey;
    property SqlFieldName: String read GetSqlFieldName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  /// <summary>
  ///  Schema field backed by a mapped entity property (IioProperty): every value getter reads its
  ///  metadata from the property.
  /// </summary>
  TioDBBuilderSchemaField = class(TioDBBuilderSchemaFieldBase)
  private
    FContextProperty: IioProperty;
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
    constructor Create(const AContextProperty: IioProperty);
  end;

implementation

uses
  iORM.CommonTypes;

{ TioDBBuilderSchemaFieldBase }

procedure TioDBBuilderSchemaFieldBase.AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
begin
  Include(FAltered, AAltered);
end;

function TioDBBuilderSchemaFieldBase.GetFieldDefaultExists: Boolean;
begin
  Result := not GetFieldDefault.IsEmpty;
end;

function TioDBBuilderSchemaFieldBase.GetIsAltered: Boolean;
begin
  Result := FAltered <> [];
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldDefaultAltered: Boolean;
begin
  Result := alFieldDefault in FAltered;
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldLengthAltered: Boolean;
begin
  Result := (alFieldLengthIncreased in FAltered) or (alFieldLengthDecreased in FAltered);
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldLengthDecreased: Boolean;
begin
  Result := alFieldLengthDecreased in FAltered;
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldLengthIncreased: Boolean;
begin
  Result := alFieldLengthIncreased in FAltered;
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldNotNullAltered: Boolean;
begin
  Result := alFieldNotNull in FAltered;
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldPrecisionAltered: Boolean;
begin
  Result := (alFieldPrecisionIncreased in FAltered) or (alFieldPrecisionDecreased in FAltered);
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldPrecisionDecreased: Boolean;
begin
  Result := alFieldPrecisionDecreased in FAltered;
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldPrecisionIncreased: Boolean;
begin
  Result := alFieldPrecisionIncreased in FAltered;
end;

function TioDBBuilderSchemaFieldBase.GetIsFieldTypeAltered: Boolean;
begin
  Result := alFieldType in FAltered;
end;

{ TioDBBuilderSchemaField }

constructor TioDBBuilderSchemaField.Create(const AContextProperty: IioProperty);
begin
  inherited Create;
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

function TioDBBuilderSchemaField.GetFieldLength: integer;
begin
  Result := FContextProperty.GetMetadata_FieldLength;
end;

function TioDBBuilderSchemaField.GetFieldName: String;
begin
  Result := FContextProperty.GetSqlFieldName(False);  // Case normalized, no delimiters
end;

function TioDBBuilderSchemaField.GetFieldNotNull: Boolean;
begin
  Result := FContextProperty.GetMetadata_FieldNotNull;
end;

function TioDBBuilderSchemaField.GetFieldPrecision: integer;
begin
  Result := FContextProperty.GetMetadata_FieldPrecision;
end;

function TioDBBuilderSchemaField.GetFieldScale: integer;
begin
  Result := FContextProperty.GetMetadata_FieldScale;
end;

function TioDBBuilderSchemaField.GetFieldSubtype: string;
begin
  Result := FContextProperty.GetMetadata_FieldSubtype;
end;

function TioDBBuilderSchemaField.GetFieldType: TioMetadataFieldType;
begin
  Result := FContextProperty.GetMetadata_FieldType;
end;

function TioDBBuilderSchemaField.GetFieldUnicode: boolean;
begin
  Result := FContextProperty.GetMetadata_FieldUnicode;
end;

function TioDBBuilderSchemaField.GetPrimaryKey: Boolean;
begin
  Result := (FContextProperty.PropertyRole = prObjID);
end;

function TioDBBuilderSchemaField.GetSqlFieldName: String;
begin
  Result := FContextProperty.GetSqlFieldName(True);   // Case normalized + delimiters
end;

end.
