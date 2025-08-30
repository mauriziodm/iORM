unit Form.Etm.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, iORM, iORM.Attributes, iORM.CommonTypes, Data.DB,
  iORM.DB.DataSet.Master, Vcl.DBCtrls, Vcl.DBGrids, ETM.Repository, iORM.StdActions.Vcl,
  Vcl.ActnList, System.Actions;

type

  // Register the form into the dependency injection container as SimpleView for TEtmRepository objects
  [diSimpleViewFor(TEtmRepository, 'LIST')]
  TEtmListForm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    DS_ETM: TioDataSetMaster;
    DS_ETMDateAndTime: TDateTimeField;
    DS_ETMEntityClassName: TStringField;
    DS_ETMEntityID: TIntegerField;
    DS_ETMSmartEntityVersion: TStringField;
    DS_ETMSmartEventType: TStringField;
    PanelEntityInfo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    GridCustomers: TDBGrid;
    Splitter1: TSplitter;
    SourceETM: TDataSource;
    DBTextEntityClassName: TDBText;
    DBTextEntityID: TDBText;
    ActionList1: TActionList;
    acBack: TioBSCloseQuery;
    ButtonShowTimeslot: TSpeedButton;
    PanelDiff: TPanel;
    DiffMemo: TDBMemo;
    Label3: TLabel;
    acRevertToDB: TioBS_ETM_RevertToBindSource;
    DS_ETMDiffOneWay: TStringField;
    DS_ETMSmartConflictInfo: TStringField;
    DS_ETMSmartConflictCheckedByHuman: TStringField;
    acShowTimeSlot: TioBSShowOrSelect;
    ButtonRevertToDB: TSpeedButton;
    DS_ETMID: TIntegerField;
    acRevertToObj: TioBS_ETM_RevertToObject;
    acShowRevertedObj: TioBSShowOrSelect;
    ButonRevertToObject: TSpeedButton;
    DS_ETMUserName: TStringField;
    DS_ETMApp: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TEtmListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
