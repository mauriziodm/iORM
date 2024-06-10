unit Model.Customer;

interface

uses
  iORM, ETM.Repository;

type

  // Register the form into the dependency injection container as SimpleView for TCustomer objects
  [ioEntity('CUSTOMERS'), etmTrace(TEtmRepository), ioConflictStrategy(TioSameVersionWin, csRejectedRaise)]
  TCustomer = class
  private
    FID: Integer;
    [ioWhere(coLike)]
    FName: String;
    [ioWhere(coLike), etmProperty]
    FCity: String;
    FAddress: String;
    FPhoneNumber: String;
    FObjVersion: TioObjVersion; // The ObjVersion is mandatory if you want to use the ETM
    function GetFullAddress: String;
  public
    constructor CreateWithData(const AName, ACity, AAddress, APhoneNumber: String);
    property ID: Integer read FID write FID;
    property Name: String read FName write FName;
    property City: String read FCity write FCity;
    property Address: String read FAddress write FAddress;
    property PhoneNumber: String read FPhoneNumber write FPhoneNumber;
    [ioWhereSkip]
    property FullAddress: String read GetFullAddress;  // ReadOnly - Not mapped
  end;

implementation

uses
  System.SysUtils;

{ TCustomer }

constructor TCustomer.CreateWithData(const AName, ACity, AAddress, APhoneNumber: String);
begin
  FName := AName;
  FCity := ACity;
  FAddress := AAddress;
  FPhoneNumber := APhoneNumber;
end;

function TCustomer.GetFullAddress: String;
begin
  Result := Format('%s, %s', [FCity, FAddress]);
end;

end.
