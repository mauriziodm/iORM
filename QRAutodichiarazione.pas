unit QRAutodichiarazione;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TAutodichiarazioneQR = class(TQuickRep)
    AutodichiarazioneQR: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText1: TQRDBText;
    QRSysData1: TQRSysData;
    QRShape20: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRShapeRightBorder: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRMemo1: TQRMemo;
    QRShape1: TQRShape;
    QRLabelA: TQRLabel;
    QRMemo2: TQRMemo;
    QRShape2: TQRShape;
    QRLabelB: TQRLabel;
    QRMemo3: TQRMemo;
    QRShape3: TQRShape;
    QRLabelC: TQRLabel;
    QRMemo4: TQRMemo;
    QRShape4: TQRShape;
    QRLabelD: TQRLabel;
    QRMemo5: TQRMemo;
    QRShape5: TQRShape;
    QRLabelE: TQRLabel;
    QRMemo6: TQRMemo;
    QRShape6: TQRShape;
    QRLabelF: TQRLabel;
    QRMemo7: TQRMemo;
    QRShape7: TQRShape;
    QRLabelG: TQRLabel;
    QRMemo8: TQRMemo;
    QRLabel93: TQRLabel;
    QRDBText18: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  AutodichiarazioneQR: TAutodichiarazioneQR;

implementation

uses FormConformita;

{$R *.DFM}

procedure TAutodichiarazioneQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   // -------------------------------------------------------------------------------------------
   // Imposta il colore dello shape al bordo dx a bianco in modo che non si veda
   QRShapeRightBorder.Pen.Color := clWhite;
   // In base al comnenuto dei campi del record attuale visualizza o meno
   //  le "X" nelle caselline (se non selezionate le mette non visibili, altrimenti
   //  le lascia così come sono perchè sono già visibili per default)
   if not ConformitaForm.CheckBoxA.Checked then QRLabelA.Font.Color := clWhite;
   if not ConformitaForm.CheckBoxB.Checked then QRLabelB.Font.Color := clWhite;
   if not ConformitaForm.CheckBoxC.Checked then QRLabelC.Font.Color := clWhite;
   if not ConformitaForm.CheckBoxD.Checked then QRLabelD.Font.Color := clWhite;
   if not ConformitaForm.CheckBoxE.Checked then QRLabelE.Font.Color := clWhite;
   if not ConformitaForm.CheckBoxF.Checked then QRLabelF.Font.Color := clWhite;
   if not ConformitaForm.CheckBoxG.Checked then QRLabelG.Font.Color := clWhite;
end;

end.
