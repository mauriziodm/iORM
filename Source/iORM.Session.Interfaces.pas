unit iORM.Session.Interfaces;

interface

type

  IioSession = interface
    ['{911DFCEF-CEB1-4989-869E-C81D38A30CAB}']
    // Methods
    function HasRole(const ARole: String): Boolean;
    // ConnectionName
    procedure SetConnectionName(const Value: String);
    function GetConnectionName: String;
    property ConnectionName: String read GetConnectionName write SetConnectionName;
    // UserID
    procedure SetUserID(const Value: Integer);
    function GetUserID: Integer;
    property UserID: Integer read GetUserID write SetUserID;
    // UserName
    procedure SetUserName(const Value: String);
    function GetUserName: String;
    property UserName: String read GetUserName write SetUserName;
    // UserRoles
    procedure SetUserRoles(const Value: String);
    function GetUserRoles: String;
    property UserRoles: String read GetUserRoles write SetUserRoles;
    // UserToken
    procedure SetUserToken(const Value: String);
    function GetUserToken: String;
    property UserToken: String read GetUserToken write SetUserToken;
  end;

implementation

end.
