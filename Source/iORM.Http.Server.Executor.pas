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
  iORM.DB.Interfaces;

type

  TioHttpServerExecutor = class
  private
    class procedure _Count(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
    class procedure _Delete(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
    class procedure _DeleteObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
    class procedure _LoadDataSet(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
    class procedure _LoadList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
    class procedure _LoadObject(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
    class procedure _PersistList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
  public
    class function Execute(const ARequestBodyAsString: String): String;
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
  // Execute the right method/action
  if LioRequestBody.MethodName = HTTP_METHOD_NAME_COUNT then
    _Count(LioRequestBody, LioResponseBody)
  else if LioRequestBody.MethodName = HTTP_METHOD_NAME_DELETE then
    _Delete(LioRequestBody, LioResponseBody)
  else if LioRequestBody.MethodName = HTTP_METHOD_NAME_DELETEOBJECT then
    _DeleteObject(LioRequestBody, LioResponseBody)
  else if LioRequestBody.MethodName = HTTP_METHOD_NAME_LOADDATASET then
    _LoadDataSet(LioRequestBody, LioResponseBody)
  else if LioRequestBody.MethodName = HTTP_METHOD_NAME_LOADLIST then
    _LoadList(LioRequestBody, LioResponseBody)
  else if LioRequestBody.MethodName = HTTP_METHOD_NAME_LOADOBJECT then
    _LoadObject(LioRequestBody, LioResponseBody)
  else if LioRequestBody.MethodName = HTTP_METHOD_NAME_PERSISTLIST then
    _PersistList(LioRequestBody, LioResponseBody)
  else
    raise EioHttpException.Create(ClassName, 'Execute', Format('Method "%s" not found.', [LioRequestBody.MethodName]));
  // Return the response
  Result := LioResponseBody.ToJSONText;
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
  AioResponseBody.JSONDataValue := dj.From(LObj).byFields.TypeAnnotationsON.ToJsonValue;
end;

class procedure TioHttpServerExecutor._PersistList(const AioRequestBody: IioHttpRequestBody; const AioResponseBody: IioHttpResponseBody);
begin
  io._PersistList(AioRequestBody.JSONDataValueAsObject, AioRequestBody.IntentType, AioRequestBody.BlindLevel);
  if TioUtilities.BlindLevel_Do_AutoUpdateProps(AioRequestBody.BlindLevel) then
    AioResponseBody.JSONDataValue := dj.From(AioRequestBody.JSONDataValueAsObject).byFields.TypeAnnotationsON.ToJsonValue;
end;

end.
