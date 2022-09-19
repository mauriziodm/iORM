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



unit iORM.DependencyInjection.ViewModelShuttleContainer;

interface

uses
  System.Generics.Collections, iORM.MVVM.Interfaces, System.SyncObjs;

type

  // Define the ViewModel shuttle container instance types
  TioViewModelShuttleContainerKey = String;
  TioViewModelShuttleContainerValue = IioViewModel;
  TioViewModelShuttleContainerInstance = TDictionary<TioViewModelShuttleContainerKey, TioViewModelShuttleContainerValue>;

  // Define the ViewModel shuttle container
  TioViewModelShuttleContainer = class
  strict private
    class var FContainer: TioViewModelShuttleContainerInstance;
    class var FCriticalSection: TCriticalSection;
    class function Container: TioViewModelShuttleContainerInstance;
    class function CriticalSection: TCriticalSection;
  public
    class procedure CleanUp;
    class function GetViewModel(const AMarker: string = ''): IioViewModel;
    class procedure DeleteViewModel(const AMarker:String = '');
    class procedure AddViewModel(const AViewModel: IioViewModel; const AMarker:String = '');
  end;

implementation

uses
  iORM.Exceptions;

{ TioViewModelShuttleContainer }


class function TioViewModelShuttleContainer.CriticalSection: TCriticalSection;
begin
  if not Assigned(FCriticalSection) then
    FCriticalSection := TCriticalSection.Create;
  Result := FCriticalSection;
end;

class procedure TioViewModelShuttleContainer.DeleteViewModel(const AMarker: String);
begin
  if not Assigned(FContainer) then Exit;  // For optimization when not assigned
  Self.CriticalSection.Acquire;
  try
    Self.Container.Remove(AMarker);
  finally
    Self.CriticalSection.Release;
  end;
end;

class function TioViewModelShuttleContainer.GetViewModel(const AMarker: string = ''): IioViewModel;
begin
  Result := nil;
  if not Assigned(FContainer) then
    Exit;  // If not assigned do not enter in the critical section (optimization)
  Self.CriticalSection.Acquire;
  try
    if Self.Container.ContainsKey(AMarker) then
    begin
      Result := Self.Container.Items[AMarker];
      Self.Container.Remove(AMarker);
    end;
  finally
    Self.CriticalSection.Release;
  end;
end;

class procedure TioViewModelShuttleContainer.AddViewModel(const AViewModel: IioViewModel; const AMarker: String);
begin
  Self.CriticalSection.Acquire;
  try
    if Self.Container.ContainsKey(AMarker) then
      raise EioException.Create(Self.ClassName + ': ViewModel marker already exist!');
    Self.Container.Add(AMarker, AViewModel);
  finally
    Self.CriticalSection.Release;
  end;
end;

class procedure TioViewModelShuttleContainer.CleanUp;
begin
  if Assigned(FCriticalSection) then FCriticalSection.Free;
  if Assigned(FContainer) then FContainer.Free;
end;

class function TioViewModelShuttleContainer.Container: TioViewModelShuttleContainerInstance;
begin
  if not Assigned(FContainer) then
    FContainer := TioViewModelShuttleContainerInstance.Create;
  Result := FContainer;
end;

initialization

finalization

  TioViewModelShuttleContainer.CleanUp;

end.

