unit FormScambioDoc;
                                                                                                                                
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdFTP, StdCtrls, cxControls, cxGridCustomView,
  IdFTPCommon, StrUtils, UnitSaveXMLDocument, ExtCtrls, IB_Components, IniFiles,                      
  bmpPanel, Buttons, MAURI_SB, ZLIBArchive, DB, Menus,
  IdExplicitTLSClientServerBase;

const
    SHOW_WAIT_TITLE = 'Teletrasporto';

    IMAGE_INDEX_FTP = 0;
    IMAGE_INDEX_LISTINO = 1;
    IMAGE_INDEX_FE = 6;

type
  // Definizione della struttura che contiene i dati dei documenti presenti nella directory remota
  TDocList = record
     TipoDoc      : String;
     NumDoc       : String;
     Registro     : String;
     DataDoc      : String;
     PIVA_Dest    : String;
     PIVA_Mitt    : String;
     RagSocMitt   : String;
     FilialeMitt  : String;
     FileName     : String;
  end;

  TScambioDocForm = class(TForm)
    IdFTP1: TIdFTP;
    CloseTimer: TTimer;
    AutoRefresh: TTimer;
    ZLB1: TZLBArchive;
    PopupMenuSend: TPopupMenu;
    PopupMenuReceive: TPopupMenu;
    Refresh1: TMenuItem;
    Refresh2: TMenuItem;
    Eliminavociselezionate1: TMenuItem;
    Eliminavociselezionate2: TMenuItem;
    TeletrasportoPanel: TPanel;
    SBChiudiTeletrasporto: TSpeedButtonRollOver;
    SendLV: TListView;
    ReceiveLV: TListView;
    SBInviaDocumento: TButton;
    SBRiceviDocumento: TButton;
    SBRefreshFTP: TButton;
    ImageBottomFixed: TImage;
    ImageTopFixed: TImage;
    ImageStretched: TImage;
    BalloonHint: TBalloonHint;
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SendLVDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure SBRefreshFTPClick(Sender: TObject);
    procedure CaricaDatiDocumento(var DatiDoc:TDocList; NF:String);
    procedure InviaDocumento(TipoDoc:String; NumDoc:Integer; Registro:String; DataDoc:TDateTime);
    procedure InviaDocumentiSelezionati;
    procedure SBInviaDocumentoClick(Sender: TObject);
    procedure ReceiveLVMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RiceviDocumento(NomeFile:String);
    procedure RiceviFatturaElettronica(const AID: Integer);
    procedure SBRiceviDocumentoClick(Sender: TObject);
    procedure RefreshFattureElettroniche;
    procedure RefreshFTP;
    procedure Refresh;
    procedure DisconnectFTP;
    procedure ReceiveLVKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EliminaDocumentiSelezionati(LV:TListView);
    procedure IdFTP1Disconnected(Sender: TObject);
    procedure CloseTimerTimer(Sender: TObject);
    procedure AutoRefreshTimer(Sender: TObject);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure SBChiudiTeletrasportoClick(Sender: TObject);
    procedure SendLVAdvancedCustomDraw(Sender: TCustomListView;
      const ARect: TRect; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure Refresh1Click(Sender: TObject);
    procedure Eliminavociselezionate1Click(Sender: TObject);
    procedure Eliminavociselezionate2Click(Sender: TObject);
    procedure Ridimensiona;
    procedure ReceiveLVAdvancedCustomDraw(Sender: TCustomListView;
      const ARect: TRect; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure LevanteLight_RiceviTuttiDoc;
    procedure DownloadFileResOrd(DocImp:TStrings);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure ReceiveLVMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FLastItemHinted: TListItem;
    // Flag che indica se la disconnessione stà avvenendo perchè l'utente lo ha richiesto
    //  oppure per altri motivi tecnici
    UserDisconnect : Boolean;
    procedure CaricaDatiListinoGruppoArco(var DatiDoc: TDocList;
      NF: String);
    procedure RiceviListinoGruppoArco(PrzFileName, PrzDistributore, PrzFiliale:String; PrzVersione:TDateTime);
    procedure CaricaSfondo;
    procedure RiceviListinoCustomGruppoArco(PrzFileName, PrzDistributore,
      PrzFiliale: String; PrzVersione: TDateTime);
    procedure CaricaDatiFileResiduoOrdini(var NF, TipoDoc, FileDst,
      FileMittRagSoc, FileFil: String);
  public
    { Public declarations }
    // Codice univoco per l'identificazione dell'azienda all'interno
    //  del sistema di interscambio dei documenti (attualmente è utilizzata la
    //  Partita IVA)
    DXC_CodiceAzienda : String;
    DXC_PidAzienda : String;
  end;

var
  ScambioDocForm: TScambioDocForm;

implementation

uses main, DataModule1, SchedaClienti, IB_Session,
  DForce.Mini.ei.Invoice.Interfaces, UnitLevanteEInvoice,
  DForce.Mini.ei.Invoice.Factory, FatturaPA_DM;

{$R *.dfm}


procedure TScambioDocForm.CaricaDatiFileResiduoOrdini(var NF:String; var TipoDoc:String; var FileDst:String; var FileMittRagSoc:String; var FileFil:String);
var
  TmpNomeFile: String;
begin
   // Inizializzazione
   TmpNomeFile := NF;
   // Prima di tutto elimina la prima parte del nome file, la prima parte infatti
   // contiene i permessi la data di creazione del file e altri dati che non
   //  mi interessano, wuindi elimina tutto quello che c'è prima del TAG "-TDC-"
   DM1.RitornaTestoPrimaDi('-TYP-', TmpNomeFile, True);
   // Rimette a posto il "-" che il RitornaTestoPrimaDi gli ha tolto altrimenti
   //  ci potrebbero essere dei problemi successivamente.
   TmpNomeFile := '-'+TmpNomeFile;
   // Nome completo del file così come è, lo ritorna al chiamante per dargli il nome file pulito
   NF := TmpNomeFile;
   // Toglie il primo marcatore (i primi 4 caratteri contenenti "-TDC-")
   TmpNomeFile := RightStr(TmpNomeFile, Length(TmpNomeFile)-5);
   // Carica tutti gli altri dati eliminando ogni volta il restante marcatore all'inizio
   //  della stringa (cioè i primi 4 caratteri) perchè con il parametro True (l'ultimo)
   //  elimina solo il primo rigo e non tutta la stringa ricercata.
   TipoDoc              := DM1.RitornaTestoPrimaDi('-DST-', TmpNomeFile, True);
   TmpNomeFile          := RightStr(TmpNomeFile, Length(TmpNomeFile)-4);
   FileDst              := DM1.RitornaTestoPrimaDi('-MRS-', TmpNomeFile, True);
   TmpNomeFile          := RightStr(TmpNomeFile, Length(TmpNomeFile)-4);
   FileMittRagSoc       := DM1.RitornaTestoPrimaDi('-FIL-', TmpNomeFile, True);
   TmpNomeFile          := RightStr(TmpNomeFile, Length(TmpNomeFile)-4);
   FileFil              := DM1.RitornaTestoPrimaDi('.RSO', TmpNomeFile, True);
end;

// Procedura che scarica il file dal server FTP, e lo decomprime
procedure TScambioDocForm.DownloadFileResOrd(DocImp:TStrings);
var
  RemoteFileName, CompressedFileName, FullPathCompressedFileName, FinalFileName, FullPathFinalFileName: String;
  LS: TStringList;       // StringList di appoggio dove sarà caricata la lista dei files esistenti nella directory remota
  i: Integer;
  TipoDoc, DestDoc, MittRagSocDoc, FilialeDoc: String;
  RemoteFileDate:TDateTime;
begin
  // Crea la StringList che conterrà l'elenco dei files contenuti nella directory remota
  LS := TStringList.Create;
  // Calcola alcuni nomi di files
  CompressedFileName := 'CompressedResOrd.RSO';
  FullPathCompressedFileName := DM1.DownloadDir + CompressedFileName;
  FinalFileName := 'ResOrd.XML';
  FullPathFinalFileName := DM1.DownloadDir + FinalFileName;

  try
    // Imposta il tipo trasferimento dei dati ASCII
    IdFTP1.TransferType := ftASCII;
    // Carica su LS la lista dei files contenuti nella directory remota
    DM1.ShowWait('Teletrasporto', 'Richiesta lista files...' + '*.RSO');
    LS.Clear;
    IdFTP1.List(LS, '-TYP-RESORD*.RSO', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
    DM1.ShowWait('Teletrasporto', 'Analisi files ricevuti...' + '*.RSO');
    // Cicla per tutti i files trovati...
    for i := 0 to LS.Count -1 do begin
      // Carica sulla variabile il nome del file remoto
      RemoteFileName := LS[i];
      // Carica alcuni dati contenuti nel nome del file in alcune variabili locali per comodità e
      //  per verificare se si tratta del file da visualizzare oppure no
      CaricaDatiFileResiduoOrdini(RemoteFileName, TipoDoc, DestDoc, MittRagSocDoc, FilialeDoc);
      // Se il file è veramente destinato a noi e proviene dalla filiale impostata nel PID...
      //  NB: IN realtà non controlla la provenienza da una certa filiale e quindi non controlla il
      //       PID, questo perchè tanto il residuo ordini è già destinato in base alla partita IVA
      //       inoltre, almeno al momento il caronte non esporta il PID o meglio come PID esporta
      //       sempre "NC".
      if (TipoDoc = 'RESORD') and (DestDoc = DXC_CodiceAzienda) then begin
        // Esegue il Download del file del documento dal server
        DM1.ShowWait('Teletrasporto', 'Download file: "' + RemoteFileName + '"');
        IdFTP1.TransferType := ftBinary;
        IdFTP1.Get(RemoteFileName, FullPathCompressedFileName, True);
        // Decompressione file
        DM1.ShowWait('Teletrasporto', 'Decompressione file:  "' + CompressedFileName + '"');
        ZLB1.OpenArchive(FullPathCompressedFileName);
        DM1.ShowWait('Teletrasporto', 'Extract file  "' + FinalFileName + '"');
        ZLB1.ExtractFileByName(DM1.DownloadDir, FinalFileName);
        // Chiusura file compresso
        DM1.ShowWait('Teletrasporto', 'Chiusura archivio compresso...');
        ZLB1.CloseArchive;
        // IMposta la data del file del residuo ordini in modo che indichi la stessa
        //  data del file sul server FTP e la usa per indicare all'utente la data del residuo ordini.
        RemoteFileDate := IdFTP1.DirectoryListing.Items[i].ModifiedDate;
//        FileSetDate(FullPathFinalFileName, DateTimeToFileDate(RemoteFileDate));
        // Salva il file del residuo ordini appena scaricato nel database
        DM1.ShowWait('Teletrasporto', 'Salvataggio residuo ordini nel database...');
        DM1.ResOrd_PutOnDatabase(FullPathFinalFileName, RemoteFileDate);
        // Aggiorna l'elenco dei documenti scaricati
        DocImp.Add('Residuo ordini ' + MittRagSocDoc + ' del ' + DateToStr(RemoteFileDate));
        // Esce dal ciclo perchè ne deve caricare solo uno
        Break;
      end;
    end;
  finally
    DM1.CloseWait;
    LS.Free;
  end;
end;




// Elimina i documenti selezionati nella ListView ricevuta come parametri
procedure TScambioDocForm.EliminaDocumentiSelezionati(LV:TListView);
  procedure DeleteFromFTP;
  var
    LNomeFile : String;
  begin
    if DM1.Messaggi(SHOW_WAIT_TITLE, 'Eliminare la seguente voce dal teletrasporto?'#13#13 + LV.Selected.Caption, '', [mbYes,mbNo], 0, nil) <> mrYes then
    begin
      LV.Selected.Selected := False;
      Exit;
    end;
    // Verifica che ci sia ancora la connessione
    if not IdFTP1.Connected then
      raise Exception.Create('Server FTP non connesso');
    // RIcava il nome del file da eliminare
    LNomeFile := LV.Selected.SubItems[3];
    // Controlla che il file esista ancora, se esiste lo elimina, altrimenti
    //  no e prosegue.
    if IdFTP1.Size(LNomeFile) <> -1 then
      IdFTP1.Delete(LNomeFile);
    // Elimina la voce dalla ListView
    LV.Selected.Delete;
  end;
  procedure DeleteNotification;
  var
    LID: integer;
  begin
    if DM1.Messaggi(SHOW_WAIT_TITLE, 'Nascondere la notifica del seguente documento?'#13#13 + LV.Selected.Caption, '', [mbYes,mbNo], 0, nil) <> mrYes then
    begin
      LV.Selected.Selected := False;
      Exit;
    end;
    LID := StrToInt(ReceiveLV.Selected.SubItems[6]);
    if TFatturaPA.SetNotificationHide(LID, True) then
      LV.Selected.Delete
    else
      LV.Selected.Selected := False;
  end;
begin
   try
      // Cicla finchè ci sono elementi selezionati
      while LV.SelCount > 0 do
      begin
        DM1.ShowWait(SHOW_WAIT_TITLE, 'Elimino/Nascondo ' + LV.Selected.Caption);
        case LV.Selected.ImageIndex of
          // Se è un documento FTP...
          IMAGE_INDEX_FTP: DeleteFromFTP;
          // Se è una fattura elettronica la elimina dalla tabella delle notifiche
          IMAGE_INDEX_FE: DeleteNotification;
        // Altrimenti la elimina dal server FTP
        else
          begin
            DM1.Messaggi(SHOW_WAIT_TITLE, 'Non è possibile eliminare questo elemento:'#13#13 + LV.Selected.Caption, '', [mbOK], 0, nil);
            LV.Selected.Selected := False;
          end;
        end;
      end;
   finally
      DM1.CloseWait;
      // Aggiorna lo schermo
      SBRefreshFTPClick(SBRefreshFTP);
   end;
end;


// SI disconnette dal server di interscambio dei documenti
procedure TScambioDocForm.DisconnectFTP;
begin
   try
      DM1.ShowWait(SHOW_WAIT_TITLE, 'Disconnecting.');
      // La disconnessione è per volontà dell'utente
      UserDisconnect := True;
      // Si disconnette dal circuito
      if IdFTP1.Connected then IdFTP1.Quit;
      // Pausa per estetica
      if not MainForm.IsLevanteLight then Sleep(1000);
      // CHiude la form
      Close;
   finally
      DM1.CloseWait;
   end;
end;



{
// Effettua il refreshing del video
procedure TScambioDocForm.RefreshFTP;
var
   LS: TStringList;       // StringList di appoggio dove sarà caricata la lista dei files esistenti nella directory remota
   ListItem : TListItem;  // Item temporanea per l'inserimento di nuove voci
   i : Integer;           // Indice per ciclo
   DatiDoc : TDocList;    // Record temporaneo dove vengono appoggiati tutti i dati contenuti nel nome del file per poi essere inseriti nella ListView
begin
   // Crea la StringList che conterrà l'elenco dei files contenuti nella directory remota
   LS := TStringList.Create;
   try
      DM1.ShowWait(SHOW_WAIT_TITLE, 'Refreshing...');
      // Azzera la list view
      SendLV.Items.Clear;
      ReceiveLV.Items.Clear;
      // Imposta il tipo trasferimento dei dati ASCII
      IdFTP1.TransferType := ftASCII;

      // =======================================================================
      // CARICAMENTO LISTA FILES DOCUMENTI
      // -----------------------------------------------------------------------
      // Carica su LS la lista dei files contenuti nella directory remota
      LS.Clear;
      IdFTP1.List(LS, '*.DXC', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
      // CIcla per inserire tutte le voci nella ListView
      for i := 0 to LS.Count -1 do begin
         // Carica in DatiDoc tutti i dati contenuti nel nome completo del file
         CaricaDatiDocumento(DatiDoc, LS[i]);
         // Se il documento attuale è un documento in ricezione...
         if DatiDoc.PIVA_Dest = DXC_CodiceAzienda then begin
            // Aggiunge la voce corrente alla list view dei documenti in ricezione
            ListItem := ReceiveLV.Items.Add;
            ListItem.ImageIndex       := 0;
            ListItem.Caption          := DatiDoc.TipoDoc + ' ' + DatiDoc.NumDoc + DatiDoc.Registro + ' ' + DatiDoc.RagSocMitt;
            ListItem.SubItems.Add(DatiDoc.DataDoc);     // Data del documento
            ListItem.SubItems.Add(DatiDoc.PIVA_Mitt);   // Partita IVA del mittente
            ListItem.SubItems.Add(DatiDoc.PIVA_Dest);   // Partita IVA del destinatario
            ListItem.SubItems.Add(DatiDoc.FileName);    // Nome del file
         // Se invece il documento attuale è un documento inviato...
         end else if DatiDoc.PIVA_Mitt = DXC_CodiceAzienda then begin
            // Aggiunge la voce corrente alla list view dei documenti inviati
            ListItem := SendLV.Items.Add;
            ListItem.ImageIndex       := 0;
            ListItem.Caption          := DatiDoc.TipoDoc + ' ' + DatiDoc.NumDoc + DatiDoc.Registro + ' ' + DatiDoc.RagSocMitt;
            ListItem.SubItems.Add(DatiDoc.DataDoc);
            ListItem.SubItems.Add(DatiDoc.PIVA_Mitt);
            ListItem.SubItems.Add(DatiDoc.PIVA_Dest);
            ListItem.SubItems.Add(DatiDoc.FileName);
         end;
      end;
      // =======================================================================

      // =======================================================================
      // CARICAMENTO LISTINO PREZZI ARTICOLI
      // -----------------------------------------------------------------------
      // Carica su LS la lista dei files contenuti nella directory remota
      LS.Clear;
      IdFTP1.List(LS, '*.LCC', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
      // CIcla per inserire tutte le voci nella ListView
      for i := 0 to LS.Count -1 do begin
         // Carica in DatiDoc tutti i dati contenuti nel nome completo del file
         CaricaDatiListinoGruppoArco(DatiDoc, LS[i]);
         // Se si tratta di un file contenente i prezzi degli articoli (non l'anagrafica)
         //  e siamo noi i destinatari...
         if (DatiDoc.PIVA_Dest = DXC_CodiceAzienda) and (DatiDoc.TipoDoc = 'PREZZIART') then begin
            // Aggiunge la voce corrente alla list view dei documenti in ricezione
            ListItem := ReceiveLV.Items.Add;
            ListItem.ImageIndex       := 1;
            ListItem.Caption          := 'Listino ' + DatiDoc.RagSocMitt;
            ListItem.SubItems.Add('01/01/1900');        // Data del documento
            ListItem.SubItems.Add('00000000000');       // Partita IVA del mittente
            ListItem.SubItems.Add(DatiDoc.PIVA_Dest);   // Partita IVA del destinatario
            ListItem.SubItems.Add(DatiDoc.FileName);    // Nome del file
         end;
      end;
      // =======================================================================

   finally
      DM1.CloseWait;
      LS.Free;
   end;
end;
}

// Effettua il refreshing del video
procedure TScambioDocForm.RefreshFattureElettroniche;
var
  Q: TIB_Cursor;
  ListItem : TListItem;  // Item temporanea per l'inserimento di nuove voci
begin
  // Imposta la query che ricava l'elenco delle fatture elettronica passive
  //  presente nel repository
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT ID, TIPODOC, REGDOC, NUMDOC, DATADOC, FILENAME, MSGCODE FROM PRVORDCL_FE');
    Q.SQL.Add('WHERE RESPONSETYPE = ''rtReceivedFromProvider'' AND DONE <> ''T'' AND HIDE <> ''T'''); // NB: MSGCODE contiene il mittende
    Q.Open;
    while not Q.Eof do
    begin
      // Aggiunge la voce corrente alla list view dei documenti in ricezione
      ListItem := ReceiveLV.Items.Add;
      ListItem.ImageIndex := IMAGE_INDEX_FE;
      ListItem.Caption := Format('%s %d%s %s', [Q.FieldByName('TIPODOC').AsString, Q.FieldByName('NUMDOC').AsInteger, Q.FieldByName('REGDOC').AsString, Q.FieldByName('MSGCODE').AsString]);
      ListItem.SubItems.Add(Q.FieldByName('TIPODOC').AsString);   // 0
      ListItem.SubItems.Add(Q.FieldByName('NUMDOC').AsString);    // 1
      ListItem.SubItems.Add(Q.FieldByName('REGDOC').AsString);    // 2
      ListItem.SubItems.Add(Q.FieldByName('DATADOC').AsString);   // 3
      ListItem.SubItems.Add(Q.FieldByName('MSGCODE').AsString);   // 4 Denominazione mittente
      ListItem.SubItems.Add(Q.FieldByName('FILENAME').AsString);  // 5
      ListItem.SubItems.Add(Q.FieldByName('ID').AsString);        // 6
      // Avanti il prossimo
      Q.Next;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TScambioDocForm.RefreshFTP;
var
   LS: TStringList;       // StringList di appoggio dove sarà caricata la lista dei files esistenti nella directory remota
   ListItem : TListItem;  // Item temporanea per l'inserimento di nuove voci
   i : Integer;           // Indice per ciclo
   DatiDoc : TDocList;    // Record temporaneo dove vengono appoggiati tutti i dati contenuti nel nome del file per poi essere inseriti nella ListView
begin
   // Crea la StringList che conterrà l'elenco dei files contenuti nella directory remota
   LS := TStringList.Create;
   try
      // Imposta il tipo trasferimento dei dati ASCII
      IdFTP1.TransferType := ftASCII;

      // =======================================================================
      // CARICAMENTO LISTINO PREZZI ARTICOLI
      // -----------------------------------------------------------------------
      // Carica su LS la lista dei files contenuti nella directory remota
      LS.Clear;
//      IdFTP1.List(LS, '-TYP-*.LCC', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
      // Se l'utente è impostato per un listino personalizzato cerca il suo listino
      //  altrimenti cerca quello generico del suo consorzio.
      if DXC_PidAzienda = 'NC'
      then IdFTP1.List(LS, '-TYP-CUSTOMLIST-DST-'+DXC_CodiceAzienda+'*.LCC', True)    // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
      else IdFTP1.List(LS, '*-FIL-'+DXC_PidAzienda+'*.LCC', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
      // CIcla per inserire tutte le voci nella ListView
      for i := 0 to IdFTP1.DirectoryListing.Count -1 do begin
         // Carica in DatiDoc tutti i dati contenuti nel nome completo del file
         CaricaDatiListinoGruppoArco(DatiDoc, IdFTP1.DirectoryListing.Items[i].FileName);
         // Verifica alcune cose del file attuale prima di procedere al caricamento
         //  nella ListView per la visualizzazione ed esattamente:
         //   1) Se si tratta di un tipo di documento 'ANAGART' e cioè di una anagrafica articoli
         //   2) Se è un file pubblico oppure indirizzato specificamente a noi, verifica quindi se il file è rivolto a noi
         //   3) Se si tratta di una versione nuova ancora da scaricare e non già precentemente scaricata
         if  (DatiDoc.TipoDoc = 'ANAGART')
         and ((DatiDoc.PIVA_Dest = '00000000000')AND(DatiDoc.FilialeMitt = DXC_PidAzienda))
         and DM1.IsNewListPrice(DatiDoc.RagSocMitt, DatiDoc.FilialeMitt, DatiDoc.TipoDoc, IdFTP1.DirectoryListing.Items[i].ModifiedDate)
         then begin
            // Aggiunge la voce corrente alla list view dei documenti in ricezione
            ListItem := ReceiveLV.Items.Add;
            ListItem.ImageIndex       := IMAGE_INDEX_LISTINO;
            ListItem.Caption          := 'Listino ' + DatiDoc.RagSocMitt + ' (' + DatiDoc.FilialeMitt + ') del ' + FormatDateTime('dd/mm/yy', IdFTP1.DirectoryListing.Items[i].ModifiedDate);
            ListItem.SubItems.Add('01/01/1900');        // 0) Data del documento
            ListItem.SubItems.Add('00000000000');       // 1) Partita IVA del mittente
            ListItem.SubItems.Add(DatiDoc.PIVA_Dest);   // 2) Partita IVA del destinatario
            ListItem.SubItems.Add(DatiDoc.FileName);    // 3) Nome del file
            ListItem.SubItems.Add(DatiDoc.RagSocMitt);  // 4) Codice del dirstributore mittente
            ListItem.SubItems.Add(DatiDoc.FilialeMitt); // 5) Filiale del distributore mittemte
            ListItem.SubItems.Add(DateTimeToStr(IdFTP1.DirectoryListing.Items[i].ModifiedDate)); // 6) Versione del listino
         // Se invece si tratta di:
         //   1) Se si tratta di un tipo di documento 'CUSTOMLIST' e cioè di un listino personalizzato del gruppo arcobaleno
         //   2) Se è un file indirizzato specificamente a noi, verifica quindi se il file è rivolto a noi
         //   3) Se si tratta di una versione nuova ancora da scaricare e non già precentemente scaricata
         end else if  (DatiDoc.TipoDoc = 'CUSTOMLIST')
         and (DatiDoc.PIVA_Dest = DXC_CodiceAzienda)
         and (DatiDoc.FilialeMitt = DXC_PidAzienda)
         and DM1.IsNewListPrice(DatiDoc.RagSocMitt, DatiDoc.FilialeMitt, DatiDoc.TipoDoc, IdFTP1.DirectoryListing.Items[i].ModifiedDate)
         then begin
            // Aggiunge la voce corrente alla list view dei documenti in ricezione
            ListItem := ReceiveLV.Items.Add;
            ListItem.ImageIndex       := IMAGE_INDEX_LISTINO;
            ListItem.Caption          := 'Listino ' + DatiDoc.RagSocMitt + ' (custom) del ' + FormatDateTime('dd/mm/yy', IdFTP1.DirectoryListing.Items[i].ModifiedDate);
            ListItem.SubItems.Add('01/01/1900');        // 0) Data del documento
            ListItem.SubItems.Add('00000000000');       // 1) Partita IVA del mittente
            ListItem.SubItems.Add(DatiDoc.PIVA_Dest);   // 2) Partita IVA del destinatario
            ListItem.SubItems.Add(DatiDoc.FileName);    // 3) Nome del file
            ListItem.SubItems.Add(DatiDoc.RagSocMitt);  // 4) Codice del dirstributore mittente
            ListItem.SubItems.Add(DatiDoc.FilialeMitt); // 5) Filiale del distributore mittemte
            ListItem.SubItems.Add(DateTimeToStr(IdFTP1.DirectoryListing.Items[i].ModifiedDate)); // 6) Versione del listino
         end;
      end;
      // =======================================================================

      // =======================================================================
      // CARICAMENTO LISTA FILES DOCUMENTI
      // -----------------------------------------------------------------------
      // Carica su LS la lista dei files contenuti nella directory remota
      LS.Clear;
//      IdFTP1.List(LS, '', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
//      IdFTP1.List(LS, '*.DXC', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
      IdFTP1.List(LS, '*'+DXC_CodiceAzienda+'*.DXC', True);   // NB: L'ultimo parametro è True anche se a me non serve perchè altrimenti dà un errore se non trova alcun file
      // CIcla per inserire tutte le voci nella ListView
      for i := 0 to LS.Count -1 do begin
         // Carica in DatiDoc tutti i dati contenuti nel nome completo del file
         CaricaDatiDocumento(DatiDoc, LS[i]);
         // Se il documento attuale è un documento in ricezione...
         if DatiDoc.PIVA_Dest = DXC_CodiceAzienda then begin
            // Aggiunge la voce corrente alla list view dei documenti in ricezione
            ListItem := ReceiveLV.Items.Add;
            ListItem.ImageIndex       := IMAGE_INDEX_FTP;
            ListItem.Caption          := DatiDoc.TipoDoc + ' ' + DatiDoc.NumDoc + DatiDoc.Registro + ' ' + DatiDoc.RagSocMitt;
            ListItem.SubItems.Add(DatiDoc.DataDoc);     // 0 Data del documento
            ListItem.SubItems.Add(DatiDoc.PIVA_Mitt);   // 1 Partita IVA del mittente
            ListItem.SubItems.Add(DatiDoc.PIVA_Dest);   // 2 Partita IVA del destinatario
            ListItem.SubItems.Add(DatiDoc.FileName);    // 3 Nome del file
            ListItem.SubItems.Add(DatiDoc.TipoDoc);     // 4
            ListItem.SubItems.Add(DatiDoc.NumDoc);      // 5
            ListItem.SubItems.Add(DatiDoc.Registro);    // 6
            ListItem.SubItems.Add(DatiDoc.RagSocMitt);  // 7
         // Se invece il documento attuale è un documento inviato...
         end else if DatiDoc.PIVA_Mitt = DXC_CodiceAzienda then begin
            // Aggiunge la voce corrente alla list view dei documenti inviati
            ListItem := SendLV.Items.Add;
            ListItem.ImageIndex       := IMAGE_INDEX_FTP;
            ListItem.Caption          := DatiDoc.TipoDoc + ' ' + DatiDoc.NumDoc + DatiDoc.Registro + ' ' + DatiDoc.RagSocMitt;
            ListItem.SubItems.Add(DatiDoc.DataDoc);
            ListItem.SubItems.Add(DatiDoc.PIVA_Mitt);
            ListItem.SubItems.Add(DatiDoc.PIVA_Dest);
            ListItem.SubItems.Add(DatiDoc.FileName);
            ListItem.SubItems.Add(DatiDoc.TipoDoc);
            ListItem.SubItems.Add(DatiDoc.NumDoc);
            ListItem.SubItems.Add(DatiDoc.Registro);
            ListItem.SubItems.Add(DatiDoc.RagSocMitt);
         end;
      end;
      // =======================================================================
   finally
      LS.Free;
   end;
end;

procedure TScambioDocForm.Refresh;
begin
   // Rende invisibile l'area di ricezione dei documenti altrimenti da quando ho spostato
   //  i listini articoli all'inizio questi ultimi appariva con forte anticipo rispetto
   //  ai documenti normali e questo non mi piaceva, invece così appaiono tutti assieme.
   ReceiveLV.Visible := False;
   ReceiveLV.Update;
   Application.ProcessMessages;
   try
      DM1.ShowWait(SHOW_WAIT_TITLE, 'Refreshing...');
      // Azzera la list view
      SendLV.Items.Clear;
      ReceiveLV.Items.Clear;
      // Carica le items del teletrasporto
      RefreshFattureElettroniche;
      RefreshFTP;
   finally
      DM1.CloseWait;
      ReceiveLV.Visible := True;
   end;
end;



// Riceve il listino del Gruppo Arcobaleno specificato nel parametri
procedure TScambioDocForm.RiceviListinoGruppoArco(PrzFileName, PrzDistributore, PrzFiliale:String; PrzVersione:TDateTime);
var
  AnagFileName, PrezziFileName: String;
  MR : TModalResult;
  PrezziFileFound: Boolean;
begin
{
   // Prima di tutto obbliga l'utente a fare un backup altrimenti non va avanti
   if DM1.Messaggi('Copia di Sicurezza', 'Prima di continuare è necessario effettuare una copia do sicurezza degli archivi.'#13#13'Continuare?', '', [mbYes,mbNo], 0, nil) <> mrYes then begin
     DM1.Messaggi('Aggiornamento listino', 'Operazione annullata !!!', '', [mbOk], 0, nil);
     Exit;
   end;
   // Se l'utente ha dato il consenso all'effettuazione del backup...
   // Invia il messaggio di richiesta di esecuzione del backup al Guardian
   MR := SendBackupRequest;
   if MR <> mrOk then begin
     DM1.Messaggi('Aggiornamento listino', 'Operazione annullata !!!', '', [mbOk], 0, nil);
     Exit;
   end;
   // Se l'utente ha eseguito il backup correttamente prosegue con l'importazione
   //  del listino, qvvertendo l'utente
   if DM1.Messaggi('Aggiornamento listino', 'Ora Levante è pronto per iniziare l''importazione del listino.'#13#13'Continuare ?', '', [mbYes,mbNo], 0, nil) <> mrYes then begin
     DM1.Messaggi('Aggiornamento listino', 'Operazione annullata !!!', '', [mbOk], 0, nil);
     Exit;
   end;
}

   try
      DM1.ShowWait(ReceiveLV.Selected.Caption, 'Receiving files...');
      // Prima di tutto controllo che la connessione ci sia ancora
      if not IdFTP1.Connected then raise Exception.Create('Il server non è connesso.');

      // =======================================================================
      // SCARICAMENTO FILE ANAGRAFICA LISTINO
      // -----------------------------------------------------------------------
      // Costruisce il nome del file contenete i dati anagrafici del listino
      AnagFileName := '-TYP-ANAGART-DST-00000000000-MRS-' + Uppercase(Trim(PrzDistributore)) + '-FIL-' + Uppercase(Trim(DXC_PidAzienda)) + '.LCC';
      DM1.ShowWait('', 'Receiving file  "' + AnagFileName + '"');
      // Per verificare se il file esiste, richiede al server la dimensione del file
      //  e se la dimensione ritornata non è nulla (-1) significa che il file esiste (almeno credo)
      //  altrimenti assumo che il file non esiste e sollevo un'eccezione
      if IdFTP1.Size(AnagFileName) = -1 then begin
        DM1.Messaggi('Aggiornamento Listino', '(FTP) - File  "' + AnagFileName + '"  non trovato.', 'NB: Il file dell''anagrafica articoli non è stato trovato.', [mbOk], 0, nil);
        Exit;
      end;
      // Esegue il Download del file
      IdFTP1.TransferType := ftBinary;
      IdFTP1.Get(AnagFileName, DM1.DownloadDir+AnagFileName, True);
      // Decompressione file
      DM1.ShowWait('', 'Opening compressed archive  "' + AnagFileName + '"');
      ZLB1.OpenArchive(DM1.DownloadDir+AnagFileName);
      DM1.ShowWait('', 'Extract file  "AnagArt.imp"');
      ZLB1.ExtractFileByName(DM1.ImportFiltersDir, 'AnagArt.imp');
      DM1.ShowWait('', 'Extract file  "AnagArt.txt"');
      ZLB1.ExtractFileByName(DM1.DownloadDir, 'AnagArt.txt');
      DM1.ShowWait('', 'Close compressed archive  "' + AnagFileName + '"');
      ZLB1.CloseArchive;
      // Elimina il file compresso appena decompresso
      DeleteFile(DM1.DownloadDir+AnagFileName);
      // =======================================================================





      // =======================================================================
      // SCARICAMENTO FILE PREZZI LISTINO
      // -----------------------------------------------------------------------
      DM1.ShowWait('', 'Receiving file  "' + PrzFileName + '"');
      // NB: Prima ricerca il file PREZZIART specifico per l'utente e quindi il file PREZZIART che contiene
      //      la sua specifica Partita IVA e il nome dello stesso fornitore nel nome del file stesso, se non trova
      //      questo file allora cerca il file PREZZIART generico per lo stesso fornitore e cioè il file che contiene
      //      nel proprio nome il valore "00000000000" nella partita IVA e il nome dello stesos fornitore dell'anagrafica
      //      appena scaricata. Se non trova nemmeno questo file allora non scarica nulla.
      // --------------------------
      // Costruisce il nome del file contenete i prezzi del listino specifici per l'utente proveniente dallo stesso fornitore
      //  del file dell'anagrafica.
      PrezziFileName := '-TYP-PREZZIART-DST-' + Uppercase(Trim(DM1.TableDatiAziendaP_IVA.AsString)) + '-MRS-' + Uppercase(Trim(PrzDistributore)) + '-FIL-' + Uppercase(Trim(DM1.TableDatiAziendaCA_PID.AsString)) + '.LCC';
      // Verifica la presenzsa di questo file...
      // NB: Per verificare se il file esiste, richiede al server la dimensione del file
      //      e se la dimensione ritornata non è nulla (-1) significa che il file esiste (almeno credo)
      //      altrimenti assumo che il file non esiste e sollevo un'eccezione
      PrezziFileFound := IdFTP1.Size(PrezziFileName) > (-1);
      // Se non ha trovato il file con i prezzi personalizzati specifici per l'utente, prova a cercare
      //  un file PREZZIART generico per lo stesso fornitore
      if not PrezziFileFound then begin
        // Costruisce il nome del file contenete i prezzi del listino
        PrezziFileName := '-TYP-PREZZIART-DST-00000000000-MRS-' + Uppercase(Trim(PrzDistributore)) + '-FIL-' + Uppercase(Trim(DM1.TableDatiAziendaCA_PID.AsString)) + '.LCC';
        // Verifica la presenzsa di questo file...
        // NB: Per verificare se il file esiste, richiede al server la dimensione del file
        //      e se la dimensione ritornata non è nulla (-1) significa che il file esiste (almeno credo)
        //      altrimenti assumo che il file non esiste e sollevo un'eccezione
        PrezziFileFound := IdFTP1.Size(PrezziFileName) > (-1);
      end;
      // Se è stato trovato un file prezzi procede al suo scaricamento altrimenti no!
      if PrezziFileFound then begin
        // Per verificare se il file esiste, richiede al server la dimensione del file
        //  e se la dimensione ritornata non è nulla (-1) significa che il file esiste (almeno credo)
        //  altrimenti assumo che il file non esiste e sollevo un'eccezione
        if IdFTP1.Size(PrezziFileName) = -1 then raise Exception.Create('(FTP) - File  "' + PrezziFileName + '"  non trovato.');
        // Esegue il Download del file
        IdFTP1.TransferType := ftBinary;
        IdFTP1.Get(PrezziFileName, DM1.DownloadDir+PrezziFileName, True);
        // Decompressione file
        DM1.ShowWait('', 'Opening compressed archive  "' + PrezziFileName + '"');
        ZLB1.OpenArchive(DM1.DownloadDir+PrezziFileName);
        DM1.ShowWait('', 'Extract file  "PrezziArt.imp"');
        ZLB1.ExtractFileByName(DM1.ImportFiltersDir, 'PrezziArt.imp');
        DM1.ShowWait('', 'Extract file  "PrezziArt.txt"');
        ZLB1.ExtractFileByName(DM1.DownloadDir, 'PrezziArt.txt');
        DM1.ShowWait('', 'Close compressed archive  "' + PrezziFileName + '"');
        ZLB1.CloseArchive;
        // Elimina il file compresso appena decompresso
        DeleteFile(DM1.DownloadDir+PrezziFileName);
      end;
      // =======================================================================




      
      // =======================================================================
      // IMPORTAZIONE FILE ANAGRAFICA ARTICOLI
      // -----------------------------------------------------------------------
      // Procedura azzera tutti gli articoli e viene usato per radere al suolo tutti
      //  gli articoli SONO SU MINILEVANTE
      DM1.ShowWait('', 'Elimina articoli...');
      DM1.ListinoNettoGruppoArco_EliminaArticoli;
      // Avvia l'importazione dell'anagrafica listini del Gruppo Arcobaleno e la successiva
      //  elaborazione dei prezzi e dei gruppi
      DM1.ImportaFileListinoArticoli(DM1.DownloadDir+'AnagArt.txt', 'AnagArt'  , False, 0,0,0,0, 'DESCRIZIONE');
      // =======================================================================





      // =======================================================================
      // IMPORTAZIONE FILE PREZZI ARTICOLO
      // -----------------------------------------------------------------------
      // Se è stato trovato un file prezzi procede allla sua importazione altrimenti no!
      if PrezziFileFound then begin
        // Avvia l'importazione dei prezzi listini del Gruppo Arcobaleno e la successiva
        //  elaborazione
        DM1.ImportaFileListinoArticoli(DM1.DownloadDir+'PrezziArt.txt' , 'PrezziArt', False, DM1.TableProgressiviRICARICOLISTINO1.AsInteger,DM1.TableProgressiviRICARICOLISTINO2.AsInteger,DM1.TableProgressiviRICARICOLISTINO3.AsInteger,DM1.TableProgressiviRICARICOLISTINO4.AsInteger);
        // Elimina il file dal server di interscambio documenti
        //  NB: Lo elimino alla fine perchè così se ci sono problemi almeno il file è importabile di nuovo.
        //DM1.ShowWait(SHOW_WAIT_TITLE, 'Deleting file  "' + PrzFileName + '"  from server...');
        //IdFTP1.Delete(PrzFileName);
      end;
      // =======================================================================





      // =======================================================================
      // POST ELABORAZIONE DEGLI ARTICOLI APPENA IMPORTATI
      // -----------------------------------------------------------------------
      // Calcolo dei codici a barre
      //  NB: Solo per i listini del Gruppo Arcobaleno
      DM1.ShowWait('', 'Caricamento Codici a Barre...');
      if (DM1.TableProgressiviARCO_BARCODE.AsString = 'T') and (Uppercase(Trim(PrzDistributore)) = 'GRUPPOARCO') then DM1.GruppoArco_CalcolaBarcode;
      DM1.ShowWait('', 'Copia codici gruppi/sottogruppi...');
      if (DM1.TableProgressiviARCO_CARICAGRUPPI.AsString = 'T') and (Uppercase(Trim(PrzDistributore)) = 'GRUPPOARCO') then DM1.GruppoArco_CopiaCodiciGruppi;
      DM1.ShowWait('', 'Caricamento Gruppi/Sottogruppi...');
      if (DM1.TableProgressiviARCO_CARICAGRUPPI.AsString = 'T') and (Uppercase(Trim(PrzDistributore)) = 'GRUPPOARCO') then DM1.GruppoArco_ControllaGruppiSottogruppi;
      // Ricalcolo degli sconti e dei listini di vendita dopo l'importazione
      DM1.ShowWait('', 'Calcolo listini dopo caricamento anagrafica articoli...');
      DM1.GruppoArco_RicalcolaDopoCaricamentoAnagrafica;
      // Aggiorna la tabella contenente la lista delle versioni dei listini scaricati
      //  con la versione del listino appena caricato
      DM1.ShowWait('', 'Aggiornamento elenco listini scaricati...');
      DM1.MarkListPrizeVersion(PrzDistributore, PrzFiliale, 'ANAGART', PrzVersione, DM1.DownloadDir+'AnagArt.txt');
      // =======================================================================




      // Aggiorna lo schermo
//      SBRefreshFTPClick(SBRefreshFTP);
      if not MainForm.IsLevanteLight then ReceiveLV.Selected.Delete;
   finally
      DM1.CloseWait();
      // A operazione terminata visualizza un messaggio ed esce dall'aplicazione
      //  NB: Solo se non siamo su LevanteLight
      if not MainForm.IsLevanteLight then begin
        DM1.Messaggi('', 'Operazione terminata.'#13#13#13'Ora il programma si chiuderà automaticamente.', '', [mbOk], 0, nil);
        Application.Terminate;
      end;
   end;
end;

// Riceve il listino del Gruppo Arcobaleno specificato nel parametri
procedure TScambioDocForm.RiceviListinoCustomGruppoArco(PrzFileName, PrzDistributore, PrzFiliale:String; PrzVersione:TDateTime);
var
  AnagFileName: String;
  MR : TModalResult;
  ElencoFiles: TStrings;
begin
{
   // Prima di tutto obbliga l'utente a fare un backup altrimenti non va avanti
   if DM1.Messaggi('Copia di Sicurezza', 'Prima di continuare è necessario effettuare una copia do sicurezza degli archivi.'#13#13'Continuare?', '', [mbYes,mbNo], 0, nil) <> mrYes then begin
     DM1.Messaggi('Aggiornamento listino', 'Operazione annullata !!!', '', [mbOk], 0, nil);
     Exit;
   end;
   // Se l'utente ha dato il consenso all'effettuazione del backup...
   // Invia il messaggio di richiesta di esecuzione del backup al Guardian
   MR := SendBackupRequest;
   if MR <> mrOk then begin
     DM1.Messaggi('Aggiornamento listino', 'Operazione annullata !!!', '', [mbOk], 0, nil);
     Exit;
   end;
   // Se l'utente ha eseguito il backup correttamente prosegue con l'importazione
   //  del listino, qvvertendo l'utente
   if DM1.Messaggi('Aggiornamento listino', 'Ora Levante è pronto per iniziare l''importazione del listino.'#13#13'Continuare ?', '', [mbYes,mbNo], 0, nil) <> mrYes then begin
     DM1.Messaggi('Aggiornamento listino', 'Operazione annullata !!!', '', [mbOk], 0, nil);
     Exit;
   end;
}

   // Inizializzazione
   ElencoFiles := TSTringList.Create;
   try
      DM1.ShowWait(ReceiveLV.Selected.Caption, 'Receiving files...');
      // Prima di tutto controllo che la connessione ci sia ancora
      if not IdFTP1.Connected then raise Exception.Create('Il server non è connesso.');

      // =======================================================================
      // SCARICAMENTO FILE ANAGRAFICA LISTINO
      // -----------------------------------------------------------------------
      // Costruisce il nome del file contenete i dati anagrafici del listino
      //  NB: In realtà usa il nome memorizzato nel parametro ricevuto, ho fatto così
      //       perchè sto riutilizzando codice giò esistente
      AnagFileName := PrzFileName;
      DM1.ShowWait('', 'Receiving file  "' + AnagFileName + '"');
      // Per verificare se il file esiste, richiede al server la dimensione del file
      //  e se la dimensione ritornata non è nulla (-1) significa che il file esiste (almeno credo)
      //  altrimenti assumo che il file non esiste e sollevo un'eccezione
//      if IdFTP1.Size(AnagFileName) = -1 then begin
//        DM1.Messaggi('Aggiornamento Listino', '(FTP) - File  "' + AnagFileName + '"  non trovato.', 'NB: Il file dell''anagrafica articoli non è stato trovato.', [mbOk], 0, nil);
//        Exit;
//      end;
      // Esegue il Download del file
      IdFTP1.TransferType := ftBinary;
      IdFTP1.Get(AnagFileName, DM1.DownloadDir+AnagFileName, True);
      // Decompressione file
      DM1.ShowWait('', 'Opening compressed archive  "' + AnagFileName + '"');
      ZLB1.OpenArchive(DM1.DownloadDir+AnagFileName);
      DM1.ShowWait('', 'Extract file  "CustomList.imp"');
      ZLB1.ExtractFileByName(DM1.ImportFiltersDir, 'CustomList.imp');
      DM1.ShowWait('', 'Extract file  "CustomListFile.txt"');
      ZLB1.ExtractFileByName(DM1.DownloadDir, 'CustomListFile.txt');
      // Preleva l'elenco dei files e se poi vede che dentro il file compresso
      //  c'è anche il file "Gruppi.txt" provvede anche a decomprimere i files necessari
      //  all'impirtazione dei gruppi e sottogruppi
      ZLB1.GetFileList(ElencoFiles);
      if ElencoFiles.IndexOf('Gruppi.txt') <> -1 then begin
        DM1.ShowWait('', 'Extract file  "Gruppi.imp"');
        ZLB1.ExtractFileByName(DM1.ImportFiltersDir, 'Gruppi.imp');
        DM1.ShowWait('', 'Extract file  "Gruppi.txt"');
        ZLB1.ExtractFileByName(DM1.DownloadDir, 'Gruppi.txt');
      end;
      // Chiusura file compresso
      DM1.ShowWait('', 'Close compressed archive  "' + AnagFileName + '"');
      ZLB1.CloseArchive;
      // Elimina il file compresso appena decompresso
      DeleteFile(DM1.DownloadDir+AnagFileName);
      // =======================================================================
      // Elimina i gruppi dalla tabella gruppi relativia l GruppoArco
      DM1.ShowWait('', 'Elimina gruppi...');
      DM1.ListinoNettoGruppoArco_EliminaGruppiArco;
      // Procedura azzera tutti gli articoli e viene usato per radere al suolo tutti
      //  gli articoli SONO SU MINILEVANTE
      DM1.ShowWait('', 'Elimina articoli...');
      DM1.ListinoNettoGruppoArco_EliminaArticoli;
      // Avvia l'importazione dell'anagrafica listini del Gruppo Arcobaleno e la successiva
      //  elaborazione dei prezzi e dei gruppi
      DM1.ImportaFileListinoArticoli(DM1.DownloadDir+'CustomListFile.txt', 'CustomList'  , False, 0,0,0,0, 'DESCRIZIONE');
      // Avvia l'importazione dei gruppi e sottogruppi
      DM1.ImportaFileListinoArticoli(DM1.DownloadDir+'Gruppi.txt', 'Gruppi'  , False, 0,0,0,0);
      // Avvia l'eleborazione dei listini e dei codici a barrre
      DM1.ShowWait('', 'Caricamento Codici a Barre...');
      if DM1.TableProgressiviARCO_BARCODE.AsString = 'T' then DM1.GruppoArco_CalcolaBarcode;
      // Post-elaborazione per i gruppi e i sottogruppi
      DM1.ShowWait('', 'Conversione codici gruppi/sottogruppi...');
      if DM1.TableProgressiviARCO_CARICAGRUPPI.AsString = 'T' then DM1.ListinoNettoGruppoArco_ConvertiCodiciGruppi;
      DM1.ShowWait('', 'Conversione Gruppi/Sottogruppi archivio articoli...');
      if DM1.TableProgressiviARCO_CARICAGRUPPI.AsString = 'T' then DM1.ListinoNettoGruppoArco_ConvertiCodiciGruppiArticoli;
      // Ricalcolo listini
      DM1.ShowWait('', 'Calcolo listini dopo caricamento anagrafica articoli...');
      DM1.GruppoArco_RicalcolaDopoCaricamentoAnagrafica;
      // Aggiorna la tabella contenente la lista delle versioni dei listini scaricati
      //  con la versione del listino appena caricato
      DM1.ShowWait('', 'Aggiornamento elenco listini scaricati...');
      DM1.MarkListPrizeVersion(PrzDistributore, PrzFiliale, 'CUSTOMLIST', PrzVersione, DM1.DownloadDir+'CustomListFile.txt');

{
      // Avvia l'importazione dei prezzi listini del Gruppo Arcobaleno e la successiva
      //  elaborazione
      DM1.ImportaFileListinoArticoli(DM1.DownloadDir+'PrezziArt.txt' , 'PrezziArt', False, DM1.TableProgressiviRICARICOLISTINO1.AsInteger,DM1.TableProgressiviRICARICOLISTINO2.AsInteger,DM1.TableProgressiviRICARICOLISTINO3.AsInteger,DM1.TableProgressiviRICARICOLISTINO4.AsInteger);
      DM1.ShowWait(SHOW_WAIT_TITLE, 'Calcolo listini dopo caricamento prezzi articoli...');
      DM1.GruppoArco_RicalcolaDopoCaricamentoPrezzi;

      // Elimina il file dal server di interscambio documenti
      //  NB: Lo elimino alla fine perchè così se ci sono problemi almeno il file è importabile di nuovo.
      DM1.ShowWait(SHOW_WAIT_TITLE, 'Deleting file  "' + PrzFileName + '"  from server...');
      IdFTP1.Delete(PrzFileName);
}

      // Aggiorna lo schermo
//      SBRefreshFTPClick(SBRefreshFTP);
      if not MainForm.IsLevanteLight then ReceiveLV.Selected.Delete;
   finally
      DM1.CloseWait();
      // Distruzione
      ElencoFiles.Free;
      // A operazione terminata visualizza un messaggio ed esce dall'aplicazione
      //  NB: Solo se non siamo su LevanteLight
      if not MainForm.IsLevanteLight then begin
        // A operazione terminata visualizza un messaggio ed esce dall'aplicazione
        DM1.Messaggi('', 'Operazione terminata.'#13#13#13'Ora il programma si chiuderà automaticamente.', '', [mbOk], 0, nil);
        Application.Terminate;
      end;
   end;
end;




// Riceve il documento specificato nel parametri
procedure TScambioDocForm.RiceviDocumento(NomeFile:String);
var
   S : TLevanteLoadXMLDocument;
begin
   try
      DM1.ShowWait(ReceiveLV.Selected.Caption, 'Receiving document...');
      // Crea l'oggetto per la manipolazione dei dicumenti XML
      S := TLevanteLoadXMLDocument.Create;
      // Prima di tutto controllo che la connessione ci sia ancora
      if not IdFTP1.Connected then raise Exception.Create('Il server non è connesso.');
      // Per verificare se il file esiste, richiede al server la dimensione del file
      //  e se la dimensione ritornata non è nulla (-1) significa che il file esiste (almeno credo)
      //  altrimenti assumo che il file non esiste e sollevo un'eccezione
      DM1.ShowWait('', 'Check if file exist...');
      if IdFTP1.Size(NomeFile) = -1 then raise Exception.Create('Nome del file di importazione non corretto o file non trovato.');
      // Esegue il Download del file del documento dal server
      IdFTP1.TransferType := ftBinary;
      IdFTP1.Get(NomeFile, DM1.CartellaTmp+NomeFile, True);
      // Importa il documento appena scaricato
      DM1.ShowWait('', 'Loading from document exchange file...');
      if S.LoadDocumentFromXMLFileWithConversion(DM1.CartellaTmp+NomeFile, (not MainForm.IsLevanteLight)) then
      begin
        // Elimina il file dal server di interscambio documenti
        DM1.ShowWait('', 'Deleting document exchange file on server.');
        IdFTP1.Delete(NomeFile);
        // Aggiorna lo schermo
        if not MainForm.IsLevanteLight then ReceiveLV.Selected.Delete;
      end;
   finally
      DM1.CloseWait();
      S.Free;
   end;
end;


procedure TScambioDocForm.RiceviFatturaElettronica(const AID: Integer);
var
  Q: TIB_Cursor;
  LFileName: string;
  LInvoice: IeiInvoiceMini;
  LPersister: ILevanteInvoicePersister;
begin
  // Imposta la query che ricava l'elenco delle fatture elettronica passive
  //  presente nel repository
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add(Format('SELECT FILENAME, MSGRAW FROM PRVORDCL_FE WHERE ID = %d', [AID]));
    Q.Open;
    if Q.Eof then
      raise Exception.Create(Format('TScambioDocForm.RiceviFatturaElettronica: ID %d non trovato!!!', [AID]));
    // Get the temporary file name
    LFileName := DM1.CartellaTmp + Q.FieldByName('FILENAME').AsString;
    // Save to temp dir
    (Q.FieldByName('MSGRAW') as TIB_ColumnBlob).SaveToFile(LFileName);

    // Crea l'oggetto invoice
    LInvoice := TeiInvoiceMiniFactory.NewInvoiceFromFile(LFileName);
    // Crea l'oggetto persister e carica la fattura sui documenti
    LPersister := TInvoicePersisterFactory.NewLevanteInvoicePersister(LInvoice, AID);
    if LPersister.SaveToLevante(True, LFileName, 'rtReceivedFromProvider') then
      ReceiveLV.Selected.Delete;
    Q.Close;
  finally
    Q.Free;
  end;
end;

// Invia tutti i documenti selezionati al server per l'interscambio dei documenti
procedure TScambioDocForm.InviaDocumentiSelezionati;
var
   i, SelRec, DocNum:Longint;
   DocType, Registro:String;
   DocDate:TDate;
begin
   DM1.Attendere;
   try
      // SelRec contiene il numeero di records selezionati
      SelRec := ClientiForm.tvDoc.Controller.SelectedRecordCount;
      // Ovviamente procede solo se vi sono documenti selezionati
      if SelRec > 0 then begin
         // Cicla per tutti i documenti selezionati e li esporta
         for i := 0 to SelRec-1 do begin
            // Focus sul record attuale
            ClientiForm.tvDoc.Controller.SelectedRecords[i].Focused := True;
            // Assegna il tipo, numero, data e registro del documento a delle variabili locali per comodità successiva
            DocType       := ClientiForm.tvDoc.Controller.FocusedRow.Values[ClientiForm.tvDoc.GetColumnByFieldName('TIPODOC').Index];
            DocDate       := ClientiForm.tvDoc.Controller.FocusedRow.Values[ClientiForm.tvDoc.GetColumnByFieldName('DATADOC').Index];
            Registro      := ClientiForm.tvDoc.Controller.FocusedRow.Values[ClientiForm.tvDoc.GetColumnByFieldName('REGISTRO').Index];
            DocNum        := ClientiForm.tvDoc.Controller.FocusedRow.Values[ClientiForm.tvDoc.GetColumnByFieldName('CODICEDOC').Index];
            // Solo se il documento è tra quelli inviabili...
            if (DocType = 'Preventivo') or (DocType = 'Ordine') or (DocType = 'S.A.L.') or (DocType = 'Buono_cons')
               or (DocType = 'D.D.T.') or (DocType = 'Fattura') or (DocType = 'Ricev.fisc') or (DocType = 'Fatt.R.F.')
               or (DocType = 'Nota_accre') or (DocType = 'Ord.fornit') or (DocType = 'Bolla_entr') or (DocType = 'Fatt.acqui')
               or (DocType = 'N.C.fornit')  then begin
               // Effettua l'invio del documento corrente
               InviaDocumento(DocType, DocNum, Registro, DocDate);
            end;
         end;
      // Se non ci sono documenti selezionati visualizza un messaggio che spiega la situazione
      end else DM1.Messaggi('Invio documenti', 'Nessun documento selezionato.', '', [mbOk], 0, nil);
   finally
      // Aggiorna lo schermo
      SBRefreshFTPClick(SBRefreshFTP);
      
      DM1.ChiudiAttendere;
   end;
end;

// Questa procedura effettua l'invio di un documento al circuito di interscambio dei documenti
procedure TScambioDocForm.InviaDocumento(TipoDoc:String; NumDoc:Integer; Registro:String; DataDoc:TDateTime);
var
   S : TLevanteSaveXMLDocument;
   FN : String;   // Nome completo del file generato e contenente il documento da esportare
begin
   try
      DM1.ShowWait(SHOW_WAIT_TITLE, 'Sending document...');
      // Crea l'oggetto XMLDocument
      S := TLevanteSaveXMLDocument.Create;
      // Salva il documento in un file e assegna il nome del file stesso a FN
      DM1.ShowWait(SHOW_WAIT_TITLE, 'Creating document exchange file...');
      FN := S.SaveDocumentToXMLFile(TipoDoc, NumDoc, Registro, DataDoc);
      // Se il nome del file non è nullo e se il file esiste
      if (FN <> '') and (FileExists(FN)) then begin
         // Controlla che ci sia la connessione aperta altrimenti ovviamente non piò proseguire
         if IdFTP1.Connected then begin
            // Prima verificha che un file con lo stesso nome non esista già
            //  e se esiste chiede se lo si vuole sovrascrivere
            if IdFTP1.Size(ExtractFileName(FN)) <> -1 then begin
               if DM1.Messaggi(SHOW_WAIT_TITLE, 'Il documento è già presente.'#13#13#13'Vuoi sostituirlo?', '', [mbYes,mbNo], 0, nil) <> mrYes then begin
                  // Annulla l'operazione
                  Exit;
               end;
            end;
            // Effattua l'upload del file sul server.
            IdFTP1.TransferType := ftBinary;
            IdFTP1.Put(FN, ExtractFileName(FN));
         end else raise Exception.Create('Il server non è connesso.');
      // Se invece il file non esiste o il nome non è valido...
      end else raise Exception.Create('Nome del file di esportazione non corretto o file non trovato.');
   finally
      DM1.CloseWait();
      S.Free;
   end;
end;

procedure TScambioDocForm.IdFTP1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
   // Aggiorna la stato dell'operazione
   DM1.ShowWait('', AStatusText);
end;

procedure TScambioDocForm.FormShow(Sender: TObject);
begin
   // Per evitare problemid i visualizzazione nelle TListView
   MainForm.InhibitLVInfoTips(SendLV);
   MainForm.InhibitLVInfoTips(ReceiveLV);

   // Se il PID = PROVA significa che siamo in una sessione di PROVA
   //  e quindi si connette alla cartella di prova
   if Trim(Uppercase(DXC_PidAzienda)) = 'PROVA' then begin
     IdFTP1.Username := 'testlevante';
   end else begin
     IdFTP1.Username := 'trasferimento';
   end;

   // Si connette al circuito
   IdFTP1.Connect;
   // Aggiorna lo schermo
   SBRefreshFTPClick(SBRefreshFTP);
end;

procedure TScambioDocForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   // Puntatore alla form azzerato
   ScambioDocForm := nil;
end;

procedure TScambioDocForm.FormCreate(Sender: TObject);
var
   P : TMemIniFile;
begin
   // Impostazione componente FTP
   MainForm.CaricaParametriFTP(IdFTP1);
   // Apre il file dei parametri
   P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
   try
      // La form di ridimensiona e riposiziona per apparire sopra la Bacheca
      Ridimensiona;

      // Carica la Bitmap di sfondo del teletrasporto
      CaricaSfondo;

      // INizializzazione
      UserDisconnect := False;
      // Carica l'intervallo in secondi tra un Autorefresh e l'altro (0 = Disabilitato)
      AutoRefresh.Interval := P.ReadInteger('TELETRASPORTO', 'IntervalloAutoRefresh', 60) * 1000;
//      AutoRefresh.Interval := 0;
      // Imposta la proprietà LargeImages delle ListViews perchè altrimenti le perderva per non so
      //  quale motivo e dopo c'erano problemi di visualizzazione.
      SendLV.LargeImages := MainForm.ImageListExpDocLargeImages;
      ReceiveLV.LargeImages := MainForm.ImageListExpDocLargeImages;
   finally
      // Pulizia
      P.Free;
   end;
end;

procedure TScambioDocForm.Ridimensiona;
begin
  // La form di ridimensiona e riposiziona per apparire sopra la Bacheca
  Top      := MainForm.MainRightPanel.Top;
  Left     := MainForm.MainRightPanel.Left;
  Width    := MainForm.MainRightPanel.Width;
  Height   := MainForm.MainRightPanel.Height;
  // Forza il ritracciamento delle ListView altrimenti in alcuni casi non erano perfette
  ReceiveLV.Repaint;
end;

procedure TScambioDocForm.CaricaSfondo;
begin
  ImageTopFixed.Picture.Bitmap.LoadFromFile(DM1.TemaDir + 'teletrasporto_panel_fixed_top.bmp');
  ImageBottomFixed.Picture.Bitmap.LoadFromFile(DM1.TemaDir + 'teletrasporto_panel_fixed_bottom.bmp');
  ImageStretched.Picture.Bitmap.LoadFromFile(DM1.TemaDir + 'teletrasporto_panel_stretched.bmp');
  // Carica la bitmap del pulsante di chiusura
  SBChiudiTeletrasporto.Glyph.LoadFromFile(DM1.TemaDir + 'btn_teletrasporto.bmp');
end;

procedure TScambioDocForm.SendLVDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := False;
   // Cerca di riconoscere il mittente per accettare o meno l'operazione
   // ------------------------------------------------------------------
   // Se il mittente proviene da una TcxGrid o TcxView...
   //  Controlla se il mittente è di tipo TcxDragControlObject che è il tipo di oggetto
   //  che le griglie DevExpress passano surante il DragAndDrop.
   if Source is TcxDragControlObject then begin
      // Se il mittente è una vista (che è sempre contenuta in un GridSite)...
      if TcxDragControlObject(Source).Control is TcxGridSite then begin
         // La vista diventa il controllo predefinito per comodità
         with TcxGridSite(TcxDragControlObject(Source).Control).GridView do begin
            // Controlla se la vista è tra quelle da riconoscere
            if (Name = 'tvDoc')
            then accept := True;
         end;
      end;
   end;
end;

procedure TScambioDocForm.SBRefreshFTPClick(Sender: TObject);
begin
   Refresh;
end;

// Questa procedura carica nella struttura DatiDoc tutti i dati contenuti
//  nel nome completo del file.
procedure TScambioDocForm.CaricaDatiDocumento(var DatiDoc:TDocList; NF:String);
begin
   // Prima di tutto elimina la prima parte del nome file, la prima parte infatti
   // contiene i permessi la data di creazione del file e altri dati che non
   //  mi interessano, wuindi elimina tutto quello che c'è prima del TAG "-TDC-"
   DM1.RitornaTestoPrimaDi('-TDC-', NF, True);
   // Rimette a posto il "-" che il RitornaTestoPrimaDi gli ha tolto altrimenti
   //  ci potrebbero essere dei problemi successivamente.
   NF := '-'+NF;
   // Nome completo del file così come è
   DatiDoc.FileName := NF;
   // Prima di tutto sostituisce il carattere "§" con il carattere "/", infatti prima di salvare
   //  il file era stata fatta una sostituzione di caratteri per evitare che la / contenuta
   //  nella data del documento dasse problemi
   NF := StringReplace(NF, '§', '/', [rfReplaceAll]);
   // Toglie il primo marcatore (i primi 4 caratteri contenenti "-TDC-")
   NF := RightStr(NF, Length(NF)-4);
   // Carica tutti gli altri dati eliminando ogni volta il restante marcatore all'inizio
   //  della stringa (cioè i primi 4 caratteri) perchè con il parametro True (l'ultimo)
   //  elimina solo il primo rigo e non tutta la stringa ricercata.
   DatiDoc.TipoDoc    := DM1.RitornaTestoPrimaDi('-NUM-', NF, True);
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.NumDoc     := DM1.RitornaTestoPrimaDi('-REG-', NF, True);
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.Registro   := DM1.RitornaTestoPrimaDi('-DAT-', NF, True);
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.DataDoc    := DM1.RitornaTestoPrimaDi('-DST-', NF, True);
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.PIVA_Dest  := DM1.RitornaTestoPrimaDi('-MIT-', NF, True);
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.PIVA_Mitt  := DM1.RitornaTestoPrimaDi('-MRS-', NF, True);
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.RagSocMitt := DM1.RitornaTestoPrimaDi('.DXC',  NF, True);
end;

procedure TScambioDocForm.CaricaDatiListinoGruppoArco(var DatiDoc:TDocList; NF:String);
begin
   // Prima di tutto elimina la prima parte del nome file, la prima parte infatti
   // contiene i permessi la data di creazione del file e altri dati che non
   //  mi interessano, wuindi elimina tutto quello che c'è prima del TAG "-TYP-"
   DM1.RitornaTestoPrimaDi('-TYP-', NF, True);
   // Rimette a posto il "-" che il RitornaTestoPrimaDi gli ha tolto altrimenti
   //  ci potrebbero essere dei problemi successivamente.
   NF := '-'+NF;
   // Nome completo del file così come è
   DatiDoc.FileName := NF;
   // Prima di tutto sostituisce il carattere "§" con il carattere "/", infatti prima di salvare
   //  il file era stata fatta una sostituzione di caratteri per evitare che la / contenuta
   //  nella data del documento dasse problemi
   NF := StringReplace(NF, '§', '/', [rfReplaceAll]);
   // Toglie il primo marcatore (i primi 5 caratteri contenenti "-TYP-")
   NF := RightStr(NF, Length(NF)-5);
   // Carica tutti gli altri dati eliminando ogni volta il restante marcatore all'inizio
   //  della stringa (cioè i primi 4 caratteri) perchè con il parametro True (l'ultimo)
   //  elimina solo il primo rigo e non tutta la stringa ricercata.
   DatiDoc.TipoDoc    := DM1.RitornaTestoPrimaDi('-DST-', NF, True);
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.PIVA_Dest  := DM1.RitornaTestoPrimaDi('-MRS-', NF, True);
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.RagSocMitt := Uppercase(DM1.RitornaTestoPrimaDi('-FIL-',  NF, True));
   NF                 := RightStr(NF, Length(NF)-4);
   DatiDoc.FilialeMitt := Uppercase(DM1.RitornaTestoPrimaDi('.LCC',  NF, True));
   // IMposta a nulli gli altri campi
   DatiDoc.NumDoc     := 'NULL';
   DatiDoc.Registro   := 'NULL';
   DatiDoc.PIVA_Mitt  := 'NULL';
end;

procedure TScambioDocForm.SBInviaDocumentoClick(Sender: TObject);
begin
   // Invia i documenti selezionati al circuito di interscambio dei documenti
   InviaDocumentiSelezionati;
end;

procedure TScambioDocForm.ReceiveLVMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   // Avvia il Drag And Drop
   if (Button = mbLeft) then begin
      (Sender as TListView).BeginDrag(False);
   end;
end;



procedure TScambioDocForm.ReceiveLVMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  LItem: TListItem;
  LListView: TListView;
  LPosition: TPoint;
begin
  LListView := (Sender as TListView);
  LItem := LListView.GetItemAt(X, Y);
  if Assigned(LItem) then
  begin
    if (LItem <> FLastItemHinted) or not BalloonHint.ShowingHint then
    begin
      FLastItemHinted := LItem;
      // Calcola la posizione
      LPosition := LListView.ClientToScreen(Point(-150, Y));
      if LPosition.Y <= (Screen.Height div 2) then
        Dec(LPosition.Y, 25)
      else
        Inc(LPosition.Y, 25);
      // IN base al tipo di item scelta
      case LItem.ImageIndex of
        // Documento
        IMAGE_INDEX_FTP: begin
          BalloonHint.Description := Format('%s'#13#13'%s N° %s%s del %s', [LItem.SubItems[7], LItem.SubItems[4], LItem.SubItems[5], LItem.SubItems[6], LItem.SubItems[0]]);
          BalloonHint.ShowHint(LPosition);
        end;
        // Listino
        IMAGE_INDEX_LISTINO: begin
          BalloonHint.Description := Format('%s (%s)'#13#13'Listino del %s', [LItem.SubItems[4], LItem.SubItems[5], LItem.SubItems[6]]);
          BalloonHint.ShowHint(LPosition);
        end;
        // Fattura elettronica passiva
        IMAGE_INDEX_FE: begin
          BalloonHint.Description := Format('%s'#13'%s N° %s%s del %s'#13#13'%s', [LItem.SubItems[4], LItem.SubItems[0], LItem.SubItems[1], LItem.SubItems[2], LItem.SubItems[3], LItem.SubItems[5]]);
          BalloonHint.ShowHint(LPosition);
        end;
        else
          BalloonHint.HideHint;
      end;
    end;
  end
  else
    BalloonHint.HideHint;
end;

// Procedure che, quando siamo in modalità LevanteLight si occupa di importare automaticamente tutti i documenti presenti
//  per noi (escluso i listini) in Levante senza l'intervento dell'operatore.
procedure TScambioDocForm.LevanteLight_RiceviTuttiDoc;
var
  i: Integer;
  DocImp: TStrings;
begin
  // Inizializzazione
  DocImp := TStringList.Create;
  try
    // Scarica il file del residuo ordini
    DownloadFileResOrd(DocImp);
    // Cicla finchè ci sono elementi da importare (l'ultimo così lascia l'eventuale listino per ultimo)
    for i := (ReceiveLV.Items.Count -1) downto 0 do begin
      // =======================================================================
      // Se l'elemento attuale è un documento lo importa senza chiedere nessuna autorizzazione
      //  e incrementa il contatore dei documenti ricevuti
      // -----------------------------------------------------------------------
      if (ReceiveLV.Items[i].ImageIndex = IMAGE_INDEX_FTP) then begin
        // Seleziona l'elemento da importare
        ReceiveLV.Items[i].Selected := True;
        // Richiama l'importazione del documento
        SBRiceviDocumentoClick(SBRiceviDocumento);
        // Incrementa il contatore dei documenti ricevuti
        DocImp.Add(ReceiveLV.Items[i].Caption);
        // Elimina l'elemento appena importato
        ReceiveLV.Items[i].Delete;
      // =======================================================================
      // =======================================================================
      // Se l'elemento attuale è un listino lo importa senza chiedendo prima conferma
      //  all'operatore.
      // -----------------------------------------------------------------------
      end else if (ReceiveLV.Items[i].ImageIndex = IMAGE_INDEX_LISTINO) then begin
        // Chiede conferma
        if DM1.Messaggi(ReceiveLV.Items[i].Caption, 'Aggiornare ora il listino?'#13#13'NB: L''operazione potrebbere richiedere diversi minuti.', '', [mbYes, mbNo], 0, nil) = mrYes then begin
          // Seleziona l'elemento da importare
          ReceiveLV.Items[i].Selected := True;
          // Richiama l'importazione del documento
          SBRiceviDocumentoClick(SBRiceviDocumento);
          // Incrementa il contatore dei documenti ricevuti
          DocImp.Add(ReceiveLV.Items[i].Caption);
          // Elimina l'elemento appena importato
          ReceiveLV.Items[i].Delete;
        end;
      // =======================================================================
      end;
    end;
  finally
    // Visualizza un rapporto e libera tutto
    if DocImp.Count > 0 then begin
      DM1.Messaggi('Levante - Teletrasporto', IntToStr(DocImp.Count) + ' documenti ricevuti:'#13#13 + DocImp.Text, '', [mbOk], 0, nil);
    end else begin
      DM1.Messaggi('Levante - Teletrasporto', 'Non ci sono nuovi documenti.', '', [mbOk], 0, nil); 
    end;
    DocImp.Free;
  end;
end;



procedure TScambioDocForm.SBRiceviDocumentoClick(Sender: TObject);
begin
  if ReceiveLV.SelCount = 0 then
    raise Exception.Create('Nessun elemento selezionato.');
  // Se un documento...
  if ReceiveLV.Selected.ImageIndex = IMAGE_INDEX_FTP then
    RiceviDocumento(ReceiveLV.Selected.SubItems[3])
  else
  // Se una fattura elettronica passiva...
  if ReceiveLV.Selected.ImageIndex = IMAGE_INDEX_FE then
    RiceviFatturaElettronica(StrToInt(ReceiveLV.Selected.SubItems[6]))
  else
  // Se invece è un listino gruppo arcobaleno
  if ReceiveLV.Selected.ImageIndex = IMAGE_INDEX_LISTINO then
  begin
    // Se si tratta di un listino generico della filiale...
    //  NB: Per riconoscerlo controlla la filiale che invia il file in quanto
    //       nei listini custom c'è sempre il valore 'NC' mentre in quelli generici
    //       x'è la sigla della filiale alla quale il listino si riferisce.
    //  NB: Se siamo in modalità Levante Light non chiede alcuna conferma perchè è già
    //       stata richiesta prima.
    if ReceiveLV.Selected.SubItems[5] = 'NC' then begin
      if MainForm.IsLevanteLight or (DM1.Messaggi('Importazione listino', 'ATTENZIONE !!!'#13#13'L''operazione potrebbe durare svariati di minuti.'#13#13'Continuare ?', '', [mbYes,mbNo], 0, nil) = mrYes) then begin
        RiceviListinoCustomGruppoArco(ReceiveLV.Selected.SubItems[3], ReceiveLV.Selected.SubItems[4], ReceiveLV.Selected.SubItems[5], StrToDateTime(ReceiveLV.Selected.SubItems[6]));
      end;
    // Altrimenti se si tratta di un listino personalizzato per l'utente...
    end else begin
      if MainForm.IsLevanteLight or (DM1.Messaggi('Importazione listino', 'ATTENZIONE !!!'#13#13'L''operazione potrebbe durare svariati di minuti.'#13#13'Continuare ?', '', [mbYes,mbNo], 0, nil) = mrYes) then begin
        RiceviListinoGruppoArco(ReceiveLV.Selected.SubItems[3], ReceiveLV.Selected.SubItems[4], ReceiveLV.Selected.SubItems[5], StrToDateTime(ReceiveLV.Selected.SubItems[6]));
      end;
    end;
  end;

end;

procedure TScambioDocForm.ReceiveLVKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se è stato premuto il tasto 'Canc' elimina i documenti dal sistema di interscambio dei documenti
   if Key = 46 then begin
      // Ovviamente chiede prima conferma
      if DM1.Messaggi('Elimina documento', 'Confermi di voler eliminare i documenti selezionati?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
         // Richiama la procedura che elimina i documenti selezionati nella ListView corrente e
         //  dal server di interscambio dei documenti
         EliminaDocumentiSelezionati(Sender as TListView);
      end;
   end;
end;

procedure TScambioDocForm.IdFTP1Disconnected(Sender: TObject);
begin
   // Se la disconnessione dal server non è avvenuta per volontà dell'utente
   //  ma improvvisa e per motivi tecnici forza la disconnessione come se l'utente
   //  avesse premuto il tasto di disconnessione, altrimenti rimangono dei messaggi aperti.
   if not UserDisconnect then begin
      DM1.Messaggi(SHOW_WAIT_TITLE, 'Connessione al server interrotta...', 'NB: La connessione con il server si è interrotta per problemi di linea; se necessario, ritentare di nuovo fra alcuni istanti.', [mbOk], 0, nil); 
      // Avvia il timer per la chiusura ritardata e forzata della connessione e della form
      //  per l'interscambio dei documenti, l'ho dovuto fare con il timer perchè altrimenti
      //  se lo facevo dall'interno della gestione di questo evento non funzionava correttamente.
      CloseTimer.Enabled := True; 
   end;
end;

procedure TScambioDocForm.CloseTimerTimer(Sender: TObject);
begin
   // Disabilita subito il timer
   CloseTimer.Enabled := False;
   // Forza la disconnessione come se fosse stato premuto il pulsante di disconnessione
   //  dall'utente.
   DisconnectFTP;
end;

procedure TScambioDocForm.AutoRefreshTimer(Sender: TObject);
begin
   AutoRefresh.Enabled := False;
   try
  //   SBRefreshFTPClick(SBRefreshFTP);
     IdFTP1.Noop;
   finally
     AutoRefresh.Enabled := True;
   end;
end;

procedure TScambioDocForm.IdFTP1WorkBegin(ASender: TObject;
  AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
   // Quando inizia un lavoro disabilita il Timer dell'autorefresh
   AutoRefresh.Enabled := False;
end;

procedure TScambioDocForm.IdFTP1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
   // Quando finisce un lavoro riabilita il Timer dell'autorefresh
   AutoRefresh.Enabled := (AutoRefresh.Interval > 0);
end;

procedure TScambioDocForm.SBChiudiTeletrasportoClick(Sender: TObject);
begin
   DisconnectFTP;
end;

procedure TScambioDocForm.SendLVAdvancedCustomDraw(Sender: TCustomListView;
  const ARect: TRect; Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
   // Rende la bacheca trasparente caricando sulla sua superficie la stessa bitmap che c'è sotto di essa
   SendLV.Canvas.Draw(SendLV.Left*-1, SendLV.Top*-1,ImageTopFixed.Picture.Bitmap);
end;

procedure TScambioDocForm.Refresh1Click(Sender: TObject);
begin
  SBRefreshFTPClick(SBRefreshFTP);
end;

procedure TScambioDocForm.Eliminavociselezionate1Click(Sender: TObject);
begin
      // Ovviamente chiede prima conferma
      if DM1.Messaggi('Elimina documento', 'Confermi di voler eliminare i documenti selezionati?', '', [mbYes,mbNo], 0, nil) = mrYes then begin
         // Richiama la procedura che elimina i documenti selezionati nella ListView corrente e
         //  dal server di interscambio dei documenti
         EliminaDocumentiSelezionati(SendLV);
      end;
end;

procedure TScambioDocForm.Eliminavociselezionate2Click(Sender: TObject);
begin
  // Ovviamente chiede prima conferma
  if DM1.Messaggi('Elimina/Nascondi', 'Confermi di voler eliminare/nascondere tutte le voci selezionate?', 'NB: Verrà chiesta ulteriore conferma per ogni voce', [mbYes,mbNo], 0, nil) = mrYes then
  begin
    // Richiama la procedura che elimina i documenti selezionati nella ListView corrente e
    //  dal server di interscambio dei documenti
    EliminaDocumentiSelezionati(ReceiveLV);
  end;
end;

procedure TScambioDocForm.ReceiveLVAdvancedCustomDraw(
  Sender: TCustomListView; const ARect: TRect; Stage: TCustomDrawStage;
  var DefaultDraw: Boolean);
var
  y, BottomFixedPosition: Integer;
  UpperBitmap: TBitmap;
begin
   // Inizializzazione
   y := 0;
   BottomFixedPosition := ImageBottomFixed.Top - ReceiveLV.Top;
   UpperBitmap := ImageStretched.Picture.Bitmap;
   // Carica la bitmap della parte variabile superiore per simulare la trasparenza nella
   //  parte alta della bacheca
   repeat
     ReceiveLV.Canvas.Draw((0 - ReceiveLV.Left),
                                y,
                                ImageStretched.Picture.Bitmap
                                );
     Inc(y, UpperBitmap.Height);
   until y > BottomFixedPosition;
   // Carica la bitmap della parte fissa inferiore per simulare la trasparenza nella
   //  parte bassa della bacheca
   ReceiveLV.Canvas.Draw((0 - ReceiveLV.Left),
                              BottomFixedPosition,
                              ImageBottomFixed.Picture.Bitmap
                              );
end;

end.
