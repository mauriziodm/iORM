unit FormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit,
  System.Generics.Collections, Model, JsonDataObjects;

type
  TMainForm = class(TForm)
    eNumOfObjects: TEdit;
    ButonSerializeDOM: TButton;
    LabelElapsedSerializeDOM: TLabel;
    ButtonDeserializeDOM: TButton;
    LabelElapsedDeserializeDOM: TLabel;
    ButtonDeserializaStream: TButton;
    LabelElapsedDeserializeStream: TLabel;
    ButtonDeserializaJDO: TButton;
    LabelElapsedDeserializeJDO: TLabel;
    ButonSerializeJDO: TButton;
    LabelElapsedSerializeJDO: TLabel;
    ButonSerializeStream: TButton;
    LabelElapsedSerializeStream: TLabel;
    ButtonDeserializeOM: TButton;
    LabelElapsedDeserializeOM: TLabel;
    ButonSerializeOM: TButton;
    LabelElapsedSerializeOM: TLabel;
    ButtonDeserializaTurboJDO: TButton;
    LabelElapsedDeserializeTurboJDO: TLabel;
    procedure CreateSampleObj;
    procedure FormDestroy(Sender: TObject);
    procedure ButonSerializeDOMClick(Sender: TObject);
    procedure ButtonDeserializeDOMClick(Sender: TObject);
    procedure ButtonDeserializaStreamClick(Sender: TObject);
    procedure ButtonDeserializaJDOClick(Sender: TObject);
    function Prova: TJsonDataValue;
    procedure ButonSerializeJDOClick(Sender: TObject);
    procedure ButonSerializeStreamClick(Sender: TObject);
    procedure ButtonDeserializeOMClick(Sender: TObject);
    procedure ButonSerializeOMClick(Sender: TObject);
    procedure ButtonDeserializaTurboJDOClick(Sender: TObject);
  private
    { Private declarations }
    FList: TObjectList<TPerson>;
    FJSONText: String;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  System.Diagnostics, DJSON, System.JSON, DeserializeStreamU, DeserializeDOMU,
  DeserializeJDOU, DJSON.Engine.Stream, DJSON.Engine.DOM, DJSON.Utils.RTTI, DJSON.Params, ObjectsMappers,
  DJSON.Engine.JDO;

{$R *.fmx}

procedure TMainForm.ButonSerializeDOMClick(Sender: TObject);
var
  LStopWatch: TStopWatch;
begin
  CreateSampleObj;
  try
    LStopWatch := TStopwatch.StartNew;
    FJSONText := dj.From(FList).Engine(eDelphiDOM).ToJSON;
    LStopWatch.Stop;
    LabelElapsedSerializeDOM.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms';
  finally
    FreeAndNil(FList);
  end;
end;

procedure TMainForm.ButonSerializeJDOClick(Sender: TObject);
var
  LStopWatch: TStopWatch;
begin
  CreateSampleObj;
  try
    LStopWatch := TStopwatch.StartNew;
    FJSONText := dj.From(FList).Engine(eJDO).ToJSON;
    LStopWatch.Stop;
    LabelElapsedSerializeJDO.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms';
  finally
    FreeAndNil(FList);
  end;
end;

procedure TMainForm.ButonSerializeOMClick(Sender: TObject);
var
  LStopWatch: TStopWatch;
begin
  CreateSampleObj;
  try
    LStopWatch := TStopwatch.StartNew;
    FJSONText := Mapper.ObjectListToJSONArray<TPerson>(FList).ToJSON;
    LStopWatch.Stop;
    LabelElapsedSerializeOM.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms';
  finally
    FreeAndNil(FList);
  end;
end;

procedure TMainForm.ButonSerializeStreamClick(Sender: TObject);
var
  LStopWatch: TStopWatch;
begin
  CreateSampleObj;
  try
    LStopWatch := TStopwatch.StartNew;
    FJSONText := dj.From(FList).Engine(eDelphiStream).ToJSON;
    LStopWatch.Stop;
    LabelElapsedSerializeStream.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms';
  finally
    FreeAndNil(FList);
  end;
end;

procedure TMainForm.CreateSampleObj;
var
  LCurrPersonID, LCurrNumberID, LNumOfObjectsToCreate: Integer;
  LNewPerson: TPerson;
  LStopWatch: TStopWatch;
begin
  if Assigned(FList) then
    FreeAndNil(FList);
  LNumOfObjectsToCreate := StrToInt(eNumOfObjects.Text);
  FList := TObjectList<TPerson>.Create;
  LCurrNumberID := 0;
  for LCurrPersonID := 1 to LNumOfObjectsToCreate do
  begin
    LNewPerson := TPerson.Create(LCurrPersonID, 'Maurizio Del Magno');
    Inc(LCurrNumberID);
    LNewPerson.NumTel.Add(   TPhoneNumber.Create(LCurrNumberID, '0541/605905', LCurrPersonID)   );
    Inc(LCurrNumberID);
    LNewPerson.NumTel.Add(   TPhoneNumber.Create(LCurrNumberID, '329/0583381', LCurrPersonID)   );
    Inc(LCurrNumberID);
    LNewPerson.NumTel.Add(   TPhoneNumber.Create(LCurrNumberID, '0541/694750', LCurrPersonID)   );
    FList.Add(LNewPerson);
  end;
end;

procedure TMainForm.ButtonDeserializaJDOClick(Sender: TObject);
var
  ResultList: TObjectList<TPerson>;
  LStopWatch: TStopWatch;
begin
  try
    ResultList := TObjectList<TPerson>.Create;
    LStopWatch := TStopwatch.StartNew;

    dj.FromJson(FJSONText).ItemsOfType<TPerson>.Engine(eJDO).&To(ResultList);

    LStopWatch.Stop;
    LabelElapsedDeserializeJDO.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms   (' + IntToStr(ResultList.Count) + ' items)';
  finally
    ResultList.Free;
  end;
end;

procedure TMainForm.ButtonDeserializaStreamClick(Sender: TObject);
var
  ResultList: TObjectList<TPerson>;
  LStopWatch: TStopWatch;
begin
  try
    ResultList := TObjectList<TPerson>.Create;
    LStopWatch := TStopwatch.StartNew;

    dj.FromJson(FJSONText).ItemsOfType<TPerson>.Engine(eDelphiStream).&To(ResultList);

    LStopWatch.Stop;
    LabelElapsedDeserializeStream.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms   (' + IntToStr(ResultList.Count) + ' items)';
  finally
    ResultList.Free;
  end;
end;

procedure TMainForm.ButtonDeserializaTurboJDOClick(Sender: TObject);
var
  ResultList: TObjectList<TPerson>;
  LStopWatch: TStopWatch;
begin
  try
    ResultList := TObjectList<TPerson>.Create;
    LStopWatch := TStopwatch.StartNew;

    dj.FromJson(FJSONText).ItemsOfType<TPerson>.Engine(eTurboJDO).&To(ResultList);

    LStopWatch.Stop;
    LabelElapsedDeserializeTurboJDO.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms   (' + IntToStr(ResultList.Count) + ' items)';
  finally
    ResultList.Free;
  end;
end;

procedure TMainForm.ButtonDeserializeDOMClick(Sender: TObject);
var
  ResultList: TObjectList<TPerson>;
  LStopWatch: TStopWatch;
begin
  try
    ResultList := TObjectList<TPerson>.Create;
    LStopWatch := TStopwatch.StartNew;

    dj.FromJson(FJSONText).ItemsOfType<TPerson>.Engine(eDelphiDOM).&To(ResultList);

    LStopWatch.Stop;
    LabelElapsedDeserializeDOM.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms   (' + IntToStr(ResultList.Count) + ' items)';
  finally
    ResultList.Free;
  end;
end;

procedure TMainForm.ButtonDeserializeOMClick(Sender: TObject);
var
  ResultList: TObjectList<TPerson>;
  LStopWatch: TStopWatch;
  LJSONValue: TJSONArray;
begin
  try
    LStopWatch := TStopwatch.StartNew;

    LJSONValue := TJSONObject.ParseJSONValue(FJSONText) as TJSONArray;
    ResultList := Mapper.JSONArrayToObjectList<TPerson>(LJSONValue);

    LStopWatch.Stop;
    LabelElapsedDeserializeOM.Text := LStopWatch.ElapsedMilliseconds.ToString + ' ms   (' + IntToStr(ResultList.Count) + ' items)';
  finally
    ResultList.Free;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if Assigned(FList) then
    FList.Free;
end;

function TMainForm.Prova: TJsonDataValue;
begin
  Result.IntValue := 25;
end;

end.
