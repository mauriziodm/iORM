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





unit iORM.MVVM.Components.ViewContextProvider;

interface

uses
  System.Classes;

type

  TioRequestViewContextEvent = procedure(const Sender:TObject; out ResultViewContext:TComponent) of object;
  TioViewContextEvent = procedure(const Sender:TObject; const AView, AViewContext:TComponent) of object;

  TioViewContextProvider = class(TComponent)
  private
    // Fields
    FRegisterAsDefault: Boolean;
    // Events
    FOnAfterRelease: TNotifyEvent;
    FOnAfterRequest: TioViewContextEvent;
    FOnBeforeRequest: TNotifyEvent;
    FOnBeforeRelease: TioViewContextEvent;
    FOnRelease: TioViewContextEvent;
    FOnRequest: TioRequestViewContextEvent;
    // Methods
    function GetRegisterAsDefault: Boolean;
    procedure SetRegisterAsDefault(const Value: Boolean);
    procedure DoOnAfterRelease;
    procedure DoOnBeforeRequest;
    procedure DoOnBeforeRelease(const AView, AViewContext:TComponent);
    procedure DoOnRelease(const AView, AViewContext:TComponent);
    procedure DoOnRequest(out ResultViewContext:TComponent);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoOnAfterRequest(const AView, AViewContext:TComponent);
    function NewViewContext: TComponent;
    procedure ReleaseViewContext(const AView, AViewContext:TComponent);
    function IsDefault: Boolean;
    procedure SetAsDefault;
  published
    // Events
    property OnAfterRelease:TNotifyEvent read FOnAfterRelease write FOnAfterRelease;
    property OnAfterRequest:TioViewContextEvent read FOnAfterRequest write FOnAfterRequest;
    property OnBeforeRequest:TNotifyEvent read FOnBeforeRequest write FOnBeforeRequest;
    property OnBeforeRelease:TioViewContextEvent read FOnBeforeRelease write FOnBeforeRelease;
    property OnRelease:TioViewContextEvent read FOnRelease write FOnRelease;
    property OnRequest:TioRequestViewContextEvent read FOnRequest write FOnRequest;
    // Properties
    property RegisterAsDefault:Boolean read GetRegisterAsDefault write SetRegisterAsDefault;
  end;

implementation

uses
  iORM.Exceptions,
  iORM.MVVM.ViewContextProviderContainer, iORM.Rtti.Utilities;

{ TioViewContextProvider }

constructor TioViewContextProvider.Create(AOwner: TComponent);
begin
  inherited;
  // Default values at design time
  if (csDesigning in ComponentState) then
    FRegisterAsDefault := True;
end;

destructor TioViewContextProvider.Destroy;
begin
  TioViewContextProviderContainer.UnregisterProvider(Self);
  inherited;
end;

procedure TioViewContextProvider.DoOnAfterRelease;
begin
  if Assigned(FOnAfterRelease) then
    FOnAfterRelease(Self);
end;

procedure TioViewContextProvider.DoOnAfterRequest(const AView,
  AViewContext: TComponent);
begin
  if Assigned(FOnAfterRequest) then
    FOnAfterRequest(Self, AView, AViewContext);
end;

procedure TioViewContextProvider.DoOnBeforeRelease(const AView,
  AViewContext: TComponent);
begin
  if Assigned(FOnBeforeRelease) then
    FOnBeforeRelease(Self, AView, AViewContext);
end;

procedure TioViewContextProvider.DoOnBeforeRequest;
begin
  if Assigned(FOnBeforeRequest) then
    FOnBeforeRequest(Self);
end;

procedure TioViewContextProvider.DoOnRelease(const AView,
  AViewContext: TComponent);
begin
  if Assigned(FOnRelease) then
    FOnRelease(Self, AView, AViewContext);
end;

procedure TioViewContextProvider.DoOnRequest(out ResultViewContext: TComponent);
begin
  if Assigned(FOnRequest) then
    FOnRequest(Self, ResultViewContext);
end;

function TioViewContextProvider.IsDefault: Boolean;
begin
  Result := TioRttiUtilities.SameObject(Self, TioViewContextProviderContainer.GetProvider);
end;

function TioViewContextProvider.GetRegisterAsDefault: Boolean;
begin
  Result := FRegisterAsDefault;
end;

function TioViewContextProvider.NewViewContext: TComponent;
begin
  Result := nil;
  DoOnBeforeRequest;
  DoOnRequest(Result);
  // DoOnAfterRequest is called from inside the TioDependencyInjectionLocator._Get method
end;

procedure TioViewContextProvider.Loaded;
begin
  inherited;
  // Register the provider into the container
  if not (csDesigning in ComponentState)
  then
    TioViewContextProviderContainer.RegisterProvider(Self);
end;

procedure TioViewContextProvider.ReleaseViewContext(const AView, AViewContext: TComponent);
begin
  // Event handler call
  // NB: Not fire some event handlers if the ViewContext es already
  //      being destroyed
  if not (csDestroying in AViewContext.ComponentState) then
  begin
    DoOnBeforeRelease(AView, AViewContext);
    DoOnRelease(AView, AViewContext);
  end;
  DoOnAfterRelease;
end;

procedure TioViewContextProvider.SetAsDefault;
begin
  TioViewContextProviderContainer.SetActiveProvider(Self);
end;

procedure TioViewContextProvider.SetRegisterAsDefault(const Value: Boolean);
var
  I: Integer;
  LPrevDef: TioViewContextProvider;
begin
  FRegisterAsDefault := Value;
  // Uncheck previous default
  if Value then
  begin
    for I := 0 to Owner.ComponentCount-1 do
    begin
      if (Owner.Components[I] is TioViewContextProvider) and (Owner.Components[I] <> Self) then
      begin
        LPrevDef := TioViewContextProvider(Owner.Components[I]);
        LPrevDef.RegisterAsDefault := False;
      end;
    end;
  end;
end;

end.
