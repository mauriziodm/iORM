unit VM.Customer;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Customer,
  iORM.MVVM.ViewModel;

type

  [diViewModelFor(TCustomer)]
  TVMCustomer = class(TVMBaseForForm)
    BS_ETM: TioModelPresenterMaster;
    AcEtmRevertToVersion: TioVMActionBS_ETM_RevertToBindSource;
  private
  public
  end;

implementation

{$R *.dfm}

end.
