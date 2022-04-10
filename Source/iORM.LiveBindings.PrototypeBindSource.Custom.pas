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

unit iORM.LiveBindings.PrototypeBindSource.Custom;

interface

uses
  Data.Bind.ObjectScope, iORM.LiveBindings.Interfaces, iORM.CommonTypes,
  System.Classes, iORM.LiveBindings.Notification, iORM.Where.Interfaces,
  System.SysUtils, iORM.LiveBindings.CommonBSAPaging,
  System.Generics.Collections;

type

  TioPrototypeBindSourceCustom = class;

  TioMasterBindSource = TioPrototypeBindSourceCustom;

  TioPrototypeBindSourceCustom = class abstract(TPrototypeBindSource, IioNotifiableBindSource, IioStdActionTargetBindSource)
  private
    FTypeName: String;
    FTypeAlias: String;
    FLoadType: TioLoadType;
    FLazy: Boolean;
    FLazyProps: String;
    FAsync: Boolean;
    FTypeOfCollection: TioTypeOfCollection;
    FMasterBindSource: TioMasterBindSource;
    FMasterPropertyName: String;
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FAutoRefreshOnNotification: Boolean;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    // Selectors
    FSelectorFor: TioPrototypeBindSourceCustom;
    FOnReceiveSelectionCloneObject: Boolean;
    FOnReceiveSelectionFreeObject: Boolean;
    // Questà è una collezione dove eventuali BindSource di dettaglio
    // si registrano per rendere nota la loro esistenza al Master. Sarà poi
    // usata dal Master per fare in modo che, quando viene richiesta la creazione
    // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
    // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
    // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
    // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
    // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
    // DesignTime (WhereStr property) non funzionassero per questo motivo.
    // NB: Nei PrototypeBindSources non serve poi il metodo "ForceDetailAdaptersCreation" come dei DataSet o nei ModelPresenter
    FDetailBindSourceContainer: TList<TioPrototypeBindSourceCustom>;
    // FioLoaded flag for iORM DoCreateAdapter internal use only just before
    // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
    FioLoaded: Boolean;
    // Selection related events
    FonBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonSelectionObject: TioBSASelectionObjectEvent;
    FonAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent;
    FonBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    FonSelectionInterface: TioBSASelectionInterfaceEvent;
    FonAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent;
    procedure OpenCloseDetails(const AActive: Boolean);
    // =========================================================================
    // Part for the support of the IioNotifiableBindSource interfaces (Added by iORM)
    // because is not implementing IInterface (NB: RefCount DISABLED)
    function QueryInterface(const IID: TGUID; out Obj): HResult; reintroduce; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
{$IFDEF AUTOREFCOUNT}
    function __ObjAddRef: Integer; override;
    function __ObjRelease: Integer; override;
{$ENDIF}
    // =========================================================================
    function AdapterExists: Boolean; // IioNotifiableBindSource
    function IsActive: Boolean; // IioStdActionTargetBindSource
    // Async
    procedure SetAsync(const Value: Boolean);
    // Lazy
    procedure SetLazy(const Value: Boolean);
    // LazyProps
    procedure SetLazyProps(const Value: String);
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    // AutoRefreshOnNotification
    function GetAutoRefreshOnNotification: Boolean;
    procedure SetAutoRefreshOnNotification(const Value: Boolean);
    // IsInterfacePresenting
    function GetIsInterfacePresenting: Boolean;
    // ItemCount
    function GetCount: Integer;
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
    procedure WhereOnChangeEventHandler(Sender: TObject);
  protected
    procedure Open;
    procedure Close;
    procedure SetActive(const Value: Boolean); override;
    procedure Loaded; override;
    procedure DoCreateAdapter(var ADataObject: TBindSourceAdapter); override;
    function CheckActiveAdapter: Boolean;
    function GetName: String;
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
    // property Editing; // NB: this property is already declared as public in TBaseObjectBindSource ancestor class
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting; // public: Nascondere? Serve all'esterno?
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property Where: IioWhere read GetWhere write SetWhere; // public: Master
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    // Published properties
    property TypeName: String read FTypeName write SetTypeName; // published: Master
    property TypeAlias: String read FTypeAlias write SetTypeAlias; // published: Master
    property Async: Boolean read FAsync write SetAsync default False; // published: Master
    property LoadType: TioLoadType read GetLoadType write SetLoadType default ltManual; // published: Master
    property Lazy: Boolean read FLazy write SetLazy default False; // published: Master
    property LazyProps: String read FLazyProps write SetLazyProps; // published: Master
    // published: Master (però cambiarlo in modo che, se true, persiste al cambio di record)
    property TypeOfCollection: TioTypeOfCollection read FTypeOfCollection write FTypeOfCollection default tcList;
    // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr: TStrings read FWhereStr write SetWhereStr; // published: Master
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters default False;
    // published: Nascondere e default = false
    property OrderBy: String read FOrderBy Write SetOrderBy; // published: Master
    property MasterBindSource: TioMasterBindSource read FMasterBindSource write FMasterBindSource; // published: Detail
    property MasterPropertyName: String read GetMasterPropertyName write SetMasterPropertyName; // published: Detail
    property AutoRefreshOnNotification: Boolean read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification default True; // published: Master+Detail
    // Published properties: selectors
    property SelectorFor: TioPrototypeBindSourceCustom read FSelectorFor write FSelectorFor; // published: Master
    // Published properties: paging
    property Paging: TioCommonBSAPageManager read GetPaging write SetPaging; // published: Master
    // Published properties: selectors
    property OnReceiveSelectionCloneObject: Boolean read GetOnReceiveSelectionCloneObject write SetOnReceiveSelectionCloneObject default True;
    property OnReceiveSelectionFreeObject: Boolean read GetOnReceiveSelectionFreeObject write SetOnReceiveSelectionFreeObject default True;
    // published: Master+Detail
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
    function IsMasterBS: Boolean; virtual; abstract;
    function IsDetailBS: Boolean; virtual; abstract;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
    procedure PostIfEditing;
    procedure CancelIfEditing;
    procedure ForEach(const AForEachMethod: TProc);
    procedure RegisterDetailBindSource(const ADetailBindSource: TioPrototypeBindSourceCustom);
    // DataObject
    procedure ClearDataObject;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    function DataObjectAssigned: Boolean;
    // ----------------------------------------------------------------------------------------------------------------------------
    // BindSourceAdapter methods/properties published by TioPrototypeBindSource also
    function Current: TObject;
    function CurrentAs<T>: T;
    function CurrentMasterObject: TObject;
    function CurrentMasterObjectAs<T>: T;
    procedure Refresh(const ANotify: Boolean = True); reintroduce; overload;
    procedure PersistCurrent;
    procedure PersistAll;
    procedure Append; overload;
    procedure Append(AObject: TObject); overload;
    procedure Append(AObject: IInterface); overload;
    procedure Insert(AObject: TObject); reintroduce; overload;
    procedure Insert(AObject: IInterface); reintroduce; overload;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
    procedure SelectCurrent(ASelectionType: TioSelectionType = TioSelectionType.stAppend);
  published
    property AutoPost: Boolean read GetAutoPost write SetAutoPost default True; // published: Nascondere e default = True
  end;

implementation

uses
  iORM, iORM.Exceptions, iORM.LiveBindings.Factory,
  iORM.Where.Factory, iORM.Utilities, iORM.Components.Common, System.Rtti,
  iORM.LiveBindings.CommonBSBehavior;

{ TioPrototypeBindSource }

{$IFDEF AUTOREFCOUNT}

function TioPrototypeBindSource.__ObjAddRef: Integer;
begin
  // Nothing (event the "inherited")
end;

function TioPrototypeBindSource.__ObjRelease: Integer;
begin
  // Nothing (event the "inherited")
end;
{$ENDIF}

procedure TioPrototypeBindSourceCustom.Append;
begin
  if CheckAdapter then
    GetInternalAdapter.Append;
end;

procedure TioPrototypeBindSourceCustom.Append(AObject: TObject);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Append(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Append(TObject)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

function TioPrototypeBindSourceCustom.AdapterExists: Boolean;
begin
  Result := CheckAdapter;
end;

procedure TioPrototypeBindSourceCustom.Append(AObject: IInterface);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Append(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Append(IInterface)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

procedure TioPrototypeBindSourceCustom.CancelIfEditing;
begin
  if Editing then
    Cancel;
end;

function TioPrototypeBindSourceCustom.CheckActiveAdapter: Boolean;
begin
  // ------------- prima era così -------------
  // Result := (not (csDesigning in ComponentState))
  // and CheckAdapter
  // and Supports(GetInternalAdapter, IioActiveBindSourceAdapter);
  // ------------- prima era così -------------
  Result := CheckAdapter and Supports(GetInternalAdapter, IioActiveBindSourceAdapter);
end;

procedure TioPrototypeBindSourceCustom.ClearDataObject;
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.ClearDataObject;
end;

procedure TioPrototypeBindSourceCustom.Close;
begin
  if Active then
    Active := False;
end;

constructor TioPrototypeBindSourceCustom.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := True;
  FioLoaded := False;
  FAutoRefreshOnNotification := True;
  FAsync := False;
  FLoadType := ltManual;
  FLazy := False;
  FLazyProps := '';
  FTypeOfCollection := tcList;
  // Selectors
  FSelectorFor := nil;
  FOnReceiveSelectionCloneObject := True;
  FOnReceiveSelectionFreeObject := True;
  // Set even an onChange event handler
  FWhereDetailsFromDetailAdapters := False;
  FWhereStr := TStringList.Create;
  SetWhereStr(FWhereStr); // set TStringList.onChange event handler
  // Questà è una collezione dove eventuali BindSources di dettaglio
  // si registrano per rendere nota la loro esistenza al Master. Sarà poi
  // usata dal Master per fare in modo che, quando viene richiesta la creazione
  // del suo BindSourceAdapter (del master), venga scatenata anche la creazione
  // anche di tutti gli adapters relativi ai presenters di dettaglio (che si sono
  // registrati). In questo modo evito alcuni problemi di "sequenza" dovuti
  // al fatto che gli adapters di dettaglio non erano stati ancora creati (ma quello master si).
  // Ad esempio capitava che i filtri dei presentere di dettaglio impostati a
  // DesignTime (WhereStr property) non funzionassero per questo motivo.
  FDetailBindSourceContainer := nil;
  // Page manager
  FPaging := TioCommonBSAPageManager.Create(
    procedure
    begin
      if CheckActiveAdapter then
        GetActiveBindSourceAdapter.LoadPage;
    end);
end;

destructor TioPrototypeBindSourceCustom.Destroy;
begin
  FWhereStr.Free;
  // If the DetailPresenterContainer was created then destroy it
  if Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer.Free;
  // Destroy paging object
  FPaging.Free;
  inherited;
end;

procedure TioPrototypeBindSourceCustom.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

procedure TioPrototypeBindSourceCustom.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionInterface) then
    FonAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioPrototypeBindSourceCustom.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionObject) then
    FonAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioPrototypeBindSourceCustom.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionInterface) then
    FonBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioPrototypeBindSourceCustom.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionObject) then
    FonBeforeSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioPrototypeBindSourceCustom.DoCreateAdapter(var ADataObject: TBindSourceAdapter);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Inherited
  inherited;
  // If in DesignTime then Exit
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  if (csDesigning in ComponentState) or (not FioLoaded) then
    Exit;
  // -------------------------------------------------------------------------------------------------------------------------------
  // If AdataObject is NOT already assigned (by onCreateAdapter event handler) then
  // retrieve a BindSourceAdapter automagically by iORM
  if ADataObject = nil then
  begin
// ----- OLD CODE -----
//    // If this is a master bind source then retrieve the ABSA from the factory
//    if IsMasterBS then
//    begin
//      if TypeName.IsEmpty then
//        raise EioException.Create(ClassName, 'DoCreateAdapter', Format('"TypeName" property is not specified for "%s" bind source', [Name]));
//      ADataObject := TioLiveBindingsFactory.GetBSA(Self, FTypeName, FTypeAlias, TioWhereFactory.NewWhereWithPaging(FPaging).Add(WhereStr.Text)
//        ._OrderBy(FOrderBy), FTypeOfCollection, nil, True).AsTBindSourceAdapter;
//    end
//    // If this is a detail BindSource then retrieve the adapter from the master BindSource
//    else
//    begin
//      if FMasterBindSource = nil then
//        raise EioException.Create(ClassName, 'DoCreateAdapter', Format('"MasterBindSource" property is not specified for "%s" bind source', [Name]));
//      if FMasterPropertyName.IsEmpty then
//        raise EioException.Create(ClassName, 'DoCreateAdapter', Format('"MasterPropertyName" property is not specified for "%s" bind source', [Name]));
//      ADataObject := TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(Self, FMasterBindSource.GetActiveBindSourceAdapter, MasterPropertyName,
//        TioWhereFactory.NewWhere.Add(WhereStr.Text)._OrderBy(FOrderBy)).AsTBindSourceAdapter
//    end;
// ----- OLD CODE -----

    // If it is a detail bind source then get the detail BSA from the master bind source,
    //   else if it is a master bind source but load type property is set to ltFromBSAsIs, ltFromBSReload or ltFromBSReloadNewInstance
    //   then get the natural BSA from the source bind source else it is a master bind source then get the normal BSA.
    if IsDetailBS then
      ADataObject := TioLiveBindingsFactory.GetDetailBSAfromMasterBindSource(nil, Name, MasterBindSource, MasterPropertyName, TioWhereFactory.NewWhere.Add(WhereStr.Text)._OrderBy(FOrderBy)).AsTBindSourceAdapter
    else
    if FLoadType in [ltFromBSAsIs, ltFromBSReload, ltFromBSReloadNewInstance] then
      ADataObject := TioLiveBindingsFactory.GetNaturalBSAfromMasterBindSource(nil, Name, MasterBindSource).AsTBindSourceAdapter
    else
      ADataObject := TioLiveBindingsFactory.GetBSA(Self, Name, FTypeName, FTypeAlias, TioWhereFactory.NewWhereWithPaging(FPaging).Add(WhereStr.Text)._OrderBy(FOrderBy), FTypeOfCollection, nil, True).AsTBindSourceAdapter;
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
  // If Self is a Notifiable bind source then register a reference to itself
  // in the ActiveBindSourceAdapter
  // PS: Set ioAsync also (and other properties)
  if Assigned(ADataObject) and Supports(ADataObject, IioActiveBindSourceAdapter, LActiveBSA) then
  begin
    LActiveBSA.ioAsync := FAsync;
    LActiveBSA.ioAutoPost := FAutoPost;
    LActiveBSA.LoadType := FLoadType;
    LActiveBSA.Lazy := FLazy;
    LActiveBSA.LazyProps := FLazyProps;
    LActiveBSA.ioWhereDetailsFromDetailAdapters := FWhereDetailsFromDetailAdapters;
    LActiveBSA.SetBindSource(Self);
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
end;

procedure TioPrototypeBindSourceCustom.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionObject) then
    FonSelectionObject(Self, ASelected, ASelectionType, ADone);
end;

procedure TioPrototypeBindSourceCustom.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionInterface) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

procedure TioPrototypeBindSourceCustom.ForEach(const AForEachMethod: TProc);
var
  I, PreviousItemIndex: Integer;
begin
  PreviousItemIndex := GetInternalAdapter.ItemIndex;
  try
    First;
    for I := 1 to ItemCount do
    begin
      AForEachMethod;
      Next;
    end;
  finally
    GetInternalAdapter.ItemIndex := PreviousItemIndex;
  end;
end;

function TioPrototypeBindSourceCustom.Current: TObject;
begin
  Result := nil;
  if CheckAdapter then
    Result := Self.InternalAdapter.Current;
end;

function TioPrototypeBindSourceCustom.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioUtilities.CastObjectToGeneric<T>(LCurrent);
end;

function TioPrototypeBindSourceCustom.CurrentMasterObject: TObject;
begin
  if CheckAdapter and IsDetailBS then
    Result := GetActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioPrototypeBindSourceCustom.CurrentMasterObjectAs<T>: T;
var
  LMasterObject: TObject;
begin
  LMasterObject := Self.CurrentMasterObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LMasterObject);
end;

function TioPrototypeBindSourceCustom.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if not Supports(Self.InternalAdapter, IioActiveBindSourceAdapter, Result) then
    raise EioException.Create(Self.ClassName, 'GetActiveBindSourceAdapter',
      Format('Interface "IioActiveBindSourceAdapter" not implemented from the actual internal adapter (%s)', [Name]));
end;

function TioPrototypeBindSourceCustom.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := Self.InternalAdapter.AutoPost
  else
    Result := FAutoPost;
end;

function TioPrototypeBindSourceCustom.GetAutoRefreshOnNotification: Boolean;
begin
  Result := FAutoRefreshOnNotification;
end;

function TioPrototypeBindSourceCustom.GetCount: Integer;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioPrototypeBindSourceCustom.DataObject: TObject;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.DataObject
  else
    Result := nil;
end;

function TioPrototypeBindSourceCustom.DataObjectAs<T>: T;
var
  LObj: TObject;
begin
  LObj := Self.DataObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LObj);
end;

function TioPrototypeBindSourceCustom.DataObjectAssigned: Boolean;
begin
  if CheckActiveAdapter then
    Result := Assigned(GetActiveBindSourceAdapter.DataObject)
  else
    Result := False;
end;

function TioPrototypeBindSourceCustom.GetDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere = nil)
  : IioActiveBindSourceAdapter;
var
  AContainedBSA: IioContainedBindSourceAdapter;
begin
  Result := nil;
  if Supports(Self.InternalAdapter, IioContainedBindSourceAdapter, AContainedBSA) then
    Result := AContainedBSA.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere);
end;

function TioPrototypeBindSourceCustom.GetWhere: IioWhere;
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    Result := LActiveBSA.ioWhere
  else
    Result := nil;
end;

procedure TioPrototypeBindSourceCustom.Insert(AObject: IInterface);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Insert(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Insert(IInterface)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

function TioPrototypeBindSourceCustom.IsActive: Boolean;
begin
  Result := Active;
end;

procedure TioPrototypeBindSourceCustom.Insert(AObject: TObject);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Insert(AObject);
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(ClassName, 'Insert(TObject)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

function TioPrototypeBindSourceCustom.GetIsInterfacePresenting: Boolean;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.IsInterfaceBSA
  else
    Result := TioUtilities.IsAnInterfaceTypeName(TypeName);
end;

function TioPrototypeBindSourceCustom.GetLoadType: TioLoadType;
begin
  Result := FLoadType;
end;

function TioPrototypeBindSourceCustom.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioPrototypeBindSourceCustom.GetName: String;
begin
  Result := Name;
end;

function TioPrototypeBindSourceCustom.GetOnReceiveSelectionCloneObject: Boolean;
begin
  Result := FOnReceiveSelectionCloneObject;
end;

function TioPrototypeBindSourceCustom.GetOnReceiveSelectionFreeObject: Boolean;
begin
  Result := FOnReceiveSelectionFreeObject;
end;

function TioPrototypeBindSourceCustom.GetPaging: TioCommonBSAPageManager;
begin
  Result := FPaging;
end;

function TioPrototypeBindSourceCustom.GetState: TBindSourceAdapterState;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

procedure TioPrototypeBindSourceCustom.Loaded;
var
  LAdapter: TBindSourceAdapter;
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
    if not Assigned(FMasterBindSource) then
      raise EioException.Create(ClassName, 'Loaded',
        Format('The "MasterBindSource" property has not been set in the component "%s".'
        + #13#13'iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the property and try again.',
       [Name]));
    MasterBindSource.RegisterDetailBindSource(Self);
  end;
  // ===========================================================================

  // DOCREATEADAPTER CALL MUST BE BEFORE THE INHERITED LINE !!!!!!
  // ===========================================================================
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  // the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  // ---------------------------------------------------------------------------
  FioLoaded := True;
  if not Assigned(OnCreateAdapter) then
  begin
    DoCreateAdapter(LAdapter);
    if LAdapter <> nil then
      SetRuntimeAdapter(LAdapter);
  end;
  // ===========================================================================

  // INHERITED MUST BE AFTER THE DOCREATEADAPTER CALL !!!!!!
  inherited;
end;

procedure TioPrototypeBindSourceCustom.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  TioCommonBSBehavior.Notify(Sender, Self, ANotification);
end;

procedure TioPrototypeBindSourceCustom.Open;
begin
  if not Active then
    Active := True;
end;

procedure TioPrototypeBindSourceCustom.OpenCloseDetails(const AActive: Boolean);
var
  LDetailBindSource: TioPrototypeBindSourceCustom;
begin
  if Assigned(FDetailBindSourceContainer) then
    for LDetailBindSource in FDetailBindSourceContainer do
      if AActive then
        LDetailBindSource.Open
      else
        LDetailBindSource.Close;
end;

procedure TioPrototypeBindSourceCustom.PersistAll;
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.PersistAll;
end;

procedure TioPrototypeBindSourceCustom.PersistCurrent;
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.PersistCurrent;
end;

procedure TioPrototypeBindSourceCustom.PostIfEditing;
begin
  if Editing then
    Post;
end;

function TioPrototypeBindSourceCustom.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioPrototypeBindSourceCustom.Refresh(const ANotify: Boolean = True);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if not CheckAdapter then
    Exit;
  if Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
    AnActiveBSA.Refresh(ANotify)
  else
    GetInternalAdapter.Refresh;
end;

procedure TioPrototypeBindSourceCustom.RegisterDetailBindSource(const ADetailBindSource: TioPrototypeBindSourceCustom);
begin
  if not Assigned(FDetailBindSourceContainer) then
    FDetailBindSourceContainer := TList<TioPrototypeBindSourceCustom>.Create;
  FDetailBindSourceContainer.Add(ADetailBindSource);
end;

procedure TioPrototypeBindSourceCustom.SelectCurrent(ASelectionType: TioSelectionType);
begin
  if IsInterfacePresenting then
    TioCommonBSBehavior.Select<IInterface>(Self, FSelectorFor, CurrentAs<IInterface>, ASelectionType)
  else
    TioCommonBSBehavior.Select<TObject>(Self, FSelectorFor, Current, ASelectionType);
end;

procedure TioPrototypeBindSourceCustom.SetActive(const Value: Boolean);
begin
  inherited;
  if not(csDesigning in ComponentState) then
    OpenCloseDetails(Value);
end;

procedure TioPrototypeBindSourceCustom.SetAsync(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FAsync := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAsync := Value;
end;

procedure TioPrototypeBindSourceCustom.SetLazy(const Value: Boolean);
begin
  FLazy := Value;
end;

procedure TioPrototypeBindSourceCustom.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
end;

procedure TioPrototypeBindSourceCustom.SetLoadType(const Value: TioLoadType);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FLoadType := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.LoadType := Value;
end;

procedure TioPrototypeBindSourceCustom.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    Self.InternalAdapter.AutoPost := Value;
end;

procedure TioPrototypeBindSourceCustom.SetAutoRefreshOnNotification(const Value: Boolean);
begin
  FAutoRefreshOnNotification := Value;
end;

procedure TioPrototypeBindSourceCustom.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  TioCommonBSBehavior.CheckForSetDataObject(Self, LoadType);
  // NB: Lasciare commentate le righe qua sotto perchè altrimenti quando
  // si faceva un SetDataObject dava un errore perchè la funzione
  // CheckActiveAdapter restituiva sempre False perchè non avendo il DataObject
  // assegnato (se prima avevo chiamato il  ClearDataObject
  // if CheckActiveAdapter then
  GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
  // else
  // raise EioException.Create(Self.ClassName + ': invalid internal adapter.');
end;

procedure TioPrototypeBindSourceCustom.SetMasterPropertyName(const Value: String);
begin
  FMasterPropertyName := Trim(Value);
end;

procedure TioPrototypeBindSourceCustom.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  TioCommonBSBehavior.CheckForSetDataObject(Self, LoadType);
  // NB: Lasciare commentate le righe qua sotto perchè altrimenti quando
  // si faceva un SetDataObject dava un errore perchè la funzione
  // CheckActiveAdapter restituiva sempre False perchè non avendo il DataObject
  // assegnato (se prima avevo chiamato il  ClearDataObject
  // if CheckActiveAdapter then
  GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
  // else
  // raise EioException.Create(Self.ClassName + ': invalid internal adapter.');
end;

procedure TioPrototypeBindSourceCustom.SetWhere(const AWhere: IioWhere);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Update the adapter where
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
  begin
    AWhere.SetPagingObj(FPaging); // Inject paging object spscified in BindSource or ModelPresenter
    LActiveBSA.ioWhere := AWhere;
  end;
end;

procedure TioPrototypeBindSourceCustom.SetWhereStr(const Value: TStrings);
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

procedure TioPrototypeBindSourceCustom.SetOnReceiveSelectionCloneObject(const Value: Boolean);
begin
  FOnReceiveSelectionCloneObject := Value;
end;

procedure TioPrototypeBindSourceCustom.SetOnReceiveSelectionFreeObject(const Value: Boolean);
begin
  FOnReceiveSelectionFreeObject := Value;
end;

procedure TioPrototypeBindSourceCustom.SetOrderBy(const Value: String);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FOrderBy := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioWhere.SetOrderBySql(Value);
end;

procedure TioPrototypeBindSourceCustom.SetPaging(const Value: TioCommonBSAPageManager);
begin
  // In reality this property would be read-only but if I left it read-only
  // then it no longer writes me the values of the sub-properties in the DFM file.
  // So I also put the set method where, however, I raise an exception if someone
  // tries to set a value.
  raise EioException.Create(ClassName, 'SetPaging', 'This property "Paging" is not writable');
end;

procedure TioPrototypeBindSourceCustom.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.ioTypeAlias := Value;
end;

procedure TioPrototypeBindSourceCustom.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.ioTypeName := Value;
end;

procedure TioPrototypeBindSourceCustom.SetWhereDetailsFromDetailAdapters(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioWhereDetailsFromDetailAdapters := Value;
end;

procedure TioPrototypeBindSourceCustom.WhereOnChangeEventHandler(Sender: TObject);
begin
  SetWhere(TioWhereFactory.NewWhereWithPaging(FPaging).Add(FWhereStr.Text));
end;

function TioPrototypeBindSourceCustom._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

function TioPrototypeBindSourceCustom._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

end.
