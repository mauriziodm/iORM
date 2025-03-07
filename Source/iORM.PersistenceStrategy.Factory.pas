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
  iORM.SynchroStrategy.Custom, iORM.Auth.Interfaces, System.SysUtils;

type

  TioPersistenceStrategyFactory = class
  private
    class procedure _SetPSRequestConnectionsIfNotEmpty(const APSRequest: IioPersistenceStrategyRequest; const AConnectionName, AConnectionNameRemote: String); inline;
    class function _NewPSRequest(const AMethod: TioPersistenceStrategyMethod; const FillSessionRelatedProperties: Boolean): IioPersistenceStrategyRequest; inline;
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
    class function NewPSRequest_LoadCount(const AWhere: IioWhere): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadMax(const AWhere: IioWhere; const APropertyName: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadMin(const AWhere: IioWhere; const APropertyName: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
    class function NewPSRequest_LoadObjVersion(const AContext: IioContext): IioPersistenceStrategyRequest;
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
    // auth
    class function NewPSRequest_Auth_App(const AAppCredentials: IioAuthAppCredentials; const AConnectionName, AConnectionNameRemote: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_Auth_Access(const AAuthIntention: TioAuthIntention; const AScope, AccessToken, AConnectionName, AConnectionNameRemote: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_Auth_NewAccessToken(const AAuthGrant, APkceCodeVerifier, AConnectionName, AConnectionNameRemote: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_Auth_RefreshAccessToken(const ARefreshToken, AConnectionName, AConnectionNameRemote: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_Auth_User(const AUserCredentials: IioAuthUserCredentials; const AConnectionName, AConnectionNameRemote: String): IioPersistenceStrategyRequest;
    // transaction
    class function NewPSRequest_Transaction_Commit(const AConnectionName: String = String.Empty; const AConnectionNameRemote: String = String.Empty): IioPersistenceStrategyRequest;
    class function NewPSRequest_Transaction_In(const AConnectionName: String = String.Empty; const AConnectionNameRemote: String = String.Empty): IioPersistenceStrategyRequest;
    class function NewPSRequest_Transaction_Rollback(const AConnectionName: String = String.Empty; const AConnectionNameRemote: String = String.Empty): IioPersistenceStrategyRequest;
    class function NewPSRequest_Transaction_Start(const AConnectionName: String = String.Empty; const AConnectionNameRemote: String = String.Empty): IioPersistenceStrategyRequest;
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

class function TioPersistenceStrategyFactory._NewPSRequest(const AMethod: TioPersistenceStrategyMethod; const FillSessionRelatedProperties: Boolean): IioPersistenceStrategyRequest;
begin
  Result := TioPersistenceStrategyRequest.Create(AMethod, FillSessionRelatedProperties);
end;

class procedure TioPersistenceStrategyFactory._SetPSRequestConnectionsIfNotEmpty(const APSRequest: IioPersistenceStrategyRequest; const AConnectionName, AConnectionNameRemote: String);
begin
  if not TioApplication.SessionDataStore._IsEmptyConnectionName(AConnectionName) then
    APSRequest.Connection := AConnectionName;
  if not TioApplication.SessionDataStore._IsEmptyConnectionName(AConnectionNameRemote) then
    APSRequest.ConnectionRemote := AConnectionNameRemote;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Auth_Access(const AAuthIntention: TioAuthIntention; const AScope, AccessToken, AConnectionName,
  AConnectionNameRemote: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmAuthAccess, False);
  Result.AuthIntention := AAuthIntention;
  Result.AuthScope := AScope;
  Result.AuthToken := AccessToken;
  Result.Connection := AConnectionName;
  Result.ConnectionRemote := AConnectionNameRemote;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Auth_App(const AAppCredentials: IioAuthAppCredentials; const AConnectionName,
  AConnectionNameRemote: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmAuthApp, False);
  Result.Connection := AConnectionName;
  Result.ConnectionRemote := AConnectionNameRemote;
  Result.Intf1 := AAppCredentials;
  Result.Intf1_Serialize := True;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Auth_NewAccessToken(const AAuthGrant, APkceCodeVerifier, AConnectionName,
  AConnectionNameRemote: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmAuthNewAccessToken, False);
  Result.AuthGrant := AAuthGrant;
  Result.AuthToken := APkceCodeVerifier;
  Result.Connection := AConnectionName;
  Result.ConnectionRemote := AConnectionNameRemote;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Auth_RefreshAccessToken(const ARefreshToken, AConnectionName,
  AConnectionNameRemote: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmAuthRefreshAccessToken, False);
  Result.AuthToken := ARefreshToken;
  Result.Connection := AConnectionName;
  Result.ConnectionRemote := AConnectionNameRemote;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Auth_User(const AUserCredentials: IioAuthUserCredentials; const AConnectionName,
  AConnectionNameRemote: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmAuthUser, False);
  Result.Connection := AConnectionName;
  Result.ConnectionRemote := AConnectionNameRemote;
  Result.Intf1 := AUserCredentials;
  Result.Intf1_Serialize := True;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_ByJsonString(const AJsonString: String): IioPersistenceStrategyRequest;
begin
  Result := TioPersistenceStrategyRequest.CreateByJSONString(AJsonString);
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadCount(const AWhere: IioWhere): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmLoadCount, True);
  Result.Where := AWhere;
  Result.Where.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Delete(const AWhere: IioWhere): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmDelete, True);
  Result.Where := AWhere;
  Result.Where.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyFactory.NewPSRequest_DeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType;
  const ABlindLevel: Byte): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmDeleteList, True);
  Result.BlindLevel := ABlindLevel;
  Result.Intent := AIntent;
  Result.Obj1 := AList;
  Result.Obj1_Serialize := True;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_DeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType;
  const ABlindLevel: Byte): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmDeleteObject, True);
  Result.BlindLevel := ABlindLevel;
  Result.Intent := AIntent;
  Result.Obj1 := AObj;
  Result.Obj1_Serialize := True;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_DoSynchronization(const APayload: TioCustomSynchroStrategy_Payload): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmDoSynchronization, True);
  Result.Obj1 := APayload;
  Result.Obj1_Serialize := True;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmLoadDataSet, True);
  Result.Obj1 := ADestDataSet;
  Result.Obj1_Serialize := False;
  Result.Where := AWhere;
  Result.Where.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadList(const AWhere: IioWhere; const AList: TObject;
  const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmLoadList, True);
  Result.Intent := AIntent;
  Result.Obj1 := AList;
  Result.Obj1_Serialize := False;
  Result.Where := AWhere;
  Result.Where.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadObject(const AWhere: IioWhere; const AObj: TObject;
  const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmLoadObject, True);
  Result.Intent := AIntent;
  Result.Obj1 := AObj;
  Result.Obj1_Serialize := True;
  Result.Where := AWhere;
  Result.Where.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject;
  const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmLoadObjectByClassOnly, True);
  Result.Intent := AIntent;
  Result.Obj1 := AObj;
  Result.Obj1_Serialize := False;
  Result.Where := AWhere;
  Result.Where.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadObjVersion(const AContext: IioContext): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmLoadObjVersion, True);
  Result.Intf1 := AContext;
  Result.Intf1_Serialize := True;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadMax(const AWhere: IioWhere; const APropertyName: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmLoadMax, True);
  Result.Where := AWhere;
  Result.Where.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
  Result.PropName := APropertyName;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_LoadMin(const AWhere: IioWhere; const APropertyName: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmLoadMin, True);
  Result.Where := AWhere;
  Result.Where.FillETM_Sql; // Per risolvere problema con HttpCOnnection (vedi dichiaraione classe TioWHERE, campi ETMFor...)
  Result.PropName := APropertyName;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_PersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte;
  const ARelationPropertyName: String; const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName,
  AMasterPropertyPath: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmPersistList, True);
  Result.BlindLevel := ABlindLevel;
  Result.Intent := AIntent;
  Result.Obj1 := AList;
  Result.Obj1_Serialize := True;
  Result.MasterBSPersistence := AMasterBSPersistence;
  Result.RelationPropertyName := ARelationPropertyName;
  Result.RelationOID := ARelationOID;
  Result.MasterPropName := AMasterPropertyName;
  Result.MasterPropPath := AMasterPropertyPath;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_PersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte;
  const ARelationPropertyName: String; const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName,
  AMasterPropertyPath: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmPersistObject, True);
  Result.BlindLevel := ABlindLevel;
  Result.Intent := AIntent;
  Result.Obj1 := AObj;
  Result.Obj1_Serialize := True;
  // TODO: MasterBSPersistence è usato alla DBPersistenceStrategy ma non usato dalla HttpPersistenceStrategy, indagare a cosa serve e se si può eliminare
  Result.MasterBSPersistence := AMasterBSPersistence;
  Result.RelationPropertyName := ARelationPropertyName;
  Result.RelationOID := ARelationOID;
  Result.MasterPropName := AMasterPropertyName;
  Result.MasterPropPath := AMasterPropertyPath;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_SQLDest_Execute(const ASQLDestination: IioSQLDestination): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmSQLDestExecute, True);
  Result.Intf1 := ASQLDestination;
  Result.Intf1_Serialize := True;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination;
  const ADestDataSet: TFDDataSet): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(psmSQLDestLoadDataSet, True);
  Result.Intf1 := ASQLDestination;
  Result.Intf1_Serialize := True;
  Result.Obj1 := ADestDataSet;
  Result.Obj1_Serialize := False;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Transaction_Commit(const AConnectionName: String = String.Empty; const AConnectionNameRemote: String = String.Empty): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest_Transaction(psmTransactionCommit, AConnectionName, AConnectionNameRemote);
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Transaction_In(const AConnectionName: String = String.Empty; const AConnectionNameRemote: String = String.Empty): IioPersistenceStrategyRequest<Boolean>;
begin
  Result := _NewPSRequest_Result<Boolean>(psmTransactionIn, AConnectionName, AConnectionNameRemote);
  _SetPSRequestConnectionsIfNotEmpty(Result, AConnectionName, AConnectionNameRemote);
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Transaction_Rollback(const AConnectionName,
  AConnectionNameRemote: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest_Transaction(psmTransactionRollback, AConnectionName, AConnectionNameRemote);
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Transaction_Start(const AConnectionName,
  AConnectionNameRemote: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest_Transaction(psmTransactionStart, AConnectionName, AConnectionNameRemote);
end;

end.
