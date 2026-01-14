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
unit iORM.DBBuilder.SqlGenerator.SqLite;

interface

uses
  System.Rtti,

  iORM.DBBuilder.SqlGenerator.Base,
  iORM.DBBuilder.Interfaces,
  iORM.Attributes

  ;

type
  TioDBBuilderSqlGenSQLite = class(TioDBBuilderSqlGenBase)
  private
    function InternalCreateField(const AField: IioDBBuilderSchemaField): String;
  protected
    // Database
    procedure CreateDatabase; override;
    function DatabaseExists: Boolean; override;
    // Tables
    function BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildTableExistsSql(const ATableName: string): string; override;
    // Fields
    function BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string; override;
    function BuildAlterFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
    function TranslateFieldType(const AField: IioDBBuilderSchemaField; const AExcludeTypeAttributes: boolean): String; override;
    // Indexes
    function BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; override;
    function BuildSQL_IndexExistsByName(const AIndexName: string): string; override;
    function BuildSQL_IndexList(const ATableName: string = ''): string; override;
    function BuildSQL_IndexDetails(const AIndexName: string): string; override;
    // ForeignKeys
    function BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildSQL_FKExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildForeignKeyModifiedSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; override;
    function BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string; override;
    function BuildListAllForeignKeysSql: string; override;
    // PrimaryKey
    function BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string; override;
    // RecreateField
    function BuildRecreateFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  System.StrUtils,

  iORM.DB.Interfaces,
  iORM.DB.Factory,
  iORM.DB.ConnectionContainer,
  iORM.Context.Properties.Interfaces,
  iORM.Exceptions,
  iORM.CommonTypes,
  iORM.SqlTranslator,
  iORM.TextBuilder.Interfaces,
  iORM.DB.SqLite.SqlDataConverter

  ;

{ TioDBBuilderSqlGenSQLite }

procedure TioDBBuilderSqlGenSQLite.CreateDatabase;
begin
  // SQLite creates the database file automatically when a connection is opened
  TioDbFactory.Connection(ConnectionDefName);
end;

function TioDBBuilderSqlGenSQLite.DatabaseExists: Boolean;
begin
  Result := FileExists(TioConnectionManager.GetDatabaseFileName(ConnectionDefName));
end;

function TioDBBuilderSqlGenSQLite.BuildCreateFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
//  Result := Format('%s%s', [ACommaBefore, InternalCreateField(AField)]);
  Result := InternalCreateField(AField);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
var
  LIndexName, LFieldList, LUnique: String;
begin
  LIndexName := Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);
  LUnique := Translate_SchemaIndex_To_Unique(AIndex);  // Returns ' UNIQUE' or '' (with leading space if present)
  LFieldList := Translate_SchemaIndex_To_CommaSepListOfFieldNames(AIndex);

  // Note: LUnique already includes leading space when present
  Result := Format('CREATE%s INDEX IF NOT EXISTS %s ON %s (%s);', [LUnique, LIndexName, ATable.Name, LFieldList]);
end;

function TioDBBuilderSqlGenSQLite.BuildAlterFieldSql(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): string;
begin
  // Do nothing. Can be removed?
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildEndAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildEndCreateTableSql(ATable);
end;

function TioDBBuilderSqlGenSQLite.BuildEndCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := ');';
end;

function TioDBBuilderSqlGenSQLite.BuildFieldExistsSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('pragma table_info(''%s'')', [ATable.Name]);
end;

function TioDBBuilderSqlGenSQLite.BuildFieldModifiedSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  Result := Format('pragma table_info(''%s'')', [ATable.Name]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_IndexExistsByName(const AIndexName: string): string;
begin
  Result := Format('SELECT 1 FROM sqlite_master WHERE type = ''index'' AND name = ''%s''', [AIndexName]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_IndexList(const ATableName: string): string;
begin
  // Query sqlite_master for all index info including SQL definition
  // We use sqlite_master instead of PRAGMA index_list because:
  // - PRAGMA provides only the unique flag, not orientation (ASC/DESC)
  // - sqlite_master.sql contains the full CREATE INDEX statement with both UNIQUE and orientation
  // - This allows extracting all needed info in one query without type casting
  // Note: iORM applies the same orientation to all fields in an index (no mixed ASC/DESC per field)
  // Note: sql IS NOT NULL excludes auto-generated indexes for PK/UNIQUE constraints
  Result := 'SELECT name, tbl_name, sql FROM sqlite_master WHERE type = ''index'' AND sql IS NOT NULL';
  if not ATableName.IsEmpty then
    Result := Result + Format(' AND tbl_name = ''%s''', [ATableName]);
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_IndexDetails(const AIndexName: string): string;
begin
  // PRAGMA index_info returns columns info for the index
  Result := Format('PRAGMA index_info(''%s'')', [AIndexName]);
end;

function TioDBBuilderSqlGenSQLite.BuildListTableForeignKeysSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  // PRAGMA foreign_key_list returns all foreign keys for a table
  Result := Format('PRAGMA foreign_key_list(''%s'')', [ATable.Name]);
end;

function TioDBBuilderSqlGenSQLite.BuildListAllForeignKeysSql: string;
begin
  // SQLite doesn't have a single query to list all FKs across all tables
  // This would require iterating through all tables and calling PRAGMA foreign_key_list for each
  // Return empty string - Strategy will handle this differently
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_FKExists(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
begin
  // PRAGMA foreign_key_list returns all FKs for a table, Strategy will filter by name
  Result := Format('PRAGMA foreign_key_list(''%s'')', [ATable.Name]);
end;

function TioDBBuilderSqlGenSQLite.BuildForeignKeyModifiedSql(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
begin
  // Same query as existence check - Strategy will compare the values
  Result := Format('PRAGMA foreign_key_list(''%s'')', [ATable.Name]);
end;

function TioDBBuilderSqlGenSQLite.BuildAddPrimaryKeySql(const ATable: IioDBBuilderSchemaTable): string;
begin
  // SQLite defines PRIMARY KEY inline in CREATE TABLE statement
  // Cannot add PK after table creation
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildRecreateFieldSql(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  // SQLite doesn't support ALTER COLUMN - requires full table rebuild
  // This is handled by the Strategy layer (rename table, create new, copy data)
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildTableExistsSql(const ATableName: string): string;
begin
  Result := Format('pragma table_info(''%s'')', [ATableName]);
end;

function TioDBBuilderSqlGenSQLite.InternalCreateField(const AField: IioDBBuilderSchemaField): String;
var
  LDefault: string;
  LNotNull: string;
begin
  // If primary key...
  // Carlo Marona (2025-10-16): No need to add AUTOINCREMENT keyword because when PRIMARY KEY is used SqLite internally uses an autoincrement column
  if AField.PrimaryKey then
    Result := Format('"%s" INTEGER PRIMARY KEY NOT NULL', [AField.FieldName])
  else
  begin
    // Extract the default value if exists
    LDefault := ExtractFieldDefaultValue(AField);
    LNotNull := IfThen(AField.FieldNotNull, 'NOT NULL', 'NULL');
    Result := Format('"%s" %s %s %s', [AField.FieldName, TranslateFieldType(AField, True), LNotNull, LDefault]).Trim;
  end;
end;

function TioDBBuilderSqlGenSQLite.TranslateFieldType(const AField: IioDBBuilderSchemaField; const AExcludeTypeAttributes: boolean): String;
begin
  case AField.FieldType of
    ioMdVarchar:
      Result := 'TEXT';
    ioMdChar:
      Result := 'TEXT';
    ioMdInteger:
      Result := 'INTEGER';
    ioMdFloat:
      Result := 'REAL';
    ioMdDate:
      Result := 'REAL'; // But in SQLite documentation has NUMERIC affinity (Mauri: 02/08/2021)
    ioMdTime:
      Result := 'REAL'; // But in SQLite documentation has NUMERIC affinity (Mauri: 02/08/2021)
    ioMdDateTime:
      Result := 'REAL'; // But in SQLite documentation has NUMERIC affinity (Mauri: 02/08/2021)
    ioMdDecimal:
      Result := 'NUMERIC';
    ioMdNumeric:
      Result := 'NUMERIC';
    ioMdBoolean:
      Result := 'INTEGER'; // But in SQLite documentation has NUMERIC affinity (Mauri: 02/08/2021)
    ioMdBinary:
      Result := 'BLOB';
    ioMdCustomFieldType:
      Result := AField.FieldCustomType;
  else
    raise EioGenericException.Create(ClassName, 'TranslateFieldType', 'Wrong Metadata_FieldType');
  end;
end;

function TioDBBuilderSqlGenSQLite.BuildAddFieldSql(const AField: IioDBBuilderSchemaField): string;
begin
  // Do nothing. Can be removed?
  Result := EmptyStr;
end;

function TioDBBuilderSqlGenSQLite.BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LTextBuilder: IioTextBuilder;
begin
  // Generates: , CONSTRAINT <name> FOREIGN KEY (...) REFERENCES (...) [ON UPDATE ...] [ON DELETE ...] DEFERRABLE INITIALLY DEFERRED
  // Note: SQLite FK constraints are added within CREATE TABLE, not via ALTER TABLE
  LTextBuilder := NewTextBuilder;

  // Build the main FK constraint structure
  LTextBuilder.Add(
    Format(', CONSTRAINT "%s" FOREIGN KEY ("%s") REFERENCES "%s" ("%s")', [
      AForeignKey.Name,
      AForeignKey.DependentFieldName,
      AForeignKey.ReferenceTableName,
      AForeignKey.ReferenceFieldName
    ])
  );

  // Add optional ON UPDATE clause if specified
  if AForeignKey.OnUpdateAction > fkUnspecified then
    LTextBuilder.Add(Format(' ON UPDATE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnUpdateAction)]));

  // Add optional ON DELETE clause if specified
  if AForeignKey.OnDeleteAction > fkUnspecified then
    LTextBuilder.Add(Format(' ON DELETE %s', [TranslateFKAction(AForeignKey, AForeignKey.OnDeleteAction)]));

  // SQLite-specific: make FK constraint deferrable to avoid constraint violations during complex updates
  LTextBuilder.
    Add(' DEFERRABLE INITIALLY DEFERRED');

  Result := LTextBuilder.Text;
end;

function TioDBBuilderSqlGenSQLite.BuildBeginAlterTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := BuildBeginCreateTableSql(ATable);
end;

function TioDBBuilderSqlGenSQLite.BuildBeginCreateTableSql(const ATable: IioDBBuilderSchemaTable): string;
begin
  Result := Format('CREATE TABLE %s (', [ATable.Name]);
end;

end.
