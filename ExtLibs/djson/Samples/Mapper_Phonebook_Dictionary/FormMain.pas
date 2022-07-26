unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Interfaces, System.Generics.Collections, DJSON.Params;

const
  ENGINE_DOM = 0;
  ENGINE_STREAM = 1;
  ENGINE_JDO = 2;

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
    RadioGroupEngine: TRadioGroup;
    Shape6: TShape;
    Shape7: TShape;
    Label7: TLabel;
    Label8: TLabel;
    ButtonSerializeBSONSingleObject: TButton;
    ButtonDeserializeBSONSignleObject: TButton;
    ButtonSerializeBSONObjectList: TButton;
    ButtonDeserializeBSONObjectList: TButton;
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
    procedure ButtonSerializeBSONSingleObjectClick(Sender: TObject);
    procedure ButtonDeserializeBSONSignleObjectClick(Sender: TObject);
    procedure ButtonSerializeBSONObjectListClick(Sender: TObject);
    procedure ButtonDeserializeBSONObjectListClick(Sender: TObject);
  private
    { Private declarations }
    FBytes: TBytes;
    function BuildMapperParams: IdjParams;
    function BuildSampleObject: IPerson;
    function BuildSampleList: TList<IPerson>;
    procedure ShowSingleObjectData(APerson: IPerson);
    procedure ShowListData(APersonList: TList<IPerson>);
  end;

var
  MainForm: TMainForm;

implementation

uses
  Model, DJSON, System.JSON, DJSON.Utils;

{$R *.dfm}

{ TMainForm }

function TMainForm.BuildMapperParams: IdjParams;
begin
  Result := dj.Default;
  // Serialization Engine
  case RadioGroupEngine.ItemIndex of
    ENGINE_DOM:    Result.Engine := eDelphiDOM;
    ENGINE_STREAM: Result.Engine := eDelphiStream;
    ENGINE_JDO:    Result.Engine := eJDO;
  end;
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

function TMainForm.BuildSampleList: TList<IPerson>;
var
  NewPerson: TPerson;
begin
  Result := TList<IPerson>.Create;

  NewPerson := TPerson.Create;
  NewPerson.ID := 1;
  NewPerson.Name := 'Maurizio Del Magno';
//  NewPerson.Phones.Add(   'Home',   TPhoneNumber.Create(1, '0541/605905', 1)   );
//  NewPerson.Phones.Add(   'Mobile', TPhoneNumber.Create(2, '329/0583381', 1)   );
//  NewPerson.Phones.Add(   'Office', TPhoneNumber.Create(3, '0541/694750', 1)   );
  Result.Add(NewPerson);

  NewPerson := TPerson.Create;
  NewPerson.ID := 2;
  NewPerson.Name := 'Daniele Teti';
  NewPerson.Phones.Add(   'Office', TPhoneNumber.Create(4, '06/1122334',  2)   );
  NewPerson.Phones.Add(   'Mobile', TPhoneNumber.Create(5, '333/23456346',2)   );
  Result.Add(NewPerson);

  NewPerson := TPerson.Create;
  NewPerson.ID := 3;
  NewPerson.Name := 'Omar Bossoni';
  NewPerson.Phones.Add(   'Home',   TPhoneNumber.Create(6, '02/673927',   3)   );
  NewPerson.Phones.Add(   'Mobile', TPhoneNumber.Create(7, '347/3459276', 3)   );
  NewPerson.Phones.Add(   'Private',TPhoneNumber.Create(8, '332/6714399', 3)   );
  Result.Add(NewPerson);
end;

function TMainForm.BuildSampleObject: IPerson;
begin
  Result := TPerson.Create;
  Result.ID := 1;
  Result.Name := 'Maurizio Del Magno';
  Result.Phones.Add(   'Home',   TPhoneNumber.Create(1, '0541/605905', 1)   );
  Result.Phones.Add(   'Mobile', TPhoneNumber.Create(2, '329/0583381', 1)   );
  Result.Phones.Add(   'Office', TPhoneNumber.Create(3, '0541/694750', 1)   );
end;

procedure TMainForm.ButtonDeserializeBSONObjectListClick(Sender: TObject);
var
  LPersonList: TList<IPerson>;
  LParams: IdjParams;
begin
  LParams := BuildMapperParams;
  // ---------------------
  if LParams.TypeAnnotations then
    LPersonList := dj.FromBson(FBytes, LParams).&To<TList<IPerson>>
  else
    LPersonList := dj.FromBson(FBytes, LParams).ItemsOfType<TPerson>.&To<TList<IPerson>>;
  // ---------------------
  try
    ShowListData(LPersonList);
  finally
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonDeserializeBSONSignleObjectClick(Sender: TObject);
var
  LPerson: IPerson;
  LParams: IdjParams;
begin
  LParams := BuildMapperParams;

  LPerson := dj.FromBson(FBytes).Params(LParams).&To<TPerson>;

  ShowSingleObjectData(LPerson);
end;

procedure TMainForm.ButtonDeserializeObjectListClick(Sender: TObject);
var
  LPersonList: TList<IPerson>;
  LParams: IdjParams;
begin
  LParams := BuildMapperParams;
  // ---------------------
  if LParams.TypeAnnotations then
    LPersonList := dj.FromJson(Memo1.Lines.Text, LParams).&To<TList<IPerson>>
  else
    LPersonList := dj.FromJson(Memo1.Lines.Text, LParams).ItemsOfType<TPerson>.&To<TList<IPerson>>;
  // ---------------------
  try
    ShowListData(LPersonList);
  finally
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonDeserializeSignleObjectClick(Sender: TObject);
var
  LPerson: IPerson;
  LParams: IdjParams;
begin
  LParams := BuildMapperParams;
  // ---------------------
  if LParams.TypeAnnotations then
    LPerson := dj.FromJson(Memo1.Lines.Text, LParams).&To<IPerson>  // <--- Direct to interface
  else
    LPerson := dj.FromJson(Memo1.Lines.Text, LParams).&To<TPerson>;
  // ---------------------
  ShowSingleObjectData(LPerson);
end;

procedure TMainForm.ButtonOtherDeserialize1Click(Sender: TObject);
var
  LPerson: IPerson;
begin
  LPerson := TPerson.Create;
  // ---------------------
  // Questo è il modo più semplice di utilizzare il mapper.
  // Da usare se il comportamento di default del mapper è consono alle esigenze
  dj.FromJson(Memo1.Lines.Text).TypeAnnotationsON.&To(LPerson);
  // ---------------------
  ShowSingleObjectData(LPerson);
end;

procedure TMainForm.ButtonOtherDeserialize2Click(Sender: TObject);
var
  LPersonList: TList<IPerson>;
  LPerson: IPerson;
begin
  LPersonList := TList<IPerson>.Create;
  // ---------------------
  // Utilizzo del mapper senza un oggetto "Params" ma specificando gli eventuali parametri
  //  desiderati direttamente sulla chiamata.
  //  IN questo caso si chiede la serializzazione per Fields (normalmente avviene per proprietà),
  //  annotazione dei tipi nel JSON attivata e disabilita gli eventuali custom serializers.
  dj.FromJson(Memo1.Lines.Text).byFields.TypeAnnotationsON.CustomSerializersOFF.&To(LPersonList);
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
  LPerson: IPerson;
begin
  // ---------------------
  // Utilizzo del mapper senza un oggetto "Params" ma specificando gli eventuali parametri
  //  desiderati direttamente sulla chiamata.
  //  IN questo caso si chiede la serializzazione per Fields (normalmente avviene per proprietà),
  //  annotazione dei tipi nel JSON attivata e disabilita gli eventuali custom serializers.
  //  NB: In questo caso non viene specificato il tipo del risultato nella chiamata, tale
  //       informazione viene presa direttamente dal JSON (TypeAnnotationsON), in questo
  //       caso il risultato ottenuto è un TObject.
  LObj := dj.FromJson(Memo1.Lines.Text).byFields.TypeAnnotationsON.CustomSerializersON.ToObject;
  // ---------------------
  Supports(LObj, IPerson, LPerson);  // Extract the interface
  ShowSingleObjectData(LPerson);
end;

procedure TMainForm.ButtonOtherSerialize1Click(Sender: TObject);
var
  LPerson: IPerson;
begin
  LPerson := BuildSampleObject;
  Memo1.Clear;
  Memo1.Lines.Text := dj.From(LPerson).TypeAnnotationsON.ToJSON;
end;

procedure TMainForm.ButtonOtherSerialize2Click(Sender: TObject);
var
  LPersonList: TList<IPerson>;
begin
  LPersonList := BuildSampleList;
  try
    // Utilizzo del mapper senza un oggetto "Params" ma specificando gli eventuali parametri
    //  desiderati direttamente sulla chiamata.
    //  IN questo caso si chiede la serializzazione per Fields (normalmente avviene per proprietà),
    //  annotazione dei tipi nel JSON attivata e disabilita gli eventuali custom serializers.
    Memo1.Clear;
    Memo1.Lines.Text := dj.From(LPersonList).byFields.TypeAnnotationsON.CustomSerializersOFF.ToJSON;
  finally
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonOtherSerialize3Click(Sender: TObject);
var
  LPerson: IPerson;
begin
  LPerson := BuildSampleObject;
  // Utilizzo del mapper senza un oggetto "Params" ma specificando gli eventuali parametri
  //  desiderati direttamente sulla chiamata.
  //  IN questo caso si chiede la serializzazione per Fields (normalmente avviene per proprietà),
  //  annotazione dei tipi nel JSON attivata e con gli eventuali custom serializers attivati.
  Memo1.Clear;
  Memo1.Lines.Text := dj.From(LPerson).byFields.TypeAnnotationsON.CustomSerializersON.ToJSON;
end;

procedure TMainForm.ButtonSerializeBSONObjectListClick(Sender: TObject);
var
  LPersonList: TList<IPerson>;
  LParams: IdjParams;
begin
  LParams     := BuildMapperParams;
  LPersonList := BuildSampleList;
  try
    SetLength(FBytes, 0);
    FBytes := dj.From(LPersonList, LParams).ToBsonAsBytes;
    Memo1.Clear;
    Memo1.Lines.Text := TdjUtils.Bytes2String(FBytes);
  finally
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonSerializeBSONSingleObjectClick(Sender: TObject);
var
  LPerson: IPerson;
  LParams: IdjParams;
begin
  LParams := BuildMapperParams;
  LPerson := BuildSampleObject;

  FBytes := dj.From(LPerson, LParams).ToBsonAsBytes;

  Memo1.Clear;
  Memo1.Lines.Text := TdjUtils.Bytes2String(FBytes);
end;

procedure TMainForm.ButtonSerializeObjectListClick(Sender: TObject);
var
  LPersonList: TList<IPerson>;
  LParams: IdjParams;
begin
  LParams     := BuildMapperParams;
  LPersonList := BuildSampleList;
  try
    Memo1.Clear;
    Memo1.Lines.Text := dj.From(LPersonList, LParams).ToJSON;
  finally
    LPersonList.Free;
  end;
end;

procedure TMainForm.ButtonSerializeSignleObjectClick(Sender: TObject);
var
  LPerson: IPerson;
  LParams: IdjParams;
begin
  LParams := BuildMapperParams;
  LPerson := BuildSampleObject;
  Memo1.Clear;
  Memo1.Lines.Text := dj.From(LPerson, LParams).ToJSON;
end;

procedure TMainForm.ShowListData(APersonList: TList<IPerson>);
var
  LPerson: IPerson;
  LPhoneNumber: IPhoneNumber;
  LKey: String;
begin
  Memo1.Lines.BeginUpdate;
  try
    Memo1.Lines.Add('');
    Memo1.Lines.Add('');
    Memo1.Lines.Add('');
    Memo1.Lines.Add('---------- Start deserialized --------------');
    for LPerson in APersonList do
    begin
      Memo1.Lines.Add('');
      Memo1.Lines.Add('Class: ' + (LPerson as TObject).ClassName);
      Memo1.Lines.Add('ID = ' +  LPerson.ID.ToString);
      Memo1.Lines.Add('Name = ' +  LPerson.Name);
      for LKey in LPerson.Phones.Keys do
      begin
        LPhoneNumber := LPerson.Phones.Items[LKey];
        Memo1.Lines.Add('');
        Memo1.Lines.Add('     Class: ' + (LPhoneNumber as TObject).ClassName);
        Memo1.Lines.Add('     Key (Type of phone number): ' + LKey);
        Memo1.Lines.Add('     ID: ' + LPhoneNumber.ID.ToString);
        Memo1.Lines.Add('     MasterID: ' + LPhoneNumber.MasterID.ToString);
        Memo1.Lines.Add('     Number: ' + LPhoneNumber.Number);
      end;
    end;
    Memo1.Lines.Add('');
    Memo1.Lines.Add('---------- End deserialized --------------');
  finally
    Memo1.Lines.EndUpdate;
  end;
end;

procedure TMainForm.ShowSingleObjectData(APerson: IPerson);
var
  LKey: String;
  LPhoneNumber: IPhoneNumber;
begin
  Memo1.Lines.BeginUpdate;
  try
    Memo1.Lines.Add('');
    Memo1.Lines.Add('');
    Memo1.Lines.Add('');
    Memo1.Lines.Add('---------- Start deserialized --------------');
    Memo1.Lines.Add('Class: ' + (APerson as TObject).ClassName);
    Memo1.Lines.Add('ID = ' +  APerson.ID.ToString);
    Memo1.Lines.Add('Name = ' +  APerson.Name);
    for LKey in APerson.Phones.Keys do
    begin
      LPhoneNumber := APerson.Phones.Items[LKey];
      Memo1.Lines.Add('');
      Memo1.Lines.Add('     Class: ' + (LPhoneNumber as TObject).ClassName);
      Memo1.Lines.Add('     Key (Type of phone number): ' + LKey);
      Memo1.Lines.Add('     ID: ' + LPhoneNumber.ID.ToString);
      Memo1.Lines.Add('     MasterID: ' + LPhoneNumber.MasterID.ToString);
      Memo1.Lines.Add('     Number: ' + LPhoneNumber.Number);
    end;
    Memo1.Lines.Add('');
    Memo1.Lines.Add('---------- End deserialized --------------');
  finally
    Memo1.Lines.EndUpdate;
  end;
end;

end.
