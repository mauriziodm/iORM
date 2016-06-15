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



unit iORM.Context.Table.Interfaces;

interface

uses
  iORM.Interfaces, iORM.Attributes, iORM.CommonTypes,
  System.Generics.Collections, System.Rtti;

type

  IioGroupBy = interface
    ['{E57CDC09-3D2B-432B-9114-B7CCB1EDCCA3}']
    function GetSql(const ASelfClassName: String): String;
  end;

  IioJoinItem = interface(IioSqlItem)
    ['{93E0B456-6BD1-464C-BDA7-FF1F014F6B76}']
    function GetJoinType: TioJoinType;
    function GetJoinClassRef: TioClassRef;
    function GetJoinCondition: String;
  end;

  IioJoins = interface
    ['{8BAACD49-D42C-4278-97AA-EAE00A5EEA52}']
    procedure Add(AJoinItem:IioJoinItem);
    function GetSql(const ASelfClassName: String): String;
  end;

  IioClassFromField = interface
    ['{D15A9A28-FB90-4753-BE4A-7484A834CD2D}']
    function GetSqlFieldName: string;
    function GetSqlParamName: String;
    function GetValue: String;
    function GetSqlValue: string;
    function GetClassName: String;
    function GetQualifiedClassName: String;
    function QualifiedClassNameFromClassInfoFieldValue(AValue:String): String;
  end;

  TioIndexList = TObjectList<ioIndex>;

  IioContextTable = interface(IioSqlItem)
    ['{715BFF11-0A82-4B39-B002-451854729DC2}']
    function GetClassFromField: IioClassFromField;
    function IsClassFromField: Boolean;
    function TableName: String;
    function GetKeyGenerator: String;
    function GetJoin: IioJoins;
    function GetGroupBy: IioGroupBy;
    function GetConnectionDefName: String;
    function GetMapMode: TioMapModeType;
    function GetRttiType: TRttiInstanceType;
    // IndexList
    function IndexListExists: Boolean;
    function GetIndexList(AAutoCreateIfUnassigned:Boolean): TioIndexList;
    procedure SetIndexList(AIndexList:TioIndexList);
  end;

implementation

end.
