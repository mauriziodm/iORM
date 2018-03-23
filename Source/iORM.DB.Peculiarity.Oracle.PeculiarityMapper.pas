//&&&&&
unit iORM.DB.Peculiarity.Oracle.PeculiarityMapper;

interface

Uses iORM.CommonTypes, iORM.DB.Interfaces, iORM.DB.ConnectionContainer,
  iORM.DB.Components.ConnectionDef;

Type
  TioOracleConnectionManager = Class(TioConnectionManager)
    class function NewOracleConnectionDef(const ADatabase, AUserName, APassword: String;
        const AAsDefault:Boolean=True; const APersistent:Boolean=False; const APooled:Boolean=False; const AConnectionName:String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
  End;

  // Class for Oracle connection
  TioOracleConnectionDef = class(TioCustomConnectionDef)
  public
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
//    property Server;
    property UserName;
  end;

Implementation

Uses System.Classes, System.SysUtils,
  iorm.DB.Peculiarity.Generic.PeculiarityMapper,
  iORM.DB.Peculiarity.Generic.SqlDataConverter,
  iORM.DB.Peculiarity.Oracle.SqlGenerator,
  iORM.Context.Table.Interfaces;

Type
  TioDbPeculiarityOracle = class(TioDbPeculiarityGeneric)
  public
    class function SqlDataConverterRef: TioSqlDataConverterRef; override;
    class function SqlGeneratorRef: TioSqlGeneratorRef; override;
    class Function HasSqlNextIDBeforeInsert(Const AContextTable:IioContextTable):Boolean; override;
    class Function HasAutoIncrementIDRetrieveWithInsertQuery(Const AContextTable:IioContextTable):Boolean; override;  //$$$$
  end;

class function TioOracleConnectionManager.NewOracleConnectionDef(const ADatabase,
  AUserName, APassword: String; const AAsDefault, APersistent,
  APooled: Boolean; const AConnectionName: String): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
  Result.Params.DriverID := 'Ora';
//  Result.Params.Values['Server'] := AServer;
  Result.Params.Database := ADatabase;
  Result.Params.UserName := AUserName;
  Result.Params.Password := APassword;
  //if ACharSet <> '' then Result.Params.Values['CharacterSet'] := ACharSet;
  // Add the connection type to the internal container
  FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName(*&&&&, cdtOracle*), TioDbPeculiarityOracle, APersistent));
end;

{ TioOracleConnectionDef }

procedure TioOracleConnectionDef.RegisterConnectionDef;
begin
  ConnectionDef := TioOracleConnectionManager.NewOracleConnectionDef(Database,
    UserName, Password, DefaultConnection,
    Persistent, Pooled, Name);
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

{ TioDbPeculiarityOracle }

class function TioDbPeculiarityOracle.HasAutoIncrementIDRetrieveWithInsertQuery(Const AContextTable:IioContextTable): Boolean;
begin
// If GetKeyGenerator is equal to TableName then it is NOT defined (impossible to have two objects with same name)
// then the counter is managed as automatic with trigger
  Result:= (AContextTable.TableName=AContextTable.GetKeyGenerator);
end;

class function TioDbPeculiarityOracle.HasSqlNextIDBeforeInsert(Const AContextTable:IioContextTable): Boolean;
begin
// If GetKeyGenerator is different to TableName then it is defined and must be used.
  Result:= NOT (AContextTable.TableName=AContextTable.GetKeyGenerator);
end;

class function TioDbPeculiarityOracle.SqlDataConverterRef: TioSqlDataConverterRef;
begin
  Result:=TioSqlDataConverterStructured;
end;

class function TioDbPeculiarityOracle.SqlGeneratorRef: TioSqlGeneratorRef;
begin
  Result:=TioSqlGeneratorOracle;
end;

end.

