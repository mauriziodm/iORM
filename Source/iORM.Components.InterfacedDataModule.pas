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


{NB: This unit is based on code published by Jeroen Wiert Pluimers in his
     blog "The Viert Corner" (https://wiert.me/2009/08/10/delphi-using-fastmm4-part-2-tdatamodule-descendants- exposing-interfaces-or-the-introduction-of-a-tinterfaceddatamodule /).
     The only change I had to make was in the "_AddRef" and "_Release" methods,
     in my variant if we are at design time in practice it disables the reference
     counting (which therefore works only at runtime) because otherwise I could
     not make it work well the wizard that creates new ViewModels.
     Thanks Jeroen.}

unit iORM.Components.InterfacedDataModule;

interface

uses
  SysUtils, Classes;

type

  TioInterfacedDataModule = class(TDataModule, IInterface, IInterfaceComponentReference)
  protected
    FOwnerIsComponent: Boolean;
    FRefCount: Integer;
  protected
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    class function NewInstance: TObject; override;
    property OwnerIsComponent: Boolean read FOwnerIsComponent;
    property RefCount: Integer read FRefCount;
  end;

implementation

uses
  Windows;

{ TInterfacedDataModule }

procedure TioInterfacedDataModule.AfterConstruction;
begin
  FOwnerIsComponent := Assigned(Owner) and (Owner is TComponent);
  // Release the NewInstance/constructor's implicit refcount
  InterlockedDecrement(FRefCount);
  inherited AfterConstruction;
end;

procedure TioInterfacedDataModule.BeforeDestruction;
{$ifdef DEBUG}
var
  WarningMessage: string;
{$endif DEBUG}
begin
  if (RefCount <> 0) then
  begin
    if not OwnerIsComponent then
      System.Error(reInvalidPtr)
{$ifdef DEBUG}
    else
    begin
      WarningMessage := Format(
        'Trying to destroy an Owned TInterfacedDataModule of class %s named %s that still has %d interface references left',
        [ClassName, Name, RefCount]);
      OutputDebugString(PChar(WarningMessage));
    end;
{$endif DEBUG}
  end;
  inherited BeforeDestruction;
end;

constructor TioInterfacedDataModule.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TioInterfacedDataModule.Destroy;
begin
  Destroying; // make everyone release references they have towards us
  if FOwnerIsComponent and (FRefCount > 1) then
  begin
    // perform cleanup of interface references that we refer to.
  end;
  //...
  inherited Destroy;
end;

class function TioInterfacedDataModule.NewInstance: TObject;
begin
  // Set an implicit refcount so that refcounting
  // during construction won't destroy the object.
  Result := inherited NewInstance;
  TioInterfacedDataModule(Result).FRefCount := 1;
end;

function TioInterfacedDataModule._AddRef: Integer;
begin
  if csDesigning in ComponentState then
    Result := -1   // -1 indicates no reference counting is taking place
  else
    Result := InterlockedIncrement(FRefCount);
end;

function TioInterfacedDataModule._Release: Integer;
begin
  if csDesigning in ComponentState then
    Result := -1   // -1 indicates no reference counting is taking place
  else
  begin
    Result := InterlockedDecrement(FRefCount);
    { If we are not being used as a TComponent, then use refcount to manage our lifetime as with TInterfacedObject. }
    if (Result = 0) and not FOwnerIsComponent then
      Destroy;
  end;
end;

end.
