unit PreventiviOrdiniReport;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, Inifiles, cxCustomData, Variants,
  DB, IBODataset, cxContainer, cxEdit, cxTextEdit,
  cxMemo, cxRichEdit, cxGridTableView;

const
  LEFTBORDER                    = 28;   // Coordinata SX del bordo sinistro del modulo di stampa
  RIGHTBORDER                   = 715;  // cOORDINATA x DEL BORDO DX DEL MODULO DI STAMPA
  LUNG_PAGINA_IN_STAMPA         = 2690; // Lunghezza della pagina in pixel della pagina in stampa (Quanto è alta la pagina in stampa e non in coordinate di designtime)
  RAPPORTO_PIXELSCHERMO_PIXELSTAMPA = 2.66;  // 1 pixel sullo schermo a design time corrisponde a 2,66 pixels nella stampa sulla stampante.
  DIBA_INDENT_PIXELS            = 10;   // Num. di pixels per l'indentazione della descrizione dei sottorighi

type
  TQReportPreventiviOrdini = class(TForm)
    QuickReport1: TQuickRep;
    QRBandLogo: TQRBand;
    ImageIntestazione: TQRImage;
    QRBandPiede1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    QRShapeSfondoRigo: TQRShape;
    QRShapeRowNoteRigo: TQRShape;
    QRShapeRowDescrizioneIVA: TQRShape;
    QRShapeRowCodiceIVA: TQRShape;
    QRShapeRowImportoRigoIVACompresa: TQRShape;
    QRShapeRowImportoRigo: TQRShape;
    QRShapeRowScontoRigo3: TQRShape;
    QRShapeRowScontoRigo2: TQRShape;
    QRShapeRowQTAEvasa: TQRShape;
    QRShapeRowQTA: TQRShape;
    QRShapeRowPrzUnitNetto: TQRShape;
    QRShapeRowPrezzoUnitarioIVACompresa: TQRShape;
    QRShapeRowPrezzoUNitario: TQRShape;
    QRShapeRowDescrizione: TQRShape;
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
    ChildDestinatario: TQRChildBand;
    MittenteDestinatario: TQRLabel;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRLabelTrattinoIntestatario: TQRLabel;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRLabelParentesiApertaIntestatario: TQRLabel;
    QRLabelParentesiChiusaIntestatario: TQRLabel;
    QRLabelPIVA: TQRLabel;
    QRDBText59: TQRDBText;
    QRLabelLuogoDestinazione: TQRLabel;
    QRDBIndirizzoLuogoDestinazione: TQRDBText;
    QRDBCAPLuogoDestinazione: TQRDBText;
    QRLabelTrattinoLuogoDestinazione: TQRLabel;
    QRDBCittaLuogoDestinazione: TQRDBText;
    QRLabelParentesiApertaLuogoDestinazione: TQRLabel;
    QRDBProvinciaLuogoDestinazione: TQRDBText;
    QRLabelParentesiChiusaLuogoDestinazione: TQRLabel;
    QRShape3: TQRShape;
    TipoDocumentoGrande: TQRDBText;
    QRShapeIntestatario: TQRShape;
    ChildTipoNumData: TQRChildBand;
    QRShape1: TQRShape;
    TipoDoc: TQRLabel;
    TipoDocumento: TQRDBText;
    QRDBText65: TQRDBText;
    NumDoc: TQRLabel;
    DataDoc: TQRLabel;
    Pagina: TQRLabel;
    QRSysData2: TQRSysData;
    Causale: TQRLabel;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText110: TQRDBText;
    ChildPiede3: TQRChildBand;
    ChildNote: TQRChildBand;
    ChildTrasporto: TQRChildBand;
    QRLabel38: TQRLabel;
    QRDBText116: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText118: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBDataInizioTrasporto: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText50: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText63: TQRDBText;
    ChildPagamento: TQRChildBand;
    QRLabel39: TQRLabel;
    ChildScadenze: TQRChildBand;
    QRLabel12: TQRLabel;
    QRShape27: TQRShape;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    ChildChiusura1: TQRChildBand;
    QRShape21: TQRShape;
    ChildIntestazioneColonne: TQRChildBand;
    QRShapeNoteRigo: TQRShape;
    QRShapeDescrizioneIVA: TQRShape;
    QRShapeCodiceIVA: TQRShape;
    QRShapeImportoRigoIVACompresa: TQRShape;
    QRShapeImportoRigo: TQRShape;
    QRShapeScontoRigo3: TQRShape;
    QRShapeScontoRigo2: TQRShape;
    QRShapeQTAEvasa: TQRShape;
    QRShapeQTA: TQRShape;
    QRShapePrzUnitNetto: TQRShape;
    QRShapePrezzoUnitarioIVACompresa: TQRShape;
    QRShapePrezzoUnitario: TQRShape;
    QRShapeDescrizione: TQRShape;
    QRShapeCodiceArticolo: TQRShape;
    QRLabelCodiceArticolo: TQRLabel;
    QRLabelDescrizione: TQRLabel;
    QRLabelPrezzoUnitario: TQRLabel;
    QRLabelPrezzoUnitarioIVACompresa: TQRLabel;
    QRLabelUnitaDiMisura: TQRLabel;
    QRLabelQTA: TQRLabel;
    QRLabelScontoRigo1: TQRLabel;
    QRLabelScontoRigo2: TQRLabel;
    QRLabelScontoRigo3: TQRLabel;
    QRLabelImportoRigo: TQRLabel;
    QRLabelImportoRigoIVACompresa: TQRLabel;
    QRLabelCodiceIVA: TQRLabel;
    QRLabelDescrizioneIVA: TQRLabel;
    QRLabelNoteRigo: TQRLabel;
    ChildFirme1: TQRChildBand;
    QRLabelFirma1: TQRLabel;
    QRShape5: TQRShape;
    QRLabelFirma2: TQRLabel;
    QRShape14: TQRShape;
    QRLabelFirma3: TQRLabel;
    QRShape23: TQRShape;
    ChildPiede4: TQRChildBand;
    QRShape29: TQRShape;
    QRShape35: TQRShape;
    QRShape28: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape10: TQRShape;
    QRShape41: TQRShape;
    QRShape39: TQRShape;
    QRShape37: TQRShape;
    QRLabel52: TQRLabel;
    QRShapeTotaleMercePiede4: TQRShape;
    QRShape7: TQRShape;
    QRShape9: TQRShape;
    QRShape8: TQRShape;
    QRShape15: TQRShape;
    ImportoIVA1: TQRLabel;
    IVA1: TQRLabel;
    Imponibile1: TQRLabel;
    QRDBText16: TQRDBText;
    TotaleMerce1: TQRLabel;
    ScontoPiede1: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText119: TQRDBText;
    QRLabel49: TQRLabel;
    QRLabel51: TQRLabel;
    TotaleDocumento1: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText122: TQRDBText;
    QRDBText120: TQRDBText;
    QRLabel54: TQRLabel;
    QRDBText124: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText126: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText128: TQRDBText;
    ChildBanca: TQRChildBand;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    ChildOperatore: TQRChildBand;
    QRLabel42: TQRLabel;
    QRDBText64: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText86: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText112: TQRDBText;
    QRBandUltimaPagina: TQRBand;
    ChildSubSogg: TQRChildBand;
    QRLabelSubSogg1: TQRLabel;
    QRDBTSubSogg1: TQRDBText;
    QRLabelSubSogg2: TQRLabel;
    QRDBTSubSogg2: TQRDBText;
    QRLabelSubSogg3: TQRLabel;
    QRDBTSubSogg3: TQRDBText;
    ChildLogoPiede: TQRChildBand;
    ImagePiede: TQRImage;
    ChildPiede2: TQRChildBand;
    QRShapeBlankCodiceArticolo: TQRShape;
    QRShapeBlankDescrizione: TQRShape;
    QRShapeBlankPrezzoUNitario: TQRShape;
    QRShapeBlankPrezzoUnitarioIVACompresa: TQRShape;
    QRShapeBlankPrzUnitNetto: TQRShape;
    QRShapeBlankQTA: TQRShape;
    QRShapeBlankScontoRigo2: TQRShape;
    QRShapeBlankScontoRigo3: TQRShape;
    QRShapeBlankImportoRigo: TQRShape;
    QRShapeBlankImportoRigoIVACompresa: TQRShape;
    QRShapeBlankCodiceIVA: TQRShape;
    QRShapeBlankDescrizioneIVA: TQRShape;
    QRShapeBlankNoteRigo: TQRShape;
    QRShapeRowFinale: TQRShape;
    QRShapeBlankFinale: TQRShape;
    QRShape16: TQRShape;
    QRShape30: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape40: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRLabel16: TQRLabel;
    QRShapeNote: TQRShape;
    QRShape46: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShapeTotaleIVAPiede4: TQRShape;
    QRLabel50: TQRLabel;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShapeTotaleIVAPiede2: TQRShape;
    QRShape59: TQRShape;
    QRShape68: TQRShape;
    QRLabel1: TQRLabel;
    QRShapeTotaleMercePiede2: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText84: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText85: TQRDBText;
    QRDBText87: TQRDBText;
    QRLabel31: TQRLabel;
    QRDBText114: TQRDBText;
    QRLabel36: TQRLabel;
    QRDBText115: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText121: TQRDBText;
    QRShape13: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape26: TQRShape;
    QRShapeTotaleIVAPiede3: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRLabel22: TQRLabel;
    QRShapeTotaleMercePiede3: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText81: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText83: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRDBText96: TQRDBText;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    QRDBText104: TQRDBText;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
    QRDBText107: TQRDBText;
    QRDBText108: TQRDBText;
    QRDBText123: TQRDBText;
    QRDBText125: TQRDBText;
    QRDBText127: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel62: TQRLabel;
    QRDBText129: TQRDBText;
    QRDBText130: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText131: TQRDBText;
    QRLabel64: TQRLabel;
    QRDBText132: TQRDBText;
    QRLabel65: TQRLabel;
    QRDBText133: TQRDBText;
    QRShape24: TQRShape;
    QRLabel60: TQRLabel;
    QRLabelPagamento: TQRLabel;
    QRLabelBanca: TQRLabel;
    QRLabelABI: TQRLabel;
    QRLabelCAB: TQRLabel;
    QRDBOraInizioTrasporto: TQRDBText;
    QRLabelCosto: TQRLabel;
    QRLabelMargine: TQRLabel;
    QRShapeCosto: TQRShape;
    QRShapeMargine: TQRShape;
    QRLabelImportoMargine: TQRLabel;
    QRShapeImportoMargine: TQRShape;
    QRShapeRowCosto: TQRShape;
    QRShapeRowMargine: TQRShape;
    QRShapeRowImportoMargine: TQRShape;
    Costo: TQRLabel;
    Margine: TQRLabel;
    ImportoMargine: TQRLabel;
    QRShapeBlankCosto: TQRShape;
    QRShapeBlankMargine: TQRShape;
    QRShapeBlankImportoMargine: TQRShape;
    QRSubDetail2: TQRSubDetail;
    QRShapeSfondoSottorigo: TQRShape;
    QRShapeRowDIBAImportoRigo: TQRShape;
    QRShapeRowDIBAQTA: TQRShape;
    QRShapeRowDIBAPrzUnitNetto: TQRShape;
    QRShapeRowDIBAPrezzoUNitario: TQRShape;
    QRShapeRowDIBADescrizione: TQRShape;
    QRShapeRowDIBACodiceArticolo: TQRShape;
    DIBACodiceArticolo: TQRLabel;
    DIBADescrizione: TQRLabel;
    DIBAPrezzoUnitario: TQRLabel;
    DIBAUnitaDiMisura: TQRLabel;
    DIBAQTA: TQRLabel;
    DIBAImportoRigo: TQRLabel;
    QRShapeRowDIBAFinale: TQRShape;
    QRShapeRowDIBACosto: TQRShape;
    QRShapeRowDIBAMargine: TQRShape;
    QRShapeRowDIBAImportoMargine: TQRShape;
    DIBACosto: TQRLabel;
    DIBAMargine: TQRLabel;
    DIBAImportoMargine: TQRLabel;
    QRShapeRowDIBAPrezzoUnitarioIVACompresa: TQRShape;
    DIBAPrezzoUnitarioIVACompresa: TQRLabel;
    QRShapeRowDIBAScontoRigo3: TQRShape;
    QRShapeRowDIBAScontoRigo2: TQRShape;
    QRShapeRowDIBAQTAEvasa: TQRShape;
    DIBAScontoRigo1: TQRLabel;
    DIBAScontoRigo2: TQRLabel;
    DIBAScontoRigo3: TQRLabel;
    QRShapeRowDIBANoteRigo: TQRShape;
    QRShapeRowDIBADescrizioneIVA: TQRShape;
    QRShapeRowDIBACodiceIVA: TQRShape;
    QRShapeRowDIBAImportoRigoIVACompresa: TQRShape;
    DIBAImportoRigoIVACompresa: TQRLabel;
    DIBACodiceIVA: TQRLabel;
    DIBADescrizioneIVA: TQRLabel;
    DIBANoteRigo: TQRLabel;
    QRSDIBATop: TQRShape;
    QRSDIBABottom: TQRShape;
    QRSDIBARight: TQRShape;
    TmpMemo: TQRMemo;
    QRShapeFinale: TQRShape;
    QRShapeTopIntestazioneColonne: TQRShape;
    ChildStartMemo: TQRChildBand;
    QRShape25: TQRShape;
    QRShapeLineaSuperioreTestoFinale: TQRShape;
    QRLabelCF: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBNumCivicoLuogoDestinazione: TQRDBText;
    QRDBText111: TQRDBText;
    QRLabelTel: TQRLabel;
    QRFieldTel: TQRDBText;
    QRLabelCell: TQRLabel;
    QRFieldCell: TQRDBText;
    QRShape80: TQRShape;
    QRDBTextAbbuono4: TQRDBText;
    QRLabelAbbuono4: TQRLabel;
    QRLabel46: TQRLabel;
    QRDBText135: TQRDBText;
    QRLabelPrzUnitNetto: TQRLabel;
    PrezzoUnitarioNetto: TQRLabel;
    DIBAPrezzoUnitarioNetto: TQRLabel;
    QRShapeUnitaDiMisura: TQRShape;
    QRShapeRowUnitaDiMisura: TQRShape;
    QRShapeBlankUnitaDiMisura: TQRShape;
    QRShapeRowDIBAUnitaDiMisura: TQRShape;
    QRShapeNoCastellettoPiede2: TQRShape;
    QRShapeNoCastellettoPiede3: TQRShape;
    QRShapeNoCastellettoPiede4: TQRShape;
    QRShapeRowCodiceArticolo: TQRShape;
    CodiceArticolo: TQRLabel;
    ChildAltriSogg: TQRChildBand;
    QRShape17: TQRShape;
    QRLabel33: TQRLabel;
    QRDBText109: TQRDBText;
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
    QRDBText152: TQRDBText;
    QRDBText153: TQRDBText;
    QRDBText154: TQRDBText;
    QRDBText155: TQRDBText;
    QRShapeCantiere: TQRShape;
    QRLabelCantiere: TQRLabel;
    QRFieldCantiere: TQRLabel;
    ChildFinal: TQRChildBand;
    QRShape31: TQRShape;
    QRLabelTestoFinale: TQRLabel;
    QRLabelTestoIniziale: TQRLabel;
    QRLabelPagina: TQRLabel;
    ChildMessaggi: TQRChildBand;
    QRShapeMessaggi: TQRShape;
    QRLabel21: TQRLabel;
    QRLabelNote: TQRLabel;
    QRLabelMessaggi: TQRLabel;
    ChildPiede3NoIva: TQRChildBand;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRDBTextPiede3NoIvaTotale: TQRDBText;
    QRLabelTotaleDaPagare3: TQRLabel;
    QryDatiSoggetto: TIBOQuery;
    QryDatiSoggettoTELEFONO: TStringField;
    QryDatiSoggettoCELLULARE: TStringField;
    QRLabel35: TQRLabel;
    ChildPiede1: TQRChildBand;
    QRLabelSegue: TQRLabel;
    ChildDestinatario2: TQRChildBand;
    QRShape58: TQRShape;
    MittenteDestinatario2: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText156: TQRDBText;
    QRLabelTrattinoIntestatario2: TQRLabel;
    QRDBText157: TQRDBText;
    QRDBText158: TQRDBText;
    QRLabelParentesiApertaIntestatario2: TQRLabel;
    QRLabelParentesiChiusaIntestatario2: TQRLabel;
    QRDBText160: TQRDBText;
    QRLabelLuogoDestinazione2: TQRLabel;
    QRDBIndirizzoLuogoDestinazione2: TQRDBText;
    QRDBCAPLuogoDestinazione2: TQRDBText;
    QRLabelTrattinoLuogoDestinazione2: TQRLabel;
    QRDBCittaLuogoDestinazione2: TQRDBText;
    QRLabelParentesiApertaLuogoDestinazione2: TQRLabel;
    QRDBProvinciaLuogoDestinazione2: TQRDBText;
    QRLabelParentesiChiusaLuogoDestinazione2: TQRLabel;
    QRDBRagSocLuogoDestinazione2: TQRDBText;
    QRShape69: TQRShape;
    QRLabelCantiere2: TQRLabel;
    QRFieldCantiere2: TQRLabel;
    QRShape76: TQRShape;
    QRLabel74: TQRLabel;
    QRDBText167: TQRDBText;
    QRShape81: TQRShape;
    QRLabel75: TQRLabel;
    QRDBText168: TQRDBText;
    QRLabelTelefono: TQRLabel;
    QRFieldTelefono: TQRLabel;
    ChildAgenti: TQRChildBand;
    QRShape83: TQRShape;
    QRLabelAgente1: TQRLabel;
    Agente1: TQRDBText;
    QRShape73: TQRShape;
    QRLabelAgente2: TQRLabel;
    Agente2: TQRDBText;
    QRShape82: TQRShape;
    QRLabelAgente3: TQRLabel;
    Agente3: TQRDBText;
    QRShape84: TQRShape;
    QRLabelAgente4: TQRLabel;
    Agente4: TQRDBText;
    QRDBText159: TQRDBText;
    QRDBText161: TQRDBText;
    QRDBText163: TQRDBText;
    QRDBText164: TQRDBText;
    QRDBText165: TQRDBText;
    QRDBText166: TQRDBText;
    QRDBText169: TQRDBText;
    QRDBText170: TQRDBText;
    QRDBText171: TQRDBText;
    QRDBText172: TQRDBText;
    QRDBText173: TQRDBText;
    QRDBText174: TQRDBText;
    QRDBText175: TQRDBText;
    QRDBText176: TQRDBText;
    QryDatiSoggettoESTERO_SIGLA: TStringField;
    QryDatiSoggettoESTERO: TStringField;
    QRShape85: TQRShape;
    QRLabel37: TQRLabel;
    QRDBText177: TQRDBText;
    QRLabel61: TQRLabel;
    QRShape86: TQRShape;
    QRDBText178: TQRDBText;
    QRLabel66: TQRLabel;
    QRShape87: TQRShape;
    QRDBText179: TQRDBText;
    QRShape88: TQRShape;
    QRLabel67: TQRLabel;
    QRLabelBIC: TQRLabel;
    QRShape89: TQRShape;
    QRLabel69: TQRLabel;
    QRDBText180: TQRDBText;
    QRShapeLineaSeperazioneSezioni: TQRShape;
    QRDBText10: TQRDBText;
    QRShapePIVA: TQRShape;
    QRShape90: TQRShape;
    QryDatiSoggettoINTERNO: TStringField;
    QryDatiSoggettoSCALA: TStringField;
    QryDatiSoggettoPIANO: TStringField;
    QryDatiSoggettoPALAZZO: TStringField;
    QRLabelRagSoc1: TQRLabel;
    QRLabelRagSoc2: TQRLabel;
    QRLabelRagSocDest1: TQRLabel;
    QRLabelRagSocDest2: TQRLabel;
    QRLabelQTAEvasa: TQRLabel;
    QRShapeQTAResidua: TQRShape;
    QRLabelQTAResidua: TQRLabel;
    QRShapeScontoRigo1: TQRShape;
    QRShapeRowQTAResidua: TQRShape;
    QTAEvasa: TQRLabel;
    QRShapeRowScontoRigo1: TQRShape;
    QTAResidua: TQRLabel;
    DIBAQTAEvasa: TQRLabel;
    QRShapeRowDIBAQTAResidua: TQRShape;
    DIBAQTAResidua: TQRLabel;
    QRShapeRowDIBAScontoRigo1: TQRShape;
    QRShapeBlankQTAResidua: TQRShape;
    QRShapeBlankScontoRigo1: TQRShape;
    QRShapeBlankQTAEvasa: TQRShape;
    QRDBTextAbbuonoPerc4: TQRDBText;
    QRShapeTotaleDocumento3: TQRShape;
    QRLabelTotaleDocumento3: TQRLabel;
    QRDBTextTotaleaDocumento3: TQRDBText;
    QRShapeAbbuono3: TQRShape;
    QRLabelAbbuono3: TQRLabel;
    QRDBTextAbbuono3: TQRDBText;
    QRDBTextAbbuonoPerc3: TQRDBText;
    QRShape92: TQRShape;
    QRDBText134: TQRDBText;
    QRDBText162: TQRDBText;
    QRLabel68: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape93: TQRShape;
    QRDBText181: TQRDBText;
    QRLabelAbbuonoSu4: TQRLabel;
    QRLabelAbbuonoSu3: TQRLabel;
    procedure QuickReport1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QRDBText31Print(sender: TObject; var Value: String);
    procedure QRDBText37Print(sender: TObject; var Value: String);
    procedure QRDBText43Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandUltimaPaginaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText85Print(sender: TObject; var Value: String);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure ChildPagamentoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBancaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildDestinatarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReport1EndPage(Sender: TCustomQuickRep);
    procedure QRDBText135Print(sender: TObject; var Value: String);
    procedure ChildPiede2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildPiede3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildPiede4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText140Print(sender: TObject; var Value: String);
    procedure FormDestroy(Sender: TObject);
    procedure QRBandLogoAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildLogoPiedeAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildDestinatarioAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ChildTipoNumDataBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildPiede3NoIvaBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabelNotePrint(sender: TObject; var Value: String);
    procedure ChildPiede1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildChiusura1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel46Print(sender: TObject; var Value: String);
    procedure QRDBText48Print(sender: TObject; var Value: String);
    procedure QRDBText110Print(sender: TObject; var Value: String);
    procedure QRDBText119Print(sender: TObject; var Value: String);
    procedure ChildDestinatario2BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRDBText167Print(sender: TObject; var Value: String);
    procedure QRDBText65Print(sender: TObject; var Value: String);
    procedure QRDBText55Print(sender: TObject; var Value: string);
    procedure QRDBIndirizzoLuogoDestinazione2Print(sender: TObject;
      var Value: string);
    procedure PrezzoUnitarioPrint(sender: TObject; var Value: string);
    procedure QRDBText111Print(sender: TObject; var Value: string);
  private
    { Private declarations }
   LetturaFacilitata, UltimaPagina : Boolean;
    // Variabile che contiene l'indice del e del sottorigo rigo documento corrente in stamps
    RI, DRI, RowIndex: Integer;
    // Variabili che contengono i valori ri alcuni parametri facoltativi
    //  ForzaAltezzaShape: Se impostato ad un valore > -1 forza l'altezza di tutti gli shape
    //                      del report al valore specificato.
    //  ForzaDominuzioneLarghezzaShape: Se impostato ad un valore > -1 diminuisce la larghezza
    //                                   di tutti gli shape del report del valore specificato.
    ForzaAltezzaShape, ForzaDiminuzioneLarghezzaShape:Integer;
    // Variabili che puntano ai DataController dei dati sa stampare.
    MDC, DDC:TcxCustomDataController;
    MasterViewData: TcxGridViewData;
    // Flag che autorizza o meno la stampa della banda dei sottorighi
    VaiStampaSottorighi:Boolean;
    // Indice usato per l'accesso all'array dinamico RowsExpanded per l'adeguamento
    //  degli shapes di sfondo per la lettura facilitata e delle linee di separazione verticali
    //  delle colonne.
    REIndex:Integer;
    // Flag che indica se il testo finale del preventivo è abilitato oppure no
    AbilitaTestoFinale : Boolean;
    // Flag che indica se si stà stampando la prima pagina oppure no
    PrimaPagina: boolean;
    // Loghi del documento
    IntestazBMP, PiedeBMP: TBitmap;
    // Proprietà che mi servono per stampare correttamente le descrizioni lunghe suddividendole
    //  in righe singole.
    //  La proprietà "fDescLineIndex" contiene l'indice della linea che si sta stampando
    //  all'interno del memo su cui ho temporaneamente copiato la descrizione attuale per poterne
    //  leggere il contenuto linea per linea.
    fDescLineIndex: Integer;
    // Campo che contiene la parte di nome per i generare i nomi di files relativi alle
    //  preferenze di stampa del documento
    fStmPref_FileName: String;
    // Flag che contiene l'abilitazione o meno del piede mobile solo sull'ultima pagina
    fAbilitaPiedeMobile: Boolean;
    // VAriabili che contengono alcuni valori da ripristinare alla fine della stampa
    //  li ho messi perchè quando si stampava da dentro l'anteprima di stampa alcune
    //  cose non venivano rimesse a posto.
    PrecChildDestinatarioHeight: Integer;
    // Flag che abilita o meno l'aggiunta dell'anno al numero del documento in fase di stampa
    //  (es: Fature 125/2013-)
    fNumDocUnivoco_AggiungiAnno: Boolean;
    fNumDocUnivoco_AnnoDopoRegistro: Boolean;
    fNumDocUnivoco_Mask: String;
    // Flag che indica se stampare le rige di manodopera oppure no
    fStampaManodopera: Boolean;
    // Flag che indica se si sta stampando l'eventuale relazione di intervento nel caso appunto di
    //  stampa di un itervento
    FRelazioneInterventoDaStampare, FRelazioneInterventoStampata: Boolean;

    function CalcolaPrezzoUnitarioNetto(DC:TcxCustomDataController; RI: Integer): String;
    function ConvCoord(Coord: Integer; Fattore: Extended): Integer;
    function GetFinalBandsHeight: Integer;
    procedure StampaTestoIniziale;
    procedure StampaTestoFinale;
    procedure StampaNote;
    procedure StampaMessaggi;
    procedure RipristinoFineStampa;
    function CalcolaQtaResiduaTxt(AQta, AQtaEvasa: Variant): String;
   public
    { Public declarations }
    // Flag che indica se si sta stampando un fax oppure una email e quindi deve forzare la stampa
    //  dei loghi anche se il programma è impostato per la stampa su carta intestata (e quindi con lighi disabilitati).
    FaxPrinting:Boolean;
    // Flag che indica se la stampa dei sottorighi è abilitata o meno
    FlagAbilitaStampaSottorighi:Boolean;
    // Flag che indica se si stà effettuando una operazione di preparazione di alcuni parametri
    //  e che quindi la stampa attuale non verrà stampata, ma viene eseguita solo per rilevare
    //  dati da utilizzare poi nella stampa vera e propria.
    Preparing:Boolean;
    // Proprietà che conterrà l'altezza verticale delle bande di chiusura documento
    //  praticamente dal castelletto con i totali in giù.
    //  NB: MI serviva per far dei calcoli per allineare in basso all'ultima pagina le bande di chiusura del documento nel caso
    //  sia impostata la presenza di queste bande finali solo sull'ultima pagina (Preventivi).
    property FinalBandsHeight: Integer read GetFinalBandsHeight;
  end;

var
  QReportPreventiviOrdini: TQReportPreventiviOrdini;

implementation

uses DataModule1, SchedaPreventiviOrdini, Types, cxCheckBox,
  cxGridCustomTableView, System.StrUtils, FormImpegni;

{$R *.DFM}



// Procedura che dimensiona e stampa il testo delle note
procedure TQReportPreventiviOrdini.StampaNote;
const
  TOP_MARGIN = 14;
  BOTTOM_MARGIN = 2;
var
  i, CurrentY: Integer;
  CurrLabel: TQRLabel;
begin
  // Inizializzazione
  ChildNote.Height := 0;
  // Se è abilitato e digitato un testo iniale per il documento lo stampa
  //  dimensionando correttamente la banda altrimenti rende invisibile la banda stessa
  if (PreventiviOrdiniForm.DbeNote.Lines.Count = 0) and (PreventiviOrdiniForm.QryDocumentoBOLLOIMPORTO.AsFloat = 0) and not PreventiviOrdiniForm.IsSplitPayment then
    Exit;
  // Se invece il testo inizale è abilitato provvede ad inizializzare alcune varibili
  CurrentY := TOP_MARGIN;


  // Se è una fattura con scissione dei pagamenti aggiunge una nota con la
  //  dicitura appropriata e l'importo giusto da evidenziare
  if PreventiviOrdiniForm.IsSplitPayment then
  begin
    // Crea la QRLabel dove caricare la riga corrente del testo iniziale
    CurrLabel := TQRLabel.Create(QuickReport1);
    CurrLabel.Parent := ChildNote;
    // Ricopia tutte le proprietà dal modello invisibile
    CurrLabel.Font    := QRLabelNote.Font;
    CurrLabel.Font.Style := [fsBold, fsItalic];
    CurrLabel.Left    := QRLabelNote.Left;
    CurrLabel.Width   := QRLabelNote.Width;
    CurrLabel.OnPrint := QRLabelNote.OnPrint;
    // Posizione verticalmente la linea attuale
    CurrLabel.Top := CurrentY;
    // Carica il testo della riga attuale
    CurrLabel.Caption := 'IVA a vs. carico ai sensi art.17-ter D.P.R.633/72 (Scissione dei pagamenti):   ' + CurrToStrF(PreventiviOrdiniForm.QryDocumentoTOTALESPLITPAYMENT.AsCurrency, ffCurrency, 2);
    // Incrementa la variabile che contiene la coordinata Y di dove siamo arrivati
    CurrentY := CurrentY + CurrLabel.Height - 2;
  end;


  // Se c'è il bollo aggiunge una nota con la dicitura appropriata in base
  //  alla situazione.
  if PreventiviOrdiniForm.QryDocumentoBOLLOIMPORTO.AsFloat <> 0 then
  begin
    // Crea la QRLabel dove caricare la riga corrente del testo iniziale
    CurrLabel := TQRLabel.Create(QuickReport1);
    CurrLabel.Parent := ChildNote;
    // Ricopia tutte le proprietà dal modello invisibile
    CurrLabel.Font    := QRLabelNote.Font;
    CurrLabel.Font.Style := [fsBold, fsItalic];
    CurrLabel.Left    := QRLabelNote.Left;
    CurrLabel.Width   := QRLabelNote.Width;
    CurrLabel.OnPrint := QRLabelNote.OnPrint;
    // Posizione verticalmente la linea attuale
    CurrLabel.Top := CurrentY;
    // Carica il testo della riga attuale
    if PreventiviOrdiniForm.QryDocumentoBOLLOVIRTUALE.AsString = 'T' then
    begin
      CurrLabel.Caption := 'Imposta di bollo assolta in modo virtuale ai sensi art.15 DPR 642/72 e del DM 17/06/2014';
      if Trim(DM1.TableProgressivi2BOLLOVIRTUALEDICITURA.AsString) <> '' then
        CurrLabel.Caption := CurrLabel.Caption + ' autorizzazione n. ' + DM1.TableProgressivi2BOLLOVIRTUALEDICITURA.AsString
    end
    else
    begin
      CurrLabel.Caption := 'Imposta di bollo assolta sull''originale';
      if Trim(PreventiviOrdiniForm.QryDocumentoBOLLOID.AsString) <> '' then
        CurrLabel.Caption := CurrLabel.Caption + ', ID: ' + PreventiviOrdiniForm.QryDocumentoBOLLOID.AsString;
    end;
    // Incrementa la variabile che contiene la coordinata Y di dove siamo arrivati
    CurrentY := CurrentY + CurrLabel.Height - 2;
  end;

  // Cicla per tutte le righe contenute nel testo inziale del preventivo
  for i := 0 to PreventiviOrdiniForm.DbeNote.Lines.Count -1 do begin
    // Crea la QRLabel dove caricare la riga corrente del testo iniziale
    CurrLabel := TQRLabel.Create(QuickReport1);
    CurrLabel.Parent := ChildNote;
    // Ricopia tutte le proprietà dal modello invisibile
    CurrLabel.Font    := QRLabelNote.Font;
    CurrLabel.Left    := QRLabelNote.Left;
    CurrLabel.Width   := QRLabelNote.Width;
    CurrLabel.OnPrint := QRLabelNote.OnPrint;
    // Posizione verticalmente la linea attuale
    CurrLabel.Top := CurrentY;
    // Carica il testo della riga attuale
    CurrLabel.Caption := PreventiviOrdiniForm.DbeNote.Lines[i];
    // Incrementa la variabile che contiene la coordinata Y di dove siamo arrivati
    CurrentY := CurrentY + CurrLabel.Height - 2;
  end;
  // Infine dimensiona in modo appropriato tutta la banda
  ChildNote.Height := CurrentY + BOTTOM_MARGIN;
  QRShapeNote.Height := ChildNote.Height + 1;
  // Annota l'altezza della banda anche nella proprietà Tag
  //  poi uso il valore impostato su Tag per fare in modo che questa banda venga
  //  stampata solo sull'ultima pagina.
  ChildNote.Tag := ChildNote.Height;
end;


// Procedura che dimensiona e stampa il testo dei messaggi
procedure TQReportPreventiviOrdini.StampaMessaggi;
const
  TOP_MARGIN = 14;
  BOTTOM_MARGIN = 2;
var
  i, CurrentY: Integer;
  CurrLabel: TQRLabel;
begin
  // Inizializzazione
  ChildMessaggi.Height := 0;
  // Se è abilitato e digitato un testo iniale per il documento lo stampa
  //  dimensionando correttamente la banda altrimenti rende invisibile la banda stessa
  if (PreventiviOrdiniForm.DbeMessaggi.Lines.Count = 0) then Exit;
  // Se invece il testo inizale è abilitato provvede ad inizializzare alcune varibili
  CurrentY := TOP_MARGIN;
  // Cicla per tutte le righe contenute nel testo inziale del preventivo
  for i := 0 to PreventiviOrdiniForm.DbeMessaggi.Lines.Count -1 do begin
    // Crea la QRLabel dove caricare la riga corrente del testo iniziale
    CurrLabel := TQRLabel.Create(QuickReport1);
    CurrLabel.Parent := ChildMessaggi;
    // Ricopia tutte le proprietà dal modello invisibile
    CurrLabel.Font    := QRLabelMessaggi.Font;
    CurrLabel.Left    := QRLabelMessaggi.Left;
    CurrLabel.Width   := QRLabelMessaggi.Width;
    CurrLabel.OnPrint := QRLabelMessaggi.OnPrint;
    // Posizione verticalmente la linea attuale
    CurrLabel.Top := CurrentY;
    // Carica il testo della riga attuale
    CurrLabel.Caption := PreventiviOrdiniForm.DbeMessaggi.Lines[i];
    // Incrementa la variabile che contiene la coordinata Y di dove siamo arrivati
    CurrentY := CurrentY + CurrLabel.Height - 2;
  end;
  // Infine dimensiona in modo appropriato tutta la banda
  ChildMessaggi.Height := CurrentY + BOTTOM_MARGIN;
  QRShapeMessaggi.Height := ChildMessaggi.Height + 1;
end;


// Procedura che dimensiona e stampa il testo iniziale del preventivo
procedure TQReportPreventiviOrdini.StampaTestoIniziale;
const
  TOP_MARGIN = 10;
  BOTTOM_MARGIN = 10;
var
  i, CurrentY: Integer;
  CurrLabel: TQRLabel;
begin
  // Inizializzazione
  ChildStartMemo.Height := 0;
  // Se è abilitato e digitato un testo iniale per il documento lo stampa
  //  dimensionando correttamente la banda altrimenti rende invisibile la banda stessa
  if (not PreventiviOrdiniForm.DBMStartPreventivo.Enabled) or (PreventiviOrdiniForm.DBMStartPreventivo.Lines.Count = 0) then Exit;
  // Se invece il testo inizale è abilitato provvede ad inizializzare alcune varibili
  CurrentY := TOP_MARGIN;
  // Cicla per tutte le righe contenute nel testo inziale del preventivo
  for i := 0 to PreventiviOrdiniForm.DBMStartPreventivo.Lines.Count -1 do begin
    // Crea la QRLabel dove caricare la riga corrente del testo iniziale
    CurrLabel := TQRLabel.Create(QuickReport1);
    CurrLabel.Parent := ChildStartMemo;
    // Ricopia tutte le proprietà dal modello invisibile
    CurrLabel.Font  := QRLabelTestoIniziale.Font;
    CurrLabel.Left  := QRLabelTestoIniziale.Left;
    CurrLabel.Width := QRLabelTestoIniziale.Width;
    // Posizione verticalmente la linea attuale
    CurrLabel.Top := CurrentY;
    // Carica il testo della riga attuale
    CurrLabel.Caption := PreventiviOrdiniForm.DBMStartPreventivo.Lines[i];
    // Incrementa la variabile che contiene la coordinata Y di dove siamo arrivati
    CurrentY := CurrentY + CurrLabel.Height - 2;
  end;
  // Infine dimensiona in modo appropriato tutta la banda
  ChildStartMemo.Height := CurrentY + BOTTOM_MARGIN;
end;


// Procedura che dimensiona e stampa il testo iniziale del preventivo
procedure TQReportPreventiviOrdini.StampaTestoFinale;
const
  TOP_MARGIN = 10;
  BOTTOM_MARGIN = 10;
var
  i, CurrentY: Integer;
  CurrLabel: TQRLabel;
begin
  // Se è abilitato e digitato il testo finale del preventivo lo dimensiona correttamente
  //  r dinamicamente.
  if  PreventiviOrdiniForm.DBMEndPreventivo.Enabled
  and (Trim(PreventiviOrdiniForm.DBMEndPreventivo.Text) <> '')
  then begin

    // Se invece il testo inizale è abilitato provvede ad inizializzare alcune varibili
    CurrentY := TOP_MARGIN;
    // Cicla per tutte le righe contenute nel testo inziale del preventivo
    for i := 0 to PreventiviOrdiniForm.DBMEndPreventivo.Lines.Count -1 do begin
      // Crea la QRLabel dove caricare la riga corrente del testo iniziale
      CurrLabel := TQRLabel.Create(QuickReport1);
      CurrLabel.Parent := QRBandUltimaPagina;
      // Ricopia tutte le proprietà dal modello invisibile
      CurrLabel.Font  := QRLabelTestoFinale.Font;
      CurrLabel.Left  := QRLabelTestoFinale.Left;
      CurrLabel.Width := QRLabelTestoFinale.Width;
      // Posizione verticalmente la linea attuale
      CurrLabel.Top := CurrentY;
      // Carica il testo della riga attuale
      CurrLabel.Caption := PreventiviOrdiniForm.DBMEndPreventivo.Lines[i];
      // Incrementa la variabile che contiene la coordinata Y di dove siamo arrivati
      CurrentY := CurrentY + CurrLabel.Height - 2;
    end;
    // Infine dimensiona in modo appropriato tutta la banda
    QRBandUltimaPagina.Height := CurrentY + BOTTOM_MARGIN;

  // Se invece il testo finale del preventivo è disabilito oppure non è stato scritto nulla
  //  forza la banda ad un'altezza = 0 perchè altrimenti in alcuni casi
  //  quando l'ultima riga normale di un articolo era quasi al limite della fine pagina
  //  causava un salto pagina apparentemente inspiegabile ed era dovuto al fatto che appunto
  //  cmq. questa banda aveva un'altezza minima ma comq c'era e ovviamente questa causava il
  //  salto pagina anche se non c'era scritto nulla.
  end else begin
    QRBandUltimaPagina.Height := 0;
  end;
end;


procedure TQReportPreventiviOrdini.QuickReport1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   LO : TMemIniFile;
   XX, Sep, i: Integer;
   TipoDoc : String;
   LastTitleShape: TQRShape;
   AltezzaLineeSeparazioneColonne: Integer;
   PiedeTipo, ChiusuraTipo, DestinatarioTipo: Smallint;
   StampaLogoIntestazione, StampaLogoPiede: Boolean;
begin
   // Inizializzazione
   LastTitleShape := nil;
   REIndex := 0;                                                             
   fDescLineIndex := 0;
   PrimaPagina := True;
   // Attiva la query che preleva il telefono dell'intestatario del documento
   QryDatiSoggetto.Params.ParamByName('P_CODICE').AsInteger := PreventiviOrdiniForm.QryDocumentoCODICECLIENTE.AsInteger;
   QryDatiSoggetto.Open;
   // Imposta la variabile che contiene l'indice per l'accesso al rigo corrente della griglia dei righi del documento
   //  (sarà poi usata dall'evento OnNeedData della detail band
   RI  := 0;
   DRI := 0;
   RowIndex := 0;
   // MDC Punta al MAsterDataController del documento
   MDC := PreventiviOrdiniForm.tvCorpo.DataController;
   MasterViewData := PreventiviOrdiniForm.tvCorpo.ViewData;
   // IMposta l'altezza della banda che indica che sis tà stampando l'ultima pagina
   //  a 0 in modo che è come se non ci fosse
//   QRBandUltimaPagina.Height := 0;
   // Carica il tipo di documento in questa variabile per comodità
   TipoDoc := PreventiviOrdiniForm.QryDocumentoTipoDocumento.Value;

   // Se è un documento di entrata cambia Destinatario in Mittente
   MittenteDestinatario.Caption       := PreventiviOrdiniForm.MittenteDestinatario.Caption;
   QRLabelLuogoDestinazione.Caption   := PreventiviOrdiniForm.LabelPanelDestinazioneMerce.Caption;
   MittenteDestinatario2.Caption      := MittenteDestinatario.Caption;
   QRLabelLuogoDestinazione2.Caption  := QRLabelLuogoDestinazione.Caption;

   // Abilita il testo finale soo se è abilitato nel documento e se il documento
   //  è un preventivo.
   AbilitaTestoFinale := (TipoDoc = 'Preventivo') and (PreventiviOrdiniForm.DBMEndPreventivo.Enabled);

   // COntrolla che il campo 'TipoDocumentoEsteso' non sia nullo, ma se lo è fà in modo che i componenti
   //  'TipoDOcumento' e 'TipoDOcumentoEsteso' non puntino al campo 'TipoDOcumentoEsteso' ma a 'TipoDocumento'.
   //  Perchè da quando c'è il campo TipoDocumentoEsteso per l'assegnazione di più nomi al documento, se si visualizza
   //  un documento creato con una versione più vecchia il nuovo campo sarà nullo e quindi non si vedrebbe per niente il
   //  tipo documento; in questo modo invece se manca tale campo si somporta come le versioni precedenti.
   if PreventiviOrdiniForm.QryDocumentoTipoDocumentoEsteso.IsNull then begin
      TipoDocumento.DataField           := 'TipoDocumento';
      TipoDocumentoGrande.DataField     := 'TipoDocumento';
   end;

   // Abilita o meno la banda dei sottorighi in base al valore del flag che abilita o meno
   //  la stampa con l'esploso articoli
   QRSubDetail2.Enabled := FlagAbilitaStampaSottorighi;

   // Apre il file con le impostazioni del logo documento e le carica e poi le chiude
   LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
   try

     // Calcola il flag che indica se stampare o meno i loghi
     //  nel caso il documento avesse le preferenze di stampa abilitate
     if PreventiviOrdiniForm.fStmPref_Enabled then begin
       StampaLogoIntestazione := (PreventiviOrdiniForm.StmSezLogo.Checked or FaxPrinting)
                              and FileExists(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
       StampaLogoPiede        := (PreventiviOrdiniForm.StmSezLogo.Checked or FaxPrinting)
                              and FileExists(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
     // Calcola il flag che indica se stampare o meno i loghi
     //  nel caso il documento NON avesse le preferenze di stampa abilitate
     end else begin
       StampaLogoIntestazione := (LO.ReadBool(TipoDoc, 'AbilitaStampaIntestazione', True) or FaxPrinting)
                              and FileExists(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
       StampaLogoPiede        := (LO.ReadBool(TipoDoc, 'AbilitaStampaPiede', True) or FaxPrinting)
                              and FileExists(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
     end;

     // Carica le impostazioni dell'intestazione
     ImageIntestazione.Width  := LO.ReadInteger(TipoDoc, 'LargIntestazione', 363);
     ImageIntestazione.Height := LO.ReadInteger(TipoDoc, 'AltIntestazione', 168);
     if (ImageIntestazione.Width > 0)and(ImageIntestazione.Height > 0) then begin
        QRBandLogo.Height  := ImageIntestazione.Height + 6;
        QRBandLogo.Enabled := True;
     end else begin
        QRBandLogo.Height  := 0;
     end;
     if StampaLogoIntestazione then begin
//        ImageIntestazione.Picture.LoadFromFile(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
        IntestazBMP.LoadFromFile(DM1.LoghiDir + 'intestaz' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
        ImageIntestazione.Enabled := True;
     end else begin
        ImageIntestazione.Enabled := False;
     end;

     // Carica le impostazioni del piede
     ImagePiede.Width  := LO.ReadInteger(TipoDoc, 'LargPiede', 30);
     ImagePiede.Height := LO.ReadInteger(TipoDoc, 'AltPiede', 30);
     // Se l'altezza del piede  è > 0 imposta tale altezza altrimento la forza a zero
     if (ImagePiede.Width > 0)and(ImagePiede.Height > 0) then begin
       ChildLogoPiede.Height  := ImagePiede.Height + 6
     end else begin
       ChildLogoPiede.Height  := 0;
     end;
     // Se abilitata alla stampa carica la Bitmap del piede del documento
     if StampaLogoPiede then begin
//        ImagePiede.Picture.LoadFromFile(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
        PiedeBMP.LoadFromFile(DM1.LoghiDir + 'piede' + IntToStr(LO.ReadInteger(TipoDoc, 'LayoutDocumento', 1)) + '.bmp');
        ImagePiede.Enabled := True;
     end else begin
        ImagePiede.Enabled := False;
     end;

   finally
     // Chiude il file
     LO.Free;
   end;

   // Qpre il file che contiene il layout del documento
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try
     // Flag che indica se stampare le rige di manodopera oppure no
     fStampaManodopera := LO.ReadBool(TipoDoc, 'StampaManodopera', True);
     // Flag che abilita o meno l'aggiunta dell'anno al numero del documento in fase di stampa
     //  (es: Fature 125/2013-)
     //  NB: In ogni caso solo se l'interruttore generale nei Parametri e progressivi è abilitato
     fNumDocUnivoco_AggiungiAnno      := (DM1.TableProgressivi2NUMDOCUNIVOCO_ENABLED.AsString = 'T')   and   LO.ReadBool(TipoDoc, 'NumDocUnivoco_AggiungiAnno',   ((TipoDoc = 'Fattura') or (TipoDoc = 'Fatt.R.F.'))   );
     fNumDocUnivoco_AnnoDopoRegistro  := LO.ReadBool(TipoDoc, 'NumDocUnivoco_AnnoDopoRegistro', False   );
     fNumDocUnivoco_Mask              := LO.ReadString(TipoDoc, 'NumDocUnivoco_Mask', '/yyyy'   );
     // Carica il valore che determina se la stampa sarà effettuata con il piede mobile
     //  solo sull'ultima pagina.
     fAbilitaPiedeMobile := LO.ReadBool(TipoDoc, 'PiedeMobile', (TipoDoc = 'Preventivo'));
     // Se è abilitato il piede mobile modifica la proprietà Parent di alcune child band per fare in modo che
     //  il castelletto IVA benga stampato solo sull'ultima pagina e subito dopo la fine del corpo documento
     //  e prima del castelletto venga stampato il testo finale.
     //  Se non faccio così mi da dei gran casini, è l'unico modo che ho trovato funzionante.
     if fAbilitaPiedeMobile then begin
        ChildPiede1.ParentBand := QRBandUltimaPagina;
        ChildChiusura1.ParentBand := QRBandPiede1;
     end;
     // Inizializza il flag che indica se si stà stampando l'ultima pagina della stampa oppure no.
     UltimaPagina := False;
     // Carica il flag che indica se stampare i righi con lettura facilitata
     LetturaFacilitata := LO.ReadBool(TipoDoc, 'LetturaFacilitata', True);
     // Carica alcuni parametri per la variazione dell'aspetto degli Shape
     ForzaAltezzaShape              := LO.ReadInteger(TipoDoc, 'ForzaAltezzaRiquadri', -1);
     ForzaDiminuzioneLarghezzaShape := LO.ReadInteger(TipoDoc, 'ForzaDiminuzioneLarghezzaRiquadri', -1);
     // Se però è un fax la disabilita comunque (altrimenti non si vede niente)
     //  anche tutti gli altri Shape con sfondo grigino diventano bianchi per
     //  lo stesso motivo
     if FaxPrinting then
     begin
        LetturaFacilitata := False;
        QRShape1.Brush.Color    := clWhite;
        QRShape4.Brush.Color    := clWhite;
        QRShape10.Brush.Color   := clWhite;
        QRShape20.Brush.Color   := clWhite;
     end;
     // Carica il valore di separazione orizzontale tra i campi del documento
     Sep := 3;
     // Inizializza la variabile di posizionamento orizzontale
     XX := LEFTBORDER;

     // ----- CODICE A BARRE DOCUMENTO -----
//     if (LO.ReadInteger(TipoDoc, 'StampaBarcodeDocumento', 1) > 0) and (DM1.TableProgressiviSTAMPABARCODEDOCUMENTI.AsString = 'T') then begin
//       // Carica il codice a barre se c'è
//       if (not PreventiviOrdiniForm.QryDocumentoBARCODE.IsNull) and (PreventiviOrdiniForm.QryDocumentoBARCODE.AsString <> '')
//       then QREan1.BarCode := ('#' + PreventiviOrdiniForm.QryDocumentoBARCODE.AsString + '#')
//       else QREan1.Enabled := False;
//       // Rende il Barcode visibile
//       QREan1.Enabled := True;
//     end else begin
//       QREan1.Enabled := False;
//     end;

     // ----- DESTINATARIO/LUOGO DI DESTINAZIONE -----
     // Carica il tipo di banda Dstinatario da utilizzare
     DestinatarioTipo := LO.ReadInteger(TipoDoc, 'V_DestinatarioTipo', 1);
     // Se è attivo e selezionato il tipo di banda destinatario 1...
     ChildDestinatario.Enabled   := (DestinatarioTipo = 1) and (LO.ReadInteger(TipoDoc, 'V_Destinatario', 2) > 1);
     if not ChildDestinatario.Enabled then ChildDestinatario.Height := 0;
     // Se è attivo e selezionato il tipo di banda destinatario 2...
     ChildDestinatario2.Enabled  := (DestinatarioTipo = 2) and (LO.ReadInteger(TipoDoc, 'V_Destinatario', 2) > 1);
     if not ChildDestinatario2.Enabled then ChildDestinatario2.Height := 0;
     // Se abilitato rende visibile o meno anche il numero di telefono in base al parametro
     if ChildDestinatario.Enabled and (LO.ReadInteger(TipoDoc, 'StampaTelefonoIntestatario', 0) = 0) then
     begin
       // ----- 1 -----
       QRLabelTel.Enabled := False;
       QRFieldTel.Enabled := False;
       QRLabelCell.Enabled := False;
       QRFieldCell.Enabled := False;
       // ----- 2 -----
       QRLabelTelefono.Enabled := False;
       QRFieldTelefono.Enabled := False;
     end;
     // ----- LUOGO DESTINAZIONE -----
     if not PreventiviOrdiniForm.StmSezDestinazioneMerce.Checked then begin
        // ----- 1 -----
        QRShape3.Enabled                                := False;
        QRLabelLuogoDestinazione.Enabled                := False;
        QRLabelTrattinoLuogoDestinazione.Enabled        := False;
        QRLabelParentesiApertaLuogoDestinazione.Enabled := False;
        QRLabelParentesiChiusaLuogoDestinazione.Enabled := False;
        QRLabelRagSocDest1.Enabled                      := False;
        QRLabelRagSocDest2.Enabled                      := False;
        QRDBIndirizzoLuogoDestinazione.Enabled          := False;
        QRDBNumCivicoLuogoDestinazione.Enabled          := False;
        QRDBCAPLuogoDestinazione.Enabled                := False;
        QRDBCittaLuogoDestinazione.Enabled              := False;
        QRDBProvinciaLuogoDestinazione.Enabled          := False;
        // ----- 2 -----
        QRLabelLuogoDestinazione2.Enabled                := False;
        QRLabelTrattinoLuogoDestinazione2.Enabled        := False;
        QRLabelParentesiApertaLuogoDestinazione2.Enabled := False;
        QRLabelParentesiChiusaLuogoDestinazione2.Enabled := False;
        QRDBRagSocLuogoDestinazione2.Enabled             := False;
        QRDBIndirizzoLuogoDestinazione2.Enabled          := False;
        QRDBCAPLuogoDestinazione2.Enabled                := False;
        QRDBCittaLuogoDestinazione2.Enabled              := False;
        QRDBProvinciaLuogoDestinazione2.Enabled          := False;
        // ----------
     end;
     // ----- CANTIERE -----
     if not PreventiviOrdiniForm.StmSezCantiere.Checked then begin
        // ----- 1 -----
//        QRShapeCantiere.Enabled   := False;
        QRLabelCantiere.Enabled   := False;
        QRFieldCantiere.Enabled   := False;
        QRShapeIntestatario.Height := QRShapeIntestatario.Height + QRShapeCantiere.Height;
        QRShapeCantiere.Enabled := False;
        // ----- 2 -----
//        QRShapeCantiere.Enabled   := False;
        QRLabelCantiere2.Enabled   := False;
        QRFieldCantiere2.Enabled   := False;
        // ----------
     end;
     // ----- TIPO/NUM/DATA -----
     ChildTipoNumData.Enabled     := LO.ReadInteger(TipoDoc, 'V_TipoNumData', 2) > 1;
     if not ChildTipoNumData.Enabled then ChildTipoNumData.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini




     // ----- AGENTI -----
     // Carica le label dei campi agente (vuote = campo non abilitato)
     QRLabelAgente1.Caption := DM1.GridsColumnAgenteCaption;
     QRLabelAgente2.Caption := DM1.GridsColumnAgente2Caption;
     QRLabelAgente3.Caption := DM1.GridsColumnAgente3Caption;
     QRLabelAgente4.Caption := DM1.GridsColumnAgente4Caption;
     // Determina la visibilità o meno dei singoli campi agente
     Agente1.Enabled := (DM1.GridsColumnAgenteCaption <> '');
     Agente2.Enabled := (DM1.GridsColumnAgente2Caption <> '');
     Agente3.Enabled := (DM1.GridsColumnAgente2Caption <> '');
     Agente4.Enabled := (DM1.GridsColumnAgente2Caption <> '');
     // Se almeno uno dei campi agente è attivo e se il pannello è autorizzato a stamparsi, si stampa altrimenti no
     if not (   (Agente1.Enabled or Agente2.Enabled or Agente3.Enabled or Agente4.Enabled) and (LO.ReadInteger(TipoDoc, 'V_Agente', 0) > 1)   ) then begin
       ChildAgenti.Height := 0;
     end;





     // ----- SUBSOGG -----
     ChildSubSogg.Enabled         := LO.ReadInteger(TipoDoc, 'V_AbilitaSubSogg', 0) > 1;
      if ChildSubSogg.Enabled then begin
         if LO.ReadString(TipoDoc, 'V_SubSoggCampo1', '0') <> '0' then begin
            QRLabelSubSogg1.Caption := LO.ReadString(TipoDoc, 'V_SubSoggCampo1', '0') + ' ';
            QRLabelSubSogg1.Enabled := True;
            QRDBTSubSogg1.Enabled   := True;
         end else begin
            QRLabelSubSogg1.Enabled := False;
            QRDBTSubSogg1.Enabled   := False;
         end;
         if LO.ReadString(TipoDoc, 'V_SubSoggCampo2', '0') <> '0' then begin
            QRLabelSubSogg2.Caption := LO.ReadString(TipoDoc, 'V_SubSoggCampo2', '0') + ' ';
            QRLabelSubSogg2.Enabled := True;
            QRDBTSubSogg2.Enabled   := True;
         end else begin
            QRLabelSubSogg2.Enabled := False;
            QRDBTSubSogg2.Enabled   := False;
         end;
         if LO.ReadString(TipoDoc, 'V_SubSoggCampo3', '0') <> '0' then begin
            QRLabelSubSogg3.Caption := LO.ReadString(TipoDoc, 'V_SubSoggCampo3', '0') + ' ';
            QRLabelSubSogg3.Enabled := True;
            QRDBTSubSogg3.Enabled   := True;
         end else begin
            QRLabelSubSogg3.Enabled := False;
            QRDBTSubSogg3.Enabled   := False;
         end;
      end else begin
         ChildSubSogg.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
      end;
     // ----- TESTO INIZIALE -----
     StampaTestoIniziale;
     // ----- INTESTAZIONE COLONNE -----
     ChildIntestazioneColonne.Enabled := LO.ReadInteger(TipoDoc, 'V_IntestazioneColonne', 2) > 1;
     if not ChildIntestazioneColonne.Enabled then ChildIntestazioneColonne.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
        // NB: Il dimensionamento e il posizionamento dei nomi delle colonne la fà
        //      più avanti insieme ai campi.
     // ----- PIEDE -----
     // Carica il tipo di piede da utilizzare
     //  NB: Se dall'apposito pannello si è scelto di non stampare il piede del
     //       documento, forza il tipo di piede = 0 che significa appunto nessun piede.
     PiedeTipo := LO.ReadInteger(TipoDoc, 'V_PiedeTipo', 0);
     if not PreventiviOrdiniForm.StmSezTotaliDoc.Checked then
       PiedeTipo := 0;
     // Prima disabilita tutti i piedi
     QRBandPiede1.Height        := 0;
     QRBandPiede1.Enabled       := True;  // Questa deve essere sempre attiva
     ChildPiede1.Height         := 0;
     ChildPiede1.Enabled        := False;
     ChildPiede2.Height         := 0;
     ChildPiede2.Enabled        := False;
     ChildPiede3.Height         := 0;
     ChildPiede3.Enabled        := False;
     ChildPiede3NoIva.Height    := 0;
     ChildPiede3NoIva.Enabled   := False;
     ChildPiede4.Height         := 0;
     ChildPiede4.Enabled        := False;
     // Però se si è selezionato di stampare il piede senza castelletto IVA oppure
     //  con prezzi IVA esclusa (quindi sempre sempre senza castelletto IVA)
     //  provvede a stampare il piede basso senza nulla.
     if (  (not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked) or (PreventiviOrdiniForm.StmTotIvaEscl.Checked)  ) and (PiedeTipo <> 0)
     then
     begin
       ChildPiede3NoIva.Height  := 30;
       ChildPiede3NoIva.Enabled := True;
       // Se si è selezionato di stampare il totale IVA esclusa (praticamente l'Imponibile)...
       if PreventiviOrdiniForm.StmTotIvaEscl.Checked then QRDBTextPiede3NoIvaTotale.DataField := 'TOTALEIMPONIBILE';
     end
     // Altrimenti stampa il piede normale
     else
     begin
       case PiedeTipo of
         1 : begin
                ChildPiede4.Height  := 108;
                ChildPiede4.Enabled := True;
             end;
         2 : begin
                ChildPiede2.Height  := 108;
                ChildPiede2.Enabled := True;
             end;
         3 : begin
  //              // Se si è selezionato di stampare il piede senza castelletto IVA oppure
  //              //  con prezzi IVA esclusa (quindi sempre sempre senza castelletto IVA)
  //              //  provvede a stampare il piede basso senza nulla.
  //              if (not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked) or (PreventiviOrdiniForm.StmTotIvaEscl.Checked) then
  //              begin
  //                ChildPiede3NoIva.Height  := 30;
  //                ChildPiede3NoIva.Enabled := True;
  //                // Se si è selezionato di stampare il totale IVA esclusa (praticamente l'Imponibile)...
  //                if PreventiviOrdiniForm.StmTotIvaEscl.Checked then QRDBTextPiede3NoIvaTotale.DataField := 'TOTALEIMPONIBILE';
  //              end
  //              // Altrimenti stampa il piede 3 normale
  //              else
  //              begin
                  ChildPiede3.Height  := 108;
                  ChildPiede3.Enabled := True;
  //              end;
             end;
         0 : begin
                ChildPiede1.Height  := 0;     // Questo piede nulla non deve essere visibile
                ChildPiede1.Enabled := True;
             end;
       end;
     end;
     // Sconto finale / abbuono
     if PreventiviOrdiniForm.QryDocumentoABBUONOSU.AsString = 'T' then
       QRLabelAbbuonoSu4.Caption := 'del totale doc.'
     else
     if PreventiviOrdiniForm.QryDocumentoABBUONOSU.AsString = 'I' then
       QRLabelAbbuonosu4.Caption := 'dell''imponibile'
     else
       QRLabelAbbuonosu4.Caption := '';
     QRLabelAbbuonoSu3.Caption := QRLabelAbbuonosu4.Caption;
     // ----- TESTO FINALE -----
     // Se è abilitato il testo finale lo attiva e ne carica il testo, altrimenti no.
     StampaTestoFinale;
     // ----- RIF. ALTRI SOGGETTI -----
     ChildAltriSogg.Enabled := PreventiviordiniForm.StmSezRifAltriSogg.Checked;
     if not ChildAltriSogg.Enabled then ChildAltriSogg.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
     // ----- NOTE E MESSAGGI -----
     // Note
     ChildNote.Enabled := PreventiviOrdiniForm.StmSezNote.Checked or (PreventiviOrdiniForm.QryDocumentoBOLLOIMPORTO.AsFloat <> 0) or (PreventiviOrdiniForm.QryDocumentoSPLITPAYMENT.AsString = 'T');
     if ChildNote.Enabled then StampaNote
     else ChildNote.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
     //Messaggi
     ChildMessaggi.Enabled := PreventiviOrdiniForm.StmSezMessaggi.Checked;
     if ChildMessaggi.Enabled then StampaMessaggi
     else ChildMessaggi.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
     // ----- TRASPORTO -----
     ChildTrasporto.Enabled := PreventiviOrdiniForm.StmSezTrasporto.Checked;
      if ChildTrasporto.Enabled then begin
         // Se il valore della data e/o inizio trasporto sono nulli pone li rende invisibili
         QRDBDataInizioTrasporto.Enabled := not PreventiviOrdiniForm.QryDocumentoDataTrasp.IsNull;
         QRDBOraInizioTrasporto.Enabled  := not PreventiviOrdiniForm.QryDocumentoOraTrasp.IsNull;
         // A questo punto è visibile solo la prima parte
         ChildTrasporto.Height := 30;
         // Se è abilitata anche la banda dei Colli + aspetto beni rende visibile anche questa parte
         if LO.ReadInteger(TipoDoc, 'V_Colli', 2) > 1 then ChildTrasporto.Height := 60;
      end else begin
         ChildTrasporto.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
      end;
     // ----- PAGAMENTO -----
     ChildPagamento.Enabled := PreventiviOrdiniForm.StmSezPagamento.Checked;
     if not ChildPagamento.Enabled then ChildPagamento.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
     // ----- BANCA -----
     ChildBanca.Enabled := PreventiviOrdiniForm.StmSezBanca.Checked;
     if not ChildBanca.Enabled then ChildBanca.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
     // ----- OPERATORE -----
     ChildOperatore.Enabled := PreventiviOrdiniForm.StmSezOperatore.Checked;
     if not ChildOperatore.Enabled then ChildOperatore.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
     // ----- SCADENZE -----
     ChildScadenze.Enabled := PreventiviOrdiniForm.StmSezScadenze.Checked;
     if not ChildScadenze.Enabled then ChildScadenze.Height := 0;   // Se disabilitata forza l'altezza della banda a 0 per evitare casini
     // ----- CHIUSURA -----
     // NB: Per risolvere alcuni problemi dopo le modifiche per far funzionare bene il piede mobile
     //      ho messo la Chiusura1 fissa (la riga orizzontale con la scritta "Documento stampato con softwasre....."
     //      e la chiusura con le firme la gestisco come se fosse una normale banda da abilitare disabilitare.
     //      Però per compatibilità con il passato praticamente la Chiusura è sempre attiva (anche se ChiusuraTipo=0 oppure 2
     //      invece ChildChiusura2 che adesso si chiama ChildFirme1 si abilita solo se è selezionata "ChiusuraTipo = 2".
     // Carica il parametro che indica il tipo di chiusura da effettuare
//     ChiusuraTipo := LO.ReadInteger(TipoDoc, 'S_ChiusuraTipo', 0);
     if PreventiviOrdiniForm.StmSezFirme.Checked then
       ChiusuraTipo := 2
     else
       ChiusuraTipo := PreventiviOrdiniForm.fChiusuraTipo;
     // Defaultizzazione.
     ChildChiusura1.Height  := 0;
     ChildChiusura1.Enabled := False;
     ChildFirme1.Height  := 0;
     ChildFirme1.Enabled := False;
     // Se si è impostato la chiusura tipo 1...
     if ChiusuraTipo > 0 then begin
       ChildChiusura1.Height  := 20;  // Alto 20 invece di 10 per avere u pò di spazio in più sul logo finale (estetica)
       ChildChiusura1.Enabled := True;
     end;
     // Se si e impostato la chiusura tipo 2 lascia attiva anche la chiusura tipo 1 e aggiunge le firme
     if ChiusuraTipo > 1 then begin
       ChildFirme1.Height           := 39;
       ChildFirme1.Enabled          := True;
       QRLabelFirma1.Caption        := LO.ReadString(TipoDoc, 'TitoloFirma1', 'Firma del conducente');
       QRLabelFirma2.Caption        := LO.ReadString(TipoDoc, 'TitoloFirma2', 'Firma del vettore');
       QRLabelFirma3.Caption        := LO.ReadString(TipoDoc, 'TitoloFirma3', 'Firma del destinatario');
     end;
     // ---------------------------------------------------------------------------------------------------
     //                       POSIZIONAMENTO E DIMENSIONAMENTO COLONNE DOCUMENTO
     // ---------------------------------------------------------------------------------------------------
      // Prima di tutto calcola l'altezza delle linee verticali di separazione delle colonne.
      //  NB: Se è abilitato il testo finale, limita le linee verticali a 0, in modo che non rompano.
      AltezzaLineeSeparazioneColonne := QuickReport1.Height - ChildIntestazioneColonne.Top - 100;
      if AbilitaTestoFinale then begin
         AltezzaLineeSeparazioneColonne := 0;
         QRShapeLineaSuperioreTestoFinale.Enabled  := True;
      end else QRShapeLineaSuperioreTestoFinale.Enabled  := False;
      // ----- CODICE ARTICOLO -----
       if PreventiviOrdiniForm.StmColCodiceArticolo.Checked then begin
          QRShapeCodiceArticolo.Left              := XX;
          QRShapeCodiceArticolo.Width             := 0;
          QRShapeCodiceArticolo.Height            := AltezzaLineeSeparazioneColonne;
          QRShapeRowCodiceArticolo.Left           := XX;
          QRShapeRowCodiceArticolo.Width          := 0;
          QRShapeRowDIBACodiceArticolo.Left       := XX;
          QRShapeRowDIBACodiceArticolo.Width      := 0;
          QRShapeBlankCodiceArticolo.Left         := XX;
          QRShapeBlankCodiceArticolo.Width        := 0;
          QRLabelCodiceArticolo.Left              := XX + Sep;
          QRLabelCodiceArticolo.Width             := PreventiviOrdiniForm.tvCorpoCODICEARTICOLOSTM.Width;
          CodiceArticolo.Left                     := XX + Sep;
          CodiceArticolo.Width                    := PreventiviOrdiniForm.tvCorpoCODICEARTICOLOSTM.Width;
          DIBACodiceArticolo.Left                 := XX + Sep;
          DIBACodiceArticolo.Width                := PreventiviOrdiniForm.tvCorpoCODICEARTICOLOSTM.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoCODICEARTICOLOSTM.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeCodiceArticolo;
       end else begin
          QRLabelCodiceArticolo.Enabled           := False;
          QRShapeCodiceArticolo.Enabled           := False;
          QRShapeRowCodiceArticolo.Enabled        := False;
          QRShapeRowDIBACodiceArticolo.Enabled    := False;
          QRShapeBlankCodiceArticolo.Enabled      := False;
          CodiceArticolo.Enabled                  := False;
          DIBACodiceArticolo.Enabled              := False;
       end;
      // ----- DESCRIZIONE -----
       if PreventiviOrdiniForm.StmColDescrizione.Checked then begin
          QRShapeDescrizione.Left         := XX;
          QRShapeDescrizione.Width        := 0;
          QRShapeDescrizione.Height       := AltezzaLineeSeparazioneColonne;
          QRShapeRowDescrizione.Left      := XX;
          QRShapeRowDescrizione.Width     := 0;
          QRShapeRowDIBADescrizione.Left  := XX;
          QRShapeRowDIBADescrizione.Width := 0;
          QRShapeBlankDescrizione.Left    := XX;
          QRShapeBlankDescrizione.Width   := 0;
          QRLabelDescrizione.Left         := XX + Sep;
          QRLabelDescrizione.Width        := PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Width;
          Descrizione.Left                := XX + Sep;
          Descrizione.Width               := PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Width;
          Descrizione.Width := Trunc(Descrizione.Width * 1.05);  // Aumento larghezza del 5% per cercare di risolvere il problema della descrizione che sbordava
          DIBADescrizione.Left            := XX + Sep + DIBA_INDENT_PIXELS;
          DIBADescrizione.Width           := PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Width; // - DIBA_INDENT_PIXELS;
          DIBADescrizione.Width := Trunc(DIBADescrizione.Width * 1.05);  // Valore precedente 0.90 // Riduzione larghezza del 10% per cercare di risolvere il problema della descrizione che sbordava
          XX := XX + Descrizione.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeDescrizione;
          // Posiziona gli shape che disegnano l'albero dei sottorighi
          QRSDIBATop.Left                 := DIBADescrizione.Left - QRSDIBARight.Width - 3;
          QRSDIBABottom.Left              := QRSDIBATop.Left;
          QRSDIBARight.Left               := QRSDIBATop.Left;
       end else begin
          QRLabelDescrizione.Enabled        := False;
          QRShapeDescrizione.Enabled        := False;
          QRShapeRowDescrizione.Enabled     := False;
          QRShapeRowDIBADescrizione.Enabled := False;
          QRShapeBlankDescrizione.Enabled   := False;
          Descrizione.Enabled               := False;
          DIBADescrizione.Enabled           := False;
          QRSDIBATop.Enabled                := False;
          QRSDIBABottom.Enabled             := False;
          QRSDIBARight.Enabled              := False;
       end;
      // ----- UNITA DI MISURA -----
       if PreventiviOrdiniForm.StmColUM.Checked then begin
          QRShapeUnitaDiMisura.Left         := XX;
          QRShapeUnitaDiMisura.Width        := 0;
          QRShapeUnitaDiMisura.Height       := AltezzaLineeSeparazioneColonne;
          QRShapeRowUnitaDiMisura.Left      := XX;
          QRShapeRowUnitaDiMisura.Width     := 0;
          QRShapeRowDIBAUnitaDiMisura.Left  := XX;
          QRShapeRowDIBAUnitaDiMisura.Width := 0;
          QRShapeBlankUnitaDiMisura.Left    := XX;
          QRShapeBlankUnitaDiMisura.Width   := 0;
          QRLabelUnitaDiMisura.Left         := XX + Sep;
          QRLabelUnitaDiMisura.Width        := PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Width;
          UnitaDiMisura.Left                := XX + Sep;
          UnitaDiMisura.Width               := PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Width;
          DIBAUnitaDiMisura.Left            := XX + Sep;
          DIBAUnitaDiMisura.Width           := PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeUnitaDiMisura;
       end else begin
          QRLabelUnitaDiMisura.Enabled            := False;
          QRShapeUnitaDiMisura.Enabled            := False;
          QRShapeRowUnitaDiMisura.Enabled         := False;
          QRShapeRowDIBAUnitaDiMisura.Enabled     := False;
          QRShapeBlankUnitaDiMisura.Enabled       := False;
          UnitaDiMisura.Enabled := False;
          DIBAUnitaDiMisura.Enabled := False;
       end;
      // ----- QTA -----
       if PreventiviOrdiniForm.StmColQta.Checked then begin
          QRShapeQTA.Left           := XX;
          QRShapeQTA.Width          := 0;
          QRShapeQTA.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowQTA.Left        := XX;
          QRShapeRowQTA.Width       := 0;
          QRShapeRowDIBAQTA.Left    := XX;
          QRShapeRowDIBAQTA.Width   := 0;
          QRShapeBlankQTA.Left      := XX;
          QRShapeBlankQTA.Width     := 0;
          QRLabelQTA.Left           := XX + Sep;
          QRLabelQTA.Width          := PreventiviOrdiniForm.tvCorpoQTA.Width;
          QTA.Left                  := XX + Sep;
          QTA.Width                 := PreventiviOrdiniForm.tvCorpoQTA.Width;
          DIBAQTA.Left              := XX + Sep;
          DIBAQTA.Width             := PreventiviOrdiniForm.tvCorpoQTA.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoQTA.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeQTA;
       end else begin
          QRLabelQTA.Enabled        := False;
          QRShapeQTA.Enabled        := False;
          QRShapeRowQTA.Enabled     := False;
          QRShapeRowDIBAQTA.Enabled := False;
          QRShapeBlankQTA.Enabled   := False;
          QTA.Enabled               := False;
          DIBAQTA.Enabled           := False;
       end;
      // ----- QTA EVASA -----
       if PreventiviOrdiniForm.StmColQtaEvasa.Checked then begin
          QRShapeQTAEvasa.Left           := XX;
          QRShapeQTAEvasa.Width          := 0;
          QRShapeQTAEvasa.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowQTAEvasa.Left        := XX;
          QRShapeRowQTAEvasa.Width       := 0;
          QRShapeRowDIBAQTAEvasa.Left    := XX;
          QRShapeRowDIBAQTAEvasa.Width   := 0;
          QRShapeBlankQTAEvasa.Left      := XX;
          QRShapeBlankQTAEvasa.Width     := 0;
          QRLabelQTAEvasa.Left           := XX + Sep;
          QRLabelQTAEvasa.Width          := PreventiviOrdiniForm.tvCorpoQTAEVASA.Width;
          QTAEvasa.Left                  := XX + Sep;
          QTAEvasa.Width                 := PreventiviOrdiniForm.tvCorpoQTAEVASA.Width;
          DIBAQTAEvasa.Left              := XX + Sep;
          DIBAQTAEvasa.Width             := PreventiviOrdiniForm.tvCorpoQTAEVASA.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoQTAEVASA.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeQTAEvasa;
       end else begin
          QRLabelQTAEvasa.Enabled        := False;
          QRShapeQTAEvasa.Enabled        := False;
          QRShapeRowQTAEvasa.Enabled     := False;
          QRShapeRowDIBAQTAEvasa.Enabled := False;
          QRShapeBlankQTAEvasa.Enabled   := False;
          QTAEvasa.Enabled               := False;
          DIBAQTAEvasa.Enabled           := False;
       end;
      // ----- QTA RESIDUA -----
       if PreventiviOrdiniForm.StmColQtaDaEvadere.Checked then begin
          QRShapeQTAResidua.Left           := XX;
          QRShapeQTAResidua.Width          := 0;
          QRShapeQTAResidua.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowQTAResidua.Left        := XX;
          QRShapeRowQTAResidua.Width       := 0;
          QRShapeRowDIBAQTAResidua.Left    := XX;
          QRShapeRowDIBAQTAResidua.Width   := 0;
          QRShapeBlankQTAResidua.Left      := XX;
          QRShapeBlankQTAResidua.Width     := 0;
          QRLabelQTAResidua.Left           := XX + Sep;
          QRLabelQTAResidua.Width          := PreventiviOrdiniForm.tvCorpoQTADAEVADERE.Width;
          QTAResidua.Left                  := XX + Sep;
          QTAResidua.Width                 := PreventiviOrdiniForm.tvCorpoQTADAEVADERE.Width;
          DIBAQTAResidua.Left              := XX + Sep;
          DIBAQTAResidua.Width             := PreventiviOrdiniForm.tvCorpoQTADAEVADERE.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoQTADAEVADERE.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeQTAResidua;
       end else begin
          QRLabelQTAResidua.Enabled        := False;
          QRShapeQTAResidua.Enabled        := False;
          QRShapeRowQTAResidua.Enabled     := False;
          QRShapeRowDIBAQTAResidua.Enabled := False;
          QRShapeBlankQTAResidua.Enabled   := False;
          QTAResidua.Enabled               := False;
          DIBAQTAResidua.Enabled           := False;
       end;
      // ----- PREZZO UNITARIO -----
//       if (LO.ReadInteger(TipoDoc, 'Col_PrezzoUnitario', 2) > 1) then begin
       if PreventiviOrdiniForm.StmColPrezzoUnitario.Checked and PreventiviOrdiniForm.StmPrzIvaEscl.Checked then begin
          QRShapePrezzoUnitario.Left              := XX;
          QRShapePrezzoUnitario.Width             := 0;
          QRShapePrezzoUnitario.Height            := AltezzaLineeSeparazioneColonne;
          QRShapeRowPrezzoUnitario.Left           := XX;
          QRShapeRowPrezzoUnitario.Width          := 0;
          QRShapeRowDIBAPrezzoUnitario.Left       := XX;
          QRShapeRowDIBAPrezzoUnitario.Width      := 0;
          QRShapeBlankPrezzoUnitario.Left         := XX;
          QRShapeBlankPrezzoUnitario.Width        := 0;
          QRLabelPrezzoUnitario.Left              := XX + Sep;
          QRLabelPrezzoUnitario.Width             := PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Width;
          PrezzoUnitario.Left                     := XX + Sep;
          PrezzoUnitario.Width                    := PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Width;
          DIBAPrezzoUnitario.Left                 := XX + Sep;
          DIBAPrezzoUnitario.Width                := PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapePrezzoUnitario;
       end else begin
          QRLabelPrezzoUnitario.Enabled           := False;
          QRShapePrezzoUnitario.Enabled           := False;
          QRShapeRowPrezzoUnitario.Enabled        := False;
          QRShapeRowDIBAPrezzoUnitario.Enabled    := False;
          QRShapeBlankPrezzoUnitario.Enabled      := False;
          PrezzoUnitario.Enabled                  := False;
          DIBAPrezzoUnitario.Enabled              := False;
       end;
      // ----- PREZZO UNITARIO IVA COMPRESA-----
//       if (LO.ReadInteger(TipoDoc, 'Col_PrezzoUnitarioIVACompresa', 2) > 1) and PreventiviOrdiniForm.StmColPrezzoUnitario.Checked then begin
       if PreventiviOrdiniForm.StmColPrezzoUnitario.Checked and PreventiviOrdiniForm.StmPrzIvaComp.Checked then begin
          QRShapePrezzoUnitarioIVACompresa.Left           := XX;
          QRShapePrezzoUnitarioIVACompresa.Width          := 0;
          QRShapePrezzoUnitarioIVACompresa.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowPrezzoUnitarioIVACompresa.Left        := XX;
          QRShapeRowPrezzoUnitarioIVACompresa.Width       := 0;
          QRShapeRowDIBAPrezzoUnitarioIVACompresa.Left    := XX;
          QRShapeRowDIBAPrezzoUnitarioIVACompresa.Width   := 0;
          QRShapeBlankPrezzoUnitarioIVACompresa.Left      := XX;
          QRShapeBlankPrezzoUnitarioIVACompresa.Width     := 0;
          QRLabelPrezzoUnitarioIVACompresa.Left           := XX + Sep;
          QRLabelPrezzoUnitarioIVACompresa.Width          := PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Width;
          PrezzoUnitarioIVACompresa.Left                  := XX + Sep;
          PrezzoUnitarioIVACompresa.Width                 := PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Width;
          DIBAPrezzoUnitarioIVACompresa.Left              := XX + Sep;
          DIBAPrezzoUnitarioIVACompresa.Width             := PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapePrezzoUnitarioIVACompresa;
       end else begin
          QRLabelPrezzoUnitarioIVACompresa.Enabled        := False;
          QRShapePrezzoUnitarioIVACompresa.Enabled        := False;
          QRShapeRowPrezzoUnitarioIVACompresa.Enabled     := False;
          QRShapeRowDIBAPrezzoUnitarioIVACompresa.Enabled := False;
          QRShapeBlankPrezzoUnitarioIVACompresa.Enabled   := False;
          PrezzoUnitarioIVACompresa.Enabled               := False;
          DIBAPrezzoUnitarioIVACompresa.Enabled           := False;
       end;
      // ----- PREZZO UNITARIO NETTO-----
//       if (LO.ReadInteger(TipoDoc, 'Col_PrzUnitNetto', 0) > 1) then begin
       if PreventiviOrdiniForm.StmColPrezzoUnitario.Checked and PreventiviOrdiniForm.StmPrzIvaEscl.Checked and (LO.ReadInteger(TipoDoc, 'Col_PrzUnitNetto', 0) > 1) then begin
          QRShapePrzUnitNetto.Left           := XX;
          QRShapePrzUnitNetto.Width          := 0;
          QRShapePrzUnitNetto.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowPrzUnitNetto.Left        := XX;
          QRShapeRowPrzUnitNetto.Width       := 0;
          QRShapeRowDIBAPrzUnitNetto.Left    := XX;
          QRShapeRowDIBAPrzUnitNetto.Width   := 0;
          QRShapeBlankPrzUnitNetto.Left      := XX;
          QRShapeBlankPrzUnitNetto.Width     := 0;
          QRLabelPrzUnitNetto.Left           := XX + Sep;
          QRLabelPrzUnitNetto.Width          := PreventiviOrdiniForm.tvCorpoPRZUNITNETTO.Width;
          PrezzoUnitarioNetto.Left           := XX + Sep;
          PrezzoUnitarioNetto.Width          := PreventiviOrdiniForm.tvCorpoPRZUNITNETTO.Width;
          DIBAPrezzoUnitarioNetto.Left       := XX + Sep;
          DIBAPrezzoUnitarioNetto.Width      := PreventiviOrdiniForm.tvCorpoPRZUNITNETTO.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoPRZUNITNETTO.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapePrzUnitNetto;
       end else begin
          QRLabelPrzUnitNetto.Enabled        := False;
          QRShapePrzUnitNetto.Enabled        := False;
          QRShapeRowPrzUnitNetto.Enabled     := False;
          QRShapeRowDIBAPrzUnitNetto.Enabled := False;
          QRShapeBlankPrzUnitNetto.Enabled   := False;
          PrezzoUnitarioNetto.Enabled               := False;
          DIBAPrezzoUnitarioNetto.Enabled           := False;
       end;
      // ----- SCONTO RIGO 1 -----
       if PreventiviOrdiniForm.StmColSconto1.Checked then begin
          QRShapeScontoRigo1.Left           := XX;
          QRShapeScontoRigo1.Width          := 0;
          QRShapeScontoRigo1.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowScontoRigo1.Left        := XX;
          QRShapeRowScontoRigo1.Width       := 0;
          QRShapeRowDIBAScontoRigo1.Left    := XX;
          QRShapeRowDIBAScontoRigo1.Width   := 0;
          QRShapeBlankScontoRigo1.Left      := XX;
          QRShapeBlankScontoRigo1.Width     := 0;
          QRLabelScontoRigo1.Left           := XX + Sep;
          QRLabelScontoRigo1.Width          := PreventiviOrdiniForm.tvCorpoSCONTORIGO.Width;
          ScontoRigo1.Left                  := XX + Sep;
          ScontoRigo1.Width                 := PreventiviOrdiniForm.tvCorpoSCONTORIGO.Width;
          DIBAScontoRigo1.Left              := XX + Sep;
          DIBAScontoRigo1.Width             := PreventiviOrdiniForm.tvCorpoSCONTORIGO.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoSCONTORIGO.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeScontoRigo1;
       end else begin
          QRLabelScontoRigo1.Enabled        := False;
          QRShapeScontoRigo1.Enabled        := False;
          QRShapeRowScontoRigo1.Enabled     := False;
          QRShapeRowDIBAScontoRigo1.Enabled := False;
          QRShapeBlankScontoRigo1.Enabled   := False;
          ScontoRigo1.Enabled               := False;
          DIBAScontoRigo1.Enabled           := False;
       end;
      // ----- SCONTO RIGO 2 -----
       if PreventiviOrdiniForm.StmColSconto2.Checked then begin
          QRShapeScontoRigo2.Left           := XX;
          QRShapeScontoRigo2.Width          := 0;
          QRShapeScontoRigo2.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowScontoRigo2.Left        := XX;
          QRShapeRowScontoRigo2.Width       := 0;
          QRShapeRowDIBAScontoRigo2.Left    := XX;
          QRShapeRowDIBAScontoRigo2.Width   := 0;
          QRShapeBlankScontoRigo2.Left      := XX;
          QRShapeBlankScontoRigo2.Width     := 0;
          QRLabelScontoRigo2.Left           := XX + Sep;
          QRLabelScontoRigo2.Width          := PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Width;
          ScontoRigo2.Left                  := XX + Sep;
          ScontoRigo2.Width                 := PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Width;
          DIBAScontoRigo2.Left              := XX + Sep;
          DIBAScontoRigo2.Width             := PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeScontoRigo2;
       end else begin
          QRLabelScontoRigo2.Enabled        := False;
          QRShapeScontoRigo2.Enabled        := False;
          QRShapeRowScontoRigo2.Enabled     := False;
          QRShapeRowDIBAScontoRigo2.Enabled := False;
          QRShapeBlankScontoRigo2.Enabled   := False;
          ScontoRigo2.Enabled               := False;
          DIBAScontoRigo2.Enabled           := False;
       end;
      // ----- SCONTO RIGO 3-----
       if PreventiviOrdiniForm.StmColSconto3.Checked then begin
          QRShapeScontoRigo3.Left           := XX;
          QRShapeScontoRigo3.Width          := 0;
          QRShapeScontoRigo3.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowScontoRigo3.Left        := XX;
          QRShapeRowScontoRigo3.Width       := 0;
          QRShapeRowDIBAScontoRigo3.Left    := XX;
          QRShapeRowDIBAScontoRigo3.Width   := 0;
          QRShapeBlankScontoRigo3.Left      := XX;
          QRShapeBlankScontoRigo3.Width     := 0;
          QRLabelScontoRigo3.Left           := XX + Sep;
          QRLabelScontoRigo3.Width          := PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Width;
          ScontoRigo3.Left                  := XX + Sep;
          ScontoRigo3.Width                 := PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Width;
          DIBAScontoRigo3.Left              := XX + Sep;
          DIBAScontoRigo3.Width             := PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeScontoRigo3;
       end else begin
          QRLabelScontoRigo3.Enabled        := False;
          QRShapeScontoRigo3.Enabled        := False;
          QRShapeRowScontoRigo3.Enabled     := False;
          QRShapeRowDIBAScontoRigo3.Enabled := False;
          QRShapeBlankScontoRigo3.Enabled   := False;
          ScontoRigo3.Enabled               := False;
          DIBAScontoRigo3.Enabled           := False;
       end;
      // ----- IMPORTO RIGO -----
//       if (LO.ReadInteger(TipoDoc, 'Col_ImportoRigo', 2) > 1) then begin
       if PreventiviOrdiniForm.StmColImporto.Checked and PreventiviOrdiniForm.StmPrzIvaEscl.Checked then begin
          QRShapeImportoRigo.Left           := XX;
          QRShapeImportoRigo.Width          := 0;
          QRShapeImportoRigo.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowImportoRigo.Left        := XX;
          QRShapeRowImportoRigo.Width       := 0;
          QRShapeRowDIBAImportoRigo.Left    := XX;
          QRShapeRowDIBAImportoRigo.Width   := 0;
          QRShapeBlankImportoRigo.Left      := XX;
          QRShapeBlankImportoRigo.Width     := 0;
          QRLabelImportoRigo.Left           := XX + Sep;
          QRLabelImportoRigo.Width          := PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Width;
          ImportoRigo.Left                  := XX + Sep;
          ImportoRigo.Width                 := PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Width;
          DIBAImportoRigo.Left              := XX + Sep;
          DIBAImportoRigo.Width             := PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeImportoRigo;
       end else begin
          QRLabelImportoRigo.Enabled        := False;
          QRShapeImportoRigo.Enabled        := False;
          QRShapeRowImportoRigo.Enabled     := False;
          QRShapeRowDIBAImportoRigo.Enabled := False;
          QRShapeBlankImportoRigo.Enabled   := False;
          ImportoRigo.Enabled               := False;
          DIBAImportoRigo.Enabled           := False;
       end;
      // ----- IMPORTO RIGO IVA COMPRESA-----
//       if (LO.ReadInteger(TipoDoc, 'Col_ImportoRigoIVACompresa', 2) > 1) then begin
       if PreventiviOrdiniForm.StmColImporto.Checked and PreventiviOrdiniForm.StmPrzIvaComp.Checked then begin
          QRShapeImportoRigoIVACompresa.Left              := XX;
          QRShapeImportoRigoIVACompresa.Width             := 0;
          QRShapeImportoRigoIVACompresa.Height            := AltezzaLineeSeparazioneColonne;
          QRShapeRowImportoRigoIVACompresa.Left           := XX;
          QRShapeRowImportoRigoIVACompresa.Width          := 0;
          QRShapeRowDIBAImportoRigoIVACompresa.Left       := XX;
          QRShapeRowDIBAImportoRigoIVACompresa.Width      := 0;
          QRShapeBlankImportoRigoIVACompresa.Left         := XX;
          QRShapeBlankImportoRigoIVACompresa.Width        := 0;
          QRLabelImportoRigoIVACompresa.Left              := XX + Sep;
          QRLabelImportoRigoIVACompresa.Width             := PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Width;
          ImportoRigoIVACompresa.Left                     := XX + Sep;
          ImportoRigoIVACompresa.Width                    := PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Width;
          DIBAImportoRigoIVACompresa.Left                 := XX + Sep;
          DIBAImportoRigoIVACompresa.Width                := PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeImportoRigoIVACompresa;
       end else begin
          QRLabelImportoRigoIVACompresa.Enabled           := False;
          QRShapeImportoRigoIVACompresa.Enabled           := False;
          QRShapeRowImportoRigoIVACompresa.Enabled        := False;
          QRShapeRowDIBAImportoRigoIVACompresa.Enabled    := False;
          QRShapeBlankImportoRigoIVACompresa.Enabled      := False;
          ImportoRigoIVACompresa.Enabled                  := False;
          DIBAImportoRigoIVACompresa.Enabled              := False;
       end;
      // ----- CODICE IVA -----
       if PreventiviOrdiniForm.StmColCodiceIVA.Checked then begin
          QRShapeCodiceIVA.Left           := XX;
          QRShapeCodiceIVA.Width          := 0;
          QRShapeCodiceIVA.Height         := AltezzaLineeSeparazioneColonne;
          QRShapeRowCodiceIVA.Left        := XX;
          QRShapeRowCodiceIVA.Width       := 0;
          QRShapeRowDIBACodiceIVA.Left    := XX;
          QRShapeRowDIBACodiceIVA.Width   := 0;
          QRShapeBlankCodiceIVA.Left      := XX;
          QRShapeBlankCodiceIVA.Width     := 0;
          QRLabelCodiceIVA.Left           := XX + Sep;
          QRLabelCodiceIVA.Width          := PreventiviOrdiniForm.tvCorpoCODICEIVA.Width;
          CodiceIVA.Left                  := XX + Sep;
          CodiceIVA.Width                 := PreventiviOrdiniForm.tvCorpoCODICEIVA.Width;
          DIBACodiceIVA.Left              := XX + Sep;
          DIBACodiceIVA.Width             := PreventiviOrdiniForm.tvCorpoCODICEIVA.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoCODICEIVA.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeCodiceIVA;
       end else begin
          QRLabelCodiceIVA.Enabled        := False;
          QRShapeCodiceIVA.Enabled        := False;
          QRShapeRowCodiceIVA.Enabled     := False;
          QRShapeRowDIBACodiceIVA.Enabled := False;
          QRShapeBlankCodiceIVA.Enabled   := False;
          CodiceIVA.Enabled               := False;
          DIBACodiceIVA.Enabled           := False;
       end;
      // ----- DESCRIZIONE IVA -----
       if PreventiviOrdiniForm.StmColDescrizioneIVA.Checked then begin
          QRShapeDescrizioneIVA.Left              := XX;
          QRShapeDescrizioneIVA.Width             := 0;
          QRShapeDescrizioneIVA.Height            := AltezzaLineeSeparazioneColonne;
          QRShapeRowDescrizioneIVA.Left           := XX;
          QRShapeRowDescrizioneIVA.Width          := 0;
          QRShapeRowDIBADescrizioneIVA.Left       := XX;
          QRShapeRowDIBADescrizioneIVA.Width      := 0;
          QRShapeBlankDescrizioneIVA.Left         := XX;
          QRShapeBlankDescrizioneIVA.Width        := 0;
          QRLabelDescrizioneIVA.Left              := XX + Sep;
          QRLabelDescrizioneIVA.Width             := PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Width;
          DescrizioneIVA.Left                     := XX + Sep;
          DescrizioneIVA.Width                    := PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Width;
          DIBADescrizioneIVA.Left                 := XX + Sep;
          DIBADescrizioneIVA.Width                := PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeDescrizioneIVA;
       end else begin
          QRLabelDescrizioneIVA.Enabled           := False;
          QRShapeDescrizioneIVA.Enabled           := False;
          QRShapeRowDescrizioneIVA.Enabled        := False;
          QRShapeRowDIBADescrizioneIVA.Enabled    := False;
          QRShapeBlankDescrizioneIVA.Enabled      := False;
          DescrizioneIVA.Enabled                  := False;
          DIBADescrizioneIVA.Enabled              := False;
       end;
      // ----- NOTE RIGO -----
       if PreventiviOrdiniForm.StmColNote.Checked then begin
          QRShapeNoteRigo.Left            := XX;
          QRShapeNoteRigo.Width           := 0;
          QRShapeNoteRigo.Height          := AltezzaLineeSeparazioneColonne;
          QRShapeRowNoteRigo.Left         := XX;
          QRShapeRowNoteRigo.Width        := 0;
          QRShapeRowDIBANoteRigo.Left     := XX;
          QRShapeRowDIBANoteRigo.Width    := 0;
          QRShapeBlankNoteRigo.Left       := XX;
          QRShapeBlankNoteRigo.Width      := 0;
          QRLabelNoteRigo.Left            := XX + Sep;
          QRLabelNoteRigo.Width           := PreventiviOrdiniForm.tvCorpoNOTERIGO.Width;
          NoteRigo.Left                   := XX + Sep;
          NoteRigo.Width                  := PreventiviOrdiniForm.tvCorpoNOTERIGO.Width;
          DIBANoteRigo.Left               := XX + Sep;
          DIBANoteRigo.Width              := PreventiviOrdiniForm.tvCorpoNOTERIGO.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoNOTERIGO.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeNoteRigo;
       end else begin
          QRLabelNoteRigo.Enabled         := False;
          QRShapeNoteRigo.Enabled         := False;
          QRShapeRowNoteRigo.Enabled      := False;
          QRShapeRowDIBANoteRigo.Enabled  := False;
          QRShapeBlankNoteRigo.Enabled    := False;
          NoteRigo.Enabled                := False;
          DIBANoteRigo.Enabled            := False;
       end;
      // ----- PREZZO DI ACQUISTO (COSTO) -----
       if PreventiviOrdiniForm.StmColCostoUnitario.Checked then begin
          QRShapeCosto.Left            := XX;
          QRShapeCosto.Width           := 0;
          QRShapeCosto.Height          := AltezzaLineeSeparazioneColonne;
          QRShapeRowCosto.Left         := XX;
          QRShapeRowCosto.Width        := 0;
          QRShapeRowDIBACosto.Left     := XX;
          QRShapeRowDIBACosto.Width    := 0;
          QRShapeBlankCosto.Left       := XX;
          QRShapeBlankCosto.Width      := 0;
          QRLabelCosto.Left            := XX + Sep;
          QRLabelCosto.Width           := PreventiviOrdiniForm.tvCorpoPREZZOACQUISTOARTICOLO.Width;
          Costo.Left                   := XX + Sep;
          Costo.Width                  := PreventiviOrdiniForm.tvCorpoPREZZOACQUISTOARTICOLO.Width;
          DIBACosto.Left               := XX + Sep;
          DIBACosto.Width              := PreventiviOrdiniForm.tvCorpoPREZZOACQUISTOARTICOLO.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoPREZZOACQUISTOARTICOLO.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeCosto;
       end else begin
          QRLabelCosto.Enabled         := False;
          QRShapeCosto.Enabled         := False;
          QRShapeRowCosto.Enabled      := False;
          QRShapeRowDIBACosto.Enabled  := False;
          QRShapeBlankCosto.Enabled    := False;
          Costo.Enabled                := False;
          DIBACosto.Enabled            := False;
       end;
      // ----- MARGINE -----
       if PreventiviOrdiniForm.StmColRicarico.Checked then begin
          QRShapeMargine.Left            := XX;
          QRShapeMargine.Width           := 0;
          QRShapeMargine.Height          := AltezzaLineeSeparazioneColonne;
          QRShapeRowMargine.Left         := XX;
          QRShapeRowMargine.Width        := 0;
          QRShapeRowDIBAMargine.Left     := XX;
          QRShapeRowDIBAMargine.Width    := 0;
          QRShapeBlankMargine.Left       := XX;
          QRShapeBlankMargine.Width      := 0;
          QRLabelMargine.Left            := XX + Sep;
          QRLabelMargine.Width           := PreventiviOrdiniForm.tvCorpoMARGINE.Width;
          Margine.Left                   := XX + Sep;
          Margine.Width                  := PreventiviOrdiniForm.tvCorpoMARGINE.Width;
          DIBAMargine.Left               := XX + Sep;
          DIBAMargine.Width              := PreventiviOrdiniForm.tvCorpoMARGINE.Width;
          XX := XX + PreventiviOrdiniForm.tvCorpoMARGINE.Width + (Sep * 2);
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeMargine;
       end else begin
          QRLabelMargine.Enabled         := False;
          QRShapeMargine.Enabled         := False;
          QRShapeRowMargine.Enabled      := False;
          QRShapeRowDIBAMargine.Enabled  := False;
          QRShapeBlankMargine.Enabled    := False;
          Margine.Enabled                := False;
          DIBAMargine.Enabled            := False;
       end;
      // ----- IMPORTO MARGINE -----
       if PreventiviOrdiniForm.StmColRicaricoImporto.Checked then begin
          QRShapeImportoMargine.Left            := XX;
          QRShapeImportoMargine.Width           := 0;
          QRShapeImportoMargine.Height          := AltezzaLineeSeparazioneColonne;
          QRShapeRowImportoMargine.Left         := XX;
          QRShapeRowImportoMargine.Width        := 0;
          QRShapeRowDIBAImportoMargine.Left     := XX;
          QRShapeRowDIBAImportoMargine.Width    := 0;
          QRShapeBlankImportoMargine.Left       := XX;
          QRShapeBlankImportoMargine.Width      := 0;
          QRLabelImportoMargine.Left            := XX + Sep;
          QRLabelImportoMargine.Width           := PreventiviOrdiniForm.tvCorpoIMPORTOMARGINE.Width;
          ImportoMargine.Left                   := XX + Sep;
          ImportoMargine.Width                  := PreventiviOrdiniForm.tvCorpoIMPORTOMARGINE.Width;
          DIBAImportoMargine.Left               := XX + Sep;
          DIBAImportoMargine.Width              := PreventiviOrdiniForm.tvCorpoIMPORTOMARGINE.Width;
  //        XX := XX + QRShapeImportoMargine.Width;
          // Memorizza in queste variabili il riferimento all'ultima colonna elaborata in modo che alla fine possa estenderla fino alla fine della riga
          LastTitleShape  := QRShapeImportoMargine;
       end else begin
          QRLabelImportoMargine.Enabled         := False;
          QRShapeImportoMargine.Enabled         := False;
          QRShapeRowImportoMargine.Enabled      := False;
          QRShapeRowDIBAImportoMargine.Enabled  := False;
          QRShapeBlankImportoMargine.Enabled    := False;
          ImportoMargine.Enabled                := False;
          DIBAImportoMargine.Enabled            := False;
       end;
      // ----- FINALE -----
      // IMposta la posizione fissa al bordo dx degli shapes finali della riga
      QRShapeFinale.Left          := RIGHTBORDER;
      QRShapeFinale.Width         := 0;
      QRShapeFinale.Height        := AltezzaLineeSeparazioneColonne;
      QRShapeRowFinale.Left       := RIGHTBORDER;
      QRShapeRowFinale.Width      := 0;
      QRShapeRowDIBAFinale.Left   := RIGHTBORDER;
      QRShapeRowDIBAFinale.Width  := 0;
      QRShapeBlankFinale.Left     := RIGHTBORDER;
      QRShapeBlankFinale.Width    := 0;
      // IMposta posizione della riga verticale sopra l'intestazione delle colonne
      QRShapeTopIntestazioneColonne.Top   := 0;
      QRShapeTopIntestazioneColonne.Left  := LEFTBORDER;
      QRShapeTopIntestazioneColonne.Width := RIGHTBORDER - LEFTBORDER;
      // ----- COLORA IL MODULO -----
       DM1.ColoreModulo(QuickReport1,
                        DM1.StrToColor(LO.ReadString(TipoDoc, 'Colore1', 'clBlue'), clBlue),
                        DM1.StrToColor(LO.ReadString(TipoDoc, 'Colore2', 'clBlue'), clBlue),
                        LO.ReadInteger(TipoDoc, 'SpessoreLinee', 3),
                        ForzaAltezzaShape, ForzaDiminuzioneLarghezzaShape);
     // ---------------------------------------------------------------------------------------------------
   finally
     LO.Free;
   end;

   // ===================================================================================================
   // Se il parametro ForzaAltezzaShape > 1 rende invisibili tutte le linee verticali del corpo documento
   // ---------------------------------------------------------------------------------------------------
   //  NB: Solo se non è stato specificato (in layouts.ini) il parametro ForzaAltezzaShape altrimenti sballa tutto
   //  NB: Solo se non è abilitato il Testo finale di un preventivo, nel qual caso rende invisibili le linee verticali
   //       perchè alla fine del corpo visualizza il testo e poi basta.
   if (ForzaAltezzaShape <> -1) or AbilitaTestoFinale then begin
      // Rende invisibili tutte le linee verticali del corpo documento
      for i := 0 to QRSubDetail1.COntrolCount - 1 do begin
         if QRSubDetail1.Controls[i] is TQRShape then begin
            if DM1.StrLeft((QRSubDetail1.Controls[i] as TQRShape).Name, 10) = 'QRShapeRow' then begin
               (QRSubDetail1.Controls[i] as TQRShape).Enabled := False;
            end;
         end;
      end;
      for i := 0 to QRSubDetail2.COntrolCount - 1 do begin
         if QRSubDetail2.Controls[i] is TQRShape then begin
            if DM1.StrLeft((QRSubDetail2.Controls[i] as TQRShape).Name, 10) = 'QRShapeRow' then begin
               (QRSubDetail2.Controls[i] as TQRShape).Enabled := False;
            end;
         end;
      end;
      for i := 0 to QRBandUltimaPagina.COntrolCount - 1 do begin
         if QRBandUltimaPagina.Controls[i] is TQRShape then begin
            if DM1.StrLeft((QRBandUltimaPagina.Controls[i] as TQRShape).Name, 12) = 'QRShapeBlank' then begin
               (QRBandUltimaPagina.Controls[i] as TQRShape).Enabled := False;
            end;
         end;
      end;
   end;
   // ===================================================================================================
end;






procedure TQReportPreventiviOrdini.QRDBText16Print(sender: TObject;
  var Value: String);
begin
   (Sender as TQRDBText).Font.Color := clBlack;
   if (PreventiviOrdiniForm.QryDocumentoTotaleImponibile1.Value = 0)or(not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportPreventiviOrdini.QRDBText31Print(sender: TObject;
  var Value: String);
begin
   (Sender as TQRDBText).Font.Color := clBlack;
   if (PreventiviOrdiniForm.QryDocumentoTotaleImponibile2.Value = 0)or(not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportPreventiviOrdini.QRDBText37Print(sender: TObject;
  var Value: String);
begin
   (Sender as TQRDBText).Font.Color := clBlack;
   if (PreventiviOrdiniForm.QryDocumentoTotaleImponibile3.Value = 0)or(not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportPreventiviOrdini.QRDBText43Print(sender: TObject;
  var Value: String);
begin
   (Sender as TQRDBText).Font.Color := clBlack;
   if (PreventiviOrdiniForm.QryDocumentoTotaleImponibile4.Value = 0)or(not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;

procedure TQReportPreventiviOrdini.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  i: Integer;
begin
   // POsiziona correttamente lo shape della linea di separazione orizzontale tra sezioni
   QRShapeLineaSeperazioneSezioni.Top := QRShapeSfondoRigo.Top;
   // Se la lettura facilitata è abilitata...
   //  E se non si tratta di una sessione solo di preparazione...
   if LetturaFacilitata and not Preparing then begin
      // Dimensiona corretamente lo shape e lo colora a righe alternate
      QRShapeSfondoRigo.Left        := 28;
      QRShapeSfondoRigo.Width       := 688;
      QRShapeSfondoRigo.Pen.Style   := psClear;
      QRShapeSfondoSottorigo.Left   := 28;
      QRShapeSfondoSottorigo.Width  := 688;
      QRShapeSfondoSottorigo.Pen.Style := psClear;
      // Adegua l'altezza dello shape di sfondo della lettura facilitata per compensare eventuali
      //  espansioni della banda verso il basso in seguito alla presenza di un articolo con descrizione
      //  molto lunga,
      //  Alla fine ho messo il "+5" perchè altrimenti rimale una riga bianca tra i vari shapes
      QRShapeSfondoRigo.Size.Height               := QRSubDetail1.Size.Height + PreventiviOrdiniForm.RowsExpanded[REIndex] + 5;
      QRShapeRowCodiceArticolo.Size.Height             := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowDescrizione.Size.Height                := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowPrezzoUnitario.Size.Height             := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowPrezzoUnitarioIVACompresa.Size.Height  := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowPrzUnitNetto.Size.Height               := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowUnitaDiMisura.Size.Height              := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowQTA.Size.Height                        := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowQTAEvasa.Size.Height                   := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowQTAResidua.Size.Height                 := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowScontoRigo1.Size.Height                := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowScontoRigo2.Size.Height                := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowScontoRigo3.Size.Height                := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowImportoRigo.Size.Height                := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowImportoRigoIVACompresa.Size.Height     := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowCodiceIVA.Size.Height                  := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowDescrizioneIVA.Size.Height             := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowNoteRigo.Size.Height                   := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowCosto.Size.Height                      := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowMargine.Size.Height                    := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowImportoMargine.Size.Height             := QRShapeSfondoRigo.Size.Height + 5;
      QRShapeRowFinale.Size.Height                     := QRShapeSfondoRigo.Size.Height + 5;
      Inc(REIndex);
   end else begin
      QRShapeSfondoRigo.Enabled             := False;
      QRShapeSfondoSottorigo.Enabled        := False;
   end;
end;

procedure TQReportPreventiviOrdini.QRBandUltimaPaginaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
   i : Integer;
   AltezzaLinee: Integer;
begin
  // Se stampa questa banda significa che stà stampando l'ultima pagina e quindi imposta
  //  il flag 'UltimaPagina' in modo che vengano stampati i totali del documento che altrimenti
  //  non verrebbero stampati.
  UltimaPagina := True;
  // CIcla per tutti i componenti di tipo TQRShape che hanno il nome che comincia per QRShapeBlank che identifica gli shape che formano
  //  le righe verticali del corpo documento e ne calcola l'altezza in modo che arrivino alla fine del corpo ma non finiscano alla fine in basso sul modulo
  //  NB: Solo se non è stato specificato (in layouts.ini) il parametro ForzaAltezzaShape altrimenti sballa tutto
  if ForzaAltezzaShape = -1 then begin
     AltezzaLinee := Round((LUNG_PAGINA_IN_STAMPA - QuickReport1.CurrentY) / RAPPORTO_PIXELSCHERMO_PIXELSTAMPA);
     for i := 0 to QRBandUltimaPagina.COntrolCount - 1 do begin
        if QRBandUltimaPagina.Controls[i] is TQRShape then begin
           if DM1.StrLeft((QRBandUltimaPagina.Controls[i] as TQRShape).Name, 12) = 'QRShapeBlank' then begin
              (QRBandUltimaPagina.Controls[i] as TQRShape).Height := AltezzaLinee;
           end;
        end;
     end;
  end;
end;

procedure TQReportPreventiviOrdini.QRDBText85Print(sender: TObject;
  var Value: String);
begin
   (Sender as TQRDBText).Font.Color := clBlack;
   if not UltimaPagina then begin
     (Sender as TQRDBText).Font.Color := (Sender as TQRDBText).Color;
   end;
end;


function TQReportPreventiviOrdini.CalcolaPrezzoUnitarioNetto(DC:TcxCustomDataController; RI:Integer): String;
var
  PrzUnit: Currency;
begin
  Result := '';
  PrzUnit := 0;
  if  (not VarIsNull(DC.Values[RI,PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Index]))
  and (not VarIsNull(DC.Values[RI,PreventiviOrdiniForm.tvCorpoQTA.Index]))
  and (DC.Values[RI,PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Index] <> 0)
  and (DC.Values[RI,PreventiviOrdiniForm.tvCorpoQTA.Index] <> 0)
  then begin
    PrzUnit := DM1.Arrotonda(  (DC.Values[RI,PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Index] / DC.Values[RI, PreventiviOrdiniForm.tvCorpoQTA.Index])  , DM1.DecMicroPrz);
    Result :='(' + CurrToStrF(PrzUnit, ffCurrency, DM1.DecMicroPrz) + ')';
  end;
end;


procedure TQReportPreventiviOrdini.QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
var
  V,HH,MM:Integer;
  LImportiFontColor, LDescrizFontColor: TColor;
  LImportiFontStyle, LDescrizFontStyle: TFontStyles;
  LRowType: String;
  LPrintImports: Boolean;
  // IMposta font
  procedure SetFontStyles;
  begin
    // Font color
    PrezzoUnitario.Font.Color := LImportiFontColor;
    PrezzoUnitarioIVACompresa.Font.Color := LImportiFontColor;
//    PrezzoUnitarioNetto.Font.Color := LFontColor;
    ScontoRigo1.Font.Color := LImportiFontColor;
    ScontoRigo2.Font.Color := LImportiFontColor;
    ScontoRigo3.Font.Color := LImportiFontColor;
    ImportoRigo.Font.Color := LImportiFontColor;
    ImportoRigoIVACompresa.Font.Color := LImportiFontColor;
    Costo.Font.Color := LImportiFontColor;
    Margine.Font.Color := LImportiFontColor;
    ImportoMargine.Font.Color := LImportiFontColor;
    CodiceIVA.Font.Color := LImportiFontColor;
    DescrizioneIVA.Font.Color := LImportiFontColor;

    CodiceArticolo.Font.Color := LDescrizFontColor;
    Descrizione.Font.Color := LDescrizFontColor;
    UnitaDiMisura.Font.Color := LDescrizFontColor;
    QTA.Font.Color := LDescrizFontColor;
    QTAEvasa.Font.Color := LDescrizFontColor;
    QTAResidua.Font.Color := LDescrizFontColor;
    NoteRigo.Font.Color := LDescrizFontColor;

    // Font style
    PrezzoUnitario.Font.Style := LImportiFontStyle;
    PrezzoUnitarioIVACompresa.Font.Style := LImportiFontStyle;
//    PrezzoUnitarioNetto.Font.Style := LFontStyle;
    ScontoRigo1.Font.Style := LImportiFontStyle;
    ScontoRigo2.Font.Style := LImportiFontStyle;
    ScontoRigo3.Font.Style := LImportiFontStyle;
    ImportoRigo.Font.Style := LImportiFontStyle;
    ImportoRigoIVACompresa.Font.Style := LImportiFontStyle;
    Costo.Font.Style := LImportiFontStyle;
    Margine.Font.Style := LImportiFontStyle;
    ImportoMargine.Font.Style := LImportiFontStyle;
    CodiceIVA.Font.Style := LImportiFontStyle;
    DescrizioneIVA.Font.Style := LImportiFontStyle;

    CodiceArticolo.Font.Style := LDescrizFontStyle;
    Descrizione.Font.Style := LDescrizFontStyle;
    UnitaDiMisura.Font.Style := LDescrizFontStyle;
    QTA.Font.Style := LDescrizFontStyle;
    QTAEvasa.Font.Style := LDescrizFontStyle;
    QTAResidua.Font.Style := LDescrizFontStyle + [fsBold];
    NoteRigo.Font.Style := LDescrizFontStyle;

    // Stampa o meno gli importi in secondo piano
    PrezzoUnitario.Enabled := LPrintImports and QRLabelPrezzoUnitario.Enabled;
    PrezzoUnitarioIVACompresa.Enabled := LPrintImports and QRLabelPrezzoUnitarioIVACompresa.Enabled;
    PrezzoUnitarioNetto.Enabled := LPrintImports and QRLabelPrzUnitNetto.Enabled;
    ScontoRigo1.Enabled := LPrintImports and QRLabelScontoRigo1.Enabled;
    ScontoRigo2.Enabled := LPrintImports and QRLabelScontoRigo2.Enabled;
    ScontoRigo3.Enabled := LPrintImports and QRLabelScontoRigo3.Enabled;
    ImportoRigo.Enabled := LPrintImports and QRLabelImportoRigo.Enabled;
    ImportoRigoIVACompresa.Enabled := LPrintImports and QRLabelImportoRigoIVACompresa.Enabled;
    Costo.Enabled := LPrintImports and QRLabelCosto.Enabled;
    Margine.Enabled := LPrintImports and QRLabelMargine.Enabled;
    ImportoMargine.Enabled := LPrintImports and QRLabelImportoMargine.Enabled;
    CodiceIVA.Enabled := LPrintImports and QRLabelCodiceIVA.Enabled;
    DescrizioneIVA.Enabled := LPrintImports and QRLabelDescrizioneIVA.Enabled;
  end;
  // ClearPrintValues
  procedure ClearPrintValues;
  begin
    QRShapeLineaSeperazioneSezioni.Enabled := False;
    CodiceArticolo.Caption            := '';
    Descrizione.Caption               := '';
    UnitaDiMisura.Caption             := '';
    QTA.Caption                       := '';
    QTAEvasa.Caption                  := '';
    QTAResidua.Caption                := '';
    CodiceIVA.Caption                 := '';
    DescrizioneIVA.Caption            := '';
    NoteRigo.Caption                  := '';
    Costo.Caption                     := '';
    Margine.Caption                   := '';
    ImportoMargine.Caption            := '';
    PrezzoUnitario.Caption            := '';
    PrezzoUnitarioIVACompresa.Caption := '';
    PrezzoUnitarioNetto.Caption       := '';
    ScontoRigo1.Caption               := '';
    ScontoRigo2.Caption               := '';
    ScontoRigo3.Caption               := '';
    ImportoRigo.Caption               := '';
    ImportoRigoIVACompresa.Caption    := '';
  end;
  // SetColorShapeLetturaFacilitata
  procedure SetColorShapeLetturaFacilitata(const ForceWhite:Boolean);
  begin
    if (QRShapeSfondoRigo.Tag <> 901) or ForceWhite then
    begin
     QRShapeSfondoRigo.Brush.Color      := clWhite;
     QRShapeSfondoSottorigo.Brush.Color := clWhite;
     QRShapeSfondoRigo.Tag := 901;
    end
    else
    begin
     QRShapeSfondoRigo.Brush.Color      := $00E6E6E6;
     QRShapeSfondoSottorigo.Brush.Color := $00E6E6E6;
     QRShapeSfondoRigo.Tag              := 900;
    end;
  end;
  // Stampa GroupHeader
  procedure PrintGroupHeader;
  var
    LGroupIndex: Integer;
    LImporto: Currency;
  begin
    // Setta il colore dello shape di sfondo per la lettura facilitata
    // NB: Forza lo sfondo a bianco per rendere più evidente il group header
    SetColorShapeLetturaFacilitata(True);
    // Fonts
    Descrizione.Font.Color := TipoDocumentoGrande.Font.Color;
    ImportoRigo.Font.Color := TipoDocumentoGrande.Font.Color;
    ImportoRigoIVACompresa.Font.Color := TipoDocumentoGrande.Font.Color;
    Descrizione.Font.Style := [fsBold, fsItalic];
    ImportoRigo.Font.Style := [fsBold, fsItalic];
    ImportoRigoIVACompresa.Font.Style := [fsBold, fsUnderline];
    // Descrizione
    Descrizione.Caption := MasterViewData.Rows[RowIndex].DisplayTexts[PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index];
    // Import rigo
    LGroupIndex := MDC.Groups.DataGroupIndexByRowIndex[RowIndex];
    if LGroupIndex <> -1 then
    begin
      LImporto := MDC.Summary.GroupSummaryValues[LGroupIndex, MasterViewData.Rows[RowIndex].AsGroupRow.GroupSummaryItems.ItemOfItemLink(PreventiviOrdiniForm.tvCorpoIMPORTORIGO).Index];
      ImportoRigo.Caption := '(' + CurrToStrF(LImporto, ffCurrency, DM1.DecMicroPrz) + ')';
      LImporto := MDC.Summary.GroupSummaryValues[LGroupIndex, MasterViewData.Rows[RowIndex].AsGroupRow.GroupSummaryItems.ItemOfItemLink(PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA).Index];
      ImportoRigoIVACompresa.Caption := '(' + CurrToStrF(LImporto, ffCurrency, DM1.DecMicroPrz) + ')';
    end;
    // Stampa la linea di separazione orizzontale che separa le diverse sezioni
    QRShapeLineaSeperazioneSezioni.Enabled := True;
  end;
begin

  // Converte il RowIndex nel RecordIndex
  if RowIndex < MasterViewData.RowCount then
    RI := MasterViewData.Rows[RowIndex].RecordIndex;

  // Se stiamo stampando un intervento e si vuole stampare anche la relazione nel corpo documento
  //  e ovviamente una relazione esiste allora imposta i flag che attivano appunto la stampa
  //  della relazione intervento, in seguito il testo verrà caricato sul memo apposito usato
  //  per la suddivisione delle descrizioni delle righe in singole righe (PreventiviOrdiniiForm.RE)
  //  per la succesisva stampa
  //  NB: Mentre stampa la relazione disabilita il controllo se si tratta di un rigo di manodopera
  //       perchè potrebbe dare fastidio
  //  NB: Oltre alla relazione di intervento stampa anche un riferimento al RifDoc se presente
  if PreventiviOrdiniForm.IsImpegno and (ImpegnoForm <> nil)
  and ((Trim(ImpegnoForm.QryImpRELAZIONEINTERVENTO.AsString) <> '') or (PreventiviOrdiniForm.QryDocumentoRIFDOC_NUM.AsInteger > 0))
  and not FRelazioneInterventoStampata then
  begin
    FRelazioneInterventoDaStampare := True
  end
  else
  begin
    //  NB: Se però è un rigo di manodopera ed è impostato per non stampare i righi di manodopera...
    while (not fStampaManodopera)
    and DM1.CodiceIsManodopera(  MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoCODICEARTICOLOSTM.Index]  )
    and (RowIndex < MasterViewData.RowCount)
    do
    begin
      // Passa al rigo sucessivo
      inc(RowIndex);
      // Converte il RowIndex nel RecordIndex
      if RowIndex < MasterViewData.RowCount then
        RI := MasterViewData.Rows[RowIndex].RecordIndex;
    end;
  end;

  // Se è stata raggiunta la fine del documento...
  //  NB: Per qualche motivo non stampava l'ultima riga e per risolvere il problema ho fatto in modo che
  //       il codice chiamante, prima di lanciare la stampa, aggiungesse un record vuoto che verrà
  //       eliminato alla fine.
  if RowIndex >= MasterViewData.RowCount then
  begin
    MoreData := False;
    Exit;
  end;

  // ------------------------------------------
  // Imposta il tipo di font in base al tipo di rigo e alla sitauzione...
  LRowType := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoROWTYPE.Index];
  LImportiFontStyle := [];
  LDescrizFontStyle := [];
  LImportiFontColor := clBlack;
  LDescrizFontColor := clBlack;
  LPrintImports := (MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoROWPRINTPRICES.Index] = 'True') or (RightStr(LRowType, 1) <> TIPORIGODOC_CHAR_GRAYED);
  if RightStr(LRowType, 1) = TIPORIGODOC_CHAR_GRAYED then
  begin
    LImportiFontColor := clGray;
    LImportiFontStyle := [fsItalic];
  end
  else
  // Se si tratta di una riga di riepilogo con gli importi relativi ai beni significativi
  //  allora imposta il grassetto per evidenziarle.
  if (LRowType = TIPORIGODOC_BS_IvaAgevolata)
  or (LRowType = TIPORIGODOC_BS_IvaOrdinaria)
  or (LRowType = TIPORIGODOC_BS_AltriCosti)
  or (LRowType = TIPORIGODOC_TC_Totale)
  then
  begin
    LImportiFontStyle := [fsBold];
    LDescrizFontStyle := [fsBold];
  end;
  // Applica le impostazioni sui fonts appropriati
  SetFontStyles;
  // Se si tratta di un rigo riepilogativo di beni significativi e non significativi
  //  nasconde i campi Qtà, e i prezzi unitari
  QTA.Enabled := not ((LRowType = TIPORIGODOC_BS_IvaAgevolata) or (LRowType = TIPORIGODOC_BS_IvaOrdinaria) or (LRowType = TIPORIGODOC_BS_AltriCosti));
  QTA.Enabled := QTA.Enabled and QRLabelQTA.Enabled;
  PrezzoUnitario.Enabled := QTA.Enabled and QRLabelPrezzoUnitario.Enabled and LPrintImports;
  PrezzoUnitarioIVACompresa.Enabled := QTA.Enabled and QRLabelPrezzoUnitarioIVACompresa.Enabled and LPrintImports;
  // ------------------------------------------

   // Ripulisce tutti i campi
   ClearPrintValues;

   // Se stiamo stampando un Group Header (Sezione)...
   if (MasterViewData.Rows[RowIndex] is TcxGridGroupRow) then
     PrintGroupHeader
   // Altrimenti stiamo stampando un rigo normale (non group header) quindi prosegue normalmente
   else
   begin
     // Se DescLineIndex = 0 significa che stiamo iniziando a stampare un nuovo rigo di documento
     //  e quindi provvede a caricare nell'apposito Memo dove costruisco la stampa della descrizione
     //  il testo completo della descrizione della riga attuale in modo poi da poterla  leggere
     //  e stampare riga per riga.
     if fDescLineIndex = 0 then
     begin
       PreventiviOrdiniForm.RE.Width := PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Width;
       PreventiviOrdiniForm.RE.Clear;
       // Se stiamo stampando la relazione di un intervento allora carica questa, altrimenti
       //  carica il rigo normale
       if FRelazioneInterventoDaStampare and not FRelazioneInterventoStampata then
       begin
         PreventiviOrdiniForm.RE.Text := ImpegnoForm.QryImpRELAZIONEINTERVENTO.AsString;
         // Se c'è anche un RifDoc allora inserisce anche un riferimento a esso
         if PreventiviOrdiniForm.QryDocumentoRIFDOC_NUM.AsInteger > 0 then
         begin
           var LRifDoc: String;
           LRifDoc := Format('%s %s%s', [PreventiviOrdiniForm.QryDocumentoRIFDOC_TIPO.AsString, PreventiviOrdiniForm.QryDocumentoRIFDOC_NUM.AsString, PreventiviOrdiniForm.QryDocumentoRIFDOC_REG.AsString]);
           if not PreventiviOrdiniForm.QryDocumentoRIFDOC_DATA.IsNull then
             LRifDoc := Format('%s del %s', [LRifDoc, PreventiviOrdiniForm.QryDocumentoRIFDOC_DATA.AsString]);
           PreventiviOrdiniForm.RE.Lines.Insert(0,LRifDoc.Trim);
         end;
       end
       else
         PreventiviOrdiniForm.RE.Text := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index];
     end;

     // Carica i dati del rigo corrente
     //  NB: Solo se stiamo stampando la prima riga della descrizione stampa anche gli altri campi
     //       altrimenti no.
     Descrizione.Caption := PreventiviOrdiniForm.RE.Lines[fDescLineIndex];
     if fDescLineIndex = 0 then
     begin
       if FRelazioneInterventoStampata or not FRelazioneInterventoDaStampare then
       begin
         CodiceArticolo.Caption            := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoCODICEARTICOLOSTM.Index];
         UnitaDiMisura.Caption             := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Index];
         QTA.Caption                       := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoQTA.Index];
         QTAEvasa.Caption                  := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoQTAEVASA.Index];
         QTAResidua.Caption                := CalcolaQtaResiduaTxt(MDC.Values[RI, PreventiviOrdiniForm.tvCorpoQTA.Index], MDC.Values[RI, PreventiviOrdiniForm.tvCorpoQTAEVASA.Index]);
         CodiceIVA.Caption                 := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoCODICEIVA.Index];
         DescrizioneIVA.Caption            := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Index];
         NoteRigo.Caption                  := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoNOTERIGO.Index];
         Costo.Caption                     := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoPREZZOACQUISTOARTICOLO.Index];
         Margine.Caption                   := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoMARGINE.Index];
         ImportoMargine.Caption            := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoIMPORTOMARGINE.Index];
         // Carica i dati degli importi che non devono venire stampati per niente se = 0
         PrezzoUnitario.Caption            := DM1.DisplayTextsBlankIfZero(MDC, RI, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Index);
         PrezzoUnitarioIVACompresa.Caption := DM1.DisplayTextsBlankIfZero(MDC, RI, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Index);
         PrezzoUnitarioNetto.Caption       := CalcolaPrezzoUnitarioNetto(MDC, RI);
         ScontoRigo1.Caption               := DM1.DisplayTextsBlankIfZero(MDC, RI, PreventiviOrdiniForm.tvCorpoSCONTORIGO.Index);
         ScontoRigo2.Caption               := DM1.DisplayTextsBlankIfZero(MDC, RI, PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Index);
         ScontoRigo3.Caption               := DM1.DisplayTextsBlankIfZero(MDC, RI, PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Index);
         // Per l'importo del rigo se sto stampando i righi di agevolazione relativi ai beni significativi scrive sempre l'importo anche se = 0
         if (LRowType = TIPORIGODOC_BS_IvaAgevolata) or (LRowType = TIPORIGODOC_BS_IvaOrdinaria) or (LRowType = TIPORIGODOC_BS_AltriCosti) then
         begin
           ImportoRigo.Caption := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Index];
           ImportoRigoIVACompresa.Caption := MDC.DisplayTexts[RI, PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Index];
         end
         else
         begin
           ImportoRigo.Caption               := DM1.DisplayTextsBlankIfZero(MDC, RI, PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Index);
           ImportoRigoIVACompresa.Caption    := DM1.DisplayTextsBlankIfZero(MDC, RI, PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Index);
         end;
       end;
       // Setta il colore dello shape di sfondo per la lettura facilitata
       // NB: se stiamo stampando una riga del campo descrizione successiva alla prima
       //     non fa cambiare colore allo shape di sfondo della lettura facilitata.
       SetColorShapeLetturaFacilitata(False);
     end;
     // Se ci sono altre rige della descrizione da stampare, prosegue con la prossima
     //  facendo avanzare l'indice che punta alla riga di descrizione attuale.
     if fDescLineIndex < (PreventiviOrdiniForm.RE.Lines.Count -1) then
     begin
       // Avanza l'indice
       inc(fDescLineIndex);
       MoreData := True;
       // Imposta un'altezza della rigo minore del solito per evidenziare che
       //  si tratta dello stesso articolo
       (Sender as TQRSubDetail).Height := 14;
       Exit;
     end
     else
     // Se invece non ci sono altre righe di descrizione da stampare, prosegue
     //  con il prossimo rigo di documento.
     begin
       // Azzera l'indice che indica quale riga della descrizione del rigo corrente si sta stampando
       fDescLineIndex := 0;
       // Controlla se il rigo corrente possiede dei sottorighi e in base a questo autorizza o meno
       //  la stampa de sottorighi stessi.
       //  NB: Ho dovuto mettere il controllo perchè altrimenti dava un errore dovuto probabilmente
       //       allo sforamento della dimensione della lista ViewData.Rows.
       if (RI < (MDC.RecordCount) - 1) then
         VaiStampaSottorighi := DM1.CheckIfExpandable(MDC, RI, False)
       else
         VaiStampaSottorighi := False;
       // Se la stampa dei sottorighi è autorizzata, azzera l'indice di accesso ai sottorighi
       //  e imposta OperaEsistente a 1 se il rigo attuale contiene anche una QTà di mano d'opera
       //  > 0 (quindi deve stampare il rigo della mano'dopera, altrimenti imposta 0
       if VaiStampaSottorighi then
       begin
          DDC := MDC.GetDetailDataController(RI,0);
          DRI := 0;
       end;
     end;
   end;

  // Passa al rigo sucessivo
  //  NB: Se ha appena finito di stampare la relazione intervento ovviamente non passa
  //       al prossimo rigo
  if FRelazioneInterventoStampata or not FRelazioneInterventoDaStampare then
    inc(RowIndex);
  // Se arriva qui significa che in ogni caso l'eventuale stampa della relazione intervento
  //  è terminata
  FRelazioneInterventoStampata := True;
  // Se è l'ultimo rigo finisce
  //  NB: IL controllo se è l'ultimo rigo è stato spostato all'inizio
  MoreData := True;
  // Imposta un'altezza della rigo superiore del solito per evidenziare che
  //  si tratta di un altro articolo
  (Sender as TQRSubDetail).Height := 18;
end;



procedure TQReportPreventiviOrdini.ChildPagamentoBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabelPagamento.Caption := PreventiviOrdiniForm.DescrizionePagamento.Text;
end;

function TQReportPreventiviOrdini.CalcolaQtaResiduaTxt(AQta, AQtaEvasa: Variant): String;
begin
  // Init
  if VarIsNull(AQta) then
    AQta := 0;
  if VarIsNull(AQtaEvasa) then
    AQtaEvasa := 0;
  // Ovvio che siccome tutto si basa sulla Qtà, se questa è nulla, esce subito
  if AQta = 0 then
    Exit('0');
  Result := FloatToStr(AQta - AQtaEvasa);
end;

procedure TQReportPreventiviOrdini.ChildBancaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabelBanca.Caption    := PreventiviOrdiniForm.Banca.Text;
   QRLabelABI.Caption      := PreventiviOrdiniForm.ABI.Text;
   QRLabelCAB.Caption      := PreventiviOrdiniForm.CAB.Text;
   QRLabelBIC.Caption      := PreventiviOrdiniForm.BIC.Text;
end;

procedure TQReportPreventiviOrdini.ChildDestinatario2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   // --------------------------------------------------------------------------
   // NB: Solo se è abilitato il testo finale e quindi siamo con il piede modbile
   if fAbilitaPiedeMobile then begin
     // Memorizza nella struttura apposita i dati iniziali sulla posizione di questa banda
     //  per il successivo calcolo dei fattori di conversione.
     if (Sender.ParentReport.PageNumber = 1) and Preparing then begin
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.StartAvailableSpace  := Sender.ParentReport.AvailableSpace;
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.StartCurrentY        := Sender.ParentReport.CurrentY;
     end;
   end;
   // --------------------------------------------------------------------------

   // ================================================================================================
   // CONTROLLO ESISTENZA DATI INTESTATARIO DOCUMENTO
   // ------------------------------------------------------------------------------------------------
   // Se non esistono CAP e Città non visualizza il trattino che li divide
   QRLabelTrattinoIntestatario2.Enabled := (PreventiviOrdiniForm.QryDocumentoCAPCli.AsString <> '')
                                           and (PreventiviOrdiniForm.QryDocumentoCittaCli.AsString <> '');
   // Visualizza le parentesi solo se la provincia è presente
   QRLabelParentesiApertaIntestatario2.Enabled := PreventiviOrdiniForm.QryDocumentoProvinciaCli.AsString <> '';
   QRLabelParentesiChiusaIntestatario2.Enabled := QRLabelParentesiApertaIntestatario2.Enabled;
   // Visualizza la descrizione della partita IVA solo se quest'ultima esiste
//   QRLabelPIVA.Enabled := PreventiviOrdiniForm.QryDocumentoPartitaIVACli.AsString <> '';
//   QRLabelCF.Enabled := PreventiviOrdiniForm.QryDocumentoCodiceFiscaleCli.AsString <> '';
   // ================================================================================================


   // ================================================================================================
   // CONTROLLO ESISTENZA DATI LUOGO DESTINAZIONE MERCI
   // ------------------------------------------------------------------------------------------------
   // Se non esistono CAP e Città destinazione merci non visualizza il trattino che li divide
   QRLabelTrattinoLuogoDestinazione2.Enabled := (PreventiviOrdiniForm.QryDocumentoCAPDestMerci.AsString <> '')
                                           and (PreventiviOrdiniForm.QryDocumentoCittaDestMerci.AsString <> '')
                                           and (QRDBRagSocLuogoDestinazione2.Enabled);
   // Visualizza le parentesi solo se la provincia è presente
   QRLabelParentesiApertaLuogoDestinazione2.Enabled := (PreventiviOrdiniForm.QryDocumentoProvinciaDestMerci.AsString <> '') and (QRLabelRagSocDest1.Enabled);
   QRLabelParentesiChiusaLuogoDestinazione2.Enabled := QRLabelParentesiApertaLuogoDestinazione2.Enabled;
   // ================================================================================================

   // Posiziona i dati del cantiere
   // Carica i dati del cantiere
   QRLabelCantiere2.Caption := PreventiviOrdiniForm.LabelCantiere.Caption;
   QRFieldCantiere2.Caption := PreventiviOrdiniForm.DbeDescrizioneCantiere.Text;

   // Carica il telefono se abilitato
   if (QRFieldTelefono.Enabled) and (QuickReport1.PageNumber = 1) then begin
     QRFieldTelefono.Caption := '';
     QRFieldTelefono.Caption := Trim(QryDatiSoggettoTELEFONO.AsString);
     if (Trim(QryDatiSoggettoCELLULARE.AsString) <> '') then begin
       if QRFieldTelefono.Caption <> '' then QRFieldTelefono.Caption := QRFieldTelefono.Caption + ';  ';
       QRFieldTelefono.Caption := QRFieldTelefono.Caption + QryDatiSoggettoCELLULARE.AsString;
     end;
   end;
end;

procedure TQReportPreventiviOrdini.ChildDestinatarioBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   // --------------------------------------------------------------------------
   // NB: Solo se è abilitato il testo finale e quindi siamo con il piede modbile
   if fAbilitaPiedeMobile then begin
     // Memorizza nella struttura apposita i dati iniziali sulla posizione di questa banda
     //  per il successivo calcolo dei fattori di conversione.
     if (Sender.ParentReport.PageNumber = 1) and Preparing then begin
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.StartAvailableSpace  := Sender.ParentReport.AvailableSpace;
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.StartCurrentY        := Sender.ParentReport.CurrentY;
     end;
   end;
   // --------------------------------------------------------------------------

   // ================================================================================================
   // CONTROLLO ESISTENZA DATI INTESTATARIO DOCUMENTO
   // ------------------------------------------------------------------------------------------------
   // Carica la Ragione Sociale
   QRLabelRagSoc1.Caption := LeftStr(PreventiviOrdiniForm.QryDocumentoRAGSOCCLI.AsString, 50);
   QRLabelRagSoc2.Caption := Copy(PreventiviOrdiniForm.QryDocumentoRAGSOCCLI.AsString, 51);
   // Se non esistono CAP e Città non visualizza il trattino che li divide
   QRLabelTrattinoIntestatario.Enabled := (PreventiviOrdiniForm.QryDocumentoCAPCli.AsString <> '')
                                           and (PreventiviOrdiniForm.QryDocumentoCittaCli.AsString <> '');
   // Visualizza le parentesi solo se la provincia è presente
   QRLabelParentesiApertaIntestatario.Enabled := PreventiviOrdiniForm.QryDocumentoProvinciaCli.AsString <> '';
   QRLabelParentesiChiusaIntestatario.Enabled := QRLabelParentesiApertaIntestatario.Enabled;
   // Visualizza la descrizione della partita IVA solo se quest'ultima esiste
   QRLabelPIVA.Enabled := PreventiviOrdiniForm.QryDocumentoPartitaIVACli.AsString <> '';
   QRLabelCF.Enabled := PreventiviOrdiniForm.QryDocumentoCodiceFiscaleCli.AsString <> '';
   // ================================================================================================


   // ================================================================================================
   // CONTROLLO ESISTENZA DATI LUOGO DESTINAZIONE MERCI
   // ------------------------------------------------------------------------------------------------
   // Carica la Ragione Sociale
   QRLabelRagSocDest1.Caption := LeftStr(PreventiviOrdiniForm.QryDocumentoRAGSOCDESTMERCI.AsString, 50);
   QRLabelRagSocDest2.Caption := Copy(PreventiviOrdiniForm.QryDocumentoRAGSOCDESTMERCI.AsString, 51);
   // Se non esistono CAP e Città destinazione merci non visualizza il trattino che li divide
   QRLabelTrattinoLuogoDestinazione.Enabled := (PreventiviOrdiniForm.QryDocumentoCAPDestMerci.AsString <> '')
                                           and (PreventiviOrdiniForm.QryDocumentoCittaDestMerci.AsString <> '')
                                           and (QRLabelRagSocDest1.Enabled);
   // Visualizza le parentesi solo se la provincia è presente
   QRLabelParentesiApertaLuogoDestinazione.Enabled := (PreventiviOrdiniForm.QryDocumentoProvinciaDestMerci.AsString <> '') and (QRLabelRagSocDest1.Enabled);
   QRLabelParentesiChiusaLuogoDestinazione.Enabled := QRLabelParentesiApertaLuogoDestinazione.Enabled;
   // ================================================================================================

   // Carica i dati del cantiere
   QRLabelCantiere.Caption := PreventiviOrdiniForm.LabelCantiere.Caption;
   QRFieldCantiere.Caption := PreventiviOrdiniForm.DbeDescrizioneCantiere.Text;
end;






procedure TQReportPreventiviOrdini.QRSubDetail2NeedData(Sender: TObject;
  var MoreData: Boolean);
var
  tmpVal:Integer;
  LPrintImports: Boolean;
  // Stampa o non stampa gli importi dei sottorighi in base al flag PUA
  procedure AbilitaStampaImportiSottorighi;
  begin
    // Stampa o meno gli importi in secondo piano
    DIBAPrezzoUnitario.Enabled := LPrintImports and QRLabelPrezzoUnitario.Enabled;
    DIBAPrezzoUnitarioIVACompresa.Enabled := LPrintImports and QRLabelPrezzoUnitarioIVACompresa.Enabled;
    DIBAPrezzoUnitarioNetto.Enabled := LPrintImports and QRLabelPrzUnitNetto.Enabled;
    DIBAScontoRigo1.Enabled := LPrintImports and QRLabelScontoRigo1.Enabled;
    DIBAScontoRigo2.Enabled := LPrintImports and QRLabelScontoRigo2.Enabled;
    DIBAScontoRigo3.Enabled := LPrintImports and QRLabelScontoRigo3.Enabled;
    DIBAImportoRigo.Enabled := LPrintImports and QRLabelImportoRigo.Enabled;
    DIBAImportoRigoIVACompresa.Enabled := LPrintImports and QRLabelImportoRigoIVACompresa.Enabled;
    DIBACosto.Enabled := LPrintImports and QRLabelCosto.Enabled;
    DIBAMargine.Enabled := LPrintImports and QRLabelMargine.Enabled;
    DIBAImportoMargine.Enabled := LPrintImports and QRLabelImportoMargine.Enabled;
    DIBACodiceIVA.Enabled := LPrintImports and QRLabelCodiceIVA.Enabled;
    DIBADescrizioneIVA.Enabled := LPrintImports and QRLabelDescrizioneIVA.Enabled;
  end;
begin
   if QRSubDetail2.Enabled and VaiStampaSottorighi and (DRI < DDC.RecordCount) then
   begin
      // Stampa dei righi normali
      //  NB: Questa condizione probablimente si può togliere (c'è già nella condizione precedente)
      if DRI < DDC.RecordCount then
      begin
         // Stampa o meno gli importi dei sottorighi...
         LPrintImports := (DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoROWPRINTPRICES.Index] = 'True'); // or (RightStr(LRowType, 1) <> TIPORIGODOC_CHAR_GRAYED);
         AbilitaStampaImportiSottorighi;

         // Se DescLineIndex = 0 significa che stiamo iniziando a stampare un nuovo rigo di documento
         //  e quindi provvede a caricare nell'apposito Memo dove costruisco la stampa della descrizione
         //  il testo completo della descrizione della riga attuale in modo poi da poterla  leggere
         //  e stampare riga per riga.
         if fDescLineIndex = 0 then
         begin
           PreventiviOrdiniForm.RE.Width := PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Width; // Descrizione.Width; // - 10;
           PreventiviOrdiniForm.RE.Clear;
           PreventiviOrdiniForm.RE.Text := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index];
         end;

         //  NB: Solo se stiamo stampando la prima riga della descrizione stampa anche gli altri campi
         //       altrimenti no.
         DIBADescrizione.Caption               := PreventiviOrdiniForm.RE.Lines[fDescLineIndex];
         if fDescLineIndex = 0 then begin
           // Carica i dati del rigo corrente
           DIBACodiceArticolo.Caption            := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoCODICEARTICOLO.Index];
           DIBAPrezzoUnitario.Caption            := '(' + DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Index] + ')';
           DIBAPrezzoUnitarioIVACompresa.Caption := '(' + DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoPREZZOUNITARIOIVACOMPRESA.Index] + ')';
           DIBAPrezzoUnitarioNetto.Caption       := CalcolaPrezzoUnitarioNetto(DDC, DRI);
           DIBAUnitaDiMisura.Caption             := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Index];
           DIBAQTA.Caption                       := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoQTA.Index];
           DIBAQTAEvasa.Caption                  := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoQTAEVASA.Index];
           DIBAQTAResidua.Caption                := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoQTADAEVADERE.Index];
           DIBAScontoRigo1.Caption               := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoSCONTORIGO.Index];
           DIBAScontoRigo2.Caption               := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoSCONTORIGO2.Index];
           DIBAScontoRigo3.Caption               := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoSCONTORIGO3.Index];
           DIBAImportoRigo.Caption               := '(' + DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoIMPORTORIGO.Index] + ')';
           DIBAImportoRigoIVACompresa.Caption    := '(' + DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoIMPORTORIGOIVACOMPRESA.Index] + ')';
           DIBACodiceIVA.Caption                 := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoCODICEIVA.Index];
           DIBADescrizioneIVA.Caption            := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoDESCRIZIONEIVA.Index];
           DIBANoteRigo.Caption                  := DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoNOTERIGO.Index];
           DIBACosto.Caption                     := '(' + DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoPREZZOACQUISTOARTICOLO.Index] + ')';
           DIBAMargine.Caption                   := '(' + DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoMARGINE.Index] + ')';
           DIBAImportoMargine.Caption            := '(' + DDC.DisplayTexts[DRI, PreventiviOrdiniForm.tvCorpoIMPORTOMARGINE.Index] + ')';
           // Se gli sconti sono a valore zero non visualizza gli zeri e anche per altrim importi
           if DIBAPrezzoUnitario.Caption = '0'            then DIBAPrezzoUnitario.Caption := '';
           if DIBAPrezzoUnitarioIVACompresa.Caption = '0' then DIBAPrezzoUnitarioIVACompresa.Caption := '';
           if DIBAScontoRigo1.Caption = '0'               then DIBAScontoRigo1.Caption := '';
           if DIBAScontoRigo2.Caption = '0'               then DIBAScontoRigo2.Caption := '';
           if DIBAScontoRigo3.Caption = '0'               then DIBAScontoRigo3.Caption := '';
           if DIBAImportoRigo.Caption = '0'               then DIBAImportoRigo.Caption := '';
           if DIBAImportoRigoIVACompresa.Caption = '0'    then DIBAImportoRigoIVACompresa.Caption := '';
         // Se stiamo stampando una riga di descrizione successiva alla prima non stampa gli altri campi
         end else begin
           DIBACodiceArticolo.Caption            := '';
           DIBAPrezzoUnitario.Caption            := '';
           DIBAPrezzoUnitarioIVACompresa.Caption := '';
           DIBAPrezzoUnitarioNetto.Caption       := '';
           DIBAUnitaDiMisura.Caption             := '';
           DIBAQTA.Caption                       := '';
           DIBAQTAEvasa.Caption                  := '';
           DIBAQTAResidua.Caption                := '';
           DIBAScontoRigo1.Caption               := '';
           DIBAScontoRigo2.Caption               := '';
           DIBAScontoRigo3.Caption               := '';
           DIBAImportoRigo.Caption               := '';
           DIBAImportoRigoIVACompresa.Caption    := '';
           DIBACodiceIVA.Caption                 := '';
           DIBADescrizioneIVA.Caption            := '';
           DIBANoteRigo.Caption                  := '';
           DIBACosto.Caption                     := '';
           DIBAMargine.Caption                   := '';
           DIBAImportoMargine.Caption            := '';
         end;

      // Stampa del rigo della mano d'opera
//      end else if (DRI = DDC.RecordCount) then begin
//         DIBACodiceArticolo.Caption            := DM1.Manodopera[0].Codice;
//         DIBADescrizione.Caption               := DM1.Manodopera[0].Descrizione;
////         DIBAPrezzoUnitario.Caption            := '(' + MDC.DisplayTexts[RI-1, PreventiviOrdiniForm.tvCorpoPRZUNITOPERA.Index] + ')';
//         DIBAUnitaDiMisura.Caption             := DM1.Manodopera[0].UM;
//         DIBAImportoRigo.Caption               := '(' + MDC.DisplayTexts[RI-1, PreventiviOrdiniForm.tvCorpoIMPORTOOPERA.Index] + ')';
//         // Effattua il calcolo della Qtà visualizzandolo in ore e minuti (nel campo sono memorizzati i minuti.
//         tmpVal := DM1.NoNullIntValue(MDC, RI-1, PreventiviOrdiniForm.tvCorpoQTAOPERA.Index);
//         DIBAQTA.Caption := IntToStr(Trunc(tmpVal/60)) + ':' + IntToStr(tmpVal mod 60);
//         // Azzera l'indice che indica quale riga della descrizione del rigo corrente si sta stampando
//         //  questo perchè la manodopera è sempre l'ultima riga ad essere stampata.
//         PreventiviOrdiniForm.RE.Clear;
//         fDescLineIndex := 0;
      end;

      // Se stiamo stampando la prima riga della descrizione del rigo corrente visualizza anche il
      //  trattino orizzontale, altrimenti no
      if fDescLineIndex = 0 then
        QRSDIBARight.Pen.Color := clBlack
      else
        QRSDIBARight.Pen.Color := QRShapeSfondoSottorigo.Brush.Color;

      // Se ci sono altre rige della descrizione da stampare, prosegue con la prossima
      //  facendo avanzare l'indice che punta alla riga di descrizione attuale.
      if fDescLineIndex < (PreventiviOrdiniForm.RE.Lines.Count-1) then  //-1) then
      begin
        // Avanza l'indice
        inc(fDescLineIndex);
        MoreData := True;
        // Imposta un'altezza della riga
        (Sender as TQRSubDetail).Height := 14;
      // Se invece non ci sono altre righe di descrizione da stampare, prosegue
      //  con il prossimo rigo di documento.
      end
      else
      begin
        // Azzera l'indice che indica quale riga della descrizione del rigo corrente si sta stampando
        fDescLineIndex := 0;
        // Passa al rigo sucessivo
        inc(DRI);
        // Se è l'ultimo rigo finisce
        //  NB: Nel controllare se è l'ultimo rigo verifica anche se la mano d'opera è > 0 come quantità
        //       e se è > 0 non stampa il rigo in più della mano d'opera stessa.
        MoreData := (DRI <= (DDC.RecordCount));
        // Se si stà stampando l'ultimo rigo non visualizza la linea in basso dell'albero dei sottorighi
        if DRI < (DDC.RecordCount) then
          QRSDIBABottom.Pen.Color := clBlack
        else
          QRSDIBABottom.Pen.Color := QRShapeSfondoSottorigo.Brush.Color;
        // Imposta un'altezza della riga
        (Sender as TQRSubDetail).Height := 14;
      end;


   end
   else
   begin
      MoreData := False;
   end;

   // Se MoreData = False allora disabilita la stampa dei sottorighi altrimenti da dei problemi
   VaiStampaSottorighi := MoreData;
end;

procedure TQReportPreventiviOrdini.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
   XF, YF: Extended;
begin
   // Aggiunge il valore della proprietà Expanded della banda del rigo attuale all'array
   //  RowsExpanded per permettere poi alla stampa vera e propria di adeguare le dimensioni
   //  verticali di Shapes per la lettura facilitata e le righe verticali di separazione.
   //  Questo perchè se la descrizione dell'articolo attuale fosse particolarmente lunga
   //  altrimenti si interromperebbero e linee verticali di separazione delle colonne e la
   //  lettura facilitata riguarderebbe solo la prima linea della descrizione.
   if Preparing then begin
      SetLength(PreventiviOrdiniForm.RowsExpanded, Length(PreventiviOrdiniForm.RowsExpanded) + 1);
      PreventiviOrdiniForm.RowsExpanded[Length(PreventiviOrdiniForm.RowsExpanded)-1] := Sender.Expanded;
   end;
end;

procedure TQReportPreventiviOrdini.FormCreate(Sender: TObject);
begin
   inherited;
   // Inizializzazione
   Preparing := False;
   IntestazBMP := TBitMap.Create;
   PiedeBMP := TBitMap.Create;
   fStmPref_FileName := '';
   FRelazioneInterventoDaStampare := False;
   FRelazioneInterventoStampata := False;
end;

procedure TQReportPreventiviOrdini.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   // Adegua l'altezza dello shape di sfondo della lettura facilitata per compensare eventuali
   //  espansioni della banda verso il basso in seguito alla presenza di un articolo con descrizione
   //  molto lunga,
   //  Alla fine ho messo il "+5" perchè altrimenti rimale una riga bianca tra i vari shapes
//   if LetturaFacilitata and not Preparing then begin
     QRShapeSfondoSottorigo.Size.Height := QRSubDetail2.Size.Height + PreventiviOrdiniForm.RowsExpanded[REIndex] + 5;
     QRShapeRowDIBACodiceArticolo.Size.Height             := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBADescrizione.Size.Height                := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAPrezzoUnitario.Size.Height             := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAPrezzoUnitarioIVACompresa.Size.Height  := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAUnitaDiMisura.Size.Height              := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAQTA.Size.Height                        := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAQTAEvasa.Size.Height                   := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAQTAResidua.Size.Height                 := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAScontoRigo1.Size.Height                := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAScontoRigo2.Size.Height                := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAScontoRigo3.Size.Height                := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAImportoRigo.Size.Height                := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAImportoRigoIVACompresa.Size.Height     := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBACodiceIVA.Size.Height                  := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBADescrizioneIVA.Size.Height             := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBANoteRigo.Size.Height                   := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBACosto.Size.Height                      := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAMargine.Size.Height                    := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAImportoMargine.Size.Height             := QRShapeSfondoRigo.Size.Height;
     QRShapeRowDIBAFinale.Size.Height                     := QRShapeSfondoRigo.Size.Height;
     QRSDIBABottom.Size.Height                            := QRShapeSfondoRigo.Size.Height;
     Inc(REIndex);
//   end;
end;

procedure TQReportPreventiviOrdini.QuickReport1EndPage(
  Sender: TCustomQuickRep);
begin
   // Dopo la prima pagine di un prevenivo in cui il testo iniziale è abilitato
   //  fa sparire anche il destinatario del documento.
   //  NB: Trasformato in "quando il piede mobile è attivato"
   //  NB: Controllando che (PrecChildDestinatarioHeight <> 0) si assicura
   //  NB: Però lascia la Label con il tipo di documento in grande perchè
   //       altrimenti in alcuni casi nella seconda pagina andava sopra al logo.
   //       che questa parte di codice sia eseguita sulo la prima volta
//   if ChildStartMemo.Enabled then ChildDestinatario.Height := 0;
   if fAbilitaPiedeMobile and (PrecChildDestinatarioHeight = 0) then begin
     PrecChildDestinatarioHeight  := ChildDestinatario.Height;
     ChildDestinatario.Height     := TipoDocumentoGrande.Top + TipoDocumentoGrande.Height;
   end;
   // Dopo la prima pagina il testo iniziale è sempre disabilitato
   ChildStartMemo.Height := 0;
   // Se siamo alla fine dell'ultima pagine (quindi a fine stampa)
   //  esegue alcuni ripristini.
   // Ripristina alcuni valori altrimenti quando l'utente stampa
   //  dall'anteprima alcune cose non vanno bene
   if Self.UltimaPagina then begin
     RipristinoFineStampa;
   end;
end;

procedure TQReportPreventiviOrdini.QRDBText135Print(sender: TObject;
  var Value: String);
begin
   // Questo gestore di evento viene richiamato per i campi che riguradano la ritenuta di acconto
   //  e fa in modo che se non viene specificata alcuna ritenuta diventino tutti invisibili altrimenti
   //  ovviamente diventano visibili
   if (not PreventiviOrdiniForm.QryDocumentoRITACCPERC.IsNull) and (PreventiviOrdiniForm.QryDocumentoRITACCPERC.Value <> 0) and UltimaPagina then begin
     // Se è stata specificata una ritenuta di acconto rende il campo visibile in stampa
     (Sender as TQRDBText).Font.Color := $003F3F3F;
     // Imposta la ritenuta di acconto in base al modo in cui viene deciso l'imponibile da considerare come base per il calcolo della ritenuta stessa
     if PreventiviOrdiniForm.QryDocumentoRITACCSUIMPORTOIMP.AsString = 'T'
       then Value := CurrToStrF(PreventiviOrdiniForm.QryDocumentoRITACCIMPONIBILE.AsCurrency, ffCurrency, FormatSettings.CurrencyDecimals)
       else Value := PreventiviOrdiniForm.QryDocumentoRITACCPERCIMPONIBILE.AsString + '%';
     Value := '(' + Value + ')';
   end else begin
     // Altrimenti è invisibile
     (Sender as TQRDBText).Font.Color := (Sender as TQRDBText).Color;
   end;
end;

procedure TQReportPreventiviOrdini.ChildPiede2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Spostamento: Integer;
  Q: TQuickRep;
begin
   // ---------------------------------------------------------------------------
   // NB: Solo se è abilitato il testo finale e quindi siamo con il piede modbile
   if fAbilitaPiedeMobile then begin
     // Per comodità Q punta al report
     Q := (Sender.ParentReport as TQuickRep);
     // Se siamo in Preparing effettua il calcolo per determinare la posizione del finale del documento
     //  e memorizza il tutto nell'apposita struttura in modo da usarne le informazioni anche per la stampa
     //  effettiva che così apparirà uguale alla preview (come salto pagina intendo).
     if Preparing then begin
       // Controlla se lo spazio disponibile è sufficiente, e se non lo è forza il salto pagina
       if Q.AvailableSpace < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace then Q.NewPage;
       // Calcola lo spostamento da applicare a CurrentY per allineare la stampa della fine del documento al bordo inferiore
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset := Q.AvailableSpace - PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace - 1;
       // Memorizza la pagina dove è stampato il piede del documento
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber := Q.PageNumber;
     end;
     // Se non mi trovo nella pagina giusta ma in quella precedente procedo con un salto pagina
     if Q.PageNumber < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber then  Q.NewPage;
     // Applico lo spostamento calcolato nel Preparing per allineare il piede al bordo inferiore
     Q.CurrentY := Q.CurrentY + PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset;
   end;
   // ---------------------------------------------------------------------------

  if not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked then
  begin
    QRShapeNoCastellettoPiede2.Top := QRShapeTotaleMercePiede2.Top;
    QRShapeNoCastellettoPiede2.Left := QRShapeTotaleMercePiede2.Left;
    QRShapeNoCastellettoPiede2.Width := QRShapeTotaleIVAPiede2.Left + QRShapeTotaleIVAPiede2.Width - QRShapeNoCastellettoPiede2.Left;
    QRShapeNoCastellettoPiede2.Height := QRShapeTotaleIVAPiede2.Top + QRShapeTotaleIVAPiede2.Height - QRShapeNoCastellettoPiede2.Top;
    QRShapeNoCastellettoPiede2.Enabled := True;
  end;
end;

procedure TQReportPreventiviOrdini.ChildPiede3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Spostamento: Integer;
  Q: TQuickRep;
begin
   // ---------------------------------------------------------------------------
   // NB: Solo se è abilitato il testo finale e quindi siamo con il piede modbile
   if fAbilitaPiedeMobile then begin
     // Per comodità Q punta al report
     Q := (Sender.ParentReport as TQuickRep);
     // Se siamo in Preparing effettua il calcolo per determinare la posizione del finale del documento
     //  e memorizza il tutto nell'apposita struttura in modo da usarne le informazioni anche per la stampa
     //  effettiva che così apparirà uguale alla preview (come salto pagina intendo).
     if Preparing then begin
       // Controlla se lo spazio disponibile è sufficiente, e se non lo è forza il salto pagina
       if Q.AvailableSpace < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace then Q.NewPage;
       // Calcola lo spostamento da applicare a CurrentY per allineare la stampa della fine del documento al bordo inferiore
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset := Q.AvailableSpace - PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace - 1;
       // Memorizza la pagina dove è stampato il piede del documento
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber := Q.PageNumber;
     end;
     // Se non mi trovo nella pagina giusta ma in quella precedente procedo con un salto pagina
     if Q.PageNumber < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber then  Q.NewPage;
     // Applico lo spostamento calcolato nel Preparing per allineare il piede al bordo inferiore
     Q.CurrentY := Q.CurrentY + PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset;
   end;
   // ---------------------------------------------------------------------------


  if not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked then begin
    QRShapeNoCastellettoPiede3.Top := QRShapeTotaleMercePiede3.Top;
    QRShapeNoCastellettoPiede3.Left := QRShapeTotaleMercePiede3.Left;
    QRShapeNoCastellettoPiede3.Width := QRShapeTotaleIVAPiede3.Left + QRShapeTotaleIVAPiede3.Width - QRShapeNoCastellettoPiede3.Left;
    QRShapeNoCastellettoPiede3.Height := QRShapeTotaleIVAPiede3.Top + QRShapeTotaleIVAPiede3.Height - QRShapeNoCastellettoPiede3.Top;
    QRShapeNoCastellettoPiede3.Enabled := True;
  end;
end;

procedure TQReportPreventiviOrdini.ChildPiede4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Spostamento: Integer;
  Q: TQuickRep;
  LStampaCasellaAbbuono: Boolean;
begin
   // ---------------------------------------------------------------------------
   // NB: Solo se è abilitato il testo finale e quindi siamo con il piede modbile
   if fAbilitaPiedeMobile then begin
     // Per comodità Q punta al report
     Q := (Sender.ParentReport as TQuickRep);
     // Se siamo in Preparing effettua il calcolo per determinare la posizione del finale del documento
     //  e memorizza il tutto nell'apposita struttura in modo da usarne le informazioni anche per la stampa
     //  effettiva che così apparirà uguale alla preview (come salto pagina intendo).
     if Preparing then begin
       // Controlla se lo spazio disponibile è sufficiente, e se non lo è forza il salto pagina
       if Q.AvailableSpace < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace then Q.NewPage;
       // Calcola lo spostamento da applicare a CurrentY per allineare la stampa della fine del documento al bordo inferiore
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset := Q.AvailableSpace - PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace - 1;
       // Memorizza la pagina dove è stampato il piede del documento
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber := Q.PageNumber;
     end;
     // Se non mi trovo nella pagina giusta ma in quella precedente procedo con un salto pagina
     if Q.PageNumber < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber then  Q.NewPage;
     // Applico lo spostamento calcolato nel Preparing per allineare il piede al bordo inferiore
     Q.CurrentY := Q.CurrentY + PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset;
   end;
   // ---------------------------------------------------------------------------

  if not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked then begin
    QRShapeNoCastellettoPiede4.Top := QRShapeTotaleMercePiede4.Top;
    QRShapeNoCastellettoPiede4.Left := QRShapeTotaleMercePiede4.Left;
    QRShapeNoCastellettoPiede4.Width := QRShapeTotaleIVAPiede4.Left + QRShapeTotaleIVAPiede4.Width - QRShapeNoCastellettoPiede4.Left;
    QRShapeNoCastellettoPiede4.Height := QRShapeTotaleIVAPiede4.Top + QRShapeTotaleIVAPiede4.Height - QRShapeNoCastellettoPiede4.Top;
    QRShapeNoCastellettoPiede4.Enabled := True;
  end;

  // Imposta la ritenuta d'acconto
  if PreventiviordiniForm.QryDocumentoRITACCSUIMPORTOIMP.AsString = 'T' then begin
    QRLabel46.Caption := '(su imponibile)';
  end;

  // Sconto finale / abbuono
  LStampaCasellaAbbuono := (PreventiviOrdiniForm.QryDocumentoABBUONO.AsFloat <> 0) and not PreventiviOrdiniForm.StmTotIvaEscl.Checked;
  QRLabelAbbuono4.Enabled := LStampaCasellaAbbuono;
  QRLabelAbbuonoSu4.Enabled := LStampaCasellaAbbuono;
  QRDBTextAbbuono4.Enabled := LStampaCasellaAbbuono;
  QRDBTextAbbuonoPerc4.Enabled := LStampaCasellaAbbuono;
end;

procedure TQReportPreventiviOrdini.QRDBText140Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) <> '' then Value := '(' + Value + ')';
end;

procedure TQReportPreventiviOrdini.FormDestroy(Sender: TObject);
begin
  // Distruzione
  IntestazBMP.Free;
  PiedeBMP.Free;
end;

procedure TQReportPreventiviOrdini.QRBandLogoAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
   R: TRect;
   XF, YF: Extended;
begin
// -----------------------------------------------------------------------------
   // Se la foto deve essere stampata...
   if (QRBandLogo.Height > 0) and (ImageIntestazione.Enabled) then begin
     // Memorizza i fattori di conversione delle coordinate
     XF := Sender.ParentReport.QRPrinter.XFactor;
     YF := Sender.ParentReport.QRPrinter.YFactor;
     // Calcola il TRect della zona su cui deve essere stampata la fotografia
     R.Left   := ConvCoord(QRBandLogo.Left+ImageIntestazione.Left, XF) - Round(Sender.ParentReport.QRPrinter.LeftWaste*XF);
     R.Top    := ConvCoord(QRBandLogo.Top+ImageIntestazione.Top, YF) - Round(Sender.ParentReport.QRPrinter.TopWaste*YF);
     R.Right  := R.Left + ConvCoord(ImageIntestazione.Width, XF);
     R.Bottom := R.Top + ConvCoord(ImageIntestazione.Height, YF);
     // Effettua il tracciamento
     Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, IntestazBMP);
   end;
// -----------------------------------------------------------------------------
end;

// Funzione che converte le posizioni/dimensioni dei componenti per il tracciamento diretto delle immagini
//  sul canvas della pagina da stampare. Fatto per risolvere il problema della stampa dei quadrati neri
function TQReportPreventiviOrdini.ConvCoord(Coord:Integer; Fattore:Extended): Integer;
begin
  Result := Round(Coord / Screen.PixelsPerInch * 254 * Fattore);
end;

procedure TQReportPreventiviOrdini.ChildLogoPiedeAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
   R: TRect;
   XF, YF: Extended;
begin
// -----------------------------------------------------------------------------
   // Se la foto deve essere stampata...
   if (ChildLogoPiede.Height > 0) and (ImagePiede.Enabled) then begin
     // Memorizza i fattori di conversione delle coordinate
     XF := Sender.ParentReport.QRPrinter.XFactor;
     YF := Sender.ParentReport.QRPrinter.YFactor;
     // Calcola il TRect della zona su cui deve essere stampata la fotografia
     R.Left   := ConvCoord(ChildLogoPiede.Left+ImagePiede.Left, XF) - Round(Sender.ParentReport.QRPrinter.LeftWaste*XF);
     R.Bottom := Round(Sender.ParentReport.CurrentY*YF) - ConvCoord(ImagePiede.Top, YF) - Round(Sender.ParentReport.QRPrinter.TopWaste*YF);
     R.Right  := R.Left + ConvCoord(ImagePiede.Width, XF);
     R.Top    := R.Bottom - ConvCoord(ImagePiede.Height, YF);
     // Effettua il tracciamento
     Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, PiedeBMP);
   end;
// -----------------------------------------------------------------------------
end;

function TQReportPreventiviOrdini.GetFinalBandsHeight: Integer;
var
  CurrBand: TQRChildBand;
begin
  // Calcola l'altezza totale delle bande di chiusura del documento (praticamente
  //  dai totali e castelletto IVA in giù.
  //  NB: MI serviva per far dei calcoli per allineare in basso all'ultima pagina le bande di chiusura del documento nel caso
  //  sia impostata la presenza di queste bande finali solo sull'ultima pagina (Preventivi).
  //  NB: Per sicurezza metto un valore iniziale di 5 altrimenti in alcuni casi mi faceva dei difetti
  Result := 1;
  // CurrBand punta alla prima banda di cui controllare l'altezza per aggiungerla al totale da ritornare.
  CurrBand := ChildPiede2;
  // Cicla finchè ci sono ChildBands ed aggiunge l'altezza di ciascuna al totale da ritornare
  repeat
    Result := Result + CurrBand.Height;
    CurrBand := CurrBand.ChildBand;
  until CurrBand = nil;
end;

procedure TQReportPreventiviOrdini.PrezzoUnitarioPrint(sender: TObject; var Value: string);
begin
  with (Sender as TQRLabel) do
    if (Font.Color = clGray) and (Value <> '') then
      Value := Format('(%s)', [Value]);
end;

procedure TQReportPreventiviOrdini.ChildDestinatarioAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  // NB: HO visto che questo gestore di evento viene chiamato anche se la banda non è Enabled e quindi
  //      causava un errore di divisione per zero nel codice sottostante (PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FactorAvailableSpace := ...)
  //      quindi ora se verifico che la banda non è attiva esco subito ed evito il problema
  if (not Sender.Enabled) or (Sender.Height = 0) then Exit;
   // --------------------------------------------------------------------------
   // NB: Solo se è abilitato il testo finale e quindi siamo con il piede mobile
   if fAbilitaPiedeMobile then begin
     // Memorizza nella struttura apposita i dati finaly sulla posizione di questa banda
     //  per il successivo calcolo dei fattori di conversione.
     if (Sender.ParentReport.PageNumber = 1) and Preparing then begin
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.EndAvailableSpace := Sender.ParentReport.AvailableSpace;
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.EndCurrentY := Sender.ParentReport.CurrentY;
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.ScreenBandHeight := Sender.Height;
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FactorAvailableSpace := (PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.StartAvailableSpace - PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.EndAvailableSpace) / PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.ScreenBandHeight;
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FactorCurrentY := (PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.EndCurrentY - PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.StartCurrentY) / PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.ScreenBandHeight;
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace := Trunc(FinalBandsHeight * PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FactorAvailableSpace);
      //   ShowMessage('SAS=' + IntToStr(ConvDataPerPiedeUltimaPagina.StartAvailableSpace) + '; EAS=' + IntToStr(ConvDataPerPiedeUltimaPagina.EndAvailableSpace) + '; SCY=' + IntToStr(ConvDataPerPiedeUltimaPagina.StartCurrentY) + '; ECY=' + IntToStr(ConvDataPerPiedeUltimaPagina.EndCurrentY));
     end;
   end;
   // --------------------------------------------------------------------------
end;

procedure TQReportPreventiviOrdini.ChildTipoNumDataBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Construisce il testo indicante la pagina attuale nella forma 1/3
  QRLabelPagina.Caption := IntToStr(QuickReport1.PageNumber) + '/' + IntToStr(PreventiviOrdiniForm.LastPrintedPageCount);
end;

procedure TQReportPreventiviOrdini.ChildPiede3NoIvaBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Spostamento: Integer;
  Q: TQuickRep;
  LStampaCasellaAbbuono: Boolean;
begin
   // ---------------------------------------------------------------------------
   // NB: Solo se è abilitato il testo finale e quindi siamo con il piede modbile
   if fAbilitaPiedeMobile then
   begin
     // Per comodità Q punta al report
     Q := (Sender.ParentReport as TQuickRep);
     // Se siamo in Preparing effettua il calcolo per determinare la posizione del finale del documento
     //  e memorizza il tutto nell'apposita struttura in modo da usarne le informazioni anche per la stampa
     //  effettiva che così apparirà uguale alla preview (come salto pagina intendo).
     if Preparing then
     begin
       // Controlla se lo spazio disponibile è sufficiente, e se non lo è forza il salto pagina
       if Q.AvailableSpace < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace then
         Q.NewPage;
       // Calcola lo spostamento da applicare a CurrentY per allineare la stampa della fine del documento al bordo inferiore
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset := Q.AvailableSpace - PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace - 1;
       // Memorizza la pagina dove è stampato il piede del documento
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber := Q.PageNumber;
     end;
     // Se non mi trovo nella pagina giusta ma in quella precedente procedo con un salto pagina
     if Q.PageNumber < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber then
       Q.NewPage;
     // Applico lo spostamento calcolato nel Preparing per allineare il piede al bordo inferiore
     Q.CurrentY := Q.CurrentY + PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset;
   end;
   // ---------------------------------------------------------------------------

   // Sconto finale / abbuono
   LStampaCasellaAbbuono := (PreventiviOrdiniForm.QryDocumentoABBUONO.AsFloat <> 0) and not PreventiviOrdiniForm.StmTotIvaEscl.Checked;

   QRShapeAbbuono3.Enabled := LStampaCasellaAbbuono;
   QRLabelAbbuono3.Enabled := LStampaCasellaAbbuono;
   QRLabelAbbuonoSu3.Enabled := LStampaCasellaAbbuono;
   QRDBTextAbbuono3.Enabled := LStampaCasellaAbbuono;
   QRDBTextAbbuonoPerc3.Enabled := LStampaCasellaAbbuono;

   QRShapeTotaleDocumento3.Enabled := LStampaCasellaAbbuono;
   QRLabelTotaleDocumento3.Enabled := LStampaCasellaAbbuono;
   QRDBTextTotaleaDocumento3.Enabled := LStampaCasellaAbbuono;
end;

procedure TQReportPreventiviOrdini.QRLabelNotePrint(sender: TObject;
  var Value: String);
begin
   (Sender as TQRLabel).Font.Color := clBlack;
   if not UltimaPagina then (Sender as TQRLabel).Font.Color := (Sender as TQRLabel).Color;
end;

procedure TQReportPreventiviOrdini.ChildPiede1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
  Spostamento: Integer;
  Q: TQuickRep;
begin
   // ---------------------------------------------------------------------------
   // NB: Solo se è abilitato il testo finale e quindi siamo con il piede modbile
   if fAbilitaPiedeMobile then begin
     // Per comodità Q punta al report
     Q := (Sender.ParentReport as TQuickRep);
     // Se siamo in Preparing effettua il calcolo per determinare la posizione del finale del documento
     //  e memorizza il tutto nell'apposita struttura in modo da usarne le informazioni anche per la stampa
     //  effettiva che così apparirà uguale alla preview (come salto pagina intendo).
     if Preparing then begin
       // Controlla se lo spazio disponibile è sufficiente, e se non lo è forza il salto pagina
       if Q.AvailableSpace < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace then Q.NewPage;
       // Calcola lo spostamento da applicare a CurrentY per allineare la stampa della fine del documento al bordo inferiore
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset := Q.AvailableSpace - PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsHeightConvertedToAvailableSpace - 1;
       // Memorizza la pagina dove è stampato il piede del documento
       PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber := Q.PageNumber;
     end;
     // Se non mi trovo nella pagina giusta ma in quella precedente procedo con un salto pagina
     if Q.PageNumber < PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsPageNumber then  Q.NewPage;
     // Applico lo spostamento calcolato nel Preparing per allineare il piede al bordo inferiore
     Q.CurrentY := Q.CurrentY + PreventiviOrdiniForm.ConvDataPerPiedeUltimaPagina.FinalBandsOffset;
   end;
   // ---------------------------------------------------------------------------
end;

procedure TQReportPreventiviOrdini.ChildChiusura1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Se non siamo sull'ultima pagina provvede alla stampa della dicitura
  //  "Continua a pagina..."
  if not UltimaPagina then begin
    QRLabelSegue.Caption := '...continua a pagina ' + IntToStr(QuickReport1.PageNumber + 1);
    QRLabelSegue.Enabled := True;
  end else begin
    QRLabelSegue.Enabled := False;
  end;
end;


// Ripristina alcuni valori altrimenti quando l'utente stampa
//  dall'anteprima alcune cose non vanno bene
procedure TQReportPreventiviOrdini.RipristinoFineStampa;
begin
  // Solo se PrecChildDestinatarioHeight <> 0 altrimenti succedono casini
  if PrecChildDestinatarioHeight <> 0 then begin
    ChildDestinatario.Height := PrecChildDestinatarioHeight;
    PrecChildDestinatarioHeight := 0;   // Importante non togliere questa riga
  end;
end;



procedure TQReportPreventiviOrdini.QRLabel46Print(sender: TObject;
  var Value: String);
begin
   // Questo gestore di evento viene richiamato per i campi che riguradano la ritenuta di acconto
   //  e fa in modo che se non viene specificata alcuna ritenuta diventino tutti invisibili altrimenti
   //  ovviamente diventano visibili
   if (not PreventiviOrdiniForm.QryDocumentoRITACCPERC.IsNull) and (PreventiviOrdiniForm.QryDocumentoRITACCPERC.Value <> 0) then begin
     // Se è stata specificata una ritenuta di acconto rende il campo visibile in stampa
     (Sender as TQRLabel).Font.Color := QRLabel57.Font.Color;
   end else begin
     // Altrimenti è invisibile
     (Sender as TQRLabel).Font.Color := (Sender as TQRLabel).Color;
   end;
end;

procedure TQReportPreventiviOrdini.QRDBText48Print(sender: TObject;
  var Value: String);
begin
   // Questo gestore di evento viene richiamato per i campi che riguradano la ritenuta di acconto
   //  e fa in modo che se non viene specificata alcuna ritenuta diventino tutti invisibili altrimenti
   //  ovviamente diventano visibili
   if (not PreventiviOrdiniForm.QryDocumentoRITACCPERC.IsNull) and (PreventiviOrdiniForm.QryDocumentoRITACCPERC.Value <> 0) and UltimaPagina then begin
     // Se è stata specificata una ritenuta di acconto rende il campo visibile in stampa
     (Sender as TQRDBText).Font.Color := clBlack;
   end else begin
     // Altrimenti è invisibile
     (Sender as TQRDBText).Font.Color := (Sender as TQRDBText).Color;
   end;
end;

procedure TQReportPreventiviOrdini.QRDBText55Print(sender: TObject;
  var Value: string);
var
  DS: TDataSet;
  Tmp: String;
begin
  DS := (sender as TQRDBText).DataSet;
  Value := Trim(Value);
  // COmpone insieme l'indirizzo con il numero civico perchè alcuni (Termoidraulica Del Bello ad es.)
  //  ci hanno riferito di problemi con l'invio per posta della fattura perchè il numero civico
  //  era stampato troppo lontato dalla via e quindi tornavano indietro per "indirizzo non trovato".
  // NumCivico
  Tmp := Trim(DS.FieldByName('NumCivicoCli').AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' ' + Tmp);
  // Interno
  Tmp := Trim(QryDatiSoggetto.FieldByName('Interno').AsString);
  if Tmp <> '' then
    Value := Trim(Value + ' int. ' + Tmp);
  // Piano
  Tmp := Trim(QryDatiSoggetto.FieldByName('Piano').AsString);
  if Tmp <> '' then
    Value := Trim(Value + ', piano ' + Tmp);
  // Scala
  Tmp := Trim(QryDatiSoggetto.FieldByName('Scala').AsString);
  if Tmp <> '' then
    Value := Trim(Value + ', scala ' + Tmp);
  // Palazzo
  Tmp := Trim(QryDatiSoggetto.FieldByName('Palazzo').AsString);
  if Tmp <> '' then
    Value := Trim(Value + ', palazzo ' + Tmp);
end;

procedure TQReportPreventiviOrdini.QRDBIndirizzoLuogoDestinazione2Print(
  sender: TObject; var Value: string);
begin
  // COmpone insieme l'indirizzo con il numero civico perchè alcuni (Termoidraulica Del Bello ad es.)
  //  ci hanno riferito di problemi con l'invio per posta della fattura perchè il numero civico
  //  era stampato troppo lontato dalla via e quindi tornavano indietro per "indirizzo non trovato".
  Value := Trim(Value + ' ' + (sender as TQRDBText).DataSet.FieldByName('NumCivicoDestMerci').AsString);
end;

procedure TQReportPreventiviOrdini.QRDBText110Print(sender: TObject;
  var Value: String);
begin
  // Se è attivata la gestione delle versioni multiple di uno stesso documento carica
  //  nel registro il carattere "/" come primo carattere-
  if PreventiviOrdiniForm.AbilitaGestioneVersioniDocumento then Value := '/' + Value;
  // Flag che abilita o meno l'aggiunta dell'anno al numero del documento in fase di stampa
  //  (es: Fature 125/2013-)
  if fNumDocUnivoco_AggiungiAnno and fNumDocUnivoco_AnnoDopoRegistro then begin
    Value := Value + FormatDateTime(fNumDocUnivoco_Mask, PreventiviOrdiniForm.QryDocumentoDATADOCUMENTO.AsDateTime);
  end;
end;

procedure TQReportPreventiviOrdini.QRDBText111Print(sender: TObject; var Value: string);
begin
   // Questo gestore di evento viene richiamato per i campi che riguradano la ritenuta di acconto
   //  e fa in modo che se non viene specificata alcuna ritenuta diventino tutti invisibili altrimenti
   //  ovviamente diventano visibili
   if (not PreventiviOrdiniForm.QryDocumentoRITACCPERC.IsNull) and (PreventiviOrdiniForm.QryDocumentoRITACCPERC.Value <> 0) then begin
     // Se è stata specificata una ritenuta di acconto rende il campo visibile in stampa
     Value := Value + '%';
     (Sender as TQRDBText).Font.Color := QRLabel57.Font.Color;
   end else begin
     // Altrimenti è invisibile
     (Sender as TQRDBText).Font.Color := (Sender as TQRDBText).Color;
   end;

end;

procedure TQReportPreventiviOrdini.QRDBText119Print(sender: TObject;
  var Value: String);
begin
   (Sender as TQRDBText).Font.Color := clBlack;
   if (not PreventiviOrdiniForm.StmSezCastellettoIVA.Checked)or(not UltimaPagina) then (Sender as TQRDBText).Font.Color := clWhite;
end;


procedure TQReportPreventiviOrdini.QRDBText167Print(sender: TObject;
  var Value: String);
begin
  // Aggiunge l'eventuale sigla estera se cliente estero
  if  (QryDatiSoggettoESTERO.AsString = 'T')
  and (Trim(QryDatiSoggettoESTERO_SIGLA.AsString) <> '')
  then begin
    Value := Trim(QryDatiSoggettoESTERO_SIGLA.AsString) + ' ' + Value;
  end;
end;

procedure TQReportPreventiviOrdini.QRDBText65Print(sender: TObject;
  var Value: String);
begin
  // Flag che abilita o meno l'aggiunta dell'anno al numero del documento in fase di stampa
  //  (es: Fature 125/2013-)
  if fNumDocUnivoco_AggiungiAnno and not fNumDocUnivoco_AnnoDopoRegistro then begin
    Value := Value + FormatDateTime(fNumDocUnivoco_Mask, PreventiviOrdiniForm.QryDocumentoDATADOCUMENTO.AsDateTime);
  end;
end;

end.

