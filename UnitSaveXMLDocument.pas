unit UnitSaveXMLDocument;

interface

uses XMLDocumento, IB_Components, DataModule1, SysUtils, StrUtils, IniFiles,
     Dialogs, Controls, main;

type

// ===========================================================================================
// INIZIO - SEZIONE PER IL CARICAMENTO DI UN DOCUMENTO DA UN FILE XML
// -------------------------------------------------------------------------------------------
   TLevanteLoadXMLDocument = class
   private
      XDoc: IXMLDocumentoType;        // Punta al documento attuale
      function LoadDocument(OpenDoc:Boolean=True): boolean;
      procedure CaricaTestataDocumento;
      procedure CaricaRighiDocumento;
      procedure CaricaRigoDocumento(Rigo:IXMLRigoType);
      procedure CaricaCausaleDefault;
      procedure ConvertiTipoDocumento;
      procedure ConvertiIntestatario;
      function  ControllaEsistenzaMittente(PI:String) : Integer;
      procedure DefaultizzaDocumento;
   public
      procedure LoadDocumentFromXMLFile(NomeFile:String);
      function LoadDocumentFromXMLFileWithConversion(NomeFile:String; OpenDoc:Boolean=True): boolean;
   end;
// -------------------------------------------------------------------------------------------
// FINE - SEZIONE PER IL CARICAMENTO DI UN DOCUMENTO DA UN FILE XML
// ===========================================================================================



// ===========================================================================================
// INIZIO - SEZIONE PER IL SALVATAGGIO DI UN DOCUMENTO IN UN FILE XML
// -------------------------------------------------------------------------------------------
   TLevanteSaveXMLDocument = class
   private
      MQ            :TIB_Cursor;                 // Dataset che punterà al Dataset Master del documento
      DQ            :TIB_Cursor;                 // Dataset che punterà al Dataset Detail del documento
      XDoc          :IXMLDocumentoType;          // Punta al documento attuale
      procedure CaricaDocumento(TipoDoc:String; NumDoc:Integer; Registro:String; DataDoc:TDateTime);
      procedure SalvaTestataDocumentoToXDoc;
      procedure SalvaRighiDocumentoToXDoc;
      procedure SalvaDatiMittenteToXDoc;
      function  CostruisciNomeFile : String;
   public
      function SaveDocumentToXMLFile(TipoDoc:String; NumDoc:Integer; Registro:String; DataDoc:TDateTime) : String;
   end;
// -------------------------------------------------------------------------------------------
// FINE - SEZIONE PER IL SALVATAGGIO DI UN DOCUMENTO IN UN FILE XML
// ===========================================================================================



// ===========================================================================================
// INIZIO - SEZIONE GENERALE
// -------------------------------------------------------------------------------------------
   function  DefaultStr(SI, Default:String): String;
   function  StrToSQLStr(SI:String) : String;
   function  DateToSQLDate(DI:WideString) : String;
   function  VirgolaPunto(Numero:Real): String;
// -------------------------------------------------------------------------------------------
// FINE - SEZIONE GENERALE
// ===========================================================================================


implementation

uses FormScambioDoc;



// ===========================================================================================
// INIZIO - SEZIONE PER IL CARICAMENTO DI UN DOCUMENTO DA UN FILE XML
// -------------------------------------------------------------------------------------------
   // Funzione che carica il documento dal file XML ed effettua la conversione di alcuni
   //  dati. Per esempiop se è una fattura di vendita diventa di acquisto, sostituisce
   //  l'intestatario con il mittente ecc. Questo serve per il sistema di scambio
   //  tra distributori e Installatori.
   function TLevanteLoadXMLDocument.LoadDocumentFromXMLFileWithConversion(NomeFile:String; OpenDoc:Boolean=True): boolean;
   begin
      Result := False;
      // Carica il documento XML nella variabile XDoc che lo contiene per l'elaborazione (DOM)
      XDoc := LoadDocumento(NomeFile);
      // Defaultizza alcuni campi del documento se eventualmente sono rimasti nulli
      DefaultizzaDocumento;
      // Conversione tipo documento
      ConvertiTipoDocumento;
      // Conversione Intestatario
      ConvertiIntestatario;
      // Carica il documento nel database dell'azienda corrente
      result := LoadDocument(OpenDoc);
   end;

   // Funzione principale per il caricamento del documento dal file XML
   //  al database.
   procedure TLevanteLoadXMLDocument.LoadDocumentFromXMLFile(NomeFile:String);
   begin
      // Carica il documento XML nella variabile XDoc che lo contiene per l'elaborazione (DOM)
      XDoc := LoadDocumento(NomeFile);
      // Carica il documento nel database dell'azienda corrente
      LoadDocument;
   end;

   // Funzione che carica il documento contenuno in XDoc nel database
   function TLevanteLoadXMLDocument.LoadDocument(OpenDoc:Boolean=True): boolean;
   begin
      result := True;
      // Verifica se il documento che si stà importando esiste già e se esiste
      //  blocca l'importazione. Se proprio lo si vuole re-importare bisognerà prima eliminare manualmente
      //  il documento già esistente nel DB (deciso insieme ad Andrea)
      if DM1.DocExist(XDoc.TipoNumData.TipoDocumento, XDoc.TipoNumData.NumOrdPrev, XDoc.TipoNumData.Registro,  StrToDate(XDoc.TipoNumData.DataDocumento)) then
      begin
        DM1.Messaggi('Levante', 'Documento già presente.'#13#13'Operazione ANNULLATA!!!', '', [mbOK], 0, nil);
        Exit(False);
      end;
      // Se arriva fino a qui sighifica che il documento non era già esistente
      //  nel database oppure l'utente ha dato il consenso alla sovrascrittura
      //  e quindi prosegue con il caricamento del documento nel database
      // -----------------------------------------------------------------------
      // Carica la testata e i righi del documento
      CaricaTestataDocumento;
      CaricaRighiDocumento;
      // Apre il documento appena importato e lo mette in Modifica in modo che
      //  l'utente possa confermarlo o meno
      if OpenDoc then
      begin
        DM1.ApriDocFisc(XDoc.TipoNumData.TipoDocumento,
                        XDoc.TipoNumData.NumOrdPrev,
                        XDoc.TipoNumData.Registro,
                        StrToDate(XDoc.TipoNumData.DataDocumento),
                        True);
      end;
   end;

   // Funzione che controlla se esiste un soggetto con la Partita IVA uguale a quella ricevuta
   //  come parametri e se lo trova ne ritorna il codice, altrimenti lo inserisce nuovo e ritorna
   //  il nuovo codice assegnato.
   function TLevanteLoadXMLDocument.ControllaEsistenzaMittente(PI:String) : Integer;
   var
      Qry : TIB_Cursor;
      LO : TMemIniFile;
      TipoSogg : String;
   begin
      // Inizializzazione
      Qry := TIB_Cursor.Create(nil);
      // Apre il file che contiene i layouts per prelevare il primo Tipo di soggetto
      //  disponibile (altrimenti il nuovo soggetto inserito non ha il tipo)
      LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
      try
         // Preleva dal file Layouts.ini il primo tipo di soggetto disponibile e lo mette nella
         //  variabile per poi utilizzarlo, eventualmente, nell'inserimento del nuovo soggetto nel caso non
         //  esistesse già (altrimenti rimarrebbe senza tipo)
//         TipoSogg := LO.ReadString('FormAnagraficaClienti', 'TipoSoggetto', '');
//         TipoSogg := DM1.RitornaTestoPrimaDi('_', TipoSogg, False);
         TipoSogg := 'Fornitore';
         // Imposta la query che cerca se c'è un soggetto con la stessa partita IVA
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         Qry.SQL.Add('SELECT CODICE FROM CLIENTI WHERE PARTITAIVA = ''' + Trim(PI) + '''');
         Qry.Open;
         // Se viene trovato ritorna il codice...
         if not Qry.Eof then Result := Qry.Fields[0].AsInteger
         // Se invece non viene trovato imposta ed esegue una query insert per l'inserimento
         //  del nuovo soggetto.
         //  NB: Prima però avverte l'utente della situazione e chiede conferma
         else if DM1.Messaggi('Caricamento Documento', 'Il mittente del documento non è presente nella rubrica.'#13#13'Vuoi che il programma lo inserisca automaticamente?', 'ATTENZIONE! - In caso di risposta negativa il documento verrà caricato senza nessun Mittente/Destinatario.', [mbYes,mbNo], 0, nil) = mrYes then begin
            Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Add('INSERT INTO CLIENTI (CODICE, CLIENTEFORNITORE, RAGIONESOCIALE, INDIRIZZO, CITTA, CAP, PROVINCIA, PARTITAIVA, TELEFONO, FAX, EMAIL)');
            Qry.SQL.Add('VALUES (');
            Qry.SQL.Add('(SELECT MAX(CODICE) FROM CLIENTI) + 1,');
            Qry.SQL.Add(StrToSQLStr(TipoSogg) +','+
                        StrToSQLStr(XDoc.Mittente.MittRagSoc) +','+
                        StrToSQLStr(XDoc.Mittente.MittIndirizzo) +','+
                        StrToSQLStr(XDoc.Mittente.MittCitta) +','+
                        StrToSQLStr(XDoc.Mittente.MittCAP) +','+
                        StrToSQLStr(XDoc.Mittente.MittProvincia) +','+
                        StrToSQLStr(XDoc.Mittente.MittPartitaIVA) +','+
                        StrToSQLStr(XDoc.Mittente.MittTelefono) +','+
                        StrToSQLStr(XDoc.Mittente.MittFax) +','+
                        StrToSQLStr(XDoc.Mittente.MittEmail));
            Qry.SQL.Add(')');
            Qry.ExecSQL;
            // Una volta inserito il mittente come nuovo soggetto la funzione richiama ricorsivamente
            //  se stessa per recuperare il nuovo codice assegnato.
            Result := ControllaEsistenzaMittente(PI);
         // Se l'utente risponde che non vuole l'inserimento automatico del mittente del documento, trasforma
         //  il mittente in un mittente vuoto con codice 0
         end else begin
            // Ritorna 0 come codice dell'intestatario documento
            Result := 0;
         end;
      finally
         LO.Free;
         Qry.Free;
      end;
   end;

   // Procedura che converte l'Intestatario con il Mittente, controlla anche se
   //  il nuovo intestatario (mittente) è inserito nelle angarafiche (controlla la
   //  Partita IVA) e se non lo è lo inserisce automaticamente.
   procedure TLevanteLoadXMLDocument.ConvertiIntestatario;
   var
      CodiceMittente : Integer;
   begin
      // Controlla se il Mittente è inserito nei Soggetti e se non lo è lo inserisce
      //  la funzione ritorna il codice del MIttente
      CodiceMittente := ControllaEsistenzaMittente(XDoc.Mittente.MittPartitaIVA);
      // Se il CodiceMittente <> 0 assegna il Mittente come intestatario del documento
      if CodiceMittente <> 0 then begin
         // Effettua lo scambio da Intestatario e Mittente
         XDoc.Intestatario.CodiceCliente   := CodiceMittente;
         XDoc.Intestatario.RagSocCli       := XDoc.Mittente.MittRagSoc;
         XDoc.Intestatario.IndirizzoCli    := XDoc.Mittente.MittIndirizzo;
         XDoc.Intestatario.CittaCli        := XDoc.Mittente.MittCitta;
         XDoc.Intestatario.CAPCli          := XDoc.Mittente.MittCAP;
         XDoc.Intestatario.ProvinciaCli    := XDoc.Mittente.MittProvincia;
         XDoc.Intestatario.PartitaIVACli   := XDoc.Mittente.MittPartitaIVA;
      // Se invece il CodiceMittente = 0 significa che l'utente non ha dato il consenso
      //  al caricamento automatico del nuovo soggetto e quindi il documento non avrà
      //  soggetto
      end else begin
         XDoc.Intestatario.CodiceCliente   := 0;
         XDoc.Intestatario.RagSocCli       := '';
         XDoc.Intestatario.IndirizzoCli    := '';
         XDoc.Intestatario.CittaCli        := '';
         XDoc.Intestatario.CAPCli          := '';
         XDoc.Intestatario.ProvinciaCli    := '';
         XDoc.Intestatario.PartitaIVACli   := '';
      end;
   end;

   // Procedura che cambia la causale del documento in base al tipo icevuto come parametro
   procedure TLevanteLoadXMLDocument.CaricaCausaleDefault;
   var
      Qry : TIB_Cursor;
      LO : TMemIniFile;
      Causale : String;
   begin
      // Crea l'oggetto query e apre layouts.ini
      Qry := TIB_Cursor.Create(nil);
      LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
      try
         // Causale contiene la causale di default del documento
         Causale := LO.ReadString(XDoc.TipoNumData.TipoDocumento, 'CausaleDefault', '');
         // imposta la query che preleverà gli altri dati della causale
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         Qry.SQL.Add('SELECT SEGNOOPERAZIONE, DAFATTURARE FROM CAUSALI WHERE DESCRIZIONE = ''' + Causale + '''');
         Qry.Open;
         // Se la causale viene trovata carica i relativi dati negli appositi campi del file XML
         if not Qry.Eof then begin
            XDoc.DatiCausale.Causale          := Causale;
            XDoc.DatiCausale.SegnoOperazione  := Qry.FieldByName('SEGNOOPERAZIONE').AsString;
            XDoc.DatiCausale.DaFatturare      := Qry.FieldByName('DAFATTURARE').AsString;
         end;
      finally
         // Pulisce
         LO.Free;
         Qry.Free;
      end;
   end;


   // Funzione che defaultizza alcuni campi del documento
   procedure TLevanteLoadXMLDocument.DefaultizzaDocumento;
   begin
      // Se il registro è nullo o vuoto, lo defaultizza al registro di default
      //  che è '-'
      XDoc.TipoNumData.Registro := DefaultStr(XDoc.TipoNumData.Registro, '-');
   end;


   // Procedura che converte il tipo documento ad esempio nello scambio di documenti
   //  una fattura diventa Fatt.Acqui ecc.
   procedure TLevanteLoadXMLDocument.ConvertiTipoDocumento;
   var
      LO : TMemIniFile;
   begin
      // Apre il file Layout
      LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
      try
         // Conversione tipo documento
         with XDoc.TipoNumData do begin
            if      TipoDocumento = 'Fattura'      then TipoDocumento := 'Fatt.acqui'
            else if TipoDocumento = 'Fatt.R.F.'    then TipoDocumento := 'Fatt.acqui'
            else if TipoDocumento = 'D.D.T.'       then TipoDocumento := 'Bolla_entr'
            else if TipoDocumento = 'Ordine'       then TipoDocumento := 'Ord.fornit'
            else if TipoDocumento = 'Nota_accre'   then TipoDocumento := 'N.C.fornit'
         end;
         // Il Tipo documento esteso a questo punto diventa uguale al TipoDocumento normale,
         //  se il TipoDocumentoEsteso oroginario conteneva il marcatore di sola lettura,
         //  provvede a reinserirlo anche al nuovo TipoDocumentoEsteso.
         if DM1.IsReadOnlyDoc(XDoc.TipoNumData.TipoDocumentoEsteso)
         then XDoc.TipoNumData.TipoDocumentoEsteso := XDoc.TipoNumData.TipoDocumento + ' ' + MARCATORE_DOCUMENTO_SOLA_LETTURA
         else XDoc.TipoNumData.TipoDocumentoEsteso := XDoc.TipoNumData.TipoDocumento;
         // Carica le azioni di default che il documento deve compiere rispetto al magazzino e al cantiere
         XDoc.Varie.SegnoOperazione := Uppercase(LO.ReadString(XDoc.TipoNumData.TipoDocumento, 'AzioneMagazzino', '='));
         XDoc.Varie.SegnoOperazioneCantiere := Uppercase(LO.ReadString(XDoc.TipoNumData.TipoDocumento, 'AzioneCantiere', '='));
         // Carica la Causale di default del nuovo TipoDocumento
         CaricaCausaleDefault;
      finally
         LO.Free;
      end;
   end;




{
   // Carica la testata del documento prelevata dal file nel database
   procedure TLevanteLoadXMLDocument.CaricaTestataDocumento;
   var
      Qry : TIB_Cursor;
   begin
      // Crea l'oggetto qry che effettuerà l'inserimento della testata documento da caricare
      Qry := TIB_Cursor.Create(nil);
      try
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         // Inizio dell'impostazione della query che effettuerà l'inserimento
         Qry.SQL.Add('INSERT INTO PRVORDCL (');
         // Elenco dei campi da inserire
                     // TIPONUMDATA
         Qry.SQL.Add('TIPODOCUMENTO,'+
                     'REGISTRO,'+
                     'NUMORDPREV,'+
                     'DATADOCUMENTO,'+
                     'TIPODOCUMENTOESTESO,'+
                     // INTESTATARIO
                     'CODICECLIENTE,'+
                     'RAGSOCCLI,'+
                     'INDIRIZZOCLI,'+
                     'CITTACLI,'+
                     'CAPCLI,'+
                     'PROVINCIACLI,'+
                     'PARTITAIVACLI,'+
                     // DESTINAZIONE MERCI
//                     'CODICEDESTMERCI,'+
                     'RAGSOCDESTMERCI,'+
                     'INDIRIZZODESTMERCI,'+
                     'CAPDESTMERCI,'+
                     'CITTADESTMERCI,'+
                     'PROVINCIADESTMERCI,'+
                     // PRATICHE
//                     'PRATICA,'+
//                     'PRATICA2,'+
//                     'PRATICA3,'+
//                     'DATAPRATICA1,'+
//                     'DATAPRATICA2,'+
//                     'DATAPRATICA3,'+
                     // VARIE
//                     'SELEZIONATO,'+
                     'MESECOMPETENZA,'+
                     'CODICEMAGAZZINO,'+
                     'LISTINO,'+
                     'ARGOMENTO,'+
                     'NOTE,'+
                     'MESSAGGI,'+
//                     'AGENTE,'+
                     // DATI CAUSALE
                     'CAUSALE,'+
                     'SEGNOOPERAZIONE,'+
                     'DAFATTURARE,'+
                     // TRASPORTO
                     'TRASPORTOACURA,'+
                     'DATIVETTORE,'+
                     'DATATRASP,'+
                     'ORATRASP,'+
                     'NUMCOLLI,'+
                     'ASPETTOESTERIOREBENI,'+
                     'PORTO,'+
                     // STATO
//                     'STATODESCRIZIONE,'+
//                     'STATOFOREGROUND,'+
//                     'STATOBACKGROUND,'+
                     // SUBSOGG
//                     'CODICESUBSOGG,'+
//                     'SUBSOGGCAMPO1,'+
//                     'SUBSOGGCAMPO2,'+
//                     'SUBSOGGCAMPO3,'+
                     // DATI OPERATORE
                     'OPERATORE,'+
                     'VALIDITADOCUMENTO,'+
                     'CONSEGNA,'+
                     // DATI PAGAMENTO
//                     'PAGAMENTO,'+
                     'ABI,'+
                     'CAB,'+
                     // TOTALI
                     'PRZUNITOPERA,'+
                     'TOTALEMARGINE,'+
                     'TOTALERIGHI1,'+
                     'TOTALERIGHI2,'+
                     'TOTALERIGHI3,'+
                     'TOTALERIGHI4,'+
                     'TOTALEMERCE,'+
                     'SCONTOALIQUOTA1,'+
                     'SCONTOALIQUOTA2,'+
                     'SCONTOALIQUOTA3,'+
                     'SCONTOALIQUOTA4,'+
                     'TOTALESCONTI,'+
                     'TOTALEIMPONIBILE1,'+
                     'TOTALEIMPONIBILE2,'+
                     'TOTALEIMPONIBILE3,'+
                     'TOTALEIMPONIBILE4,'+
                     'TOTALEIMPONIBILE,'+
                     'CODICEIVA1,'+
                     'CODICEIVA2,'+
                     'CODICEIVA3,'+
                     'CODICEIVA4,'+
                     'IMPORTOIVA1,'+
                     'IMPORTOIVA2,'+
                     'IMPORTOIVA3,'+
                     'IMPORTOIVA4,'+
                     'TOTALEIVA,'+
                     'TOTALENETTOMERCE,'+
                     'SPESE,'+
                     'ABBUONO,'+
                     'TOTALEDOCUMENTO,'+
                     'TOTALEDAPAGARE');
                     // SCADENZE
//                     'DATASCAD1,'+
//                     'DATASCAD2,'+
//                     'DATASCAD3,'+
//                     'DATASCAD4,'+
//                     'DATASCAD5,'+
//                     'IMPORTOSCAD1,'+
//                     'IMPORTOSCAD2,'+
//                     'IMPORTOSCAD3,'+
//                     'IMPORTOSCAD4,'+
//                     'IMPORTOSCAD5');
         // values
         Qry.SQL.Add(') VALUES (');
         // Elenco valori da inserire nei campi
                     // TIPONUMDATA
         Qry.SQL.Add(StrToSQLStr(XDoc.TipoNumData.TipoDocumento) +','+
                     StrToSQLStr(DefaultStr(XDoc.TipoNumData.Registro, '-')) +','+
                     IntToStr(XDoc.TipoNumData.NumOrdPrev) +','+
                     DateToSQLDate(XDoc.TipoNumData.DataDocumento) +','+
                     StrToSQLStr(XDoc.TipoNumData.TipoDocumentoesteso) +','+
                     // INTESTATARIO
                     IntToStr(XDoc.Intestatario.CodiceCliente) +','+
                     StrToSQLStr(XDoc.Intestatario.RagSocCli) +','+
                     StrToSQLStr(XDoc.Intestatario.IndirizzoCli) +','+
                     StrToSQLStr(XDoc.Intestatario.CittaCli) +','+
                     StrToSQLStr(XDoc.Intestatario.CAPCli) +','+
                     StrToSQLStr(XDoc.Intestatario.ProvinciaCli) +','+
                     StrToSQLStr(XDoc.Intestatario.PartitaIVACli) +','+
                     // DESTINAZIONE MERCI
//                     'NULL,'+   // IntToStr(XDoc.DestinazioneMerci.CodiceDestMerci) +','+
                     StrToSQLStr(XDoc.DestinazioneMerci.RagSocDestMerci) +','+
                     StrToSQLStr(XDoc.DestinazioneMerci.IndirizzoDestMerci) +','+
                     StrToSQLStr(XDoc.DestinazioneMerci.CAPDestMerci) +','+
                     StrToSQLStr(XDoc.DestinazioneMerci.CittaDestMerci) +','+
                     StrToSQLStr(XDoc.DestinazioneMerci.ProvinciaDestMerci) +','+
                     // PRATICHE
//                     'NULL,'+   // IntToStr(XDoc.Pratiche.Pratica) +','+
//                     'NULL,'+   // IntToStr(XDoc.Pratiche.Pratica2) +','+
//                     'NULL,'+   // IntToStr(XDoc.Pratiche.Pratica3) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Pratiche.DataPratica1) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Pratiche.DataPratica2) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Pratiche.DataPratica3) +','+
                     // VARIE
//                     ''''','+   // StrToSQLStr(XDoc.Varie.Selezionato) +','+
                     IntToStr(XDoc.Varie.MeseCompetenza) +','+
                     DM1.MagazzinoDefault +','+  // IntToStr(XDoc.Varie.CodiceMagazzino) +','+
                     IntToStr(XDoc.Varie.Listino) +','+
                     StrToSQLStr(XDoc.Varie.Argomento) +','+
                     StrToSQLStr(XDoc.Varie.Note) +','+
                     StrToSQLStr(XDoc.Varie.Messaggi) +','+
//                     'NULL,'+   // IntToStr(XDoc.Varie.Agente) +','+
                     // DATI CAUSALE
                     StrToSQLStr(XDoc.DatiCausale.Causale) +','+
                     StrToSQLStr(XDoc.DatiCausale.SegnoOperazione) +','+
                     ''''','+   // StrToSQLStr(XDoc.DatiCausale.DaFatturare) +','+
                     // TRASPORTO
                     StrToSQLStr(XDoc.Trasporto.TrasportoACura) +','+
                     StrToSQLStr(XDoc.Trasporto.DatiVettore) +','+
                     StrToSQLStr(XDoc.Trasporto.DataTrasp) +','+
                     StrToSQLStr(XDoc.Trasporto.OraTrasp) +','+
                     IntToStr(XDoc.Trasporto.NumColli) +','+
                     StrToSQLStr(XDoc.Trasporto.AspettoEsterioreBeni) +','+
                     StrToSQLStr(XDoc.Trasporto.Porto) +','+
                     // STATO
//                     'NULL,'+   // StrToSQLStr(XDoc.Stato.StatoDescrizione) +','+
//                     'NULL,'+   // StrToSQLStr(XDoc.Stato.StatoForeground) +','+
//                     'NULL,'+   // StrToSQLStr(XDoc.Stato.StatoBackground) +','+
                     // SUBSOGG
//                     IntToStr(XDoc.SubSogg.CodiceSubSogg) +','+
//                     StrToSQLStr(XDoc.SubSogg.SubSoggCampo1) +','+
//                     StrToSQLStr(XDoc.SubSogg.SubSoggCampo2) +','+
//                     StrToSQLStr(XDoc.SubSogg.SubSoggCampo3) +','+
                     // DATI OPERATORE
                     StrToSQLStr(XDoc.DatiOperatore.Operatore) +','+
                     StrToSQLStr(XDoc.DatiOperatore.ValiditaDocumento) +','+
                     StrToSQLStr(XDoc.DatiOperatore.Consegna) +','+
                     // DATI PAGAMENTO
//                     'NULL,'+   // IntToStr(XDoc.DatiPagamento.Pagamento) +','+
                     StrToSQLStr(XDoc.DatiPagamento.ABI) +','+
                     StrToSQLStr(XDoc.DatiPagamento.CAB) +','+
                     // TOTALI
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.PrzUnitOpera)) +','+
                     '0,'+   // XDoc.Totali.TotaleMargine +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleRighi1)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleRighi2)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleRighi3)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleRighi4)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleMerce)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.ScontoAliquota1)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.ScontoAliquota2)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.ScontoAliquota3)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.ScontoAliquota4)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleSconti)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleImponibile1)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleImponibile2)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleImponibile3)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleImponibile4)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleImponibile)) +','+
                     IntToStr(XDoc.Totali.CodiceIVA1) +','+
                     IntToStr(XDoc.Totali.CodiceIVA2) +','+
                     IntToStr(XDoc.Totali.CodiceIVA3) +','+
                     IntToStr(XDoc.Totali.CodiceIVA4) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.ImportoIVA1)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.ImportoIVA2)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.ImportoIVA3)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.ImportoIVA4)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleIVA)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleNettoMerce)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.Spese)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.Abbuono)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleDocumento)) +','+
                     DM1.VirgolaPunto(StrToFloat(XDoc.Totali.TotaleDaPagare)));
                     // SCADENZE
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad1) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad2) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad3) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad4) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad5) +','+
         // Gli importo vengono inseriti solo se <> 0 altrimenti vengono inseriti come NULL
//         if XDoc.Scadenze.ImportoScad1 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad1+',') else Qry.SQL.Add('NULL,');
//         if XDoc.Scadenze.ImportoScad2 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad2+',') else Qry.SQL.Add('NULL,');
//         if XDoc.Scadenze.ImportoScad3 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad3+',') else Qry.SQL.Add('NULL,');
//         if XDoc.Scadenze.ImportoScad4 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad4+',') else Qry.SQL.Add('NULL,');
//         if XDoc.Scadenze.ImportoScad5 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad5)     else Qry.SQL.Add('NULL');
         // Chiude la parentesi
         Qry.SQl.Add(')');
         // Esegue la query
         Qry.ExecSQL;
      finally
         Qry.Free;
      end;
   end;
}



   // Carica la testata del documento prelevata dal file nel database
   procedure TLevanteLoadXMLDocument.CaricaTestataDocumento;
   var
      Qry : TIB_Cursor;
   begin

      // NB: Ho notato che, soprattutto nelle bolle di entrata, il TOTALEDOCUMENTO e il
      //      TOTALE DA PAGARE è sempre uguale a 0 (zero) proprio nel file che arriva dal
      //      teletrasporto, invece il campo TOTALENETTOMERCE contiene il totale giusto.
      //      quindi nel caso i campi di cui sopra sono guguali a zero li ricalcolo
      //      partendo dal TOTALENETTOMERCE.
      if (Trim(XDoc.Totali.TotaleDocumento) = '0') and (Trim(XDoc.Totali.TotaleDaPagare) = '0') and (Trim(XDoc.Totali.Abbuono) = '0') and (Trim(XDoc.Totali.Spese) = '0')
      and (MainForm.IsLevanteLight)
      then begin
        XDoc.Totali.TotaleDocumento := XDoc.Totali.TotaleNettoMerce;
        XDoc.Totali.TotaleDaPagare := XDoc.Totali.TotaleNettoMerce;
      end;

      // Crea l'oggetto qry che effettuerà l'inserimento della testata documento da caricare
      Qry := TIB_Cursor.Create(nil);
      try
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         // Inizio dell'impostazione della query che effettuerà l'inserimento
         Qry.SQL.Add('INSERT INTO PRVORDCL (');
         // Elenco dei campi da inserire
                     // TIPONUMDATA
         Qry.SQL.Add('TIPODOCUMENTO,'+
                     'REGISTRO,'+
                     'NUMORDPREV,'+
                     'DATADOCUMENTO,'+
                     'TIPODOCUMENTOESTESO,'+
                     // INTESTATARIO
                     'CODICECLIENTE,'+
                     'RAGSOCCLI,'+
                     'INDIRIZZOCLI,'+
                     'CITTACLI,'+
                     'CAPCLI,'+
                     'PROVINCIACLI,'+
                     'PARTITAIVACLI,'+
                     // DESTINAZIONE MERCI
//                     'CODICEDESTMERCI,'+
                     'RAGSOCDESTMERCI,'+
                     'INDIRIZZODESTMERCI,'+
                     'CAPDESTMERCI,'+
                     'CITTADESTMERCI,'+
                     'PROVINCIADESTMERCI,'+
                     // PRATICHE
//                     'PRATICA,'+
//                     'PRATICA2,'+
//                     'PRATICA3,'+
//                     'DATAPRATICA1,'+
//                     'DATAPRATICA2,'+
//                     'DATAPRATICA3,'+
                     // VARIE
//                     'SELEZIONATO,'+
                     'MESECOMPETENZA,'+
                     'CODICEMAGAZZINO,'+
                     'LISTINO,'+
                     'ARGOMENTO,'+
                     'NOTE,'+
                     'MESSAGGI,'+
//                     'AGENTE,'+
                     // DATI CAUSALE
                     'CAUSALE,'+
                     'SEGNOOPERAZIONE,'+
                     'SEGNOOPERAZIONECANTIERE,'+
                     'DAFATTURARE,'+
                     // TRASPORTO
                     'TRASPORTOACURA,'+
                     'DATIVETTORE,'+
                     'DATATRASP,'+
                     'ORATRASP,'+
                     'NUMCOLLI,'+
                     'ASPETTOESTERIOREBENI,'+
                     'PORTO,'+
                     // STATO
//                     'STATODESCRIZIONE,'+
//                     'STATOFOREGROUND,'+
//                     'STATOBACKGROUND,'+
                     // SUBSOGG
//                     'CODICESUBSOGG,'+
//                     'SUBSOGGCAMPO1,'+
//                     'SUBSOGGCAMPO2,'+
//                     'SUBSOGGCAMPO3,'+
                     // DATI OPERATORE
                     'OPERATORE,'+
                     'VALIDITADOCUMENTO,'+
                     'CONSEGNA,'+
                     // DATI PAGAMENTO
//                     'PAGAMENTO,'+
                     'ABI,'+
                     'CAB,'+
                     // TOTALI
                     'PRZUNITOPERA,'+
                     'TOTALEMARGINE,'+
                     'TOTALERIGHI1,'+
                     'TOTALERIGHI2,'+
                     'TOTALERIGHI3,'+
                     'TOTALERIGHI4,'+
                     'TOTALEMERCE,'+
                     'SCONTOALIQUOTA1,'+
                     'SCONTOALIQUOTA2,'+
                     'SCONTOALIQUOTA3,'+
                     'SCONTOALIQUOTA4,'+
                     'TOTALESCONTI,'+
                     'TOTALEIMPONIBILE1,'+
                     'TOTALEIMPONIBILE2,'+
                     'TOTALEIMPONIBILE3,'+
                     'TOTALEIMPONIBILE4,'+
                     'TOTALEIMPONIBILE,'+
                     'CODICEIVA1,'+
                     'CODICEIVA2,'+
                     'CODICEIVA3,'+
                     'CODICEIVA4,'+
                     'IMPORTOIVA1,'+
                     'IMPORTOIVA2,'+
                     'IMPORTOIVA3,'+
                     'IMPORTOIVA4,'+
                     'TOTALEIVA,'+
                     'TOTALENETTOMERCE,'+
                     'SPESE,'+
                     'ABBUONO,'+
                     'TOTALEDOCUMENTO,'+
                     'TOTALEDAPAGARE');
                     // SCADENZE
//                     'DATASCAD1,'+
//                     'DATASCAD2,'+
//                     'DATASCAD3,'+
//                     'DATASCAD4,'+
//                     'DATASCAD5,'+
//                     'IMPORTOSCAD1,'+
//                     'IMPORTOSCAD2,'+
//                     'IMPORTOSCAD3,'+
//                     'IMPORTOSCAD4,'+
//                     'IMPORTOSCAD5');
         // values
         Qry.SQL.Add(') VALUES (');
         // Elenco valori da inserire nei campi
                     // TIPONUMDATA
         Qry.SQL.Add(StrToSQLStr(   LeftStr(XDoc.TipoNumData.TipoDocumento,25)   ) +','+
                     StrToSQLStr(   LeftStr(DefaultStr(XDoc.TipoNumData.Registro, '-'),5)   ) +','+
                     IntToStr(XDoc.TipoNumData.NumOrdPrev) +','+
                     DateToSQLDate(XDoc.TipoNumData.DataDocumento) +','+
                     StrToSQLStr(   LeftStr(XDoc.TipoNumData.TipoDocumentoesteso,25)   ) +','+
                     // INTESTATARIO
                     IntToStr(XDoc.Intestatario.CodiceCliente) +','+
                     StrToSQLStr(   LeftStr(XDoc.Intestatario.RagSocCli,60)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Intestatario.IndirizzoCli,40)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Intestatario.CittaCli,25)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Intestatario.CAPCli,5)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Intestatario.ProvinciaCli,3)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Intestatario.PartitaIVACli,16)   ) +','+
                     // DESTINAZIONE MERCI
//                     'NULL,'+   // IntToStr(XDoc.DestinazioneMerci.CodiceDestMerci) +','+
                     StrToSQLStr(   LeftStr(XDoc.DestinazioneMerci.RagSocDestMerci,60)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.DestinazioneMerci.IndirizzoDestMerci,40)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.DestinazioneMerci.CAPDestMerci,5)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.DestinazioneMerci.CittaDestMerci,25)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.DestinazioneMerci.ProvinciaDestMerci,3)   ) +','+
                     // PRATICHE
//                     'NULL,'+   // IntToStr(XDoc.Pratiche.Pratica) +','+
//                     'NULL,'+   // IntToStr(XDoc.Pratiche.Pratica2) +','+
//                     'NULL,'+   // IntToStr(XDoc.Pratiche.Pratica3) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Pratiche.DataPratica1) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Pratiche.DataPratica2) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Pratiche.DataPratica3) +','+
                     // VARIE
//                     ''''','+   // StrToSQLStr(XDoc.Varie.Selezionato) +','+
                     IntToStr(XDoc.Varie.MeseCompetenza) +','+
                     DM1.MagazzinoDefault +','+  // IntToStr(XDoc.Varie.CodiceMagazzino) +','+
                     IntToStr(XDoc.Varie.Listino) +','+
                     StrToSQLStr(   LeftStr(XDoc.Varie.Argomento,60)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Varie.Note,1000)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Varie.Messaggi,1000)   ) +','+
//                     'NULL,'+   // IntToStr(XDoc.Varie.Agente) +','+
                     // DATI CAUSALE
                     StrToSQLStr(   LeftStr(XDoc.DatiCausale.Causale,40)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Varie.SegnoOperazione,1)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Varie.SegnoOperazioneCantiere,1)   ) +','+
                     ''''','+   // StrToSQLStr(XDoc.DatiCausale.DaFatturare) +','+
                     // TRASPORTO
                     StrToSQLStr(   LeftStr(XDoc.Trasporto.TrasportoACura, 15)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Trasporto.DatiVettore,50)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Trasporto.DataTrasp,10)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Trasporto.OraTrasp,5)   ) +','+
                        LeftStr(IntToStr(XDoc.Trasporto.NumColli),6)    +','+
                     StrToSQLStr(   LeftStr(XDoc.Trasporto.AspettoEsterioreBeni,30)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.Trasporto.Porto,20)   ) +','+
                     // STATO
//                     'NULL,'+   // StrToSQLStr(XDoc.Stato.StatoDescrizione) +','+
//                     'NULL,'+   // StrToSQLStr(XDoc.Stato.StatoForeground) +','+
//                     'NULL,'+   // StrToSQLStr(XDoc.Stato.StatoBackground) +','+
                     // SUBSOGG
//                     IntToStr(XDoc.SubSogg.CodiceSubSogg) +','+
//                     StrToSQLStr(XDoc.SubSogg.SubSoggCampo1) +','+
//                     StrToSQLStr(XDoc.SubSogg.SubSoggCampo2) +','+
//                     StrToSQLStr(XDoc.SubSogg.SubSoggCampo3) +','+
                     // DATI OPERATORE
                     StrToSQLStr(   LeftStr(XDoc.DatiOperatore.Operatore,10)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.DatiOperatore.ValiditaDocumento,10)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.DatiOperatore.Consegna,20)   ) +','+
                     // DATI PAGAMENTO
//                     'NULL,'+   // IntToStr(XDoc.DatiPagamento.Pagamento) +','+
                     StrToSQLStr(   LeftStr(XDoc.DatiPagamento.ABI,10)   ) +','+
                     StrToSQLStr(   LeftStr(XDoc.DatiPagamento.CAB,10)   ) +','+
                     // TOTALI
                     StringReplace(XDoc.Totali.PrzUnitOpera, ',', '.', [rfReplaceAll]) +','+
                     '0,'+   // XDoc.Totali.TotaleMargine +','+

                     StringReplace(XDoc.Totali.TotaleRighi1, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleRighi2, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleRighi3, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleRighi4, ',', '.', [rfReplaceAll]) +','+

                     StringReplace(XDoc.Totali.TotaleMerce, ',', '.', [rfReplaceAll]) +','+

                     StringReplace(XDoc.Totali.ScontoAliquota1, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.ScontoAliquota2, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.ScontoAliquota3, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.ScontoAliquota4, ',', '.', [rfReplaceAll]) +','+

                     StringReplace(XDoc.Totali.TotaleSconti, ',', '.', [rfReplaceAll]) +','+

                     StringReplace(XDoc.Totali.TotaleImponibile1, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleImponibile2, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleImponibile3, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleImponibile4, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleImponibile, ',', '.', [rfReplaceAll]) +','+

                     IntToStr(XDoc.Totali.CodiceIVA1) +','+
                     IntToStr(XDoc.Totali.CodiceIVA2) +','+
                     IntToStr(XDoc.Totali.CodiceIVA3) +','+
                     IntToStr(XDoc.Totali.CodiceIVA4) +','+

                     StringReplace(XDoc.Totali.ImportoIVA1, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.ImportoIVA2, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.ImportoIVA3, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.ImportoIVA4, ',', '.', [rfReplaceAll]) +','+

                     StringReplace(XDoc.Totali.TotaleIVA, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleNettoMerce, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.Spese, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.Abbuono, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleDocumento, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(XDoc.Totali.TotaleDaPagare, ',', '.', [rfReplaceAll]));
                     // SCADENZE
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad1) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad2) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad3) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad4) +','+
//                     'NULL,'+   // DateToSQLDate(XDoc.Scadenze.DataScad5) +','+
         // Gli importo vengono inseriti solo se <> 0 altrimenti vengono inseriti come NULL
//         if XDoc.Scadenze.ImportoScad1 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad1+',') else Qry.SQL.Add('NULL,');
//         if XDoc.Scadenze.ImportoScad2 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad2+',') else Qry.SQL.Add('NULL,');
//         if XDoc.Scadenze.ImportoScad3 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad3+',') else Qry.SQL.Add('NULL,');
//         if XDoc.Scadenze.ImportoScad4 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad4+',') else Qry.SQL.Add('NULL,');
//         if XDoc.Scadenze.ImportoScad5 <> '0.0000' then Qry.SQL.Add(XDoc.Scadenze.ImportoScad5)     else Qry.SQL.Add('NULL');
         // Chiude la parentesi
         Qry.SQl.Add(')');
         // Esegue la query
         Qry.ExecSQL;
      finally
         Qry.Free;
      end;
   end;


   // Carica i righi del documento nel database
   procedure TLevanteLoadXMLDocument.CaricaRighiDocumento;
   var
      I : Integer;
   begin
      // Cicla per tutti i righi presenti nel documento e li carica
      for I := 0 to XDoc.CorpoDocumento.Count -1 do begin
         CaricaRigoDocumento(XDoc.CorpoDocumento.Rigo[I]);
      end;
   end;


{
   // Carica il rigo attuale nel database con una query
   procedure TLevanteLoadXMLDocument.CaricaRigoDocumento(Rigo:IXMLRigoType);
   var
      Qry : TIB_Cursor;
   begin
      // Crea l'oggetto qry che effettuerà l'inserimento della testata documento da caricare
      Qry := TIB_Cursor.Create(nil);
      try
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         // Inizio dell'impostazione della query che effettuerà l'inserimento
         Qry.SQL.Add('INSERT INTO RIGHIPRV (');
         // Elenco dei campi da inserire
         Qry.SQL.Add('TIPODOCUMENTO,'+
                     'NUMORDPREV,'+
                     'REGISTRO,'+
                     'DATADOCUMENTO,'+
                     'PROGRIGO,'+
                     'PROGRIGO2,'+
                     'CODICECLIENTE,'+
                     'CODICEARTICOLO,'+
                     'DESCRIZIONE,'+
                     'PREZZOUNITARIO,'+
                     'PREZZOUNITARIOIVACOMPRESA,'+
                     'UNITADIMISURA,'+
                     'QTA,'+
                     'SCONTORIGO,'+
                     'SCONTORIGO2,'+
                     'SCONTORIGO3,'+
                     'IMPORTORIGO,'+
                     'IMPORTORIGOIVACOMPRESA,'+
                     'PREZZOACQUISTOARTICOLO,'+
                     'CODICEIVA,'+
                     'MARGINE,'+
                     'MOVMAG,'+
                     'IMPORTOMARGINE,'+
                     'DESCRIZIONEIVA,'+
                     'ALIQUOTAIVA,'+
                     'CODICEMAGAZZINO,'+
                     'PRZUNITOPERA,'+
                     'QTAOPERA,'+
                     'IMPORTOOPERA,'+
                     'IMPORTOCOMPONENTI,'+
                     'NOTERIGO,'+
                     'SELEZIONATO');
         // values
         Qry.SQL.Add(') VALUES (');
         // Elenco valori da inserire nei campi
                     // TIPONUMDATA
         Qry.SQL.Add(StrToSQLStr(XDoc.TipoNumData.TipoDocumento) +','+
                     IntToStr(XDoc.TipoNumData.NumOrdPrev) +','+
                     StrToSQLStr(DefaultStr(XDoc.TipoNumData.Registro, '-')) +','+
                     DateToSQLDate(XDoc.TipoNumData.DataDocumento) +','+
                     IntToStr(Rigo.ProgRigo) +','+
                     IntToStr(Rigo.ProgRigo2) +','+
                     IntToStr(Rigo.CodiceCliente) +','+
                     StrToSQLStr(Rigo.CodiceArticolo) +','+
                     StrToSQLStr(Rigo.Descrizione) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.PrezzoUnitario)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.PrezzoUnitarioIVACompresa)) +','+
                     StrToSQLStr(Rigo.UnitaDiMisura) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.QTA)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.ScontoRigo)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.ScontoRigo2)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.ScontoRigo3)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.ImportoRigo)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.ImportoRigoIVACompresa)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.PrezzoUnitario)) +','+   // Rigo.PrezzoAcquistoArticolo +','+
                     IntToStr(Rigo.CodiceIVA) +','+
                     '0,'+                       // Rigo.Margine +','+
                     'NULL,'+                    // StrToSQLStr(Rigo.MovMag) +','+
                     '0,'+                       // Rigo.ImportoMargine +','+
                     StrToSQLStr(Rigo.DescrizioneIVA) +','+
                     Rigo.AliquotaIVA +','+
                     DM1.MagazzinoDefault +','+  // IntToStr(Rigo.CodiceMagazzino) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.PrzUnitOpera)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.QtaOpera)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.ImportoOpera)) +','+
                     DM1.VirgolaPunto(StrToFloat(Rigo.ImportoComponenti)) +','+
                     StrToSQLStr(Rigo.NoteRigo) +','+
                     'NULL');   // StrToSQLStr(Rigo.Selezionato));
         // Chiude la parentesi
         Qry.SQl.Add(')');
         // Esegue la query
         Qry.ExecSQL;
      finally
         Qry.Free;
      end;
   end;
}

   // Carica il rigo attuale nel database con una query
   procedure TLevanteLoadXMLDocument.CaricaRigoDocumento(Rigo:IXMLRigoType);
   var
      Qry : TIB_Cursor;
      CodIva: Integer;
      DescIva: String;
      AliqIva: Double;
   begin

      // NB: Siccome quando eravamo in modalità LevanteLight e con PID = NC succedeva che i documenti
      //      venivano comunque caricati con i prezzi dei righi lordi e poi gli sconti mentre quando il PID=NC
      //      ovviamente i prezzi unitari devono essere netti. Il problema era dato dal fatto che quando siamo in modalità
      //      LevanteLight i documenti appena importati non vengono aperti per la successiva accettazione da parte dell'utente
      //      ed è proprio durante questa apertura che avveniva questa "conversione" dei prezzi unitari da lordi a netti.
      //      Quindi se siamo in modalità Levante Light ora provvede subito qui durante l'importazione a modificare i prezzi in netti.
      if MainForm.IsLevanteLight and (ScambioDocForm.DXC_PidAzienda = 'NC') then begin
        Rigo.PrezzoUnitario := Rigo.PrezzoAcquistoArticolo;
        Rigo.ScontoRigo := '0';
        Rigo.ScontoRigo2 := '0';
        Rigo.ScontoRigo3 := '0';
      end;

      // Carica sulle apposite variabili locali i dati dell'aliquota IVA
      //  del rigo
      DM1.IvaArcobalenoToIvaLevante(Trim(Rigo.DescrizioneIVA), CodIva, DescIva, AliqIva);
      // Crea l'oggetto qry che effettuerà l'inserimento della testata documento da caricare
      Qry := TIB_Cursor.Create(nil);
      try
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         // Inizio dell'impostazione della query che effettuerà l'inserimento
         Qry.SQL.Add('INSERT INTO RIGHIPRV (');
         // Elenco dei campi da inserire
         Qry.SQL.Add('TIPODOCUMENTO,'+
                     'NUMORDPREV,'+
                     'REGISTRO,'+
                     'DATADOCUMENTO,'+
                     'PROGRIGO,'+
                     'PROGRIGO2,'+
                     'CODICECLIENTE,'+
                     'CODICEARTICOLO,'+
                     'CODICEARTICOLOSTM,'+
                     'DESCRIZIONE,'+
                     'PREZZOUNITARIO,'+
                     'PREZZOUNITARIOIVACOMPRESA,'+
                     'UNITADIMISURA,'+
                     'QTA,'+
                     'SCONTORIGO,'+
                     'SCONTORIGO2,'+
                     'SCONTORIGO3,'+
                     'IMPORTORIGO,'+
                     'IMPORTORIGOIVACOMPRESA,'+
                     'PREZZOACQUISTOARTICOLO,'+
                     'CODICEIVA,'+
                     'MARGINE,'+
                     'MOVMAG,'+
                     'IMPORTOMARGINE,'+
                     'DESCRIZIONEIVA,'+
                     'ALIQUOTAIVA,'+
                     'CODICEMAGAZZINO,'+
                     'QTAOPERA,'+
                     'IMPORTOOPERA,'+
                     'IMPORTOCOMPONENTI,'+
                     'NOTERIGO,'+
                     'SELEZIONATO');
         // values
         Qry.SQL.Add(') VALUES (');
         // Elenco valori da inserire nei campi
                     // TIPONUMDATA
         Qry.SQL.Add(StrToSQLStr(   LeftStr(XDoc.TipoNumData.TipoDocumento,25)   ) +','+
                     IntToStr(XDoc.TipoNumData.NumOrdPrev) +','+
                     StrToSQLStr(   LeftStr(DefaultStr(XDoc.TipoNumData.Registro, '-'),5)   ) +','+
                     DateToSQLDate(XDoc.TipoNumData.DataDocumento) +','+
                     IntToStr(Rigo.ProgRigo) +','+
                     IntToStr(Rigo.ProgRigo2) +','+
                     IntToStr(Rigo.CodiceCliente) +','+
                     StrToSQLStr(   LeftStr(Rigo.CodiceArticolo,25)   ) +','+
                     StrToSQLStr(   LeftStr(Rigo.CodiceArticolo,25)   ) +','+
                     StrToSQLStr(   LeftStr(Rigo.Descrizione,5000)   ) +','+
                     StringReplace(Rigo.PrezzoUnitario, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.PrezzoUnitarioIVACompresa, ',', '.', [rfReplaceAll]) +','+

                     StrToSQLStr(   LeftStr(Rigo.UnitaDiMisura,2)   ) +','+

                     StringReplace(Rigo.QTA, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.ScontoRigo, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.ScontoRigo2, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.ScontoRigo3, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.ImportoRigo, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.ImportoRigoIVACompresa, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.PrezzoAcquistoArticolo, ',', '.', [rfReplaceAll]) +','+

                     IntToStr(CodIva) +','+
                     '0,'+                       // Rigo.Margine +','+
                     'NULL,'+                    // StrToSQLStr(Rigo.MovMag) +','+
                     '0,'+                       // Rigo.ImportoMargine +','+
                     StrToSQLStr(   LeftStr(DescIva,40)   ) +','+
                     FloatToStr(AliqIva) +','+
                     DM1.MagazzinoDefault +','+  // IntToStr(Rigo.CodiceMagazzino) +','+

                     StringReplace(Rigo.QtaOpera, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.ImportoOpera, ',', '.', [rfReplaceAll]) +','+
                     StringReplace(Rigo.ImportoComponenti, ',', '.', [rfReplaceAll]) +','+

                     StrToSQLStr(   LeftStr(Rigo.NoteRigo,20)   ) +','+
                     'NULL');   // StrToSQLStr(Rigo.Selezionato));
         // Chiude la parentesi
         Qry.SQl.Add(')');
         // Esegue la query
         Qry.ExecSQL;
      finally
         Qry.Free;
      end;
   end;

// -------------------------------------------------------------------------------------------
// FINE - SEZIONE PER IL CARICAMENTO DI UN DOCUMENTO DA UN FILE XML
// ===========================================================================================










// ===========================================================================================
// INIZIO - SEZIONE PER IL SALVATAGGIO DI UN DOCUMENTO IN UN FILE XML
// -------------------------------------------------------------------------------------------
   // Procedura principale da chiamare per effettuare il salvataggio del documento nel file XML
   function TLevanteSaveXMLDocument.SaveDocumentToXMLFile(TipoDoc:String; NumDoc:Integer; Registro:String; DataDoc:TDateTime) : String;
   var
      NomeFile : String;
   begin
      try
         // Inizializzazione
         Result := '';
         // Crea gli oggetti query per il caricamento del documento dal database
         MQ := TIB_Cursor.Create(nil);
         MQ.DatabaseName := DM1.ArcDBFile;
         MQ.IB_Connection := DM1.DBAzienda;
         DQ := TIB_Cursor.Create(nil);
         DQ.DatabaseName := DM1.ArcDBFile;
         DQ.IB_Connection := DM1.DBAzienda;
         // Imposta le query per il caricamento del documento
         CaricaDocumento(TipoDoc, NumDoc, Registro, DataDoc);
         // Crea il nuovo XDoc
         XDoc := NewDocumento;
         // Effettua il salvataggio dei dati del mittente
         SalvaDatiMittenteToXDoc;
         // Effettua il salvataggio delle testata documento nel XDoc
         SalvaTestataDocumentoToXDoc;
         // Salva i righi del documento nel XDoc
         SalvaRighiDocumentoToXDoc;
         // Costruisce il nome del file:
         NomeFile := CostruisciNomeFile;
         // Salva il file XML sul disco se tutto è andato bene altrimenti no
         if NomeFile <> '' then XDoc.OwnerDocument.SaveToFile(NomeFile);
         // Ritorna il nome completo del file del documento salvato
         Result := NomeFile;
      finally
         if Assigned(MQ) then begin MQ.Close; MQ.Free; end;
         if Assigned(DQ) then begin DQ.Close; DQ.Free; end;
      end;
   end;

   // Function che calcola il nome del file in base ai dati contenuti nel documento stesso
   function  TLevanteSaveXMLDocument.CostruisciNomeFile : String;
   var
      EM : String;   // Messaggio di errore
   begin
      // Inizializzazione
      Result := '';
      EM     := '';
      // Tipo Documento
      if XDoc.TipoNumData.TipoDocumento <> ''        then EM := EM + '-TDC-' + XDoc.TipoNumData.TipoDocumento        else raise Exception.Create('Tipo documento non trovato!');
      // Numero documento
      if IntToStr(XDoc.TipoNumData.NumOrdPrev) <> '' then EM := EM + '-NUM-' + IntToStr(XDoc.TipoNumData.NumOrdPrev) else raise Exception.Create('Numero documento non trovato!');
      // Registro
      if XDoc.TipoNumData.Registro <> ''             then EM := EM + '-REG-' + XDoc.TipoNumData.Registro             else raise Exception.Create('Registro documento non trovato!');
      // Data
      if XDoc.TipoNumData.DataDocumento <> ''        then EM := EM + '-DAT-' + XDoc.TipoNumData.DataDocumento        else raise Exception.Create('Data documento non trovata!');
      // P_IVA destinatario
      if XDoc.Intestatario.PartitaIVACli <> ''       then EM := EM + '-DST-' + XDoc.Intestatario.PartitaIVACli       else raise Exception.Create('Partita IVA del destinatario non trovata!');
      // P_IVA Mittente
      if XDoc.Mittente.MittPartitaIVA <> ''          then EM := EM + '-MIT-' + XDoc.Mittente.MittPartitaIVA          else raise Exception.Create('Partita IVA del mittente non trovata!');
      // Ragione Sociale Mittente
      if XDoc.Mittente.MittRagSoc <> ''              then EM := EM + '-MRS-' + XDoc.Mittente.MittRagSoc              else raise Exception.Create('Ragione Sociale del mittente non trovata!');
      // Directory e Estensione
      EM := DM1.CartellaTmp + EM + '.DXC';
      // Sostituisce alcuni caratteri proibiti nei nomi di files con altri corretti (/=§)
//      EM := StringReplace(EM, '/', '§', [rfReplaceAll]);
      EM := StringReplace(EM, '/', '', [rfReplaceAll]);
      // Ritorna il valore
      Result := EM;
   end;

   // Procedura che imposta e apre le query per prelevare il documento da salvare
   //  nel database
   procedure TLevanteSaveXMLDocument.CaricaDocumento(TipoDoc:String; NumDoc:Integer; Registro:String; DataDoc:TDateTime);
   begin
      // Imposta la query per il caricamento della TESTATA
      MQ.SQL.Clear;
      MQ.SQL.Add('SELECT * FROM PRVORDCL WHERE');
      MQ.SQL.Add('    TipoDocumento = ''' + TipoDoc + '''');
      MQ.SQL.Add('AND NumOrdPrev = ' + IntToStr(NumDoc));
      MQ.SQL.Add('AND Registro = ''' + Registro + '''');
      MQ.SQL.Add('AND DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
      // Apre la query, verifica di aver trovato il documento e se non lo trova solleva un'eccezione
      MQ.Open;
      if MQ.Eof then raise Exception.Create('"' + TipoDoc + ' N° ' + IntToStr(NumDoc) + Registro + ' del ' + DateToStr(DataDoc) + '" non trovato/a.');

      // Imposta la query per il caricamento dei RIGHI
      DQ.SQL.Add('SELECT * FROM RIGHIPRV WHERE');
      DQ.SQL.Add('    TipoDocumento = ''' + TipoDoc + '''');
      DQ.SQL.Add('AND NumOrdPrev = ' + IntToStr(NumDoc));
      DQ.SQL.Add('AND Registro = ''' + Registro + '''');
      DQ.SQL.Add('AND DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
      DQ.SQL.Add('ORDER BY PROGRIGO, PROGRIGO2');
      DQ.Open;
   end;

   // Procedura che salva la testata del documento e i totali nel XDoc
   procedure TLevanteSaveXMLDocument.SalvaTestataDocumentoToXDoc;
   begin
      // TIPONUMDATA
      XDoc.TipoNumData.TipoDocumento        := MQ.FieldByName('TipoDocumento').AsString;
      XDoc.TipoNumData.Registro             := MQ.FieldByName('Registro').AsString;
      XDoc.TipoNumData.NumOrdPrev           := MQ.FieldByName('NumOrdPrev').AsInteger;
      XDoc.TipoNumData.DataDocumento        := MQ.FieldByName('DataDocumento').AsString;
      XDoc.TipoNumData.TipoDocumentoesteso  := MQ.FieldByName('TipoDocumentoesteso').AsString;
      // INTESTATARIO
      XDoc.Intestatario.CodiceCliente       := MQ.FieldByName('CodiceCliente').AsInteger;
      XDoc.Intestatario.RagSocCli           := MQ.FieldByName('RagSocCli').AsString;
      XDoc.Intestatario.IndirizzoCli        := MQ.FieldByName('IndirizzoCli').AsString;
      XDoc.Intestatario.CittaCli            := MQ.FieldByName('CittaCli').AsString;
      XDoc.Intestatario.CAPCli              := MQ.FieldByName('CAPCli').AsString;
      XDoc.Intestatario.ProvinciaCli        := MQ.FieldByName('ProvinciaCli').AsString;
      XDoc.Intestatario.PartitaIVACli       := MQ.FieldByName('PartitaIVACli').AsString;
      // DESTINAZIONE MERCI
      XDoc.DestinazioneMerci.CodiceDestMerci      := MQ.FieldByName('CodiceDestMerci').AsInteger;
      XDoc.DestinazioneMerci.RagSocDestMerci      := MQ.FieldByName('RagSocDestMerci').AsString;
      XDoc.DestinazioneMerci.IndirizzoDestMerci   := MQ.FieldByName('IndirizzoDestMerci').AsString;
      XDoc.DestinazioneMerci.CAPDestMerci         := MQ.FieldByName('CAPDestMerci').AsString;
      XDoc.DestinazioneMerci.CittaDestMerci       := MQ.FieldByName('CittaDestMerci').AsString;
      XDoc.DestinazioneMerci.ProvinciaDestMerci   := MQ.FieldByName('ProvinciaDestMerci').AsString;
      // PRATICHE
      XDoc.Pratiche.Pratica                 := MQ.FieldByName('Pratica').AsInteger;
      XDoc.Pratiche.Pratica2                := MQ.FieldByName('Pratica2').AsInteger;
      XDoc.Pratiche.Pratica3                := MQ.FieldByName('Pratica3').AsInteger;
      XDoc.Pratiche.DataPratica1            := MQ.FieldByName('DataPratica1').AsString;
      XDoc.Pratiche.DataPratica2            := MQ.FieldByName('DataPratica2').AsString;
      XDoc.Pratiche.DataPratica3            := MQ.FieldByName('DataPratica3').AsString;
      // VARIE
      XDoc.Varie.Selezionato                := MQ.FieldByName('Selezionato').AsString;
      XDoc.Varie.MeseCompetenza             := MQ.FieldByName('MeseCompetenza').AsInteger;
      XDoc.Varie.CodiceMagazzino            := MQ.FieldByName('CodiceMagazzino').AsInteger;
      XDoc.Varie.Listino                    := MQ.FieldByName('Listino').AsInteger;
      XDoc.Varie.Argomento                  := MQ.FieldByName('Argomento').AsString;
      XDoc.Varie.Note                       := MQ.FieldByName('Note').AsString;
      XDoc.Varie.Messaggi                   := MQ.FieldByName('Messaggi').AsString;
      XDoc.Varie.Agente                     := MQ.FieldByName('Agente').AsInteger;
      // DATI CAUSALE
      XDoc.DatiCausale.Causale              := MQ.FieldByName('Causale').AsString;
      XDoc.DatiCausale.SegnoOperazione      := MQ.FieldByName('SegnoOperazione').AsString;
      XDoc.DatiCausale.DaFatturare          := MQ.FieldByName('DaFatturare').AsString;
      // TRASPORTO
      XDoc.Trasporto.TrasportoACura         := MQ.FieldByName('TrasportoACura').AsString;
      XDoc.Trasporto.DatiVettore            := MQ.FieldByName('DatiVettore').AsString;
      XDoc.Trasporto.DataTrasp              := MQ.FieldByName('DataTrasp').AsString;
      XDoc.Trasporto.OraTrasp               := MQ.FieldByName('OraTrasp').AsString;
      XDoc.Trasporto.NumColli               := MQ.FieldByName('NumColli').AsInteger;
      XDoc.Trasporto.AspettoEsterioreBeni   := MQ.FieldByName('AspettoEsterioreBeni').AsString;
      XDoc.Trasporto.Porto                  := MQ.FieldByName('Porto').AsString;
      // STATO
      XDoc.Stato.StatoDescrizione           := MQ.FieldByName('StatoDescrizione').AsString;
      XDoc.Stato.StatoForeground            := MQ.FieldByName('StatoForeground').AsString;
      XDoc.Stato.StatoBackground            := MQ.FieldByName('StatoBackground').AsString;
      // SUBSOGG
      XDoc.SubSogg.CodiceSubSogg            := MQ.FieldByName('CodiceSubSogg').AsInteger;
      XDoc.SubSogg.SubSoggCampo1            := MQ.FieldByName('SubSoggCampo1').AsString;
      XDoc.SubSogg.SubSoggCampo2            := MQ.FieldByName('SubSoggCampo2').AsString;
      XDoc.SubSogg.SubSoggCampo3            := MQ.FieldByName('SubSoggCampo3').AsString;
      // DATI OPERATORE
      XDoc.DatiOperatore.Operatore          := MQ.FieldByName('Operatore').AsString;
      XDoc.DatiOperatore.ValiditaDocumento  := MQ.FieldByName('ValiditaDocumento').AsString;
      XDoc.DatiOperatore.Consegna           := MQ.FieldByName('Consegna').AsString;
      // SCADENZE
      XDoc.Scadenze.DataScad1               := MQ.FieldByName('DataScad1').AsString;
      XDoc.Scadenze.DataScad2               := MQ.FieldByName('DataScad2').AsString;
      XDoc.Scadenze.DataScad3               := MQ.FieldByName('DataScad3').AsString;
      XDoc.Scadenze.DataScad4               := MQ.FieldByName('DataScad4').AsString;
      XDoc.Scadenze.DataScad5               := MQ.FieldByName('DataScad5').AsString;
      XDoc.Scadenze.ImportoScad1            := VirgolaPunto(MQ.FieldByName('ImportoScad1').AsFloat);
      XDoc.Scadenze.ImportoScad2            := VirgolaPunto(MQ.FieldByName('ImportoScad2').AsFloat);
      XDoc.Scadenze.ImportoScad3            := VirgolaPunto(MQ.FieldByName('ImportoScad3').AsFloat);
      XDoc.Scadenze.ImportoScad4            := VirgolaPunto(MQ.FieldByName('ImportoScad4').AsFloat);
      XDoc.Scadenze.ImportoScad5            := VirgolaPunto(MQ.FieldByName('ImportoScad5').AsFloat);
      // DATI PAGAMENTO
      XDoc.DatiPagamento.Pagamento          := MQ.FieldByName('Pagamento').AsInteger;
      XDoc.DatiPagamento.ABI                := MQ.FieldByName('ABI').AsString;
      XDoc.DatiPagamento.CAB                := MQ.FieldByName('CAB').AsString;
      // TOTALI
      XDoc.Totali.PrzUnitOpera              := VirgolaPunto(MQ.FieldByName('PrzUnitOpera').AsFloat);
      XDoc.Totali.TotaleMargine             := VirgolaPunto(MQ.FieldByName('TotaleMargine').AsFloat);
      XDoc.Totali.TotaleRighi1              := VirgolaPunto(MQ.FieldByName('TotaleRighi1').AsFloat);
      XDoc.Totali.TotaleRighi2              := VirgolaPunto(MQ.FieldByName('TotaleRighi2').AsFloat);
      XDoc.Totali.TotaleRighi3              := VirgolaPunto(MQ.FieldByName('TotaleRighi3').AsFloat);
      XDoc.Totali.TotaleRighi4              := VirgolaPunto(MQ.FieldByName('TotaleRighi4').AsFloat);
      XDoc.Totali.TotaleMerce               := VirgolaPunto(MQ.FieldByName('TotaleMerce').AsFloat);
      XDoc.Totali.ScontoAliquota1           := VirgolaPunto(MQ.FieldByName('ScontoAliquota1').AsFloat);
      XDoc.Totali.ScontoAliquota2           := VirgolaPunto(MQ.FieldByName('ScontoAliquota2').AsFloat);
      XDoc.Totali.ScontoAliquota3           := VirgolaPunto(MQ.FieldByName('ScontoAliquota3').AsFloat);
      XDoc.Totali.ScontoAliquota4           := VirgolaPunto(MQ.FieldByName('ScontoAliquota4').AsFloat);
      XDoc.Totali.TotaleSconti              := VirgolaPunto(MQ.FieldByName('TotaleSconti').AsFloat);
      XDoc.Totali.TotaleImponibile1         := VirgolaPunto(MQ.FieldByName('TotaleImponibile1').AsFloat);
      XDoc.Totali.TotaleImponibile2         := VirgolaPunto(MQ.FieldByName('TotaleImponibile2').AsFloat);
      XDoc.Totali.TotaleImponibile3         := VirgolaPunto(MQ.FieldByName('TotaleImponibile3').AsFloat);
      XDoc.Totali.TotaleImponibile4         := VirgolaPunto(MQ.FieldByName('TotaleImponibile4').AsFloat);
      XDoc.Totali.TotaleImponibile          := VirgolaPunto(MQ.FieldByName('TotaleImponibile').AsFloat);
      XDoc.Totali.CodiceIVA1                := MQ.FieldByName('CodiceIVA1').AsInteger;
      XDoc.Totali.CodiceIVA2                := MQ.FieldByName('CodiceIVA2').AsInteger;
      XDoc.Totali.CodiceIVA3                := MQ.FieldByName('CodiceIVA3').AsInteger;
      XDoc.Totali.CodiceIVA4                := MQ.FieldByName('CodiceIVA4').AsInteger;
      XDoc.Totali.ImportoIVA1               := VirgolaPunto(MQ.FieldByName('ImportoIVA1').AsFloat);
      XDoc.Totali.ImportoIVA2               := VirgolaPunto(MQ.FieldByName('ImportoIVA2').AsFloat);
      XDoc.Totali.ImportoIVA3               := VirgolaPunto(MQ.FieldByName('ImportoIVA3').AsFloat);
      XDoc.Totali.ImportoIVA4               := VirgolaPunto(MQ.FieldByName('ImportoIVA4').AsFloat);
      XDoc.Totali.TotaleIVA                 := VirgolaPunto(MQ.FieldByName('TotaleIVA').AsFloat);
      XDoc.Totali.TotaleNettoMerce          := VirgolaPunto(MQ.FieldByName('TotaleNettoMerce').AsFloat);
      XDoc.Totali.Spese                     := VirgolaPunto(MQ.FieldByName('Spese').AsFloat);
      XDoc.Totali.Abbuono                   := VirgolaPunto(MQ.FieldByName('Abbuono').AsFloat);
      XDoc.Totali.TotaleDocumento           := VirgolaPunto(MQ.FieldByName('TotaleDocumento').AsFloat);
      XDoc.Totali.TotaleDaPagare            := VirgolaPunto(MQ.FieldByName('TotaleDaPagare').AsFloat);
   end;

   // Procedura che salva i righi del documento nel XDoc
   procedure TLevanteSaveXMLDocument.SalvaRighiDocumentoToXDoc;
   begin
      // Cicla per tutti i righi
      while not DQ.Eof do begin
         // Per default l'oggetto è il nuovo rigoappena aggiunto
         with XDoc.CorpoDocumento.Add do begin
            TipoDocumento                   := DQ.FieldByName('TipoDocumento').AsString;
            NumOrdPrev                      := DQ.FieldByName('NumOrdPrev').AsInteger;
            Registro                        := DQ.FieldByName('Registro').AsString;
            DataDocumento                   := DQ.FieldByName('DataDocumento').AsString;
            ProgRigo                        := DQ.FieldByName('ProgRigo').AsInteger;
            ProgRigo2                       := DQ.FieldByName('ProgRigo2').AsInteger;
            CodiceCliente                   := DQ.FieldByName('CodiceCliente').AsInteger;
            CodiceArticolo                  := DQ.FieldByName('CodiceArticolo').AsString;
            Descrizione                     := DQ.FieldByName('Descrizione').AsString;
            PrezzoUnitario                  := VirgolaPunto(DQ.FieldByName('PrezzoUnitario').AsFloat);
            PrezzoUnitarioIVACompresa       := VirgolaPunto(DQ.FieldByName('PrezzoUnitarioIVACompresa').AsFloat);
            UnitaDiMisura                   := DQ.FieldByName('UnitaDiMisura').AsString;
            QTA                             := VirgolaPunto(DQ.FieldByName('QTA').AsFloat);
            ScontoRigo                      := VirgolaPunto(DQ.FieldByName('ScontoRigo').AsFloat);
            ScontoRigo2                     := VirgolaPunto(DQ.FieldByName('ScontoRigo2').AsFloat);
            ScontoRigo3                     := VirgolaPunto(DQ.FieldByName('ScontoRigo3').AsFloat);
            ImportoRigo                     := VirgolaPunto(DQ.FieldByName('ImportoRigo').AsFloat);
            ImportoRigoIVACompresa          := VirgolaPunto(DQ.FieldByName('ImportoRigoIVACompresa').AsFloat);
            PrezzoAcquistoArticolo          := VirgolaPunto(DQ.FieldByName('PrezzoAcquistoArticolo').AsFloat);
            CodiceIVA                       := DQ.FieldByName('CodiceIVA').AsInteger;
            Margine                         := VirgolaPunto(DQ.FieldByName('Margine').AsFloat);
            MovMag                          := DQ.FieldByName('MovMag').AsString;
            ImportoMargine                  := VirgolaPunto(DQ.FieldByName('ImportoMargine').AsFloat);
            DescrizioneIVA                  := DQ.FieldByName('DescrizioneIVA').AsString;
            AliquotaIVA                     := VirgolaPunto(DQ.FieldByName('AliquotaIVA').AsFloat);
            CodiceMagazzino                 := DQ.FieldByName('CodiceMagazzino').AsInteger;
            PrzUnitOpera                    := VirgolaPunto(DQ.FieldByName('OperaUnit').AsFloat);
            QtaOpera                        := VirgolaPunto(DQ.FieldByName('QtaOpera').AsFloat);
            ImportoOpera                    := VirgolaPunto(DQ.FieldByName('ImportoOpera').AsFloat);
            ImportoComponenti               := VirgolaPunto(DQ.FieldByName('ImportoComponenti').AsFloat);
            NoteRigo                        := DQ.FieldByName('NoteRigo').AsString;
            Selezionato                     := DQ.FieldByName('Selezionato').AsString;
         end;
         // Si sposta sul prossimo rigo
         DQ.Next;
      end;
   end;

   // Procedura che salva nel file XML i dati del mittente prendendoli dai DatiAzienda
   procedure TLevanteSaveXMLDocument.SalvaDatiMittenteToXDoc;
   var
      Qry : TIB_Cursor;
   begin
      Qry := TIB_Cursor.Create(nil);
      try
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         // Imposta la query per prelevare i dati del mittente dal database
         Qry.SQL.Add('SELECT RAGIONESOCIALE, INDIRIZZO, CITTA, PROVINCIA, CAP, P_IVA, TELEFONO, FAX, EMAIL FROM DATIAZIE');
         Qry.Open;
         if not Qry.Eof then begin
            // Inserisce i dati trovati nel documento XML
            XDoc.Mittente.MittRagSoc      := Qry.FieldByName('RAGIONESOCIALE').AsString;
            XDoc.Mittente.MittIndirizzo   := Qry.FieldByName('INDIRIZZO').AsString;
            XDoc.Mittente.MittCitta       := Qry.FieldByName('CITTA').AsString;
            XDoc.Mittente.MittProvincia   := Qry.FieldByName('PROVINCIA').AsString;
            XDoc.Mittente.MittCAP         := Qry.FieldByName('CAP').AsString;
            XDoc.Mittente.MittPartitaIVA  := Qry.FieldByName('P_IVA').AsString;
            XDoc.Mittente.MittTelefono    := Qry.FieldByName('TELEFONO').AsString;
            XDoc.Mittente.MittFax         := Qry.FieldByName('FAX').AsString;
            XDoc.Mittente.MittEmail       := Qry.FieldByName('EMAIL').AsString;
         end else begin
            raise Exception.Create('Dati azienda mittente non trovati.');
         end;
      finally
         Qry.Free;
      end;
   end;

// -------------------------------------------------------------------------------------------
// FINE - SEZIONE PER IL SALVATAGGIO DI UN DOCUMENTO IN UN FILE XML
// ===========================================================================================











// -------------------------------------------------------------------------------------------
// INIZIO - SEZIONE GENERALE
// ===========================================================================================
// Deaultizza la stringa ricevuta come parametro, se è vuota la sostituisce con il valore di
//  default.
function DefaultStr(SI, Default:String): String;
begin
   Result := SI;
   if Trim(SI) = '' then Result := Default;
end;

// Converte la stringa in ingresso in una stringa direttamente inseribile in una query
function  StrToSQLStr(SI:String) : String;
begin
   Result := 'NULL';
   // Se la stringa in ingresso non è una stringa nulla esegue la conversione, altrimenti ritorna ''
   if SI <> '' then Result := QuotedStr(SI);
end;

// Converte le date in stringa direttamente inseribile in una query
function  DateToSQLDate(DI:WideString) : String;
begin
   Result := 'NULL';
   // Se la stringa in ingresso non è una stringa nulla esegue la conversione, altrimenti ritorna ''
   if DI <> '' then begin
      Result := FormatDateTime('mm/dd/yyyy', StrToDate(DI));
      Result := QuotedStr(Result);
   end;
end;

function  VirgolaPunto(Numero:Real): String;
var
   ParteDecimaleStr: String;
   ParteDecimale: Real;
begin
   // Converte il numero in stringa sostituendo il carattere di separazione della parte decimale
   //  qualunque essa sia nel carattere '.' in modo che possa essere usato per la costruzione
   //  delle query SQL.
   //  NB: HO messo la funzione Abs perchè altrimenti con i numeri negativi dava un problema.
   ParteDecimale := Abs(Numero - Trunc(Numero));
   // COnverte la parte decimale del numero in stringa usando la funzione 'Format' e specificando
   //  un numero di decimali come impostato in DecMicroPrz, in questo modo si risolve un problema
   //  di precisione di conversione della funzione FloatToStr (Prima la usavo e mi scazzava in alcuni casi)
//   ParteDecimaleStr := Format('%0.' + IntToStr(DM1.DecMicroPrz) + 'f', [ParteDecimale]);
   ParteDecimaleStr := Format('%0.4f', [ParteDecimale]);
   // Taglia anche la parte eccedente dei decimali oltre i numero dei decimali dei microprezzi
//   Result := IntToStr(Trunc(Numero)) + '.' + LeftStr(RightStr(ParteDecimaleStr, Length(ParteDecimaleStr)-2), DM1.DecMicroPrz);
   Result := IntToStr(Trunc(Numero)) + '.' + RightStr(ParteDecimaleStr, Length(ParteDecimaleStr)-2);
end;
// -------------------------------------------------------------------------------------------
// FINE - SEZIONE GENERALE
// ===========================================================================================


end.
