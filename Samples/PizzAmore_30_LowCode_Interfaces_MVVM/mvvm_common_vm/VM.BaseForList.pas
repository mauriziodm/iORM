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
    acBack: TioVMActionBSCloseQuery;
    acShowOrSelect: TioVMActionBSShowOrSelect;
    acSelectCurrent: TioVMActionBSSelectCurrent;
    BSWhere: TioModelPresenterMaster;
    acBuildWhere: TioVMActionBSBuildWhere;
    acClearWhere: TioVMActionBSClearWhere;
    acAppend: TioVMActionBSAppend;
    acDelete: TioVMActionBSDelete;
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
  private
  public
  end;

implementation

uses
  uniGUIApplication;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMBaseForList.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  BSMaster.Open;
  BSWhere.Open;
end;

end.