{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.Global.Factory;

interface

uses
  iORM.Context.Factory, iORM.DB.DBCreator.Factory, iORM.DB.Factory,
  iORM.DuckTyped.Factory, iORM.LazyLoad.Factory,
  iORM.LiveBindings.Factory, iORM.ObjectsForge.Factory,
  iORM.RttiContext.Factory, iORM.MVVM.Factory, iORM.Containers.Factory,
  iORM.Where.Factory, iORM.Strategy.Interfaces, iORM.Strategy.Factory;

Type

  TioContextFactoryRef = class of TioContextFactory;
  TioDBCreatorFactoryRef = class of TioDBCreatorFactory;
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
    class function DBCreatorFactory: TioDBCreatorFactoryRef;
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


{ TioGlobalFactory }

class function TioGlobalFactory.ContainersFactory: TioContainersFactoryRef;
begin
  Result := TioContainersFactory;
end;

class function TioGlobalFactory.ContextFactory: TioContextFactoryRef;
begin
  Result := TioContextFactory;
end;

class function TioGlobalFactory.DBCreatorFactory: TioDBCreatorFactoryRef;
begin
  Result := TioDBCreatorFactory;
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
















