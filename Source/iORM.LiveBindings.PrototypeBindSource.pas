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



unit iORM.LiveBindings.PrototypeBindSource;

interface

uses
  Data.Bind.ObjectScope, iORM.LiveBindings.Interfaces, iORM.CommonTypes,
  System.Classes, iORM.LiveBindings.Notification, iORM.Where.Interfaces;

type

  TioPrototypeBindSource = class;

  TioMasterBindSource = TioPrototypeBindSource;

  TioPrototypeBindSource = class (TPrototypeBindSource, IioNotifiableBindSource)
  private
    FioTypeName: String;
    FioTypeAlias: String;
    FioAutoLoadData: Boolean;
    FioAsync: Boolean;
    FioAutoPersist: Boolean;
    FioViewDataType: TioViewDataType;
    FioMasterBindSource: TioMasterBindSource;
    FioMasterPropertyName: String;
    FioWhereStr: TStrings;
    FioWhereDetailsFromDetailAdapters: Boolean;
    FioOrderBy: String;
    FioAutoRefreshOnNotification: TioAutoRefreshType;
    FonNotify: TioBSANotificationEvent;
    FAutoPost: Boolean;
    FSelectorFor: TioPrototypeBindSource;
    // FioLoaded flag for iORM DoCreateAdapter internal use only just before
    //  the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
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
    //  because is not implementing IInterface (NB: RefCount DISABLED)
    function QueryInterface(const IID: TGUID; out Obj): HResult; reintroduce; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
{$IFDEF AUTOREFCOUNT}
    function __ObjAddRef: Integer; override;
    function __ObjRelease: Integer; override;
{$ENDIF}
    // =========================================================================
    procedure DoCreateAdapter(var ADataObject: TBindSourceAdapter); override;
    procedure Loaded; override;
    procedure DoNotify(ANotification:IioBSANotification);
    procedure WhereOnChangeEventHandler(Sender:TObject);
    // TypeName
    procedure SetTypeName(const Value: String);
    // TypeAlias
    procedure SetTypeAlias(const Value: String);
    // ioWhereStr
    procedure SetWhereStr(const Value: TStrings);
    // ioWhere property
    procedure SetWhere(const Value: IioWhere);
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
  protected
    function CheckActiveAdapter: Boolean;
    // Selectors related event for TObject selection
    procedure DoBeforeSelection(var ASelected:TObject; var ASelectionType:TioSelectionType); overload;
    procedure DoSelection(var ASelected:TObject; var ASelectionType:TioSelectionType; var ADone:Boolean); overload;
    procedure DoAfterSelection(var ASelected:TObject; var ASelectionType:TioSelectionType); overload;
    // Selectors related event for IInterface selection
    procedure DoBeforeSelection(var ASelected:IInterface; var ASelectionType:TioSelectionType); overload;
    procedure DoSelection(var ASelected:IInterface; var ASelectionType:TioSelectionType; var ADone:Boolean); overload;
    procedure DoAfterSelection(var ASelected:IInterface; var ASelectionType:TioSelectionType); overload;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Notify(const Sender:TObject; const ANotification:IioBSANotification);
    procedure DeleteListViewItem(const AItemIndex:Integer; const ADelayMilliseconds:integer=100);
    procedure PostIfEditing;
    procedure CancelIfEditing;
    // ----------------------------------------------------------------------------------------------------------------------------
    // BindSourceAdapter methods/properties published by TioPrototypeBindSource also
    function Current: TObject;
    function CurrentAs<T>: T;
    function CurrentMasterObject: TObject;
    function CurrentMasterObjectAs<T>: T;
    procedure Refresh(ReloadData:Boolean); reintroduce; overload;
    procedure PersistCurrent;
    procedure PersistAll;
    procedure Append; overload;
    procedure Append(AObject:TObject); overload;
    procedure Append(AObject:IInterface); overload;
    procedure Insert(AObject:TObject); reintroduce; overload;
    procedure Insert(AObject:IInterface); reintroduce; overload;
    function DataObjectAssigned: Boolean;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    procedure SetDataObject(const ADataObject:TObject; const AOwnsObject:Boolean=True); overload;
    procedure SetDataObject(const ADataObject:IInterface; const AOwnsObject:Boolean=False); overload;
    procedure ClearDataObject;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere: IioWhere = nil): TBindSourceAdapter;
    function GetNaturalObjectBindSourceAdapter(const AOwner:TComponent): TBindSourceAdapter;
    procedure Select<T>(AInstance:T; ASelectionType:TioSelectionType=TioSelectionType.stAppend);
    procedure SelectCurrent<T>(ASelectionType: TioSelectionType);
    // ----------------------------------------------------------------------------------------------------------------------------
    // Properties
    property ioWhere:IioWhere read GetWhere write SetWhere;
    property State: TBindSourceAdapterState read GetState;
    property ItemCount: Integer read GetCount;
    property IsDetail:Boolean read GetIsDetail;
    property IsInterfacePresenting:Boolean read GetIsInterfacePresenting;
  published
    // Events
    property ioOnNotify:TioBSANotificationEvent read FonNotify write FonNotify;
    property ioOnBeforeSelectionObject:TioBSABeforeAfterSelectionObjectEvent read FonBeforeSelectionObject write FonBeforeSelectionObject;
    property ioOnSelectionObject:TioBSASelectionObjectEvent read FonSelectionObject write FonSelectionObject;
    property ioOnAfterSelectionObject:TioBSABeforeAfterSelectionObjectEvent read FonAfterSelectionObject write FonAfterSelectionObject;
    property ioOnBeforeSelectionInterface:TioBSABeforeAfterSelectionInterfaceEvent read FonBeforeSelectionInterface write FonBeforeSelectionInterface;
    property ioOnSelectionInterface:TioBSASelectionInterfaceEvent read FonSelectionInterface write FonSelectionInterface;
    property ioOnAfterSelectionInterface:TioBSABeforeAfterSelectionInterfaceEvent read FonAfterSelectionInterface write FonAfterSelectionInterface;
    // Properties
    property ioTypeName:String read FioTypeName write SetTypeName;
    property ioTypeAlias:String read FioTypeAlias write SetTypeAlias;
    property ioAsync:Boolean read FioAsync write SetAsync;
    property ioAutoLoadData:Boolean read FioAutoLoadData write SetAutoLoadData;
    property ioAutoPersist:Boolean read FioAutoPersist write SetAutoPersist;
    property ioViewDataType:TioViewDataType read FioViewDataType write FioViewDataType;
    property ioWhereStr:TStrings read FioWhereStr write SetWhereStr;
    property ioWhereDetailsFromDetailAdapters: Boolean read FioWhereDetailsFromDetailAdapters write SetWhereDetailsFromDetailAdapters;
    property ioOrderBy:String read FioOrderBy Write SetOrderBy;
    property ioMasterBindSource:TioMasterBindSource read FIoMasterBindSource write FIoMasterBindSource;
    property ioMasterPropertyName:String read FIoMasterPropertyName write FIoMasterPropertyName;
    property ioAutoRefreshOnNotification:TioAutoRefreshType read FioAutoRefreshOnNotification write FioAutoRefreshOnNotification;
    property AutoPost: Boolean read GetAutoPost write SetAutoPost;
    property ioSelectorFor: TioPrototypeBindSource read FSelectorFor write FSelectorFor;
  end;

implementation

uses
  System.SysUtils, iORM.Exceptions, iORM.LiveBindings.Factory,
  iORM.Where.Factory, iORM.Rtti.Utilities, iORM.Components.Common, System.Rtti;

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

procedure TioPrototypeBindSource.Append;
begin
  if CheckAdapter then
    GetInternalAdapter.Append;
end;

procedure TioPrototypeBindSource.Append(AObject: TObject);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Append(AObject);
// NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
//      il fatto che lo stato del componente passava subito a "Browse" perchè veniva
//      invocato un Post in seguito al Refresh stesso.
//    AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
end;

procedure TioPrototypeBindSource.Append(AObject: IInterface);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Append(AObject);
// NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
//      il fatto che lo stato del componente passava subito a "Browse" perchè veniva
//      invocato un Post in seguito al Refresh stesso.
//    AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
end;

procedure TioPrototypeBindSource.CancelIfEditing;
begin
  if Editing then
    Self.Cancel;
end;

function TioPrototypeBindSource.CheckActiveAdapter: Boolean;
begin
//  Result := (not (csDesigning in ComponentState))
//    and CheckAdapter
//    and Supports(GetInternalAdapter, IioActiveBindSourceAdapter);
  Result := CheckAdapter and Supports(GetInternalAdapter, IioActiveBindSourceAdapter);
end;

procedure TioPrototypeBindSource.ClearDataObject;
begin
  Self.GetActiveBindSourceAdapter.ClearDataObject;
end;

constructor TioPrototypeBindSource.Create(AOwner: TComponent);
begin
  inherited;
  FAutoPost := False;
  FioLoaded := False;
  FioAutoRefreshOnNotification := arEnabledNoReload;
  FioAsync := False;
  FioAutoLoadData := True;
  FioAutoPersist := True;
  FioViewDataType := dtList;
  FSelectorFor := nil;
  // Set even an onChange event handler
  FioWhereDetailsFromDetailAdapters := False;
  FioWhereStr := TStringList.Create;
  SetWhereStr(FioWhereStr);  // set TStringList.onChange event handler
end;

procedure TioPrototypeBindSource.DeleteListViewItem(const AItemIndex,
  ADelayMilliseconds: integer);
begin
  GetActiveBindSourceAdapter.DeleteListViewItem(AItemIndex, ADelayMilliseconds);
end;

destructor TioPrototypeBindSource.Destroy;
begin
  FioWhereStr.Free;
  inherited;
end;

procedure TioPrototypeBindSource.DoAfterSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionObject) then
    FonAfterSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioPrototypeBindSource.DoAfterSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonAfterSelectionObject) then
    FonAfterSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioPrototypeBindSource.DoBeforeSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionObject) then
    FonBeforeSelectionInterface(Self, ASelected, ASelectionType);
end;

procedure TioPrototypeBindSource.DoBeforeSelection(var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  if Assigned(FonBeforeSelectionObject) then
    FonBeforeSelectionObject(Self, ASelected, ASelectionType);
end;

procedure TioPrototypeBindSource.DoCreateAdapter(
  var ADataObject: TBindSourceAdapter);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Inherited
  inherited;
  // If in DesignTime then Exit
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  //  the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  if (csDesigning in ComponentState)
  or (not FioLoaded)
    then Exit;
  // -------------------------------------------------------------------------------------------------------------------------------
  // If AdataObject is NOT already assigned (by onCreateAdapter event handler) then
  //  retrieve a BindSourceAdapter automagically by iORM
  if (not Assigned(ADataObject)) and not ioTypeName.IsEmpty then
  begin
    // If this is a detail BindSource then retrieve the adapter from the master BindSource
    //  else get the adapter directly from iORM
    if Assigned(Self.ioMasterBindSource) then
      ADataObject := TioLiveBindingsFactory.GetBSAfromMasterBindSource(Self, Self.FioMasterBindSource, Self.ioMasterPropertyName, TioWhereFactory.NewWhere.Add(ioWhereStr.Text)._OrderBy(FioOrderBy))
    else
      ADataObject := TioLiveBindingsFactory.GetBSA(Self, FioTypeName, FioTypeAlias, TioWhereFactory.NewWhere.Add(ioWhereStr.Text)._OrderBy(FioOrderBy), FioViewDataType, FioAutoLoadData, nil, True) as TBindSourceAdapter;
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
  // If Self is a Notifiable bind source then register a reference to itself
  //  in the ActiveBindSourceAdapter
  //  PS: Set ioAsync also (and other properties)
  if  Assigned(ADataObject)
  and Supports(ADataObject, IioActiveBindSourceAdapter, LActiveBSA)
  and Supports(Self, IioNotifiableBindSource)
  then
  begin
    LActiveBSA.ioAutoPost := FAutoPost;
    LActiveBSA.ioAsync := FioAsync;
    LActiveBSA.ioWhereDetailsFromDetailAdapters := FioWhereDetailsFromDetailAdapters;
    LActiveBSA.ioAutoPersist := FioAutoPersist;
    LActiveBSA.SetBindSource(Self);
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
end;

procedure TioPrototypeBindSource.DoNotify(ANotification:IioBSANotification);
begin
  // If assigned execute the event handler
  if Assigned(FonNotify)
    then ioOnNotify(Self, ANotification);
  // If enabled perform an AutoRefresh operation
  if Self.ioAutoRefreshOnNotification > arDisabled
    then Self.Refresh(Self.ioAutoRefreshOnNotification = arEnabledReload);
end;

procedure TioPrototypeBindSource.DoSelection(var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonAfterSelectionObject) then
    FonSelectionObject(Self, ASelected, ASelectionType, ADone);
end;

procedure TioPrototypeBindSource.DoSelection(var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Assigned(FonAfterSelectionObject) then
    FonSelectionInterface(Self, ASelected, ASelectionType, ADone);
end;

function TioPrototypeBindSource.Current: TObject;
begin
  Result := nil;
  if CheckAdapter then
    Result := Self.InternalAdapter.Current;
end;

function TioPrototypeBindSource.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioRttiUtilities.CastObjectToGeneric<T>(LCurrent);
end;

function TioPrototypeBindSource.CurrentMasterObject: TObject;
begin
  if CheckAdapter and IsDetail then
    Result := Self.GetActivebindSourceAdapter.GetMasterBindSourceAdapter.Current
  else
    Result := nil;
end;

function TioPrototypeBindSource.CurrentMasterObjectAs<T>: T;
var
  LMasterObject: TObject;
begin
  LMasterObject := Self.CurrentMasterObject;
  Result := TioRttiUtilities.CastObjectToGeneric<T>(LMasterObject);
end;

function TioPrototypeBindSource.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  Supports(Self.InternalAdapter, IioActiveBindSourceAdapter, Result);
end;

function TioPrototypeBindSource.GetAutoPost: Boolean;
begin
  if CheckAdapter then
    Result := Self.InternalAdapter.AutoPost
  else
    Result := FAutoPost;
end;

function TioPrototypeBindSource.GetCount: Integer;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioPrototypeBindSource.DataObject: TObject;
begin
  Result := Self.GetActiveBindSourceAdapter.DataObject;
end;

function TioPrototypeBindSource.DataObjectAs<T>: T;
var
  LObj: TObject;
begin
  LObj := Self.DataObject;
  Result := TioRttiUtilities.CastObjectToGeneric<T>(LObj);
end;

function TioPrototypeBindSource.DataObjectAssigned: Boolean;
begin
  if CheckActiveAdapter then
    Result := Assigned(Self.GetActiveBindSourceAdapter.DataObject)
  else
    Result := False;
end;

function TioPrototypeBindSource.GetDetailBindSourceAdapter(
  const AOwner: TComponent; const AMasterPropertyName: String;
  const AWhere: IioWhere): TBindSourceAdapter;
var
  AContainedBSA: IioContainedBindSourceAdapter;
begin
  Result := nil;
  if Supports(Self.InternalAdapter, IioContainedBindSourceAdapter, AContainedBSA) then
    Result := AContainedBSA.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere);
end;

function TioPrototypeBindSource.GetWhere: IioWhere;
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    Result := LActiveBSA.ioWhere
  else
    Result := nil;
end;

procedure TioPrototypeBindSource.Insert(AObject: IInterface);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Insert(AObject);
// NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
//      il fatto che lo stato del componente passava subito a "Browse" perchè veniva
//      invocato un Post in seguito al Refresh stesso.
//    AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
end;

procedure TioPrototypeBindSource.Insert(AObject: TObject);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Insert(AObject);
// NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
//      il fatto che lo stato del componente passava subito a "Browse" perchè veniva
//      invocato un Post in seguito al Refresh stesso.
//    AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
end;

function TioPrototypeBindSource.GetIsDetail: Boolean;
begin
  Result := Assigned(FioMasterBindSource);
end;

function TioPrototypeBindSource.GetIsInterfacePresenting: Boolean;
begin
  if CheckAdapter then
   Result := GetActiveBindSourceAdapter.IsInterfaceBSA
  else
   Result := TioRttiUtilities.IsAnInterfaceTypeName(ioTypeName);
end;

function TioPrototypeBindSource.GetNaturalObjectBindSourceAdapter(
  const AOwner: TComponent): TBindSourceAdapter;
begin
  Result := (Self.InternalAdapter as IioNaturalBindSourceAdapterSource).NewNaturalObjectBindSourceAdapter(AOwner);
end;

function TioPrototypeBindSource.GetState: TBindSourceAdapterState;
begin
  if CheckActiveAdapter then
    Result := GetActiveBindSourceAdapter.State
  else
    Result := TBindSourceAdapterState.seInactive
end;

procedure TioPrototypeBindSource.Loaded;
var
  LAdapter: TBindSourceAdapter;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not (csDesigning in ComponentState) then
    TioComponentsCommon.RegisterConnectionDefComponents(Owner);
  // ===========================================================================

  // DOCREATEADAPTER CALL MUST BE BEFORE THE INHERITED LINE !!!!!!
  // ===========================================================================
  // FioLoaded flag for iORM DoCreateAdapter internal use only just before
  //  the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
  // ---------------------------------------------------------------------------
  FioLoaded := True;
  if not Assigned(Self.OnCreateAdapter) then
  begin
    Self.DoCreateAdapter(LAdapter);
    if LAdapter <> nil then
      SetRuntimeAdapter(LAdapter);
  end;
  // ===========================================================================

  // INHERITED MUST BE AFTER THE DOCREATEADAPTER CALL !!!!!!
  inherited;
end;

procedure TioPrototypeBindSource.Notify(const Sender: TObject;
  const ANotification: IioBSANotification);
begin
  Self.DoNotify(ANotification);
end;

procedure TioPrototypeBindSource.PersistAll;
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.PersistAll;
end;

procedure TioPrototypeBindSource.PersistCurrent;
begin
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.PersistCurrent;
end;

procedure TioPrototypeBindSource.PostIfEditing;
begin
  if Editing then
    Self.Post;
end;

function TioPrototypeBindSource.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioPrototypeBindSource.Refresh(ReloadData: Boolean);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if not CheckAdapter then Exit;
  if Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
    AnActiveBSA.Refresh(ReloadData)
  else
    GetInternalAdapter.Refresh;
end;

procedure TioPrototypeBindSource.Select<T>(AInstance: T; ASelectionType: TioSelectionType);
var
  LDestBSA: IioActiveBindSourceAdapter;
  LValue: TValue;
begin
  // Some checks
  if not Assigned(FSelectorFor) then
    raise EioException.Create(Self.ClassName, 'MakeSelection', '"SelectorFor" property not assigned.');
  if not FSelectorFor.CheckAdapter then
    raise EioException.Create(Self.ClassName, 'MakeSelection', 'Selection destination ActiveBindSourceAdapter, non present.');
  // Get the selection destination BindSourceAdapter
  LDestBSA := FSelectorFor.GetActiveBindSourceAdapter;
  // Encapsulate the SelectedInstance into a TValue then assign it
  //  as selection in a proper way
  //  NB: Lasciare assolutamente così perchè ho già provato in vari modi ma mi dava sempre un errore
  //       facendo cos' invece (cioè passando per un TValue) funziona correttamente.
  LValue := TValue.From<T>(AInstance);
  if LValue.Kind = TTypeKind.tkInterface then
    LDestBSA.ReceiveSelection(LValue.AsInterface, ASelectionType)
  else
  if LValue.Kind = TTypeKind.tkClass then
    LDestBSA.ReceiveSelection(LValue.AsObject, ASelectionType)
  else
    raise EioException.Create(Self.ClassName, 'Select<T>', 'Wrong LValue kind.');
end;

procedure TioPrototypeBindSource.SelectCurrent<T>(ASelectionType: TioSelectionType);
begin
  // Some checks
  if not CheckAdapter then
    raise EioException.Create(Self.ClassName, 'MakeSelection', 'ActiveBindSourceAdapter, non present.');
  // Make the selection of current
  Select<T>(CurrentAs<T>, ASelectionType);
end;

procedure TioPrototypeBindSource.SetAsync(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioAsync := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAsync := Value;
end;

procedure TioPrototypeBindSource.SetAutoLoadData(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioAutoLoadData := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAutoLoadData := Value;
end;

procedure TioPrototypeBindSource.SetAutoPersist(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioAutoPersist := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAutoPersist := Value;
end;

procedure TioPrototypeBindSource.SetAutoPost(const Value: Boolean);
begin
  FAutoPost := Value;
  // Update the adapter
  if CheckAdapter then
    Self.InternalAdapter.AutoPost := Value;
end;

procedure TioPrototypeBindSource.SetDataObject(const ADataObject: IInterface; const AOwnsObject: Boolean);
begin
// NB: Lasciare commentate le righe qua sotto perchè altrimenti quando
//      si faceva un SetDataObject dava un errore perchè la funzione
//      CheckActiveAdapter restituiva sempre False perchè non avendo il DataObject
//      assegnato (se prima avevo chiamato il  ClearDataObject
//  if CheckActiveAdapter then
    Self.GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
//  else
//    raise EioException.Create(Self.ClassName + ': invalid internal adapter.');
end;

procedure TioPrototypeBindSource.SetDataObject(const ADataObject: TObject; const AOwnsObject: Boolean);
begin
// NB: Lasciare commentate le righe qua sotto perchè altrimenti quando
//      si faceva un SetDataObject dava un errore perchè la funzione
//      CheckActiveAdapter restituiva sempre False perchè non avendo il DataObject
//      assegnato (se prima avevo chiamato il  ClearDataObject
//  if CheckActiveAdapter then
    Self.GetActiveBindSourceAdapter.SetDataObject(ADataObject, AOwnsObject)
//  else
//    raise EioException.Create(Self.ClassName + ': invalid internal adapter.');
end;

procedure TioPrototypeBindSource.SetWhere(const Value: IioWhere);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Update the adapter where
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioWhere := Value;
end;

procedure TioPrototypeBindSource.SetWhereStr(const Value: TStrings);
begin
  FioWhereStr.Assign(Value);
  // If in DesignTime then Exit
  //  NB: Mettendo questa linea di codice ho risolto il problema che i ioPBS
  //       anche se erano con "AutoActivate=False" quando veniva aperta (caricata)
  //       la form che li conteneva a design time apparivano cmq con i dati finti di
  //       prova anzichè rimanere vuoti.
  if (csDesigning in ComponentState) then
    Exit;
  // Set the onChange event handler
  (FioWhereStr as TStringList).OnChange := WhereOnChangeEventHandler;
  // Update the adapter where property
  WhereOnChangeEventHandler(Self);
end;

procedure TioPrototypeBindSource.SetOrderBy(const Value: String);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioOrderBy := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioWhere.SetOrderBySql(Value);
end;

procedure TioPrototypeBindSource.SetTypeAlias(const Value: String);
begin
  FioTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.ioTypeAlias := Value;
end;

procedure TioPrototypeBindSource.SetTypeName(const Value: String);
begin
  FioTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckActiveAdapter then
    GetActiveBindSourceAdapter.ioTypeName := Value;
end;

procedure TioPrototypeBindSource.SetWhereDetailsFromDetailAdapters(
  const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckActiveAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioWhereDetailsFromDetailAdapters := Value;
end;

procedure TioPrototypeBindSource.WhereOnChangeEventHandler(Sender: TObject);
begin
  Self.SetWhere(TioWhereFactory.NewWhere.Add(Self.FioWhereStr.Text));
end;

function TioPrototypeBindSource._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
end;

function TioPrototypeBindSource._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
end;

end.
