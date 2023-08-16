unit VM.BaseForList;

interface

uses
  System.SysUtils,
  System.Classes,
  iORM,
  iORM.Attributes,
  iORM.CommonTypes,
  iORM.Where.Interfaces,
  iORM.MVVM.Interfaces,
  iORM.MVVM.ViewModel, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.VMAction;

type

  TVMBaseForList = class(TioViewModel)
    BSMaster: TioModelPresenterMaster;
    acDelete: TioVMActionBSPersistenceDelete;
    acBack: TioVMActionBSCloseQuery;
    acShowOrSelect: TioVMActionBSShowOrSelect;
    acAdd: TioVMActionBSPersistenceAppend;
    acSelectCurrent: TioVMActionBSSelectCurrent;
    BSWhere: TioModelPresenterMaster;
    acBuildWhere: TioVMActionBSBuildWhere;
    acClearWhere: TioVMActionBSClearWhere;
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
  private
  public
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TVMBaseForList.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  BSMaster.Open;
  BSWhere.Open;
end;

end.