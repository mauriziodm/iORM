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
  iORM.DB.Components.BindSourceObjState;

{ TioCommonBSBehavior }

class procedure TioCommonBSBehavior.Notify(const ASender: TObject; const ATargetBS: IioNotifiableBindSource; const [Ref] ANotification: TioBSNotification);
var
  LBSObjStateClient: IioBindSourceObjStateClient;
begin
  // If the notification was sent by itself then it forwards it to the ActiveBindSourceAdapter for its propagation (outbound notification)
  if ASender = (ATargetBS as TObject) then
  begin
    // To be implemented (for now a BindSource can only receive notifications, not send them)
  end
  // If the notification was not sent by itself then react to it if necessary (inbound notification)
  else
  begin
    case Anotification.NotificationType of
      // Execute the AutoRefresh if enabled by the specific property
      ntRefresh: begin
        // If enabled perform an AutoRefresh operation
        if (ATargetBS.AutoRefreshOnNotification > arDisabled) and (ATargetBS.State <> TBindSourceAdapterState.seInactive) then
          ATargetBS.Refresh(ATargetBS.AutoRefreshOnNotification = TioAutoRefreshType.arEnabledReload, False);
      end;
      // Actually used for paging and for ObjStateManager purposes
      ntBeforeBrowse: begin
        if Supports(ATargetBS, IioBindSourceObjStateClient, LBSObjStateClient) then
          LBSObjStateClient.ObjState.NotifyRecordChange;
        ATargetBS.Paging.NotifyItemIndexChanged(ATargetBS.GetActiveBindSourceAdapter.ItemIndex);
      end;
      // Actually used ObjStateManager purposes
      ntSaveObjState: begin
        if Supports(ATargetBS, IioBindSourceObjStateClient, LBSObjStateClient) then
          LBSObjStateClient.ObjState.NotifyEdit;
      end;
    end;
  end;
end;

end.
