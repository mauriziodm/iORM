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
unit iORM.LiveBindings.Interfaces;

interface

uses
  System.Generics.Collections, Data.Bind.ObjectScope,
  iORM.Context.Properties.Interfaces, iORM.CommonTypes, System.Classes,
  iORM.Where.Interfaces, Data.DB, System.Rtti, iORM.LiveBindings.Notification,
  iORM.LiveBindings.CommonBSAPaging, System.SysUtils,
  iORM.StdActions.Interfaces, iORM.MVVM.ViewContextProvider;

type

  // Events handler types
  TioBSABeforeAfterSelectionObjectEvent = procedure(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType) of object;
  TioBSASelectionObjectEvent = procedure(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean) of object;

  TioBSABeforeAfterSelectionInterfaceEvent = procedure(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType) of object;
  TioBSASelectionInterfaceEvent = procedure(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean)
    of object;

  TioBSOnPersistenceConflictExceptionEvent = procedure(const ASender, ADataObject: TObject; var AConflictResolved: Boolean)
    of object;

  // Forward declaration
  IioActiveBindSourceAdapter = interface;
  IioContainedBindSourceAdapter = interface;
  IioDetailBindSourceAdaptersContainer = interface;
  IioNaturalBindSourceAdapterSource = interface;
  IioNaturalActiveBindSourceAdapter = interface;

  // Interface (without RefCount) for ioBindSources detection
  // (useful for detect iORM bind sources to pass itself
  // to the ActiveBindSourceAdapter for notify changes)
  IioNotifiable = interface
    ['{D08E956F-C836-4E2A-B966-62FFFB7FD09F}']
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
  end;

  IioBindSource = interface(IioNotifiable)
    ['{2DFC1B43-4AE2-4402-89B3-7A134938EFE6}']
    procedure Open;
    procedure Close;
    // function AdapterExists: Boolean;
    procedure First;
    procedure Next;
    function CheckAdapter: Boolean; overload;
    function CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean; overload;
    function CheckActiveAdapter: Boolean;
    function Current: TObject;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetMasterPropertyName: String;
    function IsMasterBS: Boolean;
    function IsDetailBS: Boolean;
    procedure Refresh(const ANotify: Boolean = True);
    function GetName: String;
    function IsActive: Boolean;
    function IsFromBSLoadType: Boolean;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    procedure SetMasterBindSource(const Value: IioBindSource);
    procedure SetMasterPropertyName(const Value: String);
    procedure SetWhere(const AWhere: IioWhere);
    procedure RegisterDetailBindSource(const ADetailBindSource: IioBindSource);
    procedure UnregisterDetailBindSource(const ADetailBindSource: IioBindSource);
    // Show current record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const AVVMAlias: String = ''); overload;
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show each record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AAlias: String = ''); overload;
    // ETMfor
    procedure _InternalSetETMforPrivateField(const AETMFor: IioBindSource); // To avoid hint
    // Selectors related event for TObject selection
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    // Selector related properties
    procedure SetOnReceiveSelectionCloneObject(const Value: Boolean);
    function GetOnReceiveSelectionCloneObject: Boolean;
    property OnReceiveSelectionCloneObject: Boolean read GetOnReceiveSelectionCloneObject write SetOnReceiveSelectionCloneObject; // published: Master+Detail
    procedure SetOnReceiveSelectionFreeObject(const Value: Boolean);
    function GetOnReceiveSelectionFreeObject: Boolean;
    property OnReceiveSelectionFreeObject: Boolean read GetOnReceiveSelectionFreeObject write SetOnReceiveSelectionFreeObject; // published: Master+Detail
    // AsDefault
    function GetAsDefault: Boolean;
    procedure SetAsDefault(const Value: Boolean);
    property AsDefault: Boolean read GetAsDefault write SetAsDefault; // Published: Master
    // TypeName
    function GetTypeName: String;
    // Paging
    procedure SetPaging(const Value: TioCommonBSAPageManager);
    function GetPaging: TioCommonBSAPageManager;
    property Paging: TioCommonBSAPageManager read GetPaging write SetPaging;
    // AutoRefreshOnotification property
    function GetAutoRefreshOnNotification: Boolean;
    procedure SetAutoRefreshOnNotification(const Value: Boolean);
    property AutoRefreshOnNotification: Boolean read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification;
    // BindSourceAdapter state
    function GetState: TBindSourceAdapterState;
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    // ItemIndex
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    // VirtualFields
    function GetVirtualFields: Boolean;
    property VirtualFields: Boolean read GetVirtualFields;
    // ItemCount
    function GetCount: Integer;
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    // TypeOfCollection
    function GetTypeOfCollection: TioTypeOfCollection;
    procedure SetTypeOfCollection(const Value: TioTypeOfCollection);
    property TypeOfCollection: TioTypeOfCollection read GetTypeOfCollection write SetTypeOfCollection;
    // SelectorFor
    function GetSelectorFor: IioBindSource;
    procedure SetSelectorFor(const ATargetBindSource: IioBindSource);
    property SelectorFor: IioBindSource read GetSelectorFor write SetSelectorFor; // published: Master
    // Published Events: persistence concurrency conflicts
    function GetOnDeleteConflictException: TioBSOnPersistenceConflictExceptionEvent;
    function GetOnInsertConflictException: TioBSOnPersistenceConflictExceptionEvent;
    function GetOnUpdateConflictException: TioBSOnPersistenceConflictExceptionEvent;
    procedure SetOnDeleteConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
    procedure SetOnInsertConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
    procedure SetOnUpdateConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
    property OnDeleteConflictException: TioBSOnPersistenceConflictExceptionEvent read GetOnDeleteConflictException write SetOnDeleteConflictException;
    property OnInsertConflictException: TioBSOnPersistenceConflictExceptionEvent read GetOnDeleteConflictException write SetOnDeleteConflictException;
    property OnUpdateConflictException: TioBSOnPersistenceConflictExceptionEvent read GetOnUpdateConflictException write SetOnUpdateConflictException;
  end;

  // Interface for standard action target bind source
  IioStdActionTargetBindSource = interface
    ['{6E442DF5-154E-4253-9AFB-E5CCFDF32209}']
    function IsActive: Boolean;
    function CanDoSelection: Boolean;
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
  end;

  // Interface for standard action target master bind source
  IioStdActionTargetMasterBindSource = interface(IioStdActionTargetBindSource)
    ['{758D5C34-B4CF-4530-86FF-F8ED5E99E2E8}']
    // Paging
    function GetPaging: TioCommonBSAPageManager;
    property Paging: TioCommonBSAPageManager read GetPaging;
    // WhereBuilder
    function BuildWhere(const AExecuteOnTarget: Boolean = True): IioWhere;
    function ClearWhere(const AExecuteOnTarget: Boolean = False): IioWhere;
    procedure SetWhere(const AWhere: IioWhere);
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
    procedure Refresh(const ANotify: Boolean = True);
    procedure Reload;
    procedure LoadPage;
    procedure SetBindSource(ANotifiableBindSource: IioBindSource);
    function GetBindSource: IioBindSource;
    function HasBindSource: Boolean;
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
    function MasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    function DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    function DataObject: TObject;
    // procedure InternalSetDataObject(const ADataObject:TObject; const AOwnsObject:Boolean=True); overload;
    // procedure InternalSetDataObject(const ADataObject:IInterface; const AOwnsObject:Boolean=False); overload;
    procedure InternalSetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean); overload;
    procedure InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean); overload;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    procedure ClearDataObject;
    function GetCurrentOID: Integer;
    function HasMasterBSA: Boolean;
    function IsMasterBSA: Boolean;
    function IsDetailBSA: Boolean;
    function IsInterfaceBSA: Boolean;
    function AsTBindSourceAdapter: TBindSourceAdapter;
    function GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    function GetMasterPropertyName: String;
    function GetMasterPropertyPath: String;
    function GetBaseObjectClassName: String;
    function FindField(const AMemberName: string): TBindSourceAdapterField;
    // Selection related pethond
    procedure ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType); overload;
    procedure ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType); overload;
    // TypeName
    procedure SetTypeName(const AValue: String);
    function GetTypeName: String;
    // TypeAlias
    procedure SetTypeAlias(const AValue: String);
    function GetTypeAlias: String;
    // Lazy
    procedure SetLazy(const Value: Boolean);
    function GetLazy: Boolean;
    // LazyProps
    procedure SetLazyProps(const Value: String);
    function GetLazyProps: String;
    // LoadType
    procedure SetLoadType(const Value: TioLoadType);
    function GetLoadType: TioLoadType;
    // AutoLoad
    function GetAutoLoad: Boolean;
    // Current property
    function GetCurrent: TObject;
    // AsyncLoad property
    procedure SetAsyncLoad(const Value: Boolean);
    function GetAsyncLoad: Boolean;
    // AsyncPersist property
    procedure SetAsyncPersist(const Value: Boolean);
    function GetAsyncPersist: Boolean;
    // AutoPost property
    procedure SetioAutoPost(const Value: Boolean);
    function GetioAutoPost: Boolean;
    // Where property
    procedure SetWhere(const Value: IioWhere);
    function GetWhere: IioWhere;
    // ioViewDataType
    function GetTypeOfCollection: TioTypeOfCollection;
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
    // Reloading
    function GetReloading: Boolean;
    procedure SetReloading(const Value: Boolean);
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
    property AsyncLoad: Boolean read GetAsyncLoad write SetAsyncLoad;
    property AsyncPersist: Boolean read GetAsyncPersist write SetAsyncPersist;
    property Lazy: Boolean read GetLazy write SetLazy;
    property LazyProps: String read GetLazyProps write SetLazyProps;
    property LoadType: TioLoadType read GetLoadType write SetLoadType;
    property AutoLoad: Boolean read GetAutoLoad;
    property ioAutoPost: Boolean read GetioAutoPost write SetioAutoPost; // Lascio il nome a ioAutoPost perch� c'� gi� un AutoPost negli antenati
    property ioOwnsObjects: Boolean read GetOwnsObjects; // Lascio il nome a ioAutoPost perch� c'� gi� un AutoPost negli antenati
    property TypeAlias: String read GetTypeAlias write SetTypeAlias;
    property TypeName: String read GetTypeName write SetTypeName;
    property ioWhere: IioWhere read GetWhere write SetWhere;
    property TypeOfCollection: TioTypeOfCollection read GetTypeOfCollection;
    property ItemCount: Integer read GetCount;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    property Items[const AIndex: Integer]: TObject read GetItems write SetItems;
    property Reloading: Boolean read GetReloading write SetReloading;
    property State: TBindSourceAdapterState read GetState;
    property BSPersistenceDeleting: Boolean read GetBSPersistenceDeleting write SetBSPersistenceDeleting;
  end;

  // Bind source adapter container
  IioDetailBindSourceAdaptersContainer = interface
    ['{B374E226-D7A9-4A44-9BB6-DF85AC283598}']
    procedure Free;
    procedure SetMasterObject(const AMasterObj: TObject);
    function NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterClassName, AMasterPropertyName: String; const AWhere: IioWhere)
      : IioActiveBindSourceAdapter;
    function NewNaturalBindSourceAdapter(const AOwner: TComponent; const ASourceAdapter: IioNaturalBindSourceAdapterSource): IioActiveBindSourceAdapter;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure RemoveDetailBindSourceAdapter(const ABindSourceAdapter: IioContainedBindSourceAdapter);
    procedure RemoveNaturalBindSourceAdapter(const ANaturalBindSourceAdapter: IioNaturalActiveBindSourceAdapter);
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
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
    // Where property
    function GetWhere: IioWhere;
  end;

  IioNaturalBindSourceAdapterSource = interface
    ['{892D8DAE-96F3-48FC-925C-F3F5CD5C0F68}']
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    procedure Refresh(const ANotify: Boolean = True); overload;
    function GetCurrent: TObject;
    function UseObjStatus: Boolean;
    function NewNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
    function DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    function GetTypeName: String;
    function GetTypeAlias: String;
    function IsInterfaceBSA: Boolean;
  end;

  IioNaturalActiveBindSourceAdapter = interface
    ['{9452A7CA-2C5F-43FB-BA63-DEE446B4FCC0}']
    procedure ForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    function NotifyButDontForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
  end;

  TioDetailAdapters = TDictionary<String, IioContainedBindSourceAdapter>;

  TioNaturalAdapters = TList<IioNaturalActiveBindSourceAdapter>;

implementation

end.
