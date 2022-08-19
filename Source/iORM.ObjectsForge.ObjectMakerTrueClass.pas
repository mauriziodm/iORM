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



unit iORM.ObjectsForge.ObjectMakerTrueClass;

interface

uses
  iORM.ObjectsForge.Interfaces,
  iORM.Context.Interfaces,
  iORM.DB.Interfaces;

type

  // Standard Object Maker
  TioObjectMakerTrueClass = class(TioObjectMakerIntf)
  public
    class function MakeObject(const AContext:IioContext; const AQuery:IioQuery): TObject; override;
  end;

implementation

uses
  System.Rtti, iORM.Exceptions, iORM, System.SysUtils,
  iORM.RttiContext.Factory;

{ TioObjectMakerTrueClass }

class function TioObjectMakerTrueClass.MakeObject(const AContext: IioContext; const AQuery: IioQuery): TObject;
var
  LRttiInstanceType: TRttiInstanceType;
  LClassName: String;
begin
  // Get full qualified class name
  LClassName := AQuery.ExtractTrueClassName(AContext);
  // Get rtti class type for classref
  LRttiInstanceType := TioRttiFactory.GetRttiContext.FindType(LClassName) as TRttiInstanceType;
  if not Assigned(LRttiInstanceType) then
    raise EioException.Create(Self.ClassName + ': RttiType not found (' + LClassName + ')');
  // Load object
  Result := io.Load(LRttiInstanceType.MetaclassType).ByID(AQuery.GetValue(AContext.GetProperties.GetIdProperty, AContext).AsInteger)
                                           .SetDetailsContainer(AContext.Where.Details)  // Copy the details from the Where  of the Context
                                           .DisableTrueClass
                                           ._ToObjectInternalByClassOnly(AContext.DataObject);
end;

end.




