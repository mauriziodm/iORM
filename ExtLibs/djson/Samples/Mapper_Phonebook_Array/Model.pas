unit Model;

interface

uses
  System.Generics.Collections, DJSON.Attributes, System.JSON, Serializers;

type

  [djSerializerDOM(TPhoneNumberCustomSerializerDOM)]  // Or register the custom serializer in a IomParams object or direct in the command
  [djSerializerJDO(TPhoneNumberCustomSerializerJDO)]  // Or register the custom serializer in a IomParams object or direct in the command
  [djSerializerStream(TPhoneNumberCustomSerializerStream)]  // Or register the custom serializer in a IomParams object or direct in the command
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
    property ID: Integer read GetID write SetID;
    property Numero:String read GetNumero write SetNumero;
    property MasterID:Integer read GetMasterID write SetMasterID;
  end;

  TPerson = class
  private
    FID: Integer;
    FDescrizione: String;
    FNumTel: TArray<TNumtel>;
    function GetDescrizione: String;
    function GetID: Integer;
    procedure SetDescrizione(const Value: String);
    procedure SetID(const Value: Integer);
    function GetCount: Integer;
  public
    constructor Create(AID:Integer; ADescrizione:String); overload;
    destructor Destroy; override;
    procedure AddNumTel(ANumTel: TNumTel);
    property ID:Integer read GetID write SetID;
    property Descrizione:String read GetDescrizione write SetDescrizione;
    property NumTel: TArray<TNumTel> read FNumTel write FNumTel;
    property Count:Integer read GetCount;
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TMyClass }

procedure TPerson.AddNumTel(ANumTel: TNumTel);
begin
  SetLength(FNumTel, Length(FNumTel)+1);
  FNumTel[Length(FNumTel)-1] := ANumTel;
end;

constructor TPerson.Create(AID:Integer; ADescrizione:String);
begin
  Self.Create;
  FID := AID;
  FDescrizione := ADescrizione;
end;

destructor TPerson.Destroy;
var
  I: Integer;
begin
  for I := 0 to Self.Count-1 do
    FNumTel[I].Free;
  inherited;
end;

function TPerson.GetCount: Integer;
begin
  Result := Length(FNumTel);
end;

function TPerson.GetDescrizione: String;
begin
  Result := FDescrizione;
end;

function TPerson.GetID: Integer;
begin
  Result := FID;
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

end.
