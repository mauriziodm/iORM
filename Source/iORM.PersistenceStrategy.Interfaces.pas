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
  iORM.Auth.Interfaces, iORM.CommonTypes, iORM.LiveBindings.BSPersistence,
  iORM.Where.Interfaces;

const

  // persistence strategy request json properties constants
  PSR_AUTH_GRANT = 'AuthGrant';
  PSR_AUTH_INTENTION = 'AuthIntent';
  PSR_AUTH_SCOPE = 'AuthScope';
  PSR_AUTH_TOKEN = 'AuthToken';
  PSR_BLINDLEVEL = 'BlindLevel';
  PSR_INSTANCES_DATAOBJ = 'DataObj';
  PSR_INSTANCES_INTF1 = 'Intf1';
  PSR_INSTANCES_MASTERBSPERSISTENCE = 'MasterBSP';
  PSR_INSTANCES_OBJ1 = 'Obj1';
  PSR_INSTANCES_WHERE = 'Where';
  PSR_INTENTTYPE = 'Intent';
  PSR_MASTERPROPERTYNAME = 'MasterProp';
  PSR_MASTERPROPERTYPATH = 'MasterPropPath';
  PSR_METHOD = 'Method';
  PSR_PROPERTYNAME = 'PropName';
  PSR_RELATIONID = 'RelPropID';
  PSR_RELATIONPROPERTYNAME = 'RelPropName';
  PSR_SESSION_APP = 'App';
  PSR_SESSION_APPOID = 'AppID';
  PSR_SESSION_CONNECTION = 'Conn';
  PSR_SESSION_CONNECTIONREMOTE = 'ConnRem';
  PSR_SESSION_USER = 'Usr';
  PSR_SESSION_USEROID = 'UsrID';

type

  // *************************************************************************
  // * NB: Abstract static class TioPersistenceStrategyIntf is declared into *
  // *      iORM.DB.Interfaces to avoid circular unit reference error        *
  // *************************************************************************

  TioPersistenceStrategyMethod = (
    psmAuthApp,
    psmAuthUser,
    psmAuthNewAccessToken,
    psmAuthRefreshAccessToken,
    psmCount,
    psmDelete,
    psmDeleteList,
    psmDeleteObject,
    psmDoSynchronization,
    psmLoadDataSet,
    psmLoadList,
    psmLoadObject,
    psmMax,
    psmMin,
    psmPersistList,
    psmPersistObject,
    psmSQLDestExecute,
    psmSQLDestLoadDataSet,
    psmTest
  );

  IioPersistenceStrategyRequest = interface
    ['{3CFC6D3D-EB9D-46C9-AF99-6F5AD8ECD284}']
    // methods
    function AsString: String;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetAuthGrant: String;
    function GetAuthIntention: TioAuthIntention;
    function GetAuthScope: String;
    function GetAuthToken: String;
    function GetBlindLevel: Byte;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetDataObj: TObject;
    function GetIntent: TioPersistenceIntentType;
    function GetIntf1: IInterface;
    function GetMasterBSPersistence: TioBSPersistence;
    function GetMasterPropName: String;
    function GetMasterPropPath: String;
    function GetMethod: TioPersistenceStrategyMethod;
    function GetObj1: TObject;
    function GetPropName: String;
    function GetRelationOID: Integer;
    function GetRelationPropName: String;
    function GetUsr: String;
    function GetUsrOID: Integer;
    function GetWhere: IioWhere;
    procedure SetAuthGrant(const Value: String);
    procedure SetAuthIntention(const Value: TioAuthIntention);
    procedure SetAuthScope(const Value: String);
    procedure SetBlindLevel(const Value: Byte);
    procedure SetDataObj(const Value: TObject);
    procedure SetIntent(const Value: TioPersistenceIntentType);
    procedure SetIntf1(const Value: IInterface);
    procedure SetMasterBSPersistence(const Value: TioBSPersistence);
    procedure SetMasterPropName(const Value: String);
    procedure SetMasterPropPath(const Value: String);
    procedure SetObj1(const Value: TObject);
    procedure SetPropName(const Value: String);
    procedure SetRelationOID(const Value: Integer);
    procedure SetRelationPropName(const Value: String);
    procedure SetWhere(const Value: IioWhere);
    // method
    property Method: TioPersistenceStrategyMethod read GetMethod;
    // session data
    property App: String read GetApp;
    property AppOID: Integer read GetAppOID;
    property Connection: String read GetConnection;
    property ConnectionRemote: String read GetConnectionRemote;
    property Usr: String read GetUsr;
    property UsrOID: Integer read GetUsrOID;
    // auth
    property AuthGrant: String read GetAuthGrant;
    property AuthIntention: TioAuthIntention read GetAuthIntention;
    property AuthScope: String read GetAuthScope;
    property AuthToken: String read GetAuthToken; // for auth purposes -> AccessToken, RefreshToken, CodeVerifier, CodeChallenge
    // instances
    property DataObj: TObject read GetDataObj write SetDataObj;
    property Intf1: IInterface read GetIntf1 write SetIntf1;
    property SetMasterBSPersistence: TioBSPersistence read GetMasterBSPersistence write SetMasterBSPersistence;
    property Obj1: TObject read GetObj1 write SetObj1;
    property Where: IioWhere read GetWhere write SetWhere;
    // others
    property BlindLevel: Byte read GetBlindLevel write SetBlindLevel;
    property Intent: TioPersistenceIntentType read GetIntent write SetIntent;
    property MasterPropName: String read GetMasterPropName write SetMasterPropName;
    property MasterPropPath: String read GetMasterPropPath write SetMasterPropPath;
    property PropName: String read GetPropName write SetPropName;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    property RelationPropName: String read GetRelationPropName write SetRelationPropName;
  end;

implementation

end.
