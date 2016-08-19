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



unit iORM.DuckTyped.Interfaces;

interface

uses
  System.Classes;

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
    function Count: Integer;
    function GetEnumerator: IEnumerator;
    function GetItem(Index: Integer): TObject;
    function GetGenericTypeName: String;
    // OwnsObjects property
    procedure SetOwnsObjects(AValue:Boolean);
    function GetOwnsObjects: Boolean;
    property OwnsObjects:Boolean read GetOwnsObjects write SetOwnsObjects;
  end;

implementation

end.
