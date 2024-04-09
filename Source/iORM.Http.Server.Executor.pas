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
    class procedure _LoadDataSet(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _LoadList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _LoadObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _PersistList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _PersistObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _SQLDestExecute(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
    class procedure _SQLLoadDataSet(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody); inline; static;
  public
    class function Execute(const ARequestBodyAsString: String): String; static;
    class function Test: String; static;
  end;

implementation

uses
  iORM, DJSON, iORM.Http.Factory, iORM.Http.Interfaces, iORM.Exceptions,
  System.SysUtils, System.JSON, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  System.Generics.Collections, iORM.Utilities;

{ TioHttpServerExecutor }

class function TioHttpServerExecutor.Execute(const ARequestBodyAsString: String): String;
var
  LioRequestBody: IioHttpRequestBody;
  LioResponseBody: IioHttpResponseBody;
begin
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
  else
    raise EioHttpException.Create(ClassName, 'Execute', Format('Method "%s" not found.', [LioRequestBody.MethodName]));
  // Return the response
  Result := LioResponseBody.ToJSONText;
end;

class function TioHttpServerExecutor.Test: String;
begin
  Result := Format('Hi, I''m iORM, I''m proud to tell you that my http server executor is successfully connected now %s.', [Now.ToString]);
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
    AioResponseBody.JSONDataValue := dj.From(LList).byFields.TypeAnnotationsON.ToJsonValue;
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
    AioResponseBody.JSONDataValue := dj.From(LObj).byFields.TypeAnnotationsON.ToJsonValue;
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
