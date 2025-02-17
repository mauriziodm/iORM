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
unit iORM.PersistenceStrategy.Factory;

interface

uses
  iORM.PersistenceStrategy.Interfaces, iORM.DB.Interfaces,
  iORM.Where.Interfaces, iORM.CommonTypes, FireDAC.Comp.DataSet,
  iORM.Context.Interfaces, iORM.LiveBindings.BSPersistence,
  iORM.SynchroStrategy.Custom;

type

  TioPersistenceStrategyFactory = class
  private
    class function _NewPSRequest(const FillSessionRelatedProperties: Boolean): IioPersistenceStrategyRequest; inline;
  public
    class function GetStrategy(const AConnectionName: String): TioPersistenceStrategyRef;
    class function ConnectionTypeToStrategy(const AConnectionType: TioConnectionType): TioPersistenceStrategyRef;
    // ---------- operation type specific persistence strategy request factories ----------
    class function NewPSRequest_ByJsonString(const AJsonString: String): IioPersistenceStrategyRequest;
    // delete
    class function NewPSRequest_Delete(const AWhere: IioWhere): IioPersistenceStrategyRequest;
    class function NewPSRequest_DeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte): IioPersistenceStrategyRequest;
    class function NewPSRequest_DeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte): IioPersistenceStrategyRequest;
    // load
    class function NewPSRequest_Count(const AWhere: IioWhere): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadObjVersion(const AContext: IioContext): IioPersistenceStrategyRequest;
    class function NewPSRequest_Max(const AWhere: IioWhere; const APropertyName: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_Min(const AWhere: IioWhere; const APropertyName: String): IioPersistenceStrategyRequest;
    // persist
    class function NewPSRequest_PersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte;
      const ARelationPropertyName: String; const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName,
      AMasterPropertyPath: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_PersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte;
      const ARelationPropertyName: String; const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName,
      AMasterPropertyPath: String): IioPersistenceStrategyRequest;
    // sql destinations
    class function NewPSRequest_SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet): IioPersistenceStrategyRequest;
    class function NewPSRequest_SQLDest_Execute(const ASQLDestination: IioSQLDestination): IioPersistenceStrategyRequest;
    // synchro strategy
    class function NewPSRequest_DoSynchronization(const APayload: TioCustomSynchroStrategy_Payload): IioPersistenceStrategyRequest;
    // ---------- operation type specific persistence strategy request factories ----------





  end;
implementation

uses
  iORM.PersistenceStrategy.DB, iORM.PersistenceStrategy.Http, iORM.DB.ConnectionContainer,
  iORM.PersistenceStrategy.Request;

{ TioStrategyFactory }

class function TioPersistenceStrategyFactory.ConnectionTypeToStrategy(const AConnectionType: TioConnectionType): TioPersistenceStrategyRef;
begin
  case AConnectionType of
    TioConnectionType.ctHTTP:
      Result := TioPersistenceStrategyHttp;
  else
    Result := TioPersistenceStrategyDB;
  end;
end;

class function TioPersistenceStrategyFactory.GetStrategy(const AConnectionName: String): TioPersistenceStrategyRef;
begin
  Result := TioConnectionManager.GetConnectionInfo(AConnectionName).PersistenceStrategy;
end;

class function TioPersistenceStrategyFactory._NewPSRequest(const FillSessionRelatedProperties: Boolean): IioPersistenceStrategyRequest;
begin
  Result := TioPersistenceStrategyRequest.Create(FillSessionRelatedProperties);
end;

class function TioPersistenceStrategyFactory.NewPSRequest_ByJsonString(const AJsonString: String): IioPersistenceStrategyRequest;
begin
  Result := TioPersistenceStrategyRequest.CreateByJSONString(AJsonString);
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Count(const AWhere: IioWhere): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intf1 := AWhere;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Delete(const AWhere: IioWhere): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intf1 := AWhere;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_DeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType;
  const ABlindLevel: Byte): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.BlindLevel := ABlindLevel;
  Result.Intent := AIntent;
  Result.Obj1 := AList;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_DeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType;
  const ABlindLevel: Byte): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.BlindLevel := ABlindLevel;
  Result.Intent := AIntent;
  Result.Obj1 := AList;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_DoSynchronization(const APayload: TioCustomSynchroStrategy_Payload): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Obj1 := APayload;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intf1 := AWhere;
  Result.Obj1 := ADestDataSet;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadList(const AWhere: IioWhere; const AList: TObject;
  const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intent := AIntent;
  Result.Intf1 := AWhere;
  Result.Obj1 := AList;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadObject(const AWhere: IioWhere; const AObj: TObject;
  const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intent := AIntent;
  Result.Intf1 := AWhere;
  Result.Obj1 := AObj;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject;
  const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intent := AIntent;
  Result.Intf1 := AWhere;
  Result.Obj1 := AObj;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadObjVersion(const AContext: IioContext): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intf1 := AContext;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Max(const AWhere: IioWhere; const APropertyName: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intf1 := AWhere;
  Result.PropName := APropertyName;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Min(const AWhere: IioWhere; const APropertyName: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intf1 := AWhere;
  Result.PropName := APropertyName;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_PersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte;
  const ARelationPropertyName: String; const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName,
  AMasterPropertyPath: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.BlindLevel := ABlindLevel;
  Result.Intent := AIntent;
  Result.Obj1 := AList;
  Result.Obj2 := AMasterBSPersistence;
  Result.RelationPropertyName := ARelationPropertyName;
  Result.RelationOID := ARelationOID;
  Result.MasterPropName := AMasterPropertyName;
  Result.MasterPropPath := AMasterPropertyPath;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_PersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte;
  const ARelationPropertyName: String; const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName,
  AMasterPropertyPath: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.BlindLevel := ABlindLevel;
  Result.Intent := AIntent;
  Result.Obj1 := AObj;
  Result.Obj2 := AMasterBSPersistence;
  Result.RelationPropertyName := ARelationPropertyName;
  Result.RelationOID := ARelationOID;
  Result.MasterPropName := AMasterPropertyName;
  Result.MasterPropPath := AMasterPropertyPath;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_SQLDest_Execute(const ASQLDestination: IioSQLDestination): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intf1 := ASQLDestination;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination;
  const ADestDataSet: TFDDataSet): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intf1 := ASQLDestination;
  Result.Obj1 := ADestDataSet;
end;

end.
