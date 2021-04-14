unit QRStampaTabella;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, IBODataset;

type
  TStampaTabellaQR = class(TQuickRep)
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabelEta: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand2: TQRBand;
    QRShape3: TQRShape;
    QRShapeSfondoRigo: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabelDott: TQRLabel;
    QRLabelTitolo: TQRLabel;
    QRLabelIndirizzo1: TQRLabel;
    QRLabelIndirizzo2: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabelTelefono: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure StampaTabellaQRBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure CaricaDatiMedico;
  private

  public

  end;

var
  StampaTabellaQR: TStampaTabellaQR;

implementation

uses FormTracciati, DataModule1;

{$R *.DFM}

procedure TStampaTabellaQR.CaricaDatiMedico;
var
   Qry:TIBOQuery;
begin
   // Azzera le QRLabel
   QRLabelDott.Caption          := '';
   QRLabelTitolo.Caption        := '';
   QRLabelIndirizzo1.Caption    := '';
   QRLabelIndirizzo2.Caption    := '';
   QRLabelTelefono.Caption      := '';
   // Se il medico è indicato
   if not DM1.TableTracciatiCodiceRif.IsNull then begin
      // Crea, imposta  ed esegue l'oggetto query
      Qry := TIBOQuery.Create(Self);
      Qry.SQL.Add('SELECT RagioneSociale, Indirizzo, Citta, CAP, Provincia, PartitaIVA, Titolo, Telefono, Cellulare, Fax, Email');
      Qry.SQL.Add('FROM Clienti');
      Qry.SQL.Add('WHERE Codice = ' + IntToStr(DM1.TableTracciatiCodiceRif.Value));
      Qry.Open;
      // Se è stato trovato almeno un record
      if Qry.RecordCount > 0 then begin
         // Importa i valori del soggetto scelto nei campi del riferimento
         if not Qry.FieldByName('RagioneSociale').IsNull then QRLabelDott.Caption := Qry.FieldByName('RagioneSociale').Value;
         if not Qry.FieldByName('Titolo').IsNull then QRLabelTitolo.Caption := Qry.FieldByName('Titolo').Value;
         if not Qry.FieldByName('Indirizzo').IsNull then QRLabelIndirizzo1.Caption := Qry.FieldByName('Indirizzo').Value;

         if not Qry.FieldByName('CAP').IsNull then QRLabelIndirizzo2.Caption := Qry.FieldByName('CAP').Value + ' - ';
         if not Qry.FieldByName('Citta').IsNull then  QRLabelIndirizzo2.Caption := QRLabelIndirizzo2.Caption + Qry.FieldByName('Citta').Value;
         if not Qry.FieldByName('Provincia').IsNull then  QRLabelIndirizzo2.Caption := QRLabelIndirizzo2.Caption + '   (' + Qry.FieldByName('Provincia').Value + ')';
         if not Qry.FieldByName('PartitaIVA').IsNull then  QRLabelIndirizzo2.Caption := QRLabelIndirizzo2.Caption + '   Partita IVA: ' + Qry.FieldByName('Citta').Value;

         if not Qry.FieldByName('Telefono').IsNull      then QRLabelTelefono.Caption := '   Tel: ' + Qry.FieldByName('Telefono').Value + '   ';
         if not Qry.FieldByName('Cellulare').IsNull     then QRLabelTelefono.Caption := QRLabelTelefono.Caption + '   Cell:' + Qry.FieldByName('Cellulare').Value + '   ';
         if not Qry.FieldByName('Fax').IsNull           then QRLabelTelefono.Caption := QRLabelTelefono.Caption + '   Fax:' + Qry.FieldByName('Fax').Value + '   ';
         if not Qry.FieldByName('Email').IsNull         then QRLabelTelefono.Caption := QRLabelTelefono.Caption + '   E-mail:' + Qry.FieldByName('Email').Value + '   ';
      end;
      // Distrugge la query
      Qry.Close;
      Qry.Free;
   end;
end;



procedure TStampaTabellaQR.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   // Lettura facilitata
   QRShapeSfondoRigo.Left  := 1;
   QRShapeSfondoRigo.Width := 716;
   QRShapeSfondoRigo.Pen.Style := psClear;
   if QRShapeSfondoRigo.Tag = 0 then begin
      QRShapeSfondoRigo.Brush.Color := $00F0F0F0;
      QRShapeSfondoRigo.Tag := 1;
   end else begin
      QRShapeSfondoRigo.Brush.Color := clWhite;
      QRShapeSfondoRigo.Tag := 0;
   end;
   // Controlla che i valori rilevati e lo scarto non siano nulli (-9999) nel qual caso li disabilita.
   if TracciatiForm.TableTabellaTracciatoValoriRilevati.Value <> -9999 then begin
      QRDBText3.Enabled := True;
      QRDBText4.Enabled := True;
      // Colora il font del rigo in base al valore rilevato se minore alla norma,
      //  nella norma o superiore alla norma
      // Se il valore rilevato non è normale...
      If (abs(TracciatiForm.TableTabellaTracciatoScarto.Value) > TracciatiForm.TableTabellaTracciatoTolleranza.Value) then
      begin
         // Se è superiore alla norma...
         If TracciatiForm.TableTabellaTracciatoScarto.Value > 0 then begin
            QRDBText1.Font.Color := clNavy;
            QRDBText2.Font.Color := clNavy;
            QRDBText3.Font.Color := clNavy;
            QRDBText4.Font.Color := clNavy;
            QRDBText5.Font.Color := clNavy;
         // Se è inferiore alla norma...
         end else begin
            QRDBText1.Font.Color := clMaroon;
            QRDBText2.Font.Color := clMaroon;
            QRDBText3.Font.Color := clMaroon;
            QRDBText4.Font.Color := clMaroon;
            QRDBText5.Font.Color := clMaroon;
         end;
      // Se invece il valore e normale...
      end else begin
            QRDBText1.Font.Color := clBlack;
            QRDBText2.Font.Color := clBlack;
            QRDBText3.Font.Color := clBlack;
            QRDBText4.Font.Color := clBlack;
            QRDBText5.Font.Color := clBlack;
      end;
   end else begin
      QRDBText1.Font.Color := clSilver;
      QRDBText2.Font.Color := clSilver;
      QRDBText3.Enabled := False;
      QRDBText4.Enabled := False;
      QRDBText5.Font.Color := clSilver;
   end;
end;

procedure TStampaTabellaQR.StampaTabellaQRBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   CaricaDatiMedico;
   // Carica l'età
   QRLabelEta.Caption := TracciatiForm.EditEta.Text;
end;

end.
