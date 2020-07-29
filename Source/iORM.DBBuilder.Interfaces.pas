unit iORM.DBBuilder.Interfaces;

interface

uses
  System.Generics.Collections, iORM.Context.Table.Interfaces, iORM.Context.Properties.Interfaces, System.Classes,
  iORM.Context.Map.Interfaces, iORM.Attributes, iORM.CommonTypes;

type

  TioDBBuilderStatus = (dbsClean, dbsAlter, dbsCreate);
  TioDBBuilderFieldAlterStatus = (alFieldType, alFieldDefault, alFieldNotNull);
  TioDBBuilderFieldAlter = set of TioDBBuilderFieldAlterStatus;

  IioDBBuilderSchemaFK = interface
    ['{1F653F52-570B-4381-930D-FB3945025DA2}']
    function Name: String;
    function ReferenceTableName: String;
    function ReferenceFieldName: String;
    function DependentTableName: String;
    function DependentFieldName: String;
    function OnDeleteAction: TioFKAction;
    function OnUpdateAction: TioFKAction;
  end;

  IioDBBuilderSchemaField = interface
    ['{D06F09FD-7252-46E3-A955-E6C2A3095E77}']
    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
    function Altered: TioDBBuilderFieldAlter;
    function FieldName: String;
    function GetContextProperty: IioContextProperty;
    function PrimaryKey: Boolean;
    function NotNull: Boolean;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  TioDBBuilderSchemaFields = TDictionary<String, IioDBBuilderSchemaField>;
  TioDBBuilderSchemaIndexes = TioIndexList;
  TioDBBuilderSchemaForeignKeys = TDictionary<String, IioDBBuilderSchemaFK>;

  IioDBBuilderSchemaTable = interface
    ['{2AFBE991-7E33-42DB-892E-01F8C98A5B8F}']
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function Fields: TioDBBuilderSchemaFields;
    function ForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetContextTable: IioCOntextTable;
    // function IDField: IioDBBuilderSchemaField;
    function Indexes: TioDBBuilderSchemaIndexes;
    function PrimaryKeyField: IioDBBuilderSchemaField;
    function TableName: String;
    // IsClassFromField
    procedure SetIsClassFromField(const AValue: Boolean);
    function GetIsClassFromField: Boolean;
    property IsClassFromField: Boolean read GetIsClassFromField write SetIsClassFromField;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  TioDBBuilderSchemaTables = TDictionary<String, IioDBBuilderSchemaTable>;

  IioDBBuilderSchema = interface
    ['{1AEDB134-1ECB-490E-A53A-973BEDE509E5}']
    function ConnectionDefName: String;
    function DatabaseFileName: String;
    function ErrorMsg: String;
    function FindOrCreateTable(const AMap: IioMap): IioDBBuilderSchemaTable;
    function FindTable(const ATableName: String): IioDBBuilderSchemaTable;
    function ForeignKeysEnabled: Boolean;
    function IndexesEnabled: Boolean;
    function SqlScript: TStrings;
    function SqlScriptEmpty: Boolean;
    function Warnings: TStrings;
    function WarningExists: Boolean;
    function Tables: TioDBBuilderSchemaTables;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

  // DBBuilder reference
  TioDBBuilderSchemaBuilderRef = class of TioDBBuilderSchemaBuilderIntf;

  TioDBBuilderSchemaBuilderIntf = class abstract
  public
    class procedure BuildSchema(const ASchema: IioDBBuilderSchema); virtual; abstract;
  end;

  IioDBBuilderSqlGenerator = interface
    ['{9B5DE886-BE08-4422-9D6C-A92ABF948CD9}']
    // Script repated methods
    procedure ScriptAddTitle(const AText: String);
    procedure ScriptBegin;
    procedure ScriptEnd;
    // Database related methods
    function DatabaseExists: Boolean;
    procedure CreateDatabase;
    // Tables related methods
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
    procedure BeginCreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure EndCreateTable(const ATable: IioDBBuilderSchemaTable);
    procedure BeginAlterTable(const ATable: IioDBBuilderSchemaTable);
    procedure EndAlterTable(const ATable: IioDBBuilderSchemaTable);
    // Fields related methods
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): Boolean;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): Boolean;
    procedure CreateField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    procedure CreateClassInfoField(ACommaBefore: Char);
    procedure AddField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    procedure AlterField(const AField: IioDBBuilderSchemaField; ACommaBefore: Char);
    // PrimaryKey & other indexes
    procedure AddPrimaryKey(ATable: IioDBBuilderSchemaTable);
    procedure AddIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: ioIndex);
    procedure DropAllIndexes;
    // Foreign keys
    procedure AddForeignKey(const AForeignKey: IioDBBuilderSchemaFK);
    procedure DropAllForeignKeys; // Not implented
    // Sequences
    procedure AddSequence(const ATable: IioDBBuilderSchemaTable);
  end;

  IioDBBuilderDBAnalyzer = interface
    ['{8F82C20B-5D51-42FE-80D2-96F818F3B555}']
    procedure Analyze;
  end;

  IioDBBuilderStrategy = interface
    ['{4187C897-A5C6-4807-87D0-C466D3EE34CE}']
    procedure GenerateScript;
  end;

  TioDBBuilderEngineRef = class of TioDBBuilderEngineIntf;

  TioDBBuilderEngineIntf = class abstract
  public
    class function GetDBStatus(const AConnectionDefName: String = IO_CONNECTIONDEF_DEFAULTNAME): TioDBBuilderEngineResult;
      virtual; abstract;
    // Generate script
    class function GenerateScript(const ASqlScriptToFill: TStrings; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True; const ARaiseIfWarningsExists: Boolean = False): TioDBBuilderEngineResult; overload;
      virtual; abstract;
    class function GenerateScript(const ASqlScriptToFill: TStrings; const AConnectionDefName: String; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True; const ARaiseIfWarningsExists: Boolean = False): TioDBBuilderEngineResult; overload;
      virtual; abstract;
    // Generate DB
    class procedure GenerateDB(const AConnectionDefName: String; const AAddIndexes: Boolean = True;
      const AAddForeignKeys: Boolean = True; const AForce: Boolean = False); overload; virtual; abstract;
    class procedure GenerateDB(const AAddIndexes: Boolean = True; const AAddForeignKeys: Boolean = True; const AForce: Boolean = False);
      overload; virtual; abstract;
    class procedure GenerateDB(const AConnectionDefName: String; const AScript: TStrings); overload; virtual; abstract;
    class procedure GenerateDB(const AScript: TStrings); overload; virtual; abstract;
  end;

implementation

end.
