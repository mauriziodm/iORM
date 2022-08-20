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



unit iORM.Context.Map.Interfaces;

interface

uses
  iORM.CommonTypes, iORM.Context.Table.Interfaces,
  iORM.Context.Properties.Interfaces, System.Rtti,
  iORM.DependencyInjection.Implementers;

const
  //  Note: TCVM stands for  "True Class Virtual Map"
  TRUECLASS_VIRTUALMAP_NAME_PREFIX = '<TCVM>';

type

  // IioMap interface
  IioMap = interface
    ['{874979DB-BE8E-40CE-89DC-C265302D8E16}']
    function DuplicateToTrueClassMap: IioMap;
    function GetClassRef: TioClassRef;
    function GetClassName: String;
    function GetTable: IioTable;
    function GetProperties: IioProperties;
    function TrueClass: IioTrueClass;
    function RttiContext: TRttiContext;
    function RttiType: TRttiInstanceType;
    // Blob field present
    function BlobFieldExists: Boolean;
    // DIContainerImplementersItem reference
    //  NB: Non li metto perchè altrimenti ho una "Unit Circular Reference" quindi al momento
    //       risolvo in altro modo
    function GetDIContainerImplementersItem: TioDIContainerImplementersItem;
    procedure SetDIContainerImplementersItem(const AValue:TioDIContainerImplementersItem);
    /// This method return true if it's a TrueClassVirtualMap, false otherwise.
    ///  Note: I could not simply check if the private field FTrueClassVirtualMap was assigned or not because
    ///         at the point where I need this functionality it could be a nil also in the parent base class.
    function IsTrueClassVirtualMap: Boolean;
    /// Get the relative TrueClassVirtualMap mapped on the same table and connection
    function GetTrueClassVirtualMap: IioMap;
    /// This method build the part of the true class virtual map related to this class
    procedure BuildTrueClassVirtualMap;
  end;

implementation

end.
