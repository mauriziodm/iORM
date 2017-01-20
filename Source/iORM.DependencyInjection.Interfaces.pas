{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}



unit iORM.DependencyInjection.Interfaces;

interface

uses
  iORM.DependencyInjection.Implementers, System.Rtti, iORM.MVVM.Interfaces,
  iORM.LiveBindings.PrototypeBindSource, iORM.LiveBindings.Interfaces,
  iORM.CommonTypes, iORM.MVVM.Components.ViewContextProvider;

type

  IioDependencyInjectionLocator = interface
    ['{51289FD7-AA55-43D9-BF5B-EDA5BF27D301}']
    function Exist: Boolean;
    function Get: TObject;
    function GetItem: TioDIContainerImplementersItem;
    function Alias(const AAlias:String): IioDependencyInjectionLocator;
    function ConstructorParams(const AParams: array of TValue): IioDependencyInjectionLocator;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
    function VCProvider(const AVCProvider:TioViewContextProvider): IioDependencyInjectionLocator; overload;
    function VCProvider(const AName:String): IioDependencyInjectionLocator; overload;
    // ---------- LOCATE VIEW CONTEXT PROVIDER ----------
  end;

  IioDependencyInjectionLocator<TI> = interface(IioDependencyInjectionLocator)
    ['{EA9F3CAD-B9A2-4607-8D80-881EF4C36EDE}']
    function Get: TI; overload;
    function Alias(const AAlias:String): IioDependencyInjectionLocator<TI>;
    function ConstructorParams(const AParams: array of TValue): IioDependencyInjectionLocator<TI>;
    function ConstructorMethod(const AConstructorMethod: String): IioDependencyInjectionLocator<TI>;
    function ConstructorMarker(const AConstructorMarker: String): IioDependencyInjectionLocator<TI>;
  end;

implementation

uses
  System.SysUtils;

end.
