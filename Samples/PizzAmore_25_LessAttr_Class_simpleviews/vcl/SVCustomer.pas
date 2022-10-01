unit SVCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.DB, iORM.DB.DataSet.Base,
  iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.StdCtrls, Model.Customer, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls;

type

  [diSimpleViewFor(TCustomer)]
  TCustomerSimpleView = class(TFrame)
    Label1: TLabel;
    Button1: TButton;
    DS: TioDataSetMaster;
    DataSource1: TDataSource;
    DSID: TIntegerField;
    DSName: TStringField;
    DSCity: TStringField;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    procedure Button1Click(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

{ TCustomerSimpleView }

procedure TCustomerSimpleView.Button1Click(Sender: TObject);
begin
  Owner.Free;
end;

constructor TCustomerSimpleView.Create(AOwner: TComponent);
begin
  inherited;
  DS.Open;
end;

end.
