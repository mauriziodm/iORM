# Piano di Refactoring DBBuilder - iORM

## Obiettivi
1. Ridurre codice duplicato (~30-40%)
2. Migliorare manutenibilità
3. Facilitare aggiunta nuovi RDBMS (PostgreSQL)
4. Correggere bug esistenti

## Approccio
- **Incrementale**: una fase alla volta con verifica e approvazione tra le fasi
- **MS SQL Server**: rimane stub, pattern sarà più chiaro dopo refactoring

---

## Fase 1: Bug Fix Critici

### 1.1 Typo Firebird `RDB$INDIXES`
**File:** `Source/iORM.DBBuilder.SqlGenerator.Firebird.pas`
- Correggere `RDB$INDIXES` → `RDB$INDICES` nel metodo `BuildListTableIndexesSql`

### 1.2 SQLite `BuildRecreateFieldSql` mancante
**File:** `Source/iORM.DBBuilder.SqlGenerator.SqLite.pas`
- Il metodo abstract `BuildRecreateFieldSql` non è implementato
- Implementare usando il pattern SQLite di ricostruzione tabella (o restituire stringa vuota con warning se non supportato)

---

## Fase 2: Consolidamento SqlGenerator

### 2.1 Default implementations per metodi Table
**File:** `Source/iORM.DBBuilder.SqlGenerator.Base.pas`

Cambiare da `abstract` a `virtual` con implementazione default:

```pascal
function BuildBeginCreateTableSql(ATable): string; virtual;
begin
  Result := Format('CREATE TABLE %s (', [ATable.Name]);
end;

function BuildEndCreateTableSql(ATable): string; virtual;
begin
  Result := ');';
end;

function BuildBeginAlterTableSql(ATable): string; virtual;
begin
  Result := Format('ALTER TABLE %s', [ATable.Name]);
end;

function BuildEndAlterTableSql(ATable): string; virtual;
begin
  Result := ';';
end;
```

**Impatto:** Firebird e SQLite eliminano queste implementazioni duplicate.

### 2.2 Default implementation per `BuildDropIndexSql`
**File:** `Source/iORM.DBBuilder.SqlGenerator.Base.pas`

```pascal
function BuildDropIndexSql(const AIndexName: string): string; virtual;
begin
  Result := Format('DROP INDEX %s;', [AIndexName]);
end;
```

**Impatto:** Rimuovere override identici da Firebird e SQLite.

### 2.3 Estrarre `InternalBuildFieldDefinition` nella base
**File:** `Source/iORM.DBBuilder.SqlGenerator.Base.pas`

Il pattern è identico in Firebird e SQLite:
1. Check if primary key
2. Extract default value
3. Build NOT NULL clause
4. Format field definition

Aggiungere metodo template nella base:
```pascal
function InternalBuildFieldDefinition(const AField: IioDBBuilderSchemaField): String; virtual;
// Con virtual hooks per differenze database-specific
```

### 2.4 Template method per `BuildAddIndexSql`
**File:** `Source/iORM.DBBuilder.SqlGenerator.Base.pas`

Pattern comune:
```pascal
function BuildAddIndexSql(ATable, AIndex): string; virtual;
var
  LIndexName, LUnique, LFieldList: String;
begin
  LIndexName := BuildIndexNameSql(ATable, AIndex);
  LUnique := BuildIndexUnique(AIndex);
  LFieldList := BuildIndexFieldList(ATable, AIndex, LIndexName, GetIncludeOrientationInFieldList);
  Result := FormatCreateIndexSql(LUnique, LIndexName, ATable.Name, LFieldList);
end;

// Virtual hooks per database-specific
function GetIncludeOrientationInFieldList: Boolean; virtual; // SQLite=True, Firebird=False
function FormatCreateIndexSql(...): string; virtual; abstract;
```

---

## Fase 3: Consolidamento Strategy

### 3.1 Estendere uso di `_ExecuteExistsQuery`
**File:** `Source/iORM.DBBuilder.Strategy.*.pas`

La base già ha `_ExecuteExistsQuery`. Assicurarsi che tutte le sottoclassi lo usino:

```pascal
// In Firebird/SQLite, cambiare da:
LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, SqlGenerator.BuildSQL_FieldExists(...), True);
Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);

// A:
Result := _ExecuteExistsQuery(SqlGenerator.BuildSQL_FieldExists(...));
```

**Metodi da aggiornare:**
- `FieldExists` (Firebird, SQLite)
- `IndexExists` (già in base, verificare sottoclassi)
- `ForeignKeyExists` (Firebird)
- `SequenceExists` (Firebird)

### 3.2 Helper per drop loops
**File:** `Source/iORM.DBBuilder.Strategy.Base.pas`

Pattern ripetuto in `DropIndexes`, `DropForeignKeys`:
```pascal
procedure ExecuteDropLoop(const ASql: string; const ADropSqlFunc: TFunc<string, string>);
var
  LQuery: IioQuery;
begin
  LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, ASql, True);
  while not LQuery.Eof do
  begin
    Script.Body.Add(ADropSqlFunc(LQuery.Fields[0].AsString));
    LQuery.Next;
  end;
end;
```

---

## Fase 4: Consolidamento DBAnalyzer

### 4.1 Template method per `AnalyzeTables`
**File:** `Source/iORM.DBBuilder.DBAnalyzer.pas`

Spostare logica comune nella base con virtual hooks:

```pascal
procedure TioDBBuilderDBAnalyzer.AnalyzeTables;
var
  LTable: IioDBBuilderSchemaTable;
begin
  for LTable in Schema.Tables.Values do
  begin
    if (Schema.Status = stCreate) or not Strategy.TableExists(LTable) then
      LTable.Status := stCreate
    else
    begin
      AnalyzeFields(LTable);
      AnalyzeTableExtensions(LTable);  // Virtual hook
    end;

    if (LTable.Status > stClean) and (Schema.Status <> stCreate) then
      Schema.Status := stUpdate;
  end;

  PostAnalyze;  // Virtual hook
end;

// Virtual hooks (default do nothing)
procedure AnalyzeTableExtensions(ATable); virtual;  // Firebird: Indexes+FKs
procedure PostAnalyze; virtual;  // SQLite: AllOrNothingPostProcess
```

**File da modificare:**
- `Source/iORM.DBBuilder.DBAnalyzer.Firebird.pas` - Override `AnalyzeTableExtensions`
- `Source/iORM.DBBuilder.DBAnalyzer.SqLite.pas` - Override `PostAnalyze`

---

## Fase 5: Preparazione per PostgreSQL

### 5.1 Documentare checklist per nuovo RDBMS

Creare nella classe base commenti/documentazione che elencano:
1. Metodi obbligatori da implementare in SqlGenerator
2. Metodi obbligatori da implementare in Strategy
3. Override opzionali in DBAnalyzer
4. Registrazione in Factory

### 5.2 PostgreSQL-specific considerations
- Supporta `SERIAL`/`IDENTITY` invece di sequences
- Max identifier length: 63 caratteri
- Supporta `IF NOT EXISTS`
- Boolean nativo (non INTEGER)

---

## File da Modificare (in ordine)

| File | Tipo Modifica |
|------|---------------|
| `iORM.DBBuilder.SqlGenerator.Firebird.pas` | Bug fix typo |
| `iORM.DBBuilder.SqlGenerator.SqLite.pas` | Bug fix + rimuovi duplicati |
| `iORM.DBBuilder.SqlGenerator.Base.pas` | Aggiungi default impl + template methods |
| `iORM.DBBuilder.Strategy.Firebird.pas` | Usa _ExecuteExistsQuery |
| `iORM.DBBuilder.Strategy.SqLite.pas` | Usa _ExecuteExistsQuery |
| `iORM.DBBuilder.Strategy.Base.pas` | Aggiungi helper per loops |
| `iORM.DBBuilder.DBAnalyzer.pas` | Template method AnalyzeTables |
| `iORM.DBBuilder.DBAnalyzer.Firebird.pas` | Semplifica con hooks |
| `iORM.DBBuilder.DBAnalyzer.SqLite.pas` | Semplifica con hooks |

---

## Stima Riduzione Codice

| Area | Linee Eliminate (stima) |
|------|------------------------|
| SqlGenerator duplicati | ~80-100 linee |
| Strategy helper patterns | ~40-60 linee |
| DBAnalyzer template | ~30-40 linee |
| **Totale** | **~150-200 linee** |

---

## Note Implementative

1. **Ordine**: Prima i bug fix, poi consolidamenti dal basso (SqlGenerator → Strategy → DBAnalyzer)
2. **Test**: Dopo ogni fase, verificare che la generazione script funzioni per Firebird e SQLite
3. **Backward compatibility**: Nessun cambio alle interfacce pubbliche
4. **MS SQL Server**: Rimane stub, pattern sarà più chiaro dopo refactoring

---

## Analisi Dettagliata - Problemi Riscontrati

### Duplicazioni SqlGenerator

**InternalCreateField** - Metodo privato duplicato:
- `TioDBBuilderSqlGenFirebird.InternalCreateField` (linee 615-630)
- `TioDBBuilderSqlGenSQLite.InternalCreateField` (linee 181-197)

Entrambi seguono logica identica:
1. Check primary key → return formato speciale
2. Extract default value
3. Build NOT NULL clause
4. Format field definition

**BuildBegin/EndTableSql** - Identico in entrambi:
```pascal
// Firebird e SQLite identici:
BuildBeginCreateTableSql → 'CREATE TABLE %s ('
BuildEndCreateTableSql → ');'
BuildBeginAlterTableSql → 'ALTER TABLE %s'
BuildEndAlterTableSql → ';'
```

**BuildAddIndexSql** - Pattern simile:
1. Get index name via `BuildIndexNameSql`
2. Get unique keyword via `BuildIndexUnique`
3. Get field list via `BuildIndexFieldList`
4. Format CREATE INDEX statement

Differenze:
- SQLite usa `IF NOT EXISTS`
- Firebird usa orientation prima di INDEX keyword
- SQLite usa orientation in field list

### Duplicazioni Strategy

**Pattern query esistenza** - Ripetuto ovunque:
```pascal
LQuery := TioQueryEngine.GetRawQuery(ConnectionDefName, ASql, True);
Result := not (LQuery.Eof or LQuery.Fields[0].IsNull);
```

La base ha già `_ExecuteExistsQuery` ma non tutte le sottoclassi lo usano.

**Drop loops** - Pattern ripetuto in `DropIndexes`, `DropForeignKeys`:
```pascal
while not LQuery.Eof do
begin
  Script.Body.Add(SqlGenerator.BuildDropXxxSql(LQuery.Fields[0].AsString));
  LQuery.Next;
end;
```

### Duplicazioni DBAnalyzer

**AnalyzeTables** - Firebird e SQLite quasi identici:
- Entrambi iterano su Schema.Tables.Values
- Entrambi controllano TableExists
- Entrambi chiamano AnalyzeFields
- Firebird aggiunge AnalyzeIndexes + AnalyzeForeignKeys
- SQLite aggiunge PostProcess AllOrNothing

---

## Checklist Implementazione Nuovo RDBMS (es. PostgreSQL)

### 1. SqlGenerator (TioDBBuilderSqlGenPostgreSQL)

**Metodi OBBLIGATORI da implementare:**
- [ ] `TranslateFieldType` - Map iORM field types → PostgreSQL types
- [ ] `CreateDatabase` / `DatabaseExists` - PostgreSQL-specific
- [ ] `BuildTableExistsSql` - Query `information_schema.tables`
- [ ] `BuildSQL_FieldExists` / `BuildFieldModifiedSql` - Query `information_schema.columns`
- [ ] `BuildSQL_AddPK` - PostgreSQL PRIMARY KEY syntax
- [ ] `BuildListAllIndexesSql` / `BuildListTableIndexesSql` - Query `pg_indexes`
- [ ] `BuildListAllForeignKeysSql` / `BuildListTableForeignKeysSql` - Query `information_schema.table_constraints`
- [ ] `BuildForeignKeyExistsSql` / `BuildForeignKeyModifiedSql`
- [ ] `BuildIndexExistsSql` / `BuildIndexModifiedSql`
- [ ] `BuildRecreateFieldSql` (se supportato)

**Metodi OPZIONALI (hanno default nella base dopo refactoring):**
- [ ] `BuildBeginCreateTableSql` / `BuildEndCreateTableSql` (se sintassi diversa)
- [ ] `BuildBeginAlterTableSql` / `BuildEndAlterTableSql` (se sintassi diversa)
- [ ] `BuildDropIndexSql` (se sintassi diversa)
- [ ] `GetMaxSqlIdentifierLength` (PostgreSQL = 63)
- [ ] `FormatCreateIndexSql` (per template method)

### 2. Strategy (TioDBBuilderStrategyPostgreSQL)

**Metodi OBBLIGATORI:**
- [ ] `GetInvalidTypeConversions` - PostgreSQL-specific invalid conversions
- [ ] `FieldExists` / `FieldModified` - Usando `_ExecuteExistsQuery`
- [ ] `IndexExists` / `IndexModified`
- [ ] `ForeignKeyExists` / `ForeignKeyModified`
- [ ] `GenerateDatabaseObjects` - PostgreSQL-specific creation order

### 3. DBAnalyzer (TioDBBuilderDBAnalyzerPostgreSQL)

**Metodi OPZIONALI (dopo refactoring template method):**
- [ ] `AnalyzeTableExtensions` - Se serve analisi specifica indexes/FKs
- [ ] `PostAnalyze` - Se serve post-processing

### 4. Factory Registration

**File:** `Source/iORM.DBBuilder.Factory.pas`

Aggiungere nei metodi:
- [ ] `NewSqlGenerator` - case `ctPostgreSQL`
- [ ] `NewStrategy` - case `ctPostgreSQL`
- [ ] `NewDBAnalyzer` - case `ctPostgreSQL`

### 5. Connection Type

**File:** `Source/iORM.CommonTypes.pas` (o equivalente)
- [ ] Aggiungere `ctPostgreSQL` a `TioConnectionType`

### 6. PostgreSQL Specifics

- **Auto-increment**: `SERIAL` o `GENERATED AS IDENTITY` (non sequences con triggers)
- **Boolean**: Tipo nativo `BOOLEAN` (non INTEGER)
- **Identifier length**: Max 63 caratteri
- **IF NOT EXISTS**: Supportato in CREATE TABLE/INDEX
- **Schema support**: Potrebbe servire `public.tablename`
