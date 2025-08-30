unit Form.Where.OrderHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.DBGrids, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.StdActions.Vcl, Vcl.ActnList, System.Actions,
  iORM.DB.DataSet.Master, Where.Order, iORM.Where.Interfaces, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, Vcl.Grids;

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
    acBack: TioBSCloseQuery;
    DSWhereHistoryToDate: TDateField;
    acSelectCurrent: TioBSSelectCurrent;
    DSWhereHistoryCustomerName: TStringField;
    DSWhereHistoryPizzaName: TStringField;
    DSWhereHistoryIngredientName: TStringField;
    acDelete: TioBSDelete;
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
