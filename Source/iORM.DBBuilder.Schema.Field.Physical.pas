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
unit iORM.DBBuilder.Schema.Field.Physical;

interface

uses
  System.Rtti, iORM.Context.Properties.Interfaces, iORM.DBBuilder.Schema.Field;

type

  /// <summary>
  ///  Schema field of the Physical branch: NOT backed by a mapped property - every value getter
  ///  returns a value stored at construction, read from the live database catalog by the Introspector.
  ///  The field name is normalized/quoted per the connection's dialect (so it compares like-for-like
  ///  with the Mapped side). Status/altered tracking is inherited from TioDBBuilderSchemaFieldBase.
  /// </summary>
  TioDBBuilderSchemaFieldPhysical = class(TioDBBuilderSchemaFieldBase)
  private
    FConnectionDefName: String;  // Required for SqlDataConverter to apply database-specific normalization
    FFieldCustomType: String;
    FFieldDefault: TValue;
    FFieldDefaultRaw: String;  // Raw default expression as reported by the DB catalog - the (1) default-comparison basis
    FFieldLength: Integer;
    FFieldName: String;
    FFieldNotNull: Boolean;
    FFieldPrecision: Integer;
    FFieldScale: Integer;
    FFieldSubtype: String;
    FFieldType: TioMetadataFieldType;
    FFieldTypeRaw: String;  // Raw type string as reported by the DB catalog (e.g. 'VARCHAR', 'INTEGER') - the (1) comparison basis
    FFieldUnicode: Boolean;
    FPrimaryKey: Boolean;
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
    constructor Create(const AConnectionDefName, AFieldName, AFieldTypeRaw, AFieldDefaultRaw: String;
      const AFieldType: TioMetadataFieldType; const AFieldLength, AFieldPrecision, AFieldScale: Integer;
      const AFieldNotNull: Boolean; const AFieldDefault: TValue; const AFieldSubtype, AFieldCustomType: String;
      const AFieldUnicode, APrimaryKey: Boolean);

    // Raw type string / raw default expression as read from the DB catalog. With reconciliation approach (1)
    // these are the basis for the per-dialect field type/default comparison (the Mapped side renders itself
    // to a dialect string and compares against them), so they are exposed even though they have no
    // Mapped-side counterpart. Compare_Field reaches them by casting to this concrete class (tactical: it
    // disappears when the node model is unified - see the schema-node-model-revisit note).
    property FieldDefaultRaw: String read FFieldDefaultRaw;
    property FieldTypeRaw: String read FFieldTypeRaw;
  end;

implementation

uses
  iORM.DB.Factory;

{ TioDBBuilderSchemaFieldPhysical }

constructor TioDBBuilderSchemaFieldPhysical.Create(const AConnectionDefName, AFieldName, AFieldTypeRaw, AFieldDefaultRaw: String;
  const AFieldType: TioMetadataFieldType; const AFieldLength, AFieldPrecision, AFieldScale: Integer;
  const AFieldNotNull: Boolean; const AFieldDefault: TValue; const AFieldSubtype, AFieldCustomType: String;
  const AFieldUnicode, APrimaryKey: Boolean);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
  FFieldName := AFieldName;
  FFieldTypeRaw := AFieldTypeRaw;
  FFieldDefaultRaw := AFieldDefaultRaw;
  FFieldType := AFieldType;
  FFieldLength := AFieldLength;
  FFieldPrecision := AFieldPrecision;
  FFieldScale := AFieldScale;
  FFieldNotNull := AFieldNotNull;
  FFieldDefault := AFieldDefault;
  FFieldSubtype := AFieldSubtype;
  FFieldCustomType := AFieldCustomType;
  FFieldUnicode := AFieldUnicode;
  FPrimaryKey := APrimaryKey;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldCustomType: string;
begin
  Result := FFieldCustomType;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldDefault: TValue;
begin
  Result := FFieldDefault;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldLength: integer;
begin
  Result := FFieldLength;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldName: String;
begin
  // Case normalized, no delimiters (compares like-for-like with the Mapped side)
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FFieldName, False);
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldNotNull: Boolean;
begin
  Result := FFieldNotNull;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldPrecision: integer;
begin
  Result := FFieldPrecision;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldScale: integer;
begin
  Result := FFieldScale;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldSubtype: string;
begin
  Result := FFieldSubtype;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldType: TioMetadataFieldType;
begin
  Result := FFieldType;
end;

function TioDBBuilderSchemaFieldPhysical.GetFieldUnicode: boolean;
begin
  Result := FFieldUnicode;
end;

function TioDBBuilderSchemaFieldPhysical.GetPrimaryKey: Boolean;
begin
  Result := FPrimaryKey;
end;

function TioDBBuilderSchemaFieldPhysical.GetSqlFieldName: String;
begin
  // Case normalized + database-specific delimiters
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FFieldName, True);
end;

end.
