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

  /// <summary>
  /// Base class for all DBMS-specific SQL generators.
  /// Uses the "exception-default" pattern: all virtual methods have a base implementation
  /// that raises an exception via RaiseNotImplemented. Derived classes override only the
  /// methods that their DBMS actually supports. This provides:
  /// - Consistency: one uniform convention instead of mixing abstract and virtual methods
  /// - Clarity: looking at a derived class immediately shows what that DBMS supports
  /// - Extensibility: adding a new DBMS requires only the relevant overrides
  /// - Clear runtime errors: calling an unsupported operation produces an exception
  ///   that identifies both the DBMS (via ClassName) and the operation (via method name)
  /// </summary>
  TioDBBuilderSqlGenBase = class(TInterfacedObject, IioDBBuilderSqlGenerator)
  private
    FConnectionDefName: string;
    FDataConverter: TioSqlDataConverterRef;
    FDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
    procedure RaiseNotImplemented(const AMethodName: string);
  protected
    { Naming convention (group banners mirror IioDBBuilderSqlGenerator - single source of truth)
      -------------------------------------------------------------------------------------------
      A method's prefix encodes its ROLE, independently of whether it is exposed on the interface:
        Command_*                        executes DDL against the database (side-effect)
        Check_*                          interrogates the DB catalog at runtime, returns Boolean
        BuildSQL_*                       returns a SQL string, no side-effect
        Supports_*                       boolean DBMS capability flag
        Translate_<Source>_To_<Target>   maps a schema element to a SQL fragment / identifier
      Methods whose role fits none of the above use plain Delphi verb naming (Get* / Is* /
      Ensure* / Load* / Shorten* / Escape*) - e.g. GetDBMSInfo / LoadDBMSInfo (interface
      accessors) and the identifier/literal helpers in the last group.
      Interface membership is orthogonal to the prefix: a base-only helper may still carry a
      domain prefix when its role matches (the internal Translate_* index helpers, Hint_*), and
      an interface method may be prefix-free when it is a plain accessor.
      Group banners below match IioDBBuilderSqlGenerator 1:1; the trailing group holds base-only
      internal helpers with no interface counterpart. Methods are alphabetical within each group. }

    // ==========================================================
    // DATABASE RELATED METHODS
    // ----------------------------------------------------------
    function Check_DatabaseExists: Boolean; virtual;
    procedure Command_CreateDatabase; virtual;

    // ==========================================================
    // TABLE RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string; virtual;
    function BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string; virtual;
    function BuildSQL_TableExists(const ATableName: string): string; virtual;

    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual;
    function BuildSQL_CreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual;
    function BuildSQL_FieldDefinition(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual;
    function BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; virtual;
    function BuildSQL_FieldList(const ATableName: string; const AFieldName: string = ''): string; virtual;
    function Translate_SchemaField_To_DefaultValue(const AField: IioDBBuilderSchemaField): string; virtual;
    function Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String; virtual;

    // ==========================================================
    // INDEX RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual;
    function BuildSQL_CreatePK(const ATable: IioDBBuilderSchemaTable): string; virtual;
    function BuildSQL_DropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual;
    function BuildSQL_DropIndexByName(const AIndexName: string): string; virtual;
    function BuildSQL_IndexDetails(const AIndexName: string): string; virtual;
    function BuildSQL_IndexExists(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string; virtual;
    function BuildSQL_IndexExistsByName(const AIndexName: string): string; virtual;
    function BuildSQL_IndexList(const ATableName: string = ''): string; virtual;
    /// <summary>
    /// Translates the index orientation to a suffix for auto-generated index names.
    /// </summary>
    /// <param name="AOrientation">The index orientation</param>
    /// <returns>"_A" for ascending, "_D" for descending</returns>
    function Translate_Orientation_To_OrientationSuffixForIndexName(const AOrientation: TioIndexOrientation): string; virtual;
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

    // ==========================================================
    // FOREIGN KEY RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_CreateFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; virtual;
    function BuildSQL_DropFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; virtual;
    function BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string; virtual;
    function BuildSQL_FKList(const ATableName: string = ''; const AFKName: string = ''): string; virtual;
    function Translate_SchemaFK_To_FKvalue(const AForeignKey: IioDBBuilderSchemaFK; const AFKAction: TioFKAction): String; virtual;
    function Translate_SchemaTableAndFK_To_FKName(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string; virtual;

    // ==========================================================
    // DBMS INFO METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// Returns DBMS version info with lazy loading (loads on first access).
    /// </summary>
    function GetDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
    /// <summary>
    /// Loads DBMS info from database. Called internally by GetDBMSInfo.
    /// </summary>
    function LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo; virtual;

    // ==========================================================
    // KEY GENERATION CAPABILITY METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// Emits key-generation-strategy diagnostics into AScript for fallbacks already applied
    /// by Resolve_KeyGenerationStrategy: a single informational Hint for every table whose requested
    /// strategy was overridden. Uniform for every DBMS and intentionally non-blocking (Warnings gate
    /// the create/alter flow in the Engine, and a safe auto-applied fallback must not block it).
    /// </summary>
    procedure CheckKeyGenerationCompatibility(const ASchema: IioDBBuilderSchema; const AScript: IioDBBuilderScript);
    /// <summary>
    /// Returns the default key generation strategy for this DBMS.
    /// Base returns kgsIdentity. Override in derived classes (e.g. Firebird returns kgsSequence).
    /// </summary>
    function GetDefaultKeyGenerationStrategy: TioKeyGenerationStrategyType; virtual;
    /// <summary>
    /// Appends the standard "requested X key generation but this DBMS uses Y instead" hint to the
    /// script. Centralized here so the wording stays consistent across every RDBMS generator.
    /// </summary>
    procedure Hint_KeyGenerationStrategyFallback(const AScript: IioDBBuilderScript; const ATable: IioDBBuilderSchemaTable);
    /// <summary>
    /// Resolves the requested key generation strategy to an effective strategy.
    /// Called once per table during schema building (by the SchemaBuilder). The resolved strategy is stored
    /// in the SchemaTable and used later by UsesSequenceForKeyGeneration/UsesIdentityForKeyGeneration
    /// to decide how to generate the DDL.
    /// If kgsAuto or unsupported by this DBMS, falls back to GetDefaultKeyGenerationStrategy.
    /// </summary>
    function Resolve_KeyGenerationStrategy(const ARequestedStrategy: TioKeyGenerationStrategyType): TioKeyGenerationStrategyType; virtual;
    /// <summary>Returns True if the database supports IDENTITY columns</summary>
    function Supports_Identity: Boolean; virtual;
    /// <summary>Returns True if the database supports SEQUENCE objects (default: False)</summary>
    function Supports_Sequence: Boolean; virtual;

    // ==========================================================
    // ALTER TABLE CAPABILITY METHODS
    // ----------------------------------------------------------
    /// <summary>
    /// Returns the DBMS-specific list of forbidden field-type conversions as '[old->new]' tokens.
    /// Base returns '' (no restrictions); override per DBMS. Consumed by Strategy diagnostics.
    /// </summary>
    function GetInvalidFieldTypeConversions: string; virtual;
    /// <summary>Returns True if the database permits BLOB subtype changes via ALTER COLUMN</summary>
    function Supports_AlterBlobSubtype: Boolean; virtual;
    /// <summary>Returns True if the database supports ALTER COLUMN SET/DROP NOT NULL</summary>
    function Supports_AlterNotNull: Boolean; virtual;

    // ==========================================================
    // SEQUENCE RELATED METHODS
    // ----------------------------------------------------------
    /// <summary>Generates SQL to create a sequence. Default raises exception (not supported).</summary>
    function BuildSQL_CreateSequence(const ASequenceName: String): string; virtual;
    /// <summary>Generates SQL to drop a sequence. Default raises exception (not supported).</summary>
    function BuildSQL_DropSequence(const ASequenceName: string): string; virtual;
    /// <summary>Generates SQL to check if a sequence exists. Default raises exception (not supported).</summary>
    function BuildSQL_SequenceExists(const ASequenceName: string): string; virtual;

    // ==========================================================
    // SQL IDENTIFIER / LITERAL UTILITIES (internal helpers, not part of IioDBBuilderSqlGenerator)
    // ----------------------------------------------------------
    /// <summary>
    /// Returns the identifier shortened if it exceeds MaxSqlIdentifierLength, unchanged otherwise.
    /// </summary>
    function EnsureIdentifierLength(const AIdentifierName: string): string;
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
    /// Checks if an identifier name exceeds the maximum allowed length for this database.
    /// </summary>
    /// <param name="AIdentifierName">The identifier name to check</param>
    /// <returns>True if the name is too long, False otherwise</returns>
    function IsSqlIdentifierTooLong(const AIdentifierName: string): boolean; virtual;
    /// <summary>
    /// Shortens an identifier name to fit within the specified maximum length by generating a hash.
    /// If the name is already within the limit, it is returned unchanged.
    /// </summary>
    /// <param name="AIdentifierName">The identifier name to shorten (must not be empty)</param>
    /// <param name="AMaxLength">The maximum allowed length (must be positive)</param>
    /// <returns>The shortened identifier name (or original if already within limit)</returns>
    /// <exception cref="EioGenericException">Raised if AIdentifierName is empty or AMaxLength is not positive</exception>
    function ShortenIdentifierName(const AIdentifierName: string; const AMaxLength: integer): string;

    // ==========================================================
    // PROPERTIES
    // ----------------------------------------------------------
    property ConnectionDefName: string read FConnectionDefName;
    property DataConverter: TioSqlDataConverterRef read FDataConverter;
    property DBMSInfo: IioDBBuilderSchemaRDBMSInfo read GetDBMSInfo;
    property MaxSqlIdentifierLength: integer read GetMaxSqlIdentifierLength;
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
  iORM.Utilities,
  iORM.DBBuilder.Factory

  ;

const
  // Prefixes for identifier names
  FK_PREFIX = 'FK_';
  IDX_PREFIX = 'IDX_';

{ TioDBBuilderSqlGenBase }

// Central helper for the exception-default pattern.
// ClassName resolves at runtime to the actual derived class (e.g. TioDBBuilderSqlGenMSSqlServer),
// so the error message clearly identifies which DBMS and which operation is unsupported.
procedure TioDBBuilderSqlGenBase.RaiseNotImplemented(const AMethodName: string);
begin
  raise EioDBBuilderException.Create(ClassName, AMethodName, 'Not supported by this DBMS.');
end;

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
  FDBMSInfo := nil;
end;

function TioDBBuilderSqlGenBase.GetDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
begin
  if not Assigned(FDBMSInfo) then
    FDBMSInfo := LoadDBMSInfo;
  Result := FDBMSInfo;
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

function TioDBBuilderSqlGenBase.IsSqlIdentifierTooLong(const AIdentifierName: string): boolean;
begin
  // If MaxSqlIdentifierLength is 0 there's no limit to the identifier length
  Result := (MaxSqlIdentifierLength > 0) and (Length(AIdentifierName) > MaxSqlIdentifierLength);
end;

function TioDBBuilderSqlGenBase.EnsureIdentifierLength(const AIdentifierName: string): string;
begin
  if IsSqlIdentifierTooLong(AIdentifierName) then
    Result := ShortenIdentifierName(AIdentifierName, MaxSqlIdentifierLength)
  else
    Result := AIdentifierName;
end;

function TioDBBuilderSqlGenBase.EscapeSQLStringLiteral(const AStringLiteral: string): string;
begin
  // Standard SQL escaping: single quotes in string literals are escaped by doubling them
  // This is the standard approach used by SQLite, Firebird, MS SQL Server, PostgreSQL, etc.
  // Used when embedding string values in SQL queries (e.g., WHERE name = 'value')
  // Example: "Table'Name" becomes "Table''Name"
  Result := StringReplace(AStringLiteral, '''', '''''', [rfReplaceAll]);
end;

// ==========================================================
// Exception-default implementations
// These methods raise an exception if called without being overridden.
// Derived classes override only the methods supported by their DBMS.
// ==========================================================

procedure TioDBBuilderSqlGenBase.Command_CreateDatabase;
begin
  RaiseNotImplemented('Command_CreateDatabase');
end;

function TioDBBuilderSqlGenBase.Check_DatabaseExists: Boolean;
begin
  RaiseNotImplemented('Check_DatabaseExists');
  Result := False; // Unreachable: silences W1035 (the compiler cannot know the raise above never returns)
end;

function TioDBBuilderSqlGenBase.BuildSQL_BeginCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  RaiseNotImplemented('BuildSQL_BeginCreateTable');
end;

function TioDBBuilderSqlGenBase.BuildSQL_EndCreateTable(const ATable: IioDBBuilderSchemaTable): string;
begin
  RaiseNotImplemented('BuildSQL_EndCreateTable');
end;

function TioDBBuilderSqlGenBase.BuildSQL_TableExists(const ATableName: string): string;
begin
  RaiseNotImplemented('BuildSQL_TableExists');
end;

function TioDBBuilderSqlGenBase.BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  RaiseNotImplemented('BuildSQL_AlterField');
end;

function TioDBBuilderSqlGenBase.BuildSQL_CreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  RaiseNotImplemented('BuildSQL_CreateField');
end;

function TioDBBuilderSqlGenBase.BuildSQL_FieldDefinition(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  RaiseNotImplemented('BuildSQL_FieldDefinition');
end;

function TioDBBuilderSqlGenBase.BuildSQL_FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string;
begin
  RaiseNotImplemented('BuildSQL_FieldExists');
end;

function TioDBBuilderSqlGenBase.BuildSQL_FieldList(const ATableName: string; const AFieldName: string): string;
begin
  RaiseNotImplemented('BuildSQL_FieldList');
end;

function TioDBBuilderSqlGenBase.Translate_SchemaField_To_FieldType(const AField: IioDBBuilderSchemaField; const AIncludeTypeAttributes: boolean): String;
begin
  RaiseNotImplemented('Translate_SchemaField_To_FieldType');
end;

function TioDBBuilderSqlGenBase.BuildSQL_CreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): string;
begin
  RaiseNotImplemented('BuildSQL_CreateIndex');
end;

function TioDBBuilderSqlGenBase.BuildSQL_CreatePK(const ATable: IioDBBuilderSchemaTable): string;
begin
  RaiseNotImplemented('BuildSQL_CreatePK');
end;

function TioDBBuilderSqlGenBase.BuildSQL_DropIndexByName(const AIndexName: string): string;
begin
  RaiseNotImplemented('BuildSQL_DropIndexByName');
end;

function TioDBBuilderSqlGenBase.BuildSQL_IndexDetails(const AIndexName: string): string;
begin
  RaiseNotImplemented('BuildSQL_IndexDetails');
end;

function TioDBBuilderSqlGenBase.BuildSQL_IndexExistsByName(const AIndexName: string): string;
begin
  RaiseNotImplemented('BuildSQL_IndexExistsByName');
end;

function TioDBBuilderSqlGenBase.BuildSQL_IndexList(const ATableName: string): string;
begin
  RaiseNotImplemented('BuildSQL_IndexList');
end;

function TioDBBuilderSqlGenBase.BuildSQL_CreateFK(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): string;
begin
  RaiseNotImplemented('BuildSQL_CreateFK');
end;

function TioDBBuilderSqlGenBase.BuildSQL_DropFK(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): string;
var
  LFKName: string;
begin
  LFKName := Translate_SchemaTableAndFK_To_FKName(ATable, AForeignKey);
  Result := BuildSQL_DropFKbyName(ATable.Name, LFKName);
end;

function TioDBBuilderSqlGenBase.BuildSQL_DropFKbyName(const ATableName, AForeignKeyName: string): string;
begin
  RaiseNotImplemented('BuildSQL_DropFKbyName');
end;

function TioDBBuilderSqlGenBase.BuildSQL_FKList(const ATableName: string; const AFKName: string): string;
begin
  RaiseNotImplemented('BuildSQL_FKList');
end;

function TioDBBuilderSqlGenBase.BuildSQL_CreateSequence(const ASequenceName: String): string;
begin
  RaiseNotImplemented('BuildSQL_CreateSequence');
end;

function TioDBBuilderSqlGenBase.BuildSQL_DropSequence(const ASequenceName: string): string;
begin
  RaiseNotImplemented('BuildSQL_DropSequence');
end;

function TioDBBuilderSqlGenBase.BuildSQL_SequenceExists(const ASequenceName: string): string;
begin
  RaiseNotImplemented('BuildSQL_SequenceExists');
end;

function TioDBBuilderSqlGenBase.Supports_Identity: Boolean;
begin
  RaiseNotImplemented('Supports_Identity');
  Result := False; // Unreachable: silences W1035 (the compiler cannot know the raise above never returns)
end;

function TioDBBuilderSqlGenBase.LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
begin
  RaiseNotImplemented('LoadDBMSInfo');
end;

function TioDBBuilderSqlGenBase.GetDefaultKeyGenerationStrategy: TioKeyGenerationStrategyType;
begin
  Result := kgsIdentity;
end;

function TioDBBuilderSqlGenBase.Resolve_KeyGenerationStrategy(
  const ARequestedStrategy: TioKeyGenerationStrategyType): TioKeyGenerationStrategyType;
begin
  if (ARequestedStrategy = kgsAuto)
    or ((ARequestedStrategy = kgsSequence) and not Supports_Sequence)
    or ((ARequestedStrategy = kgsIdentity) and not Supports_Identity) then
    Result := GetDefaultKeyGenerationStrategy
  else
    Result := ARequestedStrategy;
end;

function TioDBBuilderSqlGenBase.Supports_Sequence: Boolean;
begin
  Result := False;
end;

function TioDBBuilderSqlGenBase.GetInvalidFieldTypeConversions: string;
begin
  // Base: no DBMS-specific forbidden conversions. Override per RDBMS.
  Result := '';
end;

procedure TioDBBuilderSqlGenBase.CheckKeyGenerationCompatibility(const ASchema: IioDBBuilderSchema; const AScript: IioDBBuilderScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  // Generic pass: for every table whose requested strategy was overridden by
  // Resolve_KeyGenerationStrategy, emit an informational hint. DBMS generators override this
  // method (calling inherited first) to add version-specific warnings.
  for LTable in ASchema.Tables.Values do
    if LTable.IsKeyGenerationStrategyFallback then
      Hint_KeyGenerationStrategyFallback(AScript, LTable);
end;

procedure TioDBBuilderSqlGenBase.Hint_KeyGenerationStrategyFallback(const AScript: IioDBBuilderScript;
  const ATable: IioDBBuilderSchemaTable);
begin
  AScript.Hints.Add(Format(
    'Table ''%s'' requests %s key generation but this DBMS does not support it. Using %s instead.',
    [ATable.Name,
     TioUtilities.EnumToString<TioKeyGenerationStrategyType>(ATable.RequestedKeyGenerationStrategy),
     TioUtilities.EnumToString<TioKeyGenerationStrategyType>(ATable.KeyGenerationStrategy)]));
end;

function TioDBBuilderSqlGenBase.Supports_AlterNotNull: Boolean;
begin
  // Default: ALTER COLUMN SET/DROP NOT NULL is supported
  // Override in derived classes for version-specific checks (e.g., Firebird 3.0+)
  Result := True;
end;

function TioDBBuilderSqlGenBase.Supports_AlterBlobSubtype: Boolean;
begin
  // Default: BLOB subtype changes via ALTER COLUMN are permitted
  // Override in derived classes if RDBMS doesn't support this
  Result := True;
end;

end.
