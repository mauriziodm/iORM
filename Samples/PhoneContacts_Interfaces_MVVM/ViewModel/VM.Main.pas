unit VM.Main;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase, System.Actions,
  FMX.ActnList, FMX.Types, iORM.Attributes, Vcl.ActnList, Vcl.Dialogs,
  VM.Interfaces, iORM.MVVM.Components.ModelPresenter;

type
  [diImplements(IPersonsViewModel)]
  TViewModelMain = class(TioViewModel, IPersonsViewModel)
    ActionList1: TActionList;
    acLoadData: TAction;
    acClearData: TAction;
    acSerializeToJSON: TAction;
    acDeserializeFromJSON: TAction;
    acClearJSON: TAction;
    acSaveJSONtoFile: TAction;
    acLoadJSONfromFile: TAction;
    acEditPerson: TAction;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    acTerminate: TAction;
    acRefresh: TAction;
    PersonsModelPresenter: TioModelPresenter;
    PhonesModelPresenter: TioModelPresenter;
    procedure acClearDataExecute(Sender: TObject);
    procedure acClearDataUpdate(Sender: TObject);
    procedure acLoadDataExecute(Sender: TObject);
    procedure acLoadDataUpdate(Sender: TObject);
    procedure acSerializeToJSONExecute(Sender: TObject);
    procedure acSerializeToJSONUpdate(Sender: TObject);
    procedure acDeserializeFromJSONExecute(Sender: TObject);
    procedure acDeserializeFromJSONUpdate(Sender: TObject);
    procedure acClearJSONExecute(Sender: TObject);
    procedure acClearJSONUpdate(Sender: TObject);
    procedure acLoadJSONfromFileExecute(Sender: TObject);
    procedure acLoadJSONfromFileUpdate(Sender: TObject);
    procedure acSaveJSONtoFileExecute(Sender: TObject);
    procedure acEditPersonExecute(Sender: TObject);
    procedure acTerminateExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acRefreshUpdate(Sender: TObject);
  private
    FJSON: String;
    function GetJSON: String;
    procedure SetJSON(const Value: String);
    function GetJSONPresent: Boolean;
    function GetDataPresent: Boolean;
    { Private declarations }
  public
    { Public declarations }
    property JSON:String read GetJSON write SetJSON;
    property JSONPresent:Boolean read GetJSONPresent;
    property DataPresent:Boolean read GetDataPresent;
  end;

implementation

uses
  iORM, RegisterClassesUnit, System.JSON, FMX.Forms, FMX.Dialogs,
  System.UITypes, V.Interfaces, iORM.MVVM.Interfaces, VM.Person;

{%CLASSGROUP 'FMX.Controls.TControl'}

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
  (Sender as TCOntainedAction).Enabled := Self.DataPresent;
end;

procedure TViewModelMain.acClearJSONExecute(Sender: TObject);
begin
  inherited;
  Self.JSON := '';
end;

procedure TViewModelMain.acClearJSONUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCOntainedAction).Enabled := Self.JSONPresent;
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
  (Sender as TCOntainedAction).Enabled := not Self.DataPresent;
end;

procedure TViewModelMain.acLoadJSONfromFileExecute(Sender: TObject);
var
  LStrings: TStrings;
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    LStrings := TStringList.Create;
    try
      LStrings.LoadFromFile(OpenDialog1.FileName);
      Self.JSON := LStrings.Text;
    finally
      LStrings.Free;
    end;
  end;
end;

procedure TViewModelMain.acLoadJSONfromFileUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCOntainedAction).Enabled := not Self.JSONPresent;
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
  (Sender as TCOntainedAction).Enabled := Self.DataPresent;
end;

procedure TViewModelMain.acSaveJSONtoFileExecute(Sender: TObject);
var
  LStrings: TStrings;
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    LStrings := TStringList.Create;
    try
      LStrings.Text := Self.JSON;
      LStrings.SaveToFile(SaveDialog1.FileName);
    finally
      LStrings.Free;
    end;
  end;
end;

procedure TViewModelMain.acDeserializeFromJSONExecute(Sender: TObject);
var
  NewDataObject: TObject;
begin
  inherited;
  NewDataObject := io.Mapper.FromJSON(Self.JSON).TypeAnnotationsON.ToObject;
  PersonsModelPresenter.SetDataObject(NewDataObject);
end;

procedure TViewModelMain.acDeserializeFromJSONUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCOntainedAction).Enabled := (Self.JSONPresent and not Self.DataPresent);
end;

procedure TViewModelMain.acEditPersonExecute(Sender: TObject);
var
  LCurrentClassName: String;
  LViewModel: IPersonViewModel;
begin
  inherited;
  // Get the ViewModel and set the ModelBindSource
  LViewModel := io.di.LocateViewModel<IPersonViewModel>.Get;
  LViewModel.Presenters['PersonModelPresenter'].MasterPresenter := PersonsModelPresenter;
  // Get the class name of the current person
  LCurrentClassName := PersonsModelPresenter.Current.ClassName;
  // Get the view
  io.di.LocateView<IPersonView>(LCurrentClassName).VM(LViewModel).Get;
end;

procedure TViewModelMain.acSerializeToJSONExecute(Sender: TObject);
var
  LJSONValue: TJSONValue;
  LStrings: TStrings;
begin
  inherited;
  LJSONValue := io.Mapper.From(PersonsModelPresenter.DataObject).TypeAnnotationsON.ToJSON;
  try
    Self.JSON := LJSONValue.ToString;
  finally
    LJSONValue.Free;
  end;
end;

procedure TViewModelMain.acSerializeToJSONUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCOntainedAction).Enabled := (Self.DataPresent and not Self.JSONPresent);
end;

procedure TViewModelMain.acTerminateExecute(Sender: TObject);
begin
  inherited;
  if FMX.Dialogs.MessageDlg('Close the application?', mtConfirmation, [mbOK, mbAbort], 0, mbOk) = mrOk then
    Application.Terminate;
end;

function TViewModelMain.GetDataPresent: Boolean;
begin
  Result := PersonsModelPresenter.DataObjectAssigned;
end;

function TViewModelMain.GetJSON: String;
begin
  Result := FJSON;
end;

function TViewModelMain.GetJSONPresent: Boolean;
begin
  Result := not FJSON.IsEmpty;
end;

procedure TViewModelMain.SetJSON(const Value: String);
begin
  FJSON := Value;
  Command['acRefreshMemo'].Execute;
end;

end.
