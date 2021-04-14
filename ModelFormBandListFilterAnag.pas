unit ModelFormBandListFilterAnag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevante, ExtCtrls, bmpPanel, cxStyles,
  cxGraphics, cxFilter, cxEdit, DB,
  cxDBData, cxImageComboBox, cxTextEdit, cxCheckBox, cxCalendar,
  cxCurrencyEdit, cxMemo, cxCheckComboBox, StdCtrls, cxContainer,
  cxMaskEdit, cxDropDownEdit, CheckLst, MAURI_SB, Buttons,
  cxGridLevel, cxGridDBTableView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, IBODataset, Menus, cxCustomData, cxData,
  cxDataStorage, cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters,
  cxNavigator, dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations;

type
  TDblClickMode = (DblClickModeArchive, DblClickModeSelection);

  TBandListFilterAnagFormModel = class(TLevanteForm)
    MainPageControl: TcxPageControl;
    TabElenco: TcxTabSheet;
    PanelList: TPanel;
    GridList: TcxGrid;
    btvList: TcxGridDBBandedTableView;
    lvList: TcxGridLevel;
    PanelFiltri: TPanel;
    SubPanelFiltri: TPanel;
    PanelSelezioneColonne: TPanel;
    SubPanelSelezioneColonne: TPanel;
    Label2: TLabel;
    Shape1: TShape;
    SbGcVisMem1: TSpeedButton;
    SbGcVisMem4: TSpeedButton;
    SbGcVisMem2: TSpeedButton;
    SbGcVisMem5: TSpeedButton;
    SbGcVisMem3: TSpeedButton;
    SbGcVisMemAdd: TSpeedButton;
    Label3: TLabel;
    SbGcVisMem6: TSpeedButton;
    SbGcVisMem7: TSpeedButton;
    SbGcVisMem8: TSpeedButton;
    SbGcVisMem9: TSpeedButton;
    SbGcVisMem10: TSpeedButton;
    SbGcVisMemSetPredef: TSpeedButton;
    TabScheda: TcxTabSheet;
    Q: TIBOQuery;
    DS: TDataSource;
    ClientAreaScheda: TScrollBox;
    procedure PanelSelezioneColonneResize(Sender: TObject);
    procedure PanelFiltriResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainPageControlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonEliminaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvListCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvListEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure btvListKeyPress(Sender: TObject; var Key: Char);
    procedure btvListDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);

    procedure RxSpeedButtonUscitaClick(Sender: TObject); virtual;
    procedure RxSpeedModificaClick(Sender: TObject); virtual;
    procedure RxSpeedButtonNuovoClick(Sender: TObject); virtual;
    procedure RxSpeedButtonEliminaClick(Sender: TObject); virtual;
    procedure RxSpeedButtonTrovaClick(Sender: TObject); virtual;
    procedure RxSpeedButtonResetQueryClick(Sender: TObject); virtual;
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject); virtual;

  private
    { Private declarations }
    // Campi che mantengono la configurazione iniziale dei pulsanti (quando è in lista)
    //  in modo da ripristinarla quando si ritorna alla lista stessa
    PrecSpeedButtonUscitaEnabled,
    PrecSpeedButtonHelpEnabled,
    PrecSpeedModificaEnabled,
    PrecSpeedButtonNuovoEnabled,
    PrecSpeedButtonEliminaEnabled,
    PrecSpeedButtonTrovaEnabled,
    PrecSpeedButtonResetQueryEnabled,
    PrecSpeedButtonStampaEnabled,
    PrecSpeedButtonFaxEnabled,
    PrecSpeedButtonMailEnabled,
    PrecSpeedButtonVisualizzaEnabled: Boolean;
    FCallerCode: Integer;
  protected
    procedure CalcolaLeftFiltriSubPanel(PanelFiltriMain: TPanel);
    procedure EseguiQuery; virtual;
  public
    { Public declarations }
    DblClickMode: TDblClickMode;
    property CallerCode:Integer read FCallerCode write FCallerCode;
  end;

var
  BandListFilterAnagFormModel: TBandListFilterAnagFormModel;

implementation

uses main, DataModule1;

{$R *.dfm}



procedure TBandListFilterAnagFormModel.EseguiQuery;
begin
   // Esegue la query
   if Q.Active then Q.Close;
   if not Q.Prepared then Q.Prepare;
   Q.Open;
end;


procedure TBandListFilterAnagFormModel.CalcolaLeftFiltriSubPanel(PanelFiltriMain:TPanel);
var
  WidthDiff: Integer;
  FiltriSubPanel: TPanel;
begin
  // Ricava il SubPanel da centrare
  FiltriSubPanel := PanelFiltriMain.Controls[0] as TPanel;
  // Calcolo della posizione del SubPanel
  WidthDiff := PanelFiltriMain.Width - FiltriSubPanel.Width;
  FiltriSubPanel.Left := Trunc(WidthDiff/2);
  if FiltriSubPanel.Left < 0 then FiltriSubPanel.Left := 0;
  PanelFiltriMain.Update;
  Application.ProcessMessages;
end;


procedure TBandListFilterAnagFormModel.PanelSelezioneColonneResize(
  Sender: TObject);
begin
  inherited;
  // Calcola la posizione del FilterSubPanel in modo che rimanga sempre al centro orizzontale della form
  CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TBandListFilterAnagFormModel.PanelFiltriResize(
  Sender: TObject);
begin
  inherited;
  // Calcola la posizione del FilterSubPanel in modo che rimanga sempre al centro orizzontale della form
  CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TBandListFilterAnagFormModel.FormCreate(Sender: TObject);
begin
  // Eredita
  inherited;
  // Salva lo stato del pulsanti per poi ripristinarli quando serve
  PrecSpeedButtonUscitaEnabled      := RxSpeedButtonUscita.Enabled;
  PrecSpeedButtonHelpEnabled        := RxSpeedButtonHelp.Enabled;
  PrecSpeedModificaEnabled          := RxSpeedModifica.Enabled;
  PrecSpeedButtonNuovoEnabled       := RxSpeedButtonNuovo.Enabled;
  PrecSpeedButtonEliminaEnabled     := RxSpeedButtonElimina.Enabled;
  PrecSpeedButtonTrovaEnabled       := RxSpeedButtonTrova.Enabled;
  PrecSpeedButtonResetQueryEnabled  := RxSpeedButtonResetQuery.Enabled;
  PrecSpeedButtonStampaEnabled      := RxSpeedButtonStampa.Enabled;
  PrecSpeedButtonFaxEnabled         := RxSpeedButtonFax.Enabled;
  PrecSpeedButtonMailEnabled        := RxSpeedButtonMail.Enabled;
  PrecSpeedButtonVisualizzaEnabled  := RxSpeedButtonVisualizza.Enabled;
  // Inizializzazione
  DblClickMode := DblClickModeArchive;
  CallerCode := 0;
  ClientAreaScheda.Color := clWhite;
  // I Tabs non devono essere mai visibili
  MainPageControl.HideTabs := True;
  // Si mette sulla pagina dell'elenco
  MainPageControl.ActivePage := TabElenco;
  // ==========================================================================
  //  NB: Queste righe l'ho messa perchè penso che questo tipo di form
  //       verrà usato solo per form che fanno parte delle impostazioni
  // --------------------------------------------------------------------------
  // Carica l'icona del tipo documento visualizzato
  MainForm.SalvaIconaDocTipo;
  MainForm.CaricaIconaDocTipo('Impostazioni');
  // Blocca l'aggiornamento dell'IconaDocTipo
  MainForm.BloccaIconaDocTipo(True, Name);
  // ==========================================================================
end;

procedure TBandListFilterAnagFormModel.RxSpeedButtonUscitaClick(
  Sender: TObject);
begin
   // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
   if MainPageControl.ActivePage = TabElenco then begin
      inherited;
   // Altrimenti se è nell'anagrafica torna alla lista
   end else begin
     MainPageControl.ActivePage := TabElenco;
   end;
end;

procedure TBandListFilterAnagFormModel.MainPageControlChange(
  Sender: TObject);
begin
  inherited;
  // Se la pagina attuale è quella della lista
  if          (MainPageControl.ActivePage = TabElenco) then begin
    // Ripristina lo stato del pulsanti salvata nell'evento onShow
    RxSpeedButtonUscita.Enabled     := PrecSpeedButtonUscitaEnabled;
    RxSpeedButtonHelp.Enabled       := PrecSpeedButtonHelpEnabled;
    RxSpeedModifica.Enabled         := PrecSpeedModificaEnabled;
    RxSpeedButtonNuovo.Enabled      := PrecSpeedButtonNuovoEnabled;
    RxSpeedButtonElimina.Enabled    := PrecSpeedButtonEliminaEnabled;
    RxSpeedButtonTrova.Enabled      := PrecSpeedButtonTrovaEnabled;
    RxSpeedButtonResetQuery.Enabled := PrecSpeedButtonResetQueryEnabled;
    RxSpeedButtonStampa.Enabled     := PrecSpeedButtonStampaEnabled;
    RxSpeedButtonFax.Enabled        := PrecSpeedButtonFaxEnabled;
    RxSpeedButtonMail.Enabled       := PrecSpeedButtonMailEnabled;
    RxSpeedButtonVisualizza.Enabled := PrecSpeedButtonVisualizzaEnabled;
  // Se la pagina attuale è quella della scheda anagrafica
  end else if (MainPageControl.ActivePage = TabScheda) then begin
    // Adatta lo stato dei pulsanti alla scheda anagrafica
    RxSpeedButtonUscita.Enabled     := True;
    RxSpeedButtonHelp.Enabled       := True;
    RxSpeedModifica.Enabled         := True;
    RxSpeedButtonNuovo.Enabled      := False;
    RxSpeedButtonElimina.Enabled    := False;
    RxSpeedButtonTrova.Enabled      := False;
    RxSpeedButtonResetQuery.Enabled := False;
    RxSpeedButtonStampa.Enabled     := False;
    RxSpeedButtonFax.Enabled        := False;
    RxSpeedButtonMail.Enabled       := False;
    RxSpeedButtonVisualizza.Enabled := False;
  end;
end;

procedure TBandListFilterAnagFormModel.FormShow(Sender: TObject);
begin
  inherited;
  // Apre la Query per il reperimento dei dati
  RxSpeedButtonTrovaClick(Self);
end;

procedure TBandListFilterAnagFormModel.RxSpeedModificaClick(
  Sender: TObject);
var
   MR:TModalResult;
begin
  inherited;

     // Se la query non è attiva esce
     if not Q.Active then begin
        RxSpeedModifica.Down := False;
        Exit;
     end;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     if RxSpeedModifica.Down then begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          Q.Edit;
          RxSpeedButtonUscita.Enabled    := False;
          DM1.ColoraTuttiCampi(Self, COLOR_MODIFICA);
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end else begin
        // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Disabilita la modifica dei campi
          Q.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               Q.Post;
               Q.CommitUpdates;
          end else if MR = mrNo then begin
               Q.Cancel;
               Q.CommitUpdates;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;

          RxSpeedButtonUscita.Enabled := True;
          DM1.ColoraTuttiCampi(Self, COLOR_NORMALE);
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               Q.Edit;
          end;
       end;
     end;
end;

procedure TBandListFilterAnagFormModel.RxSpeedButtonNuovoClick(
  Sender: TObject);
begin
  inherited;
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);
   // Effettua l'Append del nuovo revord
   Q.Append;
   // Pone la form in modalità di modifica sul nuovo record
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TBandListFilterAnagFormModel.RxSpeedButtonEliminaClick(
  Sender: TObject);
begin
  inherited;
  // Chiede conferma
  if DM1.Messaggi('Elimina', 'Eliminare le voci selezionate?', '', [mbYes,mbNo], 0, nil) = mrYes then
  begin
    btvList.Controller.DeleteSelection;
  end;
end;

procedure TBandListFilterAnagFormModel.RxSpeedButtonEliminaDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
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
        if (Name = 'btvList')
        then accept := True;
      end;
    end;
  end;
end;

procedure TBandListFilterAnagFormModel.RxSpeedButtonTrovaClick(
  Sender: TObject);
begin
  inherited;
  DM1.Attendere;
  try
    EseguiQuery;
    GridList.SetFocus;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TBandListFilterAnagFormModel.RxSpeedButtonResetQueryClick(
  Sender: TObject);
begin
  inherited;
  // Azzera i filtri della griglia
  btvList.DataController.Filter.Clear;
end;

procedure TBandListFilterAnagFormModel.RxSpeedButtonVisualizzaClick(
  Sender: TObject);
begin
  inherited;
  // Aggiorna l'aspetto della form per farla passare alla modalità Anagrafica
  // ------------------------------------------------------------------------
  MainPageControl.ActivePage := TabScheda;
  MainPageControlChange(MainPageControl);
end;

procedure TBandListFilterAnagFormModel.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   case key of
      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

      // F2 = Modifica
      113: begin
         if RxSpeedModifica.Enabled then begin
            RxSpeedModifica.Down := not RxSpeedModifica.Down;
            RxSpeedModificaClick(Self);
         end;
      end;

      // F3 = Nuovo
      114: begin
         if RxSpeedButtonNuovo.Enabled then begin
            RxSpeedButtonNuovo.Down := not RxSpeedButtonNuovo.Down;
            RxSpeedButtonNuovoClick(Self);
         end;
      end;

      // F4 = Elimina
      115: begin
         if RxSpeedButtonElimina.Enabled then begin
            RxSpeedButtonElimina.Down := not RxSpeedButtonElimina.Down;
            RxSpeedButtonEliminaClick(Self);
         end;
      end;
   end;
end;

procedure TBandListFilterAnagFormModel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   //  NB: Questa riga l'ho messa perchè penso che questo tipo di form
   //       verrà usato solo per form che fanno parte delle impostazioni
   // CMQ: non dovrebbe dare problemi in ogni caso
   MainForm.SBImpostazioni.Down := False;
end;

procedure TBandListFilterAnagFormModel.btvListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Se il rigo del filtro (FilterRow) usa il colore specificato appositamente
  //  in ogni caso, anche se è il rigo selezionato che mi piace di più
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then begin
    ACanvas.Brush.Color := (Sender as TcxGridDBBandedTableView).Styles.FilterRowInfoText.Color;
    Exit;
  end;
end;

procedure TBandListFilterAnagFormModel.btvListCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TBandListFilterAnagFormModel.btvListEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
  inherited;
   // Prima di tutto controlla che il bersaglio non sia nullo
   if Target <> nil then begin
      // In base al bersagio attiva la funzione corretta.
      if Target is TSpeedButton then begin
         TSpeedButton(Target).OnClick(Self);
      end;
   end;
end;

procedure TBandListFilterAnagFormModel.btvListKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TBandListFilterAnagFormModel.btvListDblClick(Sender: TObject);
begin
  inherited;
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   // Se la proprietà Tag della form = 0 apre la voce per default
   if Self.DblClickMode = DblClickModeArchive then begin
     RxSpeedButtonVisualizzaClick(Self);
     Exit;
   end;
end;

procedure TBandListFilterAnagFormModel.FormResize(Sender: TObject);
begin
  inherited;
  // IMposta la posizione della client area e i relativi margini
  MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, False);
  // ClientAreaSchema
  ClientAreaScheda.Left := Trunc((ClientArea.ClientWidth - ClientAreaScheda.Width) / 2);
  if ClientAreaScheda.Left < 0 then ClientAreaScheda.Left := 0;
end;

end.
