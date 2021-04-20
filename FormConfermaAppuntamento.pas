unit FormConfermaAppuntamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, cxStyles,
  cxCustomData, cxGraphics, cxCheckBox,
  cxTextEdit, cxCalendar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxClasses, cxGridCustomView,
  cxGrid, StdCtrls, Buttons, DB, IB_Components, ImgList, cxFilter, cxData,
  cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, cxSpinEdit, dxDateRanges, dxScrollbarAnnotations, System.ImageList;

type
  TConfermaAppuntamentoForm = class(TForm)
    cxLabel1: TcxLabel;
    GridAll: TcxGrid;
    btvAll: TcxGridBandedTableView;
    lvAll: TcxGridLevel;
    Label2: TLabel;
    BtnSI: TBitBtn;
    BtnNO: TBitBtn;
    btvAllAPPARECCHIO: TcxGridBandedColumn;
    btvAllUBICAZIONE: TcxGridBandedColumn;
    btvAllPREPARA: TcxGridBandedColumn;
    btvAllALLEGATO: TcxGridBandedColumn;
    btvAllESISTE: TcxGridBandedColumn;
    btvAllPOTENZA: TcxGridBandedColumn;
    Q: TIB_Cursor;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    ImageList1: TImageList;
    btvAllID: TcxGridBandedColumn;
    T: TIB_Transaction;
    eCopiaDatiPrec: TcxCheckBox;
    btvAllBRUC_ID: TcxGridBandedColumn;
    btvAllCOPIE: TcxGridBandedColumn;
    cxStyle6: TcxStyle;
    procedure btvAllPREPARAGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure btvAllCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnNOClick(Sender: TObject);
    procedure btvAllCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure btvAllEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure BtnSIClick(Sender: TObject);
    function CaricaDatiAllegatiFG: Integer;
  private
    fIdImpegno: integer;
    fIdImpegnoLong: integer;
    fIdPratica: integer;
    { Private declarations }
  public
    { Public declarations }
    property IdImpegno:integer read fIdImpegno write fIdImpegno;
    property IdImpegnoLong:integer read fIdImpegnoLong write fIdImpegnoLong;
    property IdPratica:integer read fIdPratica write fIdPratica;
  end;

var
  ConfermaAppuntamentoForm: TConfermaAppuntamentoForm;

implementation

uses DataModule1, StrUtils;

{$R *.dfm}

// Procedure che carica i dati nella griglia
//  NB: RItorna il numero di allegati da creare (mancanti)
function TConfermaAppuntamentoForm.CaricaDatiAllegatiFG: Integer;
var
  RI,i: Integer;
  DC: TcxCustomDataController;
begin
  // Inizializzazione
  Result := 0;
  DC := btvAll.DataController;
  btvAll.BeginUpdate;
  try
    // Svuota la griglia
    DC.RecordCount := 0;
    // Prepara la query che ricava i dati
    if Q.Active then Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT * FROM ALLIMP_TODO(' + IntToStr(IdPratica) + ',' + IntToStr(IdImpegno) + ',' + IntToStr(IdImpegnoLong) + ')');
    // Apre la query
    Q.Open;
    // Cicla per tutti i records trovati e li carica nella griglia
    while not Q.Eof do begin
      // Carica il record attuale
      RI := DC.AppendRecord;
      DC.Values[RI,btvAllID.Index]          := Q.FieldByName('ID').AsInteger;
      DC.Values[RI,btvAllBRUC_ID.Index]     := Q.FieldByName('BRUC_ID').AsInteger;
      DC.Values[RI,btvAllAPPARECCHIO.Index] := Q.FieldByName('APPARECCHIO_FULL').AsString;
      DC.Values[RI,btvAllUBICAZIONE.Index]  := Q.FieldByName('UBICAZIONE').AsString;
      DC.Values[RI,btvAllPOTENZA.Index]     := Q.FieldByName('POTENZA').AsFloat;
      DC.Values[RI,btvAllALLEGATO.Index]    := Q.FieldByName('ALLEGATO').AsString;
      DC.Values[RI,btvAllPREPARA.Index]     := Q.FieldByName('SELEZIONATO').AsString;
      // Carica le copie, default se zero
      if Q.FieldByName('COPIE').AsInteger = 0 then
        DC.Values[RI,btvAllCOPIE.Index] := DM1.TableProgressiviDEFAULTALLEGATIFGCOPIE.AsInteger
      else
        DC.Values[RI,btvAllCOPIE.Index]       := Q.FieldByName('COPIE').AsInteger;
      // Se è un clima e con potenza inferiore a 12kW non deve fare l'allegato
      if (LeftStr(Q.FieldByName('ALLEGATO').AsString, 6) = 'RCEE2 ') and (Q.FieldByName('POTENZA').AsFloat < 12) then
      begin
        DC.Values[RI,btvAllESISTE.Index] := 'T';
        DC.Values[RI,btvAllALLEGATO.Index] := 'Potenza < 12kW';
        DC.Values[RI,btvAllCOPIE.Index] := 0;
      end
      else
        DC.Values[RI,btvAllESISTE.Index]      := Q.FieldByName('ESISTE').AsString;
      // Se l'apparecchio attuale non ha ancora un allegato aggiorna il contatore
      if Q.FieldByName('ESISTE').AsString = 'F' then Inc(Result);
      // Avanti il prossimo
      Q.Next;
    end;
  finally
    // Pulizie finali
    btvAll.EndUpdate;
    if Q.Active then Q.Close;
  end;
end;

procedure TConfermaAppuntamentoForm.btvAllPREPARAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if ARecord.DisplayTexts[btvAllESISTE.Index] = 'T'
  then AText := 'Già creato'
  else AText := 'Allegato ' + ARecord.DisplayTexts[btvAllALLEGATO.Index];
end;

procedure TConfermaAppuntamentoForm.btvAllCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  // Se l'allegato risulta già presente usa un colore più dimesso
  if AViewInfo.GridRecord.DisplayTexts[btvAllESISTE.Index] = 'T' then begin
    // Imposta un colore da secondo piano
    ACanvas.Font.Color := clGray;
    ACanvas.Brush.Color := clSilver;
    // Se stiamo proprio traccianto la colonna di selezione...
    if AViewInfo.Item.Index = btvAllPREPARA.Index then begin
      // Disegna il rettangolo di sfondo
      ACanvas.FillRect(AViewInfo.Bounds);
      // Disegna la Bitmap del divietino per indicare che è un apparecchio dismesso
      ACanvas.DrawImage(ImageList1, (AViewInfo.Bounds.Left + AViewInfo.Bounds.Right - ImageList1.Width) div 2, (AViewInfo.Bounds.Top + AViewInfo.Bounds.Bottom - ImageList1.Height) div 2, 0);
      // Custom Draw
      ADone := True;
    end;
  end;
end;

procedure TConfermaAppuntamentoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  ConfermaAppuntamentoForm := nil;
end;

procedure TConfermaAppuntamentoForm.BtnNOClick(Sender: TObject);
begin
  Close;
end;

procedure TConfermaAppuntamentoForm.btvAllCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  // Altrimenti non mi toglieva i bordi
  // ---------------------------------------------------------------------------
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // Scrive che l'allegato c'è già
  ACanvas.DrawTexT(AViewInfo.Text, AViewInfo.Bounds, (cxAlignHCenter or cxAlignVCenter));
  // Custom Draw
  ADone := True;
end;

procedure TConfermaAppuntamentoForm.btvAllEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
  AAllow := (Sender.Controller.FocusedRecord.DisplayTexts[btvAllESISTE.Index] <> 'T');
end;

procedure TConfermaAppuntamentoForm.BtnSIClick(Sender: TObject);
var
 i: Integer;
 DC: TcxCUstomDataController;
begin
  // Inizializzazione
  DC := btvAll.DataController;
  // Avvia la transazione
  T.StartTransaction;
  try try
    DM1.ShowWait('Levante', 'Creazione allegati...');
    // Cicla per tutti i records
    for i := 0 to DC.RecordCount -1 do begin
      // Se l'allegato attuale non è già stato creato precedentemente e
      //  se l'utente ha scelto di crearlo lo crea
      if  (DC.DisplayTexts[i,btvAllESISTE.Index] <> 'T')
      and (  (LeftStr(DC.DisplayTexts[i,btvAllPREPARA.Index],1) = 'T') or ((LeftStr(DC.DisplayTexts[i,btvAllPREPARA.Index],1) = 'V'))  ) // NB: con la traduzione italiana delle griglie purtroppo i valori booleani possono apparire anche in italiano (Vero/False invece di True/False)
      then
      begin
        // Creazione allegato
        DM1.CreaAllegatoFG(VarToStr(DC.Values[i,btvAllALLEGATO.Index]), IdImpegno, DC.Values[i,btvAllID.Index], DM1.NoNullIntValue(DC, i, btvAllBRUC_ID.Index), DM1.NoNullIntValue(DC, i, btvAllCOPIE.Index), eCopiaDatiPrec.Checked);
      end;
    end;
    T.Commit;
    Close;
  except
    T.Rollback;
    raise;
  end;
  finally
    DM1.CloseWait;
  end;
end;

end.
