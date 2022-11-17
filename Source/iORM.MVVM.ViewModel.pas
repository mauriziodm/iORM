{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.MVVM.ViewModel;

interface

{$I ioGlobalDef.inc}   // io global definitions

uses
  System.Classes, System.SysUtils, iORM.MVVM.Interfaces, iORM.MVVM.VMActionContainer, iORM.Components.InterfacedDataModule, iORM.MVVM.ViewContextProvider,
  iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.Interfaces;

type

  TioViewModel = class;

  TioVMOnViewPairingEvent = procedure(const Sender: TioViewModel) of object;

  TioViewModel = class(TioInterfacedDataModule, IInterface, IioViewModel, IioViewModelInternal) // NB: Esplicito l'implementazione di IInterface altrimenti ci sono problemi
  private
    FVMActionContainer: IioVMActionContainer;
    FViewRegister: IioViewRegisterMVVM;
    FLocalVCProviderRegister: IioLocalVCProviderRegister;
    FOnViewPairing: TioVMOnViewPairingEvent;
    procedure DoOnViewPairing;
    procedure BindView(const AView: TComponent);
    procedure RegisterView(const AView, AViewContext: TComponent; const AViewContextProvider: TioViewContextProvider; const AViewContextFreeMethod: TProc);
  protected
    procedure Loaded; override;
    // DefaultPresenter
    function GetDefaultPresenter: IioNotifiableBindSource;
    // Presenter
    function GetPresenter(const AName: String): IioNotifiableBindSource;
    // VMAction
    function GetVMAction(const AName: String): IioVMAction;
  public
    constructor Create(AOwner: TComponent); override;
    function VMActions: IioVMActionContainer;
    procedure CloseViews;
    procedure HideViews;
    procedure ShowViews;
    procedure TerminateApplication;
    // VCProvider local register
    function VCProviderByName(const AVCProviderName: String): TioViewContextProvider;
    procedure RegisterVCProvider(const AVCProvider:TioViewContextProvider);
    procedure UnregisterVCProvider(const AVCProvider:TioViewContextProvider);
    // Properties
    property VMAction[const AName: String]: IioVMAction read GetVMAction;
    property DefaultPresenter: IioNotifiableBindSource read GetDefaultPresenter;
    property Presenter[const AName: String]: IioNotifiableBindSource read GetPresenter;
  published
    // Events
    property OnViewPairing: TioVMOnViewPairingEvent read FOnViewPairing write FOnViewPairing;
  end;

implementation

uses
  iORM, iORM.Exceptions, iORM.MVVM.Factory;

procedure TioViewModel.BindView(const AView: TComponent);
begin
  FVMActionContainer.BindView(AView);
  FLocalVCProviderRegister.BindView(AView);
end;


function TioViewModel.GetVMAction(const AName: String): IioVMAction;
begin
  Result := FVMActionContainer.Get(AName, False);
end;

function TioViewModel.GetDefaultPresenter: IioNotifiableBindSource;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TioModelPresenterCustom) and TioModelPresenterCustom(Components[I]).AsDefault then
      Exit(TioModelPresenterCustom(Components[I]));
end;

function TioViewModel.GetPresenter(const AName: String): IioNotifiableBindSource;
var
  LComponent: TComponent;
begin
  // If the ANAme param is empty then return de default presenter
  if AName.IsEmpty then
    Exit(GetDefaultPresenter);
  LComponent := FindComponent(AName);
  if not(Assigned(LComponent) and (LComponent is TioModelPresenterCustom)) then
    raise EioException.Create(Self.ClassName, 'GetPresenters', Format('ModelPresenter named "%s" not found.', [AName]));
  Result := TioModelPresenterCustom(LComponent);
end;

procedure TioViewModel.HideViews;
begin
  FViewRegister.HideAllViewContexts;
end;

procedure TioViewModel.Loaded;
begin
  inherited;
  // Load all VMActions
//  FVMActionContainer._InternalLoadVMActions(Self);
end;

procedure TioViewModel.RegisterVCProvider(const AVCProvider: TioViewContextProvider);
begin
  FLocalVCProviderRegister.RegisterVCProvider(AVCProvider);
end;

procedure TioViewModel.RegisterView(const AView, AViewContext: TComponent; const AViewContextProvider: TioViewContextProvider;
  const AViewContextFreeMethod: TProc);
begin
  FViewRegister.Add(AView, AViewContext, AViewContextProvider, AViewContextFreeMethod);
end;

procedure TioViewModel.ShowViews;
begin
  FViewRegister.ShowAllViewContexts;
end;

procedure TioViewModel.TerminateApplication;
begin
  io.TerminateApplication;
end;


procedure TioViewModel.UnregisterVCProvider(const AVCProvider: TioViewContextProvider);
begin
  FLocalVCProviderRegister.UnregisterVCProvider(AVCProvider);
end;

function TioViewModel.VCProviderByName(const AVCProviderName: String): TioViewContextProvider;
begin
  Result := FLocalVCProviderRegister.VCProviderByName(AVCProviderName);
end;

function TioViewModel.VMActions: IioVMActionContainer;
begin
  Result := FVMActionContainer;
end;

constructor TioViewModel.Create(AOwner: TComponent);
begin
   FVMActionContainer := TioMVVMFactory.NewVMActionContainer(Self); // NOTE: IT MUST BE BEFORE INHERITED
   FLocalVCProviderRegister := TioMVVMFactory.NewLocalVCProviderRegister;
   inherited;
   FViewRegister := TioMVVMFactory.NewViewRegisterMVVM;
end;

procedure TioViewModel.DoOnViewPairing;
begin
  if Assigned(FOnViewPairing) then
    FOnViewPairing(Self);
end;

procedure TioViewModel.CloseViews;
begin
  FViewRegister.ReleaseAllViewContexts;
end;

end.
