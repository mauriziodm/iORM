unit Model.Customer;

interface

uses
  iORM, iORM.Attributes, Model.Interfaces;

type

//  [ioAbstractEntity, diDoNotRegisterAsInterfacedEntity, ioDisableAutoCreateOnDB]
  [ioAbstractEntity('CONTACTS'), diImplements(IContact)]
  TContact = class(TInterfacedObject, IContact)
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

  [ioEntity('CONTACTS'), diImplements(ICustomer)]
  TCustomer = class(TContact, ICustomer)
   strict private
    FFidelityCardCode: String;
    // FidelityCardCode property
    procedure SetFidelityCardCode(const AValue: String);
    function GetFidelityCardCode: String;
   public
    property FidelityCardCode: String read GetFidelityCardCode write SetFidelityCardCode;
  end;

  [ioEntity('CONTACTS')]
  TVipCustomer = class(TCustomer, IVipCustomer)
   strict private
    FVipCardCode: String;
    // VipCardCode property
    procedure SetVipCardCode(const AValue: String);
    function GetVipCardCode: String;
   public
    property VipCardCode: String read GetVipCardCode write SetVipCardCode;
  end;

  [ioEntity('EMP')]
  TEmployee = class(TContact, IEmployee)
   strict private
    FBranchOffice: String;
    // end property
    procedure SetBranchOffice(const AValue: String);
    function GetBranchOffice: String;
   public
    property BranchOffice: String read GetBranchOffice write SetBranchOffice;
  end;

  [ioEntity('ANOTHERCONTACTS'), diImplements(IContact, 'ANOTHER')]
  TAnotherCustomer = class(TInterfacedObject, IContact)
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

{ TBaseContact }

function TContact.GetAddress: String;
begin
  Result := FAddress;
end;

function TContact.GetCity: String;
begin
  Result := FCity;
end;

function TContact.GetFullAddress: String;
begin
  Result := Format('%s, %s', [FCity, FAddress]);
end;

function TContact.GetID: Integer;
begin
  Result := FID;
end;

function TContact.GetName: String;
begin
  Result := FName;
end;

function TContact.GetPhoneNumber: String;
begin
  Result := FPhoneNumber;
end;

procedure TContact.SetAddress(const AValue: String);
begin
  FAddress := AValue;
end;

procedure TContact.SetCity(const AValue: String);
begin
  FCity := AValue;
end;

procedure TContact.SetName(const AValue: String);
begin
  FName := AValue;
end;

procedure TContact.SetPhoneNumber(const AValue: String);
begin
  FPhoneNumber := AValue;
end;

{ TCustomer }

function TCustomer.GetFidelityCardCode: String;
begin
  Result := FFidelityCardCode;
end;

procedure TCustomer.SetFidelityCardCode(const AValue: String);
begin
  FFidelityCardCode := AValue;
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

{ TEmployee }

function TEmployee.GetBranchOffice: String;
begin
  Result := FBranchOffice;
end;

procedure TEmployee.SetBranchOffice(const AValue: String);
begin
  FBranchOffice := AValue;
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

end.
