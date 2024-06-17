unit Form.Etm.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.DB,
  iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, ETM.Repository, iORM.StdActions.Vcl,
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
    DS_ETMSmartUser: TStringField;
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
    acEtmRevertToVersion: TioBS_ETM_RevertToBindSource;
    DS_ETMDiffOneWay: TStringField;
    DS_ETMSmartConflictInfo: TStringField;
    DS_ETMSmartConflictCheckedByHuman: TStringField;
    acShowTimeSlot: TioBSShowOrSelect;
    ButtonRevertTo: TSpeedButton;
    DS_ETMID: TIntegerField;
    SpeedButton1: TSpeedButton;
    acEtmRevertToObject: TioBS_ETM_RevertToObject;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acEtmRevertToObjectAfterRevert(const ASender, ARevertedObj: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TEtmListForm.acEtmRevertToObjectAfterRevert(const ASender, ARevertedObj: TObject);
begin
  io.Show(ARevertedObj, acBack);
end;

procedure TEtmListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
