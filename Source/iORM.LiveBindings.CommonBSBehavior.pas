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
  end;

implementation

uses
  Data.Bind.ObjectScope, System.SysUtils,
  iORM.LiveBindings.BSPersistence;

{ TioCommonBSBehavior }

class procedure TioCommonBSBehavior.Notify(const ASender: TObject; const ATargetBS: IioNotifiableBindSource; const [Ref] ANotification: TioBSNotification);
var
  LBSPersistenceClient: IioBSPersistenceClient;
begin
  // If the notification was sent by itself then it forwards it to the ActiveBindSourceAdapter for its propagation (outbound notification)
  if ASender = (ATargetBS as TObject) then
  begin
    // To be implemented (for now a BindSource can only receive notifications, not send them)
  end
  // If the notification was not sent by itself then react to it if necessary (inbound notification)
  else
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
    end;
  end;
end;

end.
