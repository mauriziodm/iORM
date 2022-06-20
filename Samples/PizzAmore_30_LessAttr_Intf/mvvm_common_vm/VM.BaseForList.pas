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
    MPMaster: TioModelPresenterMaster;
    acBack: TioVMAction;
    acShowOrSelect: TioVMAction;
    acAdd: TioVMAction;
    acDelete: TioVMActionBSPersistenceDelete;
    procedure acBackExecute(Sender: TObject);
    procedure acShowOrSelectExecute(Sender: TObject);
    procedure acShowOrSelectUpdate(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMBaseForList.acAddExecute(Sender: TObject);
begin
  MPMaster.Persistence.Append(io.di.Locate(MPMaster.TypeName).GetAsGeneric.OfType<IInterface>);
  acShowOrSelect.Execute;
end;

procedure TVMBaseForList.acBackExecute(Sender: TObject);
begin
  FreeViews;
end;

procedure TVMBaseForList.acShowOrSelectExecute(Sender: TObject);
begin
  if Assigned(MPMaster.SelectorFor) then
    MPMaster.SelectCurrent
  else
    MPMaster.ShowCurrent;
end;

procedure TVMBaseForList.acShowOrSelectUpdate(Sender: TObject);
begin
  if Assigned(MPMaster.SelectorFor) then
    acShowOrSelect.Caption := 'Select'
  else
    acShowOrSelect.Caption := 'Show';
end;

procedure TVMBaseForList.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  MPMaster.Open;
end;

end.