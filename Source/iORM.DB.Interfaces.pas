{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.DB.Interfaces;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.Interfaces,
  System.Classes,
  System.Rtti, iORM.Context.Table.Interfaces,
  FireDAC.Comp.Client, FireDAC.Stan.Param,
  Data.DB, FireDAC.Stan.Intf, iORM.CommonTypes,
  System.JSON, iORM.Where.Interfaces,
  FireDAC.Comp.DataSet;

const
    KEY_WHERE = 'Where';
    KEY_SQLDESTINATION = 'SQLDestination';
    KEY_DATAOBJECT = 'DataObj';
    KEY_JSONDATAVALUE = 'JSONDataValue';
    KEY_RELATIONPROPERTYNAME = 'RelPropName';
    KEY_RELATIONOID = 'RelOID';
    KEY_BLINDINSERT = 'Blind';
    KEY_STREAM = 'Stream';

type

  TioInternalSqlConnection = TFDConnection;
  TioInternalSqlQuery = TFDQuery;
  TioFields = TFields;
  TioParam = TFDParam;
  TioParams = TFDParams;

  // Strategy class reference
  TioStrategyRef = class of TioStrategyIntf;

  TioConnectionType = (cdtFirebird, cdtSQLite, cdtSQLServer, cdtMySQL, cdtREST);
  TioConnectionInfo = record
    ConnectionName: String[20];
    Persistent: Boolean;
    Strategy: TioStrategyRef;
    constructor Create(const AConnectionName:String; const AConnectionType:TioConnectionType; const APersistent:Boolean);
    case ConnectionType: TioConnectionType of
      cdtFirebird, cdtSQLite, cdtSQLServer, cdtMySQL:
        ();
      cdtREST:
        (BaseURL: String[100];
         UserName: String[20];
         Password: String[20]);
  end;

  TioCompareOperatorRef = class of TioCompareOperator;
  TioLogicRelationRef = class of TioLogicRelation;
  TioSqlDataConverterRef = class of TioSqlDataConverter;
  TioSqlGeneratorRef = class of TioSqlGenerator;

  // -Classe per il connection manager che funge da repository dei parametri di tutte
  //   connessioni e da gestore del connection pooling
  // -Interfaccia per oggetti contenenti i parametri di una connessione da inserire
  //  nel connection manager
  //  In pratica utilizzo l'interfaccia "IFDStanConnectionDef" fornita da FireDAC
  IIoConnectionDef = IFDStanConnectionDef;

  // Forward declaration
  IioQuery = interface;

  // Interfaccia per il QueryContainer che contiene la collezione di tutte gli oggetti IioQuery creati
  //  per una connessione. In pratica ogni connessione (IioConnection) contiene la collezione di query
  //  create per la connessione stessa in modo da poterle riutilizzare. Il ciclo di vita di questi oggetti query
  //  coincide quindi con quello della connessione che a sua volta coincide con quello della transazione.
  IioQueryContainer = interface
    ['{9CF03765-6685-48A3-8DCC-85C7040D676D}']
    function Exist(AQueryIdentity:String): Boolean;
    function GetQuery(AQueryIdentity:String): IioQuery;
    procedure AddQuery(AQueryIdentity:String; AQuery:IioQuery);
    procedure CleanQueryConnectionsRef;
  end;

  // Interfaccia per il componente connection da fornire alla query per la
  //  connessione al database
  IioConnectionDB = interface;
  IioConnectionREST = interface;
  IioConnection = interface
    ['{FF5D54D7-7EBE-4E6E-830E-E091BA7AE929}']
    procedure Free;
    function IsDBConnection: Boolean;
    function IsRESTConnection: Boolean;
    function AsDBConnection: IioConnectionDB;
    function AsRESTConnection: IioConnectionREST;
    function GetConnectionInfo: TioConnectionInfo;
    function InTransaction: Boolean;
    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
  end;

  IioConnectionDB = interface(IioConnection)
    ['{997CFE22-031A-468A-BF67-E076C43DC0E2}']
    function GetConnection: TioInternalSqlConnection;
    function QueryContainer: IioQueryContainer;
  end;

  IioRESTRequestBody = interface;
  IioRESTResponseBody = interface;

  IioConnectionREST = interface(IioConnection)
    ['{E29F952A-E7E5-44C7-A3BE-09C4F2939060}']
    procedure Execute(const AResource:String);
    // ioRequestBody property
    function GetRequestBody:IioRESTRequestBody;
    property RequestBody:IioRESTRequestBody read GetRequestBody;
    // ioResponseBody property
    function GetResponseBody:IioRESTResponseBody;
    property ResponseBody:IioRESTResponseBody read GetResponseBody;
  end;

  // Interfaccia per il componente Query, cioè del componente che si
  //  occuperà di eseguire il codice SQL o altro per caricare/modificare/eliminare
  //  il dato
  IioQuery = interface
    ['{E8CFB984-2572-4D6F-BC4B-A4454F1EEDAA}']
    function GetQuery: TioInternalSqlQuery;
    procedure First;
    procedure Last;
    procedure Next;
    procedure Prior;
    function Eof: Boolean;
    function GetValue(AProperty:IioContextProperty): TValue;
    function GetValueByFieldNameAsVariant(AFieldName:String): Variant;
    procedure Open;
    procedure Close;
    function IsEmpty: Boolean;
    function IsSqlEmpty: Boolean;
    function ExecSQL: Integer;
    function GetSQL: TStrings;
    function Fields: TioFields;
    function ParamByName(AParamName:String): TioParam;
    function ParamByProp(AProp:IioContextProperty): TioParam;
    procedure SetParamValueByContext(AProp:IioContextProperty; AContext:IioContext);
    procedure SetParamValueToNull(AProp:IioContextProperty; AForceDataType:TFieldType=ftUnknown);
    function Connection: IioConnection;
    procedure CleanConnectionRef;
    function CreateBlobStream(AProperty: IioContextProperty; Mode: TBlobStreamMode): TStream;
    procedure SaveStreamObjectToSqlParam(AObj:TObject; AProperty: IioContextProperty);
    property SQL: TStrings read GetSQL;
  end;

  // Interfaccia per le classi che si occupano di convertire i dati in
  //  rappresentazioni degli stessi da inserire nel testo delle query,
  TioSqlDataConverter = class abstract
  public
    class function StringToSQL(const AString:String): String; virtual; abstract;
    class function FloatToSQL(const AFloat:Extended): String; virtual; abstract;
    class function PropertyToFieldType(const AProp:IioContextProperty): String; virtual; abstract;
    class function TValueToSql(const AValue:TValue): String; virtual; abstract;
    class function QueryToTValue(const AQuery:IioQuery; const AProperty:IioContextProperty): TValue; virtual; abstract;
  end;

  // INterfaccia per le classi che devono generare i vari tipi di query
  //  Select/Update/Insert/Delete
  TioSqlGenerator = class abstract
  strict protected
    class procedure LoadSqlParamsFromContext(const AQuery:IioQuery; const AContext:IioContext);
    class function BuildIndexName(const AContext:IioContext; const ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation; const AUnique:Boolean): String;
  public
    class procedure GenerateSqlSelect(const AQuery:IioQuery; const AContext:IioContext); virtual; abstract;
    class procedure GenerateSqlInsert(const AQuery:IioQuery; const AContext:IioContext); virtual; abstract;
    class procedure GenerateSqlNextID(const AQuery:IioQuery; const AContext:IioContext); virtual; abstract;
    class procedure GenerateSqlUpdate(const AQuery:IioQuery; const AContext:IioContext); virtual; abstract;
    class procedure GenerateSqlDelete(const AQuery:IioQuery; const AContext:IioContext); virtual; abstract;
    class procedure GenerateSqlForExists(const AQuery:IioQuery; const AContext:IioContext); virtual; abstract;
    class function GenerateSqlJoinSectionItem(const AJoinItem: IioJoinItem): String; virtual; abstract;
    class procedure GenerateSqlForCreateIndex(const AQuery:IioQuery; const AContext:IioContext; AIndexName:String; const ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation; const AUnique:Boolean); virtual; abstract;
    class procedure GenerateSqlForDropIndex(const AQuery:IioQuery; const AContext:IioContext; AIndexName:String); virtual; abstract;
  end;

  // Interfaccia per le classi che devono generare le LogicRelations
  TioLogicRelation = class abstract
    class function _And           : IioSqlItem; virtual; abstract;
    class function _Or            : IioSqlItem; virtual; abstract;
    class function _Not           : IioSqlItem; virtual; abstract;
    class function _OpenPar       : IioSqlItem; virtual; abstract;
    class function _ClosePar      : IioSqlItem; virtual; abstract;
  end;

  // Interfaccia per le classi che devono generare operatori di comparazione
  TioCompareOperator = class abstract
    class function _Equal: IioSqlItem; virtual; abstract;
    class function _Greater: IioSqlItem; virtual; abstract;
    class function _Lower: IioSqlItem; virtual; abstract;
    class function _GreaterOrEqual: IioSqlItem; virtual; abstract;
    class function _LowerOrEqual: IioSqlItem; virtual; abstract;
    class function _NotEqual: IioSqlItem; virtual; abstract;
    class function _Like: IioSqlItem; virtual; abstract;
    class function _IsNull: IioSqlItem; virtual; abstract;
    class function _IsNotNull: IioSqlItem; virtual; abstract;
  end;

  // Interface for TransactionColection
  IioTransactionCollection = interface
    ['{27836795-C804-4CB2-8A5A-98491643D5D9}']
    procedure StartTransaction(AConnectionName:String='');
    procedure CommitAll;
    procedure RollbackAll;
  end;

  // Interface for SQLDestination
  IioSQLDestination = interface
    ['{37F6E5A8-267C-4EEA-9F32-5C8086D488E5}']
    // Destinations
    {TO 5DO -oOwner -cGeneral : Un altro overload di Trabslate che accetta un'interfaccia e che genera automaticamente una query che fa l'UNION ALL di tutte le classi che implementano l'interfaccia stessa}
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable:TFDMemTable); overload;
    function Execute(const AIgnoreObjNotExists:Boolean=False): Integer; overload;
    // Informations
    function Connection(const AConnectionName:String): IioSQLDestination;
    function SelfClass(const ASelfClassName:String): IioSQLDestination; overload;
    function SelfClass(const ASelfClassRef: TioClassRef): IioSQLDestination; overload;
    function QualifiedFieldName(const AQualifiedFieldName:Boolean=True): IioSQLDestination;
    // Getters
    ['{D49E85DA-C71F-4E00-A8F8-31312EBEE642}']
    function GetTranslatedSQL: String; overload;
    function GetConnectionName: String;
    function GetIgnoreObjNotExists: Boolean;
  end;

  IioRESTRequestBody = interface
    ['{83DE9ECE-47EA-4814-B40E-3E39FAA210A2}']
    procedure Clear;
    function ToJSONObject:TJSONObject;
    // Where
    procedure SetWhere(const Value: IioWhere);
    function GetWhere: IioWhere;
    property Where:IioWhere read GetWhere write SetWhere;
    // SQLDestination
    procedure SetSQLDestination(const Value: IioSQLDestination);
    function GetSQLDestination: IioSQLDestination;
    property SQLDestination:IioSQLDestination read GetSQLDestination write SetSQLDestination;
    // DataObject
    procedure SetDataObject(const Value: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
    // RelationPropertyName
    procedure SetRelationPropertyName(const Value: String);
    function GetRelationPropertyName: String;
    property RelationPropertyName:String read GetRelationPropertyName write SetRelationPropertyName;
    // RelationOID
    procedure SetRelationOID(const Value: Integer);
    function GetRelationOID: Integer;
    property RelationOID:Integer read GetRelationOID write SetRelationOID;
    // BlindInsert
    procedure SetBlindInsert(const Value: Boolean);
    function GetBlindInsert: Boolean;
    property BlindInsert:Boolean read GetBlindInsert write SetBlindInsert;
  end;

  IioRESTResponseBody = interface
    ['{E5A14525-308F-4877-99B7-C270D691FC6D}']
    function ToJSONObject:TJSONObject;
    // JSONDataValue
    procedure SetJSONDataValue(const Value: TJSONValue);
    function GetJSONDataValue: TJSONValue;
    property JSONDataValue:TJSONValue read GetJSONDataValue write SetJSONDataValue;
    // DataObject
    procedure SetDataObject(const Value: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
    // Stream
    function GetStream: TStream;
    property Stream: TStream read GetStream;
  end;

  // Base class for strategy (Static class as an interface)
  TioStrategyIntf = class abstract
  public
    class procedure StartTransaction(const AConnectionName:String); virtual; abstract;
    class procedure CommitTransaction(const AConnectionName:String); virtual; abstract;
    class procedure RollbackTransaction(const AConnectionName:String); virtual; abstract;
    class procedure PersistObject(const AObj: TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); virtual; abstract;
    class procedure PersistCollection(const ACollection:TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); virtual; abstract;
    class procedure DeleteObject(const AObj: TObject; const AConnectionName:String); virtual; abstract;
    class procedure Delete(const AWhere: IioWhere); virtual; abstract;
    class procedure LoadList(const AWhere: IioWhere; const AList:TObject); virtual; abstract;
    class function LoadObject(const AWhere: IioWhere; const AObj:TObject): TObject; virtual; abstract;
    class function LoadObjectByClassOnly(const AWhere: IioWhere; const AObj:TObject): TObject; virtual; abstract;
    class procedure LoadDataSet(const AWhere: IioWhere; const ADestDataSet:TFDDataSet); virtual; abstract;
    // SQLDestinations
    class procedure SQLDest_LoadDataSet(const ASQLDestination:IioSQLDestination; const ADestDataset:TFDDataSet); virtual; abstract;
    class function SQLDest_Execute(const ASQLDestination:IioSQLDestination): Integer; virtual; abstract;
  end;

implementation

uses
  iORM.SqlTranslator, iORM.Strategy.Factory;


{ TioSqlGenerator }

class function TioSqlGenerator.BuildIndexName(const AContext: IioContext;
  const ACommaSepFieldList: String;
  const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean): String;
var
  LFieldList: TStrings;
  LField: String;
begin
  // Build the indexname
  Result := 'IDX_' + AContext.GetTable.TableName;
  // Field list
  LFieldList := TStringList.Create;
  try
    LFieldList.Delimiter := ',';
    LFieldList.DelimitedText := ACommaSepFieldList;
    for LField in LFieldList do
      Result := Result + '_' + LField;
  finally
    LFieldList.Free;
  end;
  // Index orientation
  case AIndexOrientation of
    ioAscending: Result := Result + '_ASC';
    ioDescending: Result := Result + '_DESC';
  end;
  // Unique
  if AUnique then
    Result := Result + '_UNIQUE';
  // Translate
  Result := TioSqlTranslator.Translate(Result, AContext.GetClassRef.ClassName, False);
end;

class procedure TioSqlGenerator.LoadSqlParamsFromContext(const AQuery: IioQuery; const AContext: IioContext);
var
  Prop: IioContextProperty;
begin
  // Load query parameters from context
  for Prop in AContext.GetProperties do
    if Prop.IsBlob then
      AQuery.SaveStreamObjectToSqlParam(Prop.GetValue(AContext.DataObject).AsObject, Prop);
end;

{ TioConnectionInfo }

constructor TioConnectionInfo.Create(const AConnectionName:String; const AConnectionType: TioConnectionType;
  const APersistent: Boolean);
begin
  ConnectionName := AConnectionName;
  ConnectionType := AConnectionType;
  Persistent := APersistent;
  Strategy := TioStrategyFactory.ConnectionTypeToStrategy(AConnectionType);
end;

end.
