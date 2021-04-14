unit QRLettera;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBODataset,
  IB_Components;

type
  TLetteraQR = class(TQuickRep)
    QRBandLogo: TQRBand;
    ImageIntestazione: TQRImage;
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
    QRLabelData: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRBandLogoPiede: TQRBand;
    ImagePiede: TQRImage;
    QRSysData1: TQRSysData;
    QRLabelTotPag: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QryMsg: TIBOTable;
    QryMsgID: TIntegerField;
    QryMsgRIF_ID: TIntegerField;
    QryMsgID_SOURCE: TIntegerField;
    QryMsgID_SOGGETTO: TIntegerField;
    QryMsgDEST_RAGSOC: TStringField;
    QryMsgDEST_INDIRIZZO: TStringField;
    QryMsgDEST_NUMCIVICO: TStringField;
    QryMsgDEST_COMUNE: TStringField;
    QryMsgDEST_PROVINCIA: TStringField;
    QryMsgDEST_CAP: TStringField;
    QryMsgDEST_EMAIL: TStringField;
    QryMsgDEST_CELLULARE: TStringField;
    QryMsgID_PRATICA: TIntegerField;
    QryMsgPRATICA: TIntegerField;
    QryMsgDATAPRATICA1: TDateTimeField;
    QryMsgDATA: TDateTimeField;
    QryMsgMSG_TYPE: TStringField;
    QryMsgMSG_OGGETTO: TStringField;
    QryMsgMSG_BLOB: TMemoField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    fP_ID: Integer;
    procedure ApriQuery;

  public
    // Indica se si stampando un fax oppure no. se si stà stampando un fax forza la stampa del logo
    FaxPrinting:Boolean;
    // Variabile che contiene il numero di pagine da stampare
    TotPag:Integer;
    // ID della comunicazione da stampare
    property P_ID:Integer read fP_ID write fP_ID;
  end;

var
  LetteraQR: TLetteraQR;

implementation

uses IniFiles, DataModule1;

{$R *.DFM}


procedure TLetteraQR.ApriQuery;
begin
  // Imposta ed apre la query dell'allegato
  if P_ID = 0 then raise Exception.Create('ID comunicazione non valido!');
  if QryMsg.Active then QryMsg.Close;
  QryMsg.SQLWhere.Clear;
  QryMsg.SQLWhere.Add('WHERE ID = ' + IntToStr(P_ID));
  QryMsg.Open;
end;


procedure TLetteraQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   LO : TMemIniFile;
   TipoDoc:String;
   ms: TMemoryStream;
   Qry:TIB_Cursor;
begin
   // Carica il documento
   ApriQuery;
   // Apre il file con le impostazioni del logo documento e le carica e poi le chiude
   TipoDoc := 'Lettere';
   LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
   // Crea l'oggetto Qry
   Qry := TIB_Cursor.Create(Self);
   try
     // IMposta Qry
     Qry.DatabaseName := DM1.ArcDBFile;
     Qry.IB_Connection := DM1.DBAzienda;
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
     Qry := TIB_Cursor.Create(Self);
     Qry.DatabaseName := DM1.ArcDBFile;
     Qry.IB_Connection := DM1.DBAzienda;
     Qry.SQL.Add('SELECT CITTA FROM DATIAZIE');
     Qry.Open;
     if not Qry.Eof then begin
        QRLabelData.Caption := Qry.FieldByName('CITTA').AsString + ' ' + DM1.DateToItalianLongDate(QryMsg.FieldByName('DATA').AsDateTime);
     end;
     Qry.Close;
     // Se è stata impostata la variabile che contiene il numero delle pagine da stampare aggiorna e visualizza
     //  l'apposita Label altrimenti no.
     if TotPag > 0 then begin
        QRLabelTotPag.Caption := ' / ' + IntToStr(TotPag);
        QRLabelTotPag.Enabled := True;
     end else begin
        QRLabelTotPag.Enabled := False;
     end;
  finally
     if Assigned(Qry) then Qry.Free;
     // Chiude il file
     LO.Free;
   end;
end;

end.
