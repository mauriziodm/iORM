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





unit iORM.MVVM.ViewContextContainer;

interface

uses
  iORM.CommonTypes, System.Generics.Collections, system.Classes,
  iORM, iORM.MVVM.Components.ViewContextProvider;

type

  // Key = ViewContext; Value = ViewContextProvider
  TioViewContextContainerInternal = TDictionary<TComponent,TioViewContextProvider>;

  TioViewContextContainer = class
  private
    class var FInternalContainer: TioViewContextContainerInternal;
    class procedure Build; static;
    class procedure CleanUp; static;
  public
    class function NewViewContext(const AViewContextProvider:TioViewContextProvider): TComponent; static;
    class procedure ReleaseViewContext(const AView:TComponent); static;
  end;

implementation

uses
{$IFDEF ioVCL}
  Vcl.Controls,
{$ENDIF}
{$IFDEF ioFMX}
  Fmx.Types,
  Fmx.Controls,
{$ENDIF}
  iORM.Exceptions, iORM.MVVM.ViewContextProviderContainer;

{ TioViewContextContainer }

class procedure TioViewContextContainer.Build;
begin
  FInternalContainer := TioViewContextContainerInternal.Create;
end;

class procedure TioViewContextContainer.CleanUp;
begin
  FInternalContainer.Free;
end;

class function TioViewContextContainer.NewViewContext(
  const AViewContextProvider: TioViewContextProvider): TComponent;
begin
  Result := nil;
  if not Assigned(AViewContextProvider) then
    EioException.Create('TioViewContextContainer.GetViewContext: Invalid provider.');
  // Get the ViewContext for the form and register it into the ViewContextContainer
  Result := AViewContextProvider.NewViewContext;
  FInternalContainer.Add(Result, AViewContextProvider);
end;

class procedure TioViewContextContainer.ReleaseViewContext(const AView: TComponent);
var
  LViewContext: TComponent;
  LViewContextProvider: TioViewContextProvider;
begin
  // Get the ViewContext
  LViewContext := TioViewContextProvider.ExtractViewContext(AView, False);
  // Get the ViewContextProvider that generated the ViewContext and
  //  remove it from the container
  LViewContextProvider := FInternalContainer.Items[LViewContext];
  FInternalContainer.Remove(LViewContext);
  // Call the Releas method of the ViewContextProvider
  LViewContextProvider.ReleaseViewContext(AView);
end;

initialization

  TioViewContextContainer.Build;

finalization

  TioViewContextContainer.CleanUp;

end.
