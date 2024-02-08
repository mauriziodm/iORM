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
unit iORM.Resolver.Interfaces;

interface

uses
  System.Rtti, System.Generics.Collections;

type

  // Resolver mode
  TioResolverMode = (rmAll, rmAllDistinctByConnectionAndTable, rmSingle);

  // Resolver strategy
  TioResolverStrategy = (rsByDependencyInjection, rsByRtti, rsByMaps);

  // Interface for the resolved type list
  IioResolvedTypeList = interface
    ['{545F419F-2E17-45F2-A815-EE20D9AAF93E}']
    procedure Add(const ATypeName: String);
    function GetEnumerator: TEnumerator<String>;
    // Count
    function GetCount: Integer;
    property Count: Integer read GetCount;
    // Items
    function GetItem(Index: Integer): String;
    property Items[Index: Integer]: String read GetItem; default;
  end;

  // Interface for the resolvers
  // NB: FOR ENTITY PERSISTENCE PURPOSES ONLY
  TioResolverRef = class of TioResolver;
  TioResolver = class abstract
  public
    // ResolveInaccurate in pratica per cercare almeno una classe che implementa l'interfaccia.
    //  Se l'alias è vuoto e non c'è una classe registrata che implementa l'interfaccia senza Alias (ma
    //  ne esiste almeno una registrata anche se con un alias) ritorna quella.
    class function ResolveInaccurateAsRttiType(const ATypeName:String; const AAlias:String): TRttiType; virtual; abstract;
    class function Resolve(const ATypeName:String; const AAlias:String=''; const AResolverMode:TioResolverMode=rmAllDistinctByConnectionAndTable;
      const AUseMapInfo: Boolean = True): IioResolvedTypeList; virtual; abstract;
  end;

implementation

end.
