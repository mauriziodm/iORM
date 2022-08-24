unit VM.Orders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces;

type

  [diViewModelFor(IOrder)]
  TVMOrders = class(TVMBaseForList)
    procedure acAddExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Order;

{$R *.dfm}

procedure TVMOrders.acAddExecute(Sender: TObject);
begin
  MPMaster.Persistence.Append( TOrder.Create as IOrder );
  inherited;
end;

end.
