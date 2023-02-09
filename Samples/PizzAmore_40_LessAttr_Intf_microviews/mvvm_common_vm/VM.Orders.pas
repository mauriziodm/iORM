unit VM.Orders;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
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
  BSMaster.Persistence.Append( TOrder.Create as IOrder );
  inherited;
end;

end.
