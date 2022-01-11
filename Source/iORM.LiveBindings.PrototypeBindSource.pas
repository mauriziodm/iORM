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

unit iORM.LiveBindings.PrototypeBindSource;

interface

uses
  Data.Bind.ObjectScope, iORM.LiveBindings.Interfaces, iORM.CommonTypes,
  System.Classes, iORM.LiveBindings.Notification, iORM.Where.Interfaces,
  System.SysUtils, iORM.LiveBindings.CommonBSAPaging;

type

  TioCustomPrototypeBindSource = class;

  TioMasterBindSource = TioCustomPrototypeBindSource;

  TioCustomPrototypeBindSource = class(TPrototypeBindSource, IioNotifiableBindSource, IioStdActionTargetBindSource)
  private
    FTypeName: String;
    FTypeAlias: String;
    FAutoLoadData: Boolean;
    FAsync: Boolean;
    FAutoPersist: Boolean;
    FViewDataType: TioViewDataType;
    FMasterBindSource: TioMasterBindSource;
    FMasterPropertyName: String;
    FWhereStr: TStrings;
    FWhereDetailsFromDetailAdapters: Boolean;
    FOrderBy: String;
    FAutoRefreshOnNotification: TioAutoRefreshType;
    FAutoPost: Boolean;
    FPaging: TioCommonBSAPageManager;
    // Selectors
    FSelectorFor: TioCustomPrototypeBindSource;
    FOnReceiveSelectionCloneObject: Boolean;
    FOnReceiveSelectionFreeObject: Boolean;
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
    function IsActive: Boolean;
    procedure WhereOnChangeEventHandler(Sender: TObject);
    // TypeName
    procedure SetTypeName(const Value: String);
    // TypeAlias
    procedure SetTypeAlias(const Value: String);
    // ioWhereStr
    procedure SetWhereStr(const Value: TStrings);
    // ioWhere property
    procedure SetWhere(const AWhere: IioWhere);
    function GetWhere: IioWhere;
    // OrderBy property
    procedure SetOrderBy(const Value: String);
    // ioWhereDetailsFromDetailAdapters
    procedure SetWhereDetailsFromDetailAdapters(const Value: Boolean);
    // IsDetail
    function GetIsDetail: Boolean;
    // IsInterfacePresenting
    function GetIsInterfacePresenting: Boolean;
    // State
    function GetState: TBindSourceAdapterState;
    // ItemCount
    function GetCount: Integer;
    // AutoLoadData
    procedure SetAutoLoadData(const Value: Boolean);
    // Async
    procedure SetAsync(const Value: Boolean);
    // AutoPersist
    procedure SetAutoPersist(const Value: Boolean);
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    // AutoRefreshOnNotification
    function GetAutoRefreshOnNotification: TioAutoRefreshType;
    procedure SetAutoRefreshOnNotification(const Value: TioAutoRefreshType);
    // Paging
    procedure SetPaging(const Value: TioCommonBSAPageManager);
    function GetPaging: TioCommonBSAPageManager;
  protected
    procedure Loaded; override;
    procedure DoCreateAdapter(var ADataObject: TBindSourceAdapter); override;
    function CheckActiveAdapter: Boolean;
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
    // property Editing; // NB: this property is already declared as public in TBaseObjectBindSource ancestor class
    property IsInterfacePresenting: Boolean read GetIsInterfacePresenting; // public: Nascondere? Serve all'esterno?
    property State: TBindSourceAdapterState read GetState; // public: Nascondere? Oppure rivedere per SaveState/Persist/RevertState?
    property Where: IioWhere read GetWhere write SetWhere; // public: Master
    property ItemCount: Integer read GetCount; // Public: Master+Detail
    // Published properties
    property TypeName: String read FTypeName write SetTypeName; // published: Master
    property TypeAlias: String read FTypeAlias write SetTypeAlias; // published: Master
    property Async: Boolean read FAsync write SetAsync default False; // published: Master
    property AutoLoadData: Boolean read FAutoLoadData write SetAutoLoadData default True; // published: Master
    property AutoPersist: Boolean read FAutoPersist write SetAutoPersist default False;
    // published: Master (però cambiarlo in modo che, se true, persiste al cambio di record)
    property ViewDataType: TioViewDataType read FViewDataType write FViewDataType; // published: Master+Detail (si potrebbe fare una rilevazione automatica?)
    property WhereStr: TStrings read FWhereStr write SetWhereStr; // published: Master
    property WhereDetailsFromDetailAdapters: Boolean read FWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters default False;
    // published: Nascondere e default = false
    property OrderBy: String read FOrderBy Write SetOrderBy; // published: Master
    property MasterBindSource: TioMasterBindSource read FMasterBindSource write FMasterBindSource; // published: Detail
    property MasterPropertyName: String read FMasterPropertyName write FMasterPropertyName; // published: Detail
    property AutoRefreshOnNotification: TioAutoRefreshType read GetAutoRefreshOnNotification write SetAutoRefreshOnNotification
      default TioAutoRefreshType.arEnabledNoReload; // published: Master+Detail
    // Published properties: selectors
    property SelectorFor: TioCustomPrototypeBindSource read FSelectorFor write FSelectorFor; // published: Master
    // Published properties: paging
    property Paging: TioCommonBSAPageManager read GetPaging write SetPaging; // published: Master
    // Published Events: selectors
    property OnBeforeSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonBeforeSelectionObject write FonBeforeSelectionObject;
    property OnSelectionObject: TioBSASelectionObjectEvent read FonSelectionObject write FonSelectionObject;
    property OnAfterSelectionObject: TioBSABeforeAfterSelectionObjectEvent read FonAfterSelectionObject write FonAfterSelectionObject;
    property OnBeforeSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonBeforeSelectionInterface write FonBeforeSelectionInterface;
    property OnSelectionInterface: TioBSASelectionInterfaceEvent read FonSelectionInterface write FonSelectionInterface;
    property OnAfterSelectionInterface: TioBSABeforeAfterSelectionInterfaceEvent read FonAfterSelectionInterface write FonAfterSelectionInterface;
    // Published properties: selectors
    property OnReceiveSelectionCloneObject: Boolean read FOnReceiveSelectionCloneObject write FOnReceiveSelectionCloneObject default True;
    // published: Master+Detail
    property OnReceiveSelectionFreeObject: Boolean read FOnReceiveSelectionFreeObject write FOnReceiveSelectionFreeObject default True;
    // published: Master+Detail
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
    procedure PostIfEditing;
    procedure CancelIfEditing;
    procedure ForEach(const AForEachMethod: TProc);
    // ----------------------------------------------------------------------------------------------------------------------------
    // BindSourceAdapter methods/properties published by TioPrototypeBindSource also
    function Current: TObject;
    function CurrentAs<T>: T;
    function CurrentMasterObject: TObject;
    function CurrentMasterObjectAs<T>: T;
    procedure Refresh(const AReloadData: Boolean; const ANotify: Boolean = True); reintroduce; overload;
    procedure PersistCurrent;
    procedure PersistAll;
    procedure Append; overload;
    procedure Append(AObject: TObject); overload;
    procedure Append(AObject: IInterface); overload;
    procedure Insert(AObject: TObject); reintroduce; overload;
    procedure Insert(AObject: IInterface); reintroduce; overload;
    function DataObjectAssigned: Boolean;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    procedure ClearDataObject;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
    function GetNaturalObjectBindSourceAdapter(const AOwner: TComponent): TBindSourceAdapter;
    procedure Select<T>(AInstance: T; ASelectionType: TioSelectionType = TioSelectionType.stAppend);
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

procedure TioCustomPrototypeBindSource.Append;
begin
  if CheckAdapter then
    GetInternalAdapter.Append;
end;

procedure TioCustomPrototypeBindSource.Append(AObject: TObject);
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

procedure TioCustomPrototypeBindSource.Append(AObject: IInterface);
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

procedure TioCustomPrototypeBindSource.CancelIfEditing;
begin
  if Editing then
    Cancel;
end;

function TioCustomPrototypeBindSource.CheckActiveAdapter: Boolean;
begin
  // ------------- prima era così -------------
  // Result := (not (csDesigning in ComponentState))
  // and CheckAdapter
  // and Supports(GetInternalAdapter, IioActiveBindSourceAdapter);
  // ------------- prima era così -------------
  Result := CheckAdapter and Supports(GetInternalAdapter, IioActiveBindSourceAdapter);
end;

procedure TioCustomPrototypeBindSource.ClearDataObject;
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.ClearDataObject;
end;

constructor TioCustomPrototypeBindSource.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := True;
  FioLoaded := False;
  FAutoRefreshOnNotification := TioAutoRefreshType.arEnabledNoReload;
  FAsync := False;
  FAutoLoadData := True;
  FAutoPersist := False;
  FViewDataType := TioViewDataType.dtList;
  // Selectors
  FSelectorFor := nil;
  FOnReceiveSelectionCloneObject := True;
  FOnReceiveSelectionFreeObject := True;
  // Set even an onChange event handler
  FWhereDetailsFromDetailAdapters := False;
  FWhereStr := TStringList.Create;
  SetWhereStr(FWhereStr); // set TStringList.onChange event handler
  // Page manager
  FPaging := TioCommonBSAPageManager.Create(
    procedure
    begin
      if CheckActiveAdapter then
        GetActiveBindSourceAdapter.LoadPage;
    end);
end;

destructor TioCustomPrototypeBindSource.Destroy;
begin
  FWhereStr.Free;
  FPaging.Free;
  inherited;
end;

procedure TioCustomPrototypeBindSource.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

procedure TioCustomPrototypeBindSource.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionInterface) then
    FonAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioCustomPrototypeBindSource.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionObject) then
    FonAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioCustomPrototypeBindSource.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionInterface) then
    FonBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioCustomPrototypeBindSource.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionObject) then
    FonBeforeSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioCustomPrototypeBindSource.DoCreateAdapter(var ADataObject: TBindSourceAdapter);
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
    // If this is a master bind source then retrieve the ABSA from the factory
    if IsMasterBS then
    begin
      if TypeName.IsEmpty then
        raise EioException.Create(ClassName, 'DoCreateAdapter', Format('"TypeName" property is not specified for "%s" bind source', [Name]));
      ADataObject := TioLiveBindingsFactory.GetBSA(Self, FTypeName, FTypeAlias, TioWhereFactory.NewWhereWithPaging(FPaging).Add(WhereStr.Text)
        ._OrderBy(FOrderBy), FViewDataType, FAutoLoadData, nil, True).AsTBindSourceAdapter;
    end
    // If this is a detail BindSource then retrieve the adapter from the master BindSource
    else
    begin
      if FMasterBindSource = nil then
        raise EioException.Create(ClassName, 'DoCreateAdapter', Format('"MasterBindSource" property is not specified for "%s" bind source', [Name]));
      if FMasterPropertyName.IsEmpty then
        raise EioException.Create(ClassName, 'DoCreateAdapter', Format('"MasterPropertyName" property is not specified for "%s" bind source', [Name]));
      ADataObject := TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(Self, FMasterBindSource.GetActiveBindSourceAdapter, MasterPropertyName,
        TioWhereFactory.NewWhere.Add(WhereStr.Text)._OrderBy(FOrderBy)).AsTBindSourceAdapter
    end;
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
  // If Self is a Notifiable bind source then register a reference to itself
  // in the ActiveBindSourceAdapter
  // PS: Set ioAsync also (and other properties)
  if Assigned(ADataObject) and Supports(ADataObject, IioActiveBindSourceAdapter, LActiveBSA) then
  begin
    LActiveBSA.ioAutoPost := FAutoPost;
    LActiveBSA.ioAsync := FAsync;
    LActiveBSA.ioWhereDetailsFromDetailAdapters := FWhereDetailsFromDetailAdapters;
    LActiveBSA.ioAutoPersist := FAutoPersist;
    LActiveBSA.SetBindSource(Self);
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
end;

procedure TioCustomPrototypeBindSource.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
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

procedure TioCustomPrototypeBindSource.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonSelectionInterface) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

procedure TioCustomPrototypeBindSource.ForEach(const AForEachMethod: TProc);
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

function TioCustomPrototypeBindSource.Current: TObject;
begin
  Result := nil;
  if CheckAdapter then
    Result := Self.InternalAdapter.Current;
end;

function TioCustomPrototypeBindSource.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioUtilities.CastObjectToGeneric<T>(LCurrent);
end;

function TioCustomPrototypeBindSource.CurrentMasterObject: TObject;
begin
  if CheckAdapter and IsDetailBS then
    Result := GetActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioCustomPrototypeBindSource.CurrentMasterObjectAs<T>: T;
var
  LMasterObject: TObject;
begin
  LMasterObject := Self.CurrentMasterObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LMasterObject);
end;

function TioCustomPrototypeBindSource.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if not Supports(Self.InternalAdapter, IioActiveBindSourceAdapter, Result) then
    raise EioException.Create(Self.ClassName, 'GetActiveBindSourceAdapter',
      Format('Interface "IioActiveBindSourceAdapter" not implemented from the actual internal adapter (%s)', [Name]));
end;

function TioCustomPrototypeBindSource.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := Self.InternalAdapter.AutoPost
  else
    Result := FAutoPost;
end;

function TioCustomPrototypeBindSource.GetAutoRefreshOnNotification: TioAutoRefreshType;
begin
  Result := FAutoRefreshOnNotification;
end;

function TioCustomPrototypeBindSource.GetCount: Integer;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioCustomPrototypeBindSource.DataObject: TObject;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.DataObject
  else
    Result := nil;
end;

function TioCustomPrototypeBindSource.DataObjectAs<T>: T;
var
  LObj: TObject;
begin
  LObj := Self.DataObject;
  Result := TioUtilities.CastObjectToGeneric<T>(LObj);
end;

function TioCustomPrototypeBindSource.DataObjectAssigned: Boolean;
begin
  if CheckActiveAdapter then
    Result := Assigned(GetActiveBindSourceAdapter.DataObject)
  else
    Result := False;
end;

function TioCustomPrototypeBindSource.GetDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere = nil)
  : IioActiveBindSourceAdapter;
var
  AContainedBSA: IioContainedBindSourceAdapter;
begin
  Result := nil;
  if Supports(Self.InternalAdapter, IioContainedBindSourceAdapter, AContainedBSA) then
    Result := AContainedBSA.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere);
end;

function TioCustomPrototypeBindSource.GetWhere: IioWhere;
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    Result := LActiveBSA.ioWhere
  else
    Result := nil;
end;

procedure TioCustomPrototypeBindSource.Insert(AObject: IInterface);
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

function TioCustomPrototypeBindSource.IsActive: Boolean;
begin
  Result := Active;
end;

procedure TioCustomPrototypeBindSource.Insert(AObject: TObject);
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
    raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
  raise EioException.Create(ClassName, 'Insert(TObject)', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [Name]));
end;

function TioCustomPrototypeBindSource.GetIsDetail: Boolean;
begin
  Result := Assigned(FMasterBindSource);
end;

function TioCustomPrototypeBindSource.GetIsInterfacePresenting: Boolean;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.IsInterfaceBSA
  else
    Result := TioUtilities.IsAnInterfaceTypeName(TypeName);
end;

function TioCustomPrototypeBindSource.GetNaturalObjectBindSourceAdapter(const AOwner: TComponent): TBindSourceAdapter;
begin
  Result := (Self.InternalAdapter as IioNaturalBindSourceAdapterSource).NewNaturalObjectBindSourceAdapter(AOwner).AsTBindSourceAdapter;
end;

function TioCustomPrototypeBindSource.GetPaging: TioCommonBSAPageManager;
begin
  Result := FPaging;
end;

function TioCustomPrototypeBindSource.GetState: TBindSourceAdapterState;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

procedure TioCustomPrototypeBindSource.Loaded;
var
  LAdapter: TBindSourceAdapter;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not(csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
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

procedure TioCustomPrototypeBindSource.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification);
begin
  TioCommonBSBehavior.Notify(Sender, Self, ANotification);
end;

procedure TioCustomPrototypeBindSource.PersistAll;
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.PersistAll;
end;

procedure TioCustomPrototypeBindSource.PersistCurrent;
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.PersistCurrent;
end;

procedure TioCustomPrototypeBindSource.PostIfEditing;
begin
  if Editing then
    Post;
end;

function TioCustomPrototypeBindSource.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioCustomPrototypeBindSource.Refresh(const AReloadData: Boolean; const ANotify: Boolean = True);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if not CheckAdapter then
    Exit;
  if Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
    AnActiveBSA.Refresh(AReloadData, ANotify)
  else
    GetInternalAdapter.Refresh;
end;

procedure TioCustomPrototypeBindSource.Select<T>(AInstance: T; ASelectionType: TioSelectionType);
var
  LDestBSA: IioActiveBindSourceAdapter;
  LValue: TValue;
begin
  // Some checks
  if not Assigned(FSelectorFor) then
    raise EioException.Create(Self.ClassName, 'MakeSelection', '"SelectorFor" property not assigned.');
  if not FSelectorFor.CheckAdapter then
    raise EioException.Create(Self.ClassName, 'MakeSelection', 'Selection destination ActiveBindSourceAdapter not assigned.');
  // Get the selection destination BindSourceAdapter
  LDestBSA := FSelectorFor.GetActiveBindSourceAdapter;
  // Encapsulate the SelectedInstance into a TValue then assign it
  // as selection in a proper way
  // NB: Lasciare assolutamente così perchè ho già provato in vari modi ma mi dava sempre un errore
  // facendo cos' invece (cioè passando per un TValue) funziona correttamente.
  LValue := TValue.From<T>(AInstance);
  if LValue.Kind = TTypeKind.tkInterface then
    LDestBSA.ReceiveSelection(LValue.AsInterface, ASelectionType)
  else if LValue.Kind = TTypeKind.tkClass then
    LDestBSA.ReceiveSelection(LValue.AsObject, ASelectionType)
  else
    raise EioException.Create(Self.ClassName, 'Select<T>', 'Wrong LValue kind.');
end;

procedure TioCustomPrototypeBindSource.SelectCurrent(ASelectionType: TioSelectionType);
var
  LDestBSA: IioActiveBindSourceAdapter;
begin
  // Some checks
  if not CheckAdapter then
    raise EioException.Create(Self.ClassName, 'MakeSelection', 'ActiveBindSourceAdapter, not present.');
  // Get the selection destination BindSourceAdapter
  LDestBSA := FSelectorFor.GetActiveBindSourceAdapter;
  // Make the selection of current
  if LDestBSA.IsInterfaceBSA then
    Select<IInterface>(CurrentAs<IInterface>, ASelectionType)
  else
    Select<TObject>(Current, ASelectionType);
end;

procedure TioCustomPrototypeBindSource.SetAsync(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FAsync := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAsync := Value;
end;

procedure TioCustomPrototypeBindSource.SetAutoLoadData(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FAutoLoadData := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAutoLoadData := Value;
end;

procedure TioCustomPrototypeBindSource.SetAutoPersist(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FAutoPersist := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAutoPersist := Value;
end;

procedure TioCustomPrototypeBindSource.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    Self.InternalAdapter.AutoPost := Value;
end;

procedure TioCustomPrototypeBindSource.SetAutoRefreshOnNotification(const Value: TioAutoRefreshType);
begin
  FAutoRefreshOnNotification := Value;
end;

procedure TioCustomPrototypeBindSource.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  // NB: Lasciare commentate le righe qua sotto perchè altrimenti quando
  // si faceva un SetDataObject dava un errore perchè la funzione
  // CheckActiveAdapter restituiva sempre False perchè non avendo il DataObject
  // assegnato (se prima avevo chiamato il  ClearDataObject
  // if CheckActiveAdapter then
  GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
  // else
  // raise EioException.Create(Self.ClassName + ': invalid internal adapter.');
end;

procedure TioCustomPrototypeBindSource.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  // NB: Lasciare commentate le righe qua sotto perchè altrimenti quando
  // si faceva un SetDataObject dava un errore perchè la funzione
  // CheckActiveAdapter restituiva sempre False perchè non avendo il DataObject
  // assegnato (se prima avevo chiamato il  ClearDataObject
  // if CheckActiveAdapter then
  GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
  // else
  // raise EioException.Create(Self.ClassName + ': invalid internal adapter.');
end;

procedure TioCustomPrototypeBindSource.SetWhere(const AWhere: IioWhere);
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

procedure TioCustomPrototypeBindSource.SetWhereStr(const Value: TStrings);
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

procedure TioCustomPrototypeBindSource.SetOrderBy(const Value: String);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FOrderBy := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioWhere.SetOrderBySql(Value);
end;

procedure TioCustomPrototypeBindSource.SetPaging(const Value: TioCommonBSAPageManager);
begin
  // In reality this property would be read-only but if I left it read-only
  // then it no longer writes me the values of the sub-properties in the DFM file.
  // So I also put the set method where, however, I raise an exception if someone
  // tries to set a value.
  raise EioException.Create(ClassName, 'SetPaging', 'This property "Paging" is not writable');
end;

procedure TioCustomPrototypeBindSource.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.ioTypeAlias := Value;
end;

procedure TioCustomPrototypeBindSource.SetTypeName(const Value: String);
begin
  FTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  // update the where of the adapter also
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.ioTypeName := Value;
end;

procedure TioCustomPrototypeBindSource.SetWhereDetailsFromDetailAdapters(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioWhereDetailsFromDetailAdapters := Value;
end;

procedure TioCustomPrototypeBindSource.WhereOnChangeEventHandler(Sender: TObject);
begin
  SetWhere(TioWhereFactory.NewWhereWithPaging(FPaging).Add(FWhereStr.Text));
end;

function TioCustomPrototypeBindSource._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

function TioCustomPrototypeBindSource._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

end.
