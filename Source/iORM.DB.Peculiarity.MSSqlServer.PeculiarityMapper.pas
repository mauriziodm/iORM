//&&&&&
unit iORM.DB.Peculiarity.MSSqlServer.PeculiarityMapper;

interface

Uses iORM.CommonTypes, iORM.DB.Interfaces, iORM.DB.ConnectionContainer,
  iORM.DB.Components.ConnectionDef;

Type
  TioSqlServerConnectionManager = Class(TioConnectionManager)
    class function NewSQLServerConnectionDef(const AServer, ADatabase, AUserName, APassword:String;
  const AAsDefault:Boolean=True; const APersistent:Boolean=False;
  const APooled:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
  End;

  // Class for MSSQLServer connection
  TioSQLServerConnectionDef = class(TioCustomConnectionDef)
  public
    procedure RegisterConnectionDef; override;
    property ConnectionDef;
  published
    // Properties
    property Database;
    property DatabaseStdFolder;
    property DefaultConnection;
    property Encrypt;
    property OSAuthent;
    property Password;
    property Persistent;
    property Pooled;
    property Server;
    property UserName;
  end;

Implementation

Uses System.Classes, System.SysUtils,
  iORM.DB.Peculiarity.Generic.PeculiarityMapper,
  iORM.DB.Peculiarity.Generic.SqlDataConverter,
  iORM.DB.Peculiarity.MSSqlServer.SqlGenerator,
  iORM.Context.Table.Interfaces;

Type
  TioDbPeculiaritySqlServer = class(TioDbPeculiarityGeneric)
  public
    class function SqlDataConverterRef: TioSqlDataConverterRef; override;
    class function SqlGeneratorRef: TioSqlGeneratorRef; override;
    class Function HasSqlLastIDAfterInsert(Const AContextTable:IioContextTable):Boolean; override;
    class Function HasAutoIncrementIDRetrieveWithInsertQuery(Const AContextTable:IioContextTable):Boolean; override;
  end;

class function TioSqlServerConnectionManager.NewSQLServerConnectionDef(const AServer, ADatabase, AUserName, APassword:String;
  const AAsDefault:Boolean=True; const APersistent:Boolean=False;
  const APooled:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin

  Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);

  Result.Params.DriverID := 'MSSQL';
  Result.Params.Values['Server'] := AServer;
  Result.Params.Database := ADatabase;
  Result.Params.UserName := AUserName;
  Result.Params.Password := APassword;
  // Add the connection type to the internal container
  FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName(*&&&&, cdtSQLServer*), TioDbPeculiaritySqlServer, APersistent));
end;

{ TioSQLServerConnectionDef }

procedure TioSQLServerConnectionDef.RegisterConnectionDef;
begin
  ConnectionDef := TioSqlServerConnectionManager.NewSQLServerConnectionDef(Server,
//????    GetFullPathDatabase, UserName, Password, DefaultConnection,
// Per farlo funzionare ho dovuto sostituire il "GetFullPathDatabase" con "Database".
    Database, UserName, Password, DefaultConnection,
    Persistent, Pooled, Name);
  // Encript
  if not Encrypt.IsEmpty then
    ConnectionDef.Params.Values['Encrypt'] := Encrypt;
  // OSAuthent
  case OSAuthent of
    TioOSAuthent.oaNo:  ConnectionDef.Params.Values['OSAuthent'] := 'No';
    TioOSAuthent.oaYes: ConnectionDef.Params.Values['OSAuthent'] := 'Yes';
  end;
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

{ TioDbPeculiaritySqlServer }

class function TioDbPeculiaritySqlServer.HasAutoIncrementIDRetrieveWithInsertQuery(Const AContextTable:IioContextTable): Boolean;
begin
// If GetKeyGenerator is equal to TableName then it is NOT defined.
//this will use by default "OUTPUT" part in INSERT command to retrieve ID.
  Result:= (AContextTable.TableName=AContextTable.GetKeyGenerator);
end;

class function TioDbPeculiaritySqlServer.HasSqlLastIDAfterInsert(Const AContextTable:IioContextTable): Boolean;
begin
// If GetKeyGenerator is different to TableName then disable "OUTPUT" part in INSERT command and use @@Identity to retrieve ID.
  Result:= NOT (AContextTable.TableName=AContextTable.GetKeyGenerator);
end;

class function TioDbPeculiaritySqlServer.SqlDataConverterRef: TioSqlDataConverterRef;
begin
  Result:=TioSqlDataConverterStructured; //???? Uguale a Firebird. Fare un livello intermedio...
end;

class function TioDbPeculiaritySqlServer.SqlGeneratorRef: TioSqlGeneratorRef;
begin
  Result:=TioSqlGeneratorMSSqlServer;
end;

end.
