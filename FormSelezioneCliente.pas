unit FormSelezioneCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,
  ExtCtrls, Db, IBODataset, IniFiles, bmpPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxGraphics, Menus, 
  cxCustomData, cxEdit, cxDBData,
  cxTextEdit, cxCalendar, cxCurrencyEdit, StrUtils, cxMemo, cxContainer,
  cxMaskEdit, cxDropDownEdit, MAURI_SB, IB_Components, cxStyles, cxFilter,
  cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator;

type
  TSelezioneClienteForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    QrySoggetti: TIBOQuery;
    QrySoggettiCODICE: TIntegerField;
    QrySoggettiRAGIONESOCIALE: TStringField;
    QrySoggettiINDIRIZZO: TStringField;
    QrySoggettiCITTA: TStringField;
    QrySoggettiCAP: TStringField;
    QrySoggettiPROVINCIA: TStringField;
    QrySoggettiDATANASCITA: TDateTimeField;
    QrySoggettiLUOGONASCITA: TStringField;
    QrySoggettiTELEFONO: TStringField;
    QrySoggettiFAX: TStringField;
    QrySoggettiCLIENTEFORNITORE: TStringField;
    SourceSoggetti: TDataSource;
    ClientArea: TPanel;
    PanelTabsRubrica: TPanel;
    Sh1: TShape;
    Sh2: TShape;
    Sh3: TShape;
    Sh4: TShape;
    Sh5: TShape;
    Sh6: TShape;
    Sh7: TShape;
    Sh8: TShape;
    Sh9: TShape;
    Sh10: TShape;
    Sh11: TShape;
    Sh12: TShape;
    Sh13: TShape;
    Sh14: TShape;
    Sh15: TShape;
    Sh16: TShape;
    Sh17: TShape;
    Sh18: TShape;
    Sh19: TShape;
    Sh20: TShape;
    Sh21: TShape;
    Sh22: TShape;
    Sh23: TShape;
    Sh24: TShape;
    Sh25: TShape;
    Sh26: TShape;
    SB1: TSpeedButton;
    SB2: TSpeedButton;
    SB3: TSpeedButton;
    SB4: TSpeedButton;
    SB5: TSpeedButton;
    SB6: TSpeedButton;
    SB7: TSpeedButton;
    SB8: TSpeedButton;
    SB9: TSpeedButton;
    SB10: TSpeedButton;
    SB11: TSpeedButton;
    SB12: TSpeedButton;
    SB13: TSpeedButton;
    SB14: TSpeedButton;
    SB15: TSpeedButton;
    SB16: TSpeedButton;
    SB17: TSpeedButton;
    SB18: TSpeedButton;
    SB19: TSpeedButton;
    SB20: TSpeedButton;
    SB21: TSpeedButton;
    SB22: TSpeedButton;
    SB23: TSpeedButton;
    SB24: TSpeedButton;
    SB25: TSpeedButton;
    SB26: TSpeedButton;
    ShapeBordoSogg: TShape;
    PanelGridSogg: TPanel;
    MenuGriglia: TPopupMenu;
    Selezionavista1: TMenuItem;
    Salvalavistaattuale1: TMenuItem;
    Ripristinacolonneeliminate1: TMenuItem;
    QrySoggettiEMAIL: TStringField;
    Panel5: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    QrySoggettiCELLULARE: TStringField;
    QrySoggettiSTATODESCRIZIONE: TStringField;
    QrySoggettiSTATOFOREGROUND: TStringField;
    QrySoggettiSTATOBACKGROUND: TStringField;
    QrySoggettiPARTITAIVA: TStringField;
    QrySoggettiCODICEFISCALE: TStringField;
    PanelFiltriSogg: TPanel;
    SubPanelFiltriSogg: TPanel;
    SBRubricaFilterOpenClose: TSpeedButtonRollOver;
    StaticText26: TStaticText;
    EditClientiCodice: TEdit;
    StaticText30: TStaticText;
    EditClientiRagSoc: TEdit;
    StaticText31: TStaticText;
    EditClientiCitta: TEdit;
    StaticText33: TStaticText;
    EditClientiProvincia: TEdit;
    StaticText35: TStaticText;
    TabLettera: TEdit;
    StaticText9: TStaticText;
    EditClientiPIVA: TEdit;
    StaticText54: TStaticText;
    EditClientiTelefono: TEdit;
    StaticText56: TStaticText;
    SoggStato: TcxComboBox;
    StaticText51: TStaticText;
    FilterRubricaTrova: TEdit;
    LabelFilterClientiAgente: TStaticText;
    EditClientiAgente: TcxComboBox;
    TransSoggCant: TIB_Transaction;
    QrySoggCant: TIBOQuery;
    QrySoggCantCODICE: TIntegerField;
    QrySoggCantDATAAPERTURA: TDateTimeField;
    QrySoggCantTIPOPRATICA: TStringField;
    QrySoggCantDESCRIZIONE: TStringField;
    QrySoggCantSTATODESCRIZIONE: TStringField;
    QrySoggCantCLIENTE: TIntegerField;
    QrySoggCantTIPO: TStringField;
    SourceSoggCant: TDataSource;
    TransSoggetti: TIB_Transaction;
    GridSogg: TcxGrid;
    tvRubrica: TcxGridDBTableView;
    tvRubricaCODICE: TcxGridDBColumn;
    tvRubricaRAGIONESOCIALE: TcxGridDBColumn;
    tvRubricaTELEFONO: TcxGridDBColumn;
    tvRubricaFAX: TcxGridDBColumn;
    tvRubricaINDIRIZZO: TcxGridDBColumn;
    tvRubricaCITTA: TcxGridDBColumn;
    tvRubricaCAP: TcxGridDBColumn;
    tvRubricaPROVINCIA: TcxGridDBColumn;
    tvRubricaDATANASCITA: TcxGridDBColumn;
    tvRubricaLUOGONASCITA: TcxGridDBColumn;
    tvRubricaCLIENTEFORNITORE: TcxGridDBColumn;
    tvRubricaCELLULARE: TcxGridDBColumn;
    tvRubricaSTATODESCRIZIONE: TcxGridDBColumn;
    tvRubricaSTATOFOREGROUND: TcxGridDBColumn;
    tvRubricaSTATOBACKGROUND: TcxGridDBColumn;
    tvRubricaPARTITAIVA: TcxGridDBColumn;
    tvRubricaCODICEFISCALE: TcxGridDBColumn;
    tvRubricaEMAIL: TcxGridDBColumn;
    tvRubricaPAGAM: TcxGridDBColumn;
    tvRubricaNOTE: TcxGridDBColumn;
    tvSoggCant: TcxGridDBTableView;
    tvSoggCantTIPOPRATICA: TcxGridDBColumn;
    tvSoggCantCODICE: TcxGridDBColumn;
    tvSoggCantDESCRIZIONE: TcxGridDBColumn;
    tvSoggCantDATAAPERTURA: TcxGridDBColumn;
    tvSoggCantSTATODESCRIZIONE: TcxGridDBColumn;
    tvSoggCantCLIENTE: TcxGridDBColumn;
    lvRubrica: TcxGridLevel;
    lvSoggCant: TcxGridLevel;
    LabelFilterClientiAgente2: TStaticText;
    EditClientiAgente2: TcxComboBox;
    LabelFilterClientiAgente3: TStaticText;
    EditClientiAgente3: TcxComboBox;
    LabelFilterClientiAgente4: TStaticText;
    EditClientiAgente4: TcxComboBox;
    QrySoggettiAGENTE: TStringField;
    QrySoggettiAGENTE2: TStringField;
    QrySoggettiAGENTE3: TStringField;
    QrySoggettiAGENTE4: TStringField;
    tvRubricaAGENTE: TcxGridDBColumn;
    tvRubricaAGENTE2: TcxGridDBColumn;
    tvRubricaAGENTE3: TcxGridDBColumn;
    tvRubricaAGENTE4: TcxGridDBColumn;
    TipoSoggetto: TcxComboBox;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure RxSpeedButtonResetQueryClick(Sender: TObject);
    procedure EseguiQueryClienti;
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SB1Click(Sender: TObject);
    procedure tvRubricaCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvRubricaKeyPress(Sender: TObject; var Key: Char);
    procedure tvRubricaDblClick(Sender: TObject);
    procedure ResetTabRubrica;
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvRubricaEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvRubricaDataControllerGroupingChanged(Sender: TObject);
    procedure tvRubricaDataControllerSortingChanged(Sender: TObject);
    procedure tvRubricaCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure MenuGrigliaPopup(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure Salvalavistaattuale1Click(Sender: TObject);
    procedure Ripristinacolonneeliminate1Click(Sender: TObject);
    procedure tvRubricaCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure tvRubricaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure PanelFiltriSoggResize(Sender: TObject);
    procedure SBRubricaFilterOpenCloseClick(Sender: TObject);
    procedure EditClientiCodiceKeyPress(Sender: TObject; var Key: Char);
    procedure SoggStatoPropertiesInitPopup(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tvSoggCantDblClick(Sender: TObject);
    procedure EditClientiAgentePropertiesEditValueChanged(Sender: TObject);
    procedure EditClientiAgente2PropertiesEditValueChanged(
      Sender: TObject);
    procedure EditClientiAgente3PropertiesEditValueChanged(
      Sender: TObject);
    procedure EditClientiAgentePropertiesInitPopup(Sender: TObject);
    procedure EditClientiAgente2PropertiesInitPopup(Sender: TObject);
    procedure EditClientiAgente3PropertiesInitPopup(Sender: TObject);
    procedure EditClientiAgente4PropertiesInitPopup(Sender: TObject);
    procedure TipoSoggettoPropertiesInitPopup(Sender: TObject);
  private
    { Private declarations }
    FCallerCode:Integer;
    procedure CaricaTitoli;
    procedure CaricaLayout;
  public
    { Public declarations }
       // Punta al componente Field in cui inserire il codice del cliente
       FieldCliente : TField;
       FieldCodPrat : TField;
       FieldDataPrat : TField;
       procedure RicalcolaDimensioni;
       property CallerCode:Integer read FCallerCode write FCallerCode;
  end;

var
  SelezioneClienteForm: TSelezioneClienteForm;

implementation

uses main, DataModule1, FormHelp, FormAnagCli,
  FormRappGiorn, Variants, SchedaClienti;

{$R *.DFM}



procedure TSelezioneClienteForm.CaricaLayout;
begin
  // Carica i titoli
  CaricaTitoli;
  // Rubrica
  LabelFilterClientiAgente.Visible   := (DM1.GridsColumnAgenteCaption <> '');
  LabelFilterClientiAgente2.Visible  := (DM1.GridsColumnAgente2Caption <> '');
  LabelFilterClientiAgente3.Visible  := (DM1.GridsColumnAgente3Caption <> '');
  LabelFilterClientiAgente4.Visible  := (DM1.GridsColumnAgente4Caption <> '');
  EditClientiAgente.Visible          := LabelFilterClientiAgente.Visible;
  EditClientiAgente2.Visible         := LabelFilterClientiAgente2.Visible;
  EditClientiAgente3.Visible         := LabelFilterClientiAgente3.Visible;
  EditClientiAgente4.Visible         := LabelFilterClientiAgente4.Visible;
end;

procedure TSelezioneClienteForm.CaricaTitoli;
begin
  // Impostazione caption colonne griglie e filtri relative agli agenti
  tvRubricaAGENTE.Caption            := DM1.GridsColumnAgenteCaption;
  tvRubricaAGENTE2.Caption           := DM1.GridsColumnAgente2Caption;
  tvRubricaAGENTE3.Caption           := DM1.GridsColumnAgente3Caption;
  tvRubricaAGENTE4.Caption           := DM1.GridsColumnAgente4Caption;

  // Impostazione etichette filtri agenti
  LabelFilterClientiAgente.Caption   := ' ' + DM1.GridsColumnAgenteCaption;
  LabelFilterClientiAgente2.Caption  := ' ' + DM1.GridsColumnAgente2Caption;
  LabelFilterClientiAgente3.Caption  := ' ' + DM1.GridsColumnAgente3Caption;
  LabelFilterClientiAgente4.Caption  := ' ' + DM1.GridsColumnAgente4Caption;
end;



procedure TSelezioneClienteForm.EseguiQueryClienti;
var
   i:Byte;
   Order:String;
begin
   //---------------------------------------------
   // In base alle condizioni di filtraggio inserite dall'utente costruisce
   //  il testo dell'interrogazione SQL.
   //---------------------------------------------
   // Chiude la query, la azzera e inserisce le prime righe
   QrySoggetti.Close;
   QrySoggetti.SQL.Clear;
   QrySoggetti.SQL.Add('SELECT C.Codice, C.RagioneSociale, CAST(COALESCE(C.Indirizzo, '''') || '' '' || COALESCE(C.NumCivico, '''') AS VARCHAR(120)) AS Indirizzo, C.Citta,');
   QrySoggetti.SQL.Add('  C.CAP, C.Provincia, C.DataNascita, C.LuogoNascita, C.Telefono, C.Fax, C.ClienteFornitore, C.Cellulare, C.STATODESCRIZIONE, C.STATOFOREGROUND, C.STATOBACKGROUND, C.PARTITAIVA, C.CODICEFISCALE, C.EMAIL, C.NOTE, C.AGENTE, C.AGENTE2, C.AGENTE3, C.AGENTE4,');
   QrySoggetti.SQL.Add('  CAST(P.DESCRIZIONE || ''   ('' || P.CODICE || '')'' AS VARCHAR(60)) AS PAGAM');
   QrySoggetti.SQL.Add('FROM Clienti C');
   QrySoggetti.SQL.Add('LEFT JOIN PAGAM P ON (P.CODICE = C.PAGAMENTO)');
   // In base al contenuto dei campi di filtraggio in fondo alla form costruisce
   //  le condizioni della query.
   DM1.AddSQL(QrySoggetti, 'AND', '(C.Codice <> 0)');
   if TipoSoggetto.Text <> ''         then DM1.AddSQL(QrySoggetti, 'AND', 'C.CLIENTEFORNITORE = ''' + TipoSoggetto.Text + '''');
   if EditClientiCodice.Text <> ''    then DM1.AddSQL(QrySoggetti, 'AND', 'C.Codice = ' + EditClientiCodice.Text);
   if EditClientiRagSoc.Text <> ''    then DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.RagioneSociale', EditClientiRagSoc.Text, True);
   if EditClientiCitta.Text <> ''     then DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.Citta', EditClientiCitta.Text, True);
   if EditClientiProvincia.Text <> '' then DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.Provincia', EditClientiProvincia.Text, True);
   if EditClientiPIVA.Text <> ''      then DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.PartitaIVA', EditClientiPIVA.Text, True);
   if EditClientiAgente.Text <> ''    then DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.AGENTE', EditClientiAgente.Text, True);
   if EditClientiAgente2.Text <> ''   then DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.AGENTE2', EditClientiAgente2.Text, True);
   if EditClientiAgente3.Text <> ''   then DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.AGENTE3', EditClientiAgente3.Text, True);
   if EditClientiAgente4.Text <> ''   then DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.AGENTE4', EditClientiAgente4.Text, True);
   if TabLettera.Text <> ''           then DM1.AddSQL(QrySoggetti, 'AND', 'UPPER(C.RagioneSociale) LIKE UPPER(''' + DM1.AddJollyChar(TabLettera.Text) + ''')');
   if SoggStato.Text <> ''            then DM1.AddSQL(QrySoggetti, 'AND', 'C.STATODESCRIZIONE = ''' + SoggStato.Text + '''');
   if EditClientiTelefono.Text <> ''  then begin
      DM1.AddSQL(QrySoggetti, 'AND', '((C.TELEFONO LIKE ''%' + EditClientiTelefono.Text + '%'') OR (C.CELLULARE LIKE ''%' + EditClientiTelefono.Text + '%'') OR (C.FAX LIKE ''%' + EditClientiTelefono.Text + '%''))');
   end;
   // Aggiunge la ricerca con campo TROVA
   if Trim(FilterRubricaTrova.Text) <> '' then begin
     DM1.AddSQL(QrySoggetti, 'AND', '(');
     DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.RagioneSociale', FilterRubricaTrova.Text, False);
     QrySoggetti.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.Indirizzo', FilterRubricaTrova.Text, False);
     QrySoggetti.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.Citta', FilterRubricaTrova.Text, False);
     QrySoggetti.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.Note', FilterRubricaTrova.Text, False);
     QrySoggetti.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QrySoggetti.SQL, 'C.AttivitaSvolta', FilterRubricaTrova.Text, False);
     QrySoggetti.SQL.Add(')');
   end;
   // Aggiunge alla query l'ORDER BY
   QrySoggetti.SQL.Add(DM1.GeneraOrderBy(tvRubrica));
   // Attiva la Query
   QrySoggetti.Open;
   // Apre anche la query che fornisce il detail dei cantieri/impianti
   if QrySoggCant.Active then QrySoggCant.Close;
   QrySoggCant.Open;
   // Si posizione all'inizio
   tvRubrica.DataController.GotoFirst;
end;


procedure TSelezioneClienteForm.FormCreate(Sender: TObject);
begin
   // Inizializzazione
   CallerCode := 0;
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Selezione soggetto)';
   // IMpostazione dell'altezza automatica articoli nel relativo elenco
   if not MainForm.ModoAssistenzeRDP then
     tvRubrica.OptionsView.CellAutoHeight := ClientiForm.tvRubrica.OptionsView.CellAutoHeight;
end;

procedure TSelezioneClienteForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      case key of

         // ESC
         27 : begin
            if RxSpeedButtonUscita.Enabled then begin
               RxSpeedButtonUscitaClick(Self);
            end;
         end;

         // F5 = Trova
         116: begin
            if RxSpeedButtonTrova.Enabled then begin
               RxSpeedButtonTrovaClick(Self);
            end;
         end;

         // F6 = Azzera condizioni ricerca
         117: begin
            if RxSpeedButtonResetQuery.Enabled then begin
               RxSpeedButtonResetQueryClick(Self);
            end;
         end;

         // F11
         122: begin
           if (ssShift in Shift)
             then SBRubricaFilterOpenCloseClick(SBRubricaFilterOpenClose)
           else if FilterRubricaTrova.Visible and FilterRubricaTrova.Enabled
             then FilterRubricaTrova.SetFocus;
         end;
      end;
end;

procedure TSelezioneClienteForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TSelezioneClienteForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     close;
end;

procedure TSelezioneClienteForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   EseguiQueryClienti;
   GridSogg.SetFocus;
   DM1.ChiudiAttendere;
end;

procedure TSelezioneClienteForm.RxSpeedButtonResetQueryClick(
  Sender: TObject);
begin
        FilterRubricaTrova.Text := '';
        ResetTabRubrica;
        TipoSoggetto.Properties.Items.Clear;
        TipoSoggetto.Text              := '';
        EditClientiCodice.Text         := '';
        EditClientiRagSoc.Text         := '';
        EditClientiCitta.Text          := '';
        EditClientiProvincia.Text      := '';
        EditClientiPIVA.Text           := '';
        EditClientiTelefono.Text       := '';
        EditClientiAgente.Text         := '';
        EditClientiAgente2.Text        := '';
        EditClientiAgente3.Text        := '';
        EditClientiAgente4.Text        := '';
        SoggSTATO.Text                 := '';
        TabLettera.Text                := '';
end;

procedure TSelezioneClienteForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('SOGGETTI');
end;

procedure TSelezioneClienteForm.FormShow(Sender: TObject);
begin
   inherited;
   DM1.FocusRefresh;
   // Carica il layout della form
   CaricaLayout;
   // Caricamento bitmaps pulsanti apertura/chiusura filtri
   ClientiForm.CloseFilterPanel(PanelFiltriSogg, SBRubricaFilterOpenClose, False);
   // Esegue sempre la query
   RxSpeedButtonTrovaClick(Self);
   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   // NB: Disabilitato la possibilità di aggiungere eliminare dall'interno del documento
   //      perchè dava dei problemi dovuti soprattutto al fatto che il documento e l'elenco
   //      sono su due transazioni differenti
//   if DM1.ModCtrl(MOD_CLIENTI) > 1 then begin
//      RxSpeedButtonNuovo.Enabled := True;
//      RxSpeedButtonElimina.Enabled := True;
//   end else begin
//      RxSpeedButtonNuovo.Enabled := False;
//      RxSpeedButtonElimina.Enabled := False;
//   end;
end;

procedure TSelezioneClienteForm.ResetTabRubrica;
var
   i:Integer;
   CS:TShape;
   CSB:TSpeedButton;
begin
   // Cicla per tutti i Tab delle lettere della rubrica e li disegna non selezionati
   for i := 1 to 26 do begin
      // CS punta allo shape corrente
      CS := FindComponent('Sh' + IntToStr(i)) as TShape;
      // CSB punta allo speedbutton della lettera selezionata
      CSB := FindComponent('SB' + IntToStr(i)) as TSpeedButton;
      // Il bordo stà sopra a tutto
      ShapeBordoSogg.BringToFront;
      // IMposta il tab come non selezionato
      CS.Pen.Color := $00828282;
      CS.Brush.Color := $007DBEFF;
      CS.Shape := stRoundRect;
      if CS.Tag = 1 then
      begin
         CS.Width := CS.Width - 2;
         CS.Height := CS.Height - 2;
         CS.Top := CS.Top + 1;
         CS.Left := CS.Left + 4;
         CSB.Left := CSB.Left + 2;
         CSB.Font.Color := $00383838;
         CSB.Font.Style := [];
      end;
      // Marca il tab corrente come non selezionato
      CS.Tag := 0;
   end;
end;

procedure TSelezioneClienteForm.SB1Click(Sender: TObject);
var
   CS:TShape;
   CSB:TSpeedButton;
begin
   // CS punta allo shape della lettera cliccata
   CS  := FindComponent('Sh' + IntToStr((Sender as TSpeedButton).Tag)) as TShape;
   // CSB punta allo speedbutton della lettera selezionata
   CSB := FindComponent('SB' + IntToStr((Sender as TSpeedButton).Tag)) as TSpeedButton;
   // Se la proprietà Tag dello shape è = 0 significa che il pulsante non era precedentemente selezionato
   //  e quindi provvede a visualizzarlo come selezionato
   if CS.Tag = 0 then begin
      // Imposta i filtro
      TabLettera.Text := (Sender as TSpeedButton).Caption + '%';
      // Visualizza disabilitati tutti i Tabs
      ResetTabRubrica;
      // Visualizza abilitato il Tab delle lettera cliccata
      CS.Pen.Color := clBlack;
      CS.Brush.Color := $00F0F0F0;
      CS.Shape := stRectangle;
      CS.Width := CS.Width + 2;
      CS.Height := CS.Height + 2;
      CS.Top := CS.Top - 1;
      CS.Left := CS.Left - 4;
      CSB.Left := CSB.Left - 2;
      CSB.Font.Color := clBlack;
      CSB.Font.Style := [fsBold];
      CS.BringToFront;
      CSB.BringToFront;
      // Lo marca come selezionato
      CS.Tag := 1;
   // Se invece arriva Quì (Tag = 1) significa che prima del click dell'utente la lettera era già selezionata
   //  e quindi la deseleziona
   end else begin
      // Svuota il filtro
      TabLettera.Text := '';
      // Visualizza disabilitati tutti i Tabs
      ResetTabRubrica;
   end;
   // Esegue subito la ricerca
   RxSpeedButtonTrovaClick(Self);
end;

procedure TSelezioneClienteForm.tvRubricaCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TSelezioneClienteForm.tvRubricaKeyPress(Sender: TObject;
  var Key: Char);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TSelezioneClienteForm.tvRubricaDblClick(Sender: TObject);
var
   TmpControl:TWinControl;
begin
   // Se non c'è alcun rigo selezionato non fa nulla
   if (tvRubrica.Controller.SelectedRecordCount = 0) or (tvRubrica.Controller.FocusedRecord = nil) or (not tvRubrica.Controller.FocusedRecord.IsData) then exit;
  // In base al codice del chiamante...
  case CallerCode of
    // Se non c'è il chiamante ma sono stati impostati direttamente i campi
    //  da aggiornare alla selezione di una pratica...
    0:
    begin
     // Effettua la selezione assegnando il codice della pratica selezionata  e la data
     //  ai campi appropriati puntati da 'FieldPratica' e 'FieldDataPratica'
     if Assigned(FieldCliente) then FieldCliente.Value := tvRubrica.Controller.FocusedRow.Values[tvRubrica.GetColumnByFieldName('CODICE').Index];
    end;
    // Se il chiamante è un rigo del rapporto giornaliero
    1:
    begin
      with RappGiornForm.tvOre.DataController do begin
        Values[FocusedRecordIndex, RappGiornForm.tvOreCODSOGGETTO.Index] := QrySoggettiCODICE.AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvOreDESCRIZSOGGETTO.Index] := QrySoggettiRAGIONESOCIALE.AsString;
      end;
    end;
    // Se il chiamante è un rigo del rapporto giornaliero (SPESE)
    2:
    begin
      with RappGiornForm.tvSpese.DataController do begin
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseCODSOGGETTO.Index] := QrySoggettiCODICE.AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseDESCRIZSOGGETTO.Index] := QrySoggettiRAGIONESOCIALE.AsString;
      end;
    end;
  end;
  // Chiude la form di selezione
  Close;
end;

procedure TSelezioneClienteForm.RxSpeedButtonVisualizzaClick(
  Sender: TObject);
begin
     // Se siamo su un record valido
     if (tvRubrica.Controller.FocusedRecord = nil) or (not tvRubrica.Controller.FocusedRecord.IsData) then Exit;
     // Se ci sono i permessi
     if (DM1.ModCtrl(MOD_CLIENTI) > 0) then begin
        // Visualizza l'anagrafica del soggetto
        DM1.VisualizzaCliente(tvRubrica.Controller.FocusedRow.Values[tvRubrica.GetColumnByFieldName('CODICE').Index]);
     end;
end;

procedure TSelezioneClienteForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   DM1.Attendere;
   Application.CreateForm(TAnagCliForm, AnagCliForm);
   AnagCliForm.Parent := MainForm;
   AnagCliForm.Tag := 2;
   AnagCliForm.Show;
   DM1.ChiudiAttendere;
end;

procedure TSelezioneClienteForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
   MessageBeep(0);
   tvRubrica.Controller.DeleteSelection;
end;

procedure TSelezioneClienteForm.RxSpeedButtonVisualizzaDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
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
            if (Name = 'tvRubrica')
            then accept := True;
         end;
      end;
   end;
end;

procedure TSelezioneClienteForm.tvRubricaEndDrag(Sender, Target: TObject;
  X, Y: Integer);
begin
   // Prima di tutto controlla che il bersaglio non sia nullo
   if Target <> nil then begin
      // In base al bersagio attiva la funzione corretta.
      if Target is TSpeedButton then begin
         TSpeedButton(Target).OnClick(Self);
      end;
   end;
end;

procedure TSelezioneClienteForm.tvRubricaDataControllerGroupingChanged(
  Sender: TObject);
begin
   // Se i dati sono raggruppati in qualche maniera abilita anche i bordi orizzontali
   //  altrimenti no
   if tvRubrica.GroupedColumnCount > 0 then tvRubrica.OptionsView.GridLines := glBoth else tvRubrica.OptionsView.GridLines := glVertical;
end;

procedure TSelezioneClienteForm.tvRubricaDataControllerSortingChanged(
  Sender: TObject);
begin
   // Fà rifare l'interrogazione con il nuovo ordinamento
   // NB: Solo se non c'è alcun raggruppamento
   if tvRubrica.DataController.DataModeController.GridMode and (tvRubrica.GroupedColumnCount = 0) then RxSpeedButtonTrovaClick(Self);
   tvRubrica.Controller.GoToFirst(False);
end;

procedure TSelezioneClienteForm.tvRubricaCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TSelezioneClienteForm.MenuGrigliaPopup(Sender: TObject);
var
   SearchRec:TSearchRec;
   TmpStr:String;
   CurrGrid:TcxGrid;
   CurrMenuItem:TMenuItem;
begin
   // ==========================================================================
   // Caricamento delle viste delle griglia attualmente visualizzata
   // --------------------------------------------------------------------------
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridSogg;
   // Svuota l'elenco delle viste
   Selezionavista1.Clear;
   // Aggiunge la voce di selezione di nessuna vista
   CurrMenuItem := TMenuItem.Create(Self);
   CurrMenuItem.Caption := 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)';
   CurrMenuItem.Name := 'NessunaVista';
   CurrMenuItem.OnClick := Selezionavista1Click;
   Selezionavista1.Add(CurrMenuItem);
   // Prima di tutto controlla che la cartella esista
   if DirectoryExists(DM1.ImpGridsDir) then begin
      // Poi cerca il primo file
      if FindFirst(DM1.ImpGridsDir + CurrGrid.Name + '___*.ini', faAnyFile, SearchRec) = 0 then begin
         // Se lo trova inserisce il nome della vista nell'elenco
         TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name)-Length(CurrGrid.Name)-3);
         CurrMenuItem := TMenuItem.Create(Self);
         CurrMenuItem.Caption := LeftStr(TmpStr, Length(TmpStr)-4);
         CurrMenuItem.OnClick := Selezionavista1Click;
         Selezionavista1.Add(CurrMenuItem);
         // Trova anche gli eventuali altri files dello stesso tipo
         while (FindNext(SearchRec) = 0) do begin
            // Se lo trova inserisce il nome della vista nell'elenco
            TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name)-Length(CurrGrid.Name)-3);
            CurrMenuItem := TMenuItem.Create(Self);
            CurrMenuItem.Caption := LeftStr(TmpStr, Length(TmpStr)-4);
            CurrMenuItem.OnClick := Selezionavista1Click;
            Selezionavista1.Add(CurrMenuItem);
         end;
      end;
      // Distrugge SearchRec
      FindClose(SearchRec);
   end;
   // ==========================================================================
end;

procedure TSelezioneClienteForm.Selezionavista1Click(Sender: TObject);
var
   CurrGrid:TcxGrid;
   CurrItemCaption:String;
begin
   // Caption della voce selezionata
   CurrItemCaption := (Sender as TMenuItem).Caption;
   CurrItemCaption := RightStr(CurrItemCaption, Length(CurrItemCaption)-1);  // Elimina la & che mi ritrovo all'inizio
   // Se la voce attuale è la radice del menu di selezione viste esce subito
   if (Sender as TMenuItem).Name = 'Selezionavista1' then Exit;
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridSogg;
   // Carica la vista attuale
   DM1.RipristinaDevExpress(CurrGrid, CurrItemCaption, False);
end;

procedure TSelezioneClienteForm.Salvalavistaattuale1Click(Sender: TObject);
var
   Vista:String;
begin
      // Chiede il nome della vista
      if InputQuery('Salvataggio vista', 'Con quale nome devo salvare la vista?', Vista) then begin
         // Controlla che la vista non sia nullo
         if Trim(Vista) = '' then raise Exception.Create('Il nome della vista non può essere vuoto.');
      end else begin
         // Se l'utente ha cliccato su Cancel annulla l'operazione
         Exit;
      end;
      // Salva le impostazioni delle colonne dei clienti
      DM1.SalvaGriglieDevExpress(GridSogg, Vista, False);
end;

procedure TSelezioneClienteForm.Ripristinacolonneeliminate1Click(
  Sender: TObject);
begin
   tvRubrica.Controller.Customization := True
end;

procedure TSelezioneClienteForm.tvRubricaCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TSelezioneClienteForm.tvRubricaCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  // Solo se non è selezionata
  if not AViewInfo.Selected then begin
    // IMposta il colore del Font in base allo stato del documento
    if  (not VarIsNull(AViewInfo.GridRecord.Values[tvRubrica.GetColumnByFieldName('STATODESCRIZIONE').Index]))
    and (not VarIsNull(AViewInfo.GridRecord.Values[tvRubrica.GetColumnByFieldName('STATOFOREGROUND').Index]))
    then begin
      ACanvas.Font.Color := DM1.StrToColor(AViewInfo.GridRecord.Values[tvRubrica.GetColumnByFieldName('STATOFOREGROUND').Index], ACanvas.Font.Color);
    end;
  end;
end;

procedure TSelezioneClienteForm.PanelFiltriSoggResize(Sender: TObject);
begin
  ClientiForm.CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TSelezioneClienteForm.SBRubricaFilterOpenCloseClick(
  Sender: TObject);
begin
  if PanelFiltriSogg.Tag = 1
  then ClientiForm.CloseFilterPanel(PanelFiltriSogg, SBRubricaFilterOpenClose)
  else ClientiForm.OpenFilterPanel(PanelFiltriSogg, SBRubricaFilterOpenClose);
end;

procedure TSelezioneClienteForm.EditClientiCodiceKeyPress(Sender: TObject;
  var Key: Char);
begin
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then RxSpeedButtonTrovaClick(Self);
end;

procedure TSelezioneClienteForm.RicalcolaDimensioni;
const
   LEFT_BORDER                  = 16;
   RIGHT_BORDER                 = 16;
   TOP_BORDER                   = 84;
   BOTTOM_BORDER                = 5;
begin
   // Imposta le dimensioni
   ClientArea.Left    := LEFT_BORDER;
   ClientArea.Top     := TOP_BORDER;
   ClientArea.Width   := Self.Width - LEFT_BORDER - RIGHT_BORDER;
   ClientArea.Height  := Self.Height - TOP_BORDER - BOTTOM_BORDER;
   // NB: Da quando c'è la modalità AssistenzeRDP ho dovuto aggiungere
   //      le righe qui sotto altrimenti la selezione del cliente
   //      vniva visualizzata male
   GridSogg.Width := PanelGridSogg.ClientWidth;
   GridSogg.Height := PanelGridSogg.ClientHeight - PanelFiltriSogg.Height;
   PanelFiltriSogg.Top := PanelGridSogg.ClientHeight - PanelFiltriSogg.Height;
end;



procedure TSelezioneClienteForm.SoggStatoPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DESCRIZIONE FROM STATI WHERE TIPODOCUMENTO=''Soggetti''');
      Qry.Open;
      (Sender as TcxComboBox).Properties.Items.Clear;
      (Sender as TcxComboBox).Properties.Items.Add('');
      while not Qry.Eof do begin
         (Sender as TcxComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TSelezioneClienteForm.FormResize(Sender: TObject);
begin
  // Ricalcola le dimensioni dei pannelli
  RicalcolaDimensioni;
end;

procedure TSelezioneClienteForm.tvSoggCantDblClick(Sender: TObject);
var
   TmpControl:TWinControl;
   V: TcxGridDBTableView;
   CodCli: Integer;
begin
  // V Punta al dettaglio che attualmente ha il focus
  V := (GridSogg.FocusedView as TcxGridDBTableView);
  // Ricava il codice cliente dal record Master relativo.
  CodCli := 0;
  if not VarIsNull(V.MasterGridRecord.Values[tvRubricaCODICE.Index])
    then CodCli := V.MasterGridRecord.Values[tvRubricaCODICE.Index];
  // Se non c'è alcun rigo selezionato non fa nulla
  if (V.Controller.SelectedRecordCount = 0) or (V.Controller.FocusedRecord = nil) or (not V.Controller.FocusedRecord.IsData) then exit;
  // In base al codice del chiamante...
  case CallerCode of
    // Se non c'è il chiamante ma sono stati impostati direttamente i campi
    //  da aggiornare alla selezione di una pratica...
    0:
    begin
     // Effettua la selezione assegnando il codice della pratica selezionata  e la data
     //  ai campi appropriati puntati da 'FieldPratica' e 'FieldDataPratica'
     if Assigned(FieldCliente)  then FieldCliente.Value  := CodCli;
     if Assigned(FieldDataPrat) then FieldDataPrat.Value := V.Controller.FocusedRow.Values[V.GetColumnByFieldName('DATAAPERTURA').Index];
     if Assigned(FieldCodPrat)  then FieldCodPrat.Value  := V.Controller.FocusedRow.Values[V.GetColumnByFieldName('CODICE').Index];
    end;
  end;
  // Chiude la form di selezione
  Close;
end;

procedure TSelezioneClienteForm.EditClientiAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(1, EditClientiAgente2);
end;

procedure TSelezioneClienteForm.EditClientiAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(2, EditClientiAgente3);
end;

procedure TSelezioneClienteForm.EditClientiAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(3, EditClientiAgente4);
end;

procedure TSelezioneClienteForm.EditClientiAgentePropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(EditClientiAgente.Properties.Items, 1, '');
end;

procedure TSelezioneClienteForm.EditClientiAgente2PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(EditClientiAgente2.Properties.Items, 2, EditClientiAgente.Text);
end;

procedure TSelezioneClienteForm.EditClientiAgente3PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(EditClientiAgente3.Properties.Items, 3, EditClientiAgente2.Text);
end;

procedure TSelezioneClienteForm.EditClientiAgente4PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(EditClientiAgente4.Properties.Items, 4, EditClientiAgente3.Text);
end;

procedure TSelezioneClienteForm.TipoSoggettoPropertiesInitPopup(
  Sender: TObject);
var
   LO: TMemIniFile;
   TmpStr: String;
begin
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try
     with Sender as  TcxComboBox do begin
       Properties.Items.Clear;
       Properties.Items.Add('');
       TmpStr := LO.ReadString('FormAnagraficaClienti', 'TipoSoggetto', 'Soggetto');
       while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do begin
          Properties.Items.Add(DM1.RitornaTestoPrimaDi('_', TmpStr, True));
       end;
     end;
   finally
     LO.Free;
   end;
end;

end.

