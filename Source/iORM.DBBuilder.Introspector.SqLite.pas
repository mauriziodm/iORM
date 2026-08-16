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
unit iORM.DBBuilder.Introspector.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Introspector.Base;

type

  /// <summary>
  ///  SQLite catalog reads via PRAGMA / sqlite_master. Notes on SQLite specifics: field length/
  ///  precision/scale are meaningless (type affinity), so only the raw type string is captured; indexes
  ///  carry their UNIQUE flag and orientation inside the CREATE INDEX text in sqlite_master.sql;
  ///  foreign keys are unnamed, so they are matched (and keyed) by dependent field.
  /// </summary>
  TioDBBuilderIntrospectorSqLite = class(TioDBBuilderIntrospectorBase)
  protected
    procedure ReadFields(const ATable: IioDBBuilderSchemaTable; const ATableName: String); override;
    procedure ReadForeignKeys(const ATable: IioDBBuilderSchemaTable; const ATableName: String); override;
    procedure ReadIndexes(const ATable: IioDBBuilderSchemaTable; const ATableName: String); override;
  end;

implementation

uses
  System.Rtti, System.SysUtils, iORM.CommonTypes, iORM.DB.Interfaces,
  iORM.DBBuilder.Schema.Field.Physical, iORM.DBBuilder.Schema.FK.Physical, iORM.DBBuilder.Schema.Index;

{ TioDBBuilderIntrospectorSqLite }

procedure TioDBBuilderIntrospectorSqLite.ReadFields(const ATable: IioDBBuilderSchemaTable; const ATableName: String);
var
  LQuery: IioQuery;
  LFieldTypeRaw: String;
begin
  // PRAGMA table_info: [name, type, notnull, dflt_value, pk] (plus cid).
  LQuery := GetRawQuery(FContext.SqlGenerator.BuildSQL_FieldList(ATableName));
  while not LQuery.Eof do
  begin
    LFieldTypeRaw := LQuery.Fields.FieldByName('type').AsString;
    ATable.AddField(TioDBBuilderSchemaFieldPhysical.Create(
      FContext.ConnectionDefName,
      LQuery.Fields.FieldByName('name').AsString,
      LFieldTypeRaw,
      '',  // default (raw): SQLite does not reconcile the field default
      RawTypeToMetadataFieldType(LFieldTypeRaw),
      0, 0, 0,  // length/precision/scale: N/A for SQLite (type affinity)
      LQuery.Fields.FieldByName('notnull').AsInteger <> 0,
      TValue.Empty,  // default: not part of the field comparison
      '', '',        // subtype, custom type: N/A for SQLite
      False,         // unicode: N/A for SQLite
      LQuery.Fields.FieldByName('pk').AsInteger <> 0));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderIntrospectorSqLite.ReadForeignKeys(const ATable: IioDBBuilderSchemaTable; const ATableName: String);
var
  LQuery: IioQuery;
  LDependentField: String;
begin
  // PRAGMA foreign_key_list: [id, seq, table, from, to, on_update, on_delete, match]. SQLite FKs are
  // unnamed; a column carries at most one FK, so the dependent field ('from') is a safe collection key.
  LQuery := GetRawQuery(FContext.SqlGenerator.BuildSQL_FKList(ATableName));
  while not LQuery.Eof do
  begin
    LDependentField := LQuery.Fields.FieldByName('from').AsString;
    ATable.ForeignKeys.Add(LDependentField, TioDBBuilderSchemaFKPhysical.Create(
      FContext.ConnectionDefName,
      '',  // Name: SQLite foreign keys have no constraint name
      ATableName,
      LDependentField,
      LQuery.Fields.FieldByName('table').AsString,
      LQuery.Fields.FieldByName('to').AsString,
      RawToFKAction(LQuery.Fields.FieldByName('on_delete').AsString),
      RawToFKAction(LQuery.Fields.FieldByName('on_update').AsString)));
    LQuery.Next;
  end;
end;

procedure TioDBBuilderIntrospectorSqLite.ReadIndexes(const ATable: IioDBBuilderSchemaTable; const ATableName: String);
var
  LQueryList, LQueryDetails: IioQuery;
  LIndexName, LSqlDef, LFieldList: String;
  LUnique: Boolean;
  LOrientation: TioIndexOrientation;
begin
  // sqlite_master gives the CREATE INDEX text (sql IS NOT NULL excludes constraint-backed indexes);
  // UNIQUE and orientation are parsed from it, the field list from PRAGMA index_info.
  LQueryList := GetRawQuery(FContext.SqlGenerator.BuildSQL_IndexList(ATableName));
  while not LQueryList.Eof do
  begin
    LIndexName := LQueryList.Fields.FieldByName('name').AsString;
    LSqlDef := LQueryList.Fields.FieldByName('sql').AsString.ToUpper;
    LUnique := LSqlDef.Contains('UNIQUE INDEX');
    if LSqlDef.Contains(' DESC') then
      LOrientation := ioDescending
    else
      LOrientation := ioAscending;

    // PRAGMA index_info: field list ordered by position in the index.
    LFieldList := '';
    LQueryDetails := GetRawQuery(FContext.SqlGenerator.BuildSQL_IndexDetails(LIndexName));
    while not LQueryDetails.Eof do
    begin
      if not LFieldList.IsEmpty then
        LFieldList := LFieldList + ',';
      LFieldList := LFieldList + LQueryDetails.Fields.FieldByName('name').AsString;
      LQueryDetails.Next;
    end;

    ATable.Indexes.Add(LIndexName, TioDBBuilderSchemaIndex.Create(LIndexName, LFieldList, LUnique, LOrientation,
      FContext.ConnectionDefName));
    LQueryList.Next;
  end;
end;

end.
