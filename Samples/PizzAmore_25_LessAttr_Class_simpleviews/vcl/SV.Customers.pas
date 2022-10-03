unit SV.Customers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, Model.Customer, Vcl.StdCtrls, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.DB,
  iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.Grids, Vcl.DBGrids;

type

//  [diImplements(IInterface)]
//  [diSimpleViewFor(TCustomer, 'LIST')]
  TCustomersSimpleView = class(TFrame)
    Label1: TLabel;
    Button1: TButton;
    DS: TioDataSetMaster;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

procedure TCustomersSimpleView.Button1Click(Sender: TObject);
begin
  Owner.Free;
end;

constructor TCustomersSimpleView.Create(AOwner: TComponent);
begin
  inherited;
  DS.Open;
end;

end.
