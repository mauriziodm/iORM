unit UnitRepositoryIniFile;

interface

uses IB_Components, IniFiles;

type

  TRepositoryIniFile = class(TMemIniFile)
  private
    fIB_Connection: TIB_Connection;
  protected
    function ExtractDir(const APath: String): String;
    function PathToAlias(const APath: String): String;
    function AliasToPath(const AAlias: String): String;
  public
    constructor Create(FileName:String; IB_Connection:TIB_Connection);
    procedure UpdateFile; override;
    procedure DownloadRepositoryIniFiles;
  end;

implementation

uses SysUtils, System.StrUtils, DataModule1;

{ TRepositoryIniFile }

constructor TRepositoryIniFile.Create(FileName: String;
  IB_Connection: TIB_Connection);
begin
  inherited Create(FileName);
  fIB_Connection := IB_Connection;
end;

procedure TRepositoryIniFile.UpdateFile;
var
  Q: TIB_Cursor;
  LocFileName, LocFilePath: String;
begin
  inherited;
  // Inizializzazione
  LocFileName := Uppercase(ExtractFileName(Self.FileName));
  LocFilePath := Uppercase(ExtractFilePath(Self.FileName));
  LocFilePath := PathToAlias(LocFilePath);
  // Provvede alla cancellazione e ricaricamento del file sul repository
  Q := TIB_Cursor.Create(nil);
  Q.IB_Connection := fIB_Connection;
  try
    Q.SQL.Add('DELETE FROM REPOSITORY WHERE NOMEFILE=''' + LocFileName + ''' AND FILEPATH=''' + LocFilePath + '''');
    Q.ExecSQL;
    Q.SQL.Clear;
    Q.SQL.Add('INSERT INTO REPOSITORY (NOMEFILE, FILEPATH, TIPOFILE, VERSIONE, CONTENUTO)');
    Q.SQL.Add('VALUES (');
    Q.SQL.Add(QuotedStr(LocFileName) + ',');
    Q.SQL.Add(QuotedStr(LocFilePath) + ',');
    Q.SQL.Add('''REP'',');
    Q.SQL.Add('(-1),');
    Q.SQL.Add(':P_CONTENUTO');
    Q.SQL.Add(')');
    Q.Prepare;
    Q.Params.ParamByName('P_CONTENUTO').LoadFromFile(Self.FileName);
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;


procedure TRepositoryIniFile.DownloadRepositoryIniFiles;
var
  Q: TIB_Cursor;
  FullLocalPath, FullLocalFileName, FullLocalOldFileName: String;
begin
  inherited;
  // Imposta la query che scaricherà tutti i files INI dal repository,
  Q := TIB_Cursor.Create(nil);
  Q.IB_Connection := fIB_Connection;
  try
    Q.SQL.Add('SELECT NOMEFILE, FILEPATH AS ALIAS, CONTENUTO FROM REPOSITORY');
    Q.SQL.Add('WHERE TIPOFILE = ''REP''');
    Q.Open;
    while not Q.Eof do begin
      FullLocalPath := AliasToPath(Q.FieldByName('ALIAS').AsString);
      FullLocalFileName := FullLocalPath + Q.FieldByName('NOMEFILE').AsString;
      FullLocalOldFileName := FullLocalPath + 'OLD_' + Q.FieldByName('NOMEFILE').AsString;
      if (not FileExists(FullLocalOldFileName)) and (FileExists(FullLocalFileName)) then RenameFile(FullLocalFileName, FullLocalOldFileName);
      Q.FieldByName('CONTENUTO').SaveToFile(FullLocalFileName);
      Q.Next;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TRepositoryIniFile.AliasToPath(const AAlias: String): String;
begin
  // NB: Siccome nel repository potrebbe essere rimasta la vecchia path completa
  //      invece che l'alias pulito (in pratica dopo un aggiornamento), allora
  //      prima estrae l'ultima cartella sulla DX (che poi sarebbe l'alias).
  //      In questo modo funziona anche subito dopo l'aggiornamento anche
  //      senza fare una specifica conversione
  Result := ExtractDir(AAlias);
  if Result = 'LEVANTE' then
    Result := '';
  Result := IncludeTrailingPathDelimiter(DM1.UserAppDataLevanteDir + Result);
end;

function TRepositoryIniFile.ExtractDir(const APath: String): String;
var
  I: Integer;
begin
  // Se il Path ricevuto corrisponde alla cartella di esecuzione di Levante
  //  allora ritorna un alias vuoto (in pratica è la root di Levante)
  if APath = DM1.CurrDir then
    Exit('');
  // Altrimenti continua estraendo il nome dell'ultima cartella sulla DX
  //  e la ritorna come alias
  Result := ExcludeTrailingPathDelimiter(APath);
  for I := Length(Result) downto 1 do
    if Result[I] = '\' then
      Exit(  Uppercase(Copy(Result, I+1, 9999))  );
end;

function TRepositoryIniFile.PathToAlias(const APath: String): String;
begin
  Result := ExtractDir(APath);
end;

end.
