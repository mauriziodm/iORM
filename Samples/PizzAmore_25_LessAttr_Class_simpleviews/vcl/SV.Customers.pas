unit SV.Customers;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, Model.Customer, Vcl.StdCtrls, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.DB,
  iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.Grids, Vcl.DBGrids;

type

//  [diImplements(IInterface)]
  [diSimpleViewFor(TCustomer, 'LIST')]
  TCustomersSimpleView = class(TFrame)
    Label1: TLabel;
    Button1: TButton;
    DS: TioDataSetMaster;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  System.Generics.Collections;

{$R *.dfm}

procedure TCustomersSimpleView.Button1Click(Sender: TObject);
begin
  Owner.Free;
end;

procedure TCustomersSimpleView.Button2Click(Sender: TObject);
var
  LList: TObjectlist<TCustomer>;
begin
  LList := TObjectlist<TCustomer>.Create;
  LList.Add(TCustomer.Create);
  LList[0].Name := 'Maurizio';
  LList.Add(TCustomer.Create);
  LList[1].Name := 'Federica';
  DS.SetDataObject(LList);
end;

constructor TCustomersSimpleView.Create(AOwner: TComponent);
begin
  inherited;
//  DS.Open;
end;

end.
