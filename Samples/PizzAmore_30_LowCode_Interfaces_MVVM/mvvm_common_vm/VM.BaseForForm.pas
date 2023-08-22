unit VM.BaseForForm;

interface

uses
  System.SysUtils,
  System.Classes,
  iORM,
  iORM.Attributes,
  iORM.CommonTypes,
  iORM.Where.Interfaces,
  iORM.MVVM.Interfaces,
  iORM.MVVM.ViewModel, iORM.MVVM.VMAction, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master;

type

  TVMBaseForForm = class(TioViewModel)
    BSMaster: TioModelPresenterMaster;
    acPersist: TioVMActionBSPersistencePersist;
    acBack: TioVMActionBSCloseQuery;
    acRevert: TioVMActionBSPersistenceRevertOrDelete;
    acShowETM: TioVMActionBSShowOrSelect;
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
