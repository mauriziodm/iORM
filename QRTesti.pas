unit QRTesti;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,                                                                                                         
  ExtCtrls, Forms, Quickrpt, QRCtrls, IniFiles, Db, IBODataset,
  IB_Components;

type
  TTestiQR = class(TQuickRep)
    QRBandLogo: TQRBand;
    QRBand2: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText8: TQRDBText;
    ImageIntestazione: TQRImage;
    QRBandLogoPiede: TQRBand;
    ImagePiede: TQRImage;
    QRRichText1: TQRRichText;
    QryTxt: TIBOQuery;
    QryTxtCodice: TIntegerField;
    QryTxtData: TDateField;
    QryTxtCliente: TIntegerField;
    QryTxtPratica: TIntegerField;
    QryTxtNote: TStringField;
    QryTxtArgomento: TStringField;
    QryTxtProvenienza: TStringField;
    QryTxtPratica2: TIntegerField;
    QryTxtPratica3: TIntegerField;
    QryTxtDataPratica1: TDateField;
    QryTxtDataPratica2: TDateField;
    QryTxtDataPratica3: TDateField;
    QryTxtStatoDescrizione: TStringField;
    QryTxtStatoForeground: TStringField;
    QryTxtStatoBackground: TStringField;
    QryTxtOggetto: TStringField;
    QryTxtRagSocCli: TStringField;
    QryTxtIndirizzoCli: TStringField;
    QryTxtCittaCli: TStringField;
    QryTxtCAPCli: TStringField;
    QryTxtProvinciaCli: TStringField;
    QryTxtTextFile: TBlobField;
    QRLabelData: TQRLabel;
    IB_Cursor1: TIB_Cursor;
    QRSysData1: TQRSysData;
    QRLabelTotPag: TQRLabel;
    QRLabel6: TQRLabel;
    QryTxtNUMCIVICOCLI: TStringField;
    QRDBText6: TQRDBText;
    QRLabelNUmDoc: TQRLabel;
    procedure TestiQRBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure StampaTesto(CodTxt:Longint; DataTxt:TDate);
  private

  public
     // Indica se si stampando un fax oppure no. se si stà stampando un fax forza la stampa del logo
     FaxPrinting:Boolean;
     // Variabile che contiene il numero di pagine da stampare
     TotPag:Integer;
  end;

var
  TestiQR: TTestiQR;

implementation

uses DataModule1;

{$R *.DFM}


procedure TTestiQR.StampaTesto(CodTxt:Longint; DataTxt:TDate);
begin
   // IMposta la query e la esegue
   QryTxt.SQL.Clear;
   QryTxt.SQL.Add('SELECT *');
   QryTxt.SQL.Add('FROM Testi');
   QryTxt.SQL.Add('WHERE Codice = ' + IntToStr(CodTxt));
   QryTxt.SQL.Add('  AND Data = ''' + FormatDateTime('mm/dd/yyyy', DataTxt) + '''');
   QryTxt.Open;
end;


procedure TTestiQR.TestiQRBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   LO : TMemIniFile;
   TipoDoc:String;
   ms: TMemoryStream;
   Qry:TIB_Cursor;
begin
   TipoDoc := 'Lettere';
   // Apre il file con le impostazioni del logo documento e le carica e poi le chiude
   LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
   // Crea l'oggetto Qry
   Qry := TIB_Cursor.Create(Self);
   try
     // IMposta Qry
     Qry.DatabaseName := DM1.ArcDBFile;
     Qry.IB_Connection := DM1.DBAzienda;
     // Carica il testo sul memo dal database
     ms := TMemoryStream.Create;
     QryTxtTextFile.SaveToStream(ms);
     ms.Position := 0;
     QRRichText1.Lines.LoadFromStream(ms);
     ms.Free;
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
     // Imposta la Città e la data della lettera
     Qry.SQL.Add('SELECT CITTA FROM DATIAZIE');
     Qry.Open;
     if not Qry.Eof then begin
        QRLabelData.Caption := Qry.FieldByName('CITTA').AsString + ' ' + DM1.DateToItalianLongDate(QryTxt.FieldByName('DATA').AsDateTime);
     end;
     // IMposta il numero del documento
     QRLabelNUmDoc.Caption := 'Documento n. ' + QryTxtCodice.AsString;
     // Se è stata impostata la variabile che contiene il numero delle pagine da stampare aggiorna e visualizza
     //  l'apposita Label altrimenti no.
     if TotPag > 0 then begin
        QRLabelTotPag.Caption := ' / ' + IntToStr(TotPag);
        QRLabelTotPag.Enabled := True;
     end else begin
        QRLabelTotPag.Enabled := False;
     end;
  finally
     Qry.Close;
     Qry.Free;
     // Chiude il file
     LO.Free;
   end;
end;

end.
