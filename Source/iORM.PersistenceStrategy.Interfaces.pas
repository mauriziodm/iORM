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
unit iORM.PersistenceStrategy.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.LiveBindings.BSPersistence,
  iORM.Where.Interfaces, System.Rtti, iORM.Abstraction.SessionData.Interfaces,
  iORM.Auth.Interfaces;

const

  // persistence strategy request json properties constants
  PSR_BLINDLEVEL = 'BliLev';
  PSR_INSTANCES_DTO = 'DTO';
  PSR_INSTANCES_INTF1 = 'Intf1';
  PSR_INSTANCES_LIST_DTO = 'LisDTO';
  PSR_INSTANCES_MASTERBSPERSISTENCE = 'MstBSP';
  PSR_INSTANCES_OBJ1 = 'Obj1';
  PSR_INSTANCES_WHERE = 'Whr';
  PSR_INTENTTYPE = 'Int';
  PSR_MASTERPROPERTYNAME = 'MstPrp';
  PSR_MASTERPROPERTYPATH = 'MstPrpPat';
  PSR_METHOD = 'Met';
  PSR_PROPERTYNAME = 'PrpNam';
  PSR_RELATIONID = 'RelPrpID';
  PSR_RELATIONPROPERTYNAME = 'RelPrpNam';
  PSR_SESSION_TOKEN = 'Tkn';
  PSR_SESSION_APP = 'App';
  PSR_SESSION_APPOID = 'AppID';
  PSR_SESSION_CONNECTION = 'Con';
  PSR_SESSION_CONNECTIONREMOTE = 'ConRem';
  PSR_SESSION_LIC = 'Lic';
  PSR_SESSION_LICOID = 'LicID';
  PSR_SESSION_USER = 'Usr';
  PSR_SESSION_USEROID = 'UsrID';

type

  // *************************************************************************
  // * NB: Abstract static class TioPersistenceStrategyIntf is declared into *
  // *      iORM.DB.Interfaces to avoid circular unit reference error        *
  // *************************************************************************

  TioPersistenceStrategyMethod = (
    psmDelete,
    psmDeleteList,
    psmDeleteObject,
    psmDoSynchronization,
    psmLoadCount,
    psmLoadDataSet,
    psmLoadList,
    psmLoadMax,
    psmLoadMin,
    psmLoadObject,
    psmLoadObjectByClassOnly,
    psmLoadObjVersion,
    psmPersistList,
    psmPersistObject,
    psmSQLDestExecute,
    psmSQLDestLoadDataSet,
    psmTransactionCommit,
    psmTransactionIn,
    psmTransactionRollback,
    psmTransactionStart
  );

  // Ho deciso di avere due AuthCache diverse, una per le operazioni CRUD (IioAuthCacheUI in iORM.PersistenceStrategy.Interfaces)
  //  che viene usata nelle PersistenceStrategies per autorizzare o meno le operazioni,
  //  questa ha lo stesso ciclo di vita della transazione/PSRequest quindi
  //  ogni volta si azzera quindi non c'è nemmeno bisogno di proteggeerla per il multithreading, così c'è anche il vantaggio
  //  che se i permessi dell'utente dovessero cambiare mentre la transazione è in atto i permessi visti saranno consistenti
  //  per tutta la durata dell'operazione.
  //  L'altra IioAuthCacheUI invece viene usata nel frontend e nella UI (BindSources e StandardActions) quindi deve essere globale
  //  e deve essere thread-safe. La classe che la implementa mantiene anche una copia dell'ultimo Token usato in modo che
  //  quando nelle chiamate successive cambia la cache viene svuotata e fare in modo quindi che se, ad esempio,
  //  si fa un logout e ci si riautentica come altro utente i permessi preesistenti vengano eliminati, inoltre anche
  //  se i permessi dello stesso utente dovessero cambiare dopo l'autenticazione una volta scaduto e rinnovato il token
  //  verranno usati i nuovi permessi solo con un leggero ritardo  pari al max. alla dirata del token. Ho deciso di mantenere
  //  la AuthCacheUI nel SessionData in modo che anche con uniGUI funzioni correttamente visto che in questo caso già iORM
  //  mantiene SessionData separati per le diverse sessioni.
  IioAuthCacheCRUD = interface
    ['{126C694D-6A57-44A0-A012-35051AA6F852}']
    // Add
    procedure Add(const AKey: String; const AAuthorized: Boolean);
    // IsAuthorized
    // NB: IL parametro "AToken" serve solo per fare in modo che
    function TryIsAuthorized(const AKey: String; var OResult: Boolean): Boolean;
  end;

  IioPersistenceStrategyRequest = interface
    ['{3CFC6D3D-EB9D-46C9-AF99-6F5AD8ECD284}']
    // methods
    function AsString: String;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetAuthCache: IioAuthCache;
    function GetBlindLevel: Byte;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetDTO: TObject;
    function GetDTO_Serialize: Boolean;
    function GetIntent: TioPersistenceIntentType;
    function GetIntf1: IInterface;
    function GetIntf1_Serialize: Boolean;
    function GetLic: String;
    function GetLicOID: Integer;
    function GetListDTO: TObject;
    function GetListDTO_Serialize: Boolean;
    function GetMasterBSPersistence: TioBSPersistence;
    function GetMasterPropName: String;
    function GetMasterPropPath: String;
    function GetMethod: TioPersistenceStrategyMethod;
    function GetObj1: TObject;
    function GetObj1_Serialize: Boolean;
    function GetPropName: String;
    function GetRelationOID: Integer;
    function GetRelationPropName: String;
    function GetResult: TValue;
    function GetResultAsBoolean: Boolean;
    function GetResultAsInteger: Integer;
    function GetToken: String;
    function GetUsr: String;
    function GetUsrOID: Integer;
    function GetWhere: IioWhere;
    procedure ImportSessionData(const ASessionData: IioSessionData);
    procedure ImportSessionDataFromPSRequest(const APSRequest: IioPersistenceStrategyRequest);
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetAuthCache(const Value: IioAuthCache);
    procedure SetBlindLevel(const Value: Byte);
    procedure SetConnection(const Value: String);
    procedure SetConnectionRemote(const Value: String);
    procedure SetDTO(const Value: TObject);
    procedure SetDTO_Serialize(const Value: Boolean);
    procedure SetIntent(const Value: TioPersistenceIntentType);
    procedure SetIntf1(const Value: IInterface);
    procedure SetIntf1_Serialize(const Value: Boolean);
    procedure SetLic(const Value: String);
    procedure SetLicOID(const Value: Integer);
    procedure SetListDTO(const Value: TObject);
    procedure SetListDTO_Serialize(const Value: Boolean);
    procedure SetMasterBSPersistence(const Value: TioBSPersistence);
    procedure SetMasterPropName(const Value: String);
    procedure SetMasterPropPath(const Value: String);
    procedure SetObj1(const Value: TObject);
    procedure SetObj1_Serialize(const Value: Boolean);
    procedure SetPropName(const Value: String);
    procedure SetRelationOID(const Value: Integer);
    procedure SetRelationPropName(const Value: String);
    procedure SetResult(const Value: TValue);
    procedure SetResultAsBoolean(const Value: Boolean);
    procedure SetResultAsInteger(const Value: Integer);
    procedure SetToken(const Value: String);
    procedure SetUsr(const Value: String);
    procedure SetUsrOID(const Value: Integer);
    procedure SetWhere(const Value: IioWhere);
    procedure SwitchToConnectionRemote;
    // method property
    property Method: TioPersistenceStrategyMethod read GetMethod;
    // auth-cache
    property AuthCache: IioAuthCache read GetAuthCache write SetAuthCache;
    // session data
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property Connection: String read GetConnection write SetConnection;
    property ConnectionRemote: String read GetConnectionRemote write SetConnectionRemote;
    property Lic: String read GetLic write SetLic;
    property LicOID: Integer read GetLicOID write SetLicOID;
    property Token: String read GetToken write SetToken;
    property Usr: String read GetUsr write SetUsr;
    property UsrOID: Integer read GetUsrOID write SetUsrOID;
    // instances
    property DTO: TObject read GetDTO write SetDTO;
    property DTO_Serialize: Boolean read GetDTO_Serialize write SetDTO_Serialize;
    property Intf1: IInterface read GetIntf1 write SetIntf1;
    property Intf1_Serialize: Boolean read GetIntf1_Serialize write SetIntf1_Serialize;
    property ListDTO: TObject read GetListDTO write SetListDTO;
    property ListDTO_Serialize: Boolean read GetListDTO_Serialize write SetListDTO_Serialize;
    property MasterBSPersistence: TioBSPersistence read GetMasterBSPersistence write SetMasterBSPersistence;
    property Obj1: TObject read GetObj1 write SetObj1;
    property Obj1_Serialize: Boolean read GetObj1_Serialize write SetObj1_Serialize;
    property Where: IioWhere read GetWhere write SetWhere;
    // others
    property BlindLevel: Byte read GetBlindLevel write SetBlindLevel;
    property Intent: TioPersistenceIntentType read GetIntent write SetIntent;
    property MasterPropName: String read GetMasterPropName write SetMasterPropName;
    property MasterPropPath: String read GetMasterPropPath write SetMasterPropPath;
    property PropName: String read GetPropName write SetPropName;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    property RelationPropName: String read GetRelationPropName write SetRelationPropName;
    // result
    property Result: TValue read GetResult write SetResult;
    property ResultAsBoolean: Boolean read GetResultAsBoolean write SetResultAsBoolean;
    property ResultAsInteger: Integer read GetResultAsInteger write SetResultAsInteger;
  end;

implementation

end.
