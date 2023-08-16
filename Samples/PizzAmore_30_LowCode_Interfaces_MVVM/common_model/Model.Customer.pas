unit Model.Customer;

interface

uses
  iORM, iORM.Attributes, Model.Interfaces;

type

  [ioEntity('CUSTOMERS'), diImplements(ICustomer)]
  TCustomer = class(TInterfacedObject, ICustomer)
  private
    FID: Integer;
    [ioWhereAttribute(coLike)]
    FName: String;
    FCity: String;
    FAddress: String;
    FPhoneNumber: String;
    // ID property
    procedure SetID(const AValue: Integer);
    function GetID: Integer;
    // Name property
    procedure SetName(const AValue: String);
    function GetName: String;
    // City property
    procedure SetCity(const AValue: String);
    function GetCity: String;
    // Address property
    procedure SetAddress(const AValue: String);
    function GetAddress: String;
    // FullAddress property
    function GetFullAddress: String;
    // PhoneNumber property
    procedure SetPhoneNumber(const AValue: String);
    function GetPhoneNumber: String;
  public
    constructor Create;
    property ID: Integer read GetID write SetID;  // ReadOnly
    property Name: String read GetName write SetName;
    property City: String read GetCity write SetCity;
    property Address: String read GetAddress write SetAddress;
    property PhoneNumber: String read GetPhoneNumber write SetPhoneNumber;
    [ioWhereSkip]
    property FullAddress: String read GetFullAddress;  // ReadOnly
  end;

implementation

uses
  System.SysUtils;

{ TCustomer }

constructor TCustomer.Create;
begin
//  Sleep(5);
end;

function TCustomer.GetAddress: String;
begin
  Result := FAddress;
end;

function TCustomer.GetCity: String;
begin
  Result := FCity;
end;

function TCustomer.GetFullAddress: String;
begin
  Result := Format('%s, %s', [FCity, FAddress]);
end;

function TCustomer.GetID: Integer;
begin
  Result := FID;
end;

function TCustomer.GetName: String;
begin
  Result := FName;
end;

function TCustomer.GetPhoneNumber: String;
begin
  Result := FPhoneNumber;
end;

procedure TCustomer.SetAddress(const AValue: String);
begin
  FAddress := AValue;
end;

procedure TCustomer.SetCity(const AValue: String);
begin
  FCity := AValue;
end;

procedure TCustomer.SetID(const AValue: Integer);
begin
  FID := AValue;
end;

procedure TCustomer.SetName(const AValue: String);
begin
  FName := AValue;
end;

procedure TCustomer.SetPhoneNumber(const AValue: String);
begin
  FPhoneNumber := AValue;
end;

end.
