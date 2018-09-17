unit VM.Person;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes, M.Model,
  M.AnotherModel;

type

  [diViewModelFor(TPerson)]
  [diViewModelFor(TEmployee)]
  [diViewModelFor(TCustomer)]
  [diViewModelFor(TVipCustomer)]
  [diViewModelFor(TAnotherPerson)]
  TPersonViewModel = class(TioViewModel)
    PersonModelPresenter: TioModelPresenter;
    PhonesModelPresenter: TioModelPresenter;
  private
    { Private declarations }
  public
    // Close: Action declared by "ioAction" attribute
    [ioAction('acClose', 'Back', TioActionEvent.OnExecute)]
    procedure Close(Sender: TObject);
    // Post: Action declared using a convention over configuration
    procedure Action_acPost_OnExecute(Sender: TObject);
    procedure Action_acPost_OnUpdate(Sender: TObject);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  Data.Bind.ObjectScope, System.Actions;

{$R *.dfm}

{ TPersonViewModel }

procedure TPersonViewModel.Action_acPost_OnExecute(Sender: TObject);
begin
  PersonModelPresenter.PostIfEditing;
end;

procedure TPersonViewModel.Action_acPost_OnUpdate(Sender: TObject);
begin
  (Sender as TContainedAction).Enabled := PersonModelPresenter.Editing;
end;

procedure TPersonViewModel.Close(Sender: TObject);
begin
  PersonModelPresenter.CancelIfEditing;
  FreeViews;
end;

end.
