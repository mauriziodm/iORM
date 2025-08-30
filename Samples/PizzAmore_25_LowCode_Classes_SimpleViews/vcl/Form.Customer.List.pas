unit Form.Customer.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, iORM.Attributes, iORM.CommonTypes, Data.DB,
  iORM.DB.DataSet.Master, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBGrids, Vcl.DBCtrls, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList,
  Model.Customer, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, Vcl.Mask, Vcl.Grids, iORM.Where.Interfaces;

type

  // Register the form into the dependency injection container as SimpleView for TCustomer objects
  //  (alias "LIST" to avoid an ambiguity with the one registered for a single customer)
  [diSimpleViewFor(TCustomer, 'LIST')]
  TCustomerListForm = class(TForm)
    DSCustomers: TioDataSetMaster;
    SourceCustomers: TDataSource;
    PanelBottom: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonPageUp: TSpeedButton;
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    btnDelete: TSpeedButton;
    ButtonPageDown: TSpeedButton;
    GridCustomers: TDBGrid;
    DBTextPageOf: TDBText;
    ActionList1: TActionList;
    acNextPage: TioBSNextPage;
    acPrevPage: TioBSPrevPage;
    acBack: TioBSCloseQuery;
    acShowOrSelect: TioBSShowOrSelect;
    acSelectCurrent: TioBSSelectCurrent;
    PanelWhere: TPanel;
    DSWhere: TioDataSetMaster;
    Label1: TLabel;
    DBEditWhereID: TDBEdit;
    Label2: TLabel;
    DBEditWhereName: TDBEdit;
    Label3: TLabel;
    DBEditWhereCity: TDBEdit;
    ButtonSearch: TSpeedButton;
    ButtonClear: TSpeedButton;
    SourceWhere: TDataSource;
    acBuildWhere: TioBSBuildWhere;
    acClearWhere: TioBSClearWhere;
    DSCustomersID: TIntegerField;
    DSCustomersName: TStringField;
    DSCustomersPhoneNumber: TStringField;
    DSCustomersPagingCurrentPageOf: TStringField;
    DSWhereID: TIntegerField;
    DSWhereName: TStringField;
    DSWhereCity: TStringField;
    acAppend: TioBSAppend;
    acDelete: TioBSDelete;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCustomersDblClick(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TCustomerListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCustomerListForm.FormShow(Sender: TObject);
begin
  DSCustomers.Open;
  DSWhere.Open;
end;

procedure TCustomerListForm.GridCustomersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.
