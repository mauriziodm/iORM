unit FormDatiRigo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLeftSide, cxContainer, cxEdit, ExtCtrls, bmpPanel,
  dxLayoutLookAndFeels, dxLayoutControl, cxControls, 
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCurrencyEdit, cxLabel,
  cxMemo, cxButtonEdit, cxGridTableView, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DB, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses, cxCheckBox,
  Vcl.StdCtrls, cxRadioGroup, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar;

type
  TDatiRigoForm = class(TLeftSideForm)
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    LeftSideForm: TdxLayoutStandardLookAndFeel;
    cxLabel1: TcxLabel;
    PanelLayout: TPanel;
    dxLayoutControl1: TdxLayoutControl;
    eSottocant1: TcxComboBox;
    eSottocant2: TcxComboBox;
    eSottocant3: TcxComboBox;
    eSottocant4: TcxComboBox;
    eSottocant5: TcxComboBox;
    eSottocant6: TcxComboBox;
    eCodiceArticolo: TcxTextEdit;
    eCostoUNitario: TcxCurrencyEdit;
    eRicarico: TcxCurrencyEdit;
    eRicaricoImporto: TcxCurrencyEdit;
    eSconto1: TcxCurrencyEdit;
    ePrezzoUnitario: TcxCurrencyEdit;
    eSconto2: TcxCurrencyEdit;
    eSconto3: TcxCurrencyEdit;
    eQta: TcxCurrencyEdit;
    eDescrizione: TcxMemo;
    eDescrizioneIVA: TcxButtonEdit;
    eImportoRigoIvaComp: TcxCurrencyEdit;
    eImportoRigo: TcxCurrencyEdit;
    ePrzUnitIvaComp: TcxCurrencyEdit;
    eUM: TcxTextEdit;
    eNoteRigo: TcxTextEdit;
    eTipo1: TcxComboBox;
    eTipo2: TcxComboBox;
    eTipo3: TcxComboBox;
    eTipo4: TcxComboBox;
    eTipo5: TcxComboBox;
    eTipo6: TcxComboBox;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup2: TdxLayoutGroup;
    gCodiceDescrizione: TdxLayoutGroup;
    iCodiceArticolo: TdxLayoutItem;
    iDescrizione: TdxLayoutItem;
    gVendita: TdxLayoutGroup;
    dxLayoutControl1Group3: TdxLayoutGroup;
    iPrezzoUnitario: TdxLayoutItem;
    iPrzUnitIvaComp: TdxLayoutItem;
    gScontiVendita: TdxLayoutGroup;
    iSconto1: TdxLayoutItem;
    iSconto2: TdxLayoutItem;
    iSconto3: TdxLayoutItem;
    gUMQta: TdxLayoutGroup;
    iUM: TdxLayoutItem;
    iQta: TdxLayoutItem;
    iImportoRigo: TdxLayoutItem;
    iImportoRigoIvaComp: TdxLayoutItem;
    gIVA: TdxLayoutGroup;
    iDescrizioneIVA: TdxLayoutItem;
    gCosto: TdxLayoutGroup;
    iCostoUnitario: TdxLayoutItem;
    gRicarico: TdxLayoutGroup;
    iRicarico: TdxLayoutItem;
    iRicaricoImporto: TdxLayoutItem;
    gSottocantieri: TdxLayoutGroup;
    iSottocantiere1: TdxLayoutItem;
    iSottocantiere2: TdxLayoutItem;
    iSottocantiere3: TdxLayoutItem;
    iSottocantiere4: TdxLayoutItem;
    iSottocantiere5: TdxLayoutItem;
    iSottocantiere6: TdxLayoutItem;
    gTipiRighi: TdxLayoutGroup;
    iTipo1: TdxLayoutItem;
    iTipo2: TdxLayoutItem;
    iTipo3: TdxLayoutItem;
    iTipo4: TdxLayoutItem;
    iTipo5: TdxLayoutItem;
    iTipo6: TdxLayoutItem;
    gNoteRigo: TdxLayoutGroup;
    iNoteRigo: TdxLayoutItem;
    eIDApparecchio: TcxLookupComboBox;
    iIdApparecchio: TdxLayoutItem;
    iRowSection: TdxLayoutItem;
    eRowSection: TcxComboBox;
    eRowType: TcxComboBox;
    iRowType: TdxLayoutItem;
    iPrezzoUnitarioAutocalc: TdxLayoutItem;
    gRowInfo: TdxLayoutGroup;
    iRowPrintPrices: TdxLayoutItem;
    ePrezzoUnitarioAutocalc: TcxCheckBox;
    eRowPrintPrices: TcxCheckBox;
    gRowInfoChecks: TdxLayoutGroup;
    cbDatiRigoOff: TcxCheckBox;
    eADG_TipoDato: TcxTextEdit;
    gAltriDatiGestionali1: TdxLayoutGroup;
    iADG_TipoDato: TdxLayoutItem;
    cxTextEdit1: TcxTextEdit;
    iADG_RiferimentoTesto: TdxLayoutItem;
    iADG_RiferimentoNumero: TdxLayoutItem;
    iADG_RiferimentoData: TdxLayoutItem;
    eADG_Riferimentotesto: TcxTextEdit;
    eADG_RiferimentoNumero: TcxCurrencyEdit;
    eADG_RiferimentoData: TcxDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure eDescrizioneIVAPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ePrezzoUnitarioPropertiesEditValueChanged(Sender: TObject);
    procedure ePrzUnitIvaCompPropertiesEditValueChanged(Sender: TObject);
    procedure eSconto1PropertiesEditValueChanged(Sender: TObject);
    procedure eSconto2PropertiesEditValueChanged(Sender: TObject);
    procedure eSconto3PropertiesEditValueChanged(Sender: TObject);
    procedure eQtaPropertiesEditValueChanged(Sender: TObject);
    procedure eCostoUNitarioPropertiesEditValueChanged(Sender: TObject);
    procedure eRicaricoPropertiesEditValueChanged(Sender: TObject);
    procedure eSottocant1PropertiesChange(Sender: TObject);
    procedure eSottocant2PropertiesChange(Sender: TObject);
    procedure eSottocant3PropertiesChange(Sender: TObject);
    procedure eSottocant4PropertiesChange(Sender: TObject);
    procedure eSottocant5PropertiesChange(Sender: TObject);
    procedure eSottocant6PropertiesChange(Sender: TObject);
    procedure eDescrizionePropertiesEditValueChanged(Sender: TObject);
    procedure eUMPropertiesEditValueChanged(Sender: TObject);
    procedure eNoteRigoPropertiesEditValueChanged(Sender: TObject);
    procedure eCostoUNitarioEditing(Sender: TObject; var CanEdit: Boolean);
    procedure eTipo1PropertiesEditValueChanged(Sender: TObject);
    procedure eTipo2PropertiesEditValueChanged(Sender: TObject);
    procedure eTipo3PropertiesEditValueChanged(Sender: TObject);
    procedure eTipo4PropertiesEditValueChanged(Sender: TObject);
    procedure eTipo5PropertiesEditValueChanged(Sender: TObject);
    procedure eTipo6PropertiesEditValueChanged(Sender: TObject);
    procedure eIDApparecchioPropertiesChange(Sender: TObject);
    procedure eIDApparecchioPropertiesEditValueChanged(Sender: TObject);
    procedure eRowSectionPropertiesEditValueChanged(Sender: TObject);
    procedure eRowTypePropertiesEditValueChanged(Sender: TObject);
    procedure ePrezzoUnitarioAutocalcPropertiesEditValueChanged(Sender: TObject);
    procedure ePrintPricesPropertiesEditValueChanged(Sender: TObject);
    procedure cbDatiRigoOffPropertiesChange(Sender: TObject);
    procedure eADG_TipoDatoPropertiesEditValueChanged(Sender: TObject);
    procedure eADG_RiferimentotestoPropertiesEditValueChanged(Sender: TObject);
    procedure eADG_RiferimentoNumeroPropertiesEditValueChanged(Sender: TObject);
    procedure eADG_RiferimentoDataPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    // Flag che indica se il codice degli evento OnChange dei controlli deve essere eseguito oppure no
    fOnChangeEventEnabled: Boolean;
    fPratApparecchiDataSource: TDataSource;
    procedure ChangeValue(Col: TcxGridColumn; NewValue: Variant);
  public
    { Public declarations }
    property OnChangeEventEnabled : Boolean read fOnChangeEventEnabled write fOnChangeEventEnabled;
    // Proprietà che punta al Dataset dei dati degli apparecchi
    property PratApparecchiDataSource:TDataSource read fPratApparecchiDataSource write fPratApparecchiDataSource; 
  end;

var
  DatiRigoForm: TDatiRigoForm;

implementation

uses SchedaPreventiviOrdini, cxGridCustomTableView,
  DataModule1;

{$R *.dfm}

// Procedura che si occupa di inserire il nuovo valore inserito nella form a sx
//  contenente i dati del rigo attuale, nella griglia come se fosse stato inserito effettivamente
//  nella griglia stessa.
procedure TDatiRigoForm.cbDatiRigoOffPropertiesChange(Sender: TObject);
begin
  inherited;
  dxLayoutControl1.Visible := False;
  PreventiviOrdiniForm.AggiornaDatiRigoForm(PreventiviOrdiniForm.QryDocumento);
end;

procedure TDatiRigoForm.ChangeValue(Col:TcxGridColumn; NewValue:Variant);
var
  TV: TcxGridTableView;
  i, PrecFocusedRecordIndex, NotifyCount: Integer;
begin
  // inizializzazione
  NotifyCount := 0;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Flag che viene meso a True quando si modificano i dati di un rigo dal pannello laterale
    //  in modo da disabilitare il ricalcolo automatico dei totali e altro quando si modifica
    //  una campo sempre dal pannello laterale quando ci sono molto righi selezionati.
    //  Prima ci metteva una vita.
    PreventiviordiniForm.fModificandoDaDatiRigoForm := True;
    try
      // Operazione in corso...
      inc(NotifyCount, 1);
      if (NotifyCount >= 33) then begin
        DM1.ShowWait('Levante', 'Operazione in corso...');
        NotifyCount := 0;
      end;
      // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
      TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
      TV.BeginUpdate;
      try
        // Salva l'indice del focused record attuale
        PrecFocusedRecordIndex := TV.DataController.FocusedRecordIndex;
        // cicla per tutti i records selezionati
        for i := 0 to TV.Controller.SelectedRecordCount -1 do begin
          DM1.ShowWait('Levante', 'Variazione riga ' + IntTostr(i+1) + ' su ' + IntToStr(TV.Controller.SelectedRecordCount) + ' righe selezionate.');
          // Rende focused il record selezionato attuale
          TV.Controller.SelectedRecords[i].Focused := True;
          // Se è un rigo di riferimento lo salta
          if (   (DM1.NoNullIntValue(TV.DataController,TV.DataController.FocusedRecordIndex,PreventiviOrdiniForm.tvCorpoCODICEIVA.Index) <> -9)
          and (DM1.StrLeft(DM1.NoNullStringValue(TV.DataController,TV.DataController.FocusedRecordIndex,PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index), 4) <> '--->')   )
          then
          begin
            // Aggiorna il valore nel corpo del documento
            TV.Controller.FocusedRecord.Values[Col.Index] := NewValue;
            // RIchiama il gestore di evento del corpo documento che gestisce cosa succede quando
            //  l'utente varia un valore di una colonna.
            PreventiviOrdiniForm.tvCorpoEditValueChanged(TV, Col);
          end;
        end;
        // Ripristina il selected record index
        TV.DataController.FocusedRecordIndex := PrecFocusedRecordIndex;
      finally
        TV. EndUpdate;
      end;
    finally
      PreventiviordiniForm.fModificandoDaDatiRigoForm := False;
      DM1.CloseWait;
      // Se abilitato e necessario ricalcola i totali del documento
      PreventiviOrdiniForm.CalcolaTotali(False);
      // Aggiorna i dati del rigo nella form a destra
      PreventiviordiniForm.AggiornaDatiRigoForm(PreventiviordiniForm.QryDocumento);
    end;
  end;
end;

procedure TDatiRigoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DatiRigoForm := nil;
end;

procedure TDatiRigoForm.FormShow(Sender: TObject);
begin
  inherited;
  // POsiziona e dimensiona il layoutControl
  PanelLayout.Left := Sfondo.Left + 4;
  PanelLayout.Top := Sfondo.Top + 79;
  PanelLayout.Width := Sfondo.Width - 4;
  PanelLayout.Height := Sfondo.Height + 4;
  Update;
end;

procedure TDatiRigoForm.eDescrizioneIVAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  PreventiviOrdiniForm.SelectIVAFocusedRow;
end;

procedure TDatiRigoForm.ePrezzoUnitarioAutocalcPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    if ePrezzoUnitarioAutocalc.Checked then
      ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOAUTOCALC.Index], 'T')
    else
      ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOAUTOCALC.Index], 'F');
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.ePrezzoUnitarioPropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Index], ePrezzoUnitario.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.ePrintPricesPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    if eRowPrintPrices.Checked then
      ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoROWPRINTPRICES.Index], 'T')
    else
      ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoROWPRINTPRICES.Index], 'F');
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.ePrzUnitIvaCompPropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Index], ePrzUnitIvaComp.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSconto1PropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSCONTORIGO.Index], eSconto1.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSconto2PropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Index], eSconto2.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSconto3PropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Index], eSconto3.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eQtaPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoQTA.Index], eQta.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eCostoUNitarioPropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoPREZZOACQUISTOARTICOLO.Index], eCostoUNitario.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eRicaricoPropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoMARGINE.Index], eRicarico.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eRowSectionPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoROWSECTION.Index], eRowSection.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eRowTypePropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoROWTYPE.Index], eRowType.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSottocant1PropertiesChange(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSOTTOCANTIERE1.Index], eSottocant1.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSottocant2PropertiesChange(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSOTTOCANTIERE2.Index], eSottocant2.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSottocant3PropertiesChange(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSOTTOCANTIERE3.Index], eSottocant3.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSottocant4PropertiesChange(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSOTTOCANTIERE4.Index], eSottocant4.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSottocant5PropertiesChange(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSOTTOCANTIERE5.Index], eSottocant5.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eSottocant6PropertiesChange(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoSOTTOCANTIERE6.Index], eSottocant6.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eDescrizionePropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index], eDescrizione.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eUMPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Index], eUM.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eNoteRigoPropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoNOTERIGO.Index], eNoteRigo.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eADG_RiferimentoDataPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoADG1_RIFERIMENTODATA.Index], eADG_RiferimentoData.Date);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eADG_RiferimentoNumeroPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoADG1_RIFERIMENTONUMERO.Index], eADG_RiferimentoNumero.Value);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eADG_RiferimentotestoPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoADG1_RIFERIMENTOTESTO.Index], eADG_Riferimentotesto.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eADG_TipoDatoPropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoADG1_TIPODATO.Index], eADG_TipoDato.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eCostoUNitarioEditing(Sender: TObject;
  var CanEdit: Boolean);
begin
  inherited;
  CanEdit := (not DM1.IsDocumentoDiIngresso(PreventiviOrdiniForm.QryDocumentoTIPODOCUMENTO.AsString)) and (not DM1.CodiceIsManodopera(DM1.NoNullStringValue(PreventiviOrdiniForm.tvCorpo.Datacontroller, PreventiviOrdiniForm.tvCorpo.DataController.FOcusedRecordIndex, PreventiviOrdiniForm.tvCorpoCODICEARTICOLO.Index)));
  if not CanEdit then DM1.Messaggi('Levante', 'Non è possibile modificare questo dato nei documenti di acquisto.', '', [mbOk], 0, nil);
end;

procedure TDatiRigoForm.eTipo1PropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then
    Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoTIPO1.Index], eTipo1.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eTipo2PropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoTIPO2.Index], eTipo2.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eTipo3PropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoTIPO3.Index], eTipo3.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eTipo4PropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoTIPO4.Index], eTipo4.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eTipo5PropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoTIPO5.Index], eTipo5.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eTipo6PropertiesEditValueChanged(Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoTIPO6.Index], eTipo6.Text);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

procedure TDatiRigoForm.eIDApparecchioPropertiesChange(Sender: TObject);
begin
  inherited;
  eIDApparecchio.Hint := eIDApparecchio.EditText;
end;

procedure TDatiRigoForm.eIDApparecchioPropertiesEditValueChanged(
  Sender: TObject);
var
  TV: TcxGridTableView;
begin
  inherited;
  // Se l'esecuzione del gestore dell'evento non è autorizzata esce subito
  if not OnChangeEventEnabled then Exit;
  // Continua solo se la View selezionata della GridCorpo è una TableView
  if PreventiviOrdiniForm.GridCorpo.FocusedView is TcxGridTableView then begin
    // Per comodità TV punta alla TableView attualmente selezionata nel corpo documento
    TV := PreventiviOrdiniForm.GridCorpo.FocusedView as TcxGridTableView;
    // Richiama la procedura per la variazione del valore
    ChangeValue(TV.Columns[PreventiviOrdiniForm.tvCorpoIDAPPARECCHIO.Index], eIDApparecchio.EditValue);
  end;
  // RImette il focus su ste stesso
  (Sender as TcxControl).SetFocus;
end;

end.
