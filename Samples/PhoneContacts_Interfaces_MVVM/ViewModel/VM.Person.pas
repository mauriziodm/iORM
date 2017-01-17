unit VM.Person;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, iORM.Attributes, VM.Interfaces;

type

  [diImplements(IPersonViewModel)]
  TPersonViewModel = class(TioViewModel, IPersonViewModel)
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

{%CLASSGROUP 'FMX.Controls.TControl'}

uses
  Data.Bind.ObjectScope, System.Actions;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TPersonViewModel }

procedure TPersonViewModel.Action_acPost_OnExecute(Sender: TObject);
begin
  if PersonModelPresenter.Editing then
    PersonModelPresenter.Post;
end;

procedure TPersonViewModel.Action_acPost_OnUpdate(Sender: TObject);
begin
  (Sender as TContainedAction).Enabled := PersonModelPresenter.Editing;
end;

procedure TPersonViewModel.Close(Sender: TObject);
begin
  // Cancel updates if editing or inserting
  if PersonModelPresenter.Editing then
    PersonModelPresenter.Cancel;
  // Close the view and release the view context
  FreeViews;
end;

end.
