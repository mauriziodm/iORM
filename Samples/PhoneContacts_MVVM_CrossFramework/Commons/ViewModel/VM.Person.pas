unit VM.Person;

interface

uses
  System.SysUtils, System.Classes, iORM.Attributes,
  iORM.MVVM.Components.ModelPresenter, iORM.MVVM.ViewModelBase,
  M.Model, M.AnotherModel;

type

  [diViewModelFor(TPerson), diViewModelFor(TCustomer), diViewModelFor(TVipCustomer)]
  [diViewModelFor(TEmployee), diViewModelFor(TAnotherPerson)]
  TPersonViewModel = class(TioViewModel)
    PersonModelPresenter: TioModelPresenter;
    PhonesModelPresenter: TioModelPresenter;
  private
    { Private declarations }
  public
    // =========================================================================
    // Actions/Commands declared using a convention over configuration
    // -------------------------------------------------------------------------
    // acClose
    [ioAction('acClose', 'Close', TioActionEvent.OnExecute)]
    procedure acCloseExecute(Sender: TObject);
    // acPost
    [ioAction('acPost', 'Post', TioActionEvent.OnExecute)]
    procedure acPostExecute(Sender: TObject);
    [ioAction('acPost', TioActionEvent.OnUpdate)]
    procedure acPostUpdate(Sender: TObject);
    // =========================================================================
  end;

implementation

uses
  System.Actions;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TPersonViewModel }

procedure TPersonViewModel.acPostExecute(Sender: TObject);
begin
  if PersonModelPresenter.Editing then
    PersonModelPresenter.Post;
end;

procedure TPersonViewModel.acPostUpdate(Sender: TObject);
begin
  (Sender as TContainedAction).Enabled := PersonModelPresenter.Editing;
end;

procedure TPersonViewModel.acCloseExecute(Sender: TObject);
begin
  // Cancel updates if editing or inserting
  if PersonModelPresenter.Editing then
    PersonModelPresenter.Cancel;
  // Close the view and release the view context
  FreeViews;
end;

end.
