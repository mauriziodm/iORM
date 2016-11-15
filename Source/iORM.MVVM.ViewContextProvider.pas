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
begin
  FRegisterAsDefault := Value;
end;

end.
