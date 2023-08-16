unit Form.Where.OrderHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.StdActions.Vcl, Vcl.ActnList, System.Actions, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom,
  iORM.DB.DataSet.Master, Where.Order;

type

  [diSimpleViewFor(TWhereOrder)]
  TOrderWhereHistoryForm = class(TForm)
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonDelete: TSpeedButton;
    GridCustomers: TDBGrid;
    DSWhereHistory: TioDataSetMaster;
    DSWhereHistoryOrderID: TIntegerField;
    DSWhereHistoryFromDate: TDateField;
    DSWhereHistoryNote: TStringField;
    DSWhereHistoryOrderState: TStringField;
    SourceWhereHistory: TDataSource;
    ActionList1: TActionList;
    acDelete: TioBSPersistenceDelete;
    acBack: TioBSCloseQuery;
    DSWhereHistoryToDate: TDateField;
    acSelectCurrent: TioBSSelectCurrent;
    DSWhereHistoryCustomerName: TStringField;
    DSWhereHistoryRowsDescription: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCustomersDblClick(Sender: TObject);
  private
  public
  end;

implementation

uses
  Model.Order;

{$R *.dfm}

procedure TOrderWhereHistoryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOrderWhereHistoryForm.FormCreate(Sender: TObject);
begin
  DSWhereHistory.Open;
end;

procedure TOrderWhereHistoryForm.GridCustomersDblClick(Sender: TObject);
begin
  acSelectCurrent.Execute;
end;

end.
