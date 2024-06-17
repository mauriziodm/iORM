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
unit iORM.MVVM.ModelPresenter.Custom;

interface

uses
  System.Classes, System.SysUtils, Data.Bind.ObjectScope, System.Generics.Collections, iORM.CommonTypes, iORM.LiveBindings.Interfaces,
  iORM.LiveBindings.CommonBSAPaging, iORM.LiveBindings.Notification, iORM.Where.Interfaces, iORM.MVVM.ViewContextProvider,
  iORM.StdActions.Interfaces, iORM.LiveBindings.BSPersistence;

type

  TioModelPresenterCustom = class abstract(TComponent, IioBindSource, IioStdActionTargetBindSource)
  private
    FAsDefault: Boolean;
    FBindSourceAdapter: IioActiveBindSourceAdapter;
    FTypeName, FTypeAlias: String;
    FAsyncLoad: Boolean;
    FAsyncPersist: Boolean;
    FLoadType: TioLoadType;
    FLazy: Boolean;
    FLazyProps: String;
    FTypeOfCollection: TioTypeOfCollection;
    FWhere: IioWhere; // Istanza temporanea solo fintanto che non c'è il BSA
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FMasterBindSource: IioBindSource;
    FMasterPropertyName: String;
    FAutoRefreshOnNotification: Boolean;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    FVirtualFields: Boolean;
    FETMfor: IioMasterBindSource;
    // Selectors
    FSelectorFor: IioBindSource;
    FOnReceiveSelectionCloneObject: Boolean;
    FOnReceiveSelectionFreeObject: Boolean;
    // Questà è una collezione dove eventuali ModelPresenter di dettaglio
    // si registrano per rendere nota la loro esistenza al Master. Sarà poi
    // usata dal Master per fare in modo che, quando viene richiesta la creazione
    // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
    // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
    // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
    // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
    // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
    // DesignTime (WhereStr property) non funzionassero per questo motivo.
    FDetailBindSourceContainer: TList<IioBindSource>;
    // Collezione alla quale i ModelBindSource/ModelDataSet si registrano per rendere nota
    // la loro presenza e rendere possibile l'attivazione/disattivazione di se stessi da
    // parte del ModelPresenter al quale sono collegati
    // NB: IInterface per evitare un circular reference error
    FViewBindSourceContainer: TList<IInterface>;
    // Questo è un riferimento di tipo interfaccia e serve solo per
    // mantenere in vita l'oggetto
    // FDummyInterfaceRef: IInterface; NB: Hint prevention "symbol declared but never used"
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
    // Events
    FAfterClose: TNotifyEvent;
    FAfterOpen: TNotifyEvent;
    FBeforeClose: TNotifyEvent;
    FBeforeOpen: TNotifyEvent;
    // Methods
    function Get_Version: String;
    procedure WhereOnChangeEventHandler(Sender: TObject);
    procedure OpenCloseViewBindSources(const AActive: Boolean);
    procedure OpenCloseDetails(const AActive: Boolean);
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
    // AutoRefreshOnNotification;
    function GetAutoRefreshOnNotification: Boolean;
    procedure SetAutoRefreshOnNotification(const Value: Boolean);
    // Bof
    function GetBOF: Boolean;
    // Editing
    function GetEditing: Boolean;
    // Eof
    function GetEOF: Boolean;
    // IsInterfacePresenting
    function GetIsInterfacePresenting: Boolean;
    // ItemCount
    function GetCount: Integer;
    // ItemIndex
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    // MasterPropertyName
    procedure SetMasterPropertyName(const Value: String);
    function GetMasterPropertyName: String;
    // OnReceiveSelectionCloneObject
    function GetOnReceiveSelectionCloneObject: Boolean;
    procedure SetOnReceiveSelectionCloneObject(const Value: Boolean);
    // GetOnReceiveSelectionFreeObject
    function GetOnReceiveSelectionFreeObject: Boolean;
    procedure SetOnReceiveSelectionFreeObject(const Value: Boolean);
    // OrderBy
    procedure SetOrderBy(const Value: String);
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
    // WhereDetailsFromDetailAdapters
    procedure SetWhereDetailsFromDetailAdapters(const Value: Boolean);
    // WhereStr
    procedure SetWhereStr(const Value: TStrings);
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
    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean); virtual;
    procedure Open; virtual;
    procedure Close; virtual;
    procedure Loaded; override;
    function GetName: String;
    procedure DoAfterClose;
    procedure DoAfterOpen;
    procedure DoBeforeClose;
    procedure DoBeforeOpen;
    // MasterPresenter
    procedure SetMasterBindSource(const Value: IioBindSource); virtual;
    // Active
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean); virtual;
    // Selectors related event for TObject selection
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    // LoadType
    procedure SetLoadType(const Value: TioLoadType); virtual;
    function GetLoadType: TioLoadType;
    // Public properties
    property Editing: Boolean read GetEditing; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting; // public: Nascondere? Serve all'esterno?
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property Active: Boolean read GetActive write SetActive; // Public: Master+Detail
    property ItemIndex: Integer read GetItemIndex write SetItemIndex; // Public: Master+Detail
    property Bof: Boolean read GetBOF; // Public: Master+Detail
    property Eof: Boolean read GetEOF; // Public: Master+Detail
    // Published properties
    property AsyncLoad: Boolean read FAsyncLoad write SetAsyncLoad default False; // Published: Master
    property AsyncPersist: Boolean read FAsyncPersist write SetAsyncPersist default False; // Published: Master
    property LoadType: TioLoadType read GetLoadType write SetLoadType default ltManual; // Published: Master
    property Lazy: Boolean read FLazy write SetLazy default False; // published: Master
    property LazyProps: String read FLazyProps write SetLazyProps; // published: Master
    property AutoPost: Boolean read GetAutoPost write SetAutoPost default True; // published: Nascondere e default = True
    property AutoRefreshOnNotification: Boolean read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification default True;
    property VirtualFields: Boolean read GetVirtualFields write FVirtualFields default False;
    property ETMfor: IioMasterBindSource read GetETMfor write SetETMfor;
    // published: Nascondere e default = false
    property TypeAlias: String read FTypeAlias write SetTypeAlias;
    property TypeOfCollection: TioTypeOfCollection read GetTypeOfCollection write SetTypeOfCollection default tcList;
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters default False;
    // published: Nascondere e default = false
    property WhereStr: TStrings read FWhereStr write SetWhereStr; // Published: Master
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
    // published events
    property AfterClose: TNotifyEvent read FAfterClose write FAfterClose;
    property AfterOpen: TNotifyEvent read FAfterOpen write FAfterOpen;
    property BeforeClose: TNotifyEvent read FBeforeClose write FBeforeClose;
    property BeforeOpen: TNotifyEvent read FBeforeOpen write FBeforeOpen;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function IsMasterBS: Boolean; virtual; abstract;
    function IsDetailBS: Boolean; virtual; abstract;
    function IsFromBSLoadType: Boolean;
    class function IsValidForDependencyInjectionLocator(const AModelPresenter: TioModelPresenterCustom;
      const ACheckCurrentObj, ARaiseExceptions: Boolean): Boolean;
    procedure SetActiveBindSourceAdapter(const Value: IioActiveBindSourceAdapter);
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function CheckAdapter: Boolean; overload;
    function CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean; overload;
    function CheckActiveAdapter: Boolean;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    // procedure SetMasterBindSourceAdapter(const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String='');
    procedure RegisterDetailBindSource(const ADetailBindSource: IioBindSource);
    procedure UnregisterDetailBindSource(const ADetailBindSource: IioBindSource);

    // ViewBindSource remote open/close management (ModelBindSource/ModelDataSet)
    procedure RegisterViewBindSource(const AModelBindSourceOrModelDataSet: IInterface);
    procedure UnregisterViewBindSource(const AModelBindSourceOrModelDataSet: IInterface);

    procedure ForceDetailAdaptersCreation;
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
    // ----------------------------------------------------------------------------------------------------------------------------
    // BindSourceAdapter methods/properties published by TioPrototypeBindSource also
    procedure Next;
    procedure Prior;
    procedure First;
    procedure Last;
    procedure Edit(AForce: Boolean = False);
    procedure Post;
    procedure PostIfEditing;
    function IsActive: Boolean;
    function Current: TObject;
    function CurrentAs<T>: T;
    function CurrentMasterObject: TObject;
    function CurrentMasterObjectAs<T>: T;
    procedure Refresh(const ANotify: Boolean = True); overload;
    procedure PersistCurrent;
    procedure PersistAll;
    procedure Append; overload;
    procedure Append(AObject: TObject); overload;
    procedure Append(AObject: IInterface); overload;
    procedure Insert; overload;
    procedure Insert(AObject: TObject); overload;
    procedure Insert(AObject: IInterface); overload;
    procedure Delete;
    procedure Cancel;
    procedure CancelIfEditing;
    procedure ForEach(const AForEachMethod: TProc);
    function GetDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
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
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AAlias: String = ''); overload;
    // DataObject
    procedure ClearDataObject;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    function DataObjectAssigned: Boolean;
    // ----------------------------------------------------------------------------------------------------------------------------
    // NB: Queste sotto sono proprietà lasciate in public perchè usate in qualche parte del codice
    property AsDefault: Boolean read GetAsDefault write SetAsDefault; // Published: Master // non mettere default
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    property MasterBindSource: IioBindSource read FMasterBindSource write SetMasterBindSource; // Published: Detail
    property MasterPropertyName: String read GetMasterPropertyName write SetMasterPropertyName; // Published: Detail
    property OrderBy: String read FOrderBy Write SetOrderBy; // Published: Master
    property TypeName: String read GetTypeName write SetTypeName; // Published: Master
    property Where: IioWhere read GetWhere write SetWhere; // public: Master
    // Published properties: selectors (NB: lasciata public perchè usata da qualche parte nel codice)
    property SelectorFor: IioBindSource read GetSelectorFor write SetSelectorFor; // published: Master
  published
    property _Version: String read Get_Version;
  end;

implementation

uses
  iORM, iORM.Exceptions, iORM.Utilities, iORM.Where.Factory, iORM.Components.Common, iORM.LiveBindings.CommonBSBehavior,
  iORM.Components.Common.Interfaces, iORM.LiveBindings.Factory;

{ TioModelProvider }

procedure TioModelPresenterCustom.Append(AObject: TObject);
begin
  if CheckAdapter then
  begin
    GetActiveBindSourceAdapter.Append(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenterCustom.Append;
begin
  if CheckAdapter then
    (GetActiveBindSourceAdapter as TBindSourceAdapter).Append;
end;

procedure TioModelPresenterCustom.Append(AObject: IInterface);
begin
  if CheckAdapter then
  begin
    GetActiveBindSourceAdapter.Append(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenterCustom.Cancel;
begin
  if CheckAdapter and Editing then
    GetActiveBindSourceAdapter.Cancel;
end;

procedure TioModelPresenterCustom.CancelIfEditing;
begin
  if CheckAdapter and Editing then
    Cancel;
end;

function TioModelPresenterCustom.CanDoSelection: Boolean;
begin
  Result := IsActive and (Current <> nil) and Assigned(FSelectorFor) and FSelectorFor.IsActive and
    FSelectorFor.GetActiveBindSourceAdapter.Notify(Self, TioBSNotification.Create(TioBSNotificationType.ntCanReceiveSelection));
end;

function TioModelPresenterCustom.CheckAdapter: Boolean;
begin
  Result := CheckAdapter(False);
end;

function TioModelPresenterCustom.CheckActiveAdapter: Boolean;
begin
  Result := GetActiveBindSourceAdapter <> nil;
end;

function TioModelPresenterCustom.CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean;
begin
  // if the adapter is not already assigned then create it
  if ACreateIfNotAssigned and not Assigned(FBindSourceAdapter) then
    _CreateAdapter(nil, True);
  // Result
  Result := Assigned(FBindSourceAdapter);
end;

procedure TioModelPresenterCustom.ClearDataObject;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.ClearDataObject;
end;

procedure TioModelPresenterCustom.Close;
begin
  if Active then
    Active := False;
end;

constructor TioModelPresenterCustom.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := True;
  FAutoRefreshOnNotification := True;
  FAsyncLoad := False;
  FAsyncPersist := False;
  FLoadType := ltManual;
  FLazy := False;
  FLazyProps := '';
  FTypeOfCollection := tcList;
  FWhere := nil;
  FWhereDetailsFromDetailAdapters := False;
  FVirtualFields := False;
  FETMfor := nil;
  // Selectors
  FSelectorFor := nil;
  FOnReceiveSelectionCloneObject := True;
  FOnReceiveSelectionFreeObject := True;
  // Questà è una collezione dove eventuali ModelPresenters di dettaglio
  // si registrano per rendere nota la loro esistenza al Master. Sarà poi
  // usata dal Master per fare in modo che, quando viene richiesta la creazione
  // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
  // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
  // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
  // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
  // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
  // DesignTime (WhereStr property) non funzionassero per questo motivo.
  FDetailBindSourceContainer := nil;
  // Collezione alla quale i ModelBindSource/ModelDataSet si registrano per rendere nota
  // la loro presenza e rendere possibile l'attivazione/disattivazione di se stessi da
  // parte del ModelPresenter al quale sono collegati
  FViewBindSourceContainer := TList<IInterface>.Create;
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
  // Set even an onChange event handler (always after the creation of the PageManager)
  FWhereStr := TStringList.Create;
  SetWhereStr(FWhereStr); // set TStringList.onChange event handler
end;

function TioModelPresenterCustom.Current: TObject;
begin
  if CheckAdapter(True) then
    Result := GetActiveBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioModelPresenterCustom.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioUtilities.CastObjectToGeneric<T>(LCurrent);
end;

procedure TioModelPresenterCustom.Delete;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Delete;
end;

procedure TioModelPresenterCustom.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  GetActiveBindSourceAdapter.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

destructor TioModelPresenterCustom.Destroy;
begin
  FWhereStr.Free;
  // If the new AETMfor is assigned then unregister itself
  if Assigned(FETMFor) then
    FETMfor.UnregisterDetailBindSource(Self);
  // Destroy the BindSourceAdapter was created then destroy it
  if CheckAdapter and not(csDestroying in TComponent(FBindSourceAdapter).ComponentState) then
    FBindSourceAdapter.Free;
  // Collezione alla quale i ModelBindSource/ModelDataSet si registrano per rendere nota
  // la loro presenza e rendere possibile l'attivazione/disattivazione di se stessi da
  // parte del ModelPresenter al quale sono collegati
  FViewBindSourceContainer.Free;
  // If the DetailPresenterContainer was created then destroy it
  if Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer.Free;
  // Destroy paging object
  FPaging.Free;
  inherited;
end;

procedure TioModelPresenterCustom.DoAfterClose;
begin
  if Assigned(FAfterClose) then
    FAfterClose(Self);
end;

procedure TioModelPresenterCustom.DoAfterOpen;
begin
  if Assigned(FAfterOpen) then
    FAfterOpen(Self);
end;

procedure TioModelPresenterCustom.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FAfterSelectionInterface) then
    FAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenterCustom.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FAfterSelectionObject) then
    FAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenterCustom.DoBeforeClose;
begin
  if Assigned(FBeforeClose) then
    FBeforeClose(Self);
end;

procedure TioModelPresenterCustom.DoBeforeOpen;
begin
  if Assigned(FBeforeOpen) then
    FBeforeOpen(Self);
end;

procedure TioModelPresenterCustom.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBeforeSelectionInterface) then
    FBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenterCustom.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBeforeSelectionObject) then
    FBeforeSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenterCustom.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionObject) then
    FonSelectionObject(Self, ASelected, ASelectionType, ADone);
end;

procedure TioModelPresenterCustom.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionInterface) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

procedure TioModelPresenterCustom.Edit(AForce: Boolean);
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Edit(AForce);
end;

procedure TioModelPresenterCustom.First;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.First;
end;

procedure TioModelPresenterCustom.ForceDetailAdaptersCreation;
var
  LDetailBindSource: IioBindSource;
begin
  if Assigned(FDetailBindSourceContainer) then
    for LDetailBindSource in FDetailBindSourceContainer do
      LDetailBindSource.CheckAdapter(True);
end;

procedure TioModelPresenterCustom.ForEach(const AForEachMethod: TProc);
var
  I, PreviousItemIndex: Integer;
begin
  PreviousItemIndex := GetActiveBindSourceAdapter.ItemIndex;
  try
    First;
    for I := 1 to ItemCount do
    begin
      AForEachMethod;
      Next;
    end;
  finally
    GetActiveBindSourceAdapter.ItemIndex := PreviousItemIndex;
  end;
end;

function TioModelPresenterCustom.GetActive: Boolean;
begin
  Result := CheckAdapter(False) and GetActiveBindSourceAdapter.Active;
end;

function TioModelPresenterCustom.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := Self.GetActiveBindSourceAdapter.ioAutoPost
  else
    Result := FAutoPost;
end;

function TioModelPresenterCustom.GetAutoRefreshOnNotification: Boolean;
begin
  Result := FAutoRefreshOnNotification;
end;

function TioModelPresenterCustom.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  // If the BindSourceAdapter is not assigned then create it
  if CheckAdapter(True) then
    Result := FBindSourceAdapter;
end;

function TioModelPresenterCustom.GetAsDefault: Boolean;
begin
  Result := FAsDefault;
end;

function TioModelPresenterCustom.GetBOF: Boolean;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.Bof
  else
    Result := True;
end;

function TioModelPresenterCustom.GetCount: Integer;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioModelPresenterCustom.DataObject: TObject;
begin
  // Result := nil;
  Result := GetActiveBindSourceAdapter.DataObject;
end;

function TioModelPresenterCustom.DataObjectAs<T>: T;
var
  LObj: TObject;
begin
  LObj := Self.DataObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LObj);
end;

function TioModelPresenterCustom.DataObjectAssigned: Boolean;
begin
  if CheckAdapter then
    Result := Assigned(GetActiveBindSourceAdapter.DataObject)
  else
    Result := False;
end;

function TioModelPresenterCustom.GetDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere)
  : IioActiveBindSourceAdapter;
begin
  if not Supports(GetActiveBindSourceAdapter.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere), IioActiveBindSourceAdapter, Result) then
    Result := nil;
end;

function TioModelPresenterCustom.GetEditing: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State in seEditModes
  else
    Result := False
end;

function TioModelPresenterCustom.GetEOF: Boolean;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.Eof
  else
    Result := True;
end;

function TioModelPresenterCustom.GetETMfor: IioMasterBindSource;
begin
  Result := FETMfor;
end;

function TioModelPresenterCustom.GetIsInterfacePresenting: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.IsInterfaceBSA
  else
    Result := TioUtilities.IsAnInterfaceTypeName(TypeName);
end;

function TioModelPresenterCustom.GetItemIndex: Integer;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.ItemIndex
  else
    Result := -1;
end;

function TioModelPresenterCustom.GetLoadType: TioLoadType;
begin
  Result := FLoadType;
end;

function TioModelPresenterCustom.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioModelPresenterCustom.GetName: String;
begin
  Result := Name;
end;

function TioModelPresenterCustom.GetOnDeleteConflictException: TioBSOnPersistenceConflictExceptionEvent;
begin
  Result := FOnDeleteConflictException;
end;

function TioModelPresenterCustom.GetOnInsertConflictException: TioBSOnPersistenceConflictExceptionEvent;
begin
  Result := FOnInsertConflictException;
end;

function TioModelPresenterCustom.GetOnReceiveSelectionCloneObject: Boolean;
begin
  Result := FOnReceiveSelectionCloneObject;
end;

function TioModelPresenterCustom.GetOnReceiveSelectionFreeObject: Boolean;
begin
  Result := FOnReceiveSelectionFreeObject;
end;

function TioModelPresenterCustom.GetOnUpdateConflictException: TioBSOnPersistenceConflictExceptionEvent;
begin
  Result := FOnUpdateConflictException;
end;

function TioModelPresenterCustom.GetPaging: TioCommonBSAPageManager;
begin
  Result := FPaging;
end;

function TioModelPresenterCustom.GetSelectorFor: IioBindSource;
begin
  Result := FSelectorFor;
end;

function TioModelPresenterCustom.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

function TioModelPresenterCustom.GetTypeName: String;
begin
  Result := FTypeName;
end;

function TioModelPresenterCustom.GetTypeOfCollection: TioTypeOfCollection;
begin
  Result := FTypeOfCollection;
end;

function TioModelPresenterCustom.GetVirtualFields: Boolean;
begin
  Result := FVirtualFields;
end;

function TioModelPresenterCustom.GetWhere: IioWhere;
begin
  // If the adapter exists the return the property of the adapter
  // else return the Self.FWhere
  if CheckAdapter then
  begin
    Result := FBindSourceAdapter.ioWhere;
    Exit;
  end;
  // if not already assigned then create it (così lo crea solo se serve
  // davvero altrimenti no)
  if not Assigned(FWhere) then
    FWhere := TioWhereFactory.NewWhereWithPagingAndETMfor(FPaging, FETMfor);
  // Return the Where instance
  Result := FWhere;
end;

function TioModelPresenterCustom.Get_Version: String;
begin
  Result := io.Version;
end;

procedure TioModelPresenterCustom.Insert;
begin
  if CheckAdapter then
    (GetActiveBindSourceAdapter as TBindSourceAdapter).Insert;
end;

procedure TioModelPresenterCustom.InitAsDefaultOnCreate;
begin
  // At DesignTime initialize the "AsDefault" property at True if it is the
  // first ModelPresenter inserted (no other presenters presents).
  // NB: At Runtime set False as initial value (load real value from dfm file)
  // NB: The second parameter is FAsDefault private field to avoid deadlock
  TioCommonBSBehavior.InitAsDefaultOnCreate(Self, FAsDefault);
end;

procedure TioModelPresenterCustom.Insert(AObject: TObject);
begin
  if CheckAdapter then
  begin
    GetActiveBindSourceAdapter.Insert(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenterCustom.Last;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Last;
end;

procedure TioModelPresenterCustom.Loaded;
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
    // raise EioException.Create(ClassName, 'Loaded', Format('The "MasterPresenter" property has not been set in the component "%s".' +
    // #13#13'iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the property and try again.', [Name]));
    // MasterBindSource.RegisterDetailBindSource(Self);
    // ----- OLD CODE -----
  end;
  // ===========================================================================

  inherited;
end;

procedure TioModelPresenterCustom.SelectCurrent(ASelectionType: TioSelectionType);
begin
  // C'era un problema se il target è un BS che espone un singolo oggetto e in
  // precedenza era stato impostato il suo dataObject a nil perchè in questo caso negli
  // ObjectBSA il ABSA si disattiva (Active = False) e quindi poi quando faceva
  // il SetDataObject sul TargetBSA dava un errore perchè non era attivo.
  if not FSelectorFor.IsActive then
    FSelectorFor.Open;
  if IsInterfacePresenting then
    TioCommonBSBehavior.Select<IInterface>(Self, FSelectorFor, CurrentAs<IInterface>, ASelectionType)
  else
    TioCommonBSBehavior.Select<TObject>(Self, FSelectorFor, Current, ASelectionType);
end;

function TioModelPresenterCustom.CurrentMasterObject: TObject;
begin
  if CheckAdapter and IsDetailBS then
    Result := GetActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioModelPresenterCustom.CurrentMasterObjectAs<T>: T;
var
  LMasterObject: TObject;
begin
  LMasterObject := Self.CurrentMasterObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LMasterObject);
end;

procedure TioModelPresenterCustom.Next;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Next;
end;

procedure TioModelPresenterCustom.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  TioCommonBSBehavior.Notify(Sender, Self, ANotification);
end;

procedure TioModelPresenterCustom.Open;
begin
  if not Active then
    Active := True;
end;

procedure TioModelPresenterCustom.OpenCloseDetails(const AActive: Boolean);
var
  LDetailBindSource: IioBindSource;
begin
  if Assigned(FDetailBindSourceContainer) then
    for LDetailBindSource in FDetailBindSourceContainer do
      if AActive then
        LDetailBindSource.Open
      else
        LDetailBindSource.Close;
end;

procedure TioModelPresenterCustom.OpenCloseViewBindSources(const AActive: Boolean);
var
  LViewBindSource: IInterface;
begin
  for LViewBindSource in FViewBindSourceContainer do
    if AActive then
      (LViewBindSource as IioVMBridgeClientComponent).Open
    else
      (LViewBindSource as IioVMBridgeClientComponent).Close;
end;

procedure TioModelPresenterCustom.PersistAll;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.PersistAll;
end;

procedure TioModelPresenterCustom.PersistCurrent;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.PersistCurrent;
end;

procedure TioModelPresenterCustom.Post;
begin
  if CheckAdapter and Editing then
    GetActiveBindSourceAdapter.Post;
end;

procedure TioModelPresenterCustom.PostIfEditing;
begin
  if CheckAdapter and Editing then
    Post;
end;

procedure TioModelPresenterCustom.Prior;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Prior;
end;

procedure TioModelPresenterCustom.Refresh(const ANotify: Boolean = True);
begin
  if CheckAdapter then
    FBindSourceAdapter.Refresh(ANotify);
end;

procedure TioModelPresenterCustom.RegisterDetailBindSource(const ADetailBindSource: IioBindSource);
begin
  if not Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer := TList<IioBindSource>.Create;
  if not FDetailBindSourceContainer.Contains(ADetailBindSource) then
    FDetailBindSourceContainer.Add(ADetailBindSource);
end;

procedure TioModelPresenterCustom.UnregisterDetailBindSource(const ADetailBindSource: IioBindSource);
begin
  if not Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer := TList<IioBindSource>.Create;
  if not FDetailBindSourceContainer.Contains(ADetailBindSource) then
    FDetailBindSourceContainer.Remove(ADetailBindSource);
end;

procedure TioModelPresenterCustom.RegisterViewBindSource(const AModelBindSourceOrModelDataSet: IInterface);
begin
  if not Supports(AModelBindSourceOrModelDataSet, IioVMBridgeClientComponent) then
    raise EioGenericException.Create(Self.ClassName, 'RegisterVewBindSource',
      '"AModelBindSourceOrModelDataSet" parameter must be a "IioVMBridgeClientComponent" implementer');
  if not FViewBindSourceContainer.Contains(AModelBindSourceOrModelDataSet) then
  begin
    FViewBindSourceContainer.Add(AModelBindSourceOrModelDataSet);
    if IsActive then
      (AModelBindSourceOrModelDataSet as IioVMBridgeClientComponent).Open
    else
      (AModelBindSourceOrModelDataSet as IioVMBridgeClientComponent).Close;
  end;
end;

procedure TioModelPresenterCustom.SetActive(const Value: Boolean);
begin
  if Value = IsActive then
    Exit;

  if not(csDesigning in ComponentState) then
  begin
    if Value then
    begin
      // Check if the operation (Open) is allowed
      TioCommonBSBehavior.CheckForOpen(Self, LoadType);
      // If we are in the opening of the bind source and we are NOT at design-time then
      // create the active bind source adapter
      CheckAdapter(True);
      DoBeforeOpen;
    end
    else
      DoBeforeClose;
  end;

  // open/close ActiveBindSourceAdapter
  GetActiveBindSourceAdapter.Active := Value;
  // Open/Close all ModelBindSOurce/ModelDataSet registered on this ModelPresenter
  OpenCloseViewBindSources(Value);

  if not(csDesigning in ComponentState) then
  begin
    // Open/Close registered details model presenters
    OpenCloseDetails(Value);
    if Value then
      DoAfterOpen
    else
      DoAfterClose;
  end;

  // ----- OLD CODE -----
  // if CheckAdapter(True) then
  // begin
  // GetActiveBindSourceAdapter.Active := Value;
  // // Open/Close all ModelBindSOurce/ModelDataSet registered on this ModelPresenter
  // OpenCloseViewBindSources(Value);
  // // Open/Close registered details model presenters
  // OpenCloseDetails(Value);
  // end;
  // ----- OLD CODE -----
end;

procedure TioModelPresenterCustom.SetAsDefault(const Value: Boolean);
begin
  TioCommonBSBehavior.SetAsDefaultPropertyOfAllBindSourcesToFalse(Owner, Value);
  FAsDefault := Value;
end;

procedure TioModelPresenterCustom.SetAsyncLoad(const Value: Boolean);
begin
  FAsyncLoad := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.AsyncLoad := Value;
end;

procedure TioModelPresenterCustom.SetAsyncPersist(const Value: Boolean);
begin
  FAsyncPersist := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.AsyncPersist := Value;
end;

procedure TioModelPresenterCustom.SetLazy(const Value: Boolean);
begin
  FLazy := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.Lazy := Value;
end;

procedure TioModelPresenterCustom.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.LazyProps := Value;
end;

procedure TioModelPresenterCustom.SetLoadType(const Value: TioLoadType);
begin
  FLoadType := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.LoadType := Value;
end;

procedure TioModelPresenterCustom.SetActiveBindSourceAdapter(const Value: IioActiveBindSourceAdapter);
begin
  if Value = FBindSourceAdapter then
    Exit;
  FBindSourceAdapter := Value;
  // Set some properties
  FBindSourceAdapter.AsyncLoad := FAsyncLoad;
  FBindSourceAdapter.AsyncPersist := FAsyncPersist;
  FBindSourceAdapter.ioWhereDetailsFromDetailAdapters := FWhereDetailsFromDetailAdapters;
  FBindSourceAdapter.ioWhere := GetWhere; // Do not directly access to the FWhere field here
  FBindSourceAdapter.LoadType := FLoadType;
  FBindSourceAdapter.Lazy := FLazy;
  FBindSourceAdapter.LazyProps := FLazyProps;
  // Register itself for notifications from BindSourceAdapter
  FBindSourceAdapter.SetBindSource(Self);
end;

// procedure TioModelPresenter.SetMasterBindSourceAdapter(
// const AMasterBindSourceAdapter: IioActiveBindSourceAdapter;
// const AMasterPropertyName: String);
// var
// LBindSourceAdapter: TBindSourceAdapter;
// begin
// // Get the BSAdapter from the MasterBindSourceAdapter and register Self for
// //  notifications
// LBindSourceAdapter := TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(
// Self,
// AMasterBindSourceAdapter,
// AMasterPropertyName,
// FWhere
// );
// Self.SetBindSourceAdapter(LBindSourceAdapter);
// end;

procedure TioModelPresenterCustom.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // If the ADataObject is assigned then set it as the BSA DataObject...else ClearDataObject
  if Assigned(ADataObject) then
  begin
    if CheckActiveAdapter then
      GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
    else
      _CreateAdapter(ADataObject, AOwnsObject);
    // NB: Ho dovuto attivare automaticamnete il BindSource (nel caso non lo fosse già) perchè
    //  altrimenti avevo degli AV dovuti al fatto che il BSA non esisteva
    if not IsActive then
      Open;
  end
  else
    ClearDataObject;
end;

procedure TioModelPresenterCustom.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  // If the ADataObject is assigned then set it as the BSA DataObject...else ClearDataObject
  if Assigned(ADataObject) then
  begin
    if CheckActiveAdapter then
      GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
    else
      _CreateAdapter(ADataObject as TObject, AOwnsObject);
    // NB: Ho dovuto attivare automaticamnete il BindSource (nel caso non lo fosse già) perchè
    //  altrimenti avevo degli AV dovuti al fatto che il BSA non esisteva
    if not IsActive then
      Open;
  end
  else
    ClearDataObject;
end;

procedure TioModelPresenterCustom.SetETMfor(const AETMfor: IioMasterBindSource);
begin
  TioCommonBSBehavior.SetETMfor(Self, AETMfor, ComponentState);
end;

procedure TioModelPresenterCustom.SetItemIndex(const Value: Integer);
begin
  if CheckAdapter then
    FBindSourceAdapter.ItemIndex := Value
  else
    raise EioGenericException.Create(Self.ClassName, 'SetItemindex', 'Unassigned BindSourceAdapter');
end;

procedure TioModelPresenterCustom.SetMasterBindSource(const Value: IioBindSource);
begin
  FMasterBindSource := Value;
end;

procedure TioModelPresenterCustom.SetMasterPropertyName(const Value: String);
begin
  FMasterPropertyName := Trim(Value);
end;

procedure TioModelPresenterCustom.SetOnDeleteConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
begin
  FOnDeleteConflictException := APersistenceConflictEventHandler;
end;

procedure TioModelPresenterCustom.SetOnInsertConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
begin
  FOnInsertConflictException := APersistenceConflictEventHandler;
end;

procedure TioModelPresenterCustom.SetOnReceiveSelectionCloneObject(const Value: Boolean);
begin
  FOnReceiveSelectionCloneObject := Value;
end;

procedure TioModelPresenterCustom.SetOnReceiveSelectionFreeObject(const Value: Boolean);
begin
  FOnReceiveSelectionFreeObject := Value;
end;

procedure TioModelPresenterCustom.SetOnUpdateConflictException(const APersistenceConflictEventHandler: TioBSOnPersistenceConflictExceptionEvent);
begin
  FOnUpdateConflictException := APersistenceConflictEventHandler;
end;

procedure TioModelPresenterCustom.SetOrderBy(const Value: String);
begin
  // Set the OrderBy in the Where object (questo ha veramnete effetto, FOrderBY
  // contiene il testo solo per pubblicarne il valore come proprietà editabile
  // a design-time sul componente.
  FOrderBy := Value;
  Where.SetOrderBySQL(Value);
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioWhere.SetOrderBySQL(Value);
end;

procedure TioModelPresenterCustom.SetPaging(const Value: TioCommonBSAPageManager);
begin
  // In reality this property would be read-only but if I left it read-only
  // then it no longer writes me the values of the sub-properties in the DFM file.
  // So I also put the set method where, however, I raise an exception if someone
  // tries to set a value.
  raise EioGenericException.Create(ClassName, 'SetPaging', 'This property "Paging" is not writable');
end;

procedure TioModelPresenterCustom.SetSelectorFor(const ATargetBindSource: IioBindSource);
begin
  FSelectorFor := ATargetBindSource;
end;

procedure TioModelPresenterCustom.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.TypeAlias := Value;
end;

procedure TioModelPresenterCustom.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.TypeName := Value;
end;

procedure TioModelPresenterCustom.SetTypeOfCollection(const Value: TioTypeOfCollection);
begin
  FTypeOfCollection := Value;
end;

procedure TioModelPresenterCustom.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioAutoPost := Value;
end;

procedure TioModelPresenterCustom.SetAutoRefreshOnNotification(const Value: Boolean);
begin
  FAutoRefreshOnNotification := Value;
end;

procedure TioModelPresenterCustom.SetWhere(const AWhere: IioWhere);
begin
  AWhere.SetPagingObj(FPaging); // Inject paging object specified in the BindSource
  AWhere.SetETMfor(FETMfor); // Inject ETMfor BS specified in the BindSource
  FWhere := AWhere;
  // Update the adapter where in the BSAdapter if exist
  if CheckAdapter then
    FBindSourceAdapter.ioWhere := AWhere;
end;

procedure TioModelPresenterCustom.SetWhereDetailsFromDetailAdapters(const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckAdapter then
    FBindSourceAdapter.ioWhereDetailsFromDetailAdapters := Value;
end;

procedure TioModelPresenterCustom.SetWhereStr(const Value: TStrings);
begin
  FWhereStr.Assign(Value);
  // If in DesignTime then Exit
  // NB: Mettendo questa linea di codice ho risolto il problema che i ioPBS
  // anche se erano con "AutoActivate=False" quando veniva aperta (caricata)
  // la form che li conteneva a design time apparivano cmq con i dati finti di
  // prova anzichè rimanere vuoti.
  if (csDesigning in ComponentState) then
    Exit;
  // Set the onChange event handler
  (FWhereStr as TStringList).OnChange := WhereOnChangeEventHandler;
  // Update the adapter where property
  WhereOnChangeEventHandler(Self);
end;

procedure TioModelPresenterCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AViewContext, AVVMAlias);
end;

procedure TioModelPresenterCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AVVMAlias);
end;

procedure TioModelPresenterCustom.ShowCurrent(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
const AVVMAlias: String);
begin
  io.ShowCurrent(Self, AParentCloseQueryAction, AVCProvider, AVVMAlias);
end;

procedure TioModelPresenterCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AViewContext, AAlias);
end;

procedure TioModelPresenterCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AVVMAlias);
end;

procedure TioModelPresenterCustom.UnregisterViewBindSource(const AModelBindSourceOrModelDataSet: IInterface);
begin
  if not Supports(AModelBindSourceOrModelDataSet, IioVMBridgeClientComponent) then
    raise EioGenericException.Create(Self.ClassName, 'RegisterVewBindSource',
      '"AModelBindSourceOrModelDataSet" parameter must be a "IioVMBridgeClientComponent" implementer');
  if FViewBindSourceContainer.Contains(AModelBindSourceOrModelDataSet) then
  begin
    (AModelBindSourceOrModelDataSet as IioVMBridgeClientComponent).Close;
    FViewBindSourceContainer.Extract(AModelBindSourceOrModelDataSet);
  end;
end;

procedure TioModelPresenterCustom.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
const AVVMAlias: String);
begin
  io.ShowEach(Self, AParentCloseQueryAction, AVCProvider, AVVMAlias);
end;

procedure TioModelPresenterCustom.WhereOnChangeEventHandler(Sender: TObject);
begin
  // Delete all previous criteria (_Where) and add the new criteria text
  Where._Where(FWhereStr.Text);
  // OLD_CODE
  // Self.SetWhere(TioWhereFactory.NewWhere.Add(FWhereStr.Text));
end;

procedure TioModelPresenterCustom._CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // If an adapter already exists then raise an exception
  if Assigned(FBindSourceAdapter) then
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
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetBSA(nil, Name, TypeName, TypeAlias, Where, TypeOfCollection, ADataObject, AOwnsObject));
    // Force the creation of all the detail adapters (if exists)
    // NB: Per risolvere alcuni problemi di sequenza (tipo le condizioni in WhereStr di dettaglio che non
    // funzionavano perchè al momento di apertura del MasterAdapter i DetailAdapters non erano ancora nemmeno
    // stati creati) forzo la creazione anche di tutti gli adapters di dettaglio al momento della creazione
    // del Master.
    ForceDetailAdaptersCreation;
  end;

  // Init the BSA
  FBindSourceAdapter.ioAutoPost := FAutoPost;
end;

procedure TioModelPresenterCustom._InternalSetETMforPrivateField(const AETMFor: IioBindSource);
begin
  FETMfor := AETMfor as IioMasterBindSource;
end;

procedure TioModelPresenterCustom.Insert(AObject: IInterface);
begin
  if CheckAdapter then
  begin
    GetActiveBindSourceAdapter.Insert(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // BindSourceAdapter.Refresh(False);
  end;
end;

// function TioModelPresenterCustom.IsActive: Boolean;
// begin
// Result := CheckAdapter and FBindSourceAdapter.Active;
// end;

function TioModelPresenterCustom.IsActive: Boolean;
begin
  Result := Active;
end;

function TioModelPresenterCustom.IsFromBSLoadType: Boolean;
begin
  Result := TioCommonBSBehavior.CheckIfLoadTypeIsFromBS(FLoadType);
end;

class function TioModelPresenterCustom.IsValidForDependencyInjectionLocator(const AModelPresenter: TioModelPresenterCustom;
const ACheckCurrentObj, ARaiseExceptions: Boolean): Boolean;
begin
  // Init
  Result := True;
  // Check the ModelPresenter
  Result := Result and Assigned(AModelPresenter);
  if ARaiseExceptions and not Result then
    raise EioGenericException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', 'Parameter "AModelPresenter" not assigned.');
  // Check the bind source adapter
  Result := Result and AModelPresenter.CheckAdapter;
  if ARaiseExceptions and not Result then
    raise EioGenericException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator',
      'ActiveBindSourceAdapter not assigned in the "AModelPresenter" parameter.');
  // Check the ModelPresenter.Current object
  if not ACheckCurrentObj then
    Exit;
  Result := Result and (AModelPresenter.Current <> nil);
  if ARaiseExceptions and not Result then
    raise EioGenericException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', '"Current" object of the ModelPresenter not assigned.');
end;

end.
