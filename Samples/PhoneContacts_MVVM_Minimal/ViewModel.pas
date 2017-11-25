unit ViewModel;

interface

uses
  iORM.MVVM.ViewModelBase, System.Classes, iORM.MVVM.Components.ModelPresenter,
  iORM.Attributes, Interfaces, FMX.ActnList, System.Actions;

type

  [diImplements(IPersonsViewModel)]
  TViewModelMain = class(TioViewModel, IPersonsViewModel)
    PersonsModelPresenter: TioModelPresenter;
    PhonesModelPresenter: TioModelPresenter;
    ActionList1: TActionList;
    acExit: TAction;
    procedure acExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses
  iORM;

{$R *.dfm}

procedure TViewModelMain.acExitExecute(Sender: TObject);
begin
  inherited;
  TerminateApplication;
end;

end.
