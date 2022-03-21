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





unit iORM.Components.Common;

interface

uses
  System.Classes, iORM.Components.Common.Interfaces;

type

  TioComponentsCommon = class
  public
    class procedure RegisterConnectionDefComponents(const AOwner:TComponent); static;
    class procedure ViewModelBridgeAutosetting(const AVMBridgeClientComponent: IioVMBridgeClientComponent; const AOwner: TComponent);
  end;

implementation

uses
  iORM.DB.ConnectionDef, System.SysUtils, iORM.MVVM.ViewModelBridge;

{ TioComponentsCommon }

class procedure TioComponentsCommon.RegisterConnectionDefComponents(
  const AOwner: TComponent);
var
  I: Integer;
  LConnectionDef: TioCustomConnectionDef;
begin
  // Loop for Owner's components
  for I := 0 to AOwner.ComponentCount-1 do
  begin
    // If the current component is a ConnectionDef then register it
    //  if not already registered.
    if AOwner.Components[I] is TioCustomConnectionDef then
    begin
      LConnectionDef := TioCustomConnectionDef(AOwner.Components[I]);
      if not LConnectionDef.IsRegistered then
        LConnectionDef.RegisterConnectionDef;
    end;
  end;
end;

class procedure TioComponentsCommon.ViewModelBridgeAutosetting(const AVMBridgeClientComponent: IioVMBridgeClientComponent; const AOwner: TComponent);
var
  I: Integer;
  procedure AutoCreateViewModelBridgeIfNotExist;
  var
    LVMBridge: TioViewModelBridge;
    LNewDesignInfo:LongRec;
  begin
    LVMBridge := TioViewModelBridge.Create(AOwner);
    LVMBridge.Name := 'ioViewModelBridge1';
    // Set position at design time
    LNewDesignInfo.Hi := Word(50);
    LNewDesignInfo.Lo := Word(50);
    LVMBridge.DesignInfo := Int32(LNewDesignInfo);
    // Call the ViewModelBridgeAutosetting again
    ViewModelBridgeAutosetting(AVMBridgeClientComponent, AOwner);
  end;
begin
  // Loop for Owner's components
  for I := 0 to AOwner.ComponentCount-1 do
    // If the current component is a ConnectionDef then register it
    //  if not already registered.
    if AOwner.Components[I] is TioViewModelBridge then
    begin
      AVMBridgeClientComponent.ViewModelBridge := TioViewModelBridge(AOwner.Components[I]);
      Exit;
    end;
  // If a ViewModelBridge does not exist then create it automatically
  if not (csLoading in AOwner.ComponentState) then
    AutoCreateViewModelBridgeIfNotExist;
end;

end.
