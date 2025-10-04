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
  iORM.StdActions.Interfaces, iORM.MVVM.ViewContextProvider,
  iORM.Auth.Interfaces;

type

  // Events handler types
  TioBSABeforeReceiveSelectionObjectEvent = procedure(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; const AAuthDecisionRequest: IioAuthDecisionRequest) of object;
  TioBSAonReceiveSelectionObjectEvent = procedure(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean) of object;
  TioBSAAfterReceiveSelectionObjectEvent = procedure(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType) of object;

  TioBSABeforeReceiveSelectionInterfaceEvent = procedure(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; const AAuthDecisionRequest: IioAuthDecisionRequest) of object;
  TioBSAReceiveSelectionInterfaceEvent = procedure(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean) of object;
  TioBSAAfterReceiveSelectionInterfaceEvent = procedure(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType) of object;

  TioBSOnPersistenceConflictExceptionEvent = procedure(const ASender, ADataObject: TObject; var AConflictResolved: Boolean) of object;

  TioBSOnAuthContextEvent = procedure(const ASender: TObject; var AuthorizationContext: String) of object;

  // Forward declaration
  IioActiveBindSourceAdapter = interface;
  IioContainedBindSourceAdapter = interface;
  IioDetailBindSourceAdaptersContainer = interface;
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
    function Locate(const KeyFields: string; const KeyValues: TValue): Boolean;
    function CheckAdapter: Boolean; overload;
    function CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean; overload;
    function CheckActiveAdapter: Boolean;
    function Current: TObject;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function IsMasterBS: Boolean;
    function IsDetailBS: Boolean;
    function HasMasterBS: Boolean;
    function FirstMasterPersistenceBindSource: IioBindSource;
    procedure Refresh(const ANotify: Boolean = True);
    function GetName: String;
    function IsActive: Boolean;
    function IsFromBSLoadType: Boolean;
    function DataObject: TObject;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsDataObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsDataObject: Boolean = False); overload;
    procedure RegisterDetailBindSource(const ADetailBindSource: IioBindSource);
    procedure UnregisterDetailBindSource(const ADetailBindSource: IioBindSource);
    procedure PostIfEditing;
    procedure CancelIfEditing;
    function _InternalGetAuthorizationContext: String;
    // universal methods (used by std actions)
    procedure _Action_Append(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    procedure _Action_AppendObj(AObject: TObject; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    procedure _Action_AppendIntf(AObject: IInterface; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    procedure _Action_Delete(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    procedure _Action_Insert(const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    procedure _Action_InsertObj(AObject: TObject; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    procedure _Action_InsertIntf(AObject: IInterface; const ARaiseIfSaved: Boolean = False; const ARaiseIfChangesExists: Boolean = False);
    // MasterBindSource
    function GetMasterBindSource: IioBindSource;
    procedure SetMasterBindSource(const Value: IioBindSource);
    property MasterBindSource: IioBindSource read GetMasterBindSource write SetMasterBindSource;
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
    procedure DoBeforeReceiveSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; const AAuthDecisionRequest: IioAuthDecisionRequest); overload;
    procedure DoReceiveSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterReceiveSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeReceiveSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; const AAuthDecisionRequest: IioAuthDecisionRequest); overload;
    procedure DoReceiveSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterReceiveSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    // Selector related properties
    procedure SetOnReceiveSelectionCloneObject(const Value: Boolean);
    function GetOnReceiveSelectionCloneObject: Boolean;
    property OnReceiveSelectionCloneObject: Boolean read GetOnReceiveSelectionCloneObject write SetOnReceiveSelectionCloneObject; // published: Master+Detail
    procedure SetOnReceiveSelectionFreeObject(const Value: Boolean);
    function GetOnReceiveSelectionFreeObject: Boolean;
    property OnReceiveSelectionFreeObject: Boolean read GetOnReceiveSelectionFreeObject write SetOnReceiveSelectionFreeObject; // published: Master+Detail
    // AsyncLoad property
    procedure SetAsyncLoad(const Value: Boolean);
    function GetAsyncLoad: Boolean;
    property AsyncLoad: Boolean read GetAsyncLoad write SetAsyncLoad;
    // AsyncPersist property
    procedure SetAsyncPersist(const Value: Boolean);
    function GetAsyncPersist: Boolean;
    property AsyncPersist: Boolean read GetAsyncPersist write SetAsyncPersist;
    // AutoPost property
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    property AutoPost: Boolean read GetAutoPost write SetAutoPost;
    // AsDefault
    function GetAsDefault: Boolean;
    procedure SetAsDefault(const Value: Boolean);
    property AsDefault: Boolean read GetAsDefault write SetAsDefault; // Published: Master
    // TypeAlias
    procedure SetTypeAlias(const Value: String);
    function GetTypeAlias: String;
    property TypeAlias: String read GetTypeAlias write SetTypeAlias;
    // TypeName
    procedure SetTypeName(const Value: String);
    function GetTypeName: String;
    property TypeName: String read GetTypeName write SetTypeName;
    // LoadType
    procedure SetLoadType(const Value: TioLoadType);
    function GetLoadType: TioLoadType;
    property LoadType: TioLoadType read GetLoadType write SetLoadType;
    // Lazy
    procedure SetLazy(const Value: Boolean);
    function GetLazy: Boolean;
    property Lazy: Boolean read GetLazy write SetLazy;
    // LazyProps
    procedure SetLazyProps(const Value: String);
    function GetLazyProps: String;
    property LazyProps: String read GetLazyProps write SetLazyProps;
    // MasterPropertyName
    procedure SetMasterPropertyName(const Value: String);
    function GetMasterPropertyName: String;
    property MasterPropertyName: String read GetMasterPropertyName write SetMasterPropertyName; // published: Detail
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
    // Where
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    property Where: IioWhere read GetWhere write SetWhere;
    // SelectorFor
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    function GetSelectorFor: IioBindSource;
    procedure SetSelectorFor(const ATargetBindSource: IioBindSource);
    property SelectorFor: IioBindSource read GetSelectorFor write SetSelectorFor; // published: Master
    // IsInterfacePresenting
    function GetIsInterfacePresenting: Boolean;
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting; // public: Nascondere? Serve all'esterno?
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
    function _InternalGetAuthorizationContext: String;
    function CanDoSelection: Boolean;
    function Current: TObject;
    function IsActive: Boolean;
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // SelectorFor
    function GetSelectorFor: IioBindSource;
    procedure SetSelectorFor(const ATargetBindSource: IioBindSource);
    property SelectorFor: IioBindSource read GetSelectorFor write SetSelectorFor; // published: Master
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
    // ---------- methods ----------
    procedure Append; overload;
    procedure Append(AObject: TObject); overload;
    procedure Append(AObject: IInterface); overload;
    function AsTBindSourceAdapter: TBindSourceAdapter;
    procedure Cancel;
    procedure ClearDataObject;
    procedure Delete;
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
    procedure Edit(AForce: Boolean = False);
    function FindField(const AMemberName: string): TBindSourceAdapterField;
    procedure First;
    procedure Free;
    function GetObjectType: TRttiType;
    procedure Insert; overload;
    procedure Insert(AObject: TObject); overload;
    procedure Insert(AObject: IInterface); overload;
    procedure Last;
    procedure LoadPage;
    procedure Next;
    function NewDetailBindSourceAdapter(const ABindSource: IioBindSource; const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function NewNaturalObjectBindSourceAdapter(const ABindSource: IioBindSource): IioActiveBindSourceAdapter;
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    procedure PersistCurrent;
    procedure PersistAll;
    procedure Post;
    procedure Prior;
    procedure ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType); overload;
    procedure ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType); overload;
    procedure Refresh(const ANotify: Boolean = True);
    procedure Reload;
    // ---------- properties ----------
    // Active
    procedure SetActive(Value: Boolean);
    function GetActive: Boolean;
    property Active: Boolean read GetActive write SetActive;
    // AutoPost property
    //  NB: lascio il nome a ioAutoPost perchè c'è già un AutoPost negli antenati
    procedure SetioAutoPost(const Value: Boolean);
    function GetioAutoPost: Boolean;
    property ioAutoPost: Boolean read GetioAutoPost write SetioAutoPost;
    // BindSource
    procedure SetBindSource(ABindSource: IioBindSource);
    function GetBindSource: IioBindSource;
    property BindSource: IioBindSource read GetBindSource write SetBindSource;
    // BOF
    function GetBOF: Boolean;
    property BOF: Boolean read GetBOF;
    // BSPersistenceDeleting
    function GetBSPersistenceDeleting: Boolean;
    procedure SetBSPersistenceDeleting(const Value: Boolean);
    property BSPersistenceDeleting: Boolean read GetBSPersistenceDeleting write SetBSPersistenceDeleting;
    // CanActivate
    function GetCanActivate: Boolean;
    property CanActivate: Boolean read GetCanActivate;
    // Current
    function GetCurrent: TObject;
    property Current: TObject read GetCurrent;
    // CurrentOID
    function GetCurrentOID: Integer;
    property CurrentOID: Integer read GetCurrentOID;
    // DataObject  (no property)
    function DataObject: TObject;
    procedure InternalSetDataObject(const ADataObject: TObject; const AOwnsDataObject: Boolean); overload;
    procedure InternalSetDataObject(const ADataObject: IInterface; const AOwnsDataObject: Boolean); overload;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsDataObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsDataObject: Boolean = False); overload;
    // DataSetLlinkContainer
    function GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    property DataSetLinkContainer: IioBSAToDataSetLinkContainer read GetDataSetLinkContainer;
    // DetailAdaptersContainer
    function GetDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    property DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer read GetDetailAdaptersContainer;
    // EOF
    function GetEOF: Boolean;
    property EOF: Boolean read GetEOF;
    // Fields
    function GetFields: TList<TBindSourceAdapterField>;
    property Fields: TList<TBindSourceAdapterField> read GetFields;
    // HasBindSource
    function GetHasBindSource: Boolean;
    property HasBindSource: Boolean read GetHasBindSource;
    // HasMasterBSA
    function GetHasMasterBSA: Boolean;
    property HasMasterBSA: Boolean read GetHasMasterBSA;
    // IsAutoLoad
    function GetIsAutoLoad: Boolean;
    property IsAutoLoad: Boolean read GetIsAutoLoad;
    // IsDetailBSA
    function GetIsDetailBSA: Boolean;
    property IsDetailBSA: Boolean read GetIsDetailBSA;
    // IsInterfaceBSA
    function GetIsInterfaceBSA: Boolean;
    property IsInterfaceBSA: Boolean read GetIsInterfaceBSA;
    // IsMasterBSA
    function GetIsMasterBSA: Boolean;
    property IsMasterBSA: Boolean read GetIsMasterBSA;
    // ItemCount
    function GetCount: Integer;
    property ItemCount: Integer read GetCount;
    // ItemIndex
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    // Items
    function GetItems(const AIndex: Integer): TObject;
    procedure SetItems(const AIndex: Integer; const Value: TObject);
    property Items[const AIndex: Integer]: TObject read GetItems write SetItems;
    // MasterAdaptersContainer
    procedure SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
    function GetMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    property MasterAdaptersContainer: IioDetailBindSourceAdaptersContainer read GetMasterAdaptersContainer write SetMasterAdaptersContainer;
    // MasterBindSourceAdapter
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    property MasterBindSourceAdapter: IioActiveBindSourceAdapter read GetMasterBindSourceAdapter;
    // MasterPropertyPath
    function GetMasterPropertyPath: String;
    property MasterPropertyPath: String read GetMasterPropertyPath;
    // ObjStatus
    procedure SetObjStatus(AObjStatus: TioObjStatus);
    function GetObjStatus: TioObjStatus;
    property ObjStatus: TioObjStatus read GetObjStatus write SetObjStatus;
    // ObjStatusInUse
    function GetObjStatusInUse: Boolean;
    property ObjStatusInUse: Boolean read GetObjStatusInUse;
    // OwnsDataObject
    //  NB: replicate the FOwnsList or FOwnsObjects not accessible from ancoestor classes
    function GetOwnsDataObject: Boolean;
    property OwnsDataObject: Boolean read GetOwnsDataObject;
    // Reloading
    function GetReloading: Boolean;
    procedure SetReloading(const Value: Boolean);
    property Reloading: Boolean read GetReloading write SetReloading;
    // State
    function GetState: TBindSourceAdapterState;
    property State: TBindSourceAdapterState read GetState;
    // TypeOfCollection
    function GetTypeOfCollection: TioTypeOfCollection;
    property TypeOfCollection: TioTypeOfCollection read GetTypeOfCollection;
  end;

  // Bind source adapter container
  IioDetailBindSourceAdaptersContainer = interface
    ['{B374E226-D7A9-4A44-9BB6-DF85AC283598}']
    procedure Free;
    procedure SetMasterObject(const AMasterObj: TObject);
    function NewDetailBindSourceAdapter(const ABindSource: IioBindSource; const AMasterClassName, AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function NewNaturalBindSourceAdapter(const ABindSource:IioBindSource; const ASourceActiveBSA: IioActiveBindSourceAdapter): IioActiveBindSourceAdapter;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure RemoveDetailBindSourceAdapter(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
    procedure RemoveNaturalBindSourceAdapter(const ANaturalBindSourceAdapter: IioNaturalActiveBindSourceAdapter);
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
  end;

  IioContainedBindSourceAdapter = interface
    ['{66AF6AD7-9093-4526-A18C-54447FB220A3}']
    function AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    procedure ExtractDetailObject(AMasterObj: TObject); overload;
    procedure Free;
    function NewDetailBindSourceAdapter(const ABindSource: IioBindSource; const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    procedure SetMasterAdaptersContainer(AMasterAdapterContainer: IioDetailBindSourceAdaptersContainer);
  end;

//  IioNaturalBindSourceAdapterSource = interface
//    ['{892D8DAE-96F3-48FC-925C-F3F5CD5C0F68}']
//    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
//    procedure Refresh(const ANotify: Boolean = True); overload;
//    function GetCurrent: TObject;
//    function UseObjStatus: Boolean;
//    function NewNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
//    function DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
//    function GetTypeName: String;
//    function GetTypeAlias: String;
//    function IsInterfaceBSA: Boolean;
//  end;

  IioNaturalActiveBindSourceAdapter = interface(IioActiveBindSourceAdapter)
    ['{9452A7CA-2C5F-43FB-BA63-DEE446B4FCC0}']
    procedure ForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    function NotifyButDontForwardNotificationToSourceAdapter(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
  end;

  TioDetailAdapters = TDictionary<String, IioContainedBindSourceAdapter>;

  TioNaturalAdapters = TList<IioNaturalActiveBindSourceAdapter>;

implementation

end.
