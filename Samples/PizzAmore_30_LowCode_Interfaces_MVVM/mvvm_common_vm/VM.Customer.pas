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
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
  private
  public
  end;

implementation

uses
  Model.Interfaces;

{$R *.dfm}

procedure TVMCustomer.ioViewModelViewPairing(const Sender: TioViewModel);
var
  LCustomer: ICustomer;
begin
  inherited;
  BSMaster.Close;
  BSMaster.SourceBS := nil;
  BSMaster.LoadType := ltManual;
  LCustomer := io.LoadObject<ICustomer>(1);
  BSMaster.SetDataObject(LCustomer);
  BSMaster.Open;
end;

end.
