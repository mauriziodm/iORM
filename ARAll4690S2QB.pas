unit ARAll4690S2QB;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, ClassPuzzleLayer,
  ClassPuzzleObject, DB;

const
  APPARECCHI_MAX_RIGHE = 16;

type
  TAll4690S2QBQR = class(TQuickRep)
    QRBandSchema: TQRBand;
    Schema: TQRImage;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape3: TQRShape;
    QRShape10: TQRShape;
    QRLabel53: TQRLabel;
    CheckDichiaroMarcaturaCE: TQRLabel;
    QRShape4: TQRShape;
    QRLabel26: TQRLabel;
    QRShape5: TQRShape;
    QRLabel27: TQRLabel;
    QRShape6: TQRShape;
    QRLabel28: TQRLabel;
    QRShape7: TQRShape;
    QRLabel29: TQRLabel;
    QRShape8: TQRShape;
    QRLabel30: TQRLabel;
    QRShape9: TQRShape;
    QRLabel31: TQRLabel;
    QRShape11: TQRShape;
    QRLabel32: TQRLabel;
    QRShape12: TQRShape;
    QRLabel33: TQRLabel;
    QRShape13: TQRShape;
    QRLabel34: TQRLabel;
    QRShape14: TQRShape;
    QRLabel35: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    LabApp_0_0: TQRLabel;
    LabApp_0_1: TQRLabel;
    LabApp_0_2: TQRLabel;
    LabApp_0_4: TQRLabel;
    LabApp_0_5: TQRLabel;
    LabApp_0_6: TQRLabel;
    LabApp_0_7: TQRLabel;
    LabApp_0_3: TQRLabel;
    LabApp_0_8: TQRLabel;
    LabApp_0_9: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    LabApp_1_0: TQRLabel;
    LabApp_1_1: TQRLabel;
    LabApp_1_2: TQRLabel;
    LabApp_1_4: TQRLabel;
    LabApp_1_5: TQRLabel;
    LabApp_1_6: TQRLabel;
    LabApp_1_7: TQRLabel;
    LabApp_1_3: TQRLabel;
    LabApp_1_8: TQRLabel;
    LabApp_1_9: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    LabApp_2_0: TQRLabel;
    LabApp_2_1: TQRLabel;
    LabApp_2_2: TQRLabel;
    LabApp_2_4: TQRLabel;
    LabApp_2_5: TQRLabel;
    LabApp_2_6: TQRLabel;
    LabApp_2_7: TQRLabel;
    LabApp_2_3: TQRLabel;
    LabApp_2_8: TQRLabel;
    LabApp_2_9: TQRLabel;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    LabApp_3_0: TQRLabel;
    LabApp_3_1: TQRLabel;
    LabApp_3_2: TQRLabel;
    LabApp_3_4: TQRLabel;
    LabApp_3_5: TQRLabel;
    LabApp_3_6: TQRLabel;
    LabApp_3_7: TQRLabel;
    LabApp_3_3: TQRLabel;
    LabApp_3_8: TQRLabel;
    LabApp_3_9: TQRLabel;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    LabApp_4_0: TQRLabel;
    LabApp_4_1: TQRLabel;
    LabApp_4_2: TQRLabel;
    LabApp_4_4: TQRLabel;
    LabApp_4_5: TQRLabel;
    LabApp_4_6: TQRLabel;
    LabApp_4_7: TQRLabel;
    LabApp_4_3: TQRLabel;
    LabApp_4_8: TQRLabel;
    LabApp_4_9: TQRLabel;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    LabApp_5_0: TQRLabel;
    LabApp_5_1: TQRLabel;
    LabApp_5_2: TQRLabel;
    LabApp_5_4: TQRLabel;
    LabApp_5_5: TQRLabel;
    LabApp_5_6: TQRLabel;
    LabApp_5_7: TQRLabel;
    LabApp_5_3: TQRLabel;
    LabApp_5_8: TQRLabel;
    LabApp_5_9: TQRLabel;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    LabApp_6_0: TQRLabel;
    LabApp_6_1: TQRLabel;
    LabApp_6_2: TQRLabel;
    LabApp_6_4: TQRLabel;
    LabApp_6_5: TQRLabel;
    LabApp_6_6: TQRLabel;
    LabApp_6_7: TQRLabel;
    LabApp_6_3: TQRLabel;
    LabApp_6_8: TQRLabel;
    LabApp_6_9: TQRLabel;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    LabApp_7_0: TQRLabel;
    LabApp_7_1: TQRLabel;
    LabApp_7_2: TQRLabel;
    LabApp_7_4: TQRLabel;
    LabApp_7_5: TQRLabel;
    LabApp_7_6: TQRLabel;
    LabApp_7_7: TQRLabel;
    LabApp_7_3: TQRLabel;
    LabApp_7_8: TQRLabel;
    LabApp_7_9: TQRLabel;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRShape104: TQRShape;
    LabApp_8_0: TQRLabel;
    LabApp_8_1: TQRLabel;
    LabApp_8_2: TQRLabel;
    LabApp_8_4: TQRLabel;
    LabApp_8_5: TQRLabel;
    LabApp_8_6: TQRLabel;
    LabApp_8_7: TQRLabel;
    LabApp_8_3: TQRLabel;
    LabApp_8_8: TQRLabel;
    LabApp_8_9: TQRLabel;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShape113: TQRShape;
    QRShape114: TQRShape;
    LabApp_9_0: TQRLabel;
    LabApp_9_1: TQRLabel;
    LabApp_9_2: TQRLabel;
    LabApp_9_4: TQRLabel;
    LabApp_9_5: TQRLabel;
    LabApp_9_6: TQRLabel;
    LabApp_9_7: TQRLabel;
    LabApp_9_3: TQRLabel;
    LabApp_9_8: TQRLabel;
    LabApp_9_9: TQRLabel;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape121: TQRShape;
    QRShape122: TQRShape;
    QRShape123: TQRShape;
    QRShape124: TQRShape;
    LabApp_10_0: TQRLabel;
    LabApp_10_1: TQRLabel;
    LabApp_10_2: TQRLabel;
    LabApp_10_4: TQRLabel;
    LabApp_10_5: TQRLabel;
    LabApp_10_6: TQRLabel;
    LabApp_10_7: TQRLabel;
    LabApp_10_3: TQRLabel;
    LabApp_10_8: TQRLabel;
    LabApp_10_9: TQRLabel;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape127: TQRShape;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRShape130: TQRShape;
    QRShape131: TQRShape;
    QRShape132: TQRShape;
    QRShape133: TQRShape;
    QRShape134: TQRShape;
    LabApp_11_0: TQRLabel;
    LabApp_11_1: TQRLabel;
    LabApp_11_2: TQRLabel;
    LabApp_11_4: TQRLabel;
    LabApp_11_5: TQRLabel;
    LabApp_11_6: TQRLabel;
    LabApp_11_7: TQRLabel;
    LabApp_11_3: TQRLabel;
    LabApp_11_8: TQRLabel;
    LabApp_11_9: TQRLabel;
    QRShape135: TQRShape;
    QRShape136: TQRShape;
    QRShape137: TQRShape;
    QRShape138: TQRShape;
    QRShape139: TQRShape;
    QRShape140: TQRShape;
    QRShape141: TQRShape;
    QRShape142: TQRShape;
    QRShape143: TQRShape;
    QRShape144: TQRShape;
    LabApp_12_0: TQRLabel;
    LabApp_12_1: TQRLabel;
    LabApp_12_2: TQRLabel;
    LabApp_12_4: TQRLabel;
    LabApp_12_5: TQRLabel;
    LabApp_12_6: TQRLabel;
    LabApp_12_7: TQRLabel;
    LabApp_12_3: TQRLabel;
    LabApp_12_8: TQRLabel;
    LabApp_12_9: TQRLabel;
    QRShape145: TQRShape;
    QRShape146: TQRShape;
    QRShape147: TQRShape;
    QRShape148: TQRShape;
    QRShape149: TQRShape;
    QRShape150: TQRShape;
    QRShape151: TQRShape;
    QRShape152: TQRShape;
    QRShape153: TQRShape;
    QRShape154: TQRShape;
    LabApp_13_0: TQRLabel;
    LabApp_13_1: TQRLabel;
    LabApp_13_2: TQRLabel;
    LabApp_13_4: TQRLabel;
    LabApp_13_5: TQRLabel;
    LabApp_13_6: TQRLabel;
    LabApp_13_7: TQRLabel;
    LabApp_13_3: TQRLabel;
    LabApp_13_8: TQRLabel;
    LabApp_13_9: TQRLabel;
    QRShape155: TQRShape;
    QRShape156: TQRShape;
    QRShape157: TQRShape;
    QRShape158: TQRShape;
    QRShape159: TQRShape;
    QRShape160: TQRShape;
    QRShape161: TQRShape;
    QRShape162: TQRShape;
    QRShape163: TQRShape;
    QRShape164: TQRShape;
    LabApp_14_0: TQRLabel;
    LabApp_14_1: TQRLabel;
    LabApp_14_2: TQRLabel;
    LabApp_14_4: TQRLabel;
    LabApp_14_5: TQRLabel;
    LabApp_14_6: TQRLabel;
    LabApp_14_7: TQRLabel;
    LabApp_14_3: TQRLabel;
    LabApp_14_8: TQRLabel;
    LabApp_14_9: TQRLabel;
    QRShape165: TQRShape;
    QRShape166: TQRShape;
    QRShape167: TQRShape;
    QRShape168: TQRShape;
    QRShape169: TQRShape;
    QRShape170: TQRShape;
    QRShape171: TQRShape;
    QRShape172: TQRShape;
    QRShape173: TQRShape;
    QRShape174: TQRShape;
    LabApp_15_0: TQRLabel;
    LabApp_15_1: TQRLabel;
    LabApp_15_2: TQRLabel;
    LabApp_15_4: TQRLabel;
    LabApp_15_5: TQRLabel;
    LabApp_15_6: TQRLabel;
    LabApp_15_7: TQRLabel;
    LabApp_15_3: TQRLabel;
    LabApp_15_8: TQRLabel;
    LabApp_15_9: TQRLabel;
    QRShape175: TQRShape;
    QRShape176: TQRShape;
    QRShape177: TQRShape;
    QRShape178: TQRShape;
    QRLabel198: TQRLabel;
    CheckAperturaVentilazione: TQRLabel;
    QRShape179: TQRShape;
    QRLabel200: TQRLabel;
    CheckPianoCotturaControlloFiamma: TQRLabel;
    QRShape180: TQRShape;
    QRLabel202: TQRLabel;
    CheckAperturaAerazione: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel204: TQRLabel;
    QRLabel205: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel206: TQRLabel;
    QRDBText3: TQRDBText;
    LabelCopiaPer: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabelRifConformita: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBandSchemaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    FStampaElenchiEsterni: Boolean;
    procedure StampaSchema;
    procedure CaricaDatiGriglia;
    function ConvCoord(Coord: Integer; Fattore: Extended): Integer;

  public
    property StampaElenchiEsterni:Boolean read FStampaElenchiEsterni write FStampaElenchiEsterni;
  end;

var
  All4690S2QBQR: TAll4690S2QBQR;

implementation

uses FormConformita, cxGridTableView, FormStampaDichiarazione, StrUtils,
  DataModule1;

{$R *.DFM}


// Stampa lo schema
procedure TAll4690S2QBQR.StampaSchema;
var
  L, i: Integer;
  CurrLayer: TPuzzleLayer;
  CurrObj: TPuzzleObject;
  PrecWidth, PrecHeight: Integer;
begin
  // Salva le dimensioni attuali dello schema
  PrecWidth := Schema.Width;
  PrecHeight := Schema.Height;
  // RIdimensiona l'oggetto che stamperà lo schema in modo che
  //  sia uguale al Puzzle di ConformitaForm.
  Schema.Width := ConformitaForm.Puzzle1.Width;
  Schema.Height := ConformitaForm.Puzzle1.Height;
  // Stampa la griglia di sfondo
//  Schema.Canvas.Draw(0, 0, ConformitaForm.Puzzle1.SfondoGriglia.Picture.Graphic);
  // Stampa l'immagine di sfondo
  Schema.Canvas.Draw(0, 0, ConformitaForm.Puzzle1.SfondoImg.Picture.Graphic);
  // Cicla per tutti i layers del disegno schematico
  for L := 0 to ConformitaForm.Puzzle1.ComponentCount -1 do begin
    // Solo se si tratta di un layer...
    if ConformitaForm.Puzzle1.Components[L] is TPuzzleLayer then begin
      // CurrLayer punta al layer corrente
      CurrLayer := ConformitaForm.Puzzle1.Components[L] as TPuzzleLayer;
      // Cicla per tutti gli oggetti del layer corrente,,,
      for i := 0 to CurrLayer.ComponentCount -1 do begin
        // Se l'oggetto corrente è un PuzzleObject...
        if CurrLayer.Components[i] is TPuzzleObject then begin
          // CurrObj punta all'oggetto corrente.
          CurrObj := CurrLayer.Components[i] as TPuzzleObject;
          // Disegna l'oggetto corrente nello schema da stampare...
          Schema.Canvas.Draw(CurrObj.Left, CurrObj.Top, CurrObj.Picture.Graphic);
        end;
      end;
    end;
  end;
  // Ridimensionamento disegno per adattamento alla pagina
  Schema.Stretch := True;
  Schema.Width := PrecWidth;
  Schema.Height := PrecHeight;
end;

// Carica i dati della griglia
procedure TAll4690S2QBQR.CaricaDatiGriglia;
var
  PrecPos: TBookmark;
  ix, iy: integer;
  CurrLabelName: String;
  CurrLabel: TQRLabel;
begin
  // Salva la posizione attuale e disabilita i controlli
  PrecPos := ConformitaForm.QryApp.Bookmark;
  try
    // DIsabilita i controlli per maggior velocità
    ConformitaForm.QryApp.DisableControls;
    // Cicla per tutti i record contenuti nella griglia delle apparecchiature
    for iy := 0 to APPARECCHI_MAX_RIGHE -1 do begin
      // Cicla per tutte le colonne della stessa griglia
      for ix := 0 to ConformitaForm.tvApp.ColumnCount -1 do begin
        // Per comodità CurrLabel Punta alla label corrente.
        CurrLabelName := 'LabApp_' + IntToStr(iy) + '_' + IntToStr(ix);
        if (QRBandSchema.FindChildControl(CurrLabelName) <> nil) then begin
          CurrLabel := QRBandSchema.FindChildControl(CurrLabelName) as TQRLabel;
          // Se esiste il record corrispondente nella griglia carica il dato
          //  altrimenti la imposta che non stampa nulla.
          if (iy < ConformitaForm.tvApp.DataController.RecordCount)
          and not (  (ix = 0) and (LeftStr(ConformitaForm.tvApp.DataController.GetDisplayText(iy, ix), 2) = '(X')  )
          and not StampaElenchiEsterni
          then CurrLabel.Caption := ConformitaForm.tvApp.DataController.GetDisplayText(iy, ix)
          else CurrLabel.Caption := '';
        end;
      end;
    end;
  finally
    // Rimette le cose a posto
    ConformitaForm.QryApp.Bookmark := PrecPos;
    ConformitaForm.QryApp.EnableControls;
  end;
  // Se si è scelto di stampare gli elenchi materiali esterni visualizza solo
  //  un rimando e poi esce.
  if StampaElenchiEsterni then begin
    LabApp_0_2.Font.Style := [fsBold];
    LabApp_0_2.Caption := 'Vedi Relazione allegata...';
  end;
end;

procedure TAll4690S2QBQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  QRLabelRifConformita.Caption := 'Dichiarazione di conformità N.   ' + DM1.TableConformitaCODICE.AsString;

  CheckDichiaroMarcaturaCE.Enabled := ConformitaForm.DBCBDichiaroMarcaturaCE.Checked;
  CheckAperturaVentilazione.Enabled := ConformitaForm.DBCBAperturaVentilazione.Checked;
  CheckAperturaAerazione.Enabled := ConformitaForm.DBCBAperturaAerazione.Checked;
  CheckPianoCotturaControlloFiamma.Enabled := ConformitaForm.DBCBPianoCotturaControlloFiamma.Checked;
  CaricaDatiGriglia;
  // RIchiama il gestore di evento per l'impostazione della label COPIA PER...
  StampaDichiarazioneForm.EventoQRBeforePrint(Sender, PrintReport);
end;


procedure TAll4690S2QBQR.QRBandSchemaAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
   R: TRect;
   XF, YF: Extended;
   SchemaBMP: TBitMap;
begin
  // Inizializzazione
  SchemaBMP := TBitMap.Create;
  try
    // Memorizza i fattori di conversione delle coordinate
    XF := Sender.ParentReport.QRPrinter.XFactor;
    YF := Sender.ParentReport.QRPrinter.YFactor;
    // Calcola il TRect della zona su cui deve essere stampata la fotografia
    R.Left   := ConvCoord(QRBandSchema.Left+Schema.Left, XF) - Round(Sender.ParentReport.QRPrinter.LeftWaste*XF);
    R.Top    := ConvCoord(QRBandSchema.Top+Schema.Top, YF) - Round(Sender.ParentReport.QRPrinter.TopWaste*YF);
    R.Right  := R.Left + ConvCoord(Schema.Width, XF);
    R.Bottom := R.Top + ConvCoord(Schema.Height, YF);
{
    // Generazione della Bitmap con tutto il disegno da tracciare
    ConformitaForm.StampaSchema(ConformitaForm.Puzzle1, SchemaBMP);
}
    // Carica la bitmap corretta con lo schema da stampare
    SchemaBmp.LoadFromFile(DM1.CartellaTmp + ConformitaForm.BmpSchemaGasFileName);
    // Effettua il tracciamento
    Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, SchemaBMP);
  finally
    SchemaBMP.Free;
  end;
end;

// Funzione che converte le posizioni/dimensioni dei componenti per il tracciamento diretto delle immagini
//  sul canvas della pagina da stampare. Fatto per risolvere il problema della stampa dei quadrati neri
function TAll4690S2QBQR.ConvCoord(Coord:Integer; Fattore:Extended): Integer;
begin
  Result := Round(Coord / Screen.PixelsPerInch * 254 * Fattore);
end;


end.
