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
    acShowCustomerSelector: TioVMActionBSShowOrSelect;
    acShowPizzaSelector: TioVMActionBSShowOrSelect;
    acDeleteRow: TioVMActionBSDelete;
    BSCustomers: TioModelPresenterMaster;
    procedure MPMasterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
  private
  public
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Model.Interfaces;

{$R *.dfm}

procedure TVMOrder.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  inherited;
  BSCustomers.Open;
end;

procedure TVMOrder.MPMasterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  if Supports(ASelected, IPizza) then
  begin
    BSMaster.CurrentAs<IOrder>.AddPizza(ASelected as IPizza);
    BSMaster.Refresh;
    ADone := True;
  end;
end;

end.
