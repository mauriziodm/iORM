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
  Data.DB, FireDAC.Stan.Intf, iORM.CommonTypes;

type

  TioInternalSqlConnection = TFDConnection;
  TioInternalSqlQuery = TFDQuery;
  TioFields = TFields;
  TioParam = TFDParam;
  TioParams = TFDParams;

  TioConnectionType = (cdtFirebird, cdtSQLite, cdtSQLServer, cdtMySQL);

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
  IioConnection = interface
    ['{FF5D54D7-7EBE-4E6E-830E-E091BA7AE929}']
    procedure Free;
    function GetConnection: TioInternalSqlConnection;
    function GetConnectionDefName: String;
    function QueryContainer: IioQueryContainer;
    function InTransaction: Boolean;
    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
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
    {TODO -oOwner -cGeneral : Un altro overload di Trabslate che accetta un'interfaccia e che genera automaticamente una query che fa l'UNION ALL di tutte le classi che implementano l'interfaccia stessa}
    function Translate: String; overload;
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable:TFDMemTable); overload;
    function ToQuery: IioQuery; overload;
    procedure ToQuery(const AQuery:IioQuery); overload;
    procedure ToQuery(const AQuery:TFDQuery); overload;
    function Execute(const AIgnoreObjNotExists:Boolean=False): Integer; overload;
    function Execute(const AParams: array of Variant): Integer; overload;
    function Execute(const AParams: array of Variant; const ATypes: array of TFieldType): Integer; overload;
    // Informations
    function Connection(const AConnectionName:String): IioSQLDestination;
    function SelfClass(const ASelfClassName:String): IioSQLDestination; overload;
    function SelfClass(const ASelfClassRef: TioClassRef): IioSQLDestination; overload;
    function QualifiedFieldName(const AQualifiedFieldName:Boolean=True): IioSQLDestination;
  end;

implementation

uses
  iORM.SqlTranslator;


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

end.
