//&&&&&
unit iORM.DB.Peculiarity.Firebird.PeculiarityMapper;

interface

Uses System.Classes, iORM.CommonTypes, iORM.DB.Interfaces, iORM.DB.ConnectionContainer,
  iORM.DB.Components.ConnectionDef;

Type
  TioFirebirdConnectionManager = Class(TioConnectionManager)
    class function NewFirebirdConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String;
      const AAsDefault:Boolean=True; const APersistent:Boolean=False;
      const APooled:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
  End;

  // Class for Firebird connection
  TioFirebirdConnectionDef = class(TioCustomConnectionDef)
  public
    constructor Create(AOwner: TComponent); override;
    procedure RegisterConnectionDef; override;
    property ConnectionDef;
  published
    // Properties
    property CharSet;
    property Database;
    property DatabaseStdFolder;
    property DefaultConnection;
    property OSAuthent;
    property Password;
    property Persistent;
    property Pooled;
    property Port;
    property Protocol;
    property Server;
    property SQLDialect;
    property UserName;
  end;


Implementation

Uses System.SysUtils,
  FireDAC.Phys.FB,
  iORM.DB.Peculiarity.Generic.PeculiarityMapper,
  iORM.DB.Peculiarity.Generic.SqlDataConverter,
  iORM.DB.Peculiarity.Firebird.SqlGenerator,
  iORM.Context.Table.Interfaces;

Type
  TioDbPeculiarityFirebird = class(TioDbPeculiarityGeneric)
  public
    class function SqlDataConverterRef: TioSqlDataConverterRef; override;
    class function SqlGeneratorRef: TioSqlGeneratorRef; override;
    class Function HasSqlNextIDBeforeInsert(Const AContextTable:IioContextTable):Boolean; override;
  end;

(* TioFirebirdConnectionManager *)

class function TioFirebirdConnectionManager.NewFirebirdConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet: String;
  const AAsDefault:Boolean=True; const APersistent:Boolean=False;
  const APooled:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
  Result.Params.DriverID := 'FB';
  Result.Params.Values['Server'] := AServer;
  Result.Params.Database := ADatabase;
  Result.Params.UserName := AUserName;
  Result.Params.Password := APassword;
  Result.Params.Values['Protocol'] := 'TCPIP';
  if ACharSet <> '' then Result.Params.Values['CharacterSet'] := ACharSet;
  // Add the connection type to the internal container
  FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName(*&&&&, cdtFirebird*), TioDbPeculiarityFirebird, APersistent));
end;

{ TioFirebirdConnectionDef }

constructor TioFirebirdConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  Port := 3050;
end;

procedure TioFirebirdConnectionDef.RegisterConnectionDef;
begin
  ConnectionDef := TioFirebirdConnectionManager.NewFirebirdConnectionDef(Server,
    GetFullPathDatabase, UserName, Password, CharSet, DefaultConnection,
    Persistent, Pooled, Name);
  // OSAuthent
  case OSAuthent of
    TioOSAuthent.oaNo:  ConnectionDef.Params.Values['OSAuthent'] := 'No';
    TioOSAuthent.oaYes: ConnectionDef.Params.Values['OSAuthent'] := 'Yes';
  end;
  // Port
  ConnectionDef.Params.Values['Port'] := Port.ToString;
  // Protocol
  case Protocol of
    TioProtocol.pTCPIP:   ConnectionDef.Params.Values['Protocol'] := 'TCPIP';
    TioProtocol.pLocal:   ConnectionDef.Params.Values['Protocol'] := 'Local';
    TioProtocol.pNetBEUI: ConnectionDef.Params.Values['Protocol'] := 'NetBEUI';
    TioProtocol.pSPX:     ConnectionDef.Params.Values['Protocol'] := 'SPX';
  end;
  // SQL dialect
  case SQLDialect of
    TioSQLDialect.sqlDialect3: ConnectionDef.Params.Values['SQLDialect'] := '3';
    TioSQLDialect.sqlDialect2: ConnectionDef.Params.Values['SQLDialect'] := '2';
    TioSQLDialect.sqlDialect1: ConnectionDef.Params.Values['SQLDialect'] := '1';
  end;
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

{ TioFirebirdDbMapper }

class function TioDbPeculiarityFirebird.SqlDataConverterRef: TioSqlDataConverterRef;
begin
//&&&&  Result:=TioSqlDataConverterFirebird;
  Result:=TioSqlDataConverterStructured;
end;

class function TioDbPeculiarityFirebird.SqlGeneratorRef: TioSqlGeneratorRef;
begin
  Result:=TioSqlGeneratorFirebird;
end;

class Function TioDbPeculiarityFirebird.HasSqlNextIDBeforeInsert(Const AContextTable:IioContextTable):Boolean;
Begin
  Result:=True;
End;

end.
