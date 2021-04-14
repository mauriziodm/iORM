unit QRNoteDichiarazioneConformita;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TNoteDichiarazioneConformitaQR = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape37: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
  private

  public

  end;

var
  NoteDichiarazioneConformitaQR: TNoteDichiarazioneConformitaQR;

implementation

{$R *.DFM}

end.
