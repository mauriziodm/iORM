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
unit iORM.DuckTyped.Factory;

interface

uses
  iORM.DuckTyped.Interfaces, System.Rtti;

type

  // Concrete factory for DuckTyped objects
  TioDuckTypedFactory = class
  public
    class function DuckTypedStreamObject(const AObj: TObject): IioDuckTypedStreamObject;
    class function DuckTypedList(const AListObject: TObject): IioDuckTypedList;
    class function TryGetHasManyRelationChildTypeName(const ARttiType: TRttiType): String;
    class function IsList(const AObj: TObject): Boolean;
  end;

implementation

uses
  iORM.DuckTyped.List, iORM;

{ TioDuckTypeFactory }

class function TioDuckTypedFactory.DuckTypedList(const AListObject: TObject): IioDuckTypedList;
begin
  Result := TioDuckTypedList.Create(AListObject);
end;

class function TioDuckTypedFactory.TryGetHasManyRelationChildTypeName(const ARttiType: TRttiType): String;
begin
  Result := TioDuckTypedList.TryGetHasManyRelationChildTypeName(ARttiType);
end;

class function TioDuckTypedFactory.IsList(const AObj: TObject): Boolean;
begin
  Result := TioDuckTypedList.IsList(AObj);
end;

class function TioDuckTypedFactory.DuckTypedStreamObject(const AObj: TObject): IioDuckTypedStreamObject;
var
  AAlias: String;
begin
  // Init
  AAlias := AObj.ClassName;
  // If a custom implementation of the DuckTypedStreamObject (for the class of AObj; ClassName as Alias) is present in the
  // dependency injection cantainer then use it, else retrieve the standard implementation (no Alias)
  if not io.di.Locate<IioDuckTypedStreamObject>(AAlias).Exist then
    AAlias := '';
  // Return the result
  Result := io.di.Locate<IioDuckTypedStreamObject>(AAlias).ConstructorParams([AObj]).Get;
end;

end.

