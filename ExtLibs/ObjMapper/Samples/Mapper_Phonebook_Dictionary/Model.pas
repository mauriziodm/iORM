unit Model;

interface

uses
  System.Generics.Collections, ObjMapperAttributes, Interfaces, Serializers;

type

  // Custom serializer for this class
  [MapperCustomSerializer(TPhoneNumberCustomSerializer)]  // Or register the custom serializer in a IomParams object or direct in the command
  TPhoneNumber = class(TInterfacedObject, IPhoneNumber)
  private
    FID: Integer;
    FMasterID: Integer;
    FNumber: String;
  protected
    // ID
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    // Numero
    procedure SetNumber(const Value: String);
    function GetNumber: String;
    // MasterID
    procedure SetMasterID(const Value: Integer);
    function GetMasterID: Integer;
  public
    constructor Create(AID:Integer; ANumber:String; AMasterID:Integer);
    property ID: Integer read GetID write SetID;
    property Number:String read GetNumber write SetNumber;
    property MasterID:Integer read GetMasterID write SetMasterID;
  end;

  TPerson = class(TInterfacedObject, IPerson)
  private
    FID: Integer;
    FName: string;
    [MapperItemsType(TypeInfo(String), TypeInfo(TPhoneNumber))]  // Not needed if "TypeAnnnotations" = True or "ItemsType" is specified
    FPhones: TDictionary<String,IPhoneNumber>;
  protected
    // ID
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    // Name
    procedure SetName(const Value: String);
    function GetName: String;
    // Phone numbers
    function GetPhones: TDictionary<String,IPhoneNumber>;
  public
    constructor Create;
    destructor Destroy; override;
    property ID:Integer read GetID write SetID;
    property Name:String read GetName write SetName;
    [MapperItemsType(TypeInfo(String), TypeInfo(TPhoneNumber))]  // Not needed if "TypeAnnnotations" = True or "ItemsType" is specified
    property Phones:TDictionary<String,IPhoneNumber> read GetPhones;
  end;

implementation


{ TPhoneNumber }

constructor TPhoneNumber.Create(AID: Integer; ANumber: String;
  AMasterID: Integer);
begin
  inherited Create;
  FID := AID;
  FNumber := ANumber;
  FMasterID := AMasterID;
end;

function TPhoneNumber.GetID: Integer;
begin
  Result := FID;
end;

function TPhoneNumber.GetMasterID: Integer;
begin
  Result := FMasterID;
end;

function TPhoneNumber.GetNumber: String;
begin
  Result := FNumber;
end;

procedure TPhoneNumber.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPhoneNumber.SetMasterID(const Value: Integer);
begin
  FMasterID := Value;
end;

procedure TPhoneNumber.SetNumber(const Value: String);
begin
  FNumber := Value;
end;

{ TPerson }

constructor TPerson.Create;
begin
  inherited;
  FPhones := TDictionary<String,IPhoneNumber>.Create;
end;

destructor TPerson.Destroy;
begin
  FPhones.Free;
  inherited;
end;

function TPerson.GetID: Integer;
begin
  Result := FID;
end;

function TPerson.GetName: String;
begin
  Result := FName;
end;

function TPerson.GetPhones: TDictionary<String, IPhoneNumber>;
begin
  Result := FPhones;
end;

procedure TPerson.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPerson.SetName(const Value: String);
begin
  FName := Value;
end;

end.
