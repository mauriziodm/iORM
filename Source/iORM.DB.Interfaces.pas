{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

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
    ConnectionName: String;
    ConnectionType: TioConnectionType;
    Persistent: Boolean;
    Strategy: TioStrategyRef;
    BaseURL: String;
    UserName: String;
    Password: String;
    constructor Create(const AConnectionName: String; const AConnectionType: TioConnectionType; const APersistent: Boolean);
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
  IIoConnectionDef = IFDStanConnectionDef;

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
    procedure Execute(const AResource: String);
    // ioRequestBody property
    function GetRequestBody: IioRESTRequestBody;
    property RequestBody: IioRESTRequestBody read GetRequestBody;
    // ioResponseBody property
    function GetResponseBody: IioRESTResponseBody;
    property ResponseBody: IioRESTResponseBody read GetResponseBody;
  end;

  // Interfaccia per il componente Query, cioè del componente che si
  // occuperà di eseguire il codice SQL o altro per caricare/modificare/eliminare
  // il dato
  IioQuery = interface
    ['{E8CFB984-2572-4D6F-BC4B-A4454F1EEDAA}']
    function GetQuery: TioInternalSqlQuery;
    procedure First;
    procedure Last;
    procedure Next;
    procedure Prior;
    function Eof: Boolean;
    function GetValue(const AProperty: IioContextProperty; const AContext: IioContext): TValue;
    function GetValueByFieldNameAsVariant(const AFieldName: String): Variant;
    procedure Open;
    procedure Close;
    function IsEmpty: Boolean;
    function IsSqlEmpty: Boolean;
    function IsActive: Boolean;
    procedure ExecSQL;
    function GetSQL: TStrings;
    function Fields: TioFields;
    function ParamByName(const AParamName: String): TioParam;
    function ParamByProp(const AProp: IioContextProperty): TioParam;
    procedure SetParamValueByContext(const AProp: IioContextProperty; const AContext: IioContext);
    procedure SetParamValueToNull(const AProp: IioContextProperty; const AForceDataType: TFieldType = ftUnknown);
    function Connection: IioConnection;
    procedure CleanConnectionRef;
    function CreateBlobStream(const AProperty: IioContextProperty; const Mode: TBlobStreamMode): TStream;
    procedure SaveStreamObjectToSqlParam(const AObj: TObject; const AProperty: IioContextProperty);
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
    class function PropertyToFieldType(const AProp: IioContextProperty): String; virtual; abstract;
    class function TValueToSql(const AValue: TValue): String; virtual; abstract;
    class function QueryToTValue(const AQuery: IioQuery; const AProperty: IioContextProperty): TValue; virtual; abstract;
    class procedure SetQueryParamByContext(const AQuery: IioQuery; const AProp: IioContextProperty; const AContext: IioContext); virtual; abstract;
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
    class procedure GenerateSqlSelect(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlInsert(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlNextID(const AQuery: IioQuery; const AContext: IioContext); virtual; abstract;
    class procedure GenerateSqlUpdate(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlDelete(const AQuery: IioQuery; const AContext: IioContext); virtual;
    class procedure GenerateSqlForExists(const AQuery: IioQuery; const AContext: IioContext); virtual; abstract;
    class function GenerateSqlJoinSectionItem(const AJoinItem: IioJoinItem): String; virtual;
    class procedure GenerateSqlForCreateIndex(const AQuery: IioQuery; const AContext: IioContext; AIndexName: String; const ACommaSepFieldList: String;
      const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean); virtual; abstract;
    class procedure GenerateSqlForDropIndex(const AQuery: IioQuery; const AContext: IioContext; AIndexName: String); virtual; abstract;

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

  { TODO : Si potrebbe lasciare solo il metodo NewCompareOperator ed eliminare tutto il resto (anche le LogicRelations) }
  // Interfaccia per le classi che devono generare operatori di comparazione
  TioCompareOperator = class abstract
    class function CompareOpToCompareOperator(const ACompareOp: TioCompareOp): IioSqlItem; virtual;
    class function _Equal: IioSqlItem; virtual;
    class function _Greater: IioSqlItem; virtual;
    class function _Lower: IioSqlItem; virtual;
    class function _GreaterOrEqual: IioSqlItem; virtual;
    class function _LowerOrEqual: IioSqlItem; virtual;
    class function _NotEqual: IioSqlItem; virtual;
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

  IioRESTRequestBody = interface
    ['{83DE9ECE-47EA-4814-B40E-3E39FAA210A2}']
    procedure Clear;
    function ToJSONObject: TJSONObject;
    // Where
    procedure SetWhere(const Value: IioWhere);
    function GetWhere: IioWhere;
    property Where: IioWhere read GetWhere write SetWhere;
    // SQLDestination
    procedure SetSQLDestination(const Value: IioSQLDestination);
    function GetSQLDestination: IioSQLDestination;
    property SQLDestination: IioSQLDestination read GetSQLDestination write SetSQLDestination;
    // DataObject
    procedure SetDataObject(const Value: TObject);
    function GetDataObject: TObject;
    property DataObject: TObject read GetDataObject write SetDataObject;
    // RelationPropertyName
    procedure SetRelationPropertyName(const Value: String);
    function GetRelationPropertyName: String;
    property RelationPropertyName: String read GetRelationPropertyName write SetRelationPropertyName;
    // RelationOID
    procedure SetRelationOID(const Value: Integer);
    function GetRelationOID: Integer;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    // BlindInsert
    procedure SetBlindInsert(const Value: Boolean);
    function GetBlindInsert: Boolean;
    property BlindInsert: Boolean read GetBlindInsert write SetBlindInsert;
  end;

  IioRESTResponseBody = interface
    ['{E5A14525-308F-4877-99B7-C270D691FC6D}']
    function ToJSONObject: TJSONObject;
    // JSONDataValue
    procedure SetJSONDataValue(const Value: TJSONValue);
    function GetJSONDataValue: TJSONValue;
    property JSONDataValue: TJSONValue read GetJSONDataValue write SetJSONDataValue;
    // DataObject
    procedure SetDataObject(const Value: TObject);
    function GetDataObject: TObject;
    property DataObject: TObject read GetDataObject write SetDataObject;
    // Stream
    function GetStream: TStream;
    property Stream: TStream read GetStream;
  end;

  // Base class for strategy (Static class as an interface)
  TioStrategyIntf = class abstract
  public
    class procedure StartTransaction(const AConnectionName: String); virtual; abstract;
    class procedure CommitTransaction(const AConnectionName: String); virtual; abstract;
    class procedure RollbackTransaction(const AConnectionName: String); virtual; abstract;
    class function InTransaction(const AConnectionName: String): Boolean; virtual; abstract;
    class procedure PersistObject(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: Boolean);
      virtual; abstract;
    class procedure PersistCollection(const ACollection: TObject; const ARelationPropertyName: String; const ARelationOID: Integer;
      const ABlindInsert: Boolean); virtual; abstract;
    class procedure DeleteObject(const AObj: TObject); virtual; abstract;
    class procedure DeleteCollection(const ACollection: TObject); virtual; abstract;
    class procedure Delete(const AWhere: IioWhere); virtual; abstract;
    class procedure LoadList(const AWhere: IioWhere; const AList: TObject); virtual; abstract;
    class function LoadObject(const AWhere: IioWhere; const AObj: TObject): TObject; virtual; abstract;
    class function LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject): TObject; virtual; abstract;
    class procedure LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet); virtual; abstract;
    class function Count(const AWhere: IioWhere): Integer; virtual; abstract;
    // SQLDestinations
    class procedure SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet); virtual; abstract;
    class procedure SQLDest_Execute(const ASQLDestination: IioSQLDestination); virtual; abstract;
  end;

implementation

uses
  iORM.SqlTranslator, iORM.Strategy.Factory, System.SysUtils, iORM.Attributes,
  iORM.Exceptions, iORM.Utilities, iORM.SqlItems;

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
  AQuery.SQL.Add(AContext.GetJoin.GetSQL);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    AQuery.SQL.Add(AContext.Where.GetSqlWithClassFromField(AContext.Map, AContext.IsClassFromField, AContext.ClassFromField))
  else
    AQuery.SQL.Add(Format('WHERE %s := %s', [AContext.GetProperties.GetIdProperty.GetSqlFieldName, AContext.GetProperties.GetIdProperty.GetSqlParamName]));
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
    AQuery.SQL.Add(AContext.Where.GetSqlWithClassFromField(AContext.Map, AContext.IsClassFromField, AContext.ClassFromField))
  else
    AQuery.SQL.Add('WHERE ' + AContext.GetProperties.GetIdProperty.GetSqlFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName);
  // -----------------------------------------------------------------
end;

class procedure TioSqlGenerator.GenerateSqlInsert(const AQuery: IioQuery; const AContext: IioContext);
var
  Comma: Char;
  Prop: IioContextProperty;
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('INSERT INTO ' + AContext.GetTable.GetSQL);
  AQuery.SQL.Add('(');
  AQuery.SQL.Add(AContext.GetProperties.GetSQL(ioInsert));
  // Add the ClassFromField if enabled
  if AContext.IsClassFromField then
    AQuery.SQL.Add(',' + AContext.ClassFromField.GetSqlFieldName);
  // -----------------------------------------------------------------
  AQuery.SQL.Add(') VALUES (');
  // -----------------------------------------------------------------
  // Iterate for all properties
  Comma := ' ';
  for Prop in AContext.GetProperties do
  begin
    // If the current property is ReadOnly then skip it
    // If the current property RelationType is HasMany then skip it
    if (not Prop.IsSqlRequestCompliant(ioInsert)) or (Prop.GetRelationType = ioRTHasMany) or (Prop.GetRelationType = ioRTHasOne) then
      Continue;
    // Add the field param
    AQuery.SQL.Add(Comma + ':' + Prop.GetSqlParamName);
    Comma := ',';
  end;
  // Add the ClassFromField if enabled
  if AContext.IsClassFromField then
    AQuery.SQL.Add(',:' + AContext.ClassFromField.GetSqlParamName);
  AQuery.SQL.Add(')');
  // -----------------------------------------------------------------
end;

class function TioSqlGenerator.GenerateSqlJoinSectionItem(const AJoinItem: IioJoinItem): String;
begin
  // Join
  case AJoinItem.GetJoinType of
    ioCross:
      Result := 'CROSS JOIN ';
    ioInner:
      Result := 'INNER JOIN ';
    ioLeftOuter:
      Result := 'LEFT OUTER JOIN ';
    ioRightOuter:
      Result := 'RIGHT OUTER JOIN ';
    ioFullOuter:
      Result := 'FULL OUTER JOIN ';
  else
    raise EioException.Create(Self.ClassName + ': Join type not valid.');
  end;
  // Joined table name
  Result := Result + '[' + AJoinItem.GetJoinClassRef.ClassName + ']';
  // Conditions
  if AJoinItem.GetJoinType <> ioCross then
    Result := Result + ' ON (' + AJoinItem.GetJoinCondition + ')';
end;

class procedure TioSqlGenerator.GenerateSqlSelect(const AQuery: IioQuery; const AContext: IioContext);
begin
  // Build the query text
  // -----------------------------------------------------------------
  // Select
  AQuery.SQL.Add('SELECT');
  // Field list
  AQuery.SQL.Add(AContext.GetProperties.GetSQL(ioSelect));
  if AContext.IsClassFromField then
    AQuery.SQL.Add(',' + AContext.ClassFromField.GetSqlFieldName);
  // From
  AQuery.SQL.Add('FROM ' + AContext.GetTable.GetSQL);
  // Join
  AQuery.SQL.Add(AContext.GetJoin.GetSQL);
  // If a Where exist then the query is an external query else
  // is an internal query.
  if AContext.WhereExist then
    AQuery.SQL.Add(AContext.Where.GetSqlWithClassFromField(AContext.Map, AContext.IsClassFromField, AContext.ClassFromField))
  else
    AQuery.SQL.Add(Format('WHERE %s := %s', [AContext.GetProperties.GetIdProperty.GetSqlFieldName, AContext.GetProperties.GetIdProperty.GetSqlParamName]));
  // GroupBy
  AQuery.SQL.Add(AContext.GetGroupBySql);
  // OrderBy
  AQuery.SQL.Add(AContext.GetOrderBySql);
end;

class procedure TioSqlGenerator.GenerateSqlUpdate(const AQuery: IioQuery; const AContext: IioContext);
var
  Comma: Char;
  Prop: IioContextProperty;
begin
  // Build the query text
  // -----------------------------------------------------------------
  AQuery.SQL.Add('UPDATE ' + AContext.GetTable.GetSQL + ' SET');
  // Iterate for all properties
  Comma := ' ';
  for Prop in AContext.GetProperties do
  begin
    // If the current property is ReadOnly then skip it
    // If the current property RelationType is HasMany then skip it
    if (not Prop.IsSqlRequestCompliant(ioInsert)) or (Prop.GetRelationType = ioRTHasMany) or (Prop.GetRelationType = ioRTHasOne) then
      Continue;
    // Add the field param
    AQuery.SQL.Add(Comma + Prop.GetSqlFieldName + '=:' + Prop.GetSqlParamName);
    Comma := ',';
  end;
  // Add the ClassFromField if enabled
  if AContext.IsClassFromField then
    AQuery.SQL.Add(',' + AContext.ClassFromField.GetSqlFieldName + '=:' + AContext.ClassFromField.GetSqlParamName);
  // Where conditions
  // AQuery.SQL.Add(AContext.Where.GetSql);
  AQuery.SQL.Add('WHERE ' + AContext.GetProperties.GetIdProperty.GetSqlFieldName + '=:' + AContext.GetProperties.GetIdProperty.GetSqlParamName);
  // -----------------------------------------------------------------
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

constructor TioConnectionInfo.Create(const AConnectionName: String; const AConnectionType: TioConnectionType; const APersistent: Boolean);
begin
  ConnectionName := AConnectionName;
  ConnectionType := AConnectionType;
  Persistent := APersistent;
  Strategy := TioStrategyFactory.ConnectionTypeToStrategy(AConnectionType);
end;

{ TioCompareOperator }

class function TioCompareOperator.CompareOpToCompareOperator(const ACompareOp: TioCompareOp): IioSqlItem;
begin
  case ACompareOp of
    coEqual:
      Result := _Equal;
    coNotEqual:
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
      raise EioException.Create(Self.ClassName, 'CompareOpToCompareOperator', Format('Invalid CompareOp value "%s"', [TioUtilities.EnumToString<TioCompareOp>(ACompareOp)]));
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
      raise EioException.Create(Self.ClassName, 'LogicOpToLogicRelation', Format('Invalid LogicOp value "%s"', [TioUtilities.EnumToString<TioLogicOp>(ALogicOp)]));
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

end.
