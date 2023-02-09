unit VM.Order;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.ModelPresenter.Detail, Model.Order,
  iORM.MVVM.ViewModel;

type

  TVMOrder = class(TVMBaseForForm)
    BSCustomer: TioModelPresenterDetail;
    BSRows: TioModelPresenterDetail;
    acDeleteRow: TioVMAction;
    acShowPizzaSelector: TioVMAction;
    acShowCustomerSelector: TioVMAction;
    procedure acDeleteRowExecute(Sender: TObject);
    procedure acShowPizzaSelectorExecute(Sender: TObject);
    procedure acShowCustomerSelectorExecute(Sender: TObject);
    procedure MPMasterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{$R *.dfm}

procedure TVMOrder.acDeleteRowExecute(Sender: TObject);
begin
  inherited;
  BSRows.Delete;
end;

procedure TVMOrder.acShowCustomerSelectorExecute(Sender: TObject);
begin
  inherited;
  io.ShowAsSelector<ICustomer>(BSCustomer, acBack);
end;

procedure TVMOrder.acShowPizzaSelectorExecute(Sender: TObject);
begin
  inherited;
  io.ShowAsSelector<IPizza>(BSMaster, acBack);
end;

procedure TVMOrder.MPMasterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
var
  LPizza: IPizza;
begin
  if Supports(ASelected, IPizza, LPizza) then
  begin
    BSMaster.CurrentAs<IOrder>.AddPizza(LPizza);
    BSMaster.Refresh;
    ADone := True;
  end;
end;

end.
