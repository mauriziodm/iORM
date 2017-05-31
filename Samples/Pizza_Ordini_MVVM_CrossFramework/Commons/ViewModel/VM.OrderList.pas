unit VM.OrderList;

interface

uses
  System.SysUtils, System.Classes, iORM.Attributes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, System.Actions, FMX.ActnList;

type

  [diRegister]
  TOrderListVM = class(TioViewModel)
    MPOrderList: TioModelPresenter;
    ActionList1: TActionList;
    acBack: TAction;
    acEditOrder: TAction;
    procedure acBackExecute(Sender: TObject);
    procedure acEditOrderExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrderListVM: TOrderListVM;

implementation

uses
  iORM, iORM.MVVM.Interfaces, V.Order, VM.Order;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TOrderListVM.acBackExecute(Sender: TObject);
begin
  inherited;
  io.TerminateApplication;
end;

procedure TOrderListVM.acEditOrderExecute(Sender: TObject);
begin
  inherited;
  io.di.LocateView<TOrderView, TOrderVM>.SetPresenter('MPOrder', MPOrderList).Show;
end;

end.
