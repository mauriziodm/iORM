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
unit iORM.Interceptor.Strategy.Register;

interface

uses
  iORM.Interceptor.Strategy, iORM.Where.Interfaces;

type

  TioStrategyInterceptorRegister = class
  private
    class var FInternalContainer: TArray<TioStrategyInterceptorRef>;
  public
    class procedure RegisterInterceptor(const AStrategyInterceptor: TioStrategyInterceptorRef);
    class procedure UnregisterInterceptor(const AStrategyInterceptor: TioStrategyInterceptorRef);
    // LoadObject
    class function BeforeLoadObject(const AWhere: IioWhere; const AObj: TObject; var ADone: Boolean): TObject;
    class function AfterLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject; virtual;
    // LoadList
    class procedure BeforeLoadList(const AWhere: IioWhere; const AList: TObject; var ADone: Boolean);
    class procedure AfterLoadList(const AWhere: IioWhere; const AList: TObject);
    // PersistObject
    class procedure BeforePersistObject(const AObj: TObject; var ADone: Boolean);
    class procedure AfterPersistObject(const AObj: TObject);
    // PersistList
    class procedure BeforePersistList(const AList: TObject; var ADone: Boolean);
    class procedure AfterPersistList(const AList: TObject);
    // DeleteObject
    class procedure BeforeDeleteObject(const AObj: TObject; var ADone: Boolean);
    class procedure AfterDeleteObject(const AObj: TObject);
    // DeleteList
    class procedure BeforeDeleteList(const AList: TObject; var ADone: Boolean);
    class procedure AfterDeleteList(const AList: TObject);
  end;

implementation

uses
  iORM.Utilities;

{ TioStrategyInterceptorRegister }

class procedure TioStrategyInterceptorRegister.AfterDeleteList(const AList: TObject);
var
  LInterceptor: TioStrategyInterceptorRef;
  LTypeName: String;
begin
  LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
  for LInterceptor in FInternalContainer do
    if LInterceptor.CanIntercept(LTypeName, '', siDeleteList) then
      LInterceptor.AfterDeleteList(AList);
end;

class procedure TioStrategyInterceptorRegister.AfterDeleteObject(const AObj: TObject);
var
  LInterceptor: TioStrategyInterceptorRef;
begin
  for LInterceptor in FInternalContainer do
    if LInterceptor.CanIntercept(AObj.ClassName, '', siDeleteObj) then
      LInterceptor.AfterDeleteObject(AObj);
end;

class procedure TioStrategyInterceptorRegister.AfterLoadList(const AWhere: IioWhere; const AList: TObject);
var
  LInterceptor: TioStrategyInterceptorRef;
begin
  for LInterceptor in FInternalContainer do
    if LInterceptor.CanIntercept(AWhere.TypeName, AWhere.TypeAlias, siLoadList) then
      LInterceptor.AfterLoadList(AWhere, AList);
end;

class function TioStrategyInterceptorRegister.AfterLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject;
var
  LInterceptor: TioStrategyInterceptorRef;
begin
  for LInterceptor in FInternalContainer do
    if LInterceptor.CanIntercept(AWhere.TypeName, AWhere.TypeAlias, siLoadObj) then
      LInterceptor.AfterLoadObject(AWhere, AObj);
end;

class procedure TioStrategyInterceptorRegister.AfterPersistList(const AList: TObject);
var
  LInterceptor: TioStrategyInterceptorRef;
  LTypeName: String;
begin
  LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
  for LInterceptor in FInternalContainer do
    if LInterceptor.CanIntercept(LTypeName, '', siPersistList) then
      LInterceptor.AfterPersistList(AList);
end;

class procedure TioStrategyInterceptorRegister.AfterPersistObject(const AObj: TObject);
var
  LInterceptor: TioStrategyInterceptorRef;
begin
  for LInterceptor in FInternalContainer do
    if LInterceptor.CanIntercept(AObj.ClassName, '', siPersistObj) then
      LInterceptor.AfterPersistObject(AObj);
end;

class procedure TioStrategyInterceptorRegister.BeforeDeleteList(const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioStrategyInterceptorRef;
  LTypeName: String;
begin
  LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
  for LInterceptor in FInternalContainer do
  begin
    LDone := False;
    if LInterceptor.CanIntercept(LTypeName, '', siDeleteList) then
      LInterceptor.BeforeDeleteList(AList, LDone);
    if LDone then
      ADone := True;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforeDeleteObject(const AObj: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioStrategyInterceptorRef;
begin
  for LInterceptor in FInternalContainer do
  begin
    LDone := False;
    if LInterceptor.CanIntercept(AObj.ClassName, '', siDeleteObj) then
      LInterceptor.BeforeDeleteObject(AObj, LDone);
    if LDone then
      ADone := True;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforeLoadList(const AWhere: IioWhere; const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioStrategyInterceptorRef;
  LTypeName: String;
begin
  LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
  for LInterceptor in FInternalContainer do
  begin
    LDone := False;
    if LInterceptor.CanIntercept(AWhere.TypeName, AWhere.TypeAlias, siLoadList) then
      LInterceptor.BeforeLoadList(AWhere, AList, LDone);
    if LDone then
      ADone := True;
  end;
end;

class function TioStrategyInterceptorRegister.BeforeLoadObject(const AWhere: IioWhere; const AObj: TObject; var ADone: Boolean): TObject;
var
  LDone: Boolean;
  LInterceptor: TioStrategyInterceptorRef;
begin
  for LInterceptor in FInternalContainer do
  begin
    LDone := False;
    if LInterceptor.CanIntercept(AWhere.TypeName, AWhere.TypeAlias, siLoadObj) then
      LInterceptor.BeforeLoadObject(AWhere, AObj, LDone);
    if LDone then
      ADone := True;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforePersistList(const AList: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioStrategyInterceptorRef;
  LTypeName: String;
begin
  LTypeName := TioUtilities.ExtractItemRttiTypeFromList(AList).Name;
  for LInterceptor in FInternalContainer do
  begin
    LDone := False;
    if LInterceptor.CanIntercept(LTypeName, '', siPersistList) then
      LInterceptor.BeforePersistList(AList, LDone);
    if LDone then
      ADone := True;
  end;
end;

class procedure TioStrategyInterceptorRegister.BeforePersistObject(const AObj: TObject; var ADone: Boolean);
var
  LDone: Boolean;
  LInterceptor: TioStrategyInterceptorRef;
begin
  for LInterceptor in FInternalContainer do
  begin
    LDone := False;
    if LInterceptor.CanIntercept(AObj.ClassName, '', siPersistObj) then
      LInterceptor.BeforePersistObject(AObj, LDone);
    if LDone then
      ADone := True;
  end;
end;

class procedure TioStrategyInterceptorRegister.RegisterInterceptor(const AStrategyInterceptor: TioStrategyInterceptorRef);
begin
  // Note: I know that this way there may be a reallocation of memory every time I add an element but the interceptors will be very few.
  SetLength(FInternalContainer, Length(FInternalContainer) + 1);
  FInternalContainer[Length(FInternalContainer) - 1] := AStrategyInterceptor;
end;

class procedure TioStrategyInterceptorRegister.UnregisterInterceptor(const AStrategyInterceptor: TioStrategyInterceptorRef);
var
  I: Integer;
begin
  for I := High(FInternalContainer) downto Low(FInternalContainer) do
    if FInternalContainer[I] = AStrategyInterceptor then
      Delete(FInternalContainer, I, 1);
end;

end.
