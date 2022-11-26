unit Form.CustomerBusiness;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList,
  Model.Customers;

type

  [diSimpleViewFor(TBusinessCustomer)]
  TBusinessCustomerForm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonRevert: TSpeedButton;
    ButtonPersist: TSpeedButton;
    DBEditID: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEditBusinessName: TDBEdit;
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
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acRevert: TioBSPersistenceRevertOrDelete;
    Label6: TLabel;
    DBEditVAT: TDBEdit;
    DSCustomerVAT: TStringField;
    acBack: TioBSCloseQuery;
    procedure acBackExecute(Sender: TObject);
    procedure acBackUpdate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TBusinessCustomerForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TBusinessCustomerForm.acBackUpdate(Sender: TObject);
begin
  acBack.Enabled := not DSCustomer.Persistence.IsAppending;
end;

procedure TBusinessCustomerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
