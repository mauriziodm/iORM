unit Model.Customer;

interface

uses
  iORM;

type

//  [ioConnectionDefName('SQLiteConn')]
  [ioEntity('CUSTOMERS', TioMapModeType.mmProperties), ioKeyGenerator('CUSTOMERS_GENERATOR')]
  [ioIndex('Name, City', ioDescending)]
  TCustomer = class
  private
    FID: Integer;
    FName: String;
    FCity: String;
    FAddress: String;
    FPhoneNumber: String;
    function GetFullAddress: String;
  public
    constructor Create;
    [ioInteger]
    property ID: Integer read FID write FID;
    [ioVarchar(60), ioNotNull, ioIndex]
    property Name: String read FName write FName;
    [ioVarChar(60)]
    property City: String read FCity write FCity;
    [ioVarChar(80)]
    property Address: String read FAddress write FAddress;
    [ioSkip]
    property FullAddress: String read GetFullAddress;  // ReadOnly - Not mapped
    [ioVarChar(30)]
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;
  end;

implementation

uses
  System.SysUtils;

{ TCustomer }

constructor TCustomer.Create;
begin
//  Sleep(5);
end;

function TCustomer.GetFullAddress: String;
begin
  Result := Format('%s, %s', [FCity, FAddress]);
end;

end.
