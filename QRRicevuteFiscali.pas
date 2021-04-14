unit QRRicevuteFiscali;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IniFiles;

type
  TQReportRicevuteFiscali = class(TQuickRep)
    QRBandPiede1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    ChildDestinatario: TQRChildBand;
    Destinatario: TQRLabel;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText94: TQRDBText;
    QRLabelLuogoDestinazione: TQRLabel;
    QRDBIndirizzoLuogoDestinazione: TQRDBText;
    QRDBCAPLuogoDestinazione: TQRDBText;
    QRLabelTrattinoLuogoDestinazione: TQRLabel;
    QRDBCittaLuogoDestinazione: TQRDBText;
    QRLabelParentesiApertaLuogoDestinazione: TQRLabel;
    QRDBProvinciaLuogoDestinazione: TQRDBText;
    QRLabelParentesiChiusaLuogoDestinazione: TQRLabel;
    QRShapeLuogoDestinazione: TQRShape;
    TipoDocumentoGrande: TQRDBText;
    QRShape89: TQRShape;
    ChildTipoNumData: TQRChildBand;
    QRShape91: TQRShape;
    TipoDoc: TQRLabel;
    TipoDocumento: TQRDBText;
    QRDBText96: TQRDBText;
    NumDoc: TQRLabel;
    DataDoc: TQRLabel;
    Pagina: TQRLabel;
    QRSysData3: TQRSysData;
    Causale: TQRLabel;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    TotaliDocumento1: TQRLabel;
    ImportoIVA1: TQRLabel;
    IVA1: TQRLabel;
    Imponibile1: TQRLabel;
    QRShape7: TQRShape;
    QRDBText16: TQRDBText;
    TotaleMerce1: TQRLabel;
    ScontoPiede1: TQRLabel;
    QRShape8: TQRShape;
    QRDBText17: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText18: TQRDBText;
    QRShape1: TQRShape;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText47: TQRDBText;
    TotaleDocumento1: TQRLabel;
    QRDBText48: TQRDBText;
    QRDBText2: TQRDBText;
    Abbuono1: TQRLabel;
    TotaleDaPagare1: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRLabel1: TQRLabel;
    QRDBText5: TQRDBText;
    ChildPiede2: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape5: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRShape13: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRDBText65: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText69: TQRDBText;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel13: TQRLabel;
    QRDBText70: TQRDBText;
    ChildPiede3: TQRChildBand;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape25: TQRShape;
    QRDBText71: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape26: TQRShape;
    QRDBText72: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText73: TQRDBText;
    QRShape27: TQRShape;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRShape28: TQRShape;
    QRDBText103: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText105: TQRDBText;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRLabel42: TQRLabel;
    QRDBText106: TQRDBText;
    QRShape29: TQRShape;
    ChildArgomento: TQRChildBand;
    QRLabel37: TQRLabel;
    QRDBText115: TQRDBText;
    ChildTrasporto: TQRChildBand;
    QRLabel29: TQRLabel;
    QRDBText116: TQRDBText;
    QRLabel43: TQRLabel;
    QRDBText118: TQRDBText;
    ChildPagamento: TQRChildBand;
    QRLabel44: TQRLabel;
    QRDBText117: TQRDBText;
    ChildChiusura1: TQRChildBand;
    QRShape30: TQRShape;
    ChildChiusura2: TQRChildBand;
    QRLabel45: TQRLabel;
    QRShape35: TQRShape;
    QRLabel66: TQRLabel;
    QRShape36: TQRShape;
    QRLabel67: TQRLabel;
    QRShape37: TQRShape;
    ChildLogoPiede: TQRChildBand;
    ImagePiede: TQRImage;
    ChildIntestazioneColonne: TQRChildBand;
    QRLabelCodiceArticolo: TQRLabel;
    QRShapeCodiceArticolo: TQRShape;
    QRLabelDescrizione: TQRLabel;
    QRShapeDescrizione: TQRShape;
    QRLabelPrezzoUnitario: TQRLabel;
    QRShapePrezzoUnitario: TQRShape;
    QRLabelPrezzoUnitarioIVACompresa: TQRLabel;
    QRShapePrezzoUnitarioIVACompresa: TQRShape;
    QRLabelUnitaDiMisura: TQRLabel;
    QRShapeUnitaDiMisura: TQRShape;
    QRLabelQTA: TQRLabel;
    QRShapeQTA: TQRShape;
    QRLabelScontoRigo1: TQRLabel;
    QRShapeScontoRigo1: TQRShape;
    QRLabelScontoRigo2: TQRLabel;
    QRShapeScontoRigo2: TQRShape;
    QRLabelScontoRigo3: TQRLabel;
    QRShapeScontoRigo3: TQRShape;
    QRLabelImportoRigo: TQRLabel;
    QRShapeImportoRigo: TQRShape;
    QRLabelImportoRigoIVACompresa: TQRLabel;
    QRShapeImportoRigoIVACompresa: TQRShape;
    QRLabelCodiceIVA: TQRLabel;
    QRShapeCodiceIVA: TQRShape;
    QRLabelDescrizioneIVA: TQRLabel;
    QRShapeDescrizioneIVA: TQRShape;
    QRLabelNoteRigo: TQRLabel;
    QRShapeNoteRigo: TQRShape;
    QRShapeFinale: TQRShape;
    Destinatario2: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel22: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabelLuogoDestinazione2: TQRLabel;
    QRDBIndirizzoLuogoDestinazione2: TQRDBText;
    QRDBCAPLuogoDestinazione2: TQRDBText;
    QRLabelTrattinoLuogoDestinazione2: TQRLabel;
    QRDBCittaLuogoDestinazione2: TQRDBText;
    QRLabelParentesiApertaLuogoDestinazione2: TQRLabel;
    QRDBProvinciaLuogoDestinazione2: TQRDBText;
    QRLabelParentesiChiusaLuogoDestinazione2: TQRLabel;
    QRShapeLuogoDestinazione2: TQRShape;
    TipoDocumentoGrande2: TQRDBText;
    QRShape9: TQRShape;
    QRShape38: TQRShape;
    QRLabel32: TQRLabel;
    TipoDocumento2: TQRDBText;
    QRDBText52: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel36: TQRLabel;
    QRDBText54: TQRDBText;
    QRDBText56: TQRDBText;
    QRLabelCodiceArticolo2: TQRLabel;
    QRShapeCodiceArticolo2: TQRShape;
    QRLabelDescrizione2: TQRLabel;
    QRShapeDescrizione2: TQRShape;
    QRLabelPrezzoUnitario2: TQRLabel;
    QRShapePrezzoUnitario2: TQRShape;
    QRLabelPrezzoUnitarioIVACompresa2: TQRLabel;
    QRShapePrezzoUnitarioIVACompresa2: TQRShape;
    QRLabelUnitaDiMisura2: TQRLabel;
    QRShapeUnitaDiMisura2: TQRShape;
    QRLabelQTA2: TQRLabel;
    QRShapeQTA2: TQRShape;
    QRLabelScontoRigo12: TQRLabel;
    QRShapeScontoRigo12: TQRShape;
    QRLabelScontoRigo22: TQRLabel;
    QRShapeScontoRigo22: TQRShape;
    QRLabelScontoRigo32: TQRLabel;
    QRShapeScontoRigo32: TQRShape;
    QRLabelImportoRigo2: TQRLabel;
    QRShapeImportoRigo2: TQRShape;
    QRLabelImportoRigoIVACompresa2: TQRLabel;
    QRShapeImportoRigoIVACompresa2: TQRShape;
    QRLabelCodiceIVA2: TQRLabel;
    QRShapeCodiceIVA2: TQRShape;
    QRLabelDescrizioneIVA2: TQRLabel;
    QRShapeDescrizioneIVA2: TQRShape;
    QRLabelNoteRigo2: TQRLabel;
    QRShapeNoteRigo2: TQRShape;
    QRShapeFinale2: TQRShape;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRShape54: TQRShape;
    QRDBText57: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRShape55: TQRShape;
    QRDBText59: TQRDBText;
    QRLabel70: TQRLabel;
    QRDBText61: TQRDBText;
    QRShape56: TQRShape;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRDBText107: TQRDBText;
    QRDBText108: TQRDBText;
    QRDBText109: TQRDBText;
    QRDBText110: TQRDBText;
    QRDBText111: TQRDBText;
    QRDBText112: TQRDBText;
    QRDBText113: TQRDBText;
    QRDBText114: TQRDBText;
    QRDBText119: TQRDBText;
    QRDBText120: TQRDBText;
    QRDBText121: TQRDBText;
    QRDBText122: TQRDBText;
    QRDBText123: TQRDBText;
    QRDBText124: TQRDBText;
    QRDBText125: TQRDBText;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRDBText126: TQRDBText;
    QRLabel71: TQRLabel;
    QRDBText127: TQRDBText;
    QRDBText128: TQRDBText;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRDBText130: TQRDBText;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel75: TQRLabel;
    QRDBText131: TQRDBText;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape64: TQRShape;
    QRDBText132: TQRDBText;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRShape65: TQRShape;
    QRDBText133: TQRDBText;
    QRLabel82: TQRLabel;
    QRDBText134: TQRDBText;
    QRShape66: TQRShape;
    QRDBText135: TQRDBText;
    QRDBText136: TQRDBText;
    QRDBText137: TQRDBText;
    QRDBText138: TQRDBText;
    QRDBText139: TQRDBText;
    QRDBText140: TQRDBText;
    QRDBText141: TQRDBText;
    QRDBText142: TQRDBText;
    QRDBText143: TQRDBText;
    QRDBText144: TQRDBText;
    QRDBText145: TQRDBText;
    QRDBText146: TQRDBText;
    QRDBText147: TQRDBText;
    QRDBText148: TQRDBText;
    QRDBText149: TQRDBText;
    QRDBText150: TQRDBText;
    QRDBText151: TQRDBText;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRDBText152: TQRDBText;
    QRLabel83: TQRLabel;
    QRDBText153: TQRDBText;
    QRDBText154: TQRDBText;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRDBText156: TQRDBText;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel87: TQRLabel;
    QRDBText157: TQRDBText;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRShape74: TQRShape;
    QRDBText158: TQRDBText;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRShape75: TQRShape;
    QRDBText159: TQRDBText;
    QRLabel94: TQRLabel;
    QRDBText160: TQRDBText;
    QRShape76: TQRShape;
    QRDBText161: TQRDBText;
    QRDBText162: TQRDBText;
    QRDBText163: TQRDBText;
    QRDBText164: TQRDBText;
    QRDBText165: TQRDBText;
    QRDBText166: TQRDBText;
    QRDBText167: TQRDBText;
    QRDBText168: TQRDBText;
    QRDBText169: TQRDBText;
    QRDBText170: TQRDBText;
    QRDBText171: TQRDBText;
    QRDBText172: TQRDBText;
    QRDBText173: TQRDBText;
    QRDBText174: TQRDBText;
    QRDBText175: TQRDBText;
    QRDBText176: TQRDBText;
    QRDBText177: TQRDBText;
    QRShape77: TQRShape;
    QRDBText178: TQRDBText;
    QRLabel95: TQRLabel;
    QRDBText180: TQRDBText;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRLabel97: TQRLabel;
    QRDBText181: TQRDBText;
    QRShape82: TQRShape;
    QRLabel98: TQRLabel;
    QRDBText182: TQRDBText;
    QRLabel99: TQRLabel;
    QRDBText183: TQRDBText;
    QRLabel100: TQRLabel;
    QRDBText184: TQRDBText;
    QRLabel101: TQRLabel;
    QRDBText185: TQRDBText;
    QRShape83: TQRShape;
    QRLabel102: TQRLabel;
    QRShape84: TQRShape;
    QRLabel103: TQRLabel;
    QRShape85: TQRShape;
    QRLabel104: TQRLabel;
    QRShape86: TQRShape;
    ImagePiede2: TQRImage;
    QRShapeSfondoRigo: TQRShape;
    QRShapeSfondoRigo2: TQRShape;
    QRBandLogo: TQRBand;
    QRShape6: TQRShape;
    ImageIntestazione: TQRImage;
    ImageIntestazione2: TQRImage;
    QRBandUltimaPagina: TQRBand;
    QRLabel21: TQRLabel;
    QRDBDataInizioTrasporto: TQRDBText;
    QRDBOraInizioTrasporto: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBDataInizioTrasporto2: TQRDBText;
    QRDBOraInizioTrasporto2: TQRDBText;
    ChildSubSogg: TQRChildBand;
    QRLabelSubSogg11: TQRLabel;
    QRDBTSubSogg11: TQRDBText;
    QRLabelSubSogg12: TQRLabel;
    QRDBTSubSogg12: TQRDBText;
    QRLabelSubSogg13: TQRLabel;
    QRDBTSubSogg13: TQRDBText;
    QRLabelSubSogg21: TQRLabel;
    QRDBTSubSogg21: TQRDBText;
    QRLabelSubSogg22: TQRLabel;
    QRDBTSubSogg22: TQRDBText;
    QRLabelSubSogg23: TQRLabel;
    QRDBTSubSogg23: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText186: TQRDBText;
    CodiceArticolo: TQRLabel;
    Descrizione: TQRLabel;
    PrezzoUnitario: TQRLabel;
    PrezzoUnitarioIVACompresa: TQRLabel;
    UnitaDiMisura: TQRLabel;
    QTA: TQRLabel;
    ScontoRigo1: TQRLabel;
    ScontoRigo2: TQRLabel;
    ScontoRigo3: TQRLabel;
    ImportoRigo: TQRLabel;
    ImportoRigoIVACompresa: TQRLabel;
    CodiceIVA: TQRLabel;
    DescrizioneIVA: TQRLabel;
    NoteRigo: TQRLabel;
    CodiceArticolo2: TQRLabel;
    Descrizione2: TQRLabel;
    PrezzoUnitario2: TQRLabel;
    PrezzoUnitarioIVACompresa2: TQRLabel;
    UnitaDiMisura2: TQRLabel;
    QTA2: TQRLabel;
    ScontoRigo12: TQRLabel;
    ScontoRigo22: TQRLabel;
    ScontoRigo32: TQRLabel;
    ImportoRigo2: TQRLabel;
    ImportoRigoIVACompresa2: TQRLabel;
    CodiceIVA2: TQRLabel;
    DescrizioneIVA2: TQRLabel;
    NoteRigo2: TQRLabel;
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText31Print(sender: TObject; var Value: String);
    procedure QRDBText37Print(sender: TObject; var Value: String);
    procedure QRDBText43Print(sender: TObject; var Value: String);
    procedure QReportRicevuteFiscaliBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandUltimaPaginaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText47Print(sender: TObject; var Value: String);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
  private
    LetturaFacilitata, CastellettoInvisibile, UltimaPagina : Boolean;
    // Variabile che contiene l'indice del rigo documento corrente in stamps
    i: Integer;

  public
    FaxPrinting:Boolean;
  end;

var
  QReportRicevuteFiscali: TQReportRicevuteFiscali;

implementation

uses DataModule1, SchedaPreventiviOrdini;

{$R *.DFM}


procedure TQReportRicevuteFiscali.QRDBText16Print(sender: TObject;
  var Value: String);
begin
   // Se il 'CodiceIVA' < 1 non visualizza il campo
   (Sender as TQRDBText).Font.Color := clBlack;
   if (PreventiviOrdiniForm.QryDocumentoCodiceIVA1.Value = 0)or(CastellettoInvisibile)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportRicevuteFiscali.QRDBText31Print(sender: TObject;
  var Value: String);
begin
   // Se il 'CodiceIVA' < 1 non visualizza il campo
   (Sender as TQRDBText).Font.Color := clBlack;
   if (PreventiviOrdiniForm.QryDocumentoCodiceIVA2.Value = 0)or(CastellettoInvisibile)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportRicevuteFiscali.QRDBText37Print(sender: TObject;
  var Value: String);
begin
   // Se il 'CodiceIVA' < 1 non visualizza il campo
   (Sender as TQRDBText).Font.Color := clBlack;
   if (PreventiviOrdiniForm.QryDocumentoCodiceIVA3.Value = 0)or(CastellettoInvisibile)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportRicevuteFiscali.QRDBText43Print(sender: TObject;
  var Value: String);
begin
   // Se il 'CodiceIVA' < 1 non visualizza il campo
   (Sender as TQRDBText).Font.Color := clBlack;
   if (PreventiviOrdiniForm.QryDocumentoCodiceIVA4.Value = 0)or(CastellettoInvisibile)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportRicevuteFiscali.QReportRicevuteFiscaliBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   LO : TMemIniFile;
   XX, XX2, Sep : Integer;
   TipoDoc : String;
begin
   // Imposta la variabile che contiene l'indice per l'accesso al rigo corrente della griglia dei righi del documento
   //  (sarà poi usata dall'evento OnNeedData della detail band
   i := 0;
   // IMposta l'altezza della banda che indica che sis tà stampando l'ultima pagina
   //  a 0 in modo che è come se non ci fosse
   QRBandUltimaPagina.Height := 0;
   // Carica il tipo di documento in questa variabile per comodità
   TipoDoc := PreventiviOrdiniForm.QryDocumentoTipoDocumento.Value;

   // COntrolla che il campo 'TipoDocumentoEsteso' non sia nullo, ma se lo è fà in modo che i componenti
   //  'TipoDOcumento' e 'TipoDOcumentoEsteso' non puntino al campo 'TipoDOcumentoEsteso' ma a 'TipoDocumento'.
   //  Perchè da quando c'è il campo TipoDocumentoEsteso per l'assegnazione di più nomi al documento, se si visualizza
   //  un documento creato con una versione più vecchia il nuovo campo sarà nullo e quindi non si vedrebbe per niente il
   //  tipo documento; in questo modo invece se manca tale campo si somporta come le versioni precedenti.
   if PreventiviOrdiniForm.QryDocumentoTipoDocumentoEsteso.IsNull then begin
      TipoDocumento.DataField           := 'TipoDocumento';
      TipoDocumentoGrande.DataField     := 'TipoDocumento';
      TipoDocumento2.DataField          := 'TipoDocumento';
      TipoDocumentoGrande2.DataField    := 'TipoDocumento';
   end;

   // Apre il file con le impostazioni del logo documento e le carica e poi le chiude
   LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
    // Carica le impostazioni dell'intestazione
    ImageIntestazione.Width  := LO.ReadInteger(TipoDoc, 'LargIntestazione', 30);
    ImageIntestazione.Height := LO.ReadInteger(TipoDoc, 'AltIntestazione', 30);
    ImageIntestazione2.Height := ImageIntestazione.Height;
    ImageIntestazione2.Width  := ImageIntestazione.Width;
    if (ImageIntestazione.Width > 0)and(ImageIntestazione.Height > 0) then begin
       QRBandLogo.Height  := ImageIntestazione.Height + 6;
       QRBandLogo.Enabled := True;
    end else begin
       QRBandLogo.Height  := 0;
    end;
    if ((LO.ReadBool(TipoDoc, 'AbilitaStampaIntestazione', True))or(FaxPrinting)) and FileExists(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp') then begin
       ImageIntestazione.Picture.LoadFromFile(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
       ImageIntestazione2.Picture.LoadFromFile(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
    end;
    // Carica le impostazioni del piede
    ImagePiede.Width  := LO.ReadInteger(TipoDoc, 'LargPiede', 30);
    ImagePiede.Height := LO.ReadInteger(TipoDoc, 'AltPiede', 30);
    ImagePiede2.Height := ImagePiede.Height;
    ImagePiede2.Width  := ImagePiede.Width;
    if (ImagePiede.Width > 0)and(ImagePiede.Height > 0) then begin
       ChildLogoPiede.Height  := ImagePiede.Height + 6;
       ChildLogoPiede.Enabled := True;
    end else begin
       ChildLogoPiede.Height  := 0;
       ChildLogoPiede.Enabled := False;
    end;
    if ((LO.ReadBool(TipoDoc, 'AbilitaStampaPiede', True))or(FaxPrinting))  and FileExists(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp') then begin
       ImagePiede.Picture.LoadFromFile(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
       ImagePiede2.Picture.LoadFromFile(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
    end;
   // Chiude il file
   LO.Free;

   // Qpre il file che contiene il layout del documento
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   // Inizializza il flag che indica se si stà stampando l'ultima pagina della stampa oppure no.
   UltimaPagina := False;
   // Carica il fòag che indica se stampare i righi con lettura facilitata
   LetturaFacilitata := LO.ReadBool(TipoDoc, 'LetturaFacilitata', True);
   // Carica il flag che indica se il castelletto IVA deve essere invisibile oppure no
   CastellettoInvisibile := not LO.ReadBool(TipoDoc, 'CastellettoIVA', True);
   // Se però è un fax la disabilita comunque (altrimenti non si vede niente)
   //  anche tutti gli altri Shape con sfondo grigino diventano bianchi per
   //  lo stesso motivo
   if FaxPrinting then begin
      LetturaFacilitata := False;
      QRShape10.Brush.Color      := clWhite;
      QRShape18.Brush.Color      := clWhite;
      QRShape28.Brush.Color      := clWhite;
      QRShape38.Brush.Color      := clWhite;
      QRShape57.Brush.Color      := clWhite;
      QRShape67.Brush.Color      := clWhite;
      QRShape77.Brush.Color      := clWhite;
      QRShape91.Brush.Color      := clWhite;
   end;
   // Carica il valore di separazione orizzontale tra i campi del documento
   Sep := LO.ReadInteger(TipoDoc, 'SeparazioneColonne', 3);
   // Inizializza la variabile di posizionamento orizzontale
   XX  := 7;
   XX2 := 532;
   // ----- DESTINATARIO/LUOGO DI DESTINAZIONE -----
    ChildDestinatario.Height := LO.ReadInteger(TipoDoc, 'S_Destinatario', 146);
    if ChildDestinatario.Height > 0 then begin
       ChildDestinatario.Enabled := True;
    end else begin
       ChildDestinatario.Enabled := False;
    end;
   // ----- TIPO/NUM/DATA -----
    ChildTipoNumData.Height := LO.ReadInteger(TipoDoc, 'S_TipoNumData', 23);
    if ChildTipoNumData.Height > 0 then begin
       ChildTipoNumData.Enabled := True;
    end else begin
       ChildTipoNumData.Enabled := False;
    end;
   // ----- SUBSOGG -----
    ChildSubSogg.Height := LO.ReadInteger(TipoDoc, 'S_AbilitaSubSogg', 0);
    if ChildSubSogg.Height > 0 then begin
       ChildSubSogg.Enabled := True;
       if LO.ReadString(TipoDoc, 'S_SubSoggCampo1', '0') <> '0' then begin
          QRLabelSubSogg11.Caption := LO.ReadString(TipoDoc, 'S_SubSoggCampo1', '0') + ' ';
          QRLabelSubSogg21.Caption := QRLabelSubSogg11.Caption;
          QRLabelSubSogg11.Enabled := True;
          QRLabelSubSogg21.Enabled := True;
          QRDBTSubSogg11.Enabled   := True;
          QRDBTSubSogg21.Enabled   := True;
       end else begin
          QRLabelSubSogg11.Enabled := False;
          QRLabelSubSogg21.Enabled := False;
          QRDBTSubSogg11.Enabled   := False;
          QRDBTSubSogg21.Enabled   := False;
       end;
       if LO.ReadString(TipoDoc, 'S_SubSoggCampo2', '0') <> '0' then begin
          QRLabelSubSogg12.Caption := LO.ReadString(TipoDoc, 'S_SubSoggCampo2', '0') + ' ';
          QRLabelSubSogg22.Caption := QRLabelSubSogg12.Caption;
          QRLabelSubSogg12.Enabled := True;
          QRLabelSubSogg22.Enabled := True;
          QRDBTSubSogg12.Enabled   := True;
          QRDBTSubSogg22.Enabled   := True;
       end else begin
          QRLabelSubSogg12.Enabled := False;
          QRLabelSubSogg22.Enabled := False;
          QRDBTSubSogg12.Enabled   := False;
          QRDBTSubSogg22.Enabled   := False;
       end;
       if LO.ReadString(TipoDoc, 'S_SubSoggCampo3', '0') <> '0' then begin
          QRLabelSubSogg13.Caption := LO.ReadString(TipoDoc, 'S_SubSoggCampo3', '0') + ' ';
          QRLabelSubSogg23.Caption := QRLabelSubSogg13.Caption;
          QRLabelSubSogg13.Enabled := True;
          QRLabelSubSogg23.Enabled := True;
          QRDBTSubSogg13.Enabled   := True;
          QRDBTSubSogg23.Enabled   := True;
       end else begin
          QRLabelSubSogg13.Enabled := False;
          QRLabelSubSogg23.Enabled := False;
          QRDBTSubSogg13.Enabled   := False;
          QRDBTSubSogg23.Enabled   := False;
       end;
    end else begin
       ChildSubSogg.Enabled := False;
    end;
   // ----- INTESTAZIONE COLONNE -----
    ChildIntestazioneColonne.Height := LO.ReadInteger(TipoDoc, 'S_IntestazioneColonne', 23);
    if ChildIntestazioneColonne.Height > 0 then begin
       ChildIntestazioneColonne.Enabled := True;
       // NB: Il dimensionamento e il posizionamento dei nomi delle colonne la fà
       //      più avanti insieme ai campi.
    end else begin
       ChildIntestazioneColonne.Enabled := False;
    end;
   // ----- LUOGO DESTINAZIONE -----
    if LO.ReadInteger(TipoDoc, 'S_LuogoDestinazione', 0) = 0 then begin
       QRShapeLuogoDestinazione.Enabled                := False;
       QRLabelLuogoDestinazione.Enabled                := False;
       QRLabelTrattinoLuogoDestinazione.Enabled        := False;
       QRLabelParentesiApertaLuogoDestinazione.Enabled := False;
       QRLabelParentesiChiusaLuogoDestinazione.Enabled := False;
       QRDBIndirizzoLuogoDestinazione.Enabled          := False;
       QRDBCAPLuogoDestinazione.Enabled                := False;
       QRDBCittaLuogoDestinazione.Enabled              := False;
       QRDBProvinciaLuogoDestinazione.Enabled          := False;

       QRShapeLuogoDestinazione2.Enabled                := False;
       QRLabelLuogoDestinazione2.Enabled                := False;
       QRLabelTrattinoLuogoDestinazione2.Enabled        := False;
       QRLabelParentesiApertaLuogoDestinazione2.Enabled := False;
       QRLabelParentesiChiusaLuogoDestinazione2.Enabled := False;
       QRDBIndirizzoLuogoDestinazione2.Enabled          := False;
       QRDBCAPLuogoDestinazione2.Enabled                := False;
       QRDBCittaLuogoDestinazione2.Enabled              := False;
       QRDBProvinciaLuogoDestinazione2.Enabled          := False;
    end;
   // ----- PIEDE -----
    QRBandPiede1.Height  := 0;
    ChildPiede2.Height   := 0;
    ChildPiede2.Enabled  := False;
    ChildPiede3.Height   := 0;
    ChildPiede3.Enabled  := False;
    case LO.ReadInteger(TipoDoc, 'S_PiedeTipo', 3) of
       1 : begin
              QRBandPiede1.Height  := LO.ReadInteger(TipoDoc, 'S_PiedeAltezza', 135);
              QRBandPiede1.Enabled := True;
           end;
       2 : begin
              ChildPiede2.Height  := LO.ReadInteger(TipoDoc, 'S_PiedeAltezza', 135);
              ChildPiede2.Enabled := True;
           end;
       3 : begin
              ChildPiede3.Height  := LO.ReadInteger(TipoDoc, 'S_PiedeAltezza', 135);
              ChildPiede3.Enabled := True;
           end;
    end;
   // ----- ARGOMENTO -----
    ChildArgomento.Height := LO.ReadInteger(TipoDoc, 'S_Argomento', 0);
    if ChildArgomento.Height > 0 then begin
       ChildArgomento.Enabled := True;
    end else begin
       ChildArgomento.Enabled := False;
    end;
   // ----- TRASPORTO -----
    ChildTrasporto.Height := LO.ReadInteger(TipoDoc, 'S_Trasporto', 0);
    if ChildTrasporto.Height > 0 then begin
       ChildTrasporto.Enabled := True;
       // Se il valore della data e/o inizio trasporto sono nulli pone li rende invisibili
       QRDBDataInizioTrasporto.Enabled := not PreventiviOrdiniForm.QryDocumentoDataTrasp.IsNull;
       QRDBOraInizioTrasporto.Enabled  := not PreventiviOrdiniForm.QryDocumentoOraTrasp.IsNull;
       QRDBDataInizioTrasporto2.Enabled := not PreventiviOrdiniForm.QryDocumentoDataTrasp.IsNull;
       QRDBOraInizioTrasporto2.Enabled  := not PreventiviOrdiniForm.QryDocumentoOraTrasp.IsNull;
    end else begin
       ChildTrasporto.Enabled := False;
    end;
   // ----- PAGAMENTO -----
    ChildPagamento.Height := LO.ReadInteger(TipoDoc, 'S_Pagamento', 0);
    if ChildPagamento.Height > 0 then begin
       ChildPagamento.Enabled := True;
    end else begin
       ChildPagamento.Enabled := False;
    end;
   // ----- CHIUSURA -----
    ChildChiusura1.Height  := 0;
    ChildChiusura1.Enabled := False;
    ChildChiusura2.Height  := 0;
    ChildChiusura2.Enabled := False;
    case LO.ReadInteger(TipoDoc, 'S_ChiusuraTipo', 0) of
       1 : begin
              ChildChiusura1.Height  := 6;
              ChildChiusura1.Enabled := True;
           end;
       2 : begin
              ChildChiusura2.Height  := 50;
              ChildChiusura2.Enabled := True;
           end;
    end;

   // ---------------------------------------------------------------------------------------------------
   //                       POSIZIONAMENTO E DIMENSIONAMENTO COLONNE DOCUMENTO
   // ---------------------------------------------------------------------------------------------------
    // ----- CODICE ARTICOLO -----
     if LO.ReadInteger(TipoDoc, 'Col_CodiceArticolo', 2) > 1 then begin
        QRLabelCodiceArticolo.Left   := XX;
        QRLabelCodiceArticolo.Width  := PreventiviOrdiniForm.tvCorpoCODICEARTICOLOSTM.Width + 5;
        QRShapeCodiceArticolo.Left   := XX;
        QRShapeCodiceArticolo.Width  := QRLabelCodiceArticolo.Width;
        CodiceArticolo.Left  := XX;
        CodiceArticolo.Width := QRLabelCodiceArticolo.Width;
        XX := XX + CodiceArticolo.Width + Sep;
        QRLabelCodiceArticolo2.Left   := XX2;
        QRLabelCodiceArticolo2.Width  := QRLabelCodiceArticolo.Width;
        QRShapeCodiceArticolo2.Left   := XX2;
        QRShapeCodiceArticolo2.Width  := QRLabelCodiceArticolo.Width;
        CodiceArticolo2.Left  := XX2;
        CodiceArticolo2.Width := QRLabelCodiceArticolo.Width;
        XX2 := XX2 + QRLabelCodiceArticolo.Width + Sep;
     end else begin
        QRLabelCodiceArticolo.Enabled  := False;
        QRShapeCodiceArticolo.Enabled  := False;
        CodiceArticolo.Enabled := False;
        QRLabelCodiceArticolo2.Enabled  := False;
        QRShapeCodiceArticolo2.Enabled  := False;
        CodiceArticolo2.Enabled := False;
     end;
    // ----- DESCRIZIONE -----
     if LO.ReadInteger(TipoDoc, 'Col_Descrizione', 2) > 1 then begin
        QRLabelDescrizione.Left   := XX;
        QRLabelDescrizione.Width  := PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Width + 15;
        QRShapeDescrizione.Left   := XX;
        QRShapeDescrizione.Width  := QRLabelDescrizione.Width;
        Descrizione.Left  := XX;
        Descrizione.Width := QRLabelDescrizione.Width;
        XX := XX + QRLabelDescrizione.Width + Sep;
        QRLabelDescrizione2.Left   := XX2;
        QRLabelDescrizione2.Width  := QRLabelDescrizione.Width;
        QRShapeDescrizione2.Left   := XX2;
        QRShapeDescrizione2.Width  := QRLabelDescrizione.Width;
        Descrizione2.Left  := XX2;
        Descrizione2.Width := QRLabelDescrizione.Width;
        XX2 := XX2 + QRLabelDescrizione.Width + Sep;
     end else begin
        QRLabelDescrizione.Enabled  := False;
        QRShapeDescrizione.Enabled  := False;
        Descrizione.Enabled := False;
        QRLabelDescrizione2.Enabled  := False;
        QRShapeDescrizione2.Enabled  := False;
        Descrizione2.Enabled := False;
     end;
    // ----- PREZZO UNITARIO -----
     if LO.ReadInteger(TipoDoc, 'Col_PrezzoUnitario', 2) > 1 then begin
        QRLabelPrezzoUnitario.Left   := XX;
        QRLabelPrezzoUnitario.Width  := PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Width;
        QRShapePrezzoUnitario.Left   := XX;
        QRShapePrezzoUnitario.Width  := QRLabelPrezzoUnitario.Width;
        PrezzoUnitario.Left  := XX;
        PrezzoUnitario.Width := QRLabelPrezzoUnitario.Width;
        XX := XX + QRLabelPrezzoUnitario.Width + Sep;
        QRLabelPrezzoUnitario2.Left   := XX2;
        QRLabelPrezzoUnitario2.Width  := QRLabelPrezzoUnitario.Width;
        QRShapePrezzoUnitario2.Left   := XX2;
        QRShapePrezzoUnitario2.Width  := QRLabelPrezzoUnitario.Width;
        PrezzoUnitario2.Left  := XX2;
        PrezzoUnitario2.Width := QRLabelPrezzoUnitario.Width;
        XX2 := XX2 + QRLabelPrezzoUnitario.Width + Sep;
     end else begin
        QRLabelPrezzoUnitario.Enabled  := False;
        QRShapePrezzoUnitario.Enabled  := False;
        PrezzoUnitario.Enabled := False;
        QRLabelPrezzoUnitario2.Enabled  := False;
        QRShapePrezzoUnitario2.Enabled  := False;
        PrezzoUnitario2.Enabled := False;
     end;
    // ----- PREZZO UNITARIO IVA COMPRESA-----
     if LO.ReadInteger(TipoDoc, 'Col_PrezzoUnitarioIVACompresa', 2) > 1 then begin
        QRLabelPrezzoUnitarioIVACompresa.Left   := XX;
        QRLabelPrezzoUnitarioIVACompresa.Width  := PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Width;
        QRShapePrezzoUnitarioIVACompresa.Left   := XX;
        QRShapePrezzoUnitarioIVACompresa.Width  := QRLabelPrezzoUnitarioIVACompresa.Width;
        PrezzoUnitarioIVACompresa.Left  := XX;
        PrezzoUnitarioIVACompresa.Width := QRLabelPrezzoUnitarioIVACompresa.Width;
        XX := XX + QRLabelPrezzoUnitarioIVACompresa.Width + Sep;
        QRLabelPrezzoUnitarioIVACompresa2.Left   := XX2;
        QRLabelPrezzoUnitarioIVACompresa2.Width  := QRLabelPrezzoUnitarioIVACompresa.Width;
        QRShapePrezzoUnitarioIVACompresa2.Left   := XX2;
        QRShapePrezzoUnitarioIVACompresa2.Width  := QRLabelPrezzoUnitarioIVACompresa.Width;
        PrezzoUnitarioIVACompresa2.Left  := XX2;
        PrezzoUnitarioIVACompresa2.Width := QRLabelPrezzoUnitarioIVACompresa.Width;
        XX2 := XX2 + QRLabelPrezzoUnitarioIVACompresa.Width + Sep;
     end else begin
        QRLabelPrezzoUnitarioIVACompresa.Enabled  := False;
        QRShapePrezzoUnitarioIVACompresa.Enabled  := False;
        PrezzoUnitarioIVACompresa.Enabled := False;
        QRLabelPrezzoUnitarioIVACompresa2.Enabled  := False;
        QRShapePrezzoUnitarioIVACompresa2.Enabled  := False;
        PrezzoUnitarioIVACompresa2.Enabled := False;
     end;
    // ----- UNITA DI MISURA -----
     if LO.ReadInteger(TipoDoc, 'Col_UnitaDiMisura', 2) > 1 then begin
        QRLabelUnitaDiMisura.Left   := XX;
        QRLabelUnitaDiMisura.Width  := PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Width;
        QRShapeUnitaDiMisura.Left   := XX;
        QRShapeUnitaDiMisura.Width  := QRLabelUnitaDiMisura.Width;
        UnitaDiMisura.Left  := XX;
        UnitaDiMisura.Width := QRLabelUnitaDiMisura.Width;
        XX := XX + QRLabelUnitaDiMisura.Width + Sep;
        QRLabelUnitaDiMisura2.Left   := XX2;
        QRLabelUnitaDiMisura2.Width  := QRLabelUnitaDiMisura.Width;
        QRShapeUnitaDiMisura2.Left   := XX2;
        QRShapeUnitaDiMisura2.Width  := QRLabelUnitaDiMisura.Width;
        UnitaDiMisura2.Left  := XX2;
        UnitaDiMisura2.Width := QRLabelUnitaDiMisura.Width;
        XX2 := XX2 + QRLabelUnitaDiMisura.Width + Sep;
     end else begin
        QRLabelUnitaDiMisura.Enabled  := False;
        QRShapeUnitaDiMisura.Enabled  := False;
        UnitaDiMisura.Enabled := False;
        QRLabelUnitaDiMisura2.Enabled  := False;
        QRShapeUnitaDiMisura2.Enabled  := False;
        UnitaDiMisura2.Enabled := False;
     end;
    // ----- QTA -----
     if LO.ReadInteger(TipoDoc, 'Col_QTA', 2) > 1 then begin
        QRLabelQTA.Left   := XX;
        QRLabelQTA.Width  := PreventiviOrdiniForm.tvCorpoQTA.Width;
        QRShapeQTA.Left   := XX;
        QRShapeQTA.Width  := QRLabelQTA.Width;
        QTA.Left  := XX;
        QTA.Width := QRLabelQTA.Width;
        XX := XX + QRLabelQTA.Width + Sep;
        QRLabelQTA2.Left   := XX2;
        QRLabelQTA2.Width  := QRLabelQTA.Width;
        QRShapeQTA2.Left   := XX2;
        QRShapeQTA2.Width  := QRLabelQTA.Width;
        QTA2.Left  := XX2;
        QTA2.Width := QRLabelQTA.Width;
        XX2 := XX2 + QRLabelQTA.Width + Sep;
     end else begin
        QRLabelQTA.Enabled  := False;
        QRShapeQTA.Enabled  := False;
        QTA.Enabled := False;
        QRLabelQTA2.Enabled  := False;
        QRShapeQTA2.Enabled  := False;
        QTA2.Enabled := False;
     end;
    // ----- SCONTO RIGO 1 -----
     if LO.ReadInteger(TipoDoc, 'Col_ScontoRigo1', 2) > 1 then begin
        QRLabelScontoRigo1.Left   := XX;
        QRLabelScontoRigo1.Width  := PreventiviOrdiniForm.tvCorpoSCONTORIGO.Width;
        QRShapeScontoRigo1.Left   := XX;
        QRShapeScontoRigo1.Width  := QRLabelScontoRigo1.Width;
        ScontoRigo1.Left  := XX;
        ScontoRigo1.Width := QRLabelScontoRigo1.Width;
        XX := XX + QRLabelScontoRigo1.Width + Sep;
        QRLabelScontoRigo12.Left   := XX2;
        QRLabelScontoRigo12.Width  := QRLabelScontoRigo1.Width;
        QRShapeScontoRigo12.Left   := XX2;
        QRShapeScontoRigo12.Width  := QRLabelScontoRigo1.Width;
        ScontoRigo12.Left  := XX2;
        ScontoRigo12.Width := QRLabelScontoRigo1.Width;
        XX2 := XX2 + QRLabelScontoRigo1.Width + Sep;
     end else begin
        QRLabelScontoRigo1.Enabled  := False;
        QRShapeScontoRigo1.Enabled  := False;
        ScontoRigo1.Enabled := False;
        QRLabelScontoRigo12.Enabled  := False;
        QRShapeScontoRigo12.Enabled  := False;
        ScontoRigo12.Enabled := False;
     end;
    // ----- SCONTO RIGO 2 -----
     if LO.ReadInteger(TipoDoc, 'Col_ScontoRigo2', 2) > 1 then begin
        QRLabelScontoRigo2.Left   := XX;
        QRLabelScontoRigo2.Width  := PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Width;
        QRShapeScontoRigo2.Left   := XX;
        QRShapeScontoRigo2.Width  := QRLabelScontoRigo2.Width;
        ScontoRigo2.Left  := XX;
        ScontoRigo2.Width := QRLabelScontoRigo2.Width;
        XX := XX + QRLabelScontoRigo2.Width + Sep;
        QRLabelScontoRigo22.Left   := XX2;
        QRLabelScontoRigo22.Width  := QRLabelScontoRigo2.Width;
        QRShapeScontoRigo22.Left   := XX2;
        QRShapeScontoRigo22.Width  := QRLabelScontoRigo2.Width;
        ScontoRigo22.Left  := XX2;
        ScontoRigo22.Width := QRLabelScontoRigo2.Width;
        XX2 := XX2 + QRLabelScontoRigo2.Width + Sep;
     end else begin
        QRLabelScontoRigo2.Enabled  := False;
        QRShapeScontoRigo2.Enabled  := False;
        ScontoRigo2.Enabled := False;
        QRLabelScontoRigo22.Enabled  := False;
        QRShapeScontoRigo22.Enabled  := False;
        ScontoRigo22.Enabled := False;
     end;
    // ----- SCONTO RIGO 3-----
     if LO.ReadInteger(TipoDoc, 'Col_ScontoRigo3', 2) > 1 then begin
        QRLabelScontoRigo3.Left   := XX;
        QRLabelScontoRigo3.Width  := PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Width;
        QRShapeScontoRigo3.Left   := XX;
        QRShapeScontoRigo3.Width  := QRLabelScontoRigo3.Width;
        ScontoRigo3.Left  := XX;
        ScontoRigo3.Width := QRLabelScontoRigo3.Width;
        XX := XX + QRLabelScontoRigo3.Width + Sep;
        QRLabelScontoRigo32.Left   := XX2;
        QRLabelScontoRigo32.Width  := QRLabelScontoRigo3.Width;
        QRShapeScontoRigo32.Left   := XX2;
        QRShapeScontoRigo32.Width  := QRLabelScontoRigo3.Width;
        ScontoRigo32.Left  := XX2;
        ScontoRigo32.Width := QRLabelScontoRigo3.Width;
        XX2 := XX2 + QRLabelScontoRigo3.Width + Sep;
     end else begin
        QRLabelScontoRigo3.Enabled  := False;
        QRShapeScontoRigo3.Enabled  := False;
        ScontoRigo3.Enabled := False;
        QRLabelScontoRigo32.Enabled  := False;
        QRShapeScontoRigo32.Enabled  := False;
        ScontoRigo32.Enabled := False;
     end;
    // ----- IMPORTO RIGO -----
     if LO.ReadInteger(TipoDoc, 'Col_ImportoRigo', 2) > 1 then begin
        QRLabelImportoRigo.Left   := XX;
        QRLabelImportoRigo.Width  := PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Width;
        QRShapeImportoRigo.Left   := XX;
        QRShapeImportoRigo.Width  := QRLabelImportoRigo.Width;
        ImportoRigo.Left  := XX;
        ImportoRigo.Width := QRLabelImportoRigo.Width;
        XX := XX + QRLabelImportoRigo.Width + Sep;
        QRLabelImportoRigo2.Left   := XX2;
        QRLabelImportoRigo2.Width  := QRLabelImportoRigo.Width;
        QRShapeImportoRigo2.Left   := XX2;
        QRShapeImportoRigo2.Width  := QRLabelImportoRigo.Width;
        ImportoRigo2.Left  := XX2;
        ImportoRigo2.Width := QRLabelImportoRigo.Width;
        XX2 := XX2 + QRLabelImportoRigo.Width + Sep;
     end else begin
        QRLabelImportoRigo.Enabled  := False;
        QRShapeImportoRigo.Enabled  := False;
        ImportoRigo.Enabled := False;
        QRLabelImportoRigo2.Enabled  := False;
        QRShapeImportoRigo2.Enabled  := False;
        ImportoRigo2.Enabled := False;
     end;
    // ----- IMPORTO RIGO IVA COMPRESA-----
     if LO.ReadInteger(TipoDoc, 'Col_ImportoRigoIVACompresa', 2) > 1 then begin
        QRLabelImportoRigoIVACompresa.Left   := XX;
        QRLabelImportoRigoIVACompresa.Width  := PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Width;
        QRShapeImportoRigoIVACompresa.Left   := XX;
        QRShapeImportoRigoIVACompresa.Width  := QRLabelImportoRigoIVACompresa.Width;
        ImportoRigoIVACompresa.Left  := XX;
        ImportoRigoIVACompresa.Width := QRLabelImportoRigoIVACompresa.Width;
        XX := XX + QRLabelImportoRigoIVACompresa.Width + Sep;
        QRLabelImportoRigoIVACompresa2.Left   := XX2;
        QRLabelImportoRigoIVACompresa2.Width  := QRLabelImportoRigoIVACompresa.Width;
        QRShapeImportoRigoIVACompresa2.Left   := XX2;
        QRShapeImportoRigoIVACompresa2.Width  := QRLabelImportoRigoIVACompresa.Width;
        ImportoRigoIVACompresa2.Left  := XX2;
        ImportoRigoIVACompresa2.Width := QRLabelImportoRigoIVACompresa.Width;
        XX2 := XX2 + QRLabelImportoRigoIVACompresa.Width + Sep;
     end else begin
        QRLabelImportoRigoIVACompresa.Enabled  := False;
        QRShapeImportoRigoIVACompresa.Enabled  := False;
        ImportoRigoIVACompresa.Enabled := False;
        QRLabelImportoRigoIVACompresa2.Enabled  := False;
        QRShapeImportoRigoIVACompresa2.Enabled  := False;
        ImportoRigoIVACompresa2.Enabled := False;
     end;
    // ----- CODICE IVA -----
     if LO.ReadInteger(TipoDoc, 'Col_CodiceIVA', 2) > 1 then begin
        QRLabelCodiceIVA.Left   := XX;
        QRLabelCodiceIVA.Width  := PreventiviOrdiniForm.tvCorpoCODICEIVA.Width;
        QRShapeCodiceIVA.Left   := XX;
        QRShapeCodiceIVA.Width  := QRLabelCodiceIVA.Width;
        CodiceIVA.Left  := XX;
        CodiceIVA.Width := QRLabelCodiceIVA.Width;
        XX := XX + QRLabelCodiceIVA.Width + Sep;
        QRLabelCodiceIVA2.Left   := XX2;
        QRLabelCodiceIVA2.Width  := QRLabelCodiceIVA.Width;
        QRShapeCodiceIVA2.Left   := XX2;
        QRShapeCodiceIVA2.Width  := QRLabelCodiceIVA.Width;
        CodiceIVA2.Left  := XX2;
        CodiceIVA2.Width := QRLabelCodiceIVA.Width;
        XX2 := XX2 + QRLabelCodiceIVA.Width + Sep;
     end else begin
        QRLabelCodiceIVA.Enabled  := False;
        QRShapeCodiceIVA.Enabled  := False;
        CodiceIVA.Enabled := False;
        QRLabelCodiceIVA2.Enabled  := False;
        QRShapeCodiceIVA2.Enabled  := False;
        CodiceIVA2.Enabled := False;
     end;
    // ----- DESCRIZIONE IVA -----
     if LO.ReadInteger(TipoDoc, 'Col_DescrizioneIVA', 2) > 1 then begin
        QRLabelDescrizioneIVA.Left   := XX;
        QRLabelDescrizioneIVA.Width  := PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Width;
        QRShapeDescrizioneIVA.Left   := XX;
        QRShapeDescrizioneIVA.Width  := QRLabelDescrizioneIVA.Width;
        DescrizioneIVA.Left  := XX;
        DescrizioneIVA.Width := QRLabelDescrizioneIVA.Width;
        XX := XX + QRLabelDescrizioneIVA.Width + Sep;
        QRLabelDescrizioneIVA2.Left   := XX2;
        QRLabelDescrizioneIVA2.Width  := QRLabelDescrizioneIVA.Width;
        QRShapeDescrizioneIVA2.Left   := XX2;
        QRShapeDescrizioneIVA2.Width  := QRLabelDescrizioneIVA.Width;
        DescrizioneIVA2.Left  := XX2;
        DescrizioneIVA2.Width := QRLabelDescrizioneIVA.Width;
        XX2 := XX2 + QRLabelDescrizioneIVA.Width + Sep;
     end else begin
        QRLabelDescrizioneIVA.Enabled  := False;
        QRShapeDescrizioneIVA.Enabled  := False;
        DescrizioneIVA.Enabled := False;
        QRLabelDescrizioneIVA2.Enabled  := False;
        QRShapeDescrizioneIVA2.Enabled  := False;
        DescrizioneIVA2.Enabled := False;
     end;
    // ----- NOTE RIGO -----
     if LO.ReadInteger(TipoDoc, 'Col_NoteRigo', 2) > 1 then begin
        QRLabelNoteRigo.Left   := XX;
        QRLabelNoteRigo.Width  := PreventiviOrdiniForm.tvCorpoNOTERIGO.Width;
        QRShapeNoteRigo.Left   := XX;
        QRShapeNoteRigo.Width  := QRLabelNoteRigo.Width;
        NoteRigo.Left  := XX;
        NoteRigo.Width := QRLabelNoteRigo.Width;
        XX := XX + QRLabelNoteRigo.Width + Sep;
        QRLabelNoteRigo2.Left   := XX2;
        QRLabelNoteRigo2.Width  := QRLabelNoteRigo.Width;
        QRShapeNoteRigo2.Left   := XX2;
        QRShapeNoteRigo2.Width  := QRLabelNoteRigo.Width;
        NoteRigo2.Left  := XX2;
        NoteRigo2.Width := QRLabelNoteRigo.Width;
        XX2 := XX2 + QRLabelNoteRigo.Width + Sep;
     end else begin
        QRLabelNoteRigo.Enabled  := False;
        QRShapeNoteRigo.Enabled  := False;
        NoteRigo.Enabled := False;
        QRLabelNoteRigo2.Enabled  := False;
        QRShapeNoteRigo2.Enabled  := False;
        NoteRigo2.Enabled := False;
     end;
    // ----- FINALE -----
     XX := XX - Sep;
     QRShapeFinale.Left  := XX;
     QRShapeFinale.Width := 514 - XX;
     XX2 := XX2 - Sep;
     QRShapeFinale2.Left  := XX2;
     QRShapeFinale2.Width := 1039 - XX2;
    // ----- COLORA IL MODULO -----
     DM1.ColoreModulo(QReportRicevuteFiscali,
                      DM1.StrToColor(LO.ReadString(TipoDoc, 'Colore1', 'clBlue'), clBlue),
                      DM1.StrToColor(LO.ReadString(TipoDoc, 'Colore2', 'clBlue'), clBlue),
                      LO.ReadInteger(TipoDoc, 'SpessoreLinee', 3),
                      -1, -1);
   // ---------------------------------------------------------------------------------------------------
   LO.Free;
end;

procedure TQReportRicevuteFiscali.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   // Se la lettura facilitata è abilitata...
   if LetturaFacilitata then begin
      // Dimensiona corretamente lo shape e lo colora a righe alternate
      QRShapeSfondoRigo.Left  := 7;
      QRShapeSfondoRigo.Width := 507;
      QRShapeSfondoRigo.Pen.Style := psClear;
      QRShapeSfondoRigo2.Left  := 532;
      QRShapeSfondoRigo2.Width := 507;
      QRShapeSfondoRigo2.Pen.Style := psClear;
      if QRShapeSfondoRigo.Tag = 901 then begin
         QRShapeSfondoRigo.Brush.Color := $00F0F0F0;
         QRShapeSfondoRigo.Tag := 900;
         QRShapeSfondoRigo2.Brush.Color := $00F0F0F0;
      end else begin
         QRShapeSfondoRigo.Tag := 901;
         QRShapeSfondoRigo.Brush.Color := clWhite;
         QRShapeSfondoRigo2.Brush.Color := clWhite;
      end;
   end else begin
      QRShapeSfondoRigo.Enabled := False;
      QRShapeSfondoRigo2.Enabled := False;
   end;
end;

procedure TQReportRicevuteFiscali.QRBandUltimaPaginaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Se stampa questa banda significa che stà stampando l'ultima pagina e quindi imposta
  //  il flag 'UltimaPagina' in modo ce vengano stampati i totali del documento che altrimenti
  //  non verrebbero stampati.
  UltimaPagina := True;
end;

procedure TQReportRicevuteFiscali.QRDBText47Print(sender: TObject;
  var Value: String);
begin
   (Sender as TQRDBText).Font.Color := clBlack;
   if not UltimaPagina then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportRicevuteFiscali.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
   // Carica i dati del rigo corrente
   CodiceArticolo.Caption            := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoCODICEARTICOLO.Index];
   Descrizione.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index];
   PrezzoUnitario.Caption            := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Index];
   PrezzoUnitarioIVACompresa.Caption := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Index];
   UnitaDiMisura.Caption             := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Index];
   QTA.Caption                       := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoQTA.Index];
   ScontoRigo1.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoSCONTORIGO.Index];
   ScontoRigo2.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Index];
   ScontoRigo3.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Index];
   ImportoRigo.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Index];
   ImportoRigoIVACompresa.Caption    := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Index];
   CodiceIVA.Caption                 := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoCODICEIVA.Index];
   DescrizioneIVA.Caption            := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Index];
   NoteRigo.Caption                  := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoNOTERIGO.Index];

   CodiceArticolo2.Caption            := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoCODICEARTICOLO.Index];
   Descrizione2.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index];
   PrezzoUnitario2.Caption            := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Index];
   PrezzoUnitarioIVACompresa2.Caption := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Index];
   UnitaDiMisura2.Caption             := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Index];
   QTA2.Caption                       := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoQTA.Index];
   ScontoRigo12.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoSCONTORIGO.Index];
   ScontoRigo22.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Index];
   ScontoRigo32.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Index];
   ImportoRigo2.Caption               := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Index];
   ImportoRigoIVACompresa2.Caption    := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Index];
   CodiceIVA2.Caption                 := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoCODICEIVA.Index];
   DescrizioneIVA2.Caption            := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Index];
   NoteRigo2.Caption                  := PreventiviOrdiniForm.tvCorpo.DataController.DisplayTexts[i, PreventiviOrdiniForm.tvCorpoNOTERIGO.Index];
   // Passa al rigo sucessivo
   inc(i);
   // Se è l'ultimo rigo finisce
   MoreData := (i < PreventiviOrdiniForm.tvCorpo.DataController.RecordCount);
end;

end.
