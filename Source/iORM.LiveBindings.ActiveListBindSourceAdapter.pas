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
  VIEW_DATA_TYPE = TioViewDataType.dtList;

type

  TioActiveListBindSourceAdapter = class(TListBindSourceAdapter, IioContainedBindSourceAdapter, IioActiveBindSourceAdapter, IioNaturalBindSourceAdapterSource)
  private
    FAsync: Boolean;
    FWhere: IioWhere;
    FWhereDetailsFromDetailAdapters: Boolean;
//    FClassRef: TioClassRef;
    FTypeName, FTypeAlias: String;  // NB: TypeAlias has no effect in this adapter (only used by interfaced BSA)
    FLocalOwnsObject: Boolean;
    FAutoPersist: Boolean;
    FRefreshing: Boolean;
    FAutoLoadData: Boolean;
    FMasterProperty: IioProperty;
    FMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FBindSource: IioNotifiableBindSource;
    FInsertObj_Enabled: Boolean;
    FInsertObj_NewObj: TObject;
    FDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    FDeleteAfterCancel: Boolean;
    FBSPersistenceDeleting: Boolean;
    // Reference to the same instance contained by FList field, this reference is only to keep live the list instance
    FInterfacedList: IInterface;
    procedure ListViewDeletingTimerEventHandler(Sender: TObject);
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
    // AutoLoadData
    procedure SetAutoLoadData(const Value: Boolean);
    function GetAutoLoadData: Boolean;
    // Refreshing
    function GetRefreshing: boolean;
    procedure SetRefreshing(const Value: boolean);
    // BSPersistenceDeleting
    function GetBSPersistenceDeleting: Boolean;
    procedure SetBSPersistenceDeleting(const Value: Boolean);
  protected
    function SupportsNestedFields: Boolean; override;
    procedure AddFields; override;
    // =========================================================================
    // Part for the support of the IioNotifiableBindSource interfaces (Added by iORM)
    //  because is not implementing IInterface (NB: RefCount DISABLED)
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
    procedure DoBeforeCancel; override;
    procedure DoAfterCancel; override;
    procedure DoAfterDelete; override;
    procedure DoAfterScroll; override;
    procedure DoCreateInstance(out AHandled: Boolean; out AInstance: TObject); override;
    procedure DoBeforeSelection(var ASelected: TObject; var ASelectionType:TioSelectionType);
    procedure DoSelection(var ASelected: TObject; var ASelectionType:TioSelectionType; var ADone:Boolean);
    procedure DoAfterSelection(var ASelected: TObject; var ASelectionType:TioSelectionType);
    procedure SetObjStatus(AObjStatus: TioObjStatus);
    function UseObjStatus: Boolean;
    function GetBaseObjectClassName: String;
    // Generic parameter must be <IInterface> (for interfaced list such as IioList<IInterface>) or
    //  <TObject> (for non interfaced list such as TList<IInterface>)
    procedure _InternalSetDataObject<T>(const ADataObject:TObject; const AOwnsObject:Boolean); overload;
    procedure InternalSetDataObject(const ADataObject:TObject; const AOwnsObject:Boolean=True); overload;
    procedure InternalSetDataObject(const ADataObject:IInterface; const AOwnsObject:Boolean=False); overload;
    constructor InternalCreate(AClassRef:TioClassRef; AWhere:IioWhere; AOwner: TComponent; AutoLoadData: Boolean; AOwnsObject: Boolean = True); overload;
  public
    constructor Create(AClassRef:TioClassRef; AWhere:IioWhere; AOwner: TComponent; ADataObject: TList<TObject>; AutoLoadData: Boolean; AOwnsObject: Boolean = True); overload;
    constructor Create(AClassRef:TioClassRef; AWhere:IioWhere; AOwner: TComponent; ADataObject: IInterface; AutoLoadData: Boolean; AOwnsObject: Boolean = False); overload;
    destructor Destroy; override;
    function MasterAdaptersContainer:IioDetailBindSourceAdaptersContainer;
    procedure SetMasterAdaptersContainer(AMasterAdaptersContainer:IioDetailBindSourceAdaptersContainer);
    procedure SetMasterProperty(AMasterProperty: IioProperty);
    procedure SetBindSource(ANotifiableBindSource:IioNotifiableBindSource);
    function GetBindSource: IioNotifiableBindSource;
    function HasBindSource: boolean;
    procedure ExtractDetailObject(AMasterObj: TObject);
    procedure PersistCurrent;
    procedure PersistAll;
    function NewDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere:IioWhere): IioActiveBindSourceAdapter;
    function NewNaturalObjectBindSourceAdapter(const AOwner:TComponent): IioActiveBindSourceAdapter;
    function GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    function GetMasterBindSourceAdapter: IioActiveBindSourceAdapter;
    function DetailAdaptersContainer:IioDetailBindSourceAdaptersContainer;
    procedure Append(AObject:TObject); reintroduce; overload;
    procedure Append(AObject:IInterface); reintroduce; overload;
    procedure Insert(AObject:TObject); reintroduce; overload;
    procedure Insert(AObject:IInterface); reintroduce; overload;
    function Notify(const Sender: TObject; const [Ref] ANotification: TioBSNotification): Boolean;
    procedure Refresh(const AReloadData:Boolean; const ANotify:Boolean=True); reintroduce; overload;
    procedure LoadPage;
    function DataObject: TObject;
    procedure SetDataObject(const ADataObject:TObject; const AOwnsObject:Boolean=True); overload;
    procedure SetDataObject(const ADataObject:IInterface; const AOwnsObject:Boolean=False); overload;
    procedure ClearDataObject;
    function GetCurrentOID: Integer;

    function HasMasterBSA: Boolean;
    function IsInterfaceBSA: Boolean;
    function GetMasterPropertyName: String;
    function GetDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    procedure DeleteListViewItem(const AItemIndex:Integer; const ADelayMilliseconds:integer=100);
    function AsTBindSourceAdapter: TBindSourceAdapter;
    procedure ReceiveSelection(ASelected:TObject; ASelectionType:TioSelectionType); overload;
    procedure ReceiveSelection(ASelected:IInterface; ASelectionType:TioSelectionType); overload;
    function AsActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  end;

implementation

uses
  iORM, iORM.LiveBindings.Factory, iORM.Context.Interfaces, System.SysUtils, iORM.LazyLoad.Interfaces, iORM.Exceptions, iORM.Utilities,
  iORM.Context.Map.Interfaces, iORM.Where.Factory, iORM.LiveBindings.CommonBSAPersistence, iORM.Abstraction, iORM.Containers.Interfaces,
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
//  AddFieldsToList(LType, Self, Self.Fields, LIntf); // Original code
//  AddPropertiesToList(LType, Self, Self.Fields, LIntf); // Original code
  TioCommonBSABehavior.AddFields(LType, Self, LIntf, ''); // To support iORM nested fields on child objects
end;

procedure TioActiveListBindSourceAdapter.Append(AObject: IInterface);
begin
  raise EioException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for class referenced instances only.');
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

constructor TioActiveListBindSourceAdapter.Create(AClassRef: TioClassRef; AWhere: IioWhere; AOwner: TComponent; ADataObject: IInterface;
  AutoLoadData, AOwnsObject: Boolean);
var
  LDataObject: TObject;
begin
  LDataObject := ADataObject as TObject;
  inherited Create(AOwner, TList<TObject>(LDataObject), AClassRef, AOwnsObject);
  InternalCreate(AClassRef, AWhere, AOwner, AutoLoadData, AOwnsObject);
  FInterfacedList := ADataObject;  // To keep che interfaced list live
end;

constructor TioActiveListBindSourceAdapter.Create(AClassRef: TioClassRef;
  AWhere: IioWhere; AOwner: TComponent; ADataObject: TList<TObject>; AutoLoadData,
  AOwnsObject: Boolean);
begin
  inherited Create(AOwner, ADataObject, AClassRef, AOwnsObject);
  InternalCreate(AClassRef, AWhere, AOwner, AutoLoadData, AOwnsObject);
end;

procedure TioActiveListBindSourceAdapter.DeleteListViewItem(const AItemIndex:Integer; const ADelayMilliseconds:integer);
var
  LTimer: TioTimer;
begin
  LTimer := TioTimer.CreateNewTimer;
  LTimer.Enabled := False;
  LTimer.OnTimer := ListViewDeletingTimerEventHandler;
  LTimer.Interval := ADelayMilliseconds;
  LTimer.Tag := AItemIndex;
  LTimer.Enabled := True;
end;

destructor TioActiveListBindSourceAdapter.Destroy;
begin
  // Detach itself from MasterAdapterContainer (if it's contained)
  if Assigned(FMasterAdaptersContainer) then
    FMasterAdaptersContainer.RemoveBindSourceAdapter(Self);
  // Free the DetailAdaptersContainer
  FDetailAdaptersContainer.Free;
  inherited;
end;

function TioActiveListBindSourceAdapter.DetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
begin
  Result := FDetailAdaptersContainer;
end;

procedure TioActiveListBindSourceAdapter.DoBeforeCancel;
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

procedure TioActiveListBindSourceAdapter.DoAfterCancel;
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

procedure TioActiveListBindSourceAdapter.DoAfterPost;
begin
  inherited;
  // NB: Effettua da qui la chiamata per la persistenza (AutoPersist = true) solo se
  //      la proprietà "ioAutoPost" = false. In realtà non ci sarebbe nemmeno bisogno
  //      dell'if perchè ho notato che se ioAutoPost=true già non ci passerebbe di suo
  //      ma meglio andare sul sicuro.
  //      In pratica se ioAutoPost=true esegue l'auto persist (se abilitato) nel metodo
  //      DoAfterPostFields e alla modifica di ogni singola proprietà, se invece
  //      ioAutoPost=False invece esegue il persist nel metodo DoAfterPost.
  // NB: Mauri 03/03/2020 - Ho elininato la condizione perchè, come scritto anche sopra
  //      non necessaria in quanto già di suo passava in questo evento (o nell'altro)
  //      in maniera corretta. Inoltre facendo così e aggiungendo alla fine del metodo
  //      TioBSADataSet.SetFieldData una chiamata a InternalActiveAdapter.Post (se AutoPost = True)
  //      ho potuto dare anche un giusto comportamento del DataSet anche con Autopost = True
  //      (precedentemente invece in pratica con faceva mai il post)
//  if not Self.ioAutoPost then
    TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveListBindSourceAdapter.DoAfterPostFields(AFields: TArray<TBindSourceAdapterField>);
begin
  inherited;
  // NB: Effettua da qui la chiamata per la persistenza (AutoPersist = false) solo se
  //      la proprietà "ioAutoPost" = true. In realtà non ci sarebbe nemmeno bisogno
  //      dell'if perchè ho notato che se ioAutoPost=false già non ci passerebbe di suo
  //      ma meglio andare sul sicuro.
  //      In pratica se ioAutoPost=true esegue l'auto persist (se abilitato) nel metodo
  //      DoAfterPostFields e alla modifica di ogni singola proprietà, se invece
  //      ioAutoPost=False invece esegue il persist nel metodo DoAfterPost.
  // NB: Mauri 03/03/2020 - Ho elininato la condizione perchè, come scritto anche sopra
  //      non necessaria in quanto già di suo passava in questo evento (o nell'altro)
  //      in maniera corretta. Inoltre facendo così e aggiungendo alla fine del metodo
  //      TioBSADataSet.SetFieldData una chiamata a InternalActiveAdapter.Post (se AutoPost = True)
  //      ho potuto dare anche un giusto comportamento del DataSet anche con Autopost = True
  //      (precedentemente invece in pratica con faceva mai il post)
//  if not Self.ioAutoPost then
    TioCommonBSAPersistence.Post(Self);
end;

procedure TioActiveListBindSourceAdapter.DoAfterScroll;
begin
  inherited;
  FDetailAdaptersContainer.SetMasterObject(Current);
  // DataSet synchro
  GetDataSetLinkContainer.SetRecNo(ItemIndex);
  // Paging & ObjStateManager notification
  Notify(Tobject(Self), TioBSNotification.Create(TioBSNotificationType.ntScroll));
end;

procedure TioActiveListBindSourceAdapter.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoAfterSelection(ASelected, ASelectionType);
end;

procedure TioActiveListBindSourceAdapter.DoBeforeDelete;
begin
  inherited;
  TioCommonBSAPersistence.Delete(Self);
end;

procedure TioActiveListBindSourceAdapter.DoAfterDelete;
begin
  inherited;
  DoAfterScroll; // Mauri 11/01/2022: Aggiunto perchè altrimenti iin alcuni casi particolari dava errori
  TioCommonBSAPersistence.AfterDelete(Self);
end;

procedure TioActiveListBindSourceAdapter.DoBeforeEdit;
begin
  inherited;
  // ObjStateManager notification
  Notify(Tobject(Self), TioBSNotification.Create(TioBSNotificationType.ntSaveRevertPoint));
end;

procedure TioActiveListBindSourceAdapter.DoBeforeOpen;
begin
  inherited;
  TioCommonBSAPersistence.Load(Self);
end;

procedure TioActiveListBindSourceAdapter.Refresh(const AReloadData:Boolean; const ANotify:Boolean=True);
begin
  TioCommonBSAPersistence.Refresh(Self, AReloadData, ANotify);
end;

procedure TioActiveListBindSourceAdapter.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FBindSource) then
    FBindSource.DoBeforeSelection(ASelected, ASelectionType);
end;

procedure TioActiveListBindSourceAdapter.DoCreateInstance(out AHandled: Boolean;
  out AInstance: TObject);
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

procedure TioActiveListBindSourceAdapter.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType;
  var ADone: Boolean);
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
  //  then close the BSA
  if not Assigned(AMasterObj) then
  begin
    Self.InternalSetDataObject(nil, False);  // 2° parameter false ABSOLUTELY!!!!!!!
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
  //  NB: Assegnare direttamente anche i LazyLoadable come se fossero delle liste
  //       normali dava dei problemi (non dava errori ma non usciva nulla)
  if Supports(LDetailObj, IioLazyLoadable, LLazyLoadableObj) then
  begin
    LDetailObj := LLazyLoadableObj.GetInternalObject;
    Self.InternalSetDataObject(LDetailObj, False);  // 2° parameter false ABSOLUTELY!!!!!!!
  end
  else
  // else if it isn't a LazyLoadable list but the MasterProperty is an interface...
  if FMasterProperty.IsInterface then
  begin
    LDetailIntf := LValue.AsInterface;
    Self.InternalSetDataObject(LDetailIntf, False);  // 2° parameter false ABSOLUTELY!!!!!!!
  end
  // else it's a normal List object (not an interface)
  else
    Self.InternalSetDataObject(LDetailObj, False);  // 2° parameter false ABSOLUTELY!!!!!!!
end;

function TioActiveListBindSourceAdapter.GetAutoLoadData: Boolean;
begin
  Result := FAutoLoadData;
end;

function TioActiveListBindSourceAdapter.GetBaseObjectClassName: String;
begin
  Result := FTypeName;
end;

function TioActiveListBindSourceAdapter.GetBindSource: IioNotifiableBindSource;
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

function TioActiveListBindSourceAdapter.GetDetailBindSourceAdapterByMasterPropertyName(
  const AMasterPropertyName: String): IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.GetBindSourceAdapterByMasterPropertyName(AMasterPropertyName);
end;

function TioActiveListBindSourceAdapter.GetFields: TList<TBindSourceAdapterField>;
begin
  Result := Self.Fields;
end;

function TioActiveListBindSourceAdapter.GetIoAsync: Boolean;
begin
  Result := FAsync;
end;

function TioActiveListBindSourceAdapter.NewDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere:IioWhere): IioActiveBindSourceAdapter;
begin
//  Result := nil;
  // Return the requested DetailBindSourceAdapter and set the current master object
  Result := FDetailAdaptersContainer.NewBindSourceAdapter(AOwner, FTypeName, AMasterPropertyName, AWhere);
  FDetailAdaptersContainer.SetMasterObject(Self.Current);
end;

function TioActiveListBindSourceAdapter.GetioAutoPersist: Boolean;
begin
  Result := FAutoPersist;
end;

function TioActiveListBindSourceAdapter.GetioAutoPost: Boolean;
begin
  Result := Self.AutoPost;
end;

function TioActiveListBindSourceAdapter.GetIoViewDataType: TioViewDataType;
begin
  Result := VIEW_DATA_TYPE;
end;

function TioActiveListBindSourceAdapter.GetioWhere: IioWhere;
begin
  // Fill the WhereDetails from the DetailAdapters container if enabled
  //  NB: Create it if not assigned
  if FWhereDetailsFromDetailAdapters then
  begin
    if not Assigned(FWhere) then
      FWhere := TioWhereFactory.NewWhere;
    FDetailAdaptersContainer.FillWhereDetails(FWhere.Details);
  end;
  Result := FWhere;
end;

function TioActiveListBindSourceAdapter.GetioWhereDetailsFromDetailAdapters: Boolean;
begin
  Result := FWhereDetailsFromDetailAdapters;
end;

function TioActiveListBindSourceAdapter.GetItemIndex: Integer;
begin
  Result := inherited ItemIndex;
end;

function TioActiveListBindSourceAdapter.GetItems(
  const AIndex: Integer): TObject;
begin
  Result := Self.List.Items[AIndex] as TObject;
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

function TioActiveListBindSourceAdapter.GetOwnsObjects: Boolean;
begin
  Result := FLocalOwnsObject;
end;

function TioActiveListBindSourceAdapter.GetRefreshing: boolean;
begin
  Result := FRefreshing;
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

function TioActiveListBindSourceAdapter.NewNaturalObjectBindSourceAdapter(const AOwner:TComponent): IioActiveBindSourceAdapter;
begin
  Result := TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(AOwner, Self);
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
  raise EioException.Create(Self.ClassName, 'Append', 'This ActiveBindSourceAdapter is for class referenced instances only.');
end;

constructor TioActiveListBindSourceAdapter.InternalCreate(AClassRef: TioClassRef; AWhere: IioWhere; AOwner: TComponent; AutoLoadData,
  AOwnsObject: Boolean);
begin
  FInterfacedList := nil;
  FAutoLoadData := AutoLoadData;
  FAsync := False;
  FAutoPersist := True;
  FRefreshing := False;
  FBSPersistenceDeleting := False;
//  inherited Create(AOwner, ADataObject, AClassRef, AOwnsObject);
  FLocalOwnsObject := AOwnsObject;
  FWhere := AWhere;
  FWhereDetailsFromDetailAdapters := False;
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

function TioActiveListBindSourceAdapter.HasBindSource: boolean;
begin
  Result := Assigned(FBindSource);
end;

function TioActiveListBindSourceAdapter.HasMasterBSA: Boolean;
begin
  Result := Assigned(FMasterProperty);
end;

function TioActiveListBindSourceAdapter.IsInterfaceBSA: Boolean;
begin
  Result := False;
end;

procedure TioActiveListBindSourceAdapter.ListViewDeletingTimerEventHandler(
  Sender: TObject);
var
  LTimer: TioTimer;
  CurrItemIndex: Integer;
begin
  LTimer := (Sender as TioTimer);
  LTimer.Enabled := False;
  // Delayed deletion of the current object for ListView
  CurrItemIndex := ItemIndex;
  try
    ItemIndex := LTimer.Tag;
    Delete;
  finally
    ItemIndex := CurrItemIndex;
    Sender.Free;
  end;
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
  Result := TioCommonBSABehavior.Notify(Sender, Self, ANotification);
end;

procedure TioActiveListBindSourceAdapter.PersistAll;
begin
  TioCommonBSAPersistence.PersistAll(Self);
end;

procedure TioActiveListBindSourceAdapter.PersistCurrent;
begin
  TioCommonBSAPersistence.PersistCurrent(Self);
end;

function TioActiveListBindSourceAdapter.QueryInterface(const IID: TGUID;
  out Obj): HResult;
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
  LDone := False;
  DoBeforeSelection(ASelected, ASelectionType);
  DoSelection(ASelected, ASelectionType, LDone);
  if not LDone then
    case ASelectionType of
      TioSelectionType.stAppend: Self.Append(ASelected);
      TioSelectionType.stInsert: Self.Insert(ASelected);
    end;
  DoAfterSelection(ASelected, ASelectionType);
end;

procedure TioActiveListBindSourceAdapter.ReceiveSelection(ASelected: IInterface; ASelectionType: TioSelectionType);
begin
  // Questo ActiveBindSourceAdapter funziona solo con gli oggetti (no interfacce)
  //  quindi chiama l'altra versione di metodo più adatta. IN questo modo
  //  è possibile gestire la selezione anche se il selettore non è concorde
  ReceiveSelection(ASelected as TObject, ASelectionType);
end;

procedure TioActiveListBindSourceAdapter.SetAutoLoadData(const Value: Boolean);
begin
  FAutoLoadData := Value;
end;

procedure TioActiveListBindSourceAdapter.SetBindSource(ANotifiableBindSource:IioNotifiableBindSource);
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

procedure TioActiveListBindSourceAdapter.InternalSetDataObject(const ADataObject: TObject; const AOwnsObject:Boolean);
begin
  Self._InternalSetDataObject<TObject>(ADataObject, AOwnsObject);
end;

procedure TioActiveListBindSourceAdapter.SetIoAsync(const Value: Boolean);
begin
  FAsync := Value;
end;

procedure TioActiveListBindSourceAdapter.SetioAutoPersist(const Value: Boolean);
begin
  FAutoPersist := Value;
end;

procedure TioActiveListBindSourceAdapter.SetioAutoPost(const Value: Boolean);
begin
  Self.AutoPost := Value;
end;

procedure TioActiveListBindSourceAdapter.SetIoWhere(const Value: IioWhere);
begin
  FWhere := Value;
end;

procedure TioActiveListBindSourceAdapter.SetioWhereDetailsFromDetailAdapters(
  const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
end;

procedure TioActiveListBindSourceAdapter.SetItemIndex(const Value: Integer);
begin
  inherited ItemIndex := Value;
end;

procedure TioActiveListBindSourceAdapter.SetItems(const AIndex: Integer;
  const Value: TObject);
begin
  Self.List.Items[AIndex] := Value;
end;

procedure TioActiveListBindSourceAdapter.SetMasterAdaptersContainer(
  AMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer);
begin
  FMasterAdaptersContainer := AMasterAdaptersContainer;
end;

procedure TioActiveListBindSourceAdapter.SetMasterProperty(
  AMasterProperty: IioProperty);
begin
  FMasterProperty := AMasterProperty;
end;

procedure TioActiveListBindSourceAdapter.SetObjStatus(
  AObjStatus: TioObjStatus);
begin
  TioContextFactory.Context(Self.Current.ClassName, nil, Self.Current).ObjStatus := AObjStatus;
end;

procedure TioActiveListBindSourceAdapter.SetRefreshing(const Value: boolean);
begin
  FRefreshing := Value;
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
  //  in the unit "iORM.LiveBindings.CommonBSABehavior" with relative changes also in the ActivebindSourceAdapters
  Result := False;
end;

function TioActiveListBindSourceAdapter.UseObjStatus: Boolean;
begin
  Result := TioContextFactory.Context(Self.Current.ClassName, nil, Self.Current).ObjStatusExist;
end;

function TioActiveListBindSourceAdapter._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

procedure TioActiveListBindSourceAdapter._InternalSetDataObject<T>(const ADataObject: TObject; const AOwnsObject: Boolean);
var
  LPrecAutoLoadData: Boolean;
begin
  // Init
  Self.FInterfacedList := nil;
  // Disable the adapter
  Self.First;  // Bug
  Self.Active := False;
  // AObj is assigned then set it as DataObject
  //  else set DataObject to nil and set MasterObject to nil
  //  to disable all Details adapters also
  if Assigned(ADataObject) then
  begin
    // Set the provided DataObject (always as TList<IInterface>)
    Self.SetList(TList<TObject>(ADataObject), AOwnsObject);
    // If the DataObject (List) is an interface referenced object then
    //  set the FInterfacedList field to it to keep alive the list itself
    if TioUtilities.IsAnInterface<T> then
      Supports(ADataObject, IInterface, Self.FInterfacedList);
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
    Self.SetList(nil, AOwnsObject);
    Self.FDetailAdaptersContainer.SetMasterObject(nil);
  end;
  // DataSet synchro
  Self.GetDataSetLinkContainer.Refresh;

  // -------------------------------------------------------------------------------------------------------
  // If is a LazyLoadable list then set the internal List
  //  NB: Assegnare direttamente anche i LazyLoadable come se fossero delle liste
  //       normali dava dei problemi (non dava errori ma non usciva nulla)
//  if Supports(AObj, IioLazyLoadable, ALazyLoadableObj)
//    then AObj := TList<TObject>(ALazyLoadableObj.GetInternalObject);
//  Self.SetList(AObj as TList<IInterface>, False);  // NB: AOwns (2° parameters) = False ABSOLUTELY!!!!!!
//// -------------------------------------------------------------------------------------------------------
end;

function TioActiveListBindSourceAdapter._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
  Result := -1;
end;

end.
