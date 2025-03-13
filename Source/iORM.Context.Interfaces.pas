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
  iORM.Context.Map.Interfaces, iORM.LiveBindings.BSPersistence,
  iORM.Attributes, iORM.Auth.Interfaces, iORM.PersistenceStrategy.Interfaces;

type

  // Context interface
  IioContext = interface
    ['{6B512CDA-23C6-42A3-AC44-905344B019E9}']
    // ---------- methods ----------
    function GetClassRef: TioClassRef;
    function GetProperties: IioProperties;
    function GetTable: IioTable;
    function GetTrueClass: IioTrueClass;
    function IDIsNull: Boolean;
    function IsTrueClass: Boolean;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    function WhereExist: Boolean;
    // Conflict strategy methods (to avoid circular reference)
    procedure CheckDeleteConflict;
    procedure CheckInsertConflict;
    procedure CheckUpdateConflict;
    function GetCurrentStrategyName: String;
    procedure ResolveDeleteConflict;
    procedure ResolveInsertConflict;
    procedure ResolveUpdateConflict;
    // Synchronization Strategy methods
    function SynchroStrategy_CanPersistEtmTimeSlot: Boolean;
    procedure SynchroStrategy_GenerateLocalID;
    function SynchroStrategy_GetTimeSlotSynchroState: TioEtmTimeSlotSynchroState;
    function SynchroStrategy_IsToBeSynchronized: Boolean;
    // BlindLevel helper methods
    function BlindLevel_Do_DetectObjExists: boolean;
    function BlindLevel_Do_AutoUpdateProps: boolean;
    function BlindLevel_Do_DetectConflicts: boolean;
    procedure BlindLevel_Set_DetectObjExists;
    procedure BlindLevel_Set_AutoUpdateProps;
    procedure BlindLevel_Set_DetectConflicts;
    procedure BlindLevel_Reset_DetectObjExists;
    procedure BlindLevel_Reset_AutoUpdateProps;
    procedure BlindLevel_Reset_DetectConflicts;
    // Map
    function Map: IioMap;
    // GroupBy
    function GetGroupBySql: String;
    // OrderBy
    function GetOrderBySql: String;
    // ---------- properties ----------
    // ActionType
    function GetActionType: TioPersistenceActionType;
    procedure SetActionType(const Value: TioPersistenceActionType);
    property ActionType: TioPersistenceActionType read GetActionType write SetActionType;
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
    // ConnectionNameResolved
    function GetConnectionNameResolved: String;
    property ConnectionNameResolved: String read GetConnectionNameResolved;
    // DataObject
    function GetDataObject: TObject;
    procedure SetDataObject(const AValue: TObject);
    property DataObject:TObject read GetDataObject write SetDataObject;
    // EtmEntityVersion
    function GetEntityFromVersion: Integer;
    procedure SetEntityFromVersion(const Value: Integer);
    property EntityFromVersion: Integer read GetEntityFromVersion write SetEntityFromVersion;
    // IntentType
    function GetIntentType: TioPersistenceIntentType;
    procedure SetIntentType(const Value: TioPersistenceIntentType);
    property IntentType: TioPersistenceIntentType read GetIntentType write SetIntentType;
    // MasterBSPersistence
    function GetMasterBSPersistence: TioBSPersistence;
    property MasterBSPersistence: TioBSPersistence read GetMasterBSPersistence;
    // MasterPropertyName
    // TODO: Eliminare?
    function GetMasterPropertyName: String;
    property MasterPropertyName: String read GetMasterPropertyName;
    // MasterPropertyPath
    // TODO: Eliminare?
    function GetMasterPropertyPath: String;
    property MasterPropertyPath: String read GetMasterPropertyPath;
    // OriginalResolvedTypeNameNonTrueClass
    procedure SetOriginalNonTrueClassMap(const AMap: IioMap);
    function GetOriginalNonTrueClassMap: IioMap;
    property OriginalNonTrueClassMap: IioMap read GetOriginalNonTrueClassMap write SetOriginalNonTrueClassMap;
    // ObjID
    function GetObjID: Integer;
    procedure SetObjID(const AValue: Integer);
    property ObjID: Integer read GetObjID write SetObjID;
    // ObjStatus
    function GetObjStatus: TioObjStatus;
    procedure SetObjStatus(const AValue: TioObjStatus);
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
    // ObjUpdated
    function GetObjUpdated: TioObjUpdated;
    procedure SetObjUpdated(const AValue: TioObjUpdated);
    property ObjUpdated: TioObjUpdated read GetObjUpdated write SetObjUpdated;
    // ObjUpdatedUserID
    function GetObjUpdatedUserID: TioObjUpdatedUserID;
    procedure SetObjUpdatedUserID(const AValue: TioObjUpdatedUserID);
    property ObjUpdatedUserID: TioObjUpdatedUserID read GetObjUpdatedUserID write SetObjUpdatedUserID;
    // ObjUpdatedUserName
    function GetObjUpdatedUserName: TioObjUpdatedUserName;
    procedure SetObjUpdatedUserName(const AValue: TioObjUpdatedUserName);
    property ObjUpdatedUserName: TioObjUpdatedUserName read GetObjUpdatedUserName write SetObjUpdatedUserName;
    // PSRequest
    function GetPSRequest: IioPersistenceStrategyRequest;
    property PSRequest: IioPersistenceStrategyRequest read GetPSRequest;
    // RelationOID
    function GetRelationOID: Integer;
    procedure SetRelationOID(const Value: Integer);
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    // Where
    function GetWhere: IioWhere;
    procedure SetWhere(const AWhere: IioWhere);
    property Where:IioWhere read GetWhere write SetWhere;
  end;

implementation

end.
