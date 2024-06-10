unit Form.SynchroLog.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom,
  iORM.DB.DataSet.Master, iORM.SynchroStrategy.EtmBased, iORM.DB.DataSet.Detail;

type

  // Register the form into the dependency injection container as SimpleView for TioEtmSynchroStrategy_LogItem objects
  [diSimpleViewFor(TioEtmSynchroStrategy_LogItem, 'LIST')]
  TSynchroLogListForm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelTimeSlots: TPanel;
    Label3: TLabel;
    Splitter1: TSplitter;
    GridCustomers: TDBGrid;
    DBGrid1: TDBGrid;
    DSSynchroLog: TioDataSetMaster;
    SourceSynchroLog: TDataSource;
    ActionList1: TActionList;
    acBack: TioBSCloseQuery;
    acShowTimeSlot: TioBSShowOrSelect;
    DSSynchroLogID: TIntegerField;
    DSSynchroLogSynchroLevel: TStringField;
    DSSynchroLogSynchroLogName: TStringField;
    DSSynchroLogSynchroStatus: TStringField;
    DSSynchroLogEtmTimeSlot_ClassName: TStringField;
    DSSynchroLogSmartCount: TStringField;
    DSSynchroLogSmartUser: TStringField;
    DSSynchroLogSmartCliToSrv_TimeSlotID: TStringField;
    DSSynchroLogSmartSrvToCli_TimeSlotID: TStringField;
    DS_ETM: TioDataSetDetail;
    SourceETM: TDataSource;
    DS_ETMID: TIntegerField;
    DS_ETMDateAndTime: TDateTimeField;
    DSSynchroLogStart: TTimeField;
    DSSynchroLogLoadFromClient: TTimeField;
    DSSynchroLogPersistToServer: TTimeField;
    DSSynchroLogReloadFromServer: TTimeField;
    DSSynchroLogPersistToClient: TTimeField;
    DSSynchroLogFinalize: TTimeField;
    DSSynchroLogCompleted: TTimeField;
    DSSynchroLogDateAndTime: TDateTimeField;
    DS_ETMEntityClassName: TStringField;
    DS_ETMEntityID: TIntegerField;
    DS_ETMSmartEntityVersion: TStringField;
    DS_ETMSmartUser: TStringField;
    DS_ETMSmartActionType: TStringField;
    DS_ETMSmartConflictInfo: TStringField;
    DS_ETMSmartConflictCheckedByHuman: TStringField;
    DSSynchroLogErrorState: TStringField;
    DSSynchroLogErrorMsg: TStringField;
    ButtonShowTimeslot: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TSynchroLogListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TSynchroLogListForm.FormShow(Sender: TObject);
begin
  DSSynchroLog.Open;
end;

end.
