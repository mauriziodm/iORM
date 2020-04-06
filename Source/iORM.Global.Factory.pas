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



unit iORM.Global.Factory;

interface

uses
  iORM.Context.Factory, iORM.DB.Factory,
  iORM.DuckTyped.Factory, iORM.LazyLoad.Factory,
  iORM.LiveBindings.Factory, iORM.ObjectsForge.Factory,
  iORM.RttiContext.Factory, iORM.MVVM.Factory, iORM.Containers.Factory,
  iORM.Where.Factory, iORM.Strategy.Interfaces, iORM.Strategy.Factory,
  iORM.DB.DBBuilder.Factory;

Type

  TioContextFactoryRef = class of TioContextFactory;
  TioDBBuilderFactoryRef = class of TioDBBuilderFactory;
  TioDBFactoryRef = class of TioDBFactory;
  TioDuckTypedFactoryRef = class of TioDuckTypedFactory;
  TioLazyLoadFactoryRef = class of TioLazyLoadFactory;
  TioLiveBindingsFactoryRef = class of TioLiveBindingsFactory;
  TioObjectMakerFactoryRef = class of TioObjectMakerFactory;
  TioRttiContextFactoryRef = class of TioRttiContextFactory;
  TioMVVMFactoryRef = class of TioMVVMFactory;
  TioContainersFactoryRef = class of TioContainersFactory;
  TioWhereFactoryRef = class of TioWhereFactory;
  TioStrategyFactoryRef = class of TioStrategyFactory;

  TioGlobalFactory = class
  public
    class function ContextFactory: TioContextFactoryRef;
    class function DBBuilderFactory: TioDBBuilderFactoryRef;
    class function DBFactory: TioDBFactoryRef;
    class function DuckTypedFactory: TioDuckTypedFactoryRef;
    class function LazyLoadFactory: TioLazyLoadFactoryRef;
    class function LiveBindingsFactory: TioLiveBindingsFactoryRef;
    class function ObjectMakerFactory: TioObjectMakerFactoryRef;
    class function RttiFactory: TioRttiContextFactoryRef;
    class function MVVMFactory: TioMVVMFactoryRef;
    class function ContainersFactory: TioContainersFactoryRef;
    class function WhereFactory: TioWhereFactoryRef;
    class function Strategy: TioStrategyFactoryRef;
  end;

  TioGlobalFactoryRef = class of TioGlobalFactory;

implementation

{ TioGlobalFactory }

class function TioGlobalFactory.ContainersFactory: TioContainersFactoryRef;
begin
  Result := TioContainersFactory;
end;

class function TioGlobalFactory.ContextFactory: TioContextFactoryRef;
begin
  Result := TioContextFactory;
end;

class function TioGlobalFactory.DBBuilderFactory: TioDBBuilderFactoryRef;
begin
  Result := TioDBBuilderFactory;
end;

class function TioGlobalFactory.DBFactory: TioDBFactoryRef;
begin
  Result := TioDBFactory;
end;

class function TioGlobalFactory.DuckTypedFactory: TioDuckTypedFactoryRef;
begin
  Result := TioDuckTypedFactory;
end;

class function TioGlobalFactory.LazyLoadFactory: TioLazyLoadFactoryRef;
begin
  Result := TioLazyLoadFactory;
end;

class function TioGlobalFactory.LiveBindingsFactory: TioLiveBindingsFactoryRef;
begin
  Result := TioLiveBindingsFactory;
end;

class function TioGlobalFactory.MVVMFactory: TioMVVMFactoryRef;
begin
  Result := TioMVVMFactory;
end;

class function TioGlobalFactory.ObjectMakerFactory: TioObjectMakerFactoryRef;
begin
  Result := TioObjectMakerFactory;
end;

class function TioGlobalFactory.RttiFactory: TioRttiContextFactoryRef;
begin
  Result := TioRttiContextFactory;
end;

class function TioGlobalFactory.Strategy: TioStrategyFactoryRef;
begin
  Result := TioStrategyFactory;
end;

class function TioGlobalFactory.WhereFactory: TioWhereFactoryRef;
begin
  Result := TioWhereFactory;
end;

end.

















