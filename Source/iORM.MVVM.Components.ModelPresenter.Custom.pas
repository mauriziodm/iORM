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

unit iORM.MVVM.Components.ModelPresenter.Custom;

interface

uses
  System.Classes, iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.ObjectScope,
  System.Generics.Collections, iORM.MVVM.Components.ViewContextProvider,
  System.Rtti, System.SysUtils, iORM.LiveBindings.CommonBSAPaging;

type

  TioModelPresenter = class abstract(TComponent, IioNotifiableBindSource)
  private
    FAsDefault: Boolean;
    FBindSourceAdapter: IioActiveBindSourceAdapter;
    FTypeName, FTypeAlias: String;
    FAsync: Boolean;
    FAutoLoadData: Boolean;
    FAutoPersist: Boolean;
    FViewDataType: TioViewDataType;
    FWhere: IioWhere; // Istanza temporanea solo fintanto che non c'� il BSA
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FMasterPresenter: TioModelPresenter;
    FMasterPropertyName: String;
    FAutoRefreshOnNotification: TioAutoRefreshType;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    // Selectors
    FSelectorFor: TioModelPresenter;
    FOnReceiveSelectionCloneObject: Boolean;
    FOnReceiveSelectionFreeObject: Boolean;
    // Quest� � una collezione dove eventuali ModelPresenters di dettaglio
    // si registrano per rendere nota la loro esistenza al Master. Sar� poi
    // usata dal Master per fare in modo che, quando viene richiesta la creazione
    // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
    // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
    // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
    // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
    // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
    // DesignTime (WhereStr property) non funzionassero per questo motivo.
    FDetailPresentersContainer: TList<TioModelPresenter>;
    // Questo � un riferimento di tipo interfaccia e serve solo per
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
    procedure _CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
    procedure WhereOnChangeEventHandler(Sender: TObject);
    // Active
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
    // AsDefault
    procedure SetAsDefault(const Value: Boolean);
    procedure InitAsDefaultOnCreate;
    // Async
    procedure SetAsync(const Value: Boolean);
    // AutoLoadData
    procedure SetAutoLoadData(const Value: Boolean);
    // AutoPersist
    procedure SetAutoPersist(const Value: Boolean);
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    // AutoRefreshOnNotification;
    function GetAutoRefreshOnNotification: TioAutoRefreshType;
    procedure SetAutoRefreshOnNotification(const Value: TioAutoRefreshType);
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
    procedure Loaded; override;
    function IsMasterBS: Boolean; virtual; abstract;
    function IsDetailBS: Boolean; virtual; abstract;
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
    property AutoLoadData: Boolean read FAutoLoadData write SetAutoLoadData default True; // Published: Master
    property AutoPersist: Boolean read FAutoPersist write SetAutoPersist default False; // Da eliminare tutto il discorso AutoPersist
    property AutoPost: Boolean read GetAutoPost write SetAutoPost default True; // published: Nascondere e default = True
    property AutoRefreshOnNotification: TioAutoRefreshType read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification default TioAutoRefreshType.arEnabledNoReload; // published: Nascondere e default = false
    property TypeAlias: String read FTypeAlias write SetTypeAlias;
    property ViewDataType: TioViewDataType read FViewDataType write FViewDataType;
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters default False; // published: Nascondere e default = false
    property WhereStr: TStrings read FWhereStr write SetWhereStr; // Published: Master
    // Published properties: paging
    property ioPaging: TioCommonBSAPageManager read GetPaging write SetPaging; // published: Master
    // Published properties: selectors
    property ioOnReceiveSelectionCloneObject: Boolean read FOnReceiveSelectionCloneObject write FOnReceiveSelectionCloneObject default True; // published: Master+Detail
    property ioOnReceiveSelectionFreeObject: Boolean read FOnReceiveSelectionFreeObject write FOnReceiveSelectionFreeObject default True; // published: Master+Detail
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
    class function IsValidForDependencyInjectionLocator(const AModelPresenter: TioModelPresenter; const ACheckCurrentObj, ARaiseExceptions: Boolean): Boolean;
    procedure SetActiveBindSourceAdapter(const Value: IioActiveBindSourceAdapter);
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function CheckAdapter(const ACreateIfNotAssigned: Boolean = False): Boolean;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    // procedure SetMasterBindSourceAdapter(const AMasterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String='');
    procedure RegisterDetailPresenter(const ADetailPresenter: TioModelPresenter);
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
    function Current: TObject;
    function CurrentAs<T>: T;
    function CurrentMasterObject: TObject;
    function CurrentMasterObjectAs<T>: T;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True); overload;
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
    function GetNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
    procedure Select<T>(AInstance: T; ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // Show current record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowCurrent(const AAlias: String = ''; const AVCProviderName: String = ''); overload;
    procedure ShowCurrent(const AVCProvider: TioViewContextProvider; const AAlias: String = ''); overload;
    procedure ShowCurrent(const AViewContext: TComponent; const AAlias: String = ''); overload;
    // Show each record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    procedure ShowEach(const AAlias: String = ''; const AVCProviderName: String = ''); overload;
    procedure ShowEach(const AVCProvider: TioViewContextProvider; const AAlias: String = ''); overload;
    procedure ShowEach(const AViewContext: TComponent; const AAlias: String = ''); overload;
    // ----------------------------------------------------------------------------------------------------------------------------
    // DataObject
    procedure ClearDataObject;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    function DataObjectAssigned: Boolean;
    // NB: Queste sotto sono propriet� lasciate in public perch� usate in qualche parte del codice
    property AsDefault: Boolean read FAsDefault write SetAsDefault; // Published: Master
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    property MasterPresenter: TioModelPresenter read FMasterPresenter write FMasterPresenter; // Published: Detail
    property MasterPropertyName: String read FMasterPropertyName write FMasterPropertyName; // Published: Detail
    property OrderBy: String read FOrderBy Write SetOrderBy; // Published: Master
    property TypeName: String read FTypeName write SetTypeName; // Published: Master
    property Where: IioWhere read GetWhere write SetWhere; // public: Master
    // Published properties: selectors (NB: lasciata public perch� usata da qualche parte nel codice)
    property SelectorFor: TioModelPresenter read FSelectorFor write FSelectorFor; // published: Master
  end;

implementation

uses
  iORM.Where.Factory, iORM.LiveBindings.Factory,
  iORM.Exceptions, iORM.Utilities, iORM, iORM.Components.Common,
  iORM.LiveBindings.CommonBSBehavior;

{ TioModelProvider }

procedure TioModelPresenter.Append(AObject: TObject);
begin
  if CheckAdapter then
  begin
    GetActiveBindSourceAdapter.Append(AObject);
    // NB: HO commentato la riga sotto perch� Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perch� veniva
    // invocato un Post in seguito al Refresh stesso.
    // BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenter.Append;
begin
  if CheckAdapter then
    (GetActiveBindSourceAdapter as TBindSourceAdapter).Append;
end;

procedure TioModelPresenter.Append(AObject: IInterface);
begin
  if CheckAdapter then
  begin
    GetActiveBindSourceAdapter.Append(AObject);
    // NB: HO commentato la riga sotto perch� Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perch� veniva
    // invocato un Post in seguito al Refresh stesso.
    // BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenter.Cancel;
begin
  if CheckAdapter and Editing then
    GetActiveBindSourceAdapter.Cancel;
end;

procedure TioModelPresenter.CancelIfEditing;
begin
  if CheckAdapter and Editing then
    Cancel;
end;

function TioModelPresenter.CheckAdapter(const ACreateIfNotAssigned: Boolean): Boolean;
begin
  // if the adapter is not already assigned then create it
  if ACreateIfNotAssigned and not Assigned(FBindSourceAdapter) then
    _CreateAdapter(nil, True);
  // Result
  Result := Assigned(FBindSourceAdapter);
end;

procedure TioModelPresenter.ClearDataObject;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.ClearDataObject;
end;

constructor TioModelPresenter.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := False;
  FAutoRefreshOnNotification := TioAutoRefreshType.arEnabledNoReload;
  FAsync := False;
  FAutoLoadData := True;
  FAutoPersist := True;
  FViewDataType := TioViewDataType.dtList;
  FWhere := nil;
  FWhereDetailsFromDetailAdapters := False;
  // Selectors
  FSelectorFor := nil;
  FOnReceiveSelectionCloneObject := True;
  FOnReceiveSelectionFreeObject := True;
  // Quest� � una collezione dove eventuali ModelPresenters di dettaglio
  // si registrano per rendere nota la loro esistenza al Master. Sar� poi
  // usata dal Master per fare in modo che, quando viene richiesta la creazione
  // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
  // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
  // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
  // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
  // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
  // DesignTime (WhereStr property) non funzionassero per questo motivo.
  FDetailPresentersContainer := nil;
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

function TioModelPresenter.Current: TObject;
begin
  if CheckAdapter(True) then
    Result := GetActiveBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioModelPresenter.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioUtilities.CastObjectToGeneric<T>(LCurrent);
end;

procedure TioModelPresenter.Delete;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Delete;
end;

procedure TioModelPresenter.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  GetActiveBindSourceAdapter.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

destructor TioModelPresenter.Destroy;
begin
  FWhereStr.Free;
  // Destroy the BindSourceAdapter was created then destroy it
  if CheckAdapter then
    FBindSourceAdapter.Free;
  // If the DetailPresenterContainer was created then destroy it
  if Assigned(FDetailPresentersContainer) then
    FDetailPresentersContainer.Free;
  // Destroy paging object
  FPaging.Free;
  inherited;
end;

procedure TioModelPresenter.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionInterface) then
    FonAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenter.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionObject) then
    FonAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenter.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionInterface) then
    FonBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenter.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionObject) then
    FonBeforeSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioModelPresenter.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
var
  LPreviousCurrentObj: TObject;
begin
  LPreviousCurrentObj := Current;
  if FOnReceiveSelectionCloneObject then
    ASelected := io.Load(ASelected.ClassName).ByID(TioUtilities.ExtractOID(ASelected)).ToObject;
  if Assigned(FonSelectionObject) then
    FonSelectionObject(Self, ASelected, ASelectionType, ADone);
  if FOnReceiveSelectionFreeObject and (FViewDataType = TioViewDataType.dtSingle) and (LPreviousCurrentObj <> nil) then
    LPreviousCurrentObj.Free;
end;

procedure TioModelPresenter.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionInterface) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

procedure TioModelPresenter.Edit(AForce: Boolean);
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Edit(AForce);
end;

procedure TioModelPresenter.First;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.First;
end;

procedure TioModelPresenter.ForceDetailAdaptersCreation;
var
  LPresenter: TioModelPresenter;
begin
  if Assigned(FDetailPresentersContainer) then
    for LPresenter in FDetailPresentersContainer do
      LPresenter.CheckAdapter(True);
end;

procedure TioModelPresenter.ForEach(const AForEachMethod: TProc);
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

function TioModelPresenter.GetActive: Boolean;
begin
  Result := CheckAdapter(False) and GetActiveBindSourceAdapter.Active;
end;

function TioModelPresenter.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := Self.GetActiveBindSourceAdapter.ioAutoPost
  else
    Result := FAutoPost;
end;

function TioModelPresenter.GetAutoRefreshOnNotification: TioAutoRefreshType;
begin
  Result := FAutoRefreshOnNotification;
end;

function TioModelPresenter.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  // If the BindSourceAdapter is not assigned then create it
  if CheckAdapter(True) then
    Result := FBindSourceAdapter;
end;

function TioModelPresenter.GetBOF: Boolean;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.Bof
  else
    Result := True;
end;

function TioModelPresenter.GetCount: Integer;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioModelPresenter.DataObject: TObject;
begin
  // Result := nil;
  Result := GetActiveBindSourceAdapter.DataObject;
end;

function TioModelPresenter.DataObjectAs<T>: T;
var
  LObj: TObject;
begin
  LObj := Self.DataObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LObj);
end;

function TioModelPresenter.DataObjectAssigned: Boolean;
begin
  if CheckAdapter then
    Result := Assigned(GetActiveBindSourceAdapter.DataObject)
  else
    Result := False;
end;

function TioModelPresenter.GetDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere)
  : IioActiveBindSourceAdapter;
begin
  if not Supports(GetActiveBindSourceAdapter.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere), IioActiveBindSourceAdapter, Result) then
    Result := nil;
end;

function TioModelPresenter.GetEditing: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State in seEditModes
  else
    Result := False
end;

function TioModelPresenter.GetEOF: Boolean;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.Eof
  else
    Result := True;
end;

function TioModelPresenter.GetIsInterfacePresenting: Boolean;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.IsInterfaceBSA
  else
    Result := TioUtilities.IsAnInterfaceTypeName(TypeName);
end;

function TioModelPresenter.GetItemIndex: Integer;
begin
  if CheckAdapter then
    Result := FBindSourceAdapter.ItemIndex
  else
    Result := -1;
end;

function TioModelPresenter.GetNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
begin
  if not Supports(GetActiveBindSourceAdapter.NewNaturalObjectBindSourceAdapter(AOwner), IioActiveBindSourceAdapter, Result) then
    Result := nil;
end;

function TioModelPresenter.GetPaging: TioCommonBSAPageManager;
begin
  Result := FPaging;
end;

function TioModelPresenter.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

function TioModelPresenter.GetWhere: IioWhere;
begin
  // If the adapter exists the return the property of the adapter
  // else return the Self.FWhere
  if CheckAdapter then
  begin
    Result := FBindSourceAdapter.ioWhere;
    Exit;
  end;
  // if not already assigned then create it (cos� lo crea solo se serve
  // davvero altrimenti no)
  if not Assigned(FWhere) then
    FWhere := TioWhereFactory.NewWhereWithPaging(FPaging);
  // Return the Where instance
  Result := FWhere;
end;

procedure TioModelPresenter.Insert;
begin
  if CheckAdapter then
    (GetActiveBindSourceAdapter as TBindSourceAdapter).Insert;
end;

procedure TioModelPresenter.InitAsDefaultOnCreate;
var
  I: Integer;
begin
  // At DesignTime initialize the "AsDefault" property at True if it is the
  // first ModelPresenter inserted (no other presenters presents).
  // NB: At Runtime set False as initial value (load real value from dfm file)
  if (csDesigning in ComponentState) then
  begin
    FAsDefault := True;
    for I := 0 to Owner.ComponentCount - 1 do
      if (Owner.Components[I] is TioModelPresenter) and (Owner.Components[I] <> Self) then
      begin
        FAsDefault := False;
        Exit;
      end;
  end
  else
    FAsDefault := False;
end;

procedure TioModelPresenter.Insert(AObject: TObject);
begin
  if CheckAdapter then
  begin
    GetActiveBindSourceAdapter.Insert(AObject);
    // NB: HO commentato la riga sotto perch� Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perch� veniva
    // invocato un Post in seguito al Refresh stesso.
    // BindSourceAdapter.Refresh(False);
  end;
end;

procedure TioModelPresenter.Last;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Last;
end;

procedure TioModelPresenter.Loaded;
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

procedure TioModelPresenter.Select<T>(AInstance: T; ASelectionType: TioSelectionType);
var
  LDestBSA: IioActiveBindSourceAdapter;
  LValue: TValue;
begin
  // Some checks
  if not Assigned(FSelectorFor) then
    raise EioException.Create(ClassName, 'Select<T>', '"SelectorFor" property not assigned.');
  if not FSelectorFor.CheckAdapter then
    raise EioException.Create(ClassName, 'Select<T>', 'Selection destination ActiveBindSourceAdapter, non present.');
  // Get the selection destination BindSourceAdapter
  LDestBSA := FSelectorFor.GetActiveBindSourceAdapter;
  // Encapsulate the SelectedInstance into a TValue then assign it
  // as selection in a proper way
  // NB: Lasciare assolutamente cos� perch� ho gi� provato in vari modi ma mi dava sempre un errore
  // facendo cos' invece (cio� passando per un TValue) funziona correttamente.
  LValue := TValue.From<T>(AInstance);
  if LValue.Kind = TTypeKind.tkInterface then
    LDestBSA.ReceiveSelection(LValue.AsInterface, ASelectionType)
  else if LValue.Kind = TTypeKind.tkClass then
    LDestBSA.ReceiveSelection(LValue.AsObject, ASelectionType)
  else
    raise EioException.Create(ClassName, 'Select<T>', 'Wrong LValue kind.');
end;

procedure TioModelPresenter.SelectCurrent(ASelectionType: TioSelectionType);
var
  LDestBSA: IioActiveBindSourceAdapter;
begin
  // Some checks
  if not CheckAdapter then
    raise EioException.Create(ClassName, 'SelectCurrent', 'ActiveBindSourceAdapter, not present.');
  // Get the selection destination BindSourceAdapter
  LDestBSA := FSelectorFor.GetActiveBindSourceAdapter;
  // Make the selection of current
  if LDestBSA.IsInterfaceBSA then
    Select<IInterface>(CurrentAs<IInterface>, ASelectionType)
  else
    Select<TObject>(Current, ASelectionType);
end;

function TioModelPresenter.CurrentMasterObject: TObject;
begin
  if CheckAdapter and IsDetailBS then
    Result := GetActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioModelPresenter.CurrentMasterObjectAs<T>: T;
var
  LMasterObject: TObject;
begin
  LMasterObject := Self.CurrentMasterObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LMasterObject);
end;

procedure TioModelPresenter.Next;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Next;
end;

procedure TioModelPresenter.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  TioCommonBSBehavior.Notify(Sender, Self, ANotification);
end;

procedure TioModelPresenter.PersistAll;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.PersistAll;
end;

procedure TioModelPresenter.PersistCurrent;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.PersistCurrent;
end;

procedure TioModelPresenter.Post;
begin
  if CheckAdapter and Editing then
    GetActiveBindSourceAdapter.Post;
end;

procedure TioModelPresenter.PostIfEditing;
begin
  if CheckAdapter and Editing then
    Post;
end;

procedure TioModelPresenter.Prior;
begin
  if CheckAdapter then
    GetActiveBindSourceAdapter.Prior;
end;

procedure TioModelPresenter.Refresh(const AReloadData: Boolean; const ANotify: Boolean = True);
begin
  if CheckAdapter then
    FBindSourceAdapter.Refresh(AReloadData, ANotify);
end;

procedure TioModelPresenter.RegisterDetailPresenter(const ADetailPresenter: TioModelPresenter);
begin
  if not Assigned(FDetailPresentersContainer) then
    FDetailPresentersContainer := TList<TioModelPresenter>.Create;
  FDetailPresentersContainer.Add(ADetailPresenter);
end;

procedure TioModelPresenter.SetActive(const Value: Boolean);
begin
  if CheckAdapter(True) and Value then
    GetActiveBindSourceAdapter.Active := Value;
end;

procedure TioModelPresenter.SetAsDefault(const Value: Boolean);
var
  I: Integer;
begin
  // Uncheck AsDefault property for all presenters
  if Value then
    for I := 0 to Owner.ComponentCount - 1 do
      if (Owner.Components[I] is TioModelPresenter) then
        TioModelPresenter(Owner.Components[I]).AsDefault := False;
  // Set the value
  FAsDefault := Value;
end;

procedure TioModelPresenter.SetAsync(const Value: Boolean);
begin
  FAsync := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioAsync := Value;
end;

procedure TioModelPresenter.SetAutoLoadData(const Value: Boolean);
begin
  FAutoLoadData := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioAutoLoadData := Value;
end;

procedure TioModelPresenter.SetActiveBindSourceAdapter(const Value: IioActiveBindSourceAdapter);
begin
  if Value = FBindSourceAdapter then
    Exit;
  FBindSourceAdapter := Value;
  // Set some properties
  FBindSourceAdapter.ioAsync := FAsync;
  FBindSourceAdapter.ioAutoPersist := FAutoPersist;
  FBindSourceAdapter.ioWhereDetailsFromDetailAdapters := FWhereDetailsFromDetailAdapters;
  FBindSourceAdapter.ioWhere := FWhere;
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

procedure TioModelPresenter.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
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

procedure TioModelPresenter.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  if not Assigned(ADataObject) then
    ClearDataObject;
  // if the adapter is not already assigned then create it
  if not CheckAdapter then
    // Create the BSA
    // NB: Nel caso in cui si sita impostando il DataObject ma il BSA non era ancora creato lo crea (il BSA)
    // usando il ClassName dell'oggetto; in questo modo siamo sicuri che abbiamo il BSA pi�
    // adatto e non uno che magari � pi� generico e a cui mancano alcune propriet� (� successo).
    _CreateAdapter(ADataObject as TObject, AOwnsObject)
  else
    // Set the data object into the BSA
    GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject);
end;

procedure TioModelPresenter.SetItemIndex(const Value: Integer);
begin
  if CheckAdapter then
    FBindSourceAdapter.ItemIndex := Value
  else
    raise EioException.Create(Self.ClassName, 'SetItemindex', 'Unassigned BindSourceAdapter');
end;

procedure TioModelPresenter.SetOrderBy(const Value: String);
begin
  // Set the OrderBy in the Where object (questo ha veramnete effetto, FOrderBY
  // contiene il testo solo per pubblicarne il valore come propriet� editabile
  // a design-time sul componente.
  FOrderBy := Value;
  Where.SetOrderBySQL(Value);
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioWhere.SetOrderBySQL(Value);
end;

procedure TioModelPresenter.SetPaging(const Value: TioCommonBSAPageManager);
begin
  // In reality this property would be read-only but if I left it read-only
  // then it no longer writes me the values of the sub-properties in the DFM file.
  // So I also put the set method where, however, I raise an exception if someone
  // tries to set a value.
  raise EioException.Create(ClassName, 'SetPaging', 'This property "Paging" is not writable');
end;

procedure TioModelPresenter.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioTypeAlias := Value;
end;

procedure TioModelPresenter.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioTypeName := Value;
end;

procedure TioModelPresenter.SetAutoPersist(const Value: Boolean);
begin
  FAutoPersist := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckAdapter then
    FBindSourceAdapter.ioAutoPersist := Value;
end;

procedure TioModelPresenter.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioAutoPost := Value;
end;

procedure TioModelPresenter.SetAutoRefreshOnNotification(const Value: TioAutoRefreshType);
begin
  FAutoRefreshOnNotification := Value;
end;

procedure TioModelPresenter.SetWhere(const AWhere: IioWhere);
begin
  AWhere.SetPagingObj(FPaging); // Inject paging object spscified in BindSource or ModelPresenter
  FWhere := AWhere;
  // Update the adapter where in the BSAdapter if exist
  if CheckAdapter then
    FBindSourceAdapter.ioWhere := AWhere;
end;

procedure TioModelPresenter.SetWhereDetailsFromDetailAdapters(const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckAdapter then
    FBindSourceAdapter.ioWhereDetailsFromDetailAdapters := Value;
end;

procedure TioModelPresenter.SetWhereStr(const Value: TStrings);
begin
  FWhereStr.Assign(Value);
  // If in DesignTime then Exit
  // NB: Mettendo questa linea di codice ho risolto il problema che i ioPBS
  // anche se erano con "AutoActivate=False" quando veniva aperta (caricata)
  // la form che li conteneva a design time apparivano cmq con i dati finti di
  // prova anzich� rimanere vuoti.
  if (csDesigning in ComponentState) then
    Exit;
  // Set the onChange event handler
  (FWhereStr as TStringList).OnChange := WhereOnChangeEventHandler;
  // Update the adapter where property
  WhereOnChangeEventHandler(Self);
end;

procedure TioModelPresenter.ShowCurrent(const AViewContext: TComponent; const AAlias: String);
begin
  io.ShowCurrent(Self, AViewContext, AAlias);
end;

procedure TioModelPresenter.ShowCurrent(const AVCProvider: TioViewContextProvider; const AAlias: String);
begin
  io.ShowCurrent(Self, AVCProvider, AAlias);
end;

procedure TioModelPresenter.ShowCurrent(const AAlias: String; const AVCProviderName: String);
begin
  io.ShowCurrent(Self, AAlias, AVCProviderName);
end;

procedure TioModelPresenter.ShowEach(const AViewContext: TComponent; const AAlias: String);
begin
  io.ShowEach(Self, AViewContext, AAlias);
end;

procedure TioModelPresenter.ShowEach(const AVCProvider: TioViewContextProvider; const AAlias: String);
begin
  io.ShowEach(Self, AVCProvider, AAlias);
end;

procedure TioModelPresenter.ShowEach(const AAlias: String; const AVCProviderName: String);
begin
  io.ShowEach(Self, AAlias, AVCProviderName);
end;

procedure TioModelPresenter.WhereOnChangeEventHandler(Sender: TObject);
begin
  // Delete all previous criteria (_Where) and add the new criteria text
  Where._Where(FWhereStr.Text);
  // OLD_CODE
  // Self.SetWhere(TioWhereFactory.NewWhere.Add(FWhereStr.Text));
end;

procedure TioModelPresenter._CreateAdapter(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // If an adapter already exists then raise an exception
  if Assigned(FBindSourceAdapter) then
    raise EioException.Create(ClassName, '_CreateAdapter', 'Active bind source adapter already exists.');
  // if the TypeName is empty then set it
  if TypeName.IsEmpty then
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
    SetActiveBindSourceAdapter(TioLiveBindingsFactory.GetBSA(nil, TypeName, TypeAlias, Where, ViewDataType, AutoLoadData, ADataObject, AOwnsObject));
    // Force the creation of all the detail adapters (if exists)
    // NB: Per risolvere alcuni problemi di sequenza (tipo le condizioni in WhereStr di dettaglio che non
    // funzionavano perch� al momento di apertura del MasterAdapter i DetailAdapters non erano ancora nemmeno
    // stati creati) forzo la creazione anche di tutti gli adapters di dettaglio al momento della creazione
    // del Master.
    ForceDetailAdaptersCreation;
  end;
  // Init the BSA
  FBindSourceAdapter.ioAutoPost := FAutoPost;
end;

procedure TioModelPresenter.Insert(AObject: IInterface);
begin
  if CheckAdapter then
  begin
    GetActiveBindSourceAdapter.Insert(AObject);
    // NB: HO commentato la riga sotto perch� Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perch� veniva
    // invocato un Post in seguito al Refresh stesso.
    // BindSourceAdapter.Refresh(False);
  end;
end;

class function TioModelPresenter.IsValidForDependencyInjectionLocator(const AModelPresenter: TioModelPresenter;
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