unit View.SynchroLog.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  iORM.SynchroStrategy.EtmBased, Vcl.Grids, Vcl.DBGrids;

type

  [diViewFor(TioEtmSynchroStrategy_LogItem, 'LIST')]
  TViewSynchroLogList = class(TViewBaseForList)
    PanelTimeSlots: TPanel;
    Label3: TLabel;
    GridETM: TDBGrid;
    ButtonShowTimeslot: TButton;
    Splitter1: TSplitter;
    GridCustomers: TDBGrid;
    BSMasterID: TIntegerField;
    BSMasterDateAndTime: TDateTimeField;
    BSMasterSynchroLevel: TStringField;
    BSMasterSynchroLogName: TStringField;
    BSMasterSynchroStatus: TStringField;
    BSMasterEtmTimeSlot_ClassName: TStringField;
    BSMasterStart: TTimeField;
    BSMasterLoadFromClient: TTimeField;
    BSMasterPersistToServer: TTimeField;
    BSMasterReloadFromServer: TTimeField;
    BSMasterPersistToClient: TTimeField;
    BSMasterFinalize: TTimeField;
    BSMasterCompleted: TTimeField;
    BSMasterSmartCount: TStringField;
    BSMasterSmartUser: TStringField;
    BSMasterSmartCliToSrv_TimeSlotID: TStringField;
    BSMasterSmartSrvToCli_TimeSlotID: TStringField;
    BSMasterErrorState: TStringField;
    BSMasterErrorMsg: TStringField;
    BS_ETM: TioModelDataSet;
    SourceETM: TDataSource;
    BS_ETMID: TIntegerField;
    BS_ETMDateAndTime: TDateTimeField;
    BS_ETMEntityClassName: TStringField;
    BS_ETMEntityID: TIntegerField;
    BS_ETMSmartEntityVersion: TStringField;
    BS_ETMSmartUser: TStringField;
    BS_ETMSmartActionType: TStringField;
    BS_ETMSmartConflictInfo: TStringField;
    BS_ETMSmartConflictCheckedByHuman: TStringField;
    acShowTimeSlot: TioViewAction;
  private
  public
  end;

implementation

{$R *.dfm}

end.
