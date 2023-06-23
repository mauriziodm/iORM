unit Form.Customers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom,
  iORM.DB.DataSet.Master, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Buttons, Vcl.DBGrids, Vcl.DBCtrls, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList,
  Vcl.Mask, Model.Customer;

type

  [diSimpleViewFor(TCustomer, 'LIST')]
  TCustomersForm = class(TForm)
    DSCustomers: TioDataSetMaster;
    DSCustomersID: TIntegerField;
    DSCustomersName: TStringField;
    SourceCustomers: TDataSource;
    PanelBottom: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonPageUp: TSpeedButton;
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    ButtonDelete: TSpeedButton;
    ButtonPageDown: TSpeedButton;
    DSCustomersPhoneNumber: TStringField;
    GridCustomers: TDBGrid;
    DBTextPageOf: TDBText;
    DSCustomersPagingCurrentPageOf: TStringField;
    ActionList1: TActionList;
    acDelete: TioBSPersistenceDelete;
    acNextPage: TioBSNextPage;
    acPrevPage: TioBSPrevPage;
    PanelWhere: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEditWhereID: TDBEdit;
    DBEditWhereName: TDBEdit;
    DBEditWhereCity: TDBEdit;
    DSWhere: TioDataSetMaster;
    DSWhereID: TIntegerField;
    DSWhereName: TStringField;
    DSWhereCity: TStringField;
    SourceWhere: TDataSource;
    ButtonSearch: TSpeedButton;
    ButtonClear: TSpeedButton;
    acBack: TioBSCloseQuery;
    acAdd: TioBSPersistenceAppend;
    acShowOrSelect: TioBSShowOrSelect;
    acSelectCurrent: TioBSSelectCurrent;
    acWhereBuild: TioBSWhereBuild;
    acWhereClear: TioBSWhereClear;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCustomersDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Form.Customer, System.Generics.Collections;

{$R *.dfm}

procedure TCustomersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCustomersForm.FormShow(Sender: TObject);
begin
  // Open the where builder dataset
  DSWhere.Open;
  // Fully automatic loading by the component itself (LoadType = ltAuto)
  DSCustomers.Open;

{$region 'Manual loading (also objects originating from REST servers) (LoadType = ltManual)'}
//  var LList: TObjectList<TCustomer>;
//  LList := io.LoadList<TObjectList<TCustomer>>;
//  DSCustomers.Open;
//  DSCustomers.SetDataObject(LList);
{$endregion}

{$region 'Manual loading filtered by some criteria 1'}
//  var LList: TObjectList<TCustomer> := TObjectList<TCustomer>.Create;
//  io.Load<TCustomer>._Where('City', coEqual, 'New York').ToList(LList);
//  DSCustomers.Open;
//  DSCustomers.SetDataObject(LList);
{$endregion}

{$region 'Manual loading filtered by some criteria 2'}
//  var LList: TObjectList<TCustomer>;
//  var LWhere: IioWhere := io.Where<TCustomer>('City', coEqual, 'New York');
//  LWhere._And('Name', coLike, 'Maurizio%');
//  LList := io.LoadList<TObjectList<TCustomer>>(LWhere);
//  DSCustomers.Open;
//  DSCustomers.SetDataObject(LList);
{$endregion}
end;

procedure TCustomersForm.GridCustomersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.
