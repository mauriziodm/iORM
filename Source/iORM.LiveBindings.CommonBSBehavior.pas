unit iORM.LiveBindings.CommonBSBehavior;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification;

type

  // Methods and functionalities common to all BindSouces (ioDataSet also)
  TioCommonBSBehavior = class
  public
    // NB: Common code for ABSA to manage notifications
    class procedure Notify(const ASender: TObject; const ATargetBS: IioNotifiableBindSource; const [Ref] ANotification: TioBSNotification);
    class function CanDoSelection(const ASender: TObject; const ASelectionDestBSA: IioActiveBindSourceAdapter): Boolean;
  end;

implementation

uses
  Data.Bind.ObjectScope, System.SysUtils,
  iORM.LiveBindings.BSPersistence;

{ TioCommonBSBehavior }

class function TioCommonBSBehavior.CanDoSelection(const ASender: TObject; const ASelectionDestBSA: IioActiveBindSourceAdapter): Boolean;
var
  LNotification: TioBSNotification;
begin
  LNotification := TioBSNotification.Create(TioBSNotificationType.ntCanDoSelection);
  ASelectionDestBSA.Notify(ASender, LNotification);
  Result := LNotification.Response;
end;

class procedure TioCommonBSBehavior.Notify(const ASender: TObject; const ATargetBS: IioNotifiableBindSource; const [Ref] ANotification: TioBSNotification);
var
  LBSPersistenceClient: IioBSPersistenceClient;
  LNotificationPointer: PioBSNotification;
begin
  case ANotification.NotificationType of
    // Execute the AutoRefresh if enabled by the specific property
    ntRefresh:
      if (ATargetBS.AutoRefreshOnNotification > arDisabled) and (ATargetBS.State <> TBindSourceAdapterState.seInactive) then
        ATargetBS.Refresh(ATargetBS.AutoRefreshOnNotification = TioAutoRefreshType.arEnabledReload, False);
    // Actually used for paging purposes (ObjState moved on "OnBeforeScroll" directly in the BindSource/DataSet/ModelPresenter master)
    ntScroll:
      ATargetBS.Paging.NotifyItemIndexChanged(ATargetBS.GetActiveBindSourceAdapter.ItemIndex);
    // Actually used BSPersistence purposes
    ntSaveRevertPoint:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
        LBSPersistenceClient.Persistence.NotifySaveObjState;
    // Set the response to True if the MasterBS has saved revert point or AutoSaveRevertPoint is possible
    ntCanDoSelection:
      if Supports(ATargetBS, IioBSPersistenceClient, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := LBSPersistenceClient.Persistence.CanDoSelection;
      end;
  end;
end;

end.
