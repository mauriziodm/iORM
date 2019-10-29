{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}



unit iORM.LiveBindings.ActiveObjectBindSourceAdapter;

interface

uses
  Data.Bind.ObjectScope, iORM.CommonTypes, System.Classes, System.Generics.Collections,
  iORM.Context.Properties.Interfaces, iORM.LiveBindings.Interfaces,
  iORM.LiveBindings.Notification, iORM.Where.Interfaces, iORM.MVVM.Interfaces,
  System.Rtti;

const
  VIEW_DATA_TYPE = TioViewDataType.dtSingle;

type

  TioActiveObjectBindSourceAdapter = class(TObjectBindSourceAdapter, IioContainedBindSourceAdapter, IioActiveBindSourceAdapter, IioNaturalBindSourceAdapterSource)
  private
    FAsync: Boolean;
    FWhere: IioWhere;
    FWhereDetailsFromDetailAdapters: Boolean;
//    FClassRef: TioClassRef;
    FTypeName, FTypeAlias: String;  // NB: TypeAlias has no effect in this adapter (only used by interfaced BSA)
    FLocalOwnsObject: Boolean;
    FAutoLoadData: Boolean;
    FAutoPersist: Boolean;
    FReloadDataOnRefresh: Boolean;
    FMasterProperty: IioContextProperty;
    FMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FBindSource: IioNotifiableBindSource;
//    FNaturalBSA_MasterBindSourceAdapter: IioActiveBindSourceAdapter;  *** NB: Code presente (commented) in the unit body ***
    FDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    FDeleteAfterCancel: Boolean;
    FonNotify: TioBSANotificationEvent;
    // TypeName
    procedure SetTypeName(const AValue:String);
    function GetTypeName: String;
    // TypeAlias
    procedure SetTypeAlias(const AValue:String);
    function GetTypeAlias: String;
    // Async property
    function GetIoAsync: Boolean;
    procedure SetIoAsync(const Value: Boolean);
    // AutoPost property
    procedure SetioAutoPost(const Value: Boolean);
    function GetioAutoPost: Boolean;
    // AutoPersist property
    function GetioAutoPersist: Boolean;
    procedure SetioAutoPersist(const Value: Boolean);
    // WhereStr property
    procedure SetIoWhere(const Value: IioWhere);
    function GetIoWhere: IioWhere;
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
    // AutoLoadData
    procedure SetAutoLoadData(const Value: Boolean);
    function GetAutoLoadData: Boolean;
  protected
    function GetCanActivate: Boolean; override;
    // =========================================================================
    // Part for the support of the IioNotifiableBindSource interfaces (Added by iORM)
    //  because is not implementing IInterface (NB: RefCount DISABLED)
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
{$IFDEF AUTOREFCOUNT}
    function __ObjAddRef: Integer; override;
    function __ObjRelease: Integer; override;
{$ENDIF}
    // =========================================================================
    procedure DoBeforeOpen; override;
    procedure DoBeforeRefresh; override;
    procedure DoBeforeDelete; override;
    procedure DoAfterPost; override;
    procedure DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>); override;
    procedure DoBeforeCancel; override;
    procedure DoAfterCancel; override;
    procedure DoAfterScroll; override;
    procedure DoNotify(ANotification:IioBSANotification);
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType:TioSelectionType);
    procedure DoSelection(var ASelected: TObject; var ASelectionType:TioSelectionType; var ADone:Boolean);
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType:TioSelectionType);
    procedure SetObjStatus(AObjStatus: TioObjectStatus);
    function UseObjStatus: Boolean;
    function GetBaseObjectClassName: String;
    // Generic parameter must be <IInterface> (for interfaced list such as IioList<IInterface>) or
    //  <TObject> (for non interfaced list such as TList<IInterface>)
    procedure InternalSetDataObject(const ADataObject:TObject; const AOwnsObject:Boolean=True); overload;
    procedure InternalSetDataObject(const ADataObject:IInterface; const AOwnsObject:Boolean=False); overload;
  public
    constructor Create(AClassRef:TioClassRef; AWhere:IioWhere; AOwner: TComponent; ADataObject: TObject; AutoLoadData: Boolean; AOwnsObject: Boolean = True); overload;
    destructor Destroy; override;
    procedure SetMasterAdapterContainer(AMasterAdapterContainer:IioDetailBindSourceAdaptersContainer);
    procedure SetMasterProperty(AMasterProperty: IioContextProperty);
    procedure SetBindSource(ANotifiableBindSource:IioNotifiableBindSource);
    function GetBindSource: IioNotifiableBindSource;
    procedure ExtractDetailObject(AMasterObj: TObject);
    procedure PersistCurrent;
    procedure PersistAll;
    function NewDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere:IioWhere): TBindSourceAdapter;
    function NewNaturalObjectBindSourceAdapter(const AOwner:TComponent): TBindSourceAdapter;
    function GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function DetailAdaptersContainer:IioDetailBindSourceAdaptersContainer;
    procedure Append(AObject:TObject); reintroduce; overload;
    procedure Append(AObject:IInterface); reintroduce; overload;
    procedure Insert(AObject:TObject); reintroduce; overload;
    procedure Insert(AObject:IInterface); reintroduce; overload;
    procedure Notify(Sender:TObject; ANotification:IioBSANotification); virtual;
    procedure Refresh(ReloadData:Boolean); reintroduce; overload;
    function DataObject: TObject;
    procedure SetDataObject(const ADataObject:TObject; const AOwnsObject:Boolean=True); overload;
    procedure SetDataObject(const ADataObject:IInterface; const AOwnsObject:Boolean=False); overload;
    procedure ClearDataObject;
    function GetCurrentOID: Integer;
    function IsDetail: Boolean;
    function IsInterfaceBSA: Boolean;
    function GetMasterPropertyName: String;
    function GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    procedure DeleteListViewItem(const AItemIndex:Integer; const ADelayMilliseconds:integer=100);
    function AsTBindSourceAdapter: TBindSourceAdapter;
    procedure ReceiveSelection(ASelected:TObject; ASelectionType:TioSelectionType); overload;
    procedure ReceiveSelection(ASelected:IInterface; ASelectionType:TioSelectionType); overload;

    property ioTypeName:String read GetTypeName write SetTypeName;
    property ioTypeAlias:String read GetTypeAlias write SetTypeAlias;
    property ioAutoLoadData:Boolean read GetAutoLoadData write SetAutoLoadData;
    property ioAsync:Boolean read GetIoAsync write SetIoAsync;
    property ioAutoPost:Boolean read GetioAutoPost write SetioAutoPost;
    property ioAutoPersist:Boolean read GetioAutoPersist write SetioAutoPersist;
    property ioWhere:IioWhere read GetIoWhere write SetIoWhere;
    property ioWhereDetailsFromDetailAdapters: Boolean read GetioWhereDetailsFromDetailAdapters write SetioWhereDetailsFromDetailAdapters;
    property ioViewDataType:TioViewDataType read GetIoViewDataType;
    property ioOwnsObjects:Boolean read GetOwnsObjects;
    property Items[const AIndex:Integer]:TObject read GetItems write SetItems;

    property ioOnNotify:TioBSANotificationEvent read FonNotify write FonNotify;
  end;

implementation

uses
  iORM, iORM.Context.Factory, System.SysUtils,
  iORM.LiveBindings.Factory, iORM.Context.Map.Interfaces,
  iORM.Where.Factory, iORM.Exceptions, iORM.LiveBindings.CommonBSAPersistence,
  iORM.LiveBindings.CommonBSABehavior;

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

procedure TioActiveObjectBindSourceAdapter.Append(AObject: IInterface);
begin
  raise EioException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for class referenced instances only.');
end;

function TioActiveObjectBindSourceAdapter.AsTBindSourceAdapter: TBindSourceAdapter;
begin
  Result := Self as TBindSourceAdapter;
end;

procedure TioActiveObjectBindSourceAdapter.ClearDataObject;
begin
  Self.InternalSetDataObject(nil, False);
end;

constructor TioActiveObjectBindSourceAdapter.Create(AClassRef:TioClassRef; AWhere: IioWhere;
  AOwner: TComponent; ADataObject: TObject; AutoLoadData: Boolean; AOwnsObject: Boolean);
begin
  FAutoLoadData := AutoLoadData;
  FAsync := False;
  FAutoPersist := True;
  FReloadDataOnRefresh := True;

  // If the AObject is assigned the set the BaseRttiType from this instance (most accurate) else resolve the TypeName
  //  AObject is always a TObject by generic constraint
  if Assigned(ADataObject) then
    AClassRef := ADataObject.ClassType;
  inherited Create(AOwner, ADataObject, AClassRef, AOwnsObject);

  FLocalOwnsObject := AOwnsObject;
  FWhere := AWhere;
  FWhereDetailsFromDetailAdapters := False;
  FTypeName := AClassRef.ClassName;
  FTypeAlias := ''; // NB: TypeAlias has no effect in this adapter (only used by interfaced BSA)
  FDataSetLinkContainer := TioLiveBindingsFactory.BSAToDataSetLinkContainer;
  // Set Master & Details adapters reference
  FMasterAdaptersContainer := nil;
  FDetailAdaptersContainer := TioLiveBindingsFactory.DetailAdaptersContainer(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DeleteListViewItem(const AItemIndex,
  ADelayMilliseconds: integer);
begin
  raise EioException.Create(Self.ClassName, 'DeleteListViewItem', 'Method not available in ObjectBindSourceAdapters.');
end;

destructor TioActiveObjectBindSourceAdapter.Destroy;
begin
  // Detach itself from MasterAdapterContainer (if it's contained)
  if Assigned(FMasterAdaptersContainer) then
    FMasterAdaptersContainer.RemoveBindSourceAdapter(Self);
  // Free the DetailAdaptersContainer
  FDetailAdaptersContainer.Free;
  inherited;
end;

function TioActiveObjectBindSourceAdapter.DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FDetailAdaptersContainer;
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterCancel;
begin
  inherited;
  // Flag che indica se poi, nel DoAfterCancer, deve provvedere
  //  a fare il Delete del record/oggetto di cui si richiede l'annullamento.
  //  NB. Tutto questo serve per fare in modo che il BSA e quindi anche il DataSet
  //       si comporti come si comportano i DataSet normalmente quando si fa il
  //       cancel durante l'ìnsert/append di un nuovo record/oggetto e cioè
  //       che il nuovo record viene automaticamente eliminato (nei BSA invece
  //       rimane il nuovo oggetto "vuoto".
  if FDeleteAfterCancel then
  begin
    Self.GetDataSetLinkContainer.Refresh(True); // Altrimenti da un errore sull'Append
    Self.Delete;
  end;
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterPost;
begin
  inherited;
  // NB: Effettua da qui la chiamata per la persistenza (AutoPersist = true) solo se
  //      la proprietà "ioAutoPost" = false. In realtà non ci sarebbe nemmeno bisogno
  //      dell'if perchè ho notato che se ioAutoPost=true già non ci passerebbe di suo
  //      ma meglio andare sul sicuro.
  //      In pratica se ioAutoPost=true esegue l'auto persist (se abilitato) nel metodo
  //      DoAfterPostFields e alla modifica di ogni singola proprietà, se invece
  //      ioAutoPost=False invece esegue il persist nel metodo DoAfterPost.
  if not Self.ioAutoPost then
    TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>);
begin
  inherited;
  // NB: Effettua da qui la chiamata per la persistenza (AutoPersist = false) solo se
  //      la proprietà "ioAutoPost" = true. In realtà non ci sarebbe nemmeno bisogno
  //      dell'if perchè ho notato che se ioAutoPost=false già non ci passerebbe di suo
  //      ma meglio andare sul sicuro.
  //      In pratica se ioAutoPost=true esegue l'auto persist (se abilitato) nel metodo
  //      DoAfterPostFields e alla modifica di ogni singola proprietà, se invece
  //      ioAutoPost=False invece esegue il persist nel metodo DoAfterPost.
  if Self.ioAutoPost then
    TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterScroll;
begin
  inherited;
  Self.FDetailAdaptersContainer.SetMasterObject(Self.Current);
  // DataSet synchro
  Self.GetDataSetLinkContainer.SetRecNo(Self.ItemIndex);
end;

procedure TioActiveObjectBindSourceAdapter.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoAfterSelection(ASelected, ASelectionType);
end;

procedure TioActiveObjectBindSourceAdapter.DoBeforeCancel;
begin
  inherited;
  // Flag che indica se poi, nel DoAfterCancer, deve provvedere
  //  a fare il Delete del record/oggetto di cui si richiede l'annullamento.
  //  NB. Tutto questo serve per fare in modo che il BSA e quindi anche il DataSet
  //       si comporti come si comportano i DataSet normalmente quando si fa il
  //       cancel durante l'ìnsert/append di un nuovo record/oggetto e cioè
  //       che il nuovo record viene automaticamente eliminato (nei BSA invece
  //       rimane il nuovo oggetto "vuoto".
  //  NB: DISABILITATO PERCHE' CAUSAVA ALCUNI PROBLEMI:
  //       1) Quando si faceva un Append(AObject) causava l'eliminazione automatica
  //           dell'oggetto appena inserito. Questo succedeva perchè nel
  //           PrototypeBindSource/ModelPresenter, nel metodo Append(AObject),
  //           subito dopo l'Append normale veniva fatto anche un Refresh, al suo interno
  //           il refresh a sua volta faceva un cancel e innescava l'AutoDelete di cui sotto
  //           che eliminava il nuovo oggetto appena inserito.
  //       2) Quando si faceva l'append di un nuovo oggetto e poi si editava
  //           l'istanza stessa con un NaturalBindSourceAdapter (MVVM) al Post
  //           si innescava di nuovo un Cancel sul BSA master he a sua volta
  //           innescava l'AutoDelete in modo simile al punto 1.
//  FDeleteAfterCancel := (Self.State = TBindSourceAdapterState.seInsert);
  FDeleteAfterCancel := False;
end;

procedure TioActiveObjectBindSourceAdapter.DoBeforeDelete;
var
  LAbort: Boolean;
begin
  inherited;
  TioCommonBSAPersistence.Delete(Self, LAbort);
{ TODO : Abort da eliminare??? }
//  if LAbort then
//    Abort;
end;

procedure TioActiveObjectBindSourceAdapter.DoBeforeOpen;
begin
  inherited;
  TioCommonBSAPersistence.Load(Self);
end;

procedure TioActiveObjectBindSourceAdapter.DoBeforeRefresh;
var
  PrevDataObject: TObject;
begin
  inherited;
  if FReloadDataOnRefresh then
  begin
    // Deactivate the adapter
    Self.Active := False;
    // Get actual DataObject
    PrevDataObject := Self.DataObject;
    // If ActualDataObject is assigned and OwnsObject = True then destroy the object
    if Assigned(PrevDataObject) and Self.FLocalOwnsObject then PrevDataObject.Free;
    // Activate the Adapter (after the adapter fire the onBeforeOpen event that Load
    //  the NewObject
    Self.Active := True;
  end;
end;

procedure TioActiveObjectBindSourceAdapter.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoBeforeSelection(ASelected, ASelectionType);
end;

procedure TioActiveObjectBindSourceAdapter.DoNotify(
  ANotification: IioBSANotification);
begin
  if Assigned(FonNotify)
    then ioOnNotify(Self, ANotification);
end;

procedure TioActiveObjectBindSourceAdapter.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType;
  var ADone: Boolean);
begin
  if Assigned(FBindSource) then
    FBindSource.DoSelection(ASelected, ASelectionType, ADone);
end;

procedure TioActiveObjectBindSourceAdapter.ExtractDetailObject(
  AMasterObj: TObject);
var
  LDetailObj: TObject;
  AValue: TValue;
begin
  LDetailObj := nil;
  // Check parameter, if the MasterObject is not assigned
  //  then close the BSA
  if not Assigned(AMasterObj) then
  begin
    Self.InternalSetDataObject(LDetailObj, False);  // 2° parameter false ABSOLUTELY!!!!!!!
    Exit;
  end;
  // Extract master property value
  AValue := FMasterProperty.GetValue(AMasterObj);
  // if not empty extract the detail object
   if not AValue.IsEmpty then
    if FMasterProperty.IsInterface then
      raise EioException.Create(Self.ClassName, 'ExtractDetailObject', 'Master property (in the master object) is an interface type.')
    else
      LDetailObj := AValue.AsObject;
  // Set it to the Adapter itself
  Self.InternalSetDataObject(LDetailObj, False);  // 2° parameter false ABSOLUTELY!!!!!!!
end;
//procedure TioActiveObjectBindSourceAdapter.ExtractDetailObject(
//  AMasterObj: TObject);
//var
//  ADetailObj: TObject;
//  AValue: TValue;
//begin
//  ADetailObj := nil;
//  // Check parameter, if the MasterObject is not assigned
//  //  then close the BSA
//  if not Assigned(AMasterObj) then
//  begin
//    Self.SetDataObject(nil, False);  // 2° parameter false ABSOLUTELY!!!!!!!
//    Exit;
//  end;
//  // Extract master property value
//  AValue := FMasterProperty.GetValue(AMasterObj);
//  // if not empty extract the detail object
//   if not AValue.IsEmpty then
//    if FMasterProperty.IsInterface then
//      ADetailObj := TObject(AValue.AsInterface)
//    else
//      ADetailObj := AValue.AsObject;
//  // Set it to the Adapter itself
//  Self.SetDataObject(ADetailObj, False);  // 2° parameter false ABSOLUTELY!!!!!!!
//end;

function TioActiveObjectBindSourceAdapter.GetAutoLoadData: Boolean;
begin
  Result := FAutoLoadData;
end;

function TioActiveObjectBindSourceAdapter.GetBaseObjectClassName: String;
begin
   Result := FTypeName;
end;

function TioActiveObjectBindSourceAdapter.GetBindSource: IioNotifiableBindSource;
begin
  Result := FBindSource;
end;

function TioActiveObjectBindSourceAdapter.GetCanActivate: Boolean;
begin
  // Riportato allo stato originale della classe capostipite perchè
  //  altrimenti e non veniva espressamente impostato il DataObject
  //  con un SetDataObject e quindi l'oggetto si sarebbe dovuto caricare
  //  dal DB (ORM) in realtà l'adapter non si attivava mai perchè
  //  questa funzione avrebbe ritornato sempre False visto che il DataObject
  //  era = a nil. IN questo modo invece funziona.
  Result := True;
end;

function TioActiveObjectBindSourceAdapter.GetCurrentOID: Integer;
begin
  Result := TioContextFactory.GetIDPropertyByClassRef(Self.Current.ClassType).GetValue(Self.Current).AsInteger;
end;

function TioActiveObjectBindSourceAdapter.DataObject: TObject;
begin
  Result := TObjectBindSourceAdapter(Self).DataObject;
end;

function TioActiveObjectBindSourceAdapter.GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := FDataSetLinkContainer;
end;

function TioActiveObjectBindSourceAdapter.GetDetailBindSourceAdapterByMasterPropertyName(
  const AMasterPropertyName: String): IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.GetBindSourceAdapterByMasterPropertyName(AMasterPropertyName);
end;

function TioActiveObjectBindSourceAdapter.GetFields: TList<TBindSourceAdapterField>;
begin
  Result := Self.Fields;
end;

function TioActiveObjectBindSourceAdapter.GetIoAsync: Boolean;
begin
  Result := FAsync;
end;

function TioActiveObjectBindSourceAdapter.NewDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere:IioWhere): TBindSourceAdapter;
begin
  // Return the requested DetailBindSourceAdapter and set the current master object
  Result := FDetailAdaptersContainer.NewBindSourceAdapter(AOwner, FTypeName, AMasterPropertyName, AWhere);
  FDetailAdaptersContainer.SetMasterObject(Self.Current);
end;

function TioActiveObjectBindSourceAdapter.GetioAutoPersist: Boolean;
begin
  Result := FAutoPersist;
end;

function TioActiveObjectBindSourceAdapter.GetioAutoPost: Boolean;
begin
  Result := Self.AutoPost;
end;

function TioActiveObjectBindSourceAdapter.GetIoViewDataType: TioViewDataType;
begin
  Result := VIEW_DATA_TYPE;
end;

function TioActiveObjectBindSourceAdapter.GetIoWhere: IioWhere;
begin
  Result := FWhere;
  // Fill the WhereDetails from the DetailAdapters container if enabled
  //  NB: Create it if not assigned
  if FWhereDetailsFromDetailAdapters then
  begin
    if not Assigned(FWhere) then
      FWhere := TioWhereFactory.NewWhere;
    FDetailAdaptersContainer.FillWhereDetails(FWhere.Details);
  end;
end;

function TioActiveObjectBindSourceAdapter.GetioWhereDetailsFromDetailAdapters: Boolean;
begin
  Result := FWhereDetailsFromDetailAdapters;
end;

function TioActiveObjectBindSourceAdapter.GetItemIndex: Integer;
begin
  Result := inherited ItemIndex;
end;

function TioActiveObjectBindSourceAdapter.GetItems(
  const AIndex: Integer): TObject;
begin
  Result := DataObject;
end;

function TioActiveObjectBindSourceAdapter.GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  if Self.IsDetail then
    Result := FMasterAdaptersContainer.GetMasterBindSourceAdapter;
end;

function TioActiveObjectBindSourceAdapter.GetMasterPropertyName: String;
begin
  Result := FMasterProperty.GetName;
end;

function TioActiveObjectBindSourceAdapter.GetOwnsObjects: Boolean;
begin
  Result := FLocalOwnsObject;
end;

function TioActiveObjectBindSourceAdapter.GetState: TBindSourceAdapterState;
begin
  Result := Self.State;
end;

function TioActiveObjectBindSourceAdapter.GetTypeAlias: String;
begin
  Result := FTypeAlias;
end;

function TioActiveObjectBindSourceAdapter.GetTypeName: String;
begin
  Result := FTypeName;
end;

function TioActiveObjectBindSourceAdapter.NewNaturalObjectBindSourceAdapter(
  const AOwner: TComponent): TBindSourceAdapter;
begin
  Result := TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(AOwner, Self);
end;

procedure TioActiveObjectBindSourceAdapter.Insert(AObject: TObject);
begin
  Assert(False);
end;

procedure TioActiveObjectBindSourceAdapter.Insert(AObject: IInterface);
begin
  raise EioException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for class referenced instances only.');
end;

function TioActiveObjectBindSourceAdapter.IsDetail: Boolean;
begin
  Result := Assigned(FMasterProperty);
end;

function TioActiveObjectBindSourceAdapter.IsInterfaceBSA: Boolean;
begin
  Result := False;
end;

procedure TioActiveObjectBindSourceAdapter.Notify(Sender: TObject;
  ANotification: IioBSANotification);
begin
  // Fire the event handler
  if Sender <> Self
    then Self.DoNotify(ANotification);
  // Replicate notification to the BindSource
  if Assigned(FBindSource) and (Sender <> TObject(FBindSource))
    then FBindSource.Notify(Self, ANotification);
  // Replicate notification to the DetailAdaptersContainer
  if Sender <> TObject(FDetailAdaptersContainer)
    then FDetailAdaptersContainer.Notify(Self, ANotification);
  // Replicate notification to the MasterAdaptersContainer
  if Assigned(FMasterAdaptersContainer) and (Sender <> TObject(FMasterAdaptersContainer))
    then FMasterAdaptersContainer.Notify(Self, ANotification);
end;

procedure TioActiveObjectBindSourceAdapter.PersistAll;
begin
  TioCommonBSAPersistence.PersistAll(Self);
end;

procedure TioActiveObjectBindSourceAdapter.PersistCurrent;
begin
  TioCommonBSAPersistence.PersistCurrent(Self);
end;

function TioActiveObjectBindSourceAdapter.QueryInterface(const IID: TGUID;
  out Obj): HResult;
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
begin
  LDone := False;
  DoBeforeSelection(ASelected, ASelectionType);
  DoSelection(ASelected, ASelectionType, LDone);
  if not LDone then
    Self.SetDataObject(ASelected);
  DoAfterSelection(ASelected, ASelectionType);
end;

procedure TioActiveObjectBindSourceAdapter.ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType);
begin
  // Questo ActiveBindSourceAdapter funziona solo con gli oggetti (no interfacce)
  //  quindi chiama l'altra versione di metodo più adatta. IN questo modo
  //  è possibile gestire la selezione anche se il selettore non è concorde
  ReceiveSelection(ASelected as TObject, ASelectionType);
end;

procedure TioActiveObjectBindSourceAdapter.Refresh(ReloadData: Boolean);
var
  PrecReloadData: Boolean;
begin
  // Se il BindSourceAdapter è un dettaglio allora propaga il Refresh al suo Master
  //  questo perchè solo il master esegue realmente le query e quindi è quest'ultimo che
  //  deve gestire il refresh con reload.
  if IsDetail and Assigned(FMasterAdaptersContainer) and ReloadData then
    FMasterAdaptersContainer.GetMasterBindSourceAdapter.Refresh(ReloadData)
  else
  begin
    PrecReloadData := FReloadDataOnRefresh;
    Self.FReloadDataOnRefresh := ReloadData;
    inherited Refresh;
    Self.FReloadDataOnRefresh := PrecReloadData;
  end;
end;

procedure TioActiveObjectBindSourceAdapter.SetAutoLoadData(
  const Value: Boolean);
begin
  FAutoLoadData := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetBindSource(ANotifiableBindSource:IioNotifiableBindSource);
begin
  FBindSource := ANotifiableBindSource;
end;

procedure TioActiveObjectBindSourceAdapter.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
  if Self.IsDetail then
    TioCommonBSABehavior.InternalSetDataObjectAsDetail<TObject>(Self, ADataObject)
  else
    InternalSetDataObject(ADataObject, AOwnsObject);
end;

procedure TioActiveObjectBindSourceAdapter.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  raise EioException.Create(Self.ClassName, 'SetDataObject', 'This ActiveBindSourceAdapter is for class referenced instances only (not interfaced).');
end;

procedure TioActiveObjectBindSourceAdapter.InternalSetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
  raise EioException.Create(Self.ClassName, 'InternalSetDataObject', 'This ActiveBindSourceAdapter is for class referenced instances only (not interfaced).');
end;

procedure TioActiveObjectBindSourceAdapter.InternalSetDataObject(const ADataObject: TObject; const AOwnsObject:Boolean);
var
  LPrecAutoLoadData: Boolean;
begin
  // Disable the adapter
  Self.First;  // Bug
  Self.Active := False;
  // AObj is assigned then set it as DataObject
  //  else set DataObject to nil and set MasterObject to nil
  //  to disable all Details adapters also
  if Assigned(ADataObject) then
  begin
    // Set the provided DataObject
    inherited SetDataObject(ADataObject, AOwnsObject);
    // Prior to reactivate the adapter force the "AutoLoadData" property to False to prevent double values
    //  then restore the original value of the "AutoLoadData" property.
    LPrecAutoLoadData := FAutoLoadData;
    try
      FAutoLoadData := False;
      Self.Active := True;
    finally
      FAutoLoadData := LPrecAutoLoadData;
    end;
  end
  else
  begin
    inherited SetDataObject(nil, AOwnsObject);
    Self.FDetailAdaptersContainer.SetMasterObject(nil);
  end;
  // DataSet synchro
  Self.GetDataSetLinkContainer.Refresh;
end;

procedure TioActiveObjectBindSourceAdapter.SetIoAsync(const Value: Boolean);
begin
  FAsync := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetioAutoPersist(const Value: Boolean);
begin
  FAutoPersist := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetioAutoPost(const Value: Boolean);
begin
  Self.AutoPost := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetIoWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetioWhereDetailsFromDetailAdapters(
  const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetItemIndex(const Value: Integer);
begin
  inherited ItemIndex := Value;
end;

procedure TioActiveObjectBindSourceAdapter.SetItems(const AIndex: Integer;
  const Value: TObject);
begin
  InternalSetDataObject(Value);
end;

procedure TioActiveObjectBindSourceAdapter.SetMasterAdapterContainer(
  AMasterAdapterContainer: IioDetailBindSourceAdaptersContainer);
begin
  FMasterAdaptersContainer := AMasterAdapterContainer;
end;

procedure TioActiveObjectBindSourceAdapter.SetMasterProperty(
  AMasterProperty: IioContextProperty);
begin
  FMasterProperty := AMasterProperty;
end;

procedure TioActiveObjectBindSourceAdapter.SetObjStatus(
  AObjStatus: TioObjectStatus);
begin
  TioContextFactory.Context(Self.Current.ClassName, nil, Self.Current).ObjectStatus := AObjStatus;
end;

procedure TioActiveObjectBindSourceAdapter.SetTypeAlias(const AValue: String);
begin
  FTypeAlias := AValue;
end;

procedure TioActiveObjectBindSourceAdapter.SetTypeName(const AValue: String);
begin
  FTypeName := AValue;
end;

function TioActiveObjectBindSourceAdapter.UseObjStatus: Boolean;
begin
  Result := TioContextFactory.Context(Self.Current.ClassName, nil, Self.Current).ObjStatusExist;
end;

function TioActiveObjectBindSourceAdapter._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
end;

function TioActiveObjectBindSourceAdapter._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
end;

end.

