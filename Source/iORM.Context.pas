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
unit iORM.Context;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.CommonTypes,
  iORM.Context.Table.Interfaces, System.Rtti,
  iORM.Context.Map.Interfaces, iORM.Where.Interfaces,
  iORM.LiveBindings.BSPersistence, iORM.ConflictStrategy.Interfaces,
  iORM.SynchroStrategy.Interfaces, iORM.Attributes,
  iORM.PersistenceStrategy.Interfaces, iORM.Abstraction, iORM.Auth.Interfaces;

type

  TioContext_Custom = class abstract (TInterfacedObject, IioContext)
  strict private
    FActionType: TioPersistenceActionType;
    FConflictDetected: Boolean;
    FConflictState: TioPersistenceConflictState;
    FEntityFromVersion: Integer;
//    FHasManyChildVirtualPropertyValue: Integer;
    FMap: IioMap;
    FObjNextVersion: TioObjVersion;
    FOriginalNonTrueClassMap: IioMap;
    FSynchroStrategy_Client_NoDirectCall: IioSynchroStrategy_Client;
    // ActionType
    function GetActionType: TioPersistenceActionType;
    procedure SetActionType(const Value: TioPersistenceActionType);
    // ConflictDetected
    function GetConflictDetected: Boolean;
    procedure SetConflictDetected(const Value: Boolean);
    // ConflictState
    function GetConflictState: TioPersistenceConflictState;
    procedure SetConflictState(const Value: TioPersistenceConflictState);
    // EtmEntityVersion
    function GetEntityFromVersion: Integer;
    procedure SetEntityFromVersion(const Value: Integer);
    // ObjCreated
    function GetObjCreated: TioObjCreated;
    procedure SetObjCreated(const AValue: TioObjCreated);
    // ObjCreatedUserID
    function GetObjCreatedUserID: TioObjCreatedUserID;
    procedure SetObjCreatedUserID(const AValue: TioObjCreatedUserID);
    // ObjCreatedUserName
    function GetObjCreatedUserName: TioObjCreatedUserName;
    procedure SetObjCreatedUserName(const AValue: TioObjCreatedUserName);
    // ObjID
    function GetObjID: Integer;
    procedure SetObjID(const AValue: Integer);
    // ObjNextVersion
    function GetObjNextVersion: Integer; // Con tipo TioObjVersion ci sono problemi
    // ObjStatus
    function GetObjStatus: TioObjStatus;
    procedure SetObjStatus(const AValue: TioObjStatus);
    // ObjUpdated
    function GetObjUpdated: TioObjUpdated;
    procedure SetObjUpdated(const AValue: TioObjUpdated);
    // ObjUpdatedUserID
    function GetObjUpdatedUserID: TioObjUpdatedUserID;
    procedure SetObjUpdatedUserID(const AValue: TioObjUpdatedUserID);
    // ObjUpdatedUserName
    function GetObjUpdatedUserName: TioObjUpdatedUserName;
    procedure SetObjUpdatedUserName(const AValue: TioObjUpdatedUserName);
    // ObjVersion
    function GetObjVersion: TioObjVersion;
    procedure SetObjVersion(const AValue: TioObjVersion);
    // OriginalResolvedTypeNameNonTrueClass
    procedure SetOriginalNonTrueClassMap(const AMap: IioMap);
    function GetOriginalNonTrueClassMap: IioMap;
  protected
    // BlindLevel
    function GetBlindLevel: Byte; virtual; abstract;
    procedure SetBlindLevel(const Value: Byte); virtual; abstract;
    // ConnectionName
    function GetConnectionNameResolved: String; virtual; abstract;
    // DataObject
    function GetDataObject: TObject; virtual; abstract;
    procedure SetDataObject(const AValue: TObject); virtual; abstract;
    // Intent
    function GetIntent: TioPersistenceIntentType; virtual; abstract;
    procedure SetIntent(const Value: TioPersistenceIntentType); virtual; abstract;
    // MasterBSPersistence
    function GetMasterBSPersistence: TioBSPersistence; virtual; abstract;
    // MasterPropertyName
    function GetMasterPropertyName: String; virtual; abstract;
    // MasterPropertyPath
    function GetMasterPropertyPath: String; virtual; abstract;
    // PSRequest
    function GetPSRequest: IioPersistenceStrategyRequest; virtual; abstract;
    // RelationOID
    function GetRelationOID: Integer; virtual; abstract;
    procedure SetRelationOID(const Value: Integer); virtual; abstract;
    // Where
    function GetWhere: IioWhere; virtual; abstract;
    procedure SetWhere(const AWhere: IioWhere); virtual; abstract;
  public
    constructor Create_Map(const AMap: IioMap);
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
    procedure CheckDeleteConflict; inline;
    procedure CheckInsertConflict; inline;
    procedure CheckUpdateConflict; inline;
    procedure ResolveDeleteConflict; inline;
    procedure ResolveInsertConflict; inline;
    procedure ResolveUpdateConflict; inline;
    function GetCurrentStrategyName: String;
    // Synchronization Strategy methods
    function SynchroStrategy_CanPersistEtmTimeSlot: Boolean;
    function SynchroStrategy_Client: IioSynchroStrategy_Client; inline;
    procedure SynchroStrategy_GenerateLocalID;
    function SynchroStrategy_GetTimeSlotSynchroState: TioEtmTimeSlotSynchroState;
    function SynchroStrategy_IsToBeSynchronized: Boolean;
    // BlindLevel helper methods
    function BlindLevel_Do_DetectObjExists: boolean; inline;
    function BlindLevel_Do_AutoUpdateProps: boolean; inline;
    function BlindLevel_Do_DetectConflicts: boolean; inline;
    procedure BlindLevel_Set_DetectObjExists; inline;
    procedure BlindLevel_Set_AutoUpdateProps; inline;
    procedure BlindLevel_Set_DetectConflicts; inline;
    procedure BlindLevel_Reset_DetectObjExists; inline;
    procedure BlindLevel_Reset_AutoUpdateProps; inline;
    procedure BlindLevel_Reset_DetectConflicts; inline;
    // Map
    function Map: IioMap;
    // GroupBy
    function GetGroupBySql: String;
    // OrderBy
    function GetOrderBySql: String;
    // Properties
    property ActionType: TioPersistenceActionType read GetActionType write SetActionType;
    property BlindLevel: Byte read GetBlindLevel write SetBlindLevel;
    property ConflictDetected: Boolean read GetConflictDetected write SetConflictDetected;
    property ConflictState: TioPersistenceConflictState read GetConflictState write SetConflictState;
    property ConnectionNameResolved: String read GetConnectionNameResolved;
    property DataObject: TObject read GetDataObject write SetDataObject;
    property EntityFromVersion: Integer read GetEntityFromVersion write SetEntityFromVersion;
    property Intent: TioPersistenceIntentType read GetIntent write SetIntent;
    property MasterPropertyName: String read GetMasterPropertyName;
    property MasterPropertyPath: String read GetMasterPropertyPath;
    property MasterBSPersistence: TioBSPersistence read GetMasterBSPersistence;
    property ObjCreated: TioObjCreated read GetObjCreated write SetObjCreated;
    property ObjCreatedUserID: TioObjCreatedUserID read GetObjCreatedUserID write SetObjCreatedUserID;
    property ObjCreatedUserName: TioObjCreatedUserName read GetObjCreatedUserName write SetObjCreatedUserName;
    property ObjID: Integer read GetObjID write SetObjID;
    property ObjStatus: TioObjStatus read GetObjStatus write SetObjStatus;
    property ObjUpdated: TioObjUpdated read GetObjUpdated write SetObjUpdated;
    property ObjUpdatedUserID: TioObjUpdatedUserID read GetObjUpdatedUserID write SetObjUpdatedUserID;
    property ObjUpdatedUserName: TioObjUpdatedUserName read GetObjUpdatedUserName write SetObjUpdatedUserName;
    property ObjVersion: TioObjVersion read GetObjVersion write SetObjVersion;
    property ObjNextVersion: Integer read GetObjNextVersion; // Con tipo TioObjVersion ci sono problemi
    property PSRequest: IioPersistenceStrategyRequest read GetPSRequest;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    property Where: IioWhere read GetWhere write SetWhere;
    /// Contiene il nome della classe originaria cioè, nel caso il contesto sia stato creato con
    ///  la TrueClassVirtual (select query) a partire da una resolved class name, contiene il nome
    ///  della classe originaria, quella dalla quale poi si è estratta la TrueClassVirtualMap stessa.
    property OriginalNonTrueClassMap: IioMap read GetOriginalNonTrueClassMap write SetOriginalNonTrueClassMap;
  end;

  TioContext_PSRequest = class(TioContext_Custom, IioAuthDecisionRequest)
  strict private
    FPSRequest: IioPersistenceStrategyRequest;
  protected
    // access-token
    function GetToken: String;
    // auth-context
    function GetAuthContext: String;
    // BlindLevel
    function GetBlindLevel: Byte; override;
    procedure SetBlindLevel(const Value: Byte); override;
    // ConnectionName
    function GetConnectionNameResolved: String; override;
    // DataObject
    function GetDataObject: TObject; override;
    procedure SetDataObject(const AValue: TObject); override;
    // Intent
    function GetIntent: TioPersistenceIntentType; override;
    procedure SetIntent(const Value: TioPersistenceIntentType); override;
    // MasterBSPersistence
    function GetMasterBSPersistence: TioBSPersistence; override;
    // MasterPropertyName
    function GetMasterPropertyName: String; override;
    // MasterPropertyPath
    function GetMasterPropertyPath: String; override;
    // ForceAuthDecision
    function GetForceAuthDecision: Boolean;
    // PSRequest
    function GetPSRequest: IioPersistenceStrategyRequest; override;
    // RelationOID
    function GetRelationOID: Integer; override;
    procedure SetRelationOID(const Value: Integer); override;
    // TypeName
    function GetTypeName: String;
    // Where
    function GetWhere: IioWhere; override;
    procedure SetWhere(const AWhere: IioWhere); override;
  public
    constructor Create_PSRequest(const APSRequest: IioPersistenceStrategyRequest; const AMap: IioMap);
    function IsAuthorized: Boolean;
  end;

  TioContext_Simple = class(TioContext_Custom)
  strict private
    FBlindLevel: Byte;
    FDataObject: TObject;
    FIntent: TioPersistenceIntentType;
    FMasterBSPersistence: TioBSPersistence;
    FMasterPropertyName: String;
    FMasterPropertyPath: String;
    FRelationOID: Integer;
    FWhere: IioWhere;
  protected
    // BlindLevel
    function GetBlindLevel: Byte; override;
    procedure SetBlindLevel(const Value: Byte); override;
    // ConnectionName
    function GetConnectionNameResolved: String; override;
    // DataObject
    function GetDataObject: TObject; override;
    procedure SetDataObject(const Value: TObject); override;
    // IntentType
    function GetIntent: TioPersistenceIntentType; override;
    procedure SetIntent(const Value: TioPersistenceIntentType); override;
    // MasterBSPersistence
    function GetMasterBSPersistence: TioBSPersistence; override;
    // MasterPropertyName
    function GetMasterPropertyName: String; override;
    // MasterPropertyPath
    function GetMasterPropertyPath: String; override;
    // PSRequest
    function GetPSRequest: IioPersistenceStrategyRequest; override;
    // RelationOID
    function GetRelationOID: Integer; override;
    procedure SetRelationOID(const Value: Integer); override;
    // Where
    function GetWhere: IioWhere; override;
    procedure SetWhere(const AWhere: IioWhere); override;
  public
    constructor Create_Simple(const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte; const AMap: IioMap; const AWhere: IioWhere;
      const ADataObject: TObject; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String);
  end;

implementation

uses
  System.TypInfo,
  iORM.Context.Container, System.SysUtils, iORM.Exceptions,
  System.StrUtils, iORM.DB.Interfaces, iORM, iORM.DB.ConnectionContainer,
  iORM.Utilities;

{ TioContext }

function TioContext_Custom.GetTrueClass: IioTrueClass;
begin
  Result := Self.Map.GetTable.GetTrueClass;
end;

function TioContext_Custom.BlindLevel_Do_AutoUpdateProps: boolean;
begin
  Result := TioUtilities.BlindLevel_Do_AutoUpdateProps(BlindLevel);
end;

function TioContext_Custom.BlindLevel_Do_DetectConflicts: boolean;
begin
  Result := TioUtilities.BlindLevel_Do_DetectConflicts(BlindLevel);
end;

function TioContext_Custom.BlindLevel_Do_DetectObjExists: boolean;
begin
  Result := TioUtilities.BlindLevel_Do_DetectObjExists(BlindLevel);
end;

procedure TioContext_Custom.BlindLevel_Reset_AutoUpdateProps;
begin
  if BlindLevel_Do_AutoUpdateProps then
    BlindLevel := BlindLevel - BL_BIT_AUTO_UPDATE_PROPS;
end;

procedure TioContext_Custom.BlindLevel_Reset_DetectConflicts;
begin
  if BlindLevel_Do_DetectConflicts then
    BlindLevel := BlindLevel - BL_BIT_DETECT_CONFLICTS;
end;

procedure TioContext_Custom.BlindLevel_Reset_DetectObjExists;
begin
  if BlindLevel_Do_DetectObjExists then
    BlindLevel := BlindLevel - BL_BIT_DETECT_OBJ_EXISTS;
end;

procedure TioContext_Custom.BlindLevel_Set_AutoUpdateProps;
begin
  if not BlindLevel_Do_AutoUpdateProps then
    BlindLevel := BlindLevel + BL_BIT_AUTO_UPDATE_PROPS;
end;

procedure TioContext_Custom.BlindLevel_Set_DetectConflicts;
begin
  if not BlindLevel_Do_DetectConflicts then
    BlindLevel := BlindLevel + BL_BIT_DETECT_CONFLICTS;
end;

procedure TioContext_Custom.BlindLevel_Set_DetectObjExists;
begin
  if not BlindLevel_Do_DetectObjExists then
    BlindLevel := BlindLevel + BL_BIT_DETECT_OBJ_EXISTS;
end;

procedure TioContext_Custom.CheckDeleteConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetDeleteConflictStrategy).CheckDeleteConflict(Self);
end;

procedure TioContext_Custom.CheckInsertConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetInsertConflictStrategy).CheckInsertConflict(Self);
end;

procedure TioContext_Custom.CheckUpdateConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetUpdateConflictStrategy).CheckUpdateConflict(Self);
end;

procedure TioContext_Custom.ResolveDeleteConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetDeleteConflictStrategy).ResolveDeleteConflict(Self);
end;

procedure TioContext_Custom.ResolveInsertConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetInsertConflictStrategy).ResolveInsertConflict(Self);
end;

procedure TioContext_Custom.ResolveUpdateConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetUpdateConflictStrategy).ResolveUpdateConflict(Self);
end;

constructor TioContext_Custom.Create_Map(const AMap: IioMap);
begin
  inherited Create;
  FActionType := atDoNotPersist;
  FConflictDetected := False;
  FConflictState := csUndefined;
  FEntityFromVersion := 0;
  FMap := AMap;
  FObjNextVersion := OBJVERSION_NULL;
  FOriginalNonTrueClassMap := nil;
  FSynchroStrategy_Client_NoDirectCall := nil;
end;

function TioContext_Custom.GetClassRef: TioClassRef;
begin
  Result := Map.GetClassRef;
end;

function TioContext_Custom.GetEntityFromVersion: Integer;
begin
  Result := FEntityFromVersion;
end;

function TioContext_Custom.GetGroupBySql: String;
begin
  Result := '';
  // Ritorna il GroupBy fisso (attribute nella dichiarazione della classe)
  if Assigned(Self.GetTable.GetGroupBy) then
    Result := Self.GetTable.GetGroupBy.GetSql;
  // Aggiungere qui l'eventuale futuro codice per aggiungere/sostituire
  // l'eventuale GroupBy specificato nel ioWhere e che quindi è nel
  // context e che sostituisce il GroupBy fisso
end;

function TioContext_Custom.GetCurrentStrategyName: String;
begin
  case FActionType of
    atInsert:
      Result := String.Empty;
    atUpdate:
      Result := TioCustomConflictStrategyRef(GetTable.UpdateConflictStrategy).Name;
    atDelete:
      Result := TioCustomConflictStrategyRef(GetTable.DeleteConflictStrategy).Name;
  else
    raise EioGenericException.Create(ClassName, 'GetCurrentStrategyName', 'Undefined action type.');
  end;  
end;

function TioContext_Custom.GetObjID: Integer;
begin
  if not Assigned(DataObject) then
    raise EioGenericException.Create(Self.ClassName + '.GetID: DataObject not assigned');
  Result := GetProperties.GetIdProperty.GetValue(DataObject).AsInteger;
end;

function TioContext_Custom.GetObjCreated: TioObjCreated;
begin
  if GetProperties.ObjCreatedPropertyExist then
    Result := GetProperties.ObjCreatedProperty.GetValue(DataObject).AsType<TioObjCreated>
  else
    Result := TRANSACTION_TIMESTAMP_NULL;
end;

function TioContext_Custom.GetObjCreatedUserID: TioObjCreatedUserID;
begin
  if GetProperties.ObjCreatedUserIDPropertyExist then
    Result := GetProperties.ObjCreatedUserIDProperty.GetValue(DataObject).AsType<TioObjCreatedUserID>
  else
    Result := IO_INTEGER_NULL_VALUE;
end;

function TioContext_Custom.GetObjCreatedUserName: TioObjCreatedUserName;
begin
  if GetProperties.ObjCreatedUserNamePropertyExist then
    Result := GetProperties.ObjCreatedUserNameProperty.GetValue(DataObject).AsType<TioObjCreatedUserName>
  else
    Result := IO_STRING_NULL_VALUE;
end;

function TioContext_Custom.GetObjStatus: TioObjStatus;
begin
  if GetProperties.ObjStatusPropertyExist then
    Result := TioObjStatus(GetProperties.ObjStatusProperty.GetValue(DataObject).AsOrdinal)
  else
    Result := osDirty;
end;

function TioContext_Custom.GetObjUpdated: TioObjUpdated;
begin
  if GetProperties.ObjUpdatedPropertyExist then
    Result := GetProperties.ObjUpdatedProperty.GetValue(DataObject).AsType<TioObjUpdated>
  else
    Result := TRANSACTION_TIMESTAMP_NULL;
end;

function TioContext_Custom.GetObjUpdatedUserID: TioObjUpdatedUserID;
begin
  if GetProperties.ObjUpdatedUserIDPropertyExist then
    Result := GetProperties.ObjUpdatedUserIDProperty.GetValue(DataObject).AsType<TioObjUpdatedUserID>
  else
    Result := IO_INTEGER_NULL_VALUE;
end;

function TioContext_Custom.GetObjUpdatedUserName: TioObjUpdatedUserName;
begin
  if GetProperties.ObjUpdatedUserNamePropertyExist then
    Result := GetProperties.ObjUpdatedUserNameProperty.GetValue(DataObject).AsType<TioObjUpdatedUserName>
  else
    Result := IO_STRING_NULL_VALUE;
end;

function TioContext_Custom.GetOrderBySql: String;
begin
  Result := Where.GetOrderBySql(FMap);
end;

function TioContext_Custom.GetOriginalNonTrueClassMap: IioMap;
begin
  if Assigned(FOriginalNonTrueClassMap) then
    Result := FOriginalNonTrueClassMap
  else
    Result := FMap;
end;

function TioContext_Custom.GetActionType: TioPersistenceActionType;
begin
  Result := FActionType;
end;

function TioContext_Custom.GetConflictDetected: Boolean;
begin
  Result := FConflictDetected;
end;

function TioContext_Custom.GetConflictState: TioPersistenceConflictState;
begin
  Result := FConflictState;
end;

function TioContext_Custom.GetProperties: IioProperties;
begin
  Result := Self.Map.GetProperties;
end;

function TioContext_Custom.RttiContext: TRttiContext;
begin
  Result := Self.Map.RttiContext;
end;

function TioContext_Custom.RttiType: TRttiInstanceType;
begin
  Result := Self.Map.RttiType;
end;

procedure TioContext_Custom.SetEntityFromVersion(const Value: Integer);
begin
  FEntityFromVersion := Value;
end;

procedure TioContext_Custom.SetObjCreated(const AValue: TioObjCreated);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjCreatedPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjCreated>(AValue);
  GetProperties.ObjCreatedProperty.SetValue(DataObject, LPropValue);
end;

procedure TioContext_Custom.SetObjCreatedUserID(const AValue: TioObjCreatedUserID);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjCreatedUserIDPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjCreatedUserID>(AValue);
  GetProperties.ObjCreatedUserIDProperty.SetValue(DataObject, LPropValue);
end;

procedure TioContext_Custom.SetObjCreatedUserName(const AValue: TioObjCreatedUserName);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjCreatedUserNamePropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjCreatedUserName>(AValue);
  GetProperties.ObjCreatedUserNameProperty.SetValue(DataObject, LPropValue);
end;

procedure TioContext_Custom.SetObjID(const AValue: Integer);
var
  LPropValue: TValue;
begin
  LPropValue := TValue.From<Integer>(AValue);
  GetProperties.GetIdProperty.SetValue(DataObject, LPropValue);
end;

procedure TioContext_Custom.SetObjStatus(const AValue: TioObjStatus);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjStatusPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjStatus>(AValue);
  GetProperties.ObjStatusProperty.SetValue(DataObject, LPropValue);
end;

procedure TioContext_Custom.SetObjUpdated(const AValue: TioObjUpdated);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjUpdatedPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjUpdated>(AValue);
  GetProperties.ObjUpdatedProperty.SetValue(DataObject, LPropValue);
end;

procedure TioContext_Custom.SetObjUpdatedUserID(const AValue: TioObjUpdatedUserID);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjUpdatedUserIDPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjUpdatedUserID>(AValue);
  GetProperties.ObjUpdatedUserIDProperty.SetValue(DataObject, LPropValue);
end;

procedure TioContext_Custom.SetObjUpdatedUserName(const AValue: TioObjUpdatedUserName);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjUpdatedUserNamePropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjUpdatedUserName>(AValue);
  GetProperties.ObjUpdatedUserNameProperty.SetValue(DataObject, LPropValue);
end;

procedure TioContext_Custom.SetObjVersion(const AValue: TioObjVersion);
begin
  // note: if the ObjVersion property does not exist it should not raise any exceptions.
  if GetProperties.ObjVersionPropertyExist then
    GetProperties.ObjVersionProperty.SetValue(DataObject, AValue);
end;

function TioContext_Custom.GetObjVersion: TioObjVersion;
begin
  if GetProperties.ObjVersionPropertyExist then
    Result := GetProperties.ObjVersionProperty.GetValue(DataObject).AsType<TioObjVersion>
  else
    Result := OBJVERSION_NULL;
end;

procedure TioContext_Custom.SetOriginalNonTrueClassMap(const AMap: IioMap);
begin
  FOriginalNonTrueClassMap := AMap;
end;

procedure TioContext_Custom.SetActionType(const Value: TioPersistenceActionType);
begin
  FActionType := Value;
end;

procedure TioContext_Custom.SetConflictDetected(const Value: Boolean);
begin
  FConflictDetected := Value;
end;

procedure TioContext_Custom.SetConflictState(const Value: TioPersistenceConflictState);
begin
  FConflictState := Value;
end;

function TioContext_Custom.WhereExist: Boolean;
begin
  Result := Assigned(Where);
end;

function TioContext_Custom.GetTable: IioTable;
begin
  Result := Self.Map.GetTable;
end;

function TioContext_Custom.IDIsNull: Boolean;
begin
  Result := (not Assigned(DataObject)) or (GetObjID = IO_INTEGER_NULL_VALUE);
end;

function TioContext_Custom.GetObjNextVersion: Integer;
var
  LSynchroStrategy_Client: IioSynchroStrategy_Client;
begin
  // If the ObjVersion property does not exists then return the OBJVERSION_NULL (zero)
  if not GetProperties.ObjVersionPropertyExist then
    Exit(OBJVERSION_NULL);
  // If a SynchroStrategy is assigned and active (local remote and not connected device) then ask to it
  //  the next ObjVersion (normally the Objversion increment is disable if the current device is a remote device with synchronization).
  //  Else if a SynchroStrategy is NOT assigned then load the last ObjVersion from the DB (from the db because someone else in the
  //  meantime could have saved a new version)
  // If the ObjVersion is not already loaded then load it (once)
  if FObjNextVersion = OBJVERSION_NULL then
  begin
    LSynchroStrategy_Client := SynchroStrategy_Client;
    if (LSynchroStrategy_Client <> nil) then
      FObjNextVersion := LSynchroStrategy_Client.GetNextObjVersion(Self)
    else
      FObjNextVersion := io._LoadObjVersionInternal(Self) + 1;
  end;
  // Return the value
  Result := FObjNextVersion;
end;

procedure TioContext_Custom.SynchroStrategy_GenerateLocalID;
var
  LSynchroStrategy_Client: IioSynchroStrategy_Client;
begin
  // If a SynchroStrategy is assigned and active (local remote and not connected device) and the object ID
  //  is not assigned then it asks the SynchroStrategy for a temporary local ID.
  // Note: Obviously if a new ID is assigned by SynchroStrategy this will disable the normal ID generation (if generated ID is not NULL)
  LSynchroStrategy_Client := SynchroStrategy_Client;
  // If is to be synchronized...
  if (LSynchroStrategy_Client <> nil) and IDIsNull and LSynchroStrategy_Client.IsToBeSynchronized(Self) then
    GetProperties.GetIdProperty.SetValue(DataObject, LSynchroStrategy_Client.GenerateLocalID(Self));
end;

function TioContext_Custom.SynchroStrategy_GetTimeSlotSynchroState: TioEtmTimeSlotSynchroState;
begin
  // Determines the TimeSlotSynchroState based on the intent and whether or not it is a class to synchronize
  case Intent of
    itRegular, itRevert:
      if SynchroStrategy_IsToBeSynchronized then
        Result := stToBeSynchronized
      else
        Result := stRegular;
    itSynchro_PersistToServer:
      if SynchroStrategy_IsToBeSynchronized then
        Result := stToBeSynchronized
      else
        Result := stSynchronized_ReceivedFromClient;
    itSynchro_PersistToClient:
      Result := stSynchronized_ReceivedFromServer;
  else
    Result := stRegular;
  end;
end;

function TioContext_Custom.SynchroStrategy_CanPersistEtmTimeSlot: Boolean;
var
  LSynchroStrategy_Client: IioSynchroStrategy_Client;
begin
  // Get the SynchroStrategy if exists
  LSynchroStrategy_Client := SynchroStrategy_Client;
  // If there is a SinchroStrategy, it determines whether the TimeSlot should be created
  //  and persisted based on the intent of the operation and the properties of the
  //  SynchroStrategy itself.
  Result := True;
  if Assigned(LSynchroStrategy_Client) then
  begin
    case Intent of
      itRegular, itRevert, itSynchro_PersistToServer:
        if SynchroStrategy_IsToBeSynchronized then
          Result := LSynchroStrategy_Client.EtmTimeSlot_Persist_ToBeSynchronized
        else
          Result := LSynchroStrategy_Client.EtmTimeSlot_Persist_Regular;
      itSynchro_PersistToClient:
        Result := LSynchroStrategy_Client.EtmTimeSlot_Persist_ReceivedFromServer;
    end;
  end;
end;

function TioContext_Custom.SynchroStrategy_Client: IioSynchroStrategy_Client;
begin
  if not Assigned(FSynchroStrategy_Client_NoDirectCall) then
    FSynchroStrategy_Client_NoDirectCall := TioConnectionManager.GetSynchroStrategy_Client(GetConnectionNameResolved);
  Result := FSynchroStrategy_Client_NoDirectCall;
end;

function TioContext_Custom.SynchroStrategy_IsToBeSynchronized: Boolean;
var
  LSynchroStrategy_Client: IioSynchroStrategy_Client;
begin
  // If a SynchroStrategy is assigned and active (local remote and not connected device) and the object ID
  //  is not assigned then it asks the SynchroStrategy for a temporary local ID.
  // Note: Obviously if a new ID is assigned by SynchroStrategy this will disable the normal ID generation (if generated ID is not NULL)
  LSynchroStrategy_Client := SynchroStrategy_Client;
  Result := (LSynchroStrategy_Client <> nil) and LSynchroStrategy_Client.IsToBeSynchronized(Self);
end;

function TioContext_Custom.IsTrueClass: Boolean;
begin
  Result := Self.GetTable.IsTrueClass and ((not Assigned(Where)) or (not Where.GetDisableStrictlyTrueClass));
end;

function TioContext_Custom.Map: IioMap;
begin
  Result := FMap;
end;

{ TioContext_PSRequest }

constructor TioContext_PSRequest.Create_PSRequest(const APSRequest: IioPersistenceStrategyRequest; const AMap: IioMap);
begin
  inherited Create_Map(AMap);
  FPSRequest := APSRequest;
end;

function TioContext_PSRequest.GetAuthContext: String;
begin
  Result := FPSRequest.AuthContext;
end;

function TioContext_PSRequest.GetBlindLevel: Byte;
begin
  Result := FPSRequest.BlindLevel;
end;

function TioContext_PSRequest.GetConnectionNameResolved: String;
begin
  Result := GetTable.GetTableConnectionNameIfEmpty(FPSRequest.Connection);
end;

function TioContext_PSRequest.GetDataObject: TObject;
begin
  Result := FPSRequest.DTO;
end;

function TioContext_PSRequest.GetIntent: TioPersistenceIntentType;
begin
  Result := FPSRequest.Intent;
end;

function TioContext_PSRequest.GetMasterBSPersistence: TioBSPersistence;
begin
  Result := FPSRequest.MasterBSPersistence;
end;

function TioContext_PSRequest.GetMasterPropertyName: String;
begin
  result := FPSRequest.MasterPropName;
end;

function TioContext_PSRequest.GetMasterPropertyPath: String;
begin
  Result := FPSRequest.MasterPropPath + IfThen(FPSRequest.MasterPropName.IsEmpty, '', '.') + FPSRequest.MasterPropName;
end;

function TioContext_PSRequest.GetForceAuthDecision: Boolean;
begin
  Result := FPSRequest.ForceAuthDecision;
end;

function TioContext_PSRequest.GetPSRequest: IioPersistenceStrategyRequest;
begin
  Result := FPSRequest;
end;

function TioContext_PSRequest.GetRelationOID: Integer;
begin
  Result := FPSRequest.RelationOID;
end;

function TioContext_PSRequest.GetToken: String;
begin
  Result := FPSRequest.Token;
end;

function TioContext_PSRequest.GetTypeName: String;
begin
  if Assigned(FPSRequest.Where) then
    Result := FPSRequest.Where.TypeName
  else
    Result := DataObject.ClassName;
end;

function TioContext_PSRequest.GetWhere: IioWhere;
begin
  Result := FPSRequest.Where;
end;

function TioContext_PSRequest.IsAuthorized: Boolean;
begin
  Result := FPSRequest.AuthCache.IsAuthorized(Self);
end;

procedure TioContext_PSRequest.SetBlindLevel(const Value: Byte);
begin
  FPSRequest.BlindLevel := Value;
end;

procedure TioContext_PSRequest.SetDataObject(const AValue: TObject);
begin
  FPSRequest.DTO := AValue;
end;

procedure TioContext_PSRequest.SetIntent(const Value: TioPersistenceIntentType);
begin
  FPSRequest.Intent := Value;
end;

procedure TioContext_PSRequest.SetRelationOID(const Value: Integer);
begin
  FPSRequest.RelationOID := Value;
end;

procedure TioContext_PSRequest.SetWhere(const AWhere: IioWhere);
begin
  FPSRequest.Where := AWhere;
end;

{ TioContext_Simple }

constructor TioContext_Simple.Create_Simple(const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte; const AMap: IioMap; const AWhere: IioWhere;
  const ADataObject: TObject; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String);
begin
  inherited Create_Map(AMap);
  FIntent := AIntent;
  FBlindLevel := ABlindLevel;
  FWhere := AWhere;
  FDataObject := ADataObject;
  FMasterBSPersistence := AMasterBSPersistence;
  FMasterPropertyName := AMasterPropertyName;
  FMasterPropertyPath := AMasterPropertyPath + IfThen(AMasterPropertyName.IsEmpty, '', '.') + AMasterPropertyName;
end;

function TioContext_Simple.GetBlindLevel: Byte;
begin
  Result := FBlindLevel;
end;

function TioContext_Simple.GetConnectionNameResolved: String;
begin
  Result := GetTable.GetTableConnectionNameIfEmpty(TioApplication.SessionDataStore.GetCurrentConnectionName);
end;

function TioContext_Simple.GetDataObject: TObject;
begin
  Result := FDataObject;
end;

function TioContext_Simple.GetIntent: TioPersistenceIntentType;
begin
  Result := FIntent;
end;

function TioContext_Simple.GetMasterBSPersistence: TioBSPersistence;
begin
  Result := FMasterBSPersistence;
end;

function TioContext_Simple.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioContext_Simple.GetMasterPropertyPath: String;
begin
  Result := FMasterPropertyPath;
end;

function TioContext_Simple.GetPSRequest: IioPersistenceStrategyRequest;
begin
  raise EioGenericException.Create(ClassName, 'GetPSRequest', 'Persistence Strategy Request property does not work for this class');
end;

function TioContext_Simple.GetRelationOID: Integer;
begin
  Result := FRelationOID;
end;

function TioContext_Simple.GetWhere: IioWhere;
begin
  Result := FWhere;
end;

procedure TioContext_Simple.SetBlindLevel(const Value: Byte);
begin
  FBlindLevel := Value;
end;

procedure TioContext_Simple.SetDataObject(const Value: TObject);
begin
  FDataObject := Value;
end;

procedure TioContext_Simple.SetIntent(const Value: TioPersistenceIntentType);
begin
  FIntent := Value;
end;

procedure TioContext_Simple.SetRelationOID(const Value: Integer);
begin
  FRelationOID := Value;
end;

procedure TioContext_Simple.SetWhere(const AWhere: IioWhere);
begin
  FWhere := AWhere;
end;

end.
