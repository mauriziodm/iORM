unit QRRelazioneTopologicaGas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TRelazioneTopologicaGasQR = class(TQuickRep)
    QRBandTitoloGas: TQRBand;
    QRLabel23: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabelTitolo: TQRLabel;
    QRLabel96: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShapeRightBorder: TQRShape;
    QRBandTitoloApparecchi: TQRBand;
    QRShape18: TQRShape;
    QRShape31: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShapeSfondoRigo: TQRShape;
    QRShapeSfondoRigo2: TQRShape;
    QRShape12: TQRShape;
    BandTitoloMateriali: TQRBand;
    QRShape13: TQRShape;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRBandCheckGas: TQRBand;
    QRShape23: TQRShape;
    QRLabelRispondenteNorme: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape11: TQRShape;
    QRLabelConformeArt7: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape19: TQRShape;
    QRLabelMatIdoneiAmbient: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape20: TQRShape;
    QRLabelCompImpEsistente: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape21: TQRShape;
    QRLabelAllegati: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRBandFirmeGas: TQRChildBand;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel52: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel92: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape43: TQRShape;
    QRBand3: TQRBand;
    QRShapeFinale: TQRShape;
    QRLabel54: TQRLabel;
    LabelCopiaPer: TQRLabel;
    DetailApp: TQRSubDetail;
    DetailMat: TQRSubDetail;
    QRBandDichiara: TQRChildBand;
    QRLabel59: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape30: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRBandRispondenzaNormeApparecchi: TQRChildBand;
    QRShape39: TQRShape;
    CheckCE: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape40: TQRShape;
    ColHeader2: TQRChildBand;
    QRShape41: TQRShape;
    QRLabel66: TQRLabel;
    QRShape14: TQRShape;
    QRLabel24: TQRLabel;
    QRShape15: TQRShape;
    QRLabel25: TQRLabel;
    QRShape16: TQRShape;
    QRLabel26: TQRLabel;
    QRShape17: TQRShape;
    QRLabel27: TQRLabel;
    QRShape25: TQRShape;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape26: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel46: TQRLabel;
    QRShape27: TQRShape;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape28: TQRShape;
    QRLabel50: TQRLabel;
    QRShape29: TQRShape;
    QRLabel51: TQRLabel;
    QRBandRispondenzaNormeMateriali: TQRChildBand;
    QRLabel70: TQRLabel;
    QRShape42: TQRShape;
    QRLabel14: TQRLabel;
    CheckUNI: TQRLabel;
    QRDBText32: TQRDBText;
    QRShape44: TQRShape;
    QRLabel67: TQRLabel;
    CheckAltro: TQRLabel;
    QRDBText33: TQRDBText;
    QRShape45: TQRShape;
    QRChildBandPiedeElencoMateriali: TQRChildBand;
    QRLabel69: TQRLabel;
    QRShape46: TQRShape;
    QRLabel71: TQRLabel;
    QRChildFirmeTermo: TQRChildBand;
    QRShape47: TQRShape;
    QRMemo1: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRLabel72: TQRLabel;
    QRDBText36: TQRDBText;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRShape51: TQRShape;
    ChildColHeaderApparecchiature: TQRChildBand;
    QRShape52: TQRShape;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRShape5: TQRShape;
    QRLabel11: TQRLabel;
    QRShape6: TQRShape;
    QRLabel13: TQRLabel;
    QRShape7: TQRShape;
    QRLabel15: TQRLabel;
    QRShape8: TQRShape;
    QRLabel16: TQRLabel;
    QRShape9: TQRShape;
    QRLabel17: TQRLabel;
    QRShape10: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape38: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBandTitoloGasBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailAppBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailMatBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  RelazioneTopologicaGasQR: TRelazioneTopologicaGasQR;

implementation

uses FormStampaDichiarazione, DataModule1, Dialogs;

{$R *.DFM}



procedure TRelazioneTopologicaGasQR.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   QRShapeRightBorder.Pen.Color := clWhite;
   QRShape12.Pen.Color := clWhite;
   QRShape13.Pen.Color := clWhite;
   QRShape18.Pen.Color := clWhite;
   QRShape24.Pen.Color := clWhite;
   QRShape30.Pen.Color := clWhite;
   QRShape31.Pen.Color := clWhite;
   QRShape40.Pen.Color := clWhite;
   QRShape41.Pen.Color := clWhite;
   QRShape43.Pen.Color := clWhite;
   QRShape45.Pen.Color := clWhite;
   QRShape46.Pen.Color := clWhite;
   QRShape47.Pen.Color := clWhite;
   QRShape52.Pen.Color := clWhite;
   // RIchiama il gestore di evento per l'impostazione della label COPIA PER...
   StampaDichiarazioneForm.EventoQRBeforePrint(Sender, PrintReport);
   // Prima di stampare si posiziona sul promo record di ogni
   //  Dataset Dettaglio, altrimenti non stampa i righi precedenti
   //  alla posizione attuale.
   DetailApp.DataSet.First;
   DetailMat.DataSet.First;
   // Se si è selezionato di stampre i moduli con il riferimento alla legge 46/90 modifica alcuni riferimenti
   if StampaDichiarazioneForm.RGLegge.ItemIndex = 1 then begin
     QRLabel31.Caption := 'è conforme a quanto previsto dall''art. 7 della legge 46/90;)';
     QRLabel40.Caption := 'MANCATO ADEGUAMENTO DELL''IMPIANTO (Art. 7 L. 46/90 - Art 5 D.P.R. 447/91)';
   end;
end;

procedure TRelazioneTopologicaGasQR.QRBandTitoloGasBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
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

procedure TRelazioneTopologicaGasQR.DetailAppBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  ExpHeight: Extended;
begin
      // Se la lettura facilitata è abilitata...
      //  E se non si tratta di una sessione solo di preparazione...
      // Dimensiona corretamente lo shape e lo colora a righe alternate
      QRShapeSfondoRigo.Left        := QRShapeFinale.Left;
      QRShapeSfondoRigo.Width       := QRShapeFinale.Width;
      QRShapeSfondoRigo.Pen.Style   := psClear;
      // Adegua l'altezza dello shape di sfondo della lettura facilitata per compensare eventuali
      //  espansioni della banda verso il basso in seguito alla presenza di un articolo con descrizione
      //  molto lunga,
      DetailApp.ExpandedHeight(ExpHeight);
      QRShapeSfondoRigo.Size.Height := ExpHeight;
      // // Colora in modo alternato lo shape della lettura facilitata
      if QRShapeSfondoRigo.Tag = 901 then begin
         QRShapeSfondoRigo.Brush.Color      := $00E6E6E6;
         QRShapeSfondoRigo.Tag              := 900;
      end else begin
         QRShapeSfondoRigo.Brush.Color      := clWhite;
         QRShapeSfondoRigo.Tag := 901;
      end;
end;

procedure TRelazioneTopologicaGasQR.DetailMatBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  ExpHeight: Extended;
begin
      // Se la lettura facilitata è abilitata...
      //  E se non si tratta di una sessione solo di preparazione...
      // Dimensiona corretamente lo shape e lo colora a righe alternate
      QRShapeSfondoRigo2.Left        := QRShapeFinale.Left;
      QRShapeSfondoRigo2.Width       := QRShapeFinale.Width;
      QRShapeSfondoRigo2.Pen.Style   := psClear;
      // Adegua l'altezza dello shape di sfondo della lettura facilitata per compensare eventuali
      //  espansioni della banda verso il basso in seguito alla presenza di un articolo con descrizione
      //  molto lunga,
      //  Alla fine ho messo il "+5" perchè altrimenti rimale una riga bianca tra i vari shapes
      DetailMat.ExpandedHeight(ExpHeight);
      QRShapeSfondoRigo2.Size.Height := ExpHeight;
      // // Colora in modo alternato lo shape della lettura facilitata
      if QRShapeSfondoRigo2.Tag = 901 then begin
         QRShapeSfondoRigo2.Brush.Color      := $00E6E6E6;
         QRShapeSfondoRigo2.Tag              := 900;
      end else begin
         QRShapeSfondoRigo2.Brush.Color      := clWhite;
         QRShapeSfondoRigo2.Tag := 901;
      end;
end;

procedure TRelazioneTopologicaGasQR.QuickRepEndPage(
  Sender: TCustomQuickRep);
begin
  // Alla fine della pagina disabilita il 'DICHIARA' in modo che non venga stampato
  //  nelle pagine successive.
  QRBandDichiara.Enabled := False;
end;

end.
