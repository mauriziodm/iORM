unit QRDichiarazioneGas;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, Db, IBODataset;

type
  TDichiarazioneGasQR = class(TQuickRep)
    QRBand1: TQRBand;
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
    QRLabel15: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel3: TQRLabel;
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
    QRShapeRightBorder: TQRShape;
    QRLabel2: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRBand2: TQRBand;
    QRLabel29: TQRLabel;
    QRDBText13: TQRDBText;
    QRShapeRightBorder2: TQRShape;
    QRShapeRightBorder3: TQRShape;
    QRLabel12: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
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
    QRShape3: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel85: TQRLabel;
    QRMemo1: TQRMemo;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape4: TQRShape;
    QRLTrasformazione: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape5: TQRShape;
    QRLAmpliamento: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape10: TQRShape;
    QRLMAnutenzioneStraordinaria: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape11: TQRShape;
    QRLNuovoImpianto: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape12: TQRShape;
    QRLAltro: TQRLabel;
    QRDBText22: TQRDBText;
    QRLabel39: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel88: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel92: TQRLabel;
    QRDBText23: TQRDBText;
    QRMemo3: TQRMemo;
    QRShape20: TQRShape;
    QRShape13: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    C1: TQRLabel;
    C2: TQRLabel;
    C3: TQRLabel;
    C4: TQRLabel;
    C5: TQRLabel;
    C6: TQRLabel;
    QryTotTubi: TIBOQuery;
    QryTotTappi: TIBOQuery;
    QryCucine: TIBOQuery;
    QryScaldabagno: TIBOQuery;
    QryCaldaie: TIBOQuery;
    QryAltro: TIBOQuery;
    QryTubi: TIBOQuery;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    QRShape2: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel77: TQRLabel;
    QRShapeRightBorder5: TQRShape;
    ChildBand1: TQRChildBand;
    QRShapeRightBorder4: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel28: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel31: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel43: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
  private

  public

  end;

var
  DichiarazioneGasQR: TDichiarazioneGasQR;

implementation

uses DataModule1, FormConformita;

{$R *.DFM}

procedure TDichiarazioneGasQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   // Imposta il colore dello shape al bordo dx a bianco in modo che non si veda
   QRShapeRightBorder.Pen.Color := clWhite;
   QRShapeRightBorder2.Pen.Color := clWhite;
   QRShapeRightBorder3.Pen.Color := clWhite;
   QRShapeRightBorder4.Pen.Color := clWhite;
   QRShapeRightBorder5.Pen.Color := clWhite;
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

   // IMposta ed esegue le queryes
   // -----------------------------------------------------------------
   // Ricerca dei tubi
   QryTubi.Close;
   QryTubi.SQL.Clear;
   QryTubi.SQL.Add('SELECT Qta, Note FROM RighiConf');
   QryTubi.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(ConformitaForm.CodiceConformita));
   QryTubi.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', ConformitaForm.DataConformita) + '''');
   QryTubi.SQL.Add('  AND DichGasTipo = ''Tubo''');
   QryTubi.Open;
   // Totale tubi
   QryTotTubi.Close;
   QryTotTubi.SQL.Clear;
   QryTotTubi.SQL.Add('SELECT SUM(Qta) as TotQta  FROM RighiConf');
   QryTotTubi.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(ConformitaForm.CodiceConformita));
   QryTotTubi.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', ConformitaForm.DataConformita) + '''');
   QryTotTubi.SQL.Add('  AND DichGasTipo = ''Tubo''');
   QryTotTubi.Open;
   // Totale tappi filettati
   QryTotTappi.Close;
   QryTotTappi.SQL.Clear;
   QryTotTappi.SQL.Add('SELECT SUM(Qta) as TotQta  FROM RighiConf');
   QryTotTappi.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(ConformitaForm.CodiceConformita));
   QryTotTappi.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', ConformitaForm.DataConformita) + '''');
   QryTotTappi.SQL.Add('  AND DichGasTipo = ''Tappo filettato''');
   QryTotTappi.Open;
   // Ricerca cucine
   QryCucine.Close;
   QryCucine.SQL.Clear;
   QryCucine.SQL.Add('SELECT Qta, Note FROM RighiConf');
   QryCucine.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(ConformitaForm.CodiceConformita));
   QryCucine.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', ConformitaForm.DataConformita) + '''');
   QryCucine.SQL.Add('  AND DichGasTipo = ''Cucina''');
   QryCucine.Open;
   // Ricerca caldaie
   QryCaldaie.Close;
   QryCaldaie.SQL.Clear;
   QryCaldaie.SQL.Add('SELECT Qta, Potenza FROM RighiConf');
   QryCaldaie.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(ConformitaForm.CodiceConformita));
   QryCaldaie.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', ConformitaForm.DataConformita) + '''');
   QryCaldaie.SQL.Add('  AND DichGasTipo = ''Caldaia''');
   QryCaldaie.Open;
   // Ricerca scaldabagno
   QryScaldabagno.Close;
   QryScaldabagno.SQL.Clear;
   QryScaldabagno.SQL.Add('SELECT Qta, Potenza FROM RighiConf');
   QryScaldabagno.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(ConformitaForm.CodiceConformita));
   QryScaldabagno.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', ConformitaForm.DataConformita) + '''');
   QryScaldabagno.SQL.Add('  AND DichGasTipo = ''Scaldabagno''');
   QryScaldabagno.Open;
   // Ricerca altro
   QryAltro.Close;
   QryAltro.SQL.Clear;
   QryAltro.SQL.Add('SELECT Qta, Potenza, Note FROM RighiConf');
   QryAltro.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(ConformitaForm.CodiceConformita));
   QryAltro.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', ConformitaForm.DataConformita) + '''');
   QryAltro.SQL.Add('  AND DichGasTipo = ''Altro''');
   QryAltro.Open;
end;

procedure TDichiarazioneGasQR.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
var
   Continua1, Continua2: Boolean;
begin
   // DESCRIZIONE IMPIANTO INTERNO
   // ----------------------------
   Continua1 := True;
   // Elenco tubi
   if not QryTubi.Eof then begin
      C1.Caption := QryTubi.FieldByName('Note').AsString;
      C2.Caption := 'mt.';
      C3.Caption := QryTubi.FieldByName('Qta').AsString;
      QryTubi.Next;
   // Tot tubi
   end else if QryTotTubi.Active then begin
      C1.Caption := 'Per un totale di mt.';
      C2.Caption := '';
      C3.Caption := QryTotTubi.FieldByName('TotQta').AsString;
      QryTotTubi.Close;
   // Tot tappi
   end else if QryTotTappi.Active then begin
      C1.Caption := 'Tappi filettati n.';
      C2.Caption := '';
      C3.Caption := QryTotTappi.FieldByName('TotQta').AsString;
      QryTotTappi.Close;
   // Altrimenti..
   end else begin
      C1.Caption := '';
      C2.Caption := '';
      C3.Caption := '';
      Continua1 := False;
   end;

   // APPARECCHI DI UTILIZZAZIONE ALLACCIATI
   // --------------------------------------
   Continua2 := True;
   // Cucine
   if not QryCucine.Eof then begin
      C4.Caption := 'n.';
      C5.Caption := QryCucine.FieldByName('Qta').AsString;
      C6.Caption := QryCucine.FieldByName('Note').AsString;
      QryCucine.Next;
   // Caldaie
   end else if not QryCaldaie.Eof then begin
      C4.Caption := 'n.';
      C5.Caption := QryCaldaie.FieldByName('Qta').AsString;
      C6.Caption := 'caldaie di ' + QryCaldaie.FieldByName('Potenza').AsString;
      QryCaldaie.Next;
   // Scaldabagno
   end else if not QryScaldabagno.Eof then begin
      C4.Caption := 'n.';
      C5.Caption := QryScaldabagno.FieldByName('Qta').AsString;
      C6.Caption := 'scaldabagno di ' + QryScaldabagno.FieldByName('Potenza').AsString;
      QryScaldabagno.Next;
   // Altro
   end else if not QryAltro.Eof then begin
      C4.Caption := 'n.';
      C5.Caption := QryAltro.FieldByName('Qta').AsString;
      C6.Caption := QryAltro.FieldByName('Potenza').AsString + '-' + QryAltro.FieldByName('Note').AsString;
      QryAltro.Next;
   // Altrimenti...
   end else begin
      C4.Caption := '';
      C5.Caption := '';
      C6.Caption := '';
      Continua2 := False;
   end;

   // Imposta MoreData
   MoreData := Continua1 or Continua2;
end;

end.
