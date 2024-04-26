{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.MVVM.ViewContextProviderContainer;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, iORM.MVVM.ViewContextProvider,
  iORM.MVVM.Interfaces, System.Classes;

type

  // Contiene l'elenco di tutti providers registrati in ordine di registrazione
  //  il primo registrato è il primo elemento e l'ultimo... è l'ultimo.
  TioViewContextProviderContainerInternal = TList<TioViewContextProvider>;

  // Lo stack contiene la sequenza di attivazione dei providers che sono stati
  //  attivi (cioè che sono stati default), in pratica serve per gestire la sequenza
  //  temporale dei providers di default
  TioActiveViewContextProviderStack = TStack<TioViewContextProvider>;

  TioLocalVCProviderRegister = class(TInterfacedObject, IioLocalVCProviderRegister)
  strict private
    FInternalContainer: TioViewContextProviderContainerInternal;
    function ItemIndexByName(const AVCProviderName:String): Integer;
  strict protected
    function IsRegistered(const AVCProvider:TioViewContextProvider): Boolean;
    procedure BindView(const AView: TComponent); virtual;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure RegisterVCProvider(const AVCProvider:TioViewContextProvider); virtual;
    procedure UnregisterVCProvider(const AVCProvider:TioViewContextProvider); virtual;
    function VCProviderByName(const AName:String): TioViewContextProvider; overload;
  end;

  TioGlobalVCProviderRegister = class(TioLocalVCProviderRegister, IioGlobalVCProviderRegister)
  private
    class var FInstance: IioGlobalVCProviderRegister;
  strict private
    FInternalActiveStack: TioActiveViewContextProviderStack;
    procedure CheckActiveVCProviderAfterUnregister(const AUnregisteredProvider:TioViewContextProvider);
    function IsDefaultVCProvider(const AVCProvider:TioViewContextProvider): Boolean;
    function DefaultVCProviderIsNotRegistered: Boolean;
  strict protected
    procedure BindView(const AView: TComponent); override;
  public
    class function GetInstance: IioGlobalVCProviderRegister;
    constructor Create; override;
    destructor Destroy; override;
    procedure RegisterVCProvider(const AVCProvider:TioViewContextProvider); override;
    procedure UnregisterVCProvider(const AVCProvider:TioViewContextProvider); override;
    procedure SetDefaultVCProvider(const AVCProvider:TioViewContextProvider);
    procedure SetDefaultVCProviderByName(const AName:String);
    function DefaultVCProvider: TioViewContextProvider;
  end;

implementation

uses
  iORM, iORM.Exceptions, System.SysUtils;

{ TioViewContextProviderRegister }

procedure TioLocalVCProviderRegister.BindView(const AView: TComponent);
var
  I: Integer;
begin
  // Bind any ViewAction to the related VMAction registered on the ViewModel
  for I := 0 to AView.ComponentCount - 1 do
    if AView.Components[i] is TioViewContextProvider then
      RegisterVCProvider(TioViewContextProvider(AView.Components[i]));
end;

constructor TioLocalVCProviderRegister.Create;
begin
  FInternalContainer := TioViewContextProviderContainerInternal.Create;
end;

destructor TioLocalVCProviderRegister.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioLocalVCProviderRegister.IsRegistered(const AVCProvider: TioViewContextProvider): Boolean;
begin
  Result := FInternalContainer.Contains(AVCProvider);
end;

function TioLocalVCProviderRegister.ItemIndexByName(const AVCProviderName: String): Integer;
var
  I : Integer;
begin
  Result := -1;
  // NB: Cerca in sequenza inversa in modo che, se esistono dei providers con lo
  //      stesso nome (es. viste ricorsive) ritorni sempre quello registrato
  //      più di recente.
  for I := FInternalContainer.Count-1 downto 0 do
    if (FInternalContainer.Items[I] as TComponent).Name = AVCProviderName then
      Exit(I);
end;

function TioLocalVCProviderRegister.VCProviderByName(const AName: String): TioViewContextProvider;
var
  LItemIndex: Integer;
begin
  // NB: Se non trova alcun pVCProvider deve ritornare nil (no exception)
  Result := nil;
  // Get the Index
  LItemIndex := ItemIndexByName(AName);
  // Set the result value
  if LItemIndex > -1 then
    Result := FInternalContainer.Items[LItemIndex];
end;

procedure TioLocalVCProviderRegister.RegisterVCProvider(const AVCProvider: TioViewContextProvider);
begin
  if not IsRegistered(AVCProvider) then
    FInternalContainer.Add(AVCProvider);
end;

procedure TioLocalVCProviderRegister.UnregisterVCProvider(const AVCProvider: TioViewContextProvider);
begin
  if IsRegistered(AVCProvider) then
    FInternalContainer.Remove(AVCProvider);
end;

{ TioGlobalVCProviderRegister }

procedure TioGlobalVCProviderRegister.BindView(const AView: TComponent);
begin
  raise EioGenericException.Create(ClassName, 'BindView', 'This method should NOT be called on this class.');
end;

procedure TioGlobalVCProviderRegister.CheckActiveVCProviderAfterUnregister(const AUnregisteredProvider: TioViewContextProvider);
var
  LSomeProviderExtracted: Boolean;
begin
  // Check if the top element of the ActiveProvidersStack is valid (exist in
  //  then internal list of registered providers); if not valid (not exist...)
  //  then remove it from the stack also.
  //  Make sure the new active provider is registered else remove it from the stack also
  LSomeProviderExtracted := False;
  while IsDefaultVCProvider(AUnregisteredProvider) or DefaultVCProviderIsNotRegistered do
  begin
    FInternalActiveStack.Extract;
    LSomeProviderExtracted := True;
  end;
  if LSomeProviderExtracted then
    FInternalActiveStack.TrimExcess;
end;

constructor TioGlobalVCProviderRegister.Create;
begin
  inherited;
  FInternalActiveStack := TioActiveViewContextProviderStack.Create;
end;

function TioGlobalVCProviderRegister.DefaultVCProvider: TioViewContextProvider;
begin
  // Get the active provider
  // NB: Se non trova alcun pVCProvider deve ritornare nil (no exception)
  if FInternalActiveStack.Count > 0 then
    Result := FInternalActiveStack.Peek
  else
    Result := nil;
end;

function TioGlobalVCProviderRegister.DefaultVCProviderIsNotRegistered: Boolean;
begin
  Result := (FInternalActiveStack.Count > 0) and not IsRegistered(FInternalActiveStack.Peek);
end;

destructor TioGlobalVCProviderRegister.Destroy;
begin
  FInternalActiveStack.Free;
  inherited;
end;

class function TioGlobalVCProviderRegister.GetInstance: IioGlobalVCProviderRegister;
begin
  if not Assigned(FInstance) then
    FInstance := TioGlobalVCProviderRegister.Create;
  Result := FInstance;
end;

function TioGlobalVCProviderRegister.IsDefaultVCProvider(const AVCProvider: TioViewContextProvider): Boolean;
begin
  Result := (FInternalActiveStack.Count > 0) and (FInternalActiveStack.Peek = AVCProvider);
end;

procedure TioGlobalVCProviderRegister.RegisterVCProvider(const AVCProvider: TioViewContextProvider);
begin
  inherited;
  // If the RegisterAsDefault property of the provider is set to True then set
  //  the provider as the new default provider
  if AVCProvider.AsDefault then
    FInternalActiveStack.Push(AVCProvider);
end;

procedure TioGlobalVCProviderRegister.SetDefaultVCProvider(const AVCProvider: TioViewContextProvider);
begin
  // The provider must be registered
  if not IsRegistered(AVCProvider) then
    raise EioGenericException.Create(Format('TioGlobalVCProviderRegister.SetDefaultProvider: Provider not registered (%s).', [AVCProvider.Name]));
  // Activate the provider nly if the provider is not already the active provider
  if not IsDefaultVCProvider(AVCProvider) then
    FInternalActiveStack.Push(AVCProvider);
end;

procedure TioGlobalVCProviderRegister.SetDefaultVCProviderByName(const AName: String);
begin
  SetDefaultVCProvider(VCProviderByName(AName));
end;

procedure TioGlobalVCProviderRegister.UnregisterVCProvider(const AVCProvider: TioViewContextProvider);
begin
  inherited;
  CheckActiveVCProviderAfterUnregister(AVCProvider);
end;

end.
