# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

iORM (Interfaced Object Relational Mapper) is a Delphi ORM framework designed around interface-based architecture. It provides automatic database schema generation, object persistence, entity tracking, synchronization, and MVVM support. Uses FireDAC for database connectivity.

**Author:** Maurizio Del Magno
**License:** LGPL v3

## Build System

The project uses Delphi packages (.dpk) located in `Packages/`:

- **Delphi Professional** (`Packages/Delphi_Professional/`): SQLite and Firebird only
  - `iORM_CORE_RT.dpk` / `iORM_CORE_DT.dpk` - Core runtime/designtime
  - `iORM_VCL_RT.dpk` / `iORM_VCL_DT.dpk` - VCL UI binding
  - `iORM_FMX_RT.dpk` / `iORM_FMX_DT.dpk` - FireMonkey UI binding
  - `iORM_uniGUI_RT.dpk` / `iORM_uniGUI_DT.dpk` - uniGUI web framework

- **Delphi Enterprise/Architect** (`Packages/Delphi_Enterprise_Architect/`): Adds MS SQL Server
  - `iORM_RT.dpk` / `iORM_DT.dpk` - Full ORM packages

Build order: Runtime (RT) packages first, then Design-Time (DT) packages.

## Architecture

### Core Layers

1. **Context Layer** (`iORM.Context.*`): Class-to-table mapping, property metadata, relationships
   - Entry point: `iORM.Context.Interfaces.pas`

2. **Attributes** (`iORM.Attributes.pas`): RTTI attribute definitions for entity mapping
   - `[ioEntity('TableName')]` - Map class to table
   - `[ioVarchar(length)]`, `[ioInteger]`, etc. - Field types
   - `[ioIndex]`, `[ioForeignKey]` - Constraints
   - `[ioBelongsTo]`, `[ioHasMany]`, `[ioHasOne]` - Relationships
   - `[diImplements(IInterface)]` - Dependency injection

3. **Database Layer** (`iORM.DB.*`): FireDAC-based connections, queries, transactions

4. **Query Builder** (`iORM.Where.*`): Fluent interface for type-safe queries

5. **Persistence Strategy** (`iORM.PersistenceStrategy.*`): Abstracts DB vs HTTP/REST data sources

### Key Subsystems

- **DBBuilder** (`iORM.DBBuilder.*`): Automatic schema generation from Delphi classes
  - `DBAnalyzer.*` - Database introspection (base + per-RDBMS variants)
  - `Schema.*` - Schema representation (Table, Field, Index, FK)
  - `SqlGenerator.*` - SQL generation per database
  - `Strategy.*` - Implementation strategy per database

  **DBBuilder method naming & layout convention** (applies to the `SqlGenerator.*` and
  `Strategy.*` families — apply it automatically to any new/edited method, no need to be asked):
  - A method's **prefix encodes its ROLE**.
    - SqlGenerator: `Command_` (executes DDL), `Check_` (runtime catalog/existence query → Boolean),
      `BuildSQL_` (returns a SQL string, no side effect), `Supports_` (capability flag),
      `Translate_<Src>_To_<Tgt>` (schema element → SQL fragment/identifier).
    - Strategy: `Process_` (orchestration / mode dispatch), `ScriptWrite_` (emits one DDL/DML
      statement into `Script.Body`), `Force_` (drop that bypasses the configured mode), `Check_`
      (catalog/change query → Boolean), `Warning_`/`Hint_` (diagnostics), `GenerateScript_`
      (public entry point).
  - Boolean predicates and plain accessors are sanctioned exceptions (`Get*`, `Is*`, `Load*`, etc.).
  - **Layout**: methods are grouped under domain banners
    (`DATABASE`/`TABLE`/`FIELD`/`INDEX`/`SEQUENCE`/`FOREIGN KEY`/…) and kept **alphabetical within
    each group**, in the interfaces AND every class declaration section (derived classes use the
    same full `// ===` banners). This governs declarations only — implementation order is free.
  - **Authoritative source**: the `{ Naming convention ... }` banner at the top of the `protected`
    section in `iORM.DBBuilder.SqlGenerator.Base.pas` and `iORM.DBBuilder.Strategy.Base.pas`. Keep
    those two banners and this note in sync when the convention evolves.

- **ETM (Entity Tracking Manager)** (`iORM.ETM.*`): Audit trail and change tracking

- **MVVM** (`iORM.MVVM.*`): ViewModels, Views, Model binding, VM actions

- **Dependency Injection** (`iORM.DependencyInjection.*`): IoC container

- **Synchronization** (`iORM.SynchroStrategy.*`): Distributed data sync

### UI Framework Abstraction

`iORM.Abstraction.*` provides multi-framework support:
- `iORM.Abstraction.VCL.pas` - VCL-specific
- `iORM.Abstraction.FMX.pas` - FireMonkey
- `iORM.Abstraction.uniGUI.pas` - uniGUI web

## Code Organization

- **Naming convention**: `iORM.Category.Subcategory.pas`
- **Source code**: `Source/` directory (~200 .pas files)
- **External dependencies**: `ExtLibs/djson/` (JSON serialization)
- **Include files**: `Source/ioGlobalDef.inc`, `Source/ioFireDAC_uses.inc`

## Supported Databases

| Database | Professional | Enterprise |
|----------|--------------|------------|
| SQLite | Yes | Yes |
| Firebird | Yes | Yes |
| MS SQL Server | No | Yes |

Each database has dedicated modules:
- Connection definition: `iORM.DB.ConnectionDef.*.pas`
- SQL generator: `iORM.DB.*.SqlGenerator.pas`
- Data converter: `iORM.DB.*.SqlDataConverter.pas`
- DBBuilder analyzer: `iORM.DBBuilder.DBAnalyzer.*.pas`
- DBBuilder SQL generator: `iORM.DBBuilder.SqlGenerator.*.pas`
- DBBuilder strategy: `iORM.DBBuilder.Strategy.*.pas`

## Sample Applications

Located in `Samples/`:
- **PizzAmore_25_LowCode_Classes_SimpleViews**: Classes-based approach with FMX, VCL, and multiple server implementations (DMVC, WebBroker, WiRL)
- **PizzAmore_30_LowCode_Interfaces_MVVM**: Interface + MVVM approach with FMX, VCL, uniGUI

## Key Entry Points for Development

- Main ORM entry: `Source/iORM.pas`
- Context interfaces: `Source/iORM.Context.Interfaces.pas`
- Attributes: `Source/iORM.Attributes.pas`
- Common types/enums: `Source/iORM.CommonTypes.pas`
- Exceptions: `Source/iORM.Exceptions.pas`

## Code Documentation Standards

**XML Documentation Format:**

Use an **adaptive hybrid approach** for XML documentation:

### Simple Methods (self-explanatory, few parameters):
```pascal
/// <summary>Brief description in one line</summary>
function SimpleMethod: Boolean;
```

### Complex Methods (multi-parameter, articulated behavior):
```pascal
/// <summary>
/// Brief description (1-2 lines max)
/// </summary>
/// <param name="AParam">Concise description</param>
/// <returns>What it returns</returns>
function ComplexMethod(...): String;
```

**Available XML tags:**
- `<summary>` - General description
- `<param name="...">` - Parameter description
- `<returns>` - Return value
- `<exception cref="...">` - Exceptions raised
- `<remarks>` - Additional notes
- `<example>` - Code examples

**Rationale:**
- Balances quality and practicality
- Keeps source code clean and navigable
- Provides excellent IDE intellisense hints
- Focuses documentation effort where it matters most

## Git Workflow

**IMPORTANT: Never create commits automatically.**

When code changes are complete:
1. Show the git diff to the user
2. Ask explicit confirmation before creating any commit
3. Only commit if the user explicitly requests it (e.g., "fai il commit", "commit now", etc.)
4. Never assume the user wants a commit just because the work is done

This ensures the user maintains full control over the commit history.

**Commit Format:**
- Do NOT add "Co-Authored-By" trailers to commit messages
- Use standard commit messages only
- Keep messages concise but descriptive of the changes
