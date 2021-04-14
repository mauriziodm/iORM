unit QRDichiarazioneConformita;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IniFiles;

type
  TDichiarazioneConformitaQR = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape19: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape1: TQRShape;
    QRShapeTrasformazione: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape6: TQRShape;
    QRLabel42: TQRLabel;
    QRShape7: TQRShape;
    QRLabel44: TQRLabel;
    QRShape8: TQRShape;
    QRLabel46: TQRLabel;
    QRShape9: TQRShape;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape10: TQRShape;
    QRLabel53: TQRLabel;
    QRShape11: TQRShape;
    QRLabel55: TQRLabel;
    QRShape12: TQRShape;
    QRLabel57: TQRLabel;
    QRShape13: TQRShape;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape14: TQRShape;
    QRLabel63: TQRLabel;
    QRShape15: TQRShape;
    QRLabel65: TQRLabel;
    QRShape16: TQRShape;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape17: TQRShape;
    QRLabel69: TQRLabel;
    QRShape18: TQRShape;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLNuovoImpianto: TQRLabel;
    QRLTrasformazione: TQRLabel;
    QRLAmpliamento: TQRLabel;
    QRLManutenzioneStraordinaria: TQRLabel;
    QRLAltro: TQRLabel;
    QRLUsoIndustriale: TQRLabel;
    QRLUsoCivile: TQRLabel;
    QRLUsoCommercio: TQRLabel;
    QRLAltriUsi: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel70: TQRLabel;
    QRDBRichText1: TQRDBRichText;
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
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel73: TQRLabel;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel96: TQRLabel;
    QRDBDataFirmaTecnico: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRShape20: TQRShape;
    QRShapeRightBorder: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText30: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRLabel26: TQRLabel;
    LabelCopiaPer: TQRLabel;
    QRDBProgettoRedattoDa: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRShape2: TQRShape;
    QRLabel45: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel94: TQRLabel;
    QRDBDataFirmaPerRicevutaCliente: TQRDBText;
    QRLabel95: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel38: TQRLabel;
    procedure DichiarazioneConformitaQRBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText33Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  DichiarazioneConformitaQR: TDichiarazioneConformitaQR;

implementation

uses DataModule1, FormStampaDichiarazione;

{$R *.DFM}

procedure TDichiarazioneConformitaQR.DichiarazioneConformitaQRBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  LO: TMemIniFile;
  Sez: String;
begin
   // -------------------------------------------------------------------------------------------
   // Imposta il colore dello shape al bordo dx a bianco in modo che non si veda
   QRShapeRightBorder.Pen.Color := clWhite;
   // In base al comnenuto dei campi del record attuale visualizza o meno
   //  le "X" nelle caselline (se non selezionate le mette non visibili, altrimenti
   //  le lascia così come sono perchè sono già visibili per default)
   with DM1 do begin
      if TableConformitaNuovoImpianto.Value = '0'              then QRLNuovoImpianto.Font.Color := clWhite;
      if TableConformitaTrasformazione.Value = '0'             then QRLTrasformazione.Font.Color := clWhite;
      if TableConformitaAmpliamento.Value = '0'                then QRLAmpliamento.Font.Color := clWhite;
      if TableConformitaManutStraordinaria.Value = '0'         then QRLManutenzioneStraordinaria.Font.Color := clWhite;
      if TableConformitaAltro.Value = '0'                      then QRLAltro.Font.Color := clWhite;

      if TableConformitaUsoIndustriale.Value = '0'             then QRLUsoIndustriale.Font.Color := clWhite;
      if TableConformitaUsoCivile.Value = '0'                  then QRLUsoCivile.Font.Color := clWhite;
      if TableConformitaUsoCommercio.Value = '0'               then QRLUsoCommercio.Font.Color := clWhite;
      if TableConformitaAltriUsi.Value = '0'                   then QRLAltriUsi.Font.Color := clWhite;

      if TableConformitaRispettatoProgetto.Value = '0'         then QRLabel52.Font.Color := clWhite;
      if TableConformitaSeguitoNormaTecnica.Value = '0'        then QRLabel54.Font.Color := clWhite;
      if TableConformitaInstallatoComponenti.Value = '0'       then QRLabel56.Font.Color := clWhite;
      if TableConformitaControllatoImpianto.Value = '0'        then QRLabel58.Font.Color := clWhite;

      if TableConformitaAllegatoProgetto.Value = '0'           then QRLabel62.Font.Color := clWhite;
      if TableConformitaAllegatoRelazione.Value = '0'          then QRLabel64.Font.Color := clWhite;
      if TableConformitaAllegatoSchema.Value = '0'             then QRLabel68.Font.Color := clWhite;
      if TableConformitaAllegatoRifConformita.Value = '0'      then QRLabel66.Font.Color := clWhite;
      if TableConformitaAllegatoCopiaCertificato.Value = '0'   then QRLabel70.Font.Color := clWhite;
      if TableConformitaALLEGATOATTMATNONORM.Value = '0'       then QRLabel47.Font.Color := clWhite;
   end;
   // RIchiama il gestore di evento per l'impostazione della label COPIA PER...
   StampaDichiarazioneForm.EventoQRBeforePrint(Sender, PrintReport);
   // Progetto redatto da
   QRDBProgettoRedattoDa.Enabled := (DM1.TableConformitaRISPETTATOPROGETTO.AsString = '1');

  // Apre il layouts.ini
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    Sez := 'Conformità';
    // Determina se stampare le date finali (Data firma del tecnico e Data firma per ricevuta del cliente)
    QRDBDataFirmaTecnico.Enabled := LO.ReadBool(Sez, 'StampaDataFirmaTecnico', True);
    QRDBDataFirmaPerRicevutaCliente.Enabled := LO.ReadBool(Sez, 'StampaDataFirmaCliente', False);
  finally
    LO.Free;
  end;
end;

procedure TDichiarazioneConformitaQR.QRDBText33Print(sender: TObject;
  var Value: String);
begin
  Value := 'n. ' + Value;
end;

end.
