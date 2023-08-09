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
unit iORM.Where.Factory;

interface

uses
  iORM.Where.Interfaces, iORM.Where, iORM.LiveBindings.CommonBSAPaging,
  iORM.Where.SmartBuilder, iORM.Where.SqlItems.Interfaces,
  iORM.LiveBindings.Interfaces;

type

  TioWhereFactory = class
  public
    class function NewWhere: IioWhere; overload;
    class function NewWhere<T>: IioWhere<T>; overload;
    class function NewWhereWithPagingAndETMfor(const APaging: TioCommonBSAPageManager; const AETMfor: IioNotifiableBindSource): IioWhere; overload;
    class function NewWhereItems: TWhereItems;
    class function NewDetailsContainer: IioWhereDetailsContainer;
    class function NewWhereSmartBuilder: TioWhereSmartBuilderRef;
    class function NewWhereNestedWhereResolver(const ANestedCriteria: IioSqlItemCriteria): IioWhereNestedPropResolver;
  end;

implementation

uses
  iORM.Where.DetailsContainer, iORM.Interfaces, System.Generics.Collections,
  iORM.Where.NestedProp.Resolver;

{ TioWhereFactory }

class function TioWhereFactory.NewDetailsContainer: IioWhereDetailsContainer;
begin
  Result := TioWhereDetailsContainer.Create;
end;

class function TioWhereFactory.NewWhere: IioWhere;
begin
  Result := TioWhere.Create;
end;

class function TioWhereFactory.NewWhere<T>: IioWhere<T>;
begin
  Result := TioWhere<T>.Create;
end;

class function TioWhereFactory.NewWhereItems: TWhereItems;
begin
  Result := TList<IioSqlItem>.Create;
end;

class function TioWhereFactory.NewWhereNestedWhereResolver(const ANestedCriteria: IioSqlItemCriteria): IioWhereNestedPropResolver;
begin
  Result := TioWhereNestedPropResolver.Create(ANestedCriteria);
end;

class function TioWhereFactory.NewWhereSmartBuilder: TioWhereSmartBuilderRef;
begin
  Result := TioWhereSmartBuilder;
end;

class function TioWhereFactory.NewWhereWithPagingAndETMfor(const APaging: TioCommonBSAPageManager; const AETMfor: IioNotifiableBindSource): IioWhere;
begin
  Result := TioWhere.Create;
  Result.SetPagingObj(APaging); // Inject paging object specified in the BindSource
  Result.SetETMfor(AETMfor); // Inject ETMfor BS specified in the BindSource
end;

end.
