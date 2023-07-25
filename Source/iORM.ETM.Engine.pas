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
unit iORM.ETM.Engine;

interface

uses
  System.Classes, System.Generics.Collections, iORM.Where.Interfaces,
  iORM.Context.Map.Interfaces, iORM.ETM.Repository;

type

  TIoEtmEngineRef = class of TIoEtmEngine;

  TIoEtmEngine = class
  private
    class function _InternalBuildTimeTravelWhere(const AEntityClassName: String): IioWhere<TioEtmCustomRepository>;
    class function _InternalTimeTravelFor(const AEntityClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil)
      : TObjectList<TioEtmCustomRepository>; overload;
  public
    // Fluent interface
    class function FluentTimeLineFor<T: class>: IioWhere<TioEtmCustomRepository>; overload;
    class function FluentTimeLineFor(const AEntityClassName: String): IioWhere<TioEtmCustomRepository>; overload;
    class function FluentTimeLineFor(const AObj: TObject): IioWhere<TioEtmCustomRepository>; overload;
    class function FluentTimeLineFor(const AIntf: IInterface): IioWhere<TioEtmCustomRepository>; overload;
    // Non fluent interface
    class function TimeLineFor<T: class>(const AEntityID: Integer; const AWhere: IioWhere = nil): TObjectList<TioEtmCustomRepository>; overload;
    class function TimeLineFor(const AEntityClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil): TObjectList<TioEtmCustomRepository>; overload;
    class function TimeLineFor(const AObj: TObject; const AWhere: IioWhere = nil): TObjectList<TioEtmCustomRepository>; overload;
    class function TimeLineFor(const AIntf: IInterface; const AWhere: IioWhere = nil): TObjectList<TioEtmCustomRepository>; overload;
    // Trace
    class procedure TraceByMap(const AMap: IioMap; const ATraceOnlyOnConnectionName: String = '');
    class procedure Trace<T: class>(const ATraceOnlyOnConnectionName: String = '');
    // Untrace
    class procedure Untrace<T: class>(const ATraceOnlyOnConnectionName: String = '');
  end;

implementation

uses
  iORM, iORM.Utilities, iORM.CommonTypes, iORM.Exceptions, System.SysUtils,
  iORM.ETM.Interceptor, iORM.Context.Factory, iORM.Context.Container;

{ TIoEtmEngine }

class function TIoEtmEngine._InternalBuildTimeTravelWhere(const AEntityClassName: String): IioWhere<TioEtmCustomRepository>;
var
  LMap: IioMap;
begin
  LMap := TioMapContainer.GetMap(AEntityClassName);
  Result := io.Where<TioEtmCustomRepository>('EntityClassName', coEquals, AEntityClassName)._OrderBy('[.DateAndTime]');
  Result.TypeName := LMap.GetTable.GetEtmRepositoryClass.ClassName;
end;

class function TIoEtmEngine._InternalTimeTravelFor(const AEntityClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil)
  : TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeTravelWhere(AEntityClassName)._And(AWhere)._OrderBy('[.DateAndTime]').ToGenericList.OfType<TObjectList<TioEtmCustomRepository>>;
end;

class function TIoEtmEngine.TimeLineFor(const AEntityClassName: String; const AEntityID: Integer;
  const AWhere: IioWhere): TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalTimeTravelFor(AEntityClassName, AEntityID, AWhere);
end;

class function TIoEtmEngine.TimeLineFor<T>(const AEntityID: Integer; const AWhere: IioWhere): TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalTimeTravelFor(T.ClassName, AEntityID, AWhere);
end;

class function TIoEtmEngine.TimeLineFor(const AIntf: IInterface; const AWhere: IioWhere): TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalTimeTravelFor((AIntf as TObject).ClassName, TioUtilities.ExtractOID(AIntf), AWhere);
end;

class function TIoEtmEngine.TimeLineFor(const AObj: TObject; const AWhere: IioWhere): TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalTimeTravelFor(AObj.ClassName, TioUtilities.ExtractOID(AObj), AWhere);
end;

class function TIoEtmEngine.FluentTimeLineFor(const AEntityClassName: String): IioWhere<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeTravelWhere(AEntityClassName);
end;

class function TIoEtmEngine.FluentTimeLineFor<T>: IioWhere<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeTravelWhere(T.ClassName);
end;

class function TIoEtmEngine.FluentTimeLineFor(const AIntf: IInterface): IioWhere<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeTravelWhere((AIntf as TObject).ClassName);
end;

class function TIoEtmEngine.FluentTimeLineFor(const AObj: TObject): IioWhere<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeTravelWhere(AObj.ClassName);
end;

class procedure TIoEtmEngine.Trace<T>(const ATraceOnlyOnConnectionName: String = '');
begin
  TraceByMap(TioMapContainer.GetMap(T.ClassName), ATraceOnlyOnConnectionName);
end;

class procedure TIoEtmEngine.TraceByMap(const AMap: IioMap; const ATraceOnlyOnConnectionName: String = '');
begin
  // A TioObjVersion field is mandatory
  if not AMap.GetProperties.ObjVersionPropertyExist then
    raise EioException.Create(ClassName, 'TraceByMap', Format('Hello, I''m iORM, I''m sorry but there is a problem.' +
      #13#13'I''m trying to register the class "%s" in the ETM (Entity Time Machine) subsystem but it doesn''t have a field of type "TioObjVersion".' +
      #13#13'Please add a field/property of type "TioObjVersion" and try again, everything will be fine.', [AMap.GetClassName]));
  // Register the ETMInterceptor for this class & connection
  io.CRUDInterceptors.RegisterInterceptor(TioEtmInterceptor, AMap.GetClassName, ATraceOnlyOnConnectionName);
end;

class procedure TIoEtmEngine.Untrace<T>(const ATraceOnlyOnConnectionName: String);
begin
  io.CRUDInterceptors.UnregisterInterceptor(TioEtmInterceptor, TioUtilities.GenericToString<T>, ATraceOnlyOnConnectionName);
end;

end.
