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
  Data.Bind.ObjectScope, iORM.LiveBindings.Interfaces, System.Classes,
  iORM.LiveBindings.Notification, System.Rtti, iORM.MVVM.Interfaces,
  iORM.Where.Interfaces;

type

  TioPrototypeBindSource = class;

  TioMasterBindSource = TioPrototypeBindSource;

  TioNeedViewModelEvent = procedure(Sender: TioPrototypeBindSource; var AViewModel: IioViewModel) of object;

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
    FioVM_Interface, FioVM_Alias, FioVM_Marker: String;
    FioMasterVM_Interface, FioMasterVM_Alias: String;
    FioVM_UseBSPropsOnCreate: Boolean;
    FioViewModel: IioViewModel;
    FonNotify: TioBSANotificationEvent;
    FOnNeedViewModel: TioNeedViewModelEvent;
    FViewID: Byte;
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
    function GetIsDetail: Boolean;
    procedure DoNeedViewModel;
    function CheckForViewModel: Boolean;
    procedure DoCreateAdapter(var ADataObject: TBindSourceAdapter); override;
    procedure RegisterConnectionDefComponents;
    procedure AfterConstruction; override;
    procedure Loaded; override;
    procedure DoNotify(ANotification:IioBSANotification);
    procedure SetIoWhereStr(const Value: TStrings);
    procedure SetioWhereDetailsFromDetailAdapters(const Value: Boolean);
    // ioWhere property
    function GetWhere: IioWhere;
    procedure SetWhere(const Value: IioWhere);
    // OrderBy property
    procedure SetOrderBy(const Value: String);
//    procedure ioSetBindSourceAdapter(AAdapter: TBindSourceAdapter);
    property IsDetail:Boolean read GetIsDetail;
    procedure WhereOnChangeEventHandler(Sender:TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Notify(const Sender:TObject; const ANotification:IioBSANotification);
    // ----------------------------------------------------------------------------------------------------------------------------
    // BindSourceAdapter methods/properties published by TioPrototypeBindSource also
    function Current: TObject;
    procedure Refresh(ReloadData:Boolean); overload;
    procedure Persist(ReloadData:Boolean=False);
    procedure Append; overload;
    procedure Append(AObject:TObject); overload;
    procedure Insert(AObject:TObject); overload;
    function GetDataObject: TObject;
    procedure SetDataObject(const AObj: TObject; const AOwnsObject:Boolean=True);
    procedure ClearDataObject;
    function ioViewModelAs<T: IInterface>: T;
    function GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    function GetDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere: IioWhere = nil): TBindSourceAdapter;
    function GetNaturalObjectBindSourceAdapter(const AOwner:TComponent): TBindSourceAdapter;
    // ----------------------------------------------------------------------------------------------------------------------------
    property ioViewModel:IioViewModel read FioViewModel write FioViewModel;
    property ioWhere:IioWhere read GetWhere write SetWhere;
  published
    property ioOnNotify:TioBSANotificationEvent read FonNotify write FonNotify;
    property ioOnNeedViewModel:TioNeedViewModelEvent read FOnNeedViewModel write FOnNeedViewModel;

    property ioTypeName:String read FioTypeName write FioTypeName;
    property ioTypeAlias:String read FioTypeAlias write FioTypeAlias;
    property ioAsync:Boolean read FioAsync write FioAsync;
    property ioAutoLoadData:Boolean read FioAutoLoadData write FioAutoLoadData;
    property ioAutoPersist:Boolean read FioAutoPersist write FioAutoPersist;
    property ioViewDataType:TioViewDataType read FioViewDataType write FioViewDataType;
    property ioWhereStr:TStrings read FioWhereStr write SetIoWhereStr;
    property ioWhereDetailsFromDetailAdapters: Boolean read FioWhereDetailsFromDetailAdapters write SetioWhereDetailsFromDetailAdapters;
    property ioOrderBy:String read FioOrderBy Write SetOrderBy;
    property ioMasterBindSource:TioMasterBindSource read FIoMasterBindSource write FIoMasterBindSource;
    property ioMasterPropertyName:String read FIoMasterPropertyName write FIoMasterPropertyName;
    property ioAutoRefreshOnNotification:TioAutoRefreshType read FioAutoRefreshOnNotification write FioAutoRefreshOnNotification;
    property ioVM_Interface:String read FioVM_Interface write FioVM_Interface;
    property ioVM_Alias:String read FioVM_Alias write FioVM_Alias;
    property ioVM_Marker:String read FioVM_Marker write FioVM_Marker;
    property ioVM_UseBSPropsOnCreate:Boolean read FioVM_UseBSPropsOnCreate write FioVM_UseBSPropsOnCreate;
    property ioMasterVM_Interface:String read FioMasterVM_Interface write FioMasterVM_Interface;
    property ioMasterVM_Alias:String read FioMasterVM_Alias write FioMasterVM_Alias;
  end;

implementation

uses
  System.SysUtils, iORM.Exceptions, iORM.RttiContext.Factory,
  iORM.Attributes, iORM.DependencyInjection, iORM,
  iORM.Context.Container, iORM.LiveBindings.Factory,
  iORM.DependencyInjection.ViewModelShuttleContainer,
  iORM.Where.Factory, iORM.Rtti.Utilities, iORM.DB.Components.ConnectionDef;

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
  if not CheckAdapter then Exit;
  GetInternalAdapter.Append;
end;

procedure TioPrototypeBindSource.AfterConstruction;
begin
  inherited;
//  Sleep(100);
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
  else raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
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
  FioViewModel := nil;
  FioVM_UseBSPropsOnCreate := True;
  // Set even an onChange event handler
  FioWhereDetailsFromDetailAdapters := False;
  FioWhereStr := TStringList.Create;
  SetIoWhereStr(FioWhereStr);  // set TStringList.onChange event handler
end;

destructor TioPrototypeBindSource.Destroy;
begin
  FioWhereStr.Free;
  // ===========================================================================
  // If the ViewModel is assigned then unbind the view
  // ---------------------------------------------------------------------------
  if Assigned(Self.ioViewModel) then
    Self.ioViewModel.UnbindView(FViewID);
  // ===========================================================================
  inherited;
end;

function TioPrototypeBindSource.CheckForViewModel: Boolean;
var
  LWhereValue: TValue;
  LObj: TObject;
begin
  // Init
  Result := False;
  // If a ViewModel is already assigned then exit
  if Assigned(ioViewModel) then Exit;
  // ===============================================================================================================================
  // LOCKED VIEW MODEL ALREADY CREATED IN THE DEPENDENCY INJECTION CONTAINER  (an external prepared ViewModel)
  // -------------------------------------------------------------------------------------------------------------------------------
  // If a LockedViewModel is present in the DIContainer (an external prepared ViewModel) and the BindSource is not
  //  a detail (is Master) then Get that ViewModel  , assign it to itself (and to the View later during its creating),
  //  and get the BindSourceAdapter from it.
  if (not Self.IsDetail)
  and TioViewModelShuttleContainer.TryGet(FioViewModel, FioVM_Marker)
  then
     // Nothing (non fa nulla)
  // ===============================================================================================================================
  // ===============================================================================================================================
  // VIEW MODEL FROM THE DEPENDENCY INJECTION CONTAINER
  // -------------------------------------------------------------------------------------------------------------------------------
  // If a VM_Interface is specified then get the proper ViewModel from he Dependency Injection Container
  else if not ioVM_Interface.IsEmpty then
  begin
    // ViewModel with a MasterViewModel
    if FioVM_UseBSPropsOnCreate and not FioMasterVM_Interface.IsEmpty then
      LObj := TioDependencyInjection.Locate(FioVM_Interface).Alias(FioVM_Alias)
        .ConstructorMarker('CreateByMasterViewModelFromDependencyInjection')
        .ConstructorParams([FioMasterVM_Interface, FioMasterVM_Alias, FioMasterPropertyName])
        .Get
    // ViewModel with a MasterBindSource
    else if FioVM_UseBSPropsOnCreate and Assigned(FioMasterBindSource) then
      LObj := TioDependencyInjection.Locate(FioVM_Interface).Alias(FioVM_Alias)
        .ConstructorMarker('CreateByMasterBindSource')
        .ConstructorParams([FioMasterBindSource, FioMasterPropertyName])
        .Get
    // ViewModel with TypeName+TypeAlias+Where BindSourceAdapterCreation
    else if FioVM_UseBSPropsOnCreate and not FioTypeName.IsEmpty then
    begin
      LWhereValue := TValue.From<IioWhere>(TioWhereFactory.NewWhere.Add(ioWhereStr.Text)._OrderBy(FioOrderBy));
      LObj := TioDependencyInjection.Locate(FioVM_Interface).Alias(FioVM_Alias)
        .ConstructorMarker('CreateByTypeName')
//        .ConstructorParams([FioTypeName, FioTypeAlias, FioWhereStr.Text, TValue.From<TioViewDataType>(FioViewDataType), FioAutoLoadData])
        .ConstructorParams([FioTypeName, FioTypeAlias, LWhereValue, TValue.From<TioViewDataType>(FioViewDataType), FioAutoLoadData])
        .Get;
    end
    // Otherwise ViewModel only by ViewModelInterface and ViewModelAlias
    //  NB: Even if the "ioVM_UseBSPropsOnCreate" property is False
    else
      LObj := TioDependencyInjection.Locate(FioVM_Interface).Alias(FioVM_Alias).Get;
    // Set the result
    ioViewModel := TioRttiUtilities.ObjectAsIioViewModel(LObj);
  end;
  // ===============================================================================================================================
  // onNeedViewModel just after it has be assigned (for any changes/additions to the ViewModel itself)
  //  or for retrieve an external created ViewModel
  Self.DoNeedViewModel;
  // If a ViewModel was created/retrieved then return True (False otherwise)
  Result := Assigned(ioViewModel);
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
  // ViewModel create/retrieve
  //  NB: If a ViewModel was created/retrieved then get the BindSourceAdapter from it
  if Self.CheckForViewModel and Assigned(Self.ioViewModel.ViewData) then
    ADataObject := Self.ioViewModel.ViewData.BindSourceAdapter;
  // -------------------------------------------------------------------------------------------------------------------------------
  // If AdataObject is NOT already assigned (by onCreateAdapter event handler or from a ViewModel) then
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

procedure TioPrototypeBindSource.DoNeedViewModel;
begin
  if Assigned(FOnNeedViewModel) then
    FOnNeedViewModel(Self, FioViewModel);
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

function TioPrototypeBindSource.GetActiveBindSourceAdapter: IioActiveBindSourceAdapter;
begin
  Result := nil;
  Supports(Self.InternalAdapter, IioActiveBindSourceAdapter, Result);
end;

function TioPrototypeBindSource.GetDataObject: TObject;
begin
  Result := nil;
  Result := Self.GetActiveBindSourceAdapter.GetDataObject;
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
  else raise EioException.Create(Self.ClassName + ': Internal adapter is not an ActiveBindSourceAdapter!');
end;

function TioPrototypeBindSource.ioViewModelAs<T>: T;
var
  LIID: TGUID;
begin
  Result := nil;
  LIID := TioRttiUtilities.TypeInfoToGUID(TypeInfo(T));
  if not Supports(FioViewModel, LIID, Result) then
    raise EioException.Create(Self.ClassName + ': Interface not implemented by the ViewModel.');
end;

function TioPrototypeBindSource.GetIsDetail: Boolean;
begin
  Result := Assigned(FioMasterBindSource)
            or (   Assigned(Self.ioViewModel) and Assigned(Self.ioViewModel.ioMasterBindSource)   );
end;

function TioPrototypeBindSource.GetNaturalObjectBindSourceAdapter(
  const AOwner: TComponent): TBindSourceAdapter;
begin
  Result := (Self.InternalAdapter as IioNaturalBindSourceAdapterSource).NewNaturalObjectBindSourceAdapter(AOwner);
end;

procedure TioPrototypeBindSource.Loaded;
var
  LAdapter: TBindSourceAdapter;
begin
  // CONNECTIONDEF REGISTRATION (IF NEEDED) MUST BE BEFORE THE DOCREATEADAPTER
  // ===========================================================================
  if not (csDesigning in ComponentState) then
    RegisterConnectionDefComponents;
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

  // ===========================================================================
  // If the ViewModel is assigned (by the DoCreateAdapter method) then it try
  //  to Bind the View (Owner) components to ViewModel's actions
  //  and register the view into the VMVoews container of the VM
  // ---------------------------------------------------------------------------
  if Assigned(Self.ioViewModel) then
    FViewID := Self.ioViewModel.BindView(Self.Owner);
  // ===========================================================================
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

procedure TioPrototypeBindSource.RegisterConnectionDefComponents;
var
  I: Integer;
  LConnectionDef: TioCustomConnectionDef;
begin
  for I := 0 to Owner.ComponentCount-1 do
  begin
    if Owner.Components[I] is TioCustomConnectionDef then
    begin
      LConnectionDef := TioCustomConnectionDef(Owner.Components[I]);
      if not LConnectionDef.IsRegistered then
        LConnectionDef.RegisterConnectionDef;
    end;
  end;
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

procedure TioPrototypeBindSource.SetIoWhereStr(const Value: TStrings);
var
  AnActiveBSA: IioActiveBindSourceAdapter;
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

procedure TioPrototypeBindSource.SetioWhereDetailsFromDetailAdapters(
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
