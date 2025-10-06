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
unit iORM.LiveBindings.ActiveInterfaceListBindSourceAdapter;

interface

uses
  Data.Bind.ObjectScope, System.Classes,
  System.Generics.Collections,
  iORM.CommonTypes, iORM.Context.Properties.Interfaces,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.InterfaceListBindSourceAdapter, iORM.Where.Interfaces,
  iORM.Utilities, System.Rtti;

const
  TYPE_OF_COLLECTION = TioTypeOfCollection.tcList;

type
  TioActiveInterfaceListBindSourceAdapter = class(TInterfaceListBindSourceAdapter, IioContainedBindSourceAdapter, IioActiveBindSourceAdapter)
  private
    FBindSource: IioBindSource;
    FBSPersistenceDeleting: Boolean;
    FDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    FDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FInsertObj_Enabled: Boolean;
    FInsertObj_NewObj: IInterface;
    FInterfacedList: IInterface; // Reference to the same instance contained by FList field, this reference is only to keep live the list instance
    FMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FOwnsDataObject: Boolean; // Replicate the FOwnsList or FOwnsObjects not accessible from ancoestor classes
    FReloading: Boolean;
  protected
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
    procedure DoAfterDelete; override;
    procedure DoAfterInsert; override;
    procedure DoAfterPost; override;
    procedure DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>); override;
    procedure DoAfterReceiveSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
    procedure DoAfterScroll; override;
    procedure DoBeforeDelete; override;
    procedure DoBeforeEdit; override;
    procedure DoBeforeInsert; override;
    procedure DoBeforeOpen; override;
    procedure DoCreateInstance(out AHandled: Boolean; out AInstance: IInterface); override;
    procedure DoReceiveSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
  public
    constructor Create(const ABindSource: IioBindSource; const ADataObject: TObject; const AOwnsDataObject: Boolean); reintroduce; virtual;
    destructor Destroy; override;
    procedure Append(AObject: TObject); reintroduce; overload;
    procedure Append(AObject: IInterface); reintroduce; overload;
    function AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function AsTBindSourceAdapter: TBindSourceAdapter;
    procedure ClearDataObject;
    procedure DeleteListViewItem(const AItemIndex: Integer; const ADelayMilliseconds: Integer = 100);
    procedure ExtractDetailObject(AMasterObj: TObject);
    procedure Insert(AObject: TObject); reintroduce; overload;
    procedure Insert(AObject: IInterface); reintroduce; overload;
    procedure LoadPage;
    function NewDetailBindSourceAdapter(const ABindSource: IioBindSource; const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function NewNaturalObjectBindSourceAdapter(const ABindSource: IioBindSource): IioActiveBindSourceAdapter;
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    procedure PersistAll;
    procedure PersistCurrent;
    procedure Refresh(const ANotify: Boolean = True); reintroduce; overload;
    procedure Reload; virtual;
    procedure ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType); overload;
    procedure ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType); overload;
    // ----- PROPERTIES ------
    // AutoPost
    procedure SetAutoPost(const Value: Boolean);
    function GetAutoPost: Boolean;
    property AutoPost: Boolean read GetAutoPost write SetAutoPost;
    // BindSource
    procedure SetBindSource(ABindSource: IioBindSource);
    function GetBindSource: IioBindSource;
    property BindSource: IioBindSource read GetBindSource write SetBindSource;
    // BSPersistenceDeleting
    procedure SetBSPersistenceDeleting(const Value: Boolean);
    function GetBSPersistenceDeleting: Boolean;
    property BSPersistenceDeleting: Boolean read GetBSPersistenceDeleting write SetBSPersistenceDeleting;
    // CurrentOID
    function GetCurrentOID: Integer;
    property CurrentOID: Integer read GetCurrentOID;
    // DataObject
    //   NB: Generic parameter must be <IInterface> (for interfaced list such as IioList<IInterface>) or
    //       <TObject> (for non interfaced list such as TList<IInterface>)
    function DataObject: TObject;
    procedure _InternalSetDataObject<T>(const ADataObject: TObject; const AOwnsDataObject: Boolean);
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
    // ItemIndex
    procedure SetItemIndex(const Value: Integer);
    function GetItemIndex: Integer;
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    // Items
    procedure SetItems(const AIndex: Integer; const Value: TObject);
    function GetItems(const AIndex: Integer): TObject;
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
    procedure SetReloading(const Value: Boolean);
    function GetReloading: Boolean;
    property Reloading: Boolean read GetReloading write SetReloading;
    // State
    function GetState: TBindSourceAdapterState;
    property State: TBindSourceAdapterState read GetState;
    // TypeOfCollection
    function GetTypeOfCollection: TioTypeOfCollection;
    property TypeOfCollection: TioTypeOfCollection read GetTypeOfCollection;
  end;

implementation

uses
  iORM, iORM.LiveBindings.Factory, System.SysUtils, iORM.LazyLoad.Interfaces, iORM.Exceptions,
  iORM.Context.Map.Interfaces, iORM.LiveBindings.CommonBSAPersistence,
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

constructor TioActiveInterfaceListBindSourceAdapter.Create(const ABindSource: IioBindSource; const ADataObject: TObject; const AOwnsDataObject: Boolean);
begin
  FBindSource := ABindSource; // must be before inherited Create

  inherited Create(nil, ADataObject, ABindSource.GetTypeAlias, ABindSource.GetTypeName, AOwnsDataObject);

  FBSPersistenceDeleting := False;
  FDataSetLinkContainer := TioLiveBindingsFactory.BSAToDataSetLinkContainer;
  FInterfacedList := nil;
  FOwnsDataObject := AOwnsDataObject;
  FReloading := False;
  // Set Master & Details adapters reference
  FMasterAdaptersContainer := nil;
  FDetailAdaptersContainer := TioLiveBindingsFactory.DetailAdaptersContainer(Self);
  // Init InsertObj subsystem values
  FInsertObj_Enabled := False;
  FInsertObj_NewObj := nil;
  // AutoPost
  AutoPost := ABindSource.AutoPost;
end;

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
  raise EioGenericException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for interface referenced instances only.');
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

procedure TioActiveInterfaceListBindSourceAdapter.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  TioCommonBSABehavior.DeleteListViewItem(Self, AItemIndex, ADelayMilliseconds);
end;

destructor TioActiveInterfaceListBindSourceAdapter.Destroy;
begin
  // Detach itself from MasterAdapterContainer (if it's contained)
  if Assigned(FMasterAdaptersContainer) then
    FMasterAdaptersContainer.RemoveDetailBindSourceAdapter(Self);
  // Free the DetailAdaptersContainer
  if Assigned(FDetailAdaptersContainer) then
    FDetailAdaptersContainer.Free;
  inherited;
end;

function TioActiveInterfaceListBindSourceAdapter.GetDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
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

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterReceiveSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoAfterReceiveSelection(ASelected, ASelectionType);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeDelete;
begin
  inherited;
  TioCommonBSAPersistence.BeforeDelete(Self);

  // Prima di aggiungere questa riga succedeva che, nell'esempio degli ordini delle pizze,
  //  se eliminavo una riga dell'ordine con una TDataSetDelete action (quella standard di Delphi)
  //  poi quando si faceva il Persist dell'oggetto master l'ETM non veniva aggiornato (non si creava il nuovo TimeSlot),
  //  questo a sua volta impediva il corretto funzionamento della sincronizzazione
  DoBeforeEdit;
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
  case FBindSource.LoadType of
    ltCreate:
      TioCommonBSAPersistence.CreateDataObject(Self);
    ltAuto:
      TioCommonBSAPersistence.Load(Self);
  end;
end;

procedure TioActiveInterfaceListBindSourceAdapter.Refresh(const ANotify: Boolean = True);
begin
  TioCommonBSAPersistence.Refresh(Self, ANotify);
end;

procedure TioActiveInterfaceListBindSourceAdapter.Reload;
begin
  if FBindSource.LoadType = ltCreate then
    TioCommonBSAPersistence.CreateDataObject(Self)
  else
    TioCommonBSAPersistence.Reload(Self);
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

procedure TioActiveInterfaceListBindSourceAdapter.DoReceiveSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FBindSource) then
    FBindSource.DoReceiveSelection(ASelected, ASelectionType, ADone);
end;

procedure TioActiveInterfaceListBindSourceAdapter.ExtractDetailObject(AMasterObj: TObject);
var
  LDetailObj: TObject;
  LDetailIntf: IInterface;
  LLazyLoadableObj: IioLazyLoadable;
  LMasterProperty: IioProperty;
  LValue: TValue;
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
  LMasterProperty := TioMapContainer.GetMap(AMasterObj.ClassName).GetProperties.GetPropertyByName(FBindSource.MasterPropertyName);
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

function TioActiveInterfaceListBindSourceAdapter.GetIsAutoLoad: Boolean;
begin
  Result := FBindSource.LoadType = ltAuto;
end;

function TioActiveInterfaceListBindSourceAdapter.GetBindSource: IioBindSource;
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

function TioActiveInterfaceListBindSourceAdapter.GetFields: TList<TBindSourceAdapterField>;
begin
  Result := Self.Fields;
end;

function TioActiveInterfaceListBindSourceAdapter.NewDetailBindSourceAdapter(const ABindSource: IioBindSource; const AMasterPropertyName: String): IioActiveBindSourceAdapter;
begin
  // Return the requested DetailBindSourceAdapter and set the current master object
  Result := FDetailAdaptersContainer.NewDetailBindSourceAdapter(ABindSource, GetObjectType.Name, AMasterPropertyName);
  FDetailAdaptersContainer.SetMasterObject(Self.Current);
end;

function TioActiveInterfaceListBindSourceAdapter.GetAutoPost: Boolean;
begin
  Result := inherited AutoPost;
end;

function TioActiveInterfaceListBindSourceAdapter.GetTypeOfCollection: TioTypeOfCollection;
begin
  Result := TYPE_OF_COLLECTION;
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

function TioActiveInterfaceListBindSourceAdapter.GetMasterPropertyPath: String;
begin
  if HasMasterBSA then
    Result := GetMasterBindSourceAdapter.GetMasterPropertyPath + '.' + FBindSource.MasterPropertyName
  else
    Result := '';
end;

function TioActiveInterfaceListBindSourceAdapter.GetObjStatus: TioObjStatus;
begin
  Result := TioCommonBSABehavior.GetObjStatus(Self);
end;

function TioActiveInterfaceListBindSourceAdapter.GetReloading: Boolean;
begin
  Result := FReloading;
end;

function TioActiveInterfaceListBindSourceAdapter.GetState: TBindSourceAdapterState;
begin
  Result := inherited State;
end;

function TioActiveInterfaceListBindSourceAdapter.NewNaturalObjectBindSourceAdapter(const ABindSource: IioBindSource): IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.NewNaturalBindSourceAdapter(ABindSource, Self);
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

procedure TioActiveInterfaceListBindSourceAdapter.Insert(AObject: TObject);
begin
  raise EioGenericException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for interface referenced instances only.');
end;

function TioActiveInterfaceListBindSourceAdapter.GetHasBindSource: Boolean;
begin
  Result := Assigned(FBindSource);
end;

function TioActiveInterfaceListBindSourceAdapter.GetHasMasterBSA: Boolean;
begin
  Result := not FBindSource.MasterPropertyName.IsEmpty;
end;

function TioActiveInterfaceListBindSourceAdapter.GetIsDetailBSA: Boolean;
begin
  Result := HasMasterBSA;
end;

function TioActiveInterfaceListBindSourceAdapter.GetIsInterfaceBSA: Boolean;
begin
  Result := True;
end;

function TioActiveInterfaceListBindSourceAdapter.GetIsMasterBSA: Boolean;
begin
  Result := not HasMasterBSA;
end;

procedure TioActiveInterfaceListBindSourceAdapter.LoadPage;
begin
  TioCommonBSAPersistence.LoadPage(Self);
end;

function TioActiveInterfaceListBindSourceAdapter.GetMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
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
    raise EioGenericException.Create(Self.ClassName, 'ReceiveSelection', 'Selected instance does not support any interface.');
end;

procedure TioActiveInterfaceListBindSourceAdapter.ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType);
var
  LDone: Boolean;
begin
  // Forza l'aggiornamento del SUD (Smart Update Detection) in modo che poi, se richiesto,
  //  l'oggetto Master vegga persistito. Prima di aggiungere questa riga succedeva che,
  //  nell'esempio degli ordini delle pizze, se aggiungevo una nuova pizza in una nuova
  //  riga con una nuova pizza poi l'oggetto non si persisteva perchè nel SUD l'oggetto
  //  master non figurava come modificato e quindi non veniva persistito. La stessa cosa
  //  succedeva anche in caso di modifica manuale di una riga.
  //  NB: Prima era alla fine di questo metodo ma poi l'ho spostato all'inizio perchè
  //       altrimenti la selezione avveniva anche se l'utente non aveva l'autorizzazione
  //       l'oggetto ricevente (Target), nel senso che otteneva l'autorizzazione alla selezione
  //       ma non alla modifica dell'oggetto target che cmq viene modificato. Spostandolo
  //       all'inizio l'operazione non si esegue se non ottiene entrambe le autorizzazioni
  DoBeforeEdit;

  // Initialization
  LDone := False;

  // NB: OnReceiveSelectionCloneObject property of the BindSource is not
  // useful in an interface bindsource adapter

  // Do the selection
//  DoBeforeReceiveSelection(ASelected, ASelectionType); Spostato in TioCommonBSBehavior.Select<T>
  DoReceiveSelection(ASelected, ASelectionType, LDone);
  if not LDone then
    case ASelectionType of
      TioSelectionType.stAppend:
        Self.Append(ASelected);
      TioSelectionType.stInsert:
        Self.Insert(ASelected);
    end;
  DoAfterReceiveSelection(ASelected, ASelectionType);

  // NB: OnReceiveSelectionFreeObject property of the BindSource is not
  // useful in an interface bindsource adapter

  // Otherwise UI controls binded with S.O.LO (Smart-Object-LOokup system) would still show the old values
  Refresh;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetBindSource(ABindSource: IioBindSource);
begin
  FBindSource := ABindSource;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetBSPersistenceDeleting(const Value: Boolean);
begin
  FBSPersistenceDeleting := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetDataObject(const ADataObject: TObject; const AOwnsDataObject: Boolean);
begin
  if Self.HasMasterBSA then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<TObject>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsDataObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetDataObject(const ADataObject: IInterface; const AOwnsDataObject: Boolean);
begin
  if Self.HasMasterBSA then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<IInterface>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsDataObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter.InternalSetDataObject(const ADataObject: IInterface; const AOwnsDataObject: Boolean);
begin
  Self._InternalSetDataObject<IInterface>(ADataObject as TObject, AOwnsDataObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter._InternalSetDataObject<T>(const ADataObject: TObject; const AOwnsDataObject: Boolean);
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
    SetList(TList<IInterface>(ADataObject), AOwnsDataObject);
    FOwnsDataObject := AOwnsDataObject;
    // If the DataObject (List) is an interface referenced object then
    // set the FInterfacedList field to it to keep alive the list itself
    if TioUtilities.IsAnInterface<T> then
      Supports(ADataObject, IInterface, FInterfacedList);
    // Set details BSA
    FDetailAdaptersContainer.SetMasterObject(Current);
    // Prior to reactivate the adapter force the "AutoLoadData" property to False to prevent double values
    // then restore the original value of the "AutoLoadData" property.
    LPrecLoadType := FBindSource.LoadType;
    try
      FBindSource.LoadType := ltManual;
      Active := True;
    finally
      FBindSource.LoadType := LPrecLoadType;
    end;
  end
  else
  begin
    SetList(nil, AOwnsDataObject);
    FOwnsDataObject := AOwnsDataObject;
    // Fix the "Couldn't find Value" or "Couldn't find Owner" or similar using "CustomFormat" links property
    // NB: Questo "AddFields" che sembrerebbe non aver senso in questo punto in realtà risolve un errore che mi ha segnalato
    // Carlo Marona; questo errore (vedi sopra) si verificava se si impostava nil come DataObject (SetDataObject(nil))
    // ed era dovuto perchè nell'inherited viene richiamato "ClearFields" che evidentemente eliminava dal sistema di LookUp
    // di LiveBindings non solo i links relativi al DataObject precedente ma anche appunto "Value" e "Owner" e chissà quali
    // altri. Con questa riga evidentemente si registrano di nuovo questi IScope nel sistema di LookUp stesso.
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
  // Self.SetList(AObj as TList<IInterface>, False);  // NB: AOwns (2° parameters) = False ABSOLUTELY!!!!!!
  /// / -------------------------------------------------------------------------------------------------------
end;

procedure TioActiveInterfaceListBindSourceAdapter.InternalSetDataObject(const ADataObject: TObject; const AOwnsDataObject: Boolean);
begin
  Self._InternalSetDataObject<TObject>(ADataObject, AOwnsDataObject);
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetAutoPost(const Value: Boolean);
begin
  inherited AutoPost := Value;
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
    raise EioGenericException.Create(Self.ClassName, 'SetItems', 'Value object does not implement any interface.');
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
begin
  FMasterAdaptersContainer := AMasterAdaptersContainer;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetObjStatus(AObjStatus: TioObjStatus);
begin
  TioCommonBSABehavior.SetObjStatus(Self, AObjStatus);
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetReloading(const Value: Boolean);
begin
  FReloading := Value;
end;

function TioActiveInterfaceListBindSourceAdapter.GetObjStatusInUse: Boolean;
begin
  Result := TioCommonBSABehavior.GetObjStatusInUse(Self);
end;

function TioActiveInterfaceListBindSourceAdapter.GetOwnsDataObject: Boolean;
begin
  Result := FOwnsDataObject;
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
