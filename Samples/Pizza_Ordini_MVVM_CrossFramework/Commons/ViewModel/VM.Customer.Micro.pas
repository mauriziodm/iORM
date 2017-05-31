unit VM.Customer.Micro;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes;

type

  [diRegister]
  TCustomerMicroVM = class(TioViewModel)
    MPCustomer: TioModelPresenter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CustomerMicroVM: TCustomerMicroVM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
