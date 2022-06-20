unit Form.Customers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom,
  iORM.DB.DataSet.Master, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.Buttons, Vcl.DBGrids, Vcl.DBCtrls, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList;

type
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
    acShowOrSelect: TAction;
    acBack: TAction;
    acAdd: TAction;
    procedure acShowOrSelectExecute(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure acShowOrSelectUpdate(Sender: TObject);
    procedure GridCustomersDblClick(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomersForm: TCustomersForm;

implementation

uses
  Form.Customer, System.Generics.Collections, Model.Customer;

{$R *.dfm}

procedure TCustomersForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TCustomersForm.acAddExecute(Sender: TObject);
begin
  DSCustomers.Persistence.Append;
  acShowOrSelect.Execute;
end;

procedure TCustomersForm.acShowOrSelectExecute(Sender: TObject);
begin
  if Assigned(DSCustomers.SelectorFor) then
  begin
    DSCustomers.SelectCurrent;
    acBack.Execute;
  end
  else
  begin
    Application.CreateForm(TCustomerForm, CustomerForm);
    CustomerForm.DSCustomer.SourceDataSet := DSCustomers;
    CustomerForm.Show;
  end;
end;

procedure TCustomersForm.acShowOrSelectUpdate(Sender: TObject);
begin
  if Assigned(DSCustomers.SourceDataSet) then
    acShowOrSelect.Caption := 'Select'
  else
    acShowOrSelect.Caption := 'Show';
end;

procedure TCustomersForm.GridCustomersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

procedure TCustomersForm.FormShow(Sender: TObject);
begin
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

end.
