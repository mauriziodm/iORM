unit iORM.Auth.Response;

interface

uses
  iORM.Auth.Interfaces;

type

  TioAuthResponse = class(TInterfacedObject, IioAuthResponse)
  private
    FIsAuth: Boolean;
    // user
    FUsrTkn: String;
    FUsrExp: TDateTime;
    FUsr: String;
    FUsrOID: Integer;
    // app
    FAppTkn: String;
    FAppExp: TDateTime;
    FApp: String;
    FAppOID: Integer;
    // refresh
    FRefTkn: String;
    FRefExp: TDateTime;
    // access
    FAccTkn: String;
    FAccExp: TDateTime;
    FRefAft: TDateTime;
    function GetAccTkn: String;
    function GetAccExp: TDateTime;
    function GetAppTkn: String;
    function GetAppExp: TDateTime;
    function GetAppOID: Integer;
    function GetApp: String;
    function GetIsAuth: Boolean;
    function GetRefAft: TDateTime;
    function GetRefTkn: String;
    function GetRefExp: TDateTime;
    function GetUsrTkn: String;
    function GetUsrOID: Integer;
    function GetUsr: String;
    function GetUsrExp: TDateTime;
    procedure SetAccTkn(const Value: String);
    procedure SetAccExp(const Value: TDateTime);
    procedure SetAppTkn(const Value: String);
    procedure SetAppExp(const Value: TDateTime);
    procedure SetAppOID(const Value: Integer);
    procedure SetApp(const Value: String);
    procedure SetIsAuth(const Value: Boolean);
    procedure SetRefAft(const Value: TDateTime);
    procedure SetRefTkn(const Value: String);
    procedure SetRefExp(const Value: TDateTime);
    procedure SetUsrTkn(const Value: String);
    procedure SetUsrExp(const Value: TDateTime);
    procedure SetUsrOID(const Value: Integer);
    procedure SetUsr(const Value: String);
  public
    constructor Create;
    constructor CreateByString(const AValue: String);
    function HasUsrTkn: Boolean;
    function HasAppTkn: Boolean;
    function HasRefTkn: Boolean;
    function HasAccTkn: Boolean;
    function AsString: String;
    // properties
    property IsAuth: Boolean read GetIsAuth write SetIsAuth;
    // user
    property UsrTkn: String read GetUsrTkn write SetUsrTkn;
    property UsrExp: TDateTime read GetUsrExp write SetUsrExp;
    property UsrOID: Integer read GetUsrOID write SetUsrOID;
    property Usr: String read GetUsr write SetUsr;
    // app
    property AppTkn: String read GetAppTkn write SetAppTkn;
    property AppExp: TDateTime read GetAppExp write SetAppExp;
    property AppOID: Integer read GetAppOID write SetAppOID;
    property App: String read GetApp write SetApp;
    // refresh
    property RefTkn: String read GetRefTkn write SetRefTkn;
    property RefExp: TDateTime read GetRefExp write SetRefExp;
    // access
    property AccTkn: String read GetAccTkn write SetAccTkn;
    property AccExp: TDateTime read GetAccExp write SetAccExp;
    property RefAft: TDateTime read GetRefAft write SetRefAft;
  end;

implementation

uses
  iORM.CommonTypes, DJSON, DJSON.Params;

{ TioAuthResponse }

constructor TioAuthResponse.Create;
begin
    FIsAuth := False;
    // user
    FUsrTkn := IO_STRING_NULL_VALUE;
    FUsrExp := IO_DATETIME_NULL_VALUE;
    FUsr := IO_STRING_NULL_VALUE;
    FUsrOID := IO_INTEGER_NULL_VALUE;
    // app
    FAppTkn := IO_STRING_NULL_VALUE;
    FAppExp := IO_DATETIME_NULL_VALUE;
    FAppOID := IO_INTEGER_NULL_VALUE;
    FApp := IO_STRING_NULL_VALUE;
    // refresh
    FRefTkn := IO_STRING_NULL_VALUE;
    FRefExp := IO_DATETIME_NULL_VALUE;
    // access
    FAccTkn := IO_STRING_NULL_VALUE;
    FAccExp := IO_DATETIME_NULL_VALUE;
    FRefAft := IO_DATETIME_NULL_VALUE;
end;

constructor TioAuthResponse.CreateByString(const AValue: String);
begin
  Create;
  dj.FromJson(AValue).byFields.DateTimeFormat(TdjDateTimeFormat.dfUnix).&To(Self);
end;

function TioAuthResponse.GetAccExp: TDateTime;
begin
  Result := FAccExp;
end;

function TioAuthResponse.GetAccTkn: String;
begin
  Result := FAccTkn;
end;

function TioAuthResponse.GetApp: String;
begin
  Result := FApp;
end;

function TioAuthResponse.GetAppExp: TDateTime;
begin
  Result := FAppExp;
end;

function TioAuthResponse.GetAppTkn: String;
begin
  Result := FAppTkn;
end;

function TioAuthResponse.GetUsrExp: TDateTime;
begin
  Result := FUsrExp;
end;

function TioAuthResponse.GetAppOID: Integer;
begin
  Result := FAppOID;
end;

function TioAuthResponse.GetIsAuth: Boolean;
begin
  Result := FIsAuth;
end;

function TioAuthResponse.GetRefAft: TDateTime;
begin
  Result := FRefAft;
end;

function TioAuthResponse.GetRefExp: TDateTime;
begin
  Result := FRefExp;
end;

function TioAuthResponse.GetRefTkn: String;
begin
  Result := FRefTkn;
end;

function TioAuthResponse.GetUsr: String;
begin
  Result := FUsr;
end;

function TioAuthResponse.GetUsrTkn: String;
begin
  Result := FUsrTkn;
end;

function TioAuthResponse.GetUsrOID: Integer;
begin
  Result := FUsrOID;
end;

function TioAuthResponse.HasAccTkn: Boolean;
begin
  Result := FAccTkn = IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasAppTkn: Boolean;
begin
  Result := FAppTkn = IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasRefTkn: Boolean;
begin
  Result := FRefTkn = IO_STRING_NULL_VALUE;
end;

function TioAuthResponse.HasUsrTkn: Boolean;
begin
  Result := FUsrTkn = IO_STRING_NULL_VALUE;
end;

procedure TioAuthResponse.SetAccExp(const Value: TDateTime);
begin
  FAccExp := Value;
end;

procedure TioAuthResponse.SetAccTkn(const Value: String);
begin
  FAccTkn := Value;
end;

procedure TioAuthResponse.SetApp(const Value: String);
begin
  FApp := Value;
end;

procedure TioAuthResponse.SetAppExp(const Value: TDateTime);
begin
  FAppExp := Value;
end;

procedure TioAuthResponse.SetAppTkn(const Value: String);
begin
  FAppTkn := Value;
end;

procedure TioAuthResponse.SetAppOID(const Value: Integer);
begin
  FAppOID := Value;
end;

procedure TioAuthResponse.SetIsAuth(const Value: Boolean);
begin
  FIsAuth := Value;
end;

procedure TioAuthResponse.SetRefAft(const Value: TDateTime);
begin
  FRefAft := Value;
end;

procedure TioAuthResponse.SetRefExp(const Value: TDateTime);
begin
  FRefExp := Value;
end;

procedure TioAuthResponse.SetRefTkn(const Value: String);
begin
  FRefTkn := Value;
end;

procedure TioAuthResponse.SetUsr(const Value: String);
begin
  FUsr := Value;
end;

procedure TioAuthResponse.SetUsrTkn(const Value: String);
begin
  FUsrTkn := Value;
end;

procedure TioAuthResponse.SetUsrExp(const Value: TDateTime);
begin
  FUsrExp := Value;
end;

procedure TioAuthResponse.SetUsrOID(const Value: Integer);
begin
  FUsrOID := Value;
end;

function TioAuthResponse.AsString: String;
begin
  Result := dj.From(Self).byFields.DateTimeFormat(TdjDateTimeFormat.dfUnix).ToJson;
end;

end.
