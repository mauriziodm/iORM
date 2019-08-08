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



unit iORM.LiveBindings.CommonBSABehavior;

interface

uses
  iORM.LiveBindings.Interfaces;

type

  // Methods and functionalities common to all ActiveBindSouceAdapters
  TioCommonBSABehavior = class
  public
    // NB: Generic type for this methods must be only TObject or IInterface
    class procedure InternalSetDataObjectAsDetail<T>(const AActiveBindSourceAdapter:IioActiveBindSourceAdapter; const ADataObject:T); overload;
  end;

implementation

uses
  iORM.Context.Properties.Interfaces, System.Rtti, iORM.Context.Factory;


{ TioCommonBSABehavior }

class procedure TioCommonBSABehavior.InternalSetDataObjectAsDetail<T>(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  const ADataObject: T);
var
  LMasterObj: TObject;
  LMasterProperty: IioContextProperty;
  LValue: TValue;
begin
  LMasterObj := AActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current;
  LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName(LMasterObj.ClassType, AActiveBindSourceAdapter.GetMasterPropertyName);
  TValue.Make(@ADataObject, LMasterProperty.GetTypeInfo, LValue);
  LMasterProperty.SetValue(LMasterObj, LValue);
  AActiveBindSourceAdapter.GetMasterBindSourceAdapter.DetailAdaptersContainer.SetMasterObject(LMasterObj);
end;

end.
