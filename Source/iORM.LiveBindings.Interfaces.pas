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



unit iORM.LiveBindings.Interfaces;

interface

uses
  System.Generics.Collections, Data.Bind.ObjectScope,
  iORM.Context.Properties.Interfaces, iORM.CommonTypes, System.Classes,
  iORM.Where.Interfaces, Data.DB;

type

  // Forward declaration
  IioContainedBindSourceAdapter = interface;

  // Bind source adapters notification type
  TioBSANotificationType = (ntAfterPost, ntAfterDelete);

  // BindSource AutoRefresh type after notification
  TioAutoRefreshType = (arDisabled, arEnabledNoReload, arEnabledReload);

  // Bind source adapters notification interface
  IioBSANotification = interface
    ['{CE7FCAD1-5D60-4C5C-9BE6-7D6E36571AE3}']
    function Sender: TObject;
    function Subject: TObject;
    function NotificationType: TioBSANotificationType;
  end;

  // Interface (without RefCount) for ioBindSources detection
  //  (useful for detect iORM bind sources to pass itself
  //  to the ActiveBindSourceAdapter for notify changes)
  IioNotifiableBindSource = interface
    ['{2DFC1B43-4AE2-4402-89B3-7A134938EFE6}']
    procedure Notify(const Sender:TObject; const ANotification:IioBSANotification);
  end;

  // The common ancestor for all PrototypeBindSource components
  TioBaseBindSource = TBaseObjectBindSource;

  IioBSAToDataSetLinkContainer = interface
    ['{DD47B60C-2265-4B5A-955E-155A7664D33B}']
    procedure Disable;
    procedure Enable;
    procedure RegisterDataSet(const ADataSet:TDataSet);
    procedure UnregisterDataSet(const ADataSet:TDataSet);
    procedure Refresh(const AForce:Boolean=False);
    procedure SetRecNo(const ARecNo:Integer);
  end;

  IioActiveBindSourceAdapter = interface
    ['{F407B515-AE0B-48FD-B8C3-0D0C81774A58}']
    procedure Free;
    procedure Next;
    procedure Prior;
    procedure First;
    procedure Last;
    procedure Edit(AForce: Boolean = False);
    procedure Post;
    procedure Persist(ReloadData:Boolean=False);
    procedure Notify(Sender:TObject; ANotification:IioBSANotification);
    procedure Refresh(ReloadData:Boolean);
    procedure SetBindSource(ANotifiableBindSource:IioNotifiableBindSource);
    procedure Insert; overload;
    procedure Insert(AObject:TObject); overload;
    procedure Append; overload;
    procedure Append(AObject:TObject); overload;
    procedure Delete;
    procedure DeleteListViewItem(const AItemIndex:Integer; const ADelayMilliseconds:integer=100);
    procedure Cancel;
    function UseObjStatus: Boolean;
    function NewDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere:IioWhere): TBindSourceAdapter;
    function NewNaturalObjectBindSourceAdapter(const AOwner:TComponent): TBindSourceAdapter;
    function GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function DataObject: TObject;
    procedure SetDataObject(const AObj:TObject; const AOwnsObject:Boolean=True);
    procedure ClearDataObject;
    function GetCurrentOID: Integer;
    function IsDetail: Boolean;
//    function TypeName: String;       // Added TypeName property
//    function TypeAlias: String;      // Added TypeAlias property
    function GetMasterPropertyName: String;
    function GetBaseObjectClassName: String;
    function FindField(const AMemberName: string): TBindSourceAdapterField;
    function GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    // TypeName
    procedure SetTypeName(const AValue:String);
    function GetTypeName: String;
    property ioTypeName:String read GetTypeName write SetTypeName;
    // TypeAlias
    procedure SetTypeAlias(const AValue:String);
    function GetTypeAlias: String;
    property ioTypeAlias:String read GetTypeAlias write SetTypeAlias;
    // AutoLoadData
    procedure SetAutoLoadData(const Value: Boolean);
    function GetAutoLoadData: Boolean;
    property ioAutoLoadData:Boolean read GetAutoLoadData write SetAutoLoadData;
    // Current property
    function GetCurrent: TObject;
    property Current: TObject read GetCurrent;
    // Async property
    procedure SetIoAsync(const Value: Boolean);
    function GetIoAsync: Boolean;
    property ioAsync:Boolean read GetIoAsync write SetIoAsync;
    // AutoPersist property
    procedure SetioAutoPersist(const Value: Boolean);
    function GetioAutoPersist: Boolean;
    property ioAutoPersist:Boolean read GetioAutoPersist write SetioAutoPersist;
    // WhereStr property
    procedure SetIoWhere(const Value: IioWhere);
    function GetioWhere: IioWhere;
    property ioWhere:IioWhere read GetIoWhere write SetIoWhere;
    // ioWhereDetailsFromDetailAdapters property
    function GetioWhereDetailsFromDetailAdapters: Boolean;
    procedure SetioWhereDetailsFromDetailAdapters(const Value: Boolean);
    property ioWhereDetailsFromDetailAdapters: Boolean read GetioWhereDetailsFromDetailAdapters write SetioWhereDetailsFromDetailAdapters;
    // ioViewDataType
    function GetIoViewDataType: TioViewDataType;
    property ioViewDataType:TioViewDataType read GetIoViewDataType;
    // ioOwnsObjects
    function GetOwnsObjects: Boolean;
    property ioOwnsObjects:Boolean read GetOwnsObjects;
    // State
    function GetState: TBindSourceAdapterState;
    property State: TBindSourceAdapterState read GetState;
    // EOF
    function GetEOF: Boolean;
    property Eof: Boolean read GetEOF;
    // BOF
    function GetBOF: Boolean;
    property BOF: Boolean read GetBOF;
    // ItemCount
    function GetCount: Integer;
    property ItemCount: Integer read GetCount;
    // ItemIndex
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    property ItemIndex:Integer read GetItemIndex write SetItemIndex;
    // Items
    function GetItems(const AIndex: Integer): TObject;
    procedure SetItems(const AIndex: Integer; const Value: TObject);
    property Items[const AIndex:Integer]:TObject read GetItems write SetItems;
    // Fields
    function GetFields: TList<TBindSourceAdapterField>;
    property Fields: TList<TBindSourceAdapterField> read GetFields;
  end;

  // Bind source adapter container
  IioDetailBindSourceAdaptersContainer = interface
    ['{B374E226-D7A9-4A44-9BB6-DF85AC283598}']
    procedure Free;
    procedure SetMasterObject(const AMasterObj: TObject);
    function NewBindSourceAdapter(const AOwner: TComponent; const AMasterClassName, AMasterPropertyName: String; const AWhere:IioWhere): TBindSourceAdapter;
    procedure Notify(const Sender:TObject; const ANotification:IioBSANotification);
    procedure RemoveBindSourceAdapter(const ABindSourceAdapter: IioContainedBindSourceAdapter);
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetBindSourceAdapterByMasterPropertyName(const AMasterPropertyName:String): IioActiveBindSourceAdapter;
    function FillWhereDetails(const AWhereDetailsContainer: IioWhereDetailsContainer): IioWhereDetailsContainer;
  end;

  IioContainedBindSourceAdapter = interface
    ['{66AF6AD7-9093-4526-A18C-54447FB220A3}']
    procedure Free;
    procedure SetMasterAdapterContainer(AMasterAdapterContainer:IioDetailBindSourceAdaptersContainer);
    procedure SetMasterProperty(AMasterProperty: IioContextProperty);
    procedure ExtractDetailObject(AMasterObj: TObject); overload;
    function NewDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere:IioWhere): TBindSourceAdapter;
    procedure Notify(Sender:TObject; ANotification:IioBSANotification);
    function GetMasterPropertyName: String;
    // WhereStr property
    function GetioWhere: IioWhere;
  end;

  IioNaturalBindSourceAdapterSource = interface
    ['{892D8DAE-96F3-48FC-925C-F3F5CD5C0F68}']
    procedure Notify(Sender:TObject; ANotification:IioBSANotification);
    procedure Refresh(ReloadData:Boolean); overload;
    function GetCurrent: TObject;
    function UseObjStatus: Boolean;
    function NewNaturalObjectBindSourceAdapter(const AOwner:TComponent): TBindSourceAdapter;
  end;

  // BindSourceAdapter List
  TioDetailAdapters = TDictionary<String, IioContainedBindSourceAdapter>;

implementation

end.
