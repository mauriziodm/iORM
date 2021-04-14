unit DataModule2;

interface

uses
  Windows, SysUtils, Classes, IB_Components, DB, IBODataset, cxCustomData, ImgList, cxGraphics,
  Controls, cxGrid, cxGridBandedTableView, UnitRepositoryIniFile, Buttons,
  cxHint, cxEdit, cxDBEditRepository, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, GTNVolaSMS, StdCtrls,
  dxPScxCommon, Variants, dxScreenTip, dxCustomHint,
  IB_Access, IdAntiFreezeBase, cxCustomPivotGrid, cxTextEdit,
//  Vcl.IdAntiFreeze,
  cxClasses, System.ImageList, cxImageList, IdAntiFreeze;

const
  // Hints relativi alle icone delle griglie
  HINT_MSG_SCADSOFF       = 'Indica la presenza di scadenze in sofferenza';
  HINT_MSG_CORRISPNOPAG   = 'Indica la presenza di un documento con "Corrispettivo Non Pagato"'#13' da chiudere (rosso) oppure già chiuso (verde)';
  HINT_MSG_URGENTE        = 'Indica la presenza di una chiamata o appuntamento urgente';
  HINT_MSG_CHIAMATA       = 'Indica la presenza di una una chiamata in attesa di fissare'#13'l''appuntamento (cornetta) oppure di un appuntamento già fissato'#13'ancora da eseguire (calendario)';
  HINT_MSG_PRESCRIZIONE   = 'Indica la presenza di una Prescrizione o Raccomandazione'#13'in attesa di essere risolta';
  HINT_MSG_ALLEGATO_FG    = 'Indica la presenza di un allegato F/G completato e pronto'#13'per essere inviato all''ente di competenza';
  HINT_MSG_STAMPATO       = 'Indica che è già stato stampato il foglio di lavoro'#13'o il kit per il tecnico';

  // --------------------------------------------------------------------------
  // Costanti per la stampa delle ETICHETTE
  // --------------------------------------------------------------------------
  IDX_ETICHETTA_ARTICOLO = 0;
  IDX_ETICHETTA_SOGGETTO = 1;


type
  TDM2 = class(TDataModule)
    ImpiantiListImages: TcxImageList;
    StrCertifiedPanelImages: TcxImageList;
    Trans_Str_Certified: TIB_Transaction;
    SP_Str_Certified: TIB_StoredProc;
    cxHintStyleController1: TcxHintStyleController;
    ComunicazioniListImages: TcxImageList;
    ComunicazioniListOk: TcxImageList;
    VolaSMS: TVolaSMS;
    IdAntiFreeze1: TIdAntiFreeze;
    TableLookupPA_RegimeFiscale: TIBOTable;
    TableLookupPA_RegimeFiscaleTIPO: TStringField;
    TableLookupPA_RegimeFiscaleVALORE: TStringField;
    TableLookupPA_RegimeFiscaleDESCRIZIONE: TStringField;
    SourceLookupPA_RegimeFiscale: TDataSource;
    TableLookupPA_RegimeFiscaleVALORE_DESCRIZIONE: TStringField;
    TableLookupPA_SocioUnico: TIBOTable;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    SourceLookupPA_SocioUnico: TDataSource;
    TableLookupPA_StatoLiquidazione: TIBOTable;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    SourceLookupPA_StatoLiquidazione: TDataSource;
    TableLookupPA_NaturaIVA: TIBOTable;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    SourceLookupPA_NaturaIVA: TDataSource;
    TableLookupPA_CondizioniPagamento: TIBOTable;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    SourceLookupPA_CondizioniPagamento: TDataSource;
    TableLookupPA_RitAccCausalePag: TIBOTable;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    SourceLookupPA_RitAccCausalePag: TDataSource;
    TableLookupPA_ModalitaPagamento: TIBOTable;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    SourceLookupPA_ModalitaPagamento: TDataSource;
    TableLookupPA_EsigibilitaIVA: TIBOTable;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    SourceLookupPA_EsigibilitaIVA: TDataSource;
    TableLookupPA_TipoDocumento: TIBOTable;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    SourceLookupPA_TipoDocumento: TDataSource;
    procedure ChiediConfermaPrescrizioneRisolta(DC:TcxCustomDataController; RI, Index_ItemFatto, Index_ItemFattoData, Index_ItemFattoNote: Integer);
    procedure PrescrizioniAllegato_MarcaComeFatta(ID: Integer; Data: TDateTime; Nota: String);
    procedure PrescrizioniImpegno_MarcaComeFatta(ID: Integer; Data: TDateTime; Nota: String);
    procedure RaccomandazioniAllegato_MarcaComeFatta(ID: Integer; Data: TDateTime; Nota: String);
    procedure RaccomandazioniImpegno_MarcaComeFatta(ID: Integer; Data: TDateTime; Nota: String);

    procedure SaveBandedTableView(Grid: TcxGrid; btv: TcxGridBandedTableView; NomeVista: String);
    procedure SalvaCaptionMemoria(NomeFile:String; CurrSB, Mem1,Mem2,Mem3,Mem4,Mem5,Mem6,Mem7,Mem8,Mem9,Mem0: TSpeedButton);
    procedure MemPredef_SaveSelection(Sez:String; CurrButton, Mem1, Mem2, Mem3, Mem4, Mem5, Mem6, Mem7, Mem8, Mem9, Mem0: TSpeedButton);
    function MemPredef_LoadSelection(Sez: String; Mem1, Mem2, Mem3, Mem4, Mem5, Mem6, Mem7, Mem8, Mem9, Mem0: TSpeedButton): TSpeedButton;
    procedure RichiamaMemoria(Grid:TcxGrid; btv:TcxGridBandedTableView; MemButton:TSpeedButton; Qry:TIBOQuery; OpenQuery:Boolean=True);
    procedure CaricaTitoliMemorie(NomeFile:String; Mem1,Mem2,Mem3,Mem4,Mem5,Mem6,Mem7,Mem8,Mem9,Mem0: TSpeedButton);
    procedure IBOQuery1BeforeOpen(DataSet: TDataSet);
    function isAltDown: Boolean;
    function isCtrlDown: Boolean;
    function isShiftDown: Boolean;
    procedure EmettiSuono(F: String);
    procedure Contratto_Rinnova(ContrattoDataScadenza:TDateTimeField; ContrattoMesiRinnovo:TIntegerField; ContrattoStato:TStringField; ContrattoRcevutaDisdetta:TStringField);
    procedure StringList_AddOPForFilter(SL: TStrings);
    function CalcolaPrezzoScontato(PrezzoLordo, Sc1, Sc2, Sc3: Variant): Double;
    procedure TableLookupPA_RegimeFiscaleCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    // Contiene il testo dell'ultimo Hint relativo ai ColumnHeaders
    fLastColumnHeaderHint: String;

    procedure Impianto_Converti(Codice: Integer; DataApertura: TDateTime; WaitFormMsg:String);
    function FloatingByStringDeleteinvalidChar(InStr: String): String;

    procedure SalvaVistaBandTableView(Grid: TcxGrid; btv: TcxGridBandedTableView; P: TRepositoryIniFile);
    procedure CaricaVistaBandTableView(Grid: TcxGrid; btv: TcxGridBandedTableView; P: TRepositoryIniFile);
    procedure ScaricaMemoryCaptionFile(NomeFile: String);
    procedure RestoreBandedTableView(Grid: TcxGrid; btv: TcxGridBandedTableView; NomeVista: String);
    procedure COM_Storico_RegistraInvioCom(ID_Msg: Integer; Destinazione: String);
  public
    { Public declarations }
    function GetDenominazioneSoggetto(const ACursor: TIB_Cursor): String;
    procedure CreaComunicazioniAutomatichePredefinite;
    procedure CreaOpPredefinite;
    procedure CreaLookupTableFatturaPA;
    procedure CreaCausali_1_6_1;
    procedure CreaAliquotaIVA_Ristrutturazione;
    procedure DisabilitaVecchieNatureIVA_1_6_1;
    procedure AvviaConversioneImpianti;
    procedure Stradario_SelezionaIndirizzo(FieldCodiceComune, FieldDenominazioneComune, FieldDenominazioneStrada, FieldSiglaProvincia, FieldCAP: TField);
    function Stradario_IndirizzoVerificato(inCodiceComune, inDenominazioneComune, inDenominazioneStrada, inSiglaProvincia: String): Boolean;
    procedure COM_CreaNuovaComunicazione(Tipo:String; ID_Soggetto, ID_Pratica:Integer);
    procedure COM_ApriComunicazione(ID: Integer);
    procedure SMS_Imposta;
    function SMS_CreditoResiduo: Integer;
    function SMS_CreditoResiduoLabel(Lbl:TLabel): String;
    function SMS_Invia(ID_Msg:Integer; DestNum, CorpoMsg: String): boolean;
    function EMAIL_Send(ID_Msg:Integer; sTo, sSubject: String; msg_lines: TStrings): Boolean;
    function LETTERA_Stampa(P_ID: Integer; Copie:Integer; Preview:Boolean=False): Boolean;
    procedure ColumnHeaderHint_Show(Messaggio: String; HintPosition: TPoint);
    procedure ColumnHeaderHint_Close;
    procedure ConvertiOpIva(Tabella: String);
    procedure StampaEtichette(TipoEtichetta: Integer);
    procedure StampaEtichettaSilent(Preview:Boolean; NomeEtichetta:String; NomeStampante:String='');
    procedure SvuotaTabellaEtichette(TipoEtichetta: Integer);
    procedure LoadTabellaEtichetteArticoli(const ACodiceArticolo:string='';const ASQLFromWhereCond:TStrings=nil; const ATipoDoc:String=''; const ARegistro:String=''; const ANumeroDoc:Integer=0; const ADataDoc:TDate=0; ACodiceCliente:Integer=0);
    procedure PersoneFisiche_CopiaCognomeNomeInRagioneSociale;
    procedure Automezzi_VerificaScadenze;
    function DateTimeToTrimestre(const ADateTime:TDateTime): String;
    function DateTimeToSemestre(const ADateTime:TDateTime): String;
    procedure ClearCantiereDoc(const APraticaField:TIntegerField; const ADataPraticaField:TDateTimeField; const AEditPratica:TcxTextEdit);
    procedure SalvaNotificaFE(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc:TDate; ResponseType, FileName, MsgCode, MsgText, MsgRaw: String; CheckForNotification: Boolean; NotificationWaitDays: Integer);
    procedure RetrodataNotificaFE(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc:TDate; Giorni: Integer);
    procedure DefaultizzaSiglaNazioneSoggetto;
    procedure DefaultizzaNaturaIVA_FE;
    function ControlloCodiceFiscalePartitaIva(ANome, ACognome, ACodiceFiscale, APartitaIVA, ASiglaNazione, ATipoPersona: string; const ARaiseException, ADisabilitaVerificaCodFisc: boolean): boolean;
    function SoggettoEstero(const ACodiceCliente: Integer): boolean;
    procedure ConvertiCampoEsibilitaIVAneiDocumenti;

    procedure EsportaChiamataAppuntamentoInBacheca(const AIDImpegno: Integer);
    procedure FatturaImpegno(const AIDImpegno, ACopie: integer; const ADataFatturazione: TDate; const ACreaScad: Boolean);
    procedure ChiudiImpegnoAuto(const AIDImpegno: integer; const AStampaFoglioLavoro, AStampaRCEE, AAggiornaImpianto, AFattura, AScadenze,
      AAnteprimeDiStampa: Boolean; const ADataFatturazione: TDate);
  end;
var
  DM2: TDM2;

implementation

uses DataModule1, Dialogs, StrUtils,
  FormConfermaPrescrizFatta, Forms, IniFiles, Graphics, SchedaClienti,
  FormSelezioneStradario, main, FormLevanteListAnag, //smtpsend,
  QRLettera, FormComunicazione, DComCrypto, FormOperazioniPianificate,
  MMSystem, FormEtichetteListStampa, IB_Session, USNCONTROLLO_CF_PI,
  DForce.ei.Encoding, idSMTP, idMessage, idAttachmentFile, IdSSLOpenSSL, IdExplicitTLSClientServerBase,
  SchedaPreventiviOrdini, FormImpegni;

{$R *.dfm}

function TDM2.GetDenominazioneSoggetto(const ACursor: TIB_Cursor): String;
begin
  if  (ACursor.FieldByName('TipoPersona').AsString = 'F')
  and (   (ACursor.FieldByName('Nome').AsString <> '') or (ACursor.FieldByName('Cognome').AsString <> '')   )
  then
    Result := Trim(ACursor.FieldByName('Cognome').AsString + ' ' + ACursor.FieldByName('Nome').AsString)
  else
    Result := ACursor.FieldByName('RagioneSociale').AsString;
end;


// =============================================================================
// INIZIO GESTIONE STAMPA ETICHETTE
// -----------------------------------------------------------------------------

// Procedure che stampa l'etichetta del tipo specificato
procedure TDM2.StampaEtichette(TipoEtichetta:Integer);
begin
  // Crea la form per la stampa delle etichette
  Application.CreateForm(TEtichetteListStampaForm, EtichetteListStampaForm);
  EtichetteListStampaForm.Parent := MainForm;
  EtichetteListStampaForm.TipoEtichetta := TipoEtichetta;
  EtichetteListStampaForm.Show;
end;

// Procedure che stampa l'etichetta specificata nei parametri
procedure TDM2.StampaEtichettaSilent(Preview:Boolean; NomeEtichetta:String; NomeStampante:String='');
begin
  // Crea la form per la stampa delle etichette
  Application.CreateForm(TEtichetteListStampaForm, EtichetteListStampaForm);
  EtichetteListStampaForm.Parent := MainForm;
  EtichetteListStampaForm.PrintSilent(Preview, NomeEtichetta, NomeStampante);
end;

// Pubblica non fa parte dell'oggetto
procedure TDM2.SvuotaTabellaEtichette(TipoEtichetta:Integer);
var
   Qry:TIB_Cursor;
   Tabella:String;
begin
   Qry := TIB_Cursor.Create(nil);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // IMposta il nome della tabella
      case TipoEtichetta of
         IDX_ETICHETTA_ARTICOLO: Tabella := 'LABART';
         IDX_ETICHETTA_SOGGETTO: Tabella := 'LABSOGG';
      end;
      // Svuota l'archivio appoggio per le etichette degli articoli
      Qry.SQL.Add('DELETE FROM ' + Tabella + ' WHERE CODICESTAZIONE = ' + QuotedStr(DM1.CodiceUtente));
      Qry.ExecSql;
   finally
      Qry.Free;
   end;
end;

// Se il soggetto è una persona fisica copia il cognome+nome nella ragione sociale
procedure TDM2.PersoneFisiche_CopiaCognomeNomeInRagioneSociale;
var
   Qry:TIB_Cursor;
   Tabella:String;
begin
   Qry := TIB_Cursor.Create(nil);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE CLIENTI SET RAGIONESOCIALE = SUBSTRING(  TRIM(COALESCE(COGNOME,'''') || '' '' || COALESCE(NOME,''''))  FROM 1 FOR 60)');
      Qry.SQL.Add('WHERE COALESCE(TIPOPERSONA,'''') = ''F''');
      Qry.SQL.Add('  AND TRIM(COALESCE(COGNOME,'''')) <> ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(NOME,'''')) <> ''''');
      Qry.ExecSql;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE CLIENTI SET RAGIONESOCIALE = SUBSTRING(  TRIM(COALESCE(COGNOME,'''') || '' '' || COALESCE(NOME,''''))  FROM 1 FOR 60)');
      Qry.SQL.Add('WHERE COALESCE(RAGIONESOCIALE,'''') = ''''');
      Qry.ExecSql;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE CLIENTI SET COGNOME = RAGIONESOCIALE');
      Qry.SQL.Add('WHERE COALESCE(COGNOME,'''') = ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(RAGIONESOCIALE,'''')) <> ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(NOME,'''')) = ''''');
      Qry.ExecSql;



      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE PRATICHE SET RAGSOCRESPIMP = SUBSTRING(  TRIM(COALESCE(COGNOMERESPIMP,'''') || '' '' || COALESCE(NOMERESPIMP,''''))  FROM 1 FOR 60)');
      Qry.SQL.Add('WHERE COALESCE(NATURAGIURIDICARESPIMP,'''') = ''F''');
      Qry.SQL.Add('  AND TRIM(COALESCE(COGNOMERESPIMP,'''')) <> ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(NOMERESPIMP,'''')) <> ''''');
      Qry.ExecSql;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE PRATICHE SET RAGSOCRESPIMP = SUBSTRING(  TRIM(COALESCE(COGNOMERESPIMP,'''') || '' '' || COALESCE(NOMERESPIMP,''''))  FROM 1 FOR 60)');
      Qry.SQL.Add('WHERE COALESCE(RAGSOCRESPIMP,'''') = ''''');
      Qry.ExecSql;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE PRATICHE SET COGNOMERESPIMP = RAGSOCRESPIMP');
      Qry.SQL.Add('WHERE COALESCE(COGNOMERESPIMP,'''') = ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(RAGSOCRESPIMP,'''')) <> ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(NOMERESPIMP,'''')) = ''''');
      Qry.ExecSql;



      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE ALLEGATI_MANUT SET RAGSOCRESPIMP = SUBSTRING(  TRIM(COALESCE(COGNOMERESPIMP,'''') || '' '' || COALESCE(NOMERESPIMP,''''))  FROM 1 FOR 60)');
      Qry.SQL.Add('WHERE COALESCE(NATURAGIURIDICARESPIMP,'''') = ''F''');
      Qry.SQL.Add('  AND TRIM(COALESCE(COGNOMERESPIMP,'''')) <> ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(NOMERESPIMP,'''')) <> ''''');
      Qry.ExecSql;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE ALLEGATI_MANUT SET RAGSOCRESPIMP = SUBSTRING(  TRIM(COALESCE(COGNOMERESPIMP,'''') || '' '' || COALESCE(NOMERESPIMP,''''))  FROM 1 FOR 60)');
      Qry.SQL.Add('WHERE COALESCE(RAGSOCRESPIMP,'''') = ''''');
      Qry.ExecSql;

      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE ALLEGATI_MANUT SET COGNOMERESPIMP = RAGSOCRESPIMP');
      Qry.SQL.Add('WHERE COALESCE(COGNOMERESPIMP,'''') = ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(RAGSOCRESPIMP,'''')) <> ''''');
      Qry.SQL.Add('  AND TRIM(COALESCE(NOMERESPIMP,'''')) = ''''');
      Qry.ExecSql;
   finally
      Qry.Free;
   end;
end;

procedure TDM2.TableLookupPA_RegimeFiscaleCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('VALORE_DESCRIZIONE').Value :=
    DataSet.FieldByName('VALORE').AsString + ' - ' + DataSet.FieldByName('DESCRIZIONE').AsString;
end;

// -----------------------------------------------------------------------------
// FINE GESTIONE STAMPA ETICHETTE
// =============================================================================







// =============================================================================
// INIZIO GESTIONE HINTS
// -----------------------------------------------------------------------------
procedure TDM2.ColumnHeaderHint_Show(Messaggio:String; HintPosition: TPoint);
begin
  // Solo è gli hint sono abilitati
  if not DM1.HINT_ENABLED then Exit;
  // Se non è già visualizzato un hint oppure se l'hint attuale contiene un
  //  messaggio diverso provvede a visualizzare il nuovo Hint altrimenti nulla.
  if (cxHintStyleController1.Tag = 0) or (Messaggio <> fLastColumnHeaderHint) then begin
    // Visualizza l'Hint
    cxHintStyleController1.ShowHint(HintPosition.X, HintPosition.Y, '', Messaggio);
    // Memorizza l'ultimo Hint visualizzato
    fLastColumnHeaderHint := Messaggio;
    // Marca l'Hint come visualizzato.
    cxHintStyleController1.Tag := 1;
  end;
end;

procedure TDM2.ColumnHeaderHint_Close;
begin
  // Se c'è un Hint visualizzato lo chiude
  if cxHintStyleController1.Tag = 1 then begin
    cxHintStyleController1.HideHint;
    // Marca l'Hint come NON visualizzato.
    cxHintStyleController1.Tag := 0;
  end;
end;
// -----------------------------------------------------------------------------
// FINE GESTIONE HINTS
// =============================================================================

function TDM2.CalcolaPrezzoScontato(PrezzoLordo, Sc1, Sc2, Sc3: Variant): Double;
begin
  // Defaultizzazione dei parametri
  if VarIsNull(PrezzoLordo) then PrezzoLordo := 0;
  if VarIsNull(Sc1) then Sc1 := 0;
  if VarIsNull(Sc2) then Sc2 := 0;
  if VarIsNull(Sc3) then Sc3 := 0;
  Result := PrezzoLordo;
  // Calcola l'importo scontato e applica solo alla fine l'arrotondamento
  Result := Result - Result / 100 * Sc1;
  Result := Result - Result / 100 * Sc2;
  Result := Result - Result / 100 * Sc3;
  Result := DM1.Arrotonda(Result, DM1.DecMicroPrz);
end;




// Procedure che aggiunge ad una StringList l'elenco delle Operazioni Pianificate presenti negli interventi fatti
procedure TDM2.StringList_AddOpForFilter(SL:TStrings);
var
   Q: TIB_Cursor;
   LItemDesc: String;
   LItemID: String;
begin
  // Crea e imposta la query che effettuerà la registrazione dell'invio della
  //  comunicazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT CODICE, DESCRIZIONE FROM OP ORDER BY DESCRIZIONE');
    Q.Open;
    // Cicla per i records trovati e li aggiunge alla STringList
    while not Q.Eof do begin
      LItemID := Q.FieldByName('CODICE').AsString;
      LItemDesc := 'op: ' + Q.FieldByName('CODICE').AsString + ' - ' + Q.FieldByName('DESCRIZIONE').AsString;
      SL.AddObject(LItemDesc, TObject(LItemID));
      Q.Next;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;


// Procedure che emmette il suono specificato
procedure TDM2.EmettiSuono(F:String);
begin
  // Emette il suono di apertura del menù
  // NB: NOn deve dare errori per nessun motivo
  try
    sndPlaySound(PChar(DM1.CurrDir + F), SND_NODEFAULT Or SND_ASYNC);
  except
  end;
end;



procedure TDM2.EsportaChiamataAppuntamentoInBacheca(const AIDImpegno: Integer);
var
  QryImpegno, QryPrat, QryApp, QryOP, QryOut: TIB_Cursor;
  LIDPratica, LIDApparecchio, LProgRigo: Integer;
  LDescrizione: String;
  LPiuDiUnApparecchio: Boolean;
  procedure CleanUp;
  begin
    if Assigned(QryImpegno) then
      QryImpegno.Free;
    if Assigned(QryPrat) then
      QryPrat.Free;
    if Assigned(QryOP) then
      QryOP.Free;
    if Assigned(QryOut) then
      QryOut.Free;
  end;
  procedure OpenQueryImpegni;
  begin
    QryImpegno := DM1.NewQuery;
    QryImpegno.SQL.Add('SELECT I.ID, I.REGISTRO, I.TIPOIMPEGNO, START_EVENT, I.DATAORACHIAMATA, I.CLIENTE, I.PRATICA, I.DATAPRATICA1, I.IDPRATICA, I.RDA');
    QryImpegno.SQL.Add('FROM IMPEGNI I WHERE I.ID = ' + AIDImpegno.ToString);
    QryImpegno.Open;
  end;
  procedure OpenQueryPrat;
  begin
    QryPrat := DM1.NewQuery;
    QryPrat.SQL.Add('SELECT P.CONTRATTO_STATO, P.CONTRATTO_TIPO, P.CONTRATTO_NUMERO, P.CONTRATTO_DATASTIPULA, P.CONTRATTO_CODICEIVA,');
    QryPrat.SQL.Add('AI.ALIQUOTAIVA, AI.DESCRIZIONEIVA, P.CONTRATTO_IMPORTO, P.CONTRATTO_SCONTO1, P.CONTRATTO_SCONTO2, P.CONTRATTO_SCONTO3,');
    QryPrat.SQL.Add('P.CONTRATTO_IMPORTONETTOIVACOMP');
    QryPrat.SQL.Add('FROM PRATICHE P');
    QryPrat.SQL.Add('LEFT JOIN ALIQIVA AI ON (AI.CODICEIVA = P.CONTRATTO_CODICEIVA)');
    QryPrat.SQL.Add('WHERE P.ID = ' + LIDPratica.ToString);
    QryPrat.Open;
  end;
  function PiuDiUnApparecchio(const AIDPratica: Integer): Boolean;
  begin
    QryApp := DM1.NewQuery;
    try
      QryApp.SQL.Add('SELECT COUNT(*) FROM PRATAPPARECCHI PA WHERE PA.IDPRATICA = ' + AIDPratica.ToString);
      QryApp.Open;
      Result := QryApp.Fields[0].AsInteger > 1;
    finally
      QryApp.Free;
    end;
  end;
  function GetDatiApparecchio(const AIDApparecchio: Integer): String;
  begin
    QryApp := DM1.NewQuery;
    try
      QryApp.SQL.Add('SELECT PA.COSTRUTTORE, PA.MODELLO, PA.MATRICOLA FROM PRATAPPARECCHI PA WHERE PA.ID = ' + AIDApparecchio.ToString);
      QryApp.Open;
      if QryApp.Eof then
        Exit('');
      Result := Format('%s %s %s', [QryApp.FieldByName('COSTRUTTORE').AsString, QryApp.FieldByName('MODELLO').AsString, QryApp.FieldByName('MATRICOLA').AsString]).Trim;
      if Result <> '' then
        Result := Format(' (%s)', [Result]);
    finally
      QryApp.Free;
    end;
  end;
  procedure OpenQueryOP;
  begin
    QryOP := DM1.NewQuery;
    QryOP.SQL.Add('SELECT OP.IDOP, OP.DESCRIZIONE, OP.PRZUNIT, OP.SCONTO1, OP.SCONTO2, OP.SCONTO2, OP.PRZUNITNETTOIVACOMP, OP.ADDEBITA, OP.INABBONAMENTO,');
    QryOP.SQL.Add('OP.CODICEIVA, AI.ALIQUOTAIVA, AI.DESCRIZIONEIVA, OP.IDAPPARECCHIOPRAT');
    QryOP.SQL.Add('FROM OPIMPEGNO OP');
    QryOP.SQL.Add('LEFT JOIN ALIQIVA AI ON (AI.CODICEIVA = OP.CODICEIVA)');
    QryOP.SQL.Add('WHERE OP.IDIMPEGNO = ' + AIDImpegno.ToString + ' AND OP.DAEFFETTUARE = ''T'' AND OP.ADDEBITA <> ''F''');
    QryOP.SQL.Add('ORDER BY OP.INABBONAMENTO DESC'); // Prima le OP comprese nell'abbonamento
    QryOP.Open;
  end;
  procedure PrepareQueryOut;
  begin
    QryOut := DM1.NewQueryLevGen;
    QryOut.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, TipoDocumentoEsteso, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloStm, Pratica, DataPratica,');
    QryOut.SQL.Add('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
    QryOut.SQL.Add('Margine, ImportoMargine)');
    QryOut.SQL.Add('values (');
    QryOut.SQL.Add(':P_STATION_ID, :P_TipoDocumento, :P_TipoDocumentoEsteso, :P_Registro, :P_NumOrdPrev, :P_DataDocumento, :P_ProgRigo, :P_ProgRigo2, :P_CodiceCliente, :P_CodiceArticolo, :P_CodiceArticoloStm, :P_Pratica, :P_DataPratica,');
    QryOut.SQL.Add(':P_CodiceIVA, :P_DescrizioneIVA, :P_AliquotaIVA, :P_Descrizione, :P_PrezzoUnitario, :P_PrezzoUnitarioIVACompresa, :P_QTA, :P_ScontoRigo, :P_ScontoRigo2, :P_ScontoRigo3, :P_UnitaDiMisura, :P_PrezzoAcquistoArticolo,');
    QryOut.SQL.Add(':P_Margine, :P_ImportoMargine)');
    QryOut.Prepare;
  end;
  procedure EsportaVoce(const ACodArt, ADescrizione, AUM: String; const AQta, APrzUnit, APrzUnitIC, ASconto1, ASconto2, ASconto3: Double;
    const ACodIVA: Integer; const ADescIVA: String; const AAliqIVA: Double);
  begin
    QryOut.ParamByName('P_STATION_ID').AsString := DM1.CodiceUtente;
    QryOut.ParamByName('P_TipoDocumento').AsString := QryImpegno.FieldByName('TIPOIMPEGNO').AsString;
    QryOut.ParamByName('P_TipoDocumentoEsteso').AsString := QryImpegno.FieldByName('TIPOIMPEGNO').AsString;
    QryOut.ParamByName('P_Registro').AsString := QryImpegno.FieldByName('REGISTRO').AsString;
    QryOut.ParamByName('P_NumOrdPrev').AsInteger := QryImpegno.FieldByName('ID').AsInteger;
    if QryOut.ParamByName('P_TipoDocumento').AsString = 'Chiamata' then
      QryOut.ParamByName('P_DataDocumento').AsDateTime := QryImpegno.FieldByName('DATAORACHIAMATA').AsDate
    else
      QryOut.ParamByName('P_DataDocumento').AsDateTime := QryImpegno.FieldByName('START_EVENT').AsDate;
    QryOut.ParamByName('P_ProgRigo').AsInteger := LProgRigo;
    QryOut.ParamByName('P_ProgRigo2').AsInteger := -1;
    QryOut.ParamByName('P_CodiceCliente').AsInteger := QryImpegno.FieldByName('CLIENTE').AsInteger;
    QryOut.ParamByName('P_Pratica').AsInteger := QryImpegno.FieldByName('PRATICA').AsInteger;
    QryOut.ParamByName('P_DataPratica').AsDateTime := QryImpegno.FieldByName('DATAPRATICA1').AsDateTime;
    QryOut.ParamByName('P_CodiceArticolo').AsString := ACodArt;
    QryOut.ParamByName('P_CodiceArticoloStm').AsString := ACodArt;
    QryOut.ParamByName('P_Descrizione').AsString := ADescrizione;
    QryOut.ParamByName('P_UnitaDiMisura').AsString := AUM;
    if AQta <> 0 then
      QryOut.ParamByName('P_QTA').AsDouble := AQta
    else
      QryOut.ParamByName('P_QTA').Clear;
    QryOut.ParamByName('P_PrezzoUnitario').AsDouble := APrzUnit;
    QryOut.ParamByName('P_PrezzoUnitarioIVACompresa').AsDouble := APrzUnitIC;
    QryOut.ParamByName('P_ScontoRigo').AsDouble := ASconto1;
    QryOut.ParamByName('P_ScontoRigo2').AsDouble := ASconto2;
    QryOut.ParamByName('P_ScontoRigo3').AsDouble := ASconto3;
    QryOut.ParamByName('P_PrezzoAcquistoArticolo').AsDouble := APrzUnit;
    QryOut.ParamByName('P_Margine').AsDouble := 0;
    QryOut.ParamByName('P_ImportoMargine').AsDouble := 0;
    QryOut.ParamByName('P_CodiceIVA').AsInteger := ACodIVA;
    QryOut.ParamByName('P_DescrizioneIVA').AsString := ADescIVA;
    QryOut.ParamByName('P_AliquotaIVA').AsDouble := AAliqIVA;
    QryOut.ExecSQL;
  end;
begin
  try
    LProgRigo := 1;
    // Crea e apre le query che forniscono i dati
    OpenQueryImpegni;
    LIDPratica := QryImpegno.FieldByName('IDPRATICA').AsInteger;
    if LIDPratica <= 0 then
      raise Exception.Create('Esportazione chiamata/appuntamento in bacheca: ID pratica non valido.');
    LPiuDiUnApparecchio := PiuDiUnApparecchio(LIDPratica);
    OpenQueryPrat;
    OpenQueryOP;
    PrepareQueryOut;
    // Rinnovo contratto
    EsportaVoce(
      '', // codice articolo
      Format('Rinnovo contratto %d del %s (%s)', [QryPrat.FieldByName('CONTRATTO_NUMERO').AsInteger, FormatDateTime('dd/mm/yyyy', QryPrat.FieldByName('CONTRATTO_DATASTIPULA').AsDateTime), QryPrat.FieldByName('CONTRATTO_TIPO').AsString]), // descrizione
      '', // UM
      1, // Qtà
      QryPrat.FieldByName('CONTRATTO_IMPORTO').AsDouble, // PrzUnit
      QryPrat.FieldByName('CONTRATTO_IMPORTONETTOIVACOMP').AsDouble, // PrzUnitIvaComp
      QryPrat.FieldByName('CONTRATTO_SCONTO1').AsDouble, // sconto 1
      QryPrat.FieldByName('CONTRATTO_SCONTO2').AsDouble, // sconto 2
      QryPrat.FieldByName('CONTRATTO_SCONTO3').AsDouble, // sconto 3
      QryPrat.FieldByName('CONTRATTO_CODICEIVA').AsInteger, // codice iva
      QryPrat.FieldByName('DESCRIZIONEIVA').AsString, // descrizione iva
      QryPrat.FieldByName('ALIQUOTAIVA').AsDouble); // aliquota iva
    // Operazioni pianificate
    while not QryOP.eof do
    begin
      Inc(LProgRigo);
      LIDApparecchio := QryOP.FieldByName('IDAPPARECCHIOPRAT').AsInteger;
      LDescrizione := QryOP.FieldByName('DESCRIZIONE').AsString;
      if LPiuDiUnApparecchio and (LIDApparecchio > 0) then
        LDescrizione := LDescrizione + GetDatiApparecchio(LIDApparecchio);
      if QryOP.FieldByName('INABBONAMENTO').AsString <> 'T' then
        EsportaVoce(
          QryOP.FieldByName('IDOP').AsString, // codice articolo
          LDescrizione, // descrizione
          '', // UM
          1, // Qtà
          QryOP.FieldByName('PRZUNIT').AsDouble, // PrzUnit
          QryOP.FieldByName('PRZUNITNETTOIVACOMP').AsDouble, // PrzUnitIvaComp
          QryOP.FieldByName('SCONTO1').AsDouble, // sconto 1
          QryOP.FieldByName('SCONTO2').AsDouble, // sconto 2
          QryOP.FieldByName('SCONTO3').AsDouble, // sconto 3
          QryOP.FieldByName('CODICEIVA').AsInteger, // codice iva
          QryOP.FieldByName('DESCRIZIONEIVA').AsString, // descrizione iva
          QryOP.FieldByName('ALIQUOTAIVA').AsDouble) // aliquota iva
      else
        EsportaVoce(
          QryOP.FieldByName('IDOP').AsString, // codice articolo
          LDescrizione, // descrizione
          '', // UM
          0, // Qtà
          0, // PrzUnit
          0, // PrzUnitIvaComp
          0, // sconto 1
          0, // sconto 2
          0, // sconto 3
          QryOP.FieldByName('CODICEIVA').AsInteger, // codice iva
          QryOP.FieldByName('DESCRIZIONEIVA').AsString, // descrizione iva
          QryOP.FieldByName('ALIQUOTAIVA').AsDouble); // aliquota iva
      QryOP.Next;
    end;
  finally
    CleanUp;
  end;
end;

// =============================================================================
// INIZIO: PARTE PER CONTROLLARE SE CTRL/ALT/SHIFT SONO PREMUTI
// -----------------------------------------------------------------------------
function TDM2.isCtrlDown : Boolean;
var
   State : TKeyboardState;
begin
   GetKeyboardState(State) ;
   Result := ((State[vk_Control] And 128) <> 0) ;
end;

function TDM2.isShiftDown : Boolean;
var
   State : TKeyboardState;
begin
   GetKeyboardState(State) ;
   Result := ((State[vk_Shift] and 128) <> 0) ;
end;

function TDM2.isAltDown : Boolean;
var
   State : TKeyboardState;
begin
   GetKeyboardState(State) ;
   Result := ((State[vk_Menu] and 128) <> 0) ;
end;
// -----------------------------------------------------------------------------
// FINE: PARTE PER CONTROLLARE SE CTRL/ALT/SHIFT SONO PREMUTI
// =============================================================================


// =============================================================================
// INIZIO: PARTE COMUNE DELLE COMUNICAZIONI
// -----------------------------------------------------------------------------
// Crea una comunicazione esistente
procedure TDM2.COM_CreaNuovaComunicazione(Tipo:String; ID_Soggetto, ID_Pratica:Integer);
begin
  Application.CreateForm(TComunicazioneForm, ComunicazioneForm);
  ComunicazioneForm.Parent := MainForm;
  ComunicazioneForm.P_NEW_TIPO_COMUNICAZIONE := Tipo;
  if ID_Soggetto > 0 then
    ComunicazioneForm.P_NEW_ID_SOGGETTO := ID_Soggetto;
  if ID_Pratica > 0  then
  begin
    ComunicazioneForm.P_NEW_ID_PRATICA  := ID_Pratica;
    // NB: Queste due righe sotto le ho aggiunte per risolvere un problema a Sabrina Eurogas
    //  il problema era che se si creava una comunicazione manualmente selezionando prima un
    //  impianto non venivano caricati i dati dell'impianto perchè mancavano appunto se info settate da
    //  queste die righe. Ora ho fissato il tutto come riferimento a un "IMpianto" in modo fisso poi vediamo
    ComunicazioneForm.P_NEW_ID_RIF := ID_Pratica;
    ComunicazioneForm.P_NEW_RIF_DATO := 'Impegno';
  end;
  ComunicazioneForm.Tag := 2;
  ComunicazioneForm.Show;
end;
// Apre una comunicazione esistente
procedure TDM2.COM_ApriComunicazione(ID:Integer);
begin
  Application.CreateForm(TComunicazioneForm, ComunicazioneForm);
  ComunicazioneForm.Parent := MainForm;
  ComunicazioneForm.Tag := 1;
  ComunicazioneForm.P_MOD_ID := ID;
  ComunicazioneForm.Show;
end;

// Procedura che registra l'invio di una comunicazione nell'apposito storico
procedure TDM2.COM_Storico_RegistraInvioCom(ID_Msg:Integer; Destinazione:String);
var
   Q: TIB_Cursor;
begin
  // Crea e imposta la query che effettuerà la registrazione dell'invio della
  //  comunicazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('INSERT INTO COM_STORICO (ID_MSG, DATAORAINVIO, DESTINAZIONE, OPERATORE)');
    Q.SQL.Add('VALUES (' + IntToStr(ID_Msg) + ', CURRENT_TIMESTAMP, ' + QuotedStr(Destinazione) + ', ' + QuotedStr(DM1.IDOperatoreCorrente) + ')');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE: PARTE COMUNE DELLE COMUNICAZIONI
// =============================================================================


// =============================================================================
// INIZIO: PARTE DEGLI SMS
// -----------------------------------------------------------------------------
// Procedura che imposta il componente di invio SMS
procedure TDM2.SMS_Imposta;
var
  UserName, Password: String;
begin
  // Imposta i parametri
  // NB: Se sono stati specificati nome utente e password nel parametri e
  //      progressivi specifici per l'invio degli sms usa quelli inseriti
  //      altirmenti usa la partita IVA e il Codice di attivazione dei
  //      Dati Azienda
  UserName := Trim(DM1.TableProgressivi2SMS_SERVER_USERNAME.AsString);
  Password := Trim(DM1.TableProgressivi2SMS_SERVER_PASSWORD.AsString);

  if (UserName = '') and (Password = '') then begin
    // Se il codice di attivazione non è valido esce subito
    if not DM1.VerificaCodiceAttivazioneTeletrasporto then begin
      raise Exception.Create('CODICE DI ATTIVAZIONE NON VALIDO !!!'#13#13'Chiamare il centro servizi.');
    end;
    // Se invece è valido ...
    UserName := Trim(DM1.TableDatiAziendaP_IVA.AsString);
    Password := CleanStringFromSeparators(DM1.TableDatiAziendaCA_CODICEATTIVAZIONE.AsString);
  end;

  VolaSMS.VolaUser  := Trim(DM1.TableProgressivi2SMS_SERVER_USERNAME.AsString);
  VolaSMS.VolaPwd   := Trim(DM1.TableProgressivi2SMS_SERVER_PASSWORD.AsString);
end;

// Funzione che ritorna il credito residuo sotto forma di numero di messaggi che
//  si possono ancora inviare.
function TDM2.SMS_CreditoResiduo: Integer;
begin
  // Inizializzazione
  Result := -1;
  // Se non c'è connessione a internet ovviamente non fa nulla
  if not DM1.InternetIsConnected then Exit;
  // Imposta il componente per la comunicazione SMS
  SMS_Imposta;
  // Interroga il server
  Result := VolaSMS.GetCredit;
end;

// Come sopra ma imposta direttamente la Label che visualizza
//  il credito residuo e in rosso se aiamo sotto la soglia
function TDM2.SMS_CreditoResiduoLabel(Lbl:TLabel): String;
var
  Cred: Integer;
begin
  // Carica il credito
  Cred := -1;
  Cred := SMS_CreditoResiduo;
  // Determina la stringa da visualizzare nell'etichetta
  if Cred > -1
  then Result := IntToStr(Cred)
  else Result := '- - -';
  // Se è specificata una TLabel la imposta direttamente e in rosso se inferiore alla soglia
  Lbl.Caption := Result;
  if  (Cred < DM1.TableProgressivi2SMS_SERVER_SOGLIA_AVVISO.AsInteger)
  and (DM1.TableProgressivi2SMS_SERVER_SOGLIA_AVVISO.AsInteger <> 0)
  and (Cred <> -1)
  then begin
    Lbl.Font.Size  := 14;
    Lbl.Font.Color := clRed;
    Lbl.Font.Style := [fsBold,fsUnderline];
  end else begin
    Lbl.Font.Size  := 10;
    Lbl.Font.Color := clBlack;
    Lbl.Font.Style := [];
  end;
end;

// Funzione che invia un SMS e ritorna True se andato tutto bene oppure False
function TDM2.SMS_Invia(ID_Msg:Integer; DestNum:String; CorpoMsg:String): boolean;
var
  SmsSend : Tsms;
  Risposta : TSmsResponse;
  TmpStr: String;
  i: Integer;
  C: Char;
begin
  try
    // Inizializzazione
    Result := False;
    // Se non c'è connessione a internet ovviamente non fa nulla
    if not DM1.InternetIsConnected then begin
      DM1.Messaggi('Invio SMS', 'Mi dispiace, non posso inviare l''SMS ora.'#13#13'Non c''è connessione a internet in questo momento.', '', [mbOk], 0, nil);
      Exit;
    end;
    // Se il numero non è specificato non manda il messaggio
    if Trim(DestNum) = '' then begin
      DM1.Messaggi('Invio SMS', 'Numero destinatario non specificato.'#13#13'Il messaggio non è stato inviato.', '', [mbOk], 0, nil);
      Exit;
    end;
    // Se il messaggio è vuoto si rifiuta di inviarlo
    if Trim(CorpoMsg) = '' then begin
      DM1.Messaggi('Invio SMS', 'Il testo del messaggio è vuoto.'#13#13'Il messaggio non è stato inviato.', '', [mbOk], 0, nil);
      Exit;
    end;
    // Sistemazione del numero del destinatario
    //  NB: Lascia solo i caratteri numerici e mette il 39 all'inizio se necessario
    TmpStr  := DestNum;
    DestNum := '';
    for i := 1 to Length(TmpStr) do begin
      C := TmpStr[i];
      // Se è un carattere numerico lo mette altrimenti lo scarta
      if (Ord(C) >= 48) and (Ord(C) <= 57) then DestNum := DestNum + C;
    end;
    if LeftStr(DestNum,2) <> '39' then DestNum := '39' + DestNum;
    // Crea l'oggetto risposta
    Risposta  := TSmsResponse.create;
    // Crea l'oggetto messaggio e lo imposta
    SmsSend := Tsms.create;
    SmsSend.SenderPhone := Trim(DM1.TableProgressivi2SMS_SERVER_FROM.AsString);
    SmsSend.DestPhone := Trim(DestNum);
    SmsSend.DateTime := Now;
    SmsSend.Msg := Trim(CorpoMsg);
    // Imposta il componente per la comunicazione SMS
    SMS_Imposta;
    // Effettua l'invio
    Risposta := VolaSMS.SendSms(SmsSend);

    // Se la Risposta non dice che è andato tutto bene solleva una eccezione
    if Risposta.Code <> '01'
    then raise Exception.Create('Si è verificato un errore dirante l''invio di un SMS.');

    // Registra l'invio nell'archivio storico degli invii delle comunicazioni
    COM_Storico_RegistraInvioCom(ID_Msg, Trim(DestNum));
    // Se arriva qua significa che è andato tutto bene
    Result := True;
  finally
    // Pulizie finali
    if Assigned(SmsSend)  then SmsSend.Free;
    if Assigned(Risposta) then Risposta.Free;
  end;

end;
// -----------------------------------------------------------------------------
// FINE: PARTE DEGLI SMS
// =============================================================================





// =============================================================================
// INIZIO: PARTE INVIO EMAIL
// -----------------------------------------------------------------------------
{
// e-mail template (subject and other headers+CRLF+CRLF+e-mail body)
// in file sFileName
function TDM2.EMAIL_Send(ID_Msg:Integer; sTo, sSubject:String; msg_lines: TStrings): Boolean;
var
  smtp: TSMTPSend;
  MsgText: TStrings;
  sFrom: String;
begin
  // Se non c'è connessione a internet ovviamente non fa nulla
  if not DM1.InternetIsConnected then begin
    DM1.Messaggi('Invio e-mail', 'Mi dispiace, non posso inviare l''e-mail ora.'#13#13'Non c''è connessione a internet in questo momento.', '', [mbOk], 0, nil);
    Exit;
  end;
  // Inizializzazione
  Result := False;
  sFrom := Trim(DM1.TableProgressivi2SMTP_SERVER_FROM_EMAIL.AsString);
  // Crea la StringList che contiene il corpo del messaggio
  //  poi lavoro su questa copia perchè più sotto gli aggiungo dei parametri
  //  che altrimenti finirebbero nel testo originale
  MsgText := TStringList.Create;
  // Crea l'oggetto SMTP
  smtp := TSMTPSend.Create;
  try
    // Copia il testo del messaggio e gli aggiunge alcuni parametri
    MsgText.Add('From: ' + sFrom);
    MsgText.Add('To: ' + sTo);
    MsgText.Add('Subject: ' + sSubject);
    MsgText.Add('');
    MsgText.AddStrings(msg_lines);
    // Imposta il nome utente se necessario e impostato
    if Trim(DM1.TableProgressivi2SMTP_SERVER_USERNAME.AsString) <> ''
    then smtp.UserName := Trim(DM1.TableProgressivi2SMTP_SERVER_USERNAME.AsString);
    // Imposta la password se necessario e impostato
    if Trim(DM1.TableProgressivi2SMTP_SERVER_PASSWORD.AsString) <> ''
    then smtp.Password := Trim(DM1.TableProgressivi2SMTP_SERVER_PASSWORD.AsString);
    // Imposta l'indirizzo del server SMTP
    if Trim(DM1.TableProgressivi2SMTP_SERVER_ADDRESS.AsString) <> ''
    then smtp.TargetHost := Trim(DM1.TableProgressivi2SMTP_SERVER_ADDRESS.AsString);
    // Imposta la porta usata dall'host
    if Trim(DM1.TableProgressivi2SMTP_SERVER_PORT.AsString) <> ''
    then smtp.TargetPort := Trim(DM1.TableProgressivi2SMTP_SERVER_PORT.AsString);
    // Se è specificato l'utilizzo dei una connessione protetta la imposta
    //  NB: Ho provato solo TLS. Con SSL non so come si fa e non ho provato, magari funziona già così come è
    if (Trim(DM1.TableProgressivi2SMTP_SERVER_SECURE.AsString) = 'TLS')
    or (Trim(DM1.TableProgressivi2SMTP_SERVER_SECURE.AsString) = 'SSL')
    then smtp.AutoTLS := True;
    // =========================================================================
    // INIZIO PARTE COMUNICAZIONE
    // -------------------------------------------------------------------------
    // Login
    if not smtp.Login() then raise Exception.Create('SMTP ERROR: Login:' + smtp.EnhCodeString);
    // ----------
    // Start della comunicazione TLS (NB: Eliminato perchè dava un errore risolto mettendo più sopra "smtp.AutoTLS := True")
//    if not smtp.StartTLS() then raise Exception.Create('SMTP ERROR: StartTLS:' + smtp.EnhCodeString);
    // ----------
    // Invio del mittente
    if not smtp.MailFrom(sFrom, Length(sFrom)) then raise Exception.Create('SMTP ERROR: MailFrom:' + smtp.EnhCodeString);
    // Invio del destinatario
    if not smtp.MailTo(sTo) then raise Exception.Create('SMTP ERROR: MailTo:' + smtp.EnhCodeString);
    // Invio del corpo del messaggio
    if not smtp.MailData(MsgText) then raise Exception.Create('SMTP ERROR: MailData:' + smtp.EnhCodeString);
    // Logout
    if not smtp.Logout() then raise Exception.Create('SMTP ERROR: Logout:' + smtp.EnhCodeString);
    // Registra l'invio nell'archivio storico degli invii delle comunicazioni
    COM_Storico_RegistraInvioCom(ID_Msg, Trim(sTo));
    // Se arriva fino a qui tutto è andato bene
    Result := True;
    // =========================================================================
  finally
    // Pulizie finali
    smtp.Free;
    MsgText.Free;
  end;
end;
}

// e-mail template (subject and other headers+CRLF+CRLF+e-mail body)
// in file sFileName
function TDM2.EMAIL_Send(ID_Msg:Integer; sTo, sSubject:String; msg_lines: TStrings): Boolean;
var
  LSMTP       : TIdSMTP;
  LMailMessage: TIdMessage;
  LAttachment : TIdAttachmentFile;
  LSLHandler : TIdSSLIOHandlerSocketOpenSSL;
  sFrom: String;
  sFromName: String;
begin
  // Se non c'è connessione a internet ovviamente non fa nulla
  if not DM1.InternetIsConnected then begin
    DM1.Messaggi('Invio e-mail', 'Mi dispiace, non posso inviare l''e-mail ora.'#13#13'Non c''è connessione a internet in questo momento.', '', [mbOk], 0, nil);
    Exit;
  end;
  // Inizializzazione
  Result := False;
  sFromName := Trim(DM1.TableProgressivi2SMTP_SERVER_FROM_NAME.AsString);
  sFrom := Trim(DM1.TableProgressivi2SMTP_SERVER_FROM_EMAIL.AsString);
  sTo := Trim(sTo);
  // Crea l'oggetto SMTP
  LMailMessage := TIdMessage.Create(nil);
  LSMTP        := TIdSMTP.Create(nil);
  LSLHandler  := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  LSMTP.IOHandler := LSLHandler;
  try
    // Imposta il nome utente se necessario e impostato
    if Trim(DM1.TableProgressivi2SMTP_SERVER_USERNAME.AsString) <> '' then
      LSMTP.Username := Trim(DM1.TableProgressivi2SMTP_SERVER_USERNAME.AsString);
    // Imposta la password se necessario e impostato
    if Trim(DM1.TableProgressivi2SMTP_SERVER_PASSWORD.AsString) <> '' then
      LSMTP.Password := Trim(DM1.TableProgressivi2SMTP_SERVER_PASSWORD.AsString);
    // Imposta l'indirizzo del server SMTP
    if Trim(DM1.TableProgressivi2SMTP_SERVER_ADDRESS.AsString) <> '' then
      LSMTP.Host := Trim(DM1.TableProgressivi2SMTP_SERVER_ADDRESS.AsString);
    // Imposta la porta usata dall'host
    if Trim(DM1.TableProgressivi2SMTP_SERVER_PORT.AsString) <> '' then
      LSMTP.Port := DM1.TableProgressivi2SMTP_SERVER_PORT.AsInteger;
    // Se è specificato l'utilizzo dei una connessione protetta la imposta
    //  NB: Ho provato solo TLS. Con SSL non so come si fa e non ho provato, magari funziona già così come è
    if (Trim(DM1.TableProgressivi2SMTP_SERVER_SECURE.AsString) = 'TLS')
    or (Trim(DM1.TableProgressivi2SMTP_SERVER_SECURE.AsString) = 'SSL')
    then LSMTP.UseTLS := utUseExplicitTLS;
    // =========================================================================
    // INIZIO PARTE COMUNICAZIONE
    // -------------------------------------------------------------------------
    // Invio del mittente
    LMailMessage.From.Name := sFromName;
    if sFrom <> '' then
      LMailMessage.From.Address := sFrom
    else
      raise Exception.Create('SMTP ERROR: Mail "From" is empty');
    // Invio del destinatario
    // NB: Se si vuole inviare la mail a più destinatari separarli con una virgola
    if sTo <> '' then
      LMailMessage.Recipients.EMailAddresses := sTo
    else
      raise Exception.Create('SMTP ERROR: Mail "To" is empty');
    // Subject
    LMailMessage.Subject := sSubject;
    // Body
    LMailMessage.Body.Text := msg_lines.Text;
//    // Setup  Allegato
//    //  NB: Noi non dobbiamo inviare allegati, lo lascio solo perchè così se mi serve in futuro
//    //       ho già l'esempio (grazie Antonio Polito)
//    if Length(AFileNameAllegato) > 0 then
//      LAttachment := TIdAttachmentFile.Create(LMailMessage.MessageParts, AFileNameAllegato);

    // Connessione, autenticazione e invio
    try
      LSMTP.Connect();
      LSMTP.Authenticate;
      LSMTP.Send(LMailMessage);
      // Registra l'invio nell'archivio storico degli invii delle comunicazioni
      COM_Storico_RegistraInvioCom(ID_Msg, Trim(sTo));
      // Se arriva fino a qui tutto è andato bene
      Result := True;
    except
      on E: Exception do
        ShowMessage(E.Message);
    end;
    // =========================================================================

  finally
    // Pulizie finali
    if LSMTP.Connected then LSMTP.Disconnect;
    try
      LAttachment.Free;
    except
      on E: Exception do
    end;
    if Assigned(LSLHandler) then LSLHandler.Free;
    if Assigned(LMailMessage) then LMailMessage.Free;
    if Assigned(LSMTP) then LSMTP.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE: PARTE INVIO EMAIL
// =============================================================================



// =============================================================================
// INIZIO: PARTE STAMPA COMUNICAZIONE
// -----------------------------------------------------------------------------
function TDM2.LETTERA_Stampa(P_ID:Integer; Copie:Integer; Preview:Boolean=False): Boolean;
begin
  inherited;
  try
    // Inizializzazione
    Result := False;
    // Crea il report e lo imposta
    Application.CreateForm(TLetteraQR, LetteraQR);
    LetteraQR.P_ID := P_ID;
    LetteraQR.FaxPrinting := False;
    // Setta la stampante
    if Preview or DM1.SettaStampante(LetteraQR, Copie) then begin
       // IMposta il numero di pagine del report
       //  NB: Per fare questo effettua un altro prepare (uno viene fatto anche dalla
       //       funzione SettaStampante e il tutto è piuttosto inefficente, ma per il momento
       //       faccio così per maggior semplicità
       try
          LetteraQR.Prepare;
          LetteraQR.TotPag := LetteraQR.QRPrinter.PageCount;
       finally
          LetteraQR.QRPrinter.Free;
          LetteraQR.QRPrinter := nil;
       end;
       // Stampa o preview
       if Preview
       then LetteraQR.Preview
       else LetteraQR.Print;
       // Registra l'invio nell'archivio storico degli invii delle comunicazioni
       if not Preview then COM_Storico_RegistraInvioCom(P_ID, '');
       // Se arriva qui significa che è sndato tutto bene
       Result := True;
    end;
  finally
    FreeAndNil(LetteraQR);
  end;
end;
procedure TDM2.LoadTabellaEtichetteArticoli(const ACodiceArticolo:String; const ASQLFromWhereCond:TStrings;
  const ATipoDoc, ARegistro: String; const ANumeroDoc: Integer; const ADataDoc: TDate;
  ACodiceCliente: Integer);
var
   Qry: TIB_Cursor;
   ProgRigo: Integer;
begin
   // Inizializzazione
   ProgRigo := 0;
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;

      Qry.SQL.Add('INSERT INTO LABART (CODICESTAZIONE,PROGRIGO,CodiceArticolo,Descrizione,Descrizione2,Descrizione3,Descrizione4,Descrizione5,');
      Qry.SQL.Add('            UnitaDiMisura,PrezzoDiVendita,PrezzoDiVendita2,PrezzoDiVendita3,PrezzoDiVendita4,');
      Qry.SQL.Add('            PrzVendIVAComp1,PrzVendIVAComp2,PrzVendIVAComp3,PrzVendIVAComp4,BarCode,Marca,CodiceFornitore,DescrizioneFornitore,');
      Qry.SQL.Add('            Jolly1, Jolly2, Jolly3, Jolly4, Jolly5, Jolly6, Jolly7, Jolly8, Jolly9, Jolly10,');
      Qry.SQL.Add('            TipoDocumento,Registro,NumOrdPrev,DataDocumento,CodiceCliente)');

      Qry.SQL.Add('SELECT ''' + DM1.CodiceUtente + ''', ' + IntToStr(ProgRigo) + ',');
      Qry.SQL.Add(' A.CodiceArticolo,SUBSTRING(A.Descrizione FROM 1 FOR '+IntToStr(DM1.LunghezzaMaxDescrizioneArticoloEtichette)+'),A.Descrizione2,A.Descrizione3,A.Descrizione4,A.Descrizione5,');
      Qry.SQL.Add(' A.UnitaDiMisura,A.PrezzoDiVendita,A.PrezzoDiVendita2,A.PrezzoDiVendita3,A.PrezzoDiVendita4,');
      Qry.SQL.Add(' A.PrzVendIVAComp1,A.PrzVendIVAComp2,A.PrzVendIVAComp3,A.PrzVendIVAComp4,A.BarCode,A.Marca, A.CodiceFornitore, A.DescrizioneFornitore,');
      Qry.SQL.Add(' A.Jolly1, A.Jolly2, A.Jolly3, A.Jolly4, A.Jolly5, A.Jolly6, A.Jolly7, A.Jolly8, A.Jolly9, A.Jolly10,');
      Qry.SQL.Add(QuotedStr(ATipoDoc) + ',' + QuotedStr(ARegistro) + ',' + IntToStr(ANumeroDoc) + ',' + QuotedStr(FormatDateTime('mm/dd/yyyy', ADataDoc)) + ',' + intToStr(ACodiceCliente));
      Qry.SQL.Add('FROM ARTICOLI A');
      if ACodiceArticolo <> '' then
        Qry.SQL.Add('WHERE A.CodiceArticolo = ' + QuotedStr(ACodiceArticolo))
      // Inserisce la clausola WHERE prelevandola dalla query della rubrica
      else if Assigned(ASQLFromWhereCond) then
        DM1.CopySQLWhereCondition(ASQLFromWhereCond, Qry.SQL);

      Qry.ExecSQL;
      // Aggiorna il ProgRigo
      Inc(ProgRigo, 1);
   finally
      Qry.Free;
   end;
end;

// -----------------------------------------------------------------------------
// FINE: PARTE STAMPA COMUNICAZIONE
// =============================================================================








// RIchiama la selezione di un indirizzo dallo stradario
procedure TDM2.Stradario_SelezionaIndirizzo(FieldCodiceComune, FieldDenominazioneComune, FieldDenominazioneStrada, FieldSiglaProvincia, FieldCAP: TField);
begin
  // Verifiche
  if SelezioneStradarioForm <> nil then raise Exception.Create('Form dello stradario già esistente.');
  // Crea la form, la imposta e la visualizza
  Application.CreateForm(TSelezioneStradarioForm, SelezioneStradarioForm);
  SelezioneStradarioForm.Parent := MainForm;
  SelezioneStradarioForm.DblClickMode := DblClickModeSelection;
  SelezioneStradarioForm.CallerCode := 0;
  if Assigned(FieldCodiceComune)        then SelezioneStradarioForm.FieldCodiceComune         := FieldCodiceComune;
  if Assigned(FieldDenominazioneComune) then SelezioneStradarioForm.FieldDenominazioneComune  := FieldDenominazioneComune;
  if Assigned(FieldDenominazioneStrada) then SelezioneStradarioForm.FieldDenominazioneStrada  := FieldDenominazioneStrada;
  if Assigned(FieldSiglaProvincia)      then SelezioneStradarioForm.FieldSiglaProvincia       := FieldSiglaProvincia;
  if Assigned(FieldCAP)                 then SelezioneStradarioForm.FieldCAP                  := FieldCAP;
  SelezioneStradarioForm.Show;
end;





// RIchiede la conferma della risoluzione della Prescrizione
procedure TDM2.ChiediConfermaPrescrizioneRisolta(DC:TcxCustomDataController; RI, Index_ItemFatto, Index_ItemFattoData, Index_ItemFattoNote: Integer);
begin
  // Controlla che non sia già stata creata
  if Assigned(ConfermaPrescrizFattaForm) then Exit;
  // Crea la form
  Application.CreateForm(TConfermaPrescrizFattaForm, ConfermaPrescrizFattaForm);
  try
    // Impostazione parametri
    ConfermaPrescrizFattaForm.DC := DC;
    ConfermaPrescrizFattaForm.RI := RI;
    ConfermaPrescrizFattaForm.Index_ItemFatto := Index_ItemFatto;
    ConfermaPrescrizFattaForm.Index_ItemFattoData := Index_ItemFattoData;
    ConfermaPrescrizFattaForm.Index_ItemFattoNote := Index_ItemFattoNote;
    // Visualizza la form
    ConfermaPrescrizFattaForm.ShowModal;
  finally
    // Pulizie finali
    FreeAndNil(ConfermaPrescrizFattaForm);
  end;
end;

procedure TDM2.ChiudiImpegnoAuto(const AIDImpegno: integer; const AStampaFoglioLavoro, AStampaRCEE, AAggiornaImpianto, AFattura, AScadenze,
  AAnteprimeDiStampa: Boolean; const ADataFatturazione: TDate);
var
  LCanFattura, LCanScadenze: Boolean;
begin
  // Apri e visualizza l'impegno
  DM1.ApriImpegno(AIDImpegno, False);
  // Fatturae e scadenze da fare???
  LCanFattura := AFattura and (ImpegnoForm.QryAssPRM_AUTOCLOSE_FATTURA.AsString = 'T');
  LCanScadenze := LCanFattura and AScadenze and (ImpegnoForm.QryAssPRM_AUTOCLOSE_SCAD.AsString = 'T');
  // Chiude l'impegno
  if not ImpegnoForm.TryChiusuraAutomaticaImpegno(AStampaFoglioLavoro, AStampaRCEE, AAggiornaImpianto, LCanFattura, AAnteprimeDiStampa, ADataFatturazione) then
  begin
    ImpegnoForm.Close;
    Exit;
  end;
  // Esporta in bacheca per la successiva fatturazione (se abilitato)
  if LCanFattura then
    DM2.FatturaImpegno(AIDImpegno, 0, ADataFatturazione, LCanScadenze);  // Fatturazione
end;

procedure TDM2.ClearCantiereDoc(const APraticaField: TIntegerField; const ADataPraticaField: TDateTimeField; const AEditPratica: TcxTextEdit);
begin
  if DM1.Messaggi('Elimina cantiere/impianto', 'Confermi di voler eliminare il cantiere/impianto dal documento?', '', [mbYes, mbNo], 0, nil) = mrYes then
  begin
    ADataPraticaField.Clear;
    APraticaField.Clear;
    AEditPratica.Text := '- - -';
  end;
end;

// =============================================================================
// INIZIO PARTE PER PRONTO RACCOMANDAZIONI/PRESCRIZIONI
// -----------------------------------------------------------------------------
procedure TDM2.RaccomandazioniImpegno_MarcaComeFatta(ID:Integer; Data:TDateTime; Nota:String);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE IMPEGNI SET');
    Q.SQL.Add(' RACCOMANDAZIONI_FATTO=' + QuotedStr('T'));
    Q.SQL.Add(',RACCOMANDAZIONI_FATTO_DATA=' + QuotedStr(FormatDateTime('mm/dd/yyyy', Data)));
    Q.SQL.Add(',RACCOMANDAZIONI_FATTO_NOTE=' + QuotedStr(Nota));
    Q.SQL.Add('WHERE ID = ' + IntToStr(ID));
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TDM2.PrescrizioniImpegno_MarcaComeFatta(ID:Integer; Data:TDateTime; Nota:String);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE IMPEGNI SET');
    Q.SQL.Add(' PRESCRIZIONI_FATTO=' + QuotedStr('T'));
    Q.SQL.Add(',PRESCRIZIONI_FATTO_DATA=' + QuotedStr(FormatDateTime('mm/dd/yyyy', Data)));
    Q.SQL.Add(',PRESCRIZIONI_FATTO_NOTE=' + QuotedStr(Nota));
    Q.SQL.Add('WHERE ID = ' + IntToStr(ID));
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TDM2.RaccomandazioniAllegato_MarcaComeFatta(ID:Integer; Data:TDateTime; Nota:String);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE ALLEGATI_MANUT SET');
    Q.SQL.Add(' RACCOMANDAZIONI_FATTO=' + QuotedStr('T'));
    Q.SQL.Add(',RACCOMANDAZIONI_FATTO_DATA=' + QuotedStr(FormatDateTime('mm/dd/yyyy', Data)));
    Q.SQL.Add(',RACCOMANDAZIONI_FATTO_NOTE=' + QuotedStr(Nota));
    Q.SQL.Add('WHERE ID = ' + IntToStr(ID));
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TDM2.PrescrizioniAllegato_MarcaComeFatta(ID:Integer; Data:TDateTime; Nota:String);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE ALLEGATI_MANUT SET');
    Q.SQL.Add(' PRESCRIZIONI_FATTO=' + QuotedStr('T'));
    Q.SQL.Add(',PRESCRIZIONI_FATTO_DATA=' + QuotedStr(FormatDateTime('mm/dd/yyyy', Data)));
    Q.SQL.Add(',PRESCRIZIONI_FATTO_NOTE=' + QuotedStr(Nota));
    Q.SQL.Add('WHERE ID = ' + IntToStr(ID));
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE PARTE PER PRONTO RACCOMANDAZIONI/PRESCRIZIONI
// =============================================================================










// =============================================================================
// INIZIO - CONVERSIONE IMPIANTI NUOVA ASSISTENZA
// -----------------------------------------------------------------------------
// Procedure  che individua tutti gli eventuali impianti che sono da convertire e li converte
procedure TDM2.Automezzi_VerificaScadenze;
var
  Qry: TIB_Cursor;
  DataRifStr: String;
  DataRif: TDate;
  NoteStr: String;
begin
  DataRif := Now + 15;
  DataRifStr := QuotedStr(FormatDateTime('MM/DD/YYYY', DataRif));
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MARCA, MODELLO, TARGA,');
    Qry.SQL.Add('CAST(COALESCE(SCADENZABOLLO, ''01/01/3000'') AS DATE) AS SCADENZABOLLO,');
    Qry.SQL.Add('CAST(COALESCE(SCADENZAASSICURAZIONE, ''01/01/3000'') AS DATE) AS SCADENZAASSICURAZIONE,');
    Qry.SQL.Add('CAST(COALESCE(PROSSIMOCOLLAUDO, ''01/01/3000'') AS DATE) AS PROSSIMOCOLLAUDO,');
    Qry.SQL.Add('CAST(COALESCE(PROSSIMOBOLLINOBLU, ''01/01/3000'') AS DATE) AS PROSSIMOBOLLINOBLU');
    Qry.SQL.Add('FROM AUTOMEZZI');
    Qry.SQL.Add('WHERE CAST(COALESCE(SCADENZABOLLO, ''01/01/3000'') AS DATE) < ' + DataRifStr);
    Qry.SQL.Add('OR CAST(COALESCE(SCADENZAASSICURAZIONE, ''01/01/3000'') AS DATE) < ' + DataRifStr);
    Qry.SQL.Add('OR CAST(COALESCE(PROSSIMOCOLLAUDO, ''01/01/3000'') AS DATE) < ' + DataRifStr);
    Qry.SQL.Add('OR CAST(COALESCE(PROSSIMOBOLLINOBLU, ''01/01/3000'') AS DATE) < ' + DataRifStr);
    Qry.Open;
    while not Qry.Eof do
    begin
      NoteStr := '';
      if Qry.FieldByName('SCADENZABOLLO').AsDate < DataRif then
        NoteStr := NoteStr + #13'Bollo ' + FormatDateTime('DD/MM/YYYY', Qry.FieldByName('SCADENZABOLLO').AsDate);
      if Qry.FieldByName('SCADENZAASSICURAZIONE').AsDate < DataRif then
        NoteStr := NoteStr + #13'Assicurazione ' + FormatDateTime('DD/MM/YYYY', Qry.FieldByName('SCADENZAASSICURAZIONE').AsDate);
      if Qry.FieldByName('PROSSIMOCOLLAUDO').AsDate < DataRif then
        NoteStr := NoteStr + #13'Collaudo entro il ' + FormatDateTime('DD/MM/YYYY', Qry.FieldByName('PROSSIMOCOLLAUDO').AsDate);
      if Qry.FieldByName('PROSSIMOBOLLINOBLU').AsDate < DataRif then
        NoteStr := NoteStr + #13'Bollino blu entro il ' + FormatDateTime('DD/MM/YYYY', Qry.FieldByName('PROSSIMOBOLLINOBLU').AsDate);
      DM1.Messaggi('Automezzi', 'Prossima scadenza automezzo'#13#13 + Qry.FieldByName('MARCA').AsString + ' ' + Qry.FieldByName('MODELLO').AsString + ' (' + Qry.FieldByName('TARGA').AsString + ')', NoteStr, [mbOk], 0, nil);
      Qry.Next;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDM2.AvviaConversioneImpianti;
var
  Qry: TIB_Cursor;
  WhereContitions, WaitFormMsg: String;
  QuantiDaConvertire, i: Integer;
begin
  // Conferme
  if DM1.Messaggi('Conversione Impianti', 'Proseguire con la conversione degli impianti?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  if DM1.Messaggi('Conversione Impianti', 'ATTENZIONE!!!'#13#13'Questa procedura deve essere eseguita una sola volta.'#13#13'Sei sicuro che non sia mai stata eseguita prima d''ora?', 'NB: Se è stata eseguita precedentemente si verificherà una PERDITA DI DATI!!!', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  if DM1.Messaggi('Conversione Impianti', 'Ultima conferma'#13#13'Prima di avviare la procedura eseguire una COPIA DI SICUREZZA.'#13#13'Proseguire?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  // Inizializzazione
  i := 0;
  // Crea la query che ricaverà gli impianti da convertire
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    DM1.ShowWait('Conversione impianti', 'Start transaction');
    // Avvia la transazione
    DM1.DBAzienda.StartTransaction;
    try
      // Imposta la condizione WHERE per le query
      WhereContitions := 'DESCRIZIONE IS NULL AND (TIPOIMPIANTO=''Caldaia'' OR TIPOIMPIANTO=''Macchina per freddo'' OR TIPOIMPIANTO=''Generico'')';
      // Imposta la query per avere il numero degli impainti da convertire
      Qry.SQL.Add('SELECT COUNT(*) AS QUANTI FROM PRATICHE WHERE');
      Qry.SQL.Add(WhereContitions);
      Qry.Open;
      QuantiDaConvertire := Qry.Fields[0].AsInteger;
      Qry.Close;
      // Imposta la query per avere l'elenco degli impianti da convertire
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT CODICE, DATAAPERTURA, COSTRUTTORE, MODELLO FROM PRATICHE WHERE ');
      Qry.SQL.Add(WhereContitions);
      Qry.Open;
      // CIcla per tutti gli impianti e li converte
      while not Qry.Eof do begin
        // Incrementa il contatore
        Inc(i);
        // Messaggio per l'utente
        WaitFormMsg := 'Progresso elaborazione   ' + IntToStr(i) + ' su ' + IntToStr(QuantiDaConvertire) + #13'Impianto n. ' + Qry.FieldByName('CODICE').AsString + ' del ' + Qry.FieldByName('DATAAPERTURA').AsString + #13 + Qry.FieldByName('COSTRUTTORE').AsString + ' ' + Qry.FieldByName('MODELLO').AsString;
        // Converte l'impianto corrente
        Impianto_Converti(Qry.FieldByName('CODICE').AsInteger, Qry.FieldByName('DATAAPERTURA').AsDateTime, WaitFormMsg);
        // Avanti il prossimo
        Qry.Next;
      end;

      // ----- Inizio: Aggiunta di tutte le O.P. a tutti gli impianti (anche le O.P. generiche per tutto l'impianto che nelle righe sopra non aggiungeva) -----
      Application.CreateForm(TOperazioniPianificateForm, OperazioniPianificateForm);
      try
        OperazioniPianificateForm.Parent := MainForm;
        OperazioniPianificateForm.Show;
        OperazioniPianificateForm.Top := 10000;  // Fuori visuale
        OperazioniPianificateForm.AggiungiTutteLeOpPerTuttiGliImpianti(True);
        // Per sicurezza
        Application.ProcessMessages;
      finally
        OperazioniPianificateForm.Close;
      end;
      // ----- Fine: Aggiunta di tutte le O.P. a tutti gli impianti (anche le O.P. generiche per tutto l'impianto che nelle righe sopra non aggiungeva) -----

      // Commit
      DM1.ShowWait('Conversione impianti', 'Commit transaction');
      DM1.DBAzienda.Commit;
      // Messaggio finale
      DM1.Messaggi('Conversione impianti', 'Operazione completata.', '', [mbOk], 0, nil);
    except
      // Rollback
      DM1.ShowWait('Conversione impianti', 'Rollback transaction');
      DM1.DBAzienda.Rollback;
      // Re-Raise dell'eccezione altrimenti non ci accorgiamo che c'è stato un errore
      raise;
    end;
  finally
    // Pulizie finali
    DM1.CloseWait;
    Qry.Free;
  end;
end;

// Procedure che effettua la conversione di un impainto dalla vecchia struttura alla nuova
procedure TDM2.Impianto_Converti(Codice:Integer; DataApertura:TDateTime; WaitFormMsg:String);
var
  QryOld, QryNew: TIB_Cursor;
  New_CodiceInst, New_AppID, New_IDPRATICA: Integer;
  TmpStr, New_TipoImpianto, New_TipoApparecchio, New_Descrizione, New_RagSocInst: String;
  New_ProxVisitaEntro, New_DataInstallazione, New_DataCollaudo: TDateTime;
  Freddo: Boolean;
begin
  try
    // Creazione Query
    QryOld := TIB_Cursor.Create(Self);
    QryOld.DatabaseName := DM1.ArcDBFile;
    QryOld.IB_Connection := DM1.DBAzienda;
    QryNew := TIB_Cursor.Create(Self);
    QryNew.DatabaseName := DM1.ArcDBFile;
    QryNew.IB_Connection := DM1.DBAzienda;
    // Imposta la query che rimedierà i dati vecchi
    DM1.ShowWait('', WaitFormMsg + #13'Apertura query dati impianto');
    QryOld.SQL.Add('SELECT P.*,');
    QryOld.SQL.Add(' (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA=P.CODICE AND I.DATAPRATICA1=P.DATAAPERTURA AND');
    QryOld.SQL.Add('   (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prova combustione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%'' OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) AS ULTIMA_MANUTENZIONE,');
    QryOld.SQL.Add(' (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA=P.CODICE AND I.DATAPRATICA1=P.DATAAPERTURA AND (I.TIPOINTERVENTO LIKE ''%Prova combustione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%'')) AS ULTIMA_ANALISIFUMI,');
    QryOld.SQL.Add(' (SELECT MIN(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA=P.CODICE AND I.DATAPRATICA1=P.DATAAPERTURA AND (I.TIPOINTERVENTO LIKE ''%Collaudo%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%'')) AS PRIMAACCENSIONE');
    QryOld.SQL.Add('FROM PRATICHE');
    QryOld.SQL.Add('P WHERE TIPO = ''A'' AND CODICE=' + QuotedStr(IntToStr(Codice)) + ' AND DATAAPERTURA=' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataApertura)));
    QryOld.Open;
    // Se non è stato trovato l'impianto ritorna un errore
    if QryOld.Eof then begin
      ShowMessage('Impianto non trovato (n. ' + IntToStr(Codice) + ' del ' + DateToStr(DataApertura));
      Exit;
    end;

    DM1.ShowWait('', WaitFormMsg + #13'Conversione dati impianto');
    // ----- Tipo impianto -----
    TmpStr := QryOld.FieldByName('TIPOIMPIANTO').AsString;
    if TmpStr = 'Caldaia' then New_TipoImpianto := 'Riscaldamento'
    else if TmpStr = 'Macchina per freddo' then New_TipoImpianto := 'Climatizzazione'
    else New_TipoImpianto := 'Generico';

    // ----- Descrizione -----
    // Custruttore
    New_Descrizione := Trim(QryOld.FieldByName('COSTRUTTORE').AsString);
    // Modello
    TmpStr := Trim(QryOld.FieldByName('MODELLO').AsString);
    if (TmpStr<>'') and (New_Descrizione<>'') then TmpStr := ' ' + TmpStr;
    New_Descrizione := New_Descrizione + TmpStr;
    // Matricola
    TmpStr := Trim(QryOld.FieldByName('MATRICOLA').AsString);
    if (TmpStr<>'') and (New_Descrizione<>'') then TmpStr := ' (' + TmpStr + ')';
    New_Descrizione := New_Descrizione + TmpStr;
    // Ubicazione
    TmpStr := Trim(QryOld.FieldByName('LOCALEINSTALLAZIONE').AsString);
    if (TmpStr<>'') and (New_Descrizione<>'') then TmpStr := ' ' + TmpStr;
    New_Descrizione := New_Descrizione + TmpStr;

    // ----- Prossima visita entro -----
    New_ProxVisitaEntro := 0;
    if (not QryOld.FieldByName('ULTIMA_MANUTENZIONE').IsNull) and (QryOld.FieldByName('ULTIMA_MANUTENZIONE').Value <> 0) then begin
      New_ProxVisitaEntro := QryOld.FieldByName('ULTIMA_MANUTENZIONE').Value + QryOld.FieldByName('PERIODICITA').AsInteger;
    end;

    // ----- Installazione e/o Collaudo -----
    New_DataCollaudo      := QryOld.FieldByName('PRIMAACCENSIONE').AsDateTime;
    New_DataInstallazione := QryOld.FieldByName('DATAINSTALLAZIONE').AsDateTime;
    New_CodiceInst        := QryOld.FieldByName('CODICEINST').AsInteger;
    New_RagSocInst        := QryOld.FieldByName('RAGSOCINST').AsString;

    // ----- Imposta l'ID delle pratiche e impianti a cui manca -----
    DM1.ShowWait('', WaitFormMsg + #13'Determinazione ID impianto');
    if QryOld.FieldByName('ID').IsNull or (QryOld.FieldByName('ID').AsInteger = 0)
      then New_IDPRATICA := DM1.Generators_NextGenID('GEN_ID_PRATICHE')
      else New_IDPRATICA := QryOld.FieldByName('ID').AsInteger;

    // ----- Imposta la query che modifica l'impianto e quindi lo converte ai nuovi valori -----
    DM1.ShowWait('', WaitFormMsg + #13'Aggiornamento anagrafica impianto');
    QryNew.SQL.Add('UPDATE PRATICHE SET');
    // Impianto
    QryNew.SQL.Add(' ID = ' + IntToStr(New_IDPRATICA));
    QryNew.SQL.Add(',TIPOIMPIANTO = ' + QuotedStr(New_TipoImpianto));
    QryNew.SQL.Add(',DESCRIZIONE = ' + QuotedStr(LeftStr(New_Descrizione, 60)));
    QryNew.SQL.Add(',PROXVISITAENTRO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',New_ProxVisitaEntro)));
    // Reset campi per Amministratore (che sono quelli del vecchio Installatore)
    QryNew.SQL.Add(',CODICEINST = NULL');
    QryNew.SQL.Add(',RAGSOCINST = NULL');
    QryNew.SQL.Add(',INDIRIZZOINST = NULL');
    QryNew.SQL.Add(',NUMCIVICOINST = NULL');
    QryNew.SQL.Add(',CAPINST = NULL');
    QryNew.SQL.Add(',CITTAINST = NULL');
    QryNew.SQL.Add(',PROVINCIAINST = NULL');
    QryNew.SQL.Add(',TELEFONOINST = NULL');
    QryNew.SQL.Add(',CELLULAREINST = NULL');
    QryNew.SQL.Add(',CODICEFISCALEINST = NULL');
    // Contratto
    QryNew.SQL.Add(',CONTRATTO_STATO = ' + QuotedStr(QryOld.FieldByName('ABBONATO').AsString));
    QryNew.SQL.Add(',CONTRATTO_IMPORTO = ' + DM1.VirgolaPunto(QryOld.FieldByName('IMPORTOCONTRATTO').AsExtended, DM1.DecMicroPrz));
    QryNew.SQL.Add(',CONTRATTO_TIPO = ' + QuotedStr(QryOld.FieldByName('TIPOCONTRATTO').AsString));
   if not QryOld.FieldByName('DATAINIZIOABBONAMENTO').IsNull then
    QryNew.SQL.Add(',CONTRATTO_VALIDITA_INIZIO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',QryOld.FieldByName('DATAINIZIOABBONAMENTO').AsDateTime)));
   if not QryOld.FieldByName('DATAFINEABBONAMENTO').IsNull then
    QryNew.SQL.Add(',CONTRATTO_VALIDITA_FINE = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',QryOld.FieldByName('DATAFINEABBONAMENTO').AsDateTime)));
    QryNew.SQL.Add(',CONTRATTO_DISDETTA_RICEVUTA = ' + QuotedStr(QryOld.FieldByName('RICEVUTADISDETTA').AsString));
   if not QryOld.FieldByName('DATADISDETTA').IsNull then
    QryNew.SQL.Add(',CONTRATTO_DISDETTA_DATARICEZ = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',QryOld.FieldByName('DATADISDETTA').AsDateTime)));
    QryNew.SQL.Add(',CONTRATTO_DISDETTA_MEZZO = ' + QuotedStr(Trim(QryOld.FieldByName('MEZZODISDETTA').AsString + ' ' + QryOld.FieldByName('MEZZODISDETTAALTRO').AsString)));
    // Finale
    QryNew.SQL.Add(' WHERE TIPO=''A'' AND CODICE=' + IntToStr(Codice) + ' AND DATAAPERTURA=' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataApertura)));
    // Esegue
    QryNew.ExecSQL;


    // ----- Creazione apparecchio -----
    DM1.ShowWait('', WaitFormMsg + #13'Creazione apparecchio');
    // Determina il tipo apparecchio
    if New_TipoImpianto = 'Riscaldamento' then New_TipoApparecchio := 'Generatore di calore'
    else if New_TipoImpianto = 'Climatizzazione' then New_TipoApparecchio := 'Monoblocco'
    else New_TipoApparecchio := 'Altro';
    // Determina l'ID del nuovo apparecchio
    New_AppID := DM1.Generators_NextGenID('GEN_ID_PRATAPPARECCHI');
    // Crea l'apparecchio
    QryNew.SQL.Clear;
    QryNew.SQL.Add('INSERT INTO PRATAPPARECCHI (ID, IDPRATICA, TIPOAPPARECCHIO, TIPOIMPIANTO, ALLEGATO)');
    QryNew.SQL.Add('VALUES (' + IntToStr(New_AppID) +','+ IntToStr(New_IDPRATICA) +','+ QuotedStr(New_TipoApparecchio) +','+ QuotedStr(New_TipoImpianto) +',''G'')');
    QryNew.ExecSQL;

    // ----- Caricamento dati nell'apparecchio appena creato -----
    DM1.ShowWait('', WaitFormMsg + #13'Aggiornamento dati apparecchio');
    // Indica se era una macchina per freddo
    Freddo := New_TipoImpianto = 'Climatizzazione';
    // Carica alcuni campi
    QryNew.SQL.Clear;
    QryNew.SQL.Add('UPDATE PRATAPPARECCHI SET');
    QryNew.SQL.Add(' CODICECATASTO = ' + QuotedStr(QryOld.FieldByName('CODICECATASTO').AsString));
    QryNew.SQL.Add(',COSTRUTTORE = ' + QuotedStr(QryOld.FieldByName('COSTRUTTORE').AsString));
    QryNew.SQL.Add(',MODELLO = ' + QuotedStr(QryOld.FieldByName('MODELLO').AsString));
    QryNew.SQL.Add(',MATRICOLA = ' + QuotedStr(QryOld.FieldByName('MATRICOLA').AsString));
    if not QryOld.FieldByName('ANNOCOSTRUZIONE').IsNull then QryNew.SQL.Add(',ANNOCOSTRUZIONE = ' + QryOld.FieldByName('ANNOCOSTRUZIONE').AsString);
    QryNew.SQL.Add(',MARCAEFFICENERGETICA = ' + QuotedStr(QryOld.FieldByName('MARCAEFFICIENZAENERG').AsString));
    // Potenza nominale utile o potenza/resa frigorifera
    if Freddo
      then QryNew.SQL.Add(',POTENZAFRIGORIFERA = ' + FloatingByStringDeleteinvalidChar(QryOld.FieldByName('POTENZANOMINALE').AsString))
      else QryNew.SQL.Add(',POTENZATERMICA = ' + FloatingByStringDeleteinvalidChar(QryOld.FieldByName('POTENZANOMINALE').AsString));
    QryNew.SQL.Add(',POTENZATERMICAFOCOLARE = ' + FloatingByStringDeleteinvalidChar(QryOld.FieldByName('POTENZANOMINALEFOCOLARE').AsString));
    QryNew.SQL.Add(',BREVEDESCRIZIONE = ' + QuotedStr(QryOld.FieldByName('BREVEDESCRIZIONECALDAIA').AsString));
    QryNew.SQL.Add(',NOTESULMONTAGGIO = ' + QuotedStr(QryOld.FieldByName('NOTEMONTAGGIO').AsString));
    QryNew.SQL.Add(',UBICAZIONE = ' + QuotedStr(QryOld.FieldByName('LOCALEINSTALLAZIONE').AsString));
    QryNew.SQL.Add(',INSTCODICE = ' + IntToStr(New_CodiceInst));
    QryNew.SQL.Add(',INSTRAGSOC = ' + QuotedStr(New_RagSocInst));
    if New_DataInstallazione <> 0 then QryNew.SQL.Add(',DATAINSTALLAZIONE = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',New_DataInstallazione)));
    if New_DataCollaudo <> 0 then QryNew.SQL.Add(',DATACOLLAUDO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',New_DataCollaudo)));
    QryNew.SQL.Add(',RISCALDAMENTO = ' + QuotedStr(QryOld.FieldByName('RISCALDAMENTO').AsString));
    QryNew.SQL.Add(',ACQUASANITARIA = ' + QuotedStr(QryOld.FieldByName('ACQUASANITARIA').AsString));
    QryNew.SQL.Add(',FLUIDOTERMOVETTORE = ' + QuotedStr(QryOld.FieldByName('FLUIDOTERMOVETTORE').AsString));
    QryNew.SQL.Add(',TIPOCAMERA = ' + QuotedStr(QryOld.FieldByName('TIPOCAMERA').AsString));
    // Tipo tiraggio o carica per i clima
    if Freddo
      then QryNew.SQL.Add(',CARICA = ' + FloatingByStringDeleteinvalidChar(QryOld.FieldByName('TIPOTIRAGGIO').AsString))
      else QryNew.SQL.Add(',TIPOTIRAGGIO = ' + QuotedStr(QryOld.FieldByName('TIPOTIRAGGIO').AsString));
    // Tipo tiraggio o carica per i clima
    if Freddo
      then QryNew.SQL.Add(',REFRIGERANTE = ' + QuotedStr(QryOld.FieldByName('COMBUSTIBILE').AsString))
      else QryNew.SQL.Add(',COMBUSTIBILE = ' + QuotedStr(QryOld.FieldByName('COMBUSTIBILE').AsString));
    QryNew.SQL.Add(',COMBUSTIBILEALTRO = ' + QuotedStr(QryOld.FieldByName('COMBUSTIBILEALTRO').AsString));
    QryNew.SQL.Add('WHERE ID = ' + IntToStr(New_AppID));
    QryNew.ExecSQL;

    // ----- Creazione OP -----
    DM1.ShowWait('', WaitFormMsg + #13'Creazione OP predefinite');
    QryNew.SQL.Clear;
    QryNew.SQL.Add('EXECUTE PROCEDURE OP_PRATAPP_ADDALL (' + IntToStr(New_IDPRATICA) +','+ IntToStr(New_AppID) +','+ QuotedStr(New_TipoApparecchio) +','+ QuotedStr(New_TipoImpianto) + ')');
    QryNew.ExecSQL;

    // ----- Impostazione OP Manutenzione ordinaria caldaie ----
    DM1.ShowWait('', WaitFormMsg + #13'Impostazione date OP manutenzione ordinaria');
    QryNew.SQL.Clear;
    QryNew.SQL.Add('UPDATE OPPRATICA SET');
    QryNew.SQL.Add(' ULTIMA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',QryOld.FieldByName('ULTIMA_MANUTENZIONE').AsDateTime)));
    QryNew.SQL.Add(',PROSSIMA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',QryOld.FieldByName('ULTIMA_MANUTENZIONE').AsDateTime + 365)));
    QryNew.SQL.Add('WHERE IDPRATICA = ' + IntToStr(New_IDPRATICA) + ' AND IDAPPARECCHIOPRAT = ' + IntToStr(New_AppID) + ' AND IDOP = ' + QuotedStr('RSC.MO'));
    QryNew.ExecSQL;

    // ----- Impostazione OP Analisi Fumi -----
    DM1.ShowWait('', WaitFormMsg + #13'Impostazione date OP analisi fumi');
    QryNew.SQL.Clear;
    QryNew.SQL.Add('UPDATE OPPRATICA SET');
    QryNew.SQL.Add(' ULTIMA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',QryOld.FieldByName('ULTIMA_ANALISIFUMI').AsDateTime)));
    QryNew.SQL.Add(',PROSSIMA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',QryOld.FieldByName('ULTIMA_ANALISIFUMI').AsDateTime + 730)));
    QryNew.SQL.Add('WHERE IDPRATICA = ' + IntToStr(New_IDPRATICA) + ' AND IDAPPARECCHIOPRAT = ' + IntToStr(New_AppID) + ' AND IDOP = ' + QuotedStr('RSC.AF'));
    QryNew.ExecSQL;

    // ----- Impostazione IDPRATICA negli Impegni -----
    DM1.ShowWait('', WaitFormMsg + #13'Impostazione IDPRATICA negli Impegni');
    QryNew.SQL.Clear;
    QryNew.SQL.Add('UPDATE IMPEGNI SET IDPRATICA = ' + IntToStr(New_IDPRATICA));
    QryNew.SQL.Add('WHERE PRATICA = ' + IntToStr(Codice) + ' AND DATAPRATICA1 = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',DataApertura)));
    QryNew.ExecSQL;

  finally
    if Assigned(QryOld) then QryOld.Free;
    if Assigned(QryNew) then QryNew.Free;
  end;
end;

procedure TDM2.FatturaImpegno(const AIDImpegno, ACopie: integer; const ADataFatturazione: TDate; const ACreaScad: Boolean);
var
  LCodiceCliente, LPratica, LMode:Integer;
  LRegistro:String;
  LDataPratica: String;
  LSeparaPerPratica:Boolean;
  procedure GetDatiClientePratica;
  var
    LQry: TIB_Cursor;
  begin
    LQry := DM1.NewQuery;
    try
      LQry.SQL.Add('SELECT I.CLIENTE, I.PRATICA, I.DATAPRATICA1 FROM IMPEGNI I WHERE I.ID = ' + AIDImpegno.ToString);
      LQry.Open;
      if LQry.Eof then
        raise Exception.Create('Fattura impegno: Impegno non trovato - ' + AIDImpegno.ToString);
      LCodiceCliente := LQry.FieldByName('CLIENTE').AsInteger;
      LPratica := LQry.FieldByName('PRATICA').AsInteger;
      LDataPratica := LQry.FieldByName('DATAPRATICA1').AsString;
    finally
      LQry.Free;
    end;
  end;
begin
  // Init
  LRegistro := '';
  LSeparaPerPratica := False;
  GetDatiClientePratica;
  // Crea e visualizza form dei docuemnti fiscali perchè la funzione che crea i nuovi
  //  documento non lo fà automaticamente.
  Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
  try
    PreventiviOrdiniForm.TipoDoc := 'Fattura';
    PreventiviOrdiniForm.Parent := MainForm;
    PreventiviOrdiniForm.Tag    := MODE_FATTURAZIONE_DIFFERITA;
    PreventiviOrdiniForm.Show;
    // Determina il parametro "Mode" in base al fatto che debbano essere create anche le scadenze oppure no
    if ACreaScad then
      LMode := 3
    else
      LMode := 2;
    // Richiama la funzione che genera il nuovo documento
    DM1.NuovoDocFisc('Fattura', LRegistro, LCodiceCliente, LPratica, LDataPratica, LMode, ACopie, True, LSeparaPerPratica, ADataFatturazione);
  finally
    PreventiviOrdiniForm.Close;
  end;
end;

// Funzione che depura un nuovero ricevuto come parametro sotto forma di stringa (dopo una conversione)
//  e ne elimina i caratteri non validi in modo che non dia erre la query.
//  NB: Questa funzione ho dovuto farla perchè nellla conversione dalla vecchia struttura a quella nuova
//       alcune potenze erano in campi alfanumerici mentre ora sono numerici.
function TDM2.FloatingByStringDeleteinvalidChar(InStr:String): String;
var
  i: Integer;
begin
  Result := '';
  // Cicla per tutti i caratteri della stringa ed elimina quelli non validi in un numero
  //  da inserire in una query
  for i := 1 to Length(InStr) do begin
    // CSe è una virgola la converte in punto
    if (InStr[i] = ',') then InStr[i] := '.';
    // Prende solo i caratteri validi
    if (InStr[i] = '1')
    or (InStr[i] = '2')
    or (InStr[i] = '3')
    or (InStr[i] = '4')
    or (InStr[i] = '5')
    or (InStr[i] = '6')
    or (InStr[i] = '7')
    or (InStr[i] = '8')
    or (InStr[i] = '9')
    or (InStr[i] = '0')
    or (InStr[i] = '-')
    or (InStr[i] = '.')
    then Result := Result + InStr[i];
  end;
  // Alla fine se era un campo vuoto lo mette a null
  if Trim(Result) = '' then Result := 'NULL';
end;
// -----------------------------------------------------------------------------
// FINE - CONVERSIONE IMPIANTI NUOVA ASSISTENZA
// =============================================================================





// =============================================================================
// INIZIO - CREAZIONE OP PREDEFINITE
// -----------------------------------------------------------------------------
// Procedure che crea automaticamente le OP predefinite che il proramma crea da solo
procedure TDM2.CreaOpPredefinite;
var
  Q:TIBOStoredProc;
begin
  Q := TIBOStoredProc.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.StoredProcName := 'OP_CREAPREDEFINITE';
    Q.ExecProc;
  finally
    Q.Free;
  end;
end;

// -----------------------------------------------------------------------------
// FINE - CREAZIONE OP PREDEFINITE
// =============================================================================





// =============================================================================
// INIZIO - CREAZIONE COMUNICAZIONI AUTOMATICHE PREDEFINITE
// -----------------------------------------------------------------------------
// Procedure che crea automaticamente le comunicazioni automatiche predefinite
procedure TDM2.CreaComunicazioniAutomatichePredefinite;
var
  Q:TIBOStoredProc;
begin
  Q := TIBOStoredProc.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.StoredProcName := 'COM_CREAPREDEFINITE';
    Q.ExecProc;
  finally
    Q.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - CREAZIONE COMUNICAZIONI AUTOMATICHE PREDEFINITE
// =============================================================================





// =============================================================================
// INIZIO - CREAZIONE LOOKUP TABLE PER FATTURA ELETTRONICA PA
// -----------------------------------------------------------------------------
// Procedure che crea automaticamente le OP predefinite che il proramma crea da solo
procedure TDM2.CreaLookupTableFatturaPA;
var
   Q: TIB_Cursor;
begin
  // Crea e imposta la query che effettuerà la registrazione dell'invio della
  //  comunicazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Imposta la query per eliminare tutti i valori
    Q.SQL.Add('DELETE FROM LOOKUP_PA');
    Q.ExecSQL;
    Q.Unprepare;
    // Imposta la query per l'inserimento dei valori
    Q.SQL.Clear;
    Q.SQL.Add('INSERT INTO LOOKUP_PA (TIPO, VALORE, DESCRIZIONE)');
    Q.SQL.Add('VALUES (:P_TIPO, :P_VALORE, :P_DESCRIZIONE)');
    Q.Prepare;

    // Clear / Vuoto
    Q.ParamValues['P_TIPO'] := '';
    Q.ParamValues['P_VALORE'] := '';
    Q.ParamValues['P_DESCRIZIONE'] := '';
    Q.ExecSQL;

    // RegimeFiscale
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF01';
    Q.ParamValues['P_DESCRIZIONE'] := 'Ordinario';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF02';
    Q.ParamValues['P_DESCRIZIONE'] := 'Contribuenti minimi (art.1, c.96-117, L.244/2007)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF03';
    Q.ParamValues['P_DESCRIZIONE'] := 'Nuove iniziative produttive (art.13, L.388/2000)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF04';
    Q.ParamValues['P_DESCRIZIONE'] := 'Agricoltura e attività connesse e pesca (artt.34 e 34-bis, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF05';
    Q.ParamValues['P_DESCRIZIONE'] := 'Vendita sali e tabacchi (art.74, c.1, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF06';
    Q.ParamValues['P_DESCRIZIONE'] := 'Commercio dei fiammiferi (art.74, c.1, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF07';
    Q.ParamValues['P_DESCRIZIONE'] := 'Editoria (art.74, c.1, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF08';
    Q.ParamValues['P_DESCRIZIONE'] := 'Gestione di servizi di telefonia pubblica (art.74, c.1, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF09';
    Q.ParamValues['P_DESCRIZIONE'] := 'Rivendita di documenti di trasporto pubblico e di sosta (art.74, c.1, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF10';
    Q.ParamValues['P_DESCRIZIONE'] := 'Intrattenimenti, giochi e altre attività di cui alla tariffa allegata al D.P.R.640/72 (art.74, c.6, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF11';
    Q.ParamValues['P_DESCRIZIONE'] := 'Agenzie di viaggi e turismo (art.74-ter, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF12';
    Q.ParamValues['P_DESCRIZIONE'] := 'Agriturismo (art.5, c.2, L.413/1991)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF13';
    Q.ParamValues['P_DESCRIZIONE'] := 'Vendite a domicilio (art.25-bis, c.6, D.P.R.600/1973)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF14';
    Q.ParamValues['P_DESCRIZIONE'] := 'Rivendita di beni usati, di oggetti d''arte, d''antiquariato o da collezione (art.36, D.L.41/1995)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF15';
    Q.ParamValues['P_DESCRIZIONE'] := 'Agenzie di vendite all''asta di oggetti d''arte, antiquariato o da collezione (art.40-bis, D.L.41/1995)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF16';
    Q.ParamValues['P_DESCRIZIONE'] := 'IVA per cassa P.A. (art.6, c.5, D.P.R.633/1972)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF17';
    Q.ParamValues['P_DESCRIZIONE'] := 'IVA per cassa (art.32-bis, D.L.83/2012)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF18';
    Q.ParamValues['P_DESCRIZIONE'] := 'Altro';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RegimeFiscale';
    Q.ParamValues['P_VALORE'] := 'RF19';
    Q.ParamValues['P_DESCRIZIONE'] := 'Forfettario (art.1, c.54-89, L.190/2014)';
    Q.ExecSQL;

    // SocioUnico
    Q.ParamValues['P_TIPO'] := 'SocioUnico';
    Q.ParamValues['P_VALORE'] := 'SU';
    Q.ParamValues['P_DESCRIZIONE'] := 'la società è a socio unico';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'SocioUnico';
    Q.ParamValues['P_VALORE'] := 'SM';
    Q.ParamValues['P_DESCRIZIONE'] := 'la società NON è a socio unico';
    Q.ExecSQL;

    // StatoLiquidazione
    Q.ParamValues['P_TIPO'] := 'StatoLiquidazione';
    Q.ParamValues['P_VALORE'] := 'LS';
    Q.ParamValues['P_DESCRIZIONE'] := 'La società è in stato di liquidazione';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'StatoLiquidazione';
    Q.ParamValues['P_VALORE'] := 'LN';
    Q.ParamValues['P_DESCRIZIONE'] := 'La società NON è in stato di liquidazione';
    Q.ExecSQL;

    // NaturaIVA
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N1';
    Q.ParamValues['P_DESCRIZIONE'] := 'Escluse ex art.15';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N2';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non soggette';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N2.1';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non soggette ad IVA ai sensi degli articoli da 7 a 7-septies del D.P.R. n. 633/1972';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N2.2';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non soggette - altri casi';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N3';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non imponibili';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N3.1';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non imponibili - esportazioni';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N3.2';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non imponibili - cessioni intracomunitarie';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N3.3';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non imponibili - cessioni verso San Marino';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N3.4';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non imponibili - operazioni assimilate alle cessioni all''esportazione';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N3.5';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non imponibili - a seguito di dichiarazioni d''intento';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N3.6';
    Q.ParamValues['P_DESCRIZIONE'] := 'Non imponibili - altre operazioni che non concorrono alla formazione del plafond';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N4';
    Q.ParamValues['P_DESCRIZIONE'] := 'Esenti';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N5';
    Q.ParamValues['P_DESCRIZIONE'] := 'Regime del margine';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile (reverse charge)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.1';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - cessione di rottami e altri materiali di recupero';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.2';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - cessione di oro e argento puro';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.3';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - subappalto nel settore edile';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.4';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - cessione di fabbricati';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.5';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - cessione di telefoni cellulari';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.6';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - cessione di prodotti elettronici';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.7';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - prestazioni comparto edile e settori connessi';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.8';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - operazioni settore energetico';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N6.9';
    Q.ParamValues['P_DESCRIZIONE'] := 'Inversione contabile - altri casi';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'NaturaIVA';
    Q.ParamValues['P_VALORE'] := 'N7';
    Q.ParamValues['P_DESCRIZIONE'] := 'IVA assolta in altro stato UE';
    Q.ExecSQL;

    // CondizioniPagamento
    Q.ParamValues['P_TIPO'] := 'CondizioniPagamento';
    Q.ParamValues['P_VALORE'] := 'TP01';
    Q.ParamValues['P_DESCRIZIONE'] := 'Pagamento a rate';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'CondizioniPagamento';
    Q.ParamValues['P_VALORE'] := 'TP02';
    Q.ParamValues['P_DESCRIZIONE'] := 'Pagamento completo';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'CondizioniPagamento';
    Q.ParamValues['P_VALORE'] := 'TP03';
    Q.ParamValues['P_DESCRIZIONE'] := 'Anticipo';
    Q.ExecSQL;

    // ModalitaPagamento
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP01';
    Q.ParamValues['P_DESCRIZIONE'] := 'Contanti';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP02';
    Q.ParamValues['P_DESCRIZIONE'] := 'Assegno';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP03';
    Q.ParamValues['P_DESCRIZIONE'] := 'Assegno circolare';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP04';
    Q.ParamValues['P_DESCRIZIONE'] := 'Contanti presso tesoreria';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP05';
    Q.ParamValues['P_DESCRIZIONE'] := 'Bonifico';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP06';
    Q.ParamValues['P_DESCRIZIONE'] := 'Vaglia cambiario';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP07';
    Q.ParamValues['P_DESCRIZIONE'] := 'Bollettino bancario';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP08';
    Q.ParamValues['P_DESCRIZIONE'] := 'Carta di pagamento';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP09';
    Q.ParamValues['P_DESCRIZIONE'] := 'RID';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP10';
    Q.ParamValues['P_DESCRIZIONE'] := 'RID utenze';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP11';
    Q.ParamValues['P_DESCRIZIONE'] := 'RID veloce';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP12';
    Q.ParamValues['P_DESCRIZIONE'] := 'RIBA';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP13';
    Q.ParamValues['P_DESCRIZIONE'] := 'MAV';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP14';
    Q.ParamValues['P_DESCRIZIONE'] := 'Quietanza erario stato';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP15';
    Q.ParamValues['P_DESCRIZIONE'] := 'Giroconti su conti di contabilità speciale';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP16';
    Q.ParamValues['P_DESCRIZIONE'] := 'Domiciliazione bancaria';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP17';
    Q.ParamValues['P_DESCRIZIONE'] := 'Domiciliazione postale';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP18';
    Q.ParamValues['P_DESCRIZIONE'] := 'Bollettino di c/c postale';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP19';
    Q.ParamValues['P_DESCRIZIONE'] := 'SEPA Direct Debit';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP20';
    Q.ParamValues['P_DESCRIZIONE'] := 'SEPA Direct Debit CORE';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP21';
    Q.ParamValues['P_DESCRIZIONE'] := 'SEPA Direct Debit B2B';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP22';
    Q.ParamValues['P_DESCRIZIONE'] := 'Trattenuta su somme già riscosse';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'ModalitaPagamento';
    Q.ParamValues['P_VALORE'] := 'MP23';
    Q.ParamValues['P_DESCRIZIONE'] := 'PagoPA';
    Q.ExecSQL;

    // RitAccCausalePag (Ritenuta acconto: CausalePagamento)
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'A';
    Q.ParamValues['P_DESCRIZIONE'] := 'Prestazioni di lavoro autonomo rientranti nell’esercizio di arte o professione abituale.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'B';
    Q.ParamValues['P_DESCRIZIONE'] := 'Utilizzazione economica, da parte dell’autore o dell’inventore, di opere dell’ingegno, di brevetti industriali e di processi, formule o informazioni relativi a esperienze acquisite in campo industriale, commerciale o scientifico.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'C';
    Q.ParamValues['P_DESCRIZIONE'] := 'Utili derivanti da contratti di associazione in partecipazione e da contratti di cointeressenza, quando l’apporto è costituito esclusivamente dalla prestazione di lavoro.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'D';
    Q.ParamValues['P_DESCRIZIONE'] := 'Utili spettanti ai soci promotori e ai soci fondatori delle società di capitali.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'E';
    Q.ParamValues['P_DESCRIZIONE'] := 'Levata di protesti cambiari da parte dei segretari comunali.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'G';
    Q.ParamValues['P_DESCRIZIONE'] := 'Indennità corrisposte per la cessazione di attività sportiva professionale.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'H';
    Q.ParamValues['P_DESCRIZIONE'] := 'Indennità corrisposte per la cessazione dei rapporti di agenzia delle persone fisiche e delle società di persone, con esclusione delle somme maturate entro il 31.12.2003, già imputate per competenza e tassate come reddito d’impresa.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'I';
    Q.ParamValues['P_DESCRIZIONE'] := 'Indennità corrisposte per la cessazione da funzioni notarili.';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'J';
    Q.ParamValues['P_DESCRIZIONE'] := 'Interessi ed altri proventi non imponibili derivanti da finanziamenti a medio e lungo termine erogati ad imprese italiane dagli enti creditizi e dalle imprese di assicurazione europee '
      + 'e dagli altri soggetti indicati nell''art. 26, comma 5 bis del D.P.R. n. 600 del 1973';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'L';
    Q.ParamValues['P_DESCRIZIONE'] := 'Utilizzazione economica, da parte di soggetto diverso dall’autore o dall’inventore, di opere dell’ingegno, di brevetti industriali e di processi, formule e informazioni relative a esperienze acquisite in campo industriale, commerciale o scientifico.';
    Q.ExecSQL;

    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'M';
    Q.ParamValues['P_DESCRIZIONE'] := 'Prestazioni di lavoro autonomo non esercitate abitualmente, obblighi di fare, di non fare o permettere.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'N';
    Q.ParamValues['P_DESCRIZIONE'] := 'Indennità di trasferta, rimborso forfetario di spese, premi e compensi erogati: .. nell’esercizio diretto di attività sportive dilettantistiche';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'O';
    Q.ParamValues['P_DESCRIZIONE'] := 'Prestazioni di lavoro autonomo non esercitate abitualmente, obblighi di fare, di non fare o permettere, per le quali non sussiste l’obbligo di iscrizione alla gestione separata (Circ. Inps 104/2001).';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'P';
    Q.ParamValues['P_DESCRIZIONE'] := 'Compensi corrisposti a soggetti non residenti privi di stabile organizzazione per l’uso o la concessione in uso di attrezzature industriali, commerciali o scientifiche che si trovano nel territorio dello';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'Q';
    Q.ParamValues['P_DESCRIZIONE'] := 'Provvigioni corrisposte ad agente o rappresentante di commercio monomandatario.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'R';
    Q.ParamValues['P_DESCRIZIONE'] := 'Provvigioni corrisposte ad agente o rappresentante di commercio plurimandatario.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'S';
    Q.ParamValues['P_DESCRIZIONE'] := 'Provvigioni corrisposte a commissionario.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'T';
    Q.ParamValues['P_DESCRIZIONE'] := 'Provvigioni corrisposte a mediatore.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'U';
    Q.ParamValues['P_DESCRIZIONE'] := 'Provvigioni corrisposte a procacciatore di affari.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'V';
    Q.ParamValues['P_DESCRIZIONE'] := 'Provvigioni corrisposte a incaricato per le vendite a domicilio e provvigioni corrisposte a incaricato per la vendita porta a porta e per la vendita ambulante di giornali quotidiani e periodici (L. 25.02.1987, n. 67).';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'W';
    Q.ParamValues['P_DESCRIZIONE'] := 'Corrispettivi erogati nel 2018 per prestazioni relative a contratti d’appalto cui si sono resi applicabili le disposizioni contenute nell’art. 25-ter D.P.R. 600/1973.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'X';
    Q.ParamValues['P_DESCRIZIONE'] := 'Canoni corrisposti nel 2004 da società o enti residenti, ovvero da stabili organizzazioni di società estere di cui all’art. 26-quater, c. 1, lett. a) e b) D.P.R. 600/1973, a società o stabili organizzazioni di società, situate in altro Stato ' + 'membro dell’Unione Europea in presenza dei relativi requisiti richiesti,per i quali è stato effettuato nel 2006 il rimborso della ritenuta ai sensi dell’art. 4 D. Lgs. 143/2005.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'Y';
    Q.ParamValues['P_DESCRIZIONE'] := 'Canoni corrisposti dal 1.01.2005 al 26.07.2005 da soggetti di cui al punto precedente.';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'RitAccCausalePag';
    Q.ParamValues['P_VALORE'] := 'ZO';
    Q.ParamValues['P_DESCRIZIONE'] := 'Titolo diverso dai precedenti.';
    Q.ExecSQL;

    // Esigibilità IVA (Body.DatiBeniServizi.DatiRiepilogo.EsigibilitàIVA)
    Q.ParamValues['P_TIPO'] := 'EsigibilitaIVA';
    Q.ParamValues['P_VALORE'] := 'I';
    Q.ParamValues['P_DESCRIZIONE'] := 'IVA ad esigibilità immediata';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'EsigibilitaIVA';
    Q.ParamValues['P_VALORE'] := 'D';
    Q.ParamValues['P_DESCRIZIONE'] := 'IVA ad esigibilità differita';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'EsigibilitaIVA';
    Q.ParamValues['P_VALORE'] := 'S';
    Q.ParamValues['P_DESCRIZIONE'] := 'Scissione dei pagamenti (split payment)';
    Q.ExecSQL;

    // TipoDocumento
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD01';
    Q.ParamValues['P_DESCRIZIONE'] := 'Fattura/Autofattura (per autoconsumo)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD02';
    Q.ParamValues['P_DESCRIZIONE'] := 'Acconto/Anticipo su fattura';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD03';
    Q.ParamValues['P_DESCRIZIONE'] := 'Acconto/Anticipo su parcella';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD04';
    Q.ParamValues['P_DESCRIZIONE'] := 'Nota di Credito';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD05';
    Q.ParamValues['P_DESCRIZIONE'] := 'Nota di Debito';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD06';
    Q.ParamValues['P_DESCRIZIONE'] := 'Parcella';
    Q.ExecSQL;

    // Inizio 1.6.1
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD16';
    Q.ParamValues['P_DESCRIZIONE'] := 'Integrazione fattura reverse charge interno';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD17';
    Q.ParamValues['P_DESCRIZIONE'] := 'Integrazione/Autofattura per acquisto servizio dall''estero';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD18';
    Q.ParamValues['P_DESCRIZIONE'] := 'Integrazione per acquisto di beni intracomunitari';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD19';
    Q.ParamValues['P_DESCRIZIONE'] := 'Integrazione/Autofattura per acquisto beni (ex art. 17 c.2 DPR 633/72)';
    Q.ExecSQL;
    // Fine 1.6.1

    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD20';
    Q.ParamValues['P_DESCRIZIONE'] := 'Autofattura per denuncia mancata emissione fornitore';
    Q.ExecSQL;

    // Inizio 1.6.1
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD21';
    Q.ParamValues['P_DESCRIZIONE'] := 'Autofattura per splafonamento';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD22';
    Q.ParamValues['P_DESCRIZIONE'] := 'Estrazione beni da Deposito IVA';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD23';
    Q.ParamValues['P_DESCRIZIONE'] := 'Estrazione beni da Deposito IVA con versamento dell''IVA';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD24';
    Q.ParamValues['P_DESCRIZIONE'] := 'Fattura differita di cui l''art. 21, comma 4, lett. a)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD25';
    Q.ParamValues['P_DESCRIZIONE'] := 'Fattura differita di cui l''art. 21, comma 4, terzo periodo lett. b)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD26';
    Q.ParamValues['P_DESCRIZIONE'] := 'Cessione di beni ammortizzabili e per passaggi interni (ex art.36 DPR 663/72)';
    Q.ExecSQL;
    Q.ParamValues['P_TIPO'] := 'TipoDocumento';
    Q.ParamValues['P_VALORE'] := 'TD27';
    Q.ParamValues['P_DESCRIZIONE'] := 'Fattura per autoconsumo o cessioni gratuite senza rivalsa';
    Q.ExecSQL;
    // Fine 1.6.1

    // Clear / Vuoto
//    Q.ParamValues['P_TIPO'] := '';
//    Q.ParamValues['P_VALORE'] := '';
//    Q.ParamValues['P_DESCRIZIONE'] := '';
//    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TDM2.CreaAliquotaIVA_Ristrutturazione;
var
   Q, QNaturaExists, QAliquotaExists, QNextNum: TIB_Cursor;
   function _NaturaExists(const ANatura: string): Boolean;
   begin
     QNaturaExists.ParamValues['P_NATURAIVA'] := ANatura;
     QNaturaExists.Open;
     Result := not QNaturaExists.Eof;
     QNaturaExists.Close;
   end;
   function _AliquotaIvaExists(const AAliquota: Integer): Boolean;
   begin
     QAliquotaExists.ParamValues['P_ALIQUOTAIVA'] := AAliquota;
     QAliquotaExists.Open;
     Result := not QAliquotaExists.Eof;
     QAliquotaExists.Close;
   end;
   function _NextCodiceIVA: Integer;
   begin
     Result := 500;
     repeat
       inc(Result);
       QNextNum.Close;
       QNextNum.ParamByName('P_CODICEIVA').AsInteger := Result;
       QNextNum.Open;
     until QNextNum.Eof;
     QNextNum.Close;
   end;
   procedure _AddAliqIVAifNaturaNotExists(const ANatura, ADescrizione: String);
   begin
     if _NaturaExists(ANatura) then
       Exit;
     Q.ParamValues['P_CODICE'] := _NextCodiceIVA;
     Q.ParamValues['P_DESCRIZIONE'] := ADescrizione;
     Q.ParamValues['P_NATURA'] := ANatura;
     Q.ParamValues['P_ALIQUOTAIVA'] := 0;
     Q.ExecSQL;
   end;
   procedure _AddAliqIVAifAliquotaNotExists(const AAliquota: Integer; const ADescrizione: String);
   begin
     if _AliquotaIvaExists(AAliquota) then
       Exit;
     Q.ParamValues['P_CODICE'] := _NextCodiceIVA;
     Q.ParamValues['P_DESCRIZIONE'] := ADescrizione;
     Q.ParamValues['P_NATURA'] := Null;
     Q.ParamValues['P_ALIQUOTAIVA'] := AAliquota;
     Q.ExecSQL;
   end;
begin
  // Crea e imposta la query che effettuerà la registrazione dell'invio della
  //  comunicazione
  Q := TIB_Cursor.Create(Self);
  QAliquotaExists := TIB_Cursor.Create(Self);
  QNaturaExists := TIB_Cursor.Create(Self);
  QNextNum := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    QAliquotaExists.DatabaseName := DM1.ArcDBFile;
    QAliquotaExists.IB_Connection := DM1.DBAzienda;
    QNaturaExists.DatabaseName := DM1.ArcDBFile;
    QNaturaExists.IB_Connection := DM1.DBAzienda;
    QNextNum.DatabaseName := DM1.ArcDBFile;
    QNextNum.IB_Connection := DM1.DBAzienda;
    // Imposta la query che verifica se un codiceIVA esiste
    QNextNum.SQL.Add('SELECT FIRST 1 CODICEIVA FROM ALIQIVA WHERE CODICEIVA = :P_CODICEIVA');
    QNextNum.Prepare;
    // Imposta la query che verifica se l'aliquota IVA esiste già oppure no
    QAliquotaExists.SQL.Add('SELECT FIRST 1 CODICEIVA FROM ALIQIVA WHERE ALIQUOTAIVA = :P_ALIQUOTAIVA');
    QAliquotaExists.Prepare;
    // Imposta la query che verifica se la Natura IVA esiste già oppure no
    QNaturaExists.SQL.Add('SELECT FIRST 1 CODICEIVA FROM ALIQIVA WHERE PA_NATURA = :P_NATURAIVA');
    QNaturaExists.Prepare;
    // Imposta la query per l'inserimento della nuova aliquota IVA con la natura IVA voluta
    Q.SQL.Add('INSERT INTO ALIQIVA (CODICEIVA, DESCRIZIONEIVA, ALIQUOTAIVA, PA_NATURA, BOLLOAUTOMATICO, SINCHRO, ENABLED)');
    Q.SQL.Add('VALUES (:P_CODICE, :P_DESCRIZIONE, :P_ALIQUOTAIVA, :P_NATURA, ''F'', ''M'', ''T'')');
    Q.Prepare;
    // Inizio creazione automatica aliquote IVA per le aliquota IVA iva mancanti tra le seguenti
    _AddAliqIVAifAliquotaNotExists(5, '5%');
    // Inizio creazione automatica aliquote IVA per le natura iva mancanti tra le seguenti
    _AddAliqIVAifNaturaNotExists('N1', 'Escluso IVA art.15 DPR633/72');

    _AddAliqIVAifNaturaNotExists('N2.1', 'Non sogg. artt. da 7 a 7-sept DPR633/72');
    _AddAliqIVAifNaturaNotExists('N2.2', 'Non sogg. (altri casi)');

    _AddAliqIVAifNaturaNotExists('N3.1', 'Non imp. art.8 c.1 DPR633/72');
    _AddAliqIVAifNaturaNotExists('N3.2', 'Non imp. art.41 DL331/93');
    _AddAliqIVAifNaturaNotExists('N3.3', 'Non imp. RSM art.71 DPR633/72');
    _AddAliqIVAifNaturaNotExists('N3.4', 'Non imp. art.8bis DPR633/72');
    _AddAliqIVAifNaturaNotExists('N3.5', 'Non imp. art.8 DPR633/72');

    _AddAliqIVAifNaturaNotExists('N4', 'Esente IVA art.10 DPR633/72');

    _AddAliqIVAifNaturaNotExists('N6.1', 'Rev.charge art.74 DPR633/72');
    _AddAliqIVAifNaturaNotExists('N6.2', 'Rev.charge art.17 c.5 DPR633/72');
    _AddAliqIVAifNaturaNotExists('N6.3', 'Rev.charge art.17 c.6 l.a DPR633/72');
    _AddAliqIVAifNaturaNotExists('N6.4', 'Rev.charge art.17 c.6 l.a-bis DPR633/72');
    _AddAliqIVAifNaturaNotExists('N6.5', 'Rev.charge art.17 c.6 l.b DPR633/72');
    _AddAliqIVAifNaturaNotExists('N6.6', 'Rev.charge art.17 c.6 l.c DPR633/72');
    _AddAliqIVAifNaturaNotExists('N6.7', 'Rev.charge art.17 c.6 l.a-ter DPR633/72');
    _AddAliqIVAifNaturaNotExists('N6.8', 'Rev.charge art.17 c.6 DPR633/72');
    _AddAliqIVAifNaturaNotExists('N6.9', 'Rev.charg.art.17 c.6 l.a-quinq DPR633/72');
  finally
    Q.Free;
    QAliquotaExists.Free;
    QNaturaExists.Free;
    QNextNum.Free;
  end;
end;

procedure TDM2.DisabilitaVecchieNatureIVA_1_6_1;
var
   Q: TIB_Cursor;
begin
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE ALIQIVA SET ENABLED = ''F'' WHERE CURRENT_TIMESTAMP > ''01/01/2021'' AND (PA_NATURA=''N2'' OR PA_NATURA=''N3'' OR PA_NATURA=''N6'')');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TDM2.CreaCausali_1_6_1;
var
   Q, QTipoDocExists, QCausaleExists: TIB_Cursor;
   function _TipoDocumentoExists(const APA_TipoDocumento: string): Boolean;
   begin
     QTipoDocExists.ParamValues['P_PA_TIPODOCUMENTO'] := APA_TipoDocumento;
     QTipoDocExists.Open;
     Result := not QTipoDocExists.Eof;
     QTipoDocExists.Close;
   end;
   function _CausaleExists(const ADescrizione: string): Boolean;
   begin
     QCausaleExists.ParamValues['P_DESCRIZIONE'] := ADescrizione;
     QCausaleExists.Open;
     Result := not QCausaleExists.Eof;
     QCausaleExists.Close;
   end;
   procedure _AddCausaleiFNotExists(const APA_TipoDocumento, ADescrizione: String);
   begin
     if _TipoDocumentoExists(APA_TipoDocumento) or _CausaleExists(ADescrizione) then
       Exit;
     Q.ParamValues['P_DESCRIZIONE'] := ADescrizione;
     Q.ParamValues['P_PA_TIPODOCUMENTO'] := APA_TipoDocumento;
     Q.ExecSQL;
   end;
begin
  // Crea e imposta la query che effettuerà la registrazione dell'invio della
  //  comunicazione
  Q := TIB_Cursor.Create(Self);
  QTipoDocExists := TIB_Cursor.Create(Self);
  QCausaleExists := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    QTipoDocExists.DatabaseName := DM1.ArcDBFile;
    QTipoDocExists.IB_Connection := DM1.DBAzienda;
    QCausaleExists.DatabaseName := DM1.ArcDBFile;
    QCausaleExists.IB_Connection := DM1.DBAzienda;
    // Imposta la query che verifica se la causale con il tipo documento specificato esiste già oppure no
    QTipoDocExists.SQL.Add('SELECT FIRST 1 DESCRIZIONE FROM CAUSALI WHERE PA_TIPODOCUMENTO = :P_PA_TIPODOCUMENTO');
    QTipoDocExists.Prepare;
    // Imposta la query che verifica se la causale esiste già oppure no
    QCausaleExists.SQL.Add('SELECT FIRST 1 DESCRIZIONE FROM CAUSALI WHERE DESCRIZIONE = :P_DESCRIZIONE');
    QCausaleExists.Prepare;
    // Imposta la query per l'inserimento della nuova causale con il tipo documento voluto
    Q.SQL.Add('INSERT INTO CAUSALI (DESCRIZIONE, PA_TIPODOCUMENTO)');
    Q.SQL.Add('VALUES (:P_DESCRIZIONE, :P_PA_TIPODOCUMENTO)');
    Q.Prepare;
    // Inizio creazione automatica causali per i tipi documento mancanti    '
//    _AddCausaleiFNotExists('TD01', 'TD01-Fattura'); // Meglio non averla, ptrebbe creare confusione
    _AddCausaleiFNotExists('TD02', 'TD02-Acconto/anticipo su fattura');
//    _AddCausaleiFNotExists('TD04', 'TD04-Nota di credito'); // Meglio non averla, ptrebbe creare confusione
    _AddCausaleiFNotExists('TD05', 'TD05-Nota di debito');
    _AddCausaleiFNotExists('TD16', 'TD16-Integraz.fatt.rev.charge interno');
    _AddCausaleiFNotExists('TD17', 'TD17-Integraz./autofatt.acq.serv.estero');
    _AddCausaleiFNotExists('TD18', 'TD18-Integraz.acq.beni intracomunitari');
    _AddCausaleiFNotExists('TD19', 'TD19-Int/autof.acq.beni a.17c.2DPR633/72');
    _AddCausaleiFNotExists('TD20', 'TD20-Autofat.reg.int.fat.a6c8 dlgs471/97');
    _AddCausaleiFNotExists('TD20', 'TD20-Autofat.reg.int.fat.a46 c5 DL331/93');
    _AddCausaleiFNotExists('TD21', 'TD21-Autofattura per splafonamento');
    _AddCausaleiFNotExists('TD22', 'TD22-Estrazione beni da Deposito IVA');
    _AddCausaleiFNotExists('TD23', 'TD23-Estr.beni da Dep.IVA con versam.IVA');
    _AddCausaleiFNotExists('TD24', 'TD24-Fatt.differita art.21 c.4 lett.a');
    _AddCausaleiFNotExists('TD25', 'TD25-Ft.diff. a.21 c.4 terzo per. lett.b');
    _AddCausaleiFNotExists('TD26', 'Cess.ben.amm.li e pass.int.a.36DPR663/72');
    _AddCausaleiFNotExists('TD27', 'TD27-Ft.autocons, cess.grat.senza rivals');
  finally
    Q.Free;
    QTipoDocExists.Free;
    QCausaleExists.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - CREAZIONE LOOKUP TABLE PER FATTURA ELETTRONICA PA
// =============================================================================












// =============================================================================
// INIZIO - SALVATAGGIO E RIPRISTINO GRIGLIE DEV-EXPRESS
// -----------------------------------------------------------------------------
procedure TDM2.RestoreBandedTableView(Grid:TcxGrid; btv:TcxGridBandedTableView; NomeVista:String);
var
  NomeFile:String;
  P: TRepositoryIniFile;
  AlreadyUpdating: Boolean;
begin
  AlreadyUpdating := Grid.UpdateLocked;
  if not AlreadyUpdating then Grid.BeginUpdate;
  try
    // Ricava il nome del file
    NomeFile :=  Grid.Name + '_' + btv.Name + '___NEW___' + NomeVista + '.ini';
    // Salva lo stato dei pulsanti selettori nello stesso file
    P := TRepositoryIniFile.Create(DM1.ImpGridsDir + NomeFile, DM1.DBGenerale);
    try
      // Carica le viste
      CaricaVistaBandTableView(Grid, btv, P);
    finally
      P.Free;
    end;
  finally
    if not AlreadyUpdating then Grid.EndUpdate;
  end;
end;

procedure TDM2.SaveBandedTableView(Grid:TcxGrid; btv:TcxGridBandedTableView; NomeVista:String);
var
  NomeFile:String;
  P: TRepositoryIniFile;
begin
  // Ricava il nome del file
  NomeFile :=  Grid.Name + '_' + btv.Name + '___NEW___' + NomeVista + '.ini';
  // Salva il tutto nel file ini
  P := TRepositoryIniFile.Create(DM1.ImpGridsDir + NomeFile, DM1.DBGenerale);
  try
    SalvaVistaBandTableView(Grid, btv, P);
    P.UpdateFile;
  finally
    P.Free;
  end;
end;


// Procedura che effettua il salvataggio delle impostazioni della griglia
procedure TDM2.SalvaVistaBandTableView(Grid:TcxGrid; btv:TcxGridBandedTableView; P:TRepositoryIniFile);
var
  i, ii: Integer;
  Sez: String;
  CurrBand: TcxGridBand;
  CurrColumn: TcxGridBandedColumn;
begin
    // Cicla per tutte le Bande della vista e ne salva le proprietà che ci interessano
    for i := 0 to btv.Bands.Count -1 do begin
      CurrBand  := btv.Bands[i];
      Sez       := Grid.Name + '___' + btv.Name + '___BAND___' + CurrBand.Caption;
      P.WriteBool(Sez, 'Visible', CurrBand.Visible);
      P.WriteInteger(Sez, 'ColIndex', CurrBand.Position.ColIndex);
      P.WriteInteger(Sez, 'FixedKind', Ord(CurrBand.FixedKind));
      // Cicla per tutte le colonne della banda corrente e ne salva le proprietà che ci interessano
      for ii := 0 to CurrBand.ColumnCount -1 do begin
        CurrColumn := CurrBand.Columns[ii];
        Sez       := Grid.Name + '___' + btv.Name + '___BAND___' + CurrBand.Caption + '___COLUMN___' + CurrColumn.Name;
        P.WriteBool(Sez, 'Visible', CurrColumn.Visible);
        P.WriteInteger(Sez, 'GroupIndex', CurrColumn.GroupIndex);
        P.WriteInteger(Sez, 'BandIndex', CurrColumn.Position.BandIndex);
        P.WriteInteger(Sez, 'ColIndex', CurrColumn.Position.ColIndex);
        P.WriteInteger(Sez, 'SortIndex', CurrColumn.SortIndex);
        P.WriteInteger(Sez, 'SortOrder', Ord(CurrColumn.SortOrder));
        P.WriteInteger(Sez, 'Width', CurrColumn.Width);
      end;
    end;
end;



// Procedura che effettua il salvataggio delle impostazioni della griglia
procedure TDM2.CaricaVistaBandTableView(Grid:TcxGrid; btv:TcxGridBandedTableView; P:TRepositoryIniFile);
var
  i, ii, iii: Integer;
  Sez: String;
  CurrBand: TcxGridBand;
  CurrColumn: TcxGridBandedColumn;
begin
    // Cicla per tutte le Bande della vista e ne salva le proprietà che ci interessano
    for i := 0 to btv.Bands.Count -1 do begin
      CurrBand  := btv.Bands[i];
      Sez       := Grid.Name + '___' + btv.Name + '___BAND___' + CurrBand.Caption;
      if P.SectionExists(Sez) then begin
        if P.ValueExists(Sez, 'Visible')  then CurrBand.Visible := P.ReadBool(Sez, 'Visible', True);
        if P.ValueExists(Sez, 'ColIndex') then CurrBand.Position.ColIndex := P.ReadInteger(Sez, 'ColIndex', 0);
        // FIxedKind
        CurrBand.FixedKind := Low(CurrBand.FixedKind);
        for iii := 1 to P.ReadInteger(Sez, 'FixedKind', -1) do CurrBand.FixedKind := Succ(CurrBand.FixedKind);
        // Cicla per tutte le colonne della banda corrente e ne salva le proprietà che ci interessano
        for ii := 0 to CurrBand.ColumnCount -1 do begin
          CurrColumn := CurrBand.Columns[ii];
          Sez       := Grid.Name + '___' + btv.Name + '___BAND___' + CurrBand.Caption + '___COLUMN___' + CurrColumn.Name;
           if P.SectionExists(Sez) then begin
             if P.ValueExists(Sez, 'Visible')     then CurrColumn.Visible := P.ReadBool(Sez, 'Visible', True);
             if P.ValueExists(Sez, 'GroupIndex')  then CurrColumn.GroupIndex := P.ReadInteger(Sez, 'GroupIndex', -1);
             if P.ValueExists(Sez, 'BandIndex')   then CurrColumn.Position.BandIndex := P.ReadInteger(Sez, 'BandIndex', 0);
             if P.ValueExists(Sez, 'ColIndex')    then CurrColumn.Position.ColIndex := P.ReadInteger(Sez, 'ColIndex', 0);
             // Carica le  impostazioni per l'ordinamento solo se non siamo una Vista Dettaglio
             //  questo perchè altrimenti ritorna un errore poi la stampa del GC nel caso venga specificato un
             //  ordinamento probabilmente perchè si disallineano i DataController.
             if not btv.IsDetail then begin
               if P.ValueExists(Sez, 'SortIndex')   then CurrColumn.SortIndex := P.ReadInteger(Sez, 'SortIndex', -1);
               if P.ValueExists(Sez, 'SortOrder')   then begin
                 CurrColumn.SortOrder := Low(CurrColumn.SortOrder);
                 for iii := 1 to P.ReadInteger(Sez, 'SortOrder', -1) do CurrColumn.SortOrder := Succ(CurrColumn.SortOrder);
               end;
             end;
             if P.ValueExists(Sez, 'Width')       then CurrColumn.Width := P.ReadInteger(Sez, 'Width', -1);
          end;
        end;
      end;
    end;
end;

// Procedura che effettua il salvataggioe upload del file INI contenente i tioli delle
//  memorie del GC
procedure TDM2.SalvaCaptionMemoria(NomeFile:String; CurrSB, Mem1,Mem2,Mem3,Mem4,Mem5,Mem6,Mem7,Mem8,Mem9,Mem0: TSpeedButton);
var
  MemoryCaption, CodiceMemoria:String;
  P: TRepositoryIniFile;
begin
  // Inizializzazione
  MemoryCaption := CurrSB.Caption;
  CodiceMemoria := RightStr(CurrSB.Name, 1);
  // Chiede il nome della memoria
  if InputQuery('Nome Memoria', 'Quale titolo per questa memoria?', MemoryCaption) then begin
    // Controlla che la vista non sia nullo
    if Trim(MemoryCaption) = '' then raise Exception.Create('Titolo non valido.');
  end else begin
    // Se l'utente ha cliccato su Cancel annulla l'operazione
    Exit;
  end;
  // Scarica dal repository il file dei titoli delle memorie
  //  prima di aggiornarlo in modo da essere sicuro di usare una versione la
  //  più aggiornata possibile
  ScaricaMemoryCaptionFile(NomeFile);
  // Salva il titolo della memoria modificata
  P := TRepositoryIniFile.Create(DM1.ImpGridsDir + NomeFile, DM1.DBGenerale);
  try
    P.WriteString('MemoryCaptions', 'Memory'+CodiceMemoria, MemoryCaption);
    P.UpdateFile;
  finally
    P.Free;
  end;
  // Alla fine ricarica i titoli delle memorie
  CaricaTitoliMemorie(NomeFile, Mem1,Mem2,Mem3,Mem4,Mem5,Mem6,Mem7,Mem8,Mem9,Mem0);
end;


procedure TDM2.RetrodataNotificaFE(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc: TDate; Giorni: Integer);
var
  Qry: TIB_Cursor;
begin
  DM1.CheckForAlreadyInTransaction;
  DM1.DBAzienda.StartTransaction;
  try try
    Qry := TIB_Cursor.Create(Self);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE PRVORDCL SET FE_LASTNOTIFICATION = CURRENT_TIMESTAMP - CAST(:P_DAYS AS INTEGER)');
    Qry.SQL.Add('WHERE');
    Qry.SQL.Add('TIPODOCUMENTO = :P_TIPODOCUMENTO');
    Qry.SQL.Add('AND REGISTRO = :P_REGISTRO');
    Qry.SQL.Add('AND NUMORDPREV = :P_NUMORDPREV');
    Qry.SQL.Add('AND DATADOCUMENTO = :P_DATADOCUMENTO');
    Qry.Prepare;
    Qry.ParamByName('P_TIPODOCUMENTO').Value := TipoDoc;
    Qry.ParamByName('P_REGISTRO').Value := RegDoc;
    Qry.ParamByName('P_NUMORDPREV').Value := NumDoc;
    Qry.ParamByName('P_DATADOCUMENTO').Value := DataDoc;
    Qry.ParamByName('P_DAYS').AsInteger := Giorni;
    Qry.ExecSQL;
    DM1.DBAzienda.Commit;
  except
    DM1.DBAzienda.Rollback;
    raise;
  end;
  finally
    if Assigned(Qry) then
      Qry.Free;
  end;
end;


procedure TDM2.SalvaNotificaFE(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc: TDate; ResponseType, FileName, MsgCode, MsgText, MsgRaw: String; CheckForNotification: Boolean; NotificationWaitDays: Integer);
var
  Qry, QryDoc : TIB_Cursor;
  LBlobStream: TStream;
  LStringStream: TStringStream;
begin
  DM1.CheckForAlreadyInTransaction;
  DM1.DBAzienda.StartTransaction;
  try try
    // Persiste la notifica
    Qry := TIB_Cursor.Create(Self);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('INSERT INTO PRVORDCL_FE (TipoDoc, RegDoc, NumDoc, DataDoc, ResponseDate, NotificationDate, ResponseType, FileName, MsgCode, MsgText, MsgRaw, Done)');
    Qry.SQL.Add('VALUES');
    Qry.SQL.Add('(:P_TipoDoc, :P_RegDoc, :P_NumDoc, :P_DataDoc, :P_ResponseDate, :P_NotificationDate, :P_ResponseType, :P_FileName, :P_MsgCode, :P_MsgText, :P_MsgRaw, ''F'')');
    Qry.Prepare;
    Qry.ParamByName('P_TipoDoc').Value := TipoDoc;
    Qry.ParamByName('P_RegDoc').Value := RegDoc;
    Qry.ParamByName('P_NumDoc').Value := NumDoc;
    Qry.ParamByName('P_DataDoc').Value := DataDoc;
    Qry.ParamByName('P_ResponseDate').Value := Now;
    Qry.ParamByName('P_NotificationDate').Value := Qry.ParamByName('P_ResponseDate').Value;
    Qry.ParamByName('P_ResponseType').Value := ResponseType;
    Qry.ParamByName('P_FileName').Value := FileName;
    Qry.ParamByName('P_MsgCode').Value := MsgCode;
    Qry.ParamByName('P_MsgText').Value := MsgText;
    // ===========================================================================================
    // BLOCCO PER IL CARICAMENTO DEL MSGRAW, L'HO MESSO CON GLI STREAM E CON ENCODING UTF-8 PER SICUREZZA
    // -------------------------------------------------------------------------------------------
    LStringStream := TStringStream.Create(MsgRaw, TeiUTFEncodingWithoutBOM.Create);
    LBlobStream := Qry.CreateBlobStream(Qry.ParamByName('P_MsgRaw'), TIB_BlobStreamMode.bsmWrite );
    LBlobStream.CopyFrom(LStringStream, 0);
    // ===========================================================================================
    Qry.ExecSQL;
    // Update della fattura
    QryDoc := TIB_Cursor.Create(Self);
    QryDoc.DatabaseName := DM1.ArcDBFile;
    QryDoc.IB_Connection := DM1.DBAzienda;
    QryDoc.SQL.Add('UPDATE PRVORDCL SET');
    QryDoc.SQL.Add('FE_ID = :P_FE_ID');
    QryDoc.SQL.Add(',FE_STATUS = :P_FE_STATUS');
    QryDoc.SQL.Add(',FE_LASTNOTIFICATION = :P_FE_LASTNOTIFICATION');
    QryDoc.SQL.Add(',FE_CHECKFORNOTIFICATIONS = :P_FE_CHECKFORNOTIFICATIONS');
    QryDoc.SQL.Add(',FE_NOTIFICATIONWAITDAYS = :P_FE_NOTIFICATIONWAITDAYS');
    QryDoc.SQL.Add('WHERE');
    QryDoc.SQL.Add('TIPODOCUMENTO = :P_TIPODOCUMENTO');
    QryDoc.SQL.Add('AND REGISTRO = :P_REGISTRO');
    QryDoc.SQL.Add('AND NUMORDPREV = :P_NUMORDPREV');
    QryDoc.SQL.Add('AND DATADOCUMENTO = :P_DATADOCUMENTO');
    QryDoc.Prepare;
    QryDoc.ParamByName('P_FE_ID').Clear;
    QryDoc.ParamByName('P_FE_STATUS').Value := Qry.ParamByName('P_ResponseType').Value;
    QryDoc.ParamByName('P_FE_LASTNOTIFICATION').Value := Qry.ParamByName('P_ResponseDate').Value;
    if CheckForNotification then
      QryDoc.ParamByName('P_FE_CHECKFORNOTIFICATIONS').Value := '1'
    else
      QryDoc.ParamByName('P_FE_CHECKFORNOTIFICATIONS').Value := '0';
    QryDoc.ParamByName('P_FE_NOTIFICATIONWAITDAYS').Value := NotificationWaitDays;
    QryDoc.ParamByName('P_TIPODOCUMENTO').Value := TipoDoc;
    QryDoc.ParamByName('P_REGISTRO').Value := RegDoc;
    QryDoc.ParamByName('P_NUMORDPREV').Value := NumDoc;
    QryDoc.ParamByName('P_DATADOCUMENTO').Value := DataDoc;
    QryDoc.ExecSQL;
    // Commit
    DM1.DBAzienda.Commit;
  except
    DM1.DBAzienda.Rollback;
    raise;
  end;
  finally
    if Assigned(LBlobStream) then
      LBlobStream.Free;
    if Assigned(LStringStream) then
      LStringStream.Free;
    if Assigned(Qry) then
      Qry.Free;
    if Assigned(QryDoc) then
      QryDoc.Free;
  end;
end;

procedure TDM2.ScaricaMemoryCaptionFile(NomeFile:String);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    Q.SQL.Add('SELECT CONTENUTO FROM REPOSITORY WHERE NOMEFILE = ''' + NomeFile + '''');
    Q.Open;
    if not Q.Eof then Q.FieldByName('CONTENUTO').SaveToFile(DM1.ImpGridsDir + NomeFile);
    Q.Close;
  finally
    Q.Free;
  end;
end;


procedure TDM2.CaricaTitoliMemorie(NomeFile:String; Mem1,Mem2,Mem3,Mem4,Mem5,Mem6,Mem7,Mem8,Mem9,Mem0: TSpeedButton);
var
  P: TRepositoryIniFile;
begin
  // Salva il titolo della memoria modificata
  P := TRepositoryIniFile.Create(DM1.ImpGridsDir + NomeFile, DM1.DBGenerale);
  try
    Mem1.Caption  := P.ReadString('MemoryCaptions', 'Memory1', '---');
    Mem2.Caption  := P.ReadString('MemoryCaptions', 'Memory2', '---');
    Mem3.Caption  := P.ReadString('MemoryCaptions', 'Memory3', '---');
    Mem4.Caption  := P.ReadString('MemoryCaptions', 'Memory4', '---');
    Mem5.Caption  := P.ReadString('MemoryCaptions', 'Memory5', '---');
    Mem6.Caption  := P.ReadString('MemoryCaptions', 'Memory6', '---');
    Mem7.Caption  := P.ReadString('MemoryCaptions', 'Memory7', '---');
    Mem8.Caption  := P.ReadString('MemoryCaptions', 'Memory8', '---');
    Mem9.Caption  := P.ReadString('MemoryCaptions', 'Memory9', '---');
    Mem0.Caption  := P.ReadString('MemoryCaptions', 'Memory0', '---');
  finally
    P.Free;
  end;
end;



procedure TDM2.MemPredef_SaveSelection(Sez:String; CurrButton,Mem1,Mem2,Mem3,Mem4,Mem5,Mem6,Mem7,Mem8,Mem9,Mem0:TSpeedButton);
var
  P: TMemIniFile;
begin
  P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
  try
    // Salva nel param.ini (quindi in locale) la memoria predefinita
    P.WriteString(Sez, 'MemoriaPredefinita', RightStr(CurrButton.Name, 1));
    P.UpdateFile;
    // Tutti i pulsanti hanno vengono settati come non predefiniti
    Mem1.Font.Style  := [];
    Mem2.Font.Style  := [];
    Mem3.Font.Style  := [];
    Mem4.Font.Style  := [];
    Mem5.Font.Style  := [];
    Mem6.Font.Style  := [];
    Mem7.Font.Style  := [];
    Mem8.Font.Style  := [];
    Mem9.Font.Style  := [];
    Mem0.Font.Style := [];
    // Invece il pulsante della memoria predefinita deve apparire in grassetto
    CurrButton.Font.Style := [fsBold];
  finally
    P.Free;
  end;
end;

function TDM2.MemPredef_LoadSelection(Sez:String; Mem1,Mem2,Mem3,Mem4,Mem5,Mem6,Mem7,Mem8,Mem9,Mem0:TSpeedButton): TSpeedButton;
var
  P: TMemIniFile;
  MemNumber: String;
  FoundComponent: TComponent;
  CurrButton: TSpeedButton;
begin
  P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
  try
    // Numero della memoria predefinita
    //  NB: Se legge '' lo forza a '1' (è capitato anche se il parametro era vuoto quindi non togliere questa verifica)
    MemNumber := P.ReadString(Sez, 'MemoriaPredefinita', '1');
    if Trim(MemNumber) = '' then MemNumber := '1';

    // CurrButton punta al pulsante di memoria da selezionare come predefinito
    if      MemNumber = '1'  then CurrButton := Mem1
    else if MemNumber = '2'  then CurrButton := Mem2
    else if MemNumber = '3'  then CurrButton := Mem3
    else if MemNumber = '4'  then CurrButton := Mem4
    else if MemNumber = '5'  then CurrButton := Mem5
    else if MemNumber = '6'  then CurrButton := Mem6
    else if MemNumber = '7'  then CurrButton := Mem7
    else if MemNumber = '8'  then CurrButton := Mem8
    else if MemNumber = '9'  then CurrButton := Mem9
    else if MemNumber = '0'  then CurrButton := Mem0
    else Exit;
    // Tutti i pulsanti hanno vengono settati come non predefiniti
    Mem1.Font.Style  := [];
    Mem2.Font.Style  := [];
    Mem3.Font.Style  := [];
    Mem4.Font.Style  := [];
    Mem5.Font.Style  := [];
    Mem6.Font.Style  := [];
    Mem7.Font.Style  := [];
    Mem8.Font.Style  := [];
    Mem9.Font.Style  := [];
    Mem0.Font.Style := [];
    // Invece il pulsante della memoria predefinita deve apparire in grassetto
    CurrButton.Font.Style := [fsBold];
    // IMposta il ritorno
    Result := CurrButton;
  finally
    P.Free;
  end;
end;


procedure TDM2.RichiamaMemoria(Grid:TcxGrid; btv:TcxGridBandedTableView; MemButton:TSpeedButton; Qry:TIBOQuery; OpenQuery:Boolean=True);
begin
  // Il pulsante della memoria scelta viene messo Down
  MemButton.Down := True;
  // Chiusura Query
  Qry.Close;
  // Richiamo vista associata alla memoria
  RestoreBandedTableView(Grid, btv, 'M' + RightStr(MemButton.Name, 1));
  // Interrogazione
  if OpenQuery then ClientiForm.RxSpeedButtonTrovaClick(ClientiForm.RxSpeedButtonTrova);
end;


// -----------------------------------------------------------------------------
// FINE - SALVATAGGIO E RIPRISTINO GRIGLIE DEV-EXPRESS
// =============================================================================



// Function che restituisce True se l'indirizzo passato è conforme allo stradario
function TDM2.Stradario_IndirizzoVerificato(inCodiceComune, inDenominazioneComune, inDenominazioneStrada, inSiglaProvincia: String): Boolean;
begin
  // Verifica l'indirizzo con la stradario per certificarlo
  DM2.SP_Str_Certified.Close;
  DM2.SP_Str_Certified.Prepare;
  DM2.SP_Str_Certified.Params.ParamByName('IN_CODICECOMUNE').AsString         := inCodiceComune;
  DM2.SP_Str_Certified.Params.ParamByName('IN_DENOMINAZIONECOMUNE').AsString  := inDenominazioneComune;
  DM2.SP_Str_Certified.Params.ParamByName('IN_STRADA').AsString               := inDenominazioneStrada;
  DM2.SP_Str_Certified.Params.ParamByName('IN_SIGLAPROVINCIA').AsString       := inSiglaProvincia;
  DM2.SP_Str_Certified.Open;
  try
    Result := (DM2.SP_Str_Certified.Fields[0].AsString = 'T');
  finally
    DM2.SP_Str_Certified.Close;
  end;
end;

procedure TDM2.IBOQuery1BeforeOpen(DataSet: TDataSet);
begin
  DM1.DBAzienda.StartTransaction;
end;


// Procedure che rinnova il contratto/Abbonamento dell'impianto
procedure TDM2.Contratto_Rinnova(ContrattoDataScadenza:TDateTimeField; ContrattoMesiRinnovo:TIntegerField; ContrattoStato:TStringField; ContrattoRcevutaDisdetta:TStringField);
var
  NuovaScadenza: TDate;
begin
  // Controlla che la precedente data di scadenza sia valida
  if (ContrattoDataScadenza.IsNull) or (ContrattoDataScadenza.AsDateTime = 0)
  then raise Exception.Create('ATTENZIONE!!!'#13#13'La precedente data di scadenza non è valida.');
  // Controlla che Il numero dei mesi di rinnovo sia valido
  if (ContrattoMesiRinnovo.IsNull) or (ContrattoMesiRinnovo.AsInteger = 0)
  then raise Exception.Create('ATTENZIONE!!!'#13#13'Numero dei mesi per il rinnovo non valido.');
  // Controlla lo stato del contratto
  if      ContrattoStato.AsString = 'F' then raise Exception.Create('ATTENZIONE!!!'#13#13'Impianto NON abbonato.')
  else if ContrattoStato.AsString = 'S' then raise Exception.Create('ATTENZIONE!!!'#13#13'Il contratto/abbonamento è attualmente sospeso.')
  else if ContrattoStato.AsString = 'D' then raise Exception.Create('ATTENZIONE!!!'#13#13'Impianto dismesso.');
  // Calcola la nuova scadenza
  NuovaScadenza := IncMonth(ContrattoDataScadenza.AsDateTime, ContrattoMesiRinnovo.AsInteger);
  // Chiede conferma
  if (DM1.Messaggi('Levante', 'Confermi di voler rinnovare il contratto per'#13'ulteriori ' + ContrattoMesiRinnovo.AsString + ' mesi?', 'NB: La nuova data di scadenza sarà il ' + FormatDateTime('dd/mm/yyyy', NuovaScadenza), [mbYes,mbNo], 0, nil) <> mrYes)
  then Exit;
  // Avverte se è stata ricevuta la disdetta
  if  (ContrattoRcevutaDisdetta.AsString = 'T')
  and (DM1.Messaggi('Levante', 'DISDETTA RICEVUTA'#13#13'Proseguo ugualmente con il rinnovo?', '', [mbYes,mbNo], 0, nil) <> mrYes)
  then Exit;
  // Assegna la nuova scadenza
  if (ContrattoDataScadenza.DataSet.State <> dsEdit) then ContrattoDataScadenza.DataSet.Edit;
  ContrattoDataScadenza.Value := NuovaScadenza;
end;



function TDM2.ControlloCodiceFiscalePartitaIva(ANome, ACognome, ACodiceFiscale, APartitaIVA, ASiglaNazione, ATipoPersona: string; const ARaiseException, ADisabilitaVerificaCodFisc: boolean): boolean;
begin
  if ADisabilitaVerificaCodFisc then
    Exit(True);
  // Init
  Result := True;
  ACodiceFiscale := Trim(ACodiceFiscale);
  APartitaIVA := Trim(APartitaIVA);
  ASiglaNazione := UpperCase(Trim(ASiglaNazione));
  // NB: Se la sigla nazione non è "IT" non effettua il controllo quindi restituisce subito True
  if (ASiglaNazione <> 'IT') then
    Exit;
  // Verifica il CF solo se abilitato per il tipo di persona
  if (DM1.VerificaCodFisc_PersonaFisica and (ATipoPersona = 'F'))
  or (DM1.VerificaCodFisc_PersonaGiuridica and (ATipoPersona = 'G'))
  or (DM1.VerificaCodFisc_PubblicaAmministrazione and (ATipoPersona = 'P'))
  then
  begin
    // Controllo esistenza C.F. e Partita IVA
    if  (ACodiceFiscale = '') and (APartitaIVA = '') then
    begin
      if ARaiseException then
        raise Exception.Create('Partita IVA e Codice Fiscale non presenti!!!')
      else
      if DM1.Messaggi('Levante', 'Partita IVA e Codice Fiscale non presenti!!!'#13#13'Continuare ugualmente?', '', [mbYes, mbNo], 0, nil) <> mrYes then
        Exit(False);
    end;
    // controllo Partita IVA
    if  (APartitaIVA <> '')and not USNCONTROLLO_CF_PI.controllo_partita_iva(APartitaIVA) then
    begin
      if ARaiseException then
        raise Exception.Create('Partita IVA non corretta!!!')
      else
      if DM1.Messaggi('Levante', 'Partita IVA non corretta!!!'#13#13'Continuare ugualmente?', '', [mbYes, mbNo], 0, nil) <> mrYes then
        Exit(False);
    end;
    // controllo Codice Fiscale
    if  (ACodiceFiscale <> '')and not USNCONTROLLO_CF_PI.controllo_codice_fiscale_partita_iva(ACodiceFiscale, ANome, ACognome) then
    begin
      if ARaiseException then
        raise Exception.Create('Codice Fiscale non corretto!!!')
      else
      if DM1.Messaggi('Levante', 'Codice Fiscale non corretto!!!'#13#13'Continuare ugualmente?', '', [mbYes, mbNo], 0, nil) <> mrYes then
        Exit(False);
    end;
  end;
end;



// =============================================================================
// CONVERSIONE DELLE OP
// -----------------------------------------------------------------------------
// Procedure che verifica la presenza o meno di OP non ancora convertite e quindi
//  senza sconto ne IVA e se ne trova provvede alla lo conversione e ricalcolo.
procedure TDM2.ConvertiCampoEsibilitaIVAneiDocumenti;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PRVORDCL SET SPLITPAYMENT = ''S'' WHERE SPLITPAYMENT = ''T''');
    Q.ExecSQL;
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE PRVORDCL SET SPLITPAYMENT = ''I'' WHERE COALESCE(SPLITPAYMENT, ''F'') = ''F''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TDM2.ConvertiOpIva(Tabella:String);
var
   Q, Q2: TIB_Cursor;
   CurrPrzUnit, CurrPrzUnitIvaComp, CurrAliqIva: Double;
   CampoIdCodice: String;
begin
  // Determina il nome del campo Codice o ID in base alla tabella
  if Uppercase(Tabella) = 'OP'
    then CampoIdCodice := 'CODICE'
    else CampoIdCodice := 'ID';
  try
    // Crea e imposta le query
    Q := TIB_Cursor.Create(Self);
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q2 := TIB_Cursor.Create(Self);
    Q2.DatabaseName := DM1.ArcDBFile;
    Q2.IB_Connection := DM1.DBAzienda;
    // Imposta la query che troverà le eventuali OP non ancora convertite
    Q.SQL.Add('SELECT O.' + CampoIdCodice + ', O.PRZUNIT, O.SCONTO1, O.SCONTO2, O.SCONTO3, O.PRZUNITNETTO, O.CODICEIVA, O.PRZUNITIVACOMP, O.PRZUNITNETTOIVACOMP, I.ALIQUOTAIVA');
    Q.SQL.Add('FROM ' + Tabella + ' O');
    Q.SQL.Add('JOIN ALIQIVA I ON (I.CODICEIVA=O.CODICEIVA)');
    Q.SQL.Add('WHERE COALESCE(O.PRZUNIT,0) <> COALESCE(O.PRZUNITNETTOIVACOMP,0)');
    Q.SQL.Add('  AND COALESCE(O.CODICEIVA,1) = 1');
    Q.Open;
    // Cicla per i records trovati e li converte
    while not Q.Eof do begin
      // Carica il prezzo unitario attuale per comodità
      CurrPrzUnit         := Q.FieldByName('PRZUNIT').AsFloat;
      CurrAliqIva         := Q.FieldByName('ALIQUOTAIVA').AsFloat;
      CurrPrzUnitIvaComp  := DM1.Arrotonda(CurrPrzUnit * ((100 + CurrAliqIva) / 100) , DM1.DecMicroPrz);
      // IMposta ed esegue la query che convertirà l'OP corrente
      Q2.SQL.Clear;
      Q2.SQL.Add('UPDATE ' + Tabella + ' SET');
      Q2.SQL.Add('  CODICEIVA = 1');
      Q2.SQL.Add(', SCONTO1 = 0, SCONTO2 = 0, SCONTO3 = 0');
      Q2.SQL.Add(', PRZUNITNETTO = ' + DM1.VirgolaPunto(CurrPrzUnit));
      Q2.SQL.Add(', PRZUNITIVACOMP = ' + DM1.VirgolaPunto(CurrPrzUnitIvaComp));
      Q2.SQL.Add(', PRZUNITNETTOIVACOMP = ' + DM1.VirgolaPunto(CurrPrzUnitIvaComp));
      if Uppercase(Tabella) = 'OP'
        then Q2.SQL.Add('WHERE CODICE = ' + QuotedStr(Q.FieldByName('CODICE').AsString))
        else Q2.SQL.Add('WHERE ID = ' + Q.FieldByName('ID').AsString);
      Q2.ExecSQL;
      // Avanti il prossimo
      Q.Next;
    end;
    Q.Close;
  finally
    // Pulizie finali
    if Assigned(Q)  then Q.Free;
    if Assigned(Q2) then Q2.Free;
  end;
end;
// =============================================================================


procedure TDM2.DataModuleCreate(Sender: TObject);
begin
  // Collega i DataSet di Lookup
  DM1.EdPropPACondizioniPagamento.Properties.ListSource := SourceLookupPA_CondizioniPagamento;
  DM1.EdPropPAEsigibilitaIVA.Properties.ListSource := SourceLookupPA_EsigibilitaIVA;
  DM1.EdPropPAModalitaPagamento.Properties.ListSource := SourceLookupPA_ModalitaPagamento;
  DM1.EdPropPANaturaIVA.Properties.ListSource := SourceLookupPA_NaturaIVA;
  DM1.EdPropPARegimeFiscale.Properties.ListSource := SourceLookupPA_RegimeFiscale;
  DM1.EdPropPARitAccCausalePag.Properties.ListSource := SourceLookupPA_RitAccCausalePag;
  DM1.EdPropPASocioUnico.Properties.ListSource := SourceLookupPA_SocioUnico;
  DM1.EdPropPAStatoLiquidazione.Properties.ListSource := SourceLookupPA_StatoLiquidazione;
  DM1.EdPropPATipoDocumento.Properties.ListSource := SourceLookupPA_TipoDocumento;
end;

function TDM2.DateTimeToSemestre(const ADateTime: TDateTime): String;
var
  LYear, LMonth, LDay: Word;
  LSemestre: Byte;
begin
  DecodeDate(ADateTime, LYear, LMonth, LDay);
  case LMonth of
    1..6: LSemestre := 1;
    7..12: LSemestre := 2;
  end;
  Result := Format('%d.%d°', [LYear, LSemestre]);
end;

function TDM2.DateTimeToTrimestre(const ADateTime: TDateTime): String;
var
  LYear, LMonth, LDay: Word;
  LTrimestre: Byte;
begin
  DecodeDate(ADateTime, LYear, LMonth, LDay);
  case LMonth of
    1..3: LTrimestre := 1;
    4..6: LTrimestre := 2;
    7..9: LTrimestre := 3;
    10..12: LTrimestre := 4;
  end;
  Result := Format('%d.%d°', [LYear, LTrimestre]);
end;



procedure TDM2.DefaultizzaNaturaIVA_FE;
var
  QSel, QUpd: TIB_Cursor;
  CurrIVA: string;
  CurrCodiceIVA: integer;
  Fatto: boolean;
begin
  try try

    QUpd := TIB_Cursor.Create(Self);
    QUpd.DatabaseName := DM1.ArcDBFile;
    QUpd.IB_Connection := DM1.DBAzienda;
    QUpd.SQL.Add('UPDATE ALIQIVA SET PA_NATURA = :P_PA_NATURA WHERE CODICEIVA = :P_CODICEIVA');
    QUpd.Prepare;

    QSel := TIB_Cursor.Create(Self);
    QSel.DatabaseName := DM1.ArcDBFile;
    QSel.IB_Connection := DM1.DBAzienda;
    QSel.SQL.Add('SELECT CODICEIVA, DESCRIZIONEIVA FROM ALIQIVA WHERE (COALESCE(ALIQUOTAIVA,0) = 0) AND (TRIM(COALESCE(PA_NATURA,'''')) = '''')');
    QSel.Open;
    while not QSel.Eof do
    begin
      Fatto := False;
      CurrCodiceIVA := QSel.FieldByName('CODICEIVA').AsInteger;
      CurrIVA := QSel.FieldByName('DESCRIZIONEIVA').AsString;
      QUpd.ParamByName('P_CODICEIVA').Value := CurrCodiceIVA;
      // Escluso iva (N1)
      if ContainsText(CurrIVA, 'ESCL')
      then
      begin
        if Fatto then
          ShowMessage(Format('A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13'Problema con la conversione IVA "%s" codice %d (doppia conversione)', [CurrIVA, CurrCodiceIVA]));
        Fatto := True;
        QUpd.ParamByName('P_PA_NATURA').Value := 'N1';
        QUpd.ExecSQL;
      end;
      // Non soggeto iva (N2)
      // Fuori campo iva (N2)
      if ContainsText(CurrIVA, 'NON SOG')
      or ContainsText(CurrIVA, 'FUORI CAMP')
      then
      begin
        if Fatto then
          ShowMessage(Format('A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13'Problema con la conversione IVA "%s" codice %d (doppia conversione)', [CurrIVA, CurrCodiceIVA]));
        Fatto := True;
        QUpd.ParamByName('P_PA_NATURA').Value := 'N2';
        QUpd.ExecSQL;
      end;
      // Non imponibile iva (N3)
      if ContainsText(CurrIVA, 'NON IMP')
      then
      begin
        if Fatto then
          ShowMessage(Format('A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13'Problema con la conversione IVA "%s" codice %d (doppia conversione)', [CurrIVA, CurrCodiceIVA]));
        Fatto := True;
        QUpd.ParamByName('P_PA_NATURA').Value := 'N3';
        QUpd.ExecSQL;
      end;
      // Esente iva (N4)
      if ContainsText(CurrIVA, 'ESENT')
      then
      begin
        if Fatto then
          ShowMessage(Format('A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13'Problema con la conversione IVA "%s" codice %d (doppia conversione)', [CurrIVA, CurrCodiceIVA]));
        Fatto := True;
        QUpd.ParamByName('P_PA_NATURA').Value := 'N4';
        QUpd.ExecSQL;
      end;
      // Reverse charge (N6)
      if (ContainsText(CurrIVA, 'REV') and ContainsText(CurrIVA, 'CHARG'))
      or (ContainsText(CurrIVA, 'ART') and ContainsText(CurrIVA, '17'))
      then
      begin
        if Fatto then
          ShowMessage(Format('A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13'Problema con la conversione IVA "%s" codice %d (doppia conversione)', [CurrIVA, CurrCodiceIVA]));
        Fatto := True;
        QUpd.ParamByName('P_PA_NATURA').Value := 'N6';
        QUpd.ExecSQL;
      end;
      // Se non ha convertito per niente
//      if not Fatto then
//        ShowMessage(Format('A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13'Problema con la conversione IVA "%s" codice %d (non riconosciuta)', [CurrIVA, CurrCodiceIVA]));
      // Avanti il prossimo
      QSel.Next;
    end;
  except
    raise;
  end;
  finally
    if Assigned(QSel) then
      QSel.Free;
    if Assigned(QUpd) then
      QUpd.Free;
  end;
end;

procedure TDM2.DefaultizzaSiglaNazioneSoggetto;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE CLIENTI SET NAZIONESIGLA = ''IT'', ESTERO = ''F'', ESTERO_UE = ''U''');
    Q.SQL.Add('WHERE TRIM(COALESCE(NAZIONESIGLA,'''')) = ''''');
    Q.SQL.Add('  AND COALESCE(ESTERO,''F'') <> ''T''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;


function TDM2.SoggettoEstero(const ACodiceCliente: Integer): boolean;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT NAZIONESIGLA FROM CLIENTI WHERE CODICE = ' + IntToStr(ACodiceCliente));
    Q.Open;
    if Q.Eof then
      raise Exception.Create('DM2.ClienteEstero: Codice soggetto non trovato');
    result := UpperCase(Trim(Q.Fields[0].AsString)) <> 'IT';
  finally
    Q.Free;
  end;
end;

end.
