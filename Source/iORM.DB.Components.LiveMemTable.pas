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




unit iORM.DB.Components.LiveMemTable;

interface

uses
  FireDAC.Comp.Client, Data.Bind.ObjectScope, iORM.CommonTypes, System.Classes,
  iORM.LiveBindings.Notification, iORM.LiveBindings.Interfaces;

type

  TioLiveMemTable = class (TFDMemTable)
  private
    FInternalAdapter: TBindSourceAdapter;
    FioTypeName: String;
    FioTypeAlias: String;
    FioAutoLoadData: Boolean;
    FioAsync: Boolean;
    FioAutoPersist: Boolean;
    FioViewDataType: TioViewDataType;
    FioMasterLiveMemTable: TioLiveMemTable;
    FioMasterPropertyName: String;
    FioWhereStr: TStrings;
    FioWhereDetailsFromDetailAdapters: Boolean;
    FioOrderBy: String;
    FioAutoRefreshOnNotification: TioAutoRefreshType;
    FioVM_Interface, FioVM_Alias, FioVM_Marker: String;
    FioMasterVM_Interface, FioMasterVM_Alias: String;
    FioVM_UseBSPropsOnCreate: Boolean;
//    FioViewModel: IioViewModel;
    FonNotify: TioBSANotificationEvent;
//    FOnNeedViewModel: TioNeedViewModelEvent;

    // Events
    FOnCreateAdapter: TCreateAdapterEvent;
  protected
    procedure DoCreateAdapter(var ADataObject: TBindSourceAdapter);
  public
  end;

implementation

{ TioLiveMemTable }

procedure TioLiveMemTable.DoCreateAdapter(var ADataObject: TBindSourceAdapter);
begin

end;

end.
