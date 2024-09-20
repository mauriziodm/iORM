unit iORM.Auth.Components.AuthorizationClient;

interface

uses
  System.Classes;

type

  TioAuthorizationClient = class(TComponent)
  private
    // singleton class fields
    class var FInstance: TioAuthorizationClient;
  private
    // methods
    function Get_Version: String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class function GetInstance: TioAuthorizationClient; static;
  published
    // properties
    property _Version: String read Get_Version;
  end;


implementation

uses
  iORM;

{ TioAuthorizationClient }

constructor TioAuthorizationClient.Create(AOwner: TComponent);
begin
  inherited;
  // Set the singleton internal reference to itself (one only auth server at a time)
  TioAuthorizationClient.FInstance := Self;
end;

destructor TioAuthorizationClient.Destroy;
begin
  FInstance := nil;
  inherited;
end;

class function TioAuthorizationClient.GetInstance: TioAuthorizationClient;
begin
  Result := TioAuthorizationClient.FInstance;
end;

function TioAuthorizationClient.Get_Version: String;
begin
  Result := io.Version;
end;

end.
