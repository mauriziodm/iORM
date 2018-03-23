//&&&&&
unit iORM.DB.Peculiarity.SqLite.PeculiarityMapper;

interface

Uses System.Classes, iORM.CommonTypes, iORM.DB.Interfaces, iORM.DB.ConnectionContainer,
iORM.DB.Components.ConnectionDef;

Type
  TioSQLiteConnectionManager = Class(TioConnectionManager)
    class function NewSQLiteConnectionDef(const ADatabase:String;
      const AAsDefault:Boolean=True; const APersistent:Boolean=False;
      const APooled:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
  End;

  // Class for SQLite connection
  TioSQLiteConnectionDef = class(TioCustomConnectionDef)
  public
    constructor Create(AOwner: TComponent); override;
    procedure RegisterConnectionDef; override;
    property ConnectionDef;
  published
    // Properties
    property AutoCreateDatabase;
    property Database;
    property DatabaseStdFolder;
    property DefaultConnection;
    property Encrypt;
    property NewPassword;
    property Password;
    property Persistent;
    property Pooled;
  end;

Implementation

Uses System.SysUtils,
  FireDAC.Phys.SQLite,
  iORM.DB.Peculiarity.Generic.PeculiarityMapper,
//  iORM.DB.SqLite.SqlDataConverter, iORM.DB.SqLite.SqlGenerator;
  iORM.Context.Table.Interfaces, //&&&&
  iORM.DB.Peculiarity.SqLite.SqlGenerator;

Type
  TioDbPeculiaritySqLite = class(TioDbPeculiarityGeneric)
  public
//    class function SqlDataConverterRef: TioSqlDataConverterRef; override;
    class function SqlGeneratorRef: TioSqlGeneratorRef; override;
    class Function AutoCreateDatabase:Boolean; override;
    class Function HasSqlLastIDAfterInsert(Const AContextTable:IioContextTable):Boolean; override;
  end;

{ TioSQLiteConnectionManager }

class function TioSQLiteConnectionManager.NewSQLiteConnectionDef(const ADatabase:String;
  const AAsDefault:Boolean=True; const APersistent:Boolean=False;
  const APooled:Boolean=False; const AConnectionName: String=IO_CONNECTIONDEF_DEFAULTNAME): IIoConnectionDef;
begin
  Result := Self.NewCustomConnectionDef(AConnectionName, APooled, AAsDefault);
  Result.Params.DriverID := 'SQLite';
  Result.Params.Database := ADatabase;
  Result.Params.Values['FailIfMissing'] := 'False';
  // Add the connection type to the internal container
  FConnectionManagerContainer.AddOrSetValue(AConnectionName, TioConnectionInfo.Create(AConnectionName(*&&&&, cdtSQLite*), TioDbPeculiaritySqLite, APersistent));
end;

{ TioSQLiteConnectionDef }

constructor TioSQLiteConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  AutoCreateDatabase := True;
end;

procedure TioSQLiteConnectionDef.RegisterConnectionDef;
begin
  ConnectionDef := TioSqLiteConnectionManager.NewSQLiteConnectionDef(GetFullPathDatabase, DefaultConnection, Persistent, Pooled, Name);
  // Encript
  if not Encrypt.IsEmpty then
    ConnectionDef.Params.Values['Encrypt'] := Encrypt;
  // NewPassword
  if not NewPassword.IsEmpty then
    ConnectionDef.Params.NewPassword := NewPassword;
  // Password
  if not Password.IsEmpty then
    ConnectionDef.Params.Password := Password;
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

{ TioDbPeculiaritySqLite }

class function TioDbPeculiaritySqLite.AutoCreateDatabase: Boolean;
begin
  Result:=True;
end;

class function TioDbPeculiaritySqLite.HasSqlLastIDAfterInsert(Const AContextTable:IioContextTable): Boolean;
begin
//&&&& Messo a True anche se non c'era in origine.
//&&&& Veniva comunque passato l'ID a Null nella query di Insert, tanto non dava fastidio.
  Result:=True;
end;

class function TioDbPeculiaritySqLite.SqlGeneratorRef: TioSqlGeneratorRef;
begin
  Result:=TioSqlGeneratorSqLite;
end;

end.
