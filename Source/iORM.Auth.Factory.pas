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
unit iORM.Auth.Factory;

interface

uses
  iORM.Auth.Interfaces;

type

  TioAuthFactory = class
  public
    class function NewAuthSession: IioAuthSession; static;
    class function NewAuthRoleItem(const ARole: IioAuthRole): IioAuthRoleItem; static;
    class function NewAuthUserAppItem(const AApp: IioAuthApp): IioAuthAppItem; static;
    class function NewAuthResponse: IioAuthResponse; static;
    class function NewAuthResponseFromString(const AValue: String): IioAuthResponse; static;
  end;

implementation

uses
  iORM.Auth.Session, iORM.Auth.Model, iORM.Auth.Response;

{ TioAuthFactory }

class function TioAuthFactory.NewAuthResponse: IioAuthResponse;
begin
  Result := TioAuthResponse.Create;
end;

class function TioAuthFactory.NewAuthResponseFromString(const AValue: String): IioAuthResponse;
begin
  Result := TioAuthResponse.CreateByString(AValue);
end;

class function TioAuthFactory.NewAuthRoleItem(const ARole: IioAuthRole): IioAuthRoleItem;
begin
  Result := TioAuthRoleItem.Create(ARole);
end;

class function TioAuthFactory.NewAuthSession: IioAuthSession;
begin
  Result := TioAuthSession.Create;
end;

class function TioAuthFactory.NewAuthUserAppItem(const AApp: IioAuthApp): IioAuthAppItem;
begin
  Result := TioAuthAppItem.Create(AApp);
end;

end.
