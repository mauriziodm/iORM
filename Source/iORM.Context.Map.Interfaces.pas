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



unit iORM.Context.Map.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.Context.Table.Interfaces,
  iORM.Context.Properties.Interfaces, System.Rtti,
  iORM.DependencyInjection.Implementers;

type

  // IioMap interface
  IioMap = interface
    ['{874979DB-BE8E-40CE-89DC-C265302D8E16}']
    function GetClassRef: TioClassRef;
    function GetClassName: String;
    function GetTable: IioContextTable;
    function GetProperties: IioContextProperties;
    function ClassFromField: IioClassFromField;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    // ObjStatusExist
    function ObjStatusExist: Boolean;
    // Blob field present
    function BlobFieldExists: Boolean;
    // Reference to a map of the ancestor if the ancestor itself is mapped (is an entity)
    function AncestorMap: Iiomap;
    // True if the class has a mapped ancestor (the ancestor is even an entity)
    function HasMappedAncestor: Boolean;
    // DIContainerImplementersItem reference
    //  NB: Non li metto perchè altrimenti ho una "Unit Circular Reference" quindi al momento
    //       risolvo in altro modo
    function GetDIContainerImplementersItem: TioDIContainerImplementersItem;
    procedure SetDIContainerImplementersItem(const AValue:TioDIContainerImplementersItem);
  end;

implementation

end.
