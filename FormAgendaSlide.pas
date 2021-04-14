unit FormAgendaSlide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxStyles, cxGraphics, cxEdit, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView,
  cxSchedulerDateNavigator, cxSchedulerUtils,
  cxControls, cxPC,
  cxSchedulerDBStorage, DB, IBODataset, IB_Components, cxSplitter,
  ExtCtrls, Buttons, MAURI_SB, dxPSGlbl, dxPSUtl, 
  dxBkgnd, dxWrap, dxPrnDev, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxCommon,
  cxLookAndFeelPainters, cxPCPainters, cxPCPaintersFactory,
  cxCustomData, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridCustomView, cxClasses,
  cxGridLevel, cxGrid, cxTextEdit, ImgList, cxImageComboBox, cxContainer,
  cxLabel, cxCalendar, cxSchedulerTimeGridView, cxSchedulerWeekView,
  cxSchedulerYearView, cxFilter, cxData, cxDataStorage, dxPSEngn, dxPrnPg,
  dxPSCompsProvider, cxPCdxBarPopupMenu, cxLookAndFeels,
  cxSchedulerHolidays, cxSchedulerGanttView, cxSchedulerTreeListBrowser,
  cxNavigator, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, Vcl.StdCtrls, dxBarBuiltInMenu,
  cxSchedulerAgendaView, cxSchedulerRecurrence,
  cxSchedulerRibbonStyleEventEditor, dxDateRanges, dxScrollbarAnnotations,
  System.ImageList, cxImageList;

const
  TAB_COLOR_NORMAL = $00F3F3F3;
  TAB_COLOR_HIGHLIGHT = $00D8D8D8;

type

  // ===========================================================================
  // Questa è una classe che ho creato per modificare l'apparenza a video
  //  del TabControl per la selezione dei tecnici dell'agenza.
  // ---------------------------------------------------------------------------
  TMyPainter = class(TcxPCButtonsPainter)
  protected
    function GetFreeSpaceColor: TColor; override;
    function GetTabBodyColor(TabVisibleIndex: Integer): TColor; override;
    procedure PaintTabShape(ACanvas: TcxCanvas; TabVisibleIndex: Integer); override;
  public
    class function GetStyleID: TcxPCStyleID; override;
    class function GetStyleName: TCaption; override;
  end;
  // ===========================================================================

  // Definisce  la modalità per la stampa
  TAgendaPrintMode = (apmPreview, apmPrint, apmEmail);

  TAgendaSlideForm = class(TForm)
    MainPageControl: TcxPageControl;
    TabAgenda: TcxTabSheet;
    sbTecnici_Tutti: TSpeedButtonRollOver;
    sbTecnici_Mem1: TSpeedButtonRollOver;
    sbTecnici_Mem2: TSpeedButtonRollOver;
    sbTecnici_Mem3: TSpeedButtonRollOver;
    sbTecnici_Mem4: TSpeedButtonRollOver;
    sbTecnici_MemSet: TSpeedButtonRollOver;
    Agenda_FastSelectionMode: TcxScheduler;
    PanelbuttonRefresh: TPanel;
    sbAgenda_Refresh: TSpeedButtonRollOver;
    PanelbuttonRefreshSmall: TPanel;
    sbAgenda_RefreshSmall: TSpeedButtonRollOver;
    TabControlTecnici: TcxTabControl;
    TransAgenda: TIB_Transaction;
    SourceAgenda: TDataSource;
    SourceTecnici: TDataSource;
    cxSchedulerDBStorage1: TcxSchedulerDBStorage;
    AgendaStyleRepository: TcxStyleRepository;
    AgendaStyle_TimeRuler: TcxStyle;
    AgendaStyle_Event: TcxStyle;
    AgendaStyle_Selection: TcxStyle;
    AgendaStyle_DayHeader: TcxStyle;
    AgendaStyle_ResourceHeader: TcxStyle;
    AgendaStyle_ContentWorkingTime: TcxStyle;
    AgendaStyle_ContentNonWorkingTime: TcxStyle;
    dxPrinter: TdxComponentPrinter;
    AgendaLink: TcxSchedulerReportLink;
    MenuAgenda: TPopupMenu;
    Selezionavista1: TMenuItem;
    Salvaimpostazionicolonne1: TMenuItem;
    TimerAggiornaTecniciDalTab: TTimer;
    TimerMemorie: TTimer;
    TabTasks: TcxTabSheet;
    lvTasks: TcxGridLevel;
    GridTasks: TcxGrid;
    btvTasks: TcxGridBandedTableView;
    btvTasks_ID: TcxGridBandedColumn;
    btvTasks_Title: TcxGridBandedColumn;
    btvTasks_Notes: TcxGridBandedColumn;
    btvTasks_Completed: TcxGridBandedColumn;
    btvTasks_DueDate: TcxGridBandedColumn;
    btvTasks_ListID: TcxGridBandedColumn;
    btvTasks_ListTitle: TcxGridBandedColumn;
    PanelButtonTaskRefresh: TPanel;
    sbTasksRefresh: TSpeedButtonRollOver;
    TaskStyleRepository: TcxStyleRepository;
    TaskBandTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    TaskBandStyle_Content: TcxStyle;
    TaskBandStyle_ContentTaskTitle: TcxStyle;
    TaskBandStyle_Background: TcxStyle;
    TaskBandStyle_GroupRow: TcxStyle;
    TasksImageList: TcxImageList;
    TaskBandStyle_Selection: TcxStyle;
    LabelTaskMainTitle: TcxLabel;
    TabsmageList: TcxImageList;
    AgendaStyle_HeaderContainer: TcxStyle;
    TimerResizeSelection: TTimer;
    QryAgenda: TIBOQuery;
    QryTecnici: TIBOQuery;
    TimerLayoutChanged: TTimer;
    procedure EliminaEventiSelezionati;
    procedure Agenda_FastSelectionModeDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure Agenda_FastSelectionModeDblClick(Sender: TObject);
    procedure VisualizzaEventoSelezionato;
    procedure CreaNuovoAppuntamento;
    procedure EseguiQueryAgenda;
    procedure Agenda_FastSelectionModeDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure CreaNuovoAppuntamentoDragDrop;
    procedure Agenda_FastSelectionModeStylesGetContentStyle(
      Sender: TObject; AResource: TcxSchedulerStorageResourceItem;
      const ADateTime: TDateTime; var AStyle: TcxStyle);
    procedure Agenda_FastSelectionModeCustomDrawDayHeader(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxSchedulerDayHeaderCellViewInfo;
      var ADone: Boolean);
    procedure Agenda_FastSelectionModeCustomDrawResourceHeader(
      Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxSchedulerHeaderCellViewInfo; var ADone: Boolean);
    procedure sbAgenda_RefreshClick(Sender: TObject);
    procedure Agenda_FastSelectionModeInitEventImages(
      Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent;
      AImages: TcxSchedulerEventImages);
    procedure Agenda_FastSelectionModeViewTypeChanged(Sender: TObject;
      APrevView, ANewView: TcxSchedulerCustomView);
    procedure Salvaimpostazionicolonne1Click(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure MenuAgendaPopup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Agenda_FastSelectionModeLayoutChanged(Sender: TObject);
    procedure TimerAggiornaTecniciDalTabTimer(Sender: TObject);
    procedure TabControlTecniciMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbTecnici_TuttiClick(Sender: TObject);
    procedure sbTecnici_MemSetClick(Sender: TObject);
    procedure TimerMemorieTimer(Sender: TObject);
    procedure sbTecnici_Mem1Click(Sender: TObject);
    procedure sbTasksRefreshClick(Sender: TObject);
    procedure btvTasksCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvTasks_CompletedCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure MainPageControlChange(Sender: TObject);
    procedure btvTasksDblClick(Sender: TObject);
    procedure btvTasks_NotesGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure cxSchedulerDBStorage1EventDeleted(Sender: TObject;
      AEvent: TcxSchedulerEvent; var AHandled: Boolean);
    procedure cxSchedulerDBStorage1EventModified(Sender: TObject;
      AEvent: TcxSchedulerEvent; var AHandled: Boolean);
    procedure Agenda_FastSelectionModeSelectionChanged(Sender: TObject);
    procedure TimerResizeSelectionTimer(Sender: TObject);
    procedure Agenda_FastSelectionModeResize(Sender: TObject);
    procedure QryAgendaBeforePost(DataSet: TDataSet);
    procedure QryAgendaBeforeDelete(DataSet: TDataSet);
    procedure Agenda_FastSelectionModeIsWorkTime(Sender: TObject;
      AResource: TcxSchedulerStorageResourceItem; const ATime: TDateTime;
      var AIsWork: Boolean);
    procedure Agenda_FastSelectionModeCustomDrawEvent(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxSchedulerEventCellViewInfo;
      var ADone: Boolean);
    procedure TimerLayoutChangedTimer(Sender: TObject);
    procedure Agenda_FastSelectionModeEventSelectionChanged(Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent);
  private
    fSplitter: TcxSplitter;
    fEventID: Variant;
    procedure SetSplitter(const Value: TcxSplitter);
    procedure SplitterAgendaMoved(Sender: TObject);
    procedure SplitterAgendaAfterClose(Sender: TObject);
    procedure ChiudiQueryAgenda;
    procedure ApriCalendario;
    procedure ChiudiCalendario;
    procedure OpenOrRefreshQuery;
    procedure SplitterAgendaAfterOpen(Sender: TObject);
    function GetInterventiNellaSelezione: Boolean;
    function GetEventiSelezionatiPresenti: Boolean;
    function GetTasksSelezionatiPresenti: Boolean;
    procedure ImportaChiamataByID(IDImpegno: Integer; RefreshData:Boolean=True);
    procedure ImportaChiamataDallaBacheca;
    procedure RefreshTecniciTabControl;
    procedure RefreshVisibilitaTecniciAgenda;
    procedure TuttiTecniciVisibili;
    procedure Task_LoadFromGoogleTasks;
    function ResourceId_To_CalendarId(ResourceID: Integer): String;
    { Private declarations }
  public
    { Public declarations }
    // Procedure che carica i nome dei tecnici nel TabControl a fianco dell'agenda
    //  per la selezione dei tecnici visibili
    procedure CaricaTecnici;
    // Proprietà che ritorna l'oggetto agenda in uso in base alla madalità attuale (FastSelectionMode oppure NormalSelectionMode)
    property Splitter:TcxSplitter read fSplitter write SetSplitter;
    // Proprietà che ritorna True se ci sono degli interventi tra gli eventi selezionati nell'agenda
    property InterventiNellaSelezione:Boolean read GetInterventiNellaSelezione;
    // Proprietà che ritorna True se ci sono degli eventi selezionati nell'Agenda laterale
    property EventiSelezionatiPresenti:Boolean read GetEventiSelezionatiPresenti;
    property TasksSelezionatiPresenti:Boolean read GetTasksSelezionatiPresenti;

    procedure StampaAgenda(AgendaPrintMode: TAgendaPrintMode);
    procedure Task_OpenFocusedTask;
    procedure Task_DeleteFocusedTask;
  end;

var
  AgendaSlideForm: TAgendaSlideForm;

implementation

uses main, DataModule1, SchedaClienti, ComCtrls, FormImpegni, 
  FormTabImpianti, DateUtils, StrUtils, DataModule2, UnitGoogleTasks, UnitGoogleCal,
  DataModuleStyles, System.Types, FormConfirm;

{$R *.dfm}


// =============================================================================
// INIZIO: PARTE PER LA GESTIONE DEI TASKS
// -----------------------------------------------------------------------------
// Procedure che apre il Task selezionato che ha il focus
procedure TAgendaSlideForm.Task_OpenFocusedTask;
var
  TaskID, TaskListID: String;
begin
  if btvTasks.DataController.FocusedRecordIndex = -1 then begin
    DM1.Messaggi('Levante', 'Non hai selezionato alcun Task!', '', [mbOK], 0, nil);
    Exit;
  end;
  TaskID      := btvTasks.DataController.DisplayTexts[btvTasks.DataController.FocusedRecordIndex, btvTasks_ID.Index];
  TaskListID  := btvTasks.DataController.DisplayTexts[btvTasks.DataController.FocusedRecordIndex, btvTasks_ListID.Index];
  GoogleTasks_ShowTaskForm(TaskID, TaskListID);
end;

// Procedure che elimina il Task selezionato che ha il focus
procedure TAgendaSlideForm.Task_DeleteFocusedTask;
var
  TaskID, TaskListID: String;
begin
  // Verifica selezione
  if btvTasks.DataController.FocusedRecordIndex = -1 then begin
    DM1.Messaggi('Levante', 'Non hai selezionato alcun Task!', '', [mbOK], 0, nil);
    Exit;
  end;
  // Chiede conferma
  if not TConfirmForm.ConfirmationRequest('Elimina task', 'Per confermare digita "elimina task", poi clicca sul bottone "Conferma".', 'elimina task') then
      Exit;
  // RIcava il TaskID
  TaskID      := btvTasks.DataController.DisplayTexts[btvTasks.DataController.FocusedRecordIndex, btvTasks_ID.Index];
  TaskListID  := btvTasks.DataController.DisplayTexts[btvTasks.DataController.FocusedRecordIndex, btvTasks_ListID.Index];
  // Esegue l'operazione
  GoogleTasks_DeleteTaskByTaskID(TaskID, TaskListID);
end;

// Procedure che effettua il caricamento dei Tasks
procedure TAgendaSlideForm.Task_LoadFromGoogleTasks;
var
  TRA: TTaskRecordArray;
  i, RI: Integer;
  DC: TcxCustomDataController;
begin
  // Inizializzazione
  DC := btvTasks.DataController;
  // Connessione a Google Tasks e caricamento dei dati
  //  di tutti i Tasks presenti nell'apposito record
  GoogleTasks_LoadTaskRecordArray(TRA);
  // Disabilita il tracciamento a video della griglia
  DC.BeginUpdate;
  try
    // Svuota la TableView
    DC.RecordCount := 0;
    // Cicla per tutti i Task contenuti nell'array
    for i := 0 to Length(TRA) -1 do begin
      // Aggiunge il nuovo record
      RI := DC.AppendRecord;
      // Carica i dati.
      DC.Values[RI,btvTasks_ID.Index]         := TRA[i].ID;
      DC.Values[RI,btvTasks_Title.Index]      := TRA[i].Title;
      DC.Values[RI,btvTasks_Notes.Index]      := TRA[i].Notes;
      DC.Values[RI,btvTasks_DueDate.Index]    := TRA[i].DueDate;
      DC.Values[RI,btvTasks_Completed.Index]  := TRA[i].Completed;
      DC.Values[RI,btvTasks_ListID.Index]     := TRA[i].ListID;
      DC.Values[RI,btvTasks_ListTitle.Index]  := TRA[i].ListTitle;
    end;
    // Aggiorna il titolo dei tasks con l'ora dell'ultima consultazione
    LabelTaskMainTitle.Caption := 'Tasks - ' + FormatDateTime('hh.nn', Now);
  finally
    // Riabilita il tracciamento a video della griglia
    DC.EndUpdate;
  end;
end;

procedure TAgendaSlideForm.sbTasksRefreshClick(Sender: TObject);
begin
  // Se il Tasks sono disattivati informa l'utente ed esce.
  if not DM1.GoogleTasks_Enabled then begin
    DM1.Messaggi('Levante - Google Tasks', 'La funzione Tasks (Google Tasks) non è abilitata.', '', [mbOk], 0, nil);
    Exit;
  end;

  DM1.ShowWait('Levante', 'Sto comunicando con Google Tasks...');
  try
    Task_LoadFromGoogleTasks;
  finally
    DM1.CloseWait;
  end;
end;

// -----------------------------------------------------------------------------
// FINE: PARTE PER LA GESTIONE DEI TASKS
// =============================================================================














// Procedure che rende visibili tutti i tecnici presenti
procedure TAgendaSlideForm.TuttiTecniciVisibili;
var
  i: Integer;
begin
  // Cicla per tutti i tecnici presenti nell'agenda
  //  e ne aggiorna lo stato nel TabControl
  for i := 0 to TabControlTecnici.Tabs.Count -1 do
    TabControlTecnici.Tabs[i].Selected := True;
  // Attiva il timer per aggiornare i tecnici visibili/invisibili in base alla situazione del TabControl
  //  e in modo ritardato.
  if not TimerAggiornaTecniciDalTab.Enabled then TimerAggiornaTecniciDalTab.Enabled := True;
end;


// Procedure che aggiorna i tecnici visibili/invisibili in base alla situazione del TabControl
procedure TAgendaSlideForm.RefreshVisibilitaTecniciAgenda;
var
  i: Integer;
  ResourceIndex: Integer;
begin
  // Disabilita il gestore di evento
  Agenda_FastSelectionMode.OnLayoutChanged := nil;
  try
    // Disabilita il tracciamento a video per migliorare le prestazioni
    Agenda_FastSelectionMode.BeginUpdate;
    // Cicla per tutti i tabs (tecnici) del TabControl e imposta di conseguenza
    //  la visibilità o meno dei tecnici nell'agenda
    for i := 0 to TabControlTecnici.Tabs.Count -1 do begin
      Agenda_FastSelectionMode.Storage.Resources.ResourceItems[i].Visible := (TabControlTecnici.Tabs[i].Selected or TabControlTecnici.Tabs[i].IsMainTab);
    end;
  finally
    Agenda_FastSelectionMode.EndUpdate;
    Agenda_FastSelectionMode.OnLayoutChanged := Agenda_FastSelectionModeLayoutChanged;
  end;
end;

// Procedure che carica i nome dei tecnici nel TabControl a fianco dell'agenda
//  per la selezione dei tecnici visibili
procedure TAgendaSlideForm.CaricaTecnici;
var
  i: Integer;
begin
  // Azzera tutto
  TabControlTecnici.Tabs.Clear;
  // Cicla per tutti i tecnici presenti nell'agenda
  //  e li aggiunge
  for i := 0 to Agenda_FastSelectionMode.Storage.ResourceCount -1 do begin
    TabControlTecnici.Tabs.Add(Agenda_FastSelectionMode.Storage.ResourceNames[i]);
  end;
end;

// Procedure che aggiorna la situazione dei tecnici attualmente visibili
//  nel TabControl
procedure TAgendaSlideForm.RefreshTecniciTabControl;
var
  i: Integer;
  TabIndex: Integer;
begin
  // Cicla per tutti i tecnici presenti nell'agenda
  //  e ne aggiorna lo stato nel TabControl
  for i := 0 to Agenda_FastSelectionMode.Storage.ResourceCount -1 do begin
    TabIndex := TabControlTecnici.Tabs.IndexOf(Agenda_FastSelectionMode.Storage.ResourceNames[i]);
    if TabIndex > (-1) then
      TabControlTecnici.Tabs[TabIndex].Selected := Agenda_FastSelectionMode.Storage.Resources.ResourceItems[i].Visible;
  end;
end;


// =============================================================================
// INIZIO: STAMPA AGENDA
// -----------------------------------------------------------------------------
procedure TAgendaSlideForm.StampaAgenda(AgendaPrintMode:TAgendaPrintMode);
begin
  // Imposta il tipo di stampa e altre proprietà in base alla vista attuale
  if      Agenda_FastSelectionMode.ViewDay.Active       then AgendaLink.PrintStyles.Daily.Active  := True
  else if Agenda_FastSelectionMode.ViewTimeGrid.Active  then AgendaLink.PrintStyles.Daily.Active  := True
  else if Agenda_FastSelectionMode.ViewWeek.Active      then AgendaLink.PrintStyles.Weekly.Active := True
  else if Agenda_FastSelectionMode.ViewWeeks.Active     then AgendaLink.PrintStyles.Weekly.Active := True
  else if Agenda_FastSelectionMode.ViewYear.Active      then AgendaLink.PrintStyles.Yearly.Active := True;
  // Preview
  if          AgendaPrintMode = apmPreview then begin
     dxPrinter.Preview(True, AgendaLink);
  // Stampa
  end else if AgendaPrintMode = apmPrint then begin
     dxPrinter.Print(True, nil, AgendaLink);
  // Mail
  end else if AgendaPrintMode = apmEmail then begin
     DM1.SaveDefaultPrinter;
     try
       DM1.SetPdfPrinterAsDefault;
       dxPrinter.Print(False, nil, AgendaLink);
     finally
       DM1.RestoreDefaultPrinter;
     end;
  end;
end;
// -----------------------------------------------------------------------------
// FINE: STAMPA AGENDA
// =============================================================================




// Apre l'impegno selezionato (ch ha il focus)
procedure TAgendaSlideForm.VisualizzaEventoSelezionato;
begin
  // Se non c'è alcun evento selezinato esce subito
  if Agenda_FastSelectionMode.SelectedEventCount = 0 then Exit;
  // Apre l'impegno selezionato
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    DM1.ApriImpegno(Agenda_FastSelectionMode.SelectedEvents[0].ID, False);
  finally
    DM1.CloseWait;
  end;
end;


// Function che ritorna True se ci sono degli eventi selezionati nell'Agenda laterale
function TAgendaSlideForm.GetEventiSelezionatiPresenti: Boolean;
begin
  Result := False;
  Result := (Agenda_FastSelectionMode.SelectedEventCount > 0);
end;

function TAgendaSlideForm.GetTasksSelezionatiPresenti: Boolean;
begin
  Result := False;
  Result := (btvTasks.Controller.SelectedRecordCount > 0);
end;


procedure TAgendaSlideForm.EliminaEventiSelezionati;
var
  LMessage: string;
begin
  // Chiede conferma per l'eliminazione (se non ci sono voci eselezionate esce)
  if Agenda_FastSelectionMode.SelectedEventCount = 1 then
    LMessage := 'Elimina appuntamento'
  else
  if Agenda_FastSelectionMode.SelectedEventCount > 1 then
    LMessage := Format('Elimina %d appuntamenti', [Agenda_FastSelectionMode.SelectedEventCount])
  else
    Exit;
  if not TConfirmForm.ConfirmationRequest(LMessage,
    Format('Per confermare digita "%s", poi clicca sul bottone "Conferma".', [LMessage]),
    LMessage,
    600, 300) then
      Exit;
  // Procede con l'eliminazione se non ci sono anche interventi selezionati
  if not InterventiNellaSelezione then
   Agenda_FastSelectionMode.DeleteSelectedEvents
  else
   DM1.Messaggi('Elimina impegno agenda', 'Non è possibile eliminare gli Interventi dall''agenda', 'NB: Per eliminare gli interventi andare nell''elenco dei documenti.', [mbOk], 0, nil);
end;


function TAgendaSlideForm.GetInterventiNellaSelezione: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Agenda_FastSelectionMode.SelectedEventCount -1 do begin
    if DM1.IsIntervento(Agenda_FastSelectionMode.SelectedEvents[i].ID)
    then Result := True;
  end;
end;


procedure TAgendaSlideForm.SplitterAgendaAfterOpen(Sender: TObject);
begin
  // Se è sull'agenda esegue il refresh dell'agenda mentre
  //  se invece è sui Tasks esegue il refresh dei Tasks
  if MainPageControl.ActivePage = TabAgenda then begin
    OpenOrRefreshQuery;
  end else if MainPageControl.ActivePage = TabTasks then begin
    sbTasksRefreshClick(sbTasksRefresh);
  end;
end;


procedure TAgendaSlideForm.SplitterAgendaAfterClose(Sender: TObject);
begin
  // Chiude il calendario
  ChiudiCalendario;
  // Chiude anche la query così la rifersca ogni volta che si apre l'agenda
  ChiudiQueryAgenda;
end;

procedure TAgendaSlideForm.SplitterAgendaMoved(Sender: TObject);
var
  CurrSplitter: TcxSplitter;
begin
  // RIcava lo Splitter
  CurrSplitter := Sender as TcxSplitter;
  // Se precedentemente l'agenda era chiusa significa che la stiamo aprendo ora
  //  e quindi apre/rinfresca la query e apre anche il calendario
  //  In pratica qui rilevo l'apertura dello splitter e imposto le azioni da compiere
  //  per questo "evento"
  //  NB: Non uso l'evento onAfterOpen o onBeforeOpen perchè non funzionano se apro
  //       lo splitter trascinandolo. (invece onAfterClose funziona e infatti lo uso).
  if (CurrSplitter.State = ssClosed) and (CurrSplitter.Control.Width <> 0) then begin
    // Refresh dell'agenda o dei Tasks a seconda dei casi
    SplitterAgendaAfterOpen(Sender);
  end;
  // Aggiorna la proprietà PositionAfterOpen in modo che alla eventuale
  //  riapertura dello splitter ritorni della stessa dimensione che aveva prima
  //  della chiusura
  if CurrSplitter.Control.Width <> 0 then begin
    CurrSplitter.PositionAfterOpen := CurrSplitter.Control.Width;
  end;
end;

procedure TAgendaSlideForm.OpenOrRefreshQuery;
begin
  DM1.ShowWait('Levante', 'Sto caricando l''agenda.');
  try
    EseguiQueryAgenda;
    ApriCalendario;
  finally
    DM1.CloseWait;
  end;
end;

procedure TAgendaSlideForm.QryAgendaBeforeDelete(DataSet: TDataSet);
var
  MasterID: Integer;
begin
  try
    // ===========================================================================
    // ELIMINAZIONE GOOGLE TASK SE PRESENTE
    // ---------------------------------------------------------------------------
    if DM1.GoogleTasks_Enabled then begin
      // Cambia il messaggio all'utente in modo che si renda conto
      //  che sta comunicando con GoogleTasks
      DM1.ShowWait('', 'Sto comunicando con Google Tasks...');
      try
        // RIcava in Master_ID
        MasterID := DM1.Impegno_ID_To_MasterID(DataSet.FieldByName('Master_ID').AsInteger);
        // Elimina l'eventuale Task di Google Task
        GoogleTasks_DeleteTaskByMaster_ID(MasterID, False);
      finally
        DM1.CloseWait;
      end;
    end;
    // ===========================================================================
    // ===========================================================================
    // ELIMINAZIONE GOOGLE CALENDAR EVENT SE PRESENTE
    // ---------------------------------------------------------------------------
    if DM1.GoogleCalendar_Enabled then begin
      // Cambia il messaggio all'utente in modo che si renda conto
      //  che sta comunicando con GoogleTasks
      DM1.ShowWait('', 'Sto comunicando con Google Calendar...');
      try
        // Elimina l'eventuale Evento di Google Calendar
        GCal_DeleteEventByMaster_ID(MasterID, False);
      finally
        DM1.CloseWait;
      end;
    end;
    // ===========================================================================
  except
    // Se c'è stato un errore annulla l'operazine
    on E : Exception do begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

procedure TAgendaSlideForm.QryAgendaBeforePost(DataSet: TDataSet);
var
   Qry : TIB_Cursor;
begin
   if not DataSet.FieldByName('ID').IsNull then Exit;
   Qry := TIB_Cursor.Create(nil);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT MAX(ID) AS NEXTID FROM IMPEGNI');
      Qry.Open;
      if Qry.Eof then Exit;
      DataSet.FieldByName('ID').Value := Qry.Fields[0].AsInteger + 1;
   finally
      if Qry.Active then Qry.Close;
      Qry.Free;
   end;
end;

procedure TAgendaSlideForm.SetSplitter(const Value: TcxSplitter);
begin
  fSplitter := Value;
  // Chiude gli allegati
  fSplitter.CloseSplitter;
  // Altrimenti in Win7 e Win Vista non si visualizzava correttamente (era invisibile).
  fSPlitter.NativeBackground := False;
  // IMposta gli hint
  fSPlitter.Hint := 'Fa apparire o scomparire l''agenda.'#13#13'NB: E'' possibile trascinarlo per variare la larghezza dell''agenda.';
  fSplitter.ShowHint := True;
  // Assegna il gestore di evento onMoved se questo non è già
  //  speficicato
  if not Assigned(fSplitter.OnMoved)      then fSplitter.OnMoved := SplitterAgendaMoved;
  if not Assigned(fSplitter.OnAfterOpen)  then fSplitter.OnAfterOpen := SplitterAgendaAfterOpen;
  if not Assigned(fSplitter.OnAfterClose) then fSplitter.OnAfterClose := SplitterAgendaAfterClose;
end;

procedure TAgendaSlideForm.ChiudiQueryAgenda;
begin
  PanelbuttonRefresh.Visible      := False;
  PanelbuttonRefreshSmall.Visible := False;
//  TableTecnici.Close;
//  TableAgenda.Close;
end;

procedure TAgendaSlideForm.EseguiQueryAgenda;
begin
  try
    DM1.OpenQueryAgenda(QryAgenda, QryTecnici, Agenda_FastSelectionMode);
  finally
     // RIabilita il pulsante di refresh in base alla modalità
     if Agenda_FastSelectionMode.ViewDay.Active then begin
       PanelbuttonRefresh.Visible       := True;
       PanelbuttonRefreshSmall.Visible  := False;
     end else begin
       PanelbuttonRefresh.Visible       := False;
       PanelbuttonRefreshSmall.Visible  := True;
     end;
  end;
end;

// Apre il calendario e lo associa allo Scheduler della form
procedure TAgendaSlideForm.ApriCalendario;
begin
  mainForm.ApriCalendario;
end;

// Chiude il calendario
procedure TAgendaSlideForm.ChiudiCalendario;
begin
  mainForm.ChiudiCalendario;
end;






// =============================================================================
// INIZIO IMPORTAZIONE CHIAMATE
// -----------------------------------------------------------------------------
procedure TAgendaSlideForm.ImportaChiamataDallaBacheca;
var
  Capt : String;
  IDImpegno : Integer;
begin
  DM1.ShowWait('Levante', 'Un momento...');
  try
    // Per proseguire ci deve essere una voce selezionata e quella Focused
    //  deve essere una chiamata, altrimenti esce subito
    if (MainForm.ListViewExpDoc.SelCount = 0) or (MainForm.ListViewExpDoc.Selected.ImageIndex <> 2) then Exit;
    // Carica alcuni dati utili su variabili di appoggio
    Capt := MainForm.ListViewExpDoc.Selected.Caption;
    IDImpegno := DM1.ExpImpegnoToID(Capt);
    // Importa la chiamata attuale
    ImportaChiamataByID(IDImpegno, False);
    // Elimina la voce dalla bacheca
    DM1.EliminaExpImpegno(IDImpegno);
    MainForm.AggiornaDocumentiEsportati;
    // Rinfresca la query e la visualizzazione
    Self.EseguiQueryAgenda;
    // ------------------------------------------------------------------------
    // Parte che elimina l'eventuale Task allegato alla CHiamata che si
    //  trasformata in Appuntamento
    // ------------------------------------------------------------------------
    try try
      DM1.ShowWait('Levante', 'Sto comunicando con Google Tasks...');
      GoogleTasks_DeleteTaskByMaster_ID(DM1.Impegno_ID_To_MasterID(IDImpegno), True);
    except
      DM1.Messaggi('Levante', 'Google Tasks'#13#13'Temo di non riuscire a comunicare.'#13#13'Dovrai eliminare manualmente la chiamata dai Tasks.', '', [mbOk], 0, nil);
    end;
    finally
      DM1.CloseWait;
    end;
    // ------------------------------------------------------------------------
  finally
    DM1.CloseWait;
  end;
end;

// Procedure che effettua l'importazione di una chiamata dalla bacheca
procedure TAgendaSlideForm.ImportaChiamataByID(IDImpegno:Integer; RefreshData:Boolean=True);
var
   Qry: TIB_Cursor;
   CurrTimeSlot : TDateTime;
begin
   // Inizializzazione
   CurrTimeSlot := 0;
   // Crea la query che preleva i righi del documento da esportare dall'archivio dei righidoc dell'azienda
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName    := DM1.ArcDBFile;
      Qry.IB_Connection   := DM1.DBAzienda;
      Qry.IB_Transaction  := Self.TransAgenda;
      // Rileva l'orario sul quale è posizionato il cursore
      with Agenda_FastSelectionMode do
      begin
        if (ActiveHitTest is TcxSchedulerDayViewHitTest) and CurrentView.HitTest.HitAtTime then
          CurrTimeSlot := ViewDay.HitTest.Time;
        if (ActiveHitTest is TcxSchedulerDateNavigatorHitTest) and DateNavigator.HitTest.HitAtTime then
          CurrTimeSlot := DateNavigator.HitTest.Time;
      end;
      // Query che modifica l'impegno cambiandogli di stato e impostando
      //  l'inizio e la fine dell'appuntamento e il tecnico.
      Qry.SQL.Add('UPDATE IMPEGNI SET');
      Qry.SQL.Add('TIPOIMPEGNO = ''Appuntamento'',');
      Qry.SQL.Add('START_EVENT = ''' + FormatDateTime('mm/dd/yyyy hh:mm:ss', CurrTimeSlot) + ''',');
      Qry.SQL.Add('FINISH_EVENT = ''' + FormatDateTime('mm/dd/yyyy hh:mm:ss', CurrTimeSlot + EncodeTime(1,30,0,0)) + ''',');
      Qry.SQL.Add('RESOURCEID = ' + IntToStr(Agenda_FastSelectionMode.CurrentView.HitTest.Resource.ResourceID));
      Qry.SQL.Add('WHERE ID = ' + IntToStr(IDImpegno));
      Qry.ExecSQL;
      // Se richiesto rinfresca la query e la visualizzazione
      if RefreshData then Self.EseguiQueryAgenda;
      // ------------------------------------------------------------------------
      // Parte che elimina l'eventuale Task allegato alla CHiamata che si
      //  trasformata in Appuntamento e crea anche l'evento su Google Calendar
      // ------------------------------------------------------------------------
      // Elimina Task
      if DM1.GoogleTasks_Enabled then begin
        try try
          DM1.ShowWait('Levante', 'Sto comunicando con Google Tasks...');
          GoogleTasks_DeleteTaskByMaster_ID(DM1.Impegno_ID_To_MasterID(IDImpegno), True);
        except
          DM1.Messaggi('Levante', 'Google Tasks'#13#13'Mi dispiace, non sono riuscito ad eliminare il Task.', 'NB: Controlla manualmente la situazione per favore.', [mbOk], 0, nil);
        end;
        finally
          DM1.CloseWait;
        end;
      end;
      // Crea l'evento in Google Calendar
      if DM1.GoogleCalendar_Enabled then begin
        try try
          DM1.ShowWait('Levante', 'Sto comunicando con Google Calendar...');
          GCal_CreateOrOpenEvent(DM1.Impegno_ID_To_MasterID(IDImpegno), DM1.GoogleCalendar_CreazioneAutomaticaDaAppuntamentoInvisible);
        except
          DM1.Messaggi('Levante', 'Google Calendar'#13#13'Temo di non essere ruscito a creare l''evento su Google Calendar.'#13#13'Dovrai eliminare manualmente la chiamata dai Tasks.', 'NB: Controlla manualmente la situazione per favore.', [mbOk], 0, nil);
        end;
        finally
          DM1.CloseWait;
        end;
      end;
      // ------------------------------------------------------------------------
   finally
      Qry.Free;
   end;
end;
// -----------------------------------------------------------------------------
// FINE IMPORTAZIONE CHIAMATE
// =============================================================================




procedure TAgendaSlideForm.Agenda_FastSelectionModeDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  DC: TcxCustomDataController;
begin
  // ===========================================================================
  // TLISTVIEW (BACHECA)
  // ---------------------------------------------------------------------------
  // Se il mittente è una TListView
  if Source is TListView then begin
    // Se il mittente è la Bacheca...
    if (Source as TListView).Name = 'ListViewExpDoc' then begin
      // Se è una chiamata provvede ad importarla
      ImportaChiamataDallaBacheca;
    end;
  // ===========================================================================
  // TPAINTBOX (MAINMENU)
  // ---------------------------------------------------------------------------
  // Se il mittente è una TPaintBox
  end else if Source is TPaintBox then begin
    // Se è il Soggetto/Pratica/Impianto selezionato accetta
    if ((Source as TPaintBox).Name = 'SBSoggetto')
    or ((Source as TPaintBox).Name = 'SBPratica')
    or ((Source as TPaintBox).Name = 'SBAssistenza')
    then begin
      CreaNuovoAppuntamentoDragDrop;
    end;
  // ===========================================================================
  // TCXGRID
  // ---------------------------------------------------------------------------
  // Se il mittente proviene da una TcxGrid o TcxView...
  //  Controlla se il mittente è di tipo TcxDragControlObject che è il tipo di oggetto
  //  che le griglie DevExpress passano surante il DragAndDrop.
  end else if Source is TcxDragControlObject then begin
    // Se il mittente è una vista (che è sempre contenuta in un GridSite)...
    if TcxDragControlObject(Source).Control is TcxGridSite then begin
      // ---------------------------
      // Se è un impianto, una pratica/cantiere, un soggetto o un sottorigo dell'elenco soggetti
      if (TcxGridSite(TcxDragControlObject(Source).Control).GridView.Name = 'btvAssistenze')
      or (TcxGridSite(TcxDragControlObject(Source).Control).GridView.Name = 'tvPrat')
      or (TcxGridSite(TcxDragControlObject(Source).Control).GridView.Name = 'tvRubrica')
      or (TcxGridSite(TcxDragControlObject(Source).Control).GridView.IsDetail) and (TcxGridSite(TcxDragControlObject(Source).Control).GridView.PatternGridView.Name = 'tvSoggCant')
      then begin
        // Crea il nuovo documento
        DM1.ShowWait('Levante', 'Un momento...');
        try
          CreaNuovoAppuntamentoDragDrop;
        finally
          DM1.CloseWait;
        end;
      // ---------------------------
      // Se è una chiamata (sottorigo di un impianto nell'elenco impianti)
      end else if (TcxGridSite(TcxDragControlObject(Source).Control).GridView.IsDetail) and (TcxGridSite(TcxDragControlObject(Source).Control).GridView.PatternGridView.Name = 'tvImpegni') then begin
        // Crea il nuovo documento
        DM1.ShowWait('Levante', 'Un momento...');
        try
          DC := TcxGridSite(TcxDragControlObject(Source).Control).GridView.DataController;
          ImportaChiamataByID(DC.Values[DC.FocusedRecordIndex, TabImpiantiForm.tvImpegniID.Index], True);
        finally
          DM1.CloseWait;
        end;
      // ---------------------------
      // Se è una chiamata (proprio dell'elenco delle chiamate/appuntamenti/interventi)
      end else if (TcxGridSite(TcxDragControlObject(Source).Control).GridView.Name = 'tvImpegni') then begin
        // Crea il nuovo documento
        DM1.ShowWait('Levante', 'Un momento...');
        try
          DC := TcxGridSite(TcxDragControlObject(Source).Control).GridView.DataController;
          ImportaChiamataByID(DC.Values[DC.FocusedRecordIndex, ClientiForm.tvImpegniID.Index], True);
        finally
          DM1.CloseWait;
        end;
      // ---------------------------
      end;
    end;
  // ===========================================================================
  end;
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeDblClick(
  Sender: TObject);
begin
  // Se ci sono eventi selezionati, visualizza l'evento, altrimenti
  //  si predispone per l'ìnserimento di un nuovo evento.
  if Agenda_FastSelectionMode.SelectedEventCount > 0 then begin
    // Visualizza il documento
    ClientiForm.RxSpeedButtonVisualizzaClick(ClientiForm.RxSpeedButtonVisualizza);
  end else
  // Se invece si è fatto DblClick sulla parte vuota di agenda crea un nuovo appuntamento
  if  (Agenda_FastSelectionMode.CurrentView.HitTest is TcxSchedulerDayViewHitTest)
  and (Agenda_FastSelectionMode.CurrentView.HitTest as TcxSchedulerDayViewHitTest).HitAtContent
  then begin
    // Crea il nuovo documento
    DM1.ShowWait('Levante', 'Un momento...');
    try
      CreaNuovoAppuntamento;
    finally
      DM1.CloseWait;
    end;
  end;
end;

procedure TAgendaSlideForm.CreaNuovoAppuntamento;
begin
  ClientiForm.GoToNuovoAppuntamento('Chiamata');
  ImpegnoForm.QryImpSTART.Value       := ClientiForm.Agenda.SelStart;
  ImpegnoForm.QryImpFINISH.Value      := ClientiForm.Agenda.SelFinish;
  ImpegnoFOrm.QryImpRESOURCEID.Value  := ClientiForm.Agenda.SelResource.ResourceID;
end;


procedure TAgendaSlideForm.CreaNuovoAppuntamentoDragDrop;
var
  CurrTimeSlot: TDateTime;
  CurrResourceID: Integer;
begin
  // Inizializzazione
  CurrResourceID := -1;
  // Rileva l'orario sul quale è posizionato il cursore
  with Agenda_FastSelectionMode do
  begin
    if (ActiveHitTest is TcxSchedulerDayViewHitTest) and CurrentView.HitTest.HitAtTime then
      CurrTimeSlot := ViewDay.HitTest.Time;
    if (ActiveHitTest is TcxSchedulerDateNavigatorHitTest) and DateNavigator.HitTest.HitAtTime then
      CurrTimeSlot := DateNavigator.HitTest.Time;
    if (ActiveHitTest is TcxSchedulerDayViewHitTest) and (ActiveHitTest as TcxSchedulerDayViewHitTest).HitAtContent then
      CurrResourceID := CurrentView.HitTest.Resource.ResourceID;
  end;
  // Crea il nuovo appuntamento e ne imposta l'inizio
  ClientiForm.GoToNuovoAppuntamento('Chiamata');
  ImpegnoForm.QryImpSTART.Value       := CurrTimeSlot;
  ImpegnoForm.QryImpFINISH.Value      := CurrTimeSlot + EncodeTime(1,30,0,0);
  if CurrResourceID <> -1 then ImpegnoFOrm.QryImpRESOURCEID.Value  := Agenda_FastSelectionMode.CurrentView.HitTest.Resource.ResourceID;
end;


procedure TAgendaSlideForm.Agenda_FastSelectionModeDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  // Verifica che l'utente abbia trscinato sopra una zona valida altrimenti esce subito
  if  (Agenda_FastSelectionMode.ActiveHitTest is TcxSchedulerDayViewHitTest)
  and (   ((Agenda_FastSelectionMode.ActiveHitTest as TcxSchedulerDayViewHitTest).HitAtContent) or ((Agenda_FastSelectionMode.ActiveHitTest as TcxSchedulerDayViewHitTest).HitAtEvent)   )
  then begin

    // Se il mittente è l'agenda stessa
    // NB: Lasciarlo qui prima degli altri i in un IF tutto suo
    //      e soprattutto senza inizializzare prima Accept altrimenti
    //      quando trascino un evento fuori dalla griglia (ad esempio
    //      per eliminare l'evento) non me lo rimette al suo posto
    //      iniziale.
    if Source is TcxSchedulerDragObject then begin
      // Se è l'agenda stessa ovviamente accetta
      if (Source as TcxSchedulerDragObject).Scheduler = Self.Agenda_FastSelectionMode
      then Exit;
    end;

    // ---------------------------------------------------------------------------
    // Inizializzazione
    Accept := False;
    // Se il mittente proviene da una TcxGrid o TcxView...
    //  Controlla se il mittente è di tipo TcxDragControlObject che è il tipo di oggetto
    //  che le griglie DevExpress passano surante il DragAndDrop.
    if Source is TcxDragControlObject then begin
      // Se il mittente è una vista (che è sempre contenuta in un GridSite)...
      if TcxDragControlObject(Source).Control is TcxGridSite then begin
        if (TcxGridSite(TcxDragControlObject(Source).Control).GridView.Name = 'btvAssistenze')
        or (   (TcxGridSite(TcxDragControlObject(Source).Control).GridView.IsDetail) and (TcxGridSite(TcxDragControlObject(Source).Control).GridView.PatternGridView.Name = 'tvImpegni')   )
        or (TcxGridSite(TcxDragControlObject(Source).Control).GridView.Name = 'tvRubrica')
        or (   (TcxGridSite(TcxDragControlObject(Source).Control).GridView.IsDetail) and (TcxGridSite(TcxDragControlObject(Source).Control).GridView.PatternGridView.Name = 'tvSoggCant')   )
        or (TcxGridSite(TcxDragControlObject(Source).Control).GridView.Name = 'tvImpegni')
        or (TcxGridSite(TcxDragControlObject(Source).Control).GridView.Name = 'tvPrat')
        then accept := True;
      end;
    // ---------------------------------------------------------------------------
    // Se il mittente è una TPaintBox (MainMenù)
    end else if Source is TPaintBox then begin
      // Se è il Soggetto/Pratica/Impianto selezionato accetta
      if ((Source as TPaintBox).Name = 'SBSoggetto')
      or ((Source as TPaintBox).Name = 'SBPratica')
      or ((Source as TPaintBox).Name = 'SBAssistenza')
      then accept := True;
    // ---------------------------------------------------------------------------
    end;
  end;
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeEventSelectionChanged(Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent);
//var
//  I: Integer;
begin
// NB: HO COMMENTATO/ELIMINATO QUESTO CODICE PERCHE' PER STAMPARE I KIT PER IL TECNICO SERVIVA SELEZIONARE PIU' APPUNTAMENTI ALLA VOLTA
//  // Fa in modo che si possa selezionare un solo evento alla volta
//  if Agenda_FastSelectionMode.SelectedEventCount > 1 then
//  begin
//    Agenda_FastSelectionMode.OnEventSelectionChanged := nil;
//    for I := Agenda_FastSelectionMode.SelectedEventCount - 1 downto 0 do
//      Agenda_FastSelectionMode.SelectedEvents[I].Selected := False;
//    AEvent.Selected := True;
//    Agenda_FastSelectionMode.OnEventSelectionChanged := Agenda_FastSelectionModeEventSelectionChanged;
//  end;
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeSelectionChanged(
  Sender: TObject);
var
  Sch: TcxScheduler;
  IdCliente, IdPratica: Integer;
begin
  // ===========================================================================
  //  Parte che selezione il soggetto/pratica/impianto relativo all'evento
  //  attualmente selezionato come soggetto/pratica/impianto attuale in modo da
  //  facilitare eventualmente l'apertura delle relatice anagrafiche.
  //  CHiesto dalla CLIMATEC - SAMUELA ma secondo me utile anche per gli altri.
  //  NB: Ebentualmente vedere poi se mettere sotto parametro oppure no.
  // ---------------------------------------------------------------------------
  // Inizializzazione
  if DM1.AgendaAutoSelectSoggPrat then
  begin
    Sch := Sender as TcxScheduler;
    IdCliente := -1;
    IdPratica := 0;
    // Verifiche iniziali
    if Sch.SelectedEventCount = 0 then Exit;
    // Caricamento dati
    if (not VarIsNull(Sch.SelectedEvents[0].GetCustomFieldValueByName('CLIENTE')))
      then IdCliente := Sch.SelectedEvents[0].GetCustomFieldValueByName('CLIENTE');
    if (not VarIsNull(Sch.SelectedEvents[0].GetCustomFieldValueByName('IDPRATICA')))
      then IdPratica := Sch.SelectedEvents[0].GetCustomFieldValueByName('IDPRATICA');
    // Seleziona il soggetto/cantiere/impianto
    if (DM1.ModCtrl(MOD_CLIENTI) > 0) and (DM1.ModCtrl(MOD_PRATICHE) > 0) then begin
      ClientiForm.SelezionaSoggettoPratica(IdCliente, IdPratica);
    end;
  end;
  // ===========================================================================
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeStylesGetContentStyle(
  Sender: TObject; AResource: TcxSchedulerStorageResourceItem;
  const ADateTime: TDateTime; var AStyle: TcxStyle);
begin
  if DM1.AgendaGrayOnlyContentBackgroud then
  begin
    if  (ADateTime >= Agenda_FastSelectionMode.ViewDay.WorkStart)
    and (ADateTime <= Agenda_FastSelectionMode.ViewDay.WorkFinish)
    then AStyle := AgendaStyle_ContentWorkingTime
    else AStyle := AgendaStyle_ContentNonWorkingTime;
  end;
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeCustomDrawDayHeader(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxSchedulerDayHeaderCellViewInfo; var ADone: Boolean);
var
  TmpStr: String;
begin
  if Sender is TcxSchedulerDayView then begin;
    // ===========================================================================
    // CUSTOM DRAW DAY VIEW
    // ---------------------------------------------------------------------------
    // Inizializzazione
    ADone := True;
    TmpStr := AViewInfo.DisplayText;
    // Altrimenti allo scoccare di ogni minuto mi diseghava l'header
    //  completamente nero
    ACanvas.Brush.Color := Agenda_FastSelectionMode.Styles.DayHeader.Color;
    ACanvas.Font.Color  := Agenda_FastSelectionMode.Styles.DayHeader.TextColor;
    // Traccia lo sfondo
    ACanvas.FillRect(AViewInfo.Bounds);
    // Traccia il testo
    if IsToday(AViewInfo.DateTime) then ACanvas.Font.Style := [fsBold];
    ACanvas.DrawTexT(TmpStr, AViewInfo.TextRect, cxAlignHCenter or cxAlignVCenter);
    // Traccia i bordi
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, clBlack, clBlack, [bRight], 1);
    // ===========================================================================
  end;
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeCustomDrawEvent(
  Sender: TObject; ACanvas: TcxCanvas; AViewInfo: TcxSchedulerEventCellViewInfo;
  var ADone: Boolean);
begin
  if AViewInfo.Selected
  then ACanvas.Brush.Color := Agenda_FastSelectionMode.Styles.Selection.Color;
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeCustomDrawResourceHeader(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxSchedulerHeaderCellViewInfo; var ADone: Boolean);
begin
  if Sender is TcxSchedulerDayView then begin;
    // ===========================================================================
    // CUSTOM DRAW DAY VIEW
    // ---------------------------------------------------------------------------
    // Inizializzazione
    ADone := True;
    // Altrimenti allo scoccare di ogni minuto mi diseghava l'header
    //  completamente nero
    ACanvas.Brush.Color := Agenda_FastSelectionMode.Styles.ResourceHeader.Color;
    ACanvas.Font.Color  := Agenda_FastSelectionMode.Styles.ResourceHeader.TextColor;
    // Traccia lo sfondo
    ACanvas.FillRect(AViewInfo.Bounds);
    // Traccia il testo
    ACanvas.DrawTexT(AViewInfo.DisplayText, AViewInfo.TextRect, cxAlignHCenter or cxAlignVCenter);
    // Bordi
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, clBlack, clBlack, [bRight, bTop], 1);
    // ===========================================================================
  end;
end;

procedure TAgendaSlideForm.sbAgenda_RefreshClick(Sender: TObject);
begin
  try
    sbAgenda_Refresh.Enabled := False;
    // Disabilita il gestore di evento "onLayoutChanged" per prevenire troppi passagi
    Agenda_FastSelectionMode.OnLayoutChanged := nil;
    // Se abilitato aggiorna gli impegni con i dati provenienti da
    //  Google Calendar.
    if DM1.GoogleCalendar_Enabled then begin
      DM1.ShowWait('Levante', 'Sto comunicando con Google Calendar...');
      GCal_RefreshImpegniFromGoogleCal(DM1.DBAzienda);
    end;
    // Refresh
    DM1.ShowWait('Levante', 'Sto aggiornando l''agenda.');
    EseguiQueryAgenda;
  finally
    DM1.CloseWait;
    // Disabilita il gestore di evento "onLayoutChanged" per prevenire troppi passagi
    Agenda_FastSelectionMode.OnLayoutChanged := Agenda_FastSelectionModeLayoutChanged;
    // Riabilita il bottone Refresh
    sbAgenda_Refresh.Enabled := True;
  end;
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeInitEventImages(
  Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent;
  AImages: TcxSchedulerEventImages);
const
  ICON_URGENTE_INDEX = 0;
  ICON_PRESCRIZ_INDEX = 2;
  ICON_STAMPATO_INDEX = 11;
var
  Urgente, Prescrizioni, Stampato: Variant;
begin
  // Se è urgente aggiunge l'apposita iconcina
  Urgente := AEvent.GetCustomFieldValueByName('EXISTS_URGENTI');
  if VarToStr(Urgente) = 'T' then AImages.Add(ICON_URGENTE_INDEX);
  // Se c'è una prescrizione aggiunge l'apposita iconcina
  Prescrizioni := AEvent.GetCustomFieldValueByName('EXISTS_PRESCRIZIONI');
  if VarToStr(Prescrizioni) = 'T' then AImages.Add(ICON_PRESCRIZ_INDEX);
  // Se è già stato stampato il foglio di lavoro visualizza l'apposita iconcina
  Stampato := AEvent.GetCustomFieldValueByName('EXISTS_STAMPATO');
  if VarToStr(Stampato) = 'T' then AImages.Add(ICON_STAMPATO_INDEX);
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeIsWorkTime(Sender: TObject;
  AResource: TcxSchedulerStorageResourceItem; const ATime: TDateTime;
  var AIsWork: Boolean);
var
  LTime: TTime;
begin
  // Determina se si tratta di un orario di apertura o chiusura (così funziona)
  LTime := TimeOf(ATime);
  AIsWork := (LTime >= Agenda_FastSelectionMode.OptionsView.WorkStart) and (LTime <= Agenda_FastSelectionMode.ViewDay.WorkFinish);
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeViewTypeChanged(
  Sender: TObject; APrevView, ANewView: TcxSchedulerCustomView);
begin
  // Se la query dell'agenda è chiusa non deve essere visibile alcun pulsante
  if not QryAgenda.Active then begin
    PanelbuttonRefresh.Visible       := False;
    PanelbuttonRefreshSmall.Visible  := False;
  end;
  //  di refresh
  // IN base alla modalità scelta visualizza il pulsante di refresh corretto
  if (ANewView is TcxSchedulerDayView) then begin
    PanelbuttonRefresh.Visible       := True;
    PanelbuttonRefreshSmall.Visible  := False;
  end else begin
    PanelbuttonRefresh.Visible       := False;
    PanelbuttonRefreshSmall.Visible  := True;
  end;
end;

procedure TAgendaSlideForm.Salvaimpostazionicolonne1Click(Sender: TObject);
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
   // Salva la vista attuale
   DM1.SalvaAgendaDevExpress(Agenda_FastSelectionMode, Vista);
end;

procedure TAgendaSlideForm.Selezionavista1Click(Sender: TObject);
var
   CurrItemCaption:String;
begin
   // Caption della voce selezionata
   CurrItemCaption := (Sender as TMenuItem).Caption;
   // Se la Caption della voce selezionata contiene il carattere & (incasina tutto)
   //  lo toglie.
   CurrItemCaption := StringReplace(CurrItemCaption, '&', #0, [rfReplaceAll]);
   // Se la voce attuale è la radice del menu di selezione viste esce subito
   if (Sender as TMenuItem).Name = 'Selezionavista1' then Exit;
   // Ripristina la vista scelta
   DM1.RipristinaAgendaDevExpress(Agenda_FastSelectionMode, CurrItemCaption);
end;

procedure TAgendaSlideForm.MenuAgendaPopup(Sender: TObject);
var
   CurrMenuItem:TMenuItem;
   i: Integer;
   ListaViste: TStrings;
begin
   // ==========================================================================
   // Caricamento delle viste delle griglia attualmente visualizzata
   // --------------------------------------------------------------------------
   // Rende visibili le voci corrispondenti alle viste
   Selezionavista1.Visible              :=  (not MainForm.IsLevanteLight);
   Salvaimpostazionicolonne1.Visible    :=  (not MainForm.IsLevanteLight);
   // Carica l'elenco delle viste disponibili per questa griglia
   //  in una StringList
   ListaViste := TStringList.Create;
   try
     DM1.ListaVisteGriglia(Agenda_FastSelectionMode.Name, ListaViste);
     // Svuota l'elenco delle viste
     Selezionavista1.Clear;
     // Aggiunge la voce di selezione di nessuna vista
     CurrMenuItem := TMenuItem.Create(Self);
     CurrMenuItem.Caption := 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)';
     CurrMenuItem.Name := 'NessunaVista';
     CurrMenuItem.OnClick := Selezionavista1Click;
     Selezionavista1.Add(CurrMenuItem);
     // Aggiunge le altre eventuali viste presenti
     for i := 0 to ListaViste.Count -1 do begin
       CurrMenuItem := TMenuItem.Create(Self);
       CurrMenuItem.Caption := ListaViste.Strings[i];
       CurrMenuItem.OnClick := Selezionavista1Click;
       Selezionavista1.Add(CurrMenuItem);
     end;
   finally
     ListaViste.Free;
   end;
   // ==========================================================================
end;

procedure TAgendaSlideForm.FormCreate(Sender: TObject);
begin
  // Tab visibile di default
  MainPageControl.OnChange := nil;
  try
    MainPageControl.ActivePage := TabAgenda;
  finally
    MainPageControl.OnChange := MainPageControlChange;
  end;
  // Questa è una classe che ho creato per modificare l'apparenza a video
  //  del TabControl per la selezione dei tecnici dell'agenza.
  TabControlTecnici.Style := 1000;
  // Posiziona i Refresh Buttons
  PanelButtonTaskRefresh.Left     := 5;
  PanelButtonTaskRefresh.Top      := 6;
  PanelbuttonRefresh.Visible      := False;
  PanelbuttonRefresh.Left         := 5;
  PanelbuttonRefresh.Top          := 6;
  PanelbuttonRefreshSmall.Visible := False;
  PanelbuttonRefreshSmall.Left    := 1;
  PanelbuttonRefreshSmall.Top     := 1;
  // Se l'agenda non deve essere GrayOnly (quindi deve essere colorata in base ai colori
  //   impostati nei Tecnici) allora azzera lo style del content
  if not DM1.AgendaGrayOnlyContentBackgroud then
    Agenda_FastSelectionMode.Styles.Content := nil;
end;






// ===========================================================================
// Questa è una classe che ho creato per modificare l'apparenza a video
//  del TabControl per la selezione dei tecnici dell'agenza.
// ---------------------------------------------------------------------------
procedure TMyPainter.PaintTabShape(ACanvas: TcxCanvas; TabVisibleIndex: Integer);
var
  FullRect: TRect;
  TabBodyColor: TColor;
  ATabViewInfo: TcxTabViewInfo;
begin
  ATabViewInfo := TabViewInfo[TabVisibleIndex];
  FullRect := ATabViewInfo.FullRect;
  TabBodyColor := GetTabBodyColor(TabVisibleIndex);
  with ACanvas, FullRect do
  begin
    Brush.Color := TabBodyColor;
    FillRect(FullRect);
  end;
end;

function TMyPainter.GetTabBodyColor(TabVisibleIndex: Integer): TColor;
var
  ATabViewInfo: TcxTabViewInfo;
begin
  ATabViewInfo := TabViewInfo[TabVisibleIndex];

  if ATabViewInfo.IsMainTab or ATabViewInfo.IsSelected
  then Result := TAB_COLOR_HIGHLIGHT
  else Result := TAB_COLOR_NORMAL;
end;

function TMyPainter.GetFreeSpaceColor: TColor;
begin
  Result := TAB_COLOR_NORMAL;
end;

class function TMyPainter.GetStyleID: TcxPCStyleID;
begin
  Result := 1000;
end;

class function TMyPainter.GetStyleName: TCaption;
begin
  Result := 'MyPainter';
end;
// ===========================================================================




procedure TAgendaSlideForm.Agenda_FastSelectionModeLayoutChanged(
  Sender: TObject);
begin
  // Attiva il timer per aggiornare i Tabs laterali in base al layout corrente dell'agenda
  //  in modo ritardato per evitare richiami multipli dell'evento stesso.
  if not TimerLayoutChanged.Enabled then TimerLayoutChanged.Enabled := True;
end;

procedure TAgendaSlideForm.Agenda_FastSelectionModeResize(Sender: TObject);
begin
  // ===========================================================================
  // Parte per il salvataggio e successivo ripristino dell'evento selezionato
  //  perchè altrimenti al resize dell'agenda spariva la selezione.
  //  Codice presente in "onResize" dell'agenda stessa e in "TimerResizeSelection.Timer"
  // ---------------------------------------------------------------------------
  if Agenda_FastSelectionMode.SelectedEventCount > 0 then begin
    fEventID := Agenda_FastSelectionMode.SelectedEvents[0].ID;
    TimerResizeSelection.Enabled := True;
  end else begin
    fEventID := null;
  end;
  // ===========================================================================
end;

procedure TAgendaSlideForm.TimerResizeSelectionTimer(Sender: TObject);
var
  I: Integer;
begin
  // ===========================================================================
  // Parte per il salvataggio e successivo ripristino dell'evento selezionato
  //  perchè altrimenti al resize dell'agenda spariva la selezione.
  //  Codice presente in "onResize" dell'agenda stessa e in "TimerResizeSelection.Timer"
  // ---------------------------------------------------------------------------
  TimerResizeSelection.Enabled := False;
  if fEventID = null then Exit;
  for I := 0 to Agenda_FastSelectionMode.VisibleEventCount -1 do
  begin
    if Agenda_FastSelectionMode.VisibleEvents[I].ID = fEventID then
    begin
      Agenda_FastSelectionMode.SelectEvent(Agenda_FastSelectionMode.VisibleEvents[I]);
      Exit;
    end;
  end;
  // ===========================================================================
end;

procedure TAgendaSlideForm.TimerAggiornaTecniciDalTabTimer(
  Sender: TObject);
begin
  (Sender as TTimer).Enabled := False;
  // Procedure che aggiorna i tecnici visibili/invisibili in base alla situazione del TabControl
  RefreshVisibilitaTecniciAgenda;
end;

procedure TAgendaSlideForm.TimerLayoutChangedTimer(Sender: TObject);
begin
  (Sender as TTimer).Enabled := False;
  // Carica i tecnici nel TabControl laterale
  //  NB: L'ho messo anche qui perchè altrimenti se si spostavano le risorse nell'agenda
  //       i Tabs non rispecchiavano più la situazione ma rimanevano come prima.
  CaricaTecnici;
  // Procedure che aggiorna la situazione dei tecnici attualmente visibili
  //  nel TabControl
  RefreshTecniciTabControl;
end;

procedure TAgendaSlideForm.TabControlTecniciMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TabControlTecnici.TabIndex := -1;
  // Attiva il timer per aggiornare i tecnici visibili/invisibili in base alla situazione del TabControl
  //  e in modo ritardato.
  if not TimerAggiornaTecniciDalTab.Enabled then TimerAggiornaTecniciDalTab.Enabled := True;
end;

procedure TAgendaSlideForm.sbTecnici_TuttiClick(Sender: TObject);
begin
  // Procedure che rende visibili tutti i tecnici presenti
  TuttiTecniciVisibili;
end;

procedure TAgendaSlideForm.sbTecnici_MemSetClick(Sender: TObject);
begin
  // Attiva la memorizzazione nelle memorie oppure la disattiva
  if sbTecnici_MemSet.Down then begin
    // Attiva la memorizzazione nelle memorie
    sbTecnici_MemSet.Down := True;
    sbTecnici_Mem1.GroupIndex := 1001;
    sbTecnici_Mem2.GroupIndex := 1002;
    sbTecnici_Mem3.GroupIndex := 1003;
    sbTecnici_Mem4.GroupIndex := 1004;
    sbTecnici_Mem1.Down       := True;
    sbTecnici_Mem2.Down       := True;
    sbTecnici_Mem3.Down       := True;
    sbTecnici_Mem4.Down       := True;
    TimerMemorie.Enabled  := True;
  end else begin
    // Disttiva la memorizzazione nelle memorie
    TimerMemorieTimer(TimerMemorie);
  end;
end;

procedure TAgendaSlideForm.TimerMemorieTimer(Sender: TObject);
begin
  // CHiude la possibilità di memorizzare la vista nelle memorie
  TimerMemorie.Enabled      := False;
  sbTecnici_MemSet.Down     := False;
  sbTecnici_Mem1.Down       := False;
  sbTecnici_Mem2.Down       := False;
  sbTecnici_Mem3.Down       := False;
  sbTecnici_Mem4.Down       := False;
  sbTecnici_Mem1.GroupIndex := 0;
  sbTecnici_Mem2.GroupIndex := 0;
  sbTecnici_Mem3.GroupIndex := 0;
  sbTecnici_Mem4.GroupIndex := 0;
end;

procedure TAgendaSlideForm.sbTecnici_Mem1Click(Sender: TObject);
begin
  // Se siamo in modalità di memorizzazione della vista agenda nelle memorie...
  if sbTecnici_MemSet.Down then begin

    // =========================================================================
    // MEMORIZZAZIONE VISTA NELLE MEMORIE
    // -------------------------------------------------------------------------
    // Disabilita la modalità di memorizzazione
    TimerMemorieTimer(TimerMemorie);
    // Chiede conferma
    //if DM1.Messaggi('Memorizza vista', 'Confermi di voler salvare la vista attuale in questa memoria?', 'NB: La nuova vista sovrascriverà l''eventuale vista precedentemente memorizzata nella stessa memoria.', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
    // Salva la vista attuale
    DM1.SalvaAgendaDevExpress(Agenda_FastSelectionMode, 'M' + RightStr((Sender as TSpeedButtonRollOver).Name, 1));
    // Messaggio di operazione eseguita
    DM1.Messaggi('Memorizza vista', 'Memorizzato.', '', [mbOk], 0, nil);
    // =========================================================================

  end else begin

    // =========================================================================
    // SELEZIONE MEMORIA
    // -------------------------------------------------------------------------
    // Ripristina la vista scelta
    DM1.RipristinaAgendaDevExpress(Agenda_FastSelectionMode, 'M' + RightStr((Sender as TSpeedButtonRollOver).Name, 1));
    // =========================================================================

  end;
end;


procedure TAgendaSlideForm.btvTasksCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
var
  Text: String;
begin
  ADone := True;
  // Disegna il rettangolo di sfondo sfumato
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, ACanvas.Brush.Color, clWhite, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;
  // Traccia il testo
  Text := Sender.DataController.DisplayTexts[AviewInfo.GridRecord.RecordIndex, btvTasks_ListTitle.Index];
  ACanvas.DrawTexT(Text, AviewInfo.TextBounds, cxAlignLeft or cxAlignBottom);
end;

procedure TAgendaSlideForm.btvTasks_CompletedCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  X, Y: Integer;
begin
  ADone := True;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // RIcava le coordinate per posizionare il flag
  X := AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left - TasksImageList.Width) / 2);
  Y := AViewInfo.Bounds.Top + 2;
  // DIsegna il simbolo
  if AViewInfo.Value
    then ACanvas.DrawImage(TasksImageList, X, Y, 1)
    else ACanvas.DrawImage(TasksImageList, X, Y, 0);
end;

procedure TAgendaSlideForm.MainPageControlChange(Sender: TObject);
begin
  // Se è sull'agenda esegue il refresh dell'agenda mentre
  //  se invece è sui Tasks esegue il refresh dei Tasks
  if MainPageControl.ActivePage = TabAgenda then begin
    OpenOrRefreshQuery;
  end else if MainPageControl.ActivePage = TabTasks then begin
    sbTasksRefreshClick(sbTasksRefresh);
  end;
end;


procedure TAgendaSlideForm.btvTasksDblClick(Sender: TObject);
begin
  if btvTasks.Controller.SelectedRecordCount > 0 then begin
    ClientiForm.RxSpeedButtonVisualizzaClick(ClientiForm.RxSpeedButtonVisualizza);
  end;
end;

procedure TAgendaSlideForm.btvTasks_NotesGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  DueDateText: String;
begin
  // Se è specificata una data (DueDate) la aggiunge alle note
  if (not varIsNull(ARecord.Values[btvTasks_DueDate.Index]) and (VarToDateTime(ARecord.Values[btvTasks_DueDate.Index]) > 0)) then begin
    // Determina la stringa da aggiungere alle note
    // Se è oggi...
    if      (DateOf(ARecord.Values[btvTasks_DueDate.Index]) = DateOf(Now))     then DueDateText := 'Oggi'
    // Se è domani
    else if (DateOf(ARecord.Values[btvTasks_DueDate.Index]) = DateOf(Now + 1)) then DueDateText := 'Domani'
    // Se è dopodomani
    else if (DateOf(ARecord.Values[btvTasks_DueDate.Index]) = DateOf(Now + 2)) then DueDateText := 'Dopodomani'
    // Se è ieri
    else if (DateOf(ARecord.Values[btvTasks_DueDate.Index]) = DateOf(Now - 1)) then DueDateText := 'Ieri'
    // Se è l'altro ieri
    else if (DateOf(ARecord.Values[btvTasks_DueDate.Index]) = DateOf(Now - 2)) then DueDateText := 'L''altro ieri'
    // Altrimenti la data
    else DueDateText := FormatDateTime('dd/mm/yyyy', ARecord.Values[btvTasks_DueDate.Index]);
    // Aggiunge la stringa della data alle note a video
    AText := DueDateText + ' - ' + AText;
  end;
end;

procedure TAgendaSlideForm.cxSchedulerDBStorage1EventDeleted(
  Sender: TObject; AEvent: TcxSchedulerEvent; var AHandled: Boolean);
begin
  // Solo un evento alla volta
  if Agenda_FastSelectionMode.SelectedEventCount > 1 then raise Exception.Create('Un evento alla volta per favore.');

  AHandled := True;
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    DM1.EliminaImpegno(QryAgenda, AEvent.GetCustomFieldValueByName('TIPOIMPEGNO'), VarToStr(AEvent.GetCustomFieldValueByName('REGISTRO')), AEvent.ID);
    // refresh
    EseguiQueryAgenda;
  finally
    DM1.CloseWait;
  end;
end;


function TAgendaSlideForm.ResourceId_To_CalendarId(ResourceID: Integer): String;
var
   Qry : TIB_Cursor;
begin
   Qry := TIB_Cursor.Create(nil);
   try
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT GCAL_CALENDAR_ID FROM TECNICI WHERE RESOURCEID = ' + IntToStr(ResourceID));
      Qry.Open;
      if Qry.Eof then raise Exception.Create('ResourceId_To_CalendarId - Risorsa non trovata!');
      Result := Qry.Fields[0].AsString;
      Qry.close;
   finally
      Qry.Free;
   end;
end;


procedure TAgendaSlideForm.cxSchedulerDBStorage1EventModified(
  Sender: TObject; AEvent: TcxSchedulerEvent; var AHandled: Boolean);
var
  NewEventAllDay: Boolean;
begin
  // ===========================================================================
  // AGGIORNAMENTO DI GOOGLE CALENDAR ALLA VARIAZIONE DI UN EVENTO IN AGENDA
  // ---------------------------------------------------------------------------
  // Ovviamente solo se abilitato
  if DM1.GoogleCalendar_Enabled then begin
    // Solo un evento alla volta
    if Agenda_FastSelectionMode.SelectedEventCount > 1 then raise Exception.Create('Un evento alla volta per favore.');
    try
      DM1.ShowWait('Levante', 'Sto comunicando con Google Calendar...');
      // Inizializzazione
      NewEventAllDay := (AEvent.Start = DateOf(AEvent.Start)) and (AEvent.Finish = DateOf(AEvent.Finish));
      // Se abilitato aggiorna l'eventuale evento di google calendar associato
      GCal_MoveEventByMasterID(AEvent.GetCustomFieldValueByName('MASTER_ID'),
                               ResourceId_To_CalendarId(AEvent.ResourceID),
                               NewEventAllDay,
                               AEvent.Start,
                               AEvent.Finish);
    finally
      DM1.CloseWait;
    end;
  end;
  // ===========================================================================
end;

initialization
  RegisterPCPainterClass(TMyPainter);

finalization
  UnregisterPCPainterClass(TMyPainter);

end.
