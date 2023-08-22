unit VM.ETM;

interface

uses
  System.SysUtils,
  System.Classes,
  iORM,
  iORM.Attributes,
  iORM.CommonTypes,
  iORM.Where.Interfaces,
  iORM.MVVM.Interfaces,
  iORM.MVVM.ViewModel, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.VMAction,
  ETM.Repository;

type

  [diViewModelFor(TEtmRepository)]
  TVM_ETM = class(TioViewModel)
    BS_ETM: TioModelPresenterMaster;
    acBack: TioVMActionBSCloseQuery;
    acEtmRevertToVersion: TioVMActionBS_ETM_RevertToBindSource;
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.