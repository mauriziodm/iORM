//&&&&&
unit iORM.REST.Peculiarity.REST.PeculiarityMapper;

interface

Uses System.Classes, iORM.CommonTypes, iORM.DB.Interfaces, iORM.DB.ConnectionContainer,
  iORM.DB.Components.ConnectionDef;

Type
  TioRestConnectionManager = Class(TioConnectionManager)
    class procedure NewRESTConnection(const ABaseURL: String;
        const AAsDefault:Boolean=True; const APersistent:Boolean=True;
        const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME);
  End;

  // Class for REST remoted connection
  TioRESTConnectionDef = class(TioCustomConnectionDef)
  public
    constructor Create(AOwner: TComponent); override;
  public
    procedure RegisterConnectionDef; override;
  published
    property BaseURL;
    property DefaultConnection;
    property Persistent;
  end;

Implementation

Uses System.SysUtils;

{ TioRestConnectionManager }

class procedure TioRestConnectionManager.NewRESTConnection(const ABaseURL: String;
  const AAsDefault:Boolean=True; const APersistent:Boolean=True;
  const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME);
var
  LConnectionInfo: TioConnectionInfo;
begin
  // If the AsDefault param is True or this is the first ConnectionDef of the application
  //  then set it as default
  if AAsDefault or (Self.FDefaultConnectionName = '') then
    Self.FDefaultConnectionName := AConnectionName;
  // Setup the connection info
  LConnectionInfo := TioConnectionInfo.Create(AConnectionName(*&&&&, cdtREST*), Nil (* Nil Means NO DB*), APersistent);
  LConnectionInfo.BaseURL := ABaseURL;
  // Add the connection type to the internal container
  FConnectionManagerContainer.AddOrSetValue(AConnectionName, LConnectionInfo);
end;

{ TioRESTConnectionDef }

constructor TioRESTConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  Persistent := True;
end;

procedure TioRESTConnectionDef.RegisterConnectionDef;
begin
  TioRestConnectionManager.NewRESTConnection(BaseURL, DefaultConnection, Persistent, Name);
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

end.
