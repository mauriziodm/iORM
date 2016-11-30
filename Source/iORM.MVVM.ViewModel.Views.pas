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





unit iORM.MVVM.ViewModel.Views;

interface

uses
  System.Classes, System.Generics.Collections, iORM.CommonTypes,
  iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider;

type

  TioVMViews = class(TInterfacedObject, IioVMViews)
  private
    FInternalContainer: TioVMViewsInternalContainer;
    FLastViewID: Byte;
  public
    constructor Create;
    destructor Destroy; override;
    function RegisterView(const AView:TComponent): Byte;
    procedure UnregisterView(const AViewID:Byte);
    procedure ReleaseViewContext(const AViewID:Byte);
    procedure ReleaseAllViewContexts;
    function FindVCProvider(const AName:String=''): TioViewContextProvider;
    function _InternalContainer: TioVMViewsInternalContainer;
  end;

implementation

uses
  iORM, iORM.MVVM.ViewContextContainer, System.SysUtils;

{ TioVMViews }

constructor TioVMViews.Create;
begin
  inherited;
  FInternalContainer := TioVMViewsInternalContainer.Create;
  FLastViewID := 0;
end;

destructor TioVMViews.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioVMViews.FindVCProvider(
  const AName: String): TioViewContextProvider;
var
  LView, LComponent: TComponent;
begin
  // Init
  Result := nil;
  // Loop for all views
  for LView in FInternalContainer.Values do
    // Loop for all owned component of the view
    for LComponent in LView do
      if (LComponent is TioViewContextProvider)
      and (   AName.IsEmpty or (LComponent.Name = AName)   )
      then
        Exit(TioViewContextProvider(LComponent));
end;

function TioVMViews._InternalContainer: TioVMViewsInternalContainer;
begin
  Result := FInternalContainer;
end;

function TioVMViews.RegisterView(const AView: TComponent): Byte;
begin
  Inc(FLastViewID);
  FInternalContainer.Add(FLastViewID, AView);
  Result := FLastViewID;
end;

procedure TioVMViews.ReleaseAllViewContexts;
var
  LViewID: Byte;
begin
  for LViewID in FInternalContainer.Keys do
    Self.ReleaseViewContext(LViewID);
end;

procedure TioVMViews.ReleaseViewContext(const AViewID:Byte);
var
  LView: TComponent;
begin
  LView := FInternalContainer.Items[AViewID];
  TioViewContextContainer.ReleaseViewContext(LView);
end;

procedure TioVMViews.UnregisterView(const AViewID:Byte);
begin
  FInternalContainer.Remove(AViewID);
end;

end.
