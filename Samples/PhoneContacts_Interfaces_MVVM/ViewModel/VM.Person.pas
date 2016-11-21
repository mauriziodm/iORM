unit VM.Person;

interface

uses
  iORM.MVVM.ViewModelBase, iORM.Attributes, VM.Interfaces;

type

  [diImplements(IPersonViewModel)]
  TPersonViewModel = class(TioViewModel, IPersonViewModel)
  public
    // Close: Action declared by "ioAction" attribute
    [ioAction('acClose', 'Back', TioActionEvent.OnExecute)]
    procedure Close(Sender: TObject);
    // Post: Action declared using a convention over configuration
    procedure Action_acPost_OnExecute(Sender: TObject);
    procedure Action_acPost_OnUpdate(Sender: TObject);
  end;

implementation

uses
  Data.Bind.ObjectScope, System.Classes, System.Actions;

{ TPersonViewModel }

procedure TPersonViewModel.Action_acPost_OnExecute(Sender: TObject);
begin
  if Self.ViewData.BindSourceAdapter.State in [seEdit, seInsert] then
    Self.ViewData.BindSourceAdapter.Post;
end;

procedure TPersonViewModel.Action_acPost_OnUpdate(Sender: TObject);
begin
  (Sender as TContainedAction).Enabled := Self.ViewData.BindSourceAdapter.State in [seEdit, seInsert];
end;

procedure TPersonViewModel.Close(Sender: TObject);
begin
  // Cancel updates if editing or inserting
  if Self.ViewData.BindSourceAdapter.State in [seEdit, seInsert] then
    Self.ViewData.BindSourceAdapter.Cancel;
  // Close the view and release the view context
  FreeViews;
end;

end.
