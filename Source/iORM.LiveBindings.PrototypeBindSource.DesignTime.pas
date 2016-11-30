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





unit iORM.LiveBindings.PrototypeBindSource.DesignTime;

interface

uses
  DesignEditors, DesignIntf, System.Classes;

type

  TioBindSourceMasterPropertyEditor = class(TComponentProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
//    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure Register;

implementation

uses
  iORM.LiveBindings.PrototypeBindSource, Data.Bind.ObjectScope,
  System.Rtti, iORM.RttiContext.Factory, iORM.Exceptions,
  iORM.Context.Properties.Interfaces, iORM.Context.Factory,
  iORM.Context.Interfaces, iORM.Attributes;

  procedure Register;
  begin
    RegisterComponents('iORM', [TioPrototypeBindSource]);
//    RegisterPropertyEditor(TypeInfo(String), TioPrototypeBindSource, 'ioMasterPropertyName', TioBindSourceMasterPropertyEditor);
  end;

{ TioBindSourceMasterPropertyEditor }

function TioBindSourceMasterPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paValueList,paSortList] - [paMultiSelect];
end;

//procedure TioBindSourceMasterPropertyEditor.GetValues(Proc: TGetStrProc);
//var
//  AMasterBindSource: TioPrototypeBindSource;
//  ADetailBindSource: TioPrototypeBindSource;
//  Ctx: TRttiContext;
//  Typ: TRttiType;
//  AContext: IioContext;
//  AProperty: IioContextProperty;
//begin
//  // Get the current BindSource component for which we want to set the property (detail)
//  ADetailBindSource := Self.GetComponent(0) as TioPrototypeBindSource;
//  // Get the Master BindSource (from the detail)
//  AMasterBindSource := ADetailBindSource.ioMasterBindSource as TioPrototypeBindSource;
//  // If the DetailBindSource.ioMasterBindSource property is defined...
//  if Assigned(AMasterBindSource) then
//  begin
//    Ctx := TioRttiContextFactory.RttiContext;
//    Typ := Ctx.FindType(AMasterBindSource.ioClassName);
//    if not Assigned(Typ) then raise EioException.Create(Self.ClassName + ': RttiType not found.');
//    if not Typ.IsInstance then raise EioException.Create(Self.ClassName + ': RttiType is not a RttiInstanceType.');
//    AContext := TioContextFactory.Context(Typ.AsInstance.MetaclassType.ClassName);
//    for AProperty in AContext.GetProperties do
//    begin
//      if AProperty.GetRelationType = ioRTNone then Continue;
//      Proc(AProperty.GetName);
//    end;
//  end else inherited GetValues(Proc);
//end;

end.
