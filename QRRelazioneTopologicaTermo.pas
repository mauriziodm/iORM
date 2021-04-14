unit QRRelazioneTopologicaTermo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRRelazioneTopologicaGas, QuickRpt, QRCtrls, ExtCtrls;

type
  TRelazioneTopologicaTermoQR = class(TRelazioneTopologicaGasQR)
    QRDBText25: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRShape37: TQRShape;
    QRShape32: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape33: TQRShape;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRShape34: TQRShape;
    QRLabel57: TQRLabel;
    QRShape35: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel60: TQRLabel;
    QRShape36: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelazioneTopologicaTermoQR: TRelazioneTopologicaTermoQR;

implementation

uses DataModule1;

{$R *.dfm}

procedure TRelazioneTopologicaTermoQR.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  // Imposta i check per la sezione Termo
  CheckCE.Enabled     := (DM1.TableConformitaTERMOTIPAPP_CE.AsString = '1');
  CheckUNI.Enabled    := (DM1.TableConformitaTERMOTIPMAT_UNI.AsString = '1');
  CheckAltro.Enabled  := (DM1.TableConformitaTERMOTIPMAT_ALTRO.AsString = '1');
end;

end.
