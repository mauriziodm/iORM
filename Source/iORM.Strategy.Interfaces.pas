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



unit iORM.Strategy.Interfaces;

interface

uses
  iORM.Context.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Where.Interfaces;

type

  // Strategy class reference
  TioStrategyRef = class of TioStrategyIntf;

  // Base class for strategy (Static class as an interface)
  TioStrategyIntf = class abstract
  public
    class procedure StartTransaction(const AConnectionName:String); virtual; abstract;
    class procedure CommitTransaction(const AConnectionName:String); virtual; abstract;
    class procedure RollbackTransaction(const AConnectionName:String); virtual; abstract;
    class procedure PersistObject(const AObj: TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); virtual; abstract;
    class procedure PersistCollection(const ACollection:TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); virtual; abstract;
    class procedure DeleteObject(const AObj: TObject; const AConnectionName:String); virtual; abstract;
    class procedure Delete(const AWhere: IioWhere); virtual; abstract;
    class procedure LoadList(const AWhere: IioWhere; const AList:TObject); virtual; abstract;
    class function LoadObject(const AWhere: IioWhere; const AObj:TObject): TObject; virtual; abstract;
  end;

implementation

end.
