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





unit iORM.MVVM.ViewContextProvider;

interface

uses
  System.Classes;

type

  TioViewContextProviderScope = (psGlobal, psLocal);

  TioRequestViewContextEvent = procedure(const Sender:TObject; const AView:TComponent; out ResultViewContext:TComponent) of object;
  TioViewContextEvent = procedure(const Sender:TObject; const AView, AViewContext:TComponent) of object;

  TioViewContextProvider = class(TComponent)
  private
    FScope: TioViewContextProviderScope;
    FRegisterAsDefault: Boolean;
    FOnRequest: TioRequestViewContextEvent;
    FOnAfterRequest: TioViewContextEvent;
    FOnRelease: TioViewContextEvent;
    FAutoParent: Boolean;
    FAutoOwner: Boolean;
    function GetRegisterAsDefault: Boolean;
    procedure SetRegisterAsDefault(const Value: Boolean);
    procedure DoOnRequest(const AView:TComponent; out ResultViewContext:TComponent);
    procedure DoOnAfterRequest(const AView, AViewContext:TComponent);
    procedure DoOnRelease(const AView, AViewContext:TComponent);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function ExtractViewContext(const AView:TComponent; const ARaiseExceptionIfViewContextNotExist:Boolean=True): TComponent;
    function NewViewContext(const AView:TComponent): TComponent;
    procedure ReleaseViewContext(const AView:TComponent);
    function IsDefault: Boolean;
    procedure SetAsDefault;
  published
    // Events
    property ioOnRequest:TioRequestViewContextEvent read FOnRequest write FOnRequest;
    property ioOnAfterRequest:TioViewContextEvent read FOnAfterRequest write FOnAfterRequest;
    property ioOnRelease:TioViewContextEvent read FOnRelease write FOnRelease;
    // Properties
    property Scope:TioViewContextProviderScope read FScope write FScope;
    property RegisterAsDefault:Boolean read GetRegisterAsDefault write SetRegisterAsDefault;
    property AutoParent:Boolean read FAutoParent write FAutoParent;
    property AutoOwner:Boolean read FAutoOwner write FAutoOwner;
  end;

implementation

uses
  {$IFDEF ioVCL}
    Vcl.Controls,
  {$ELSE}
    Fmx.Types,
    Fmx.Controls,
  {$ENDIF}
  iORM.Exceptions,
  iORM.MVVM.ViewContextContainer,
  iORM.MVVM.ViewContextProviderContainer, iORM.Rtti.Utilities;

{ TioViewContextProvider }

constructor TioViewContextProvider.Create(AOwner: TComponent);
begin
  inherited;
  // Default values at design time
  if (csDesigning in ComponentState) then
  begin
    FScope := TioViewContextProviderScope.psGlobal;
    FRegisterAsDefault := True;
    FAutoParent := True;
    FAutoOwner := True;
  end;
end;

destructor TioViewContextProvider.Destroy;
begin
  TioViewContextProviderContainer.UnregisterProvider(Self);
  inherited;
end;

procedure TioViewContextProvider.DoOnAfterRequest(const AView,
  AViewContext: TComponent);
begin
  if Assigned(FOnAfterRequest) then
    FOnAfterRequest(Self, AView, AViewContext);
end;

procedure TioViewContextProvider.DoOnRelease(const AView,
  AViewContext: TComponent);
begin
  if Assigned(FOnRelease) then
    FOnRelease(Self, AView, AViewContext);
end;

procedure TioViewContextProvider.DoOnRequest(const AView: TComponent;
  out ResultViewContext: TComponent);
begin
  if Assigned(FOnRequest) then
    FOnRequest(Self, AView, ResultViewContext);
end;

class function TioViewContextProvider.ExtractViewContext(
  const AView: TComponent; const ARaiseExceptionIfViewContextNotExist:Boolean): TComponent;
begin
  Result := nil;
  if ARaiseExceptionIfViewContextNotExist and not AView.HasParent then
    raise EioException.Create(Self.ClassName + '.ReleaseViewContext: The view has no parent component.');
  Result := AView.GetParentComponent
end;

function TioViewContextProvider.IsDefault: Boolean;
begin
  Result := TioRttiUtilities.SameObject(Self, TioViewContextProviderContainer.GetProvider);
end;

function TioViewContextProvider.GetRegisterAsDefault: Boolean;
begin
  Result := FRegisterAsDefault;
end;

function TioViewContextProvider.NewViewContext(const AView: TComponent): TComponent;
begin
  Result := nil;
  // Event handler call
  DoOnRequest(AView, Result);
  // Set the ViewContext as owner of the view
  if FAutoOwner then
    Result.InsertComponent(AView);
  // Set the ViewContext as parent view
  if FAutoParent then
  {$IFDEF ioVCL}
    (AView as TControl).Parent := (Result as TControl);
  {$ELSE}
    (AView as TFmxObject).Parent := (Result as TFmxObject);
  {$ENDIF}
  // Event handler call
  DoOnAfterRequest(AView, Result);
end;

procedure TioViewContextProvider.Loaded;
begin
  inherited;
  // Register the provider into the container
  if FScope = TioViewContextProviderScope.psGlobal then
    TioViewContextProviderContainer.RegisterProvider(Self);
end;

procedure TioViewContextProvider.ReleaseViewContext(const AView: TComponent);
var
  LViewContext: TComponent;
begin
  // Extract the ViewContext from the View
  LViewContext := ExtractViewContext(AView);
  // Event handler call
  DoOnRelease(AView, LViewContext);
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
