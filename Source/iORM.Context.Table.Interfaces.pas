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



unit iORM.Context.Table.Interfaces;

interface

uses
  iORM.Interfaces, iORM.Attributes, iORM.CommonTypes,
  System.Generics.Collections, System.Rtti;

type

  IioContextTable = interface;

  IioBaseTableCompanion = interface(IioSqlItem)
    ['{A0C3B8E0-CFA3-4957-A142-FA5E8C18C6B2}']
    procedure SetTable(const ATable: IioContextTable);
  end;

  IioGroupBy = interface(IioBaseTableCompanion)
    ['{E57CDC09-3D2B-432B-9114-B7CCB1EDCCA3}']
  end;

  IioJoinItem = interface
    ['{93E0B456-6BD1-464C-BDA7-FF1F014F6B76}']
    function GetSql(const AConnectionDefName: String): String;
    function GetJoinType: TioJoinType;
    function GetJoinClassRef: TioClassRef;
    function GetJoinCondition: String;
  end;

  IioJoins = interface(IioBaseTableCompanion)
    ['{8BAACD49-D42C-4278-97AA-EAE00A5EEA52}']
    procedure Add(AJoinItem:IioJoinItem);
  end;

  IioClassFromField = interface
    ['{D15A9A28-FB90-4753-BE4A-7484A834CD2D}']
    procedure SetTable(const ATable: IioContextTable);
    function GetFieldName: string;
    function GetSqlFieldName: string;
    function GetSqlParamName: String;
    function GetValue: String;
    function GetSqlValue: string;
    function GetClassName: String;
    function GetQualifiedClassName: String;
    function QualifiedClassNameFromClassInfoFieldValue(AValue:String): String;
  end;

  TioIndexList = TList<ioIndex>;

  IioContextTable = interface(IioSqlItem)
    ['{715BFF11-0A82-4B39-B002-451854729DC2}']
    function GetClassFromField: IioClassFromField;
    function IsClassFromField: Boolean;
    function TableName: String;
    function GetKeyGenerator: String;
    function GetJoin: IioJoins;
    function GetGroupBy: IioGroupBy;
    function GetConnectionDefName: String;
    function IsForThisConnection(AConnectionDefNameToCheck: String): Boolean;
    function GetMapMode: TioMapModeType;
    function GetRttiType: TRttiInstanceType;
    function GetAutoCreateDB: Boolean;
    function GetClassName: String;
    function GetQualifiedClassName: String;
    // IndexList
    function IndexListExists: Boolean;
    function GetIndexList(AAutoCreateIfUnassigned:Boolean): TioIndexList;
    procedure SetIndexList(AIndexList:TioIndexList);
  end;

implementation

end.
