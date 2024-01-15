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
  iORM.LiveBindings.BSPersistence;

type

  TioContext = class(TInterfacedObject, IioContext)
  strict private
    FDataObject: TObject;
    FHasManyChildVirtualPropertyValue: Integer;
    FMap: IioMap;
    FWhere: IioWhere;
    FMasterPropertyPath: String;
    FMasterBSPersistence: TioBSPersistence;
    FOriginalNonTrueClassMap: IioMap;
    FEtmRevertedFromVersion: Integer;
    FPersistenceConflictDetected: Boolean;
    // DataObject
    function GetDataObject: TObject;
    procedure SetDataObject(const AValue: TObject);
    // MasterPropertyPath
    function GetMasterPropertyPath: String;
    // ObjStatus
    function GetObjStatus: TioObjStatus;
    procedure SetObjStatus(const AValue: TioObjStatus);
    // ObjVersion
    function NextObjVersion(const ASetValue: Boolean): TioObjVersion;
    function GetObjVersion: TioObjVersion;
    procedure SetObjVersion(const AValue: TioObjVersion);
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
    // EtmRevertedFromVersion
    function GetEtmRevertedFromVersion: Integer;
    procedure SetEtmRevertedFromVersion(const Value: Integer);
    // PersistenceConflictDetected
    function GetPersistenceConflictDetected: Boolean;
    procedure SetPersistenceConflictDetected(const Value: Boolean);
  public
    constructor Create(const AMap: IioMap; const AWhere: IioWhere; const ADataObject: TObject; const AMasterBSPersistence: TioBSPersistence;
      const AMasterPropertyName, AMasterPropertyPath: String); overload;
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
    procedure CheckDeleteConflict(const AContext: IioContext); inline;
    procedure CheckUpdateConflict(const AContext: IioContext); inline;
    procedure ResolveDeleteConflict(const AContext: IioContext); inline;
    procedure ResolveUpdateConflict(const AContext: IioContext); inline;
    // Map
    function Map: IioMap;
    // GroupBy
    function GetGroupBySql: String;
    // OrderBy
    function GetOrderBySql: String;
    // Properties
    property DataObject: TObject read GetDataObject write SetDataObject;
    property ObjStatus: TioObjStatus read GetObjStatus write SetObjStatus;
    property ObjVersion: TioObjVersion read GetObjVersion write SetObjVersion;
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
    property EtmRevertedFromVersion: Integer read GetEtmRevertedFromVersion write SetEtmRevertedFromVersion;
    property PersistenceConflictDetected: Boolean read GetPersistenceConflictDetected write SetPersistenceConflictDetected;
    /// Contiene il nome della classe originaria cioè, nel caso il contesto sia stato creato con
    ///  la TrueClassVirtual (select query) a partire da una resolved class name, contiene il nome
    ///  della classe originaria, quella dalla quale poi si è estratta la TrueClassVirtualMap stessa.
    property OriginalNonTrueClassMap: IioMap read GetOriginalNonTrueClassMap write SetOriginalNonTrueClassMap;
  end;

implementation

uses
  iORM.Context.Factory, iORM.DB.Factory, System.TypInfo,
  iORM.Context.Container, System.SysUtils, iORM.Exceptions,
  System.StrUtils, iORM.DB.Interfaces, iORM.ConflictStrategy.Interfaces;

{ TioContext }

function TioContext.GetTrueClass: IioTrueClass;
begin
  Result := Self.Map.GetTable.GetTrueClass;
end;

procedure TioContext.CheckDeleteConflict(const AContext: IioContext);
begin
  TioCustomConflictStrategy(GetTable.GetDeleteConflictStrategy).CheckDeleteConflict(AContext);
end;

procedure TioContext.CheckUpdateConflict(const AContext: IioContext);
begin
  TioCustomConflictStrategy(GetTable.GetUpdateConflictStrategy).CheckUpdateConflict(AContext);
end;

procedure TioContext.ResolveDeleteConflict(const AContext: IioContext);
begin
  TioCustomConflictStrategy(GetTable.GetDeleteConflictStrategy).ResolveDeleteConflict(AContext);
end;

procedure TioContext.ResolveUpdateConflict(const AContext: IioContext);
begin
  TioCustomConflictStrategy(GetTable.GetUpdateConflictStrategy).ResolveUpdateConflict(AContext);
end;

constructor TioContext.Create(const AMap: IioMap; const AWhere: IioWhere; const ADataObject: TObject; const AMasterBSPersistence: TioBSPersistence;
  const AMasterPropertyName, AMasterPropertyPath: String);
begin
  inherited Create;
  FMap := AMap;
  FDataObject := ADataObject;
  FWhere := AWhere;
  FHasManyChildVirtualPropertyValue := 0;
  FMasterPropertyPath := AMasterPropertyPath + IfThen(AMasterPropertyName.IsEmpty, '', '.') + AMasterPropertyName;
  FMasterBSPersistence := AMasterBSPersistence;
  FOriginalNonTrueClassMap := nil;
  FEtmRevertedFromVersion := 0;
  FPersistenceConflictDetected := False;
end;

function TioContext.GetClassRef: TioClassRef;
begin
  Result := Map.GetClassRef;
end;

function TioContext.GetDataObject: TObject;
begin
  Result := FDataObject;
end;

function TioContext.GetEtmRevertedFromVersion: Integer;
begin
  Result := FEtmRevertedFromVersion;
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

function TioContext.GetID: Integer;
begin
  if not Assigned(FDataObject) then
    raise EioException.Create(Self.ClassName + '.GetID: DataObject not assigned');
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
    Result := IO_CURRENTUSERINFO_ID_EMPTY;
end;

function TioContext.GetObjCreatedUserName: TioObjCreatedUserName;
begin
  if GetProperties.ObjCreatedUserNamePropertyExist then
    Result := GetProperties.ObjCreatedUserNameProperty.GetValue(FDataObject).AsType<TioObjCreatedUserName>
  else
    Result := IO_CURRENTUSERINFO_NAME_EMPTY;
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
    Result := IO_CURRENTUSERINFO_ID_EMPTY;
end;

function TioContext.GetObjUpdatedUserName: TioObjUpdatedUserName;
begin
  if GetProperties.ObjUpdatedUserNamePropertyExist then
    Result := GetProperties.ObjUpdatedUserNameProperty.GetValue(FDataObject).AsType<TioObjUpdatedUserName>
  else
    Result := IO_CURRENTUSERINFO_NAME_EMPTY;
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

function TioContext.GetPersistenceConflictDetected: Boolean;
begin
  Result := FPersistenceConflictDetected;
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

procedure TioContext.SetEtmRevertedFromVersion(const Value: Integer);
begin
  FEtmRevertedFromVersion := Value;
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
  if GetProperties.ObjVersionPropertyExist then
    GetProperties.ObjVersionProperty.SetValue(FDataObject, AValue)
  else
    raise EioException.Create(ClassName, 'SetObjVersion', Format('The class "%s" has no property of type "TioObjversion".', [Map.GetClassName]));
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

procedure TioContext.SetPersistenceConflictDetected(const Value: Boolean);
begin
  FPersistenceConflictDetected := Value;
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
  Result := (not Assigned(FDataObject)) or (GetID = IO_INTEGER_NULL_VALUE);
end;

function TioContext.NextObjVersion(const ASetValue: Boolean): TioObjVersion;
var
  LPropValue: TValue;
begin
  if GetProperties.ObjVersionPropertyExist then
  begin
    Result := GetProperties.ObjVersionProperty.GetValue(FDataObject).AsType<TioObjVersion> + 1;
    if ASetValue then
    begin
      LPropValue := TValue.From<TioObjVersion>(Result);
      GetProperties.ObjVersionProperty.SetValue(FDataObject, LPropValue);
    end;
  end
  else
    Result := OBJVERSION_NULL;
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
