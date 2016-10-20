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



unit iORM.DependencyInjection.Implementers;

interface

uses
  System.Rtti, iORM.CommonTypes;

type

  // Default initial property value for an implementers Item
  TioDIPropFieldOnCreateType = (itProperty, itField);
  TioDIPropFieldOnCreateValue = (ivByDependencyInjection, ivByValue);
  TioDIPropFieldOnCreate = record
    PropFieldType: TioDIPropFieldOnCreateType;
    PropFieldValue: TioDIPropFieldOnCreateValue;
    Name: String;
    Value: TValue;
    TypeName: String;
    TypeAlias: String;
  end;

  // Dependency Injection Container Implementers Item (SubContainer value)
  TioDIContainerImplementersItem = class
  public
    ClassRef: TioClassref;
    ClassName: String;
    RttiType: TRttiInstanceType;
    InterfaceGUID: TGUID;
    PropertiesOnCreate: TArray<TioDIPropFieldOnCreate>;
    DefaultConstructorMethod: String;
    DefaultConstructorMarker: String;
    DefaultConstructorParams: array of TValue;
    IsSingleton: Boolean;
  end;

implementation

end.
