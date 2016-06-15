unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ObjMapperEngine, Model, System.Generics.Collections;

const
  MODE_JAVASCRIPT = 0;
  MODE_DATACONTRACT = 1;

  TYPE_PROPERTIES = 0;
  TYPE_FIELDS = 1;

type
  TMainForm = class(TForm)
    PanelTools: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape4: TShape;
    Label4: TLabel;
    Shape5: TShape;
    Label5: TLabel;
    Label6: TLabel;
    RadioGroupSerializationMode: TRadioGroup;
    RadioGroupSerializationType: TRadioGroup;
    CheckBoxTypeAnnotations: TCheckBox;
    CheckBoxCustomSerializers: TCheckBox;
    ButtonSerializeSignleObject: TButton;
    ButtonDeserializeSignleObject: TButton;
    ButtonSerializeObjectList: TButton;
    ButtonDeserializeObjectList: TButton;
    ButtonOtherSerialize1: TButton;
    ButtonOtherDeserialize1: TButton;
    ButtonOtherSerialize2: TButton;
    ButtonOtherDeserialize2: TButton;
    ButtonOtherSerialize3: TButton;
    ButtonOtherDeserialize3: TButton;
    Memo1: TMemo;
    procedure ButtonSerializeSignleObjectClick(Sender: TObject);
    procedure ButtonDeserializeSignleObjectClick(Sender: TObject);
    procedure ButtonSerializeObjectListClick(Sender: TObject);
    procedure ButtonDeserializeObjectListClick(Sender: TObject);
    procedure ButtonOtherSerialize1Click(Sender: TObject);
    procedure ButtonOtherDeserialize1Click(Sender: TObject);
    procedure ButtonOtherSerialize2Click(Sender: TObject);
    procedure ButtonOtherDeserialize2Click(Sender: TObject);
    procedure ButtonOtherSerialize3Click(Sender: TObject);
    procedure ButtonOtherDeserialize3Click(Sender: TObject);
  private
    { Private declarations }
    function BuildMapperParams: IomParams;
    function BuildSampleObject: TPerson;
    function BuildSampleList: TObjectList<TPerson>;
    procedure ShowSingleObjectData(APerson: TPerson);
    procedure ShowListData(APersonList: TObjectList<TPerson>);
  end;

var
  MainForm: TMainForm;

implementation

uses
  ObjMapper, System.JSON, System.Rtti;

{$R *.dfm}

function TMainForm.BuildMapperParams: IomParams;
begin
  Result := om.Default;
  // Serialization Mode
  case RadioGroupSerializationMode.ItemIndex of
    MODE_JAVASCRIPT:   Result.SerializationMode := smJavaScript;
    MODE_DATACONTRACT: Result.SerializationMode := smDataContract;
  end;
  // Serialization Type
  case RadioGroupSerializationType.ItemIndex of
    TYPE_PROPERTIES:   Result.SerializationType := stProperties;
    TYPE_FIELDS:       Result.SerializationType := stFields;
  end;
  // Type annotations
  Result.TypeAnnotations := CheckBoxTypeAnnotations.Checked;
  // Custom serializers
  Result.EnableCustomSerializers := CheckBoxCustomSerializers.Checked;
end;

function TMainForm.BuildSampleList: TObjectList<TPerson>;
var
  NewPerson: TPerson;
begin
  Result := TObjectList<TPerson>.Create;

  NewPerson := TPerson.Create(1, 'Maurizio Del Magno');
  NewPerson.NumTel.Add(   TNumTel.Create(1, '0541/605905', 1)   );
  NewPerson.NumTel.Add(   TNumTel.Create(2, '329/0583381', 1)   );
  NewPerson.NumTel.Add(   TNumTel.Create(3, '0541/694750', 1)   );
  Result.Add(NewPerson);

  NewPerson := TPerson.Create(2, 'Daniele Teti');
  NewPerson.NumTel.Add(   TNumTel.Create(4, '06/1122334',  2)   );
  NewPerson.NumTel.Add(   TNumTel.Create(5, '333/23456346',2)   );
  Result.Add(NewPerson);

  NewPerson := TPerson.Create(3, 'Omar Bossoni');
  NewPerson.NumTel.Add(   TNumTel.Create(6, '02/673927',   3)   );
  NewPerson.NumTel.Add(   TNumTel.Create(7, '347/3459276', 3)   );
  NewPerson.NumTel.Add(   TNumTel.Create(8, '332/6714399', 3)   );
  Result.Add(NewPerson);
end;

function TMainForm.BuildSampleObject: TPerson;
begin
  Result := TPerson.Create(1, 'Maurizio Del Magno');
  Result.NumTel.Add(   TNumTel.Create(1, '0541/605905', 1)   );
  Result.NumTel.Add(   TNumTel.Create(2, '329/0583381', 1)   );
  Result.NumTel.Add(   TNumTel.Create(3, '0541/694750', 1)   );
end;

procedure TMainForm.ButtonDeserializeObjectListClick(Sender: TObject);
var
  LPersonList: TObjectList<TPerson>;
  LPerson: TPerson;
  LNumtel: TNumTel;
  LParams: IomParams;
begin
  LParams := BuildMapperParams;
  // ---------------------
  if LParams.TypeAnnotations then
    LPersonList := om.FromJSON(Memo1.Lines.Text, LParams).&To<TObjectList<TPerson>>
  else
    LPersonList := om.FromJSON(Memo1.Lines.Text, LParams).ItemsOfType<TPerson>.&To<TObjectList<TPerson>>;
  // ---------------------
  try
    LPersonList.OwnsObjects := True;
    ShowListData(LPersonList);
  finally
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonDeserializeSignleObjectClick(Sender: TObject);
var
  LPerson: TPerson;
  LParams: IomParams;
begin
  LParams := BuildMapperParams;
  // ---------------------
  LPerson := om.FromJSON(Memo1.Lines.Text).Params(LParams).&To<TPerson>;
  // Oppure: LPerson := om.FromJSON(Memo1.Lines.Text, LParams).&To<TPerson>;
  // Oppure: LPerson := om.FromJSON(Memo1.Lines.Text).&To<TPerson>;
  // ---------------------
  try
    ShowSingleObjectData(LPerson);
  finally
    LPerson.Free;
  end;
end;

procedure TMainForm.ButtonOtherDeserialize1Click(Sender: TObject);
var
  LPerson: TPerson;
begin
  LPerson := TPerson.Create;
  try
    // ---------------------
    // Questo è il modo più semplice di utilizzare il mapper.
    // Da usare se il comportamento di default del mapper è consono alle esigenze
    om.FromJSON(Memo1.Lines.Text).&To(LPerson);
    // ---------------------
    ShowSingleObjectData(LPerson);
  finally
    LPerson.Free;
  end;
end;

procedure TMainForm.ButtonOtherDeserialize2Click(Sender: TObject);
var
  LPersonList: TObjectList<TPerson>;
  LPerson: TPerson;
begin
  LPersonList := TObjectList<TPerson>.Create(True);
  // ---------------------
  // Utilizzo del mapper senza un oggetto "Params" ma specificando gli eventuali parametri
  //  desiderati direttamente sulla chiamata.
  //  IN questo caso si chiede la serializzazione per Fields (normalmente avviene per proprietà),
  //  annotazione dei tipi nel JSON attivata e disabilita gli eventuali custom serializers.
  om.FromJSON(Memo1.Lines.Text).byFields.TypeAnnotationsON.CustomSerializersOFF.&To(LPersonList);
  // ---------------------
  try
    ShowListData(LPersonList);
  finally
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonOtherDeserialize3Click(Sender: TObject);
var
  LObj: TObject;
begin
  // ---------------------
  // Utilizzo del mapper senza un oggetto "Params" ma specificando gli eventuali parametri
  //  desiderati direttamente sulla chiamata.
  //  IN questo caso si chiede la serializzazione per Fields (normalmente avviene per proprietà),
  //  annotazione dei tipi nel JSON attivata e disabilita gli eventuali custom serializers.
  //  NB: In questo caso non viene specificato il tipo del risultato nella chiamata, tale
  //       informazione viene presa direttamente dal JSON (TypeAnnotationsON), in questo
  //       caso il risultato ottenuto è un TObject.
  LObj := om.FromJSON(Memo1.Lines.Text).byFields.TypeAnnotationsON.CustomSerializersOFF.ToObject;
  // ---------------------
  try
    ShowSingleObjectData(LObj as TPerson);
  finally
    LObj.Free;
  end;
end;

procedure TMainForm.ButtonOtherSerialize1Click(Sender: TObject);
var
  LPerson: TPerson;
  LJSONValue: TJSONValue;
begin
  LPerson := BuildSampleObject;
  try
    // ---------------------
    // Questo è il modo più semplice di utilizzare il mapper.
    // Da usare se il comportamento di default del mapper è consono alle esigenze
    LJSONValue := om.From(LPerson).ToJSON;
    // ---------------------
    Memo1.Clear;
    Memo1.Lines.Text := LJSONValue.ToString;
  finally
    if Assigned(LJSONValue) then
      LJSONValue.Free;
    LPerson.Free;
  end;
end;

procedure TMainForm.ButtonOtherSerialize2Click(Sender: TObject);
var
  LPersonList: TObjectList<TPerson>;
  LJSONValue: TJSONValue;
begin
  LPersonList := BuildSampleList;
  try
    // ---------------------
    // Utilizzo del mapper senza un oggetto "Params" ma specificando gli eventuali parametri
    //  desiderati direttamente sulla chiamata.
    //  IN questo caso si chiede la serializzazione per Fields (normalmente avviene per proprietà),
    //  annotazione dei tipi nel JSON attivata e disabilita gli eventuali custom serializers.
    LJSONValue := om.From(LPersonList).byFields.TypeAnnotationsON.CustomSerializersOFF.ToJSON;
    // ---------------------
    Memo1.Clear;
    Memo1.Lines.Text := LJSONValue.ToString;
  finally
    if Assigned(LJSONValue) then
      LJSONValue.Free;
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonOtherSerialize3Click(Sender: TObject);
var
  LPerson: TPerson;
  LJSONValue: TJSONValue;
begin
  LPerson := BuildSampleObject;
  try
    // ---------------------
    // Utilizzo del mapper senza un oggetto "Params" ma specificando gli eventuali parametri
    //  desiderati direttamente sulla chiamata.
    //  IN questo caso si chiede la serializzazione per Fields (normalmente avviene per proprietà),
    //  annotazione dei tipi nel JSON attivata e disabilita gli eventuali custom serializers.
    LJSONValue := om.From(LPerson).byFields.TypeAnnotationsON.CustomSerializersOFF.ToJSON;
    // ---------------------
    Memo1.Clear;
    Memo1.Lines.Text := LJSONValue.ToString;
  finally
    if Assigned(LJSONValue) then
      LJSONValue.Free;
    LPerson.Free;
  end;
end;

procedure TMainForm.ButtonSerializeObjectListClick(Sender: TObject);
var
  LPersonList: TObjectList<TPerson>;
  LParams: IomParams;
  LJSONValue: TJSONValue;
begin
  LParams     := BuildMapperParams;
  LPersonList := BuildSampleList;
  try
    // ---------------------
    LJSONValue := om.From(LPersonList, LParams).ToJSON;
    // Oppure: LJSONValue := om.From(LPersonList).Params(LParams).ToJSON;
    // Oppure: LJSONValue := om.From(LPersonList).ToJSON;
    // ---------------------
    Memo1.Clear;
    Memo1.Lines.Text := LJSONValue.ToString;
  finally
    if Assigned(LJSONValue) then
      LJSONValue.Free;
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonSerializeSignleObjectClick(Sender: TObject);
var
  LPerson: TPerson;
  LParams: IomParams;
  LJSONValue: TJSONValue;
begin
  LParams := BuildMapperParams;
  LPerson := BuildSampleObject;
  try
    // ---------------------
    LJSONValue := om.From(LPerson, LParams).ToJSON;
    // Oppure: LJSONValue := om.From(LPerson).Params(LParams).ToJSON;
    // Oppure: LJSONValue := om.From(LPerson).ToJSON;
    // ---------------------
    Memo1.Clear;
    Memo1.Lines.Text := LJSONValue.ToString;
  finally
    if Assigned(LJSONValue) then
      LJSONValue.Free;
    LPerson.Free;
  end;
end;

procedure TMainForm.ShowListData(APersonList: TObjectList<TPerson>);
var
  LPerson: TPerson;
  LNumtel: TNumTel;
begin
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('---------- Start deserialized --------------');
  for LPerson in APersonList do
  begin
    Memo1.Lines.Add('');
    Memo1.Lines.Add('Class: ' + TPerson.ClassName);
    Memo1.Lines.Add('ID = ' +  LPerson.ID.ToString);
    Memo1.Lines.Add('Descrizione = ' +  LPerson.Descrizione);
    for LNumtel in LPerson.NumTel do
    begin
      Memo1.Lines.Add('');
      Memo1.Lines.Add('     Class: ' + LNumtel.ClassName);
      Memo1.Lines.Add('     ID: ' + LNumtel.ID.ToString);
      Memo1.Lines.Add('     MasterID: ' + LNumtel.MasterID.ToString);
      Memo1.Lines.Add('     Numero: ' + LNumtel.Numero);
    end;
  end;
  Memo1.Lines.Add('---------- End deserialized --------------');
end;

procedure TMainForm.ShowSingleObjectData(APerson: TPerson);
var
  LNumTel: TNumTel;
begin
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('');
  Memo1.Lines.Add('---------- Start deserialized --------------');
  Memo1.Lines.Add('Class: ' + TPerson.ClassName);
  Memo1.Lines.Add('ID = ' +  APerson.ID.ToString);
  Memo1.Lines.Add('Descrizione = ' +  APerson.Descrizione);
  for LNumtel in APerson.NumTel do
  begin
    Memo1.Lines.Add('');
    Memo1.Lines.Add('     Class: ' + LNumtel.ClassName);
    Memo1.Lines.Add('     ID: ' + LNumtel.ID.ToString);
    Memo1.Lines.Add('     MasterID: ' + LNumtel.MasterID.ToString);
    Memo1.Lines.Add('     Numero: ' + LNumtel.Numero);
  end;
  Memo1.Lines.Add('---------- End deserialized --------------');
end;

end.
