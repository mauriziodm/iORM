unit DemoTests;

interface

uses
  DUnitX.TestFramework,
  System.Generics.Collections,
  System.Rtti,
  System.json,
  DJSON.Attributes,
  DJSON.Serializers,
  DJSON.Params;

type
  THtmlColorConverter = class(TdjDOMCustomSerializer)
    class function Serialize(const AValue: TValue): TJSONValue; override;
    class function Deserialize(const AJSONValue: TJSONValue; const AExistingValue: TValue): TValue; override;
    class function isTypeNotificationCompatible: Boolean; override;
  end;

  THtmlColor = class
  private
    FRed: Integer;
    FGreen: Integer;
    FBlue: Integer;
  public
    constructor Create(ARed, AGreen, ABlue: Integer);
    property Red: Integer read FRed write FRed;
    property Green: Integer read FGreen write FGreen;
    property Blue: Integer read FBlue write FBlue;
  end;

  TPersonDemo = class
  private
    FName: string;
    FAge: Integer;
    FJob: string;
  public
    property Name: string read FName write FName;
    property Age: Integer read FAge write FAge;
    property Job: string read FJob write FJob;
  end;

  TSession = class
  private
    FName: string;
    FDate: TDateTime;
  public
    property Name: string read FName write FName;
    property Date: TDateTime read FDate write FDate;
  end;

  TCity = class
  private
    FName: string;
    FPopulation: Integer;
  public
    property Name: string read FName write FName;
    property Population: Integer read FPopulation write FPopulation;
  end;

  TEmployee = class
  public
    Name: string;
    constructor Create(AName: string);
  end;

  TManager = class(TEmployee)
  public
    Reportees: TList<TEmployee>; { get; set; }
    constructor Create(const AName: string);
    destructor Destroy; override;
  end;

  THouse = class
  public
    StreetAddress: string; { get; set; }
    BuildDate: TDateTime; { get; set; }
    Bedrooms: Integer; { get; set; }
    FloorArea: Single; { get; set; }
  end;

  THouse1 = class
  public
    StreetAddress: string; { get; set; }
    [djSkip]
    BuildDate: TDateTime; { get; set; }
    [djSkip]
    Bedrooms: Integer; { get; set; }
    [djSkip]
    FloorArea: Single; { get; set; }
  end;

  THouse2 = class
  public
    [djName('address')]
    StreetAddress: string; { get; set; }
    BuildDate: TDateTime; { get; set; }
    Bedrooms: Integer; { get; set; }
    [djName('FloorArea')]
    FloorArea: Single; { get; set; }
  end;

  TGeneric<T: class, constructor> = class
  public
    id: Integer;
    Item: T;
    constructor Create;
  end;

  TNoClassGeneric<T> = class
  public
    id: Integer;
    Item: T;
  end;

  [TestFixture]
  TDemoTests = class(TObject)
  private
    FParams: IdjParams;
  public
    [Setup]
    procedure Setup;
    [Test]
    procedure JsonConverter;
    [Test]
    procedure SerializationGuide;
    [Test]
    procedure SerializationBasics;
    [Test]
    procedure SerializationBasics2;
    [Test]
    procedure DeserializationBasics1;
    [Test]
    procedure SerializeReferencesByValue;
    [Test]
    procedure SerializeReferencesWithMetadata;
    [Test]
    procedure SerializeAttributes;
    [Test]
    procedure DeserializationGeneric;
    [Test]
    procedure DeserializationNoClassGeneric;
  end;

implementation

uses
  System.SysUtils,
  DJSON;

procedure TDemoTests.SerializationBasics;
var
  LRoles: TList<string>;
begin
  LRoles := TList<string>.Create;
  try
    LRoles.AddRange(['User', 'Admin']);
    Assert.AreEqual('["User","Admin"]', dj.From(LRoles, FParams).ToJson);
  finally
    LRoles.Free;
  end;
end;

procedure TDemoTests.SerializationBasics2;
var
  s: TSession;
  Serialized: string;
begin
  s := TSession.Create;
  try
    s.Name := 'Serialize All The Things';
    s.Date := StrToDate('03/07/2017', TFormatSettings.Create('en-GB'));
    Serialized := dj.From(s, FParams).ToJson;
    Assert.AreEqual('{"Name":"Serialize All The Things","Date":"2017-07-03T00:00:00.000Z"}', Serialized);
  finally
    s.Free;
  end;
end;

procedure TDemoTests.SerializationGuide;
var
  LResult: string;
  LRoles: TList<string>;
  LDailyRegistrations: TDictionary<TDateTime, Integer>;
  LCity: TCity;
begin
  LRoles := TList<string>.Create;
  try
    LRoles.AddRange(['User', 'Admin']);
    LResult := dj.From(LRoles, FParams).ToJson;
    Assert.AreEqual('["User","Admin"]', LResult);
  finally
    LRoles.Free;
  end;

  LDailyRegistrations := TDictionary<TDateTime, Integer>.Create;
  try
    LDailyRegistrations.Add(StrToDate('02/07/2017', TFormatSettings.Create('en-GB')), 23);
    LDailyRegistrations.Add(StrToDate('10/08/2017', TFormatSettings.Create('en-GB')), 50);
    LResult := dj.From(LDailyRegistrations, FParams).ToJson;
    Assert.AreEqual('[{"2017-07-02T00:00:00.000Z":23},{"2017-08-10T00:00:00.000Z":50}]', //
      LResult);
  finally
    LDailyRegistrations.Free;
  end;

  LCity := TCity.Create;
  try
    LCity.Name := 'Oslo';
    LCity.Population := 650000;
    LResult := dj.From(LCity, FParams).ToJson;
    Assert.AreEqual('{"Name":"Oslo","Population":650000}', LResult);
  finally
    LCity.Free;
  end;
end;

procedure TDemoTests.SerializeAttributes;
var
  house: THouse;
  house1: THouse1;
  house2: THouse2;
begin
  house := THouse.Create;
  try
    house.StreetAddress := '221B Baker Street';
    house.Bedrooms := 2;
    house.FloorArea := 100;
    house.BuildDate := StrToDate('1/1/1890', TFormatSettings.Create('en-GB'));
    Assert.AreEqual('{"StreetAddress":"221B Baker Street",' + //
      '"BuildDate":"1890-01-01T00:00:00.000Z","Bedrooms":2,"FloorArea":100}', dj.From(house, FParams).ToJson);
  finally
    house.Free;
  end;
  house1 := THouse1.Create;
  try
    house1.StreetAddress := '221B Baker Street';
    house1.Bedrooms := 2;
    house1.FloorArea := 100;
    house1.BuildDate := StrToDate('1/1/1890', TFormatSettings.Create('en-GB'));
    Assert.AreEqual('{"StreetAddress":"221B Baker Street"}', dj.From(house1, FParams).ToJson);
  finally
    house1.Free;
  end;
  house2 := THouse2.Create;
  try
    house2.StreetAddress := '221B Baker Street';
    house2.Bedrooms := 2;
    house2.FloorArea := 100;
    house2.BuildDate := StrToDate('1/1/1890', TFormatSettings.Create('en-GB'));
    Assert.AreEqual('{"address":"221B Baker Street","BuildDate":"1890-01-01T00:00:00.000Z","Bedrooms":2,"FloorArea":100}', dj.From(house2, FParams).ToJson);
  finally
    house2.Free;
  end;
end;

procedure TDemoTests.SerializeReferencesByValue;
var
  arnie: TEmployee;
  mike, susan: TManager;
  json, valid: string;
begin
  arnie := TEmployee.Create('Arnie Admin');
  mike := TManager.Create('Mike Manager');
  susan := TManager.Create('Susan Supervisor');
  try
    mike.Reportees.AddRange([arnie, susan]);
    susan.Reportees.AddRange([arnie]);
    json := dj.From(mike, FParams).ToJson;
    valid := //
      '{"Reportees":[{"Name":"Arnie Admin"},{"Reportees":[{"Name":"Arnie Admin"}],' + //
      '"Name":"Susan Supervisor"}],"Name":"Mike Manager"}';
    Assert.AreEqual(valid, json);
  finally
    mike.Free;
    susan.Free;
    arnie.Free;
  end;
end;

procedure TDemoTests.SerializeReferencesWithMetadata;
var
  arnie: TEmployee;
  mike, susan: TManager;
  json, valid: string;
begin
  arnie := TEmployee.Create('Arnie Admin');
  mike := TManager.Create('Mike Manager');
  susan := TManager.Create('Susan Supervisor');
  FParams.TypeAnnotations := True;
  try
    mike.Reportees.AddRange([arnie, susan]);
    susan.Reportees.AddRange([arnie]);
    FParams.SerializationMode := smDataContract;
    json := dj.From(mike, FParams).ToJson;
    valid := //
      '{"$dj_type":"DemoTests.TManager","Reportees":{"$dj_type":"System.Generics.Collections.TList<DemoTests.TEmployee>",' + //
      '"$dj_value":"DemoTests.TEmployee","items":[{"$dj_type":"DemoTests.TEmployee","Name":"Arnie Admin"},' + //
      '{"$dj_type":"DemoTests.TManager","Reportees":{"$dj_type":"System.Generics.Collections.TList<DemoTests.TEmployee>",' + //
      '"$dj_value":"DemoTests.TEmployee","items":[{"$dj_type":"DemoTests.TEmployee","Name":"Arnie Admin"}]},"Name":"Susan Supervisor"}]},"Name":"Mike Manager"}';
    Assert.AreEqual(valid, json);
  finally
    FParams.TypeAnnotations := False;
    mike.Free;
    susan.Free;
    arnie.Free;
  end;
end;

procedure TDemoTests.Setup;
begin
  FParams := dj.Default;
  FParams.Engine := eDelphiDOM;
  FParams.SerializationType := stFields;
end;

procedure TDemoTests.DeserializationBasics1;
var
  j: string;
  s: TSession;
begin
  j := '{' + //
    '"Name": "Serialize All The Things",' + //
    '"Date": "2017-07-03T00:00:00.000Z"' +   //
    '}';
  s := dj.FromJson(j, FParams).&to < TSession > ;
  Assert.AreEqual('Serialize All The Things', s.Name);
end;

procedure TDemoTests.DeserializationGeneric;
var
  j: string;
  LResult: TGeneric<THtmlColor>;
  LConfig: IdjParams;
begin
  LConfig := dj.DefaultByFields;
  LConfig.Engine := TdjEngine.eJDO;
  j := '{"id":555,"Item":{"Red":255,"Green":0,"Blue":0}}';
  LResult := dj.FromJson(j, LConfig).&to < TGeneric<THtmlColor> > ;
  Assert.AreEqual(j, dj.From(LResult, LConfig).ToJson);
end;

procedure TDemoTests.DeserializationNoClassGeneric;
var
  LTestJSON: string;
  LResultJSON: string;
  LResultObj: TNoClassGeneric<THtmlColor>;
  LConfig: IdjParams;
begin
  LConfig := dj.DefaultByFields;
  LConfig.Engine := TdjEngine.eJDO;
  LTestJSON := '{"id":555,"Item":{"Red":255,"Green":0,"Blue":0}}';
  LResultObj := dj.FromJson(LTestJSON, LConfig).&to < TNoClassGeneric<THtmlColor> > ;
  LResultJSON := dj.From(LResultObj, LConfig).ToJson;
  Assert.AreEqual(LTestJSON, LResultJSON);
end;

procedure TDemoTests.JsonConverter;
var
  LRed: THtmlColor;
  LJson: string;
begin
  LRed := THtmlColor.Create(255, 0, 0);
  try
    LJson := dj.From(LRed, FParams).ToJson;
    Assert.AreEqual('{"Red":255,"Green":0,"Blue":0}', LJson);
    FParams.EnableCustomSerializers := True;
    FParams.Serializers.Register<THtmlColor>(THtmlColorConverter);
    LJson := dj.From(LRed, FParams).ToJson;
    Assert.AreEqual('"#FF0000"', LJson);
  finally
    LRed.Free;
  end;
end;

{ THtmlColor }

constructor THtmlColor.Create(ARed, AGreen, ABlue: Integer);
begin
  FRed := ARed;
  FGreen := AGreen;
  FBlue := ABlue;
end;

{ THtmlColorConverter }

class function THtmlColorConverter.Deserialize(const AJSONValue: TJSONValue; const AExistingValue: TValue): TValue;
var
  hexString: string;
begin
  if not (AJSONValue is TJSONString) then
    raise Exception.Create('Wrong serialization.');
  // get hex string
  hexString := AJSONValue.Value;
  hexString := hexString.TrimLeft(['#']);
  Result := THtmlColor.Create(              // build html color from hex
    hexString.Substring(0, 2).ToInteger, //
    hexString.Substring(2, 2).ToInteger, //
    hexString.Substring(3, 2).ToInteger//
  );
end;

class function THtmlColorConverter.isTypeNotificationCompatible: Boolean;
begin
  inherited;
  Result := True;
end;

class function THtmlColorConverter.Serialize(const AValue: TValue): TJSONValue;
var
  LColor: THtmlColor;
  hexString: string;
begin
  inherited;
  LColor := AValue.AsType<THtmlColor>;
  hexString := Format('%x%.2x%.2x', [LColor.Red, LColor.Green, LColor.Blue]);
  Result := TJSONString.Create('#' + hexString);
end;

{ TEmployee }

constructor TEmployee.Create(AName: string);
begin
  Name := AName;
end;

{ TManager }
constructor TManager.Create(const AName: string);
begin
  inherited Create(AName);
  Reportees := TList<TEmployee>.Create;
end;

destructor TManager.Destroy;
begin
  Reportees.Free;
  inherited;
end;

{ TGeneric<T> }

constructor TGeneric<T>.Create;
begin
  Item := T.Create;
end;

initialization
  TDUnitX.RegisterTestFixture(TDemoTests);

end.

