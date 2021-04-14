unit FormLevanteListAnag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevante, ExtCtrls, bmpPanel, cxStyles, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB,
  cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd,
  dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, Vcl.Menus, IBODataset,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Buttons,
  cxGraphics, MAURI_SB, dxPScxPivotGridLnk, dxPScxSchedulerLnk, dxDateRanges,
  dxScrollbarAnnotations;

const
  DBLCLICK_MODE_ARCHIVE = 0;
  DBLCLICK_MODE_SELECTION = 1;

type
  TDblClickMode = (DblClickModeArchive, DblClickModeSelection);

  TLevanteListAnagForm = class(TLevanteForm)
    PanelGriglia: TPanel;
    GridList: TcxGrid;
    tvList: TcxGridDBTableView;
    lvList: TcxGridLevel;
    Q: TIBOQuery;
    DS: TDataSource;
    MenuGriglia: TPopupMenu;
    Selezionavista1: TMenuItem;
    Salvalavistaattuale1: TMenuItem;
    Ripristinacolonneeliminate1: TMenuItem;
    dxPrinter: TdxComponentPrinter;
    dxPrinterLink1: TdxGridReportLink;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject); virtual;
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject); virtual;
    procedure RxSpeedButtonVisualizzaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvListCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvListKeyPress(Sender: TObject; var Key: Char);
    procedure tvListCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure tvListCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure MenuGrigliaPopup(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure Salvalavistaattuale1Click(Sender: TObject);
    procedure Ripristinacolonneeliminate1Click(Sender: TObject);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure RxSpeedButtonResetQueryClick(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dxPrinterStartGenerateReport(Sender: TObject;
      AReportLink: TBasedxReportLink);
    procedure dxPrinterEndGenerateReport(Sender: TObject;
      AReportLink: TBasedxReportLink);
    procedure ClientAreaResize(Sender: TObject);
  private
    FCallerCode:Integer;
    { Private declarations }
  protected
    procedure EseguiQuery; virtual;
  public
    { Public declarations }
    DblClickMode: TDblClickMode;
    property CallerCode:Integer read FCallerCode write FCallerCode;
  end;

var
  LevanteListAnagForm: TLevanteListAnagForm;

implementation

uses main, DataModule1, StrUtils, DataModuleStyles;

{$R *.dfm}

procedure TLevanteListAnagForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   //  NB: Questa riga l'ho messa perchè penso che questo tipo di form
   //       verrà usato solo per form che fanno parte delle impostazioni
   MainForm.SBImpostazioni.Down := False;
end;

procedure TLevanteListAnagForm.FormCreate(Sender: TObject);
begin
  inherited;
   // Inizializzazione
   DblClickMode := DblClickModeArchive;
   CallerCode := 0;
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

procedure TLevanteListAnagForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

procedure TLevanteListAnagForm.FormShow(Sender: TObject);
begin
  inherited;
   // Rende visibile solo la griglia e nascosti i campi
   PanelGriglia.Visible := True;
   PanelGriglia.Align := alTop;
   // Disattiva la scroll bar verticale della Client Area
   ClientArea.VertScrollBar.Visible := False;
   // Ripristina la vista predefinita
   DM1.RipristinaDevExpress(GridList, '', True);
   // Apre la Query per il reperimento dei dati
   RxSpeedButtonTrovaClick(Self);
end;

procedure TLevanteListAnagForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
   if PanelGriglia.Visible then begin
      inherited;
   end else begin
      // Griglia visibile che copre il resto
      PanelGriglia.Visible  := True;
      // Disattiva la scroll bar verticale della Client Area
      ClientArea.VertScrollBar.Visible := False;
      // Risistema i pulsanti per la fase di elenco
      RxSpeedModifica.Enabled           := False;
      RxSpeedButtonNuovo.Enabled        := True;
      RxSpeedButtonElimina.Enabled      := True;
      RxSpeedButtonVisualizza.Enabled   := True;
      RxSpeedButtonStampa.Enabled       := True;
   end;
end;

procedure TLevanteListAnagForm.RxSpeedModificaClick(Sender: TObject);
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
          PanelGriglia.Enabled           := False;
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
          PanelGriglia.Enabled        := True;
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

procedure TLevanteListAnagForm.RxSpeedButtonNuovoClick(Sender: TObject);
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

procedure TLevanteListAnagForm.RxSpeedButtonEliminaClick(Sender: TObject);
var
   CodMag:Longint;
begin
  inherited;
  // Chiede conferma
  if DM1.Messaggi('Elimina', 'Eliminare le voci selezionate?', '', [mbYes,mbNo], 0, nil) = mrYes then
  begin
    tvList.Controller.DeleteSelection;
  end;
end;

procedure TLevanteListAnagForm.ClientAreaResize(Sender: TObject);
begin
  inherited;
  PanelGriglia.Height := ClientArea.Height;
end;

procedure TLevanteListAnagForm.dxPrinterEndGenerateReport(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  inherited;
  // Richiama il gestorei di defuault dell'evento
  if AReportLink.Component.ClassType = TcxGrid
  then DM1.RestoreGridAfterReport(AReportLink.Component as TcxGrid, False);
end;

procedure TLevanteListAnagForm.dxPrinterStartGenerateReport(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  inherited;
  if AReportLink.Component.ClassType = TcxGrid
  then DM1.PrepareGridForReport(AReportLink.Component as TcxGrid, False);
end;

procedure TLevanteListAnagForm.EseguiQuery;
begin
   // Esegue la query
   if Q.Active then Q.Close;
   if not Q.Prepared then Q.Prepare;
   Q.Open;
end;

procedure TLevanteListAnagForm.RxSpeedButtonTrovaClick(Sender: TObject);
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

procedure TLevanteListAnagForm.RxSpeedButtonVisualizzaClick(
  Sender: TObject);
begin
  inherited;
   // Aggiorna l'aspetto della form per farla passare alla modalità Anagrafica
   // ------------------------------------------------------------------------
   // Griglia invisibile
   PanelGriglia.Visible := False;
   // Riattiva la scroll bar verticale della Client Area
   ClientArea.VertScrollBar.Visible := True;
   // Aggiorna lo stato dei pulsanti per la modalità Anagrafica
   RxSpeedModifica.Enabled           := True;
   RxSpeedButtonNuovo.Enabled        := False;
   RxSpeedButtonElimina.Enabled      := False;
   RxSpeedButtonVisualizza.Enabled   := False;
   RxSpeedButtonStampa.Enabled       := False;
end;

procedure TLevanteListAnagForm.RxSpeedButtonVisualizzaDragOver(Sender,
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
            if (Name = 'tvList')
            then accept := True;
         end;
      end;
   end;
end;

procedure TLevanteListAnagForm.tvListCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TLevanteListAnagForm.tvListDblClick(Sender: TObject);
begin
  inherited;
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   // Se la proprietà Tag della form = 0 apre la voce per default
   if Self.DblClickMode = DblClickModeArchive then RxSpeedButtonVisualizzaClick(Self);
end;

procedure TLevanteListAnagForm.tvListEndDrag(Sender, Target: TObject; X,
  Y: Integer);
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

procedure TLevanteListAnagForm.tvListKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TLevanteListAnagForm.tvListCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TLevanteListAnagForm.tvListCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
var
  CurrColor: TColor;
begin
  // Inizializzazione
  ADone := True;

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender.Styles as TcxGridTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Campo
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [fsBold];
//  ACanvas.DrawTexT('    ' + AViewInfo.GridRecord.DisplayTexts[AViewInfo.Text   tvScadTIPOLOGIA.Index], AViewInfo.TextAreaBounds, cxAlignLeft or cxAlignBottom);
  ACanvas.DrawTexT('    ' + AviewInfo.Text, AViewInfo.TextAreaBounds, cxAlignLeft or cxAlignBottom);

  ACanvas.DrawComplexFrame(AViewInfo.Bounds, (Sender as TcxGridDBTableView).OptionsView.GridLineColor, (Sender as TcxGridDBTableView).OptionsView.GridLineColor, [bTop], 1);
end;

procedure TLevanteListAnagForm.MenuGrigliaPopup(Sender: TObject);
var
   SearchRec:TSearchRec;
   TmpStr:String;
   CurrGrid:TcxGrid;
   CurrMenuItem:TMenuItem;
begin
   inherited;
   // ==========================================================================
   // Caricamento delle viste delle griglia attualmente visualizzata
   // --------------------------------------------------------------------------
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridList;
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
      if FindFirst(DM1.ImpGridsDir + CurrGrid.Owner.Name + '___' + CurrGrid.Name + '___*.ini', faAnyFile, SearchRec) = 0 then begin
         // Se lo trova inserisce il nome della vista nell'elenco
         TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name)-Length(CurrGrid.Owner.Name + '___' + CurrGrid.Name)-3);
         CurrMenuItem := TMenuItem.Create(Self);
         CurrMenuItem.Caption := LeftStr(TmpStr, Length(TmpStr)-4);
         CurrMenuItem.OnClick := Selezionavista1Click;
         Selezionavista1.Add(CurrMenuItem);
         // Trova anche gli eventuali altri files dello stesso tipo
         while (FindNext(SearchRec) = 0) do begin
            // Se lo trova inserisce il nome della vista nell'elenco
            TmpStr := RightStr(SearchRec.Name,  Length(SearchRec.Name)-Length(CurrGrid.Owner.Name + '___' + CurrGrid.Name)-3);
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

procedure TLevanteListAnagForm.Selezionavista1Click(Sender: TObject);
var
   CurrGrid:TcxGrid;
   CurrItemCaption:String;
begin
   inherited;
   // Caption della voce selezionata
   CurrItemCaption := (Sender as TMenuItem).Caption;
   CurrItemCaption := RightStr(CurrItemCaption, Length(CurrItemCaption)-1);  // Elimina la & che mi ritrovo all'inizio
   // Se la voce attuale è la radice del menu di selezione viste esce subito
   if (Sender as TMenuItem).Name = 'Selezionavista1' then Exit;
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridList;
   // Carica la vista attuale
   DM1.RipristinaDevExpress(CurrGrid, CurrItemCaption, True);
end;

procedure TLevanteListAnagForm.Salvalavistaattuale1Click(Sender: TObject);
var
   Vista:String;
begin
      inherited;
      // Chiede il nome della vista
      if InputQuery('Salvataggio vista', 'Con quale nome devo salvare la vista?', Vista) then begin
         // Controlla che la vista non sia nullo
         if Trim(Vista) = '' then raise Exception.Create('Il nome della vista non può essere vuoto.');
      end else begin
         // Se l'utente ha cliccato su Cancel annulla l'operazione
         Exit;
      end;
      // Salva le impostazioni delle colonne dei clienti
      DM1.SalvaGriglieDevExpress(GridList, Vista, True);
end;

procedure TLevanteListAnagForm.Ripristinacolonneeliminate1Click(
  Sender: TObject);
begin
  inherited;
  tvList.Controller.Customization := True
end;

procedure TLevanteListAnagForm.tvListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Se il rigo del filtro (FilterRow) usa il colore specificato appositamente
  //  in ogni caso, anche se è il rigo selezionato che mi piace di più
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then begin
    ACanvas.Brush.Color := (Sender as TcxGridDBTableView).Styles.FilterRowInfoText.Color;
    Exit;
  end;
end;

procedure TLevanteListAnagForm.RxSpeedButtonResetQueryClick(
  Sender: TObject);
begin
  inherited;
  // Azzera i filtri
  tvList.DataController.Filter.Clear;
end;

procedure TLevanteListAnagForm.RxSpeedButtonStampaClick(Sender: TObject);
begin
  inherited;
  dxPrinter.Print(True, nil);
end;

procedure TLevanteListAnagForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbRight then
  begin
    dxPrinter.Preview(True);
  end;
end;

end.
