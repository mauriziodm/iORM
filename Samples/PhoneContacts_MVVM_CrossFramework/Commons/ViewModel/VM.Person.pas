unit VM.Person;

interface

uses
  System.SysUtils, System.Classes, iORM.Attributes,
  iORM.MVVM.Components.ModelPresenter, VM.Interfaces, iORM.MVVM.ViewModelBase;

type

  [diImplements(IPersonViewModel)]
  TPersonViewModel = class(TioViewModel, IPersonViewModel)
    PersonModelPresenter: TioModelPresenter;
    PhonesModelPresenter: TioModelPresenter;
  private
    { Private declarations }
  public
    // =========================================================================
    // Actions/Commands declared using a convention over configuration
    // -------------------------------------------------------------------------
    // acClose
    procedure Action_acClose_OnExecute(Sender: TObject);
    // acPost
    procedure Action_acPost_OnExecute(Sender: TObject);
    procedure Action_acPost_OnUpdate(Sender: TObject);
    // =========================================================================
  end;

implementation

uses
  System.Actions;

{%CLASSGROUP 'System.Classes.TPersistent'}

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

procedure TPersonViewModel.Action_acClose_OnExecute(Sender: TObject);
begin
  // Cancel updates if editing or inserting
  if PersonModelPresenter.Editing then
    PersonModelPresenter.Cancel;
  // Close the view and release the view context
  FreeViews;
end;

end.
