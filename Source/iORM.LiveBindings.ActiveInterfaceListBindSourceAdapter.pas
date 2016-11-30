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



unit iORM.LiveBindings.ActiveInterfaceListBindSourceAdapter;

interface

uses
  Data.Bind.ObjectScope, System.Classes,
  System.Generics.Collections, iORM.Where.SqlItems.Interfaces,
  iORM.CommonTypes, iORM.Context.Properties.Interfaces,
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.LiveBindings.InterfaceListBindSourceAdapter, iORM.Where.Interfaces;

type

  TioActiveInterfaceListBindSourceAdapter = class(TInterfaceListBindSourceAdapter, IioContainedBindSourceAdapter, IioActiveBindSourceAdapter, IioNaturalBindSourceAdapterSource)
  private
    FWhere: IioWhere;
    FWhereDetailsFromDetailAdapters: Boolean;
    FTypeName, FTypeAlias: String;
    FLocalOwnsObject: Boolean;
    FAutoLoadData: Boolean;
    FAutoPersist: Boolean;
    FReloadDataOnRefresh: Boolean;
    FMasterPropertyName: String;
    FMasterAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FDetailAdaptersContainer: IioDetailBindSourceAdaptersContainer;
    FBindSource: IioNotifiableBindSource;
    FonNotify: TioBSANotificationEvent;
    FInsertObj_Enabled: Boolean;
    FInsertObj_NewObj: TObject;
  private
    // AutoPersist property
    function GetioAutoPersist: Boolean;
    procedure SetioAutoPersist(const Value: Boolean);
    // WhereStr property
    procedure SetIoWhere(const Value: IioWhere);
    function GetioWhere: IioWhere;
    // ioWhereDetailsFromDetailAdapters property
    function GetioWhereDetailsFromDetailAdapters: Boolean;
    procedure SetioWhereDetailsFromDetailAdapters(const Value: Boolean);
  protected
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
    procedure DoAfterDelete; override;
    procedure DoAfterPost; override;
    procedure DoAfterScroll; override;
    procedure DoAfterInsert; override;
    procedure SetObjStatus(AObjStatus: TioObjectStatus);
    function UseObjStatus: Boolean;
    procedure DoNotify(ANotification:IioBSANotification);
  public
    constructor Create(const ATypeName, ATypeAlias: String; const AWhere:IioWhere; const AOwner: TComponent; const AList:TObject; const AutoLoadData: Boolean; const AOwnsObject: Boolean = True); overload;
    destructor Destroy; override;
    procedure SetMasterAdapterContainer(AMasterAdapterContainer:IioDetailBindSourceAdaptersContainer);
    procedure SetMasterProperty(AMasterProperty: IioContextProperty);
    procedure SetBindSource(ANotifiableBindSource:IioNotifiableBindSource);
    procedure ExtractDetailObject(AMasterObj: TObject);
    procedure Persist(ReloadData:Boolean=False);
    function NewDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere:IioWhere): TBindSourceAdapter;
    function NewNaturalObjectBindSourceAdapter(const AOwner:TComponent): TBindSourceAdapter;
    function GetDetailBindSourceAdapterByMasterPropertyName(const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    procedure Append(AObject:TObject); overload;
    procedure Insert(AObject:TObject); overload;
    procedure Notify(Sender:TObject; ANotification:IioBSANotification); virtual;
    procedure Refresh(ReloadData:Boolean); overload;
    function GetDataObject: TObject;
    procedure SetDataObject(const AObj: TObject; const AOwnsObject:Boolean=True);
    procedure ClearDataObject;
    function GetCurrentOID: Integer;
    function IsDetail: Boolean;
    function GetMasterPropertyName: String;

    property ioAutoPersist:Boolean read GetioAutoPersist write SetioAutoPersist;
    property ioOnNotify:TioBSANotificationEvent read FonNotify write FonNotify;
    property ioWhereStr:IioWhere read GetIoWhere write SetIoWhere;
    property ioWhereDetailsFromDetailAdapters: Boolean read GetioWhereDetailsFromDetailAdapters write SetioWhereDetailsFromDetailAdapters;
  end;

implementation

uses
  iORM, System.Rtti, iORM.LiveBindings.Factory, iORM.Context.Factory,
  iORM.Context.Interfaces, System.SysUtils, iORM.LazyLoad.Interfaces,
  iORM.Exceptions, iORM.Rtti.Utilities, iORM.Context.Map.Interfaces,
  iORM.Where.Factory;

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

procedure TioActiveInterfaceListBindSourceAdapter.Append(AObject: TObject);
begin
  // Set sone InsertObj subsystem variables
  // Then call the standard code
  FInsertObj_NewObj := AObject;
  FInsertObj_Enabled := True;
  Self.Append;
end;

procedure TioActiveInterfaceListBindSourceAdapter.ClearDataObject;
begin
  Self.SetDataObject(nil, False);
end;

constructor TioActiveInterfaceListBindSourceAdapter.Create(const ATypeName, ATypeAlias: String; const AWhere: IioWhere; const AOwner: TComponent;
  const AList: TObject; const AutoLoadData, AOwnsObject: Boolean);
begin
  FAutoPersist := True;
  FAutoLoadData := AutoLoadData;
  FReloadDataOnRefresh := True;
  inherited Create(AOwner, AList, ATypeAlias, ATypeName, AOwnsObject);
  FLocalOwnsObject := AOwnsObject;
  FWhere := AWhere;
  FWhereDetailsFromDetailAdapters := False;
  FTypeName := ATypeName;
  FTypeAlias := ATypeAlias;
  // Set Master & Details adapters reference
  FMasterAdaptersContainer := nil;
  FDetailAdaptersContainer := TioLiveBindingsFactory.DetailAdaptersContainer(Self);
  // Init InsertObj subsystem values
  FInsertObj_Enabled := False;
  FInsertObj_NewObj := nil;
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

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterDelete;
begin
  inherited;
  // Send a notification to other ActiveBindSourceAdapters & BindSource
  Notify(
         Self,
         TioLiveBindingsFactory.Notification(Self, Self.Current, ntAfterDelete)
        );
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterInsert;
var
  ObjToFree: TObject;
  AInterface: IInterface;
begin
  // If enabled subsitute the new object with the FInsertObj_NewObj (Append(AObject:TObject))
  //  then destroy the "olr" new object
  if FInsertObj_Enabled then
  begin
    try
      if Supports(FInsertObj_NewObj, IInterface, AInterface) then
      begin
// NB: Queste due righe le ho commentate perchè altrimenti dava un errore in un progetto di
//      Omar ed eliminando queste righe invece sembra andare bene però ho un dubbio che questo
//      possa generare un memory leak. Proviamo a tenerle commentate e poi vediamo
//        ObjToFree := Self.List[Self.ItemIndex] as TObject;
//        ObjToFree.Free;
        Self.List[Self.ItemIndex] := AInterface;
      end
      else
        raise EioException.Create(Self.ClassName + ': "FInsertObj_NewObj" does not implement IInterface.');
    finally
      // Reset InsertObj subsystem
      FInsertObj_Enabled := False;
      FInsertObj_NewObj := nil;
    end;
  end;
  // Execute AfterInsert event handler
  inherited;
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterPost;
var
  LMasterProperty: IioContextProperty;
begin
  inherited;
  Self.SetObjStatus(osDirty);
  // If AutoPersist is enabled then persist
  if FAutoPersist then
    if Self.IsDetail then
    begin
      // Get the MasterProperty of the current object
      LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName(
        FMasterAdaptersContainer.GetMasterBindSourceAdapter.Current.ClassType,
        FMasterPropertyName);
      io.Persist(Self.Current,
                 LMasterProperty.GetRelationChildPropertyName,
                 Self.FMasterAdaptersContainer.GetMasterBindSourceAdapter.GetCurrentOID,
                 False,
                 '')  // Connection name
    end
    else
      io.Persist(Self.Current);
  // Send a notification to other ActiveBindSourceAdapters & BindSource
  Notify(
         Self,
         TioLiveBindingsFactory.Notification(Self, Self.Current, ntAfterPost)
        );
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoAfterScroll;
begin
  inherited;
  Self.FDetailAdaptersContainer.SetMasterObject(Self.Current);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeDelete;
begin
inherited;
  // If ObjectStatus exists in the class then set it as osDirty
  if Self.UseObjStatus then
  begin
    Self.SetObjStatus(osDeleted);
    Abort;
  end;
  // If AutoPersist is enabled then persist
  if Self.FAutoPersist then io.Delete(Self.Current);
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeOpen;
begin
  inherited;
  if FAutoLoadData
    then io.Load(FTypeName, FTypeAlias)._Where(GetioWhere).ToList(Self.List);  // Use GetioWhere to fill the WhereDetails
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoBeforeRefresh;
begin
  inherited;
  // Per fare l reload dei dati dal DB anche FAutoLoadData deve essere True
  //  perchè altrimenti dopo aver riattivato se stesso non farebbe
  // alcun caricamento nel DoBeforeOpen e quindi si otterrebbe una lista
  // completamente vuota
  if FReloadDataOnRefresh and FAutoLoadData then
  begin
    Self.First;  // Bug
    Self.Active := False;
    Self.List.Clear;
    Self.Active := True;
  end;
end;

procedure TioActiveInterfaceListBindSourceAdapter.DoNotify(
  ANotification: IioBSANotification);
begin
  if Assigned(FonNotify)
    then FonNotify(Self, ANotification);
end;

procedure TioActiveInterfaceListBindSourceAdapter.ExtractDetailObject(
  AMasterObj: TObject);
var
  LDetailObj: TObject;
  LValue: TValue;
  LLazyLoadableObj: IioLazyLoadable;
  LMasterProperty: IioContextProperty;
begin
  LDetailObj := nil;
  // Check parameter, if the MasterObject is not assigned
  //  then close the BSA
  if not Assigned(AMasterObj) then
  begin
    Self.SetDataObject(nil, False);  // 2° parameter false ABSOLUTELY!!!!!!!
    Exit;
  end;
  // Extract master property value
  LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName(AMasterObj.ClassType, FMasterPropertyName);
  LValue := LMasterProperty.GetValue(AMasterObj);
  // Retrieve the object from the TValue
  if not LValue.IsEmpty then
    if LMasterProperty.IsInterface then
      LDetailObj := TObject(LValue.AsInterface)
    else
      LDetailObj := LValue.AsObject;
  // If is a LazyLoadable list then set the internal List
  //  NB: Assegnare direttamente anche i LazyLoadable come se fossero delle liste
  //       normali dava dei problemi (non dava errori ma non usciva nulla)
  if Supports(LDetailObj, IioLazyLoadable, LLazyLoadableObj)
    then LDetailObj := LLazyLoadableObj.GetInternalObject;
  // Set it to the Adapter itself
  Self.SetDataObject(LDetailObj, False);  // 2° parameter false ABSOLUTELY!!!!!!!
end;

function TioActiveInterfaceListBindSourceAdapter.GetCurrentOID: Integer;
begin
  Result := TioContextFactory.GetIDPropertyByClassRef(Self.Current.ClassType).GetValue(Self.Current).AsInteger;
end;

function TioActiveInterfaceListBindSourceAdapter.GetDataObject: TObject;
begin
  Result := Self.List;
end;

function TioActiveInterfaceListBindSourceAdapter.GetDetailBindSourceAdapterByMasterPropertyName(
  const AMasterPropertyName: String): IioActiveBindSourceAdapter;
begin
  Result := FDetailAdaptersContainer.GetBindSourceAdapterByMasterPropertyName(AMasterPropertyName);
end;

function TioActiveInterfaceListBindSourceAdapter.NewDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere:IioWhere): TBindSourceAdapter;
begin
  // Return the requested DetailBindSourceAdapter and set the current master object
  Result := FDetailAdaptersContainer.NewBindSourceAdapter(AOwner, BaseObjectRttiType.Name, AMasterPropertyName, AWhere);
  FDetailAdaptersContainer.SetMasterObject(Self.Current);
end;

function TioActiveInterfaceListBindSourceAdapter.GetioAutoPersist: Boolean;
begin
  Result := FAutoPersist;
end;

function TioActiveInterfaceListBindSourceAdapter.GetioWhere: IioWhere;
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

function TioActiveInterfaceListBindSourceAdapter.GetioWhereDetailsFromDetailAdapters: Boolean;
begin
  Result := FWhereDetailsFromDetailAdapters;
end;

function TioActiveInterfaceListBindSourceAdapter.GetMasterPropertyName: String;
begin
  Result := FMasterPropertyName;
end;

function TioActiveInterfaceListBindSourceAdapter.NewNaturalObjectBindSourceAdapter(
  const AOwner: TComponent): TBindSourceAdapter;
begin
  Result := TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(AOwner, Self);
end;

procedure TioActiveInterfaceListBindSourceAdapter.Insert(AObject: TObject);
begin
  // Set sone InsertObj subsystem variables
  // Then call the standard code
  FInsertObj_NewObj := AObject;
  FInsertObj_Enabled := True;
  Self.Insert;
end;

function TioActiveInterfaceListBindSourceAdapter.IsDetail: Boolean;
begin
  Result := not FMasterPropertyName.IsEmpty;
end;

procedure TioActiveInterfaceListBindSourceAdapter.Notify(Sender: TObject;
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

procedure TioActiveInterfaceListBindSourceAdapter.Persist(ReloadData:Boolean=False);
begin
  // Persist
  io.PersistCollection(Self.List);
  // Reload
  if ReloadData then
  begin
    Self.DoBeforeOpen;
    Self.Refresh;
  end;
end;

function TioActiveInterfaceListBindSourceAdapter.QueryInterface(const IID: TGUID;
  out Obj): HResult;
begin
  // RefCount disabled
  if GetInterface(IID, Obj) then
    Result := 0
  else
    Result := E_NOINTERFACE;
end;

procedure TioActiveInterfaceListBindSourceAdapter.Refresh(ReloadData: Boolean);
var
  PrecReloadData: Boolean;
begin
  // Se il BindSourceAdapter è un dettaglio allora propaga il Refresh al suo Master
  //  questo perchè solo il master esegue realmente le query e quindi è quest'ultimo che
  //  deve gestire il refresh con reload.
  if IsDetail and Assigned(FMasterAdaptersContainer) then
    FMasterAdaptersContainer.GetMasterBindSourceAdapter.Refresh(ReloadData)
  else
  begin
    PrecReloadData := FReloadDataOnRefresh;
    Self.FReloadDataOnRefresh := ReloadData;
    inherited Refresh;
    Self.FReloadDataOnRefresh := PrecReloadData;
  end;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetBindSource(ANotifiableBindSource:IioNotifiableBindSource);
begin
  FBindSource := ANotifiableBindSource;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetDataObject(const AObj:TObject; const AOwnsObject:Boolean);
var
  LPrecAutoLoadData: Boolean;
begin
  // Disable the adapter
  Self.First;  // Bug
  Self.Active := False;
  // AObj is assigned then set it as DataObject
  //  else set DataObject to nil and set MasterObject to nil
  //  to disable all Details adapters also
  if Assigned(AObj) then
  begin
    // Set the provided DataObject
    Self.SetList(TList<IInterface>(AObj), AOwnsObject);
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

  // -------------------------------------------------------------------------------------------------------
  // If is a LazyLoadable list then set the internal List
  //  NB: Assegnare direttamente anche i LazyLoadable come se fossero delle liste
  //       normali dava dei problemi (non dava errori ma non usciva nulla)
//  if Supports(AObj, IioLazyLoadable, ALazyLoadableObj)
//    then AObj := TList<TObject>(ALazyLoadableObj.GetInternalObject);
//  Self.SetList(AObj as TList<IInterface>, False);  // NB: AOwns (2° parameters) = False ABSOLUTELY!!!!!!
//// -------------------------------------------------------------------------------------------------------
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetioAutoPersist(const Value: Boolean);
begin
  FAutoPersist := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetIoWhere(
  const Value: IioWhere);
begin
  FWhere := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetioWhereDetailsFromDetailAdapters(
  const Value: Boolean);
begin
  FWhereDetailsFromDetailAdapters := Value;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetMasterAdapterContainer(
  AMasterAdapterContainer: IioDetailBindSourceAdaptersContainer);
begin
  FMasterAdaptersContainer := AMasterAdapterContainer;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetMasterProperty(
  AMasterProperty: IioContextProperty);
begin
  FMasterPropertyName := AMasterProperty.GetName;
end;

procedure TioActiveInterfaceListBindSourceAdapter.SetObjStatus(
  AObjStatus: TioObjectStatus);
begin
  TioContextFactory.Context(Self.Current.ClassName, nil, Self.Current).ObjectStatus := AObjStatus;
end;

function TioActiveInterfaceListBindSourceAdapter.UseObjStatus: Boolean;
begin
  Result := TioContextFactory.Context(Self.Current.ClassName, nil, Self.Current).ObjStatusExist;
end;

function TioActiveInterfaceListBindSourceAdapter._AddRef: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
end;

function TioActiveInterfaceListBindSourceAdapter._Release: Integer;
begin
  // Nothing, the interfaces support is intended only as LazyLoadable support flag
end;

end.
