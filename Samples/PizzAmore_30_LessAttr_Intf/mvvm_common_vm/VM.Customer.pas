unit VM.Customer;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Customer,
  iORM.MVVM.ViewModel;

type

  [diViewModelFor(TCustomer)]
  TVMCustomer = class(TVMBaseForForm)
    acNew: TioVMAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{$R *.dfm}

end.
