unit QRRichiestaPrimaAccensione;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IniFiles;

type
  TRichiestaPrimaAccensioneQR = class(TQuickRep)
    QRBandLogo: TQRBand;
    ImageIntestazione: TQRImage;
    QRBandLogoPiede: TQRBand;
    ImagePiede: TQRImage;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel5: TQRLabel;
    QRLRagSoc: TQRLabel;
    QRLIndirizzo: TQRLabel;
    QRLCAP: TQRLabel;
    QRLCitta: TQRLabel;
    QRLProvincia: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShapeRightBorder: TQRShape;
    QRLabel8: TQRLabel;
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
    QRLNuovoImpianto: TQRLabel;
    QRLTrasformazione: TQRLabel;
    QRLAmpliamento: TQRLabel;
    QRLManutenzioneStraordinaria: TQRLabel;
    QRLAltro: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel40: TQRLabel;
    QRShape6: TQRShape;
    QRLabel42: TQRLabel;
    QRShape7: TQRShape;
    QRLabel44: TQRLabel;
    QRShape8: TQRShape;
    QRLabel46: TQRLabel;
    QRShape9: TQRShape;
    QRLabel48: TQRLabel;
    QRLUsoIndustriale: TQRLabel;
    QRLUsoCivile: TQRLabel;
    QRLUsoCommercio: TQRLabel;
    QRLAltriUsi: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel11: TQRLabel;
    QRShape19: TQRShape;
    QRDBRichText1: TQRDBRichText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     // Indica se si stampando un fax oppure no. se si stà stampando un fax forza la stampa del logo
     FaxPrinting:Boolean;

  public

  end;

var
  RichiestaPrimaAccensioneQR: TRichiestaPrimaAccensioneQR;

implementation

uses DataModule1, FormConformita;

{$R *.DFM}

procedure TRichiestaPrimaAccensioneQR.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   LO : TMemIniFile;
   TipoDoc:String;
begin
   TipoDoc := 'Lettere';

   // Apre il file con le impostazioni del logo documento e le carica e poi le chiude
   LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
    // Carica le impostazioni dell'intestazione
    ImageIntestazione.Width  := LO.ReadInteger(TipoDoc, 'LargIntestazione', 363);
    ImageIntestazione.Height := LO.ReadInteger(TipoDoc, 'AltIntestazione', 168);
    if (ImageIntestazione.Width > 0)and(ImageIntestazione.Height > 0) then begin
       QRBandLogo.Height  := ImageIntestazione.Height + 6;
       QRBandLogo.Enabled := True;
    end else begin
       QRBandLogo.Height  := 0;
    end;
    if ((LO.ReadBool(TipoDoc, 'AbilitaStampaIntestazione', True))or(FaxPrinting)) and FileExists(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp') then begin
       ImageIntestazione.Picture.LoadFromFile(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
    end;
    // Carica le impostazioni del piede
    ImagePiede.Width  := LO.ReadInteger(TipoDoc, 'LargPiede', 30);
    ImagePiede.Height := LO.ReadInteger(TipoDoc, 'AltPiede', 30);
    if (ImagePiede.Width > 0)and(ImagePiede.Height > 0) then begin
       QRBandLogoPiede.Height  := ImagePiede.Height + 6;
       QRBandLogoPiede.Enabled := True;
    end else begin
       QRBandLogoPiede.Height  := 0;
       QRBandLogoPiede.Enabled := False;
    end;
    if ((LO.ReadBool(TipoDoc, 'AbilitaStampaPiede', True))or(FaxPrinting))  and FileExists(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp') then begin
       ImagePiede.Picture.LoadFromFile(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
    end;
   // Chiude il file
   LO.Free;

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
   end;

   // Carica i dati del destinatario
   QRLRagSoc.Caption    := ConformitaForm.PrimAccRagSoc.Caption;
   QRLIndirizzo.Caption := ConformitaForm.PrimAccIndirizzo.Caption;
   QRLCAP.Caption       := ConformitaForm.PrimAccCAP.Caption;
   QRLCitta.Caption     := ConformitaForm.PrimAccCitta.Caption;
   QRLProvincia.Caption := ConformitaForm.PrimAccProvincia.Caption;
end;

end.
