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

unit iORM.LiveBindings.CommonBSAPersistence;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.Where.Interfaces, iORM.CommonTypes;

type

  TioCommonBSAPersistenceThreadExecute = reference to function: TObject;
  TioCommonBSAPersistenceThreadOnTerminate = reference to procedure(AResultValue: TObject);

  TioCommonBSAPersistence = class
  private
    class procedure _Execute(const AASync: Boolean; AExecuteMethod: TioCommonBSAPersistenceThreadExecute;
      ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate); static;
    class procedure _SyncExecute(AExecuteMethod: TioCommonBSAPersistenceThreadExecute;
      ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate); static;
    class procedure _AsyncExecute(AExecuteMethod: TioCommonBSAPersistenceThreadExecute;
      ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate); static;
    class procedure _LoadSingle(const AASync: Boolean; const ATypeName, ATypeAlias: String; AWhere: IioWhere;
      ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
    class procedure _LoadList(const AASync: Boolean; const ATypeName, ATypeAlias: String; AWhere: IioWhere;
      ATargetClass: TioClassRef; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
    class procedure _LoadToList(const AASync: Boolean; const ATypeName, ATypeAlias: String; AWhere: IioWhere; ATargetList: TObject;
      ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
    class procedure _RefreshNoReload(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ANotify: Boolean); static;
    class procedure _RefreshReload(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ANotify: Boolean); static;
    class procedure _SetItemCountToPageManager(const ATypeName, ATypeAlias: String; AWhere: IioWhere);
  public
    class procedure Load(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure LoadPage(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure Refresh(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
      const AReloadData, ANotify: Boolean); static;
    class procedure Delete(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; out AAbort: Boolean); static;
    class procedure AfterDelete(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure Post(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const AForce: Boolean = False); static;
    class procedure PersistCurrent(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure PersistAll(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
  end;

implementation

uses System.Classes, System.SysUtils, iORM.Exceptions, iORM, iORM.LiveBindings.Factory,
  iORM.Context.Properties.Interfaces, iORM.Context.Factory, Data.Bind.ObjectScope, System.Generics.Collections,
  iORM.LiveBindings.CommonBSAPaging;

type

  TioCommonBSAAnonymousMethodsFactory = class
  public
    // persist
    class function GetPersistAllExecuteMethod(const ADataObj: TObject; const ARelationChildPropertyName: String;
      const AMasterOID: Integer): TioCommonBSAPersistenceThreadExecute;
    // Post
    class function GetPostExecuteMethod(const ADataObj: TObject; const ARelationChildPropertyName: String;
      const AMasterOID: Integer): TioCommonBSAPersistenceThreadExecute;
    // Delete
    class function GetDeleteExecuteMethod(const ADataObj: TObject): TioCommonBSAPersistenceThreadExecute;
    class function GetDeleteTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter)
      : TioCommonBSAPersistenceThreadOnTerminate;
    // Refresh
    class function GetRefreshTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ANotify: Boolean)
      : TioCommonBSAPersistenceThreadOnTerminate;
    // LoadPage (progressive)
    class function GetProgressiveLoadPageTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter)
      : TioCommonBSAPersistenceThreadOnTerminate;
    // Other
    class function GetNotifyTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter)
      : TioCommonBSAPersistenceThreadOnTerminate;
  end;

  TioCommonBSAPersistenceThread = class(TThread)
  strict private
    FExceptionText: String;
    FExecuteFunc: TioCommonBSAPersistenceThreadExecute;
    FOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate;
    FResultValue: TObject;
  strict protected
    procedure Execute; override;
    procedure OnTerminateEventHandler(Sender: TObject);
  public
    constructor Create(AExecuteFunc: TioCommonBSAPersistenceThreadExecute;
      AOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate); overload;
    function ResultValue: TObject;
  end;

  { TioCommonBSAPersistence }

class procedure TioCommonBSAPersistence._AsyncExecute(AExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  io.ShowWait;
  // Create and execute the thread
  TioCommonBSAPersistenceThread.Create(AExecuteMethod, ATerminateMethod).Start;
end;

class procedure TioCommonBSAPersistence._Execute(const AASync: Boolean; AExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  if AASync then
    _AsyncExecute(AExecuteMethod, ATerminateMethod)
  else
    _SyncExecute(AExecuteMethod, ATerminateMethod);
end;

class procedure TioCommonBSAPersistence.Delete(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; out AAbort: Boolean);
var
  LExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  AAbort := False;
  // If current is nil then exit
  if not Assigned(AActiveBindSourceAdapter.Current) then
    Exit;
  // If not AutoPersist then exit
  if not AActiveBindSourceAdapter.ioAutoPersist then
  begin
    // If UseObjStatus is true and not AutoPersist then set ObjStatus propriety and exit
    if AActiveBindSourceAdapter.UseObjStatus then
    begin
      AActiveBindSourceAdapter.SetObjStatus(osDeleted);
      AAbort := True;
    end;
    Exit;
  end;
  // ----------------------- SET ANONIMOUS METHODS -----------------------------
  // Set Execute anonimous methods
  LExecuteMethod := TioCommonBSAAnonymousMethodsFactory.GetDeleteExecuteMethod(AActiveBindSourceAdapter.Current);
  // Set the OnTerminate anonymous method when in Async mode
  // If not in Async mode then execute this code in the "AfterDelete" method called by the BSA
  // from the OnAfterDelete event handler.
  if AActiveBindSourceAdapter.ioAsync then
    LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetDeleteTerminateMethod(AActiveBindSourceAdapter)
  else
    LTerminateMethod := nil;
  // ----------------------- SET ANONIMOUS METHODS -----------------------------
  // If AutoPersist or forced persist the delete from the DB else
  // send a notification to other BSA.
  // Execute synchronous or asynchronous
  _Execute(AActiveBindSourceAdapter.ioAsync, LExecuteMethod, LTerminateMethod);
end;

class procedure TioCommonBSAPersistence.AfterDelete(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin
  // NB: Ho spostato qui l'invio della notifica perchè altrimenti si presentava un problema di sequenza.
  // in pratica la notifica arrivava ai destinatari prima che il BSA avesse effettivamente
  // eliminato l'oggetto. Se lo metto qui invece va bene.

  // Set the OnTerminate anonymous method when in Async mode
  // If not in Async mode then execute this code in the "AfterDelete" method called by the BSA
  // from the OnAfterDelete event handler.
  if not AActiveBindSourceAdapter.ioAsync then
    TioCommonBSAAnonymousMethodsFactory.GetDeleteTerminateMethod(AActiveBindSourceAdapter);
end;

class procedure TioCommonBSAPersistence.Load(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LTargetClass: TioClassRef;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  LTargetClass := nil;
  // If AutoLoadData is disabled then exit
  // Prevent AutoLoadData when refreshing
  if AActiveBindSourceAdapter.Refreshing or not AActiveBindSourceAdapter.ioAutoLoadData then
    Exit;
  // If it's a ListBindSourceAdapter then retrieve the list target class
  if Assigned(AActiveBindSourceAdapter.DataObject) then
    LTargetClass := AActiveBindSourceAdapter.DataObject.ClassType;
  // Set the OnTerminate method
  LTerminateMethod := procedure(AResultValue: TObject)
    var
      LIntf: IInterface;
    begin
      if AActiveBindSourceAdapter.IsInterfaceBSA and Supports(AResultValue, IInterface, LIntf) then
        AActiveBindSourceAdapter.InternalSetDataObject(LIntf, AActiveBindSourceAdapter.ioOwnsObjects)
      else
        AActiveBindSourceAdapter.InternalSetDataObject(AResultValue, AActiveBindSourceAdapter.ioOwnsObjects);
    end;

  // Load
  case AActiveBindSourceAdapter.ioViewDataType of
    TioViewDataType.dtSingle:
      _LoadSingle(AActiveBindSourceAdapter.ioAsync, AActiveBindSourceAdapter.ioTypeName, AActiveBindSourceAdapter.ioTypeAlias,
        AActiveBindSourceAdapter.ioWhere, LTerminateMethod);
    TioViewDataType.dtList:
      _LoadList(AActiveBindSourceAdapter.ioAsync, AActiveBindSourceAdapter.ioTypeName, AActiveBindSourceAdapter.ioTypeAlias,
        AActiveBindSourceAdapter.ioWhere, LTargetClass, LTerminateMethod);
  else
    raise EioException.Create('TioCommonBSAPersistence.Load: wrong ViewDataType.');
  end;
end;

class procedure TioCommonBSAPersistence.LoadPage(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LPagingObj: TioCommonBSAPageManager;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // If the adapter is a detail adapter or AutuLoadData is not active then do not execute
  if AActiveBindSourceAdapter.IsDetail or (AActiveBindSourceAdapter.ioViewDataType <> dtList) or not AActiveBindSourceAdapter.ioAutoLoadData
  then
    Exit;
  // Extract the paging obj from the where obj
  LPagingObj := AActiveBindSourceAdapter.ioWhere.GetPagingObj as TioCommonBSAPageManager;
  // Load next page
  if LPagingObj.IsProgressive then
  begin
    // If the pagination is progressive then it loads the next page and adds it to the
    //  internal list of the BSA and then does a Refresh(False)
    LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetProgressiveLoadPageTerminateMethod(AActiveBindSourceAdapter);
    _LoadToList(AActiveBindSourceAdapter.ioAsync, AActiveBindSourceAdapter.ioTypeName, AActiveBindSourceAdapter.ioTypeAlias,
      AActiveBindSourceAdapter.ioWhere, AActiveBindSourceAdapter.DataObject, LTerminateMethod);
  end
  else
    // If, on the other hand, the pagination is not progressive then it performs a normal Refresh(True)
    //  which in practice causes a normal loading in a new list which is then set as a new DataObject
    _RefreshReload(AActiveBindSourceAdapter, False);
end;

class procedure TioCommonBSAPersistence.Refresh(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  const AReloadData, ANotify: Boolean);
begin
  // Se il BindSourceAdapter è un dettaglio allora propaga il Refresh al suo Master
  // questo perchè solo il master esegue realmente le query e quindi è quest'ultimo che
  // deve gestire il refresh con reload.
  if AActiveBindSourceAdapter.IsDetail and Assigned(AActiveBindSourceAdapter.GetMasterBindSourceAdapter) and AReloadData then
    AActiveBindSourceAdapter.GetMasterBindSourceAdapter.Refresh(AReloadData)
  else if AReloadData and AActiveBindSourceAdapter.ioAutoLoadData then
    _RefreshReload(AActiveBindSourceAdapter, ANotify)
  else
    _RefreshNoReload(AActiveBindSourceAdapter, ANotify);
end;

class procedure TioCommonBSAPersistence._RefreshNoReload(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  const ANotify: Boolean);
begin
  AActiveBindSourceAdapter.AsTBindSourceAdapter.Refresh;
  // Also refresh any DataSets
  AActiveBindSourceAdapter.GetDataSetLinkContainer.Refresh(True); // Force
  // Send a notification to other ActiveBindSourceAdapters & BindSource
  if ANotify then
    AActiveBindSourceAdapter.Notify(AActiveBindSourceAdapter as TObject,
      TioLiveBindingsFactory.Notification(AActiveBindSourceAdapter as TObject, AActiveBindSourceAdapter.Current, ntAfterRefresh));
end;

class procedure TioCommonBSAPersistence._RefreshReload(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  const ANotify: Boolean);
var
  LPagingObj: TioCommonBSAPageManager;
  LTargetClass: TioClassRef;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  LTargetClass := nil;
  // Prevent AutoLoadData when activating the BSA
  AActiveBindSourceAdapter.Refreshing := True;
  // If it's a ListBindSourceAdapter then retrieve the list target class
  if Assigned(AActiveBindSourceAdapter.DataObject) then
    LTargetClass := AActiveBindSourceAdapter.DataObject.ClassType;
  // Set the OnTerminate method
  LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetRefreshTerminateMethod(AActiveBindSourceAdapter, ANotify);
  // Extract the paging obj from the where obj and prepare it for an HardRefresh
  LPagingObj := AActiveBindSourceAdapter.ioWhere.GetPagingObj as TioCommonBSAPageManager;
  LPagingObj.PrepareForRefresh;
  // Load
  case AActiveBindSourceAdapter.ioViewDataType of
    TioViewDataType.dtSingle:
      _LoadSingle(AActiveBindSourceAdapter.ioAsync, AActiveBindSourceAdapter.ioTypeName, AActiveBindSourceAdapter.ioTypeAlias,
        AActiveBindSourceAdapter.ioWhere, LTerminateMethod);
    TioViewDataType.dtList:
      _LoadList(AActiveBindSourceAdapter.ioAsync, AActiveBindSourceAdapter.ioTypeName, AActiveBindSourceAdapter.ioTypeAlias,
        AActiveBindSourceAdapter.ioWhere, LTargetClass, LTerminateMethod);
  else
    raise EioException.Create('TioCommonBSAPersistence._RefreshReload: wrong ViewDataType.');
  end;
end;

class procedure TioCommonBSAPersistence.PersistAll(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LMasterProperty: IioContextProperty;
  LRelationChildPropertyName: String;
  LMasterOID: Integer;
  LExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // If it's a single object then call the normal PersistCurrent method and exit
  if AActiveBindSourceAdapter.ioViewDataType = TioViewDataType.dtSingle then
  begin
    PersistCurrent(AActiveBindSourceAdapter);
    Exit;
  end;
  // if editing the post
  if AActiveBindSourceAdapter.State in seEditModes then
    AActiveBindSourceAdapter.Post;
  // Init
  LMasterProperty := nil;
  LRelationChildPropertyName := '';
  LMasterOID := 0;
  // If it is a detail adapter...
  if AActiveBindSourceAdapter.IsDetail then
  begin
    // Get the MasterProperty of the current object
    LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName
      (AActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current.ClassType, AActiveBindSourceAdapter.GetMasterPropertyName);
    // Get a local reference of some values
    LRelationChildPropertyName := LMasterProperty.GetRelationChildPropertyName;
    LMasterOID := AActiveBindSourceAdapter.GetMasterBindSourceAdapter.GetCurrentOID;
  end;
  // ----------------------- SET ANONIMOUS METHODS -----------------------------
  // Set Execute anonimous methods
  LExecuteMethod := TioCommonBSAAnonymousMethodsFactory.GetPersistAllExecuteMethod(AActiveBindSourceAdapter.DataObject,
    LRelationChildPropertyName, LMasterOID);
  // Set the OnTerminate anonimous method
  LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetNotifyTerminateMethod(AActiveBindSourceAdapter);
  // ----------------------- SET ANONIMOUS METHODS -----------------------------
  // Execute synchronous or asynchronous
  _Execute(AActiveBindSourceAdapter.ioAsync, LExecuteMethod, LTerminateMethod);
end;

class procedure TioCommonBSAPersistence.PersistCurrent(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin
  // If in editing then post
  // NB: Se AutoPersist = True allora il Post già causa la persistenza dell'oggetto sul DB
  // quindi esce subito perchè altrimenti si avrebbe una doppia persistenza
  if AActiveBindSourceAdapter.State in seEditModes then
  begin
    AActiveBindSourceAdapter.Post;
    if AActiveBindSourceAdapter.ioAutoPersist then
      Exit;
  end;
  // Persist
  Post(AActiveBindSourceAdapter, True);
end;

class procedure TioCommonBSAPersistence.Post(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const AForce: Boolean);
var
  LMasterProperty: IioContextProperty;
  LRelationChildPropertyName: String;
  LMasterOID: Integer;
  LExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // Init
  LMasterProperty := nil;
  LRelationChildPropertyName := '';
  LMasterOID := 0;
  // Set the ObjectStatus
  AActiveBindSourceAdapter.SetObjStatus(osDirty);
  // Set the OnTerminate anonimous method
  LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetNotifyTerminateMethod(AActiveBindSourceAdapter);
  // If AutoPersist or forced persist then persist to the DB else
  // send a notification to other BSA.
  if AActiveBindSourceAdapter.ioAutoPersist or AForce then
  begin
    // If it is a detail adapter...
    if AActiveBindSourceAdapter.IsDetail then
    begin
      // Get the MasterProperty of the current object
      LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName
        (AActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current.ClassType, AActiveBindSourceAdapter.GetMasterPropertyName);
      // Get a local reference of some values
      LRelationChildPropertyName := LMasterProperty.GetRelationChildPropertyName;
      LMasterOID := AActiveBindSourceAdapter.GetMasterBindSourceAdapter.GetCurrentOID;
    end;
    // Set Execute anonimous methods to persist
    LExecuteMethod := TioCommonBSAAnonymousMethodsFactory.GetPostExecuteMethod(AActiveBindSourceAdapter.Current,
      LRelationChildPropertyName, LMasterOID);
    // Execute synchronous or asynchronous
    _Execute(AActiveBindSourceAdapter.ioAsync, LExecuteMethod, LTerminateMethod);
  end
  else
    LTerminateMethod(nil);
end;

class procedure TioCommonBSAPersistence._SetItemCountToPageManager(const ATypeName, ATypeAlias: String; AWhere: IioWhere);
var
  LCount: Integer;
  LPagingObj: TioCommonBSAPageManager;
begin
  LCount := io.Load(ATypeName, ATypeAlias)._Where(AWhere).GetCount;
  LPagingObj := AWhere.GetPagingObj as TioCommonBSAPageManager;
  LPagingObj.SetItemCount(LCount);
end;

class procedure TioCommonBSAPersistence._SyncExecute(AExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
var
  LResultValue: TObject;
begin
  io.ShowWait;
  try
    // Execute core code
    LResultValue := AExecuteMethod;
    // Execute OnTerminate code
    if Assigned(ATerminateMethod) then
      ATerminateMethod(LResultValue);
  finally
    io.HideWait;
  end;
end;

class procedure TioCommonBSAPersistence._LoadList(const AASync: Boolean; const ATypeName, ATypeAlias: String; AWhere: IioWhere;
  ATargetClass: TioClassRef; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  _Execute(AASync,
    function: TObject
    begin
      io.StartTransaction;
      try
        // Load list
        Result := io.Load(ATypeName, ATypeAlias)._Where(AWhere).ToList(ATargetClass);
        // Load count
        _SetItemCountToPageManager(ATypeName, ATypeAlias, AWhere);
        io.CommitTransaction;
      except
        io.RollbackTransaction;
        raise;
      end;
    end, ATerminateMethod);
end;

class procedure TioCommonBSAPersistence._LoadToList(const AASync: Boolean; const ATypeName, ATypeAlias: String; AWhere: IioWhere;
ATargetList: TObject; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  _Execute(AASync,
    function: TObject
    begin
      io.StartTransaction;
      try
        // Load to list
        result := nil;
        io.Load(ATypeName, ATypeAlias)._Where(AWhere).ToList(ATargetList);
        // Load count
        _SetItemCountToPageManager(ATypeName, ATypeAlias, AWhere);
        io.CommitTransaction;
      except
        io.RollbackTransaction;
        raise;
      end;
    end, ATerminateMethod);
end;

class procedure TioCommonBSAPersistence._LoadSingle(const AASync: Boolean; const ATypeName, ATypeAlias: String; AWhere: IioWhere;
ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  _Execute(AASync,
    function: TObject
    begin
      result := io.Load(ATypeName, ATypeAlias)._Where(AWhere).ToObject;
    end, ATerminateMethod);
end;

{ TioCommonBSAPersistenceThread }

constructor TioCommonBSAPersistenceThread.Create(AExecuteFunc: TioCommonBSAPersistenceThreadExecute;
AOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate);
begin
  inherited Create(True);
  FExecuteFunc := AExecuteFunc;
  FOnTerminateProc := AOnTerminateProc;
  FExceptionText := String.Empty;
  FResultValue := nil;
  Self.OnTerminate := OnTerminateEventHandler;
  Self.FreeOnTerminate := True;
end;

procedure TioCommonBSAPersistenceThread.Execute;
begin
  inherited;
  try
    FResultValue := FExecuteFunc;
  except
    on E: Exception do
      FExceptionText := E.Message;
  end;
end;

procedure TioCommonBSAPersistenceThread.OnTerminateEventHandler(Sender: TObject);
begin
  try
    // Se durante l'esecuzione del thread c'è stata una eccezione...
    if not FExceptionText.IsEmpty then
    begin
      io.HideWait;
      raise EioException.Create('(' + Self.ClassName + ') - ' + FExceptionText);
    end
    else if Assigned(FOnTerminateProc) then
      FOnTerminateProc(FResultValue);
  finally
    io.HideWait;
  end;
end;

function TioCommonBSAPersistenceThread.ResultValue: TObject;
begin
  result := FResultValue;
end;

{ TioCommonBSAAnonymousMethodsFactory }

class function TioCommonBSAAnonymousMethodsFactory.GetDeleteExecuteMethod(const ADataObj: TObject)
  : TioCommonBSAPersistenceThreadExecute;
begin
  result := function: TObject
    begin
      result := nil;
      io.Delete(ADataObj);
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetDeleteTerminateMethod(const AActiveBindSourceAdapter
  : IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadOnTerminate;
begin
  result := procedure(AResultValue: TObject)
    begin
      // DataSet synchro
      AActiveBindSourceAdapter.GetDataSetLinkContainer.Refresh;
      // Send a notification to other ActiveBindSourceAdapters & BindSource
      // NB: Moved into "CommonBSAPersistence" (Delete, LOnTerminate)
      // if FAutoPersist is True then the notify is performed by
      // the "CommonBSAPersistence" else by this method
      AActiveBindSourceAdapter.Notify(AActiveBindSourceAdapter as TObject,
        TioLiveBindingsFactory.Notification(AActiveBindSourceAdapter as TObject, AActiveBindSourceAdapter.Current, ntAfterDelete));
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetNotifyTerminateMethod(const AActiveBindSourceAdapter
  : IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadOnTerminate;
begin
  result := procedure(AResultValue: TObject)
    begin
      // Send a notification to other ActiveBindSourceAdapters & BindSource
      AActiveBindSourceAdapter.Notify(AActiveBindSourceAdapter as TObject,
        TioLiveBindingsFactory.Notification(AActiveBindSourceAdapter as TObject, AActiveBindSourceAdapter.Current, ntAfterPost));
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetPersistAllExecuteMethod(const ADataObj: TObject;
const ARelationChildPropertyName: String; const AMasterOID: Integer): TioCommonBSAPersistenceThreadExecute;
begin
  result := function: TObject
    begin
      result := nil;
      io.PersistCollection(ADataObj, ARelationChildPropertyName, AMasterOID, False);
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetPostExecuteMethod(const ADataObj: TObject;
const ARelationChildPropertyName: String; const AMasterOID: Integer): TioCommonBSAPersistenceThreadExecute;
begin
  result := function: TObject
    begin
      result := nil;
      io.Persist(ADataObj, ARelationChildPropertyName, AMasterOID, False);
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetProgressiveLoadPageTerminateMethod(const AActiveBindSourceAdapter
  : IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadOnTerminate;
begin
  result := procedure(AResultValue: TObject)
    begin
      // Perform a RefreshNoReload without nofications
      TioCommonBSAPersistence._RefreshNoReload(AActiveBindSourceAdapter, False);
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetRefreshTerminateMethod(const AActiveBindSourceAdapter
  : IioActiveBindSourceAdapter; const ANotify: Boolean): TioCommonBSAPersistenceThreadOnTerminate;
begin
  result := procedure(AResultValue: TObject)
    var
      LIntf: IInterface;
    begin
      // Close the BSA, substitute the DataObject then reopen
      if AActiveBindSourceAdapter.IsInterfaceBSA and Supports(AResultValue, IInterface, LIntf) then
        AActiveBindSourceAdapter.InternalSetDataObject(LIntf, AActiveBindSourceAdapter.ioOwnsObjects)
      else
        AActiveBindSourceAdapter.InternalSetDataObject(AResultValue, AActiveBindSourceAdapter.ioOwnsObjects);
      // Prevent AutoLoadData when activating the BSA
      AActiveBindSourceAdapter.Refreshing := False;
      // Send a notification to other ActiveBindSourceAdapters & BindSource
      if ANotify then
        AActiveBindSourceAdapter.Notify(AActiveBindSourceAdapter as TObject,
          TioLiveBindingsFactory.Notification(AActiveBindSourceAdapter as TObject, AActiveBindSourceAdapter.Current,
          ntAfterRefresh));
    end;
end;

end.
