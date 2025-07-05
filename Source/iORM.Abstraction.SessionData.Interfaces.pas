unit iORM.Abstraction.SessionData.Interfaces;

interface

type

  IioSessionData = interface
    ['{DE6E7EDA-BEE0-4F8A-A12F-2A99E63D8EC5}']
    procedure Clear;
    function Clone: IioSessionData;
    function GetAccessToken: String;
    function GetAccessTokenExp: TDateTime;
    function GetAccessTokenIsExpired: Boolean;
    function GetAccessTokenRefreshAfter: TDateTime;
    function GetApp: String;
    function GetAppOID: Integer;
    function GetConnection: String;
    function GetConnectionRemote: String;
    function GetHasAccessToken: Boolean;
    function GetHasApp: Boolean;
    function GetHasAppOID: Boolean;
    function GetHasConnection: Boolean;
    function GetHasConnectionRemote: Boolean;
    function GetHasIDToken: Boolean;
    function GetHasLicense: Boolean;
    function GetHasLicenseOID: Boolean;
    function GetHasRefreshToken: Boolean;
    function GetHasUser: Boolean;
    function GetHasUserOID: Boolean;
    function GetIDToken: String;
    function GetIDTokenExp: TDateTime;
    function GetIDTokenIsExpired: Boolean;
    function GetLicense: String;
    function GetLicenseOID: Integer;
    function GetNeedRefresh: Boolean;
    function GetRefreshToken: String;
    function GetRefreshTokenExp: TDateTime;
    function GetRefreshTokenIsExpired: Boolean;
    function GetUser: String;
    function GetUserOID: Integer;
    procedure SetApp(const Value: String);
    procedure SetAppOID(const Value: Integer);
    procedure SetAccessToken(const Value: String);
    procedure SetAccessTokenExp(const Value: TDateTime);
    procedure SetAccessTokenRefreshAfter(const Value: TDateTime);
    procedure SetConnection(const Value: String);
    procedure SetConnectionRemote(const Value: String);
    procedure SetIDToken(const Value: String);
    procedure SetIDTokenExp(const Value: TDateTime);
    procedure SetLicense(const Value: String);
    procedure SetLicenseOID(const Value: Integer);
    procedure SetRefreshToken(const Value: String);
    procedure SetRefreshTokenExp(const Value: TDateTime);
    procedure SetUser(const Value: String);
    procedure SetUserOID(const Value: Integer);
    // ----- properties -----
    // app
    property App: String read GetApp write SetApp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property HasApp: Boolean read GetHasApp;
    property HasAppOID: Boolean read GetHasAppOID;
    // user
    property User: String read GetUser write SetUser;
    property UserOID: Integer read GetUserOID write SetUserOID;
    property HasUser: Boolean read GetHasUser;
    property HasUserOID: Boolean read GetHasUserOID;
    // license
    property License: String read GetLicense write SetLicense;
    property LicenseOID: Integer read GetLicenseOID write SetLicenseOID;
    property HasLicense: Boolean read GetHasLicense;
    property HasLicenseOID: Boolean read GetHasLicenseOID;
    // connection
    property Connection: String read GetConnection write SetConnection;
    property ConnectionRemote: String read GetConnectionRemote write SetConnectionRemote;
    property HasConnection: Boolean read GetHasConnection;
    property HasConnectionRemote: Boolean read GetHasConnectionRemote;
    // id token
    property IDToken: String read GetIDToken write SetIDToken;
    property IDTokenExp: TDateTime read GetIDTokenExp write SetIDTokenExp;
    property IDTokenIsExpired: Boolean read GetIDTokenIsExpired;
    property HasIDToken: Boolean read GetHasIDToken;
    // refresh token
    property RefreshToken: String read GetRefreshToken write SetRefreshToken;
    property RefreshTokenExp: TDateTime read GetRefreshTokenExp write SetRefreshTokenExp;
    property RefreshTokenIsExpired: Boolean read GetRefreshTokenIsExpired;
    property HasRefreshToken: Boolean read GetHasRefreshToken;
    // access token
    property AccessToken: String read GetAccessToken write SetAccessToken;
    property AccessTokenExp: TDateTime read GetAccessTokenExp write SetAccessTokenExp;
    property AccessTokenIsExpired: Boolean read GetAccessTokenIsExpired;
    property AccessTokenRefreshAfter: TDateTime read GetAccessTokenRefreshAfter write SetAccessTokenRefreshAfter;
    property HasAccessToken: Boolean read GetHasAccessToken;
    property NeedRefresh: Boolean read GetNeedRefresh;
  end;


implementation

end.
