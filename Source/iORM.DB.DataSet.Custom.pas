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
unit iORM.DB.DataSet.Custom;

interface

uses
  iORM.DB.DataSet.Base, iORM.CommonTypes, System.Classes,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.CommonBSAPaging, iORM.Where.Interfaces,
  Data.Bind.ObjectScope, System.Generics.Collections,
  iORM.MVVM.ViewContextProvider, iORM.StdActions.Interfaces,
  iORM.LiveBindings.BSPersistence;

type

  TioDataSetCustom = class abstract(TioBSABaseDataSet, IioBindSource, IioStdActionTargetBindSource)
  private
    FAsDefault: Boolean;
    FTypeName: String;
    FTypeAlias: String;
    FLoadType: TioLoadType;
    FLazy: Boolean;
    FLazyProps: String;
    FAsyncLoad: Boolean;
    FAsyncPersist: Boolean;
    FTypeOfCollection: TioTypeOfCollection; // Renderlo automatico??? (rilevamento se � una lista con DuckTyping)
    FMasterBindSource: IioBindSource;
    FMasterPropertyName: String;
    FWhere: IioWhere; // Istanza temporanea solo fintanto che non c'� il BSA
    FAutoRefreshOnNotification: Boolean;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    FVirtualFields: Boolean;
    FETMfor: IioMasterBindSource;
    // Selectors
    FSelectorFor: IioBindSource;
    FOnReceiveSelectionCloneObject: Boolean;
    FOnReceiveSelectionFreeObject: Boolean;
    // Quest� � una collezione dove eventuali DataSet di dettaglio
    // si registrano per rendere nota la loro esistenza al Master. Sar� poi
    // usata dal Master per fare in modo che, quando viene richiesta la creazione
    // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
    // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
    // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
    // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
    // Ad esempio capitava che i filtri dei presenters di dettaglio impostati a
    // DesignTime (WhereStr property) non funzionassero per questo motivo.
    FDetailBindSourceContainer: TList<IioBindSource>;
    // Selection related events
    FBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonSelectionObject: TioBSASelectionObjectEvent;
    FAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    FonSelectionInterface: TioBSASelectionInterfaceEvent;
    FAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    // Persistence conflict events
    FOnDeleteConflictException: TioBSOnPersistenceConflictExceptionEvent;
    FOnInsertConflictException: TioBSOnPersistenceConflictExceptionEvent;
    FOnUpdateConflictException: TioBSOnPersistenceConflictExceptionEvent;

    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
    function IsActive: Boolean; // IioStdActionTargetBindSource
    procedure OpenCLoseDetails(const AActive: Boolean);
    // AsDefault
    function GetAsDefault: Boolean;
    procedure SetAsDefault(const Value: Boolean);
    procedure InitAsDefaultOnCreate;
    // AsyncLoad
    procedure SetAsyncLoad(const Value: Boolean);
    // AsyncPersist
    procedure SetAsyncPersist(const Value: Boolean);
    // Lazy
    procedure SetLazy(const Value: Boolean);
    // LazyProps
    procedure SetLazyProps(const Value: String);
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    // AutoRefreshOnotification
    function GetAutoRefreshOnNotification: Boolean;
    procedure SetAutoRefreshOnNotification(const Value: Boolean);
    // Editing
    function GetEditing: Boolean;
    // IsInterfacePresenting
    function GetIsInterfacePresenting: Boolean;
    // ItemCount
    function GetCount: Integer;
    // ItemIndex
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    // MasterDataSet
    procedure SetMasterBindSource(const Value: IioBindSource); virtual;
    // MasterPropertyName
    procedure SetMasterPropertyName(const Value: String);
    function GetMasterPropertyName: String;
    // OnReceiveSelectionCloneObject
    function GetOnReceiveSelectionCloneObject: Boolean;
    procedure SetOnReceiveSelectionCloneObject(const Value: Boolean);
    // GetOnReceiveSelectionFreeObject
    function GetOnReceiveSelectionFreeObject: Boolean;
    procedure SetOnReceiveSelectionFreeObject(const Value: Boolean);
    // Paging
    procedure SetPaging(const Value: TioCommonBSAPageManager);
    function GetPaging: TioCommonBSAPageManager;
    // ETMfor
    procedure _InternalSetETMforPrivateField(const AETMFor: IioBindSource);
    procedure SetETMfor(const AETMfor: IioMasterBindSource);
    function GetETMfor: IioMasterBindSource;
    // State
    function GetState: TBindSourceAdapterState;
    // TypeAlias
    procedure SetTypeAlias(const Value: String);
    // TypeName
    procedure SetTypeName(const Value: String);
    function GetTypeName: String;
    // TypeOfCollection
    function GetTypeOfCollection: TioTypeOfCollection;
    procedure SetTypeOfCollection(const Value: TioTypeOfCollection);
    // VirtualFields
    function GetVirtualFields: Boolean;
    // Where
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    // SelectorFor
    function GetSelectorFor: IioBindSource;
    procedure SetSelectorFor(const ATargetBindSource: IioBindSource);
    // Persistence concurrency conflicts
    function GetOnDeleteConflictException: TioBSOnPersistenceConflictExceptionEvent;
    function GetOnInsertConflictException: TioBSOnPersistenceConflictExceptionEvent;
    function GetOnUpdateConflictException: TioBSOnPersistenceConflictExceptionEvent;
    procedure SetOnDeleteConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
    procedure SetOnInsertConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
    procedure SetOnUpdateConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
  protected
    procedure Loaded; override;
    function GetName: String;
    procedure DoAfterOpen; override;
    procedure DoBeforeClose; override;
    procedure SetActive(Value: Boolean); override;
    // InternalAdapter (there is a setter but the property must be ReadOnly)
    procedure SetActiveBindSourceAdapter(const AActiveBindSourceAdpter: IioActiveBindSourceAdapter); override;
    // Selectors related event for TObject selection
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    // Override of some base methods
    procedure InternalPreOpen; override;
    // LoadType
    procedure SetLoadType(const Value: TioLoadType); virtual;
    function GetLoadType: TioLoadType;
    // Public properties
    property Editing: Boolean read GetEditing; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting; // public: Nascondere? Serve all'esterno?
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property Where: IioWhere read GetWhere write SetWhere; // public: Master
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    property ItemIndex: Integer read GetItemIndex write SetItemIndex; // Public: Master+Detail
    // Published properties
    property AsDefault: Boolean read GetAsDefault write SetAsDefault; // Published: Master  // non mettere default
    property TypeName: String read GetTypeName write SetTypeName; // published: Master
    property TypeAlias: String read FTypeAlias write SetTypeAlias; // published: Master
    property AsyncLoad: Boolean read FAsyncLoad write SetAsyncLoad default False; // published: Master
    property AsyncPersist: Boolean read FAsyncPersist write SetAsyncPersist default False; // published: Master
    property LoadType: TioLoadType read GetLoadType write SetLoadType default ltManual; // published: Master
    property Lazy: Boolean read FLazy write SetLazy default False; // published: Master
    property LazyProps: String read FLazyProps write SetLazyProps; // published: Master
    property TypeOfCollection: TioTypeOfCollection read GetTypeOfCollection write SetTypeOfCollection default tcList;
    property VirtualFields: Boolean read GetVirtualFields write FVirtualFields default False;
    property ETMfor: IioMasterBindSource read GetETMfor write SetETMfor;
    // published: Nascondere e default = false
    property MasterBindSource: IioBindSource read FMasterBindSource write SetMasterBindSource; // published: Detail
    property MasterPropertyName: String read GetMasterPropertyName write SetMasterPropertyName; // published: Detail
    property AutoRefreshOnNotification: Boolean read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification default True; // published: Master+Detail
    property AutoPost: Boolean read GetAutoPost write SetAutoPost default True; // published: Nascondere e default = True
    // Published properties: selectors
    property SelectorFor: IioBindSource read GetSelectorFor write SetSelectorFor; // published: Master
    // Published properties: paging
    property Paging: TioCommonBSAPageManager read GetPaging write SetPaging; // published: Master
    // Published properties: selectors
    property OnReceiveSelectionCloneObject: Boolean read GetOnReceiveSelectionCloneObject write SetOnReceiveSelectionCloneObject default True;
    // published: Master+Detail
    property OnReceiveSelectionFreeObject: Boolean read GetOnReceiveSelectionFreeObject write SetOnReceiveSelectionFreeObject default True;
    // published: Master+Detail
    // Published Events: selectors
    property BeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FBeforeSelectionObject write FBeforeSelectionObject;
    property OnSelectionObject: TioBSASelectionObjectEvent read FonSelectionObject write FonSelectionObject;
    property AfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FAfterSelectionObject write FAfterSelectionObject;
    property BeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FBeforeSelectionInterface write FBeforeSelectionInterface;
    property OnSelectionInterface: TioBSASelectionInterfaceEvent read FonSelectionInterface write FonSelectionInterface;
    property AfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FAfterSelectionInterface write FAfterSelectionInterface;
    // Published Events: persistence concurrency conflicts
    property OnDeleteConflictException: TioBSOnPersistenceConflictExceptionEvent read GetOnDeleteConflictException write SetOnDeleteConflictException;
    property OnInsertConflictException: TioBSOnPersistenceConflictExceptionEvent read GetOnInsertConflictException write SetOnInsertConflictException;
    property OnUpdateConflictException: TioBSOnPersistenceConflictExceptionEvent read GetOnUpdateConflictException write SetOnUpdateConflictException;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsMasterBS: Boolean; virtual; abstract;
    function IsDetailBS: Boolean; virtual; abstract;
    function IsFromBSLoadType: Boolean;
    function CheckAdapter: Boolean; overload;
    function CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean; overload;
    function CheckActiveAdapter: Boolean;
    procedure RegisterDetailBindSource(const ADetailBindSource: IioBindSource);
    procedure UnregisterDetailBindSource(const ADetailBindSource: IioBindSource);
    procedure ForceDetailAdaptersCreation;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure PostIfEditing;
    procedure PersistCurrent;
    procedure PersistAll;
    procedure CancelIfEditing;
    procedure Refresh(const ANotify: Boolean = True); overload;
    function Current: TObject;
    function CurrentAs<T>: T;
    function CurrentMasterObject: TObject;
    function CurrentMasterObjectAs<T>: T;
    function CanDoSelection: Boolean;
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // Show current record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const AVVMAlias: String = ''); overload;
    procedure ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show each record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // DataObject
    procedure ClearDataObject;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    function DataObjectAssigned: Boolean;
  end;

implementation

uses
  System.SysUtils, iORM.Utilities, iORM.Where.Factory, iORM.Exceptions,
  iORM.LiveBindings.Factory, iORM.Components.Common, System.Rtti, iORM,
  iORM.LiveBindings.CommonBSBehavior;

{ TioDataSet }

procedure TioDataSetCustom.CancelIfEditing;
begin
  if CheckAdapter and Editing then
    Cancel;
end;

function TioDataSetCustom.CanDoSelection: Boolean;
begin
  Result := IsActive and (Current <> nil) and Assigned(FSelectorFor) and FSelectorFor.IsActive and
    FSelectorFor.GetActiveBindSourceAdapter.Notify(Self, TioBSNotification.Create(TioBSNotificationType.ntCanReceiveSelection));
end;

function TioDataSetCustom.CheckAdapter: Boolean;
begin
  Result := CheckAdapter(False);
end;

function TioDataSetCustom.CheckActiveAdapter: Boolean;
begin
  Result := GetActiveBindSourceAdapter <> nil;
end;

function TioDataSetCustom.CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean;
begin
  // if the adapter is not already assigned then create it
  if ACreateIfNotAssigned and (GetActiveBindSourceAdapter = nil) then
    _CreateAdapter(nil, True);
  // Result
  Result := (GetActiveBindSourceAdapter <> nil);
end;

procedure TioDataSetCustom.ClearDataObject;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.ClearDataObject;
end;

constructor TioDataSetCustom.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := True;
  FAutoRefreshOnNotification := True;
  FAsyncLoad := False;
  FAsyncPersist := False;
  FLoadType := ltManual;
  FLazy := False;
  FLazyProps := '';
  FTypeOfCollection := TioTypeOfCollection.tcList;
  FWhere := nil;
  FVirtualFields := False;
  FETMfor := nil;
  // Selectors
  FSelectorFor := nil;
  FOnReceiveSelectionCloneObject := True;
  FOnReceiveSelectionFreeObject := True;
  // Quest� � una collezione dove eventuali DataSet di dettaglio
  // si registrano per rendere nota la loro esistenza al Master. Sar� poi
  // usata dal Master per fare in modo che, quando viene richiesta la creazione
  // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
  // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
  // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
  // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
  // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
  // DesignTime (WhereStr property) non funzionassero per questo motivo.
  FDetailBindSourceContainer := nil;
  // At DesignTime initialize the "AsDefault" property at True if it is the
  // first ModelPresenter inserted (no other presenters presents).
  // NB: At Runtime set False as initial value (load real value from dfm file)
  InitAsDefaultOnCreate;
  // Page manager
  FPaging := TioCommonBSAPageManager.Create(
    procedure
    begin
      if CheckAdapter then
        GetActiveBindSourceAdapter.LoadPage;
    end);
end;

function TioDataSetCustom.Current: TObject;
begin
  if CheckAdapter(True) then
    Result := GetActiveBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioDataSetCustom.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioUtilities.CastObjectToGeneric<T>(LCurrent);
end;

function TioDataSetCustom.CurrentMasterObject: TObject;
begin
  if CheckAdapter and IsDetailBS then
    Result := GetActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioDataSetCustom.CurrentMasterObjectAs<T>: T;
var
  LMasterObject: TObject;
begin
  LMasterObject := Self.CurrentMasterObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LMasterObject);
end;

function TioDataSetCustom.DataObject: TObject;
begin
  // Result := nil;
  Result := GetActiveBindSourceAdapter.DataObject;
end;

function TioDataSetCustom.DataObjectAs<T>: T;
var
  LObj: TObject;
begin
  LObj := Self.DataObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LObj);
end;

function TioDataSetCustom.DataObjectAssigned: Boolean;
begin
  if CheckAdapter then
    Result := Assigned(GetActiveBindSourceAdapter.DataObject)
  else
    Result := False;
end;

destructor TioDataSetCustom.Destroy;
begin
  // If the new AETMfor is assigned then unregister itself
  if Assigned(FETMFor) then
    FETMfor.UnregisterDetailBindSource(Self);
  // If the DetailDataSetContainer was created then destroy it
  if Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer.Free;
  // Destroy paging object
  FPaging.Free;
  // Destroy the internal adapter
  if GetActiveBindSourceAdapter <> nil then
    GetActiveBindSourceAdapter.Free;
  inherited;
end;

procedure TioDataSetCustom.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FAfterSelectionObject) then
    FAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoAfterOpen;
begin
  inherited;
  OpenCLoseDetails(True);
end;

procedure TioDataSetCustom.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FAfterSelectionInterface) then
    FAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoBeforeClose;
begin
  inherited;
  OpenCLoseDetails(False);
end;

procedure TioDataSetCustom.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBeforeSelectionInterface) then
    FBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBeforeSelectionObject) then
    FBeforeSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioDataSetCustom.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionObject) then
    FonSelectionObject(Self, ASelected, ASelectionType, ADone);
end;

procedure TioDataSetCustom.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionInterface) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

procedure TioDataSetCustom.ForceDetailAdaptersCreation;
var
  LDetailBindSource: IioBindSource;
begin
  if Assigned(FDetailBindSourceContainer) then
    for LDetailBindSource in FDetailBindSourceContainer do
      LDetailBindSource.CheckAdapter(True);
end;

function TioDataSetCustom.GetAsDefault: Boolean;
begin
  Result := FAsDefault;
end;

function TioDataSetCustom.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.ioAutoPost
  else
    Result := FAutoPost;
end;

function TioDataSetCustom.GetAutoRefreshOnNotification: Boolean;
begin
  Result := FAutoRefreshOnNotification;
end;

function TioDataSetCustom.GetCount: Integer;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioDataSetCustom.GetEditing: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State in seEditModes
  else
    Result := False
end;

function TioDataSetCustom.GetETMfor: IioMasterBindSource;
begin
  Result := FETMfor;
end;

function TioDataSetCustom.GetIsInterfacePresenting: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.IsInterfaceBSA
  else
    Result := TioUtilities.IsAnInterfaceTypeName(TypeName);
end;

function TioDataSetCustom.GetItemIndex: Integer;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.ItemIndex
  else
    Result := 0;
end;

function TioDataSetCustom.GetLoadType: TioLoadType;
begin
  Result := FLoadType;
end;

function TioDataSetCustom.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioDataSetCustom.GetName: String;
begin
  Result := Name;
end;

function TioDataSetCustom.GetOnDeleteConflictException: TioBSOnPersistenceConflictExceptionEvent;
begin
  Result := FOnDeleteConflictException;
end;

function TioDataSetCustom.GetOnInsertConflictException: TioBSOnPersistenceConflictExceptionEvent;
begin
  Result := FOnInsertConflictException;
end;

function TioDataSetCustom.GetOnUpdateConflictException: TioBSOnPersistenceConflictExceptionEvent;
begin
  Result := FOnUpdateConflictException;
end;

function TioDataSetCustom.GetOnReceiveSelectionCloneObject: Boolean;
begin
  Result := FOnReceiveSelectionCloneObject;
end;

function TioDataSetCustom.GetOnReceiveSelectionFreeObject: Boolean;
begin
  Result := FOnReceiveSelectionFreeObject;
end;

function TioDataSetCustom.GetPaging: TioCommonBSAPageManager;
begin
  Result := FPaging;
end;

function TioDataSetCustom.GetSelectorFor: IioBindSource;
begin
  Result := FSelectorFor;
end;

function TioDataSetCustom.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

function TioDataSetCustom.GetTypeName: String;
begin
  Result := FTypeName;
end;

function TioDataSetCustom.GetTypeOfCollection: TioTypeOfCollection;
begin
  Result := FTypeOfCollection;
end;

function TioDataSetCustom.GetVirtualFields: Boolean;
begin
  Result := FVirtualFields;
end;

function TioDataSetCustom.GetWhere: IioWhere;
begin
  // If the adapter exists the return the property of the adapter
  // else return the Self.FWhere
  if CheckAdapter then
  begin
    Result := GetActiveBindSourceAdapter.ioWhere;
    Exit;
  end;
  // if not already assigned then create it (cos� lo crea solo se serve
  // davvero altrimenti no)
  if not Assigned(FWhere) then
    FWhere := TioWhereFactory.NewWhereWithPagingAndETMfor(FPaging, FETMfor);
  // Return the Where instance
  Result := FWhere;
end;

procedure TioDataSetCustom.InitAsDefaultOnCreate;
begin
  // At DesignTime initialize the "AsDefault" property at True if it is the
  // first ModelPresenter inserted (no other presenters presents).
  // NB: At Runtime set False as initial value (load real value from dfm file)
  // NB: The second parameter is FAsDefault private field to avoid deadlock
  TioCommonBSBehavior.InitAsDefaultOnCreate(Self, FAsDefault);
end;

procedure TioDataSetCustom.InternalPreOpen;
begin
  // Check if the operation (Open) is allowed
  TioCommonBSBehavior.CheckForOpen(Self, FMasterBindSource, LoadType);
  if not CheckAdapter(True) then
    raise EioGenericException.Create(ClassName, 'InternalPreOpen', 'There was some problem creating the ActiveBindSourceAdapter');
  GetActiveBindSourceAdapter.Active := True;
  inherited;
end;

function TioDataSetCustom.IsActive: Boolean;
begin
  Result := Active;
end;

function TioDataSetCustom.IsFromBSLoadType: Boolean;
begin
  Result := TioCommonBSBehavior.CheckIfLoadTypeIsFromBS(FLoadType);
end;

procedure TioDataSetCustom.Loaded;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not(csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
  // ===========================================================================

  // REGISTER ITSELF AS DETAIL MODEL PRESENTER (IF IT IS A DETAIL) INTO THE MASTER PRESENTER
  // ===========================================================================
  if IsDetailBS and not(csDesigning in ComponentState) then
  begin
    if Assigned(MasterBindSource) then
      MasterBindSource.RegisterDetailBindSource(Self);
    // ----- OLD CODE -----
    // if not Assigned(FMasterBindSource) then
    // raise EioException.Create(ClassName, 'Loaded', Format('The "MasterDataSet" property has not been set in the component "%s".' +
    // #13#13'iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the property and try again.', [Name]));
    // ----- OLD CODE -----
  end;
  // ===========================================================================

  inherited;
end;

procedure TioDataSetCustom.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  TioCommonBSBehavior.Notify(Sender, Self, ANotification);
end;

procedure TioDataSetCustom.OpenCLoseDetails(const AActive: Boolean);
var
  LBindSource: IioBindSource;
begin
  if Assigned(FDetailBindSourceContainer) then
    for LBindSource in FDetailBindSourceContainer do
      if AActive then
        LBindSource.Open
      else
        LBindSource.Close;
end;

procedure TioDataSetCustom.PersistAll;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.PersistAll;
end;

procedure TioDataSetCustom.PersistCurrent;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.PersistCurrent;
end;

procedure TioDataSetCustom.PostIfEditing;
begin
  if CheckAdapter and Editing then
    Post;
end;

procedure TioDataSetCustom.Refresh(const ANotify: Boolean = True);
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Refresh(ANotify);
end;

procedure TioDataSetCustom.RegisterDetailBindSource(const ADetailBindSource: IioBindSource);
begin
  if not Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer := TList<IioBindSource>.Create;
  if not FDetailBindSourceContainer.Contains(ADetailBindSource) then
    FDetailBindSourceContainer.Add(ADetailBindSource);
end;

procedure TioDataSetCustom.UnregisterDetailBindSource(const ADetailBindSource: IioBindSource);
begin
  if not Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer := TList<IioBindSource>.Create;
  if not FDetailBindSourceContainer.Contains(ADetailBindSource) then
    FDetailBindSourceContainer.Remove(ADetailBindSource);
end;

procedure TioDataSetCustom.SelectCurrent(ASelectionType: TioSelectionType);
begin
  // C'era un problema se il target � un BS che espone un singolo oggetto e in
  // precedenza era stato impostato il suo dataObject a nil perch� in questo caso negli
  // ObjectBSA il ABSA si disattiva (Active = False) e quindi poi quando faceva
  // il SetDataObject sul TargetBSA dava un errore perch� non era attivo.
  if not FSelectorFor.IsActive then
    FSelectorFor.Open;
  if IsInterfacePresenting then
    TioCommonBSBehavior.Select<IInterface>(Self, FSelectorFor, CurrentAs<IInterface>, ASelectionType)
  else
    TioCommonBSBehavior.Select<TObject>(Self, FSelectorFor, Current, ASelectionType);
end;

procedure TioDataSetCustom.SetAsDefault(const Value: Boolean);
begin
  TioCommonBSBehavior.SetAsDefaultPropertyOfAllBindSourcesToFalse(Owner, Value);
  FAsDefault := Value;
end;

procedure TioDataSetCustom.SetAsyncLoad(const Value: Boolean);
begin
  FAsyncLoad := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.AsyncLoad := Value;
end;

procedure TioDataSetCustom.SetAsyncPersist(const Value: Boolean);
begin
  FAsyncPersist := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.AsyncPersist := Value;
end;

procedure TioDataSetCustom.SetLazy(const Value: Boolean);
begin
  FLazy := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.Lazy := Value;
end;

procedure TioDataSetCustom.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.LazyProps := Value;
end;

procedure TioDataSetCustom.SetLoadType(const Value: TioLoadType);
begin
  FLoadType := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.LoadType := Value;
end;

procedure TioDataSetCustom.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioAutoPost := Value;
end;

procedure TioDataSetCustom.SetAutoRefreshOnNotification(const Value: Boolean);
begin
  FAutoRefreshOnNotification := Value;
end;

procedure TioDataSetCustom.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // If the ADataObject is assigned then set it as the BSA DataObject...else ClearDataObject
  if Assigned(ADataObject) then
  begin
    FLoadType := ltManual;
    if CheckActiveAdapter then
      GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
    else
      _CreateAdapter(ADataObject, AOwnsObject);
    // NB: Ho dovuto attivare automaticamnete il BindSource (nel caso non lo fosse gi�) perch�
    //  altrimenti avevo degli AV dovuti al fatto che il BSA non esisteva
    if not IsActive then
      Open;
  end
  else
    ClearDataObject;
end;

procedure TioDataSetCustom.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  // If the ADataObject is assigned then set it as the BSA DataObject...else ClearDataObject
  if Assigned(ADataObject) then
  begin
    FLoadType := ltManual;
    if CheckActiveAdapter then
      GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
    else
      _CreateAdapter(ADataObject as TObject, AOwnsObject);
    // NB: Ho dovuto attivare automaticamnete il BindSource (nel caso non lo fosse gi�) perch�
    //  altrimenti avevo degli AV dovuti al fatto che il BSA non esisteva
    if not IsActive then
      Open;
  end
  else
    ClearDataObject;
end;

procedure TioDataSetCustom.SetETMfor(const AETMfor: IioMasterBindSource);
begin
  TioCommonBSBehavior.SetETMfor(Self, AETMfor, ComponentState);
end;

procedure TioDataSetCustom.SetItemIndex(const Value: Integer);
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.ItemIndex := Value
  else
    raise EioGenericException.Create(Self.ClassName, 'SetItemindex', 'Unassigned BindSourceAdapter');
end;

procedure TioDataSetCustom.SetMasterBindSource(const Value: IioBindSource);
begin
  FMasterBindSource := Value;
end;

procedure TioDataSetCustom.SetMasterPropertyName(const Value: String);
begin
  FMasterPropertyName := Trim(Value);
end;

procedure TioDataSetCustom.SetActive(Value: Boolean);
begin
  // Check if the value is changing
  if Value = IsActive then
    Exit;

  // If the LoadType is ltManual but the BSA is not assinged (DataObject not assigned) then exit
  if IsMasterBS and (FLoadType = ltManual) and not CheckActiveAdapter then
    Exit;

  inherited;
end;

procedure TioDataSetCustom.SetActiveBindSourceAdapter(const AActiveBindSourceAdpter: IioActiveBindSourceAdapter);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  inherited;
  LActiveBSA := GetActiveBindSourceAdapter;
  // Init the BSA
  LActiveBSA.AsyncLoad := FAsyncLoad;
  LActiveBSA.AsyncPersist := FAsyncPersist;
  LActiveBSA.ioAutoPost := FAutoPost;
  LActiveBSA.LoadType := FLoadType;
  LActiveBSA.Lazy := FLazy;
  LActiveBSA.LazyProps := FLazyProps;
  LActiveBSA.ioWhere := GetWhere; // Do not directly access to the FWhere field here
  // Register itself for notifications from BindSourceAdapter
  LActiveBSA.SetBindSource(Self);
  FTypeOfCollection := LActiveBSA.TypeOfCollection;
end;

procedure TioDataSetCustom.SetOnDeleteConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
begin
  FOnDeleteConflictException := APersistenceConflictEventHandler;
end;

procedure TioDataSetCustom.SetOnInsertConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
begin
  FOnInsertConflictException := APersistenceConflictEventHandler;
end;

procedure TioDataSetCustom.SetOnUpdateConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
begin
  FOnUpdateConflictException := APersistenceConflictEventHandler;
end;

procedure TioDataSetCustom.SetOnReceiveSelectionCloneObject(const Value: Boolean);
begin
  FOnReceiveSelectionCloneObject := Value;
end;

procedure TioDataSetCustom.SetOnReceiveSelectionFreeObject(const Value: Boolean);
begin
  FOnReceiveSelectionFreeObject := Value;
end;

procedure TioDataSetCustom.SetPaging(const Value: TioCommonBSAPageManager);
begin
  // In reality this property would be read-only but if I left it read-only
  // then it no longer writes me the values of the sub-properties in the DFM file.
  // So I also put the set method where, however, I raise an exception if someone
  // tries to set a value.
  raise EioGenericException.Create(ClassName, 'SetPaging', 'This property "Paging" is not writable');
end;

procedure TioDataSetCustom.SetSelectorFor(const ATargetBindSource: IioBindSource);
begin
  FSelectorFor := ATargetBindSource;
end;

procedure TioDataSetCustom.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    GetActiveBindSourceAdapter.TypeAlias := Value;
end;

procedure TioDataSetCustom.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    GetActiveBindSourceAdapter.TypeName := Value;
end;

procedure TioDataSetCustom.SetTypeOfCollection(const Value: TioTypeOfCollection);
begin
  FTypeOfCollection := Value;
end;

procedure TioDataSetCustom.SetWhere(const AWhere: IioWhere);
begin
  AWhere.SetPagingObj(FPaging); // Inject paging object specified in the BindSource
  AWhere.SetETMfor(FETMfor); // Inject ETMfor BS specified in the BindSource
  FWhere := AWhere;
  // Update the adapter where in the BSAdapter if exist
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioWhere := AWhere;
end;

procedure TioDataSetCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AViewContext, AVVMAlias);
end;

procedure TioDataSetCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AVVMAlias);
end;

procedure TioDataSetCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AVCProvider, AVVMAlias);
end;

procedure TioDataSetCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AViewContext, AVVMAlias);
end;

procedure TioDataSetCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AVVMAlias);
end;

procedure TioDataSetCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AVCProvider, AVVMAlias);
end;

procedure TioDataSetCustom._CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // If an adapter already exists then raise an exception
  if CheckAdapter then
    raise EioGenericException.Create(ClassName, '_CreateAdapter', Format('ActiveBindSourceAdapter already exists in component "%s".', [Name]));
  // If it is a detail bind source then get the detail BSA from the master bind source,
  // else if it is a master bind source but load type property is set to ltFromBSAsIs, ltFromBSReload or ltFromBSReloadNewInstance
  // then get the natural BSA from the source bind source else it is a master bind source then get the normal BSA.
  if IsDetailBS and not MasterPropertyName.IsEmpty then
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetDetailBSAfromMasterBindSource(nil, Name, MasterBindSource, MasterPropertyName))
  else if IsFromBSLoadType or (IsDetailBS and MasterPropertyName.IsEmpty) then
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetNaturalBSAfromMasterBindSource(nil, Name, MasterBindSource))
  else
  begin
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetBSA(nil, Name, TypeName, TypeAlias, GetWhere, TypeOfCollection, ADataObject, AOwnsObject));
    // Force the creation of all the detail adapters (if exists)
    // NB: Per risolvere alcuni problemi di sequenza (tipo le condizioni in WhereStr di dettaglio che non
    // funzionavano perch� al momento di apertura del MasterAdapter i DetailAdapters non erano ancora nemmeno
    // stati creati) forzo la creazione anche di tutti gli adapters di dettaglio al momento della creazione
    // del Master.
    ForceDetailAdaptersCreation;
  end;
end;

procedure TioDataSetCustom._InternalSetETMforPrivateField(const AETMFor: IioBindSource);
begin
  FETMfor := AETMfor as IioMasterBindSource;
end;

end.
