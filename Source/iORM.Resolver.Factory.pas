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



unit iORM.Resolver.Factory;

interface

uses
  iORM.Resolver.Interfaces;

type

  TioResolverFactory = class
  public
    class function GetResolvedTypeList: IioResolvedTypeList;
    class function GetResolver(const AResolverMode:TioResolverStrategy): TioResolverRef;
  end;

implementation

uses
  iORM.Containers.List, iORM.Resolver.ByDependencyInjection, iORM.Exceptions;

{ TioResolverFactory }

class function TioResolverFactory.GetResolvedTypeList: IioResolvedTypeList;
begin
  Result := TioInterfacedList<String>.Create;
end;

class function TioResolverFactory.GetResolver(const AResolverMode: TioResolverStrategy): TioResolverRef;
begin
  case AResolverMode of
    rsByDependencyInjection: Result := TioResolverByDependencyInjection;
    rsByRtti: EioException.Create(Self.ClassName + ': "rtByRtti" resolver mode not yet implemented.');
    rsByMaps: EioException.Create(Self.ClassName + ': "rtByMaps" resolver mode not yet implemented.');
  end;
end;

end.
