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
unit iORM.DBBuilder.Introspector.Firebird;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Introspector.Base;

type

  /// <summary>
  ///  Firebird catalog reads via the RDB$ system tables. Notes on Firebird specifics: BuildSQL_FieldList
  ///  already normalizes RDB$FIELD_TYPE into iORM-flavoured tokens (VARCHAR/INTEGER/...) and exposes
  ///  length/precision/scale/subtype; standalone indexes (BuildSQL_IndexList already excludes the ones
  ///  backing a constraint) carry unique/orientation flags; foreign keys are matched (and keyed) by their
  ///  deterministic constraint name - the hash encodes the structural properties - so BuildSQL_FKList
  ///  (name + actions) is sufficient and the dependent/reference columns are left blank.
  /// </summary>
  TioDBBuilderIntrospectorFirebird = class(TioDBBuilderIntrospectorBase)
  protected
    procedure ReadFields(const ATable: IioDBBuilderSchemaTable; const ATableName: String); override;
    procedure ReadForeignKeys(const ATable: IioDBBuilderSchemaTable; const ATableName: String); override;
    procedure ReadIndexes(const ATable: IioDBBuilderSchemaTable; const ATableName: String); override;
  end;

implementation

uses
  System.Rtti, System.SysUtils, iORM.CommonTypes, iORM.DB.Interfaces,
  iORM.DBBuilder.Schema.Field.Physical, iORM.DBBuilder.Schema.FK.Physical, iORM.DBBuilder.Schema.Index;

{ TioDBBuilderIntrospectorFirebird }

procedure TioDBBuilderIntrospectorFirebird.ReadFields(const ATable: IioDBBuilderSchemaTable; const ATableName: String);
var
  LQuery: IioQuery;
  LFieldTypeRaw: String;
begin
  // BuildSQL_FieldList (with empty field-name filter) returns every field with aliased columns:
  // field_name, field_not_null, field_length, field_precision, field_scale, field_type, field_subtype,
  // field_default. .Trim throughout because Firebird right-pads CHAR columns.
  LQuery := GetRawQuery(FContext.SqlGenerator.BuildSQL_FieldList(ATableName));
  while not LQuery.Eof do
  begin
    LFieldTypeRaw := LQuery.Fields.FieldByName('field_type').AsString.Trim;
    ATable.AddField(TioDBBuilderSchemaFieldPhysical.Create(
      FContext.ConnectionDefName,
      LQuery.Fields.FieldByName('field_name').AsString.Trim,
      LFieldTypeRaw,
      RawTypeToMetadataFieldType(LFieldTypeRaw),
      LQuery.Fields.FieldByName('field_length').AsInteger,
      LQuery.Fields.FieldByName('field_precision').AsInteger,
      LQuery.Fields.FieldByName('field_scale').AsInteger,
      LQuery.Fields.FieldByName('field_not_null').AsInteger = 1,
      TValue.Empty,  // default: not part of the field comparison
      LQuery.Fields.FieldByName('field_subtype').AsString.Trim,
      '',            // custom type: not read from the catalog
      False,         // unicode: not read from the catalog
      False));       // primary key: not exposed by this query (constraint-level, not needed for field compare)
    LQuery.Next;
  end;
end;

procedure TioDBBuilderIntrospectorFirebird.ReadForeignKeys(const ATable: IioDBBuilderSchemaTable; const ATableName: String);
var
  LQuery: IioQuery;
  LName: String;
begin
  // BuildSQL_FKList: constraint_name, on_update, on_delete plus the structural columns dependent_field,
  // reference_table, reference_field. Both the name AND the structural fields are populated so the
  // PlanBuilder can match this FK generically (by dependent field + reference table, the same key SQLite
  // uses) without a per-dialect matcher.
  LQuery := GetRawQuery(FContext.SqlGenerator.BuildSQL_FKList(ATableName));
  while not LQuery.Eof do
  begin
    LName := LQuery.Fields.FieldByName('constraint_name').AsString.Trim;
    ATable.ForeignKeys.Add(LName, TioDBBuilderSchemaFKPhysical.Create(
      FContext.ConnectionDefName,
      LName,
      ATableName,
      LQuery.Fields.FieldByName('dependent_field').AsString.Trim,
      LQuery.Fields.FieldByName('reference_table').AsString.Trim,
      LQuery.Fields.FieldByName('reference_field').AsString.Trim,
      RawToFKAction(LQuery.Fields.FieldByName('on_delete').AsString),
      RawToFKAction(LQuery.Fields.FieldByName('on_update').AsString)));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderIntrospectorFirebird.ReadIndexes(const ATable: IioDBBuilderSchemaTable; const ATableName: String);
var
  LQueryList, LQueryDetails: IioQuery;
  LIndexName, LFieldList: String;
  LUnique: Boolean;
  LOrientation: TioIndexOrientation;
begin
  // BuildSQL_IndexList: RDB$INDEX_NAME, RDB$UNIQUE_FLAG, RDB$INDEX_TYPE (0/NULL=ASC, 1=DESC). It already
  // excludes constraint-backed indexes. The field list comes from BuildSQL_IndexDetails (RDB$FIELD_NAME
  // ordered by position).
  LQueryList := GetRawQuery(FContext.SqlGenerator.BuildSQL_IndexList(ATableName));
  while not LQueryList.Eof do
  begin
    LIndexName := LQueryList.Fields.FieldByName('RDB$INDEX_NAME').AsString.Trim;
    LUnique := LQueryList.Fields.FieldByName('RDB$UNIQUE_FLAG').AsInteger = 1;
    if LQueryList.Fields.FieldByName('RDB$INDEX_TYPE').AsInteger = 1 then
      LOrientation := ioDescending
    else
      LOrientation := ioAscending;

    LFieldList := '';
    LQueryDetails := GetRawQuery(FContext.SqlGenerator.BuildSQL_IndexDetails(LIndexName));
    while not LQueryDetails.Eof do
    begin
      if not LFieldList.IsEmpty then
        LFieldList := LFieldList + ',';
      LFieldList := LFieldList + LQueryDetails.Fields.FieldByName('RDB$FIELD_NAME').AsString.Trim;
      LQueryDetails.Next;
    end;

    ATable.Indexes.Add(LIndexName, TioDBBuilderSchemaIndex.Create(LIndexName, LFieldList, LUnique, LOrientation,
      FContext.ConnectionDefName));
    LQueryList.Next;
  end;
end;

end.
