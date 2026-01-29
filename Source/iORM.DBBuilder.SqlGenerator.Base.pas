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
unit iORM.DBBuilder.SqlGenerator.Base;

interface

uses
  System.Classes,
  System.Rtti,

  iORM.DBBuilder.Interfaces,
  iORM.DB.Interfaces,
  iORM.Attributes,
  iORM.DB.Consts,
  iORM.CommonTypes

  ;

type

  TioDBBuilderSqlGenBase = class(TInterfacedObject, IioDBBuilderSqlGenerator)
  private
    FConnectionDefName: string;
    FDataConverter: TioSqlDataConverterRef;
  protected
    /// <summary>
    /// Returns the maximum allowed length for SQL identifiers (table names, column names, etc.) for this database.
    /// Base implementation returns 0 (no limit). Derived classes should override to enforce database-specific limits.
    /// </summary>
    /// <returns>Maximum identifier length, or 0 if no limit applies</returns>
    /// <remarks>
    /// Examples: Firebird 2.5 = 31 chars, Firebird 3+ = 63 chars, SQLite = effectively unlimited
    /// </remarks>
    function GetMaxSqlIdentifierLength: integer; virtual;
    /// <summary>
    /// Returns the minimum required length for SQL identifiers for this database.
    /// Base implementation returns 0 (no minimum). Derived classes should override if database has minimum requirements.
    /// </summary>
    /// <returns>Minimum identifier length, or 0 if no minimum applies</returns>
    function GetMinSqlIdentifierLength: integer; virtual;
    /// <summary>
    /// Checks if an identifier name exceeds the maximum allowed length for this database.
    /// </summary>
    /// <param name="AIdentifierName">The identifier name to check</param>
    /// <returns>True if the name is too long, False otherwise</returns>
    function IsSqlIdentifierTooLong(const AIdentifierName: string): boolean; virtual;
    /// <summary>
    /// Checks if an identifier name is shorter than the minimum required length for this database.
    /// </summary>
    /// <param name="AIdentifierName">The identifier name to check</param>
    /// <returns>True if the name is too short, False otherwise</returns>
    function IsSqlIdentifierTooShort(const AIdentifierName: string): boolean; virtual;
    /// <summary>
    /// Shortens an identifier name to fit within the specified maximum length by generating a hash.
    /// If the name is already within the limit, it is returned unchanged.
    /// </summary>
    /// <param name="AIdentifierName">The identifier name to shorten (must not be empty)</param>
    /// <param name="AMaxLength">The maximum allowed length (must be positive)</param>
    /// <returns>The shortened identifier name (or original if already within limit)</returns>
    /// <exception cref="EioGenericException">Raised if AIdentifierName is empty or AMaxLength is not positive</exception>
    function ShortenIdentifierName(const AIdentifierName: string; const AMaxLength: integer): string;
    /// <summary>
    /// Escapes single quotes in SQL string literals by doubling them (standard SQL escaping).
    /// Used when embedding string values in SQL queries (e.g., WHERE name = 'value').
    /// NOT for SQL identifiers (table/column names) - those use database-specific delimiters.
    /// </summary>
    /// <param name="AStringLiteral">The string value to escape</param>
    /// <returns>Escaped string safe for embedding in SQL queries</returns>
    /// <example>
    /// "Table'Name" becomes "Table''Name"
    /// </example>
    function EscapeSQLStringLiteral(const AStringLiteral: string): string; virtual;

    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    procedure CreateDatabase; virtual; abstract;
    function DatabaseExists: Boolean; virtual; abstract;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_BeginAlterTable(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildSQL_EndAlterTable(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildSQL_TableExists(const ATableName: string): string; virtual; abstract;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AddField(const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField; const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo): string; virtual; abstract;
    function BuildSQL_CreateField(const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual; abstract;
    function BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string; virtual; abstract;
    function Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String; virtual; abstract;
    function Translate_SchemaField_To_DefaultValue(const AField: IioDBBuilderSchemaField): string; virtual;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual; abstract;
    function BuildSQL_AddPK(const ATable: IioDBBuilderSchemaTable): string; virtual; abstract;
    function BuildSQL_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual;
    function BuildSQL_DropIndexByName(const AIndexName: string): string; virtual; abstract;
    function BuildSQL_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual;
    function BuildSQL_IndexExistsByName(const AIndexName: string): string; virtual; abstract;
    function BuildSQL_IndexList(const ATableName: string = ''): string; virtual; abstract;
    function BuildSQL_IndexDetails(const AIndexName: string): string; virtual; abstract;
    /// <summary>
    /// Translates an index schema to a comma-separated list of field names with orientation.
    /// </summary>
    /// <param name="AIndex">The index schema</param>
    /// <returns>Comma-separated field list (e.g., "Field1 ASC, Field2 DESC")</returns>
    function Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    /// <summary>
    /// Translates an index orientation to SQL keyword with leading space.
    /// </summary>
    /// <param name="AIndex">The index schema</param>
    /// <returns>Orientation string with leading space (e.g., " ASC" or " DESC")</returns>
    function Translate_SchemaIndex_To_Orientation(const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    /// <summary>
    /// Translates an index unique flag to SQL UNIQUE keyword with leading space.
    /// </summary>
    /// <param name="AIndex">The index schema</param>
    /// <returns>"UNIQUE" string with leading space if unique, empty string otherwise</returns>
    function Translate_SchemaIndex_To_Unique(const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    function Translate_SchemaTableAndIndex_To_IndexName(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): String; virtual;
    /// <summary>
    /// Translates the unique flag to a suffix for auto-generated index names.
    /// </summary>
    /// <param name="Unique">True if index is unique</param>
    /// <returns>"_U" if unique, empty string otherwise</returns>
    function Translate_Unique_To_UniqueSuffixForIndexName(const Unique: boolean): string; virtual;
    /// <summary>
    /// Translates the index orientation to a suffix for auto-generated index names.
    /// </summary>
    /// <param name="AOrientation">The index orientation</param>
    /// <returns>"_A" for ascending, "_D" for descending</returns>
    function Translate_Orientation_To_OrientationSuffixForIndexName(const AOrientation: TioIndexOrientation): string; virtual;

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AddFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; virtual; abstract;
    function BuildSQL_DropFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; overload; virtual;
    function BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string; overload; virtual; abstract;
    function BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string; virtual; abstract;
    function Translate_SchemaFK_To_FKvalue(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String; virtual;
    function Translate_SchemaTableAndFK_To_FKName(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; virtual;

    // ==========================================================
    // RDBMS INFO METHODS
    // ----------------------------------------------------------
    function LoadRDBMSInfo: IioDBBuilderSchemaRDBMSInfo; virtual; abstract;
    // ==========================================================

    property ConnectionDefName: string read FConnectionDefName;
    property DataConverter: TioSqlDataConverterRef read FDataConverter;
    property MaxSqlIdentifierLength: integer read GetMaxSqlIdentifierLength;
    property MinSqlIdentifierLength: integer read GetMinSqlIdentifierLength;
  public
    constructor Create(const AConnectionDefName: string); virtual;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Character,
  System.Hash,

  iORM.DB.Factory,
  iORM.DB.ConnectionContainer,
  iORM.SqlTranslator,
  iORM.Exceptions,
  iORM.DBBuilder.Factory

  ;

const
  // Prefixes for identifier names
  FK_PREFIX = 'FK_';
  IDX_PREFIX = 'IDX_';

{ TioDBBuilderSqlGenBase }

function TioDBBuilderSqlGenBase.Translate_SchemaFK_To_FKvalue(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String;
begin
  case AFKAction of
    fkUnspecified, fkNoAction:
      Exit('NO ACTION');
    fkSetNull:
      Exit('SET NULL');
    fkSetDefault:
      Exit('SET DEFAULT');
    fkCascade:
      Exit('CASCADE');
  else
    raise EioGenericException.Create(Self.ClassName, 'Translate_SchemaFK_To_FKvalue',
      Format('Valore FK action inatteso: %d', [Ord(AFKAction)]));
  end;
end;



function TioDBBuilderSqlGenBase.BuildSQL_DropIndex(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): string;
var
  LIndexName: string;
begin
  // Generates SQL to drop an index (delegates to BuildSQL_DropIndexByName after translating schema index to index name)
  LIndexName := Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex);
  Result := BuildSQL_DropIndexByName(LIndexName);
end;

function TioDBBuilderSqlGenBase.Translate_SchemaTableAndFK_To_FKName(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LFKName: String;
begin
  // Input validation
  if not Assigned(ATable) then
    raise EioGenericException.Create(Self.ClassName, 'Translate_SchemaTableAndFK_To_FKName', 'ATable non può essere nil');
  if not Assigned(AForeignKey) then
    raise EioGenericException.Create(Self.ClassName, 'Translate_SchemaTableAndFK_To_FKName', 'AForeignKey non può essere nil');

  // Build FK name
  LFKName := FK_PREFIX + AForeignKey.Name;
  LFKName := TioSqlTranslator.Translate(LFKName, ATable.GetContextTable.GetClassName, False);

  // If name exceeds max length, recalculate using shortening algorithm
  if IsSqlIdentifierTooLong(LFKName) then
  begin
    // Max length is reduced by the length of FK prefix
    LFKName := FK_PREFIX + ShortenIdentifierName(
      Format('%s_%s_%s_%s', [AForeignKey.DependentTableName, AForeignKey.DependentFieldName,
        AForeignKey.ReferenceTableName, AForeignKey.ReferenceFieldName]),
        MaxSqlIdentifierLength - Length(FK_PREFIX));
  end;

  Result := LFKName.ToUpper;
end;

function TioDBBuilderSqlGenBase.BuildSQL_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
begin
  // Generates SQL to check if an index exists (delegates to BuildSQL_IndexExistsByName after translating schema index to index name)
  Result := BuildSQL_IndexExistsByName(Translate_SchemaTableAndIndex_To_IndexName(ATable, AIndex));
end;

function TioDBBuilderSqlGenBase.Translate_SchemaIndex_To_CommaSepListOfFieldNames(const AIndex: IioDBBuilderSchemaIndex): String;
var
  LField, LOrientation, LComma: String;
begin
  // Build field list with SQL-quoted names and orientation suffix
  Result := '';
  LComma := '';
  LOrientation := Translate_SchemaIndex_To_Orientation(AIndex);  // Returns ' ASC' or ' DESC' (with leading space)
  // Note: SqlCommaSepFieldList returns already quoted fields, we need to add orientation to each
  for LField in AIndex.SqlCommaSepFieldList.Split([', ']) do
  begin
    // Note: LOrientation already includes leading space
    Result := Result + LComma + LField + LOrientation;
    LComma := ', ';
  end;
end;

function TioDBBuilderSqlGenBase.Translate_SchemaTableAndIndex_To_IndexName(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): String;
var
  LFieldNameArray: TArray<string>;
  LField,
  LCoreIndexName,
  LFullIndexName: string;
begin
  // Input validation
  if not Assigned(ATable) then
    raise EioGenericException.Create(Self.ClassName, 'Translate_SchemaTableAndIndex_To_IndexName', 'ATable non può essere nil');
  if not Assigned(AIndex) then
    raise EioGenericException.Create(Self.ClassName, 'Translate_SchemaTableAndIndex_To_IndexName', 'AIndex non può essere nil');

  // If the index has an explicit name, use it directly (translated).
  // Otherwise, build a name from table and field names with prefix/suffixes.
  // If the generated name exceeds max length, use a shortened hash version.
  if AIndex.HasExplicitName then
    LFullIndexName := TioSqlTranslator.Translate(AIndex.Name, ATable.GetContextTable.GetClassName, False)
  else
  begin
    // Build fields part (table + fields without spaces)
    LCoreIndexName := ATable.Name;
    LFieldNameArray := AIndex.CommaSepFieldList.Split([',']);
    for LField in LFieldNameArray do
      LCoreIndexName := LCoreIndexName + '_' + LField.Trim;

    // Build full index name with prefix and suffixes
    LFullIndexName := IDX_PREFIX
      + LCoreIndexName
      + Translate_Orientation_To_OrientationSuffixForIndexName(AIndex.Orientation)
      + Translate_Unique_To_UniqueSuffixForIndexName(AIndex.Unique);

    // If name exceeds max length, use hash of fields part only (without suffixes)
    if IsSqlIdentifierTooLong(LFullIndexName) then
      // Hash only the fields part, then add only the prefix (no suffixes needed with hash)
      LFullIndexName := IDX_PREFIX + ShortenIdentifierName(LCoreIndexName, MaxSqlIdentifierLength - Length(IDX_PREFIX));
  end;

  Result := LFullIndexName.ToUpper;
end;

function TioDBBuilderSqlGenBase.Translate_SchemaIndex_To_Orientation(const AIndex: IioDBBuilderSchemaIndex): String;
begin
  // Returns orientation with leading space for SQL composition (e.g. ' ASC' or ' DESC')
  case AIndex.Orientation of
    ioAscending:
      Exit(' ASC');
    ioDescending:
      Exit(' DESC');
  end;
end;

function TioDBBuilderSqlGenBase.Translate_SchemaIndex_To_Unique(const AIndex: IioDBBuilderSchemaIndex): String;
begin
  // Returns UNIQUE keyword with leading space for SQL composition (e.g. ' UNIQUE' or empty)
  if AIndex.Unique then
    Exit(' UNIQUE')
  else
    Exit('');
end;


constructor TioDBBuilderSqlGenBase.Create(const AConnectionDefName: string);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
  FDataConverter := TioDbFactory.SqlDataConverter(AConnectionDefName);
end;

function TioDBBuilderSqlGenBase.Translate_SchemaField_To_DefaultValue(const AField: IioDBBuilderSchemaField): string;
begin
  if AField.FieldDefault.IsEmpty then
    Result := ''
  else
    Result := DataConverter.TValueToSql(AField.FieldDefault);
end;

function TioDBBuilderSqlGenBase.Translate_Orientation_To_OrientationSuffixForIndexName(const AOrientation: TioIndexOrientation): string;
begin
  case AOrientation of
    ioAscending:
      Result := '_A';
    ioDescending:
      Result := '_D';
  end;
end;

function TioDBBuilderSqlGenBase.Translate_Unique_To_UniqueSuffixForIndexName(const Unique: boolean): string;
begin
  if Unique then
    Result := '_U'
  else
    Result := '';
end;

function TioDBBuilderSqlGenBase.GetMaxSqlIdentifierLength: integer;
begin
  Result := 0;
end;

function TioDBBuilderSqlGenBase.GetMinSqlIdentifierLength: integer;
begin
  Result := 0;
end;


function TioDBBuilderSqlGenBase.ShortenIdentifierName(const AIdentifierName: string; const AMaxLength: integer): string;
begin
  // Input validation
  if AIdentifierName.IsEmpty then
    raise EioGenericException.Create(Self.ClassName, 'ShortenIdentifierName', 'Il nome identificatore non può essere vuoto');
  if AMaxLength <= 0 then
    raise EioGenericException.Create(Self.ClassName, 'ShortenIdentifierName', 'La lunghezza massima deve essere positiva');

  if AIdentifierName.Length > AMaxLength then
    // Fix: Use Substring(0, ...) to include first character of hash (0-indexed)
    Result := THashSHA2.GetHashString(AIdentifierName).Substring(0, AMaxLength)
  else
    Result := AIdentifierName;
end;

function TioDBBuilderSqlGenBase.IsSqlIdentifierTooShort(const AIdentifierName: string): boolean;
begin
  Result := Length(AIdentifierName) < MinSqlIdentifierLength;
end;

function TioDBBuilderSqlGenBase.IsSqlIdentifierTooLong(const AIdentifierName: string): boolean;
begin
  // If MaxSqlIdentifierLength is 0 there's no limit to the identifier length
  Result := (MaxSqlIdentifierLength > 0) and (Length(AIdentifierName) > MaxSqlIdentifierLength);
end;

function TioDBBuilderSqlGenBase.EscapeSQLStringLiteral(const AStringLiteral: string): string;
begin
  // Standard SQL escaping: single quotes in string literals are escaped by doubling them
  // This is the standard approach used by SQLite, Firebird, MS SQL Server, PostgreSQL, etc.
  // Used when embedding string values in SQL queries (e.g., WHERE name = 'value')
  // Example: "Table'Name" becomes "Table''Name"
  Result := StringReplace(AStringLiteral, '''', '''''', [rfReplaceAll]);
end;

function TioDBBuilderSqlGenBase.BuildSQL_DropFK(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LFKName: string;
begin
  // Generates SQL to drop a foreign key (delegates to BuildSQL_DropFKbyName after translating schema FK to FK name)
  LFKName := Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey);
  Result := BuildSQL_DropFKbyName(ATable.Name, LFKName);
end;

end.
