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
  iORM.Where, iORM.Context.Table.Interfaces, System.Rtti,
  iORM.Context.Map.Interfaces, iORM.Where.Interfaces,
  iORM.LiveBindings.BSPersistence, iORM.ConflictStrategy.Interfaces,
  iORM.SynchroStrategy.Interfaces, iORM.Attributes;

type

  TioContext = class(TInterfacedObject, IioContext)
  private
    FDataObject: TObject;
    FHasManyChildVirtualPropertyValue: Integer;
    FMap: IioMap;
    FWhere: IioWhere;
    FMasterPropertyPath: String;
    FMasterBSPersistence: TioBSPersistence;
    FObjNextVersion: TioObjVersion;
    FOriginalNonTrueClassMap: IioMap;
    FEntityFromVersion: Integer;
    FActionType: TioPersistenceActionType;
    FIntentType: TioPersistenceIntentType;
    FBlindLevel: Byte;
    FConflictDetected: Boolean;
    FConflictState: TioPersistenceConflictState;
    FSynchroStrategy_Client_NoDirectCall: IioSynchroStrategy_Client;
    // DataObject
    function GetDataObject: TObject;
    procedure SetDataObject(const AValue: TObject);
    // MasterPropertyPath
    function GetMasterPropertyPath: String;
    // ObjID
    function GetObjID: Integer;
    procedure SetObjID(const AValue: Integer);
    // ObjStatus
    function GetObjStatus: TioObjStatus;
    procedure SetObjStatus(const AValue: TioObjStatus);
    // ObjVersion
    function GetObjVersion: TioObjVersion;
    procedure SetObjVersion(const AValue: TioObjVersion);
    // ObjNextVersion
    function GetObjNextVersion: Integer; // Con tipo TioObjVersion ci sono problemi
    // ObjCreated
    function GetObjCreated: TioObjCreated;
    procedure SetObjCreated(const AValue: TioObjCreated);
    // ObjCreatedUserID
    function GetObjCreatedUserID: TioObjCreatedUserID;
    procedure SetObjCreatedUserID(const AValue: TioObjCreatedUserID);
    // ObjCreatedUserName
    function GetObjCreatedUserName: TioObjCreatedUserName;
    procedure SetObjCreatedUserName(const AValue: TioObjCreatedUserName);
    // ObjUpdated
    function GetObjUpdated: TioObjUpdated;
    procedure SetObjUpdated(const AValue: TioObjUpdated);
    // ObjUpdatedUserID
    function GetObjUpdatedUserID: TioObjUpdatedUserID;
    procedure SetObjUpdatedUserID(const AValue: TioObjUpdatedUserID);
    // ObjUpdatedUserName
    function GetObjUpdatedUserName: TioObjUpdatedUserName;
    procedure SetObjUpdatedUserName(const AValue: TioObjUpdatedUserName);
    // RelationOID
    function GetRelationOID: Integer;
    procedure SetRelationOID(const Value: Integer);
    // Where
    function GetWhere: IioWhere;
    procedure SetWhere(const AWhere: IioWhere);
    // MasterBSPersistence
    function GetMasterBSPersistence: TioBSPersistence;
    // OriginalResolvedTypeNameNonTrueClass
    procedure SetOriginalNonTrueClassMap(const AMap: IioMap);
    function GetOriginalNonTrueClassMap: IioMap;
    // EtmEntityVersion
    function GetEntityFromVersion: Integer;
    procedure SetEntityFromVersion(const Value: Integer);
    // ActionType
    function GetActionType: TioPersistenceActionType;
    procedure SetActionType(const Value: TioPersistenceActionType);
    // IntentType
    function GetIntentType: TioPersistenceIntentType;
    procedure SetIntentType(const Value: TioPersistenceIntentType);
    // BlindLevel
    function GetBlindLevel: Byte;
    procedure SetBlindLevel(const Value: Byte);
    // ConflictDetected
    function GetConflictDetected: Boolean;
    procedure SetConflictDetected(const Value: Boolean);
    // ConflictState
    function GetConflictState: TioPersistenceConflictState;
    procedure SetConflictState(const Value: TioPersistenceConflictState);
  public
    constructor Create(const AIntent: TioPersistenceIntentType; const AMap: IioMap; const AWhere: IioWhere; const ADataObject: TObject; const AMasterBSPersistence: TioBSPersistence;
      const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte); overload;
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
    property DataObject: TObject read GetDataObject write SetDataObject;
    property ObjID: Integer read GetObjID write SetObjID;
    property ObjStatus: TioObjStatus read GetObjStatus write SetObjStatus;
    property ObjVersion: TioObjVersion read GetObjVersion write SetObjVersion;
    property ObjNextVersion: Integer read GetObjNextVersion; // Con tipo TioObjVersion ci sono problemi
    property ObjCreated: TioObjCreated read GetObjCreated write SetObjCreated;
    property ObjCreatedUserID: TioObjCreatedUserID read GetObjCreatedUserID write SetObjCreatedUserID;
    property ObjCreatedUserName: TioObjCreatedUserName read GetObjCreatedUserName write SetObjCreatedUserName;
    property ObjUpdated: TioObjUpdated read GetObjUpdated write SetObjUpdated;
    property ObjUpdatedUserID: TioObjUpdatedUserID read GetObjUpdatedUserID write SetObjUpdatedUserID;
    property ObjUpdatedUserName: TioObjUpdatedUserName read GetObjUpdatedUserName write SetObjUpdatedUserName;
    property Where: IioWhere read GetWhere write SetWhere;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    property MasterPropertyPath: String read GetMasterPropertyPath;
    property MasterBSPersistence: TioBSPersistence read GetMasterBSPersistence;
    property EntityFromVersion: Integer read GetEntityFromVersion write SetEntityFromVersion;
    property ActionType: TioPersistenceActionType read GetActionType write SetActionType;
    property IntentType: TioPersistenceIntentType read GetIntentType write SetIntentType;
    property BlindLevel: Byte read GetBlindLevel write SetBlindLevel;
    property ConflictDetected: Boolean read GetConflictDetected write SetConflictDetected;
    property ConflictState: TioPersistenceConflictState read GetConflictState write SetConflictState;
    /// Contiene il nome della classe originaria cioè, nel caso il contesto sia stato creato con
    ///  la TrueClassVirtual (select query) a partire da una resolved class name, contiene il nome
    ///  della classe originaria, quella dalla quale poi si è estratta la TrueClassVirtualMap stessa.
    property OriginalNonTrueClassMap: IioMap read GetOriginalNonTrueClassMap write SetOriginalNonTrueClassMap;
  end;

implementation

uses
  iORM.Context.Factory, iORM.DB.Factory, System.TypInfo,
  iORM.Context.Container, System.SysUtils, iORM.Exceptions,
  System.StrUtils, iORM.DB.Interfaces, iORM, iORM.DB.ConnectionContainer,
  iORM.Utilities;

{ TioContext }

function TioContext.GetTrueClass: IioTrueClass;
begin
  Result := Self.Map.GetTable.GetTrueClass;
end;

function TioContext.BlindLevel_Do_AutoUpdateProps: boolean;
begin
  Result := TioUtilities.BlindLevel_Do_AutoUpdateProps(FBlindLevel);
end;

function TioContext.BlindLevel_Do_DetectConflicts: boolean;
begin
  Result := TioUtilities.BlindLevel_Do_DetectConflicts(FBlindLevel);
end;

function TioContext.BlindLevel_Do_DetectObjExists: boolean;
begin
  Result := TioUtilities.BlindLevel_Do_DetectObjExists(FBlindLevel);
end;

procedure TioContext.BlindLevel_Reset_AutoUpdateProps;
begin
  if BlindLevel_Do_AutoUpdateProps then
    Dec(FBlindLevel, BL_BIT_AUTO_UPDATE_PROPS);
end;

procedure TioContext.BlindLevel_Reset_DetectConflicts;
begin
  if BlindLevel_Do_DetectConflicts then
    Dec(FBlindLevel, BL_BIT_DETECT_CONFLICTS);
end;

procedure TioContext.BlindLevel_Reset_DetectObjExists;
begin
  if BlindLevel_Do_DetectObjExists then
    Dec(FBlindLevel, BL_BIT_DETECT_OBJ_EXISTS);
end;

procedure TioContext.BlindLevel_Set_AutoUpdateProps;
begin
  if not BlindLevel_Do_AutoUpdateProps then
    Inc(FBlindLevel, BL_BIT_AUTO_UPDATE_PROPS);
end;

procedure TioContext.BlindLevel_Set_DetectConflicts;
begin
  if not BlindLevel_Do_DetectConflicts then
    Inc(FBlindLevel, BL_BIT_DETECT_CONFLICTS);
end;

procedure TioContext.BlindLevel_Set_DetectObjExists;
begin
  if not BlindLevel_Do_DetectObjExists then
    Inc(FBlindLevel, BL_BIT_DETECT_OBJ_EXISTS);
end;

procedure TioContext.CheckDeleteConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetDeleteConflictStrategy).CheckDeleteConflict(Self);
end;

procedure TioContext.CheckInsertConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetInsertConflictStrategy).CheckInsertConflict(Self);
end;

procedure TioContext.CheckUpdateConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetUpdateConflictStrategy).CheckUpdateConflict(Self);
end;

procedure TioContext.ResolveDeleteConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetDeleteConflictStrategy).ResolveDeleteConflict(Self);
end;

procedure TioContext.ResolveInsertConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetInsertConflictStrategy).ResolveInsertConflict(Self);
end;

procedure TioContext.ResolveUpdateConflict;
begin
  TioCustomConflictStrategyRef(GetTable.GetUpdateConflictStrategy).ResolveUpdateConflict(Self);
end;

constructor TioContext.Create(const AIntent: TioPersistenceIntentType; const AMap: IioMap; const AWhere: IioWhere; const ADataObject: TObject; const AMasterBSPersistence: TioBSPersistence;
      const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte);
begin
  inherited Create;
  FMap := AMap;
  FDataObject := ADataObject;
  FWhere := AWhere;
  FHasManyChildVirtualPropertyValue := 0;
  FMasterPropertyPath := AMasterPropertyPath + IfThen(AMasterPropertyName.IsEmpty, '', '.') + AMasterPropertyName;
  FMasterBSPersistence := AMasterBSPersistence;
  FObjNextVersion := OBJVERSION_NULL;
  FOriginalNonTrueClassMap := nil;
  FEntityFromVersion := 0;
  FIntentType := AIntent;
  FActionType := atDoNotPersist;
  FBlindLevel := ABlindLevel;
  FConflictDetected := False;
  FConflictState := csUndefined;
  FSynchroStrategy_Client_NoDirectCall := nil;
end;

function TioContext.GetClassRef: TioClassRef;
begin
  Result := Map.GetClassRef;
end;

function TioContext.GetDataObject: TObject;
begin
  Result := FDataObject;
end;

function TioContext.GetEntityFromVersion: Integer;
begin
  Result := FEntityFromVersion;
end;

function TioContext.GetGroupBySql: String;
begin
  Result := '';
  // Ritorna il GroupBy fisso (attribute nella dichiarazione della classe)
  if Assigned(Self.GetTable.GetGroupBy) then
    Result := Self.GetTable.GetGroupBy.GetSql;
  // Aggiungere qui l'eventuale futuro codice per aggiungere/sostituire
  // l'eventuale GroupBy specificato nel ioWhere e che quindi è nel
  // context e che sostituisce il GroupBy fisso
end;

function TioContext.GetRelationOID: Integer;
begin
  Result := FHasManyChildVirtualPropertyValue;
end;

function TioContext.GetCurrentStrategyName: String;
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

function TioContext.GetObjID: Integer;
begin
  if not Assigned(FDataObject) then
    raise EioGenericException.Create(Self.ClassName + '.GetID: DataObject not assigned');
  Result := GetProperties.GetIdProperty.GetValue(FDataObject).AsInteger;
end;

function TioContext.GetMasterBSPersistence: TioBSPersistence;
begin
  Result := FMasterBSPersistence;
end;

function TioContext.GetMasterPropertyPath: String;
begin
  Result := FMasterPropertyPath;
end;

function TioContext.GetObjCreated: TioObjCreated;
begin
  if GetProperties.ObjCreatedPropertyExist then
    Result := GetProperties.ObjCreatedProperty.GetValue(FDataObject).AsType<TioObjCreated>
  else
    Result := TRANSACTION_TIMESTAMP_NULL;
end;

function TioContext.GetObjCreatedUserID: TioObjCreatedUserID;
begin
  if GetProperties.ObjCreatedUserIDPropertyExist then
    Result := GetProperties.ObjCreatedUserIDProperty.GetValue(FDataObject).AsType<TioObjCreatedUserID>
  else
    Result := IO_INTEGER_NULL_VALUE;
end;

function TioContext.GetObjCreatedUserName: TioObjCreatedUserName;
begin
  if GetProperties.ObjCreatedUserNamePropertyExist then
    Result := GetProperties.ObjCreatedUserNameProperty.GetValue(FDataObject).AsType<TioObjCreatedUserName>
  else
    Result := IO_STRING_NULL_VALUE;
end;

function TioContext.GetObjStatus: TioObjStatus;
begin
  if GetProperties.ObjStatusPropertyExist then
    Result := TioObjStatus(GetProperties.ObjStatusProperty.GetValue(FDataObject).AsOrdinal)
  else
    Result := osDirty;
end;

function TioContext.GetObjUpdated: TioObjUpdated;
begin
  if GetProperties.ObjUpdatedPropertyExist then
    Result := GetProperties.ObjUpdatedProperty.GetValue(FDataObject).AsType<TioObjUpdated>
  else
    Result := TRANSACTION_TIMESTAMP_NULL;
end;

function TioContext.GetObjUpdatedUserID: TioObjUpdatedUserID;
begin
  if GetProperties.ObjUpdatedUserIDPropertyExist then
    Result := GetProperties.ObjUpdatedUserIDProperty.GetValue(FDataObject).AsType<TioObjUpdatedUserID>
  else
    Result := IO_INTEGER_NULL_VALUE;
end;

function TioContext.GetObjUpdatedUserName: TioObjUpdatedUserName;
begin
  if GetProperties.ObjUpdatedUserNamePropertyExist then
    Result := GetProperties.ObjUpdatedUserNameProperty.GetValue(FDataObject).AsType<TioObjUpdatedUserName>
  else
    Result := IO_STRING_NULL_VALUE;
end;

function TioContext.GetOrderBySql: String;
begin
  Result := FWhere.GetOrderBySql(FMap);
end;

function TioContext.GetOriginalNonTrueClassMap: IioMap;
begin
  if Assigned(FOriginalNonTrueClassMap) then
    Result := FOriginalNonTrueClassMap
  else
    Result := FMap;
end;

function TioContext.GetActionType: TioPersistenceActionType;
begin
  Result := FActionType;
end;

function TioContext.GetBlindLevel: Byte;
begin
  Result := FBlindLevel;
end;

function TioContext.GetConflictDetected: Boolean;
begin
  Result := FConflictDetected;
end;

function TioContext.GetConflictState: TioPersistenceConflictState;
begin
  Result := FConflictState;
end;

function TioContext.GetIntentType: TioPersistenceIntentType;
begin
  Result := FIntentType;
end;

function TioContext.GetProperties: IioProperties;
begin
  Result := Self.Map.GetProperties;
end;

function TioContext.RttiContext: TRttiContext;
begin
  Result := Self.Map.RttiContext;
end;

function TioContext.RttiType: TRttiInstanceType;
begin
  Result := Self.Map.RttiType;
end;

procedure TioContext.SetDataObject(const AValue: TObject);
begin
  FDataObject := AValue;
end;

procedure TioContext.SetEntityFromVersion(const Value: Integer);
begin
  FEntityFromVersion := Value;
end;

procedure TioContext.SetRelationOID(const Value: Integer);
begin
  FHasManyChildVirtualPropertyValue := Value;
end;

procedure TioContext.SetObjCreated(const AValue: TioObjCreated);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjCreatedPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjCreated>(AValue);
  GetProperties.ObjCreatedProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjCreatedUserID(const AValue: TioObjCreatedUserID);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjCreatedUserIDPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjCreatedUserID>(AValue);
  GetProperties.ObjCreatedUserIDProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjCreatedUserName(const AValue: TioObjCreatedUserName);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjCreatedUserNamePropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjCreatedUserName>(AValue);
  GetProperties.ObjCreatedUserNameProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjID(const AValue: Integer);
var
  LPropValue: TValue;
begin
  LPropValue := TValue.From<Integer>(AValue);
  GetProperties.GetIdProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjStatus(const AValue: TioObjStatus);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjStatusPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjStatus>(AValue);
  GetProperties.ObjStatusProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjUpdated(const AValue: TioObjUpdated);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjUpdatedPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjUpdated>(AValue);
  GetProperties.ObjUpdatedProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjUpdatedUserID(const AValue: TioObjUpdatedUserID);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjUpdatedUserIDPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjUpdatedUserID>(AValue);
  GetProperties.ObjUpdatedUserIDProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjUpdatedUserName(const AValue: TioObjUpdatedUserName);
var
  LPropValue: TValue;
begin
  if not GetProperties.ObjUpdatedUserNamePropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjUpdatedUserName>(AValue);
  GetProperties.ObjUpdatedUserNameProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjVersion(const AValue: TioObjVersion);
begin
  // note: if the ObjVersion property does not exist it should not raise any exceptions.
  if GetProperties.ObjVersionPropertyExist then
    GetProperties.ObjVersionProperty.SetValue(FDataObject, AValue);
end;

function TioContext.GetObjVersion: TioObjVersion;
begin
  if GetProperties.ObjVersionPropertyExist then
    Result := GetProperties.ObjVersionProperty.GetValue(FDataObject).AsType<TioObjVersion>
  else
    Result := OBJVERSION_NULL;
end;

procedure TioContext.SetOriginalNonTrueClassMap(const AMap: IioMap);
begin
  FOriginalNonTrueClassMap := AMap;
end;

procedure TioContext.SetActionType(const Value: TioPersistenceActionType);
begin
  FActionType := Value;
end;

procedure TioContext.SetBlindLevel(const Value: Byte);
begin
  FBlindLevel := Value;
end;

procedure TioContext.SetConflictDetected(const Value: Boolean);
begin
  FConflictDetected := Value;
end;

procedure TioContext.SetConflictState(const Value: TioPersistenceConflictState);
begin
  FConflictState := Value;
end;

procedure TioContext.SetIntentType(const Value: TioPersistenceIntentType);
begin
  FIntentType := Value;
end;

procedure TioContext.SetWhere(const AWhere: IioWhere);
begin
  FWhere := AWhere;
end;

function TioContext.WhereExist: Boolean;
begin
  Result := Assigned(FWhere);
end;

function TioContext.GetTable: IioTable;
begin
  Result := Self.Map.GetTable;
end;

function TioContext.GetWhere: IioWhere;
begin
  Result := FWhere;
end;

function TioContext.IDIsNull: Boolean;
begin
  Result := (not Assigned(FDataObject)) or (GetObjID = IO_INTEGER_NULL_VALUE);
end;

function TioContext.GetObjNextVersion: Integer;
begin
  // If the ObjVersion property does not exists then return the OBJVERSION_NULL (zero)
  if not GetProperties.ObjVersionPropertyExist then
    Exit(OBJVERSION_NULL);
  // If the ObjVersion is not already loaded then load it (once)
  if FObjNextVersion = OBJVERSION_NULL then
    FObjNextVersion := io.LoadObjVersion(Self) + 1;
  // Return the value
  Result := FObjNextVersion;
end;

procedure TioContext.SynchroStrategy_GenerateLocalID;
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

function TioContext.SynchroStrategy_GetTimeSlotSynchroState: TioEtmTimeSlotSynchroState;
begin
  // Determines the TimeSlotSynchroState based on the intent and whether or not it is a class to synchronize
  case FIntentType of
    itRegular, itRevert:
      if SynchroStrategy_IsToBeSynchronized then
        Result := tsToBeSynchronized
      else
        Result := tsRegular;
    itSynchro_PersistToServer:
      if SynchroStrategy_IsToBeSynchronized then
        Result := tsToBeSynchronized
      else
        Result := tsSynchronized_ReceivedFromClient;
    itSynchro_PersistToClient:
      Result := tsSynchronized_ReceivedFromServer;
  else
    Result := tsRegular;
  end;
end;

function TioContext.SynchroStrategy_CanPersistEtmTimeSlot: Boolean;
var
  LSynchroStrategy_Client: IioSynchroStrategy_Client;
begin
  // Get the SynchroStrategy if exists
  LSynchroStrategy_Client := SynchroStrategy_Client;
  // If there is a SinchroStrategy, it determines whether the TimeSlot should be created
  //  and persisted based on the intent of the operation and the properties of th
  //  SynchroStrategy itself.
  Result := True;
  if Assigned(LSynchroStrategy_Client) then
  begin
    case FIntentType of
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

function TioContext.SynchroStrategy_Client: IioSynchroStrategy_Client;
begin
  if not Assigned(FSynchroStrategy_Client_NoDirectCall) then
    FSynchroStrategy_Client_NoDirectCall := TioConnectionManager.GetSynchroStrategy_Client(GetTable.GetConnectionDefName);
  Result := FSynchroStrategy_Client_NoDirectCall;
end;

function TioContext.SynchroStrategy_IsToBeSynchronized: Boolean;
var
  LSynchroStrategy_Client: IioSynchroStrategy_Client;
begin
  // If a SynchroStrategy is assigned and active (local remote and not connected device) and the object ID
  //  is not assigned then it asks the SynchroStrategy for a temporary local ID.
  // Note: Obviously if a new ID is assigned by SynchroStrategy this will disable the normal ID generation (if generated ID is not NULL)
  LSynchroStrategy_Client := SynchroStrategy_Client;
  Result := (LSynchroStrategy_Client <> nil) and LSynchroStrategy_Client.IsToBeSynchronized(Self);
end;

function TioContext.IsTrueClass: Boolean;
begin
  Result := Self.GetTable.IsTrueClass and ((not Assigned(FWhere)) or (not FWhere.GetDisableStrictlyTrueClass));
end;

function TioContext.Map: IioMap;
begin
  Result := FMap;
end;

end.
