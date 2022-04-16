unit iORM.LiveBindings.CommonBSBehavior;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.CommonTypes;

type

  // Methods and functionalities common to all BindSouces (ioDataSet also)
  TioCommonBSBehavior = class
  public
    // Common code for ABSA to manage notifications
    class procedure Notify(const ASender: TObject; const ATargetBS: IioNotifiableBindSource; const [Ref] ANotification: TioBSNotification);
    // Common code for selection
    class procedure Select<T>(const ASender: TObject; const ATargetBS: IioNotifiableBindSource; ASelected: T;
      ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // Common code for some checks by the bind sources
    class procedure CheckForSetDataObject(const ABindSource: IioNotifiableBindSource; const ALoadType: TioLoadType);
    class procedure CheckForSetSourceBS(const ABindSource, ASourceBS: IioNotifiableBindSource; const ALoadType: TioLoadType);
    class procedure CheckForSetLoadType(const ABindSource, ASourceBS: IioNotifiableBindSource; const ALoadType: TioLoadType);
  end;

implementation

uses
  Data.Bind.ObjectScope, System.SysUtils,
  iORM.LiveBindings.BSPersistence, System.Rtti, iORM.Exceptions,
  System.Classes;

{ TioCommonBSBehavior }

class procedure TioCommonBSBehavior.CheckForSetDataObject(const ABindSource: IioNotifiableBindSource; const ALoadType: TioLoadType);
begin
  if ALoadType <> ltManual then
    raise EioException.Create(ClassName, 'CheckForSetDataObject',
      Format('Invoking the "SetDataObject" method is allowed only if the "LoadType" property is set to "ltManual".'#13#13'Please set the property "LoadType" of the bind source "%s" (maybe a DataSet or BindSource) to "ltManual" and try again.',
      [ABindSource.GetName]));
end;

class procedure TioCommonBSBehavior.CheckForSetLoadType(const ABindSource, ASourceBS: IioNotifiableBindSource; const ALoadType: TioLoadType);
begin
  if Assigned(ASourceBS) and not(ALoadType in [ltFromBSAsIs, ltFromBSReload, ltFromBSReloadNewInstance]) then
    raise EioException.Create(ClassName, 'CheckForSetLoadType',
      Format('In order to set the "LoadType" property to a value other than "ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance", you must first set the "SourceXXX" property to blank (nil).'
      + #13#13'Please set the "SourceXXX" property of the bind source "%s" (maybe a DataSet or BindSource) to blank and then try again.', [ABindSource.GetName]));
end;

class procedure TioCommonBSBehavior.CheckForSetSourceBS(const ABindSource, ASourceBS: IioNotifiableBindSource; const ALoadType: TioLoadType);
begin
  if Assigned(ASourceBS) and not(ALoadType in [ltFromBSAsIs, ltFromBSReload, ltFromBSReloadNewInstance]) then
    raise EioException.Create(ClassName, 'CheckForSetSourceBS',
      Format('In order to set the "SourceXXX" property, you must first set the "LoadType" property to one of the values "ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance".'
      + #13#13'Please set the "LoadType" property of the bind source "%s" (maybe a DataSet or BindSource) to one of the above values and then try again.', [ABindSource.GetName]));
end;

class procedure TioCommonBSBehavior.Notify(const ASender: TObject; const ATargetBS: IioNotifiableBindSource; const [Ref] ANotification: TioBSNotification);
var
  LBSPersistenceClient: IioBSPersistenceClient;
  LNotificationPointer: PioBSNotification;
begin
  case ANotification.NotificationType of
    // Execute the AutoRefresh if enabled by the specific property
    ntRefresh:
      if ATargetBS.AutoRefreshOnNotification and (ATargetBS.State <> TBindSourceAdapterState.seInactive) then
        ATargetBS.Refresh(False);
    // Actually used for paging purposes (ObjState moved on "OnBeforeScroll" directly in the BindSource/DataSet/ModelPresenter master)
    ntScroll:
      ATargetBS.Paging.NotifyItemIndexChanged(ATargetBS.GetActiveBindSourceAdapter.ItemIndex);
    // Actually used for BSPersistence purposes
    ntSaveRevertPoint:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
        LBSPersistenceClient.Persistence.NotifySaveRevertPoint;
    // Set the response to True if the MasterBS has saved revert point or AutoSaveRevertPoint is possible
    ntCanReceiveSelection:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := LBSPersistenceClient.Persistence.CanReceiveSelection;
      end;
    // Set the response to True if the MasterBS has saved revert point or AutoSaveRevertPoint is possible
    ntCanInsertDetail:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := LBSPersistenceClient.Persistence.CanInsertDetail;
      end;
    // Set the response to True if the MasterBS has saved revert point or AutoSaveRevertPoint is possible
    ntCanDeleteDetail:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := LBSPersistenceClient.Persistence.CanDeleteDetail;
      end;
    // Actually used for BSPersistence purposes:
    // if enabled save a reference to the deleted object to perform a delete query when persist the MasterBS.
    // It return true (Response field of the notification) if the smart delete system is enabled and the
    // operation is succesfull
    ntDeleteSmart:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := (LBSPersistenceClient.OnDeleteAction = daSetSmartDeleteSystem);
        if ANotification.Response then
          LBSPersistenceClient.Persistence.SmartDeleteSystem.Add(ANotification.PayloadAsString, ANotification.PayloadAsInteger);
      end;
    // Actually used for ActiveBindSourceAdapters delete purposes:
    // It return true (Response field of the notification) if the ObjStatus delete mode system is enabled on the MasterBS
    ntObjStatusSetDeleted:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := (LBSPersistenceClient.OnDeleteAction >= daSetObjStatusIfExists);
      end;
    // Actually used for ActiveBindSourceAdapters insert/update purposes:
    // It return true (Response field of the notification) if the ObjStatus (dirty) mode system is enabled on the MasterBS
    ntObjStatusSetDirty:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := (LBSPersistenceClient.OnUpdateAction >= uaSetObjStatusIfExists);
      end;
    // Actually used for BSPersistence purposes:
    // if enabled save a reference to the current object to register it in the SmartUpdateDetection system
    ntSUD_RegisterObjOnEdit:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) and LBSPersistenceClient.Persistence.IsSmartUpdateDetectionEnabled then
        LBSPersistenceClient.Persistence.SmartUpdateDetection.NotifyEdit(ANotification.PayloadAsObject, ANotification.PayloadAsString);
    ntSUD_RegisterObjOnPost:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) and LBSPersistenceClient.Persistence.IsSmartUpdateDetectionEnabled then
        LBSPersistenceClient.Persistence.SmartUpdateDetection.NotifyPost(ANotification.PayloadAsObject, ANotification.PayloadAsString);
  end;
end;

class procedure TioCommonBSBehavior.Select<T>(const ASender: TObject; const ATargetBS: IioNotifiableBindSource; ASelected: T;
  ASelectionType: TioSelectionType = TioSelectionType.stAppend);
var
  LDestBSA: IioActiveBindSourceAdapter;
  LValue: TValue;
begin
  // Some checks
  if not Assigned(ATargetBS) then
    raise EioException.Create(ClassName, 'Select<T>',
      Format('You have tried to make a selection by invoking the "SelectCurrent" method of the "%s" component but its "SelectorFor" property was left blank.' +
      #13#13'iORM does not know which target component to forward the selection to.'#13#13'Please set the property and try again.',
      [(ASender as TComponent).Name]));
  if not ATargetBS.IsActive then
    raise EioException.Create(ClassName, 'Select<T>',
      Format('You have tried to make a selection by invoking the "SelectCurrent" method of component "%s" but the target component of the selection ("%s") is not active.' +
      #13#13'iORM cannot forward the selection.'#13#13'Please make sure that the target component of the selection is active as well and try again.',
      [(ASender as TComponent).Name, ATargetBS.GetName]));
  // Get the selection destination BindSourceAdapter
  LDestBSA := ATargetBS.GetActiveBindSourceAdapter;
  // If the selection is allowed then send a ntSaveRevertPoint notification
  if LDestBSA.Notify(ASender, TioBSNotification.Create(TioBSNotificationType.ntCanReceiveSelection)) then
    LDestBSA.Notify(ASender, TioBSNotification.Create(TioBSNotificationType.ntSaveRevertPoint))
  else
    raise EioException.Create(ClassName, 'Select<T>', 'Master BindSource hasn''t saved a revert point');
  // Encapsulate the SelectedInstance into a TValue then assign it
  // as selection in a proper way
  // NB: Lasciare assolutamente così perchè ho già provato in vari modi ma mi dava sempre un errore
  // facendo cos' invece (cioè passando per un TValue) funziona correttamente.
  LValue := TValue.From<T>(ASelected);
  if LValue.Kind = TTypeKind.tkInterface then
    LDestBSA.ReceiveSelection(LValue.AsInterface, ASelectionType)
  else if LValue.Kind = TTypeKind.tkClass then
    LDestBSA.ReceiveSelection(LValue.AsObject, ASelectionType)
  else
    raise EioException.Create(ClassName, 'Select<T>', 'Wrong LValue kind.');
end;

end.
