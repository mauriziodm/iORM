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

unit iORM.LiveBindings.Interfaces;

interface

uses
  System.Generics.Collections, Data.Bind.ObjectScope,
  iORM.Context.Properties.Interfaces, iORM.CommonTypes, System.Classes,
  iORM.Where.Interfaces, Data.DB, System.Rtti, iORM.LiveBindings.Notification,
  iORM.LiveBindings.CommonBSAPaging;

type

  // Events handler types
  TioBSABeforeAfterSelectionObjectEvent = procedure(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType) of object;
  TioBSASelectionObjectEvent = procedure(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean) of object;

  TioBSABeforeAfterSelectionInterfaceEvent = procedure(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType) of object;
  TioBSASelectionInterfaceEvent = procedure(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean)
    of object;

  // Forward declaration
  IioActiveBindSourceAdapter = interface;
  IioContainedBindSourceAdapter = interface;
  IioDetailBindSourceAdaptersContainer = interface;

  // BindSource AutoRefresh type after notification
  TioAutoRefreshType = (arDisabled, arEnabledNoReload, arEnabledReload);

  // Interface (without RefCount) for ioBindSources detection
  // (useful for detect iORM bind sources to pass itself
  // to the ActiveBindSourceAdapter for notify changes)
  IioNotifiable = interface
    ['{D08E956F-C836-4E2A-B966-62FFFB7FD09F}']
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
  end;

  IioNotifiableBindSource = interface(IioNotifiable)
    ['{2DFC1B43-4AE2-4402-89B3-7A134938EFE6}']
    function AdapterExists: Boolean;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function IsMasterBS: boolean;
    function IsDetailBS: boolean;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True);
    // Selectors related event for TObject selection
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    // Paging
    procedure SetPaging(const Value: TioCommonBSAPageManager);
    function GetPaging: TioCommonBSAPageManager;
    property Paging: TioCommonBSAPageManager read GetPaging write SetPaging;
    // AutoRefreshOnotification property
    function GetAutoRefreshOnNotification: TioAutoRefreshType;
    procedure SetAutoRefreshOnNotification(const Value: TioAutoRefreshType);
    property AutoRefreshOnNotification: TioAutoRefreshType read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification;
    // BindSourceAdapter state
    function GetState: TBindSourceAdapterState;
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
  end;

  // Interface for standard action target bind source
  IioStdActionTargetBindSource = interface
    ['{6E442DF5-154E-4253-9AFB-E5CCFDF32209}']
    function IsActive: Boolean;
  end;

  // The common ancestor for all PrototypeBindSource components
  TioBaseBindSource = TBaseObjectBindSource;

  IioBSAToDataSetLinkContainer = interface
    ['{DD47B60C-2265-4B5A-955E-155A7664D33B}']
    procedure Disable;
    procedure Enable;
    procedure RegisterDataSet(const ADataSet: TDataSet);
    procedure UnregisterDataSet(const ADataSet: TDataSet);
    procedure Refresh(const AForce: Boolean = False);
    procedure SetRecNo(const ARecNo: Integer);
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
    // procedure Persist(ReloadData:Boolean=False);
    procedure PersistCurrent;
    procedure PersistAll;
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True);
    procedure LoadPage;
    procedure SetBindSource(ANotifiableBindSource: IioNotifiableBindSource);
    function GetBindSource: IioNotifiableBindSource;
    function HasBindSource: boolean;
    procedure Insert; overload;
    procedure Insert(AObject: TObject); overload;
    procedure Insert(AObject: IInterface); overload;
    procedure Append; overload;
    procedure Append(AObject: TObject); overload;
    procedure Append(AObject: IInterface); overload;
    procedure Delete;
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
    procedure Cancel;
    procedure SetObjStatus(AObjStatus: TioObjStatus);
    function UseObjStatus: Boolean;
    function NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere): IioActiveBindSourceAdapter;
    function NewNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
    function GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function MasterAdaptersContainer:IioDetailBindSourceAdaptersContainer;
    function DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    function DataObject: TObject;
    // procedure InternalSetDataObject(const ADataObject:TObject; const AOwnsObject:Boolean=True); overload;
    // procedure InternalSetDataObject(const ADataObject:IInterface; const AOwnsObject:Boolean=False); overload;
    procedure InternalSetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean); overload;
    procedure InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean); overload;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    procedure ClearDataObject;
    procedure ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType); overload;
    procedure ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType); overload;
    function GetCurrentOID: Integer;
    function HasMasterBSA: Boolean;
    function IsInterfaceBSA: Boolean;
    function AsTBindSourceAdapter: TBindSourceAdapter;
    function GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    function GetMasterPropertyName: String;
    function GetBaseObjectClassName: String;
    function FindField(const AMemberName: string): TBindSourceAdapterField;
    // TypeName
    procedure SetTypeName(const AValue: String);
    function GetTypeName: String;
    // TypeAlias
    procedure SetTypeAlias(const AValue: String);
    function GetTypeAlias: String;
    // AutoLoadData
    procedure SetAutoLoadData(const Value: Boolean);
    function GetAutoLoadData: Boolean;
    // Current property
    function GetCurrent: TObject;
    // Async property
    procedure SetIoAsync(const Value: Boolean);
    function GetIoAsync: Boolean;
    // AutoPost property
    procedure SetioAutoPost(const Value: Boolean);
    function GetioAutoPost: Boolean;
    // WhereStr property
    procedure SetIoWhere(const Value: IioWhere);
    function GetioWhere: IioWhere;
    // ioWhereDetailsFromDetailAdapters property
    function GetioWhereDetailsFromDetailAdapters: Boolean;
    procedure SetioWhereDetailsFromDetailAdapters(const Value: Boolean);
    // ioViewDataType
    function GetIoViewDataType: TioViewDataType;
    // ioOwnsObjects
    function GetOwnsObjects: Boolean;
    // State
    function GetState: TBindSourceAdapterState;
    // EOF
    function GetEOF: Boolean;
    // BOF
    function GetBOF: Boolean;
    // ItemCount
    function GetCount: Integer;
    // ItemIndex
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    // Items
    function GetItems(const AIndex: Integer): TObject;
    procedure SetItems(const AIndex: Integer; const Value: TObject);
    // Fields
    function GetFields: TList<TBindSourceAdapterField>;
    // Active
    procedure SetActive(Value: Boolean);
    function GetActive: Boolean;
    // Refreshing
    function GetRefreshing: Boolean;
    procedure SetRefreshing(const Value: Boolean);
    // CanActivate
    function GetCanActivate: Boolean;
    // BSPersistenceDeleting
    function GetBSPersistenceDeleting: Boolean;
    procedure SetBSPersistenceDeleting(const Value: Boolean);
    // Properties
    property Active: Boolean read GetActive write SetActive;
    property BOF: Boolean read GetBOF;
    property CanActivate: Boolean read GetCanActivate;
    property Current: TObject read GetCurrent;
    property EOF: Boolean read GetEOF;
    property Fields: TList<TBindSourceAdapterField> read GetFields;
    property ioAsync: Boolean read GetIoAsync write SetIoAsync;
    property ioAutoLoadData: Boolean read GetAutoLoadData write SetAutoLoadData;
    property ioAutoPost: Boolean read GetioAutoPost write SetioAutoPost;
    property ioOwnsObjects: Boolean read GetOwnsObjects;
    property ioTypeAlias: String read GetTypeAlias write SetTypeAlias;
    property ioTypeName: String read GetTypeName write SetTypeName;
    property ioWhere: IioWhere read GetioWhere write SetIoWhere;
    property ioWhereDetailsFromDetailAdapters: Boolean read GetioWhereDetailsFromDetailAdapters write SetioWhereDetailsFromDetailAdapters;
    property ioViewDataType: TioViewDataType read GetIoViewDataType;
    property ItemCount: Integer read GetCount;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property Items[const AIndex: Integer]: TObject read GetItems write SetItems;
    property Refreshing: Boolean read GetRefreshing write SetRefreshing;
    property State: TBindSourceAdapterState read GetState;
    property BSPersistenceDeleting: boolean read GetBSPersistenceDeleting write SetBSPersistenceDeleting;
  end;

  // Bind source adapter container
  IioDetailBindSourceAdaptersContainer = interface
    ['{B374E226-D7A9-4A44-9BB6-DF85AC283598}']
    procedure Free;
    procedure SetMasterObject(const AMasterObj: TObject);
    function NewBindSourceAdapter(const AOwner: TComponent; const AMasterClassName, AMasterPropertyName: String; const AWhere: IioWhere)
      : IioActiveBindSourceAdapter;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure RemoveBindSourceAdapter(const ABindSourceAdapter: IioContainedBindSourceAdapter);
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function FillWhereDetails(const AWhereDetailsContainer: IioWhereDetailsContainer): IioWhereDetailsContainer;
  end;

  IioContainedBindSourceAdapter = interface
    ['{66AF6AD7-9093-4526-A18C-54447FB220A3}']
    procedure Free;
    procedure SetMasterAdaptersContainer(AMasterAdapterContainer: IioDetailBindSourceAdaptersContainer);
    procedure SetMasterProperty(AMasterProperty: IioProperty);
    procedure ExtractDetailObject(AMasterObj: TObject); overload;
    function NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere): IioActiveBindSourceAdapter;
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    function GetMasterPropertyName: String;
    function AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    // WhereStr property
    function GetioWhere: IioWhere;
  end;

  IioNaturalBindSourceAdapterSource = interface
    ['{892D8DAE-96F3-48FC-925C-F3F5CD5C0F68}']
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True); overload;
    function GetCurrent: TObject;
    function UseObjStatus: Boolean;
    function NewNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
  end;

  IioNaturalActiveBindSourceAdapter = interface
    ['{9452A7CA-2C5F-43FB-BA63-DEE446B4FCC0}']
    procedure ForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
  end;

  // BindSourceAdapter List
  TioDetailAdapters = TDictionary<String, IioContainedBindSourceAdapter>;

implementation

end.
