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
unit iORM.LiveBindings.CommonBSAPersistence;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.Where.Interfaces, iORM.CommonTypes,
  iORM.Context.Container, iORM.LiveBindings.BSPersistence;

type

  TioCommonBSAPersistenceThreadExecute = reference to function: TObject;
  TioCommonBSAPersistenceThreadOnTerminate = reference to procedure(AResultValue: TObject);

  TioCommonBSAPersistence = class
  private
    // Exucute
    class procedure _Execute(const AASync: Boolean; AExecuteMethod: TioCommonBSAPersistenceThreadExecute;
      ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate); static;
    class procedure _SyncExecute(AExecuteMethod: TioCommonBSAPersistenceThreadExecute; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate); static;
    class procedure _AsyncExecute(AExecuteMethod: TioCommonBSAPersistenceThreadExecute; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate); static;
    // Load object
    class procedure _LoadObject(const AASync: Boolean; const ATypeName, ATypeAlias: String; const ALazy: Boolean; const ALazyProps: String; AWhere: IioWhere;
      ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
    class procedure _LoadToObject(const AASync: Boolean; const ATypeName, ATypeAlias: String; const ALazy: Boolean; const ALazyProps: String; AWhere: IioWhere;
      ATargetObject: TObject; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
    // Load list
    class procedure _LoadList(const AASync: Boolean; const ATypeName, ATypeAlias: String; const ALazy: Boolean; const ALazyProps: String; AWhere: IioWhere;
      ATargetClass: TioClassRef; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
    class procedure _LoadToList(const AASync: Boolean; const ATypeName, ATypeAlias: String; const ALazy: Boolean; const ALazyProps: String; AWhere: IioWhere;
      ATargetList: TObject; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
    // Page manager
    class procedure _SetItemCountToPageManager(const ATypeName, ATypeAlias: String; AWhere: IioWhere);
  public
    // Create (ObjectBindSourceAdapter only)
    class procedure Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    // Load
    class procedure Load(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure LoadPage(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    // Refresh/ Reload
    class procedure Refresh(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ANotify: Boolean); static;
    class procedure Reload(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure ReloadNaturalBindSourceAdapter(const ANaturalBindSourceAdapter: IioNaturalActiveBindSourceAdapter); static;
    // Delete
    class procedure BSPersistenceDelete(const ABindSource: IioMasterBindSource); static;
    class procedure BeforeDelete(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure AfterDelete(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    // Post
    class procedure Post(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    // Persist
    class procedure PersistCurrent(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure PersistAll(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    // Scroll
    class procedure AfterScroll(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    // Edit
    class procedure BeforeEdit(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    // Insert/Append
    class procedure BeforeInsert(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
    class procedure AfterInsert(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter); static;
  end;

implementation

uses System.Classes, System.SysUtils, iORM.Exceptions, iORM, iORM.LiveBindings.Factory,
  iORM.Context.Properties.Interfaces, Data.Bind.ObjectScope, System.Generics.Collections,
  iORM.LiveBindings.CommonBSAPaging, iORM.LiveBindings.Notification,
  iORM.Utilities, iORM.LiveBindings.BSPersistence.SmartDeleteSystem,
  iORM.Where.Factory, iORM.Abstraction;

type

  TioCommonBSAAnonymousMethodsFactory = class
  public
    // persist
    class function GetPersistCurrentExecuteMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadExecute;
    class function GetPersistAllExecuteMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadExecute;
    // Delete
    class function GetDeleteExecuteMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadExecute;
    class function GetDeleteTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadOnTerminate;
    // Refresh/Reload
    class function GetReloadTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ANotify: Boolean)
      : TioCommonBSAPersistenceThreadOnTerminate;
    // LoadPage (progressive)
    class function GetProgressiveLoadPageTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadOnTerminate;
    // Other
    class function GetNotifyTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadOnTerminate;
  end;

  TioCommonBSAPersistenceThread = class(TThread)
  strict private
    FExceptionMessage: String;
    FExecuteFunc: TioCommonBSAPersistenceThreadExecute;
    FOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate;
    FResultValue: TObject;
  strict protected
    procedure Execute; override;
    procedure OnTerminateEventHandler(Sender: TObject);
  public
    constructor Create(AExecuteFunc: TioCommonBSAPersistenceThreadExecute; AOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate); overload;
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

class procedure TioCommonBSAPersistence.BeforeEdit(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Notification to save revert point before edit
  AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.Create(TioBSNotificationType.ntSaveRevertPoint));
  // Notification to register the current object into the SmartUpdateDetection system
  AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.CreateSUDRegisterObjOnEdit(AActiveBindSourceAdapter.Current,
    AActiveBindSourceAdapter.GetMasterPropertyPath));
  // Loop for all the upper BSA details up to the BSA Master (included) and for each level register the instance in the SUD
  //  (Smart Update Detection system) to cause the persistence of each level when the pe is performed.
  LActiveBSA := AActiveBindSourceAdapter;
  while LActiveBSA.IsDetailBSA do
  begin
    LActiveBSA := LActiveBSA.GetMasterBindSourceAdapter;
    LActiveBSA.Notify(TObject(LActiveBSA), TioBSNotification.CreateSUDRegisterObjOnEdit(LActiveBSA.Current, LActiveBSA.GetMasterPropertyPath));
  end;
end;

class procedure TioCommonBSAPersistence.BeforeInsert(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin
  // If the delete detail is allowed then send a ntSaveRevertPoint notification
  if AActiveBindSourceAdapter.Notify(AActiveBindSourceAdapter as TObject, TioBSNotification.Create(TioBSNotificationType.ntCanInsertDetail)) then
    AActiveBindSourceAdapter.Notify(AActiveBindSourceAdapter as TObject, TioBSNotification.Create(TioBSNotificationType.ntSaveRevertPoint))
  else
    raise EioGenericException.Create(ClassName, 'BeforeInsert', 'Master BindSource hasn''t saved a revert point');
end;

class procedure TioCommonBSAPersistence.BSPersistenceDelete(const ABindSource: IioMasterBindSource);
var
  LActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  LExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  LActiveBindSourceAdapter := ABindSource.GetActiveBindSourceAdapter;
  // If current is nil then exit
  if not Assigned(LActiveBindSourceAdapter.Current) then
    Exit;
  // Set anonimous methods
  LExecuteMethod := TioCommonBSAAnonymousMethodsFactory.GetDeleteExecuteMethod(LActiveBindSourceAdapter);
  LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetDeleteTerminateMethod(LActiveBindSourceAdapter);
  // Execute synchronous or asynchronous
  _Execute(LActiveBindSourceAdapter.AsyncPersist, LExecuteMethod, LTerminateMethod);
end;

class procedure TioCommonBSAPersistence.BeforeDelete(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin
  // If the delete detail is allowed then send a ntSaveRevertPoint notification
  if AActiveBindSourceAdapter.Notify(AActiveBindSourceAdapter as TObject, TioBSNotification.Create(TioBSNotificationType.ntCanDeleteDetail)) then
    AActiveBindSourceAdapter.Notify(AActiveBindSourceAdapter as TObject, TioBSNotification.Create(TioBSNotificationType.ntSaveRevertPoint))
  else
    raise EioGenericException.Create(ClassName, 'Delete', 'Master BindSource hasn''t saved a revert point');
  // If it is during a BSPersistenceDeleting operation or current is nil or if daSetSmartDeleteSystem is selected as OnDeleteAction on the MasterBS
  if AActiveBindSourceAdapter.BSPersistenceDeleting or (AActiveBindSourceAdapter.Current = nil) or
    AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.CreateDeleteSmartNotification(AActiveBindSourceAdapter.Current)) then
    Exit;
  // If UseObjStatus is true then set ObjStatus propriety and abort (If "daSetObjStatusIfExists" delete mode is selected as OnDeleteAction on the MasterBS)
  if AActiveBindSourceAdapter.UseObjStatus and AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter),
    TioBSNotification.Create(ntObjStatusSetDeleted)) then
  begin
    AActiveBindSourceAdapter.SetObjStatus(osDeleted);
    Abort;
  end;
end;

class procedure TioCommonBSAPersistence.AfterDelete(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LBSPersistenceClient: IioMasterBindSource;
begin
  // If it is a MasterBindSource then clear the BSPersistence revert point
  if AActiveBindSourceAdapter.HasBindSource and Supports(AActiveBindSourceAdapter.GetBindSource, IioMasterBindSource, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.Clear(False);
  // DataSet synchro
  AActiveBindSourceAdapter.GetDataSetLinkContainer.Refresh;
  // Refresh notification
  AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.Create(ntRefresh));
end;

class procedure TioCommonBSAPersistence.Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LObj: TObject;
  LIntf: IInterface;
begin
  case AActiveBindSourceAdapter.TypeOfCollection of
    TioTypeOfCollection.tcSingleObject:
      begin
        LObj := io.di.Locate(AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias).Get;
        if AActiveBindSourceAdapter.IsInterfaceBSA and Supports(LObj, IInterface, LIntf) then
          AActiveBindSourceAdapter.InternalSetDataObject(LIntf, AActiveBindSourceAdapter.ioOwnsObjects)
        else
          AActiveBindSourceAdapter.InternalSetDataObject(LObj, AActiveBindSourceAdapter.ioOwnsObjects);
      end;
    TioTypeOfCollection.tcList:
      raise EioGenericException.Create(ClassName, 'Create', '"ltCreate" value for "LoadType" property is valid only if "TypeOfCollection" is set to "tcSingleObject"');
  else
    raise EioGenericException.Create(ClassName, 'Create', 'Wrong TypeOfCollection');
  end;
end;

class procedure TioCommonBSAPersistence.Load(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LTargetClass: TioClassRef;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  LTargetClass := nil;
  // If AutoLoadData is disabled then exit
  // Prevent AutoLoadData when reloading
  if AActiveBindSourceAdapter.Reloading  or not AActiveBindSourceAdapter.AutoLoad then
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
  case AActiveBindSourceAdapter.TypeOfCollection of
    TioTypeOfCollection.tcSingleObject:
      _LoadObject(AActiveBindSourceAdapter.AsyncLoad, AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias, AActiveBindSourceAdapter.Lazy,
        AActiveBindSourceAdapter.LazyProps, AActiveBindSourceAdapter.ioWhere, LTerminateMethod);
    TioTypeOfCollection.tcList:
      _LoadList(AActiveBindSourceAdapter.AsyncLoad, AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias, AActiveBindSourceAdapter.Lazy,
        AActiveBindSourceAdapter.LazyProps, AActiveBindSourceAdapter.ioWhere, LTargetClass, LTerminateMethod);
  else
    raise EioGenericException.Create('TioCommonBSAPersistence.Load: wrong TypeOfCollection');
  end;
end;

class procedure TioCommonBSAPersistence.LoadPage(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LPagingObj: TioCommonBSAPageManager;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // If the adapter is a detail adapter or AutoLoadData is not active then do not execute
  if AActiveBindSourceAdapter.HasMasterBSA or (AActiveBindSourceAdapter.TypeOfCollection <> tcList) or not AActiveBindSourceAdapter.AutoLoad then
    Exit;
  // Extract the paging obj from the where obj
  LPagingObj := AActiveBindSourceAdapter.ioWhere.GetPagingObj as TioCommonBSAPageManager;
  // Load next page
  if LPagingObj.IsProgressive then
  begin
    // If the pagination is progressive then it loads the next page and adds it to the
    // internal list of the BSA and then does a Refresh(False)
    LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetProgressiveLoadPageTerminateMethod(AActiveBindSourceAdapter);
    _LoadToList(AActiveBindSourceAdapter.AsyncLoad, AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias, AActiveBindSourceAdapter.Lazy,
      AActiveBindSourceAdapter.LazyProps, AActiveBindSourceAdapter.ioWhere, AActiveBindSourceAdapter.DataObject, LTerminateMethod);
  end
  else
    // If, on the other hand, the pagination is not progressive then it performs a normal Refresh(True)
    // which in practice causes a normal loading in a new list which is then set as a new DataObject
    Reload(AActiveBindSourceAdapter);
end;

class procedure TioCommonBSAPersistence.Refresh(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ANotify: Boolean);
begin
  AActiveBindSourceAdapter.AsTBindSourceAdapter.Refresh;
  // Also refresh any DataSets
  AActiveBindSourceAdapter.GetDataSetLinkContainer.Refresh(True); // Force
  // Send a notification to other ActiveBindSourceAdapters & BindSource
  if ANotify then
    AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.Create(ntRefresh));
end;

class procedure TioCommonBSAPersistence.AfterInsert(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LBSPersistenceClient: IioMasterBindSource;
begin
  // If it is a MasterBindSource then clear the BSPersistence revert point
  if AActiveBindSourceAdapter.HasBindSource and Supports(AActiveBindSourceAdapter.GetBindSource, IioMasterBindSource, LBSPersistenceClient) then
    LBSPersistenceClient.Persistence.Clear(False);
  // DataSet synchro
  AActiveBindSourceAdapter.GetDataSetLinkContainer.Refresh;
  // Refresh notification
  AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.Create(ntRefresh));
end;

class procedure TioCommonBSAPersistence.AfterScroll(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
  procedure _InjectExtractCurrentEntityFunc;
  var
    LMasterBindSource: IioMasterBindSource;
  begin
    if AActiveBindSourceAdapter.HasBindSource and Supports(AActiveBindSourceAdapter.GetBindSource, IioMasterBindSource, LMasterBindSource) then
    begin
      TioEtmCustomTimeSlot(AActiveBindSourceAdapter.Current)._ExtractCurrentEntityFunc :=
        function: TObject
        begin
          if Assigned(LMasterBindSource.ETMfor) and LMasterBindSource.ETMfor.IsActive then
            Result := LMasterBindSource.ETMfor.Current
          else
            raise EioEtmException.Create('This is iORM speaking, we have a problem.' +
              #13#13'You''re trying to use one of the "Diff..." properties or methods from an ETM repository (a class derived from TioEtmCustomTimeSlot).' +
              #13#13'These properties work correctly only if the ETM repository is exposed by a MasterBindSource which has its "ETMfor" property set to ' +
              'reference another BindSource containing the entity whose timeline you want to see (its history) and obviously both bind sources need to be active.' +
              #13#13'If this is not possible then you can call the ETM engine "Diff..." methods directly by writing code like "io.etm.Diff(...)".' +
              #13#13'There are several Diff methods (Diff, DiffToFile, DiffToStream, DiffAsJsonObject) each with multiple overloads available.' +
              #13#13'You will surely find something that fits your needs.');
        end;
    end;
  end;
begin
  // Set the new master object (only for list BSA)
  if AActiveBindSourceAdapter.TypeOfCollection = tcList then
    AActiveBindSourceAdapter.DetailAdaptersContainer.SetMasterObject(AActiveBindSourceAdapter.Current);
  // DataSet synchro
  AActiveBindSourceAdapter.GetDataSetLinkContainer.SetRecNo(AActiveBindSourceAdapter.ItemIndex);
  // Paging & BSPersistence notification
  AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.Create(TioBSNotificationType.ntScroll));
  // Se l'oggetto corrente è un ETM TimeSlot allora inietta il metodo anonimo attraverso il quale
  //  il TimeSlot potrà richiedere la versione corrente della entità
  if Assigned(AActiveBindSourceAdapter.Current) and (AActiveBindSourceAdapter.Current is TioEtmCustomTimeSlot) and
    not Assigned(TioEtmCustomTimeSlot(AActiveBindSourceAdapter.Current)._ExtractCurrentEntityFunc) then
  begin
    _InjectExtractCurrentEntityFunc;
    AActiveBindSourceAdapter.Refresh(False);
  end;
end;

class procedure TioCommonBSAPersistence.Reload(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LPagingObj: TioCommonBSAPageManager;
  LTargetClass: TioClassRef;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // Checks
  if AActiveBindSourceAdapter.GetBindSource = nil then
    raise EioGenericException.Create(ClassName, 'Reload', Format('Unassigned bind source (TypeName = "%s", TypeAlias = "%s")',
      [AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias]));
  if not AActiveBindSourceAdapter.GetBindSource.IsMasterBS then
    raise EioGenericException.Create(ClassName, 'Reload',
      Format('This is isn''t a master bind source  (TypeName = "%s", TypeAlias = "%s").'#13'Reload is for master bind source only.',
      [AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias]));

  LTargetClass := nil;
  // Prevent AutoLoadData when activating the BSA
  AActiveBindSourceAdapter.Reloading := True;
  // If it's a ListBindSourceAdapter then retrieve the list target class
  if Assigned(AActiveBindSourceAdapter.DataObject) then
    LTargetClass := AActiveBindSourceAdapter.DataObject.ClassType;
  // Set the OnTerminate method
  LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetReloadTerminateMethod(AActiveBindSourceAdapter, False); // Notify = false (verificare)
  // Extract the paging obj from the where obj and prepare it for an HardRefresh
  LPagingObj := AActiveBindSourceAdapter.ioWhere.GetPagingObj as TioCommonBSAPageManager;
  LPagingObj.PrepareForRefresh;
  // Load
  case AActiveBindSourceAdapter.TypeOfCollection of
    TioTypeOfCollection.tcSingleObject:
      _LoadObject(AActiveBindSourceAdapter.AsyncLoad, AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias, AActiveBindSourceAdapter.Lazy,
        AActiveBindSourceAdapter.LazyProps, AActiveBindSourceAdapter.ioWhere, LTerminateMethod);
    TioTypeOfCollection.tcList:
      _LoadList(AActiveBindSourceAdapter.AsyncLoad, AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias, AActiveBindSourceAdapter.Lazy,
        AActiveBindSourceAdapter.LazyProps, AActiveBindSourceAdapter.ioWhere, LTargetClass, LTerminateMethod);
  else
    raise EioGenericException.Create(ClassName, 'Reload', Format('Wrong "TypeOfCollection" property value (TypeName = "%s", TypeAlias = "%s")',
      [AActiveBindSourceAdapter.TypeName, AActiveBindSourceAdapter.TypeAlias]));
  end;
end;

class procedure TioCommonBSAPersistence.ReloadNaturalBindSourceAdapter(const ANaturalBindSourceAdapter: IioNaturalActiveBindSourceAdapter);
var
  LActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
  LDataObject: TObject;
  LWhere: IioWhere;
begin
  // Extract the IioActiveBindSourceAdapter interface
  if not Supports(ANaturalBindSourceAdapter, IioActiveBindSourceAdapter, LActiveBindSourceAdapter) then
    raise EioGenericException.Create(ClassName, 'ReloadNaturalBindSourceAdapter', 'ANaturalBindSourceAdapter does not implement IioActiveBindSOurceAdapter interface');
  // Checks
  if LActiveBindSourceAdapter.GetBindSource = nil then
    raise EioGenericException.Create(ClassName, 'ReloadNaturalBindSourceAdapter', Format('Unassigned bind source (TypeName = "%s", TypeAlias = "%s")',
      [LActiveBindSourceAdapter.TypeName, LActiveBindSourceAdapter.TypeAlias]));
  if not LActiveBindSourceAdapter.GetBindSource.IsMasterBS then
    raise EioGenericException.Create(ClassName, 'ReloadNaturalBindSourceAdapter',
      Format('This is isn''t a master bind source  (TypeName = "%s", TypeAlias = "%s").'#13'Reload is for master bind source only.',
      [LActiveBindSourceAdapter.TypeName, LActiveBindSourceAdapter.TypeAlias]));
  // Extract the current DataObject and the where condition to reload it
  LDataObject := LActiveBindSourceAdapter.Current;
  if TioUtilities.IsNullOID(LDataObject) then
    Exit;
  LWhere := TioWhereFactory.NewWhere.ByID( TioUtilities.ObjToID(LDataObject) );
  // Reload
  case LActiveBindSourceAdapter.LoadType of
    // Reload to the same instance
    ltFromBSAsIs, ltFromBSReload:
      begin
        LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetNotifyTerminateMethod(LActiveBindSourceAdapter);
        _LoadToObject(LActiveBindSourceAdapter.AsyncLoad, LDataObject.ClassName, '', LActiveBindSourceAdapter.Lazy, LActiveBindSourceAdapter.LazyProps, LWhere,
          LDataObject, LTerminateMethod);
      end;
    // Reload on a new instance
    ltFromBSReloadNewInstance:
      begin
        LActiveBindSourceAdapter.Reloading := True;
        LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetReloadTerminateMethod(LActiveBindSourceAdapter, False); // Notify = false (verificare)
        _LoadObject(LActiveBindSourceAdapter.AsyncLoad, LDataObject.ClassName, '', LActiveBindSourceAdapter.Lazy, LActiveBindSourceAdapter.LazyProps, LWhere,
          LTerminateMethod);
      end
  else
    raise EioGenericException.Create(ClassName, 'ReloadNaturalBindSourceAdapter', Format('Wrong "LoadType" property value (TypeName = "%s", TypeAlias = "%s")',
      [LActiveBindSourceAdapter.TypeName, LActiveBindSourceAdapter.TypeAlias]));
  end;
end;

class procedure TioCommonBSAPersistence.PersistAll(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // If it's a single object then call the normal PersistCurrent method and exit
  if AActiveBindSourceAdapter.TypeOfCollection = TioTypeOfCollection.tcSingleObject then
  begin
    PersistCurrent(AActiveBindSourceAdapter);
    Exit;
  end;
  // if editing the post
  if AActiveBindSourceAdapter.State in seEditModes then
    AActiveBindSourceAdapter.Post;
  // Set anonimous methods then execute
  LExecuteMethod := TioCommonBSAAnonymousMethodsFactory.GetPersistAllExecuteMethod(AActiveBindSourceAdapter);
  LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetNotifyTerminateMethod(AActiveBindSourceAdapter);
  _Execute(AActiveBindSourceAdapter.AsyncPersist, LExecuteMethod, LTerminateMethod);
end;

class procedure TioCommonBSAPersistence.PersistCurrent(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LExecuteMethod: TioCommonBSAPersistenceThreadExecute;
  LTerminateMethod: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // if editing the post
  if AActiveBindSourceAdapter.State in seEditModes then
    AActiveBindSourceAdapter.Post;
  // Set anonimous methods then execute
  LExecuteMethod := TioCommonBSAAnonymousMethodsFactory.GetPersistCurrentExecuteMethod(AActiveBindSourceAdapter);
  LTerminateMethod := TioCommonBSAAnonymousMethodsFactory.GetNotifyTerminateMethod(AActiveBindSourceAdapter);
  _Execute(AActiveBindSourceAdapter.AsyncPersist, LExecuteMethod, LTerminateMethod);
end;

class procedure TioCommonBSAPersistence.Post(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin
  // If enabled then set che objStatus property of the object to Dirty
  if AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.Create(ntObjStatusSetDirty)) then
    AActiveBindSourceAdapter.SetObjStatus(osDirty);
  // Notification to register the current object into the SmartUpdateDetection system
  AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.CreateSUDRegisterObjOnPost(AActiveBindSourceAdapter.Current,
    AActiveBindSourceAdapter.GetMasterPropertyPath));
  // Refresh
  AActiveBindSourceAdapter.Refresh;
end;

class procedure TioCommonBSAPersistence._SetItemCountToPageManager(const ATypeName, ATypeAlias: String; AWhere: IioWhere);
var
  LCount: Integer;
  LPagingObj: TioCommonBSAPageManager;
begin
  LPagingObj := AWhere.GetPagingObj as TioCommonBSAPageManager;
  if LPagingObj.Enabled then
  begin
    LCount := io.RefTo(ATypeName, ATypeAlias)._Where(AWhere).Count;
    LPagingObj.SetItemCount(LCount);
  end;
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

class procedure TioCommonBSAPersistence._LoadList(const AASync: Boolean; const ATypeName, ATypeAlias: String; const ALazy: Boolean; const ALazyProps: String;
  AWhere: IioWhere; ATargetClass: TioClassRef; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  _Execute(AASync,
    function: TObject
    begin
      io.StartTransaction;
      try
        // Load list
        Result := io.Load(ATypeName, ATypeAlias).Lazy(ALazy).LazyProps(ALazyProps)._Where(AWhere).ToList(ATargetClass);
        // Load count
        _SetItemCountToPageManager(ATypeName, ATypeAlias, AWhere);
        io.CommitTransaction;
      except
        io.RollbackTransaction;
        raise;
      end;
    end, ATerminateMethod);
end;

// Load objects into an existing List
// Note: This isn't a reload for lazy loading purposes but for paging (used in LoadPage method)
class procedure TioCommonBSAPersistence._LoadToList(const AASync: Boolean; const ATypeName, ATypeAlias: String; const ALazy: Boolean; const ALazyProps: String;
AWhere: IioWhere; ATargetList: TObject; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  _Execute(AASync,
    function: TObject
    begin
      io.StartTransaction;
      try
        // Load to list
        Result := nil;
        io.Load(ATypeName, ATypeAlias).Lazy(ALazy).LazyProps(ALazyProps)._Where(AWhere).ToList(ATargetList);
        // Load count
        _SetItemCountToPageManager(ATypeName, ATypeAlias, AWhere);
        io.CommitTransaction;
      except
        io.RollbackTransaction;
        raise;
      end;
    end, ATerminateMethod);
end;

// Load object into an existing instance
// Note: This isn't a reload for lazy loading purposes
class procedure TioCommonBSAPersistence._LoadToObject(const AASync: Boolean; const ATypeName, ATypeAlias: String; const ALazy: Boolean;
const ALazyProps: String; AWhere: IioWhere; ATargetObject: TObject; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  _Execute(AASync,
    function: TObject
    begin
      Result := nil;
      io.Load(ATypeName, ATypeAlias).Lazy(ALazy).LazyProps(ALazyProps)._Where(AWhere).ClearListBefore.ToObject(ATargetObject);
    end, ATerminateMethod);
end;

class procedure TioCommonBSAPersistence._LoadObject(const AASync: Boolean; const ATypeName, ATypeAlias: String; const ALazy: Boolean; const ALazyProps: String;
AWhere: IioWhere; ATerminateMethod: TioCommonBSAPersistenceThreadOnTerminate);
begin
  _Execute(AASync,
    function: TObject
    begin
      Result := io.Load(ATypeName, ATypeAlias).Lazy(ALazy).LazyProps(ALazyProps)._Where(AWhere).ToObject;
    end, ATerminateMethod);
end;

{ TioCommonBSAPersistenceThread }

constructor TioCommonBSAPersistenceThread.Create(AExecuteFunc: TioCommonBSAPersistenceThreadExecute;
AOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate);
begin
  inherited Create(True);
  FExecuteFunc := AExecuteFunc;
  FOnTerminateProc := AOnTerminateProc;
  FExceptionMessage := String.Empty;
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
    begin
      FExceptionMessage := E.Message;
      raise;
    end;
  end;
end;

procedure TioCommonBSAPersistenceThread.OnTerminateEventHandler(Sender: TObject);
var
  LExceptionMessage: String;
begin
  try
    // If an exception was raised during the execution of the thread then load the error message into a local variable
    //  (otherwise I had problems) and then raise a new exception with the same message so that it comes out to the user too.
    // note: The new exception is raised decoupled with a Timer because I had problems otherwise.
    if not FExceptionMessage.IsEmpty then
    begin
      io.HideWait;
      LExceptionMessage := FExceptionMessage;
      // TODO: uniGUI - Probabilmente ci saranno dei problemi con uniGUI, controllare
      TioAnonymousTimer.Create(100, function: Boolean
        begin
          raise EioGenericException.Create(LExceptionMessage);
        end);
    end
    else
    // If everything went well, it executes the terminate anonymous method
    if Assigned(FOnTerminateProc) then
      FOnTerminateProc(FResultValue);
  finally
    io.HideWait;
  end;
end;

function TioCommonBSAPersistenceThread.ResultValue: TObject;
begin
  Result := FResultValue;
end;

{ TioCommonBSAAnonymousMethodsFactory }

class function TioCommonBSAAnonymousMethodsFactory.GetDeleteExecuteMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): TioCommonBSAPersistenceThreadExecute;
var
  LID: Integer;
  LDataObj: TObject;
  LConflictResolved: Boolean;
begin
  // Save into local variables to avoid multithread resource access inconsistency problems
  // TODO: Multithread - Accesso all'oggetto da eliminare non protetto in caso di Async = True
  LDataObj := AActiveBindSourceAdapter.Current;
  LID := TioUtilities.ObjToID(LDataObj);
  AActiveBindSourceAdapter.BSPersistenceDeleting := True; // Look at GetDeleteTerminateMethod below
  // Build the anonimous method
  Result := function: TObject
    begin
      Result := nil;
      if LID <> 0 then
      begin
        // Delete the DataObj and if a conflict exception is raised then invoke the BindSOurce onDeleteConflictException
        //  event handler (if the event handler is assigned)
        try
          io.DeleteObject(LDataObj);
        except
          // Try to resolve the unresolved conflict (raise) invoking the BindSource.OnDeleteConflictException event handler if assigned
          on E: EioDeleteConflictException do
          begin
            if AActiveBindSourceAdapter.HasBindSource and Assigned(AActiveBindSourceAdapter.GetBindSource.OnDeleteConflictException) then
            begin
              LConflictResolved := False;
              AActiveBindSourceAdapter.GetBindSource.OnDeleteConflictException(AActiveBindSourceAdapter.GetBindSource as TObject, LDataObj, LConflictResolved);
              if not LConflictResolved then
                raise;
            end
            else
              raise;
          end
          else
            raise;
        end;
      end;
    end;
end;
//class function TioCommonBSAAnonymousMethodsFactory.GetDeleteExecuteMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ADataObj: TObject)
//  : TioCommonBSAPersistenceThreadExecute;
//var
//  LID: Integer;
//  LClassName: String;
//begin
//  // Save into local variables to avoid multithread resource access inconsistency problems
//  LClassName := ADataObj.ClassName;
//  LID := TioUtilities.ExtractOID(ADataObj);
//  AActiveBindSourceAdapter.BSPersistenceDeleting := True; // Look at GetDeleteTerminateMethod below
//  Result := function: TObject
//    begin
//      Result := nil;
//      if LID <> 0 then
//        io.RefTo(LClassName).ByID(LID).Cacheable.Delete;
//    end;
//end;

class function TioCommonBSAAnonymousMethodsFactory.GetDeleteTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter)
  : TioCommonBSAPersistenceThreadOnTerminate;
begin
  Result := procedure(AResultValue: TObject)
    begin
      AActiveBindSourceAdapter.Delete;
      AActiveBindSourceAdapter.BSPersistenceDeleting := False; // Look at GetDeleteExecuteMethod above
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetNotifyTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter)
  : TioCommonBSAPersistenceThreadOnTerminate;
begin
  Result := procedure(AResultValue: TObject)
    begin
      // Send a notification to other ActiveBindSourceAdapters & BindSource
      AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.Create(ntRefresh));
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetPersistAllExecuteMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter)
  : TioCommonBSAPersistenceThreadExecute;
begin
  Result := function: TObject
    begin
      Result := nil;
      io.PersistList(AActiveBindSourceAdapter.DataObject, BL_DEFAULT);
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetPersistCurrentExecuteMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter)
  : TioCommonBSAPersistenceThreadExecute;
var
  LMasterBindSource: IioMasterBindSource;
  LDataObj: TObject;
  LConflictResolved: Boolean;
begin
  // Save into local variables to avoid multithread resource access inconsistency problems
  // TODO:  Multithread - Accesso all'oggetto da persistere non protetto in caso di Async = True
  LDataObj := AActiveBindSourceAdapter.Current;
  // Build the anonimous method
  Result := function: TObject
    begin
      Result := nil;
      // Continues only if there is a BindSource connected and it is a MasterBindSource
      if AActiveBindSourceAdapter.HasBindSource and Supports(AActiveBindSourceAdapter.GetBindSource, IioMasterBindSource, LMasterBindSource) then
      begin
        io.StartTransaction;
        try
          // Persist the current obj and if a conflict exception is raised then invoke the BindSOurce onDeleteConflictException/onUpdateConflictException
          //  event handler (if the event handler is assigned)
          // ----------------------------------------------------------------------------------------------------------------------------
          try
            io._PersistObjectInternal(LDataObj, itRegular, '', 0, LMasterBindSource.Persistence, '', '', BL_DEFAULT);
          except
            // Try to resolve the unresolved conflict (raise) invoking the BindSource.OnDeleteConflictException/OnUpdateConflictException
            //  event handler if assigned
            // ----------------------------
            // BS.OnDeleteConclictException
            on E: EioDeleteConflictException do
            begin
              if AActiveBindSourceAdapter.HasBindSource and Assigned(AActiveBindSourceAdapter.GetBindSource.OnDeleteConflictException) then
              begin
                LConflictResolved := False;
                AActiveBindSourceAdapter.GetBindSource.OnDeleteConflictException(AActiveBindSourceAdapter.GetBindSource as TObject, LDataObj, LConflictResolved);
                if not LConflictResolved then
                  raise;
              end
              else
                raise;
            end;
            // ----------------------------
            // BS.OnUpdateConclictException
            on E: EioUpdateConflictException do
            begin
              if AActiveBindSourceAdapter.HasBindSource and Assigned(AActiveBindSourceAdapter.GetBindSource.OnUpdateConflictException) then
              begin
                LConflictResolved := False;
                AActiveBindSourceAdapter.GetBindSource.OnUpdateConflictException(AActiveBindSourceAdapter.GetBindSource as TObject, LDataObj, LConflictResolved);
                if not LConflictResolved then
                  raise;
              end
              else
                raise;
            end;
            // ----------------------------
          else
            raise;
          end;
          // ----------------------------------------------------------------------------------------------------------------------------
          // Delete objects referenced into the SmartDeleteSystem (details I think)
          LMasterBindSource.Persistence.SmartDeleteSystem.ForEach(
            procedure(ASmartDeleteSystemItem: TioSmartDeleteSystemItem)
            begin
              // TODO: ETM: Qui si è salvato il tipo e l'ID dell'oggetto da eliminare ma così salta ETM e conflict strategy
              io.RefTo(ASmartDeleteSystemItem.TypeName).ByID(ASmartDeleteSystemItem.ID).Cacheable.Delete;
            end);
          // ----------------------------------------------------------------------------------------------------------------------------
          // commit
          io.CommitTransaction;
          // Clear saved state
          LMasterBindSource.Persistence.Clear(False);
        except
          io.RollbackTransaction;
          raise;
        end;
      end;
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetProgressiveLoadPageTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter)
  : TioCommonBSAPersistenceThreadOnTerminate;
begin
  Result := procedure(AResultValue: TObject)
    begin
      // Perform a RefreshNoReload without nofications
      TioCommonBSAPersistence.Refresh(AActiveBindSourceAdapter, False);
    end;
end;

class function TioCommonBSAAnonymousMethodsFactory.GetReloadTerminateMethod(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ANotify: Boolean)
  : TioCommonBSAPersistenceThreadOnTerminate;
begin
  Result := procedure(AResultValue: TObject)
    var
      LIntf: IInterface;
    begin
      // Close the BSA, substitute the DataObject then reopen
      if AActiveBindSourceAdapter.IsInterfaceBSA and Supports(AResultValue, IInterface, LIntf) then
        AActiveBindSourceAdapter.InternalSetDataObject(LIntf, AActiveBindSourceAdapter.ioOwnsObjects)
      else
        AActiveBindSourceAdapter.InternalSetDataObject(AResultValue, AActiveBindSourceAdapter.ioOwnsObjects);
      // Prevent AutoLoadData when activating the BSA
      AActiveBindSourceAdapter.Reloading := False;
      // Send a notification to other ActiveBindSourceAdapters & BindSource
      if ANotify then
        AActiveBindSourceAdapter.Notify(TObject(AActiveBindSourceAdapter), TioBSNotification.Create(ntRefresh));
    end;
end;

end.

