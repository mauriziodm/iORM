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

unit iORM.LiveBindings.ActiveInterfaceObjectBindSourceAdapter;

interface

uses
  iORM.LiveBindings.InterfaceObjectBindSourceAdapter,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.CommonTypes, System.Classes, iORM.Context.Properties.Interfaces,
  Data.Bind.ObjectScope, iORM.Where.Interfaces, iORM.MVVM.Interfaces,
  System.Generics.Collections, System.Rtti;

const
  VIEW_DATA_TYPE = TioViewDataType.dtSingleObject;

type

  TioActiveInterfaceObjectBindSourceAdapter = class(TInterfaceObjectBindSourceAdapter, IioContainedBindSourceAdapter, IioActiveBindSourceAdapter,
    IioNaturalBindSourceAdapterSource)
  private
    FAsync: Boolean;
    FWhere: IioWhere;
    FWhereDetailsFromDetailAdapters: Boolean;
    // FTypeName, FTypeAlias: String;
    FLocalOwnsObject: Boolean;
    FLazy: Boolean;
    FLazyProps: String;
    FLoadType: TioLoadType;
    FReloading: Boolean;
    FMasterPropertyName: String;
    FMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FBindSource: IioNotifiableBindSource;
    // FNaturalBSA_MasterBindSourceAdapter: IioActiveBindSourceAdapter;
    FDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    FBSPersistenceDeleting: Boolean;
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
    function GetIoViewDataType: TioViewDataType;
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

    function GetCanActivate: Boolean; override;
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
    procedure DoAfterPost; override;
    procedure DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>); override;
    procedure DoAfterDelete; override;
    procedure DoAfterScroll; override;
    procedure DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
    procedure DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
    procedure SetObjStatus(AObjStatus: TioObjStatus);
    function UseObjStatus: Boolean;
    // Generic parameter must be <IInterface> (for interfaced list such as IioList<IInterface>) or
    // <TObject> (for non interfaced list such as TList<IInterface>)
    procedure InternalSetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean = True); overload;
    procedure InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean = False); overload;
  public
    constructor Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent; const ADataObject: IInterface); overload;
    destructor Destroy; override;
    function MasterAdaptersContainer:IioDetailBindSourceAdaptersContainer;
    procedure SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
    procedure SetMasterProperty(AMasterProperty: IioProperty);
    procedure SetBindSource(ANotifiableBindSource: IioNotifiableBindSource);
    function GetBindSource: IioNotifiableBindSource;
    function HasBindSource: boolean;
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
    procedure Reload;
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
  iORM, System.SysUtils, iORM.LiveBindings.Factory, iORM.Context.Map.Interfaces, iORM.Where.Factory,
  iORM.Exceptions, iORM.LiveBindings.CommonBSAPersistence,
  iORM.LiveBindings.CommonBSABehavior, iORM.Utilities, iORM.Context.Container,
  iORM.Context.Factory;

{ TioActiveInterfaceObjectBindSourceAdapter }

{$IFDEF AUTOREFCOUNT}

function TioActiveInterfaceObjectBindSourceAdapter.__ObjAddRef: Integer;
begin
  // Nothing (event the "inherited")
end;

function TioActiveInterfaceObjectBindSourceAdapter.__ObjRelease: Integer;
begin
  // Nothing (event the "inherited")
end;
{$ENDIF}

procedure TioActiveInterfaceObjectBindSourceAdapter.Append(AObject: TObject);
begin
  Assert(False);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.Append(AObject: IInterface);
begin
  Assert(False);
end;

function TioActiveInterfaceObjectBindSourceAdapter.AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := Self as IioActiveBindSourceAdapter;
end;

function TioActiveInterfaceObjectBindSourceAdapter.AsTBindSourceAdapter: TBindSourceAdapter;
begin
  Result := Self as TBindSourceAdapter;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.ClearDataObject;
var
  LIntf: IInterface;
begin
  LIntf := nil;
  Self.InternalSetDataObject(LIntf, False);
end;

constructor TioActiveInterfaceObjectBindSourceAdapter.Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent; const ADataObject: IInterface);
begin
  FLoadType := ltAuto;
  FLazy := False;
  FLazyProps := '';
  FAsync := False;
  FReloading := False;
  FBSPersistenceDeleting := False;
  inherited Create(AOwner, ADataObject, ATypeAlias, ATypeName);
  FLocalOwnsObject := False; // Always false because it's a BSA for an interface (AutoRefCount)
  FWhere := AWhere;
  FWhereDetailsFromDetailAdapters := False;
  FDataSetLinkContainer := TioLiveBindingsFactory.BSAToDataSetLinkContainer;
  // Set Master & Details adapters reference
  FMasterAdaptersContainer := nil;
  FDetailAdaptersContainer := TioLiveBindingsFactory.DetailAdaptersContainer(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  raise EioException.Create(Self.ClassName, 'DeleteListViewItem', 'Method not available in ObjectBindSourceAdapters.');
end;

destructor TioActiveInterfaceObjectBindSourceAdapter.Destroy;
begin
  // Detach itself from MasterAdapterContainer (if it's contained)
  if Assigned(FMasterAdaptersContainer) then
    FMasterAdaptersContainer.RemoveBindSourceAdapter(Self);
  // Free the DetailAdaptersContainer
  FDetailAdaptersContainer.Free;
  inherited;
end;

function TioActiveInterfaceObjectBindSourceAdapter.DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FDetailAdaptersContainer;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoAfterPost;
begin
  inherited;
  TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>);
begin
  inherited;
  TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoAfterScroll;
begin
  inherited;
  TioCommonBSAPersistence.AfterScroll(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoAfterSelection(ASelected, ASelectionType);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoBeforeDelete;
begin
  inherited;
  TioCommonBSAPersistence.BeforeDelete(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoAfterDelete;
begin
  inherited;
  DoAfterScroll; // Mauri 11/01/2022: Aggiunto perchè altrimenti iin alcuni casi particolari dava errori
  TioCommonBSAPersistence.AfterDelete(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoBeforeEdit;
begin
  inherited;
  TioCommonBSAPersistence.BeforeEdit(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoBeforeOpen;
begin
  inherited;
  TioCommonBSAPersistence.Load(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.Refresh(const ANotify: Boolean = True);
begin
  TioCommonBSAPersistence.Refresh(Self, ANotify);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.Reload;
begin
  TioCommonBSAPersistence.Reload(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoBeforeSelection(ASelected, ASelectionType);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FBindSource) then
    FBindSource.DoSelection(ASelected, ASelectionType, ADone);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.ExtractDetailObject(AMasterObj: TObject);
var
  LDetailIntf: IInterface;
  LValue: TValue;
  LMasterProperty: IioProperty;
begin
  LDetailIntf := nil;
  // Check parameter, if the MasterObject is not assigned
  // then close the BSA
  if not Assigned(AMasterObj) then
  begin
    Self.InternalSetDataObject(LDetailIntf, False); // 2° parameter false ABSOLUTELY!!!!!!!
    Exit;
  end;
  // Extract master property value
  LMasterProperty := TioMapContainer.GetMap(AMasterObj.ClassName).GetProperties.GetPropertyByName(FMasterPropertyName);
  LValue := LMasterProperty.GetValue(AMasterObj);
  // Retrieve the object from the TValue
  if not LValue.IsEmpty then
    if LMasterProperty.IsInterface then
      LDetailIntf := LValue.AsInterface
    else
      raise EioException.Create(Self.ClassName, 'ExtractDetailObject', 'Master property (in the master object) is not of interface type.');
  // Set it to the Adapter itself
  Self.InternalSetDataObject(LDetailIntf, False); // 2° parameter false ABSOLUTELY!!!!!!!
end;
// procedure TioActiveInterfaceObjectBindSourceAdapter.ExtractDetailObject(AMasterObj: TObject);
// var
// LDetailObj: TObject;
// LValue: TValue;
// LMasterProperty: IioContextProperty;
// begin
// LDetailObj := nil;
// // Check parameter, if the MasterObject is not assigned
// //  then close the BSA
// if not Assigned(AMasterObj) then
// begin
// Self.SetDataObject(nil, False);  // 2° parameter false ABSOLUTELY!!!!!!!
// Exit;
// end;
// // Extract master property value
// LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName(AMasterObj.ClassType, FMasterPropertyName);
// LValue := LMasterProperty.GetValue(AMasterObj);
// // Retrieve the object from the TValue
// if not LValue.IsEmpty then
// if LMasterProperty.IsInterface then
// LDetailObj := TObject(LValue.AsInterface)
// else
// LDetailObj := LValue.AsObject;
// // Set it to the Adapter itself
// Self.SetDataObject(LDetailObj, False);  // 2° parameter false ABSOLUTELY!!!!!!!
// end;

function TioActiveInterfaceObjectBindSourceAdapter.GetLazy: Boolean;
begin
  Result := FLazy;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetLazyProps: String;
begin
  Result := FLazyProps;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetLoadType: TioLoadType;
begin
  Result := FLoadType;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetAutoLoad: Boolean;
begin
  Result := FLoadType = ltAuto;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetBindSource: IioNotifiableBindSource;
begin
  Result := FBindSource;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetBSPersistenceDeleting: Boolean;
begin
  Result := FBSPersistenceDeleting;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetCanActivate: Boolean;
begin
  // Riportato allo stato originale della classe capostipite perchè
  // altrimenti e non veniva espressamente impostato il DataObject
  // con un SetDataObject e quindi l'oggetto si sarebbe dovuto caricare
  // dal DB (ORM) in realtà l'adapter non si attivava mai perchè
  // questa funzione avrebbe ritornato sempre False visto che il DataObject
  // era = a nil. IN questo modo invece funziona.
  Result := True;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetCurrentOID: Integer;
begin
  Result := TioMapContainer.GetMap(Current.ClassName).GetProperties.GetIdProperty.GetValue(Self.Current).AsInteger;
end;

function TioActiveInterfaceObjectBindSourceAdapter.DataObject: TObject;
begin
  Result := TInterfaceObjectBindSourceAdapter(Self).DataObject as TObject;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := FDataSetLinkContainer;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String)
  : IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.GetBindSourceAdapterByMasterPropertyName(AMasterPropertyName);
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetFields: TList<TBindSourceAdapterField>;
begin
  Result := Self.Fields;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetIoAsync: Boolean;
begin
  Result := FAsync;
end;

function TioActiveInterfaceObjectBindSourceAdapter.NewDetailBindSourceAdapter(const AOwner: TComponent; const AMasterPropertyName: String;
  const AWhere: IioWhere): IioActiveBindSourceAdapter;
begin
  // Return the requested DetailBindSourceAdapter and set the current master object
  Result := FDetailAdaptersContainer.NewBindSourceAdapter(AOwner, GetBaseObjectRttiType.Name, AMasterPropertyName, AWhere);
  FDetailAdaptersContainer.SetMasterObject(Self.Current);
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetioAutoPost: Boolean;
begin
  Result := Self.AutoPost;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetIoViewDataType: TioViewDataType;
begin
  Result := VIEW_DATA_TYPE;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetioWhere: IioWhere;
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

function TioActiveInterfaceObjectBindSourceAdapter.GetioWhereDetailsFromDetailAdapters: Boolean;
begin
  Result := FWhereDetailsFromDetailAdapters;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetItemIndex: Integer;
begin
  Result := inherited ItemIndex;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetItems(const AIndex: Integer): TObject;
begin
  Result := DataObject;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if Self.HasMasterBSA then
    Result := FMasterAdaptersContainer.GetMasterBindSourceAdapter;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetMasterPropertyPath: String;
begin
  if HasMasterBSA then
    Result := GetMasterBindSourceAdapter.GetMasterPropertyPath + '.' + GetMasterPropertyName
  else
    Result := '';
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetOwnsObjects: Boolean;
begin
  Result := FLocalOwnsObject;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetReloading: Boolean;
begin
  Result := FReloading;
end;

function TioActiveInterfaceObjectBindSourceAdapter.GetState: TBindSourceAdapterState;
begin
  Result := Self.State;
end;

function TioActiveInterfaceObjectBindSourceAdapter.NewNaturalObjectBindSourceAdapter(const AOwner: TComponent): IioActiveBindSourceAdapter;
begin
  Result := TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(AOwner, Self);
end;

function TioActiveInterfaceObjectBindSourceAdapter.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
begin
  TioCommonBSABehavior.Notify(Sender, Self, ANotification);
  Result := ANotification.Response;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.Insert(AObject: TObject);
begin
  Assert(False);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.Insert(AObject: IInterface);
begin
  Assert(False);
end;

function TioActiveInterfaceObjectBindSourceAdapter.HasBindSource: boolean;
begin
  Result := Assigned(FBindSource);
end;

function TioActiveInterfaceObjectBindSourceAdapter.HasMasterBSA: Boolean;
begin
  Result := not FMasterPropertyName.IsEmpty;
end;

function TioActiveInterfaceObjectBindSourceAdapter.IsDetailBSA: Boolean;
begin
  Result := HasMasterBSA;
end;

function TioActiveInterfaceObjectBindSourceAdapter.IsInterfaceBSA: Boolean;
begin
  Result := True;
end;

function TioActiveInterfaceObjectBindSourceAdapter.IsMasterBSA: Boolean;
begin
  Result := not HasMasterBSA;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.LoadPage;
begin
  raise EioException.Create(Self.ClassName, 'LoadPage', 'Method not available in ObjectBindSourceAdapters.');
end;

function TioActiveInterfaceObjectBindSourceAdapter.MasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FMasterAdaptersContainer;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.PersistAll;
begin
  TioCommonBSAPersistence.PersistAll(Self);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.PersistCurrent;
begin
  TioCommonBSAPersistence.PersistCurrent(Self);
end;

function TioActiveInterfaceObjectBindSourceAdapter.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType);
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

procedure TioActiveInterfaceObjectBindSourceAdapter.ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType);
var
  LDone: Boolean;
begin
  LDone := False;
  DoBeforeSelection(ASelected, ASelectionType);
  DoSelection(ASelected, ASelectionType, LDone);
  if not LDone then
    SetDataObject(ASelected);
  DoAfterSelection(ASelected, ASelectionType);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetLazy(const Value: Boolean);
begin
  FLazy := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetLazyProps(const Value: String);
begin
  FLazyProps := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetLoadType(const Value: TioLoadType);
begin
  FLoadType := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetBindSource(ANotifiableBindSource: IioNotifiableBindSource);
begin
  FBindSource := ANotifiableBindSource;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetBSPersistenceDeleting(const Value: Boolean);
begin
  FBSPersistenceDeleting := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  raise EioException.Create(Self.ClassName, 'SetDataObject', 'This ActiveBindSourceAdapter is for interface referenced instances only.');
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  if Self.HasMasterBSA then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<IInterface>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsObject);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
var
  LPrecLoadType: TioLoadType;
begin
  // Disable the adapter
  First; // Bug
  Active := False;
  // AObj is assigned then set it as DataObject
  // else set DataObject to nil and set MasterObject to nil
  // to disable all Details adapters also
  if Assigned(ADataObject) then
  begin
    // Set the provided DataObject
    inherited SetDataObject(ADataObject, AOwnsObject);
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
    inherited SetDataObject(nil, AOwnsObject);
    FDetailAdaptersContainer.SetMasterObject(nil);
  end;
  // DataSet synchro
  GetDataSetLinkContainer.Refresh;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.InternalSetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  raise EioException.Create(Self.ClassName, 'InternalSetDataObject', 'This ActiveBindSourceAdapter is for interface referenced instances only.');
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetIoAsync(const Value: Boolean);
begin
  FAsync := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetioAutoPost(const Value: Boolean);
begin
  Self.AutoPost := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetIoWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetioWhereDetailsFromDetailAdapters(const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetItemIndex(const Value: Integer);
begin
  inherited ItemIndex := Value;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetItems(const AIndex: Integer; const Value: TObject);
begin
  InternalSetDataObject(Value);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
begin
  FMasterAdaptersContainer := AMasterAdaptersContainer;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetMasterProperty(AMasterProperty: IioProperty);
begin
  FMasterPropertyName := AMasterProperty.GetName;
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetObjStatus(AObjStatus: TioObjStatus);
begin
  TioCommonBSABehavior.SetObjStatus(Self, AObjStatus);
end;

procedure TioActiveInterfaceObjectBindSourceAdapter.SetReloading(const Value: Boolean);
begin
  FReloading := Value;
end;

function TioActiveInterfaceObjectBindSourceAdapter.UseObjStatus: Boolean;
begin
  Result := TioCommonBSABehavior.UseObjStatus(Self);
end;

function TioActiveInterfaceObjectBindSourceAdapter._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

function TioActiveInterfaceObjectBindSourceAdapter._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

end.
