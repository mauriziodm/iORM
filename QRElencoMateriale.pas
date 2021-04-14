unit QRElencoMateriale;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IB_Components;

type
  TQRMemoArray = array[1..9] of ^TQRMemo;
  TElencoMaterialeQR = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel96: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRShapeRightBorder: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Summary: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel45: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel37: TQRLabel;
    LabelCopiaPer: TQRLabel;
    ColHeader1: TQRBand;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRLabel14: TQRLabel;
    QRShape20: TQRShape;
    QRLabel24: TQRLabel;
    QRShape22: TQRShape;
    QRLabel25: TQRLabel;
    QRShape24: TQRShape;
    QRLabel26: TQRLabel;
    QRShape25: TQRShape;
    QRLabel27: TQRLabel;
    QRShape26: TQRShape;
    QRLabel28: TQRLabel;
    QRShape27: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape28: TQRShape;
    QRLabel32: TQRLabel;
    QRShape30: TQRShape;
    QRLabel33: TQRLabel;
    Detail1: TQRSubDetail;
    QRShape31: TQRShape;
    FTipo1: TQRLabel;
    FMarca1: TQRLabel;
    FUM1: TQRLabel;
    FQta1: TQRLabel;
    FPotenza1: TQRLabel;
    FCertificazione1: TQRLabel;
    FInstallato1: TQRLabel;
    FSerNum1: TQRLabel;
    FNote1: TQRLabel;
    ColHeader2: TQRBand;
    Detail2: TQRSubDetail;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    ColHeader3: TQRBand;
    Detail3: TQRSubDetail;
    QRShape34: TQRShape;
    QRShape36: TQRShape;
    QRLabel6: TQRLabel;
    FTipo2: TQRLabel;
    FMarca2: TQRLabel;
    FUM2: TQRLabel;
    FQta2: TQRLabel;
    FPotenza2: TQRLabel;
    FCertificazione2: TQRLabel;
    FInstallato2: TQRLabel;
    FSerNum2: TQRLabel;
    FNote2: TQRLabel;
    QRLabel7: TQRLabel;
    FTipo3: TQRLabel;
    FMarca3: TQRLabel;
    FUM3: TQRLabel;
    FQta3: TQRLabel;
    FPotenza3: TQRLabel;
    FCertificazione3: TQRLabel;
    FInstallato3: TQRLabel;
    FSerNum3: TQRLabel;
    FNote3: TQRLabel;
    ColHeader4: TQRBand;
    Detail4: TQRSubDetail;
    QRLabel8: TQRLabel;
    FTipo4: TQRLabel;
    FMarca4: TQRLabel;
    FUM4: TQRLabel;
    FQta4: TQRLabel;
    FPotenza4: TQRLabel;
    FCertificazione4: TQRLabel;
    FInstallato4: TQRLabel;
    FSerNum4: TQRLabel;
    FNote4: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRLabel22: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape23: TQRShape;
    QRLabelRispondenteNorme: TQRLabel;
    QRLabel30: TQRLabel;
    QRShape11: TQRShape;
    QRLabelConformeArt7: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape13: TQRShape;
    QRLabelMatIdoneiAmbient: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape15: TQRShape;
    QRLabelCompImpEsistente: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape17: TQRShape;
    QRLabelAllegati: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape8: TQRShape;
    QD1: TIB_Cursor;
    QD2: TIB_Cursor;
    QD3: TIB_Cursor;
    QD4: TIB_Cursor;
    QRChildBand1: TQRChildBand;
    QRLabel44: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel92: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape43: TQRShape;
    QRShape4: TQRShape;
    QRLabel9: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SummaryBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Detail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure Detail2NeedData(Sender: TObject; var MoreData: Boolean);
    procedure Detail3NeedData(Sender: TObject; var MoreData: Boolean);
    procedure Detail4NeedData(Sender: TObject; var MoreData: Boolean);
  private
    procedure OpenDetail1Query;
    procedure OpenDetail2Query;
    procedure OpenDEtail3Query;
    procedure OpenDetail4Query;

  public
     CodiceConf: Longint;
     DataConf: TDate;

  end;

var
  ElencoMaterialeQR: TElencoMaterialeQR;

implementation

uses DataModule1, FormStampaDichiarazione;

{$R *.DFM}

procedure TElencoMaterialeQR.QRBand1BeforePrint(Sender: TQRCustomBand;
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

procedure TElencoMaterialeQR.SummaryBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // IMposta le 'X' delle caselle in base ai valori dei relativi campi
   if not(DM1.TableConformitaRispondenteNorme.AsString = '1')             then QRLabelRispondenteNorme.Enabled := False;
   if not(DM1.TableConformitaConformeArt7.AsString     = '1')             then QRLabelConformeArt7.Enabled := False;
   if not(DM1.TableConformitaMatIdoneiAmbient.AsString = '1')             then QRLabelMatIdoneiAmbient.Enabled := False;
   if not(DM1.TableConformitaCompImpEsistente.AsString = '1')             then QRLabelCompImpEsistente.Enabled := False;
   if not(DM1.TableConformitaAllegati.AsString         = '1')             then QRLabelAllegati.Enabled := False;
end;

procedure TElencoMaterialeQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   QRShapeRightBorder.Pen.Color := clWhite;
   QRShape18.Pen.Color := clWhite;
   QRShape31.Pen.Color := clWhite;
   QRShape32.Pen.Color := clWhite;
   QRShape33.Pen.Color := clWhite;
   QRShape34.Pen.Color := clWhite;
   QRShape36.Pen.Color := clWhite;
   QRShape1.Pen.Color := clWhite;
   QRShape3.Pen.Color := clWhite;
   QRShape4.Pen.Color := clWhite;
   QRShape43.Pen.Color := clWhite;
   // RIchiama il gestore di evento per l'impostazione della label COPIA PER...
   StampaDichiarazioneForm.EventoQRBeforePrint(Sender, PrintReport);
   // Apre le tabelle con i dettagli
   OpenDetail1Query;
   OpenDetail2Query;
   OpenDetail3Query;
   OpenDetail4Query;
end;

procedure TElencoMaterialeQR.OpenDetail1Query;
begin
      // Compone la query che conterrà l'elenco del materiale da inserire nella sezione
      if QD1.Active then QD1.Close;
      QD1.SQL.Clear;
      QD1.SQL.Add('SELECT Descrizione, UM, Qta, Marca, Certificazione, Potenza, Installato, SerNum, Note');
      QD1.SQL.Add('FROM RighiConf');
      QD1.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(CodiceConf));
      QD1.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', DataConf) + '''');
//      QD1.SQL.Add('  AND (Installato = ''1'' OR Installabile = ''1'')');
      QD1.SQL.Add('  AND (SistVentilazione = ''0'' OR SistVentilazione IS NULL OR SistVentilazione = '''')');
      QD1.SQL.Add('  AND (SistScaricoComb = ''0'' OR SistScaricoComb IS NULL OR SistScaricoComb = '''')');
      QD1.SQL.Add('  AND (SistCollegElettrico = ''0'' OR SistCollegElettrico IS NULL OR SistCollegElettrico = '''')');
      QD1.Open;
end;

procedure TElencoMaterialeQR.OpenDetail2Query;
begin
      // Compone la query che conterrà l'elenco del materiale da inserire nella sezione
      if QD2.Active then QD2.Close;
      QD2.SQL.Clear;
      QD2.SQL.Add('SELECT Descrizione, UM, Qta, Marca, Certificazione, Potenza, Installato, SerNum, Note');
      QD2.SQL.Add('FROM RighiConf');
      QD2.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(CodiceConf));
      QD2.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', DataConf) + '''');
      QD2.SQL.Add('  AND SistVentilazione = ''1''');
      QD2.Open;
end;

procedure TElencoMaterialeQR.OpenDEtail3Query;
begin
      // Compone la query che conterrà l'elenco del materiale da inserire nella sezione
      if QD3.Active then QD3.Close;
      QD3.SQL.Clear;
      QD3.SQL.Add('SELECT Descrizione, UM, Qta, Marca, Certificazione, Potenza, Installato, SerNum, Note');
      QD3.SQL.Add('FROM RighiConf');
      QD3.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(CodiceConf));
      QD3.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', DataConf) + '''');
      QD3.SQL.Add('  AND SistScaricoComb = ''1''');
      QD3.Open;
end;

procedure TElencoMaterialeQR.OpenDetail4Query;
begin
      // Compone la query che conterrà l'elenco del materiale da inserire nella sezione
      if QD4.Active then QD4.Close;
      QD4.SQL.Clear;
      QD4.SQL.Add('SELECT Descrizione, UM, Qta, Marca, Certificazione, Potenza, Installato, SerNum, Note');
      QD4.SQL.Add('FROM RighiConf');
      QD4.SQL.Add('WHERE CodiceDichiarazione = ' + IntToStr(CodiceConf));
      QD4.SQL.Add('  AND DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', DataConf) + '''');
      QD4.SQL.Add('  AND SistCollegElettrico = ''1''');
      QD4.Open;
end;

procedure TElencoMaterialeQR.Detail1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
    // Inserisce i dati nei memo
    FTipo1.Caption := QD1.FieldByName('Descrizione').AsString;
    FMarca1.Caption := QD1.FieldByName('Marca').AsString;
    FUM1.Caption := QD1.FieldByName('UM').AsString;
    FQta1.Caption := QD1.FieldByName('Qta').AsString;
    FPotenza1.Caption := QD1.FieldByName('Potenza').AsString;
    FCertificazione1.Caption := QD1.FieldByName('Certificazione').AsString;
    if QD1.FieldByName('Installato').AsString = '1' then FInstallato1.Caption := 'Installato' else FInstallato1.Caption := 'Installabile';
    FSerNum1.CAption := QD1.FieldByName('SerNum').AsString;
    FNote1.Caption := QD1.FieldByName('Note').AsString;
    MoreData := not QD1.Eof;
    if MoreData then QD1.Next;
end;

procedure TElencoMaterialeQR.Detail2NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
    // Inserisce i dati nei memo
    FTipo2.Caption := QD2.FieldByName('Descrizione').AsString;
    FMarca2.Caption := QD2.FieldByName('Marca').AsString;
    FUM2.Caption := QD2.FieldByName('UM').AsString;
    FQta2.Caption := QD2.FieldByName('Qta').AsString;
    FPotenza2.Caption := QD2.FieldByName('Potenza').AsString;
    FCertificazione2.Caption := QD2.FieldByName('Certificazione').AsString;
    if QD2.FieldByName('Installato').AsString = '1' then FInstallato2.Caption := 'Installato' else FInstallato2.Caption := 'Installabile';
    FSerNum2.CAption := QD2.FieldByName('SerNum').AsString;
    FNote2.Caption := QD2.FieldByName('Note').AsString;
    MoreData := not QD2.Eof;
    if MoreData then QD2.Next;
end;

procedure TElencoMaterialeQR.Detail3NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
    // Inserisce i dati nei memo
    FTipo3.Caption := QD3.FieldByName('Descrizione').AsString;
    FMarca3.Caption := QD3.FieldByName('Marca').AsString;
    FUM3.Caption := QD3.FieldByName('UM').AsString;
    FQta3.Caption := QD3.FieldByName('Qta').AsString;
    FPotenza3.Caption := QD3.FieldByName('Potenza').AsString;
    FCertificazione3.Caption := QD3.FieldByName('Certificazione').AsString;
    if QD3.FieldByName('Installato').AsString = '1' then FInstallato3.Caption := 'Installato' else FInstallato3.Caption := 'Installabile';
    FSerNum3.CAption := QD3.FieldByName('SerNum').AsString;
    FNote3.Caption := QD3.FieldByName('Note').AsString;
    MoreData := not QD3.Eof;
    if MoreData then QD3.Next;
end;

procedure TElencoMaterialeQR.Detail4NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
    // Inserisce i dati nei memo
    FTipo4.Caption := QD4.FieldByName('Descrizione').AsString;
    FMarca4.Caption := QD4.FieldByName('Marca').AsString;
    FUM4.Caption := QD4.FieldByName('UM').AsString;
    FQta4.Caption := QD4.FieldByName('Qta').AsString;
    FPotenza4.Caption := QD4.FieldByName('Potenza').AsString;
    FCertificazione4.Caption := QD4.FieldByName('Certificazione').AsString;
    if QD4.FieldByName('Installato').AsString = '1' then FInstallato4.Caption := 'Installato' else FInstallato4.Caption := 'Installabile';
    FSerNum4.CAption := QD4.FieldByName('SerNum').AsString;
    FNote4.Caption := QD4.FieldByName('Note').AsString;
    MoreData := not QD4.Eof;
    if MoreData then QD4.Next;
end;

end.
