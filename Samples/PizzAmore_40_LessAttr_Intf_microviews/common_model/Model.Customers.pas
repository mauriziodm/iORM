unit Model.Customers;

interface

uses
  iORM, iORM.Attributes, Model.Interfaces, Model.BaseBO;

type

  [ioEntity('CUSTOMERS')]
  TGenericCustomer = class(TBaseBO, IGenericCustomer)
  private
    FAddress: String;
    FCity: String;
    FPhoneNumber: String;
    procedure SetPhoneNumber(const Value: String);
    function GetPhoneNumber: String;
  protected
    function GetFullName: String; virtual; abstract;
    function GetFullAddress: String;
  public
    constructor Create(const AAddress, ACity, APhoneNumber: String); virtual;
    property Address: String read FAddress write FAddress;
    property City: String read FCity write FCity;
    // IGenericCustomer
    property PhoneNumber: String read GetPhoneNumber write SetPhoneNumber;
    property FullName: String read GetFullName;
    property FUllAddress: String read GetFullAddress;
  end;

  [ioEntity('CUSTOMERS')]
  TPrivateCustomer = class(TGenericCustomer)
  private
    FFirstName: String;
    FLastName: String;
  protected
    function GetFullName: String; override;
  public
    constructor Create(const AFirstName, ALastName, AAddress, ACity, APhoneNumber: String); reintroduce; overload;
    property FirstName: String read FFirstName write FFirstName;
    property LastName: String read FLastName write FLastName;
  end;

  [ioEntity('CUSTOMERS')]
  TBusinessCustomer = class(TGenericCustomer)
  private
    FBusinessName: String;
    FVAT: String;
  protected
    function GetFullName: String; override;
  public
    constructor Create(const ABusinessName, AVAT, AAddress, ACity, APhoneNumber: String); reintroduce; overload;
    property BusinessName: String read FBusinessName write FBusinessName;
    property VAT: String read FVAT write FVAT;
  end;


implementation

uses
  System.SysUtils;

{ TGenericCustomer }

constructor TGenericCustomer.Create(const AAddress, ACity, APhoneNumber: String);
begin
  FAddress := AAddress;
  FCity := ACity;
  FPhoneNumber := APhoneNumber;
end;

function TGenericCustomer.GetFullAddress: String;
begin
  Result := Format('%s - %s', [FAddress, FCity]).Trim;
end;

function TGenericCustomer.GetPhoneNumber: String;
begin
  Result := FPhoneNumber;
end;

procedure TGenericCustomer.SetPhoneNumber(const Value: String);
begin
  FPhoneNumber := Value;
end;

{ TPrivateCustomer }

constructor TPrivateCustomer.Create(const AFirstName, ALastName, AAddress, ACity, APhoneNumber: String);
begin
  inherited Create(AAddress, ACity, APhoneNumber);
  FFirstName := AFirstName;
  FLastName := ALastName;
end;

function TPrivateCustomer.GetFullName: String;
begin
  Result := Format('%s %s (%s)', [FFirstName, FLastName, ID]).Trim;
end;

{ TBusinessCustomer }

constructor TBusinessCustomer.Create(const ABusinessName, AVAT, AAddress, ACity, APhoneNumber: String);
begin
  inherited Create(AAddress, ACity, APhoneNumber);
  FBusinessName := ABusinessName;
  FVAT := AVAT;
end;

function TBusinessCustomer.GetFullName: String;
begin
  Result := Format('%s (%s)', [FBusinessName, ID]).Trim;
end;

end.
