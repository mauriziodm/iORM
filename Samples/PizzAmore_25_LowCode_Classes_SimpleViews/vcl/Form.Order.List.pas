unit Form.Order.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom,
  iORM.DB.DataSet.Master, Model.Order, Vcl.Mask;

type

  // Register the form into the dependency injection container as SimpleView for TOrder objects
  //  (alias "LIST" to avoid an ambiguity with the one registered for a single order)
  [diSimpleViewFor(TOrder, 'LIST')]
  TOrderListForm = class(TForm)
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonDelete: TSpeedButton;
    GridCustomers: TDBGrid;
    DSOrders: TioDataSetMaster;
    DSOrdersID: TIntegerField;
    SourceOrders: TDataSource;
    ActionList1: TActionList;
    acDelete: TioBSPersistenceDelete;
    DSOrdersOrderDate: TDateField;
    DSOrdersCustomerName: TStringField;
    DSOrdersGrandTotal: TCurrencyField;
    acBack: TioBSCloseQuery;
    acShowOrSelect: TioBSShowOrSelect;
    acAdd: TioBSPersistenceAppend;
    DSOrdersOrderState: TStringField;
    PanelWhere: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ButtonSearch: TSpeedButton;
    ButtonClear: TSpeedButton;
    DBEditWhereID: TDBEdit;
    DBEditWhereFromDate: TDBEdit;
    Label4: TLabel;
    DBEditWhereToDate: TDBEdit;
    DBComboBoxWhereOrderState: TDBComboBox;
    Label5: TLabel;
    DBEditWhereNote: TDBEdit;
    Shape1: TShape;
    DSWhere: TioDataSetMaster;
    DSWhereOrderID: TIntegerField;
    SourceWhere: TDataSource;
    DSWhereOrderState: TStringField;
    DSWhereNote: TStringField;
    DSWhereFromDate: TDateField;
    DSWhereToDate: TDateField;
    acWherePersist: TioBSPersistencePersist;
    ButtonHistory: TSpeedButton;
    acWhereShowHistory: TioBSShowOrSelect;
    Label6: TLabel;
    DBEditWhereCustName: TDBEdit;
    DSWhereCustomerName: TStringField;
    acBuildWhere: TioBSBuildWhere;
    acClearWhere: TioBSClearWhere;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DSWhereAfterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType);
    procedure GridCustomersDblClick(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TOrderListForm.DSWhereAfterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType);
begin
  DSWhere.BuildWhere;
end;

procedure TOrderListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TOrderListForm.FormCreate(Sender: TObject);
begin
  io.Enums.FillStrings<TOrderState>(DBComboBoxWhereOrderState.Items);
  DSOrders.Open;
  DSWhere.Open;
end;

procedure TOrderListForm.GridCustomersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.
