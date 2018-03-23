//&&&&&
unit iORM.DB.Peculiarity.MySql.PeculiarityMapper;

interface

Uses System.Classes, iORM.CommonTypes, iORM.DB.Interfaces, iORM.DB.ConnectionContainer,
  iORM.DB.Components.ConnectionDef;

Type
  TioMySqlConnectionManager = Class(TioConnectionManager)
    class function NewMySQLConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet:String;
        const AAsDefault:Boolean=True; const APersistent:Boolean=False;
        const APooled:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
  End;

  // Class for MySQL connection
  TioMySQLConnectionDef = class(TioCustomConnectionDef)
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
    property Password;
    property Persistent;
    property Pooled;
    property Port;
    property Server;
    property UserName;
  end;

  Implementation

Uses System.SysUtils,
  iORM.DB.Peculiarity.Generic.PeculiarityMapper;


Type
  TioDbPeculiarityMySql = class(TioDbPeculiarityGeneric)
  public
    class function SqlDataConverterRef: TioSqlDataConverterRef; override;
    class function SqlGeneratorRef: TioSqlGeneratorRef; override;
  end;

{ TioMySqlConnectionManager }

class function TioMySqlConnectionManager.NewMySQLConnectionDef(const AServer, ADatabase, AUserName, APassword, ACharSet:String;
  const AAsDefault:Boolean=True; const APersistent:Boolean=False;
  const APooled:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
  Result.Params.DriverID := 'MySQL';
  Result.Params.Values['Server'] := AServer;
  Result.Params.Database := ADatabase;
  Result.Params.UserName := AUserName;
  Result.Params.Password := APassword;
  if ACharSet <> '' then Result.Params.Values['CharacterSet'] := ACharSet;
  // Add the connection type to the internal container
  FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName(*&&&&, cdtMySQL*), TioDbPeculiarityMySql, APersistent));
end;

{ TioMySQLConnectionDef }

constructor TioMySQLConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  Port := 3306;
end;

procedure TioMySQLConnectionDef.RegisterConnectionDef;
begin
  ConnectionDef := TioMySqlConnectionManager.NewMySQLConnectionDef(Server,
    GetFullPathDatabase, UserName, Password, CharSet, DefaultConnection,
    Persistent, Pooled, Name);
  // Port
  ConnectionDef.Params.Values['Port'] := Port.ToString;
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

{ TioDbPeculiarityMySql }

class function TioDbPeculiarityMySql.SqlDataConverterRef: TioSqlDataConverterRef;
begin
  Result:=Nil; //TioSqlDataConverterMySql;   // da  fare!!!!!!
end;

class function TioDbPeculiarityMySql.SqlGeneratorRef: TioSqlGeneratorRef;
begin
  Result:=Nil; //TioSqlGeneratorMySql;   // da  fare!!!!!!
end;

end.
