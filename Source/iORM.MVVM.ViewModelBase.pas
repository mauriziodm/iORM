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

unit iORM.MVVM.ViewModelBase;

interface

{$I ioGlobalDef.inc}   // io global definitions

uses
  System.Classes, iORM.MVVM.Interfaces, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.Interfaces, System.Rtti, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.ViewContextProvider, iORM.MVVM.ModelPresenter.Custom, System.SysUtils, iORM.Abstraction,
  iORM.Components.InterfacedDataModule;

type

  TioViewModel = class;

  TioVMOnViewPairingEvent = procedure(const Sender: TioViewModel) of object;

  TioViewModel = class(TioInterfacedDataModule, IInterface, IioViewModel, IioViewModelInternal) // NB: Esplicito l'implementazione di IInterface altrimenti ci sono problemi
  private
    { Private declarations }
    FCommands: IioCommandContainer;
    FViewRegister: IioViewRegister;
    FOnViewPairing: TioVMOnViewPairingEvent;
    procedure DoOnViewPairing;
    procedure BindView(const AView: TComponent);
    procedure RegisterView(const AView, AViewContext: TComponent; const AViewContextProvider: TioViewContextProvider; const AViewContextFreeMethod: TProc);
  protected
    // DefaultPresenter
    function GetDefaultPresenter: TioModelPresenterCustom;
    // Presenter
    function GetPresenter(const AName: String): TioModelPresenterCustom;
    // Command
    function GetCommand(const ACmdName: String): IioCommandContainerItem;
    procedure SetCommand(const ACmdName: String; const Value: IioCommandContainerItem);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function Commands: IioCommandContainer;
    procedure FreeViews;
    procedure HideViews;
    procedure ShowViews;
    procedure TerminateApplication;
    // Properties
    property Command[const ACmdName: String]: IioCommandContainerItem read GetCommand write SetCommand;
    property DefaultPresenter: TioModelPresenterCustom read GetDefaultPresenter;
    property Presenter[const AName: String]: TioModelPresenterCustom read GetPresenter;
  published
    // Events
    property OnViewPairing: TioVMOnViewPairingEvent read FOnViewPairing write FOnViewPairing;
  end;

implementation

uses iORM.Exceptions, iORM.RttiContext.Factory,
  iORM.MVVM.Factory, Data.Bind.ObjectScope,
  iORM.LiveBindings.Factory, iORM;

procedure TioViewModel.BindView(const AView: TComponent);
begin
  Commands.BindView(AView);
end;


function TioViewModel.GetCommand(const ACmdName: String): IioCommandContainerItem;
begin
  // Get the CommandItem if exist
  Result := Commands.Get(ACmdName, False);
end;

function TioViewModel.GetDefaultPresenter: TioModelPresenterCustom;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TioModelPresenterCustom) and TioModelPresenterCustom(Components[I]).AsDefault then
      Exit(TioModelPresenterCustom(Components[I]));
end;

function TioViewModel.GetPresenter(const AName: String): TioModelPresenterCustom;
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

procedure TioViewModel.RegisterView(const AView, AViewContext: TComponent; const AViewContextProvider: TioViewContextProvider;
  const AViewContextFreeMethod: TProc);
begin
  FViewRegister.Add(AView, AViewContext, AViewContextProvider, AViewContextFreeMethod);
end;

procedure TioViewModel.SetCommand(const ACmdName: String; const Value: IioCommandContainerItem);
begin
  Commands.AddOrUpdate(ACmdName, Value);
end;

procedure TioViewModel.ShowViews;
begin
  FViewRegister.ShowAllViewContexts;
end;

procedure TioViewModel.TerminateApplication;
begin
  io.TerminateApplication;
end;


function TioViewModel.Commands: IioCommandContainer;
begin
  Result := FCommands;
end;

constructor TioViewModel.Create(AOwner: TComponent);
begin
   inherited;
   // Init
   FCommands := TioMVVMFactory.NewCommandsContainer(Self);
   FViewRegister := TioMVVMFactory.NewViewRegister;
end;

procedure TioViewModel.DoOnViewPairing;
begin
  if Assigned(FOnViewPairing) then
    FOnViewPairing(Self);
end;

procedure TioViewModel.FreeViews;
begin
  FViewRegister.ReleaseAllViewContexts;
end;

end.
