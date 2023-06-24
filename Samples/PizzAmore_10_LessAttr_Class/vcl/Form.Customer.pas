unit Form.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList,
  Model.Customer;

type

  [diSimpleViewFor(TCustomer)]
  TCustomerForm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonRevert: TSpeedButton;
    ButtonPersist: TSpeedButton;
    DBEditID: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEditName: TDBEdit;
    Label3: TLabel;
    DBEditPhone: TDBEdit;
    Label4: TLabel;
    DBEditCity: TDBEdit;
    Label5: TLabel;
    DBEditAddress: TDBEdit;
    DSCustomer: TioDataSetMaster;
    DSCustomerID: TIntegerField;
    DSCustomerName: TStringField;
    DSCustomerPhoneNumber: TStringField;
    SourceCustomer: TDataSource;
    DSCustomerCity: TStringField;
    DSCustomerAddress: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonPersistClick(Sender: TObject);
    procedure ButtonRevertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

// *** Note: the lines below have been deleted ***
//var
//  CustomerForm: TCustomerForm;

implementation

{$R *.dfm}

procedure TCustomerForm.ButtonBackClick(Sender: TObject);
begin
  Close;
end;

procedure TCustomerForm.ButtonPersistClick(Sender: TObject);
begin
  DSCustomer.Persistence.Persist;
end;

procedure TCustomerForm.ButtonRevertClick(Sender: TObject);
var
  LIsInserting: Boolean;
begin
  LIsInserting := DSCustomer.Persistence.IsInserting;
  DSCustomer.Persistence.RevertOrDelete;
  if LIsInserting then
    Close;
end;

procedure TCustomerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
