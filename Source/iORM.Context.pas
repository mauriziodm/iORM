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
    // DataObject
    function GetDataObject: TObject;
    procedure SetDataObject(const AValue: TObject);
    // MasterPropertyPath
    function GetMasterPropertyPath: String;
    // ObjStatus
    function GetObjStatus: TioObjStatus;
    procedure SetObjStatus(const AValue: TioObjStatus);
    function ObjStatusPropertyExist: Boolean;
    // ObjVersion
    procedure IncrementObjVersion;
    function ObjVersionPropertyExist: Boolean;
    function IsObjVersionProperty(const AProp: IioProperty): Boolean;
    function GetObjVersion: TioObjVersion;
//    procedure SetObjVersion(const AValue: TioObjVersion); // Codice commentato anche nella parte implementation
    // ObjCreated
    function GetObjCreated: TioObjCreated;
    procedure SetObjCreated(const AValue: TioObjCreated);
    function ObjCreatedPropertyExist: Boolean;
    function IsObjCreatedProperty(const AProp: IioProperty): Boolean;
    // ObjUpdated
    function GetObjUpdated: TioObjUpdated;
    procedure SetObjUpdated(const AValue: TioObjUpdated);
    function ObjUpdatedPropertyExist: Boolean;
    function IsObjUpdatedProperty(const AProp: IioProperty): Boolean;
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
  public
    constructor Create(const AMap: IioMap; const AWhere: IioWhere; const ADataObject: TObject; const AMasterBSPersistence: TioBSPersistence;
      const AMasterPropertyName, AMasterPropertyPath: String); overload;
    function GetClassRef: TioClassRef;
    function GetTable: IioTable;
    function GetProperties: IioProperties;
    function GetTrueClass: IioTrueClass;
    function IsTrueClass: Boolean;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    function WhereExist: Boolean;
    function GetID: Integer;
    function IDIsNull: Boolean;
    // Map
    function Map: IioMap;
    // Blob field present
    function BlobFieldExists: Boolean;
    // GroupBy
    function GetGroupBySql: String;
    // OrderBy
    function GetOrderBySql: String;
    // Join
    function GetJoin: IioJoins;
    // Properties
    property DataObject: TObject read GetDataObject write SetDataObject;
    property ObjStatus: TioObjStatus read GetObjStatus write SetObjStatus;
    property ObjVersion: TioObjVersion read GetObjVersion; // write SetObjVersion;  // Codice commentato anche nella parte interface e implementation
    property ObjCreated: TioObjCreated read GetObjCreated write SetObjCreated;
    property ObjUpdated: TioObjUpdated read GetObjUpdated write SetObjUpdated;
    property Where: IioWhere read GetWhere write SetWhere;
    property RelationOID: Integer read GetRelationOID write SetRelationOID;
    property MasterPropertyPath: String read GetMasterPropertyPath;
    property MasterBSPersistence: TioBSPersistence read GetMasterBSPersistence;
    /// Contiene il nome della classe originaria cioè, nel caso il contesto sia stato creato con
    ///  la TrueClassVirtual (select query) a partire da una resolved class name, contiene il nome
    ///  della classe originaria, quella dalla quale poi si è estratta la TrueClassVirtualMap stessa.
    property OriginalNonTrueClassMap: IioMap read GetOriginalNonTrueClassMap write SetOriginalNonTrueClassMap;
  end;

implementation

uses
  iORM.Context.Factory, iORM.DB.Factory, System.TypInfo,
  iORM.Context.Container, System.SysUtils, iORM.Exceptions,
  System.StrUtils, iORM.DB.Interfaces;

{ TioContext }

function TioContext.BlobFieldExists: Boolean;
begin
  Result := Self.GetProperties.BlobFieldExists;
end;

function TioContext.GetTrueClass: IioTrueClass;
begin
  Result := Self.Map.GetTable.GetTrueClass;
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
end;

function TioContext.GetClassRef: TioClassRef;
begin
  Result := Self.Map.GetClassRef;
end;

function TioContext.GetDataObject: TObject;
begin
  Result := FDataObject;
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

function TioContext.GetJoin: IioJoins;
begin
  Result := Self.GetTable.GetJoin;
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
  if ObjCreatedPropertyExist then
    Result := GetProperties.ObjCreatedProperty.GetValue(FDataObject).AsType<TioObjCreated>
  else
    Result := TRANSACTION_TIMESTAMP_NULL;
end;

function TioContext.GetObjStatus: TioObjStatus;
begin
  if ObjStatusPropertyExist then
    Result := TioObjStatus(GetProperties.ObjStatusProperty.GetValue(FDataObject).AsOrdinal)
  else
    Result := osDirty;
end;

function TioContext.GetObjUpdated: TioObjUpdated;
begin
  if ObjUpdatedPropertyExist then
    Result := GetProperties.ObjUpdatedProperty.GetValue(FDataObject).AsType<TioObjUpdated>
  else
    Result := TRANSACTION_TIMESTAMP_NULL;
end;

function TioContext.GetObjVersion: TioObjVersion;
begin
  if ObjVersionPropertyExist then
    Result := GetProperties.ObjVersionProperty.GetValue(FDataObject).AsType<TioObjVersion>
  else
    Result := OBJVERSION_NULL;
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

procedure TioContext.SetRelationOID(const Value: Integer);
begin
  FHasManyChildVirtualPropertyValue := Value;
end;

procedure TioContext.SetObjCreated(const AValue: TioObjCreated);
var
  LPropValue: TValue;
begin
  if not ObjCreatedPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjCreated>(AValue);
  GetProperties.ObjCreatedProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjStatus(const AValue: TioObjStatus);
var
  LPropValue: TValue;
begin
  if not ObjStatusPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjStatus>(AValue);
  GetProperties.ObjStatusProperty.SetValue(FDataObject, LPropValue);
end;

procedure TioContext.SetObjUpdated(const AValue: TioObjUpdated);
var
  LPropValue: TValue;
begin
  if not ObjUpdatedPropertyExist then
    Exit;
  LPropValue := TValue.From<TioObjUpdated>(AValue);
  GetProperties.ObjUpdatedProperty.SetValue(FDataObject, LPropValue);
end;

//procedure TioContext.SetObjVersion(const AValue: TioObjVersion);
//var
//  LPropValue: TValue;
//begin
//  if not ObjVersionPropertyExist then
//    Exit;
//  LPropValue := TValue.From<TioObjVersion>(AValue);
//  GetProperties.ObjVersionProperty.SetValue(FDataObject, LPropValue);
//end;

procedure TioContext.SetOriginalNonTrueClassMap(const AMap: IioMap);
begin
  FOriginalNonTrueClassMap := AMap;
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

procedure TioContext.IncrementObjVersion;
var
  LPropValue: TValue;
  LValue: Integer;
begin
  if not ObjVersionPropertyExist then
    Exit;
  LValue := GetProperties.ObjVersionProperty.GetValue(FDataObject).AsType<TioObjVersion>;
  LPropValue := TValue.From<TioObjVersion>(LValue + 1);
  GetProperties.ObjVersionProperty.SetValue(FDataObject, LPropValue);
end;

function TioContext.IsObjCreatedProperty(const AProp: IioProperty): Boolean;
begin
  Result := GetProperties.IsObjCreatedProperty(AProp);
end;

function TioContext.IsObjUpdatedProperty(const AProp: IioProperty): Boolean;
begin
  Result := GetProperties.IsObjUpdatedProperty(AProp);
end;

function TioContext.IsObjVersionProperty(const AProp: IioProperty): Boolean;
begin
  Result := GetProperties.IsObjVersionProperty(AProp);
end;

function TioContext.IsTrueClass: Boolean;
begin
  Result := Self.GetTable.IsTrueClass and ((not Assigned(FWhere)) or (not FWhere.GetDisableStrictlyTrueClass));
end;

function TioContext.Map: IioMap;
begin
  Result := FMap;
end;

function TioContext.ObjCreatedPropertyExist: Boolean;
begin
  Result := GetProperties.ObjCreatedPropertyExist;
end;

function TioContext.ObjStatusPropertyExist: Boolean;
begin
  Result := GetProperties.ObjStatusPropertyExist;
end;

function TioContext.ObjUpdatedPropertyExist: Boolean;
begin
  Result := GetProperties.ObjUpdatedPropertyExist;
end;

function TioContext.ObjVersionPropertyExist: Boolean;
begin
  Result := GetProperties.ObjVersionPropertyExist;
end;

end.
