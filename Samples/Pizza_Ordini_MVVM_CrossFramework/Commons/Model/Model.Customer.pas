unit Model.Customer;

interface

uses
  iORM.Attributes;

type

  [ioEntity]
  TCustomer = class
  private
    FID: Integer;
    FLastName: String;
    FFirstName: String;
    FPhone: String;
    FCity: String;
    FAddress: String;
    function GetFullName: String;
  public
    property ID:Integer read FID write FID;
    property FirstName:String read FFirstName write FFirstName;
    property LastName:String read FLastName write FLastName;
    property Address:String read FAddress write FAddress;
    property City:String read FCity write FCity;
    property Phone:String read FPhone write FPhone;
    [ioSkip]
    property FullName:String read GetFullName;
  end;

implementation

uses
  System.SysUtils;

{ TCliente }

function TCustomer.GetFullName: String;
begin
  Result := Format('%s %s', [FFirstName, FLastName]);
end;

end.
