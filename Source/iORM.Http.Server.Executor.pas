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
unit iORM.Http.Server.Executor;

interface

uses
  iORM.DB.Interfaces, System.DateUtils, iORM.PersistenceStrategy.Interfaces;

type

  TioHttpServerExecutor = class
  private
    // generic execution methods
    class procedure _Execute(const APSRequest: IioPersistenceStrategyRequest); static; inline;
    class procedure _Execute_DataSetResult(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _Execute_IntegerResult(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    // specific execution methods
    class procedure _Auth_Access(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _Auth_App(const  APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _Auth_NewAccessToken(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _Auth_RefreshAccessToken(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _Auth_User(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _DoSynchronization(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _LoadList(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _LoadObject(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _PersistList(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
    class procedure _PersistObject(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody); static; inline;
  public
    class function Execute(const ARequestBodyAsString: String): String; static;
    class function Test: String; static;
  end;

implementation

uses
  iORM, DJSON, iORM.Http.Factory, iORM.Http.Interfaces, iORM.Exceptions,
  System.SysUtils, System.JSON, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  System.Generics.Collections, iORM.Utilities, iORM.SynchroStrategy.Custom,
  iORM.Auth.Components.AuthServer, iORM.Auth.Interfaces,
  iORM.PersistenceStrategy.Factory;

{ TioHttpServerExecutor }

class function TioHttpServerExecutor.Execute(const ARequestBodyAsString: String): String;
var
  LPSRequest: IioPersistenceStrategyRequest;
  LioResponseBody: IioHttpResponseBody;
begin
  try
    // Create the request body and switch the "Connection" property with the "ConnectionRemote" one
    LPSRequest := TioPersistenceStrategyFactory.NewPSRequest_ByJsonString(ARequestBodyAsString);
    LPSRequest.SwitchToConnectionRemote;
    // Create the response body
    LioResponseBody := TioHttpFactory.NewResponseBody;
    // Dispatch to the right method/action
    case LPSRequest.Method of
      psmAuthAccess:
        _Auth_Access(LPSRequest, LioResponseBody);
      psmAuthApp:
        _Auth_App(LPSRequest, LioResponseBody);
      psmAuthNewAccessToken:
        _Auth_NewAccessToken(LPSRequest, LioResponseBody);
      psmAuthRefreshAccessToken:
        _Auth_RefreshAccessToken(LPSRequest, LioResponseBody);
      psmAuthUser:
        _Auth_User(LPSRequest, LioResponseBody);
      psmDelete:
        _Execute(LPSRequest);
      psmDeleteList:
        _Execute(LPSRequest);
      psmDeleteObject:
        _Execute(LPSRequest);
      psmDoSynchronization:
        _DoSynchronization(LPSRequest, LioResponseBody);
      psmLoadCount:
        _Execute_IntegerResult(LPSRequest, LioResponseBody);
      psmLoadDataSet:
        _Execute_DataSetResult(LPSRequest, LioResponseBody);
      psmLoadList:
        _LoadList(LPSRequest, LioResponseBody);
      psmLoadMax:
        _Execute_IntegerResult(LPSRequest, LioResponseBody);
      psmLoadMin:
        _Execute_IntegerResult(LPSRequest, LioResponseBody);
      psmLoadObject:
        _PersistObject(LPSRequest, LioResponseBody);
      psmPersistList:
        _PersistList(LPSRequest, LioResponseBody);
      psmPersistObject:
        _PersistObject(LPSRequest, LioResponseBody);
      psmSQLDestExecute:
        _Execute(LPSRequest);
      psmSQLDestLoadDataSet:
        _Execute_DataSetResult(LPSRequest, LioResponseBody);
    else
      EioSynchroStrategyException.Create(ClassName, 'Execute', 'Requested persistence strategy method is not handled');
    end;
    // Return the response
    Result := LioResponseBody.AsString;
  except
    on E: Exception do
    begin
      LioResponseBody.ExceptionClassName := E.ClassName;
      LioResponseBody.ExceptionMessage := E.Message;
      // Return the response
      Result := LioResponseBody.AsString;
    end;
  end;
end;

class function TioHttpServerExecutor.Test: String;
begin
  Result := Format('Hi, I''m iORM, I''m proud to tell you that my http server executor is successfully connected now %s.', [Now.ToString]);
end;

class procedure TioHttpServerExecutor._Auth_Access(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
//  AioResponseBody.AuthResult1 := TioAuthServer.GetInstance.AuthorizeAccess(AioRequestBody.AuthScope, AioRequestBody.AuthIntention, AioRequestBody.AuthToken).AsString;
end;

class procedure TioHttpServerExecutor._Auth_App(const  APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
  // Da fare
end;

class procedure TioHttpServerExecutor._Auth_User(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
var
  LUserCredentials: IioAuthUserCredentials;
begin
  if Supports(APSRequest.Intf1, IioAuthUserCredentials, LUserCredentials) then
    AioResponseBody.AuthResult1 := TioAuthServer.GetInstance.AuthorizeUser(LUserCredentials).AsString
  else
    raise EioHttpLocalException.Create(ClassName, '_AuthorizeUser', 'JSONDataValue object does not implement then "IioAuthUserCredentials" interface');
end;

class procedure TioHttpServerExecutor._DoSynchronization(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
var
  LPayload: TioCustomSynchroStrategy_Payload;
begin
  // Get the server-side local copy of the payload from the client request
  LPayload := APSRequest.Obj1 as TioCustomSynchroStrategy_Payload;
  try
    // Server-side operations
    LPayload.PersistAndReloadFromServer;
    // Return the updated payload object back to the client
    AioResponseBody.JSONDataValueAsObject := LPayload;
  finally
    LPayload.Free;
  end;
end;

class procedure TioHttpServerExecutor._Execute(const APSRequest: IioPersistenceStrategyRequest);
begin
  TioPersistenceStrategyFactory.GetStrategy_ByPSRequest(APSRequest).Execute(APSRequest);
end;

class procedure TioHttpServerExecutor._Execute_DataSetResult(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
var
  LMemTable: TFDMemTable;
begin
  LMemTable := TFDMemTable.Create(nil);
  try
    APSRequest.Obj1 := LMemTable;
    _Execute(APSRequest);
    LMemTable.SaveToStream(AioResponseBody.Stream, TFDStorageFormat.sfJSON);
  finally
    FreeAndNil(APSRequest.Obj1);
  end;
end;

class procedure TioHttpServerExecutor._Execute_IntegerResult(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
  _Execute(APSRequest);
  AioResponseBody.JSONDataValueAsInteger := APSRequest.ResultAsInteger;
end;

class procedure TioHttpServerExecutor._LoadList(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
  // Create a dummy list (note: TObjectList even for interface type items)
  //  NB: La lista non viene ricevuta nella PSRequest ma viene ricreata qui perchè la lista stessa non è una entità mappata, invece
  //       nel caso del LoadObject riguarda sempre una entità mappata e quindi non è necessario
  APSRequest.ListDTO := TObjectList<TObject>.Create;
  try
    _Execute(APSRequest);
    AioResponseBody.JSONDataValueAsObject := APSRequest.ListDTO;
  finally
    APSRequest.ListDTO.Free;
  end;
end;

class procedure TioHttpServerExecutor._LoadObject(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
  _Execute(APSRequest);
  AioResponseBody.JSONDataValueAsObject := APSRequest.DTO;
end;

class procedure TioHttpServerExecutor._PersistList(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
  _Execute(APSRequest);
  if TioUtilities.BlindLevel_Do_AutoUpdateProps(APSRequest.BlindLevel) then
    AioResponseBody.JSONDataValueAsObject := APSRequest.ListDTO;
end;

class procedure TioHttpServerExecutor._PersistObject(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
  _Execute(APSRequest);
  if TioUtilities.BlindLevel_Do_AutoUpdateProps(APSRequest.BlindLevel) then
    AioResponseBody.JSONDataValueAsObject := APSRequest.DTO;
end;

class procedure TioHttpServerExecutor._Auth_NewAccessToken(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
  // note: AioRequestBody.AuthToken param is PKCE code challenge
//  AioResponseBody.AuthResult1 := TioAuthServer.GetInstance.NewAccessToken(AioRequestBody.AuthGrant, AioRequestBody.AuthToken).AsString;
end;

class procedure TioHttpServerExecutor._Auth_RefreshAccessToken(const APSRequest: IioPersistenceStrategyRequest; const AioResponseBody: IioHttpResponseBody);
begin
//  AioResponseBody.AuthResult1 := TioAuthServer.GetInstance.RefreshAccessToken(AioRequestBody.AuthToken).AsString;
end;

end.
