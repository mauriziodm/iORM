unit VM.Order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.ModelPresenter.Detail, Model.Order,
  iORM.MVVM.ViewModel;

type

  TVMOrder = class(TVMBaseForForm)
    MPCustomer: TioModelPresenterDetail;
    MPRows: TioModelPresenterDetail;
    acDeleteRow: TioVMAction;
    acShowPizzaSelector: TioVMAction;
    acShowCustomerSelector: TioVMAction;
    procedure acDeleteRowExecute(Sender: TObject);
    procedure acShowPizzaSelectorExecute(Sender: TObject);
    procedure MPMasterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure acShowCustomerSelectorExecute(Sender: TObject);
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
  MPRows.Delete;
end;

procedure TVMOrder.acShowCustomerSelectorExecute(Sender: TObject);
begin
  inherited;
  io.ShowAsSelector<ICustomer>(MPCustomer);
end;

procedure TVMOrder.acShowPizzaSelectorExecute(Sender: TObject);
begin
  inherited;
  io.ShowAsSelector<IPizza>(MPMaster);
end;

procedure TVMOrder.MPMasterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
var
  LPizza: IPizza;
begin
  if Supports(ASelected, IPizza, LPizza) then
  begin
    MPMaster.CurrentAs<IOrder>.AddPizza(LPizza);
    MPMaster.Refresh;
    ADone := True;
  end;
end;

end.
