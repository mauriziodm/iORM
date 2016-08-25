unit Model;

interface

uses
  System.Generics.Collections, ObjMapper.Attributes, System.JSON;

type

  TNumTel = class
  private
    FID: Integer;
    FMasterID: Integer;
    FNumero: String;
    function GetID: Integer;
    function GetMasterID: Integer;
    function GetNumero: String;
    procedure SetID(const Value: Integer);
    procedure SetMasterID(const Value: Integer);
    procedure SetNumero(const Value: String);
  public
    constructor Create(AID:Integer; ANumero:String; AMasterID:Integer); overload;
    function ToJSON: TJSONValue;  // Custom serializer declared as method of the class itself
    procedure FromJSON(const AJSONValue:TJSONValue);  // Custom deserializer declared as method of the class itself
    property ID: Integer read GetID write SetID;
    property Numero:String read GetNumero write SetNumero;
    property MasterID:Integer read GetMasterID write SetMasterID;
  end;

  TPerson = class
  private
    FID: Integer;
    FDescrizione: String;
    [MapperItemsType(TNumTel)]  // Not needed if "TypeAnnnotations" = True or "ItemsType" is specified
    FNumTel: TObjectList<TNumTel>;
    function GetDescrizione: String;
    function GetID: Integer;
    function GetNumTel: TObjectList<TNumTel>;
    procedure SetDescrizione(const Value: String);
    procedure SetID(const Value: Integer);
  public
    constructor Create; overload;
    constructor Create(AID:Integer; ADescrizione:String); overload;
    destructor Destroy; override;
    property ID:Integer read GetID write SetID;
    property Descrizione:String read GetDescrizione write SetDescrizione;
    [MapperItemsType(TNumTel)]  // Not needed if "TypeAnnnotations" = True or "ItemsType" is specified
    property NumTel:TObjectList<TNumTel> read GetNumTel;
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TMyClass }

constructor TPerson.Create(AID:Integer; ADescrizione:String);
begin
  Self.Create;
  FID := AID;
  FDescrizione := ADescrizione;
end;

constructor TPerson.Create;
begin
  inherited;
  FNumTel := TObjectList<TNumTel>.Create;
end;

destructor TPerson.Destroy;
begin
  FNumTel.Free;
  inherited;
end;

function TPerson.GetDescrizione: String;
begin
  Result := FDescrizione;
end;

function TPerson.GetID: Integer;
begin
  Result := FID;
end;

function TPerson.GetNumTel: TObjectList<TNumTel>;
begin
  Result := FNumTel;
end;

procedure TPerson.SetDescrizione(const Value: String);
begin
  FDescrizione := Value;
end;

procedure TPerson.SetID(const Value: Integer);
begin
  FID := Value;
end;

{ TNumTel }

constructor TNumTel.Create(AID: Integer; ANumero: String; AMasterID: Integer);
begin
  inherited Create;
  FID := AID;
  FNumero := ANumero;
  FMasterID := AMasterID;
end;

procedure TNumTel.FromJSON(const AJSONValue: TJSONValue);
var
  LStringList: TStrings;
begin
  LStringList := TStringList.Create;
  try
    LStringList.CommaText := AJSONValue.Value;
    FID := LStringList[0].ToInteger;
    FMasterID := LStringList[1].ToInteger;
    FNumero := LStringList[2];
  finally
    LStringList.Free;
  end;
end;

function TNumTel.GetID: Integer;
begin
  Result := FID;
end;

function TNumTel.GetMasterID: Integer;
begin
  Result := FMasterID;
end;

function TNumTel.GetNumero: String;
begin
  Result := FNumero;
end;

procedure TNumTel.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TNumTel.SetMasterID(const Value: Integer);
begin
  FMasterID := Value;
end;

procedure TNumTel.SetNumero(const Value: String);
begin
  FNumero := Value;
end;

function TNumTel.ToJSON: TJSONValue;
var
  LStringList: TStrings;
begin
  LStringList := TStringList.Create;
  try
    LStringList.Add(FID.ToString);
    LStringList.Add(FMasterID.ToString);
    LStringList.Add(FNumero);
    Result := TJSONString.Create(LStringList.CommaText);
  finally
    LStringList.Free;
  end;
end;

end.
