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
  System.Classes, iORM.MVVM.Interfaces;

type

  TioViewContextProviderScope = (psGlobal, psLocal);

  TioOnRequestViewContextEvent = procedure(const AView:TComponent; out ResultViewContext:TComponent) of object;
  TioOnReleaseViewContextEvent = procedure(const AView, AViewContext:TComponent) of object;

  TioViewContextProvider = class(TComponent, IioContainedViewContextProvider)
  private
    FScope: TioViewContextProviderScope;
    FRegisterAsActive: Boolean;
    FOnRequest: TioOnRequestViewContextEvent;
    FOnRelease: TioOnReleaseViewContextEvent;
    FAutoParent: Boolean;
    FAutoOwner: Boolean;
    function GetRegisterAsActive: Boolean;
    procedure SetRegisterAsActive(const Value: Boolean);
    procedure DoOnRequest(const AView:TComponent; out ResultViewContext:TComponent);
    procedure DoOnRelease(const AView, AViewContext:TComponent);
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function ExtractViewContext(const AView:TComponent; const ARaiseExceptionIfViewContextNotExist:Boolean=True): TComponent;
    function NewViewContext(const AView:TComponent): TComponent;
    procedure ReleaseViewContext(const AView:TComponent);
  published
    // Events
    property ioOnRequest:TioOnRequestViewContextEvent read FOnRequest write FOnRequest;
    property ioOnRelease:TioOnReleaseViewContextEvent read FOnRelease write FOnRelease;
    // Properties
    property Scope:TioViewContextProviderScope read FScope write FScope;
    property RegisterAsActive:Boolean read GetRegisterAsActive write SetRegisterAsActive;
    property AutoParent:Boolean read FAutoParent write FAutoParent;
    property AutoOwner:Boolean read FAutoOwner write FAutoOwner;
  end;

implementation

uses
  {$IFDEF ioVCL}
    Vcl.Controls,
  {$ELSE}
    Fmx.Controls,
  {$ENDIF}
  iORM.Exceptions,
  iORM.MVVM.ViewContextContainer,
  iORM.MVVM.ViewContextProviderContainer;

{ TioViewContextProvider }

constructor TioViewContextProvider.Create(AOwner: TComponent);
begin
  inherited;
  // Default values at design time
  if (csDesigning in ComponentState) then
  begin
    FScope := TioViewContextProviderScope.psGlobal;
    FRegisterAsActive := True;
    FAutoParent := True;
    FAutoOwner := True;
  end;
end;

destructor TioViewContextProvider.Destroy;
begin
  TioViewContextProviderContainer.UnregisterProvider(Self);
  inherited;
end;

procedure TioViewContextProvider.DoOnRelease(const AView,
  AViewContext: TComponent);
begin
  if Assigned(FOnRelease) then
    FOnRelease(AView, AViewContext);
end;

procedure TioViewContextProvider.DoOnRequest(const AView: TComponent;
  out ResultViewContext: TComponent);
begin
  if Assigned(FOnRequest) then
    FOnRequest(AView, ResultViewContext);
end;

class function TioViewContextProvider.ExtractViewContext(
  const AView: TComponent; const ARaiseExceptionIfViewContextNotExist:Boolean): TComponent;
begin
  Result := nil;
  if ARaiseExceptionIfViewContextNotExist and not AView.HasParent then
    raise EioException.Create(Self.ClassName + '.ReleaseViewContext: The view has no parent component.');
  Result := AView.GetParentComponent
end;

function TioViewContextProvider.GetRegisterAsActive: Boolean;
begin
  Result := FRegisterAsActive;
end;

function TioViewContextProvider.NewViewContext(const AView: TComponent): TComponent;
begin
  Result := nil;
  // Event handler call
  DoOnRequest(AView, Result);
  // Set the ViewContext as owner of the view
  if FAutoOwner then
  begin
    if Assigned(AView.Owner) then
      AView.Owner.RemoveComponent(AView);
    Result.InsertComponent(AView);
  end;
  // Set the ViewContext as parent view
  if FAutoParent then
    (AView as TControl).Parent := Result as TControl;
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

procedure TioViewContextProvider.SetRegisterAsActive(const Value: Boolean);
begin
  FRegisterAsActive := Value;
end;

end.
