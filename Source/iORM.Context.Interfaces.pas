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



unit iORM.Context.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.Context.Table.Interfaces,
  iORM.Context.Properties.Interfaces, System.Rtti, iORM.Where.Interfaces,
  iORM.Context.Map.Interfaces;

type

  // Context interface
  IioContext = interface
    ['{6B512CDA-23C6-42A3-AC44-905344B019E9}']
    function GetClassRef: TioClassRef;
    function GetTable: IioContextTable;
    function GetProperties: IioContextProperties;
    function ClassFromField: IioClassFromField;
    function IsClassFromField: Boolean;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    function WhereExist: Boolean;
    function GetID: Integer;
    function IDIsNull: Boolean;
    // Map
    function Map: IioMap;
    // Blob field present
    function BlobFieldExists: Boolean;
    // DataObject
    procedure SetDataObject(const AValue: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
    // ObjStatusExist
    function ObjStatusExist: Boolean;
    // ObjectStatus
    procedure SetObjectStatus(const AValue: TioObjectStatus);
    function GetObjectStatus: TioObjectStatus;
    property ObjectStatus:TioObjectStatus read GetObjectStatus write SetObjectStatus;
    // Where
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    property Where:IioWhere read GetWhere write SetWhere;
    // GroupBy
    function GetGroupBySql: String;
    // OrderBy
    function GetOrderBySql: String;
    // Join
    function GetJoin: IioJoins;
  end;

implementation

end.
