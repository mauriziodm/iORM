unit View.Orders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Model.Interfaces;

type

  [diViewFor(IOrder)]
  TViewOrders = class(TViewBaseForList)
    GridOrders: TDBGrid;
    BSMasterID: TIntegerField;
    BSMasterOrderDate: TDateTimeField;
    BSMasterNote: TStringField;
    BSMasterCustomerName: TStringField;
    BSMasterGrandTotal: TCurrencyField;
    procedure GridOrdersDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TViewOrders.GridOrdersDblClick(Sender: TObject);
begin
  inherited;
  VMBridge.VMAction['acShowOrSelect'].Execute;
end;

end.
