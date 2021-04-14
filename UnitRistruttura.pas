unit UnitRistruttura;

interface

uses Windows, IB_Components, SysUtils, Classes, IBODataset, IB_Session;

const
  // --------------------------------------------------------------------------
  // Costanti il controllo del PageSize dei database da utilizzare
  // --------------------------------------------------------------------------
  DB_PAGE_SIZE = 8192;

   function  ConnettiDatabase(DBComponent:TIBODatabase; ServerAddress,DBFile,Utente,Pswd:String): Boolean;
   procedure ControllaTabella(TableName,DatabaseName:String; Connection:TIB_COnnection; Ristruttura:Boolean);
   function  ControllaSeNecessitaDiConversioneIVA21(DatabaseName:String; Connection:TIB_COnnection): Boolean;
   function  TableExist(TableName,Database:String; Connessione:TIB_Connection): Boolean;
   procedure CreaTabella(var T:TextFile; MetadataTagName,TableName,Database:String; Connessione:TIB_Connection; CreaTabella,CreaPK,CreaIndici:Boolean);
   function  SearchTableDefinition(var T:TextFile; TableName:String):Boolean;
   procedure GetNextTableQuery(var T:TextFile; SQLText:TStrings);
   function  ControllaStrutturaTabelleDiversa(OldTableName,NewTableName,Database:String; Connessione:TIB_Connection):Boolean;
   procedure CopiaDatiTabella(Source,Dest,Database:String; Connessione:TIB_Connection);
   procedure EliminaTabella(TableName,Database:String; Connessione:TIB_Connection);
   procedure CambiaCharSetDefault(DBComponent:TIBODatabase);
   function  ControllaCharSetDatabase(DBComponent:TIBODatabase) : Boolean;
   function  CheckDatabaseIntegrity(DBUserID,DBPassword,FullPathDatabaseFileName,FirebirdBinDir:String; Verbose:Boolean=True): Boolean;
   function  MendDatabase(DBUserID,DBPassword,FullPathDatabaseFileName,FirebirdBinDir:String; Verbose:Boolean=True): Boolean;
   procedure BackupDatabase(DBUserID,DBPassword,FullPathSourceDatabaseName,FullPathDestBackupFileName,FirebirdBinDir:String);
   procedure RestoreDatabase(DBUserID,DBPassword,FullPathSourceBackupFileName,FullPathDestDatabaseName,FirebirdBinDir:String);
   function  IsCorrectDatabasePageSize(DBComponent:TIBODatabase): Boolean;
   function  SweepDatabase(DBUserID,DBPassword,FullPathDatabaseFileName,FirebirdBinDir:String): Boolean;
   procedure StartDatabaseServer(FirebirdBinDir:String);
   procedure StopDatabaseServer(FirebirdBinDir:String);
   procedure VerificaDatabase(LevGenDbComponent, AziendaDbComponent:TIBODatabase; DBUserID,DBPassword,FullPathDatabaseFileName,FirebirdBinDir:String);


   // Parte per la ristrutturazione dei rapporti giornalieri
   procedure RistRappGiorn_ConvertiInNegativo;
   function  RistRappGiorn_CreaNuovaTestata(DataDoc:TDateTime; RegDoc:String; CodiceSoggetto, CodicePratica:Integer; DataPratica:TDateTime; CodicePraticaIsNull,DataPraticaIsNull:Boolean): Integer;
   procedure RistRappGiorn_SpostaRighiAllaNuovaTestata(OldNumDoc:Integer; OldRegDoc:String; OldDataDoc:TDateTime; OldCodSoggetto:Integer; OldCodCantiere:Integer; OldDataCantiere:TDatetime; CodicePraticaIsNull,DataPraticaIsNull:Boolean; NewNumdoc:Integer);
   procedure RistRappGiorn_ConvertiRapportiGiornalieri;
   procedure RistRappGiorn_EliminaVecchieTestate;
   function  RistRappGiorn_ConversioneNecessaria: Boolean;
   procedure RistRappGiorn_ConvertiTipoDocRighiRappGiorn;

var
   CharSetDaCambiare : Boolean;

implementation

uses DataModule1, main, Dialogs, StrUtils, FormAziende, Controls, Levante.Version.InterfacesAndFactory;


// =============================================================================
// INIZIO - RISTRUTTURAZIONE RAPPORTI GIORNALIERI
// -----------------------------------------------------------------------------
procedure RistRappGiorn_ConvertiRapportiGiornalieri;
var
   Qry: TIB_Cursor;
   GiaInTransazione: Boolean;
   NewDocNum: Integer;
begin
   // Inizializzazione
   Qry := TIB_Cursor.Create(nil);
   DM1.ShowWait('Conversione Rapporti Giornalieri', 'Inizializzazione...');
   try
      // Verifica la necessità o meno della conversione
      if not RistRappGiorn_ConversioneNecessaria then Exit;
      // IMposta la query che ricava l'elenco dei righi da convertire
      Qry.DatabaseName := DM1.DBAzienda.DatabaseName;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT NUMDOC, DATADOC, REGISTRO, CODSOGGETTO, CODCANTIERE, DATACANTIERE FROM');
      Qry.SQL.Add('(');
      Qry.SQL.Add('  SELECT DISTINCT RGR.NUMDOC, RGR.DATADOC, RGR.REGISTRO, RGR.CODSOGGETTO, RGR.CODCANTIERE, RGR.DATACANTIERE');
      Qry.SQL.Add('  FROM RAPGIORNRIGHI RGR WHERE (RGR.TIPODOC = ''Rapp.giorn'' OR RGR.TIPODOC = ''Rapp.giorn.'') AND (RGR.VERSIONE IS NULL) AND RGR.NUMDOC < 0');
      Qry.SQL.Add('  UNION ALL');
      Qry.SQL.Add('  SELECT DISTINCT RGRS.NUMDOC, RGRS.DATADOC, RGRS.REGISTRO, RGRS.CODSOGGETTO, RGRS.CODCANTIERE, RGRS.DATACANTIERE');
      Qry.SQL.Add('  FROM RAPGIORNRIGHISPESE RGRS WHERE (RGRS.TIPODOC = ''Rapp.giorn'' OR RGRS.TIPODOC = ''Rapp.giorn.'') AND (RGRS.VERSIONE IS NULL) AND RGRS.NUMDOC < 0');
      Qry.SQL.Add(')');
      Qry.SQL.Add('ORDER BY 2, 1');
      // Avvia la transazione
      DM1.ShowWait('', 'Avvio transazione...');
      GiaInTransazione := DM1.DBAzienda.InTransaction;
      if not GiaInTransazione then DM1.DBAzienda.StartTransaction;
      try
        // Prima di tutto converte in negativo il numeto di documento dei
        //  rapporti giornalieri che hanno il campo versione indicante che
        //  sono stati creati con una versione vecchia di levante e quindi sono
        //  da convertire.
        DM1.ShowWait('', 'Converti numeri documento in negativo...');
        RistRappGiorn_ConvertiInNegativo;

        // Poi apre la query che conterrà l'elenco dei righi da convertire raggruppati
        //  in modo da distinguere la separazione per documento ma anche per soggetto
        //  e pratica.
        DM1.ShowWait('', 'Apertura query elenco righi da convertire...');
        Qry.Open;

        // Cicla per i righi trovati da convertire
        while not Qry.Eof do begin
          DM1.ShowWait('', 'Elaborazione Rapporto Giornaliero N° ' + Qry.FieldByName('NUMDOC').AsString+Qry.FieldByName('REGISTRO').AsString + ' del ' + Qry.FieldByName('DATADOC').AsString);
          // Crea la nuova testata
          NewDocNum := RistRappGiorn_CreaNuovaTestata(Qry.FieldByName('DATADOC').AsDateTime,
                                                      Qry.FieldByName('REGISTRO').AsString,
                                                      Qry.FieldByName('CODSOGGETTO').AsInteger,
                                                      Qry.FieldByName('CODCANTIERE').AsInteger,
                                                      Qry.FieldByName('DATACANTIERE').AsDateTime,
                                                      Qry.FieldByName('CODCANTIERE').IsNull,
                                                      Qry.FieldByName('DATACANTIERE').IsNull);


          // Sposta tutti i righi alla nuova testata
          RistRappGiorn_SpostaRighiAllaNuovaTestata(Qry.FieldByName('NUMDOC').AsInteger,
                                                    Qry.FieldByName('REGISTRO').AsString,
                                                    Qry.FieldByName('DATADOC').AsDateTime,
                                                    Qry.FieldByName('CODSOGGETTO').AsInteger,
                                                    Qry.FieldByName('CODCANTIERE').AsInteger,
                                                    Qry.FieldByName('DATACANTIERE').AsDateTime,
                                                    Qry.FieldByName('CODCANTIERE').IsNull,
                                                    Qry.FieldByName('DATACANTIERE').IsNull,
                                                    NewDocNum);
          // Avanti al prossimo rigo
          Qry.Next;
        end;

        // Elimina le vecchie  ormai inutili testate
        DM1.ShowWait('', 'Elimina vecchie testate...');
        RistRappGiorn_EliminaVecchieTestate;

        // Se arriva qui tutto è andato bene e quindi effettua il commit
        if not GiaInTransazione then DM1.DBAzienda.Commit;
      except
        // Se arriva qui tutto è andato male e quindi effettua il rollback
        if not GiaInTransazione then DM1.DBAzienda.Rollback;
        // Risolleva l'eccezione
        raise;
      end;
   finally
     DM1.CloseWait;
     if Qry.Active then Qry.Close;
     Qry.Free;
   end;
end;

procedure RistRappGiorn_ConvertiTipoDocRighiRappGiorn;
var
   Qry: TIB_Cursor;
begin
   // Inizializzazione
   Qry := TIB_Cursor.Create(nil);
   try
      // IMposta la query che ricava l'elenco dei righi da convertire
      Qry.DatabaseName := DM1.DBAzienda.DatabaseName;
      Qry.IB_Connection := DM1.DBAzienda;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE RAPGIORNRIGHI SET TIPODOC=''Rapp.giorn.'' WHERE TIPODOC=''Rapp.giorn''');
      Qry.ExecSQL;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE RAPGIORNRIGHISPESE SET TIPODOC=''Rapp.giorn.'' WHERE TIPODOC=''Rapp.giorn''');
      Qry.ExecSQL;

      // Converte anche gli eventuali STATI dei Rapp.Giorn.
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE STATI SET TIPODOCUMENTO=''Rapp.giorn.'' WHERE TIPODOCUMENTO=''Rapp.giorn'' OR TIPODOCUMENTO=''Rapp. giorn.'' OR TIPODOCUMENTO=''Rapp. giorn''');
      Qry.ExecSQL;
   finally
     Qry.Free;
   end;
end;

function RistRappGiorn_ConversioneNecessaria: Boolean;
var
   Qry: TIB_Cursor;
begin
   // Inizializzazione
   Result := True;
   Qry := TIB_Cursor.Create(nil);
   try
      // IMposta la query che ricava l'elenco dei righi da convertire
      Qry.DatabaseName := DM1.DBAzienda.DatabaseName;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT COUNT(*) AS QUANTI FROM RAPGIORN WHERE (VERSIONE IS NULL)');
      Qry.Open;
      Result := (Qry.Fields[0].AsInteger > 0);
   finally
     Qry.Free;
   end;
end;

procedure RistRappGiorn_EliminaVecchieTestate;
var
   Qry: TIB_Cursor;
begin
   // Inizializzazione
   Qry := TIB_Cursor.Create(nil);
   try
      // IMposta la query che ricava l'elenco dei righi da convertire
      Qry.DatabaseName := DM1.DBAzienda.DatabaseName;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('DELETE FROM RAPGIORN RG WHERE (RG.VERSIONE IS NULL) AND RG.NUMDOC < 0');
      Qry.SQL.Add('AND NOT EXISTS (SELECT * FROM RAPGIORNRIGHI RGR WHERE (RGR.TIPODOC=''Rapp.giorn'' OR RGR.TIPODOC=''Rapp.giorn.'') AND RGR.NUMDOC=RG.NUMDOC AND RGR.REGISTRO=RG.REGISTRO AND RGR.DATADOC=RG.DATADOC)');
      Qry.SQL.Add('AND NOT EXISTS (SELECT * FROM RAPGIORNRIGHISPESE RGRS WHERE (RGRS.TIPODOC=''Rapp.giorn'' OR RGRS.TIPODOC=''Rapp.giorn'') AND RGRS.NUMDOC=RG.NUMDOC AND RGRS.REGISTRO=RG.REGISTRO AND RGRS.DATADOC=RG.DATADOC)');
      Qry.ExecSQL;
   finally
     Qry.Free;
   end;
end;

procedure RistRappGiorn_SpostaRighiAllaNuovaTestata(OldNumDoc:Integer; OldRegDoc:String; OldDataDoc:TDateTime; OldCodSoggetto:Integer; OldCodCantiere:Integer; OldDataCantiere:TDatetime; CodicePraticaIsNull,DataPraticaIsNull:Boolean; NewNumdoc:Integer);
var
   Qry: TIB_Cursor;
begin
   // Inizializzazione
   Qry := TIB_Cursor.Create(nil);
   try
      // IMposta lq euery per la creazione della nuova testata
      Qry.DatabaseName := DM1.DBAzienda.DatabaseName;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('UPDATE RAPGIORNRIGHI SET NUMDOC = ' + IntToStr(NewNumdoc) + ', VERSIONE = ' + IntToStr(MainForm.PrgVersion) + ' WHERE');
      Qry.SQL.Add('(TIPODOC = ''Rapp.giorn'') OR (TIPODOC = ''Rapp.giorn.'')');
      Qry.SQL.Add('AND NUMDOC = ' + IntToStr(OldNumDoc));
      Qry.SQL.Add('AND REGISTRO = ''' + OldRegDoc + '''');
      Qry.SQL.Add('AND DATADOC = ''' + FormatDateTime('mm/dd/yyyy', OldDataDoc) + '''');
      Qry.SQL.Add('AND CODSOGGETTO = ' + IntToStr(OldCodSoggetto));

      if CodicePraticaIsNull
        then Qry.SQL.Add('AND CODCANTIERE IS NULL')
        else Qry.SQL.Add('AND CODCANTIERE = ' + IntToStr(OldCodCantiere));

      if DataPraticaIsNull
        then Qry.SQL.Add('AND DATACANTIERE IS NULL')
        else Qry.SQL.Add('AND DATACANTIERE = ''' + FormatDateTime('mm/dd/yyyy', OldDataCantiere) + '''');

      Qry.ExecSQL;
      // ------------------
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE RAPGIORNRIGHISPESE SET NUMDOC = ' + IntToStr(NewNumdoc) + ', VERSIONE = ' + IntToStr(MainForm.PrgVersion) + ' WHERE');
      Qry.SQL.Add('(TIPODOC = ''Rapp.giorn'') OR (TIPODOC = ''Rapp.giorn.'')');
      Qry.SQL.Add('AND NUMDOC = ' + IntToStr(OldNumDoc));
      Qry.SQL.Add('AND REGISTRO = ''' + OldRegDoc + '''');
      Qry.SQL.Add('AND DATADOC = ''' + FormatDateTime('mm/dd/yyyy', OldDataDoc) + '''');
      Qry.SQL.Add('AND CODSOGGETTO = ' + IntToStr(OldCodSoggetto));

      if CodicePraticaIsNull
        then Qry.SQL.Add('AND CODCANTIERE IS NULL')
        else Qry.SQL.Add('AND CODCANTIERE = ' + IntToStr(OldCodCantiere));

      if DataPraticaIsNull
        then Qry.SQL.Add('AND DATACANTIERE IS NULL')
        else Qry.SQL.Add('AND DATACANTIERE = ''' + FormatDateTime('mm/dd/yyyy', OldDataCantiere) + '''');

      Qry.ExecSQL;
   finally
     Qry.Free;
   end;
end;

function RistRappGiorn_CreaNuovaTestata(DataDoc:TDateTime; RegDoc:String; CodiceSoggetto, CodicePratica:Integer; DataPratica:TDateTime; CodicePraticaIsNull,DataPraticaIsNull:Boolean): Integer;
var
   Qry: TIB_Cursor;
   QryCli: TIB_Cursor;
   NuovoCodiceTestata: Integer;
begin
   // Inizializzazione
   Result := -1;
   Qry := TIB_Cursor.Create(nil);
   QryCli := TIB_Cursor.Create(nil);
   try
      // Imposta la query che ricava i dati del soggetto
      QryCli.DatabaseName := DM1.ArcDBFile;
      QryCli.IB_Connection := DM1.DBAzienda;
      QryCli.SQL.Add('SELECT FIRST 1 RagioneSociale, Indirizzo, NumCivico, Citta, CAP, Provincia, PartitaIVA, CodiceFiscale');
      QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + IntToStr(CodiceSoggetto));
      QryCli.Open;
      // RIcava il numero della nuova testata
      NuovoCodiceTestata := DM1.NextCodice('RAPGIORN', 'NUMDOC');
      // IMposta lq euery per la creazione della nuova testata
      Qry.DatabaseName := DM1.DBAzienda.DatabaseName;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('INSERT INTO RAPGIORN (NUMDOC, DATADOC, REGISTRO, CODICECLIENTE, RAGSOCCLI, INDIRIZZOCLI, NUMCIVICOCLI, CITTACLI, CAPCLI, PROVINCIACLI, PARTITAIVACLI, CODICEFISCALECLI, PRATICA, DATAPRATICA1, VERSIONE)');
      Qry.SQL.Add('VALUES (');
      Qry.SQL.Add(IntToStr(NuovoCodiceTestata) + ',');
      Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', DataDoc)) + ',');
      Qry.SQL.Add(QuotedStr(RegDoc) + ',');
      Qry.SQL.Add(IntToStr(CodiceSoggetto) + ',');
      Qry.SQL.Add(QuotedStr(QryCli.FieldByName('RagioneSociale').AsString) + ',');
      Qry.SQL.Add(QuotedStr(QryCli.FieldByName('Indirizzo').AsString) + ',');
      Qry.SQL.Add(QuotedStr(QryCli.FieldByName('NumCivico').AsString) + ',');
      Qry.SQL.Add(QuotedStr(QryCli.FieldByName('Citta').AsString) + ',');
      Qry.SQL.Add(QuotedStr(QryCli.FieldByName('CAP').AsString) + ',');
      Qry.SQL.Add(QuotedStr(QryCli.FieldByName('Provincia').AsString) + ',');
      Qry.SQL.Add(QuotedStr(QryCli.FieldByName('PartitaIVA').AsString) + ',');
      Qry.SQL.Add(QuotedStr(QryCli.FieldByName('CodiceFiscale').AsString) + ',');

      if CodicePraticaIsNull
        then Qry.SQL.Add('NULL,')
        else Qry.SQL.Add(IntToStr(CodicePratica) + ',');

      if DataPraticaIsNull
        then Qry.SQL.Add('NULL,')
        else Qry.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', DataPratica)) + ',');

      Qry.SQL.Add(IntToStr(MainForm.PrgVersion));
      Qry.SQL.Add(')');
      Qry.ExecSQL;
      // Aggiorna il valore da ritornare
      Result := NuovoCodiceTestata;
   finally
     Qry.Free;
     QryCli.Free;
   end;
end;

procedure RistRappGiorn_ConvertiInNegativo;
var
   Qry: TIB_Cursor;
begin
   Qry := TIB_Cursor.Create(nil);
   try
      Qry.DatabaseName := DM1.DBAzienda.DatabaseName;
      Qry.IB_Connection := DM1.DBAzienda;
      // Trasforma le testate dei rapporti giornalieri vecchi convertendo il numero
      //  documento in negativo
      Qry.SQL.Add('UPDATE RAPGIORN RG SET RG.NUMDOC = RG.NUMDOC * (-1) WHERE (RG.VERSIONE IS NULL)');
      Qry.SQL.Add('AND NOT EXISTS (SELECT * FROM RAPGIORNRIGHI RGR WHERE (RGR.TIPODOC=''Rapp.giorn'' OR RGR.TIPODOC=''Rapp.giorn.'') AND RGR.NUMDOC=RG.NUMDOC AND RGR.REGISTRO=RG.REGISTRO AND RGR.DATADOC=RG.DATADOC AND (RGR.VERSIONE IS NOT NULL))');
      Qry.SQL.Add('AND NOT EXISTS (SELECT * FROM RAPGIORNRIGHISPESE RGRS WHERE (RGRS.TIPODOC=''Rapp.giorn'' OR RGRS.TIPODOC=''Rapp.giorn.'')  AND RGRS.NUMDOC=RG.NUMDOC AND RGRS.REGISTRO=RG.REGISTRO AND RGRS.DATADOC=RG.DATADOC AND (RGRS.VERSIONE IS NOT NULL))');
      Qry.ExecSQL;
      // Trasforma i righi ore dipendenti dei rapporti giornalieri vecchi convertendo il numero
      //  documento in negativo
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE RAPGIORNRIGHI SET NUMDOC = NUMDOC * (-1) WHERE (TIPODOC = ''Rapp.giorn'' OR TIPODOC = ''Rapp.giorn.'') AND (VERSIONE IS NULL)');
      Qry.ExecSQL;
      // Trasforma i righi spese dipendenti dei rapporti giornalieri vecchi convertendo il numero
      //  documento in negativo
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE RAPGIORNRIGHISPESE SET NUMDOC = NUMDOC * (-1) WHERE (TIPODOC = ''Rapp.giorn'' OR TIPODOC = ''Rapp.giorn.'') AND (VERSIONE IS NULL)');
      Qry.ExecSQL;
   finally
      Qry.Free;
   end;
end;
// -----------------------------------------------------------------------------
// FINE - RISTRUTTURAZIONE RAPPORTI GIORNALIERI
// =============================================================================



// Procedura che valida, effettua il backup+restore, lo sweep e tutto quello che
//  server per una riparazione/manutenzione del database
procedure VerificaDatabase(LevGenDbComponent, AziendaDbComponent:TIBODatabase; DBUserID,DBPassword,FullPathDatabaseFileName,FirebirdBinDir:String);
var
  WorkInProgressDatabaseName: String;
  BackupFileName: String;
  NomeAzienda: String;
begin
  // Effettua alcuni controlli
  if AziendeForm.CBNoRiparazione.Checked and IsCorrectDatabasePageSize(AziendaDbComponent) then
    Exit;

  DM1.ShowWait('Levante - Manutenzione', 'Inizializzazione...');
  try
    // RIcava il nome dell'azienda pulito (senza path ne extensione)
    NomeAzienda := ExtractFileName(FullPathDatabaseFileName);
    NomeAzienda := LeftStr(NomeAzienda, Length(NomeAzienda)-4);
    // Calcola il nome del file di backup
    BackupFileName := ExtractFilePath(FullPathDatabaseFileName) + NomeAzienda + '_WIP.GBK';
    // Calcola il nome completo di percorso per rinominare il file del database subito dopo
    //  avere fermato il server in modo che al suo riavvio nessuno riesca più
    //  ad accedervi e quindi ci si possa lavorare sopra tranquilli.
    WorkInProgressDatabaseName := ExtractFilePath(FullPathDatabaseFileName) + NomeAzienda + '_WIP.GDB';
    // Verifica che non ci siano già i files _WIP, nel qual caso informa l'utente ed esce
    if FileExists(WorkInProgressDatabaseName) or FileExists(BackupFileName) then begin
      raise Exception.Create('ATTENZIONE!!!'#13#13'Una precedente ristrutturazione dell''azienda "'+NomeAzienda+'" non è andata a buon fine.'#13#13'Sono presenti i files "_WIP" di una ristrutturazione precedente.'#13#13'CHIAMARE IL CENTRO SERVIZI!'#13#13'Operazione annullata.');
    end;
    // Disconnette il database con l'elenco aziende
    DM1.ShowWait('', 'Disconneting from database...');
    LevGenDbComponent.Disconnect;
    AziendaDbComponent.Disconnect;
    try
      try
        // Ferma il database server
        DM1.ShowWait('', 'Stop database server...');
        StopDatabaseServer(FirebirdBinDir);
        DM1.MyProcessMessages;
        Sleep(3000);
        DM1.MyProcessMessages;
        // Rinomina il file dell'azienda in modo da bloccarne l'accesso da parte di chiunque altro
        DM1.ShowWait('', 'Rename database file...');
        if not RenameFile(FullPathDatabaseFileName, WorkInProgressDatabaseName) then raise Exception.Create('Impossibile rinomiare il file...'#13#13'"' + FullPathDatabaseFileName + '"');
      finally
        // Riavvia il database server
        DM1.ShowWait('', 'Start database server...');
        StartDatabaseServer(FirebirdBinDir);
        DM1.MyProcessMessages;
        Sleep(3000);
        DM1.MyProcessMessages;
      end;
      // Effettua la preparazione del database per il successivo backup+restore
      DM1.ShowWait('', 'Verifica e riparazione...');
  //    CheckDatabaseIntegrity(DBUserID, DBPassword, WorkInProgressDatabaseName, FirebirdBinDir, False);
      MendDatabase(DBUserID, DBPassword, WorkInProgressDatabaseName, FirebirdBinDir, False);
      // Backup
      DM1.ShowWait('', 'Backup...');
      BackupDatabase(DBUserID, DBPassword, WorkInProgressDatabaseName, BackupFileName, FirebirdBinDir);
      // Restore
      DM1.ShowWait('', 'Restore...');
      RestoreDatabase(DBUserID, DBPassword, BackupFileName, FullPathDatabaseFileName, FirebirdBinDir);
      // Sweep
      DM1.ShowWait('', 'Sweeping...');
      SweepDatabase(DBUserID, DBPassword, FullPathDatabaseFileName, FirebirdBinDir);
      // Elimina i files _WIP
      //  NB: Solo però se è presente anche il file GDB definitivo altirmenti no
      if not FileExists(FullPathDatabaseFileName) then raise Exception.Create('Il file "' + FullPathDatabaseFileName + '" non è stato trovato'#13#13'Si potrebbe verificare una perdita di dati.'#13#13'CHIAMARE IL CENTRO SERVIZI!');
      DM1.ShowWait('', 'Delete file "' +WorkInProgressDatabaseName+ '"');
      if not DeleteFile(WorkInProgressDatabaseName) then raise Exception.Create('Impossibile eliminare il file "' + WorkInProgressDatabaseName + '"');
      if not DeleteFile(BackupFileName) then raise Exception.Create('Impossibile eliminare il file "' + BackupFileName + '"');
    finally
      // Si riconnette al database dell'elenco aziende
      DM1.ShowWait('', 'Connecting to database...');
      LevGenDbComponent.Connect;
      AziendaDbComponent.Connect;
    end;
  finally
    DM1.CloseWait;
  end;
end;

// Procedura che avvia il database server
procedure StartDatabaseServer(FirebirdBinDir:String);
var
  Command: String;
begin
  Command := FirebirdBinDir + 'instsvc.exe start';
  DM1.WinExecAndWait32(Command, SW_HIDE);
end;

// Procedura che  ferma il database server
procedure StopDatabaseServer(FirebirdBinDir:String);
var
  Command: String;
begin
  Command := FirebirdBinDir + 'instsvc.exe stop';
  DM1.WinExecAndWait32(Command, SW_HIDE);
end;


procedure CambiaCharSetDefault(DBComponent:TIBODatabase);
var
   Qry: TIB_Cursor;
begin
   // Questa procedura effetua una query per cambiare il CharSet di default del database
   // -------------------------------------------------------------------------------------------------------
   // Aggiorna messaggio di stato a video
   DM1.ShowWait('', 'Aggiornamento CharSet Database.');
   // Crea la Qrery
   Qry := TIB_Cursor.Create(nil);
   try
      Qry.DatabaseName := DBComponent.DatabaseName;
      Qry.IB_Connection := DBComponent;
      Qry.SQL.Add('UPDATE RDB$DATABASE SET RDB$CHARACTER_SET_NAME = ''' + DBComponent.CharSet + '''');
      Qry.ExecSQL;
   finally
      Qry.Free;
   end;
end;


function ControllaCharSetDatabase(DBComponent:TIBODatabase) : Boolean;
var
   Qry: TIB_Cursor;
begin
   // Questa funzione controlla che il CharSet del database a cui ci si è appena connessi sia uguale a quello
   //  specificato nel componente Database usato per la connessione stessa e se non lo è imposta un flag
   //  che forza la ristrutturazione di tutte le tabelle dopo aver cambiato il charset di default del
   //  database stesso.
   // -------------------------------------------------------------------------------------------------------
   // Aggiorna messaggio di stato a video
   DM1.ShowWait('', 'Controllo CharSet Database.');
   // Inizializzazione
   Result := False;
   CharSetDaCambiare := False;
   // Crea la Qrery
   Qry := TIB_Cursor.Create(nil);
   try
      Qry.DatabaseName := DBComponent.DatabaseName;
      Qry.IB_Connection := DBComponent;
      // Imposta il costrutto SQL per reperire il CharSet del Database
      Qry.SQL.Add('SELECT RDB$CHARACTER_SET_NAME FROM RDB$DATABASE');
      // Apre il database ed effettua il controllo
      Qry.Open;
      if (not Qry.Eof) then begin
         CharSetDaCambiare := Qry.Fields[0].IsNull or (Qry.Fields[0].Value <> DBComponent.CharSet);
         Result := CharSetDaCambiare;
      end;
      Qry.Close;
   finally
      Qry.Free;
   end;
end;


procedure BackupDatabase(DBUserID,DBPassword,FullPathSourceDatabaseName,FullPathDestBackupFileName,FirebirdBinDir:String);
var
  Command, CommandDaVisualizzare: String;
begin
  // Inizializzazione
  Command := FirebirdBinDir + 'gbak.exe -b -v -g -l -ig -user "SYSDBA" -password "'+DBPassword+'" "'+FullPathSourceDatabaseName+'" "'+FullPathDestBackupFileName+'"';
  // Fa in modo che il comando visualizzato abbia mascherate i nomi utenti e le password
  CommandDaVisualizzare := StringReplace(Command, 'SYSDBA', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, 'th3cla', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, '1DR0GAT3', '***', [rfReplaceAll, rfIgnoreCase]);
  // Azzeramento  e visualizzazione del LogMemo
  AziendeForm.LogMemo.Clear;
  AziendeForm.LogMemo.Align := alClient;
  AziendeForm.LogMemo.Visible := True;
  try
    // Annota l'ora di inizio
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.Add('Levante - Start of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('Command: ' + CommandDaVisualizzare);
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    // Esecuzione del comando
    DM1.ExecuteExternalAppWithPipeRedirectionOnStrings(Command, AziendeForm.LogMemo.Lines);
  finally
    // Salvataggio del log
    AziendeForm.LogMemo.Visible := False;
    // Annota l'ora di fine e salva il log
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    AziendeForm.LogMemo.Lines.Add('Levante - End of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.SaveToFile(ExtractFilePath(FullPathSourceDatabaseName) + 'Log '+FormatDateTime('yyyy_mm_dd hh_nn_ss', Now) + ' Backup.txt');
  end;
end;

procedure RestoreDatabase(DBUserID,DBPassword,FullPathSourceBackupFileName,FullPathDestDatabaseName,FirebirdBinDir:String);
var
  Command, CommandDaVisualizzare: String;
begin
  // Inizializzazione
  Command := FirebirdBinDir + 'gbak.exe -c -v -k -p '+IntToStr(DB_PAGE_SIZE)+' -user "SYSDBA" -password "'+DBPassword+'" "'+FullPathSourceBackupFileName+'" "'+FullPathDestDatabaseName+'"';
  // Fa in modo che il comando visualizzato abbia mascherate i nomi utenti e le password
  CommandDaVisualizzare := StringReplace(Command, 'SYSDBA', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, 'th3cla', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, '1DR0GAT3', '***', [rfReplaceAll, rfIgnoreCase]);
  // Azzeramento  e visualizzazione del LogMemo
  AziendeForm.LogMemo.Clear;
  AziendeForm.LogMemo.Align := alClient;
  AziendeForm.LogMemo.Visible := True;
  try
    // Annota l'ora di inizio
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.Add('Levante - Start of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('Command: ' + CommandDaVisualizzare);
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    // Esecuzione del comando
    DM1.ExecuteExternalAppWithPipeRedirectionOnStrings(Command, AziendeForm.LogMemo.Lines);
  finally
    // Salvataggio del log
    AziendeForm.LogMemo.Visible := False;
    // Annota l'ora di fine e salva il log
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    AziendeForm.LogMemo.Lines.Add('Levante - End of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.SaveToFile(ExtractFilePath(FullPathDestDatabaseName) + 'Log '+FormatDateTime('yyyy_mm_dd hh_nn_ss', Now) + ' Restore.txt');
  end;
end;

function IsCorrectDatabasePageSize(DBComponent:TIBODatabase): Boolean;
begin
  Result := (DBComponent.PageSize = DB_PAGE_SIZE);
end;


// Questa funzione verifica l'integrità del sistema e ritorna True se tutto va bene
//  altrimenti False;
function CheckDatabaseIntegrity(DBUserID,DBPassword,FullPathDatabaseFileName,FirebirdBinDir:String; Verbose:Boolean=True): Boolean;
var
  Command, CommandDaVisualizzare: String;
  i: Integer;
begin
  // Inizializzazione
  Result := False;
  Command := FirebirdBinDir + 'gfix.exe -user "SYSDBA" -password "'+DBPassword+'" "'+FullPathDatabaseFileName+'" -validate -full';
  // Fa in modo che il comando visualizzato abbia mascherate i nomi utenti e le password
  CommandDaVisualizzare := StringReplace(Command, 'SYSDBA', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, 'th3cla', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, '1DR0GAT3', '***', [rfReplaceAll, rfIgnoreCase]);
  // Azzeramento  e visualizzazione del LogMemo
  AziendeForm.LogMemo.Clear;
  AziendeForm.LogMemo.Align := alClient;
  AziendeForm.LogMemo.Visible := True;
  try
    // Annota l'ora di inizio
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.Add('Levante - Start of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('Command: ' + CommandDaVisualizzare);
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    // COmpone il comando gfix in modo che verifichi l'integrita del sistema
    DM1.ExecuteExternalAppWithPipeRedirectionOnStrings(Command, AziendeForm.LogMemo.Lines);
    // Ritorna il risultato
    Result := (AziendeForm.LogMemo.Lines.Count <= 4);
    // Se deve essere muto salta tutto il resto
    if not Verbose then Exit;
    // Se c'è qualche problema visualizza un messaggio con il risultato del GFIX
    if not Result then begin
      Command := 'ATTENZIONE, CI SONO DEI PROBLEMI !!!'#13#13#13'*** Comando eseguito ***'#13 + CommandDaVisualizzare + #13#13#13'*** Risultato ***';
      for i := 0 to AziendeForm.LogMemo.Lines.Count -1 do begin
        Command := Command + #13 + AziendeForm.LogMemo.Lines[i];
      end;
      ShowMessage(Command);
    end else begin
      ShowMessage('Il database è corretto.');
    end;
  finally
    // Salvataggio del log
    AziendeForm.LogMemo.Visible := False;
    // Annota l'ora di fine e salva il log
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    AziendeForm.LogMemo.Lines.Add('Levante - End of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.SaveToFile(ExtractFilePath(FullPathDatabaseFileName) + 'Log '+FormatDateTime('yyyy_mm_dd hh_nn_ss', Now) + ' IntegrityCheck.txt');
  end;
end;

// Questa funzione verifica l'integrità del sistema e ritorna True se tutto va bene
//  altrimenti False;
function MendDatabase(DBUserID,DBPassword,FullPathDatabaseFileName,FirebirdBinDir:String; Verbose:Boolean=True): Boolean;
var
  Command, CommandDaVisualizzare: String;
  i: Integer;
begin
  // Inizializzazione
  Command := FirebirdBinDir + 'gfix.exe -m -i -user "SYSDBA" -password "'+DBPassword+'" "'+FullPathDatabaseFileName+'"';
  // Fa in modo che il comando visualizzato abbia mascherate i nomi utenti e le password
  CommandDaVisualizzare := StringReplace(Command, 'SYSDBA', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, 'th3cla', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, '1DR0GAT3', '***', [rfReplaceAll, rfIgnoreCase]);
  Result := False;
  // Azzeramento  e visualizzazione del LogMemo
  AziendeForm.LogMemo.Clear;
  AziendeForm.LogMemo.Align := alClient;
  AziendeForm.LogMemo.Visible := True;
  try
    // Annota l'ora di inizio
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.Add('Levante - Start of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('Command: ' + CommandDaVisualizzare);
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    // COmpone il comando gfix in modo che verifichi l'integrita del sistema
    DM1.ExecuteExternalAppWithPipeRedirectionOnStrings(Command, AziendeForm.LogMemo.Lines);
    // Ritorna il risultato
    Result := (AziendeForm.LogMemo.Lines.Count <= 4);
    // Se deve essere muto salta tutto il resto
    if not Verbose then Exit;
    // Se c'è qualche problema visualizza un messaggio con il risultato del GFIX
    if not Result then begin
      Command := 'ATTENZIONE, CI SONO DEI PROBLEMI !!!'#13#13#13'*** Comando eseguito ***'#13 + CommandDaVisualizzare + #13#13#13'*** Risultato ***';
      for i := 0 to AziendeForm.LogMemo.Lines.Count -1 do begin
        Command := Command + #13 + AziendeForm.LogMemo.Lines[i];
      end;
      ShowMessage(Command);
    end else begin
      ShowMessage('Il database è corretto.');
    end;
  finally
    // Salvataggio del log
    AziendeForm.LogMemo.Visible := False;
    // Annota l'ora di fine e salva il log
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    AziendeForm.LogMemo.Lines.Add('Levante - End of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.SaveToFile(ExtractFilePath(FullPathDatabaseFileName) + 'Log '+FormatDateTime('yyyy_mm_dd hh_nn_ss', Now) + ' Mend.txt');
  end;
end;

// Questa funzione verifica l'integrità del sistema e ritorna True se tutto va bene
//  altrimenti False;
function SweepDatabase(DBUserID,DBPassword,FullPathDatabaseFileName,FirebirdBinDir:String): Boolean;
var
  Command, CommandDaVisualizzare: String;
  i: Integer;
begin
  // Inizializzazione
  Command := FirebirdBinDir + 'gfix.exe -user "SYSDBA" -password "'+DBPassword+'" "'+FullPathDatabaseFileName+'" -sweep';
  // Fa in modo che il comando visualizzato abbia mascherate i nomi utenti e le password
  CommandDaVisualizzare := StringReplace(Command, 'SYSDBA', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, 'th3cla', '***', [rfReplaceAll, rfIgnoreCase]);
  CommandDaVisualizzare := StringReplace(CommandDaVisualizzare, '1DR0GAT3', '***', [rfReplaceAll, rfIgnoreCase]);
  Result := False;
  // Azzeramento  e visualizzazione del LogMemo
  AziendeForm.LogMemo.Clear;
  AziendeForm.LogMemo.Align := alClient;
  AziendeForm.LogMemo.Visible := True;
  try
    // Annota l'ora di inizio
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.Add('Levante - Start of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('Command: ' + CommandDaVisualizzare);
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    // COmpone il comando gfix in modo che verifichi l'integrita del sistema
    DM1.ExecuteExternalAppWithPipeRedirectionOnStrings(Command, AziendeForm.LogMemo.Lines);
    // Ritorna il risultato
    Result := (AziendeForm.LogMemo.Lines.Count <= 4);
    // Se c'è qualche problema visualizza un messaggio con il risultato del GFIX
    if not Result then begin
      Command := 'ATTENZIONE, CI SONO DEI PROBLEMI !!!'#13#13#13'*** Comando eseguito ***'#13 + CommandDaVisualizzare + #13#13#13'*** Risultato ***';
      for i := 0 to AziendeForm.LogMemo.Lines.Count -1 do begin
        Command := Command + #13 + AziendeForm.LogMemo.Lines[i];
      end;
      ShowMessage(Command);
    end else begin
      // NB: Se tutto va bene non deve visualizzare nulla
//      ShowMessage('Il database è corretto.');
    end;
  finally
    // Salvataggio del log
    AziendeForm.LogMemo.Visible := False;
    // Annota l'ora di fine e salva il log
    AziendeForm.LogMemo.Lines.Add('---------------------------------------------');
    AziendeForm.LogMemo.Lines.Add('Levante - End of work ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    AziendeForm.LogMemo.Lines.Add('=============================================');
    AziendeForm.LogMemo.Lines.SaveToFile(ExtractFilePath(FullPathDatabaseFileName) + 'Log '+FormatDateTime('yyyy_mm_dd hh_nn_ss', Now) + ' Sweep.txt');
  end;
end;


function ConnettiDatabase(DBComponent:TIBODatabase; ServerAddress,DBFile,Utente,Pswd:String): Boolean;
var
  Qry: TIB_Cursor;
  T: TextFile;
begin
  Result := False;
  // Imposta i parametri per la connessione
  DBComponent.DatabaseName := DBFile;
  DBComponent.Username := Utente;
  DBComponent.Password := Pswd;
  DBComponent.LoginPrompt := False;
  // Se Server address <> 'LOCAL' imposta il protocollo e l'indirizzo del server, altrimenti Protocol := cpLocal
  if ServerAddress <> 'LOCAL' then
  begin
    DBComponent.Protocol := cpTCP_IP;
    DBComponent.Server := ServerAddress;
  end
  else
    DBComponent.Protocol := cpLocal;
  // Crea il database mancante solo se è il server
  // Prima di tutto controlla se il file del database esiste e se non lo trova lo crea nuovo
  if DM1.IsServer and (not LINUX) and (not FileExists(DBFile)) then
  begin
    // Imposta il page size opportuno
    DBComponent.PageSize := DB_PAGE_SIZE;
    // Crea il database
    DBComponent.CreateDatabase;
    // Apre il file che contiene i Metadata delle tabella di levante
    AssignFile(T, DM1.CurrDir + 'levmetadata.' + IntToStr(MainForm.PrgVersionNoBuild));
    Reset(T);
    // Prima di tutto verifica la presenza o meno della definizione della tabella all'interno
    //  del file che contiene i Metadata.
    if SearchTableDefinition(T, 'START GENERATORS') then
    begin
      Qry := TIB_Cursor.Create(nil);
      try
        Qry.DatabaseName := DBComponent.DatabaseName;
        Qry.IB_Connection := DBComponent;
        // Carica la proprietà SQL della Query
        GetNextTableQuery(T, Qry.SQL);
        // Cicla finchè ci sono query da effettuare per la creazione della tabella e degli indici
        while not (DM1.StrLeft(Qry.SQL[0], 5) = '[END]') do begin
           // Esegue la query
           Qry.ExecSQL;
           // Carica la proprietà SQL della query con la prossima query
           GetNextTableQuery(T, Qry.SQL);
        end;
      finally
        Qry.Free;
      end;
    // Se non trova la definizione della tabella visualizza un messaggio
    end
    else
      MessageDlg('ATTENZIONE!!! - Definizione dei DOMINI non trovata nel file Metadata', mtWarning, [mbOK], 0);
    // Chiude il file che contiene i Matadata
    CloseFile(T);
  end;
  // Si connette al database
  DBComponent.Connect;
end;

procedure ControllaTabella(TableName,DatabaseName:String; Connection:TIB_COnnection; Ristruttura:Boolean);
var
   T: TextFile;
   // Flag che indica se la tabella deve essere ristrutturata oppure no.
   TabellaCambiata, NecessitaConversioneIva21: Boolean;
   // Variabile che contiene una eventuale aggiunta ai messaggi a schermo da visualizzare
   //  in determinate e particolari situazioni (conversione IVA da 20 a 21 ad esempio)
   ShowWaitFinalString: String;
begin
  // Inizializzazione
  TabellaCambiata := False;
  NecessitaConversioneIva21 := False;
  // Si assicura che il nome delle tabella sia tutto maiuscolo
  TableName := Uppercase(TableName);
  // Aggiorna messaggio di stato a video
  DM1.ShowWait('Levante', 'Verifica struttura tabella "' + TableName + '"');
  // Apre il file che contiene i Metadata delle tabella di levante
  AssignFile(T, DM1.CurrDir + 'levmetadata.' + IntToStr(MainForm.PrgVersionNoBuild));
  try
    // Si posiziona sempre all'inizio del file
    Reset(T);
    // Prima di tutto controlla se la tabella da controllare esiste del database, perchè nel caso non esista per niente
    //  la crea semplicemente in quanto non c'è nulla da ristrutturare e poi esce.
    if not TableExist(TableName, DatabaseName, Connection) then begin
      DM1.ShowWait('Levante', 'Creazione tabella "' + TableName + '"');
      CreaTabella(T, TableName, TableName, DatabaseName, Connection, True, True, True);
      Exit;
    end;
    //  Se il Flag 'Ristruttura' = False non ristruttura nulla anche se la tabella esiste già in quanto in questo caso
    //   il programma è in esecuzione normale e quindi deve solo creare la tabella nel caso non esista.
    if not Ristruttura then Exit;
    // Prima di procedere con la ristrutturazione della tabella verifica se esiste già la relativa tabella
    //  'TableName_NEW' e se esiste blocca la ristrutturazione della tabella attuale in quanto significa
    //  che una ristrutturazione precedente non è terminata correttamente e quindi la Tabella _NEW esistente
    //  potrebbe contenere dati da recuperare.
    if TableExist(TableName+'_NEW', DatabaseName, Connection) then begin
      DM1.Messaggi('ATTENZIONE !!!',
      'Una precedente ristrutturazione della tabella ''' + TableName + ''' non è andata a buon fine.'#13#13'Non è possibile continuare con la ristrutturazione di questa tabella.'#13#13'Per evitare perdite di dati CHIAMARE IMMEDIATAMENTE IL CENTRO DI ASSISTENZA.',
      'E'' indispensabile chiamare al più presto il centro di assistenza.',
      [mbOK], 0, nil);
      Exit;
    end;
    // Prima di tutto deve creare la nuova versione della tabella in base a quanto impostato dal file
    //  levmetadata.xxx (xxx = versione) con alla fine del nome aggiounta la stringa '_NEW' in modo
    //  da riconoscerla nel caso di dover accedere al database manualmente dopo un problema.
    //  (Crea la tabella appoggio con la nuova struttura e con lo stesso nome della tabella+'_NEW')
    //  NB: Questa tabella serve anche come confronto tra la vecchia versione e la nuova della stessa
    //       tabella in modo da decidere se la tabella debba essere ristrutturata oppure no.
    //       Per questo la deve creare anche con tutti gli indici.
    CreaTabella(T, TableName, TableName+'_NEW', DatabaseName, Connection, True, True, True);
    // Ora deve comparare la struttura della tabella vecchia versione e nuova versione per
    //  verificare se sono identiche oppure no. Se sono identiche non esegue la ristrutturazione
    //  in quanto non necessaria, altrimenti la esegue.
    // NB: Se si è dovuto cambiare il charset di default del database forza la ristrutturazione totale
    //      di tutte le tabelle
    if TableName = 'RIGHIPRV' then NecessitaConversioneIva21 := ControllaSeNecessitaDiConversioneIVA21(DatabaseName, Connection);
    TabellaCambiata := (
                           CharSetDaCambiare
                        or ControllaStrutturaTabelleDiversa(TableName, TableName+'_NEW', DatabaseName, Connection)
                        or ((TableName = 'RIGHIPRV') and NecessitaConversioneIva21)
                       );
    // Elimina la Tabella _NEW e dei suoi indici perchè non serve più
    EliminaTabella(TableName+'_NEW', DatabaseName, Connection);
    // Se la struttura della tabella e dei suoi indici non è cambiato allora esce subito
    if not TabellaCambiata then Exit;
    // Se arriva fino a qui significa che la tabella ha bisogno di essere ristrutturata e quindi
    //  provvede a ristrutturarla

    // =========================================================================
    // INIZIO RISTRUTTURAZIONE TABELLA
    // -------------------------------------------------------------------------

    // Se è necessaria la conversione IVA lo visualizza nei messaggi
    if NecessitaConversioneIva21 then ShowWaitFinalString := ShowWaitFinalString + '   (Conv.IVA)';
    // Crea la tabella con la nuova struttura con alla fine del nome la stringa "_NEW"
    //  ma senza indici e nemmeno la chiave primaria per motivi prestazionali
    DM1.ShowWait('Levante', 'Creazione tabella "' + TableName + '_NEW"' + ShowWaitFinalString);
    CreaTabella(T, TableName, TableName+'_NEW', DatabaseName, Connection, True, False, False);
    // Copia tutti i dati contenuti nella tabella vecchia nella tabella nuova
    DM1.ShowWait('Levante', 'Copia da "' + TableName + '" a "' + TableName + '_NEW"' + ShowWaitFinalString);
    CopiaDatiTabella(TableName, TableName+'_NEW', DatabaseName, Connection);
    // Poi elimina la vecchia tabella
    DM1.ShowWait('Levante', 'Elimina tabella "' + TableName + '"' + ShowWaitFinalString);
    EliminaTabella(TableName, DatabaseName, Connection);
    // Poi crea una nuova tabella (con la nuova struttura e senza il '_NEW' nel nome e senza indici
    DM1.ShowWait('Levante', 'Creazione tabella "' + TableName + '"' + ShowWaitFinalString);
    CreaTabella(T, TableName, TableName, DatabaseName, Connection, True, False, False);
    // CI copia sopra tutti i dati dalla tabella _NEW
    DM1.ShowWait('Levante', 'Copia da "' + TableName + '_NEW" a "' + TableName + '"' + ShowWaitFinalString);
    CopiaDatiTabella(TableName+'_NEW', TableName, DatabaseName, Connection);
    // Dopo aver copiato tutti idati al loro posto ne crea la chiave primaria
    //  (solo questa per motivi prestazionali, poi gli altri indici li crea dopo)
    DM1.ShowWait('Levante', 'Creazione primary key tabella "' + TableName + '"' + ShowWaitFinalString);
    CreaTabella(T, TableName, TableName, DatabaseName, Connection, False, True, False);
    // Procedure che accumula alcune conversioni da fare durante la ristrutturazione soprattutto
    //  alla tabella RighiPRV
    //  Questa provedura viene richiamata dalla funzione "ControllaTabella" prima della creazione
    //  degli indici per motivi prestazionali
    if (TableName = 'RIGHIPRV') then begin
      DM1.ShowWait('Levante', 'Esecuzione script "RESTRUCT_RIGHIPRV_NOIDX"' + ShowWaitFinalString);
      DM1.ConversioniVarieRighiPrvSenzaIndici;
    end;
    // Ora finisce di creare anche gli altri indici della tabella
    DM1.ShowWait('Levante', 'Creazione indici tabella "' + TableName + '"' + ShowWaitFinalString);
    CreaTabella(T, TableName, TableName, DatabaseName, Connection, False, False, True);
    // Elimina la tabella appoggio
    DM1.ShowWait('Levante', 'Elimina tabella "' + TableName + '_NEW"' + ShowWaitFinalString);
    EliminaTabella(TableName+'_NEW', DatabaseName, Connection);

    // -------------------------------------------------------------------------
    // FINE RISTRUTTURAZIONE TABELLA
    // =========================================================================

  finally
    CloseFile(T);
  end;
end;


// Funzione che ritorna true se l'archivio ha bisogno di essere convertito
//  dall'aliquota IVA al 20% a al 21%
function ControllaSeNecessitaDiConversioneIVA21(DatabaseName:String; Connection:TIB_COnnection): Boolean;
var
   Qry:TIB_Cursor;
begin
   // Inizializzazione
   Result := False;
   // Crea le Qrery                            s
   Qry := TIB_Cursor.Create(nil);
   try
     Qry.DatabaseName := DatabaseName;
     Qry.IB_Connection := Connection;
     Qry.SQL.Add('SELECT COUNT(*) AS QUANTI FROM ALIQIVA WHERE CODICEIVA=1 AND ALIQUOTAIVA=21');
     Qry.Open;
     Result := (Qry.Fields[0].AsInteger > 0);
     Qry.Close;
   finally
     Qry.Free;
   end;
end;


procedure EliminaTabella(TableName,Database:String; Connessione:TIB_Connection);
var
   Qry:TIB_Cursor;
begin
   // Crea le Qrery
   Qry := TIB_Cursor.Create(nil);
   Qry.DatabaseName := Database;
   Qry.IB_Connection := Connessione;
   try
      Qry.SQL.Add('DROP TABLE ' + TableName);
      Qry.ExecSQL;
   finally
      Qry.Free;
   end;
end;


function ControllaStrutturaTabelleDiversa(OldTableName,NewTableName,Database:String; Connessione:TIB_Connection):Boolean;
var
   QryNew, QryOld:TIB_Cursor;
   i:Integer;
   NewStr, OldStr:String;
begin
   // Questa funzione controlla se le strutture delle due tabelle ricevute come parametro sono identiche
   //  oppure no.
   // --------------------------------------------------------------------------------------------------
   // Crea gli oggetti qry
   QryNew := TIB_Cursor.Create(nil);
   QryNew.DatabaseName := Database;
   QryNew.IB_Connection := Connessione;
   QryOld := TIB_Cursor.Create(nil);
   QryOld.DatabaseName := Database;
   QryOld.IB_Connection := Connessione;
   try
      // ====================================================================================================
      // Il primo controllo che effettua è quello di verificare quante colonne hanno la vecchia e la
      //  nuova tabella, perchè è ovvio che nel caso il loro numero non sia uguale la struttura è cambiata.
      // ----------------------------------------------------------------------------------------------------
      // Imposta le Qry in modo da ritornare il numero di colonne delle tabelle
      QryNew.SQL.Add('SELECT COUNT(*) FROM RDB$RELATION_FIELDS WHERE RDB$RELATION_NAME = ''' + NewTableName + '''');
      QryNew.Open;
      QryOld.SQL.Add('SELECT COUNT(*) FROM RDB$RELATION_FIELDS WHERE RDB$RELATION_NAME = ''' + OldTableName + '''');
      QryOld.Open;
      // Effettua la comparazione del numero di colonne contenuto nelle due tabelle
      Result := QryNew.Fields[0].AsInteger <> QryOld.Fields[0].AsInteger;
      // Chiude la query
      QryNew.Close;
      QryOld.Close;
      // ====================================================================================================

      // ====================================================================================================
      // Ora controlla se la struttura delle due tabelle è identica oppure no
      // ----------------------------------------------------------------------------------------------------
      // Solo se al  controllo precedente non sono state trovate differenze
      if not Result then begin
         // COmpone le istruzioni query per il prelevamente dei dati sulla struttura della tabella
         QryNew.SQL.Clear;
         QryNew.SQL.Add('SELECT RF.RDB$FIELD_NAME, F.RDB$FIELD_TYPE, F.RDB$FIELD_LENGTH, F.RDB$CHARACTER_LENGTH, F.RDB$FIELD_PRECISION,');
         QryNew.SQL.Add(' F.RDB$FIELD_SCALE, F.RDB$FIELD_SUB_TYPE, F.RDB$NULL_FLAG, F.RDB$COLLATION_ID, F.RDB$CHARACTER_SET_ID,');
         QryNew.SQL.Add(' RF.RDB$FIELD_POSITION, RF.RDB$NULL_FLAG, RF.RDB$COLLATION_ID');
         QryNew.SQL.Add('FROM RDB$RELATION_FIELDS RF');
         QryNew.SQL.Add('LEFT JOIN RDB$FIELDS F ON (F.RDB$FIELD_NAME = RF.RDB$FIELD_SOURCE)');
         QryNew.SQL.Add('WHERE RF.RDB$RELATION_NAME = ''' + NewTableName + '''');
         QryNew.SQL.Add('ORDER BY RF.RDB$FIELD_POSITION');
         QryNew.Open;

         QryOld.SQL.Clear;
         QryOld.SQL.Add('SELECT RF.RDB$FIELD_NAME, F.RDB$FIELD_TYPE, F.RDB$FIELD_LENGTH, F.RDB$CHARACTER_LENGTH, F.RDB$FIELD_PRECISION,');
         QryOld.SQL.Add(' F.RDB$FIELD_SCALE, F.RDB$FIELD_SUB_TYPE, F.RDB$NULL_FLAG, F.RDB$COLLATION_ID, F.RDB$CHARACTER_SET_ID,');
         QryOld.SQL.Add(' RF.RDB$FIELD_POSITION, RF.RDB$NULL_FLAG, RF.RDB$COLLATION_ID');
         QryOld.SQL.Add('FROM RDB$RELATION_FIELDS RF');
         QryOld.SQL.Add('LEFT JOIN RDB$FIELDS F ON (F.RDB$FIELD_NAME = RF.RDB$FIELD_SOURCE)');
         QryOld.SQL.Add('WHERE RF.RDB$RELATION_NAME = ''' + OldTableName + '''');
         QryOld.SQL.Add('ORDER BY RF.RDB$FIELD_POSITION');
         QryOld.Open;

         // Cicla per tutti i record trovati che descrivono la struttura delle due tabelle...
         while (not QryNew.Eof) and (not Result) do begin
            // Inizializza l'indice che servirà per ciclare per tutti i campi delle due query.
            i := 0;
            // Cicla per tutti i campi oppure finchè non viene trovata una differenza
            while (i < QryNew.Fields.ColumnCount) and (not Result) do begin
               // Esegue la comparazione del campo corrente del record corrente
               //  e assegna al valore da ritornare il risultato della comparazione stessa
               Result := QryNew.Fields[i].Value <> QryOld.Fields[i].Value;
               // Incrementa l'indice per passare al campo successivo
               Inc(i, 1);
            end;
            // Si sposta sul prossimo record da controllare
            QryNew.Next;
            QryOld.Next;
         end;
      end;
      // ====================================================================================================

      // ====================================================================================================
      // Ora controlla se gli indici delle due tabella sono uguali oppure no
      // ----------------------------------------------------------------------------------------------------
      // Solo se al  controllo precedente non sono state trovate differenze
      if not Result then begin
         // COmpone le istruzioni query per il prelevamente dei dati sulla struttura della tabella
         QryNew.SQL.Clear;
         QryNew.SQL.Add('SELECT I.RDB$INDEX_NAME, S.RDB$FIELD_NAME, S.RDB$FIELD_POSITION');
         QryNew.SQL.Add('FROM RDB$INDICES I');
         QryNew.SQL.Add('JOIN RDB$INDEX_SEGMENTS S ON (S.RDB$INDEX_NAME = I.RDB$INDEX_NAME)');
         QryNew.SQL.Add('WHERE I.RDB$RELATION_NAME = ''' + NewTableName + '''');
         QryNew.SQL.Add('ORDER BY I.RDB$INDEX_NAME, S.RDB$FIELD_POSITION');
         QryNew.Open;

         QryOld.SQL.Clear;
         QryOld.SQL.Add('SELECT I.RDB$INDEX_NAME, S.RDB$FIELD_NAME, S.RDB$FIELD_POSITION');
         QryOld.SQL.Add('FROM RDB$INDICES I');
         QryOld.SQL.Add('JOIN RDB$INDEX_SEGMENTS S ON (S.RDB$INDEX_NAME = I.RDB$INDEX_NAME)');
         QryOld.SQL.Add('WHERE I.RDB$RELATION_NAME = ''' + OldTableName + '''');
         QryOld.SQL.Add('ORDER BY I.RDB$INDEX_NAME, S.RDB$FIELD_POSITION');
         QryOld.Open;

         // Cicla per tutti i record trovati che descrivono la struttura delle due tabelle...
         while (not QryNew.Eof) and (not Result) do begin
            // Verifica il nome dell'indice corrente considerando solo i caratteri dopo il
            //  primo carattere '_'
            NewStr := QryNew.Fields[0].AsString;
            OldStr := QryOld.Fields[0].AsString;
            Result := DM1.RitornaTestoPrimaDi('_', NewStr, False) <> DM1.RitornaTestoPrimaDi('_', OldStr, False);
            if not Result then begin
              // Inizializza l'indice che servirà per ciclare per tutti i campi delle due query.
              i := 1;
              // Cicla per tutti i campi oppure finchè non viene trovata una differenza
              while (i < QryNew.Fields.ColumnCount) and (not Result) do begin
                 // Esegue la comparazione del campo corrente del record corrente
                 //  e assegna al valore da ritornare il risultato della comparazione stessa
                 Result := QryNew.Fields[i].Value <> QryOld.Fields[i].Value;
                 // Incrementa l'indice per passare al campo successivo
                 Inc(i, 1);
              end;
              // Si sposta sul prossimo record da controllare
              QryNew.Next;
              QryOld.Next;
            end;
         end;
      end;
      // ====================================================================================================
   finally
      QryNew.Close;
      QryNew.Free;
      QryOld.Close;
      QryOld.Free;
   end;
end;


procedure CopiaDatiTabella(Source,Dest,Database:String; Connessione:TIB_Connection);
var
   Qry: TIB_Cursor;
   SourceFieldList,DestFieldList: TStrings;
   i:Integer;
begin
   // Questa procedure effettuerà una copia di tutti i dati dalla tabella Origine (Source) alla tabella Destinazione
   //  (Dest) facendo attenzione a copiare solo i campi presenti in entrambe con lo stesso nome.
   // ---------------------------------------------------------------------------------------------------------------
   // Crea le Qrery
   Qry := TIB_Cursor.Create(nil);
   Qry.DatabaseName := Database;
   Qry.IB_Connection := Connessione;
   // Crea la lista dei campi della vecchia tabella e della nuova tabella
   SourceFieldList := TStringList.Create;
   DestFieldList := TStringList.Create;
   try
      // IMposta la query che preleverà l'elenco dei campi della tabella sorgente
      //  NB: La verifica che "RDB$UPDATE_FLAG=1" server per lasciare fuori i campi calcolati
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS WHERE UPPER(RDB$RELATION_NAME) = ''' + Source + ''' AND RDB$FIELD_NAME NOT LIKE ''COMPUTED_%''');
      Qry.Open;
      // Se viene trovato almeno un record (cioè un campo) effettua il caricamenteo dell'elenco dei campi nella lista apposita
      if not Qry.Eof then while not Qry.Eof do begin SourceFieldList.Add(Uppercase(Qry.FieldByName('RDB$FIELD_NAME').AsString)); Qry.Next; end;
      Qry.Close;

      // IMposta la query che preleverà l'elenco dei campi della tabella destinazione
      //  NB: La verifica che "RDB$UPDATE_FLAG=1" server per lasciare fuori i campi calcolati
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS WHERE UPPER(RDB$RELATION_NAME) = ''' + Dest + ''' AND RDB$FIELD_NAME NOT LIKE ''COMPUTED_%''');
      Qry.Open;
      // Se viene trovato almeno un record (cioè un campo) effettua il caricamenteo dell'elenco dei campi nella lista apposita
      if not Qry.Eof then while not Qry.Eof do begin DestFieldList.Add(Uppercase(Qry.FieldByName('RDB$FIELD_NAME').AsString)); Qry.Next; end;
      Qry.Close;

      // Continua solo se entrambe le liste di campi contengono almeno un campo (altrimenti non ci sarebbe nulla da copiare)
      if (SourceFieldList.Count > 0) and (DestFieldList.Count > 0) then begin
         // Imposta la query che effettuerà il passaggio di tutti i dati dalla tabella vecchia versione a quella di appoggio
         Qry.SQL.Clear;
         Qry.SQL.Add('INSERT INTO ' + Dest);
         Qry.SQL.Add('(');
         // Cicla per inserire l'elenco dei campi nella query
         for i := 0 to DestFieldList.Count - 1 do begin
            // Se il campo è presente sia nella tabella nuova che in quella vecchia, lo inserisce nella query
            // NB: Gli eventuali campi COMPUTED (calcolati) ovviamente non deve copiarli
            if (SourceFieldList.IndexOf(DestFieldList[i]) > -1) and (Uppercase(LeftStr(DestFieldList[i],9)) <> 'COMPUTED_')
              then Qry.SQL.Add(DestFieldList[i] + ',')
         end;
         // Toglie l'ultima virgola
         Qry.SQL[Qry.SQL.Count-1] := DM1.StrLeft(Qry.SQL[Qry.SQL.Count-1], Length(Qry.SQL[Qry.SQL.Count-1]) -1);
         // Chiude la parentesi
         Qry.SQL.Add(')');
         Qry.SQL.Add('SELECT');
         // Cicla per inserire l'elenco dei campi nella query
         for i := 0 to DestFieldList.Count - 1 do begin
            // Se il campo è presente sia nella tabella nuova che in quella vecchia, lo inserisce nella query
            // NB: Gli eventuali campi COMPUTED (calcolati) ovviamente non deve copiarli
            if (SourceFieldList.IndexOf(DestFieldList[i]) > -1) and (Uppercase(LeftStr(DestFieldList[i],9)) <> 'COMPUTED_')
              then Qry.SQL.Add(DestFieldList[i] + ',')
         end;
         // Toglie l'ultima virgola
         Qry.SQL[Qry.SQL.Count-1] := DM1.StrLeft(Qry.SQL[Qry.SQL.Count-1], Length(Qry.SQL[Qry.SQL.Count-1]) -1);
         Qry.SQL.Add('FROM ' + Source);
         // Esegue la query per il trasferimento dei dati
         Qry.ExecSQL;
      end;
   finally
      // Distrugge Qry
      Qry.Free;
      // Distrugge le liste
      SourceFieldList.Free;
      DestFieldList.Free;
   end;
end;



function TableExist(TableName,Database:String; Connessione:TIB_Connection): Boolean;
var
   Qry: TIB_Cursor;
begin
   // Crea la Qrery
   Qry := TIB_Cursor.Create(nil);
   try
      Qry.DatabaseName := Database;
      Qry.IB_Connection := Connessione;
      // IL nome tabella deve essere sicuramente tutto maiuscolo
      TableName := UpperCase(TableName);
      // Controlla la presenza della tabella nel database
      Qry.SQL.Add('SELECT COUNT(*) as EXIST FROM RDB$RELATIONS WHERE UPPER(RDB$RELATION_NAME) = ''' + TableName + '''');
      Qry.Open;
      // Restituisce il risultato
      Result := (Qry.FieldByName('EXIST').AsInteger > 0);
   finally
      Qry.Close;
      Qry.Free;
   end;
end;


{
procedure CreaTabella(var T:TextFile; MetadataTagName,TableName,Database:String; Connessione:TIB_Connection);
var
   Qry: TIB_Cursor;
   i: Integer;
begin
   // Aggiorna messaggio di stato a video
   DM1.ShowWait('', 'Creazione della tabella "' + TableName + '"');
   // Crea la Qrery
   Qry := TIB_Cursor.Create(nil);
   Qry.DatabaseName := Database;
   Qry.IB_Connection := Connessione;
   try
      // IL nome tabella deve essere sicuramente tutto maiuscolo
      TableName := UpperCase(TableName);
      // Prima di tutto verifica la presenza o meno della definizione della tabella all'interno
      //  del file che contiene i Metadata.
      if SearchTableDefinition(T, MetadataTagName) then begin
         // Carica la proprietà SQL della Query
         GetNextTableQuery(T, Qry.SQL);
         // Cicla finchè ci sono query da effettuare per la creazione della tabella e degli indici
         while not (DM1.StrLeft(Qry.SQL[0], 5) = '[END]') do begin
            // Da quando si può specificare il nome della tabella da creare diverso dal nome indicato
            //  nei Metadata è necessario sostituire all'interno della query il nome della tabella
            //  indicato nel Metadata con il nuovo nome voluto.
            for i := 0 to Qry.SQL.Count - 1 do begin
               Qry.SQL[i] := StringReplace(Qry.SQL[i], '<TABLE>', TableName, [rfReplaceAll,rfIgnoreCase]);
            end;
            // Esegue la query
            Qry.ExecSQL;
            // Carica la proprietà SQL della query con la prossima query
            GetNextTableQuery(T, Qry.SQL);
         end;
      // Se la parte di definizione della tabella non viene trovata visualizza un messaggio
      end else begin
         MessageBeep(0);
         MessageDlg('ATTENZIONE!!! - Definizione tabella "' + TableName + '" non trovata nei Metadata.', mtWarning, [mbOK], 0);
      end;
   finally
      // Distrugge Qry
      Qry.Free;
   end;
end;
}
procedure CreaTabella(var T:TextFile; MetadataTagName,TableName,Database:String; Connessione:TIB_Connection; CreaTabella,CreaPK,CreaIndici:Boolean);
var
   Qry: TIB_Cursor;
   i, PassaggioNum: Integer;
begin
   // Inizializzazione
   PassaggioNum := 0;
   // Crea la Qrery
   Qry := TIB_Cursor.Create(nil);
   Qry.DatabaseName := Database;
   Qry.IB_Connection := Connessione;
   try
      // IL nome tabella deve essere sicuramente tutto maiuscolo
      TableName := UpperCase(TableName);
      // Prima di tutto verifica la presenza o meno della definizione della tabella all'interno
      //  del file che contiene i Metadata.
      if SearchTableDefinition(T, MetadataTagName) then begin
         // Carica la proprietà SQL della Query
         GetNextTableQuery(T, Qry.SQL);
         // Cicla finchè ci sono query da effettuare per la creazione della tabella e degli indici
         while not (DM1.StrLeft(Qry.SQL[0], 5) = '[END]') do begin
            // Incremente il contatore di cicli
            inc(PassaggioNum);
            // Da quando si può specificare il nome della tabella da creare diverso dal nome indicato
            //  nei Metadata è necessario sostituire all'interno della query il nome della tabella
            //  indicato nel Metadata con il nuovo nome voluto.
            for i := 0 to Qry.SQL.Count - 1 do begin
               Qry.SQL[i] := StringReplace(Qry.SQL[i], '<TABLE>', TableName, [rfReplaceAll,rfIgnoreCase]);
            end;
            // Esegue la query
            // NB: Se non viene specificato di create gli indici crea solo la tabella e la chiave
            //      principale (e quindi i primi 2 passaggi)
            if ((PassaggioNum = 1) and CreaTabella)
            or ((PassaggioNum = 2) and CreaPK)
            or ((PassaggioNum > 2) and CreaIndici)
            then Qry.ExecSQL;
            // Se non deve creare gli indici esce subito
            // NB: Se sta creando la tabbella temporanea (_NEW) non crea nemmeno la chiave principale ed esce subito)
            if ((PassaggioNum = 1) and (not CreaPK) and (not CreaIndici))
            or ((PassaggioNum = 2) and (not CreaIndici))
            then Exit;
            // Carica la proprietà SQL della query con la prossima query
            GetNextTableQuery(T, Qry.SQL);
         end;
      // Se la parte di definizione della tabella non viene trovata visualizza un messaggio
      end else begin
         MessageBeep(0);
         MessageDlg('ATTENZIONE!!! - Definizione tabella "' + TableName + '" non trovata nei Metadata.', mtWarning, [mbOK], 0);
      end;
   finally
      // Distrugge Qry
      Qry.Free;
   end;
end;

function SearchTableDefinition(var T:TextFile; TableName:String):Boolean;
var
   Line: String;
begin
   // Torna all'inizio del file
   Reset(T);
   // Inizializzazione variabili
   Line := '';
   Result := False;
   // Questa funzione cicla finchè non trova l'inizio della parte che contiene la definizione della tabella
   //  da creare e ritorna False se non trova nulla.
   while not((SeekEof(T))or(Result)) do begin
      // Se la linea che preleva contiene il Tag che marca l'inizio della parte di definizione della tabella
      //  voluta ("[NomeTabella]") restituisce True.
      Readln(T, Line);
      Result := Trim(UpperCase(Line)) = UpperCase('[' + TableName + ']');
   end;
end;

procedure GetNextTableQuery(var T:TextFile; SQLText:TStrings);
var
   Line:String;
begin
   // Inizializzazione variabili
   Line := '';
   // Azzera il contenuto di SQLText
   SQLText.Clear;
   // Carica il contenuto della riga successiva in Line
   Readln(T, Line);
   // Cicla finchè non arriva alla fine della query attuale
   //  NB: La fine della query è indicata dalla presenza del carattere
   //       ';' alla fine della riga.
   while DM1.StrRight(Line, 1) <> ';' do begin
      // Carica la linea in SQLText
      SQLText.Add(Line);
      // Carica il contenuto della riga successiva in Line
      Readln(T, Line);
   end;
   // Toglie il carattere ";" dalla fine dell'ultima riga
   SQLText.Add(DM1.StrLeft(Line, Length(Line)-1));
   Line := SQLText[SQLText.Count-1];
end;


end.
