unit FormStampeCantieri;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase, ExtCtrls, bmpPanel, 
  StdCtrls, cxRadioGroup, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCheckBox, ComCtrls, cxControls, cxContainer, cxEdit, cxLabel, Buttons,
  cxCalendar, MAURI_SB, Mask, DB, IBODataset, cxGraphics, cxDBEdit,
  cxLookAndFeels, cxLookAndFeelPainters, dxCore, cxDateUtils;

const
  NOMEFILESTAMPA = 'StampaCantiere';
  SEZIONE = 'Stampa';

type
  TStampeCantieriForm = class(TModelBaseForm)
    cxLabel2: TcxLabel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    Panel1: TPanel;
    Label1: TLabel;
    eMatAppStampa: TcxCheckBox;
    eMatAppVista: TcxComboBox;
    cxLabel1: TcxLabel;
    RichEdit2: TRichEdit;
    eMatAppEsplosa: TcxRadioButton;
    eMatAppNonEsplosa: TcxRadioButton;
    cxLabel3: TcxLabel;
    Shape1: TShape;
    Panel2: TPanel;
    Label2: TLabel;
    eOperaElencoStampa: TcxCheckBox;
    eOperaElencoVista: TcxComboBox;
    cxLabel4: TcxLabel;
    RichEdit3: TRichEdit;
    cxLabel5: TcxLabel;
    eOperaAdaStampa: TcxCheckBox;
    eOperaAdaVista: TcxComboBox;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    Panel3: TPanel;
    Label3: TLabel;
    eSpeseElencoStampa: TcxCheckBox;
    eSpeseElencoVista: TcxComboBox;
    cxLabel8: TcxLabel;
    RichEdit4: TRichEdit;
    cxLabel9: TcxLabel;
    eSpeseAdaStampa: TcxCheckBox;
    eSpeseAdaVista: TcxComboBox;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    Panel4: TPanel;
    eOperaElencoEsplosa: TcxRadioButton;
    eOperaElencononEsplosa: TcxRadioButton;
    Panel5: TPanel;
    eOperaAdaEsplosa: TcxRadioButton;
    eOperaAdaNonEsplosa: TcxRadioButton;
    Panel6: TPanel;
    eSpeseElencoEsplosa: TcxRadioButton;
    eSpeseElencoNonEsplosa: TcxRadioButton;
    Panel7: TPanel;
    eSpeseAdaEsplosa: TcxRadioButton;
    eSpeseAdaNonEsplosa: TcxRadioButton;
    eNomeStampa: TcxComboBox;
    cxLabel12: TcxLabel;
    Panel8: TPanel;
    BtnSalva: TSpeedButton;
    PanelSalvaStampa: TPanel;
    Label67: TLabel;
    Label69: TLabel;
    BitBtn2: TBitBtn;
    eNomeStampaSaving: TEdit;
    BitBtn1: TBitBtn;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    QryPratToPrint: TIBOQuery;
    QryPratToPrintCODICE: TIntegerField;
    QryPratToPrintDATAAPERTURA: TDateTimeField;
    eDallaData: TcxDateEdit;
    eAllaData: TcxDateEdit;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelSalvaStampaEnter(Sender: TObject);
    procedure PanelSalvaStampaExit(Sender: TObject);
    procedure BtnSalvaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure eNomeStampaPropertiesInitPopup(Sender: TObject);
    procedure eNomeStampaPropertiesChange(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    procedure CaricaListaViste(NomeGrid:String; Lista:TStrings);
    procedure SalvaImpostazioniStampa(NomeStampa: String);
    procedure CaricaImpostazioniStampa(NomeStampa: String);
    procedure EseguiStampa(PreView: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StampeCantieriForm: TStampeCantieriForm;

implementation

uses SchedaClienti, cxGridTableView, DataModule1, IniFiles, UnitRepositoryIniFile, 
  FormTabGC;

{$R *.dfm}

procedure TStampeCantieriForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TStampeCantieriForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  StampeCantieriForm := nil;
end;

{
procedure TStampeCantieriForm.EseguiStampa(PreView:Boolean);
var
  i: Integer;
  PreviewStampa: Integer;
begin
  // Inizializzazione
  if PreView then PreviewStampa := 0 else PreviewStampa := 1;

  DM1.ShowWait('Stampe riepilogative cantieri', 'Operazione in corso...');
  Self.Hide;
  MainForm.AbilitaMainMenu;
  try
    // Cicla per tutti i cantieri selezionati
    for i := 0 to ClientiForm.tvPrat.Controller.SelectedRecordCount -1 do begin
      // Rende il cantiere selezionato attuale FOCUSED
      ClientiForm.tvPrat.Controller.SelectedRecords[i].Focused := True;
      // Seleziona il cantiere corrente
      ClientiForm.RxSpeedButtonVisualizzaClick(RxSpeedButtonVisualizza);

      Application.ProcessMessages;

      // =======================================================================
      // GIORNALE DI CANTIERE
      // -----------------------------------------------------------------------
      if eMatAppStampa.Checked then begin
        // Si posiziona sul giornale ci cantiere
        MainForm.SBRubricaClick(MainForm.SBGC);
        // Imposta la vista selezionata
        if (eMatAppVista.Text <> '') and (eMatAppVista.Text <> 'Default')
          then DM1.RipristinaDevExpress(ClientiForm.GridGC, eMatAppVista.Text, False);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GCDal.EditText := eDallaData.EditText;
        ClientiForm.GCAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Avvia la stampa
        //  NB: In base alla scelta se effettuare una stampa con i gruppi espansi oppure no
        //       richiama la stampa corretta.
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        if eMatAppEsplosa.Checked
          then ClientiForm.Esploso1Click(ClientiForm.Esploso1)
          else ClientiForm.Normale1Click(ClientiForm.Normale1);
      end;
      // =======================================================================

      Application.ProcessMessages;

      // =======================================================================
      // GIORNALE MANODOPERA
      // -----------------------------------------------------------------------
      if eOperaElencoStampa.Checked then begin
        // Si posiziona sul giornale manodopera
        MainForm.SBRubricaClick(MainForm.SBGOS);
        ClientiForm.cxPageControlGOS.ActivePage := ClientiForm.TabManodopera;
        ClientiForm.cxPageControlGOSOre.ActivePage := ClientiForm.TabGOSOreElenco;
        // Imposta la vista selezionata
        if (eOperaElencoVista.Text <> '') and (eOperaElencoVista.Text <> 'Default')
          then DM1.RipristinaDevExpress(ClientiForm.GridOre, eOperaElencoVista.Text, False);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GOSDal.EditText := eDallaData.EditText;
        ClientiForm.GOSAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Se è stata richiesta una stampa esplosa la esplode altrimenti no
        if eOperaElencoEsplosa.Checked
          then ClientiForm.SpeedButton22Click(ClientiForm.SpeedButton38);
        // Avvia la stampa
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        ClientiForm.Stamparapportooredipendenti1Click(ClientiForm.Stamparapportooredipendenti1);
      end;
      // =======================================================================

      Application.ProcessMessages;

      // =======================================================================
      // ADA MANODOPERA
      // -----------------------------------------------------------------------
      if eOperaAdaStampa.Checked then begin
        // Si posiziona sul giornale manodopera
        MainForm.SBRubricaClick(MainForm.SBGOS);
        ClientiForm.cxPageControlGOS.ActivePage := ClientiForm.TabManodopera;
        ClientiForm.cxPageControlGOSOre.ActivePage := ClientiForm.TabGosOreAda;
        // Imposta la vista selezionata
        if (eOperaAdaVista.Text <> '') and (eOperaAdaVista.Text <> 'Default')
          then DM1.RipristinaPivotDevExpress(ClientiForm.GosOrePivot, eOperaAdaVista.Text);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GOSDal.EditText := eDallaData.EditText;
        ClientiForm.GOSAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Se è stata richiesta una stampa esplosa la esplode altrimenti no
        if eOperaAdaEsplosa.Checked
          then DM1.ExpandAllPivotGridFields(ClientiForm.GosOrePivot);
        // Avvia la stampa
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        ClientiForm.StampaADAdipendenti1Click(ClientiForm.StampaADAdipendenti1);
      end;
      // =======================================================================

      Application.ProcessMessages;

      // =======================================================================
      // GIORNALE SPESE
      // -----------------------------------------------------------------------
      if eSpeseElencoStampa.Checked then begin
        // Si posiziona sul giornale manodopera
        MainForm.SBRubricaClick(MainForm.SBGOS);
        ClientiForm.cxPageControlGOS.ActivePage := ClientiForm.TabSpese;
        ClientiForm.cxPageControlGOSSpese.ActivePage := ClientiForm.TabGOSSpeseElenco;
        // Imposta la vista selezionata
        if (eSpeseElencoVista.Text <> '') and (eSpeseElencoVista.Text <> 'Default')
          then DM1.RipristinaDevExpress(ClientiForm.GridSpese, eSpeseElencoVista.Text, False);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GOSSpeseDal.EditText := eDallaData.EditText;
        ClientiForm.GOSSpeseAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Se è stata richiesta una stampa esplosa la esplode altrimenti no
        if eSpeseElencoEsplosa.Checked
          then ClientiForm.SpeedButton54Click(ClientiForm.SpeedButton54);
        // Avvia la stampa
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        ClientiForm.Stamparapportospesevarie1Click(ClientiForm.Stamparapportospesevarie1);
      end;
      // =======================================================================

      Application.ProcessMessages;

      // =======================================================================
      // ADA SPESE
      // -----------------------------------------------------------------------
      if eSpeseAdaStampa.Checked then begin
        // Si posiziona sul giornale manodopera
        MainForm.SBRubricaClick(MainForm.SBGOS);
        ClientiForm.cxPageControlGOS.ActivePage := ClientiForm.TabSpese;
        ClientiForm.cxPageControlGOSSpese.ActivePage := ClientiForm.TabGosSpeseAda;
        // Imposta la vista selezionata
        if (eSpeseAdaVista.Text <> '') and (eSpeseAdaVista.Text <> 'Default')
          then DM1.RipristinaPivotDevExpress(ClientiForm.GosSpesePivot, eSpeseAdaVista.Text);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GOSSpeseDal.EditText := eDallaData.EditText;
        ClientiForm.GOSSpeseAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Se è stata richiesta una stampa esplosa la esplode altrimenti no
        if eSpeseAdaEsplosa.Checked
          then DM1.ExpandAllPivotGridFields(ClientiForm.GosSpesePivot);
        // Avvia la stampa
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        ClientiForm.StampaADAspesevarie1Click(ClientiForm.StampaADAspesevarie1);
      end;
      // =======================================================================

      DM1.ShowWait('Stampe riepilogative cantieri', 'Termine operazione...');
      Application.ProcessMessages;

      // Chiude il cantiere corrente
      MainForm.PSChiudiClick(MainForm.PSChiudi);
    end;
  finally
    Self.Show;
    MainForm.DisabilitaMainMenu(False);
    DM1.CloseWait;
  end;
end;
}
procedure TStampeCantieriForm.EseguiStampa(PreView:Boolean);
var
  PreviewStampa: Integer;
  DataIniziale, DataFinale: TDateTime;
begin
{
  // Inizializzazione
  if PreView then PreviewStampa := 0 else PreviewStampa := 1;
  DataIniziale  := StartOfTheDay(StrToDate(eDallaData.EditText));
  DataFinale    := EndOfTheDay(StrToDate(eAllaData.EditText));
  if DataFinale < DataIniziale then raise Exception.Create('La data finale non può essere precedente alla data iniziale.');

  DM1.ShowWait('Stampe riepilogative cantieri', 'Operazione in corso...');
  Self.Hide;
  MainForm.AbilitaMainMenu;
  try
    // Imposta la query che ricaverà l'elenco dei cantieri da stampare
    //  cioè l'elenco dei cantieri che hanno una qualche movimentazione
    //  nel periodo specificato
    if QryPratToPrint.Active then QryPratToPrint.Close;
    if not QryPratToPrint.Prepared then QryPratToPrint.Prepare;
    QryPratToPrint.Params.ParamByName('P_DATAINIZIALE').AsDateTime := DataIniziale;
    QryPratToPrint.Params.ParamByName('P_DATAFINALE').AsDateTime := DataFinale;
    QryPratToPrint.Open;

    // Cicla per tutti i cantieri selezionati
    while not QryPratToPrint.Eof do begin;
      // Apre il cantiere corrente
      ClientiForm.SelezionaPraticaCorrente('P', QryPratToPrintCODICE.Value, QryPratToPrintDATAAPERTURA.Value);

      Application.ProcessMessages;

      // =======================================================================
      // GIORNALE DI CANTIERE
      // -----------------------------------------------------------------------
      if eMatAppStampa.Checked then begin
        // Si posiziona sul giornale ci cantiere
        MainForm.SBRubricaClick(MainForm.SBGC);
        // Imposta la vista selezionata
        if (eMatAppVista.Text <> '') and (eMatAppVista.Text <> 'Default')
          then DM1.RipristinaDevExpress(ClientiForm.GridGC, eMatAppVista.Text, False);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GCDal.EditText := eDallaData.EditText;
        ClientiForm.GCAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Avvia la stampa
        //  NB: In base alla scelta se effettuare una stampa con i gruppi espansi oppure no
        //       richiama la stampa corretta.
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        if eMatAppEsplosa.Checked
          then ClientiForm.Esploso1Click(ClientiForm.Esploso1)
          else ClientiForm.Normale1Click(ClientiForm.Normale1);
      end;
      // =======================================================================

      Application.ProcessMessages;

      // =======================================================================
      // GIORNALE MANODOPERA
      // -----------------------------------------------------------------------
      if eOperaElencoStampa.Checked then begin
        // Si posiziona sul giornale manodopera
        MainForm.SBRubricaClick(MainForm.SBGOS);
        ClientiForm.cxPageControlGOS.ActivePage := ClientiForm.TabManodopera;
        ClientiForm.cxPageControlGOSOre.ActivePage := ClientiForm.TabGOSOreElenco;
        // Imposta la vista selezionata
        if (eOperaElencoVista.Text <> '') and (eOperaElencoVista.Text <> 'Default')
          then DM1.RipristinaDevExpress(ClientiForm.GridOre, eOperaElencoVista.Text, False);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GOSDal.EditText := eDallaData.EditText;
        ClientiForm.GOSAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Se è stata richiesta una stampa esplosa la esplode altrimenti no
        if eOperaElencoEsplosa.Checked
          then ClientiForm.SpeedButton22Click(ClientiForm.SpeedButton38);
        // Avvia la stampa
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        ClientiForm.Stamparapportooredipendenti1Click(ClientiForm.Stamparapportooredipendenti1);
      end;
      // =======================================================================

      Application.ProcessMessages;

      // =======================================================================
      // ADA MANODOPERA
      // -----------------------------------------------------------------------
      if eOperaAdaStampa.Checked then begin
        // Si posiziona sul giornale manodopera
        MainForm.SBRubricaClick(MainForm.SBGOS);
        ClientiForm.cxPageControlGOS.ActivePage := ClientiForm.TabManodopera;
        ClientiForm.cxPageControlGOSOre.ActivePage := ClientiForm.TabGosOreAda;
        // Imposta la vista selezionata
        if (eOperaAdaVista.Text <> '') and (eOperaAdaVista.Text <> 'Default')
          then DM1.RipristinaPivotDevExpress(ClientiForm.GosOrePivot, eOperaAdaVista.Text);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GOSDal.EditText := eDallaData.EditText;
        ClientiForm.GOSAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Se è stata richiesta una stampa esplosa la esplode altrimenti no
        if eOperaAdaEsplosa.Checked
          then DM1.ExpandAllPivotGridFields(ClientiForm.GosOrePivot);
        // Avvia la stampa
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        ClientiForm.StampaADAdipendenti1Click(ClientiForm.StampaADAdipendenti1);
      end;
      // =======================================================================

      Application.ProcessMessages;

      // =======================================================================
      // GIORNALE SPESE
      // -----------------------------------------------------------------------
      if eSpeseElencoStampa.Checked then begin
        // Si posiziona sul giornale manodopera
        MainForm.SBRubricaClick(MainForm.SBGOS);
        ClientiForm.cxPageControlGOS.ActivePage := ClientiForm.TabSpese;
        ClientiForm.cxPageControlGOSSpese.ActivePage := ClientiForm.TabGOSSpeseElenco;
        // Imposta la vista selezionata
        if (eSpeseElencoVista.Text <> '') and (eSpeseElencoVista.Text <> 'Default')
          then DM1.RipristinaDevExpress(ClientiForm.GridSpese, eSpeseElencoVista.Text, False);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GOSSpeseDal.EditText := eDallaData.EditText;
        ClientiForm.GOSSpeseAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Se è stata richiesta una stampa esplosa la esplode altrimenti no
        if eSpeseElencoEsplosa.Checked
          then ClientiForm.SpeedButton54Click(ClientiForm.SpeedButton54);
        // Avvia la stampa
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        ClientiForm.Stamparapportospesevarie1Click(ClientiForm.Stamparapportospesevarie1);
      end;
      // =======================================================================

      Application.ProcessMessages;

      // =======================================================================
      // ADA SPESE
      // -----------------------------------------------------------------------
      if eSpeseAdaStampa.Checked then begin
        // Si posiziona sul giornale manodopera
        MainForm.SBRubricaClick(MainForm.SBGOS);
        ClientiForm.cxPageControlGOS.ActivePage := ClientiForm.TabSpese;
        ClientiForm.cxPageControlGOSSpese.ActivePage := ClientiForm.TabGosSpeseAda;
        // Imposta la vista selezionata
        if (eSpeseAdaVista.Text <> '') and (eSpeseAdaVista.Text <> 'Default')
          then DM1.RipristinaPivotDevExpress(ClientiForm.GosSpesePivot, eSpeseAdaVista.Text);
        // IMposta i filtri per data uguali ai filtri per data indicati
        //  nell'elenco cantieri
        ClientiForm.GOSSpeseDal.EditText := eDallaData.EditText;
        ClientiForm.GOSSpeseAl.EditText  := eAllaData.EditText;
        // Avvia la query per il reperimento dei dati.
        ClientiForm.RxSpeedButtonTrovaClick(RxSpeedButtonTrova);
        // Se è stata richiesta una stampa esplosa la esplode altrimenti no
        if eSpeseAdaEsplosa.Checked
          then DM1.ExpandAllPivotGridFields(ClientiForm.GosSpesePivot);
        // Avvia la stampa
        ClientiForm.MenuStampe.Tag := PreviewStampa;  // Così indica che si vuole una stampa e non un'anteprima
        ClientiForm.StampaADAspesevarie1Click(ClientiForm.StampaADAspesevarie1);
      end;
      // =======================================================================

      DM1.ShowWait('Stampe riepilogative cantieri', 'Termine operazione...');
      Application.ProcessMessages;

      // Chiude il cantiere corrente
      MainForm.PSChiudiClick(MainForm.PSChiudi);

      // Avavti al prossimo cantiere
      QryPratToPrint.Next;
    end;
  finally
    Self.Show;
    MainForm.DisabilitaMainMenu(False);
    DM1.CloseWait;
    if QryPratToPrint.Active then QryPratToPrint.Close;
    DM1.Messaggi('Levante', 'Stampa cumulativa cantieri terminata.', '', [mbOk], 0, nil);
  end;
}
end;

procedure TStampeCantieriForm.FormShow(Sender: TObject);
begin
  inherited;
end;

// Questa procedura carica le viste disponibili relative
//  alle varie sezioni.
procedure TStampeCantieriForm.CaricaListaViste(NomeGrid:String; Lista:TStrings);
var
  i: Integer;
begin
  Lista.Clear;
  Lista.Add('Default');
  DM1.ListaVisteGriglia(NomeGrid, Lista);
end;

procedure TStampeCantieriForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Carica nei combobox lle liste delle viste
  CaricaListaViste(TabGCForm.GridGC.Name, eMatAppVista.Properties.Items);

  CaricaListaViste(ClientiForm.GridOre.Name, eOperaElencoVista.Properties.Items);
  CaricaListaViste(ClientiForm.GosOrePivot.Name, eOperaAdaVista.Properties.Items);

  CaricaListaViste(ClientiForm.GridSpese.Name, eSpeseElencoVista.Properties.Items);
  CaricaListaViste(ClientiForm.GosSpesePivot.Name, eSpeseAdaVista.Properties.Items);

  eDallaData.EditText := '';
  eAllaData.EditText := '';
end;

procedure TStampeCantieriForm.PanelSalvaStampaEnter(Sender: TObject);
begin
  inherited;
   MessageBeep(0);
end;

procedure TStampeCantieriForm.PanelSalvaStampaExit(Sender: TObject);
begin
  inherited;
   // Impedisce di uscire dal pannello se non si è premuto il pulsante OK
   if PanelSalvaStampa.Tag = 0 then begin
      MessageBeep(0);
      PanelSalvaStampa.SetFocus;
   end;
end;

procedure TStampeCantieriForm.BtnSalvaClick(Sender: TObject);
begin
  inherited;
  PanelSalvaStampa.Top := PANEL_DATI_ENTE_GAS_TOP;
  PanelSalvaStampa.Left := PANEL_DATI_ENTE_GAS_LEFT;
  if (Trim(eNomeStampa.Text) <> '') and (Trim(eNomeStampa.Text) <> 'Default')
    then eNomeStampaSaving.Text := eNomeStampa.Text
    else eNomeStampaSaving.Text := '';
  PanelSalvaStampa.Visible := True;
  PanelSalvaStampa.SetFocus;
  PanelSalvaStampa.Update;
end;

procedure TStampeCantieriForm.BitBtn2Click(Sender: TObject);
begin
  inherited;
   // Pone Tag a 1 per indicare al gestore dell'evento OnExit che non deve impedire l'uscita.
   PanelSalvaStampa.Tag := 1;
   PanelSalvaStampa.Visible := False;
end;

procedure TStampeCantieriForm.BitBtn1Click(Sender: TObject);
begin
  inherited;
   SalvaImpostazioniStampa(eNomeStampaSaving.Text);
   // Pone Tag a 1 per indicare al gestore dell'evento OnExit che non deve impedire l'uscita.
   PanelSalvaStampa.Tag := 1;
   PanelSalvaStampa.Visible := False;
end;

procedure TStampeCantieriForm.SalvaImpostazioniStampa(NomeStampa:String);
var
  F: TRepositoryIniFile;
  NF: String;
begin
  // Controlli
  if Trim(NomeStampa) = '' then raise Exception.Create('Nome stampa non valido!');
  // Compone il nome completo del file da salvare
  NF := DM1.ImpGridsDir + NOMEFILESTAMPA + '___' + NomeStampa + '.ini';
  // Se il file esiste già avverte l'utente
  if FileExists(NF) then begin
    if DM1.Messaggi('Salva impostazioni stampa', 'File già esistente, si desidera sovrascriverlo ?', 'NB: I dati precedenti saranno perduti.', [mbYes, mbNo], 0, nil) <> mrYes
      then Exit;
  end;
  // Apre il file INI
  F := TRepositoryIniFile.Create(NF, DM1.DBGenerale);
  try
    // Salva i parametri
    F.WriteBool(SEZIONE, 'StampaGiornaleCantiere', eMatAppStampa.Checked);
    F.WriteBool(SEZIONE, 'StampaGiornaleCantiereEsplosa', eMatAppEsplosa.Checked);
    F.WriteString(SEZIONE, 'VistaGiornaleCantiere', eMatAppVista.Text);

    F.WriteBool(SEZIONE, 'StampaGiornaleOre', eOperaElencoStampa.Checked);
    F.WriteBool(SEZIONE, 'StampaGiornaleOreEsplosa', eOperaElencoEsplosa.Checked);
    F.WriteString(SEZIONE, 'VistaGiornaleOre', eOperaElencoVista.Text);

    F.WriteBool(SEZIONE, 'StampaAdaOre', eOperaAdaStampa.Checked);
    F.WriteBool(SEZIONE, 'StampaAdaOreEsplosa', eOperaAdaEsplosa.Checked);
    F.WriteString(SEZIONE, 'VistaAdaOre', eOperaAdaVista.Text);

    F.WriteBool(SEZIONE, 'StampaGiornaleSpese', eSpeseElencoStampa.Checked);
    F.WriteBool(SEZIONE, 'StampaGiornaleSpeseEsplosa', eSpeseElencoEsplosa.Checked);
    F.WriteString(SEZIONE, 'VistaGiornaleSpese', eSpeseElencoVista.Text);

    F.WriteBool(SEZIONE, 'StampaAdaSpese', eSpeseAdaStampa.Checked);
    F.WriteBool(SEZIONE, 'StampaAdaSpeseEsplosa', eSpeseAdaEsplosa.Checked);
    F.WriteString(SEZIONE, 'VistaAdaSpese', eSpeseAdaVista.Text);

    eNomeStampa.Text := NomeStampa;

    F.UpdateFile;
  finally
    F.Free;
  end;
end;

procedure TStampeCantieriForm.CaricaImpostazioniStampa(NomeStampa:String);
var
  F: TMemIniFile;
  NF: String;
begin
  // Controlli
  if Trim(NomeStampa) = '' then Exit;
  // Compone il nome completo del file da salvare
  NF := DM1.ImpGridsDir + NOMEFILESTAMPA + '___' + NomeStampa + '.ini';
  // Apre il file INI
  F := TMemIniFile.Create(NF);
  try
    // Salva i parametri
    eMatAppStampa.Checked := F.ReadBool(SEZIONE, 'StampaGiornaleCantiere', False);
    eMatAppEsplosa.Checked := F.ReadBool(SEZIONE, 'StampaGiornaleCantiereEsplosa', False);
    eMatAppVista.Text := F.ReadString(SEZIONE, 'VistaGiornaleCantiere', 'Default');

    eOperaElencoStampa.Checked := F.ReadBool(SEZIONE, 'StampaGiornaleOre', False);
    eOperaElencoEsplosa.Checked := F.ReadBool(SEZIONE, 'StampaGiornaleOreEsplosa', False);
    eOperaElencoVista.Text := F.ReadString(SEZIONE, 'VistaGiornaleOre', 'Default');

    eOperaAdaStampa.Checked := F.ReadBool(SEZIONE, 'StampaAdaOre', False);
    eOperaAdaEsplosa.Checked := F.ReadBool(SEZIONE, 'StampaAdaOreEsplosa', False);
    eOperaAdaVista.Text := F.ReadString(SEZIONE, 'VistaAdaOre', 'Default');

    eSpeseElencoStampa.Checked := F.ReadBool(SEZIONE, 'StampaGiornaleSpese', False);
    eSpeseElencoEsplosa.Checked := F.ReadBool(SEZIONE, 'StampaGiornaleSpeseEsplosa', False);
    eSpeseElencoVista.Text := F.ReadString(SEZIONE, 'VistaGiornaleSpese', 'Default');

    eSpeseAdaStampa.Checked := F.ReadBool(SEZIONE, 'StampaAdaSpese', False);
    eSpeseAdaEsplosa.Checked := F.ReadBool(SEZIONE, 'StampaAdaSpeseEsplosa', False);
    eSpeseAdaVista.Text := F.ReadString(SEZIONE, 'VistaAdaSpese', 'Default');
  finally
    F.Free;
  end;
end;

procedure TStampeCantieriForm.eNomeStampaPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica la lista delle stampe
  CaricaListaViste(NOMEFILESTAMPA, eNomeStampa.Properties.Items);
end;

procedure TStampeCantieriForm.eNomeStampaPropertiesChange(Sender: TObject);
begin
  inherited;
  CaricaImpostazioniStampa(eNomeStampa.Text);
end;

procedure TStampeCantieriForm.RxSpeedButtonStampaClick(Sender: TObject);
begin
  inherited;
  EseguiStampa(False);
end;

procedure TStampeCantieriForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   if Button = mbRight then begin
     EseguiStampa(True);
   end;
end;

end.
