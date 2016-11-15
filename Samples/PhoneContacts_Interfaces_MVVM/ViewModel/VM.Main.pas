unit VM.Main;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase, System.Actions,
  FMX.ActnList, FMX.Types, iORM.Attributes, Vcl.ActnList, Vcl.Dialogs,
  VM.Interfaces;

type
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
  System.UITypes, V.Interfaces;

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TViewModelMain.acClearDataExecute(Sender: TObject);
begin
  inherited;
  // Clear the data object of the ActiveBindSourceAdapter
  Self.ViewData.ActiveBindSourceAdapter.ClearDataObject;
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
  NewDataObject := io.Load(ioTypeName, ioTypeAlias).ToGenericList.OfType<TPersonsList>;
  // Set the new data as DataObject of the ActiveBindSourceAdapter
  Self.ViewData.ActiveBindSourceAdapter.SetDataObject(NewDataObject);
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
  Self.ViewData.SetDataObj(NewDataObject);
end;

procedure TViewModelMain.acDeserializeFromJSONUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TCOntainedAction).Enabled := (Self.JSONPresent and not Self.DataPresent);
end;

procedure TViewModelMain.acEditPersonExecute(Sender: TObject);
var
  LCurrentClassName: String;
begin
  inherited;
  // Get the class name of the current person
  LCurrentClassName := Self.ViewData.BindSourceAdapter.Current.ClassName;
  // Get the view
  io.di.LocateView<IPersonView>(LCurrentClassName).VM_byMasterVM('IPersonViewModel', '', Self).Get;
end;

procedure TViewModelMain.acSerializeToJSONExecute(Sender: TObject);
var
  LJSONValue: TJSONValue;
  LStrings: TStrings;
begin
  inherited;
  LJSONValue := io.Mapper.From(Self.ViewData.DataObj).TypeAnnotationsON.ToJSON;
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
  Result := Assigned(Self.ViewData.ActiveBindSourceAdapter.GetDataObject);
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
  Commands.Execute('acRefreshMemo');
end;

end.
