unit Model.Customer;

interface

uses
  iORM;

type

//  [ioEntity('CUSTOMERS')]
  [ioNotPersistedEntity]
  TCustomer = class
  private
    FID: Integer;
    FName: String;
    FCity: String;
    FAddress: String;
    FPhoneNumber: String;
    function GetFullAddress: String;
  public
    property ID: Integer read FID;  // ReadOnly
    property Name: String read FName write FName;
    property City: String read FCity write FCity;
    property Address: String read FAddress write FAddress;
    property FullAddress: String read GetFullAddress;  // ReadOnly - Not mapped
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;
  end;

implementation

uses
  System.SysUtils;

{ TCustomer }

function TCustomer.GetFullAddress: String;
begin
  Result := Format('%s, %s', [FCity, FAddress]);
end;

end.
