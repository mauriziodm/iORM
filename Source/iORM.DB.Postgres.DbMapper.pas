//&&&&&
unit iORM.DB.Postgres.DbMapper;

interface

Uses iORM.CommonTypes, iORM.DB.Interfaces, iORM.DB.ConnectionContainer;

Type
  TioPostgresConnectionManager = Class(TioConnectionManager)
    class function NewPostgresConnectionDef(const AServer, ADatabase, AUserName, APassword: String;
        const AAsDefault:Boolean=True; const APersistent:Boolean=False; const APooled:Boolean=False;
        const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
  End;

Implementation

Uses System.Classes, System.SysUtils, iORM.DB.Components.ConnectionDef,
  iORM.DB.Firebird.SqlDataConverter, //????
  iORM.DB.Postgres.SqlGenerator;

Type
  TioDbMapperPostgres = class(TioDbMapper)
  public
    class function SqlDataConverterRef: TioSqlDataConverterRef; override;
    class function SqlGeneratorRef: TioSqlGeneratorRef; override;
//    class Function HasAutoIncrementIDRetrieveWithSeparateQuery:Boolean; override;
    class Function HasAutoIncrementIDRetrieveWithInsertQuery:Boolean; override;
  end;

  // Class for Postgres connection
  TioPostgresConnectionDef = class(TioCustomConnectionDef)
  public
    constructor Create(AOwner: TComponent); override;
    procedure RegisterConnectionDef; override;
    property ConnectionDef;
  published
    // Properties
    property Database;
//    property DatabaseStdFolder;
//    property DefaultConnection;
//    property Encrypt;
//    property OSAuthent;
    property Password;
    property Persistent;
    property Pooled;
    property Port;
    property Server;
    property UserName;
  end;

(* TioPostgresConnectionManager *)

class function TioPostgresConnectionManager.NewPostgresConnectionDef(const AServer, ADatabase, AUserName, APassword: String;
    const AAsDefault:Boolean=True; const APersistent:Boolean=False; const APooled:Boolean=False;
    const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
  Result.Params.DriverID := 'PG';
  Result.Params.Values['Server'] := AServer;
  Result.Params.Database := ADatabase;
  Result.Params.UserName := AUserName;
  Result.Params.Password := APassword;
  //if ACharSet <> '' then Result.Params.Values['CharacterSet'] := ACharSet;
  // Add the connection type to the internal container
  FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName(*&&&&, cdtPostgres*), TioDbMapperPostgres, APersistent));
end;

{ TioPostgresConnectionDef }

constructor TioPostgresConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  Port := 5432;
end;

procedure TioPostgresConnectionDef.RegisterConnectionDef;
begin
  ConnectionDef := TioPostgresConnectionManager.NewPostgresConnectionDef(Server,Database,
    UserName, Password, DefaultConnection,
    Persistent, Pooled, Name);
  ConnectionDef.Params.Values['Port'] := Port.ToString;
{  %%%%%%%
 //Encript
  if not Encrypt.IsEmpty then
    ConnectionDef.Params.Values['Encrypt'] := Encrypt;
  // OSAuthent
  case OSAuthent of
    TioOSAuthent.oaNo:  ConnectionDef.Params.Values['OSAuthent'] := 'No';
    TioOSAuthent.oaYes: ConnectionDef.Params.Values['OSAuthent'] := 'Yes';
  end;
  // NB: Inherited must be the last line (set FIsRegistered)
}
  inherited;
end;

{ TioPostgresDbMapper }

class function TioDbMapperPostgres.HasAutoIncrementIDRetrieveWithInsertQuery: Boolean;
begin
  Result:=True;
end;

(*
class function TioDbMapperPostgres.HasAutoIncrementIDRetrieveWithSeparateQuery: Boolean;
begin
  Result:=True;
end;
*)

class function TioDbMapperPostgres.SqlDataConverterRef: TioSqlDataConverterRef;
begin
  Result:=TioSqlDataConverterFirebird; //???? Uguale a Firebird. Fare un livello intermedio.
end;

class function TioDbMapperPostgres.SqlGeneratorRef: TioSqlGeneratorRef;
begin
  Result:=TioSqlGeneratorPostgres;
end;

end.
