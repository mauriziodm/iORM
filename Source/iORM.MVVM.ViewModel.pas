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
  iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.Interfaces, iORM.CommonTypes,
  iORM.StdActions.Interfaces;

type

  TioViewModel = class;

  TioVMOnViewPairingEvent = procedure(const Sender: TioViewModel) of object;

  TioViewModel = class(TioInterfacedDataModule, IInterface, IioViewModel, IioViewModelInternal) // NB: Esplicito l'implementazione di IInterface altrimenti ci sono problemi
  private
    FVMActionContainer: IioVMActionContainer;
    FViewRegister: IioViewRegisterMVVM;
    FLocalVCProviderRegister: IioLocalVCProviderRegister;
    FOnCloseQuery: TCloseQueryEvent;
    FOnViewPairing: TioVMOnViewPairingEvent;
    procedure DoOnViewPairing;
    procedure BindView(const AView: TComponent);
  protected
    procedure Loaded; override;
    function _CanClose: Boolean;
    function _BSCloseQueryAssigned: Boolean;
    function _GetBSCloseQuery: IioBSCloseQueryAction;
    // DefaultPresenter
    function GetDefaultPresenter: IioNotifiableBindSource;
    // Presenter
    function GetPresenter(const AName: String): IioNotifiableBindSource;
    // VMAction
    function GetVMAction(const AName: String): IioVMAction;
    // ViewRegister
    function ViewRegister: IioViewRegisterMVVM;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function VMActions: IioVMActionContainer;
    function CloseQuery: Boolean; virtual;
    procedure Close;
    procedure Hide;
    procedure Show;
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
    property OnCloseQuery: TCloseQueryEvent read FOnCloseQuery write FOnCloseQuery;
    property OnViewPairing: TioVMOnViewPairingEvent read FOnViewPairing write FOnViewPairing;
  end;

implementation

uses
  iORM, iORM.Exceptions, iORM.MVVM.Factory;

procedure TioViewModel.BindView(const AView: TComponent);
begin
  FVMActionContainer.BindView(AView);
  FLocalVCProviderRegister.BindView(AView);
  // NB: Mauri 04/12/2022: Se a questo punto la nuova vista non è ancora registrata nel ViewRegister (es: MainForm di alcuni esempi)
  //      allora provvede a registrarla ora. Ho aggiunto questo perchè per far funzionare correttamente le BSCloseQueryActions avevo bisogno
  //      che tutte le viste fossero registrate, anche quelle che non sono state create dal DIC o che cmq non venivano registrate.
  //      Normalmente le viste infatti venivano registrate solo nel metodo TioDependencyInjectionLocator._Get ora anche qui se necessario.
  FViewRegister.AddOrUpdate(AView, nil, nil, nil);
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

procedure TioViewModel.Hide;
begin
  FViewRegister.HideAllViewContexts;
end;

procedure TioViewModel.Loaded;
begin
  inherited;
  // Load all VMActions
  if not (csDesigning in ComponentState) then
    FVMActionContainer._InternalLoadVMActions(Self);
end;

procedure TioViewModel.RegisterVCProvider(const AVCProvider: TioViewContextProvider);
begin
  FLocalVCProviderRegister.RegisterVCProvider(AVCProvider);
end;

procedure TioViewModel.Show;
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

function TioViewModel.ViewRegister: IioViewRegisterMVVM;
begin
  Result := FViewRegister;
end;

function TioViewModel.VMActions: IioVMActionContainer;
begin
  Result := FVMActionContainer;
end;

function TioViewModel._BSCloseQueryAssigned: Boolean;
begin
  Result := Assigned(FVMActionContainer.BSCloseQueryAction);
end;

function TioViewModel._CanClose: Boolean;
begin
  if FVMActionContainer.BSCloseQueryActionExists then
    Result := FVMActionContainer.BSCloseQueryAction._CanClose
  else
    Result := True;
end;

function TioViewModel._GetBSCloseQuery: IioBSCloseQueryAction;
begin
  Result := FVMActionContainer.BSCloseQueryAction;
end;

constructor TioViewModel.Create(AOwner: TComponent);
begin
   FVMActionContainer := TioMVVMFactory.NewVMActionContainer(Self); // NOTE: IT MUST BE BEFORE INHERITED
   FLocalVCProviderRegister := TioMVVMFactory.NewLocalVCProviderRegister;
   inherited;
   FViewRegister := TioMVVMFactory.NewViewRegisterMVVM;
end;

destructor TioViewModel.Destroy;
begin

  inherited;
end;

procedure TioViewModel.DoOnViewPairing;
begin
  if Assigned(FOnViewPairing) then
    FOnViewPairing(Self);
end;

procedure TioViewModel.Close;
begin
  if CloseQuery then
    FViewRegister.ReleaseAllViewContexts;
end;

function TioViewModel.CloseQuery: Boolean;
begin
  Result := True;
  if Assigned(FOnCloseQuery) then
    FOnCloseQuery(Self, Result);
end;

end.
