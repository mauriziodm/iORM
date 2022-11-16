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





unit iORM.MVVM.ViewContextProviderContainer;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, iORM.MVVM.ViewContextProvider,
  iORM.MVVM.Interfaces;

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
    function ItemIndexByName(const AProviderName:String): Integer;
  strict protected
    function IsRegistered(const AProvider:TioViewContextProvider): Boolean;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure RegisterProvider(const AProvider:TioViewContextProvider); virtual;
    procedure UnregisterProvider(const AProvider:TioViewContextProvider); virtual;
    function ProviderByName(const AName:String): TioViewContextProvider; overload;
  end;

  TioGlobalVCProviderRegister = class(TioLocalVCProviderRegister, IioGlobalVCProviderRegister)
  private
    class var FInstance: IioGlobalVCProviderRegister;
  strict private
    FInternalActiveStack: TioActiveViewContextProviderStack;
    procedure CheckActiveProviderAfterUnregister(const AUnregisteredProvider:TioViewContextProvider);
    function IsDefaultProvider(const AProvider:TioViewContextProvider): Boolean;
    function DefaultProviderIsNotRegistered: Boolean;
  public
    class function GetInstance: IioGlobalVCProviderRegister;
    constructor Create; override;
    destructor Destroy; override;
    procedure RegisterProvider(const AProvider:TioViewContextProvider); override;
    procedure UnregisterProvider(const AProvider:TioViewContextProvider); override;
    procedure SetDefaultProvider(const AProvider:TioViewContextProvider);
    procedure SetDefaultProviderByName(const AName:String);
    function DefaultProvider: TioViewContextProvider;
  end;

implementation

uses
  iORM, System.Classes, iORM.Exceptions, System.SysUtils;

{ TioViewContextProviderRegister }

constructor TioLocalVCProviderRegister.Create;
begin
  FInternalContainer := TioViewContextProviderContainerInternal.Create;
end;

destructor TioLocalVCProviderRegister.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioLocalVCProviderRegister.IsRegistered(const AProvider: TioViewContextProvider): Boolean;
begin
  Result := FInternalContainer.Contains(AProvider);
end;

function TioLocalVCProviderRegister.ItemIndexByName(const AProviderName: String): Integer;
var
  I : Integer;
begin
  Result := -1;
  // NB: Cerca in sequenza inversa in modo che, se esistono dei providers con lo
  //      stesso nome (es. viste ricorsive) ritorni sempre quello registrato
  //      più di recente.
  for I := FInternalContainer.Count-1 downto 0 do
    if (FInternalContainer.Items[I] as TComponent).Name = AProviderName then
      Exit(I);
end;

function TioLocalVCProviderRegister.ProviderByName(const AName: String): TioViewContextProvider;
var
  LItemIndex: Integer;
begin
  Result := nil;
  // Get the Index
  LItemIndex := ItemIndexByName(AName);
  // Set the result value
  if LItemIndex > -1 then
    Result := FInternalContainer.Items[LItemIndex];
end;

procedure TioLocalVCProviderRegister.RegisterProvider(const AProvider: TioViewContextProvider);
begin
  FInternalContainer.Add(AProvider);
end;

procedure TioLocalVCProviderRegister.UnregisterProvider(const AProvider: TioViewContextProvider);
begin
  FInternalContainer.Remove(AProvider);
end;

{ TioGlobalVCProviderRegister }

procedure TioGlobalVCProviderRegister.CheckActiveProviderAfterUnregister(const AUnregisteredProvider: TioViewContextProvider);
var
  LSomeProviderExtracted: Boolean;
begin
  // Check if the top element of the ActiveProvidersStack is valid (exist in
  //  then internal list of registered providers); if not valid (not exist...)
  //  then remove it from the stack also.
  //  Make sure the new active provider is registered else remove it from the stack also
  LSomeProviderExtracted := False;
  while IsDefaultProvider(AUnregisteredProvider) or DefaultProviderIsNotRegistered do
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

function TioGlobalVCProviderRegister.DefaultProvider: TioViewContextProvider;
begin
  // Get the active provider
  if FInternalActiveStack.Count > 0 then
    Result := FInternalActiveStack.Peek
  else
    Result := nil;
end;

function TioGlobalVCProviderRegister.DefaultProviderIsNotRegistered: Boolean;
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

function TioGlobalVCProviderRegister.IsDefaultProvider(const AProvider: TioViewContextProvider): Boolean;
begin
  Result := (FInternalActiveStack.Count > 0) and (FInternalActiveStack.Peek = AProvider);
end;

procedure TioGlobalVCProviderRegister.RegisterProvider(const AProvider: TioViewContextProvider);
begin
  inherited;
  // If the RegisterAsDefault property of the provider is set to True then set
  //  the provider as the new default provider
  if AProvider.RegisterAsDefault then
    FInternalActiveStack.Push(AProvider);
end;

procedure TioGlobalVCProviderRegister.SetDefaultProvider(const AProvider: TioViewContextProvider);
begin
  // The provider must be registered
  if not IsRegistered(AProvider) then
    raise EioException.Create(Format('TioGlobalVCProviderRegister.SetDefaultProvider: Provider not registered (%s).', [AProvider.Name]));
  // Activate the provider nly if the provider is not already the active provider
  if not IsDefaultProvider(AProvider) then
    FInternalActiveStack.Push(AProvider);
end;

procedure TioGlobalVCProviderRegister.SetDefaultProviderByName(const AName: String);
begin
  SetDefaultProvider(ProviderByName(AName));
end;

procedure TioGlobalVCProviderRegister.UnregisterProvider(const AProvider: TioViewContextProvider);
begin
  inherited;
  CheckActiveProviderAfterUnregister(AProvider);
end;

end.
