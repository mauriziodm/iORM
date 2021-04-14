unit QRGasDisegno;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TGasDisegnoQR = class(TQuickRep)
    QRBand1: TQRBand;
    QRBandSchema: TQRBand;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    Schema: TQRImage;
    LabelCopiaPer: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabelTitolo: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel96: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel45: TQRLabel;
    QRShape43: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel92: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText29: TQRDBText;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandSchemaAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private
    FSezione: String;
    procedure SetSezione(const Value: String);
    function ConvCoord(Coord: Integer; Fattore: Extended): Integer;
  public
    property Sezione:String read FSezione write SetSezione;
  end;

var
  GasDisegnoQR: TGasDisegnoQR;

implementation

uses FormConformita, FormStampaDichiarazione, DataModule1;

{$R *.DFM}

procedure TGasDisegnoQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  // Rende invisibile lo ShapeBorder
  QRShape2.Pen.Color  := clWhite;
  QRShape43.Pen.Color := clWhite;
  // RIchiama il gestore di evento per l'impostazione della label COPIA PER...
  StampaDichiarazioneForm.EventoQRBeforePrint(Sender, PrintReport);
end;

procedure TGasDisegnoQR.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   TS: String;
begin
   // Compone la 2° riga della descrizione dell'impianto
   TS := '';
   if not DM1.TableConformitaDiProprietaDi.IsNull then TS := TS + DM1.TableConformitaDiProprietaDi.AsString;
//   if not DM1.TableConformitaCommissionatoDa.IsNull then TS := TS + DM1.TableConformitaCommissionatoDa.AsString + ' - ';
//   if not DM1.TableConformitaVia.IsNull then TS := TS + 'via ' + DM1.TableConformitaVia.AsString + ' ';
//   if not DM1.TableConformitaNumero.IsNull then TS := TS + DM1.TableConformitaNumero.AsString + ' ';
//   if not DM1.TableConformitaScala.IsNull then TS := TS + 'scala ' + DM1.TableConformitaScala.AsString + ' ';
//   if not DM1.TableConformitaPiano.IsNull then TS := TS + 'piano ' + DM1.TableConformitaPiano.AsString + ' ';
//   if not DM1.TableConformitaInterno.IsNull then TS := TS  + 'int. ' + DM1.TableConformitaInterno.AsString + ' ';
//   if not DM1.TableConformitaNelComuneDi.IsNull then TS := TS + '- ' + DM1.TableConformitaNelComuneDi.AsString;
   QRLabel45.Caption := TS;
end;

procedure TGasDisegnoQR.SetSezione(const Value: String);
begin
  FSezione := Value;
  QRLabelTitolo.Caption := 'DISEGNO SCHEMATICO DELL''IMPIANTO  (Sezione ' + Value + ')';
end;

procedure TGasDisegnoQR.QRBandSchemaAfterPrint(Sender: TQRCustomBand;
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

    // Rimette a posto le proporzioni del disegno in modo che non venga storpiato
    //  questo perchè contrariamente alle altre sezioni, il disegno del gas non
    //  quadrato per esigenze di modulo degli allegati obbligatori.
    if Sezione = 'Gas' then Schema.Height := Trunc(Schema.Width / 1.29);

    // Calcola il TRect della zona su cui deve essere stampata la fotografia
    R.Left   := ConvCoord(QRBandSchema.Left+Schema.Left, XF) - Round(Sender.ParentReport.QRPrinter.LeftWaste*XF);
    R.Top    := ConvCoord(QRBandSchema.Top+Schema.Top, YF) - Round(Sender.ParentReport.QRPrinter.TopWaste*YF);
    R.Right  := R.Left + ConvCoord(Schema.Width, XF);
    R.Bottom := R.Top + ConvCoord(Schema.Height, YF);
{
    // Generazione della Bitmap con tutto il disegno da tracciare
    if Sezione = 'Gas' then ConformitaForm.StampaSchema(ConformitaForm.Puzzle1, SchemaBMP)
    else if Sezione = 'Termo' then ConformitaForm.StampaSchema(ConformitaForm.PuzzleTermo, SchemaBMP)
    else if Sezione = 'Idro' then ConformitaForm.StampaSchema(ConformitaForm.PuzzleIdro, SchemaBMP);
}
    // Carica la bitmap corretta con lo schema da stampare in base alla sezione che si sta stampando
    if Sezione = 'Gas' then begin
      SchemaBmp.LoadFromFile(DM1.CartellaTmp + ConformitaForm.BmpSchemaGasFileName);
    end else if Sezione = 'Termo' then begin
      SchemaBmp.LoadFromFile(DM1.CartellaTmp + ConformitaForm.BmpSchemaTermoFileName);
    end else if Sezione = 'Idro' then begin
      SchemaBmp.LoadFromFile(DM1.CartellaTmp + ConformitaForm.BmpSchemaIdroFileName);
    end;
    // Effettua il tracciamento
    Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, SchemaBMP);
  finally
    SchemaBMP.Free;
  end;
end;

// Funzione che converte le posizioni/dimensioni dei componenti per il tracciamento diretto delle immagini
//  sul canvas della pagina da stampare. Fatto per risolvere il problema della stampa dei quadrati neri
function TGasDisegnoQR.ConvCoord(Coord:Integer; Fattore:Extended): Integer;
begin
  Result := Round(Coord / Screen.PixelsPerInch * 254 * Fattore);
end;


end.
