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



unit iORM.DependencyInjection.Implementers;

interface

uses
  System.Rtti, iORM.CommonTypes;

type

  // Default initial property value for an implementers Item
  TioDIPropFieldOnCreateType = (itProperty, itField);
  TioDIPropFieldOnCreateValue = (ivByDependencyInjection, ivByValue);
  TioDIPropFieldOnCreate = record
    PropFieldType: TioDIPropFieldOnCreateType;
    PropFieldValue: TioDIPropFieldOnCreateValue;
    Name: String;
    Value: TValue;
    TypeName: String;
    TypeAlias: String;
  end;

  // Default settings creating ViewModels.Presenters
  TioDIPresenterSettingsType = (pstDataObject, pstInterfacedObj, pstMasterModelPresenter, pstWhere, pstOrderBy, pstSelectorFor);
  TioDIPresenterSettings = record
    SettingsType:TioDIPresenterSettingsType;
    Name: String;
    InterfacedObj: IInterface;
    Obj: TObject;
    StringParameter: String;
  end;
  TioDIPresenterSettingsContainer = TArray<TioDIPresenterSettings>;
  PioDIPresenterSettingsContainer = ^TioDIPresenterSettingsContainer;

  // Dependency Injection Container Implementers Item (SubContainer value)
  TioDIContainerImplementersItem = class
  private
    function GetPresenterSettingsPointer: PioDIPresenterSettingsContainer;
  public
    ClassRef: TioClassref;
    ClassName: String;
    RttiType: TRttiInstanceType;
    InterfaceGUID: TGUID;
    // Nome della classe antenata più lontana (più vicina a TObject possibile) che implementa la stessa interfaccia.
    // Questo serve a impostare correttamente la query select in modo che filtri correttamente in base anche
    //  ai vincoli di ereditarietà.
    FarAncestorClassSameInterfaceAndTableAndConnection: String;
    PropertiesOnCreate: TArray<TioDIPropFieldOnCreate>;
    DefaultConstructorMethod: String;
    DefaultConstructorMarker: String;
    DefaultConstructorParams: array of TValue;
    IsEntity: Boolean;
    IsSingleton: Boolean;
    PresenterSettings: TioDIPresenterSettingsContainer;
    property PresenterSettingsPointer:PioDIPresenterSettingsContainer read GetPresenterSettingsPointer;
  end;

implementation

{ TioDIContainerImplementersItem }

function TioDIContainerImplementersItem.GetPresenterSettingsPointer: PioDIPresenterSettingsContainer;
begin
  Result := @PresenterSettings;
end;

end.
