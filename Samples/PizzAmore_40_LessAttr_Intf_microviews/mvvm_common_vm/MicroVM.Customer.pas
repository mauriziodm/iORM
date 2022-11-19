unit MicroVM.Customer;

interface

uses
  System.SysUtils,
  System.Classes,
  iORM,
  iORM.Attributes,
  iORM.CommonTypes,
  iORM.Where.Interfaces,
  iORM.MVVM.Interfaces,
  iORM.MVVM.ViewModel, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Detail, iORM.MVVM.VMAction;

type

  [diViewModelImplements(IioViewModel, 'MicroVMCustomer')]
  TMicroVMCustomer = class(TioViewModel)
    BSCustomer: TioModelPresenterDetail;
    acSelectCustomer: TioVMAction;
    acShowCustomer: TioVMAction;
    procedure acSelectCustomerExecute(Sender: TObject);
    procedure acShowCustomerExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TMicroVMCustomer.acSelectCustomerExecute(Sender: TObject);
begin
  io.ShowAsSelector<IGenericCustomer>(BSCustomer);
end;

procedure TMicroVMCustomer.acShowCustomerExecute(Sender: TObject);
begin
  BSCustomer.ShowCurrent;
end;

end.