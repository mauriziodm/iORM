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
    Button1: TButton;
    procedure acShowOrSelectExecute(Sender: TObject);
    procedure acBackExecute(Sender: TObject);
    procedure acShowOrSelectUpdate(Sender: TObject);
    procedure GridCustomersDblClick(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomersForm: TCustomersForm;

implementation

uses
  Form.Customer, Model.Customer, System.Generics.Collections;

{$R *.dfm}

procedure TCustomersForm.GridCustomersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

procedure TCustomersForm.acAddExecute(Sender: TObject);
begin
  DSCustomers.Persistence.Append;
  acShowOrSelect.Execute;
end;

procedure TCustomersForm.acBackExecute(Sender: TObject);
begin
  Close;
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
    CustomerForm.DSCustomer.SourceBS := DSCustomers;
    CustomerForm.Show;
  end;
end;

procedure TCustomersForm.acShowOrSelectUpdate(Sender: TObject);
begin
  if Assigned(DSCustomers.SourceBS) then
    acShowOrSelect.Caption := 'Select'
  else
    acShowOrSelect.Caption := 'Show';
end;

procedure TCustomersForm.Button1Click(Sender: TObject);
var
  LList: TObjectList<TCustomer>;
begin
//  LList := TObjectList<TCustomer>.Create;
//  io.LoadToList<TCustomer>(LList, io.Where('ID', coLowerOrEqual, 3));

  LList := io.LoadList<TObjectList<TCustomer>>(io.Where('ID', coLowerOrEqual, 3));

  ShowMessage(LList.Count.ToString);
  LList.Free;
end;

procedure TCustomersForm.FormShow(Sender: TObject);
begin
  DSCustomers.Open;
end;

end.
