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



unit iORM.DuckTyped.Interfaces;

interface

uses
  System.Classes, System.TypInfo;

type

  IioDuckTypedStreamObject = interface
    ['{D95AD3B5-02AC-49E6-B54E-2ECAA7D5B54B}']
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
    function IsEmpty: Boolean;
  end;

  IioDuckTypedList = interface
    ['{BD3A3AC2-A7C4-46D1-9BE6-5C32E17D871C}']
    procedure Add(AObject: TObject);
    procedure Clear;
    procedure Delete(Index: Integer);
    function Count: Integer;
    function GetEnumerator: IEnumerator;
    function GetItem(Index: Integer): TObject;
    function GetItemTypeName: String;
    function GetItemTypeInfo: PTypeInfo;
    // OwnsObjects property
    procedure SetOwnsObjects(AValue:Boolean);
    function GetOwnsObjects: Boolean;
    property OwnsObjects:Boolean read GetOwnsObjects write SetOwnsObjects;
  end;

implementation

end.

