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
  System.Classes, System.Generics.Collections, iORM.ETM.Interfaces, iORM.Where.Interfaces,
  iORM.Context.Map.Interfaces;

type

  TIoEtmEngine = class
  public
    // Fluent interface
    class function TimeTravelExFor<T: class>: IioWhere<IioEtmTimeSlot>;
    // Non fluent interface
    class function TimeTravelFor<T: class>(const AWhere: IioWhere = nil): TList<IioEtmTimeSlot>; overload;
    class function TimeTravelFor(const AObj: TObject; const AWhere: IioWhere = nil): TList<IioEtmTimeSlot>; overload;
    class function TimeTravelFor(const AIntf: IInterface; const AWhere: IioWhere = nil): TList<IioEtmTimeSlot>; overload;
    // Trace
    class procedure TraceByMap(const AMap: IioMap; const AConnectionName: String);
    class procedure Trace<T: class>(const AConnectionName: String = '');
  end;

implementation

uses
  iORM, iORM.Utilities, iORM.CommonTypes, iORM.Exceptions, System.SysUtils,
  iORM.ETM.Interceptor, iORM.Context.Factory;

{ TIoEtmEngine }

class function TIoEtmEngine.TimeTravelExFor<T>: IioWhere<IioEtmTimeSlot>;
begin
  Result := io.Load<IioEtmTimeSlot>._Where('EntityClassName', TioCompareOp.coEquals, TioUtilities.GenericToString<T>);
end;

class function TIoEtmEngine.TimeTravelFor(const AIntf: IInterface; const AWhere: IioWhere): TList<IioEtmTimeSlot>;
begin
  Result := io.Load<IioEtmTimeSlot>._Where('EntityClassName', TioCompareOp.coEquals, (AIntf as TObject).ClassName).ToList;
end;

class function TIoEtmEngine.TimeTravelFor<T>(const AWhere: IioWhere): TList<IioEtmTimeSlot>;
begin
  Result := io.Load<IioEtmTimeSlot>._Where(AWhere).ToList;
end;

class procedure TIoEtmEngine.Trace<T>(const AConnectionName: String);
begin
  TraceByMap(TioContextFactory.Map(T), AConnectionName);
end;

class procedure TIoEtmEngine.TraceByMap(const AMap: IioMap; const AConnectionName: String);
begin
  // A TioObjVersion field is mandatory
  if not AMap.GetProperties.ObjVersionPropertyExist then
    raise EioException.Create(ClassName, 'TraceByMap', Format('Hello, I''m iORM, I''m sorry but there is a problem.' +
      #13#13'I''m trying to register the class "%s" in the ETM (Entity Time Machine) subsystem but it doesn''t have a field of type "TioObjVersion".' +
      #13#13'Please add a field/property of type "TioObjVersion" and try again, everything will be fine.', [AMap.GetClassName]));
  // Register the ETMInterceptor for this class & connection
  io.CRUDInterceptors.RegisterInterceptor(TioEtmInterceptor, AMap.GetClassName, AConnectionName);
end;

class function TIoEtmEngine.TimeTravelFor(const AObj: TObject; const AWhere: IioWhere): TList<IioEtmTimeSlot>;
begin
  Result := io.Load<IioEtmTimeSlot>._Where('EntityClassName', TioCompareOp.coEquals, AObj.ClassName).ToList;
end;

end.
