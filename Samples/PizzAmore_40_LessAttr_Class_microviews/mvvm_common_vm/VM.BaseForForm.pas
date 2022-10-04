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
    MPMaster: TioModelPresenterMaster;
    acBack: TioVMAction;
    acPersist: TioVMActionBSPersistencePersist;
    acRevert: TioVMActionBSPersistenceRevertOrDelete;
    procedure acBackExecute(Sender: TObject);
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
    procedure ioViewModelCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMBaseForForm.acBackExecute(Sender: TObject);
begin
  CloseViews;
end;

procedure TVMBaseForForm.ioViewModelCreate(Sender: TObject);
begin
  MPMaster.Open;
end;

procedure TVMBaseForForm.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  MPMaster.Open;
end;

end.