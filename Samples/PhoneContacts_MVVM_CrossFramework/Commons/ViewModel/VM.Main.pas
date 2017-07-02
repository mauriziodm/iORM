unit VM.Main;

interface

uses
  iORM.MVVM.ViewModelBase, System.Classes, iORM.MVVM.Components.ModelPresenter,
  VM.Interfaces, iORM.Attributes;

type
  [diImplements(IPersonsViewModel)]
  TViewModelMain = class(TioViewModel, IPersonsViewModel)
    PersonsModelPresenter: TioModelPresenter;
    PhonesModelPresenter: TioModelPresenter;
  private
    { Private declarations }
    function DataExist: Boolean;
  public
    { Public declarations }

    // =========================================================================
    // Actions/Commands declared using attributes
    // -------------------------------------------------------------------------
    // acClear
    [ioAction('acClearData', 'Clear', TioActionEvent.OnExecute)]
    procedure acClearDataExecute(Sender: TObject);
    [ioAction('acClearData',TioActionEvent.OnUpdate)]
    procedure acClearDataUpdate(Sender: TObject);

    // acLoadData
    [ioAction('acLoadData', 'Load', TioActionEvent.OnExecute)]
    procedure acLoadDataExecute(Sender: TObject);
    [ioAction('acLoadData',TioActionEvent.OnUpdate)]
    procedure acLoadDataUpdate(Sender: TObject);

    // acEditPerson
    [ioAction('acEditPerson', 'Edit', TioActionEvent.OnExecute)]
    procedure acEditPersonExecute(Sender: TObject);

    // acTerminate
    [ioAction('acTerminate', 'Exit', TioActionEvent.OnExecute)]
    procedure acTerminateExecute(Sender: TObject);

    // acRefresh
    [ioAction('acRefresh', 'Refresh', TioActionEvent.OnExecute)]
    procedure acRefreshExecute(Sender: TObject);
    [ioAction('acRefresh',TioActionEvent.OnUpdate)]
    procedure acRefreshUpdate(Sender: TObject);

    // acNewPerson
    [ioAction('acNewPerson', 'New', TioActionEvent.OnExecute)]
    procedure acNewPerson(Sender: TObject);

    // acDelete
    [ioAction('acDelete', 'Del', TioActionEvent.OnExecute)]
    procedure acDelete(Sender: TObject);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  System.Actions, iORM, RegisterClassesUnit, V.Interfaces, M.Interfaces;

{$R *.dfm}

procedure TViewModelMain.acClearDataExecute(Sender: TObject);
begin
  inherited;
  // Clear the data object of the ActiveBindSourceAdapter
  PersonsModelPresenter.ClearDataObject;
end;

procedure TViewModelMain.acClearDataUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCOntainedAction).Enabled := Self.DataExist;
end;

procedure TViewModelMain.acDelete(Sender: TObject);
begin
  PersonsModelPresenter.Delete;
end;

procedure TViewModelMain.acLoadDataExecute(Sender: TObject);
var
  NewDataObject: TObject;
begin
  inherited;
  // Load new data
  NewDataObject := io.Load(PersonsModelPresenter.TypeName).ToGenericList.OfType<TPersonsList>;
  // Set the new data as DataObject of the ActiveBindSourceAdapter
  PersonsModelPresenter.SetDataObject(NewDataObject);
end;

procedure TViewModelMain.acLoadDataUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCOntainedAction).Enabled := not Self.DataExist;
end;

procedure TViewModelMain.acNewPerson(Sender: TObject);
var
  LPerson: IPerson;
begin
  LPerson := io.di.Locate<IPerson>.Get;
  PersonsModelPresenter.Append(LPerson as TObject);
  Command['acEditPerson'].Execute;
end;

procedure TViewModelMain.acRefreshExecute(Sender: TObject);
begin
  inherited;
  // Clear the data object of the ActiveBindSourceAdapter
  PersonsModelPresenter.Refresh(True);
end;

procedure TViewModelMain.acRefreshUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCOntainedAction).Enabled := Self.DataExist;
end;

procedure TViewModelMain.acEditPersonExecute(Sender: TObject);
var
  LCurrentClassName: String;
begin
  inherited;
  // Get the class name of the current person
  LCurrentClassName := PersonsModelPresenter.Current.ClassName;
  // Get the View and ViewModel
  io.di.LocateViewVM<IPersonView, IPersonViewModel>(LCurrentClassName)
    .SetPresenter('PersonModelPresenter', PersonsModelPresenter)
    .Get;
end;

procedure TViewModelMain.acTerminateExecute(Sender: TObject);
begin
  inherited;
  TerminateApplication;
end;

function TViewModelMain.DataExist: Boolean;
begin
  Result := PersonsModelPresenter.DataObjectAssigned;
end;

end.
