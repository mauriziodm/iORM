unit UnitFileRepository;

interface

uses IB_Components;

type

  TRepositoryFile = class(TObject)
  private
    fFileDir: String;
    fAzienda: String;
    fFileNameNoExt: String;
    fOriginalFileNameWithExt: String;
    fCurrentFileVersion: Integer;
    fIB_Connection: TIB_Connection;
    fQ: TIB_Cursor;
    fForceLocal: Boolean;
//    fFileType: String;
    fOtherFileName1: String;
    fOtherFileName5: String;
    fOtherFileName2: String;
    fOtherFileName4: String;
    fOtherFileName3: String;
    fOtherFileName6: String;
    fOriginalFileDir: String;
    function GetFullLocalFileName: String;
    function SlashFinale(DirToCtrl: String): String;
    function GetCurrentFileVersionStr: String;
    function PadR(StrIn, PadChar: String; Lungh: Integer): String;
    procedure SetFileDir(const Value: String);
    procedure SetIB_Connection(const Value: TIB_Connection);
    function GetDbFileVersion: Integer;
    function GetLocalFileVersion: Integer;
    procedure LoadLocalOriginalFileToDatabase;
    procedure LoadDatabaseFileToLocal;
    procedure SetAzienda(const Value: String);
    procedure SetOtherFileName1(const Value: String);
    procedure SetOtherFileName2(const Value: String);
    procedure SetOtherFileName3(const Value: String);
    procedure SetOtherFileName4(const Value: String);
    procedure SetOtherFileName5(const Value: String);
    procedure SetOtherFileName6(const Value: String);
    function GetOtherFileName1: String;
    function GetOtherFileName2: String;
    function GetOtherFileName3: String;
    function GetOtherFileName4: String;
    function GetOtherFileName5: String;
    function GetOtherFileName6: String;
    function GetAziendaDir: String;
    procedure BackupExtraFiles;
    procedure SetOriginalFileDir(const Value: String);
    function GetFileDir: String;
    function GetOriginalFileDir: String;
    function GetOriginalAziendaDir: String;
    function GetOriginalFullFileName: String;
    function GetOriginalOtherFileName1: String;
    function GetOriginalOtherFileName2: String;
    function GetOriginalOtherFileName3: String;
    function GetOriginalOtherFileName4: String;
    function GetOriginalOtherFileName5: String;
    function GetOriginalOtherFileName6: String;
  protected
  public
    // =========================================================================
    // PROPRIETA' DA IMPOSTARE ALLA CREAZIONE DELL'OGGETTO
    // -------------------------------------------------------------------------
    // Nome del file (non il vecchio nome originale del file prima del sistema di centralizzazione chiamato repository)
    //  usato poi per comporre il nome del file + l'estensione con la versione e anche come parte della chiave primaria
    //  del file nel database insieme all'AZIENDA
    property FileNameNoExt:String read fFileNameNoExt write fFileNameNoExt;
    // Indica la cartella dove il file di configurazione viene gestito (non la cartella dove si trova il file originale
    //  usato prima dell'avvento del repository)
    property FileDir:String read GetFileDir write SetFileDir;
    // Se il file deve essere gestito separatamente per azienda, questa proprietà contiene appunto il
    //  nome dell'azienda e viene utilizzato per comporre il percorso completo dove viene gestito il file
    property Azienda:String read fAzienda write SetAzienda;

    // Qui si imposta il nome del file originario (complreto di estensione) che veniva utilizzato prima che fosse creato il
    //  repository. Questo viene usato per caricare il file originario sul repository stesso se
    //  è la prima volta che si avvia una versione dotata di repository dopo l'aggiornamento da
    //  una versione precedente che non ne era invece dotata.
    property OriginalFileNameWithExt:String read fOriginalFileNameWithExt write fOriginalFileNameWithExt;
    // Qui si imposta il percorso dove si trova il file originario che fa da modello e che veniva utilizzato
    //  anche dal programma prima di aver creato il repository.
    //  NB: Nel caso dei loghi.ini che può essere gestito separatamente per azienda qui cmq va indicato
    //       solo la parte comune del percorso perchè poi il percorso completo viene composto
    //       aggiungendo anche il nome dell'azienda. (es: "c:\progremmi\dcom\levante\")
    property OriginalFileDir:String read GetOriginalFileDir write SetOriginalFileDir;

    // Per la connessione al database dove risiede il repository
    property IB_Connection:TIB_Connection read fIB_Connection write SetIB_Connection;
    // Se impostata a True la gestione centralizzata del file attraverso il repository
    //  è disabilitata e quindi forsa il sistema a usare il vecchio file di configurazione
    //  come quando il repository non esisteva. In questo modo, in casi particolari
    //  si può tornare alla situazione originaria senza impostazioni centralizzate.
    property ForceLocal:Boolean read fForceLocal write fForceLocal;

    // Qui si possono specificare, se necessario, fino a 6 files aggiuntivi da memorizzare
    //  insieme al file principale e che seguono sempre il file principale.
    //  L'ho creato ad esempio per la gestione dei loghi dove oltre al file loghi.ini
    //  ci sono anche le bitmap di intestazioni e piedi dei documenti.
    property OtherFileName1:String read fOtherFileName1 write SetOtherFileName1;
    property OtherFileName2:String read fOtherFileName2 write SetOtherFileName2;
    property OtherFileName3:String read fOtherFileName3 write SetOtherFileName3;
    property OtherFileName4:String read fOtherFileName4 write SetOtherFileName4;
    property OtherFileName5:String read fOtherFileName5 write SetOtherFileName5;
    property OtherFileName6:String read fOtherFileName6 write SetOtherFileName6;
    // =========================================================================

    // Ritorna il nome di fila completo per la memorizzazione locale del file di configurazione. E' poi il file
    //  che viene utilizzato realmente dall'applicazione.
    //  Viene composto da "FileDir + Azienda + FileNameNoExt + '.' + CurrentFileVersionStr
    property FullLocalFileName:String read GetFullLocalFileName;
    // RItorna il nome del file originario (quello usato prima che ci fosse il repository)
    //  complreto di percorso e estensione.
    property OriginalFullFileName:String read GetOriginalFullFileName;
    // Queste proprietà ritorna (in versione numerica o alfanumerica) la versione corrente
    //  più recente attualmente presente nella cartella di gestione del file
    //  dove la versione del file è indicata dall'estensione del file stesso.
    property CurrentFileVersion:Integer read fCurrentFileVersion;
    property CurrentFileVersionStr:String read GetCurrentFileVersionStr;
    // IMposta il campo relativo al tipo di file ed è solo predisposto e attualmente
    //  non utilizzato.
//    property FileType:String read fFileType write fFileType;
    // Ritorna la directory realativa all'azienda (completo di slash finale) da utilizzare
    //  nella gestione del file localmente e in pratica costituito da "FileDir + Azienda"
    property AziendaDir:String read GetAziendaDir;
    // Ritorna la directory realativa all'azienda (completo di slash finale) relativamente
    //  però al file originale sommando alla proprietà OriginalFileDir il nome dell'azienda.
    property OriginalAziendaDir:String read GetOriginalAziendaDir;

    // Ritornano il nome di file completo di percorso di gestione locale degli eventuali files
    //  aggiuntivi uniti al file principale (es: loghi.ini + le varie bitmap di intestazioni e piedi).
    property FullPathOtherFileName1:String read GetOtherFileName1;
    property FullPathOtherFileName2:String read GetOtherFileName2;
    property FullPathOtherFileName3:String read GetOtherFileName3;
    property FullPathOtherFileName4:String read GetOtherFileName4;
    property FullPathOtherFileName5:String read GetOtherFileName5;
    property FullPathOtherFileName6:String read GetOtherFileName6;
    // Ritornano il nome di file  aggiuntivo originale completo di percorso
    //  dove per originale si intende quello usato prima che ci fosse il repository.
    property OriginalFullPathOtherFileName1:String read GetOriginalOtherFileName1;
    property OriginalFullPathOtherFileName2:String read GetOriginalOtherFileName2;
    property OriginalFullPathOtherFileName3:String read GetOriginalOtherFileName3;
    property OriginalFullPathOtherFileName4:String read GetOriginalOtherFileName4;
    property OriginalFullPathOtherFileName5:String read GetOriginalOtherFileName5;
    property OriginalFullPathOtherFileName6:String read GetOriginalOtherFileName6;


    constructor Create;
    destructor Destroy; override;
    procedure CheckFile;
    procedure UploadLocalFileToRepository;
  end;

implementation

{ TRepositoryFile }

uses SysUtils, StrUtils;

// Questa è la parte principale di questo sistema.
procedure TRepositoryFile.CheckFile;
var
  DatabaseFileVersion, LocalFileVersion: Integer;
begin
  // Verifica correttezza campi e proprietà
  if FileNameNoExt = ''               then raise Exception.Create('Repository - Proprietà "FileNameNoExt" non corretta.');
  if FileDir = ''                     then raise Exception.Create('Repository - Proprietà "FileDir" non corretta.');
  if OriginalFileNameWithExt = ''     then raise Exception.Create('Repository - Proprietà "OriginalFileNameWithExt" non corretta.');
  if OriginalFileDir = ''             then raise Exception.Create('Repository - Proprietà "OriginalFileDir" non corretta.');
  if IB_Connection =                  nil then raise Exception.Create('Repository - Proprietà "IB_Connection" non corretta.');
  // Verifica esistenza cartella locale gestione file
  if (not DirectoryExists(FileDir)) then begin
    if (not CreateDir(FileDir)) then Exception.Create('Non è stato possibile creare la cartella: ' + FileDir);
  end;
  // Verifica esistenza cartella locale gestione file
  if (not DirectoryExists(AziendaDir)) then begin
    if (not CreateDir(AziendaDir)) then Exception.Create('Non è stato possibile creare la cartella: ' + AziendaDir);
  end;

  // Se è attivo il flag che indica che repository è disabilitato
  //  e che significa quindi che questa postazione deve utilizzare
  //  un layouts.ini locale (come era prima).
  if ForceLocal then Exit;
  // Prima di tutto carica in queste variabili locali le versioni
  //  del file locale e quello sl database
  DatabaseFileVersion := GetDbFileVersion;
  LocalFileVersion := GetLocalFileVersion;
  // Se la versione del file presente sul database <= 0 (zero) significa che
  //  il file non è per nulla presente nel repository e quindi lo crea ex-novo
  //  caricandolo dal file originario locale (il classico layouts.ini) e come
  //  versione lo imposta a 1.
  if DatabaseFileVersion <= 0 then begin
    // Crea il nuovo record nel repository e ci carica dentro il file originario (il vecchio layouts.ini)
    LoadLocalOriginalFileToDatabase;
    // RIcarica di nuovo la versione di file presente nel repository in modo che
    //  consideri il nuovo record appena aggiunto.
    DatabaseFileVersion := GetDbFileVersion;
    // Se anche a questo punto la versione <=0 solleva una eccezione perchè
    //  evidentemente c'è qualcosa che non funziona.
// NB: Commentato quando ho fatto in modo che i vari file di configurazione fosero messi
//      nelle cartelle private dell'utente windows. In queston modo risolvo il problema
//      del file loghi.ini quando non c'è per nulla.
//    if DatabaseFileVersion <= 0 then raise Exception.Create('Repository - Errore fatale, file "' + FileNameNoExt + '" non trovato (appena creato).');
  end;
  // A questo punto imposta il campo che indica la versione disponibile sul repository
  fCurrentFileVersion := DatabaseFileVersion;
  // Verifica se la versione presente sul repository è più aggiornata
  //  rispetto a quella locale e se è così scarica il file più
  //  recente presente sul server.
  if DatabaseFileVersion > LocalFileVersion then begin
    LoadDatabaseFileToLocal;
  end;
end;




// Questa procedura effetua l'upload sul database server dei files locali del client
//  di solito dopo averli modificati
procedure TRepositoryFile.UploadLocalFileToRepository;
var
  DatabaseFileVersion : Integer;
begin
  // Prima di tutto carica in queste variabili locali la versione del file nel repository
  DatabaseFileVersion := GetDbFileVersion;
  if DatabaseFileVersion < 1 then
    DatabaseFileVersion := 1
  else
    Inc(DatabaseFileVersion);

  // Verifica la presenza del file
  if not FileExists(FullLocalFileName) then raise Exception.Create('File locale: "' + FullLocalFileName + '", non trovato.');
  // Se la query è attiva la disattiva
  if fQ.Active then fQ.Close;

  // Imposta la query che elimina prima il record per poi aggiornarlo
  //  NB: Ho fatto così perchè altrimenti avevo problemi con i blob
  fQ.SQL.Clear;
  fQ.SQL.Add('DELETE FROM REPOSITORY');
  fQ.SQL.Add('WHERE NOMEFILE = :P_NOMEFILE AND FILEPATH = :P_FILEPATH');
  fQ.Prepare;
  fQ.Params.ParamByName('P_NOMEFILE').AsString := FileNameNoExt;
  fQ.Params.ParamByName('P_FILEPATH').AsString := Azienda;
  fQ.ExecSQL;

  // Poi reinserisco il record nella nuova versione
  fQ.SQL.Clear;
  fQ.SQL.Add('INSERT INTO REPOSITORY (NOMEFILE, FILEPATH, VERSIONE, CONTENUTO, TIPOFILE, ALTROFILE1, ALTROFILE2, ALTROFILE3, ALTROFILE4, ALTROFILE5, ALTROFILE6)');
  fQ.SQL.Add(' VALUES (:P_NOMEFILE, :P_FILEPATH, :P_VERSIONE, :P_CONTENUTO, ''INI'', :P_ALTROFILE1, :P_ALTROFILE2, :P_ALTROFILE3, :P_ALTROFILE4, :P_ALTROFILE5, :P_ALTROFILE6)');
  fQ.Prepare;
  // Impostazione dei parametri
  fQ.Params.ParamByName('P_NOMEFILE').AsString := FileNameNoExt;
  fQ.Params.ParamByName('P_FILEPATH').AsString := Azienda;
  fQ.Params.ParamByName('P_VERSIONE').AsInteger := DatabaseFileVersion;
  fQ.Params.ParamByName('P_CONTENUTO').LoadFromFile(FullLocalFileName);
  // Se sono impostati i nomi degli altri files carica anche questi se esistono
  if (OtherFileName1 <> '') and (FileExists(FullPathOtherFileName1)) then fQ.Params.ParamByName('P_ALTROFILE1').LoadFromFile(FullPathOtherFileName1);
  if (OtherFileName2 <> '') and (FileExists(FullPathOtherFileName2)) then fQ.Params.ParamByName('P_ALTROFILE2').LoadFromFile(FullPathOtherFileName2);
  if (OtherFileName3 <> '') and (FileExists(FullPathOtherFileName3)) then fQ.Params.ParamByName('P_ALTROFILE3').LoadFromFile(FullPathOtherFileName3);
  if (OtherFileName4 <> '') and (FileExists(FullPathOtherFileName4)) then fQ.Params.ParamByName('P_ALTROFILE4').LoadFromFile(FullPathOtherFileName4);
  if (OtherFileName5 <> '') and (FileExists(FullPathOtherFileName5)) then fQ.Params.ParamByName('P_ALTROFILE5').LoadFromFile(FullPathOtherFileName5);
  if (OtherFileName6 <> '') and (FileExists(FullPathOtherFileName6)) then fQ.Params.ParamByName('P_ALTROFILE6').LoadFromFile(FullPathOtherFileName6);
  // Esegue l'inserimento
  fQ.ExecSQL;
end;


// Procedura che verifica l'esistenza pregressa dei files extra e li rinomina per non correre il riscio di perderli
procedure TRepositoryFile.BackupExtraFiles;
var
  TmpStr: String;
begin
  if (OtherFileName1 <> '') and (fQ.FieldByName('ALTROFILE1').IsNotNull) then begin
    TmpStr := AziendaDir + 'OLD_' + OtherFileName1;
    if not FileExists(TmpStr) then RenameFile(FullPathOtherFileName1, TmpStr);
  end;

  if (OtherFileName2 <> '') and (fQ.FieldByName('ALTROFILE2').IsNotNull) then begin
    TmpStr := AziendaDir + 'OLD_' + OtherFileName2;
    if not FileExists(TmpStr) then RenameFile(FullPathOtherFileName2, TmpStr);
  end;

  if (OtherFileName3 <> '') and (fQ.FieldByName('ALTROFILE3').IsNotNull) then begin
    TmpStr := AziendaDir + 'OLD_' + OtherFileName3;
    if not FileExists(TmpStr) then RenameFile(FullPathOtherFileName3, TmpStr);
  end;

  if (OtherFileName4 <> '') and (fQ.FieldByName('ALTROFILE4').IsNotNull) then begin
    TmpStr := AziendaDir + 'OLD_' + OtherFileName4;
    if not FileExists(TmpStr) then RenameFile(FullPathOtherFileName4, TmpStr);
  end;

  if (OtherFileName5 <> '') and (fQ.FieldByName('ALTROFILE5').IsNotNull) then begin
    TmpStr := AziendaDir + 'OLD_' + OtherFileName5;
    if not FileExists(TmpStr) then RenameFile(FullPathOtherFileName5, TmpStr);
  end;

  if (OtherFileName6 <> '') and (fQ.FieldByName('ALTROFILE6').IsNotNull) then begin
    TmpStr := AziendaDir + 'OLD_' + OtherFileName6;
    if not FileExists(TmpStr) then RenameFile(FullPathOtherFileName6, TmpStr);
  end;
end;


procedure TRepositoryFile.LoadDatabaseFileToLocal;
begin
  // Imposta la query per il download del file dal database a locale
  if fQ.Active then fQ.Close;
  fQ.SQL.Clear;
  fQ.SQL.Add('SELECT FIRST 1 CONTENUTO, ALTROFILE1, ALTROFILE2, ALTROFILE3, ALTROFILE4, ALTROFILE5, ALTROFILE6 FROM REPOSITORY WHERE NOMEFILE = ' + QuotedStr(FileNameNoExt) + ' AND FILEPATH = ' + QuotedStr(Azienda));
  fQ.Open;
  try
    // Verifica di aver trovato qualcosa
    if fQ.Eof then raise Exception.Create('Repository - File non trovato nel repository.');

    // Salva il file principale in locale
    fQ.FieldByName('CONTENUTO').SaveToFile(FullLocalFileName);

    // Copia di sicurezza dei files extra per evitare perdite di dati
    BackupExtraFiles;

    // Salva anche gli eventuali altri files memorizzati insieme al file principale
    if (OtherFileName1 <> '') and (fQ.FieldByName('ALTROFILE1').IsNotNull)
      then fQ.FieldByName('ALTROFILE1').SaveToFile(FullPathOtherFileName1);
    if (OtherFileName2 <> '') and (fQ.FieldByName('ALTROFILE2').IsNotNull)
      then fQ.FieldByName('ALTROFILE2').SaveToFile(FullPathOtherFileName2);
    if (OtherFileName3 <> '') and (fQ.FieldByName('ALTROFILE3').IsNotNull)
      then fQ.FieldByName('ALTROFILE3').SaveToFile(FullPathOtherFileName3);
    if (OtherFileName4 <> '') and (fQ.FieldByName('ALTROFILE4').IsNotNull)
      then fQ.FieldByName('ALTROFILE4').SaveToFile(FullPathOtherFileName4);
    if (OtherFileName5 <> '') and (fQ.FieldByName('ALTROFILE5').IsNotNull)
      then fQ.FieldByName('ALTROFILE5').SaveToFile(FullPathOtherFileName5);
    if (OtherFileName6 <> '') and (fQ.FieldByName('ALTROFILE6').IsNotNull)
      then fQ.FieldByName('ALTROFILE6').SaveToFile(FullPathOtherFileName6);
  finally
    fQ.Close;
  end;
end;

// Questa procedura viene utilizzata per caricare automaticamente per la prima volta
//  il layouts.ini originario nella tabella del repository nel caso tale file ancora non fosse
//  per nulla presente. In questo modo quando il programma si avvia per la prima volta dopo
//  l'aggiornamento tutto il primo caricamento del layouts.ini avviene automaticamente.
procedure TRepositoryFile.LoadLocalOriginalFileToDatabase;
var
  TmpStr: String;
begin
  // Verifica la presenza del file
//  if not FileExists(OriginalFullFileName) then raise Exception.Create('File originario: "' + OriginalFileNameWithExt + '", non trovato.');
  if not FileExists(OriginalFullFileName) then
    Exit;
  // Imposta la query per l'inserimento del file nel database
  if fQ.Active then fQ.Close;
  fQ.SQL.Clear;
  fQ.SQL.Add('INSERT INTO REPOSITORY (NOMEFILE, FILEPATH, VERSIONE, CONTENUTO, TIPOFILE, ALTROFILE1, ALTROFILE2, ALTROFILE3, ALTROFILE4, ALTROFILE5, ALTROFILE6)');
  fQ.SQL.Add(' VALUES (:P_NOMEFILE, :P_FILEPATH, 1, :P_CONTENUTO, ''INI'', :P_ALTROFILE1, :P_ALTROFILE2, :P_ALTROFILE3, :P_ALTROFILE4, :P_ALTROFILE5, :P_ALTROFILE6)');
  fQ.Prepare;
  // Impostazione dei parametri
  fQ.Params.ParamByName('P_NOMEFILE').AsString := FileNameNoExt;
  fQ.Params.ParamByName('P_FILEPATH').AsString := Azienda;
  fQ.Params.ParamByName('P_CONTENUTO').LoadFromFile(OriginalFullFileName);
  // Se sono impostati i nomi degli altri files carica anche questi se esistono
  if (OtherFileName1 <> '') and (FileExists(OriginalFullPathOtherFileName1)) then fQ.Params.ParamByName('P_ALTROFILE1').LoadFromFile(OriginalFullPathOtherFileName1);
  if (OtherFileName2 <> '') and (FileExists(OriginalFullPathOtherFileName2)) then fQ.Params.ParamByName('P_ALTROFILE2').LoadFromFile(OriginalFullPathOtherFileName2);
  if (OtherFileName3 <> '') and (FileExists(OriginalFullPathOtherFileName3)) then fQ.Params.ParamByName('P_ALTROFILE3').LoadFromFile(OriginalFullPathOtherFileName3);
  if (OtherFileName4 <> '') and (FileExists(OriginalFullPathOtherFileName4)) then fQ.Params.ParamByName('P_ALTROFILE4').LoadFromFile(OriginalFullPathOtherFileName4);
  if (OtherFileName5 <> '') and (FileExists(OriginalFullPathOtherFileName5)) then fQ.Params.ParamByName('P_ALTROFILE5').LoadFromFile(OriginalFullPathOtherFileName5);
  if (OtherFileName6 <> '') and (FileExists(OriginalFullPathOtherFileName6)) then fQ.Params.ParamByName('P_ALTROFILE6').LoadFromFile(OriginalFullPathOtherFileName6);
  // Esegue l'inserimento
  fQ.ExecSQL;
end;


function  TRepositoryFile.PadR(StrIn, PadChar:String; Lungh:Integer):String;
var
   Contatore:Integer;
begin
   // Aggiunge alla SINISTRA della stringa ricevuta tanti caratteri PadChar fino ad arrivare alla lunghezza specificata in Lungh
   for Contatore := Length(StrIn) to Lungh-1 do begin
      StrIn := PadChar + StrIn;
   end;
   Result := StrIn;
end;


function  TRepositoryFile.SlashFinale(DirToCtrl:String): String;     // Personale
begin
   Result := DirToCtrl;
   if Result[Length(Result)] <> '\' then Result := Result + '\';
end;


function TRepositoryFile.GetFullLocalFileName: String;
begin
  // Inizializzazione
  Result := '';
  // Verifica correttezza campi e proprietà
  if Trim(FileDir) = '' then raise Exception.Create('Repository - Proprietà "FileDir" non valida.');
  if Trim(FileNameNoExt) = '' then raise Exception.Create('Repository - Proprietà "FileNameNoExt" non valida.');
  // Se il repository è abilitato ritorna il nome di file completo con l'estensione contenente la versione
  if not fForceLocal then begin
    Result := AziendaDir + FileNameNoExt + '.' + CurrentFileVersionStr;
  // Se invece il repository è disabilitato ritorna il nome del file
  //  originario in modo che ogni postazione possa avere un layouts.ini diverso (come era una volta)
  end else begin
    Result := FileDir + OriginalFileNameWithExt;
  end;
end;

function TRepositoryFile.GetOriginalFullFileName: String;
begin
  // Inizializzazione
  Result := '';
  // Verifica correttezza campi e proprietà
  if Trim(OriginalFileDir) = '' then raise Exception.Create('Repository - Proprietà "OriginalFileDir" non valida.');
  if Trim(OriginalFileNameWithExt) = '' then raise Exception.Create('Repository - Proprietà "OriginalFileNameWithExt" non valida.');
  // Se il repository è abilitato ritorna il nome di file completo con l'estensione contenente la versione
  if not fForceLocal then begin
    Result := OriginalAziendaDir + OriginalFileNameWithExt;
  // Se invece il repository è disabilitato ritorna il nome del file
  //  originario in modo che ogni postazione possa avere un layouts.ini diverso (come era una volta)
  end else begin
    Result := OriginalFileDir + OriginalFileNameWithExt;
  end;
end;





function TRepositoryFile.GetCurrentFileVersionStr: String;
begin
  Result := PadR(IntToStr(fCurrentFileVersion), '0', 3);
end;

procedure TRepositoryFile.SetFileDir(const Value: String);
begin
  fFileDir := SlashFinale(Value);
end;

procedure TRepositoryFile.SetIB_Connection(const Value: TIB_Connection);
begin
  fIB_Connection := Value;
  fQ.IB_Connection := fIB_Connection;
end;

constructor TRepositoryFile.Create;
begin
  inherited Create;
  // Inizializzazione
  fForceLocal := False;
  // Crea l'oggetto query
  fQ := TIB_Cursor.Create(nil);
end;

destructor TRepositoryFile.Destroy;
begin
  inherited;
  // Distrugge l'oggetto query
  fQ.Free;
end;

function TRepositoryFile.GetDbFileVersion: Integer;
begin
  Result := -1;
  if fQ.Active then fQ.Close;
  fQ.SQL.Clear;
  fQ.SQL.Add('SELECT FIRST 1 VERSIONE FROM REPOSITORY WHERE NOMEFILE = ' + QuotedStr(FileNameNoExt) + ' AND FILEPATH = ' + QuotedStr(Azienda));
  fQ.Open;
  try
    if fQ.Eof then Exit;
    if fQ.Fields[0].IsNotNull then Result := fQ.Fields[0].AsInteger else Result := 0;
  finally
    fQ.Close;
  end;
end;

function TRepositoryFile.GetLocalFileVersion: Integer;
var
  sr: TSearchRec;
  HigherVer, CurrVer: Integer;
  Tmp: String;
begin
  // Inizializzazione
  HigherVer := 0;
  // Cerca il primo file nella directory specificata con il nome specificato e qualunque
  //  estensione abbia (perchè l'estensione  indica la versione)
  if FindFirst(AziendaDir+FileNameNoExt+'.*', faAnyFile, sr) = 0 then begin
    //  Cicla per tutti gli eventuali files trovati
    repeat
      // Ricava il nome del file
      Tmp := sr.Name;
      // Estrae l'estensione del file che indica la versione (NB: Compreso il punto)
      Tmp := ExtractFileExt(Tmp);
      // Elimina il punto dall'estensione
      Tmp := RightStr(Tmp, Length(Tmp)-1);
      // Ricava la versione del file attuale in versione numerica
      if not TryStrToInt(Tmp, CurrVer) then CurrVer := 0;
      // Se la versione del file attuale è maggiore della versione più
      //  alta trovata finora, aggiorna tale valore
      if CurrVer > HigherVer then HigherVer := CurrVer;
    // Avanti il prossimo
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  // Se tutto è andato bene e senza errori imposta il valore da ritornare
  Result := HigherVer;
end;



procedure TRepositoryFile.SetAzienda(const Value: String);
begin
  fAzienda := Trim(Value);
end;

procedure TRepositoryFile.SetOtherFileName1(const Value: String);
begin
  fOtherFileName1 := Trim(Value);
end;

procedure TRepositoryFile.SetOtherFileName2(const Value: String);
begin
  fOtherFileName2 := Trim(Value);
end;

procedure TRepositoryFile.SetOtherFileName3(const Value: String);
begin
  fOtherFileName3 := Trim(Value);
end;

procedure TRepositoryFile.SetOtherFileName4(const Value: String);
begin
  fOtherFileName4 := Trim(Value);
end;

procedure TRepositoryFile.SetOtherFileName5(const Value: String);
begin
  fOtherFileName5 := Trim(Value);
end;

procedure TRepositoryFile.SetOtherFileName6(const Value: String);
begin
  fOtherFileName6 := Trim(Value);
end;

function TRepositoryFile.GetOtherFileName1: String;
begin
  Result := '';
  if OtherFileName1='' then Exit;
  Result := AziendaDir + OtherFileName1;
end;

function TRepositoryFile.GetOtherFileName2: String;
begin
  Result := '';
  if OtherFileName2='' then Exit;
  Result := AziendaDir + OtherFileName2;
end;

function TRepositoryFile.GetOtherFileName3: String;
begin
  Result := '';
  if OtherFileName3='' then Exit;
  Result := AziendaDir + OtherFileName3;
end;

function TRepositoryFile.GetOtherFileName4: String;
begin
  Result := '';
  if OtherFileName4='' then Exit;
  Result := AziendaDir + OtherFileName4;
end;

function TRepositoryFile.GetOtherFileName5: String;
begin
  Result := '';
  if OtherFileName5='' then Exit;
  Result := AziendaDir + OtherFileName5;
end;

function TRepositoryFile.GetOtherFileName6: String;
begin
  Result := '';
  if OtherFileName6='' then Exit;
  Result := AziendaDir + OtherFileName6;
end;

function TRepositoryFile.GetOriginalOtherFileName1: String;
begin
  Result := '';
  if OtherFileName1='' then Exit;
  Result := OriginalAziendaDir + OtherFileName1;
end;

function TRepositoryFile.GetOriginalOtherFileName2: String;
begin
  Result := '';
  if OtherFileName2='' then Exit;
  Result := OriginalAziendaDir + OtherFileName2;
end;

function TRepositoryFile.GetOriginalOtherFileName3: String;
begin
  Result := '';
  if OtherFileName3='' then Exit;
  Result := OriginalAziendaDir + OtherFileName3;
end;

function TRepositoryFile.GetOriginalOtherFileName4: String;
begin
  Result := '';
  if OtherFileName4='' then Exit;
  Result := OriginalAziendaDir + OtherFileName4;
end;

function TRepositoryFile.GetOriginalOtherFileName5: String;
begin
  Result := '';
  if OtherFileName5='' then Exit;
  Result := OriginalAziendaDir + OtherFileName5;
end;

function TRepositoryFile.GetOriginalOtherFileName6: String;
begin
  Result := '';
  if OtherFileName6='' then Exit;
  Result := OriginalAziendaDir + OtherFileName6;
end;

function TRepositoryFile.GetAziendaDir: String;
begin
  if Azienda = ''
    then Result := FileDir
    else Result := SlashFinale(FileDir + Azienda);
end;

function TRepositoryFile.GetOriginalAziendaDir: String;
begin
  if Azienda = ''
    then Result := OriginalFileDir
    else Result := SlashFinale(OriginalFileDir + Azienda);
end;

procedure TRepositoryFile.SetOriginalFileDir(const Value: String);
begin
  fOriginalFileDir := Trim(Value);
end;

function TRepositoryFile.GetOriginalFileDir: String;
begin
  Result := SlashFinale(fOriginalFileDir);
end;

function TRepositoryFile.GetFileDir: String;
begin
  Result := SlashFinale(fFileDir);
end;

end.
