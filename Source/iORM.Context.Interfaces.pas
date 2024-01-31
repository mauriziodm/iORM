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
unit iORM.Context.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.Context.Table.Interfaces,
  iORM.Context.Properties.Interfaces, System.Rtti, iORM.Where.Interfaces,
  iORM.Context.Map.Interfaces, iORM.LiveBindings.BSPersistence;

type

  // Context interface
  IioContext = interface
    ['{6B512CDA-23C6-42A3-AC44-905344B019E9}']
    function GetClassRef: TioClassRef;
    function GetID: Integer;
    function GetProperties: IioProperties;
    function GetTable: IioTable;
    function GetTrueClass: IioTrueClass;
    function IDIsNull: Boolean;
    function IsTrueClass: Boolean;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    function WhereExist: Boolean;
    // Conflict strategy methods (to avoid circular reference)
    procedure CheckDeleteConflict(const AContext: IioContext);
    procedure CheckUpdateConflict(const AContext: IioContext);
    procedure ResolveDeleteConflict(const AContext: IioContext);
    procedure ResolveUpdateConflict(const AContext: IioContext);
    function GetCurrentStrategyName: String;
    // BlindLevel helper methods
    function BlindLevel_Do_DetectObjectExists: boolean;
    function BlindLevel_Do_AutoUpdateProps: boolean;
    function BlindLevel_Do_DetectConflicts: boolean;
    procedure BlindLevel_Set_DetectObjectExists;
    procedure BlindLevel_Set_AutoUpdateProps;
    procedure BlindLevel_Set_DetectConflicts;
    procedure BlindLevel_Reset_DetectObjectExists;
    procedure BlindLevel_Reset_AutoUpdateProps;
    procedure BlindLevel_Reset_DetectConflicts;
    // Map
    function Map: IioMap;
    // DataObject
    procedure SetDataObject(const AValue: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
    // ObjectStatus
    procedure SetObjStatus(const AValue: TioObjStatus);
    function GetObjStatus: TioObjStatus;
    property ObjStatus:TioObjStatus read GetObjStatus write SetObjStatus;
    // ObjVersion
    function GetObjVersion: TioObjVersion;
    procedure SetObjVersion(const AValue: TioObjVersion);
    property ObjVersion:TioObjVersion read GetObjVersion write SetObjVersion; // write SetObjVersion;
    // ObjNextVersion
    function GetObjNextVersion: Integer; // Con tipo TioObjVersion ci sono problemi
    property ObjNextVersion: Integer read GetObjNextVersion; // Con tipo TioObjVersion ci sono problemi
    // ObjCreated
    function GetObjCreated: TioObjCreated;
    procedure SetObjCreated(const AValue: TioObjCreated);
    property ObjCreated: TioObjCreated read GetObjCreated write SetObjCreated;
    // ObjCreatedUserID
    function GetObjCreatedUserID: TioObjCreatedUserID;
    procedure SetObjCreatedUserID(const AValue: TioObjCreatedUserID);
    property ObjCreatedUserID: TioObjCreatedUserID read GetObjCreatedUserID write SetObjCreatedUserID;
    // ObjCreatedUserName
    function GetObjCreatedUserName: TioObjCreatedUserName;
    procedure SetObjCreatedUserName(const AValue: TioObjCreatedUserName);
    property ObjCreatedUserName: TioObjCreatedUserName read GetObjCreatedUserName write SetObjCreatedUserName;
    // ObjUpdatedUserID
    function GetObjUpdatedUserID: TioObjUpdatedUserID;
    procedure SetObjUpdatedUserID(const AValue: TioObjUpdatedUserID);
    property ObjUpdatedUserID: TioObjUpdatedUserID read GetObjUpdatedUserID write SetObjUpdatedUserID;
    // ObjUpdatedUserName
    function GetObjUpdatedUserName: TioObjUpdatedUserName;
    procedure SetObjUpdatedUserName(const AValue: TioObjUpdatedUserName);
    property ObjUpdatedUserName: TioObjUpdatedUserName read GetObjUpdatedUserName write SetObjUpdatedUserName;
    // ObjUpdated
    function GetObjUpdated: TioObjUpdated;
    procedure SetObjUpdated(const AValue: TioObjUpdated);
    property ObjUpdated: TioObjUpdated read GetObjUpdated write SetObjUpdated;
    // Where
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    property Where:IioWhere read GetWhere write SetWhere;
    // GroupBy
    function GetGroupBySql: String;
    // OrderBy
    function GetOrderBySql: String;
    // RelationOID
    function GetRelationOID: Integer;
    procedure SetRelationOID(const Value: Integer);
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    // MasterPropertyPath
    function GetMasterPropertyPath: String;
    property MasterPropertyPath: String read GetMasterPropertyPath;
    // MasterBSPersistence
    function GetMasterBSPersistence: TioBSPersistence;
    property MasterBSPersistence: TioBSPersistence read GetMasterBSPersistence;
    // OriginalResolvedTypeNameNonTrueClass
    procedure SetOriginalNonTrueClassMap(const AMap: IioMap);
    function GetOriginalNonTrueClassMap: IioMap;
    property OriginalNonTrueClassMap: IioMap read GetOriginalNonTrueClassMap write SetOriginalNonTrueClassMap;
    // EntityFromVersion
    function GetEntityFromVersion: Integer;
    procedure SetEntityFromVersion(const Value: Integer);
    property EntityFromVersion: Integer read GetEntityFromVersion write SetEntityFromVersion;
    // ActionType
    function GetActionType: TioPersistenceActionType;
    procedure SetActionType(const Value: TioPersistenceActionType);
    property ActionType: TioPersistenceActionType read GetActionType write SetActionType;
    // IntentType
    function GetIntentType: TioPersistenceIntentType;
    procedure SetIntentType(const Value: TioPersistenceIntentType);
    property IntentType: TioPersistenceIntentType read GetIntentType write SetIntentType;
    // BlindLevel
    function GetBlindLevel: Byte;
    procedure SetBlindLevel(const Value: Byte);
    property BlindLevel: Byte read GetBlindLevel write SetBlindLevel;
    // ConflictDetected
    function GetConflictDetected: Boolean;
    procedure SetConflictDetected(const Value: Boolean);
    property ConflictDetected: Boolean read GetConflictDetected write SetConflictDetected;
    // ConflictState
    function GetConflictState: TioPersistenceConflictState;
    procedure SetConflictState(const Value: TioPersistenceConflictState);
    property ConflictState: TioPersistenceConflictState read GetConflictState write SetConflictState;
  end;

implementation

end.
