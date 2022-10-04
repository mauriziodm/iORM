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
var
  LNewInstance: IInterface;
begin
  // Requires the creation of the new instance to the Dependency Injection Container
  //   passing the value of the ModelPresenter "TypeName" property as a class/interface type.
  // However, this ViewModel is an ancestor from which the other ViewModels tpresenting
  //   a list will derive and is at a level of abstraction that does not allow to know
  //   the specific type of class of which the new instance must be created;
  //   for this reason it requires the new object as "IInterface" in order to pass it
  //   as a parameter to the "Persistence.Append" method of the ModelPresenter.
  // This way I was able to write this code in an absolutely abstract way from
  //  the real type which will only be known in the derived ViewModels.
  LNewInstance := io.di.Locate(MPMaster.TypeName).GetAsGeneric.OfType<IInterface>;
  MPMaster.Persistence.Append(LNewInstance);
  // Executes the action which will show the new instance on the screen.
  acShowOrSelect.Execute;
end;

procedure TVMBaseForList.acBackExecute(Sender: TObject);
begin
  CloseViews;
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