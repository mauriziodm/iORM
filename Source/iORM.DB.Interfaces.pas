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
unit iORM.DB.Interfaces;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.Context.Table.Interfaces,
  iORM.Interfaces,
  System.Classes,
  System.Rtti,
  FireDAC.Comp.Client, FireDAC.Stan.Param,
  Data.DB, FireDAC.Stan.Intf, iORM.CommonTypes,
  System.JSON, iORM.Where.Interfaces,
  FireDAC.Comp.DataSet, iORM.LiveBindings.BSPersistence,
  iORM.Where.SqlItems.Interfaces, iORM.Context.Map.Interfaces,
  iORM.SynchroStrategy.Interfaces, iORM.SynchroStrategy.Custom,
  iORM.Auth.Interfaces;

const
  OBJVERSION_NULL = 0;
  TRANSACTION_TIMESTAMP_NULL = 0;

  KEY_SESSION_USERID = 'UserID';
  KEY_SESSION_USERNAME = 'UserName';
  KEY_AUTH_INTENTION = 'AuthIntention';
  KEY_AUTH_SCOPE = 'AuthScope';
  KEY_AUTH_TOKEN = 'AuthToken';
  KEY_AUTH_RESULT_ISAUTHORIZED = 'AuthResultIsAuthorized';
  KEY_AUTH_RESULT1 = 'AuthResult1';
  KEY_AUTH_RESULT2 = 'AuthResult2';
  KEY_BLINDLEVEL = 'BlindLevel';
  KEY_EXCEPTIONCLASSNAME = 'ExceptionClassName';
  KEY_EXCEPTIONMESSAGE = 'ExceptionMessage';
  KEY_INTENTTYPE = 'IntentType';
  KEY_JSONDATAVALUE = 'JSONDataValue';
  KEY_METHODNAME = 'MethodName';
  KEY_RELATIONOID = 'RelationOID';
  KEY_RELATIONPROPERTYNAME = 'RelationPropertyName';
  KEY_SQLDESTINATION = 'SQLDestination';
  KEY_STREAM = 'Stream';
  KEY_WHERE = 'Where';

type

  TioInternalSqlConnection = TFDConnection;
  TioInternalSqlQuery = TFDQuery;
  TioFields = TFields;
  TioParam = TFDParam;
  TioParams = TFDParams;

  // Strategy class reference
  TioPersistenceStrategyRef = class of TioPersistenceStrategyIntf;

  TioConnectionType = (ctFirebird, ctSQLite,
{$IFNDEF ioDelphiProfessional}
    ctSQLServer,
{$ENDIF}
    ctMySQL, ctHTTP);

  TioKeyGenerationTime = (kgtUndefined, kgtAfterInsert, kgtBeforeInsert);

  TioConnectionInfo = class
  strict private
    FBaseURL: String;
    FConnectionName: String;
    FConnectionType: TioConnectionType;
    FKeyGenerationTime: TioKeyGenerationTime;
    FPassword: String;
    FPersistent: Boolean;
    FPersistenceStrategy: TioPersistenceStrategyRef;
    FUserName: String;
    FSynchroStrategy: IioSynchroStrategy_Client;
  public
    constructor Create(const AConnectionName: String; const AConnectionType: TioConnectionType; const APersistent: Boolean;
      const AKeyGenerationTime: TioKeyGenerationTime; const ASynchroStrategy: IioSynchroStrategy_Client);
    property BaseURL: String read FBaseURL write FBaseURL;
    property ConnectionName: String read FConnectionName write FConnectionName;
    property ConnectionType: TioConnectionType read FConnectionType write FConnectionType;
    property KeyGenerationTime: TioKeyGenerationTime read FKeyGenerationTime write FKeyGenerationTime;
    property Password: String read FPassword write FPassword;
    property Persistent: Boolean read FPersistent write FPersistent;
    property PersistenceStrategy: TioPersistenceStrategyRef read FPersistenceStrategy write FPersistenceStrategy;
    property UserName: String read FUserName write FUserName;
    property SynchroStrategy: IioSynchroStrategy_Client read FSynchroStrategy write FSynchroStrategy;
  end;

  TioCompareOperatorRef = class of TioCompareOperator;
  TioLogicRelationRef = class of TioLogicRelation;
  TioSqlDataConverterRef = class of TioSqlDataConverter;
  TioSqlGeneratorRef = class of TioSqlGenerator;

  // -Classe per il connection manager che funge da repository dei parametri di tutte
  // connessioni e da gestore del connection pooling
  // -Interfaccia per oggetti contenenti i parametri di una connessione da inserire
  // nel connection manager
  // In pratica utilizzo l'interfaccia "IFDStanConnectionDef" fornita da FireDAC
  IIoStanConnectionDef = IFDStanConnectionDef;

  // Forward declaration
  IioQuery = interface;

  // Interfaccia per il QueryContainer che contiene la collezione di tutte gli oggetti IioQuery creati
  // per una connessione. In pratica ogni connessione (IioConnection) contiene la collezione di query
  // create per la connessione stessa in modo da poterle riutilizzare. Il ciclo di vita di questi oggetti query
  // coincide quindi con quello della connessione che a sua volta coincide con quello della transazione.
  IioQueryContainer = interface
    ['{9CF03765-6685-48A3-8DCC-85C7040D676D}']
    function TryGetQuery(AQueryIdentity: String; out ResultQuery: IioQuery): Boolean;
    procedure AddQuery(AQueryIdentity: String; AQuery: IioQuery);
    procedure CleanQueryConnectionsRef;
  end;

  // Interfaccia per il componente connection da fornire alla query per la
  // connessione al database
  IioConnectionDB = interface;
  IioConnectionHttp = interface;

  IioConnection = interface
    ['{FF5D54D7-7EBE-4E6E-830E-E091BA7AE929}']
    procedure Free;
    function IsDBConnection: Boolean;
    function IsHttpConnection: Boolean;
    function AsDBConnection: IioConnectionDB;
    function AsHttpConnection: IioConnectionHttp;
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
    function LastTransactionTimestamp: TDateTime;
    procedure LastTransactionTimestampReset;
  end;

  IioHttpRequestBody = interface;
  IioHttpResponseBody = interface;

  IioConnectionHttp = interface(IioConnection)
    ['{E29F952A-E7E5-44C7-A3BE-09C4F2939060}']
    procedure Execute(const AResource: String);
    // ioRequestBody property
    function GetioRequestBody: IioHttpRequestBody;
    property ioRequestBody: IioHttpRequestBody read GetioRequestBody;
    // ioResponseBody property
    function GetioResponseBody: IioHttpResponseBody;
    property ioResponseBody: IioHttpResponseBody read GetioResponseBody;
  end;

  // Interfaccia che contiene info sulla connessione e sull'utente correnti, in generale sulle sessione
  IioSession = interface
    function GetConnectionName: String;
    function GetUserID: Integer;
    function GetUserName: String;
    procedure SetConnectionName(const Value: String);
    procedure SetUserID(const Value: Integer);
    procedure SetUserName(const Value: String);
    property ConnectionName: String read GetConnectionName write SetConnectionName;
    property UserName: String read GetUserName write SetUserName;
    property UserID: Integer read GetUserID write SetUserID;
  end;

  // Interfaccia per il componente Query, cioè del componente che si
  // occuperà di eseguire il codice SQL o altro per caricare/modificare/eliminare
  // il dato
  IioQuery = interface
    ['{E8CFB984-2572-4D6F-BC4B-A4454F1EEDAA}']
    function GetQuery: TioInternalSqlQuery;
    procedure Next;
    function Eof: Boolean;
    function GetValue(const AProperty: IioProperty; const AContext: IioContext): TValue;
    procedure Open;
    procedure Close;
    function IsEmpty: Boolean;
    function IsSqlEmpty: Boolean;
    function IsActive: Boolean;
    function ExecSQL: Integer;
    function Fields: TioFields;
    function ExtractTrueClassName(const AContext: IioContext): String;
    procedure FillQueryWhereParams(const AContext: IioContext);
    procedure CleanConnectionRef;
    function CreateBlobStream(const AProperty: IioProperty; const Mode: TBlobStreamMode): TStream;
    procedure ParamByName_SetValue(const AParamName: String; const AValue: Variant);
    procedure ParamByProp_Clear(const AProp: IioProperty; const ADataType: TFieldType);
    procedure ParamByProp_SetValue(const AProp: IioProperty; const AValue: Variant);
    procedure ParamByProp_SetValueAsString(const AProp: IioProperty; const AValue: String);
    procedure ParamByProp_SetValueAsDateTime(const AProp: IioProperty; const AValue: TDateTime);
    procedure ParamByProp_SetValueAsDate(const AProp: IioProperty; const AValue: TDate);
    procedure ParamByProp_SetValueAsTime(const AProp: IioProperty; const AValue: TTime);
    procedure ParamByProp_SetValueAsFloat(const AProp: IioProperty; const AValue: Double);
    procedure ParamByProp_SetValueByContext(const AProp: IioProperty; const AContext: IioContext);
    procedure ParamByProp_SetValueAsInteger(const AProp: IioProperty; const AValue: Integer);
    procedure ParamByProp_SetValueAsIntegerNullIfZero(const AProp: IioProperty; const AValue: Integer);
    procedure ParamByProp_LoadAsStreamObj(const AObj: TObject; const AProperty: IioProperty);
    procedure ParamObjVersion_SetValue(const AContext: IioContext);
    procedure ParamObjCreated_SetValue(const AContext: IioContext);
    procedure ParamObjCreatedUserID_SetValue(const AContext: IioContext);
    procedure ParamObjCreatedUserName_SetValue(const AContext: IioContext);
    procedure ParamObjUpdated_SetValue(const AContext: IioContext);
    procedure ParamObjUpdatedUserID_SetValue(const AContext: IioContext);
    procedure ParamObjUpdatedUserName_SetValue(const AContext: IioContext);
    procedure WhereParamByProp_SetValue(const AProp: IioProperty; const AValue: Variant);
    procedure WhereParamByProp_SetValueAsDateTime(const AProp: IioProperty; const AValue: TDateTime);
    procedure WhereParamByProp_SetValueAsFloat(const AProp: IioProperty; const AValue: Double);
    procedure WhereParamObjID_SetValue(const AContext: IioContext);
    procedure WhereParamObjVersion_SetValue(const AContext: IioContext);
    // Connection property
    function GetConnection: IioConnectionDB;
    property Connection: IioConnectionDB read GetConnection;
    // SQL property
    function GetSQL: TStrings;
    property SQL: TStrings read GetSQL;
  end;

  // Interfaccia per la classe che esegue script sul DB (usato dal DBBuilder)
  IioScript = interface
    ['{DF0FA3CE-233A-454E-A501-4FFDAE0CD713}']
    procedure Execute;
  end;

  // Interfaccia per le classi che si occupano di convertire i dati in
  // rappresentazioni degli stessi da inserire nel testo delle query,
  TioSqlDataConverter = class abstract
  public
    class function StringToSQL(const AString: String): String; virtual; abstract;
    class function FloatToSQL(const AFloat: Extended): String; virtual; abstract;
    class function PropertyToFieldType(const AProp: IioProperty): String; virtual; abstract;
    class function TValueToSql(const AValue: TValue): String; virtual; abstract;
    class function QueryToTValue(const AQuery: IioQuery; const AProperty: IioProperty): TValue; virtual; abstract;
    class procedure SetQueryParamByContext(const AQuery: IioQuery; const AProp: IioProperty; const AContext: IioContext); virtual; abstract;
    class function FieldNameToSqlFieldName(const AFieldName: string): string; virtual; abstract;
  end;

  // INterfaccia per le classi che devono generare i vari tipi di query
  // Select/Update/Insert/Delete
  TioSqlGenerator = class abstract
  strict protected
    class procedure LoadSqlParamsFromContext(const AQuery: IioQuery; const AContext: IioContext);
    // N.B. M.M. 11/08/18 Spostata come protected per poterla eventualmente ridefinire per database dove esiste una lunghezza massima dei nomi degli indici
  protected
    class function BuildIndexName(const AContext: IioContext; const ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation;
      const AUnique: Boolean): String; virtual;
  public
    class procedure GenerateSqlCount(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlCreateIndex(const AQuery: IioQuery; const AContext: IioContext; AIndexName: String; const ACommaSepFieldList: String;
      const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean); virtual; abstract;
    class procedure GenerateSqlCurrentTimestamp(const AQuery: IioQuery); virtual; abstract;
    class procedure GenerateSqlDelete(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlDropIndex(const AQuery: IioQuery; const AContext: IioContext; AIndexName: String); virtual; abstract;
    class procedure GenerateSqlExists(const AQuery: IioQuery; const AContext: IioContext); virtual; abstract;
    class procedure GenerateSqlInsert(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlMax(const AQuery: IioQuery; const AContext: IioContext; const AProperty: IioProperty); virtual;
    class procedure GenerateSqlMin(const AQuery: IioQuery; const AContext: IioContext; const AProperty: IioProperty); virtual;
    class procedure GenerateSqlNextID(const AQuery: IioQuery; const AContext: IioContext); virtual; abstract;
    class procedure GenerateSqlSelect(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlUpdate(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlSelectLastObjVersionFromEntity(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlSelectLastObjVersionFromETM(const AQuery: IioQuery; const AEtmContext: IioContext); virtual;
    class function GenerateSqlJoinSectionItem(const AJoinItem: IioJoinItem): String; virtual;
  end;

  // Interfaccia per le classi che devono generare le LogicRelations
  TioLogicRelation = class abstract
    class function LogicOpToLogicRelation(const ALogicOp: TioLogicOp): IioSqlItem; virtual;
    class function _And: IioSqlItem; virtual;
    class function _Or: IioSqlItem; virtual;
    class function _Not: IioSqlItem; virtual;
    class function _OpenPar: IioSqlItem; virtual;
    class function _ClosePar: IioSqlItem; virtual;
  end;

  // Interfaccia per le classi che devono generare operatori di comparazione
  TioCompareOperator = class abstract
    class function CompareOpToCompareOperator(const ACompareOp: TioCompareOp): IioSqlItem; virtual;
    class function _Equal: IioSqlItem; virtual;
    class function _NotEqual: IioSqlItem; virtual;
    class function _Greater: IioSqlItem; virtual;
    class function _Lower: IioSqlItem; virtual;
    class function _GreaterOrEqual: IioSqlItem; virtual;
    class function _LowerOrEqual: IioSqlItem; virtual;
    class function _Like: IioSqlItem; virtual;
    class function _NotLike: IioSqlItem; virtual;
    class function _IsNull: IioSqlItem; virtual;
    class function _IsNotNull: IioSqlItem; virtual;
  end;

  // Interface for TransactionColection
  IioTransactionCollection = interface
    ['{27836795-C804-4CB2-8A5A-98491643D5D9}']
    procedure StartTransaction(AConnectionName: String = '');
    procedure CommitAll;
    procedure RollbackAll;
  end;

  // Interface for SQLDestination
  IioSQLDestination = interface
    ['{B96F4E95-5609-4577-9C0D-E01013EE0093}']
    // Destinations
    { TO 5DO -oOwner -cGeneral : Un altro overload di Trabslate che accetta un'interfaccia e che genera automaticamente una query che fa l'UNION ALL di tutte le classi che implementano l'interfaccia stessa }
    procedure Execute(const AIgnoreObjNotExists: Boolean = False); overload;
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable: TFDMemTable); overload;
    // Informations
    function Connection(const AConnectionDefName: String): IioSQLDestination;
    function DoNotTranslate: IioSQLDestination;
    function QualifiedFieldName(const AQualifiedFieldName: Boolean = True): IioSQLDestination;
    function SelfClass(const ASelfClassName: String): IioSQLDestination; overload;
    function SelfClass(const ASelfClassRef: TioClassRef): IioSQLDestination; overload;
    // Getters
    function GetConnectionDefName: String;
    function GetIgnoreObjNotExists: Boolean;
    function GetSQL: String;
  end;

  IioHttpRequestBody = interface
    ['{83DE9ECE-47EA-4814-B40E-3E39FAA210A2}']
    procedure Clear;
    function ToJsonText: String;
    // ---------- session ----------
    // UserID
    procedure SetUserID(const Value: Integer);
    function GetUserID: Integer;
    property UserID: Integer read GetUserID write SetUserID;
    // UserName
    procedure SetUserName(const Value: String);
    function GetUserName: String;
    property UserName: String read GetUserName write SetUserName;
    // ---------- auth ----------
    // AuthIntention
    procedure SetAuthIntention(const Value: TioAuthIntention);
    function GetAuthIntention: TioAuthIntention;
    property AuthIntention: TioAuthIntention read GetAuthIntention write SetAuthIntention;
    // AuthScope
    procedure SetAuthScope(const Value: String);
    function GetAuthScope: String;
    property AuthScope: String read GetAuthScope write SetAuthScope;
    // AuthToken
    procedure SetAuthToken(const Value: String);
    function GetAuthToken: String;
    property AuthToken: String read GetAuthToken write SetAuthToken;
    // ---------- others ----------
    // BlindLevel
    procedure SetBlindLevel(const Value: Byte);
    function GetBlindLevel: Byte;
    property BlindLevel: Byte read GetBlindLevel write SetBlindLevel;
    // IntentType
    procedure SetIntentType(const Value: TioPersistenceIntentType);
    function GetIntentType: TioPersistenceIntentType;
    property IntentType: TioPersistenceIntentType read GetIntentType write SetIntentType;
    // JSONDataValue
    procedure SetJSONDataValue(const Value: TJSONValue);
    function GetJSONDataValue: TJSONValue;
    property JSONDataValue: TJSONValue read GetJSONDataValue write SetJSONDataValue;
    // JSONDataValueAsObject
    procedure SetJSONDataValueAsObject(const AObj: TObject);
    function GetJSONDataValueAsObject: TObject;
    property JSONDataValueAsObject: TObject read GetJSONDataValueAsObject write SetJSONDataValueAsObject;
    // MethodName
    procedure SetMethodName(const Value: String);
    function GetMethodName: String;
    property MethodName: String read GetMethodName write SetMethodName;
    // RelationOID
    procedure SetRelationOID(const Value: Integer);
    function GetRelationOID: Integer;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    // RelationPropertyName
    procedure SetRelationPropertyName(const Value: String);
    function GetRelationPropertyName: String;
    property RelationPropertyName: String read GetRelationPropertyName write SetRelationPropertyName;
    // SQLDestination
    procedure SetSQLDestination(const Value: IioSQLDestination);
    function GetSQLDestination: IioSQLDestination;
    property SQLDestination: IioSQLDestination read GetSQLDestination write SetSQLDestination;
    // Where
    procedure SetWhere(const Value: IioWhere);
    function GetWhere: IioWhere;
    property Where: IioWhere read GetWhere write SetWhere;
    // ---------- end ----------
  end;

  IioHttpResponseBody = interface
    ['{E5A14525-308F-4877-99B7-C270D691FC6D}']
    function ExceptionOccurred: Boolean;
    function ToJsonText: String;
    // AuthResultIsAuthorized
    procedure SetAuthResultIsAuthorized(const Value: Boolean);
    function GetAuthResultIsAuthorized: Boolean;
    property AuthResultIsAuthorized: Boolean read GetAuthResultIsAuthorized write SetAuthResultIsAuthorized;
    // AuthResult 1
    procedure SetAuthResult1(const Value: String);
    function GetAuthResult1: String;
    property AuthResult1: String read GetAuthResult1 write SetAuthResult1;
    // AuthResult 2
    procedure SetAuthResult2(const Value: String);
    function GetAuthResult2: String;
    property AuthResult2: String read GetAuthResult2 write SetAuthResult2;
    // ExceptionClassName
    procedure SetExceptionClassName(const Value: String);
    function GetExceptionClassName: String;
    property ExceptionClassName: String read GetExceptionClassName write SetExceptionClassName;
    // ExceptionMessage
    procedure SetExceptionMessage(const Value: String);
    function GetExceptionMessage: String;
    property ExceptionMessage: String read GetExceptionMessage write SetExceptionMessage;
    // JSONDataValue
    procedure SetJSONDataValue(const Value: TJSONValue);
    function GetJSONDataValue: TJSONValue;
    property JSONDataValue: TJSONValue read GetJSONDataValue write SetJSONDataValue;
    // JSONDataValueAsObject
    procedure SetJSONDataValueAsObject(const AObj: TObject);
    function GetJSONDataValueAsObject: TObject;
    property JSONDataValueAsObject: TObject read GetJSONDataValueAsObject write SetJSONDataValueAsObject;
    // Stream
    function GetStream: TStream;
    property Stream: TStream read GetStream;
  end;

  // Base class for strategy (Static class as an interface)
  // Note: {$DEFINE ioStrategyInterceptorsOff} to disable strategy interceptors
  TioPersistenceStrategyIntf = class abstract
  protected
    // ========== BEGIN OF METHODS TO BE OVERRIDED FROM CONCRETE PERSISTENCE STRATEGIES ==========
    // Persistence
    // ---------- Begin intercepted methods (CRUDInterceptors) ----------
    class procedure _DoDeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); virtual; abstract;
    class procedure _DoDeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); virtual; abstract;
    class procedure _DoLoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType); virtual; abstract;
    class function _DoLoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject; virtual; abstract;
    class procedure _DoPersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String;
      const ABlindLevel: Byte); virtual; abstract;
    class procedure _DoPersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String;
      const ABlindLevel: Byte); virtual; abstract;
    // ---------- End intercepted methods (CRUDInterceptors) ----------
    class function _DoCount(const AWhere: IioWhere): Integer; virtual;
    class procedure _DoDelete(const AWhere: IioWhere); virtual;
    class procedure _DoLoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet); virtual;
    class function _DoLoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject; virtual;
    class function _DoLoadObjVersion(const AContext: IioContext): Integer; virtual; abstract;
    class function _DoMax(const AWhere: IioWhere; const APropertyName: String): Integer; virtual;
    class function _DoMin(const AWhere: IioWhere; const APropertyName: String): Integer; virtual;
    // Transaction
    class procedure _DoStartTransaction(const AConnectionName: String); virtual; abstract;
    class procedure _DoCommitTransaction(const AConnectionName: String); virtual; abstract;
    class procedure _DoRollbackTransaction(const AConnectionName: String); virtual; abstract;
    class function _DoInTransaction(const AConnectionName: String): Boolean; virtual; abstract;
    // SynchroStrategy
    class procedure _DoSynchronization(const APayload: TioCustomSynchroStrategy_Payload); virtual; abstract;
    // SQLDestinations
    class procedure _DoSQLDest_Execute(const ASQLDestination: IioSQLDestination); virtual; abstract;
    class procedure _DoSQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet); virtual; abstract;
    // Auth
    class function _DoAuthorizeUser(const AConnectionDefName: String; const AUserCredentials: IioAuthUserCredentials; out ResultUserAuthorizationToken: String; out ResultUserID: Integer): Boolean; virtual; abstract;
    class function _DoAuthorizeApp(const AConnectionDefName: String; const AAppCredentials: IioAuthAppCredentials; AUserAuthorizationToken: String; out ResultAppAuthorizationToken: String; out ResultAppID: Integer): Boolean; virtual; abstract;
    class function _DoAuthorizeAccess(const AConnectionDefName: String; const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): Boolean; virtual; abstract;
    class function _DoAuth_NewAccessToken(const AConnectionDefName: String; const AAuthorizationToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean; virtual; abstract;
    class function _DoAuth_RefreshAccessToken(const AConnectionDefName: String; const ARefreshToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean; virtual; abstract;
    class function _DoAuth_AccessTokenNeedRefresh(const AConnectionDefName: String; const AAccessToken: String): Boolean; virtual; abstract;
    // ========== END OF METHODS TO BE OVERRIDED FROM CONCRETE PERSISTENCE STRATEGIES ==========
  public
    // ---------- Begin intercepted methods (StrategyInterceptors) ----------
    class procedure DeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
    class procedure DeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
    class procedure LoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType);
    class function LoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
    class procedure PersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String;
      const ABlindLevel: Byte);
    class procedure PersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String; const ARelationOID: Integer;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte);
    // ---------- End intercepted methods (StrategyInterceptors) ----------
    // Transaction
    class procedure StartTransaction(const AConnectionName: String);
    class procedure CommitTransaction(const AConnectionName: String);
    class procedure RollbackTransaction(const AConnectionName: String);
    class function InTransaction(const AConnectionName: String): Boolean;
    // Persistence
    class procedure Delete(const AWhere: IioWhere);
    class procedure LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet);
    class function LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
    class function LoadObjVersion(const AContext: IioContext): Integer;
    class function Count(const AWhere: IioWhere): Integer;
    class function Max(const AWhere: IioWhere; const APropertyName: String): Integer;
    class function Min(const AWhere: IioWhere; const APropertyName: String): Integer;
    // SynchroStrategy
    class procedure DoSynchronization(const APayload: TioCustomSynchroStrategy_Payload);
    // SQLDestinations
    class procedure SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet);
    class procedure SQLDest_Execute(const ASQLDestination: IioSQLDestination);
    // Auth
    class function AuthorizeUser(const AConnectionDefName: String; const AUserCredentials: IioAuthUserCredentials; out ResultUserAuthorizationToken: String; out ResultUserID: Integer): Boolean;
    class function AuthorizeApp(const AConnectionDefName: String; const AAppCredentials: IioAuthAppCredentials; AUserAuthorizationToken: String; out ResultAppAuthorizationToken: String; out ResultAppID: Integer): Boolean;
    class function AuthorizeAccess(const AConnectionDefName: String; const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): Boolean;
    class function Auth_NewAccessToken(const AConnectionDefName: String; const AAuthorizationToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean;
    class function Auth_RefreshAccessToken(const AConnectionDefName: String; const ARefreshToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean;
    class function Auth_AccessTokenNeedRefresh(const AConnectionDefName: String; const AAccessToken: String): Boolean;
  end;

implementation

uses
  iORM.SqlTranslator, iORM.PersistenceStrategy.Factory, System.SysUtils, iORM.Attributes,
  iORM.Exceptions, iORM.Utilities, iORM.SqlItems,
  System.StrUtils, iORM.Context.Container, iORM.Resolver.Interfaces,
  iORM.Resolver.Factory, iORM.Interceptor.Strategy.Register,
  iORM.Context.Factory;

{ TioSqlGenerator }

class function TioSqlGenerator.BuildIndexName(const AContext: IioContext; const ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation;
  const AUnique: Boolean): String;
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
    ioAscending:
      Result := Result + '_A';
    ioDescending:
      Result := Result + '_D';
  end;
  // Unique
  if AUnique then
    Result := Result + '_U';
  // Translate
  Result := TioSqlTranslator.Translate(Result, AContext.GetClassRef.ClassName, False);
end;

class procedure TioSqlGenerator.GenerateSqlCount(const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  // Select Count From
  AQuery.SQL.Add('SELECT COUNT(*) FROM ' + AContext.GetTable.GetSQL);
  // Join
  AQuery.SQL.Add(AContext.GetTable.GetJoin.GetSQL);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    AQuery.SQL.Add(AContext.Where.GetSqlWithTrueClass(AContext.Map, AContext.IsTrueClass, AContext.GetTrueClass))
  else
    AQuery.SQL.Add(Format('WHERE %s := %s', [AContext.GetProperties.GetIdProperty.GetSqlFieldName, AContext.GetProperties.GetIdProperty.GetSqlWhereParamName]));
  // GroupBy
  AQuery.SQL.Add(AContext.GetGroupBySql);
end;

class procedure TioSqlGenerator.GenerateSqlDelete(const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('DELETE FROM ' + AContext.GetTable.GetSQL);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    // AQuery.SQL.Add(AContext.Where.GetSql(AContext.Map))
    AQuery.SQL.Add(AContext.Where.GetSqlWithTrueClass(AContext.Map, AContext.IsTrueClass, AContext.GetTrueClass))
  else
  begin
    AQuery.SQL.Add('WHERE ' + AContext.GetProperties.GetIdProperty.GetSqlFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlWhereParamName);
    if AContext.BlindLevel_Do_DetectConflicts and AContext.GetProperties.ObjVersionPropertyExist then
      AQuery.SQL.Add('AND ' + AContext.GetProperties.ObjVersionProperty.GetSqlFieldName + ' = :' +
        AContext.GetProperties.ObjVersionProperty.GetSqlWhereParamName);
  end;
  // -----------------------------------------------------------------
end;

class procedure TioSqlGenerator.GenerateSqlInsert(const AQuery: IioQuery; const AContext: IioContext);
var
  LInsertFields, LInsertValues: String;
  LComma: String;
  LIDIsNull: Boolean;
  LProp: IioProperty;
begin
  // Prepare fields and values
  LComma := '';
  LInsertFields := '';
  LInsertValues := '';
  LIDIsNull := AContext.IdIsNull;
  for LProp in AContext.GetProperties do
    if LProp.IsSqlInsertRequestCompliant(LIDIsNull) then
    begin
      LInsertFields := LInsertFields + LComma + LProp.GetSqlFieldName;
      LInsertValues := LInsertValues + LComma + ':' + LProp.GetSqlParamName;
      LComma := ', ';
    end;
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('INSERT INTO ' + AContext.GetTable.GetSQL);
  AQuery.SQL.Add('(');
  // Add field list (TrueClass if enabled)
  AQuery.SQL.Add(LInsertFields);
  if AContext.IsTrueClass then
    AQuery.SQL.Add(',' + AContext.GetTrueClass.GetSqlFieldName);
  // -----------------------------------------------------------------
  AQuery.SQL.Add(') VALUES (');
  // -----------------------------------------------------------------
  // Add values (TrueClass if enabled)
  AQuery.SQL.Add(LInsertValues);
  if AContext.IsTrueClass then
    AQuery.SQL.Add(',:' + AContext.GetTrueClass.GetSqlParamName);
  AQuery.SQL.Add(')');
  // -----------------------------------------------------------------
end;

class procedure TioSqlGenerator.GenerateSqlUpdate(const AQuery: IioQuery; const AContext: IioContext);
var
  LProp: IioProperty;
  LComma: String;
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('UPDATE ' + AContext.GetTable.GetSQL + ' SET');
  // Add properties
  LComma := '';
  for LProp in AContext.GetProperties do
    if LProp.IsSqlUpdateRequestCompliant then
    begin
      AQuery.SQL.Add(LComma + LProp.GetSqlFieldName + ' = :' + LProp.GetSqlParamName);
      LComma := ', ';
    end;
  // Add the ioTrueClass if enabled
  if AContext.IsTrueClass then
    AQuery.SQL.Add(',' + AContext.GetTrueClass.GetSqlFieldName + ' = :' + AContext.GetTrueClass.GetSqlParamName);
  // Where conditions
  // note:
  AQuery.SQL.Add('WHERE ' + AContext.GetProperties.GetIdProperty.GetSqlFieldName + ' = :' + AContext.GetProperties.GetIdProperty.GetSqlWhereParamName);
  if AContext.BlindLevel_Do_DetectConflicts and AContext.GetProperties.ObjVersionPropertyExist then
    AQuery.SQL.Add('AND ' + AContext.GetProperties.ObjVersionProperty.GetSqlFieldName + ' = :' +
      AContext.GetProperties.ObjVersionProperty.GetSqlWhereParamName);
  // -----------------------------------------------------------------
end;

class function TioSqlGenerator.GenerateSqlJoinSectionItem(const AJoinItem: IioJoinItem): String;
begin
  // Join
  case AJoinItem.GetJoinType of
    jtCross:
      Result := 'CROSS JOIN ';
    jtInner:
      Result := 'INNER JOIN ';
    jtLeftOuter:
      Result := 'LEFT OUTER JOIN ';
    jtRightOuter:
      Result := 'RIGHT OUTER JOIN ';
    jtFullOuter:
      Result := 'FULL OUTER JOIN ';
  else
    raise EioGenericException.Create(Self.ClassName + ': Join type not valid.');
  end;
  // Joined table name
  Result := Result + '[' + AJoinItem.GetJoinClassRef.ClassName + ']';
  // Conditions
  if AJoinItem.GetJoinType <> jtCross then
    Result := Result + ' ON (' + AJoinItem.GetJoinCondition + ')';
end;

class procedure TioSqlGenerator.GenerateSqlMax(const AQuery: IioQuery; const AContext: IioContext; const AProperty: IioProperty);
begin
  // Build the query that returns the highest value for the property
  // -----------------------------------------------------------------
  // Select
  AQuery.SQL.Add(Format('SELECT COALESCE(MAX(%s),0) FROM %s', [AProperty.GetSqlFieldName, AContext.GetTable.GetSQL]));
  // -----------------------------------------------------------------
end;

class procedure TioSqlGenerator.GenerateSqlMin(const AQuery: IioQuery; const AContext: IioContext; const AProperty: IioProperty);
begin
  // Build the query that returns the lowest value for the property
  // -----------------------------------------------------------------
  // Select
  AQuery.SQL.Add(Format('SELECT COALESCE(MIN(%s),0) FROM %s', [AProperty.GetSqlFieldName, AContext.GetTable.GetSQL]));
  // -----------------------------------------------------------------
end;

class procedure TioSqlGenerator.GenerateSqlSelectLastObjVersionFromEntity(const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  // Select
  AQuery.SQL.Add(Format('SELECT %s FROM %s WHERE %s = :%s', [AContext.GetProperties.ObjVersionProperty.GetSqlFieldName, AContext.GetTable.GetSQL,
    AContext.GetProperties.GetIdProperty.GetSqlFieldName, AContext.GetProperties.GetIdProperty.GetSqlWhereParamName]));
  // -----------------------------------------------------------------
end;

class procedure TioSqlGenerator.GenerateSqlSelectLastObjVersionFromETM(const AQuery: IioQuery; const AEtmContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  // Select
  AQuery.SQL.Add(Format('SELECT MAX(%s) FROM %s WHERE %s = :%s AND %s = :%s', [AEtmContext.GetProperties.GetPropertyByName('EntityToVersion').GetSqlFieldName,
    AEtmContext.GetTable.GetSQL, AEtmContext.GetProperties.GetPropertyByName('EntityClassName').GetSqlFieldName,
    AEtmContext.GetProperties.GetPropertyByName('EntityClassName').GetSqlWhereParamName, AEtmContext.GetProperties.GetPropertyByName('EntityID')
    .GetSqlFieldName, AEtmContext.GetProperties.GetPropertyByName('EntityID').GetSqlWhereParamName]));
  // -----------------------------------------------------------------
end;

class procedure TioSqlGenerator.GenerateSqlSelect(const AQuery: IioQuery; const AContext: IioContext);
var
  LProp: IioProperty;
  LComma: String;
begin
  // Build the query text
  // -----------------------------------------------------------------
  // Select
  AQuery.SQL.Add('SELECT');
  // Field list
  LComma := '';
  for LProp in AContext.GetProperties do
    if LProp.IsSqlSelectRequestCompliant then
    begin
      if LProp.LoadSqlExist then
        AQuery.SQL.Add(LComma + LProp.GetLoadSql)
      else
        AQuery.SQL.Add(LComma + LProp.GetSqlFullQualifiedFieldName);
      LComma := ', ';
    end;
  // TrueClass
  if AContext.IsTrueClass then
    AQuery.SQL.Add(',' + AContext.GetTrueClass.GetSqlFieldName);
  // From
  AQuery.SQL.Add('FROM ' + AContext.GetTable.GetSQL);
  // Join
  AQuery.SQL.Add(AContext.GetTable.GetJoin.GetSQL);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    AQuery.SQL.Add(AContext.Where.GetSqlWithTrueClass(AContext.Map, AContext.IsTrueClass, AContext.GetTrueClass))
  else
    AQuery.SQL.Add(Format('WHERE %s := %s', [AContext.GetProperties.GetIdProperty.GetSqlFieldName, AContext.GetProperties.GetIdProperty.GetSqlWhereParamName]));
  // GroupBy
  AQuery.SQL.Add(AContext.GetGroupBySql);
  // OrderBy
  AQuery.SQL.Add(AContext.GetOrderBySql);
end;

class procedure TioSqlGenerator.LoadSqlParamsFromContext(const AQuery: IioQuery; const AContext: IioContext);
var
  Prop: IioProperty;
begin
  // Load query parameters from context
  for Prop in AContext.GetProperties do
    if Prop.IsBlob then
      AQuery.ParamByProp_LoadAsStreamObj(Prop.GetValue(AContext.DataObject).AsObject, Prop);
end;

{ TioCompareOperator }

class function TioCompareOperator.CompareOpToCompareOperator(const ACompareOp: TioCompareOp): IioSqlItem;
begin
  case ACompareOp of
    coEquals:
      Result := _Equal;
    coNotEquals:
      Result := _NotEqual;
    coGreater:
      Result := _Greater;
    coLower:
      Result := _Lower;
    coGreaterOrEqual:
      Result := _GreaterOrEqual;
    coLowerOrEqual:
      Result := _LowerOrEqual;
    coLike:
      Result := _Like;
    coNotLike:
      Result := _NotLike;
    coIsNull:
      Result := _IsNull;
    coIsNotNull:
      Result := _IsNotNull;
  else
    raise EioGenericException.Create(Self.ClassName, 'CompareOpToCompareOperator',
      Format('Invalid CompareOp value "%s"', [TioUtilities.EnumToString<TioCompareOp>(ACompareOp)]));
  end;
end;

class function TioCompareOperator._Equal: IioSqlItem;
begin
  Result := TioSqlItem.Create(' = ');
end;

class function TioCompareOperator._Greater: IioSqlItem;
begin
  Result := TioSqlItem.Create(' > ');
end;

class function TioCompareOperator._GreaterOrEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' >= ');
end;

class function TioCompareOperator._IsNotNull: IioSqlItem;
begin
  Result := TioSqlItem.Create(' IS NOT NULL ');
end;

class function TioCompareOperator._IsNull: IioSqlItem;
begin
  Result := TioSqlItem.Create(' IS NULL ');
end;

class function TioCompareOperator._Like: IioSqlItem;
begin
  Result := TioSqlItem.Create(' LIKE ');
end;

class function TioCompareOperator._Lower: IioSqlItem;
begin
  Result := TioSqlItem.Create(' < ');
end;

class function TioCompareOperator._LowerOrEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' <= ');
end;

class function TioCompareOperator._NotEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' <> ');
end;

class function TioCompareOperator._NotLike: IioSqlItem;
begin
  Result := TioSqlItem.Create(' NOT LIKE ');
end;

{ TioLogicRelation }

class function TioLogicRelation.LogicOpToLogicRelation(const ALogicOp: TioLogicOp): IioSqlItem;
begin
  case ALogicOp of
    loAnd:
      Result := _And;
    loOr:
      Result := _Or;
    loNot:
      Result := _Not;
    loOpenPar:
      Result := _OpenPar;
    loClosePar:
      Result := _ClosePar;
  else
    raise EioGenericException.Create(Self.ClassName, 'LogicOpToLogicRelation',
      Format('Invalid LogicOp value "%s"', [TioUtilities.EnumToString<TioLogicOp>(ALogicOp)]));
  end;
end;

class function TioLogicRelation._And: IioSqlItem;
begin
  Result := TioSqlItem.Create(' AND ');
end;

class function TioLogicRelation._ClosePar: IioSqlItem;
begin
  Result := TioSqlItem.Create(')');
end;

class function TioLogicRelation._Not: IioSqlItem;
begin
  Result := TioSqlItem.Create(' NOT ');
end;

class function TioLogicRelation._OpenPar: IioSqlItem;
begin
  Result := TioSqlItem.Create('(');
end;

class function TioLogicRelation._Or: IioSqlItem;
begin
  Result := TioSqlItem.Create(' OR ');
end;

{ TioStrategyIntf }

class function TioPersistenceStrategyIntf.AuthorizeAccess(const AConnectionDefName: String; const AScope: String; const AAuthIntention: TioAuthIntention; const AAccessToken: String): Boolean;
begin
  Result := _DoAuthorizeAccess(AConnectionDefName, AScope, AAuthIntention, AAccessToken);
end;

class function TioPersistenceStrategyIntf.AuthorizeApp(const AConnectionDefName: String; const AAppCredentials: IioAuthAppCredentials; AUserAuthorizationToken: String; out ResultAppAuthorizationToken: String; out ResultAppID: Integer): Boolean;
begin
  Result := _DoAuthorizeApp(AConnectionDefName, AAppCredentials, AUserAuthorizationToken, ResultAppAuthorizationToken, ResultAppID);
end;

class function TioPersistenceStrategyIntf.AuthorizeUser(const AConnectionDefName: String; const AUserCredentials: IioAuthUserCredentials; out ResultUserAuthorizationToken: String; out ResultUserID: Integer): Boolean;
begin
  Result := _DoAuthorizeUser(AConnectionDefName, AUserCredentials, ResultUserAuthorizationToken, ResultUserID);
end;

class function TioPersistenceStrategyIntf.Auth_AccessTokenNeedRefresh(const AConnectionDefName, AAccessToken: String): Boolean;
begin
  Result := _DoAuth_AccessTokenNeedRefresh(AConnectionDefName, AAccessToken);
end;

class function TioPersistenceStrategyIntf.Auth_NewAccessToken(const AConnectionDefName: String; const AAuthorizationToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean;
begin
  Result := _DoAuth_NewAccessToken(AConnectionDefName, AAuthorizationToken, AResultAccessToken, AResultRefreshToken);
end;

class function TioPersistenceStrategyIntf.Auth_RefreshAccessToken(const AConnectionDefName: String; const ARefreshToken: String; out AResultAccessToken, AResultRefreshToken: String): Boolean;
begin
  Result := _DoAuth_RefreshAccessToken(AConnectionDefName, ARefreshToken, AResultAccessToken, AResultRefreshToken);
end;

class procedure TioPersistenceStrategyIntf.CommitTransaction(const AConnectionName: String);
begin
  _DoCommitTransaction(AConnectionName);
end;

class function TioPersistenceStrategyIntf._DoCount(const AWhere: IioWhere): Integer;
begin
  Result := 0;
  AWhere.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class procedure TioPersistenceStrategyIntf._DoDelete(const AWhere: IioWhere);
begin
  AWhere.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class procedure TioPersistenceStrategyIntf._DoLoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet);
begin
  AWhere.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyIntf._DoLoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
begin
  Result := nil;
  AWhere.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyIntf._DoMax(const AWhere: IioWhere; const APropertyName: String): Integer;
begin
  Result := 0;
  AWhere.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyIntf.Max(const AWhere: IioWhere; const APropertyName: String): Integer;
begin
  Result := _DoMax(AWhere, APropertyName);
end;

class function TioPersistenceStrategyIntf.Min(const AWhere: IioWhere; const APropertyName: String): Integer;
begin
  Result := _DoMin(AWhere, APropertyName);
end;

class function TioPersistenceStrategyIntf._DoMin(const AWhere: IioWhere; const APropertyName: String): Integer;
begin
  Result := 0;
  AWhere.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyIntf.Count(const AWhere: IioWhere): Integer;
begin
  Result := _DoCount(AWhere);
end;

class procedure TioPersistenceStrategyIntf.Delete(const AWhere: IioWhere);
begin
  _DoDelete(AWhere);
end;

class procedure TioPersistenceStrategyIntf.DeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
var
  LDone: Boolean;
{$ENDIF}
{$ENDREGION}
begin
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  LDone := False;
  TioStrategyInterceptorRegister.BeforeDeleteList(AList, LDone);
  if LDone then
    Exit;
{$ENDIF}
{$ENDREGION}
  _DoDeleteList(AList, AIntent, ABlindLevel);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  TioStrategyInterceptorRegister.AfterDeleteList(AList);
{$ENDIF}
{$ENDREGION}
end;

class procedure TioPersistenceStrategyIntf.DeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
var
  LDone: Boolean;
{$ENDIF}
{$ENDREGION}
begin
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  LDone := False;
  TioStrategyInterceptorRegister.BeforeDeleteObject(AObj, LDone);
  if LDone then
    Exit;
{$ENDIF}
{$ENDREGION}
  _DoDeleteObject(AObj, AIntent, ABlindLevel);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  TioStrategyInterceptorRegister.AfterDeleteObject(AObj);
{$ENDIF}
{$ENDREGION}
end;

class procedure TioPersistenceStrategyIntf.DoSynchronization(const APayload: TioCustomSynchroStrategy_Payload);
begin
  _DoSynchronization(APayload);
end;

class function TioPersistenceStrategyIntf.InTransaction(const AConnectionName: String): Boolean;
begin
  Result := _DoInTransaction(AConnectionName);
end;

class procedure TioPersistenceStrategyIntf.LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet);
begin
  _DoLoadDataSet(AWhere, ADestDataSet);
end;

class procedure TioPersistenceStrategyIntf.LoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
var
  LDone: Boolean;
{$ENDIF}
{$ENDREGION}
begin
  AWhere.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  LDone := False;
  TioStrategyInterceptorRegister.BeforeLoadList(AWhere, AList, LDone);
  if LDone then
    Exit;
{$ENDIF}
{$ENDREGION}
  _DoLoadList(AWhere, AList, AIntent);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  TioStrategyInterceptorRegister.AfterLoadList(AWhere, AList);
{$ENDIF}
{$ENDREGION}
end;

class function TioPersistenceStrategyIntf.LoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
var
  LDone: Boolean;
{$ENDIF}
{$ENDREGION}
begin
  AWhere.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
  Result := AObj;
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  LDone := False;
  Result := TioStrategyInterceptorRegister.BeforeLoadObject(AWhere, Result, LDone);
  if LDone then
    Exit;
{$ENDIF}
{$ENDREGION}
  Result := _DoLoadObject(AWhere, Result, AIntent);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  Result := TioStrategyInterceptorRegister.AfterLoadObject(AWhere, Result);
{$ENDIF}
{$ENDREGION}
end;

class function TioPersistenceStrategyIntf.LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
begin
  Result := _DoLoadObjectByClassOnly(AWhere, AObj, AIntent);
end;

class function TioPersistenceStrategyIntf.LoadObjVersion(const AContext: IioContext): Integer;
begin
  Result := _DoLoadObjVersion(AContext);
end;

class procedure TioPersistenceStrategyIntf.PersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String; const ARelationOID: Integer;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
var
  LDone: Boolean;
{$ENDIF}
{$ENDREGION}
begin
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  LDone := False;
  TioStrategyInterceptorRegister.BeforePersistList(AList, LDone);
  if LDone then
    Exit;
{$ENDIF}
{$ENDREGION}
  _DoPersistList(AList, AIntent, ARelationPropertyName, ARelationOID, AMasterBSPersistence, AMasterPropertyName, AMasterPropertyPath, ABlindLevel);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  TioStrategyInterceptorRegister.AfterPersistList(AList);
{$ENDIF}
{$ENDREGION}
end;

class procedure TioPersistenceStrategyIntf.PersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String;
      const ABlindLevel: Byte);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
var
  LDone: Boolean;
{$ENDIF}
{$ENDREGION}
begin
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  LDone := False;
  TioStrategyInterceptorRegister.BeforePersistObject(AObj, LDone);
  if LDone then
    Exit;
{$ENDIF}
{$ENDREGION}
  _DoPersistObject(AObj, AIntent, ARelationPropertyName, ARelationOID, AMasterBSPersistence, AMasterPropertyName, AMasterPropertyPath, ABlindLevel);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioStrategyInterceptorsOff}
  TioStrategyInterceptorRegister.AfterPersistObject(AObj);
{$ENDIF}
{$ENDREGION}
end;

class procedure TioPersistenceStrategyIntf.RollbackTransaction(const AConnectionName: String);
begin
  _DoRollbackTransaction(AConnectionName);
end;

class procedure TioPersistenceStrategyIntf.SQLDest_Execute(const ASQLDestination: IioSQLDestination);
begin
 _DoSQLDest_Execute(ASQLDestination);
end;

class procedure TioPersistenceStrategyIntf.SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet);
begin
 _DoSQLDest_LoadDataSet(ASQLDestination, ADestDataSet);
end;

class procedure TioPersistenceStrategyIntf.StartTransaction(const AConnectionName: String);
begin
  _DoStartTransaction(AConnectionName);
end;

{ TioConnectionInfo }

constructor TioConnectionInfo.Create(const AConnectionName: String; const AConnectionType: TioConnectionType; const APersistent: Boolean;
  const AKeyGenerationTime: TioKeyGenerationTime; const ASynchroStrategy: IioSynchroStrategy_Client);
begin
  FConnectionName := AConnectionName;
  FConnectionType := AConnectionType;
  FKeyGenerationTime := AKeyGenerationTime;
  FPersistent := APersistent;
  FSynchroStrategy := ASynchroStrategy;
  FPersistenceStrategy := TioPersistenceStrategyFactory.ConnectionTypeToStrategy(AConnectionType);
end;

end.
