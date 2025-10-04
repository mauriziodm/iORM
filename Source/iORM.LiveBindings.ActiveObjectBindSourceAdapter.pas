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
unit iORM.LiveBindings.ActiveObjectBindSourceAdapter;

interface

uses
  Data.Bind.ObjectScope, iORM.CommonTypes, System.Classes, System.Generics.Collections,
  iORM.Context.Properties.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.LiveBindings.Notification, iORM.Where.Interfaces,
  System.Rtti;

const
  TYPE_OF_COLLECTION = TioTypeOfCollection.tcSingleObject;

type

  TioActiveObjectBindSourceAdapter = class(TObjectBindSourceAdapter, IioContainedBindSourceAdapter, IioActiveBindSourceAdapter)
  private
    FBindSource: IioBindSource;
    FBSPersistenceDeleting: Boolean;
    FDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    FDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
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
    procedure AddFields; override;
    procedure DoAfterDelete; override;
    procedure DoAfterPost; override;
    procedure DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>); override;
    procedure DoAfterReceiveSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
    procedure DoAfterScroll; override;
    procedure DoBeforeEdit; override;
    procedure DoBeforeDelete; override;
    procedure DoBeforeOpen; override;
    procedure DoReceiveSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    function SupportsNestedFields: Boolean; override;
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
    procedure ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType); overload;
    procedure ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType); overload;
    procedure Refresh(const ANotify: Boolean = True); reintroduce; overload;
    procedure Reload; virtual;
    // ----- PROPERTIES ------
    // AutoPost property
    //  NB: lascio il nome a ioAutoPost perchè c'è già un AutoPost negli antenati
    procedure SetioAutoPost(const Value: Boolean);
    function GetioAutoPost: Boolean;
    property ioAutoPost: Boolean read GetioAutoPost write SetioAutoPost;
    // BindSource
    procedure SetBindSource(ABindSource: IioBindSource);
    function GetBindSource: IioBindSource;
    property BindSource: IioBindSource read GetBindSource write SetBindSource;
    // BSPersistenceDeleting
    function GetBSPersistenceDeleting: Boolean;
    procedure SetBSPersistenceDeleting(const Value: Boolean);
    property BSPersistenceDeleting: Boolean read GetBSPersistenceDeleting write SetBSPersistenceDeleting;
    // CanActivate
    //  NB: Property on ancestor class
    function GetCanActivate: Boolean; override;
    // CurrentOID
    function GetCurrentOID: Integer;
    property CurrentOID: Integer read GetCurrentOID;
    // DataObject
    //   NB: Generic parameter must be <IInterface> (for interfaced list such as IioList<IInterface>) or
    //       <TObject> (for non interfaced list such as TList<IInterface>)
    function DataObject: TObject;
    procedure InternalSetDataObject(const ADataObject: TObject; const AOwnsDataObject: Boolean = True); overload;
    procedure InternalSetDataObject(const ADataObject: IInterface; const AOwnsDataObject: Boolean = False); overload;
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
    function GetHasBindSource: boolean;
    property HasBindSource: Boolean read GetHasBindSource;
    // HasMasterBSA
    function GetHasMasterBSA: Boolean;
    property HasMasterBSA: Boolean read GetHasMasterBSA;
    // IsAutoLoad
    function GetIsAutoLoad: Boolean; virtual;
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
    function GetItemIndex: Integer;
    procedure SetItemIndex(const Value: Integer);
    property ItemIndex: Integer read GetItemIndex write SetItemIndex;
    // Items
    function GetItems(const AIndex: Integer): TObject;
    procedure SetItems(const AIndex: Integer; const Value: TObject);
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
    function GetReloading: Boolean;
    procedure SetReloading(const Value: Boolean);
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
  iORM, System.SysUtils,
  iORM.LiveBindings.Factory, iORM.Context.Map.Interfaces,
  iORM.Exceptions, iORM.LiveBindings.CommonBSAPersistence,
  iORM.LiveBindings.CommonBSABehavior, iORM.Context.Container,
  iORM.Utilities;

{ TioActiveListBindSourceAdapter<T> }

{$IFDEF AUTOREFCOUNT}

function TioActiveObjectBindSourceAdapter.__ObjAddRef: Integer;
begin
  // Nothing (event the "inherited")
end;

function TioActiveObjectBindSourceAdapter.__ObjRelease: Integer;
begin
  // Nothing (event the "inherited")
end;
{$ENDIF}

procedure TioActiveObjectBindSourceAdapter.Append(AObject: TObject);
begin
  Assert(False);
end;

procedure TioActiveObjectBindSourceAdapter.AddFields;
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

procedure TioActiveObjectBindSourceAdapter.Append(AObject: IInterface);
begin
  raise EioGenericException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for class referenced instances only.');
end;

function TioActiveObjectBindSourceAdapter.AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := Self as IioActiveBindSourceAdapter;
end;

function TioActiveObjectBindSourceAdapter.AsTBindSourceAdapter: TBindSourceAdapter;
begin
  Result := Self as TBindSourceAdapter;
end;

procedure TioActiveObjectBindSourceAdapter.ClearDataObject;
begin
  InternalSetDataObject(nil, False);
end;

constructor TioActiveObjectBindSourceAdapter.Create(const ABindSource: IioBindSource; const ADataObject: TObject; const AOwnsDataObject: Boolean);
var
  FClassRef: TioClassRef;
begin
  FReloading := False;
  FBSPersistenceDeleting := False;

  // If the AObject is assigned the set the BaseRttiType from this instance (most accurate) else resolve the TypeName
  // AObject is always a TObject by generic constraint
  if Assigned(ADataObject) then
    FClassRef := ADataObject.ClassType
  else
    FClassRef := TioUtilities.ClassNameToClassRef(ABindSource.TypeName);

  inherited Create(nil, ADataObject, FClassRef, AOwnsDataObject);
  FOwnsDataObject := AOwnsDataObject;

  FBindSource := ABindSource;
  FDataSetLinkContainer := TioLiveBindingsFactory.BSAToDataSetLinkContainer;
  // Set Master & Details adapters reference
  FMasterAdaptersContainer := nil;
  FDetailAdaptersContainer := TioLiveBindingsFactory.DetailAdaptersContainer(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DeleteListViewItem(const AItemIndex, ADelayMilliseconds: Integer);
begin
  raise EioGenericException.Create(Self.ClassName, 'DeleteListViewItem', 'Method not available in ObjectBindSourceAdapters.');
end;

destructor TioActiveObjectBindSourceAdapter.Destroy;
begin
  // Detach itself from MasterAdapterContainer (if it's contained)
  if Assigned(FMasterAdaptersContainer) then
    FMasterAdaptersContainer.RemoveDetailBindSourceAdapter(Self);
  // Free the DetailAdaptersContainer
  if Assigned(FDetailAdaptersContainer) then
    FDetailAdaptersContainer.Free;
  inherited;
end;

function TioActiveObjectBindSourceAdapter.GetDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FDetailAdaptersContainer;
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterPost;
begin
  inherited;
  TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>);
begin
  inherited;
  TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterScroll;
begin
  inherited;
  TioCommonBSAPersistence.AfterScroll(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterReceiveSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoAfterReceiveSelection(ASelected, ASelectionType);
end;

procedure TioActiveObjectBindSourceAdapter.DoBeforeDelete;
begin
  inherited;
  TioCommonBSAPersistence.BeforeDelete(Self);

  // Prima di aggiungere questa riga succedeva che, nell'esempio degli ordini delle pizze,
  // se eliminavo una riga dell'ordine con una TDataSetDelete action (quella standard di Delphi)
  // poi quando si faceva il Persist dell'oggetto master l'ETM non veniva aggiornato (non si creava il nuovo TimeSlot),
  // questo a sua volta impediva il corretto funzionamento della sincronizzazione
  DoBeforeEdit;
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterDelete;
begin
  inherited;
  DoAfterScroll; // Mauri 11/01/2022: Aggiunto perchè altrimenti iin alcuni casi particolari dava errori
  TioCommonBSAPersistence.AfterDelete(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DoBeforeEdit;
begin
  inherited;
  TioCommonBSAPersistence.BeforeEdit(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DoBeforeOpen;
begin
  inherited;
  case FBindSource.LoadType of
    ltCreate:
      TioCommonBSAPersistence.CreateDataObject(Self);
    ltAuto:
      TioCommonBSAPersistence.Load(Self);
  end;
end;

procedure TioActiveObjectBindSourceAdapter.DoReceiveSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FBindSource) then
    FBindSource.DoReceiveSelection(ASelected, ASelectionType, ADone);
end;

procedure TioActiveObjectBindSourceAdapter.ExtractDetailObject(AMasterObj: TObject);
var
  LDetailObj: TObject;
  LMasterProperty: IioProperty;
  LValue: TValue;
begin
  LDetailObj := nil;
  // Check parameter, if the MasterObject is not assigned
  // then close the BSA
  if not Assigned(AMasterObj) then
  begin
    Self.InternalSetDataObject(LDetailObj, False); // 2° parameter false ABSOLUTELY!!!!!!!
    Exit;
  end;
  // Extract master property value
  LMasterProperty := TioMapContainer.GetMap(AMasterObj.ClassName).GetProperties.GetPropertyByName(FBindSource.MasterPropertyName);
  LValue := LMasterProperty.GetValue(AMasterObj);
  // if not empty extract the detail object
  if not LValue.IsEmpty then
    if LMasterProperty.IsInterface then
      raise EioGenericException.Create(Self.ClassName, 'ExtractDetailObject', 'Master property (in the master object) is an interface type.')
    else
      LDetailObj := LValue.AsObject;
  // Set it to the Adapter itself
  Self.InternalSetDataObject(LDetailObj, False); // 2° parameter false ABSOLUTELY!!!!!!!
end;

function TioActiveObjectBindSourceAdapter.GetBindSource: IioBindSource;
begin
  Result := FBindSource;
end;

function TioActiveObjectBindSourceAdapter.GetBSPersistenceDeleting: Boolean;
begin
  Result := FBSPersistenceDeleting;
end;

function TioActiveObjectBindSourceAdapter.GetCanActivate: Boolean;
begin
  // Riportato allo stato originale della classe capostipite perchè
  // altrimenti e non veniva espressamente impostato il DataObject
  // con un SetDataObject e quindi l'oggetto si sarebbe dovuto caricare
  // dal DB (ORM) in realtà l'adapter non si attivava mai perchè
  // questa funzione avrebbe ritornato sempre False visto che il DataObject
  // era = a nil. IN questo modo invece funziona.
  Result := True;
end;

function TioActiveObjectBindSourceAdapter.GetCurrentOID: Integer;
begin
  Result := TioMapContainer.GetMap(Current.ClassName).GetProperties.GetIdProperty.GetValue(Self.Current).AsInteger;
end;

function TioActiveObjectBindSourceAdapter.DataObject: TObject;
begin
  Result := TObjectBindSourceAdapter(Self).DataObject;
end;

function TioActiveObjectBindSourceAdapter.GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := FDataSetLinkContainer;
end;

function TioActiveObjectBindSourceAdapter.GetFields: TList<TBindSourceAdapterField>;
begin
  Result := Self.Fields;
end;

function TioActiveObjectBindSourceAdapter.NewDetailBindSourceAdapter(const ABindSource: IioBindSource; const AMasterPropertyName: String)
  : IioActiveBindSourceAdapter;
begin
  // Return the requested DetailBindSourceAdapter and set the current master object
  Result := FDetailAdaptersContainer.NewDetailBindSourceAdapter(ABindSource, GetObjectType.Name, AMasterPropertyName);
  FDetailAdaptersContainer.SetMasterObject(Current);
end;

function TioActiveObjectBindSourceAdapter.NewNaturalObjectBindSourceAdapter(const ABindSource: IioBindSource): IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.NewNaturalBindSourceAdapter(ABindSource, Self);
end;

function TioActiveObjectBindSourceAdapter.GetioAutoPost: Boolean;
begin
  Result := Self.AutoPost;
end;

function TioActiveObjectBindSourceAdapter.GetTypeOfCollection: TioTypeOfCollection;
begin
  Result := TYPE_OF_COLLECTION;
end;

function TioActiveObjectBindSourceAdapter.GetItemIndex: Integer;
begin
  Result := inherited ItemIndex;
end;

function TioActiveObjectBindSourceAdapter.GetItems(const AIndex: Integer): TObject;
begin
  Result := DataObject;
end;

function TioActiveObjectBindSourceAdapter.GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if Self.HasMasterBSA then
    Result := FMasterAdaptersContainer.GetMasterBindSourceAdapter;
end;

function TioActiveObjectBindSourceAdapter.GetMasterPropertyPath: String;
begin
  if HasMasterBSA then
    Result := GetMasterBindSourceAdapter.GetMasterPropertyPath + '.' + FBindSource.MasterPropertyName
  else
    Result := '';
end;

function TioActiveObjectBindSourceAdapter.GetObjStatus: TioObjStatus;
begin
  Result := TioCommonBSABehavior.GetObjStatus(Self);
end;

function TioActiveObjectBindSourceAdapter.GetReloading: Boolean;
begin
  Result := FReloading;
end;

function TioActiveObjectBindSourceAdapter.GetState: TBindSourceAdapterState;
begin
  Result := Self.State;
end;

procedure TioActiveObjectBindSourceAdapter.Insert(AObject: TObject);
begin
  Assert(False);
end;

procedure TioActiveObjectBindSourceAdapter.Insert(AObject: IInterface);
begin
  raise EioGenericException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for class referenced instances only.');
end;

function TioActiveObjectBindSourceAdapter.GetHasBindSource: Boolean;
begin
  Result := Assigned(FBindSource);
end;

function TioActiveObjectBindSourceAdapter.GetHasMasterBSA: Boolean;
begin
  Result := not FBindSource.MasterPropertyName.IsEmpty;
end;

function TioActiveObjectBindSourceAdapter.GetIsAutoLoad: Boolean;
begin
  Result := (FBindSource.LoadType = ltAuto);
end;

function TioActiveObjectBindSourceAdapter.GetIsDetailBSA: Boolean;
begin
  Result := HasMasterBSA;
end;

function TioActiveObjectBindSourceAdapter.GetIsInterfaceBSA: Boolean;
begin
  Result := False;
end;

function TioActiveObjectBindSourceAdapter.GetIsMasterBSA: Boolean;
begin
  Result := not HasMasterBSA;
end;

procedure TioActiveObjectBindSourceAdapter.LoadPage;
begin
  raise EioGenericException.Create(Self.ClassName, 'LoadPage', 'Method not available in ObjectBindSourceAdapters.');
end;

function TioActiveObjectBindSourceAdapter.GetMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FMasterAdaptersContainer;
end;

function TioActiveObjectBindSourceAdapter.Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
begin
  TioCommonBSABehavior.Notify(Sender, Self, ANotification);
  Result := ANotification.Response;
end;

procedure TioActiveObjectBindSourceAdapter.PersistAll;
begin
  TioCommonBSAPersistence.PersistAll(Self);
end;

procedure TioActiveObjectBindSourceAdapter.PersistCurrent;
begin
  TioCommonBSAPersistence.PersistCurrent(Self);
end;

function TioActiveObjectBindSourceAdapter.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioActiveObjectBindSourceAdapter.ReceiveSelection(ASelected: TObject; ASelectionType: TioSelectionType);
var
  LDone: Boolean;
  LPreviousCurrentObj: TObject;
begin
  // Forza l'aggiornamento del SUD (Smart Update Detection) in modo che poi, se richiesto,
  // l'oggetto Master vegga persistito. Prima di aggiungere questa riga succedeva che,
  // nell'esempio degli ordini delle pizze, se aggiungevo una nuova pizza in una nuova
  // riga con una nuova pizza poi l'oggetto non si persisteva perchè nel SUD l'oggetto
  // master non figurava come modificato e quindi non veniva persistito. La stessa cosa
  // succedeva anche in caso di modifica manuale di una riga.
  // NB: Prima era alla fine di questo metodo ma poi l'ho spostato all'inizio perchè
  // altrimenti la selezione avveniva anche se l'utente non aveva l'autorizzazione
  // l'oggetto ricevente (Target), nel senso che otteneva l'autorizzazione alla selezione
  // ma non alla modifica dell'oggetto target che cmq viene modificato. Spostandolo
  // all'inizio l'operazione non si esegue se non ottiene entrambe le autorizzazioni
  DoBeforeEdit;

  // Initialization and save previous current object to delete it if
  // OnReceiveSelectionFreeObject property of the BindSource is True
  LDone := False;
  LPreviousCurrentObj := Current;

  // Clone the selected object if the OnReceiveSelectionCloneObject property
  // of the BindSource is true
  if FBindSource.OnReceiveSelectionCloneObject then
    ASelected := TioUtilities.CloneObject(ASelected);

  // Do the selection
  // DoBeforeReceiveSelection(ASelected, ASelectionType); Spostato in TioCommonBSBehavior.Select<T>
  DoReceiveSelection(ASelected, ASelectionType, LDone);
  if not LDone then
    SetDataObject(ASelected);
  DoAfterReceiveSelection(ASelected, ASelectionType);

  // Free the previous current object if OnReceiveSelectionFreeObject property
  // of the BindSource is True
  // NB: Solo se in realtà il PreviousCurrentObj e il Current sono diversi, cioè non sono
  // stesso oggetto. Ho fatto questa modifica perchè in alcuni casi come quello dell'esempio
  // della pizza nel quale il Selector delle Pizze punta (properietà SelectorFor) non al BSRows
  // ma al BSOrder perchè essendoci l'apposito metodo per aggiungere una pizza nel TOrder ho deciso
  // di destinare la selezione li; in questo caso avrebbe fatto il Free dell'ordine. Si tratta di un caso
  // particolare però facendo in questo modo evito eventuali problemi di AV error semplificando
  // la vita anche se mi dimentico di mettere a False la proprietà OnReceiveSelectionFreeObject.
  if FBindSource.OnReceiveSelectionFreeObject and (LPreviousCurrentObj <> nil) and (Current <> LPreviousCurrentObj) then
    LPreviousCurrentObj.Free;
end;

procedure TioActiveObjectBindSourceAdapter.ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType);
begin
  // Questo ActiveBindSourceAdapter funziona solo con gli oggetti (no interfacce)
  // quindi chiama l'altra versione di metodo più adatta. IN questo modo
  // è possibile gestire la selezione anche se il selettore non è concorde
  ReceiveSelection(ASelected as TObject, ASelectionType);
end;

procedure TioActiveObjectBindSourceAdapter.Refresh(const ANotify: Boolean = True);
begin
  TioCommonBSAPersistence.Refresh(Self, ANotify);
end;

procedure TioActiveObjectBindSourceAdapter.Reload;
begin
  if FBindSource.LoadType = ltCreate then
    TioCommonBSAPersistence.CreateDataObject(Self)
  else
    TioCommonBSAPersistence.Reload(Self);
end;

procedure TioActiveObjectBindSourceAdapter.SetBindSource(ABindSource: IioBindSource);
begin
  FBindSource := ABindSource;
end;

procedure TioActiveObjectBindSourceAdapter.SetBSPersistenceDeleting(const Value: Boolean);
begin
  FBSPersistenceDeleting := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetDataObject(const ADataObject: TObject; const AOwnsDataObject: Boolean);
begin
  if Self.HasMasterBSA then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<TObject>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsDataObject);
end;

procedure TioActiveObjectBindSourceAdapter.SetDataObject(const ADataObject: IInterface; const AOwnsDataObject: Boolean);
begin
  raise EioGenericException.Create(Self.ClassName, 'SetDataObject', 'This ActiveBindSourceAdapter is for class referenced instances only (not interfaced).');
end;

procedure TioActiveObjectBindSourceAdapter.InternalSetDataObject(const ADataObject: IInterface; const AOwnsDataObject: Boolean);
begin
  raise EioGenericException.Create(Self.ClassName, 'InternalSetDataObject',
    'This ActiveBindSourceAdapter is for class referenced instances only (not interfaced).');
end;

procedure TioActiveObjectBindSourceAdapter.InternalSetDataObject(const ADataObject: TObject; const AOwnsDataObject: Boolean);
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
    inherited SetDataObject(ADataObject, AOwnsDataObject);
    FOwnsDataObject := AOwnsDataObject;
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
    inherited SetDataObject(nil, AOwnsDataObject);
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
end;

procedure TioActiveObjectBindSourceAdapter.SetioAutoPost(const Value: Boolean);
begin
  Self.AutoPost := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetItemIndex(const Value: Integer);
begin
  inherited ItemIndex := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetItems(const AIndex: Integer; const Value: TObject);
begin
  InternalSetDataObject(Value);
end;

procedure TioActiveObjectBindSourceAdapter.SetMasterAdaptersContainer(AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
begin
  FMasterAdaptersContainer := AMasterAdaptersContainer;
end;

procedure TioActiveObjectBindSourceAdapter.SetObjStatus(AObjStatus: TioObjStatus);
begin
  TioCommonBSABehavior.SetObjStatus(Self, AObjStatus);
end;

procedure TioActiveObjectBindSourceAdapter.SetReloading(const Value: Boolean);
begin
  FReloading := Value;
end;

function TioActiveObjectBindSourceAdapter.SupportsNestedFields: Boolean;
begin
  // Disable support for NestedFields because iORM implements its own way of managing them
  // in the unit "iORM.LiveBindings.CommonBSABehavior" with relative changes also in the ActivebindSourceAdapters
  Result := False;
end;

function TioActiveObjectBindSourceAdapter.GetObjStatusInUse: Boolean;
begin
  Result := TioCommonBSABehavior.GetObjStatusInUse(Self);
end;

function TioActiveObjectBindSourceAdapter.GetOwnsDataObject: Boolean;
begin
  Result := FOwnsDataObject;
end;

function TioActiveObjectBindSourceAdapter._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

function TioActiveObjectBindSourceAdapter._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

end.
