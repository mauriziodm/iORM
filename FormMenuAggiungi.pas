unit FormMenuAggiungi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxNavBar, cxClasses, dxNavBarBase, dxNavBarCollns,
  ImgList, cxGraphics, IB_Components, IniFiles, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxNavBarStyles, System.ImageList, cxImageList;

type
  TMenuAggiungiForm = class(TForm)
    NavBarLeft: TdxNavBar;
    NavBarGroup_DocumentiDiVendita: TdxNavBarGroup;
    NavBarGroup_DocumentiDiAcquisto: TdxNavBarGroup;
    NavBarGroup_DocumentiAltro: TdxNavBarGroup;
    NavBarLeftItem_BuonoDiConsegna: TdxNavBarItem;
    NavBarLeftItem_CaricoCantiere: TdxNavBarItem;
    NavBarLeftItem_Commessa: TdxNavBarItem;
    NavBarLeftItem_DDT: TdxNavBarItem;
    NavBarLeftItem_EstrattoContro: TdxNavBarItem;
    NavBarLeftItem_Fattura: TdxNavBarItem;
    NavBarLeftItem_FatturaRicFisc: TdxNavBarItem;
    NavBarLeftItem_Intervento: TdxNavBarItem;
    NavBarLeftItem_NotaDiCreditoCliente: TdxNavBarItem;
    NavBarLeftItem_OrdineCliente: TdxNavBarItem;
    NavBarLeftItem_Preventivo: TdxNavBarItem;
    NavBarLeftItem_RicevutaFiscale: TdxNavBarItem;
    NavBarLeftItem_SAL: TdxNavBarItem;
    NavBarLeftItem_ScaricoCantiere: TdxNavBarItem;
    NavBarLeftItem_BollaDiEntrata: TdxNavBarItem;
    NavBarLeftItem_FatturaDiAcquisto: TdxNavBarItem;
    NavBarLeftItem_NotaDiCreditoFornitore: TdxNavBarItem;
    NavBarLeftItem_OrdineFornitore: TdxNavBarItem;
    NavBarLeftItem_Conformita_Old: TdxNavBarItem;
    NavBarLeftItem_RappGiorn: TdxNavBarItem;
    NavBarGroup_DocumentiDiVenditaControl: TdxNavBarGroupControl;
    NavBarGroup_Appuntamenti: TdxNavBarGroup;
    NavBarLeftItem_Appuntamento: TdxNavBarItem;
    dxNavBarRight: TdxNavBar;
    dxNavBarGroup_Soggetto: TdxNavBarGroup;
    dxNavBarGroup_Pratica: TdxNavBarGroup;
    dxNavBar_Impianto: TdxNavBarGroup;
    dxNavBarGroup_Scadenza: TdxNavBarGroup;
    dxNavBarGroup_Primanota: TdxNavBarGroup;
    dxNavBarItem_Pratica: TdxNavBarItem;
    dxNavBarItem_CentraleTermica: TdxNavBarItem;
    dxNavBarItem_Riscaldamento: TdxNavBarItem;
    dxNavBarItem_Climatizzazione: TdxNavBarItem;
    dxNavBarItem_Refrigerazione: TdxNavBarItem;
    dxNavBarItem_Generico: TdxNavBarItem;
    dxNavBarItem_ScadenzaAttiva: TdxNavBarItem;
    dxNavBarItem_ScadenzaPassiva: TdxNavBarItem;
    dxNavBarItem_Primanota: TdxNavBarItem;
    Shape1: TShape;
    dxNavBarGroup_CondVend: TdxNavBarGroup;
    dxNavBarGroup_Comunicazioni: TdxNavBarGroup;
    ImageListMenuAggiungi: TcxImageList;
    dxNavBarGroup_Articoli: TdxNavBarGroup;
    dxNavBarItem_Soggetto: TdxNavBarItem;
    dxNavBarItem_CondVendGruppo: TdxNavBarItem;
    dxNavBarItem_CondVendArticolo: TdxNavBarItem;
    dxNavBarItem_CondAcqGruppo: TdxNavBarItem;
    dxNavBarItem_CondAcqArticolo: TdxNavBarItem;
    dxNavBarItem_ComEmail: TdxNavBarItem;
    dxNavBarItem_ComSms: TdxNavBarItem;
    dxNavBarItem_ComLettera: TdxNavBarItem;
    dxNavBarItem_Articolo: TdxNavBarItem;
    dxNavBarItem_ArticoloComposto: TdxNavBarItem;
    dxNavBar_ExtDoc: TdxNavBarGroup;
    dxNavBarItem_ExtDocVuoto: TdxNavBarItem;
    NavBarLeftItem_Task: TdxNavBarItem;
    NavBarLeftItem_Chiamata: TdxNavBarItem;
    NavBarLeftItem_Testo: TdxNavBarItem;
    procedure dxNavBarRightGroupHotTrack(Sender: TObject;
      AGroup: TdxNavBarGroup);
    procedure NavBarLeftLinkHotTrack(Sender: TObject;
      ALink: TdxNavBarItemLink);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxNavBarRightGroupClick(Sender: TObject;
      AGroup: TdxNavBarGroup);
    procedure NavBarLeftItem_PreventivoClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NavBarLeftItem_BuonoDiConsegnaClick(Sender: TObject);
    procedure NavBarLeftItem_CaricoCantiereClick(Sender: TObject);
    procedure NavBarLeftItem_CommessaClick(Sender: TObject);
    procedure NavBarLeftItem_DDTClick(Sender: TObject);
    procedure NavBarLeftItem_EstrattoControClick(Sender: TObject);
    procedure NavBarLeftItem_FatturaClick(Sender: TObject);
    procedure NavBarLeftItem_FatturaRicFiscClick(Sender: TObject);
    procedure NavBarLeftItem_InterventoClick(Sender: TObject);
    procedure NavBarLeftItem_NotaDiCreditoClienteClick(Sender: TObject);
    procedure NavBarLeftItem_OrdineClienteClick(Sender: TObject);
    procedure NavBarLeftItem_RicevutaFiscaleClick(Sender: TObject);
    procedure NavBarLeftItem_SALClick(Sender: TObject);
    procedure NavBarLeftItem_ScaricoCantiereClick(Sender: TObject);
    procedure NavBarLeftItem_BollaDiEntrataClick(Sender: TObject);
    procedure NavBarLeftItem_FatturaDiAcquistoClick(Sender: TObject);
    procedure NavBarLeftItem_NotaDiCreditoFornitoreClick(Sender: TObject);
    procedure NavBarLeftItem_OrdineFornitoreClick(Sender: TObject);
    procedure NavBarLeftItem_Conformita_OldClick(Sender: TObject);
    procedure NavBarLeftItem_RappGiornClick(Sender: TObject);
    procedure CaricaLinkItemsExtDoc;
    procedure CaricaLinkItemsSoggetti;
    procedure dxNavBarItem_ExtDocVuotoClick(Sender: TObject);
    procedure NavBarLeftItem_AppuntamentoClick(Sender: TObject);
    procedure dxNavBarItem_SoggettoClick(Sender: TObject);
    procedure dxNavBarItem_PraticaClick(Sender: TObject);
    procedure dxNavBarItem_CentraleTermicaClick(Sender: TObject);
    procedure dxNavBarItem_RiscaldamentoClick(Sender: TObject);
    procedure dxNavBarItem_ClimatizzazioneClick(Sender: TObject);
    procedure dxNavBarItem_RefrigerazioneClick(Sender: TObject);
    procedure dxNavBarItem_GenericoClick(Sender: TObject);
    procedure dxNavBarItem_ScadenzaAttivaClick(Sender: TObject);
    procedure dxNavBarItem_ScadenzaPassivaClick(Sender: TObject);
    procedure dxNavBarItem_PrimanotaClick(Sender: TObject);
    procedure dxNavBarItem_CondVendGruppoClick(Sender: TObject);
    procedure dxNavBarItem_CondVendArticoloClick(Sender: TObject);
    procedure dxNavBarItem_CondAcqGruppoClick(Sender: TObject);
    procedure dxNavBarItem_CondAcqArticoloClick(Sender: TObject);
    procedure dxNavBarItem_ComSmsClick(Sender: TObject);
    procedure dxNavBarItem_ComEmailClick(Sender: TObject);
    procedure dxNavBarItem_ComLetteraClick(Sender: TObject);
    procedure dxNavBarItem_ArticoloClick(Sender: TObject);
    procedure dxNavBarItem_ArticoloCompostoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NavBarLeftItem_TaskClick(Sender: TObject);
    procedure NavBarLeftItem_ChiamataClick(Sender: TObject);
    procedure NavBarLeftItem_TestoClick(Sender: TObject);
    procedure NavBarLeftItem_ConformitaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure VerificaPermessi;
    procedure CaricaTitoli;
    { Private declarations }
  public
    { Public declarations }
    procedure CommonMenuItemClick;
  end;

var
  MenuAggiungiForm: TMenuAggiungiForm;

implementation


uses DataModule1, SchedaClienti, FormConformWizard, FormExtFile,
  FormRappGiorn, main, FormAnagCli, FormPratica, FormScadenziario,
  FormPrimanota, FormCondVend, DataModule2, FormAnagArt, FormImpegni, cxSplitter,
  FormAgendaSlide, UnitGoogleTasks, SchedaTesti;


{$R *.dfm}

procedure TMenuAggiungiForm.dxNavBarRightGroupHotTrack(Sender: TObject;
  AGroup: TdxNavBarGroup);
begin
  // Se c'è una voce HotTracked emette il relativo suono
  if (Sender as TdxNavBar).HotTrackedGroup <> nil
  then DM2.EmettiSuono('MenuHotTrack.wav');
{
  // Inizializzazione
  CurrNavBar := Sender as TdxNavBar;
  // Fa in modo che si espanda il gruppo sopra il quale è posizionato il
  //  puntatore del mouse.
  if (AGroup = nil) or AGroup.Expanded then Exit;
  for i := 0 to CurrNavBar.Groups.Count -1 do CurrNavBar.Groups[i].Expanded := False;
  AGroup.Expanded := True;
}
end;

procedure TMenuAggiungiForm.NavBarLeftLinkHotTrack(Sender: TObject;
  ALink: TdxNavBarItemLink);
begin
  // Se c'è una voce HotTracked emette il relativo suono
  if (Sender as TdxNavBar).HotTrackedLink <> nil
  then DM2.EmettiSuono('MenuHotTrack.wav');
end;

procedure TMenuAggiungiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TMenuAggiungiForm.dxNavBarRightGroupClick(Sender: TObject;
  AGroup: TdxNavBarGroup);
begin
  // Emette il suono d link clicckato
  if (Sender as TdxNavBar).HotTrackedGroup <> nil
  then DM2.EmettiSuono('MenuOpen.wav');
{
  // Inizializzazione
  CurrNavBar := Sender as TdxNavBar;
  // Fa in modo che si espanda il gruppo sopra il quale è posizionato il
  //  puntatore del mouse e che si chiudano tutti gli altri in modo
  //  che ce ne sia solo uno aperto
  if (AGroup = nil) or AGroup.Expanded then Exit;
  for i := 0 to CurrNavBar.Groups.Count -1 do CurrNavBar.Groups[i].Expanded := False;
}
end;

procedure TMenuAggiungiForm.FormDeactivate(Sender: TObject);
begin
  // Altrimenti rimane visibile sotto in alcune condizioni
  Close;
end;

procedure TMenuAggiungiForm.FormDestroy(Sender: TObject);
begin
  // Rimette la variabile a nil
  MenuAggiungiForm := nil;
end;

procedure TMenuAggiungiForm.FormShow(Sender: TObject);
begin
  // Emette il suono di apertura del menù
  DM2.EmettiSuono('MenuOpen.wav');
  // Verifica i permessi
  VerificaPermessi;
end;



// Procedure che verifica i permessi dell'utente
procedure TMenuAggiungiForm.VerificaPermessi;
var
  i, ii: Integer;
  AlmenoUnoVisibile: Boolean;
begin
  // ===========================================================================
  // INIZIO: LEFT PANEL
  // ---------------------------------------------------------------------------
  // Chiamata/Appuntamento
  NavBarLeftItem_Appuntamento.Visible := ( DM1.ModCtrl(MOD_CONTATTI) > 1 );
  // --------------------
  // Buono di consegna
  NavBarLeftItem_BuonoDiConsegna.Visible := ( DM1.ModCtrl(MOD_BUONO_CONSEGNA) > 1 );
  // Carico cantiere
  NavBarLeftItem_CaricoCantiere.Visible := ( DM1.ModCtrl(MOD_PRATICHE) > 1 );
  // Commessa
  NavBarLeftItem_Commessa.Visible := ( DM1.ModCtrl(MOD_PRATICHE) > 1 );
  // D.D.T.
  NavBarLeftItem_DDT.Visible := ( DM1.ModCtrl(MOD_DDT) > 1 );
  // Estratto conto
  NavBarLeftItem_EstrattoContro.Visible := ( DM1.ModCtrl(MOD_PRATICHE) > 1 );
  // Fattura
  NavBarLeftItem_Fattura.Visible := ( DM1.ModCtrl(MOD_FATTURE) > 1 );
  // Fattura RIcevuta Fiscale
  NavBarLeftItem_FatturaRicFisc.Visible := ( DM1.ModCtrl(MOD_FATTURE_RF) > 1 );
  // Intervento
  NavBarLeftItem_Intervento.Visible := ( DM1.ModCtrl(MOD_CONTATTI) > 1 );
  // Nota di credito
  NavBarLeftItem_NotaDiCreditoCliente.Visible := ( DM1.ModCtrl(MOD_NOTE_ACCREDITO) > 1 );
  // Ordine
  NavBarLeftItem_OrdineCliente.Visible := ( DM1.ModCtrl(MOD_ORDINI) > 1 );
  // Preventivo
  NavBarLeftItem_Preventivo.Visible := ( DM1.ModCtrl(MOD_PREVENTIVI) > 1 );
  // Ricevuta fiscale
  NavBarLeftItem_RicevutaFiscale.Visible := ( DM1.ModCtrl(MOD_RICEVUTE_FISCALI) > 1 );
  // S.A.L.
  NavBarLeftItem_SAL.Visible := ( DM1.ModCtrl(MOD_SAL) > 1 );
  // Scarico cantiere
  NavBarLeftItem_ScaricoCantiere.Visible := ( DM1.ModCtrl(MOD_PRATICHE) > 1 );
  // --------------------
  // Bolla di entrata
  NavBarLeftItem_BollaDiEntrata.Visible := ( DM1.ModCtrl(MOD_BOLLE_ENTRATA) > 1 );
  // Fattura di acquisto
  NavBarLeftItem_FatturaDiAcquisto.Visible := ( DM1.ModCtrl(MOD_FATTURE_ACQUISTO) > 1 );
  // Nota di credito fornitore
  NavBarLeftItem_NotaDiCreditoFornitore.Visible := ( DM1.ModCtrl(MOD_NOTE_ACCREDITO) > 1 );
  // Ordine a fornitore
  NavBarLeftItem_OrdineFornitore.Visible := ( DM1.ModCtrl(MOD_ORDINI_FORNITORI) > 1 );
  // --------------------
  // Dichiarazione di conformità
  NavBarLeftItem_Conformita_Old.Visible := ( DM1.ModCtrl(MOD_CONFORMITA) > 1 );
  // Rapporto giornaliero
  NavBarLeftItem_RappGiorn.Visible := ( DM1.ModCtrl(MOD_GIORNALE_CANTIERE) > 1 );
  // Testo
  NavBarLeftItem_Testo.Visible := ( DM1.ModCtrl(MOD_TESTI) > 1 );
  // ---------------------------------------------------------------------------
  // Parte che se un gruppo è vuoto lo fa sparire
  //  Cicla per tutti i gruppi
  for i := (NavBarLeft.Groups.Count -1) downto 0 do begin
    // Imposta subito a invisibile il gruppo corrente
    NavBarLeft.Groups[i].Visible := False;
    // Cicla per tutti i links del gruppo e conta quanti links
    //  ci sono visibili
    for ii := 0 to NavBarLeft.Groups[i].LinkCount -1 do begin
      // Se almeno uno è visibile rende visibile il gruppo ed esce subito dal loop interno
      if NavBarLeft.Groups[i].Links[ii].Item.Visible then begin
        NavBarLeft.Groups[i].Visible := True;
        Break;  
      end;
    end;
  end;
  // ---------------------------------------------------------------------------
  // FINE: LEFT PANEL
  // ===========================================================================


  // ===========================================================================
  // INIZIO: RIGHT PANEL
  // ---------------------------------------------------------------------------
  // Soggetti
  dxNavBarGroup_Soggetto.Visible := ( DM1.ModCtrl(MOD_CLIENTI) > 1 );
  // Pratiche
  dxNavBarGroup_Pratica.Visible := ( DM1.ModCtrl(MOD_PRATICHE) > 1 );
  // Impianti
  dxNavBar_Impianto.Visible := ( DM1.ModCtrl(MOD_CONTATTI) > 1 );
  // Scadenzatio
  dxNavBarGroup_Scadenza.Visible := ( DM1.ModCtrl(MOD_SCADENZARIO) > 1 );
  // Primanota
  dxNavBarGroup_Primanota.Visible := ( DM1.ModCtrl(MOD_PRIMANOTA) > 1 );
  // Condizioni di vendita
  dxNavBarGroup_CondVend.Visible := ( DM1.ModCtrl(MOD_CONDIZIONI_VENDITA) > 1 );
  // Comunicazioni
  dxNavBarGroup_Comunicazioni.Visible := ( DM1.ModCtrl(MOD_TESTI) > 1 );
  // Articoli
  dxNavBarGroup_Articoli.Visible := ( DM1.ModCtrl(MOD_ARTICOLI) > 1 );
  // Documenti esterni
  dxNavBar_ExtDoc.Visible := ( DM1.ModCtrl(MOD_EXT_FILE) > 1 );
  // ---------------------------------------------------------------------------
  // FINE: RIGHT PANEL
  // ===========================================================================
end;


// Procedure che carica alcuni titoli
procedure TMenuAggiungiForm.CaricaTitoli;
begin
  // Per adesso è vuoto poi vedremo
end;










// Procedure che popola i documenti esterni
procedure TMenuAggiungiForm.CaricaLinkItemsExtDoc;
var
  NewMenuItem: TdxNavBarItem;
  Qry: TIB_Cursor;
  i: Integer;
begin
  // Azzera le voci (tranne la prima)
  for i := (dxNavBar_ExtDoc.LinkCount -1) downto 1 do dxNavBar_ExtDoc.Links[i].Item.Free;
  // Imposta la query che ricaverà i tipi di documenti esterni tra cui scegliere
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT CODICE, DESCRIZIONE FROM EXTPRG');
    Qry.Open;
    // Se non trova nulla esce
    if Qry.Eof then Exit;
    // CIcla per tutti i records trovati
    while not Qry.Eof do begin
      // Crea la nuova voce di menù e la imposta
      NewMenuItem         := dxNavBarRight.Items.Add;
      NewMenuItem.Tag     := Qry.FieldByName('CODICE').AsInteger;
      NewMenuItem.Caption := Qry.FieldByName('DESCRIZIONE').AsString;
      NewMenuItem.OnClick := dxNavBarItem_ExtDocVuoto.OnClick;
      // Aggiunge la nuova voce al gruppo dei documenti esterni
      dxNavBar_ExtDoc.CreateLink(NewMenuItem);
      // Avanti il prossimo
      Qry.Next;
    end;
    // Chiude la query
    Qry.Close;
  finally
    // Pulizie finali
    Qry.Free;
  end;
end;


// Procedure che popola i tipi di soggetto
procedure TMenuAggiungiForm.CaricaLinkItemsSoggetti;
var
  NewMenuItem: TdxNavBarItem;
  i: Integer;
  TmpStr: String;
  LO: TMemIniFile;
begin
  // Apre il file con le impostazioni di visualizzazione
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // Azzera le voci (tranne la prima che però non deve essere visibile perchè
    //  serve solo da modello)
    for i := (dxNavBarGroup_Soggetto.LinkCount -1) downto 1 do dxNavBarGroup_Soggetto.Links[i].Item.Free;
    dxNavBarGroup_Soggetto.Links[0].Item.Visible := False;
    // Carica il parametro del layouts.ini che contiene l'elenco dei tipi di soggetto
    TmpStr := LO.ReadString('FormAnagraficaClienti', 'TipoSoggetto', 'Soggetto');
    // Cicla per tutti i tipi di soggetto
    while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do begin
      // Crea la nuova voce di menù e la imposta
      NewMenuItem         := dxNavBarRight.Items.Add;
      NewMenuItem.Caption := DM1.RitornaTestoPrimaDi('_', TmpStr, True);
      NewMenuItem.OnClick := dxNavBarItem_Soggetto.OnClick;
      // Aggiunge la nuova voce al gruppo dei documenti esterni
      dxNavBarGroup_Soggetto.CreateLink(NewMenuItem);
    end;
  finally
    LO.Free;
  end;
end;












// Procedure che esegue alcune operazioni comuni alla selezione di una
//  voce del menù
procedure TMenuAggiungiForm.CommonMenuItemClick;
begin
  // Emette il suono d link clicckato
  DM2.EmettiSuono('MenuClick.wav');
  // Chiude il menù (hide) nel modo più veloce possibile.
  Self.Close;
  Self.Update;
  Application.ProcessMessages;
end;

procedure TMenuAggiungiForm.NavBarLeftItem_AppuntamentoClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il nuovo documento
  DM1.ShowWait('Levante', 'Un momento...');
  try
    ClientiForm.GoToNuovoAppuntamento('Chiamata');
    // Se siamo in FastSelectionMode imposta la data l'ora e il tecnico in base all'agenda
    //  se l'agenda stessa è aperta, se invece siamo in NOrmalSelectionMode verifica che siamo sulla
    //  pagina dell'agenda.
    if  (ImpegnoForm <> nil)
    and (   (ClientiForm.PageControl2.ActivePage = ClientiForm.TabAgenda) or ((ClientiForm.SplitterAgendaRight.State = ssOpened) and (ClientiForm.AgendaForm.MainPageControl.ActivePage = ClientiForm.AgendaForm.TabAgenda))   )
    then begin
      ImpegnoForm.QryImpSTART.Value       := ClientiForm.Agenda.SelStart;
      ImpegnoForm.QryImpFINISH.Value      := ClientiForm.Agenda.SelFinish;
      ImpegnoFOrm.QryImpRESOURCEID.Value  := ClientiForm.Agenda.SelResource.ResourceID;
    end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_SoggettoClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il nuovo documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TAnagCliForm, AnagCliForm);
    AnagCliForm.Parent := MainForm;
    AnagCliForm.TipoNuovoSoggetto := (Sender as TdxNavBarItem).Caption;
    AnagCliForm.Tag := 2;
    AnagCliForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.NavBarLeftItem_BuonoDiConsegnaClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Buono_cons');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_CaricoCantiereClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Carico_cantiere');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_CommessaClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Commessa');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_DDTClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('D.D.T.');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_EstrattoControClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Estratto_conto');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_FatturaClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Fattura');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_FatturaRicFiscClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Fatt.R.F.');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_InterventoClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    ClientiForm.GoToNuovoAppuntamento('Intervento');
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.NavBarLeftItem_NotaDiCreditoClienteClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Nota_accre');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_OrdineClienteClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Ordine');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_PreventivoClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Preventivo');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_RicevutaFiscaleClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Ricev.fisc');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_SALClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('S.A.L.');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_ScaricoCantiereClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Scarico_cantiere');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_BollaDiEntrataClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Bolla_entr');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_FatturaDiAcquistoClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Fatt.acqui');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_NotaDiCreditoFornitoreClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('N.C.fornit');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_OrdineFornitoreClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Chiude il menù aggiungi
  ClientiForm.GoToNuovoDocFisc('Ord.fornit');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_ConformitaClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Va alla nuova conformità
  DM1.Attendere;
  try
    DM1.LDE_NewDocument('Conformita', ClientiForm.ID_ClienteCorrente, ClientiForm.ID_PraticaCorrente);
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TMenuAggiungiForm.NavBarLeftItem_Conformita_OldClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Va alla nuova conformità
  DM1.Attendere;
  try
    if ClientiForm.ClienteCorrente <> '' then begin
      Application.CreateForm(TConformWizardForm, ConformWizardForm);
      ConformWizardForm.Parent := MainForm;
      ConformWizardForm.Show;
    end else begin
       MessageBeep(0);
       MessageDlg('Prima è necessario selezionare un cliente o un fornitore !', mtInformation, [mbOK], 0);
    end;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_ExtDocVuotoClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il nuovo documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TExtFileForm, ExtFileForm);
    ExtFileForm.Parent := MainForm;
    ExtFileForm.CodiceCliente  := '0';
    ExtFileForm.CodicePratica  := ClientiForm.PraticaCorrente;
    ExtFileForm.DataPratica    := ClientiForm.DataPraticaCorrente;
    ExtFileForm.CodiceExtPrg   := (Sender as TdxNavBarItem).Tag;
    ExtFileForm.Tag := 2;
    if ClientiForm.ClienteCorrente <> '' then begin
      ExtFileForm.CodiceCliente  := ClientiForm.ClienteCorrente;
    end;
    ExtFileForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.NavBarLeftItem_RappGiornClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TRappGiornForm, RappGiornForm);
    RappGiornForm.Parent := MainForm;
    RappGiornForm.Tag := 2;
    RappGiornForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_PraticaClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TPraticaForm, PraticaForm);
    PraticaForm.Mode := MODE_PRATICHE;
    PraticaForm.Parent := MainForm;
    PraticaForm.CodiceCliente := '0';
    if ClientiForm.ClienteCorrente <> '' then PraticaForm.CodiceCliente  := ClientiForm.ClienteCorrente;
    PraticaForm.Tag := 2;
    PraticaForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_CentraleTermicaClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  ClientiForm.CreaNuovoImpianto('Centrale termica');
end;

procedure TMenuAggiungiForm.dxNavBarItem_RiscaldamentoClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  ClientiForm.CreaNuovoImpianto('Riscaldamento');
end;

procedure TMenuAggiungiForm.dxNavBarItem_ClimatizzazioneClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  ClientiForm.CreaNuovoImpianto('Climatizzazione');
end;

procedure TMenuAggiungiForm.dxNavBarItem_RefrigerazioneClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  ClientiForm.CreaNuovoImpianto('Refrigerazione');
end;

procedure TMenuAggiungiForm.dxNavBarItem_GenericoClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  ClientiForm.CreaNuovoImpianto('Generico');
end;

procedure TMenuAggiungiForm.dxNavBarItem_ScadenzaAttivaClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TScadenzeForm, ScadenzeForm);
    ScadenzeForm.Parent := MainForm;
    ScadenzeForm.CodiceCliente  := '0';
    if ClientiForm.ClienteCorrente <> '' then begin
       ScadenzeForm.CodiceCliente  := ClientiForm.ClienteCorrente;
    end;
    ScadenzeForm.CodicePratica  := ClientiForm.PraticaCorrente;
    ScadenzeForm.DataPratica    := ClientiForm.DataPraticaCorrente;
    ScadenzeForm.TipoScadenza   := 'Scad.attiv';
    ScadenzeForm.Tag := 2;
    ScadenzeForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_ScadenzaPassivaClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TScadenzeForm, ScadenzeForm);
    ScadenzeForm.Parent := MainForm;
    ScadenzeForm.CodiceCliente  := '0';
    if ClientiForm.ClienteCorrente <> '' then begin
       ScadenzeForm.CodiceCliente  := ClientiForm.ClienteCorrente;
    end;
    ScadenzeForm.CodicePratica  := ClientiForm.PraticaCorrente;
    ScadenzeForm.DataPratica    := ClientiForm.DataPraticaCorrente;
    ScadenzeForm.TipoScadenza   := 'Scad.passi';
    ScadenzeForm.Tag := 2;
    ScadenzeForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_PrimanotaClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TPrimanotaForm, PrimanotaForm);
    PrimanotaForm.Parent := MainForm;
    PrimanotaForm.Tag := 2;
    PrimanotaForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_CondVendGruppoClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TCondVendForm, CondVendForm);
    CondVendForm.Parent := MainForm;
    // IMposta alcune variabili locali alla form
    CondVendForm.LocTipoCondizione := 'Cond.Vend.';
    if ClientiForm.ClienteCorrente <> '' then CondVendForm.LocCodiceSoggetto := StrToInt(ClientiForm.ClienteCorrente) else CondVendForm.LocCodiceSoggetto := 0;
    CondVendForm.LocCodiceArticolo  := '-1';
    CondVendForm.LocCodiceGruppo1   := -1;
    CondVendForm.LocCodiceGruppo2   := -1;
    CondVendForm.LocCodiceGruppo3   := -1;
    CondVendForm.Tag := 2;  // Nuova condizione per gruppo
    CondVendForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_CondVendArticoloClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TCondVendForm, CondVendForm);
    CondVendForm.Parent := MainForm;
    // IMposta alcune variabili locali alla form
    CondVendForm.LocTipoCondizione := 'Cond.Vend.';
    if ClientiForm.ClienteCorrente <> '' then CondVendForm.LocCodiceSoggetto := StrToInt(ClientiForm.ClienteCorrente) else CondVendForm.LocCodiceSoggetto := 0;
    CondVendForm.LocCodiceArticolo  := '-1';
    CondVendForm.LocCodiceGruppo1   := -1;
    CondVendForm.LocCodiceGruppo2   := -1;
    CondVendForm.LocCodiceGruppo3   := -1;
    CondVendForm.Tag := 3;  // Nuova condizione per articolo
    CondVendForm.Show;
  finally
     DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_CondAcqGruppoClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TCondVendForm, CondVendForm);
    CondVendForm.Parent := MainForm;
    // IMposta alcune variabili locali alla form
    CondVendForm.LocTipoCondizione := 'Cond.Acqui';
    if ClientiForm.ClienteCorrente <> '' then CondVendForm.LocCodiceSoggetto := StrToInt(ClientiForm.ClienteCorrente) else CondVendForm.LocCodiceSoggetto := 0;
    CondVendForm.LocCodiceArticolo  := '-1';
    CondVendForm.LocCodiceGruppo1   := -1;
    CondVendForm.LocCodiceGruppo2   := -1;
    CondVendForm.LocCodiceGruppo3   := -1;
    CondVendForm.Tag := 4;  // Nuova condizione per gruppo
    CondVendForm.Show;
  finally
     DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_CondAcqArticoloClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TCondVendForm, CondVendForm);
    CondVendForm.Parent := MainForm;
    // IMposta alcune variabili locali alla form
    CondVendForm.LocTipoCondizione := 'Cond.Acqui';
    if ClientiForm.ClienteCorrente <> '' then CondVendForm.LocCodiceSoggetto := StrToInt(ClientiForm.ClienteCorrente) else CondVendForm.LocCodiceSoggetto := 0;
    CondVendForm.LocCodiceArticolo  := '-1';
    CondVendForm.LocCodiceGruppo1   := -1;
    CondVendForm.LocCodiceGruppo2   := -1;
    CondVendForm.LocCodiceGruppo3   := -1;
    CondVendForm.Tag := 5;  // Nuova condizione per gruppo
    CondVendForm.Show;
  finally
     DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_ComSmsClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    DM2.COM_CreaNuovaComunicazione('sms', ClientiForm.ID_ClienteCorrente, ClientiForm.ID_PraticaCorrente);
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_ComEmailClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    DM2.COM_CreaNuovaComunicazione('e-mail', ClientiForm.ID_ClienteCorrente, ClientiForm.ID_PraticaCorrente);
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_ComLetteraClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    DM2.COM_CreaNuovaComunicazione('lettera', ClientiForm.ID_ClienteCorrente, ClientiForm.ID_PraticaCorrente);
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_ArticoloClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    Application.CreateForm(TAnagArtForm, AnagArtForm);
    // La riga sottostante è stata sostituita con la successiva per risolvere l'errore
    //  che dava il programma quando girava su Win95/98/ME (Questo programma ha eseguito una operazione non valida...)
    //  Il problema lo dava solo quando assegnavo la proprietà Parent della form AnagArtForm.
    //  con le altre form andava bene.
//           AnagArtForm.Parent := MainForm;
    MainForm.FormSetParentPlatformDependent(AnagArtForm, MainForm);
    AnagArtForm.DistintaBase := False;
    AnagArtForm.Tag := 2;
    AnagArtForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.dxNavBarItem_ArticoloCompostoClick(
  Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il documento
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    Application.CreateForm(TAnagArtForm, AnagArtForm);
    // La riga sottostante è stata sostituita con la successiva per risolvere l'errore
    //  che dava il programma quando girava su Win95/98/ME (Questo programma ha eseguito una operazione non valida...)
    //  Il problema lo dava solo quando assegnavo la proprietà Parent della form AnagArtForm.
    //  con le altre form andava bene.
//           AnagArtForm.Parent := MainForm;
    MainForm.FormSetParentPlatformDependent(AnagArtForm, MainForm);
    AnagArtForm.DistintaBase := True;
    AnagArtForm.Tag := 2;
    AnagArtForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TMenuAggiungiForm.FormCreate(Sender: TObject);
begin
  CaricaTitoli;
  // Carica l'elenco dei dipi di soggetto
  CaricaLinkItemsSoggetti;
  // Se non siamo in ristrutturazione carica alcune voci dinamiche e alcuni parametri
  //  del menù aggiungi
  CaricaLinkItemsExtDoc;
end;

procedure TMenuAggiungiForm.NavBarLeftItem_TaskClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il nuovo documento
  GoogleTasks_ShowTaskForm('', '');
end;

procedure TMenuAggiungiForm.NavBarLeftItem_TestoClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Va al nuovo testo
  DM1.Attendere;
  try
    Application.CreateForm(TTestiForm, TestiForm);
    TestiForm.Parent := MainForm;
    TestiForm.CodiceCliente  := '0';
    TestiForm.CodicePratica  := ClientiForm.PraticaCorrente;
    TestiForm.DataPratica    := ClientiForm.DataPraticaCorrente;
    TestiForm.Tag := 2;
    if ClientiForm.ClienteCorrente <> '' then begin
      TestiForm.CodiceCliente  := ClientiForm.ClienteCorrente;
    end;
    TestiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TMenuAggiungiForm.NavBarLeftItem_ChiamataClick(Sender: TObject);
begin
  // Emette il suono di link clicckato e chiude il menù
  CommonMenuItemClick;
  // Crea il nuovo documento
  DM1.ShowWait('Levante', 'Un momento...');
  try
    ClientiForm.GoToNuovoAppuntamento('Chiamata');
  finally
    DM1.CloseWait;
  end;
end;

end.

