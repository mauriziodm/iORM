unit QRUltimiInterventiImpianto;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TUltimiInterventiImpiantoQR = class(TQuickRep)
    QRFoglioLavoro: TQRBand;
    QRShape45: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel60: TQRLabel;
    NumDataImpianto: TQRLabel;
    QRShape5: TQRShape;
    QRLabel22: TQRLabel;
    ResponsabileImpianto: TQRLabel;
    QRLabel46: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRLabelTitoloIntervento: TQRLabel;
    QRShape37: TQRShape;
    QRLabel96: TQRLabel;
    QRDBText62: TQRDBText;
    QRLabel70: TQRLabel;
    QRShape33: TQRShape;
    QRLabel71: TQRLabel;
    TipoInterventoGuasto: TQRLabel;
    QRShape34: TQRShape;
    LabelPrimaAccensione: TQRLabel;
    TipoInterventoPrimaAccensione: TQRLabel;
    QRShape35: TQRShape;
    QRLabel75: TQRLabel;
    TipoInterventoManutenzione: TQRLabel;
    QRLabel78: TQRLabel;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    ShapeProvaCombustione: TQRShape;
    LabelProvaCombustione: TQRLabel;
    TipoInterventoProvaCombustione: TQRLabel;
    QRDBText36: TQRDBText;
    QRShape54: TQRShape;
    QRLabel133: TQRLabel;
    QRDBText74: TQRDBText;
    QRLabel134: TQRLabel;
    QRDBText75: TQRDBText;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText39: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  UltimiInterventiImpiantoQR: TUltimiInterventiImpiantoQR;

implementation

uses FormImpegni;

{$R *.DFM}

procedure TUltimiInterventiImpiantoQR.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   // Carica il numero e la data dell'impianto
   NumDataImpianto.Caption := ImpegnoForm.QryAssPRATICA.AsString + '  -  ' + ImpegnoForm.QryAssDATAPRATICA1.AsString;
   // Carica il nome del responsabile dell'impianto
   ResponsabileImpianto.Caption := ImpegnoForm.QryAssRAGSOCRESPIMP.AsString;
end;

procedure TUltimiInterventiImpiantoQR.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
   TmpStr: String;
begin
   // Imposta il tipo di intervento
//   TmpStr := ImpegnoForm.QryIntPrecTIPOINTERVENTO.AsString;
   TipoInterventoGuasto.Enabled           := (Pos('Guasto', TmpStr) > 0);
   TipoInterventoPrimaAccensione.Enabled  := (Pos('Prima accensione', TmpStr) > 0) or (Pos('Collaudo', TmpStr) > 0);
   TipoInterventoManutenzione.Enabled     := (Pos('Manutenzione', TmpStr) > 0);
   TipoInterventoProvaCombustione.Enabled := (Pos('Prova combustione', TmpStr) > 0);
end;

end.
