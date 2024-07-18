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
unit iORM.LiveBindings.ActiveListBindSourceAdapter;

interface

uses
  Data.Bind.ObjectScope, System.Classes,
  System.Generics.Collections, iORM.Where.SqlItems.Interfaces,
  iORM.CommonTypes, iORM.Context.Properties.Interfaces,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.InterfaceListBindSourceAdapter, iORM.Where.Interfaces,
  iORM.MVVM.Interfaces, System.Rtti;

const
  TYPE_OF_COLLECTION = TioTypeOfCollection.tcList;

type

  TioActiveListBindSourceAdapter = class(TListBindSourceAdapter, IioContainedBindSourceAdapter, IioActiveBindSourceAdapter, IioNaturalBindSourceAdapterSource)
  private
    FAsyncLoad: Boolean;
    FAsyncPersist: Boolean;
    FWhere: IioWhere;
    // FClassRef: TioClassRef;
    FTypeName, FTypeAlias: String; // NB: TypeAlias has no effect in this adapter (only used by interfaced BSA)
    FLocalOwnsObject: Boolean;
    FReloading: Boolean;
    FLazy: Boolean;
    FLazyProps: String;
    FLoadType: TioLoadType;
    FMasterProperty: IioProperty;
    FMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FBindSource: IioBindSource;
    FInsertObj_Enabled: Boolean;
    FInsertObj_NewObj: TObject;
    FDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    FBSPersistenceDeleting: Boolean;
    // Reference to the same instance contained by FList field, this reference is only to keep live the list instance
    // TODO: Dopo aver eliminato le IioList<T> interne � da eliminare? Opppure la teniamo e ripristiniamo anche i costruttori per le liste di Spring4D
    FInterfacedList: IInterface;
    // TypeName
    procedure SetTypeName(const AValue: String);
    function GetTypeName: String;
    // TypeAlias
    procedure SetTypeAlias(const AValue: String);
    function GetTypeAlias: String;
    // AsyncLoad property
    function GetAsyncLoad: Boolean;
    procedure SetAsyncLoad(const Value: Boolean);
    // AsyncPersist property
    function GetAsyncPersist: Boolean;
    procedure SetAsyncPersist(const Value: Boolean);
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

    function SupportsNestedFields: Boolean; override;
    procedure AddFields; override;
    // =========================================================================
    // Part for the support of the IioBindSource interfaces (Added by iORM)
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
    procedure DoCreateInstance(out AHandled: Boolean; out AInstance: TObject); override;
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
    procedure DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
    procedure SetObjStatus(AObjStatus: TioObjStatus);
    function UseObjStatus: Boolean;
    function GetBaseObjectClassName: String;
    // Generic parameter must be <IInterface> (for interfaced list such as IioList<IInterface>) or
    // <TObject> (for non interfaced list such as TList<IInterface>)
    procedure _InternalSetDataObject<T>(const ADataObject: TObject; const AOwnsObject: Boolean); overload;
    procedure InternalSetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
    constructor InternalCreate(const AClassRef: TioClassRef; const AWhere: IioWhere; const AOwner: TComponent; const AOwnsObject: Boolean = True); overload;
  public
    constructor Create(const AClassRef: TioClassRef; const AWhere: IioWhere; const AOwner: TComponent; const ADataObject: TList<TObject>;
      const AOwnsObject: Boolean = True); overload;
//    constructor Create(const AClassRef: TioClassRef; const AWhere: IioWhere; const AOwner: TComponent; const ADataObject: IInterface;
//      const AOwnsObject: Boolean = False); overload;
    destructor Destroy; override;
    function MasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    procedure SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
    procedure SetMasterProperty(AMasterProperty: IioProperty);
    procedure SetBindSource(ANotifiableBindSource: IioBindSource);
    function GetBindSource: IioBindSource;
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
  iORM, iORM.LiveBindings.Factory, iORM.Context.Interfaces, System.SysUtils, iORM.LazyLoad.Interfaces, iORM.Exceptions, iORM.Utilities,
  iORM.Context.Map.Interfaces, iORM.Where.Factory, iORM.LiveBindings.CommonBSAPersistence, iORM.Abstraction,
  iORM.LiveBindings.CommonBSABehavior, iORM.Context.Container, iORM.Context.Factory;

{ TioActiveListBindSourceAdapter<T> }

{$IFDEF AUTOREFCOUNT}

function TioActiveListBindSourceAdapter.__ObjAddRef: Integer;
begin
  // Nothing (event the "inherited")
end;

function TioActiveListBindSourceAdapter.__ObjRelease: Integer;
begin
  // Nothing (event the "inherited")
end;
{$ENDIF}

constructor TioActiveListBindSourceAdapter.InternalCreate(const AClassRef: TioClassRef; const AWhere: IioWhere; const AOwner: TComponent;
  const AOwnsObject: Boolean = True);
begin
  FInterfacedList := nil;
  FLoadType := ltAuto;
  FLazy := False;
  FLazyProps := '';
  FAsyncLoad := False;
  FAsyncPersist := False;
  FReloading := False;
  FBSPersistenceDeleting := False;
  // inherited Create(AOwner, ADataObject, AClassRef, AOwnsObject);
  FLocalOwnsObject := AOwnsObject;
  FWhere := AWhere;
  FTypeName := AClassRef.ClassName;
  FTypeAlias := ''; // NB: TypeAlias has no effect in this adapter (only used by interfaced BSA)
  FDataSetLinkContainer := TioLiveBindingsFactory.BSAToDataSetLinkContainer;
  // Set Master & Details adapters reference
  FMasterAdaptersContainer := nil;
  FDetailAdaptersContainer := TioLiveBindingsFactory.DetailAdaptersContainer(Self);
  // Init InsertObj subsystem values
  FInsertObj_Enabled := False;
  FInsertObj_NewObj := nil;
end;

constructor TioActiveListBindSourceAdapter.Create(const AClassRef: TioClassRef; const AWhere: IioWhere; const AOwner: TComponent;
  const ADataObject: TList<TObject>; const AOwnsObject: Boolean);
begin
  inherited Create(AOwner, ADataObject, AClassRef, AOwnsObject);
  InternalCreate(AClassRef, AWhere, AOwner, AOwnsObject);
end;

//constructor TioActiveListBindSourceAdapter.Create(const AClassRef: TioClassRef; const AWhere: IioWhere; const AOwner: TComponent; const ADataObject: IInterface;
//  const AOwnsObject: Boolean);
//var
//  LDataObject: TObject;
//begin
//  LDataObject := ADataObject as TObject;
//  inherited Create(AOwner, TList<TObject>(LDataObject), AClassRef, AOwnsObject);
//  InternalCreate(AClassRef, AWhere, AOwner, AOwnsObject);
//  FInterfacedList := ADataObject; // To keep che interfaced list live
//end;

procedure TioActiveListBindSourceAdapter.Append(AObject: TObject);
begin
  // Set sone InsertObj subsystem variables
  // Then call the standard code
  FInsertObj_NewObj := AObject;
  FInsertObj_Enabled := True;
  Self.Append;
end;

procedure TioActiveListBindSourceAdapter.AddFields;
var
  LType: TRttiType;
  LIntf: IGetMemberObject;
begin
  // inherited; // NB: Don't inherit from ancestor
  LType := GetObjectType;
  LIntf := TBindSourceAdapterGetMemberObject.Create(Self);
  // AddFieldsToList(LType, Self, Self.Fields, LIntf); // Original code
  // AddPropertiesToList(LType, Self, Self.Fields, LIntf); // Original code
  TioCommonBSABehavior.AddFields(LType, Self, LIntf, ''); // To support iORM nested fields on child objects
end;

procedure TioActiveListBindSourceAdapter.Append(AObject: IInterface);
begin
  raise EioGenericException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for class referenced instances only.');
end;

function TioActiveListBindSourceAdapter.AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := Self as IioActiveBindSourceAdapter;
end;

function TioActiveListBindSourceAdapter.AsTBindSourceAdapter: TBindSourceAdapter;
begin
  Result := Self as TBindSourceAdapter;
end;

procedure TioActiveListBindSourceAdapter.ClearDataObject;
begin
  Self.InternalSetDataObject(nil, False);
end;

procedure TioActiveListBindSourceAdapter.DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer);
begin
  TioCommonBSABehavior.DeleteListViewItem(Self, AItemIndex, ADelayMilliseconds);
end;

destructor TioActiveListBindSourceAdapter.Destroy;
begin
  // Detach itself from MasterAdapterContainer (if it's contained)
  if Assigned(FMasterAdaptersContainer) then
    FMasterAdaptersContainer.RemoveDetailBindSourceAdapter(Self);
  // Free the DetailAdaptersContainer
  if Assigned(FDetailAdaptersContainer) then
    FDetailAdaptersContainer.Free;
  inherited;
end;

function TioActiveListBindSourceAdapter.DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FDetailAdaptersContainer;
end;

procedure TioActiveListBindSourceAdapter.DoAfterPost;
begin
  inherited;
  TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveListBindSourceAdapter.DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>);
begin
  inherited;
  TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveListBindSourceAdapter.DoAfterScroll;
begin
  inherited;
  TioCommonBSAPersistence.AfterScroll(Self);
end;

procedure TioActiveListBindSourceAdapter.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoAfterSelection(ASelected, ASelectionType);
end;

procedure TioActiveListBindSourceAdapter.DoBeforeDelete;
begin
  inherited;
  TioCommonBSAPersistence.BeforeDelete(Self);
end;

procedure TioActiveListBindSourceAdapter.DoAfterDelete;
begin
  inherited;
  DoAfterScroll; // Mauri 11/01/2022: Aggiunto perch� altrimenti in alcuni casi particolari dava errori
  TioCommonBSAPersistence.AfterDelete(Self);
end;

procedure TioActiveListBindSourceAdapter.DoAfterInsert;
begin
  inherited;
  DoAfterScroll; // Mauri 11/01/2022: Aggiunto perch� altrimenti iin alcuni casi particolari dava errori
  TioCommonBSAPersistence.AfterInsert(Self);
end;

procedure TioActiveListBindSourceAdapter.DoBeforeEdit;
begin
  inherited;
  TioCommonBSAPersistence.BeforeEdit(Self);
end;

procedure TioActiveListBindSourceAdapter.DoBeforeInsert;
begin
  inherited;
  TioCommonBSAPersistence.BeforeInsert(Self);
end;

procedure TioActiveListBindSourceAdapter.DoBeforeOpen;
begin
  inherited;
  case FLoadType of
    ltCreate:
      TioCommonBSAPersistence.Create(Self);
    ltAuto:
      TioCommonBSAPersistence.Load(Self);
  end;
end;

procedure TioActiveListBindSourceAdapter.Refresh(const ANotify: Boolean = True);
begin
  TioCommonBSAPersistence.Refresh(Self, ANotify);
end;

procedure TioActiveListBindSourceAdapter.Reload;
begin
  if FLoadType = ltCreate then
    TioCommonBSAPersistence.Create(Self)
  else
    TioCommonBSAPersistence.Reload(Self);
end;

procedure TioActiveListBindSourceAdapter.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoBeforeSelection(ASelected, ASelectionType);
end;

procedure TioActiveListBindSourceAdapter.DoCreateInstance(out AHandled: Boolean; out AInstance: TObject);
begin
  inherited;
  if AHandled then
    Exit;
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

procedure TioActiveListBindSourceAdapter.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FBindSource) then
    FBindSource.DoSelection(ASelected, ASelectionType, ADone);
end;

procedure TioActiveListBindSourceAdapter.ExtractDetailObject(AMasterObj: TObject);
var
  LDetailObj: TObject;
  LDetailIntf: IInterface;
  LValue: TValue;
  LLazyLoadableObj: IioLazyLoadable;
begin
  LDetailObj := nil;
  LDetailIntf := nil;
  // Check parameter, if the MasterObject is not assigned
  // then close the BSA
  if not Assigned(AMasterObj) then
  begin
    Self.InternalSetDataObject(nil, False); // 2� parameter false ABSOLUTELY!!!!!!!
    Exit;
  end;
  // Extract master property value
  LValue := FMasterProperty.GetValue(AMasterObj);
  // Retrieve the object from the TValue (always as TObject)
  if not LValue.IsEmpty then
  begin
    if FMasterProperty.IsInterface then
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
    Self.InternalSetDataObject(LDetailObj, False); // 2� parameter false ABSOLUTELY!!!!!!!
  end
  else
    // else if it isn't a LazyLoadable list but the MasterProperty is an interface...
    if FMasterProperty.IsInterface then
    begin
      LDetailIntf := LValue.AsInterface;
      Self.InternalSetDataObject(LDetailIntf, False); // 2� parameter false ABSOLUTELY!!!!!!!
    end
    // else it's a normal List object (not an interface)
    else
      Self.InternalSetDataObject(LDetailObj, False); // 2� parameter false ABSOLUTELY!!!!!!!
end;

function TioActiveListBindSourceAdapter.GetLazy: Boolean;
begin
  Result := FLazy;
end;

function TioActiveListBindSourceAdapter.GetLazyProps: String;
begin
  Result := FLazyProps;
end;

function TioActiveListBindSourceAdapter.GetLoadType: TioLoadType;
begin
  Result := FLoadType;
end;

function TioActiveListBindSourceAdapter.GetAutoLoad: Boolean;
begin
  Result := (FLoadType = ltAuto);
end;

function TioActiveListBindSourceAdapter.GetBaseObjectClassName: String;
begin
  Result := FTypeName;
end;

function TioActiveListBindSourceAdapter.GetBindSource: IioBindSource;
begin
  Result := FBindSource;
end;

function TioActiveListBindSourceAdapter.GetBSPersistenceDeleting: Boolean;
begin
  Result := FBSPersistenceDeleting;
end;

function TioActiveListBindSourceAdapter.GetCurrentOID: Integer;
begin
  Result := TioMapContainer.GetMap(Current.ClassName).GetProperties.GetIdProperty.GetValue(Self.Current).AsInteger;
end;

function TioActiveListBindSourceAdapter.DataObject: TObject;
begin
  Result := Self.List;
end;

function TioActiveListBindSourceAdapter.GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := FDataSetLinkContainer;
end;

function TioActiveListBindSourceAdapter.GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.GetBindSourceAdapterByMasterPropertyName(AMasterPropertyName);
end;

function TioActiveListBindSourceAdapter.GetFields: TList<TBindSourceAdapterField>;
begin
  Result := Self.Fields;
end;

function TioActiveListBindSourceAdapter.GetAsyncLoad: Boolean;
begin
  Result := FAsyncLoad;
end;

function TioActiveListBindSourceAdapter.GetAsyncPersist: Boolean;
begin
  Result := FAsyncPersist;
end;

function TioActiveListBindSourceAdapter.NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String; const AWhere: IioWhere)
  : IioActiveBindSourceAdapter;
begin
  // Result := nil;
  // Return the requested DetailBindSourceAdapter and set the current master object
  Result := FDetailAdaptersContainer.NewDetailBindSourceAdapter(AOwner, FTypeName, AMasterPropertyName, AWhere);
  FDetailAdaptersContainer.SetMasterObject(Self.Current);
end;

function TioActiveListBindSourceAdapter.GetioAutoPost: Boolean;
begin
  Result := Self.AutoPost;
end;

function TioActiveListBindSourceAdapter.GetTypeOfCollection: TioTypeOfCollection;
begin
  Result := TYPE_OF_COLLECTION;
end;

function TioActiveListBindSourceAdapter.GetWhere: IioWhere;
begin
  Result := FWhere;
end;

function TioActiveListBindSourceAdapter.GetItemIndex: Integer;
begin
  Result := inherited ItemIndex;
end;

function TioActiveListBindSourceAdapter.GetItems(const AIndex: Integer): TObject;
begin
  Result := List.Items[AIndex] as TObject
end;

function TioActiveListBindSourceAdapter.GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if Self.HasMasterBSA then
    Result := FMasterAdaptersContainer.GetMasterBindSourceAdapter;
end;

function TioActiveListBindSourceAdapter.GetMasterPropertyName: String;
begin
  Result := FMasterProperty.GetName;
end;

function TioActiveListBindSourceAdapter.GetMasterPropertyPath: String;
begin
  if HasMasterBSA then
    Result := GetMasterBindSourceAdapter.GetMasterPropertyPath + '.' + GetMasterPropertyName
  else
    Result := '';
end;

function TioActiveListBindSourceAdapter.GetOwnsObjects: Boolean;
begin
  Result := FLocalOwnsObject;
end;

function TioActiveListBindSourceAdapter.GetReloading: Boolean;
begin
  Result := FReloading;
end;

function TioActiveListBindSourceAdapter.GetState: TBindSourceAdapterState;
begin
  Result := Self.State;
end;

function TioActiveListBindSourceAdapter.GetTypeAlias: String;
begin
  Result := FTypeAlias;
end;

function TioActiveListBindSourceAdapter.GetTypeName: String;
begin
  Result := FTypeName;
end;

function TioActiveListBindSourceAdapter.NewNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.NewNaturalBindSourceAdapter(AOwner, Self);
end;

procedure TioActiveListBindSourceAdapter.Insert(AObject: TObject);
begin
  // Set sone InsertObj subsystem variables
  // Then call the standard code
  FInsertObj_NewObj := AObject;
  FInsertObj_Enabled := True;
  Self.Insert;
end;

procedure TioActiveListBindSourceAdapter.Insert(AObject: IInterface);
begin
  raise EioGenericException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for class referenced instances only.');
end;

function TioActiveListBindSourceAdapter.HasBindSource: Boolean;
begin
  Result := Assigned(FBindSource);
end;

function TioActiveListBindSourceAdapter.HasMasterBSA: Boolean;
begin
  Result := Assigned(FMasterProperty);
end;

function TioActiveListBindSourceAdapter.IsDetailBSA: Boolean;
begin
  Result := HasMasterBSA;
end;

function TioActiveListBindSourceAdapter.IsInterfaceBSA: Boolean;
begin
  Result := False;
end;

function TioActiveListBindSourceAdapter.IsMasterBSA: Boolean;
begin
  Result := not HasMasterBSA;
end;

procedure TioActiveListBindSourceAdapter.LoadPage;
begin
  TioCommonBSAPersistence.LoadPage(Self);
end;

function TioActiveListBindSourceAdapter.MasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FMasterAdaptersContainer;
end;

function TioActiveListBindSourceAdapter.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
begin
  TioCommonBSABehavior.Notify(Sender, Self, ANotification);
  Result := ANotification.Response;
end;

procedure TioActiveListBindSourceAdapter.PersistAll;
begin
  TioCommonBSAPersistence.PersistAll(Self);
end;

procedure TioActiveListBindSourceAdapter.PersistCurrent;
begin
  TioCommonBSAPersistence.PersistCurrent(Self);
end;

function TioActiveListBindSourceAdapter.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioActiveListBindSourceAdapter.ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType);
var
  LDone: Boolean;
begin
  // Initialization
  LDone := False;

  // Clone the selected object if the OnReceiveSelectionCloneObject property
  //  of the BindSource is true
  if FBindSource.OnReceiveSelectionCloneObject then
    ASelected := TioUtilities.CloneObject(ASelected);

  // Do the selection
  DoBeforeSelection(ASelected, ASelectionType);
  DoSelection(ASelected, ASelectionType, LDone);
  if not LDone then
    case ASelectionType of
      stAppend:
        Append(ASelected);
      stInsert:
        Insert(ASelected);
    end;
  DoAfterSelection(ASelected, ASelectionType);

  // NB: OnReceiveSelectionFreeObject property of the BindSource is not
  //  useful in a list bind source adapter (only for single object BSA)
end;

procedure TioActiveListBindSourceAdapter.ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType);
begin
  // Questo ActiveBindSourceAdapter funziona solo con gli oggetti (no interfacce)
  // quindi chiama l'altra versione di metodo pi� adatta. IN questo modo
  // � possibile gestire la selezione anche se il selettore non � concorde
  ReceiveSelection(ASelected as TObject, ASelectionType);
end;

procedure TioActiveListBindSourceAdapter.SetLazy(const Value: Boolean);
begin
  FLazy := Value;
end;

procedure TioActiveListBindSourceAdapter.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
end;

procedure TioActiveListBindSourceAdapter.SetLoadType(const Value: TioLoadType);
begin
  FLoadType := Value;
end;

procedure TioActiveListBindSourceAdapter.SetBindSource(ANotifiableBindSource: IioBindSource);
begin
  FBindSource := ANotifiableBindSource;
end;

procedure TioActiveListBindSourceAdapter.SetBSPersistenceDeleting(const Value: Boolean);
begin
  FBSPersistenceDeleting := Value;
end;

procedure TioActiveListBindSourceAdapter.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  if Self.HasMasterBSA then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<TObject>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsObject);
end;

procedure TioActiveListBindSourceAdapter.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  if Self.HasMasterBSA then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<IInterface>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsObject);
end;

procedure TioActiveListBindSourceAdapter.InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  Self._InternalSetDataObject<IInterface>(ADataObject as TObject, AOwnsObject);
end;

procedure TioActiveListBindSourceAdapter.InternalSetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  Self._InternalSetDataObject<TObject>(ADataObject, AOwnsObject);
end;

procedure TioActiveListBindSourceAdapter.SetAsyncLoad(const Value: Boolean);
begin
  FAsyncLoad := Value;
end;

procedure TioActiveListBindSourceAdapter.SetAsyncPersist(const Value: Boolean);
begin
  FAsyncPersist := Value;
end;

procedure TioActiveListBindSourceAdapter.SetioAutoPost(const Value: Boolean);
begin
  Self.AutoPost := Value;
end;

procedure TioActiveListBindSourceAdapter.SetWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

procedure TioActiveListBindSourceAdapter.SetItemIndex(const Value: Integer);
begin
  inherited ItemIndex := Value;
end;

procedure TioActiveListBindSourceAdapter.SetItems(const AIndex: Integer; const Value: TObject);
begin
  Self.List.Items[AIndex] := Value;
end;

procedure TioActiveListBindSourceAdapter.SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
begin
  FMasterAdaptersContainer := AMasterAdaptersContainer;
end;

procedure TioActiveListBindSourceAdapter.SetMasterProperty(AMasterProperty: IioProperty);
begin
  FMasterProperty := AMasterProperty;
end;

procedure TioActiveListBindSourceAdapter.SetObjStatus(AObjStatus: TioObjStatus);
begin
  TioCommonBSABehavior.SetObjStatus(Self, AObjStatus);
end;

procedure TioActiveListBindSourceAdapter.SetReloading(const Value: Boolean);
begin
  FReloading := Value;
end;

procedure TioActiveListBindSourceAdapter.SetTypeAlias(const AValue: String);
begin
  FTypeAlias := AValue;
end;

procedure TioActiveListBindSourceAdapter.SetTypeName(const AValue: String);
begin
  FTypeName := AValue;
end;

function TioActiveListBindSourceAdapter.SupportsNestedFields: Boolean;
begin
  // Disable support for NestedFields because iORM implements its own way of managing them
  // in the unit "iORM.LiveBindings.CommonBSABehavior" with relative changes also in the ActivebindSourceAdapters
  Result := False;
end;

function TioActiveListBindSourceAdapter.UseObjStatus: Boolean;
begin
  Result := TioCommonBSABehavior.UseObjStatus(Self);
end;

function TioActiveListBindSourceAdapter._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

procedure TioActiveListBindSourceAdapter._InternalSetDataObject<T>(const ADataObject: TObject; const AOwnsObject: Boolean);
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
    SetList(TList<TObject>(ADataObject), AOwnsObject);
    // If the DataObject (List) is an interface referenced object then
    // set the FInterfacedList field to it to keep alive the list itself
    if TioUtilities.IsAnInterface<T> then
      Supports(ADataObject, IInterface, FInterfacedList);
    // Set details BSA
    FDetailAdaptersContainer.SetMasterObject(Current);
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
    // Fix the "Couldn't find Value" or "Couldn't find Owner" or similar using "CustomFormat" links property
    // NB: Questo "AddFields" che sembrerebbe non aver senso in questo punto in realt� risolve un errore che mi ha segnalato
    //      Carlo Marona; questo errore (vedi sopra) si verificava se si impostava nil come DataObject (SetDataObject(nil))
    //      ed era dovuto perch� nell'inherited viene richiamato "ClearFields" che evidentemente eliminava dal sistema di LookUp
    //      di LiveBindings non solo i links relativi al DataObject precedente ma anche appunto "Value" e "Owner" e chiss� quali
    //      altri. Con questa riga evidentemente si registrano di nuovo questi IScope nel sistema di LookUp stesso.
    AddFields;
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
  // Self.SetList(AObj as TList<IInterface>, False);  // NB: AOwns (2� parameters) = False ABSOLUTELY!!!!!!
  /// / -------------------------------------------------------------------------------------------------------
end;

function TioActiveListBindSourceAdapter._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

end.

