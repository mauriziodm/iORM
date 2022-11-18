unit Form.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList;

type
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
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acBack: TAction;
    acRevert: TioBSPersistenceRevertOrDelete;
    Button1: TButton;
    ButtonManualSetDataObject: TButton;
    procedure acBackExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonManualSetDataObjectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerForm: TCustomerForm;

implementation

uses
  Model.Customer;

{$R *.dfm}

procedure TCustomerForm.FormShow(Sender: TObject);
begin
  DSCustomer.Open;
end;

procedure TCustomerForm.acBackExecute(Sender: TObject);
begin
  Close;
end;

procedure TCustomerForm.ButtonManualSetDataObjectClick(Sender: TObject);
var
  LCustomer: TCustomer;
begin
  DSCustomer.SourceBS := nil;
  LCustomer := io.LoadObject<TCustomer>(2);
  DSCustomer.LoadType := ltManual;
  DSCustomer.Open;
  DSCustomer.SetDataObject(LCustomer);
end;

end.
