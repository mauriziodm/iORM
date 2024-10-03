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
  iORM.DB.Interfaces, System.DateUtils;

type

  TioHttpServerExecutor = class
  private
    class procedure _Count(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _Delete(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _DeleteList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _DeleteObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _DoSynchronization(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _LoadDataSet(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _LoadList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _LoadObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _Max(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _Min(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _PersistList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _PersistObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _SQLDestExecute(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _SQLLoadDataSet(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    // auth
    class procedure _AuthorizeUser(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _AuthorizeApp(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _AuthorizeAccess(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _NewAccessToken(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _RefreshAccessToken(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _AccessTokenNeedRefresh(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
  public
    class function Execute(const ARequestBodyAsString: String): String; static;
    class function Test: String; static;
  end;

implementation

uses
  iORM, DJSON, iORM.Http.Factory, iORM.Http.Interfaces, iORM.Exceptions,
  System.SysUtils, System.JSON, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  System.Generics.Collections, iORM.Utilities, iORM.SynchroStrategy.Custom,
  iORM.Auth.Components.AuthServer, iORM.Auth.Interfaces;

{ TioHttpServerExecutor }

class function TioHttpServerExecutor.Execute(const ARequestBodyAsString: String): String;
var
  LioRequestBody: IioHttpRequestBody;
  LioResponseBody: IioHttpResponseBody;
begin
  try
    // Create ioRequestBody and ioResponseBody instances
    LioRequestBody := TioHttpFactory.NewRequestBodyByJSONString(ARequestBodyAsString);
    LioResponseBody := TioHttpFactory.NewResponseBody;
    // Execute the right method/action (in ordine di prevista frequenza)
    if LioRequestBody.MethodName = HTTP_METHOD_NAME_LOADOBJECT then
      _LoadObject(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_PERSISTOBJECT then
      _PersistObject(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_DELETEOBJECT then
      _DeleteObject(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_LOADLIST then
      _LoadList(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_PERSISTLIST then
      _PersistList(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_DELETELIST then
      _DeleteList(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_MAX then
      _Max(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_MIN then
      _Min(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_COUNT then
      _Count(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_DELETE then
      _Delete(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_LOADDATASET then
      _LoadDataSet(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_SQLDESTEXECUTE then
      _SQLDestExecute(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_SQLDESTLOADDATASET then
      _SQLLoadDataSet(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_DOSYNCHRONIZATION then
      _DoSynchronization(LioRequestBody, LioResponseBody)
    // auth methods
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_AUTH_AUTHORIZEACCESS then
      _AuthorizeAccess(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_AUTH_REFRESHACCESSTOKEN then
      _RefreshAccessToken(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_AUTH_ACCESSTOKENNEEDREFRESH then
      _AccessTokenNeedRefresh(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_AUTH_NEWACCESSTOKEN then
      _NewAccessToken(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_AUTH_AUTHORIZEUSER then
      _AuthorizeUser(LioRequestBody, LioResponseBody)
    else if LioRequestBody.MethodName = HTTP_METHOD_NAME_AUTH_AUTHORIZEAPP then
      _AuthorizeApp(LioRequestBody, LioResponseBody)
    // else
    else
      raise EioHttpLocalException.Create(ClassName, 'Execute', Format('Method "%s" not found.', [LioRequestBody.MethodName]));
    // Return the response
    Result := LioResponseBody.ToJSONText;
  except
    on E: Exception do
    begin
      LioResponseBody.ExceptionClassName := E.ClassName;
      LioResponseBody.ExceptionMessage := E.Message;
      // Return the response
      Result := LioResponseBody.ToJSONText;
    end;
  end;
end;

class function TioHttpServerExecutor.Test: String;
begin
  Result := Format('Hi, I''m iORM, I''m proud to tell you that my http server executor is successfully connected now %s.', [Now.ToString]);
end;

class procedure TioHttpServerExecutor._AccessTokenNeedRefresh(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
begin
  AioResponseBody.AuthResultIsAuthorized := TioAuthServer.GetInstance.AccessTokenNeedRefresh(AioRequestBody.AuthToken);
end;

class procedure TioHttpServerExecutor._AuthorizeAccess(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
begin
  AioResponseBody.AuthResultIsAuthorized := TioAuthServer.GetInstance.AuthorizeAccess(AioRequestBody.AuthScope, AioRequestBody.AuthIntention, AioRequestBody.AuthToken);
end;

class procedure TioHttpServerExecutor._AuthorizeApp(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LObj: TObject;
  LAppCredentials: IioAuthAppCredentials;
  LResultAppAuthorizationToken: String;
begin
  LObj := AioRequestBody.JSONDataValueAsObject;
  if Supports(LObj, IioAuthAppCredentials, LAppCredentials) then
  begin
    AioResponseBody.AuthResultIsAuthorized := TioAuthServer.GetInstance.AuthorizeApp(LAppCredentials, AioRequestBody.AuthToken, LResultAppAuthorizationToken);
    AioResponseBody.AuthResult1 := LResultAppAuthorizationToken;
  end
  else
    raise EioHttpLocalException.Create(ClassName, '_AuthorizeApp', 'JSONDataValue object does not implement then "IioAuthAppCredentials" interface');
end;

class procedure TioHttpServerExecutor._AuthorizeUser(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LObj: TObject;
  LUserCredentials: IioAuthCustomCredentials;
  LResultUserAuthorizationToken: String;
begin
  LObj := AioRequestBody.JSONDataValueAsObject;
  if Supports(LObj, IioAuthCustomCredentials, LUserCredentials) then
  begin
    AioResponseBody.AuthResultIsAuthorized := TioAuthServer.GetInstance.AuthorizeUser(LUserCredentials, LResultUserAuthorizationToken);
    AioResponseBody.AuthResult1 := LResultUserAuthorizationToken;
  end
  else
    raise EioHttpLocalException.Create(ClassName, '_AuthorizeUser', 'JSONDataValue object does not implement then "IioAuthUserCredentials" interface');
end;

class procedure TioHttpServerExecutor._Count(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LCount: integer;
begin
  LCount := AioRequestBody.Where.Count;
  AioResponseBody.JSONDataValue := TJSONNumber.Create(LCount);
end;

class procedure TioHttpServerExecutor._Delete(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
begin
  AioRequestBody.Where.Delete;
end;

class procedure TioHttpServerExecutor._DeleteList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LList: TObject;
begin
  LList := AioRequestBody.JSONDataValueAsObject;
  io._DeleteListInternal(LList, AioRequestBody.IntentType, AioRequestBody.BlindLevel);
end;

class procedure TioHttpServerExecutor._DeleteObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
begin
  io._DeleteObjectInternal(AioRequestBody.JSONDataValueAsObject, AioRequestBody.IntentType, AioRequestBody.BlindLevel);
end;

class procedure TioHttpServerExecutor._DoSynchronization(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LPayload: TioCustomSynchroStrategy_Payload;
begin
  // Get the server-side local copy of the payload from the client request
  LPayload := AioRequestBody.JSONDataValueAsObject as TioCustomSynchroStrategy_Payload;
  try
    // Server-side operations
    LPayload.PersistAndReloadFromServer;
    // Return the updated payload object back to the client
    AioResponseBody.JSONDataValueAsObject := LPayload;
  finally
    // Free the server-side local copy of the payload object
    LPayload.Free;
  end;
end;

class procedure TioHttpServerExecutor._LoadDataSet(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LMemTable: TFDMemTable;
begin
  LMemTable := AioRequestBody.Where.ToMemTable;
  try
    LMemTable.SaveToStream(AioResponseBody.Stream, TFDStorageFormat.sfJSON);
  finally
    LMemTable.Free;
  end;
end;

class procedure TioHttpServerExecutor._LoadList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LList: TObjectList<TObject>;
begin
  LList := TObjectList<TObject>.Create; // Create a dummy list (note: TObjectLIst even for interface type items)
  try
    AioRequestBody.Where.ToList(LList);
    AioResponseBody.JSONDataValueAsObject := LList;
  finally
    LList.Free;
  end;
end;

class procedure TioHttpServerExecutor._LoadObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LObj: TObject;
begin
  LObj := AioRequestBody.Where.ToObject;
  if Assigned(LObj) then
    AioResponseBody.JSONDataValueAsObject := LObj;
end;

class procedure TioHttpServerExecutor._Max(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LMax: integer;
begin
  LMax := AioRequestBody.Where.Max(AioRequestBody.RelationPropertyName);
  AioResponseBody.JSONDataValue := TJSONNumber.Create(LMax);
end;

class procedure TioHttpServerExecutor._Min(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LMin: integer;
begin
  LMin := AioRequestBody.Where.Min(AioRequestBody.RelationPropertyName);
  AioResponseBody.JSONDataValue := TJSONNumber.Create(LMin);
end;

class procedure TioHttpServerExecutor._NewAccessToken(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LResultAccessToken, LResultRefreshToken: String;
begin
  AioResponseBody.AuthResultIsAuthorized := TioAuthServer.GetInstance.NewAccessToken(AioRequestBody.AuthToken, LResultAccessToken, LResultRefreshToken);
  AioResponseBody.AuthResult1 := LResultAccessToken;
  AioResponseBody.AuthResult2 := LResultRefreshToken;
end;

class procedure TioHttpServerExecutor._PersistList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LList: TObject;
begin
  LList := AioRequestBody.JSONDataValueAsObject;
  io._PersistListInternal(LList, AioRequestBody.IntentType, AioRequestBody.RelationPropertyName, AioRequestBody.RelationOID, nil, '', '',
    AioRequestBody.BlindLevel);
  if TioUtilities.BlindLevel_Do_AutoUpdateProps(AioRequestBody.BlindLevel) then
    AioResponseBody.JSONDataValueAsObject := LList;
end;

class procedure TioHttpServerExecutor._PersistObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LObj: TObject;
begin
  LObj := AioRequestBody.JSONDataValueAsObject;
  io._PersistObjectInternal(LObj, AioRequestBody.IntentType, AioRequestBody.RelationPropertyName, AioRequestBody.RelationOID, nil, '', '',
    AioRequestBody.BlindLevel);
  if TioUtilities.BlindLevel_Do_AutoUpdateProps(AioRequestBody.BlindLevel) then
    AioResponseBody.JSONDataValueAsObject := LObj;
end;

class procedure TioHttpServerExecutor._RefreshAccessToken(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LResultAccessToken, LResultRefreshToken: String;
begin
  AioResponseBody.AuthResultIsAuthorized := TioAuthServer.GetInstance.RefreshAccessToken(AioRequestBody.AuthToken, LResultAccessToken, LResultRefreshToken);
  AioResponseBody.AuthResult1 := LResultAccessToken;
  AioResponseBody.AuthResult2 := LResultRefreshToken;
end;

class procedure TioHttpServerExecutor._SQLDestExecute(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
begin
  io.SQL(AioRequestBody.SQLDestination).Execute(AioRequestBody.SQLDestination.GetIgnoreObjNotExists);
end;

class procedure TioHttpServerExecutor._SQLLoadDataSet(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
var
  LMemTable: TFDMemTable;
begin
  LMemTable := io.SQL(AioRequestBody.SQLDestination).ToMemTable;
  try
    LMemTable.SaveToStream(AioResponseBody.Stream, TFDStorageFormat.sfJSON);
  finally
    LMemTable.Free;
  end;
end;

end.
