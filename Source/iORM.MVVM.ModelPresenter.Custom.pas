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

unit iORM.MVVM.ModelPresenter.Custom;

interface

uses
  System.Classes, iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.ObjectScope,
  System.Generics.Collections, iORM.MVVM.ViewContextProvider,
  System.Rtti, iORM.LiveBindings.CommonBSAPaging, System.SysUtils;

type

  TioModelPresenterCustom = class abstract(TComponent, IioNotifiableBindSource)
  private
    FAsDefault: Boolean;
    FBindSourceAdapter: IioActiveBindSourceAdapter;
    FTypeName, FTypeAlias: String;
    FAsync: Boolean;
    FLoadType: TioLoadType;
    FLazy: Boolean;
    FLazyProps: String;
    FTypeOfCollection: TioTypeOfCollection;
    FWhere: IioWhere; // Istanza temporanea solo fintanto che non c'è il BSA
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FMasterPresenter: TioModelPresenterCustom;
    FMasterPropertyName: String;
    FAutoRefreshOnNotification: Boolean;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    // Selectors
    FSelectorFor: TioModelPresenterCustom;
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
    FDetailPresentersContainer: TList<TioModelPresenterCustom>;
    // Collezione alla quale i ModelBindSource/ModelDataSet si registrano per rendere nota
    //  la loro presenza e rendere possibile l'attivazione/disattivazione di se stessi da
    //  parte del ModelPresenter al quale sono collegati
    //  NB: IInterface per evitare un circular reference error
    FViewBindSourceContainer: TList<IInterface>;
    // Questo è un riferimento di tipo interfaccia e serve solo per
    // mantenere in vita l'oggetto
    // FDummyInterfaceRef: IInterface; NB: Hint prevention "symbol declared but never used"
    // Selection related events
    FonBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonSelectionObject: TioBSASelectionObjectEvent;
    FonAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    FonSelectionInterface: TioBSASelectionInterfaceEvent;
    FonAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    // Methods
    procedure WhereOnChangeEventHandler(Sender: TObject);
    function AdapterExists: Boolean; // IioNotifiableBindSource
    procedure OpenCloseViewBindSources(const AActive: Boolean);
    procedure OpenCloseDetails(const AActive: Boolean);
    // AsDefault
    procedure SetAsDefault(const Value: Boolean);
    procedure InitAsDefaultOnCreate;
    // Async
    procedure SetAsync(const Value: Boolean);
    // LoadType
    procedure SetLoadType(const Value: TioLoadType);
    function GetLoadType: TioLoadType;
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
    // State
    function GetState: TBindSourceAdapterState;
    // TypeAlias
    procedure SetTypeAlias(const Value: String);
    // TypeName
    procedure SetTypeName(const Value: String);
    // Where
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    // WhereDetailsFromDetailAdapters
    procedure SetWhereDetailsFromDetailAdapters(const Value: Boolean);
    // WhereStr
    procedure SetWhereStr(const Value: TStrings);
  protected
    procedure Open; virtual;
    procedure Close; virtual;
    procedure Loaded; override;
    function IsMasterBS: Boolean; virtual; abstract;
    function IsDetailBS: Boolean; virtual; abstract;
    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean); virtual;
    // Active
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean); virtual;
    // MasterPresenter
    procedure SetMasterPresenter(const Value: TioModelPresenterCustom); virtual;
    // Selectors related event for TObject selection
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    procedure DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean); overload;
    procedure DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType); overload;
    // Public properties
    property Editing: Boolean read GetEditing; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting; // public: Nascondere? Serve all'esterno?
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property Active: Boolean read GetActive write SetActive; // Public: Master+Detail
    property ItemIndex: Integer read GetItemIndex write SetItemIndex; // Public: Master+Detail
    property Bof: Boolean read GetBOF; // Public: Master+Detail
    property Eof: Boolean read GetEOF; // Public: Master+Detail
    // Published properties
    property Async: Boolean read FAsync write SetAsync default False; // Published: Master
    property LoadType: TioLoadType read GetLoadType write SetLoadType default ltManual; // Published: Master
    property Lazy: Boolean read FLazy write SetLazy default False; // published: Master
    property LazyProps: String read FLazyProps write SetLazyProps; // published: Master
    property AutoPost: Boolean read GetAutoPost write SetAutoPost default True; // published: Nascondere e default = True
    property AutoRefreshOnNotification: Boolean read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification default True; // published: Nascondere e default = false
    property TypeAlias: String read FTypeAlias write SetTypeAlias;
    property TypeOfCollection: TioTypeOfCollection read FTypeOfCollection write FTypeOfCollection default tcList;
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters default False; // published: Nascondere e default = false
    property WhereStr: TStrings read FWhereStr write SetWhereStr; // Published: Master
    // Published properties: paging
    property Paging: TioCommonBSAPageManager read GetPaging write SetPaging; // published: Master
    // Published properties: selectors
    property OnReceiveSelectionCloneObject: Boolean read GetOnReceiveSelectionCloneObject write SetOnReceiveSelectionCloneObject default True; // published: Master+Detail
    property OnReceiveSelectionFreeObject: Boolean read GetOnReceiveSelectionFreeObject write SetOnReceiveSelectionFreeObject default True; // published: Master+Detail
    // Published Events: selectors
    property OnBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonBeforeSelectionObject write FonBeforeSelectionObject;
    property OnSelectionObject: TioBSASelectionObjectEvent read FonSelectionObject write FonSelectionObject;
    property OnAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonAfterSelectionObject write FonAfterSelectionObject;
    property OnBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonBeforeSelectionInterface write FonBeforeSelectionInterface;
    property OnSelectionInterface: TioBSASelectionInterfaceEvent read FonSelectionInterface write FonSelectionInterface;
    property OnAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonAfterSelectionInterface write FonAfterSelectionInterface;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function IsValidForDependencyInjectionLocator(const AModelPresenter: TioModelPresenterCustom; const ACheckCurrentObj, ARaiseExceptions: Boolean): Boolean;
    procedure SetActiveBindSourceAdapter(const Value: IioActiveBindSourceAdapter);
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function CheckAdapter(const ACreateIfNotAssigned: Boolean = False): Boolean;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    // procedure SetMasterBindSourceAdapter(const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String='');
    procedure RegisterDetailPresenter(const ADetailPresenter: TioModelPresenterCustom);

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
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // Show current record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowCurrent(const AAlias: String = ''; const AVCProviderName: String = ''); overload;
    procedure ShowCurrent(const AVCProvider: TioViewContextProvider; const AAlias: String = ''); overload;
    procedure ShowCurrent(const AViewContext: TComponent; const AAlias: String = ''); overload;
    // Show each record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowEach(const AAlias: String = ''; const AVCProviderName: String = ''); overload;
    procedure ShowEach(const AVCProvider: TioViewContextProvider; const AAlias: String = ''); overload;
    procedure ShowEach(const AViewContext: TComponent; const AAlias: String = ''); overload;
    // DataObject
    procedure ClearDataObject;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    function DataObjectAssigned: Boolean;
    // ----------------------------------------------------------------------------------------------------------------------------
    // NB: Queste sotto sono proprietà lasciate in public perchè usate in qualche parte del codice
    property AsDefault: Boolean read FAsDefault write SetAsDefault; // Published: Master
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    property MasterPresenter: TioModelPresenterCustom read FMasterPresenter write SetMasterPresenter; // Published: Detail
    property MasterPropertyName: String read GetMasterPropertyName write SetMasterPropertyName; // Published: Detail
    property OrderBy: String read FOrderBy Write SetOrderBy; // Published: Master
    property TypeName: String read FTypeName write SetTypeName; // Published: Master
    property Where: IioWhere read GetWhere write SetWhere; // public: Master
    // Published properties: selectors (NB: lasciata public perchè usata da qualche parte nel codice)
    property SelectorFor: TioModelPresenterCustom read FSelectorFor write FSelectorFor; // published: Master
  end;

implementation

uses
  iORM.Where.Factory, iORM.LiveBindings.Factory,
  iORM.Exceptions, iORM.Utilities, iORM, iORM.Components.Common,
  iORM.LiveBindings.CommonBSBehavior, iORM.LiveBindings.BSPersistence,
  iORM.Components.Common.Interfaces;

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

function TioModelPresenterCustom.AdapterExists: Boolean;
begin
  Result := CheckAdapter(False);
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
  FAutoPost := False;
  FAutoRefreshOnNotification := True;
  FAsync := False;
  FLoadType := ltManual;
  FLazy := False;
  FLazyProps := '';
  FTypeOfCollection := tcList;
  FWhere := nil;
  FWhereDetailsFromDetailAdapters := False;
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
  FDetailPresentersContainer := nil;
  // Collezione alla quale i ModelBindSource/ModelDataSet si registrano per rendere nota
  //  la loro presenza e rendere possibile l'attivazione/disattivazione di se stessi da
  //  parte del ModelPresenter al quale sono collegati
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
  // Destroy the BindSourceAdapter was created then destroy it
  if CheckAdapter then
    FBindSourceAdapter.Free;
  // Collezione alla quale i ModelBindSource/ModelDataSet si registrano per rendere nota
  //  la loro presenza e rendere possibile l'attivazione/disattivazione di se stessi da
  //  parte del ModelPresenter al quale sono collegati
  FViewBindSourceContainer.Free;
  // If the DetailPresenterContainer was created then destroy it
  if Assigned(FDetailPresentersContainer) then
    FDetailPresentersContainer.Free;
  // Destroy paging object
  FPaging.Free;
  inherited;
end;

procedure TioModelPresenterCustom.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionInterface) then
    FonAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenterCustom.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionObject) then
    FonAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenterCustom.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionInterface) then
    FonBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenterCustom.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionObject) then
    FonBeforeSelectionObject(Self, ASelected, ASelectionType);
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
  LPresenter: TioModelPresenterCustom;
begin
  if Assigned(FDetailPresentersContainer) then
    for LPresenter in FDetailPresentersContainer do
      LPresenter.CheckAdapter(True);
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

function TioModelPresenterCustom.GetOnReceiveSelectionCloneObject: Boolean;
begin
  Result := FOnReceiveSelectionCloneObject;
end;

function TioModelPresenterCustom.GetOnReceiveSelectionFreeObject: Boolean;
begin
  Result := FOnReceiveSelectionFreeObject;
end;

function TioModelPresenterCustom.GetPaging: TioCommonBSAPageManager;
begin
  Result := FPaging;
end;

function TioModelPresenterCustom.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
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
    FWhere := TioWhereFactory.NewWhereWithPaging(FPaging);
  // Return the Where instance
  Result := FWhere;
end;

procedure TioModelPresenterCustom.Insert;
begin
  if CheckAdapter then
    (GetActiveBindSourceAdapter as TBindSourceAdapter).Insert;
end;

procedure TioModelPresenterCustom.InitAsDefaultOnCreate;
var
  I: Integer;
  LComponent: TObject;
begin
  // At DesignTime initialize the "AsDefault" property at True if it is the
  // first ModelPresenter inserted (no other presenters presents).
  // NB: At Runtime set False as initial value (load real value from dfm file)
  if (csDesigning in ComponentState) then
  begin
    FAsDefault := True;
    for I := 0 to Owner.ComponentCount - 1 do
    begin
      LComponent := Owner.Components[I];
      // If the current component supports the IioBSPersistenceClient then it's a ModelPresenterMaster
      if (LComponent is TioModelPresenterCustom) and Supports(LComponent, IioBSPersistenceClient) and (LComponent <> Self) then
      begin
        FAsDefault := False;
        Exit;
      end;
    end;
  end
  else
    FAsDefault := False;
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
  if IsDetailBS then
    MasterPresenter.RegisterDetailPresenter(Self);
  // ===========================================================================

  inherited;
end;

procedure TioModelPresenterCustom.SelectCurrent(ASelectionType: TioSelectionType);
begin
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
  LDetailModelPresenter: TioModelPresenterCustom;
begin
  if Assigned(FDetailPresentersContainer) then
    for LDetailModelPresenter in FDetailPresentersContainer do
      if AActive then
        LDetailModelPresenter.Open
      else
        LDetailModelPresenter.Close;
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

procedure TioModelPresenterCustom.RegisterDetailPresenter(const ADetailPresenter: TioModelPresenterCustom);
begin
  if not Assigned(FDetailPresentersContainer) then
    FDetailPresentersContainer := TList<TioModelPresenterCustom>.Create;
  FDetailPresentersContainer.Add(ADetailPresenter);
end;

procedure TioModelPresenterCustom.RegisterViewBindSource(const AModelBindSourceOrModelDataSet: IInterface);
begin
  if not Supports(AModelBindSourceOrModelDataSet, IioVMBridgeClientComponent) then
    raise EioException.Create(Self.ClassName, 'RegisterVewBindSource', '"AModelBindSourceOrModelDataSet" parameter must be a "IioVMBridgeClientComponent" implementer');
  if not FViewBindSourceContainer.Contains(AModelBindSourceOrModelDataSet) then
    FViewBindSourceContainer.Add(AModelBindSourceOrModelDataSet);
end;

procedure TioModelPresenterCustom.SetActive(const Value: Boolean);
begin
  if CheckAdapter(True) then
  begin
    GetActiveBindSourceAdapter.Active := Value;
    // Open/Close all ModelBindSOurce/ModelDataSet registered on this ModelPresenter
    OpenCloseViewBindSources(Value);
    // Open/Close registered details model presenters
    OpenCloseDetails(Value);
  end;
end;

procedure TioModelPresenterCustom.SetAsDefault(const Value: Boolean);
var
  I: Integer;
begin
  // Uncheck AsDefault property for all presenters
  if Value then
    for I := 0 to Owner.ComponentCount - 1 do
      if (Owner.Components[I] is TioModelPresenterCustom) then
        TioModelPresenterCustom(Owner.Components[I]).AsDefault := False;
  // Set the value
  FAsDefault := Value;
end;

procedure TioModelPresenterCustom.SetAsync(const Value: Boolean);
begin
  FAsync := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioAsync := Value;
end;

procedure TioModelPresenterCustom.SetLazy(const Value: Boolean);
begin
  FLazy := Value;
end;

procedure TioModelPresenterCustom.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
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
  FBindSourceAdapter.ioAsync := FAsync;
  FBindSourceAdapter.ioWhereDetailsFromDetailAdapters := FWhereDetailsFromDetailAdapters;
  FBindSourceAdapter.ioWhere := FWhere;
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
  TioCommonBSBehavior.CheckForSetDataObject(LoadType);
  if not Assigned(ADataObject) then
    ClearDataObject;
  // if the adapter is not already assigned then create it
  if not CheckAdapter then
    // Create the BSA
    _CreateAdapter(ADataObject, AOwnsObject)
  else
    // Set the data object into the BSA
    GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
end;

procedure TioModelPresenterCustom.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  TioCommonBSBehavior.CheckForSetDataObject(LoadType);
  if not Assigned(ADataObject) then
    ClearDataObject;
  // if the adapter is not already assigned then create it
  if not CheckAdapter then
    // Create the BSA
    // NB: Nel caso in cui si sita impostando il DataObject ma il BSA non era ancora creato lo crea (il BSA)
    // usando il ClassName dell'oggetto; in questo modo siamo sicuri che abbiamo il BSA più
    // adatto e non uno che magari è più generico e a cui mancano alcune proprietà (è successo).
    _CreateAdapter(ADataObject as TObject, AOwnsObject)
  else
    // Set the data object into the BSA
    GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
end;

procedure TioModelPresenterCustom.SetItemIndex(const Value: Integer);
begin
  if CheckAdapter then
    FBindSourceAdapter.ItemIndex := Value
  else
    raise EioException.Create(Self.ClassName, 'SetItemindex', 'Unassigned BindSourceAdapter');
end;

procedure TioModelPresenterCustom.SetMasterPresenter(const Value: TioModelPresenterCustom);
begin
  FMasterPresenter := Value;
end;

procedure TioModelPresenterCustom.SetMasterPropertyName(const Value: String);
begin
  FMasterPropertyName := Trim(Value);
end;

procedure TioModelPresenterCustom.SetOnReceiveSelectionCloneObject(const Value: Boolean);
begin
  FOnReceiveSelectionCloneObject := Value;
end;

procedure TioModelPresenterCustom.SetOnReceiveSelectionFreeObject(const Value: Boolean);
begin
  FOnReceiveSelectionFreeObject := Value;
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
  raise EioException.Create(ClassName, 'SetPaging', 'This property "Paging" is not writable');
end;

procedure TioModelPresenterCustom.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioTypeAlias := Value;
end;

procedure TioModelPresenterCustom.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioTypeName := Value;
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
  AWhere.SetPagingObj(FPaging); // Inject paging object spscified in BindSource or ModelPresenter
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

procedure TioModelPresenterCustom.ShowCurrent(const AViewContext: TComponent; const AAlias: String);
begin
  io.ShowCurrent(Self, AViewContext, AAlias);
end;

procedure TioModelPresenterCustom.ShowCurrent(const AVCProvider: TioViewContextProvider; const AAlias: String);
begin
  io.ShowCurrent(Self, AVCProvider, AAlias);
end;

procedure TioModelPresenterCustom.ShowCurrent(const AAlias: String; const AVCProviderName: String);
begin
  io.ShowCurrent(Self, AAlias, AVCProviderName);
end;

procedure TioModelPresenterCustom.ShowEach(const AViewContext: TComponent; const AAlias: String);
begin
  io.ShowEach(Self, AViewContext, AAlias);
end;

procedure TioModelPresenterCustom.UnregisterViewBindSource(const AModelBindSourceOrModelDataSet: IInterface);
begin
  if not Supports(AModelBindSourceOrModelDataSet, IioVMBridgeClientComponent) then
    raise EioException.Create(Self.ClassName, 'RegisterVewBindSource', '"AModelBindSourceOrModelDataSet" parameter must be a "IioVMBridgeClientComponent" implementer');
  if FViewBindSourceContainer.Contains(AModelBindSourceOrModelDataSet) then
    FViewBindSourceContainer.Extract(AModelBindSourceOrModelDataSet);
end;

procedure TioModelPresenterCustom.ShowEach(const AVCProvider: TioViewContextProvider; const AAlias: String);
begin
  io.ShowEach(Self, AVCProvider, AAlias);
end;

procedure TioModelPresenterCustom.ShowEach(const AAlias: String; const AVCProviderName: String);
begin
  io.ShowEach(Self, AAlias, AVCProviderName);
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
    raise EioException.Create(ClassName, '_CreateAdapter', 'Active bind source adapter already exists.');
  // if the TypeName is empty then set it
  if IsMasterBS and TypeName.IsEmpty then
    raise EioException.Create(ClassName, '_CreateAdapter', 'ModelPresenter.TypeName value is not valid.');
  // If the property MasterModelPresenter is assigned then retrieve
  // the DetailBindSourceAdapter from it
  if Assigned(MasterPresenter) then
    // Get the BindSourceAdapter
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(nil, MasterPresenter.GetActiveBindSourceAdapter, MasterPropertyName))
    // else create the BSA from TypeName & TypeAlias
  else
  begin
    // Get the ActiveBindSourceAdapter
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetBSA(nil, TypeName, TypeAlias, Where, TypeOfCollection, ADataObject, AOwnsObject));
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

//function TioModelPresenterCustom.IsActive: Boolean;
//begin
//  Result := CheckAdapter and FBindSourceAdapter.Active;
//end;

function TioModelPresenterCustom.IsActive: Boolean;
begin
  Result := Active;
end;

class function TioModelPresenterCustom.IsValidForDependencyInjectionLocator(const AModelPresenter: TioModelPresenterCustom;
const ACheckCurrentObj, ARaiseExceptions: Boolean): Boolean;
begin
  // Init
  Result := True;
  // Check the ModelPresenter
  Result := Result and Assigned(AModelPresenter);
  if ARaiseExceptions and not Result then
    raise EioException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', 'Parameter "AModelPresenter" not assigned.');
  // Check the bind source adapter
  Result := Result and AModelPresenter.CheckAdapter;
  if ARaiseExceptions and not Result then
    raise EioException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator',
      'ActiveBindSourceAdapter not assigned in the "AModelPresenter" parameter.');
  // Check the ModelPresenter.Current object
  if not ACheckCurrentObj then
    Exit;
  Result := Result and (AModelPresenter.Current <> nil);
  if ARaiseExceptions and not Result then
    raise EioException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', '"Current" object of the ModelPresenter not assigned.');
end;

end.
