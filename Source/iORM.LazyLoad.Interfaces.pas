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



unit iORM.LazyLoad.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.Where.Interfaces;

type

  IioLazyLoadable = interface
    ['{3DB9E89C-2010-400A-8EA8-89D12C98218B}']
    procedure SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName:String; const ARelationChildID:Integer; const ARelationChildWhere:IioWhere);
    function GetInternalObject: TObject;
  end;

  IioLazyLoader<T:class,constructor> = interface
    ['{CBF57EB9-CD85-412D-97EA-C9F46943B1B8}']
    function GetInternalObj: T;
//    procedure SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName:String; const ARelationChildID:Integer; const ARelationChildWhereStr:);
    procedure SetRelationInfo(const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName:String; const ARelationChildID:Integer; const ARelationChildWhere:IioWhere);
    // OwnsObject property
    procedure SetOwnsObjects(Value: Boolean);
    function GetOwnsObjects: Boolean;
    property OwnsObjects:Boolean read GetOwnsObjects write SetOwnsObjects;
  end;

implementation

end.
