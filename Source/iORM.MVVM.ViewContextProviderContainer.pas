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
  iORM.CommonTypes, System.Generics.Collections, iORM.MVVM.Components.ViewContextProvider;

type

  // Contiene l'elenco di tutti providers registrati in ordine di registrazione
  //  il primo registrato è il primo elemento e l'ultimo... è l'ultimo.
  TioViewContextProviderContainerInternal = TList<TioViewContextProvider>;

  // Lo stack contiene la sequenza di attivazione dei providers che sono stati
  //  attivi (cioè che sono stati default), in pratica serve per gestire la sequenza
  //  temporale dei providers di default
  TioActiveViewContextProviderStack = TStack<TioViewContextProvider>;

  TioViewContextProviderContainer = class
  private
    class var FInternalContainer: TioViewContextProviderContainerInternal;
    class var FInternalActiveStack: TioActiveViewContextProviderStack;
    class procedure Build; static;
    class procedure CleanUp; static;
    class procedure CheckActiveProviderAfterUnregister(const AUnregisteredProvider:TioViewContextProvider); static;
    class function IsTheActiveProvider(const AProvider:TioViewContextProvider): Boolean; static;
    class function ActiveProviderIsNotRegistered: Boolean; static;
    class function ItemIndexByName(const AProviderName:String): Integer; static;
    class function IsRegistered(const AProvider:TioViewContextProvider): Boolean; static;
  public
    class procedure RegisterProvider(const AProvider:TioViewContextProvider); static;
    class procedure UnregisterProvider(const AProvider:TioViewContextProvider); static;
    class procedure SetActiveProvider(const AName:String); overload; static;
    class procedure SetActiveProvider(const AProvider:TioViewContextProvider); overload; static;
    class function GetProvider: TioViewContextProvider; overload; static;
    class function GetProvider(const AName:String): TioViewContextProvider; overload; static;
  end;

implementation

uses
  iORM, System.Classes, iORM.Exceptions, System.SysUtils;

{ TioViewContextProviderContainer }

class function TioViewContextProviderContainer.ActiveProviderIsNotRegistered: Boolean;
begin
  Result := (FInternalActiveStack.Count > 0) and not IsRegistered(FInternalActiveStack.Peek);
end;

class procedure TioViewContextProviderContainer.Build;
begin
  FInternalContainer := TioViewContextProviderContainerInternal.Create;
  FInternalActiveStack := TioActiveViewContextProviderStack.Create;
end;

class function TioViewContextProviderContainer.GetProvider: TioViewContextProvider;
begin
  // Get the active provider
  if FInternalActiveStack.Count > 0 then
    Result := FInternalActiveStack.Peek
  else
    Result := nil;
end;

class procedure TioViewContextProviderContainer.CheckActiveProviderAfterUnregister(
  const AUnregisteredProvider: TioViewContextProvider);
var
  LSomeProviderExtracted: Boolean;
begin
  // Check if the top element of the ActiveProvidersStack is valid (exist in
  //  then internal list of registered providers); if not valid (not exist...)
  //  then remove it from the stack also.
  //  Make sure the new active provider is registered else remove it from the stack also
  LSomeProviderExtracted := False;
  while IsTheActiveProvider(AUnregisteredProvider) or ActiveProviderIsNotRegistered do
  begin
    FInternalActiveStack.Extract;
    LSomeProviderExtracted := True;
  end;
  if LSomeProviderExtracted then
    FInternalActiveStack.TrimExcess;
end;

class procedure TioViewContextProviderContainer.CleanUp;
begin
  FInternalContainer.Free;
  FInternalActiveStack.Free;
end;

class function TioViewContextProviderContainer.GetProvider(
  const AName: String): TioViewContextProvider;
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

class function TioViewContextProviderContainer.IsRegistered(
  const AProvider: TioViewContextProvider): Boolean;
begin
  Result := FInternalContainer.Contains(AProvider);
end;

class function TioViewContextProviderContainer.IsTheActiveProvider(
  const AProvider: TioViewContextProvider): Boolean;
begin
  Result := (FInternalActiveStack.Count > 0) and (FInternalActiveStack.Peek = AProvider);
end;

class function TioViewContextProviderContainer.ItemIndexByName(
  const AProviderName: String): Integer;
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

class procedure TioViewContextProviderContainer.RegisterProvider(
  const AProvider: TioViewContextProvider);
begin
  // Register the provider into the collection of providers (append)
  FInternalContainer.Add(AProvider);
  // If the RegisterAsDefault property of the provider is set to True then set
  //  the provider as the new default provider
  if AProvider.RegisterAsDefault then
    FInternalActiveStack.Push(AProvider);
end;

class procedure TioViewContextProviderContainer.SetActiveProvider(
  const AProvider: TioViewContextProvider);
begin
  // The provider must be registered
  if not IsRegistered(AProvider) then
    raise EioException.Create(Format('TioViewContextProviderContainer.SetActiveProvider: Provider not registered (%s).', [AProvider.Name]));
  // Activate the provider nly if the provider is not already the active provider
  if not IsTheActiveProvider(AProvider) then
    FInternalActiveStack.Push(AProvider);
end;

class procedure TioViewContextProviderContainer.SetActiveProvider(
  const AName: String);
var
  LItemIndex: Integer;
begin
  // Get the current ItemIndex
  LItemIndex := ItemIndexByName(AName);
  if LItemIndex = -1 then
    raise EioException.Create(Format('TioViewContextProviderContainer.SetActiveProvider: Provider not registered (%s).', [AName]));
  // Activate the provider
  SetActiveProvider(FInternalContainer.Items[LItemIndex]);
end;

class procedure TioViewContextProviderContainer.UnregisterProvider(
  const AProvider: TioViewContextProvider);
begin
  // Remove the provider from the internal list
  FInternalContainer.Remove(AProvider);
  CheckActiveProviderAfterUnregister(AProvider);
end;

initialization

  TioViewContextProviderContainer.Build;

finalization

  TioViewContextProviderContainer.CleanUp;

end.
