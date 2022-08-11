unit Model.Customer;

interface

uses
  iORM, Model.Interfaces;

type

//  [ioEntity, diImplements(ICustomer), ioTrueClass]
//  [diImplements(ICustomer)]
//  [ioEntity, ioTrueClass]
//  [ioEntity]
  TCustomer = class(TInterfacedObject, ICustomer)
  strict private
    FID: Integer;
    FName: String;
    FCity: String;
    FAddress: String;
    FPhoneNumber: String;
    // ID property
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
    property ID: Integer read GetID;  // ReadOnly
    property Name: String read GetName write SetName;
    property City: String read GetCity write SetCity;
    property Address: String read GetAddress write SetAddress;
    property FullAddress: String read GetFullAddress;  // ReadOnly
    property PhoneNumber: String read GetPhoneNumber write SetPhoneNumber;
  end;

  [ioEntity('Customer'), diImplements(ICustomer, 'VIP'), diImplements(IVipCustomer), ioTrueClass]
  TVipCustomer = class(TCustomer, IVipCustomer)
   strict private
    FVipCardCode: String;
    // PhoneNumber property
    procedure SetVipCardCode(const AValue: String);
    function GetVipCardCode: String;
   public
    property VipCardCode: String read GetVipCardCode write SetVipCardCode;
  end;

  [ioEntity('Customer'), diImplements(ICustomer, 'EMPLOYEE'), diImplements(IEmployee), ioTrueClass]
  TEmployee = class(TCustomer, IEmployee)
   strict private
    FBranchOffice: String;
    // end property
    procedure SetBranchOffice(const AValue: String);
    function GetBranchOffice: String;
   public
    property BranchOffice: String read GetBranchOffice write SetBranchOffice;
  end;

  [ioEntity('Customer'), diImplements(ICustomer, 'ANOTHER'), ioTrueClass]
  TAnotherCustomer = class(TInterfacedObject, ICustomer)
  strict private
    FID: Integer;
    FName: String;
    FCity: String;
    FAddress: String;
    FPhoneNumber: String;
    // ID property
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
    property ID: Integer read GetID;  // ReadOnly
    property Name: String read GetName write SetName;
    property City: String read GetCity write SetCity;
    property Address: String read GetAddress write SetAddress;
    property FullAddress: String read GetFullAddress;  // ReadOnly
    property PhoneNumber: String read GetPhoneNumber write SetPhoneNumber;
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

procedure TCustomer.SetName(const AValue: String);
begin
  FName := AValue;
end;

procedure TCustomer.SetPhoneNumber(const AValue: String);
begin
  FPhoneNumber := AValue;
end;

{ TVipCustomer }

function TVipCustomer.GetVipCardCode: String;
begin
  Result := FVipCardCode;
end;

procedure TVipCustomer.SetVipCardCode(const AValue: String);
begin
  FVipCardCode := AValue;
end;

{ TAnotherCustomer }

function TAnotherCustomer.GetAddress: String;
begin
  Result := FAddress;
end;

function TAnotherCustomer.GetCity: String;
begin
  Result := FCity;
end;

function TAnotherCustomer.GetFullAddress: String;
begin
  Result := Format('%s, %s', [FCity, FAddress]);
end;

function TAnotherCustomer.GetID: Integer;
begin
  Result := FID;
end;

function TAnotherCustomer.GetName: String;
begin
  Result := FName;
end;

function TAnotherCustomer.GetPhoneNumber: String;
begin
  Result := FPhoneNumber;
end;

procedure TAnotherCustomer.SetAddress(const AValue: String);
begin
  FAddress := AValue;
end;

procedure TAnotherCustomer.SetCity(const AValue: String);
begin
  FCity := AValue;
end;

procedure TAnotherCustomer.SetName(const AValue: String);
begin
  FName := AValue;
end;

procedure TAnotherCustomer.SetPhoneNumber(const AValue: String);
begin
  FPhoneNumber := AValue;
end;

{ TEmployee }

function TEmployee.GetBranchOffice: String;
begin
  Result := FBranchOffice;
end;

procedure TEmployee.SetBranchOffice(const AValue: String);
begin
  FBranchOffice := AValue;
end;

end.
