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
    acDeleteRow: TioVMAction;
    procedure MPMasterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure acDeleteRowBeforeExecute(Sender: TObject);
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  Model.Interfaces;

{$R *.dfm}

procedure TVMOrder.acDeleteRowBeforeExecute(Sender: TObject);
begin
  inherited;
  BSRows.Delete;
end;

procedure TVMOrder.MPMasterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
begin
  BSMaster.CurrentAs<IOrder>.AddPizza(ASelected as IPizza);
  BSMaster.Refresh;
  ADone := True;
end;

end.
