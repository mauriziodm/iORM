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

unit iORM.LiveBindings.ActiveInterfaceListBindSourceAdapter;

interface

uses
  Data.Bind.ObjectScope, System.Classes,
  System.Generics.Collections, iORM.Where.SqlItems.Interfaces,
  iORM.CommonTypes, iORM.Context.Properties.Interfaces,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.InterfaceListBindSourceAdapter, iORM.Where.Interfaces,
  iORM.MVVM.Interfaces, iORM.Utilities, System.Rtti;

const
  TYPE_OF_COLLECTION = TioTypeOfCollection.tcList;

type

  TioActiveInterfaceListBindSourceAdapter = class(TInterfaceListBindSourceAdapter, IioContainedBindSourceAdapter, IioActiveBindSourceAdapter,
    IioNaturalBindSourceAdapterSource)
  private
    FAsync: Boolean;
    FWhere: IioWhere;
    FWhereDetailsFromDetailAdapters: Boolean;
    FTypeName, FTypeAlias: String;
    FLocalOwnsObject: Boolean;
    FLazy: Boolean;
    FLazyProps: String;
    FLoadType: TioLoadType;
    FReloading: Boolean;
    FMasterPropertyName: String;
    FMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FBindSource: IioNotifiableBindSource;
    FInsertObj_Enabled: Boolean;
    FInsertObj_NewObj: IInterface;
    FDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    FBSPersistenceDeleting: Boolean;
    // Reference to the same instance contained by FList field, this reference is only to keep live the list instance
    FInterfacedList: IInterface;
    // Async property
    function GetIoAsync: Boolean;
    procedure SetIoAsync(const Value: Boolean);
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
    function GetTypeOfCollection: TioTypeOfCollection;
    // ioOwnsObjects
    function GetOwnsObjects: Boolean;
    // State
    function GetState: TBindSourceAdapterState;
    // Fields
    function GetFields: TList<TBindSourceAdapterField>;
    // ItemIndex
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    // Items
    function GetItems(const AIndex: Integer): TObject;
    procedure SetItems(const AIndex: Integer; const Value: TObject);
    // Lazy
    procedure SetLazy(const Value: Boolean);
    function GetLazy: Boolean;
    // LazyProps
    procedure SetLazyProps(const Value: String);
    function GetLazyProps: String;
    // LoadType
    procedure SetLoadType(const Value: TioLoadType);
    function GetLoadType: TioLoadType;
    // Reloading
    function GetReloading: Boolean;
    procedure SetReloading(const Value: Boolean);
    // BSPersistenceDeleting
    function GetBSPersistenceDeleting: Boolean;
    procedure SetBSPersistenceDeleting(const Value: Boolean);
  protected
    // AutoLoad
    function GetAutoLoad: Boolean; virtual;
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
    procedure DoBeforeOpen; override;
    procedure DoBeforeDelete; override;
    procedure DoBeforeEdit; override;
    procedure DoBeforeInsert; override;
    procedure DoAfterInsert; override;
    procedure DoAfterPost; override;
    procedure DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>); override;
    procedure DoAfterDelete; override;
    procedure DoAfterScroll; override;
    procedure DoCreateInstance(out AHandled: Boolean; out AInstance: IInterface); override;
    procedure DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
    procedure DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
    procedure SetObjStatus(AObjStatus: TioObjStatus);
    function UseObjStatus: Boolean;
    // Generic parameter must be <IInterface> (for interfaced list such as IioList<IInterface>) or
    // <TObject> (for non interfaced list such as TList<IInterface>)
    procedure _InternalSetDataObject<T>(const ADataObject: TObject; const AOwnsObject: Boolean);
    procedure InternalSetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    constructor InternalCreate(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent; const AOwnsObject: Boolean = True); overload;
  public
    constructor Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent; const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    constructor Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent; const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    destructor Destroy; override;
    function MasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    procedure SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
    procedure SetMasterProperty(AMasterProperty: IioProperty);
    procedure SetBindSource(ANotifiableBindSource: IioNotifiableBindSource);
    function GetBindSource: IioNotifiableBindSource;
    function HasBindSource: Boolean;
    procedure ExtractDetailObject(AMasterObj: TObject);
    procedure PersistCurrent;
    procedure PersistAll;
    function NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere): IioActiveBindSourceAdapter;
    function NewNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
    function GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    procedure Append(AObject: TObject); reintroduce; overload;
    procedure Append(AObject: IInterface); reintroduce; overload;
    procedure Insert(AObject: TObject); reintroduce; overload;
    procedure Insert(AObject: IInterface); reintroduce; overload;
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    procedure Refresh(const ANotify: Boolean = True); reintroduce; overload;
    procedure Reload; virtual;
    procedure LoadPage;
    function DataObject: TObject;
    procedure SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    procedure ClearDataObject;
    function GetCurrentOID: Integer;
    function HasMasterBSA: Boolean;
    function IsMasterBSA: Boolean;
    function IsDetailBSA: Boolean;
    function IsInterfaceBSA: Boolean;
    function GetMasterPropertyName: String;
    function GetMasterPropertyPath: String;
    function GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
    function AsTBindSourceAdapter: TBindSourceAdapter;
    procedure ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType); overload;
    procedure ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType); overload;
    function AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  end;

implementation

uses
  iORM, iORM.LiveBindings.Factory, iORM.Context.Factory, iORM.Context.Interfaces, System.SysUtils, iORM.LazyLoad.Interfaces, iORM.Exceptions,
  iORM.Context.Map.Interfaces, iORM.Where.Factory, iORM.LiveBindings.CommonBSAPersistence, iORM.Abstraction, iORM.Containers.Interfaces,
  iORM.LiveBindings.CommonBSABehavior, iORM.Context.Container;

{ TioActiveListBindSourceAdapter<T> }

{$IFDEF AUTOREFCOUNT}

function TioActiveInterfaceListBindSourceAdapter.__ObjAddRef: Integer;
begin
  // Nothing (event the "inherited")
end;

function TioActiveInterfaceListBindSourceAdapter.__ObjRelease: Integer;
begin
  // Nothing (event the "inherited")
end;
{$ENDIF}

procedure TioActiveInterfaceListBindSourceAdapter.Append(AObject: IInterface);
begin
  // Set sone InsertObj subsystem variables
  // Then call the standard code
  FInsertObj_NewObj := AObject;
  FInsertObj_Enabled := True;
  Self.Append;
end;

procedure TioActiveInterfaceListBindSourceAdapter.Append(AObject: TObject);
begin
  raise EioException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for interface referenced instances only.');
end;

function TioActiveInterfaceListBindSourceAdapter.AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := Self as IioActiveBindSourceAdapter;
end;

function TioActiveInterfaceListBindSourceAdapter.AsTBindSourceAdapter: TBindSourceAdapter;
begin
  Result := Self as TBindSourceAdapter;
end;

procedure TioActiveInterfaceListBindSourceAdapter.ClearDataObject;
begin
  Self.InternalSetDataObject(nil, False);
end;

constructor TioActiveInterfaceListBindSourceAdapter.Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent;
  const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  inherited Create(AOwner, ADataObject, ATypeAlias, ATypeName, AOwnsObject);
  InternalCreate(ATypeName, ATypeAlias, AWhere, AOwner, AOwnsObject);
  FInterfacedList := ADataObject;
end;

constructor TioActiveInterfaceListBindSourceAdapter.Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent;
  const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  inherited Create(AOwner, ADataObject, ATypeAlias, ATypeName, AOwnsObject);
  InternalCreate(ATypeName, ATypeAlias, AWhere, AOwner, AOwnsObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  TioCommonBSABehavior.DeleteListViewItem(Self, AItemIndex, ADelayMilliseconds);
end;

destructor TioActiveInterfaceListBindSourceAdapter.Destroy;
begin
  // Detach itself from MasterAdapterContainer (if it's contained)
  if Assigned(FMasterAdaptersContainer) then
    FMasterAdaptersContainer.RemoveBindSourceAdapter(Self);
  // Free the DetailAdaptersContainer
  FDetailAdaptersContainer.Free;
  inherited;
end;

function TioActiveInterfaceListBindSourceAdapter.DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FDetailAdaptersContainer;
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterPost;
begin
  inherited;
  TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>);
begin
  inherited;
  TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterScroll;
begin
  inherited;
  TioCommonBSAPersistence.AfterScroll(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoAfterSelection(ASelected, ASelectionType);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeDelete;
begin
  inherited;
  TioCommonBSAPersistence.BeforeDelete(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterDelete;
begin
  inherited;
  DoAfterScroll; // Mauri 11/01/2022: Aggiunto perchè altrimenti iin alcuni casi particolari dava errori
  TioCommonBSAPersistence.AfterDelete(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterInsert;
begin
  inherited;
  DoAfterScroll; // Mauri 11/01/2022: Aggiunto perchè altrimenti iin alcuni casi particolari dava errori
  TioCommonBSAPersistence.AfterInsert(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeEdit;
begin
  inherited;
  TioCommonBSAPersistence.BeforeEdit(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeInsert;
begin
  inherited;
  TioCommonBSAPersistence.BeforeInsert(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeOpen;
begin
  inherited;
  TioCommonBSAPersistence.Load(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.Refresh(const ANotify: Boolean = True);
begin
  TioCommonBSAPersistence.Refresh(Self, ANotify);
end;

procedure TioActiveInterfaceListBindSourceAdapter.Reload;
begin
  TioCommonBSAPersistence.Reload(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoBeforeSelection(ASelected, ASelectionType);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoCreateInstance(out AHandled: Boolean; out AInstance: IInterface);
begin
  inherited;
  if FInsertObj_Enabled then
  begin
    try
      AInstance := FInsertObj_NewObj;
      AHandled := True;
    finally
      // Reset InsertObj subsystem
      FInsertObj_Enabled := False;
      FInsertObj_NewObj := nil;
    end;
  end;
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FBindSource) then
    FBindSource.DoSelection(ASelected, ASelectionType, ADone);
end;

procedure TioActiveInterfaceListBindSourceAdapter.ExtractDetailObject(AMasterObj: TObject);
var
  LDetailObj: TObject;
  LDetailIntf: IInterface;
  LValue: TValue;
  LLazyLoadableObj: IioLazyLoadable;
  LMasterProperty: IioProperty;
begin
  LDetailObj := nil;
  LDetailIntf := nil;
  // Check parameter, if the MasterObject is not assigned
  // then close the BSA
  if not Assigned(AMasterObj) then
  begin
    Self.InternalSetDataObject(nil, False);
    // 2° parameter false ABSOLUTELY!!!!!!!
    Exit;
  end;
  // Extract master property value
  LMasterProperty := TioMapContainer.GetMap(AMasterObj.ClassName).GetProperties.GetPropertyByName(FMasterPropertyName);
  LValue := LMasterProperty.GetValue(AMasterObj);
  // Retrieve the object from the TValue (always as TObject)
  if not LValue.IsEmpty then
  begin
    if LMasterProperty.IsInterface then
      LDetailObj := TObject(LValue.AsInterface)
    else
      LDetailObj := LValue.AsObject;
  end;
  // If is a LazyLoadable list then set the internal List (GetInternalObject is always as TObject)
  // NB: Assegnare direttamente anche i LazyLoadable come se fossero delle liste
  // normali dava dei problemi (non dava errori ma non usciva nulla)
  if Supports(LDetailObj, IioLazyLoadable, LLazyLoadableObj) then
  begin
    LDetailObj := LLazyLoadableObj.GetInternalObject;
    Self.InternalSetDataObject(LDetailObj, False);
    // 2° parameter false ABSOLUTELY!!!!!!!
  end
  else
    // else if it isn't a LazyLoadable list but the MasterProperty is an interface...
    if LMasterProperty.IsInterface then
    begin
      LDetailIntf := LValue.AsInterface;
      Self.InternalSetDataObject(LDetailIntf, False);
      // 2° parameter false ABSOLUTELY!!!!!!!
    end
    // else it's a normal List object (not an interface)
    else
      Self.InternalSetDataObject(LDetailObj, False);
  // 2° parameter false ABSOLUTELY!!!!!!!
end;

function TioActiveInterfaceListBindSourceAdapter.GetLazy: Boolean;
begin
  Result := FLazy;
end;

function TioActiveInterfaceListBindSourceAdapter.GetLazyProps: String;
begin
  Result := FLazyProps;
end;

function TioActiveInterfaceListBindSourceAdapter.GetLoadType: TioLoadType;
begin
  Result := FLoadType;
end;

function TioActiveInterfaceListBindSourceAdapter.GetAutoLoad: Boolean;
begin
  Result := FLoadType = ltAuto;
end;

function TioActiveInterfaceListBindSourceAdapter.GetBindSource: IioNotifiableBindSource;
begin
  Result := FBindSource;
end;

function TioActiveInterfaceListBindSourceAdapter.GetBSPersistenceDeleting: Boolean;
begin
  Result := FBSPersistenceDeleting;
end;

function TioActiveInterfaceListBindSourceAdapter.GetCurrentOID: Integer;
begin
  Result := TioMapContainer.GetMap(Current.ClassName).GetProperties.GetIdProperty.GetValue(Self.Current).AsInteger;
end;

function TioActiveInterfaceListBindSourceAdapter.DataObject: TObject;
begin
  Result := Self.List;
end;

function TioActiveInterfaceListBindSourceAdapter.GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := FDataSetLinkContainer;
end;

function TioActiveInterfaceListBindSourceAdapter.GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.GetBindSourceAdapterByMasterPropertyName(AMasterPropertyName);
end;

function TioActiveInterfaceListBindSourceAdapter.GetFields: TList<TBindSourceAdapterField>;
begin
  Result := Self.Fields;
end;

function TioActiveInterfaceListBindSourceAdapter.GetIoAsync: Boolean;
begin
  Result := FAsync;
end;

function TioActiveInterfaceListBindSourceAdapter.NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere)
  : IioActiveBindSourceAdapter;
begin
  // Return the requested DetailBindSourceAdapter and set the current master object
  Result := FDetailAdaptersContainer.NewBindSourceAdapter(AOwner, GetBaseObjectRttiType.Name, AMasterPropertyName, AWhere);
  FDetailAdaptersContainer.SetMasterObject(Self.Current);
end;

function TioActiveInterfaceListBindSourceAdapter.GetioAutoPost: Boolean;
begin
  Result := Self.AutoPost;
end;

function TioActiveInterfaceListBindSourceAdapter.GetTypeOfCollection: TioTypeOfCollection;
begin
  Result := TYPE_OF_COLLECTION;
end;

function TioActiveInterfaceListBindSourceAdapter.GetioWhere: IioWhere;
begin
  Result := FWhere;
  // Fill the WhereDetails from the DetailAdapters container if enabled
  // NB: Create it if not assigned
  if FWhereDetailsFromDetailAdapters then
  begin
    if not Assigned(FWhere) then
      FWhere := TioWhereFactory.NewWhere;
    FDetailAdaptersContainer.FillWhereDetails(FWhere.Details);
  end;
end;

function TioActiveInterfaceListBindSourceAdapter.GetioWhereDetailsFromDetailAdapters: Boolean;
begin
  Result := FWhereDetailsFromDetailAdapters;
end;

function TioActiveInterfaceListBindSourceAdapter.GetItemIndex: Integer;
begin
  Result := inherited ItemIndex;
end;

function TioActiveInterfaceListBindSourceAdapter.GetItems(const AIndex: Integer): TObject;
begin
  Result := Self.List.Items[AIndex] as TObject;
end;

function TioActiveInterfaceListBindSourceAdapter.GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if Self.HasMasterBSA then
    Result := FMasterAdaptersContainer.GetMasterBindSourceAdapter
  else
    Result := nil;
end;

function TioActiveInterfaceListBindSourceAdapter.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioActiveInterfaceListBindSourceAdapter.GetMasterPropertyPath: String;
begin
  if HasMasterBSA then
    Result := GetMasterBindSourceAdapter.GetMasterPropertyPath + '.' + GetMasterPropertyName
  else
    Result := '';
end;

function TioActiveInterfaceListBindSourceAdapter.GetOwnsObjects: Boolean;
begin
  Result := FLocalOwnsObject;
end;

function TioActiveInterfaceListBindSourceAdapter.GetReloading: Boolean;
begin
  Result := FReloading;
end;

function TioActiveInterfaceListBindSourceAdapter.GetState: TBindSourceAdapterState;
begin
  Result := Self.State;
end;

function TioActiveInterfaceListBindSourceAdapter.NewNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
begin
  Result := TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(AOwner, Self);
end;

function TioActiveInterfaceListBindSourceAdapter.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
begin
  TioCommonBSABehavior.Notify(Sender, Self, ANotification);
  Result := ANotification.Response;
end;

procedure TioActiveInterfaceListBindSourceAdapter.Insert(AObject: IInterface);
begin
  // Set sone InsertObj subsystem variables
  // Then call the standard code
  FInsertObj_NewObj := AObject;
  FInsertObj_Enabled := True;
  Self.Insert;
end;

constructor TioActiveInterfaceListBindSourceAdapter.InternalCreate(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent; const AOwnsObject: Boolean = True);
begin
  FInterfacedList := nil;
  FLoadType := ltAuto;
  FLazy := False;
  FLazyProps := '';
  FAsync := False;
  FReloading := False;
  FBSPersistenceDeleting := False;
  // inherited Create(AOwner, ADataObject, ATypeAlias, ATypeName, AOwnsObject);
  FLocalOwnsObject := AOwnsObject;
  FWhere := AWhere;
  FWhereDetailsFromDetailAdapters := False;
  FTypeName := ATypeName;
  FTypeAlias := ATypeAlias;
  FDataSetLinkContainer := TioLiveBindingsFactory.BSAToDataSetLinkContainer;
  // Set Master & Details adapters reference
  FMasterAdaptersContainer := nil;
  FDetailAdaptersContainer := TioLiveBindingsFactory.DetailAdaptersContainer(Self);
  // Init InsertObj subsystem values
  FInsertObj_Enabled := False;
  FInsertObj_NewObj := nil;
end;

procedure TioActiveInterfaceListBindSourceAdapter.Insert(AObject: TObject);
begin
  raise EioException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for interface referenced instances only.');
end;

function TioActiveInterfaceListBindSourceAdapter.HasBindSource: Boolean;
begin
  Result := Assigned(FBindSource);
end;

function TioActiveInterfaceListBindSourceAdapter.HasMasterBSA: Boolean;
begin
  Result := not FMasterPropertyName.IsEmpty;
end;

function TioActiveInterfaceListBindSourceAdapter.IsDetailBSA: Boolean;
begin
  Result := HasMasterBSA;
end;

function TioActiveInterfaceListBindSourceAdapter.IsInterfaceBSA: Boolean;
begin
  Result := True;
end;

function TioActiveInterfaceListBindSourceAdapter.IsMasterBSA: Boolean;
begin
  Result := not HasMasterBSA;
end;

procedure TioActiveInterfaceListBindSourceAdapter.LoadPage;
begin
  TioCommonBSAPersistence.LoadPage(Self);
end;

function TioActiveInterfaceListBindSourceAdapter.MasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FMasterAdaptersContainer;
end;

procedure TioActiveInterfaceListBindSourceAdapter.PersistAll;
begin
  TioCommonBSAPersistence.PersistAll(Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.PersistCurrent;
begin
  TioCommonBSAPersistence.PersistCurrent(Self);
end;

function TioActiveInterfaceListBindSourceAdapter.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioActiveInterfaceListBindSourceAdapter.ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType);
var
  LSelectedAsIntf: IInterface;
begin
  // Questo ActiveBindSourceAdapter funziona solo con gli oggetti (no interfacce)
  // quindi chiama l'altra versione di metodo più adatta. IN questo modo
  // è possibile gestire la selezione anche se il selettore non è concorde
  if Supports(ASelected, IInterface, LSelectedAsIntf) then
    ReceiveSelection(LSelectedAsIntf, ASelectionType)
  else
    raise EioException.Create(Self.ClassName, 'ReceiveSelection', 'Selected instance does not support any interface.');
end;

procedure TioActiveInterfaceListBindSourceAdapter.ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType);
var
  LDone: Boolean;
begin
  // Initialization
  LDone := False;

  // NB: OnReceiveSelectionCloneObject property of the BindSource is not
  //  useful in an interface bindsource adapter

  // Do the selection
  DoBeforeSelection(ASelected, ASelectionType);
  DoSelection(ASelected, ASelectionType, LDone);
  if not LDone then
    case ASelectionType of
      TioSelectionType.stAppend:
        Self.Append(ASelected);
      TioSelectionType.stInsert:
        Self.Insert(ASelected);
    end;
  DoAfterSelection(ASelected, ASelectionType);

  // NB: OnReceiveSelectionFreeObject property of the BindSource is not
  //  useful in an interface bindsource adapter
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetLazy(const Value: Boolean);
begin
  FLazy := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetLoadType(const Value: TioLoadType);
begin
  FLoadType := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetBindSource(ANotifiableBindSource: IioNotifiableBindSource);
begin
  FBindSource := ANotifiableBindSource;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetBSPersistenceDeleting(const Value: Boolean);
begin
  FBSPersistenceDeleting := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  if Self.HasMasterBSA then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<TObject>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  if Self.HasMasterBSA then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<IInterface>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter.InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  Self._InternalSetDataObject<IInterface>(ADataObject as TObject, AOwnsObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter._InternalSetDataObject<T>(const ADataObject: TObject; const AOwnsObject: Boolean);
var
  LPrecLoadType: TioLoadType;
begin
  // Init
  FInterfacedList := nil;
  // Disable the adapter
  First; // Bug
  Active := False;
  // AObj is assigned then set it as DataObject
  // else set DataObject to nil and set MasterObject to nil
  // to disable all Details adapters also
  if Assigned(ADataObject) then
  begin
    // Set the provided DataObject (always as TList<IInterface>)
    SetList(TList<IInterface>(ADataObject), AOwnsObject);
    // If the DataObject (List) is an interface referenced object then
    // set the FInterfacedList field to it to keep alive the list itself
    if TioUtilities.IsAnInterface<T> then
      Supports(ADataObject, IInterface, FInterfacedList);
    // Prior to reactivate the adapter force the "AutoLoadData" property to False to prevent double values
    // then restore the original value of the "AutoLoadData" property.
    LPrecLoadType := FLoadType;
    try
      FLoadType := ltManual;
      Active := True;
    finally
      FLoadType := LPrecLoadType;
    end;
  end
  else
  begin
    SetList(nil, AOwnsObject);
    FDetailAdaptersContainer.SetMasterObject(nil);
  end;
  // DataSet synchro
  GetDataSetLinkContainer.Refresh;

  // -------------------------------------------------------------------------------------------------------
  // If is a LazyLoadable list then set the internal List
  // NB: Assegnare direttamente anche i LazyLoadable come se fossero delle liste
  // normali dava dei problemi (non dava errori ma non usciva nulla)
  // if Supports(AObj, IioLazyLoadable, ALazyLoadableObj)
  // then AObj := TList<TObject>(ALazyLoadableObj.GetInternalObject);
  // Self.SetList(AObj as TList<IInterface>, False);  // NB: AOwns (2° parameters) = False ABSOLUTELY!!!!!!
  /// / -------------------------------------------------------------------------------------------------------
end;

procedure TioActiveInterfaceListBindSourceAdapter.InternalSetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  Self._InternalSetDataObject<TObject>(ADataObject, AOwnsObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetIoAsync(const Value: Boolean);
begin
  FAsync := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetioAutoPost(const Value: Boolean);
begin
  Self.AutoPost := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetIoWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetioWhereDetailsFromDetailAdapters(const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetItemIndex(const Value: Integer);
begin
  inherited ItemIndex := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetItems(const AIndex: Integer; const Value: TObject);
var
  LIntf: IInterface;
begin
  if Supports(Value, IInterface, LIntf) then
    Self.List.Items[AIndex] := LIntf
  else
    raise EioException.Create(Self.ClassName, 'SetItems', 'Value object does not implement any interface.');
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
begin
  FMasterAdaptersContainer := AMasterAdaptersContainer;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetMasterProperty(AMasterProperty: IioProperty);
begin
  FMasterPropertyName := AMasterProperty.GetName;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetObjStatus(AObjStatus: TioObjStatus);
begin
  TioCommonBSABehavior.SetObjStatus(Self, AObjStatus);
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetReloading(const Value: Boolean);
begin
  FReloading := Value;
end;

function TioActiveInterfaceListBindSourceAdapter.UseObjStatus: Boolean;
begin
  Result := TioCommonBSABehavior.UseObjStatus(Self);
end;

function TioActiveInterfaceListBindSourceAdapter._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

function TioActiveInterfaceListBindSourceAdapter._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

end.
