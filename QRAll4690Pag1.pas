unit QRAll4690Pag1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TAll4690Pag1QR = class(TQuickRep)
    QRBandSchema: TQRBand;
    QRLabel3: TQRLabel;
    LabelCopiaPer: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape181: TQRShape;
    S1QADicConfModB: TQRLabel;
    QRShape182: TQRShape;
    S1QADicConfModD: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape183: TQRShape;
    QRLabel16: TQRLabel;
    S1QAProgImpGas: TQRLabel;
    QRShape184: TQRShape;
    QRLabel18: TQRLabel;
    S1QAProgCamino: TQRLabel;
    QRShape185: TQRShape;
    QRLabel20: TQRLabel;
    S1QAProgPrevInc: TQRLabel;
    QRShape3: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape4: TQRShape;
    QRLabel24: TQRLabel;
    S1QBDichGasPrec: TQRLabel;
    QRShape5: TQRShape;
    QRLabel26: TQRLabel;
    S1QBDichCaminoPrec: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape6: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape7: TQRShape;
    QRLabel32: TQRLabel;
    S1QCProgImpIntGas: TQRLabel;
    QRShape8: TQRShape;
    QRLabel34: TQRLabel;
    S1QCCPI: TQRLabel;
    QRShape9: TQRShape;
    QRLabel36: TQRLabel;
    S1QCRelTec: TQRLabel;
    QRShape10: TQRShape;
    QRLabel38: TQRLabel;
    S1QCAll2: TQRLabel;
    QRLabel41: TQRLabel;
    QRImage2: TQRImage;
    QRImage1: TQRImage;
    QRLabel40: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel42: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel43: TQRLabel;
    QRShape16: TQRShape;
    QRLabel44: TQRLabel;
    S2QANuovoImpGas: TQRLabel;
    QRShape17: TQRShape;
    QRLabel46: TQRLabel;
    S2QAModImpEsist: TQRLabel;
    QRShape18: TQRShape;
    QRLabel48: TQRLabel;
    S2QAInstAppGas: TQRLabel;
    QRShape19: TQRShape;
    QRLabel50: TQRLabel;
    S2QAInstTrattoTub: TQRLabel;
    QRShape20: TQRShape;
    QRLabel52: TQRLabel;
    S2QAInstPzSpec: TQRLabel;
    QRShape21: TQRShape;
    QRLabel54: TQRLabel;
    S2QACollegAppCannaFum: TQRLabel;
    QRShape22: TQRShape;
    QRLabel56: TQRLabel;
    S2QARealApVent: TQRLabel;
    QRShape23: TQRShape;
    QRLabel58: TQRLabel;
    S2QARealApAeraz: TQRLabel;
    QRShape24: TQRShape;
    QRLabel60: TQRLabel;
    S2QACaminoSingolo: TQRLabel;
    QRShape25: TQRShape;
    QRLabel62: TQRLabel;
    S2QACannaCollettiva: TQRLabel;
    QRShape26: TQRShape;
    QRLabel64: TQRLabel;
    S2QACannaCollRamif: TQRLabel;
    QRShape27: TQRShape;
    QRLabel66: TQRLabel;
    S2QAAltro: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape28: TQRShape;
    QRLabel69: TQRLabel;
    S2QBAppCollKW: TQRLabel;
    QRShape29: TQRShape;
    QRLabel71: TQRLabel;
    S2QBSoloPred: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape30: TQRShape;
    QRLabel75: TQRLabel;
    S2QBCollegamentoDi: TQRLabel;
    QRShape31: TQRShape;
    QRLabel77: TQRLabel;
    S2QBSostDi: TQRLabel;
    QRShape32: TQRShape;
    QRLabel79: TQRLabel;
    S2QBAdegNorma: TQRLabel;
    QRShape33: TQRShape;
    QRLabel81: TQRLabel;
    S2QBAltro: TQRLabel;
    QRShape34: TQRShape;
    QRLabel83: TQRLabel;
    QRShape35: TQRShape;
    QRLabel84: TQRLabel;
    S2QCEsecConfProg: TQRLabel;
    QRShape36: TQRShape;
    QRLabel86: TQRLabel;
    S2QCEsecCuraInst: TQRLabel;
    QRLabel88: TQRLabel;
    QRShape37: TQRShape;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRDBTextDichConfNum: TQRDBText;
    QRDBTextDichConfData: TQRDBText;
    QRDBText3: TQRDBText;
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
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    LabelCommittenteVia: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabelRifConformita: TQRLabel;
    LabelImpresaVia: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure LabelCommittenteViaPrint(sender: TObject; var Value: string);
    procedure LabelImpresaViaPrint(sender: TObject; var Value: string);
  private

  public

  end;

var
  All4690Pag1QR: TAll4690Pag1QR;

implementation

uses FormConformita, DataModule1, FormStampaDichiarazione, IniFiles;

{$R *.DFM}

procedure TAll4690Pag1QR.LabelCommittenteViaPrint(sender: TObject; var Value: string);
var
  Tmp: String;
begin
  // COmpone insieme l'indirizzo con il numero civico perchè alcuni (Termoidraulica Del Bello ad es.)
  //  ci hanno riferito di problemi con l'invio per posta della fattura perchè il numero civico
  //  era stampato troppo lontato dalla via e quindi tornavano indietro per "indirizzo non trovato".
  Value := Trim(DM1.TableConformitaVIA.AsString);
  // NumCivico
  Tmp := Trim(DM1.TableConformitaNUMERO.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' ' + Tmp);
  // Interno
  Tmp := Trim(DM1.TableConformitaINTERNO.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' int. ' + Tmp);
  // Piano
  Tmp := Trim(DM1.TableConformitaPIANO.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ', piano ' + Tmp);
  // Scala
  Tmp := Trim(DM1.TableConformitaSCALA.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ', scala ' + Tmp);
  // Comune
  Tmp := Trim(DM1.TableConformitaNELCOMUNEDI.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' - ' + Tmp);
  // Comune
  Tmp := Trim(DM1.TableConformitaPROVINCIA.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' (' + Tmp + ')');
end;

procedure TAll4690Pag1QR.LabelImpresaViaPrint(sender: TObject; var Value: string);
var
  Tmp: String;
begin
  // COmpone insieme l'indirizzo con il numero civico perchè alcuni (Termoidraulica Del Bello ad es.)
  //  ci hanno riferito di problemi con l'invio per posta della fattura perchè il numero civico
  //  era stampato troppo lontato dalla via e quindi tornavano indietro per "indirizzo non trovato".
  Value := '';
  // Indirizzo
  Tmp := Trim(DM1.TableDatiAziendaINDIRIZZO.AsString);
  if Tmp <> '' then
    Value := Trim(Tmp);
  // NumCivico
  Tmp := Trim(DM1.TableDatiAziendaNUMCIVICO.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' ' + Tmp);
  // Comune
  Tmp := Trim(DM1.TableDatiAziendaCITTA.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' - ' + Tmp);
  // Provincia
  Tmp := Trim(DM1.TableDatiAziendaPROVINCIA.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' (' + Tmp + ')');
  // CAP
  Tmp := Trim(DM1.TableDatiAziendaCAP.AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' ' + Tmp);
end;

procedure TAll4690Pag1QR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  Tmp: String;
  LO: TMemIniFile;
  Sez: String;
  LStampaRifConf: Boolean;
begin
  // Se si stampa con i riferimenti alla vecchia legge 46/90...
  if StampaDichiarazioneForm.RGLegge.ItemIndex = 1 then begin
    QRLabel1.Caption := 'ALLEGATO OBBLIGATORIO alla DICHIARAZIONE DI CONFORMITA''';
    QRLabel2.Caption := 'o all''attestazione di corretta esecuzione dell''impianto gas di cui ai modelli "B" o "D" allegati alla'#13'Delibera dell''Autorità per l''Energia Elettrica e il Gas n° 40/04';
  end;

  // Apre il layouts.ini per decidere se stampare il riferimento alla dichiarazione di conformità o meno
  //  (la TISA ha chiesto che non venga stampato mai)
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    Sez := 'Conformità';
    LStampaRifConf := LO.ReadBool(Sez, 'StampaRifConfInAllegatoGas', False);
    QRDBTextDichConfNum.Enabled := LStampaRifConf;
    QRDBTextDichConfData.Enabled := LStampaRifConf;
  finally
    LO.Free;
  end;

  QRLabelRifConformita.Caption := 'Dichiarazione di conformità N.   ' + DM1.TableConformitaCODICE.AsString;

  S1QADicConfModB.Enabled     := ConformitaForm.DBCBS1QADicConfModB.Checked and LStampaRifConf;
  S1QADicConfModD.Enabled     := ConformitaForm.DBCBS1QADicConfModD.Checked and LStampaRifConf;
  S1QAProgImpGas.Enabled      := ConformitaForm.DBCBS1QAProgImpGas.Checked;
  S1QAProgCamino.Enabled      := ConformitaForm.DBCBS1QAProgCamino.Checked;
  S1QAProgPrevInc.Enabled     := ConformitaForm.DBCBS1QAProgPrevInc.Checked;

  S1QBDichGasPrec.Enabled     := ConformitaForm.DBCBS1QBDichGasPrec.Checked;
  S1QBDichCaminoPrec.Enabled  := ConformitaForm.DBCBS1QBDichCaminoPrec.Checked;

  S1QCProgImpIntGas.Enabled   := ConformitaForm.DBCBS1QCProgImpIntGas.Checked;
  S1QCCPI.Enabled             := ConformitaForm.DBCBS1QCCPI.Checked;
  S1QCRelTec.Enabled          := ConformitaForm.DBCBS1QCRelTec.Checked;
  S1QCAll2.Enabled            := ConformitaForm.DBCBS1QCAll2.Checked;

  S2QANuovoImpGas.Enabled     := ConformitaForm.DBCBS2QANuovoImpGas.Checked;
  S2QAModImpEsist.Enabled     := ConformitaForm.DBCBS2QAModImpEsist.Checked;
  S2QAInstAppGas.Enabled       := ConformitaForm.DBCBS2QAInstAppGas.Checked;
  S2QAInstTrattoTub.Enabled   := ConformitaForm.DBCBS2QAInstTrattoTub.Checked;
  S2QAInstPzSpec.Enabled      := ConformitaForm.DBCBS2QAInstPzSpec.Checked;
  S2QACollegAppCannaFum.Enabled := ConformitaForm.DBCBS2QACollegAppCannaFum.Checked;
  S2QARealApVent.Enabled      := ConformitaForm.DBCBS2QARealApVent.Checked;
  S2QARealApAeraz.Enabled     := ConformitaForm.DBCBS2QARealApAeraz.Checked;
  S2QACaminoSingolo.Enabled   := ConformitaForm.DBCBS2QACaminoSingolo.Checked;
  S2QACannaCollettiva.Enabled := ConformitaForm.DBCBS2QACannaCollettiva.Checked;
  S2QACannaCollRamif.Enabled  := ConformitaForm.DBCBS2QACannaCollRamif.Checked;
  S2QAAltro.Enabled           := ConformitaForm.DBCBS2QAAltro.Checked;

  S2QBAppCollKW.Enabled       := ConformitaForm.DBCBS2QBAppCollKW.Checked;
  S2QBSoloPred.Enabled        := ConformitaForm.DBCBS2QBSoloPred.Checked;
  S2QBCollegamentoDi.Enabled  := ConformitaForm.DBCBS2QBCollegamentoDi.Checked;
  S2QBSostDi.Enabled          := ConformitaForm.DBCBS2QBSostDi.Checked;
  S2QBAdegNorma.Enabled       := ConformitaForm.DBCBS2QBAdegNorma.Checked;
  S2QBAltro.Enabled           := ConformitaForm.DBCBS2QBAltro.Checked;

  S2QCEsecConfProg.Enabled    := ConformitaForm.DBCBS2QCEsecConfProg.Checked;
  S2QCEsecCuraInst.Enabled    := ConformitaForm.DBCBS2QCEsecCuraInst.Checked;

  // RIchiama il gestore di evento per l'impostazione della label COPIA PER...
  StampaDichiarazioneForm.EventoQRBeforePrint(Sender, PrintReport);

end;

end.
