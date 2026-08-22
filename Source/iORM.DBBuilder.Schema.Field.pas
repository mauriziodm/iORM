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
  ///  A field node of either branch of the schema diff, or the synthetic TrueClass/ClassInfo
  ///  discriminator column. One class, one shape, three constructors: CreateMapped populates it from a
  ///  mapped entity property at schema-build time, CreatePhysical from the DB catalog at introspect
  ///  time, CreateClassInfo synthesizes the fixed TrueClass column. Every value getter (FieldName,
  ///  FieldType, FieldLength, ...) is frozen to a plain value at construction - CreateMapped reads
  ///  AContextProperty's metadata once and stores it, so nothing outside this unit ever reaches into the
  ///  live ORM property.
  ///
  ///  FieldTypeRaw/FieldDefaultRaw are the one exception: they are the field rendering ITSELF through
  ///  the SqlGenerator (the (1) comparison basis Compare_Field needs), which is self-referential and so
  ///  cannot happen inside CreateMapped/CreateClassInfo (calling a method that takes Self as an interface
  ///  parameter from inside a constructor, before any interface variable holds a stable reference,
  ///  is a classic refcount-to-zero/premature-destruction trap). SetFieldTypeRaw/SetFieldDefaultRaw are
  ///  plain public methods (deliberately NOT on IioDBBuilderSchemaField) that only the Factory calls,
  ///  immediately after construction, once the new instance is already held by a stable interface
  ///  variable - see NewSchemaField_Mapped/NewSchemaField_ClassInfo. CreatePhysical needs no such dance:
  ///  its raw values come straight from the DB catalog, passed in as constructor arguments.
  /// </summary>
  TioDBBuilderSchemaField = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaField)
  private
    FAltered: TioDBBuilderFieldChanges;
    FFieldCustomType: String;
    FFieldDefault: TValue;
    FFieldDefaultRaw: String;
    FFieldLength: Integer;
    FFieldName: String;
    FFieldNotNull: Boolean;
    FFieldPrecision: Integer;
    FFieldScale: Integer;
    FFieldSubtype: String;
    FFieldType: TioMetadataFieldType;
    FFieldTypeRaw: String;
    FFieldUnicode: Boolean;
    FPrimaryKey: Boolean;
    FSqlFieldName: String;
    procedure AddAltered(const AAltered: TioDBBuilderFieldChange);
    function GetFieldCustomType: string;
    function GetFieldDefault: TValue;
    function GetFieldDefaultExists: Boolean;
    function GetFieldDefaultRaw: String;
    function GetFieldLength: integer;
    function GetFieldName: String;
    function GetFieldNotNull: Boolean;
    function GetFieldPrecision: integer;
    function GetFieldScale: integer;
    function GetFieldSubtype: string;
    function GetFieldType: TioMetadataFieldType;
    function GetFieldTypeRaw: String;
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
  protected
  public
    // Synthetic TrueClass/ClassInfo discriminator column (single-table inheritance). Fixed shape
    // (always VARCHAR, NOT NULL, no default) - see IO_TRUECLASS_FIELDNAME/FIELDLENGTH.
    constructor CreateClassInfo(const AConnectionDefName: String);
    // Mapped branch: built from a mapped entity property at schema-build time.
    constructor CreateMapped(const AContextProperty: IioProperty);
    // Physical branch: built from the DB catalog at introspect time. AFieldName is normalized/quoted
    // per the connection's dialect (so it compares like-for-like with the Mapped side); AFieldTypeRaw/
    // AFieldDefaultRaw are the raw catalog strings, stored as-is.
    constructor CreatePhysical(const AConnectionDefName, AFieldName, AFieldTypeRaw, AFieldDefaultRaw: String;
      const AFieldType: TioMetadataFieldType; const AFieldLength, AFieldPrecision, AFieldScale: Integer;
      const AFieldNotNull: Boolean; const AFieldDefault: TValue; const AFieldSubtype, AFieldCustomType: String;
      const AFieldUnicode, APrimaryKey: Boolean);
    // Factory-only (see the class doc comment): freezes the self-rendered raw default/type right after
    // construction, once the new instance is already held by a stable interface variable.
    procedure SetFieldDefaultRaw(const AValue: String);
    procedure SetFieldTypeRaw(const AValue: String);
  end;

implementation

uses
  iORM.CommonTypes, iORM.DB.Factory;

{ TioDBBuilderSchemaField }

procedure TioDBBuilderSchemaField.AddAltered(const AAltered: TioDBBuilderFieldChange);
begin
  Include(FAltered, AAltered);
end;

constructor TioDBBuilderSchemaField.CreateClassInfo(const AConnectionDefName: String);
begin
  inherited Create;
  FFieldCustomType := '';
  FFieldDefault := TValue.Empty;
  FFieldLength := IO_TRUECLASS_FIELDLENGTH;
  // Case normalization only (no delimiters). Example: ioClassInfo for SQLite, IOCLASSINFO for Firebird
  FFieldName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(IO_TRUECLASS_FIELDNAME, False);
  FFieldNotNull := True;
  FFieldPrecision := 0;
  FFieldScale := 0;
  FFieldSubtype := '';
  FFieldType := ioMdVarchar;
  FFieldUnicode := True;
  FPrimaryKey := False;
  // Case normalization + database-specific delimiters. Example: "ioClassInfo" for SQLite, "IOCLASSINFO"
  // for Firebird, [ioClassInfo] for MS SQL Server
  FSqlFieldName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(IO_TRUECLASS_FIELDNAME, True);
  // FieldTypeRaw/FieldDefaultRaw: set by the Factory right after construction - see the class doc comment.
end;

constructor TioDBBuilderSchemaField.CreateMapped(const AContextProperty: IioProperty);
begin
  inherited Create;
  FFieldCustomType := AContextProperty.GetMetadata_CustomFieldType;
  FFieldDefault := AContextProperty.GetMetadata_Default;
  FFieldLength := AContextProperty.GetMetadata_FieldLength;
  FFieldName := AContextProperty.GetSqlFieldName(False);  // Case normalized, no delimiters
  FFieldNotNull := AContextProperty.GetMetadata_FieldNotNull;
  FFieldPrecision := AContextProperty.GetMetadata_FieldPrecision;
  FFieldScale := AContextProperty.GetMetadata_FieldScale;
  FFieldSubtype := AContextProperty.GetMetadata_FieldSubtype;
  FFieldType := AContextProperty.GetMetadata_FieldType;
  FFieldUnicode := AContextProperty.GetMetadata_FieldUnicode;
  FPrimaryKey := (AContextProperty.PropertyRole = prObjID);
  FSqlFieldName := AContextProperty.GetSqlFieldName(True);  // Case normalized + delimiters
  // FieldTypeRaw/FieldDefaultRaw: set by the Factory right after construction - see the class doc comment.
end;

constructor TioDBBuilderSchemaField.CreatePhysical(const AConnectionDefName, AFieldName, AFieldTypeRaw, AFieldDefaultRaw: String;
  const AFieldType: TioMetadataFieldType; const AFieldLength, AFieldPrecision, AFieldScale: Integer;
  const AFieldNotNull: Boolean; const AFieldDefault: TValue; const AFieldSubtype, AFieldCustomType: String;
  const AFieldUnicode, APrimaryKey: Boolean);
begin
  inherited Create;
  FFieldCustomType := AFieldCustomType;
  FFieldDefault := AFieldDefault;
  FFieldDefaultRaw := AFieldDefaultRaw;
  FFieldLength := AFieldLength;
  FFieldName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AFieldName, False);  // Case normalized, no delimiters (compares like-for-like with the Mapped side)
  FFieldNotNull := AFieldNotNull;
  FFieldPrecision := AFieldPrecision;
  FFieldScale := AFieldScale;
  FFieldSubtype := AFieldSubtype;
  FFieldType := AFieldType;
  FFieldTypeRaw := AFieldTypeRaw;
  FFieldUnicode := AFieldUnicode;
  FPrimaryKey := APrimaryKey;
  FSqlFieldName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AFieldName, True);  // Case normalized + database-specific delimiters
end;

function TioDBBuilderSchemaField.GetFieldCustomType: string;
begin
  Result := FFieldCustomType;
end;

function TioDBBuilderSchemaField.GetFieldDefault: TValue;
begin
  Result := FFieldDefault;
end;

function TioDBBuilderSchemaField.GetFieldDefaultExists: Boolean;
begin
  Result := not GetFieldDefault.IsEmpty;
end;

function TioDBBuilderSchemaField.GetFieldDefaultRaw: String;
begin
  Result := FFieldDefaultRaw;
end;

function TioDBBuilderSchemaField.GetFieldLength: integer;
begin
  Result := FFieldLength;
end;

function TioDBBuilderSchemaField.GetFieldName: String;
begin
  Result := FFieldName;
end;

function TioDBBuilderSchemaField.GetFieldNotNull: Boolean;
begin
  Result := FFieldNotNull;
end;

function TioDBBuilderSchemaField.GetFieldPrecision: integer;
begin
  Result := FFieldPrecision;
end;

function TioDBBuilderSchemaField.GetFieldScale: integer;
begin
  Result := FFieldScale;
end;

function TioDBBuilderSchemaField.GetFieldSubtype: string;
begin
  Result := FFieldSubtype;
end;

function TioDBBuilderSchemaField.GetFieldType: TioMetadataFieldType;
begin
  Result := FFieldType;
end;

function TioDBBuilderSchemaField.GetFieldTypeRaw: String;
begin
  Result := FFieldTypeRaw;
end;

function TioDBBuilderSchemaField.GetFieldUnicode: boolean;
begin
  Result := FFieldUnicode;
end;

function TioDBBuilderSchemaField.GetIsAltered: Boolean;
begin
  Result := FAltered <> [];
end;

function TioDBBuilderSchemaField.GetIsFieldDefaultAltered: Boolean;
begin
  Result := fcDefault in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldLengthAltered: Boolean;
begin
  Result := (fcLengthIncreased in FAltered) or (fcLengthDecreased in FAltered);
end;

function TioDBBuilderSchemaField.GetIsFieldLengthDecreased: Boolean;
begin
  Result := fcLengthDecreased in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldLengthIncreased: Boolean;
begin
  Result := fcLengthIncreased in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldNotNullAltered: Boolean;
begin
  Result := fcNotNull in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldPrecisionAltered: Boolean;
begin
  Result := (fcPrecisionIncreased in FAltered) or (fcPrecisionDecreased in FAltered);
end;

function TioDBBuilderSchemaField.GetIsFieldPrecisionDecreased: Boolean;
begin
  Result := fcPrecisionDecreased in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldPrecisionIncreased: Boolean;
begin
  Result := fcPrecisionIncreased in FAltered;
end;

function TioDBBuilderSchemaField.GetIsFieldTypeAltered: Boolean;
begin
  Result := fcType in FAltered;
end;

function TioDBBuilderSchemaField.GetPrimaryKey: Boolean;
begin
  Result := FPrimaryKey;
end;

function TioDBBuilderSchemaField.GetSqlFieldName: String;
begin
  Result := FSqlFieldName;
end;

procedure TioDBBuilderSchemaField.SetFieldDefaultRaw(const AValue: String);
begin
  FFieldDefaultRaw := AValue;
end;

procedure TioDBBuilderSchemaField.SetFieldTypeRaw(const AValue: String);
begin
  FFieldTypeRaw := AValue;
end;

end.
