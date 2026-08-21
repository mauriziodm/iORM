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
      (catalog/change query → Boolean), `Warning_`/`Hint_` (diagnostics). `GenerateScript` (bare)
      is the single public entry point (wraps `Script.ScriptBegin`/`ScriptEnd`); `GenerateScript_Body`
      is its protected abstract dialect-specific counterpart, overridden by each concrete Strategy.
      Mode selection (forcing the schema to `stCreate`, emitting the force-create warning) is
      Engine's job, done on `Context` before `GenerateScript` is called.
  - Boolean predicates and plain accessors are sanctioned exceptions (`Get*`, `Is*`, `Load*`, etc.).
  - **Layout**: methods are grouped under domain banners
    (`DATABASE`/`TABLE`/`FIELD`/`INDEX`/`SEQUENCE`/`FOREIGN KEY`/…), in the interfaces AND every
    class declaration section (derived classes use the same full `// ===` banners). Ordering within
    each group follows the general **Member ordering** convention below.
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

**Member ordering.** Within any declaration section (interface or class — methods, fields, and
properties alike), keep members in alphabetical order. When a section is further grouped — by domain
banner as in the DBBuilder `SqlGenerator.*`/`Strategy.*` families (`DATABASE`/`TABLE`/`FIELD`/…), or
simply by the Delphi visibility sections themselves (`private`/`protected`/`public`, as in the
`Schema.*` family, which uses no domain banners) — alphabetical order applies **within each group**,
not across the whole section: grouping and total ordering are mutually exclusive by definition, so
the constraint always scopes to whichever grouping is present, down to "no grouping" meaning the
whole section is one group. This is a general convention, not specific to any one family of classes,
and governs declarations only — implementation order is free. Forward-looking: apply it when a
declaration section is touched anyway (new members, or a section already being edited for another
reason), not as a retroactive reordering sweep of the existing codebase.

**Field/method/property split.** Within a visibility section that has no domain banner, when more
than one kind of member is present (fields, methods, properties), lay them out as up to three
sub-groups in that order — fields, then methods, then properties — separated by a single blank line
between any two adjacent non-empty kinds; alphabetical order still applies within each sub-group, per
the member-ordering rule above. A section with domain banners (`SqlGenerator.*`/`Strategy.*`) already
groups by banner instead — methods per banner, properties collected under their own trailing
`PROPERTIES` banner — so this split does not additionally apply there. Same forward-looking scope as
member ordering: apply when a section is touched anyway, not as a retroactive sweep.

## Interface & Class Conventions

**Interface/class property mirroring.** iORM's core pattern is interfaced objects: every `TioXxx`
class implements an `IioXxx` interface, and outside its own constructor/Factory, code holds
`IioXxx`-typed references exclusively — the concrete class name never appears as a
variable/field/parameter type elsewhere. Given this discipline, **a class must not redeclare a
`property` that only mirrors one already present on the interface it implements** — no legitimate
caller can ever reach it (nobody holds a class-typed reference to invoke it on), so it is dead code
by construction. The interface's own `GetX`/`SetX` methods must still be implemented (they satisfy
the interface contract) — only the class-level `property` wrapper is what to omit. A property/field
on the class *is* legitimate when it serves a need the interface does not cover — typically internal
use by the class or (if `protected`) by its descendants.

**Field visibility.** Declare fields `private` by default. If a field's value must be accessed by a
descendant class, do **not** widen the field itself to `protected` — instead keep the field
`private` and add a `protected` property (`property X: T read GetX write SetX;`) wrapping it, even
when `GetX`/`SetX` do nothing but return/assign the field today. The criterion is observable, not
speculative: does any code outside the declaring class (i.e. a descendant) touch this value? If yes,
route it through a property, unconditionally — a bare `protected` field can always be bypassed by a
descendant writing straight to it (skipping whatever invariant the property's setter is supposed to
enforce, now or once one is added later), which silently defeats the point of centralizing that logic
in one place. The raw field is touched in exactly one place: its own `GetX`/`SetX`. Everywhere else —
including the declaring class's own other methods — access it through the property name, not the
field, so there is never a per-call judgment call about whether to type the `F` prefix.

Within the *declaring* class itself, this still leaves a gap: a private field is directly reachable
by any method later added to that same class, so the property can be silently bypassed there too — no
compiler error, just a stray `FX` typed out of habit. Closing that gap means moving the field (and its
`GetX`/`SetX`) into a small dedicated ancestor class the "real" class inherits from instead of
declaring them itself, so it never has private access to its own guarded state. Whether that split is
worth it is a matter of the class's *role*, not its size: does the protected value describe *why the
class exists* (its whole reason for being), or is it a dependency the class merely *carries* to do
some other job? `TioDBBuilderSchemaBaseObject.Status` is the former — the class's only documented
purpose is to own that invariant, so it structurally cannot drift; no split needed.
`TioDBBuilderStrategySegregation` / `TioDBBuilderStrategyBase.Context` is the latter — the class's
job is script-generation orchestration, Context is just an ingredient it needs, so any method added
while focused on that real job risks touching the raw field by mistake; split it into a dedicated
carrier class so that mistake becomes a compile error instead of a silent bug.

**Carrier class naming.** Name the carrier class `<DerivingClassName>Segregation`, where
`<DerivingClassName>` is the name of the concrete class that inherits from it, with any trailing
`Base` suffix dropped first (avoids the redundant `...BaseSegregation`) — e.g.
`TioDBBuilderStrategyBase` → `TioDBBuilderStrategySegregation`. A class with no `Base` suffix keeps
its full name, e.g. a hypothetical `TioDBBuilderFoo` → `TioDBBuilderFooSegregation`. Don't name it after *what* it carries
(`...ContextSegregation`, `...DependenciesSegregation`) — the carried field(s) are visible in the
class body one line below, and a single mechanical rule is easier to apply consistently than picking
a descriptive word each time.

**Method visibility.** The same criterion behind field visibility extends from properties to methods,
including the methods a class implements to satisfy an interface: default to `private`, and widen
only on demonstrated need. Method dispatch through an interface reference resolves via the
interface's own VMT, independent of the Delphi-level visibility of the implementing method in the
concrete class — so even a `private` method correctly satisfies and dispatches through the interface
contract; there is no technical floor of `protected`. Widen a method to `protected` only when a
descendant class genuinely calls or overrides it — observable need, not "might be useful to a
subclass someday." Only constructors (and any public destructor) stay `public`; everything else
starts `private` and escalates one step at a time only as real callers demand it. This is a
forward-looking convention: apply it when a class is touched anyway (new code, or a class already
being reworked for another reason), not as a retroactive sweep of the existing codebase.

*Delphi gotcha: overriding across units.* Plain `private` is scoped to the *unit*, not the class. A
descendant declared in the *same* unit can still reach a `private` ancestor member, but a descendant
in *another* unit cannot even see it, let alone write `override` on it. If a method must be
overridable by a descendant that lives in a different unit, it needs `protected`, not `private` —
`private` only stays viable when the whole hierarchy that touches the member lives in one unit.

*Testing.* Prefer testing every class exclusively through the interface it implements (`IioXxx`) —
the same discipline production code follows. That covers the overwhelming majority of cases and
means `private`/`protected` on internal methods never gets in a test's way. If some internal method
is complex enough to deserve isolated, targeted testing outside the class's full public behavior,
that is usually a sign it deserves to be its own small class with its own interface — extract it,
and it becomes independently testable through that interface like everything else, no visibility
exception required. Only when extraction genuinely is not practical, use the same interface
segregation trick already applied elsewhere in the codebase (e.g.
`TioDBBuilderStrategySegregation`): declare a narrow, test-only interface exposing just the
internal member(s) under test, have the class implement it alongside its main interface, and cast to
it in the test (`(LObj as IioXxxTestSeam).InternalMethod`) — no class references, no subclassing.
Declare that seam interface in a unit production code never imports (e.g. a test-support unit), never
next to the main interface: if it sat there, nothing would stop production code from doing the same
cast and quietly reaching into internals, defeating the whole point of this convention.

**Delphi gotcha when the carrier class lives in the same unit as the class inheriting from it**
(the common case, to avoid a whole extra file for one field): plain `private` in Delphi is scoped to
the *unit*, not the *class* — any other class declared in that same unit can still see it, silently
reopening the exact gap the split was meant to close. Declare the carrier's field (and its `GetX`/
`SetX`) `strict private`, not `private`, so visibility is truly limited to the carrier class itself.

**Explicit empty visibility sections.** Every class declaration that declares at least one member
must include `private` (or `strict private`), `protected` (or `strict protected`), and `public`
explicitly, in that canonical order, even when a section has nothing in it — `published` stays
optional. The payoff is a fixed landmark: scrolling through a large class, hitting an empty
`protected:` (or `public:`) tells you unambiguously that everything above, back to the last section
header, belonged to the previous section, without having to scroll back up to find it. Exempt:
classes deriving (directly or indirectly) from `Exception` — see `iORM.Exceptions.pas`, where dozens
of tiny exception classes sit one banner-separated line apart, some with just a `constructor Create`
overload; forcing empty `private`/`protected` sections onto each would be pure noise in a hierarchy
that stays small by nature. Forward-looking, same as member ordering and method visibility above:
apply when a class declaration is touched anyway, not as a retroactive sweep of the existing
codebase.

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
