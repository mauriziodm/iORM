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
    // FioLoaded flag for iORM DoCreateAdapter internal use only just before
    //  the real Loaded is call. See the Loaded and the DoCreateAdapter methods.
    FioLoaded: Boolean;
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
    property IsDetail:Boolean read GetIsDetail;
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
  protected
    function CheckAdapter: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Notify(const Sender:TObject; const ANotification:IioBSANotification);
    // ----------------------------------------------------------------------------------------------------------------------------
    // BindSourceAdapter methods/properties published by TioPrototypeBindSource also
    function Current: TObject;
    function CurrentAs<T>: T;
    procedure Refresh(ReloadData:Boolean); overload;
    procedure Persist(ReloadData:Boolean=False);
    procedure Append; overload;
    procedure Append(AObject:TObject); overload;
    procedure Insert(AObject:TObject); overload;
    function DataObjectAssigned: Boolean;
    function DataObject: TObject;
    function DataObjectAs<T>: T;
    procedure SetDataObject(const AObj: TObject; const AOwnsObject:Boolean=True);
    procedure ClearDataObject;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere: IioWhere = nil): TBindSourceAdapter;
    function GetNaturalObjectBindSourceAdapter(const AOwner:TComponent): TBindSourceAdapter;
    // ----------------------------------------------------------------------------------------------------------------------------
    // Properties
    property ioWhere:IioWhere read GetWhere write SetWhere;
    property State: TBindSourceAdapterState read GetState;
    property ItemCount: Integer read GetCount;
  published
    // Events
    property ioOnNotify:TioBSANotificationEvent read FonNotify write FonNotify;
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
  end;

implementation

uses
  System.SysUtils, iORM.Exceptions, iORM.LiveBindings.Factory,
  iORM.Where.Factory, iORM.Rtti.Utilities, iORM.Components.Common;

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
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Append(AObject);
    AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
end;

function TioPrototypeBindSource.CheckAdapter: Boolean;
begin
  Result := Inherited and Supports(GetInternalAdapter, IioActiveBindSourceAdapter);
end;

procedure TioPrototypeBindSource.ClearDataObject;
begin
  Self.GetActiveBindSourceAdapter.ClearDataObject;
end;

constructor TioPrototypeBindSource.Create(AOwner: TComponent);
begin
  inherited;
  FioLoaded := False;
  FioAutoRefreshOnNotification := arEnabledNoReload;
  FioAsync := False;
  FioAutoLoadData := True;
  FioAutoPersist := True;
  FioViewDataType := dtList;
  // Set even an onChange event handler
  FioWhereDetailsFromDetailAdapters := False;
  FioWhereStr := TStringList.Create;
  SetWhereStr(FioWhereStr);  // set TStringList.onChange event handler
end;

destructor TioPrototypeBindSource.Destroy;
begin
  FioWhereStr.Free;
  inherited;
end;

procedure TioPrototypeBindSource.DoCreateAdapter(
  var ADataObject: TBindSourceAdapter);
var
  AActiveBSA: IioActiveBindSourceAdapter;
begin
  // Inherited
  inherited;
  // Init
  AActiveBSA  := nil;
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
      ADataObject := TioLiveBindingsFactory.GetBSAfromDB(Self, FioTypeName, FioTypeAlias, TioWhereFactory.NewWhere.Add(ioWhereStr.Text)._OrderBy(FioOrderBy), FioViewDataType, FioAutoLoadData);
  end;
  // -------------------------------------------------------------------------------------------------------------------------------
  // If Self is a Notifiable bind source then register a reference to itself
  //  in the ActiveBindSourceAdapter
  //  PS: Set ioAsync also
  if  Assigned(ADataObject)
  and Supports(ADataObject, IioActiveBindSourceAdapter, AActiveBSA)
  and Supports(Self, IioNotifiableBindSource)
  then
  begin
    AActiveBSA.ioAsync := FioAsync;
    AActiveBSA.ioWhereDetailsFromDetailAdapters := FioWhereDetailsFromDetailAdapters;
    AActiveBSA.ioAutoPersist := FioAutoPersist;
    AActiveBSA.SetBindSource(Self);
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

function TioPrototypeBindSource.Current: TObject;
begin
  Result := nil;
  if not CheckAdapter then Exit;
  Result := Self.InternalAdapter.Current
end;

function TioPrototypeBindSource.CurrentAs<T>: T;
var
  LCurrent: TObject;
begin
  LCurrent := Self.Current;
  Result := TioRttiUtilities.CastObjectToGeneric<T>(LCurrent);
end;

function TioPrototypeBindSource.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  Supports(Self.InternalAdapter, IioActiveBindSourceAdapter, Result);
end;

function TioPrototypeBindSource.GetCount: Integer;
begin
  if CheckAdapter then
    Result := GetActiveBindSourceAdapter.ItemCount
  else
    Result := 0;
end;

function TioPrototypeBindSource.DataObject: TObject;
begin
  Result := nil;
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
  if CheckAdapter then
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
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    Result := LActiveBSA.ioWhere
  else
    Result := nil;
end;

procedure TioPrototypeBindSource.Insert(AObject: TObject);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
begin
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, AnActiveBSA) then
  begin
    AnActiveBSA.Insert(AObject);
    AnActiveBSA.Refresh(False);
  end
  else
    raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
end;

function TioPrototypeBindSource.GetIsDetail: Boolean;
begin
  Result := Assigned(FioMasterBindSource);
end;

function TioPrototypeBindSource.GetNaturalObjectBindSourceAdapter(
  const AOwner: TComponent): TBindSourceAdapter;
begin
  Result := (Self.InternalAdapter as IioNaturalBindSourceAdapterSource).NewNaturalObjectBindSourceAdapter(AOwner);
end;

function TioPrototypeBindSource.GetState: TBindSourceAdapterState;
begin
  if CheckAdapter then
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

procedure TioPrototypeBindSource.Persist(ReloadData: Boolean);
var
 AioActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  if not CheckAdapter then Exit;
  // If the InternalAdapter support the IioActiveBindSourceAdapter (is an ActiveBindSourceAdapter)
  //  then call the Adapter Persist method
  AioActiveBindSourceAdapter := Self.GetActiveBindSourceAdapter;
  if Assigned(AioActiveBindSourceAdapter) then
    AioActiveBindSourceAdapter.Persist(ReloadData);
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

procedure TioPrototypeBindSource.SetAsync(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioAsync := Value;
  // Update the adapter
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAsync := Value;
end;

procedure TioPrototypeBindSource.SetAutoLoadData(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioAutoLoadData := Value;
  // Update the adapter
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAutoLoadData := Value;
end;

procedure TioPrototypeBindSource.SetAutoPersist(const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioAutoPersist := Value;
  // Update the adapter
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioAutoPersist := Value;
end;

procedure TioPrototypeBindSource.SetDataObject(const AObj: TObject; const AOwnsObject: Boolean);
begin
  Self.GetActiveBindSourceAdapter.SetDataObject(AObj, AOwnsObject);
end;

procedure TioPrototypeBindSource.SetWhere(const Value: IioWhere);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Update the adapter where
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
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
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
    LActiveBSA.ioWhere.SetOrderBySql(Value);
end;

procedure TioPrototypeBindSource.SetTypeAlias(const Value: String);
begin
  FioTypeAlias := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioTypeAlias := Value;
end;

procedure TioPrototypeBindSource.SetTypeName(const Value: String);
begin
  FioTypeName := Value;
  // If the adapter is created and is an ActiveBindSourceAdapter then
  //  update the where of the adapter also
  if CheckAdapter then
    GetActiveBindSourceAdapter.ioTypeName := Value;
end;

procedure TioPrototypeBindSource.SetWhereDetailsFromDetailAdapters(
  const Value: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  FioWhereDetailsFromDetailAdapters := Value;
  // Update the adapter
  if CheckAdapter and Supports(Self.GetInternalAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
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
