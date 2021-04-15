unit QRAppuntamento;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, IniFiles, IB_Components,
  StrUtils, DB, DBCtrls;

const
  LUNG_PAGINA_IN_STAMPA = 2690;
  // Lunghezza della pagina in pixel della pagina in stampa (Quanto è alta la pagina in stampa e non in coordinate di designtime)
  RAPPORTO_PIXELSCHERMO_PIXELSTAMPA = 2.66;
  // 1 pixel sullo schermo a design time corrisponde a 2,66 pixels nella stampa sulla stampante.

  // COSTANTI DEI COLORI DELLE ETICHETTE E DEI CAMPI DELL'ELENCO APPARECCHI
  PRATAPPDATA_LABEL_COLOR = clGray;
  PRATAPPDATA_FIELD_COLOR = clBlack;

  // Costante che determina l'altezza dell'etichetta laterale di alcune bande
  // tipo SOggetto, Appuntamento ecc. in pratica se è a 2 questa etichetta
  // e quindi la bamba grigia a SX sarà alta come la banda - 2
  SX_BAND_LABEL_CORRECTION = -2;

  // Costante che indica la separazione tra alcuni campi
  SEP = 10;

  // Costante che indica l'interlinea nella note caricate a mano
  INTERLINEA = 11;

type
  TAppuntamentoQR = class(TQuickRep)
    QRBandStart: TQRBand;
    QRBandTitoloRapportoIntervento: TQRBand;
    QRBandTitoloChiamata: TQRChildBand;
    QRBandTitolo: TQRChildBand;
    QRBandDatiChiamata: TQRChildBand;
    QRBandImmobile: TQRChildBand;
    QRBandResponsabileImpianto: TQRChildBand;
    QRBandProprietario: TQRChildBand;
    QRBandUtente: TQRChildBand;
    QRBandInstallatore: TQRChildBand;
    QRBandTitoloDatiImpianto: TQRChildBand;
    QRBandNumDataImpianto: TQRChildBand;
    QRBandRapportoIntervento: TQRChildBand;
    QRShapeRelazioneIntervento: TQRShape;
    QRLabel134: TQRLabel;
    QRDBTextRelazioneIntervento: TQRDBText;
    QRBandFirme: TQRChildBand;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRBandLogoPiede: TQRChildBand;
    ImagePiede: TQRImage;
    QRBandDatiAppuntamento: TQRChildBand;
    QRBandNoteImpianto: TQRChildBand;
    QRBandNoteSoggetto: TQRChildBand;
    QRBandPropUtAmm: TQRChildBand;
    QRBandPrescrizioniFooter: TQRBand;
    QRBandPrescrizioniHeader: TQRBand;
    QRBandNoteImpiantoHeader: TQRBand;
    QRBandNoteImpiantoFooter: TQRBand;
    QRLabel57: TQRLabel;
    QRLabel85: TQRLabel;
    QRBandDatiApparecchiHeader: TQRBand;
    QRBandDatiApparecchiFooter: TQRBand;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRShapeApparecchiRight: TQRShape;
    QRDBText62: TQRDBText;
    dbeGaranzia: TQRDBText;
    dbeNoteGaranzia: TQRDBText;
    AppData_GenCal_Potenza: TQRDBText;
    AppData_GenCal_LabelPotenza: TQRLabel;
    AppData_GenCal_LabelCameraTipo: TQRLabel;
    AppData_GenCal_CameraTipo: TQRDBText;
    AppData_GenCal_LabelCombustibile: TQRLabel;
    AppData_GenCal_Combustibile: TQRDBText;
    AppData_GenCal_CombustibileAltro: TQRDBText;
    QRDBText112: TQRDBText;
    QRLabelEtichettaTipoApparecchio: TQRDBText;
    AppData_Bruc_LabelCampoFunzionamento: TQRLabel;
    AppData_Bruc_Potenza: TQRDBText;
    AppData_Bruc_LabelKW: TQRLabel;
    AppData_PompCirc_LabelVolts: TQRLabel;
    AppData_PompCirc_Volts: TQRDBText;
    AppData_PompCirc_Potenza: TQRDBText;
    AppData_PompCirc_LabelPortata: TQRLabel;
    AppData_PompCirc_Portata: TQRDBText;
    AppData_PompCirc_LabelPrevalenza: TQRLabel;
    AppData_PompCirc_Prevalenza: TQRDBText;
    AppData_Freddo_Volts: TQRDBText;
    AppData_Freddo_LabelVolts: TQRLabel;
    AppData_Freddo_Potenza: TQRDBText;
    AppData_Freddo_LabelGas: TQRLabel;
    AppData_Freddo_Carica: TQRDBText;
    AppData_Freddo_LabelKG: TQRLabel;
    AppData_Freddo_Refrigerante: TQRDBText;
    AppData_Freddo_LabelRese: TQRLabel;
    AppData_Freddo_Rese: TQRLabel;
    AppData_Freddo_LabelReseKW: TQRLabel;
    QRShape_AppLink_Upper: TQRShape;
    QRShape_AppLink_Lower: TQRShape;
    QRShape_AppLink_Horz: TQRShape;
    QRLabel139: TQRLabel;
    QRBandOpHeader: TQRBand;
    QRBandOpFooter: TQRBand;
    QRBandPrecIntHeader: TQRBand;
    QRBandPrecIntFooter: TQRBand;
    QRLabel140: TQRLabel;
    QRLabel142: TQRLabel;
    QRShape2: TQRShape;
    QRLabel155: TQRLabel;
    QRShape4: TQRShape;
    QRLabel160: TQRLabel;
    QRShape43: TQRShape;
    QRLabel161: TQRLabel;
    QRShape45: TQRShape;
    QRLabel162: TQRLabel;
    QRShape65: TQRShape;
    QRLabel163: TQRLabel;
    QRShape69: TQRShape;
    QRLabel164: TQRLabel;
    QRShape70: TQRShape;
    QRLabel165: TQRLabel;
    QRShape71: TQRShape;
    QRBandOPChild: TQRChildBand;
    QRShape80: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QROP_Apparecchio: TQRLabel;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape81: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QROP_Codice: TQRDBText;
    QROP_Descrizione: TQRDBText;
    QROP_Periodicita: TQRDBText;
    QROP_Ultima: TQRDBText;
    QROP_Prossima: TQRDBText;
    QROP_Prezzo: TQRDBText;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShapeOpFare: TQRShape;
    QRShapeOpFatto: TQRShape;
    QRShape97: TQRShape;
    QRShape82: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRLabel9: TQRLabel;
    QRShape104: TQRShape;
    QRShape105: TQRShape;
    QRShape106: TQRShape;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRLabel100: TQRLabel;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRShape112: TQRShape;
    QRShapeTitoloChiamata: TQRShape;
    QRLabel132: TQRLabel;
    QRShape114: TQRShape;
    QRShape115: TQRShape;
    QRShape116: TQRShape;
    QRShape117: TQRShape;
    QRShape118: TQRShape;
    QRBandPrescHeader_Old: TQRBand;
    QRBandPrescFooter_Old: TQRBand;
    QRBandPresc_Old: TQRSubDetail;
    QRBandPrecInt: TQRSubDetail;
    QRShape12: TQRShape;
    QRShape18: TQRShape;
    QRShape16: TQRShape;
    QRShape19: TQRShape;
    QRShape17: TQRShape;
    QRLabel22: TQRLabel;
    QRShape15: TQRShape;
    QRPresc_Memo: TQRMemo;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRPresc_Tipo: TQRLabel;
    QRPresc_TecnicoLabel: TQRLabel;
    QRPresc_Data: TQRLabel;
    QRPresc_Tecnico: TQRLabel;
    QRPresc_Apparecchio: TQRLabel;
    QRShape9: TQRShape;
    QRShape11: TQRShape;
    QRShape10: TQRShape;
    QRBandPrescrizioni: TQRSubDetail;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape20: TQRShape;
    QRShape39: TQRShape;
    QRLabel24: TQRLabel;
    QRShape46: TQRShape;
    QRShape53: TQRShape;
    QRShape58: TQRShape;
    QRShape119: TQRShape;
    QRShape120: TQRShape;
    QRShape123: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape124: TQRShape;
    QRShape125: TQRShape;
    QRShape126: TQRShape;
    QRShape61: TQRShape;
    QRShapeApparecchioPrecIntUpper: TQRShape;
    QRShape122: TQRShape;
    QRShape127: TQRShape;
    QRPrecInt_HeaderPrzUnit: TQRShape;
    QRShape130: TQRShape;
    QRShape131: TQRShape;
    QRPrecInt_RifDocData: TQRLabel;
    QRBandPrecIntChild: TQRChildBand;
    QRShapePrecInt_Codice: TQRShape;
    QRShapePrecInt_Descrizione: TQRShape;
    QRShapePrecInt_Apparecchio: TQRShape;
    QRShapePrecInt_PrzUnit: TQRShape;
    QRShapePrecInt_Qta: TQRShape;
    QRShapePrecInt_Final: TQRShape;
    QRPrecInt_Codice: TQRDBText;
    QRPrecInt_Descrizione: TQRDBText;
    QRPrecInt_PrzUnit: TQRDBText;
    QRShape138: TQRShape;
    QRShapePrecIntChild_GrayedPrz: TQRShape;
    QRPrecInt_Qta: TQRDBText;
    QRPrecInt_Apparecchio: TQRLabel;
    QRShapePrecIntChildUpper: TQRShape;
    QRShapePrecint_Sfondo: TQRShape;
    QRShape121: TQRShape;
    QRBandRapportoInterventoSpeseVarie: TQRChildBand;
    QRShape133: TQRShape;
    QRLabel40: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel46: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel53: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel63: TQRLabel;
    QRDBText30: TQRDBText;
    QRBandIntestazioneColonneMerce: TQRChildBand;
    QRShape132: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel64: TQRLabel;
    QRBandLogo: TQRBand;
    ImageIntestazione: TQRImage;
    QRLabelTitolo: TQRLabel;
    QRLabel12: TQRLabel;
    QRBandFooter: TQRBand;
    QRShape21: TQRShape;
    QRLabel25: TQRLabel;
    QRBandMerce: TQRChildBand;
    QRShapeBlankCodice: TQRShape;
    QRShapeBlankDescrizione: TQRShape;
    QRShapeBlankMatricola: TQRShape;
    QRShapeBlankUM: TQRShape;
    QRShapeBlankQta: TQRShape;
    QRShapeBlankImporto: TQRShape;
    QRShapeBlankPrzUnit: TQRShape;
    QRShapeBlankFinal: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRBandDatiApparecchi: TQRSubDetail;
    QRBandOP: TQRSubDetail;
    QRBandSoggetto: TQRChildBand;
    QRDataSoggetto: TQRLabel;
    QRShape36: TQRShape;
    QRLabelEtichettaDatiImpianto: TQRLabel;
    QRLabelDatiImpianto1: TQRLabel;
    QRLabelDatiImpianto2: TQRLabel;
    QRLabelDatiImpianto3: TQRLabel;
    EdUltimoIntervento: TQRLabel;
    SfondoUltimoInterventoImpianto: TQRShape;
    QRLabel21: TQRLabel;
    QRShape37: TQRShape;
    QRLabelEtichettaUbicazioneImpiento: TQRLabel;
    QRLabelUbicazioneImpiento1: TQRLabel;
    QRShape3: TQRShape;
    QRLabelResponsabileImpianto1: TQRLabel;
    QRLabelResponsabileImpianto2: TQRLabel;
    QRLabelEtichettaResponsabileImpianto: TQRLabel;
    QRLabelResponsabileImpianto3: TQRLabel;
    QRShape41: TQRShape;
    CheckProprietario: TQRShape;
    QRLabel19: TQRLabel;
    QRShape63: TQRShape;
    CheckOccupante: TQRShape;
    QRLabel20: TQRLabel;
    CheckTerzoResponsabileOutline: TQRShape;
    CheckTerzoResponsabile: TQRShape;
    QRLabel26: TQRLabel;
    QRShape113: TQRShape;
    CheckAmministratore: TQRShape;
    QRLabel33: TQRLabel;
    QRShapeSfondoInQualitaDi: TQRShape;
    QRLabel37: TQRLabel;
    QRShape38: TQRShape;
    QRLabelEtichettaProprietarioImpianto: TQRLabel;
    QRLabelProprietarioImpianto1: TQRLabel;
    QRLabelProprietarioImpianto2: TQRLabel;
    QRLabelProprietarioImpianto3: TQRLabel;
    QRShape1: TQRShape;
    QRLabelEtichettaUtenteImpianto: TQRLabel;
    QRLabelUtenteImpianto1: TQRLabel;
    QRLabelUtenteImpianto2: TQRLabel;
    QRLabelUtenteImpianto3: TQRLabel;
    QRShape42: TQRShape;
    QRLabelEtichettaAmministratoreImpianto: TQRLabel;
    QRLabelAmministratoreImpianto1: TQRLabel;
    QRLabelAmministratoreImpianto2: TQRLabel;
    QRLabelAmministratoreImpianto3: TQRLabel;
    QRShape44: TQRShape;
    QRLabelEtichettaPropUtAmm1: TQRLabel;
    QRLabelEtichettaPropUtAmm2: TQRLabel;
    QRLabelEtichettaPropUtAmm3: TQRLabel;
    QRShape48: TQRShape;
    QRShape59: TQRShape;
    QRLabelPropRidotto1: TQRLabel;
    QRLabelUtRidotto1: TQRLabel;
    QRLabelAmmRidotto1: TQRLabel;
    QRShape49: TQRShape;
    QRLabelEtichettaImpiantoNote: TQRLabel;
    QRLabelImpiantoNoteModello: TQRLabel;
    QRShapeApparecchioTopBorder: TQRShape;
    QRBandContratto: TQRChildBand;
    QRShape31: TQRShape;
    QRLabelEtichettaDatiContratto: TQRLabel;
    SfondoContrattoValidita: TQRShape;
    QRLabelDatiContrattoStato: TQRLabel;
    QRLabelDatiContrattoDescrizValidita: TQRLabel;
    QRLabelDatiContrattoDataScadenza: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabelDatiContrattoImporto: TQRLabel;
    QRLabelDatiContratto1: TQRLabel;
    QRLabelMarkerLeft: TQRLabel;
    QRLabelMarkerRight: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape32: TQRShape;
    QRShapeBlankReso: TQRShape;
    QRDocNum: TQRDBText;
    QRLabelDocNum: TQRLabel;
    QRLabelOpMarkerLeft: TQRLabel;
    QRLabelOpMarkerRight: TQRLabel;
    QRShape33: TQRShape;
    TipoInterventoPrimaAccensione: TQRShape;
    QRLabel5: TQRLabel;
    QRShape35: TQRShape;
    TipoInterventoManutenzione: TQRShape;
    QRLabel6: TQRLabel;
    QRShape62: TQRShape;
    TipoInterventoGuasto: TQRShape;
    QRLabel7: TQRLabel;
    QRMemoMotivoChiamata: TQRMemo;
    QRMemoLuogoAppuntamento: TQRMemo;
    QRMemoDataSoggetto: TQRMemo;
    QRMemoNoteSoggetto: TQRMemo;
    QRShape22: TQRShape;
    QRShapeOpApparecchioUpper: TQRShape;
    QRShapeElencoRicambiRiga: TQRShape;
    QRLabelPrecIntMarkerLeft: TQRLabel;
    QRLabelPrecIntMarkerRight: TQRLabel;
    QRDBText1: TQRDBText;
    QRBandMessaggi: TQRChildBand;
    QRMessaggi: TQRDBText;
    QRShapeMessaggi: TQRShape;
    QRBandInizioFineIntevento1: TQRChildBand;
    QRShape50: TQRShape;
    QRLabel1: TQRLabel;
    QRLDataOraInizioIntervento: TQRDBText;
    QRLabel2: TQRLabel;
    QRLTecnico: TQRLabel;
    QRLabel14: TQRLabel;
    QRLDataOraFineIntervento: TQRDBText;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape60: TQRShape;
    QRBandInizioFineIntevento2: TQRChildBand;
    QRBandInizioFineIntevento3: TQRChildBand;
    QRBandInizioFineIntevento4: TQRChildBand;
    QRBandInizioFineIntevento5: TQRChildBand;
    QRShape34: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape40: TQRShape;
    QRShape47: TQRShape;
    QRShape64: TQRShape;
    QRShape66: TQRShape;
    QRLabel31: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel43: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape128: TQRShape;
    QRShape129: TQRShape;
    QRLabel44: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel50: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape134: TQRShape;
    QRShape135: TQRShape;
    QRShape136: TQRShape;
    QRShape137: TQRShape;
    QRLabel51: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel54: TQRLabel;
    QRLabel58: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape139: TQRShape;
    QRShape140: TQRShape;
    QRShape141: TQRShape;
    QRBandDatiFatturazione: TQRChildBand;
    QRLabel16: TQRLabel;
    QRLabelNoteSoggetto: TQRLabel;
    QRLabelMotivoChiamata: TQRLabel;
    QRLabelLuogoAppuntamento: TQRLabel;
    QRLabelCliente: TQRLabel;
    QRLabelAppuntamento: TQRLabel;
    QRBandStatoDocumento: TQRChildBand;
    QRShape54: TQRShape;
    QRShape142: TQRShape;
    QRLabel61: TQRLabel;
    QRShape143: TQRShape;
    QRLabel62: TQRLabel;
    QRShape144: TQRShape;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRShape145: TQRShape;
    QRLabel41: TQRLabel;
    QRBandRichiedente: TQRChildBand;
    QRLabelRichiedente: TQRLabel;
    QRMemoRichiedente: TQRMemo;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure AggiornaDatiUltimiInterventi;
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QRBandLogoPiedeAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBandTitoloDatiImpiantoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandNumDataImpiantoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandResponsabileImpiantoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandNoteImpiantoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandDatiApparecchiBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandDatiApparecchiNeedData(Sender: TObject;
      var MoreData: Boolean);
    procedure QRBandOPBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandOPNeedData(Sender: TObject; var MoreData: Boolean);
    procedure QROP_PrezzoPrint(Sender: TObject; var Value: String);
    procedure QRBandOPChildBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandPrescrizioniBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandPrescrizioniNeedData(Sender: TObject;
      var MoreData: Boolean);
    procedure QRBandPrecIntBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandPrecIntNeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRBandPrecIntChildBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandLogoAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure QRBandMerceBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandRapportoInterventoSpeseVarieBeforePrint
      (Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBandImmobileBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandProprietarioBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandUtenteBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandInstallatoreBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandPropUtAmmBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabelEtichettaTipoApparecchioPrint(Sender: TObject;
      var Value: String);
    procedure QRBandContrattoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QROP_UltimaPrint(Sender: TObject; var Value: String);
    procedure QRPrecInt_PrzUnitPrint(Sender: TObject; var Value: String);
    procedure QRPrecInt_QtaPrint(Sender: TObject; var Value: String);
    procedure QROP_PeriodicitaPrint(Sender: TObject; var Value: String);
    procedure QRDBText112Print(Sender: TObject; var Value: string);
    procedure QRDBText1Print(Sender: TObject; var Value: string);
    procedure QRBandInizioFineIntevento1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    fApparecchioPrimo, fApparecchioUltimo: Boolean;
    fOpPrimo, fOpUltimo: Boolean;
    fPrescPrimo, fPrescUltimo: Boolean;
    fPrecIntPrimo, fPrecIntUltimo: Boolean;
    fNumRigaDatiApparecchi: Integer;
    fRigaSeparazioneApparecchiStampata: Boolean;
    // Flags che indicano se deve essere stamapo o meno
    // l'elenco ai quali si riferiscono.
    fGoStampaPrescrizioni, fGoStampaApparecchi, fGoStampaOP,
      fGoStampaPrecedenti: Boolean;
    // Variabile che contiene il conto di quanti documenti sono stati stampati fino ad ora
    // nei Precedenti
    fNumInterventiPrecedentiStampati: Integer;
    // Larghezza della descrizione dei precedenti (in base a se ci sono più di un apparecchio oppure no)
    fPrecedentiLarghezzaDescrizione: Integer;
    // Loghi del documento
    IntestazBMP, PiedeBMP: TBitmap;
    function ConvCoord(Coord: Integer; Fattore: Extended): Integer;
    procedure InizializzaFlagsAbilitazioneStampaElenchi;
    procedure PrepareUnprepareGridsForPrint(Prepare: Boolean);
    procedure CalcolaDimensioniRigaElencoApparecchi(Modo: String);
    function GetPrecedentiSuperatoLimite: Boolean;
    procedure CaricaNote(CurrBand: TQRCustomBand; TextLines: TStrings;
      Modello: TQRLabel; MinimalHeight: Integer = 0;
      LocInterlinea: Integer = 0);
    procedure CaricaDatiSoggetto(Lbl1, Lbl2, Lbl3: TQRLabel;
      RagSoc, Indirizzo, NumCivico, Citta, Provincia, Telefono,
      Cellulare: String);
    procedure CaricaDatiSoggettoSuMemo(Lbl1: TQRLabel; Memo1: TQRMemo;
      RagSoc, Indirizzo, NumCivico, Citta, Provincia, Telefono,
      Cellulare: String);
  public
    // Proprietà che ritorna True se è stato superato il limite di interventi precedenti
    // stampati nell'elenco dei precedenti.
    property PrecedentiSuperatoLimite: Boolean read GetPrecedentiSuperatoLimite;
  end;

var
  AppuntamentoQR: TAppuntamentoQR;

implementation

uses FormImpegni, DataModule1, cxGridCustomTableView,
  cxGridTableView, Dialogs;

{$R *.DFM}

// Questa procedura aggiorna i valori del pannello riassuntivo degli ultimi
// interventi e di previsione di quello successivo.
procedure TAppuntamentoQR.AggiornaDatiUltimiInterventi;
var
  Qry: TIB_Cursor;
begin
  // Se l'impegno non fà parte di nessun impianto esce
  if ImpegnoForm.QryImpPRATICA.IsNull or ImpegnoForm.QryImpDATAPRATICA1.IsNull
  then
    Exit;

  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // ===========================================================================================
    // Imposta la query per prelevare la data dell'ultimo imtervento di manutenzione programmata
    // effettuato per l'impiento
    // -------------------------------------------------------------------------------------------
    Qry.SQL.Add
      ('SELECT MAX(DATAORAINTERVENTO) AS ULTIMOINTERVENTO FROM IMPEGNI WHERE');
    Qry.SQL.Add('PRATICA = ' + ImpegnoForm.QryImpPRATICA.AsString +
      ' AND DATAPRATICA1 = ''' + FormatDateTime('mm/dd/yyyy',
      ImpegnoForm.QryImpDATAPRATICA1.AsDateTime) + '''');
    Qry.SQL.Add('AND DATAORAINTERVENTO IS NOT NULL');
    // Apre la query e se trova qualcosa aggiorna i relativi Edit nella form
    Qry.Open;
    if not Qry.Eof then
    begin
      if not Qry.Fields[0].IsNull then
      begin
        EdUltimoIntervento.Caption := LeftStr(Qry.Fields[0].AsString, 10);
      end
      else
      begin
        EdUltimoIntervento.Caption := '- - -';
      end;
    end;
    // ===========================================================================================

  finally
    Qry.Free;
  end;
end;

// Inizializza i flags che indicano se deve essere stamapo o meno
// l'elenco ai quali si riferiscono.
procedure TAppuntamentoQR.InizializzaFlagsAbilitazioneStampaElenchi;
begin
  // Abilita la stampa dell'elenco seguente se questo è espressamente attivato nei
  // parametri, se l'impianto è assegnato e se ci sono records da stampare.
  fGoStampaPrescrizioni :=
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_PRESCRIZIONI.AsString = 'T') and
    ImpegnoForm.ImpiantoAssegnato and
    (ImpegnoForm.btvPresc.DataController.RecordCount > 0);

  // Abilita la stampa dell'elenco seguente se questo è espressamente attivato nei
  // parametri, se l'impianto è assegnato e se ci sono records da stampare.
  fGoStampaApparecchi :=
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_APPARECCHI.AsString <> 'F')
  // NB: <> 'F' perchè può avere più valori che la attivano in modo diverso
    and ImpegnoForm.ImpiantoAssegnato and
    (ImpegnoForm.tvApp.DataController.RecordCount > 0);

  // Abilita la stampa dell'elenco seguente se questo è espressamente attivato nei
  // parametri, se l'impianto è assegnato e se ci sono records da stampare.
  fGoStampaOP := (ImpegnoForm.QryParamFoglioLavoroFL_DATI_OP.AsString = 'T') and
    ImpegnoForm.ImpiantoAssegnato and
    (ImpegnoForm.btvOP.DataController.RecordCount > 0);

  // Abilita la stampa dell'elenco seguente se questo è espressamente attivato nei
  // parametri, se l'impianto è assegnato e se ci sono records da stampare.
  fGoStampaPrecedenti :=
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_PRECEDENTI.AsString = 'T') and
    ImpegnoForm.ImpiantoAssegnato and
    (ImpegnoForm.btvPrecInt.DataController.RecordCount > 0);
end;

// Procedure che prepara le griglie dell'appuntamento per la stampa
// e successivamente poile rimete anche a posto
procedure TAppuntamentoQR.PrepareUnprepareGridsForPrint(Prepare: Boolean);
begin
  // -------------------------------
  // Prescrizioni
  if fGoStampaPrescrizioni then
  begin
    if Prepare then
    begin
      // Si sposta sul primo record
      ImpegnoForm.btvPresc.DataController.GotoFirst;
    end;
  end;
  // -------------------------------
  // Apparecchi
  if fGoStampaApparecchi then
  begin
    if Prepare then
    begin
      // Si sposta sul primo record
      ImpegnoForm.tvApp.DataController.GotoFirst;
    end;
  end;
  // -------------------------------
  // Operazioni Pianificate
  if fGoStampaOP then
  begin
    if Prepare then
    begin
      // Prima di stampare toglie il raggruppamento altrimenti stampa male
      ImpegnoForm.btvOPIDAPPARECCHIOPRAT.GroupIndex := -1;
      // Si sposta sul primo record
      ImpegnoForm.btvOP.DataController.GotoFirst;
    end;
  end;
  // -------------------------------
  // Precedenti
  if fGoStampaPrecedenti then
  begin
    if Prepare then
    begin
      // Prima di stampare toglie il raggruppamento altrimenti stampa male
      ImpegnoForm.btvPrecIntMASTER_ID.GroupIndex := -1;
      // Si sposta sul primo record
      ImpegnoForm.btvPrecInt.DataController.GotoFirst;
    end
    else
    begin
      // Prima di stampare toglie il raggruppamento altrimenti stampa male
      ImpegnoForm.btvPrecIntMASTER_ID.GroupIndex := 0;
    end;
  end;
  // -------------------------------
end;

procedure TAppuntamentoQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
const
  SEPARAZIONE = 25;
var
  LO: TMemIniFile;
  TmpStr: String;
  CurrShape: TQRShape;
  i, RigaCurrPos: Integer;
begin
  // Inizializzazione
  fNumInterventiPrecedentiStampati := 0;
  QRBandPrecInt.Tag := 0;
  // NB: Non togliere altrimenti ci sono problemi alla stampa con 1 solo precedente non stampa il riferimento al documento
  IntestazBMP := TBitmap.Create;
  PiedeBMP := TBitmap.Create;
  // Inizializzazione di alcune variabili usate per la stampa degli elenchi
  fNumRigaDatiApparecchi := 0;
  fApparecchioPrimo := True;
  fApparecchioUltimo := False;
  fOpPrimo := True;
  fOpUltimo := False;
  fPrescPrimo := True;
  fPrescUltimo := False;
  fPrecIntPrimo := True;
  fPrecIntUltimo := False;
  fRigaSeparazioneApparecchiStampata := False;
  // Inizializza i flags che indicano se deve essere stamapo o meno
  // l'elenco ai quali si riferiscono.
  InizializzaFlagsAbilitazioneStampaElenchi;
  // Procedure che prepara le griglie dell'appuntamento per la stampa
  // e successivamente poile rimete anche a posto
  PrepareUnprepareGridsForPrint(True);
  // ===========================================================================
  // LOGO INIZIALE E FINALE
  // ---------------------------------------------------------------------------
  // Apre il file con le impostazioni dei loghi
  LO := TMemIniFile.Create(DM1.Repository_Loghi.FullLocalFileName);
  try
    // ---------- ABILITAZIONE LOGO INIZIALE ----------
    if (ImpegnoForm.QryParamFoglioLavoroFL_LOGO_INTESTAZIONE.AsString = 'T')
    then
    begin
      ImageIntestazione.Width := LO.ReadInteger('Foglio di lavoro',
        'LargIntestazione', 10);
      ImageIntestazione.Height := LO.ReadInteger('Foglio di lavoro',
        'AltIntestazione', 10);
      // HO disabilitato il blocco perchè ad Andrea serviva fare l'ntestazione e il piede più larghi
      // if ImageIntestazione.Width > 500 then ImageIntestazione.Width := 500;
      // HO disabilitato il blocco perchè ad Andrea serviva fare l'ntestazione e il piede più larghi
      if (ImageIntestazione.Width > 0) and (ImageIntestazione.Height > 0) then
      begin
        QRBandLogo.Height := ImageIntestazione.Height + 6;
        QRBandLogo.Enabled := True;
      end;
      if LO.ReadBool('Foglio di lavoro', 'AbilitaStampaIntestazione', True) and
        FileExists(DM1.LoghiDir + 'intestaz' +
        IntToStr(LO.ReadInteger('Foglio di lavoro', 'LayoutDocumento', 1)) +
        '.bmp') then
      begin
        IntestazBMP.LoadFromFile(DM1.LoghiDir + 'intestaz' +
          IntToStr(LO.ReadInteger('Foglio di lavoro', 'LayoutDocumento', 1))
          + '.bmp');
        ImageIntestazione.Enabled := True;
      end
      else
      begin
        ImageIntestazione.Enabled := False;
      end;
    // Se invece la banda è disabilitata la imposta ad altezza zero ma la lascia abilitata
    // altrimenti potrebbe dare problemi alle bande successive
    end
    else
      QRBandLogo.Height := 0;
    // ---------- ABILITAZIONE LOGO PIEDE FINALE ----------
    if (ImpegnoForm.QryParamFoglioLavoroFL_LOGO_PIEDE.AsString = 'T') then
    begin
      // Carica le impostazioni del piede
      ImagePiede.Width := LO.ReadInteger('Foglio di lavoro', 'LargPiede', 10);
      ImagePiede.Height := LO.ReadInteger('Foglio di lavoro', 'AltPiede', 10);
      // HO disabilitato il blocco perchè ad Andrea serviva fare l'ntestazione e il piede più larghi
      // if ImagePiede.Width > 500 then ImagePiede.Width := 500;
      // HO disabilitato il blocco perchè ad Andrea serviva fare l'ntestazione e il piede più larghi
      // Se l'altezza del piede  è > 0 imposta tale altezza altrimento la forza a zero
      if (ImagePiede.Width > 0) and (ImagePiede.Height > 0) then
        QRBandLogoPiede.Height := ImagePiede.Height + 6
      else
        QRBandLogoPiede.Height := 0;
      // Se abilitata alla stampa carica la Bitmap del piede del documento
      if LO.ReadBool('Foglio di lavoro', 'AbilitaStampaPiede', True) and
        FileExists(DM1.LoghiDir + 'piede' +
        IntToStr(LO.ReadInteger('Foglio di lavoro', 'LayoutDocumento', 1)) +
        '.bmp') then
      begin
        PiedeBMP.LoadFromFile(DM1.LoghiDir + 'piede' +
          IntToStr(LO.ReadInteger('Foglio di lavoro', 'LayoutDocumento', 1))
          + '.bmp');
        ImagePiede.Enabled := True;
      end
      else
      begin
        ImagePiede.Enabled := False;
      end;
    // Se invece la banda è disabilitata la imposta ad altezza zero ma la lascia abilitata
    // altrimenti potrebbe dare problemi alle bande successive
    end
    else
      QRBandLogoPiede.Height := 0;
    // Pulizie finali
  finally
    // Chiude il file con le impostazioni dei loghi
    LO.Free;
  end;
  // ===========================================================================

  // ===========================================================================
  // ELENCO PRESCRIZIONI
  // ---------------------------------------------------------------------------
  // Se disabilitato imposta l'altezza = 0
  if not fGoStampaPrescrizioni then
  begin
    QRBandPrescrizioniHeader.Height := 0;
    QRBandPrescrizioni.Height := 0;
    QRBandPrescrizioniFooter.Height := 0;
  end;
  // ===========================================================================

  // ===========================================================================
  // TITOLO DOCUMENTO ("RAPPORTO DI INTERVENTO")
  // ---------------------------------------------------------------------------
  // Se disabilitato imposta l'altezza = 0
  if (ImpegnoForm.QryParamFoglioLavoroFL_TITOLO.AsString = 'F') then
  begin
    QRBandTitolo.Height := 0;
  end
  else
  begin
    // Costruisce il dato
    // TmpStr := 'FOGLIO DI LAVORO:   ';
    TmpStr := '';
    // Se è un appuntamento...
    if (not ImpegnoForm.QryImpSTART.IsNull) and (ImpegnoForm.QryImpSTART.AsDateTime > 0) then
    begin
      QRLabelAppuntamento.Caption := Trim(ImpegnoForm.QryParamFoglioLavoroFL_LABEL_APPUNTAMENTO.AsString);
      TmpStr := TmpStr + FormatDateTime('dd/mm/yyyy "-" hh:nn', ImpegnoForm.QryImpSTART.AsDateTime)
    end
    else
    begin
      // Se invece è una chiamata...
      if (not ImpegnoForm.QryImpDATAORACHIAMATA.IsNull) and
        (ImpegnoForm.QryImpDATAORACHIAMATA.AsDateTime > 0) then
        QRLabelAppuntamento.Caption :=
          Trim(ImpegnoForm.QryParamFoglioLavoroFL_LABEL_CHIAMATA.AsString);
      TmpStr := TmpStr + FormatDateTime('dd/mm/yyyy "-" hh:nn',
        ImpegnoForm.QryImpDATAORACHIAMATA.AsDateTime);
      if QRLabelAppuntamento.Caption = '' then
        TmpStr := 'Chiamata del ' + TmpStr;
    end;
    // Eggiunge l'eventuale Urgente
    if (ImpegnoForm.QryImpURGENTE.AsString = 'T') then
      TmpStr := TmpStr + ' URGENTE';
    // Aggiunge l'eventuale R.D.A.
    if (Trim(ImpegnoForm.QryImpRDA.AsString) <> '') then
      TmpStr := TmpStr + Format(' (RDA %s)', [Trim(ImpegnoForm.QryImpRDA.AsString)]);
    // Se le etidhette sono vuote rimette il campo all'estrema destra e lo ridimensiona
    if QRLabelAppuntamento.Caption = '' then
    begin
      QRLabelTitolo.Width := QRLabelTitolo.Width +
        (QRLabelTitolo.Left - QRLabelAppuntamento.Left);
      QRLabelTitolo.Left := QRLabelAppuntamento.Left;
    end;
    // Carica la data e ora dell'appuntamento
    QRLabelTitolo.Caption := TmpStr;
    // Carica i valori nei campi
    TmpStr := ImpegnoForm.QryImpTIPOINTERVENTO.AsString;
    TipoInterventoGuasto.Enabled := (Pos('Guasto', TmpStr) > 0);
    TipoInterventoPrimaAccensione.Enabled :=
      (Pos('Prima accensione', TmpStr) > 0) or (Pos('Collaudo', TmpStr) > 0);
    TipoInterventoManutenzione.Enabled := (Pos('Manutenzione', TmpStr) > 0);
  end;
  // ===========================================================================

  // ===========================================================================
  // DATI SOGGETTO / RESPONSABILE IMPIANTO / PROP. CANTIERE
  // ---------------------------------------------------------------------------
  // Se disabilitato imposta l'altezza = 0
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_SOGGETTO.AsString = 'F') then
  begin
    QRBandSoggetto.Height := 0;
  end
  else
  begin
    // Carica le etichette e se sono vuote riposiziona il dato
    QRLabelCliente.Caption :=
      Trim(ImpegnoForm.QryParamFoglioLavoroFL_LABEL_CLIENTE.AsString);
    if QRLabelCliente.Caption = '' then
    begin
      QRDataSoggetto.Width := QRDataSoggetto.Width +
        (QRDataSoggetto.Left - QRLabelCliente.Left);
      QRDataSoggetto.Left := QRLabelCliente.Left;
    end;
    // Carica i dati -------------
    // Se è relativo a un impianto carica id ati del Responsabile dell'impianto
    if ImpegnoForm.ImpiantoAssegnato then
    begin
      if ImpegnoForm.QryAssNATURAGIURIDICARESPIMP.AsString = 'F' then
        TmpStr := ImpegnoForm.QryAssCOGNOMERESPIMP.AsString + ' ' +
          ImpegnoForm.QryAssNOMERESPIMP.AsString
      else
        TmpStr := ImpegnoForm.QryAssRAGSOCRESPIMP.AsString;
      TmpStr := LeftStr(TmpStr, 60);
      CaricaDatiSoggettoSuMemo(QRDataSoggetto, QRMemoDataSoggetto, TmpStr, '',
        // ImpegnoForm.QrySoggINDIRIZZO.AsString,
        '', // ImpegnoForm.QrySoggNUMCIVICO.AsString,
        '', // ImpegnoForm.QrySoggCITTA.AsString,
        ImpegnoForm.QryAssINQUALITADIRESPIMP.AsString,
        // ImpegnoForm.QrySoggPROVINCIA.AsString,
        ImpegnoForm.QryAssTELEFONORESPIMP.AsString,
        ImpegnoForm.QryAssCELLULARERESPIMP.AsString);
      // Se è relativo ad un cantiere/pratica
    end
    else if ImpegnoForm.PraticaAssegnata then
    begin
      CaricaDatiSoggettoSuMemo(QRDataSoggetto, QRMemoDataSoggetto,
        Trim(ImpegnoForm.QrySoggRAGIONESOCIALE.AsString), '',
        // ImpegnoForm.QrySoggINDIRIZZO.AsString,
        '', // ImpegnoForm.QrySoggNUMCIVICO.AsString,
        '', // ImpegnoForm.QrySoggCITTA.AsString,
        '', // ImpegnoForm.QrySoggPROVINCIA.AsString,
        ImpegnoForm.QrySoggTELEFONO.AsString,
        ImpegnoForm.QrySoggCELLULARE.AsString);
      // Se è relativo solo ad un soggetto...
    end
    else if ImpegnoForm.SoggettoAssegnato then
    begin
      CaricaDatiSoggettoSuMemo(QRDataSoggetto, QRMemoDataSoggetto,
        ImpegnoForm.QrySoggRAGIONESOCIALE.AsString, '',
        // ImpegnoForm.QrySoggINDIRIZZO.AsString,
        '', // ImpegnoForm.QrySoggNUMCIVICO.AsString,
        '', // ImpegnoForm.QrySoggCITTA.AsString,
        '', // ImpegnoForm.QrySoggPROVINCIA.AsString,
        ImpegnoForm.QrySoggTELEFONO.AsString,
        ImpegnoForm.QrySoggCELLULARE.AsString);
      // Se non è nessuno dei precedenti
    end
    else
    begin
      CaricaDatiSoggettoSuMemo(QRDataSoggetto, QRMemoDataSoggetto,
        ImpegnoForm.QryImpRAGSOCCLI.AsString, '',
        // ImpegnoForm.QrySoggINDIRIZZO.AsString,
        '', // ImpegnoForm.QrySoggNUMCIVICO.AsString,
        '', // ImpegnoForm.QrySoggCITTA.AsString,
        '', // ImpegnoForm.QrySoggPROVINCIA.AsString,
        ImpegnoForm.QryImpTELEFONOCLI.AsString,
        ImpegnoForm.QryImpCELLULARECLI.AsString);
    end;
  end;
  // ===========================================================================

  // ===========================================================================
  // NOTE SOGGETTO / IMPIANTO / CANTIERE
  // ---------------------------------------------------------------------------
  // Carica le etichette e se sono vuote riposiziona il dato
  QRLabelNoteSoggetto.Caption :=
    Trim(ImpegnoForm.QryParamFoglioLavoroFL_LABEL_NOTE.AsString);
  if QRLabelNoteSoggetto.Caption = '' then
  begin
    QRMemoNoteSoggetto.Width := QRMemoNoteSoggetto.Width +
      (QRMemoNoteSoggetto.Left - QRLabelNoteSoggetto.Left);
    QRMemoNoteSoggetto.Left := QRLabelNoteSoggetto.Left;
  end;
  // Inizializzazione
  TmpStr := '';
  // In base alla situazione carica il dato opportuno
  if ImpegnoForm.ImpiantoAssegnato then
    TmpStr := Trim(ImpegnoForm.QryAssNOTE.AsString)
  else if ImpegnoForm.PraticaAssegnata then
    TmpStr := Trim(ImpegnoForm.QrySoggNOTE.AsString)
  else if ImpegnoForm.SoggettoAssegnato then
    TmpStr := Trim(ImpegnoForm.QrySoggNOTE.AsString);
  // Se il dato non è vuoto e la stampa della banda è abilitata prosegue con la stampa altrimeni
  // fa in modo che la banda non venga stampata per nulla
  if (TmpStr <> '') and
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_SOGGETTO_NOTE.AsString = 'T') then
  begin
    QRMemoNoteSoggetto.Lines.Clear;
    QRMemoNoteSoggetto.Lines.Add(TmpStr);
  end
  else
    QRBandNoteSoggetto.Height := 0;
  // ===========================================================================

  // ===========================================================================
  // DATI APPUNTAMENTO (LUOGO APPUNTAMENTO)
  // ---------------------------------------------------------------------------
  // Carica le etichette e se sono vuote riposiziona il dato
  QRLabelNoteSoggetto.Caption :=
    Trim(ImpegnoForm.QryParamFoglioLavoroFL_LABEL_NOTE.AsString);
  if QRLabelNoteSoggetto.Caption = '' then
  begin
    QRMemoLuogoAppuntamento.Width := QRMemoLuogoAppuntamento.Width +
      (QRMemoLuogoAppuntamento.Left - QRLabelLuogoAppuntamento.Left);
    QRMemoLuogoAppuntamento.Left := QRLabelLuogoAppuntamento.Left;
  end;
  // Se il testo è vuoto non stampa la banda per nulla
  if (Trim(ImpegnoForm.QryImpLOCATION.AsString) = '') or
    not(ImpegnoForm.QryParamFoglioLavoroFL_DATI_APPUNTAMENTO.AsString = 'T')
  then
  begin
    QRBandDatiAppuntamento.Height := 0;
  end
  else
  begin
    // Carica il testo
    QRMemoLuogoAppuntamento.Lines.Clear;
    QRMemoLuogoAppuntamento.Lines.Add(ImpegnoForm.QryImpLOCATION.AsString);
  end;
  // ===========================================================================

  // ===========================================================================
  // DATI CHIAMATA (MOTIVO DELLA CHIAMATA)
  // ---------------------------------------------------------------------------
  // Carica le etichette e se sono vuote riposiziona il dato
  QRLabelMotivoChiamata.Caption :=
    Trim(ImpegnoForm.QryParamFoglioLavoroFL_LABEL_MOTIVO.AsString);
  if QRLabelMotivoChiamata.Caption = '' then
  begin
    QRMemoMotivoChiamata.Width := QRMemoMotivoChiamata.Width +
      (QRMemoMotivoChiamata.Left - QRLabelMotivoChiamata.Left);
    QRMemoMotivoChiamata.Left := QRLabelMotivoChiamata.Left;
  end;
  // Se il testo è vuoto non stampa la banda per nulla
  if (Trim(ImpegnoForm.QryImpEVENTMESSAGE.AsString) = '') or
    not(ImpegnoForm.QryParamFoglioLavoroFL_DATI_CHIAMATA.AsString = 'T') then
  begin
    QRBandDatiChiamata.Height := 0;
  end
  else
  begin
    // Carica il testo
    QRMemoMotivoChiamata.Lines.Clear;
    QRMemoMotivoChiamata.Lines.Add(ImpegnoForm.QryImpEVENTMESSAGE.AsString);
  end;
  // ===========================================================================

  // ===========================================================================
  // RICHIEDENTE
  // ---------------------------------------------------------------------------
  // Carica le etichette e se sono vuote riposiziona il dato
  QRLabelRichiedente.Caption := Trim(ImpegnoForm.QryParamFoglioLavoroFL_LABEL_RICHIEDENTE.AsString);
  if QRLabelRichiedente.Caption = '' then
  begin
    QRMemoRichiedente.Width := QRMemoRichiedente.Width +
      (QRMemoRichiedente.Left - QRLabelRichiedente.Left);
    QRMemoRichiedente.Left := QRLabelRichiedente.Left;
  end;
  // Se il testo è vuoto non stampa la banda per nulla
  if (Trim(ImpegnoForm.QryImpRICHIEDENTE.AsString) = '') or not(ImpegnoForm.QryParamFoglioLavoroFL_DATI_RICHIEDENTE.AsString = 'T') then
    QRBandRichiedente.Height := 0
  else
  begin
    // Carica il testo
    QRMemoRichiedente.Lines.Clear;
    QRMemoRichiedente.Lines.Add(ImpegnoForm.QryImpRICHIEDENTE.AsString);
  end;
  // ===========================================================================

  // ===========================================================================
  // DATI INTESTAZIONE FATTURA
  // ---------------------------------------------------------------------------
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_INTESTAZFATTURA.AsString = 'F')
  then
    QRBandDatiFatturazione.Height := 0;
  // ===========================================================================

  // ===========================================================================
  // CHIAMATA + APPUNTAMENTO + DATI SOGGETTO + NOTE SOGGETTO
  // ---------------------------------------------------------------------------
  // Titolo Chiamata/Appuntamento
  if (QRBandDatiChiamata.Height = 0) and (QRBandDatiAppuntamento.Height = 0) and
    (QRBandSoggetto.Height = 0) and (QRBandNoteSoggetto.Height = 0) and
    (QRBandDatiFatturazione.Height = 0) then
    QRBandTitoloChiamata.Height := 0;
  // ===========================================================================

  // ===========================================================================
  // DATI IMPIANTO
  // ---------------------------------------------------------------------------
  // Dati impianto (tipo, num, data ecc)
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_IMPIANTO.AsString = 'F') or
    (not ImpegnoForm.ImpiantoAssegnato) then
    QRBandNumDataImpianto.Height := 0;
  // Contratto / Abbonamento
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_ABBONAMENTO.AsString = 'F') or
    (not ImpegnoForm.ImpiantoAssegnato) then
    QRBandContratto.Height := 0;
  // Ubicazione immobile impianto
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_IMMOBILE.AsString = 'F') or
    (not ImpegnoForm.ImpiantoAssegnato) then
    QRBandImmobile.Height := 0;
  // Responsabile impianto
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_RESPIMP.AsString = 'F') or
    (not ImpegnoForm.ImpiantoAssegnato) then
    QRBandResponsabileImpianto.Height := 0;
  // Proprietario
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_PROPRIETARIO.AsString = 'F') or
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_PROP_UT_AMM.AsString = 'T')
  // NB: Cmq. se è attivata la banda che riepiloga alcuni dati di Propritario, Utente, Amministratore non la stampa
    or (not ImpegnoForm.ImpiantoAssegnato) then
    QRBandProprietario.Height := 0;
  // Utente/Occupante
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_UTENTE.AsString = 'F') or
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_PROP_UT_AMM.AsString = 'T')
  // NB: Cmq. se è attivata la banda che riepiloga alcuni dati di Propritario, Utente, Amministratore non la stampa
    or (not ImpegnoForm.ImpiantoAssegnato) then
    QRBandUtente.Height := 0;
  // Amministratore
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_INSTALLATORE.AsString = 'F') or
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_PROP_UT_AMM.AsString = 'T')
  // NB: Cmq. se è attivata la banda che riepiloga alcuni dati di Propritario, Utente, Amministratore non la stampa
    or (not ImpegnoForm.ImpiantoAssegnato) then
    QRBandInstallatore.Height := 0;
  // Riepilogativa di Proprietario + Utente/occupante + Amministratore
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_PROP_UT_AMM.AsString = 'F') or
    (not ImpegnoForm.ImpiantoAssegnato) then
    QRBandPropUtAmm.Height := 0;
  // Note impianto
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_IMPIANTO_NOTE.AsString = 'F') or
    (not ImpegnoForm.ImpiantoAssegnato) or
    (Trim(ImpegnoForm.dbeNoteImpianto.Text) = '')
  // Se le note non ci sono ovviamente non deve stampare nulla
  then
    QRBandNoteImpianto.Height := 0
  else
    CaricaNote(QRBandNoteImpianto, ImpegnoForm.dbeNoteImpianto.Lines,
      QRLabelImpiantoNoteModello, 0);
  // ===========================================================================

  // ===========================================================================
  // ELENCO APPARECCHI
  // ---------------------------------------------------------------------------
  // Se disabilitato imposta l'altezza = 0
  if not fGoStampaApparecchi then
  begin
    QRBandDatiApparecchiHeader.Height := 0;
    QRBandDatiApparecchi.Height := 0;
    QRBandDatiApparecchiFooter.Height := 0;
  end;
  // ===========================================================================

  // ===========================================================================
  // OPERAZIONI PIANIFICATE
  // ---------------------------------------------------------------------------
  // Se disabilitato imposta l'altezza = 0
  if not fGoStampaOP then
  begin
    QRBandOpHeader.Height := 0;
    QRBandOP.Height := 0;
    QRBandOPChild.Height := 0;
    QRBandOpFooter.Height := 0;
  end;
  // ===========================================================================

  // ===========================================================================
  // PRECEDENTI
  // ---------------------------------------------------------------------------
  // Se disabilitato imposta l'altezza = 0
  if not fGoStampaPrecedenti then
  begin
    QRBandPrecIntHeader.Height := 0;
    QRBandPrecInt.Height := 0;
    QRBandPrecIntChild.Height := 0;
    QRBandPrecIntFooter.Height := 0;
  end;
  // ===========================================================================

  // ===========================================================================
  // MESSAGGI
  // ---------------------------------------------------------------------------
  QRBandMessaggi.Height :=
    ImpegnoForm.QryParamFoglioLavoroFL_MESSAGGIO_ALTEZZA.AsInteger;
  QRMessaggi.Height := QRBandMessaggi.Height;
  QRShapeMessaggi.Height := QRBandMessaggi.Height + 10;
  // Giusto per farlo andare oltre al limite inferiore
  // ===========================================================================

  // ===========================================================================
  // RAPPORTO DI INTERVENTO
  // ---------------------------------------------------------------------------
  // Righe data/ora /inizio/fine intervento
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_RAPPINT_NUMRIGHEDATAORA.AsInteger
    < 1) then
    QRBandInizioFineIntevento1.Height := 0;
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_RAPPINT_NUMRIGHEDATAORA.AsInteger
    < 2) then
    QRBandInizioFineIntevento2.Height := 0;
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_RAPPINT_NUMRIGHEDATAORA.AsInteger
    < 3) then
    QRBandInizioFineIntevento3.Height := 0;
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_RAPPINT_NUMRIGHEDATAORA.AsInteger
    < 4) then
    QRBandInizioFineIntevento4.Height := 0;
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_RAPPINT_NUMRIGHEDATAORA.AsInteger
    < 5) then
    QRBandInizioFineIntevento5.Height := 0;
  // Rapporto intervento
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_RAPPINT.AsString = 'F') then
    QRBandRapportoIntervento.Height := 0
  else
  begin
    QRBandRapportoIntervento.Height :=
      ImpegnoForm.QryParamFoglioLavoroFL_DATI_RAPPINT_ALTEZZARELAZINT.AsInteger;
    QRDBTextRelazioneIntervento.Height := QRBandRapportoIntervento.Height - 10;
    QRShapeRelazioneIntervento.Height := QRBandRapportoIntervento.Height + 5;
    RigaCurrPos := SEPARAZIONE;
    for i := 1 to 40 do
    begin
      // Se è oltre la fine della banda non esce
      if RigaCurrPos > QRBandRapportoIntervento.Height then
        Break;
      // Crea righe
      CurrShape := TQRShape(QRBandRapportoIntervento.AddPrintable(TQRShape));
      CurrShape.Tag := 1;
      // Così elimina quelle righe che sono oltre la fine della banda (onBeforePrint della banda stessa)
      CurrShape.Top := RigaCurrPos;
      CurrShape.Height := QRShapeElencoRicambiRiga.Height;
      CurrShape.Left := QRShapeElencoRicambiRiga.Left;
      CurrShape.Width := QRShapeElencoRicambiRiga.Width;
      CurrShape.Shape := QRShapeElencoRicambiRiga.Shape;
      CurrShape.Pen.Style := QRShapeElencoRicambiRiga.Pen.Style;
      CurrShape.Pen.Width := QRShapeElencoRicambiRiga.Pen.Width;
      CurrShape.Pen.Color := QRShapeElencoRicambiRiga.Pen.Color;
      CurrShape.Frame.Color := QRShapeElencoRicambiRiga.Frame.Color;
      CurrShape.Brush.Color := QRShapeElencoRicambiRiga.Brush.Color;
      CurrShape.Enabled := True;
      inc(RigaCurrPos, SEPARAZIONE);
    end;
  end;
  // Merce/Ricambi
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_MERCE.AsString = 'F') then
  begin
    QRBandIntestazioneColonneMerce.Height := 0;
    QRBandMerce.Height := 0;
  end
  else
  begin
    RigaCurrPos := SEPARAZIONE;
    for i := 1 to 40 do
    begin
      // Crea righe
      CurrShape := TQRShape(QRBandMerce.AddPrintable(TQRShape));
      CurrShape.Tag := 1;
      // Così elimina quelle righe che sono oltre la fine della banda (onBeforePrint della banda stessa)
      CurrShape.Top := RigaCurrPos;
      CurrShape.Height := QRShapeElencoRicambiRiga.Height;
      CurrShape.Left := QRShapeElencoRicambiRiga.Left;
      CurrShape.Width := QRShapeElencoRicambiRiga.Width;
      CurrShape.Shape := QRShapeElencoRicambiRiga.Shape;
      CurrShape.Pen.Style := QRShapeElencoRicambiRiga.Pen.Style;
      CurrShape.Pen.Width := QRShapeElencoRicambiRiga.Pen.Width;
      CurrShape.Pen.Color := QRShapeElencoRicambiRiga.Pen.Color;
      CurrShape.Frame.Color := QRShapeElencoRicambiRiga.Frame.Color;
      CurrShape.Brush.Color := QRShapeElencoRicambiRiga.Brush.Color;
      CurrShape.Enabled := True;
      inc(RigaCurrPos, SEPARAZIONE);
    end;
  end;
  // Altre spese (vitto, alloggio ecc.)
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_ALTRESPESE.AsString = 'F') then
    QRBandRapportoInterventoSpeseVarie.Height := 0;
  // Stato del documento (In sospeso, Da fatturare, In garanzia)
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_RAPPINT_STATO.AsString = 'F') then
    QRBandStatoDocumento.Height := 0;
  // Titolo Rapporto Intervento
  if (QRBandInizioFineIntevento1.Height = 0) and
    (QRBandInizioFineIntevento2.Height = 0) and
    (QRBandInizioFineIntevento3.Height = 0) and
    (QRBandInizioFineIntevento4.Height = 0) and
    (QRBandInizioFineIntevento5.Height = 0) and
    (QRBandRapportoIntervento.Height = 0) and
    (QRBandIntestazioneColonneMerce.Height = 0) and (QRBandMerce.Height = 0) and
    (QRBandRapportoInterventoSpeseVarie.Height = 0) and
    (QRBandStatoDocumento.Height = 0) then
    QRBandTitoloRapportoIntervento.Height := 0;
  // ===========================================================================

  // ===========================================================================
  // FIRME
  // ---------------------------------------------------------------------------
  // Se disabilitato imposta l'altezza = 0
  if (ImpegnoForm.QryParamFoglioLavoroFL_DATI_FIRME.AsString = 'F') then
    QRBandFirme.Height := 0;
  // ===========================================================================

  // ===========================================================================
  // Parte che fa in modo che, se nell'impianto non c'è più di un apparecchio, non
  // compaia il raggruppamento per apparecchio che tanto non serve.
  // NB: L'ho messo qui perchè così se uno non va mai nelle OP o nei precedenti
  // è come se non ci fosse;
  // ---------------------------------------------------------------------------
//  ImpegnoForm.ControllaSeImpiantoConPiuDiUnApparecchio;
  // Se non c'è più di un apparecchio fa sparire alcune cose
//  if not ImpegnoForm.ImpiantoConPiuDiUnApparecchio then
//  begin
//    // Precedenti
//    QRPrecInt_Apparecchio.Enabled := False;
//    QRLabel29.Enabled := False;
//    QRShapePrecInt_Apparecchio.Enabled := False;
//    QRShape119.Enabled := False;
//    fPrecedentiLarghezzaDescrizione :=
//      Trunc(((QRPrecInt_Apparecchio.Left + QRPrecInt_Apparecchio.Width) -
//      QRPrecInt_Descrizione.Left) * 0.92);
//    // * 0.9 per diminuire la larghezza altrimenti mi andava fuori
//    QRLabel28.Width := QRPrecInt_Descrizione.Width;
//    // Altrimenti se c'è più di un apparecchio..
//  end
//  else
//  begin
    fPrecedentiLarghezzaDescrizione := QRPrecInt_Descrizione.Width;
//  end;
  // ===========================================================================
end;

procedure TAppuntamentoQR.QuickRepAfterPrint(Sender: TObject);
begin
  // Dopo la stampa rimette il raggruppamento per apparecchio alle Operazioni Pianificate
  // altrimenti stampa male.
  PrepareUnprepareGridsForPrint(False);
  // Distruzione
  if Assigned(IntestazBMP) then
    FreeAndNil(IntestazBMP);
  if Assigned(PiedeBMP) then
    FreeAndNil(PiedeBMP);
end;

// Funzione che converte le posizioni/dimensioni dei componenti per il tracciamento diretto delle immagini
// sul canvas della pagina da stampare. Fatto per risolvere il problema della stampa dei quadrati neri
function TAppuntamentoQR.ConvCoord(Coord: Integer; Fattore: Extended): Integer;
begin
  Result := Round(Coord / Screen.PixelsPerInch * 254 * Fattore);
end;

procedure TAppuntamentoQR.QRBandLogoPiedeAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  R: TRect;
  XF, YF: Extended;
begin
  // -----------------------------------------------------------------------------
  // Se la foto deve essere stampata...
  if (QRBandLogoPiede.Height > 0) and (ImagePiede.Enabled) then
  begin
    // Memorizza i fattori di conversione delle coordinate
    XF := Sender.ParentReport.QRPrinter.XFactor;
    YF := Sender.ParentReport.QRPrinter.YFactor;
    // Calcola il TRect della zona su cui deve essere stampata la fotografia
    R.Left := ConvCoord(QRBandLogoPiede.Left + ImagePiede.Left, XF) -
      Round(Sender.ParentReport.QRPrinter.LeftWaste * XF);
    R.Bottom := Round(Sender.ParentReport.CurrentY * YF) -
      ConvCoord(ImagePiede.Top, YF) -
      Round(Sender.ParentReport.QRPrinter.TopWaste * YF);
    R.Right := R.Left + ConvCoord(ImagePiede.Width, XF);
    R.Top := R.Bottom - ConvCoord(ImagePiede.Height, YF);
    // Effettua il tracciamento
    Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, PiedeBMP);
  end;
  // -----------------------------------------------------------------------------
end;

// Procedure cha carica il testo di un memo su una banda di note
// in questo modo non ho problemi a dimensionare poi verticalmente
// la banda per addattarla al testo caricato e nemmeno nel dimensionamento
// di eventuali altrim componenti tipo Shapes ecc.
procedure TAppuntamentoQR.CaricaNote(CurrBand: TQRCustomBand;
  TextLines: TStrings; Modello: TQRLabel; MinimalHeight: Integer = 0;
  LocInterlinea: Integer = 0);
var
  i, XX: Integer;
  CurrLabel: TQRLabel;
begin
  // Inizializzazione
  XX := Modello.Top;
  if LocInterlinea = 0 then
    LocInterlinea := INTERLINEA;
  // Cicla per tutte le righe
  for i := 0 to TextLines.Count - 1 do
  begin
    // Crea la nuova QRLabel
    CurrLabel := TQRLabel(CurrBand.AddPrintable(TQRLabel));
    // La imposta come il modello
    CurrLabel.Font.Assign(Modello.Font);
    CurrLabel.Left := Modello.Left;
    CurrLabel.Width := Modello.Width;
    CurrLabel.Height := Modello.Height;
    CurrLabel.AutoSize := Modello.AutoSize;
    CurrLabel.Alignment := Modello.Alignment;
    CurrLabel.Color := Modello.Color;
    CurrLabel.Transparent := Modello.Transparent;
    // La abilita perchè il modello potrebbe non esserlo
    CurrLabel.Enabled := True;
    // Carica la riga corrente
    CurrLabel.Caption := TextLines[i];
    // Posizionamento verticale
    CurrLabel.Top := XX;
    // Incrementa la variabile per il posizionamento verticale
    inc(XX, LocInterlinea);
  end;
  // Dimensiona la banda
  CurrBand.Height := XX + 2;
  // Se la dimensione ottenuta è inferiore a quella minima eventualmente
  // specificata la dimensiona alla minima.
  if (MinimalHeight > 0) and (CurrBand.Height < MinimalHeight) then
    CurrBand.Height := MinimalHeight;
end;

procedure TAppuntamentoQR.QRBandTitoloDatiImpiantoBeforePrint
  (Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Determina la stampa o meno della banda
  PrintBand := ImpegnoForm.ImpiantoAssegnato;
end;

procedure TAppuntamentoQR.QRBandNumDataImpiantoBeforePrint
  (Sender: TQRCustomBand; var PrintBand: Boolean);
var
  TmpStr, Value: String;
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // ---------------------------------------------------------------------------
  // Carico il tipo di impianto nell'etichetta
  TmpStr := Trim(ImpegnoForm.QryAssTIPOIMPIANTO.AsString);
  if (TmpStr <> '') then
    QRLabelEtichettaDatiImpianto.Caption := ' ' + TmpStr;
  // NB: Gli agiunge uno spazio all'inizio per estetica
  // ---------------------------------------------------------------------------
  // Codice catasto impianti  NB: Allineato a DX
  TmpStr := Trim(ImpegnoForm.QryAssCODICECATASTO.AsString);
  QRLabelDatiImpianto3.Caption := ' ' + TmpStr;
  QRLabelDatiImpianto3.Left := SfondoUltimoInterventoImpianto.Left -
    QRLabelDatiImpianto3.Width - 2;
  // ---------------------------------------------------------------------------
  // Descrizione impianto
  TmpStr := Trim(ImpegnoForm.QryAssDESCRIZIONE.AsString);
  QRLabelDatiImpianto1.Caption := TmpStr;
  QRLabelDatiImpianto1.Width := QRLabelDatiImpianto3.Left - QRLabelDatiImpianto1.Left - SEP;
  // ---------------------------------------------------------------------------
//  Value := '';
//  // Numero impianto
//  TmpStr := Trim(ImpegnoForm.QryAssPRATICA.AsString);
//  if (TmpStr <> '') then
//    TmpStr := 'n° ' + TmpStr;
//  Value := Value + TmpStr;
//  // Data impianto
//  TmpStr := Trim(ImpegnoForm.QryAssDATAPRATICA1.AsString);
//  if (Value <> '') and (TmpStr <> '') then
//    TmpStr := ' del ' + TmpStr;
//  Value := '(' + Value + TmpStr + ')';
//  // Assegnazione
//  QRLabelDatiImpianto2.Caption := Value;
//  QRLabelDatiImpianto2.Left := QRLabelDatiImpianto1.Left +
//    QRLabelDatiImpianto1.Width + SEP;
  // ---------------------------------------------------------------------------
  // Carica i dati degli ultimi interventi (Data ultima manutenzione effettuata, data ultima prova combustione...)
  AggiornaDatiUltimiInterventi;
  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaDatiImpianto.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
  SfondoUltimoInterventoImpianto.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QRBandResponsabileImpiantoBeforePrint
  (Sender: TQRCustomBand; var PrintBand: Boolean);
var
  TmpStr: String;
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // Carica i dati
  CaricaDatiSoggetto(QRLabelResponsabileImpianto1, QRLabelResponsabileImpianto2,
    QRLabelResponsabileImpianto3, ImpegnoForm.QryAssRAGSOCRESPIMP.AsString,
    ImpegnoForm.QryAssINDIRIZZORESPIMP.AsString,
    ImpegnoForm.QryAssNUMCIVICORESPIMP.AsString,
    ImpegnoForm.QryAssCITTARESPIMP.AsString,
    ImpegnoForm.QryAssPROVINCIARESPIMP.AsString,
    ImpegnoForm.QryAssTELEFONORESPIMP.AsString,
    ImpegnoForm.QryAssCELLULARERESPIMP.AsString);
  QRLabelResponsabileImpianto3.Left := QRLabelResponsabileImpianto1.Left;
  // Imposta il campo Terzo Responsabile in qualità di...
  TmpStr := ImpegnoForm.QryAssINQUALITADIRESPIMP.AsString;
  CheckProprietario.Enabled := (TmpStr = 'Proprietario');
  CheckOccupante.Enabled := (TmpStr = 'Occupante');
  CheckTerzoResponsabile.Enabled := (TmpStr = 'Terzo responsabile');
  CheckAmministratore.Enabled := (TmpStr = 'Amministratore');
  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaResponsabileImpianto.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
  QRShapeSfondoInQualitaDi.Height := Sender.Height + SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QRBandNoteImpiantoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaImpiantoNote.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
end;

// Questa procedure calcola il dimensionamento della banda dell'elenco apparecchi in
// base alla modalità (completa o parziale)
procedure TAppuntamentoQR.CalcolaDimensioniRigaElencoApparecchi(Modo: String);
begin
  // Se siamo in modalità stampa completa dei dati degli apparecchi
  // deve solo impostare  l'altezza della banda perchè il resto è come
  // di default
  QRBandDatiApparecchi.Height := 22;
  // Se invece siamo in modalità di stampa parziale (ridotta) dei dati
  // degli apparecchi ridimensiona l'altezza della banda e le dimensioni
  // di alcuni componenti in modo che in pratica si stampi solo
  // la prima riga.
  if Modo = 'P' then
  begin
    // Altezza banda
    QRBandDatiApparecchi.Height := 13;
    // Se siamo a banda ad altezza ridotta non stampa questi campi
    // perchè altrimenti si vedono appena e sta male
    dbeNoteGaranzia.Enabled := False;
  end;
end;

procedure TAppuntamentoQR.QRBandDatiApparecchiBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  i: Integer;
  Curr: TQRCustomLabel;
  TipoApparecchio, TipoAppRif: String;
  TipoAppRifLength: Integer;
begin
  // Se l'apparecchio corrente non è selezionato non lo stampa
  PrintBand := (ImpegnoForm.QryPratAppSELECTED.AsString <> 'F');

  // Se la stampa di questo elenco non è abilitata esce subito tanto non serve a nulla il codice che viene dopo
  // NB: Quando una banda non è abilitata in realtà viene solo messa con altezza = 0 altrimenti cerano problemi
  // con la stampa delle bande successive
  if not fGoStampaApparecchi then
    Exit;
  // Questa procedure calcola il dimensionamento della banda dell'elenco apparecchi in
  // base alla modalità (completa o parziale)
  CalcolaDimensioniRigaElencoApparecchi
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_APPARECCHI.AsString);
  inc(fNumRigaDatiApparecchi);
  // Fa in modo che la riga superiore del primo apparecchio stampato sia più scura per una
  // separazione migliore dai dati dell'impianto
  if fRigaSeparazioneApparecchiStampata then
  begin
    QRShapeApparecchioTopBorder.Brush.Color := $00E6E6E6;
    QRShapeApparecchioTopBorder.Frame.Color := $00E6E6E6;
    QRShapeApparecchioTopBorder.Pen.Color := $00E6E6E6;
  end
  else
  begin
    QRShapeApparecchioTopBorder.Brush.Color := clBlack;
    QRShapeApparecchioTopBorder.Frame.Color := clBlack;
    QRShapeApparecchioTopBorder.Pen.Color := clBlack;
    fRigaSeparazioneApparecchiStampata := True;
  end;
  // Calcolo valore della resa freddo/caldo
  AppData_Freddo_Rese.Caption := ImpegnoForm.QryPratAppPOTENZAFRIGORIFERA.
    AsString + '/' + ImpegnoForm.QryPratAppPOTENZATERMICA.AsString;
  // ===========================================================================
  // DETERMINAZIONE SECONDA RIGA APPARECCHI CON DATI APPARECCHIO
  // ---------------------------------------------------------------------------
  // Carico il tipo di apparecchio attuale e con questo imposto il valore di
  // riferimento
  TipoApparecchio := ImpegnoForm.QryPratAppTIPOAPPARECCHIO.AsString;
  if TipoApparecchio = 'Generatore di calore' then
    TipoAppRif := 'AppData_GenCal'
  else if TipoApparecchio = 'Bruciatore' then
    TipoAppRif := 'AppData_Bruc'
  else if TipoApparecchio = 'Pompa di circolazione' then
    TipoAppRif := 'AppData_PompCirc'
  else if TipoApparecchio = 'Unità esterna' then
    TipoAppRif := 'AppData_Freddo'
  else if TipoApparecchio = 'Unità interna' then
    TipoAppRif := 'AppData_UnInt'
  else if TipoApparecchio = 'Monoblocco' then
    TipoAppRif := 'AppData_Freddo'
  else if TipoApparecchio = 'Macchina per freddo' then
    TipoAppRif := 'AppData_Freddo'
  else if TipoApparecchio = 'Altro' then
    TipoAppRif := 'AppData_Altro'
  else
    Exit;
  // Carica la lunghezza del dato di riferimento su una variabile per comodità
  TipoAppRifLength := Length(TipoAppRif);
  // Cicla per tutti i componenti sulla banda
  for i := 0 to Sender.ControlCount - 1 do
  begin
    // Se non è un controllo che discende da TQRCustomLabel prosegue con il prossimo
    if not(Sender.Controls[i] is TQRCustomLabel) then
      Continue;
    // Curr punta al controllo corrente
    Curr := Sender.Controls[i] as TQRCustomLabel;
    // Solo se il nome inizia per 'AppData_' e lascia stare gli altri controlli
    if LeftStr(Curr.Name, 8) <> 'AppData_' then
      Continue;
    // Determina la posizione verticale del componente
    Curr.Top := AppData_GenCal_LabelPotenza.Top;
    // Determina la visibilità o meno inbase al tipo di apparecchio
    Curr.Enabled := LeftStr(Curr.Name, TipoAppRifLength) = TipoAppRif;
  end;
  // ===========================================================================

  // ===========================================================================
  // STAMPA LINEE DI CONGIUNZIONE APPARECCHI ABBINATI
  // ---------------------------------------------------------------------------
  // Se è un apparecchio abbinato traccia la lineetta orizzontale
  QRShape_AppLink_Horz.Enabled := ImpegnoForm.Abbinato
    (ImpegnoForm.tvApp.Controller.FocusedRecord);
  // Se non è il primo apparecchio dell'abbinamento traccia la linea superiore
  QRShape_AppLink_Upper.Enabled := ImpegnoForm.Abbinato
    (ImpegnoForm.tvApp.Controller.FocusedRecord) and
    not ImpegnoForm.Abbinato_Primo(ImpegnoForm.tvApp.Controller.FocusedRecord);
  // Se non è l'ultimo apparecchio dell'abbinamento traccia la linea inferiore
  QRShape_AppLink_Lower.Enabled := ImpegnoForm.Abbinato
    (ImpegnoForm.tvApp.Controller.FocusedRecord) and
    not ImpegnoForm.Abbinato_Ultimo(ImpegnoForm.tvApp.Controller.FocusedRecord);
  // ===========================================================================

  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaTipoApparecchio.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
  QRShapeApparecchiRight.Height := Sender.Height + SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QRBandDatiApparecchiNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  // Imposta il flag che indica se ci sono ancora dati da stampare
  MoreData := not fApparecchioUltimo;
  // Passa al prissimo record
  // NB: Al primo passaggio no
  if fApparecchioPrimo then
    fApparecchioPrimo := False
  else
    ImpegnoForm.tvApp.DataController.GotoNext;
  // IMposta il flag che indica che il prossimo passaggio stamperà l'ultimo records
  // NB: Se la stampa di questo elenco è disabilitato pone subito il flag = True
  // questo perchè cmq. anche se l'elenco è disabilitato deve cmq. passare una volta
  // da qui con altezza delle bande = 0 altirmenti poi non stampava le bande Child successive.
  if fGoStampaApparecchi then
    fApparecchioUltimo := ImpegnoForm.tvApp.Controller.FocusedRecord.IsLast
  else
    fApparecchioUltimo := True;
end;

procedure TAppuntamentoQR.QRBandOPBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Se la stampa di questo elenco non è abilitata esce subito tanto non serve a nulla il codice che viene dopo
  // NB: Quando una banda non è abilitata in realtà viene solo messa con altezza = 0 altrimenti cerano problemi
  // con la stampa delle bande successive
  if not fGoStampaOP then
    Exit;
  // Dimensionamento
  // NB: Se l'ID dell'apparecchio corrente è uguale al precedente non ripete la stampa dell'apparecchio
  // e quindi ne imposta l'altezza = 0 altrimenti la imposta al valore opportuno.
  Sender.Height := 11;
  if (Sender.Tag = DM1.NoNullIntValue(ImpegnoForm.btvOP.DataController,
     ImpegnoForm.btvOP.DataController.FocusedRecordIndex,
     ImpegnoForm.btvOPIDAPPARECCHIOPRAT.Index)) then
  begin
    Sender.Height := 0;
    Exit;
  end;
  // Non disegna la linea di separazione superiore tra un apparezzhio e l'altro se è il primo record.
  QRShapeOpApparecchioUpper.Enabled :=
    not ImpegnoForm.btvOP.Controller.FocusedRecord.IsFirst;
  // Caricamento dati da stampare
  QROP_Apparecchio.Caption := ImpegnoForm.btvOP.Controller.FocusedRecord.
    DisplayTexts[ImpegnoForm.btvOPIDAPPARECCHIOPRAT.Index];
  // Salva nella proprietà Tag della Banda l'ID dell'apparecchio attuale
  Sender.Tag := DM1.NoNullIntValue(ImpegnoForm.btvOP.DataController,
    ImpegnoForm.btvOP.DataController.FocusedRecordIndex,
    ImpegnoForm.btvOPIDAPPARECCHIOPRAT.Index);
end;

procedure TAppuntamentoQR.QRBandOPNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  // Imposta il flag che indica se ci sono ancora dati da stampare
  MoreData := not fOpUltimo;
  // Passa al prossimo record
  // NB: Al primo passaggio no
  if fOpPrimo then
    fOpPrimo := False
  else
    ImpegnoForm.btvOP.DataController.GotoNext;
  // Se il record attuale è una GroupRow, lo salta
  if Assigned(ImpegnoForm.btvOP.Controller.FocusedRecord) and
    (not ImpegnoForm.btvOP.Controller.FocusedRecord.IsData) then
    ImpegnoForm.btvOP.DataController.GotoNext;
  // IMposta il flag che indica che il prossimo passaggio stamperà l'ultimo records
  // NB: Se la stampa di questo elenco è disabilitato pone subito il flag = True
  // questo perchè cmq. anche se l'elenco è disabilitato deve cmq. passare una volta
  // da qui con altezza delle bande = 0 altirmenti poi non stampava le bande Child successive.
  if fGoStampaOP and Assigned(ImpegnoForm.btvOP.Controller.FocusedRecord) then
    fOpUltimo := ImpegnoForm.btvOP.Controller.FocusedRecord.IsLast
  else
    fOpUltimo := True;
end;

procedure TAppuntamentoQR.QROP_PrezzoPrint(Sender: TObject; var Value: String);
begin
  // Elimina il simbolo dell'Euro e elimina gli eventuali spazi
  if LeftStr(Value, 1) = '€' then
    Value := Trim(RightStr(Value, Length(Value) - 1));
  // Se il prezzo è zero non lo stampa per niente.
  if (Value = '0') or (Value = '0.00') or (Value = '0,00') or (Value = '0.000')
    or (Value = '0,000') or (Value = '0.0000') or (Value = '0,0000') then
    Value := '';
  // Se è una OP compresa nell'abbonamento stampa "Abb."
  if (ImpegnoForm.QryOPINABBONAMENTO.AsString = 'T') then
    Value := 'Abb.';
end;

procedure TAppuntamentoQR.QRBandOPChildBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  CurrColor: TColor;
begin
  // Se l'elenco delle operazioni pianificate non deve essere stampato esce subito.
  if not fGoStampaOP then
    Exit;
  // Carica i valori dei checks
  QRShapeOpFare.Enabled := ImpegnoForm.QryOPDAEFFETTUARE.AsString = 'T';
  QRShapeOpFatto.Enabled := ImpegnoForm.QryOPEFFETTUATA.AsString = 'T';
  // Se l'operazione è marcata come DA FARE la evidenzia con i marcatori laterali
  if ImpegnoForm.QryOPDAEFFETTUARE.AsString = 'T' then
  begin
    QRLabelOpMarkerLeft.Enabled := True;
    QRLabelOpMarkerRight.Enabled := True;
  end
  else
  begin
    QRLabelOpMarkerLeft.Enabled := False;
    QRLabelOpMarkerRight.Enabled := False;
  end;
  // Se l'operazione non è marcata come DA FARE la stampa in secondo piano
  if QRShapeOpFare.Enabled then
    CurrColor := clBlack
  else
    CurrColor := clGray;
  // Imposta il colore ai campi
  QROP_Codice.Font.Color := CurrColor;
  QROP_Descrizione.Font.Color := CurrColor;
  QROP_Periodicita.Font.Color := CurrColor;
  QROP_Ultima.Font.Color := CurrColor;
  QROP_Prossima.Font.Color := CurrColor;
  QROP_Prezzo.Font.Color := CurrColor;
end;

procedure TAppuntamentoQR.QRBandPrescrizioniBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
const
  HORZ_SEP = 10;
var
  XX: Integer;
begin
  // Se la stampa di questo elenco non è abilitata esce subito tanto non serve a nulla il codice che viene dopo
  // NB: Quando una banda non è abilitata in realtà viene solo messa con altezza = 0 altrimenti cerano problemi
  // con la stampa delle bande successive
  if not fGoStampaPrescrizioni then
    Exit;
  // Inizializzazione
  XX := QRPresc_Tipo.Left;
  // Caricamento dati da stampare
  // ---------------------------------------------------------------------------
  // Tipo
  QRPresc_Tipo.Caption := ImpegnoForm.QryPrescCODICE.AsString + ' del';
  inc(XX, (QRPresc_Tipo.Width + HORZ_SEP));
  // Data
  QRPresc_Data.Left := XX;
  QRPresc_Data.Caption := ImpegnoForm.QryPrescDATADOC.AsString;
  inc(XX, (QRPresc_Data.Width + HORZ_SEP));
  // Label Tecnico
  QRPresc_TecnicoLabel.Left := XX;
  inc(XX, (QRPresc_TecnicoLabel.Width + HORZ_SEP));
  // Tecnico
  QRPresc_Tecnico.Left := XX;
  QRPresc_Tecnico.Caption := ImpegnoForm.QryPrescTECNICO_NOME.AsString;
  inc(XX, (QRPresc_Tecnico.Width + HORZ_SEP));
  // L'apparecchio lo allinea a destra
  QRPresc_Apparecchio.Width := QRPresc_Apparecchio.Left +
    QRPresc_Apparecchio.Width - XX;
  QRPresc_Apparecchio.Left := XX;
  QRPresc_Apparecchio.Caption := ImpegnoForm.QryPrescIDAPPARECCHIOPRAT.AsString;
  // Apparecchio
  QRPresc_Apparecchio.Caption := ImpegnoForm.btvPresc.Controller.FocusedRecord.
    DisplayTexts[ImpegnoForm.btvPrescIDAPPARECCHIOPRAT.Index];

  // ===========================================================================
  // Caricamento del testo della prescrizione in modo che vada a capo esattamente
  // come a video.
  // ---------------------------------------------------------------------------
  // Copia il testo in un memo non DBAware in modo da poter poi accedere alla
  // sua proprietà "Lines". Ovviamente il memo di appoggio deve essere dimensionato
  // della stessa dimensione e con lo stesso font
  ImpegnoForm.RE.Style.Font.Name := 'Arial';
  ImpegnoForm.RE.Style.Font.Size := 8;
  ImpegnoForm.RE.Style.Font.Style := [fsBold];
  ImpegnoForm.RE.Style.TextStyle := [fsBold];
  ImpegnoForm.RE.Width := ImpegnoForm.btvPresc.ViewInfo.HeaderViewInfo.Items
    [ImpegnoForm.btvPrescDESCRIZIONE.Index].Width; // Larghezza reale attuale
  ImpegnoForm.RE.Clear;
  ImpegnoForm.RE.Text := ImpegnoForm.btvPresc.Controller.FocusedRecord.
    DisplayTexts[ImpegnoForm.btvPrescDESCRIZIONE.Index];
  // Svuota il memo di stampa e ne carica il testo
  QRPresc_Memo.Lines.Clear;
  QRPresc_Memo.Lines.AddStrings(ImpegnoForm.RE.Lines);
  // ===========================================================================
end;

procedure TAppuntamentoQR.QRBandPrescrizioniNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  // Imposta il flag che indica se ci sono ancora dati da stampare
  MoreData := not fPrescUltimo;
  // Passa al prossimo record
  // NB: Al primo passaggio no perchè c'era un problema che altrimenti saltava il primo record
  if fPrescPrimo then
    fPrescPrimo := False
  else
    ImpegnoForm.btvPresc.DataController.GotoNext;
  // IMposta il flag che indica che il prossimo passaggio stamperà l'ultimo records
  // NB: Se la stampa di questo elenco è disabilitato pone subito il flag = True
  // questo perchè cmq. anche se l'elenco è disabilitato deve cmq. passare una volta
  // da qui con altezza delle bande = 0 altirmenti poi non stampava le bande Child successive.
  if fGoStampaPrescrizioni then
    fPrescUltimo := ImpegnoForm.btvPresc.Controller.FocusedRecord.IsLast
  else
    fPrescUltimo := True;
end;

procedure TAppuntamentoQR.QRBandPrecIntBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  TmpStr: String;
begin
  // Se la stampa di questo elenco non è abilitata esce subito tanto non serve a nulla il codice che viene dopo
  // NB: Quando una banda non è abilitata in realtà viene solo messa con altezza = 0 altrimenti cerano problemi
  // con la stampa delle bande successive
  if not fGoStampaPrecedenti then
    Exit;
  // Dimensionamento
  // NB: Se l'ID dell'INTERVENTO corrente è uguale al precedente non ripete la stampa dei dati dell'intervento
  // e quindi ne imposta l'altezza = 0 altrimenti la imposta al valore opportuno.
  Sender.Height := 14;
  if (Sender.Tag = DM1.NoNullIntValue(ImpegnoForm.btvPrecInt.DataController,
    ImpegnoForm.btvPrecInt.DataController.FocusedRecordIndex,
    ImpegnoForm.btvPrecIntMASTER_ID.Index)) then
  begin
    Sender.Height := 0;
    Exit;
  end;

  // Non disegna la linea di separazione superiore tra un apparezzhio e l'altro se è il primo record.
  QRShapeApparecchioPrecIntUpper.Enabled :=
    not ImpegnoForm.btvPrecInt.Controller.FocusedRecord.IsFirst;
  // Caricamento dati da stampare
  QRPrecInt_Apparecchio.Caption := ImpegnoForm.btvPrecInt.Controller.
    FocusedRecord.DisplayTexts[ImpegnoForm.btvPrecIntIDAPPARECCHIOPRAT.Index];
  // Salva nella proprietà Tag della Banda l'ID dell'intervento attuale
  Sender.Tag := DM1.NoNullIntValue(ImpegnoForm.btvPrecInt.DataController,
    ImpegnoForm.btvPrecInt.DataController.FocusedRecordIndex,
    ImpegnoForm.btvPrecIntMASTER_ID.Index);

  // Aggiorna il numero degli interventi precedenti stampati e se si è superato
  // il limite di interventi precedenti da stampare inibisce il continuarne
  // a stampare altri e quindi imposta l'altezza della banda = 0 (non la disabilita per evitare problemi).
  // NB: Se nei parametri e progressivi è stato inserizo zero come numero degli interventi
  // precedenti da stampare significa che non c'è limite e li stampa tutti.
  inc(fNumInterventiPrecedentiStampati);
  if PrecedentiSuperatoLimite then
  begin
    Sender.Height := 0;
    Exit;
  end;

  // ===========================================================================
  // Caricamento dati da stampare
  // ---------------------------------------------------------------------------
  // Data documento
  QRPrecInt_RifDocData.Caption := FormatDateTime('dd/mm/yyyy',
    ImpegnoForm.QryIntPrecDATADOC.AsDateTime);
  // Tecnico
  TmpStr := Trim(ImpegnoForm.QryIntPrecTECNICO_NOME.AsString);
  if TmpStr <> '' then
  begin
    QRPrecInt_RifDocData.Caption := QRPrecInt_RifDocData.Caption + '   ' +
      Trim(ImpegnoForm.QryIntPrecTECNICO_NOME.AsString);
  end;
  // Riferimento a Ricevuta Fiscale o altro documento
  if (ImpegnoForm.QryIntPrecRIFDOC_NUM.AsString <> '') then
  begin
    QRPrecInt_RifDocData.Caption := QRPrecInt_RifDocData.Caption + '  -  ' +
      ImpegnoForm.QryIntPrecRIFDOC_TIPO.AsString + ' ' +
      ImpegnoForm.QryIntPrecRIFDOC_NUM.AsString +
      ImpegnoForm.QryIntPrecRIFDOC_REG.AsString;
    // + ' del ' + ImpegnoForm.QryIntPrecRIFDOC_DATA.AsString;
  end;
  // Importo intervento
  if (ImpegnoForm.QryIntPrecRIFDOC_TOTALEDOCUMENTO.AsFloat <> 0) then
  begin
    QRPrecInt_RifDocData.Caption := QRPrecInt_RifDocData.Caption + '   (' +
      CurrToStrF(ImpegnoForm.QryIntPrecRIFDOC_TOTALEDOCUMENTO.AsCurrency,
      ffCurrency, 2) + ')';
  end;
  // Corrispettivo non pagato
  if (ImpegnoForm.QryIntPrecRIFDOC_CORRISPNOPAG.AsString = 'T') then
  begin
    QRLabelPrecIntMarkerLeft.Enabled := True;
    QRLabelPrecIntMarkerRight.Enabled := True;
    QRPrecInt_RifDocData.Caption := QRPrecInt_RifDocData.Caption +
      '   *** CNP ***';
  end
  else
  begin
    QRLabelPrecIntMarkerLeft.Enabled := False;
    QRLabelPrecIntMarkerRight.Enabled := False;
  end;
  // ===========================================================================
end;

procedure TAppuntamentoQR.QRBandPrecIntNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  // Imposta il flag che indica se ci sono ancora dati da stampare
  MoreData := not fPrecIntUltimo;
  // Passa al prossimo record
  // NB: Al primo passaggio no
  if fPrecIntPrimo then
    fPrecIntPrimo := False
  else
    ImpegnoForm.btvPrecInt.DataController.GotoNext;
  // IMposta il flag che indica che il prossimo passaggio stamperà l'ultimo records
  // NB: Se la stampa di questo elenco è disabilitato pone subito il flag = True
  // questo perchè cmq. anche se l'elenco è disabilitato deve cmq. passare una volta
  // da qui con altezza delle bande = 0 altirmenti poi non stampava le bande Child successive.
  if fGoStampaPrecedenti and
    Assigned(ImpegnoForm.btvPrecInt.Controller.FocusedRecord) then
    fPrecIntUltimo := ImpegnoForm.btvPrecInt.Controller.FocusedRecord.IsLast or
      PrecedentiSuperatoLimite
  else
    fPrecIntUltimo := True;
end;

procedure TAppuntamentoQR.QRBandPrecIntChildBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
const
  COLOR_OP = $00515151;
var
  ExtendedHeight: Extended;
  MyFont: TFont;
  IdApparecchioCorrente: Integer;
begin
  // Se la stampa dell'elenco dei precedenti non è abilitato esce subito senza fare nulla
  if not fGoStampaPrecedenti then
    Exit;

  // Se la stampa dei precedenti ha superato il limite degli interventi da stampare
  // imposta l'altezza della banda a zero in modo da inibire la stampa degli interventi
  // in eccesso.
  // NB: Non ho messo l'exit perchè altrimenti potrebbero esserci dei problemi
  Sender.Height := 11;
  if PrecedentiSuperatoLimite then
    Sender.Height := 0;

  // Inizializzazione
  QRShapePrecint_Sfondo.Enabled := False;
  // Sfondo grigio per evidenziare le lerazioni e le osservazioni

  // ===========================================================================
  // Determinazione Font
  // ---------------------------------------------------------------------------
  // Defaultizzazione larghezza descrizione precedenti
  QRPrecInt_Descrizione.Width := fPrecedentiLarghezzaDescrizione;
  // Determina il font da usare in base alla situazione
  MyFont := TFont.Create;
  try
    MyFont.Assign(QRPrecInt_Codice.Font);
    MyFont.Style := [];
    MyFont.Color := clBlack;
    // Se è una riga di Operazioni pianificate...
    if (ImpegnoForm.QryIntPrecTIPORECORD.AsString = '20-OPERAZIONE PIANIFICATA')
    then
    begin
      MyFont.Style := [fsItalic];
      MyFont.Color := COLOR_OP;
      // Se è una riga di Analisi Fumi
    end
    else if (ImpegnoForm.QryIntPrecTIPORECORD.AsString = '15-ANALISI FUMI ALLEGATO') then
    begin
      MyFont.Style := [fsItalic];
      MyFont.Color := COLOR_OP;
      // Se è una riga di Relazione Intervento
    end
    else if (ImpegnoForm.QryIntPrecTIPORECORD.AsString = '10-RELAZIONE INTERVENTO') then
    begin
      MyFont.Style := [fsItalic];
      MyFont.Color := clBlack;
      // A tutta larghezza così si ottimizza lo spazio
      QRPrecInt_Descrizione.Width := Trunc(((QRPrecInt_Apparecchio.Left + QRPrecInt_Apparecchio.Width) -
        QRPrecInt_Descrizione.Left) * 0.92);
      // * 0.9 per diminuire la larghezza altrimenti mi andava fuori
      // Se è una riga di Osservazioni allegato
    end
    else if (ImpegnoForm.QryIntPrecTIPORECORD.AsString = '40-OSSERVAZIONI ALLEGATO') then
    begin
      MyFont.Style := [fsBold];
      MyFont.Color := clBlack;
      QRShapePrecint_Sfondo.Enabled := True;
      // Sfondo grigio per evidenziare le lerazioni e le osservazioni
    end;
    // Imposta il font determinato nei campi opportuni
    QRPrecInt_Codice.Font.Assign(MyFont);
    QRPrecInt_Descrizione.Font.Assign(MyFont);
  finally
    FreeAndNil(MyFont);
  end;
  // ===========================================================================

  // ===========================================================================
  // Descrizione apparecchi e separazione con linea trattegggiata tra apparecchi diversi
  // ---------------------------------------------------------------------------
  // Carica l'ID apparecchio del rigo corrente
  IdApparecchioCorrente := DM1.NoNullIntValue
    (ImpegnoForm.btvPrecInt.DataController,
    ImpegnoForm.btvPrecInt.DataController.FocusedRecordIndex,
    ImpegnoForm.btvPrecIntIDAPPARECCHIOPRAT.Index);
  // ---------------------------------------------------------------------------
  // Se l'ID dell'apparecchio corrente NON è uguale al precedente rende visibile la linea di separazione tratteggiata
  // NB: Però non se è la prima riga dell'intervento
  // NB: Per verificare se è la prima riga di un intervento verifica l'altezza della banda QRBandPrecInt
  // che è > di zero e quindi visibile solo se siamo sul primo rigo di un intervento.
  QRShapePrecIntChildUpper.Enabled := (Sender.Tag <> IdApparecchioCorrente) and (QRBandPrecInt.Height = 0);
  // ---------------------------------------------------------------------------
  // Se l'apparecchio del rigo attuale è diverso dal precedente stampa in chiaro anche il riferimento all'allarecchio stesso
  // altrimenti visualizza '"' come si fa a volte a mano per non ricopiare dalla riga superiore, in questo modo la stampa mi sembra più leggera.
  // NB: RIstampa il riferimento all'apparecchio anche in caso di cambio intervento.
  // NB: Per verificare se è la prima riga di un intervento verifica l'altezza della banda QRBandPrecInt
  // che è > di zero e quindi visibile solo se siamo sul primo rigo di un intervento.
  if (Sender.Tag <> IdApparecchioCorrente) or (QRBandPrecInt.Height > 0) then
  begin
    QRPrecInt_Apparecchio.Alignment := taRightJustify;
    QRPrecInt_Apparecchio.Caption := ImpegnoForm.btvPrecInt.Controller.FocusedRecord.DisplayTexts[ImpegnoForm.btvPrecIntAPPARECCHIO_FULL.Index];
  end
  else
  begin
    QRPrecInt_Apparecchio.Alignment := taRightJustify;
    QRPrecInt_Apparecchio.Caption := '"                              "               ';
  end;
  // Se però il rigo corrente è senza apparecchio non stampa nulla
  if IdApparecchioCorrente = 0 then
    QRPrecInt_Apparecchio.Caption := '';
  // Salva nella proprietà Tag della Banda l'ID dell'apparecchio attuale
  Sender.Tag := DM1.NoNullIntValue(ImpegnoForm.btvPrecInt.DataController, ImpegnoForm.btvPrecInt.DataController.FocusedRecordIndex, ImpegnoForm.btvPrecIntIDAPPARECCHIOPRAT.Index);
  // ===========================================================================

  // Dimensionamento verticale degli shapes che disegnano le linee verticali in modo che si adattino
  // alle dimensioni della banda che potrebbe essere espansa.
  Sender.ExpandedHeight(ExtendedHeight);
  QRShapePrecInt_Codice.Size.Height := ExtendedHeight;
  QRShapePrecInt_Descrizione.Size.Height := ExtendedHeight;
  QRShapePrecInt_Apparecchio.Size.Height := ExtendedHeight;
  QRShapePrecInt_PrzUnit.Size.Height := ExtendedHeight;
  QRShapePrecInt_Qta.Size.Height := ExtendedHeight;
  QRShapePrecInt_Final.Size.Height := ExtendedHeight;
  QRShapePrecIntChild_GrayedPrz.Size.Height := ExtendedHeight;
  QRShapePrecint_Sfondo.Size.Height := ExtendedHeight;
end;

procedure TAppuntamentoQR.QRBandLogoAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
  R: TRect;
  XF, YF: Extended;
begin
  // -----------------------------------------------------------------------------
  // Se la foto deve essere stampata...
  if (QRBandLogo.Height > 0) and (ImageIntestazione.Enabled) then
  begin
    // Memorizza i fattori di conversione delle coordinate
    XF := Sender.ParentReport.QRPrinter.XFactor;
    YF := Sender.ParentReport.QRPrinter.YFactor;
    // Calcola il TRect della zona su cui deve essere stampata la fotografia
    R.Left := ConvCoord(QRBandLogo.Left + ImageIntestazione.Left, XF) -
      Round(Sender.ParentReport.QRPrinter.LeftWaste * XF);
    R.Top := ConvCoord(QRBandLogo.Top + ImageIntestazione.Top, YF) -
      Round(Sender.ParentReport.QRPrinter.TopWaste * YF);
    R.Right := R.Left + ConvCoord(ImageIntestazione.Width, XF);
    R.Bottom := R.Top + ConvCoord(ImageIntestazione.Height, YF);
    // Effettua il tracciamento
    Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, IntestazBMP);
  end;
  // -----------------------------------------------------------------------------
end;

procedure TAppuntamentoQR.QRBandMerceBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  isExpanded: Boolean;
  TargetExpandedHeight, ExpandedHeight: Extended;
  i: Integer;
begin
  // Calcola la dimensione verticale della banda in modo che riempia tutto lo spazio rimanente
  // prima del piede
  // NB: Le bande successive devono essere ebilitate o meno prima dell'esecuzione di questo codice e quindi nell'OnBeforePrint del report
  TargetExpandedHeight := Sender.ParentReport.Page.Length -
    Sender.ParentReport.Page.BottomMargin - Sender.ParentReport.CurrentY -
    QRBandLogoPiede.Size.Height - QRBandFooter.Size.Height -
    QRBandFirme.Size.Height - QRBandRapportoInterventoSpeseVarie.Size.Height -
    QRBandStatoDocumento.Size.Height - QRBandMessaggi.Size.Height;
  // Espande la banda
  Sender.ExpandBand(TargetExpandedHeight, ExpandedHeight, isExpanded);
  // Dimensiona le linee verticali
  QRShapeBlankCodice.Size.Height := TargetExpandedHeight;
  QRShapeBlankDescrizione.Size.Height := TargetExpandedHeight;
  QRShapeBlankMatricola.Size.Height := TargetExpandedHeight;
  QRShapeBlankPrzUnit.Size.Height := TargetExpandedHeight;
  QRShapeBlankUM.Size.Height := TargetExpandedHeight;
  QRShapeBlankQta.Size.Height := TargetExpandedHeight;
  QRShapeBlankImporto.Size.Height := TargetExpandedHeight;
  QRShapeBlankReso.Size.Height := TargetExpandedHeight;
  QRShapeBlankFinal.Size.Height := TargetExpandedHeight;
  // Fa in modo che le righe trattegiate per facilitare la scrittura ai tecnici
  // (quelle nell'elenco dei ricambi) non vengano tracciate se sono oltre la dimensione
  // delle banda stessa.
  for i := 0 to Sender.ControlCount - 1 do
  begin
    if (Sender.Controls[i] is TQRShape) then
    begin
      with Sender.Controls[i] as TQRShape do
      begin
        if Tag = 1 then
          Enabled := (Size.Top < TargetExpandedHeight);
      end;
    end;
  end;
  // Salva nella proprietà Tag della banda successiva la posizione alla quale dovrà
  // tracciarla (la banda successiva) in modo che sia alla fine delle linee prolungate.
  QRBandRapportoInterventoSpeseVarie.Tag := CurrentY +
    Trunc(TargetExpandedHeight);
end;

procedure TAppuntamentoQR.QRBandRapportoInterventoSpeseVarieBeforePrint
  (Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Prima di tracciare la banda recupera dalla sua proprietà Tag la posizione alla quale dovrà
  // tracciarla in modo che sia alla fine delle linee prolungate.
  // NB: La proprietà Tag sarà stata impostata dall'OnBeforePrint della banda precedente.
  AppuntamentoQR.CurrentY := Sender.Tag;
end;

function TAppuntamentoQR.GetPrecedentiSuperatoLimite: Boolean;
begin
  // Se il numero di interventi precedenti stampati ha ruperato il limite
  // impostato nei parametri e progressivi ritorna True.
  Result := (fNumInterventiPrecedentiStampati >
    ImpegnoForm.QryParamFoglioLavoroFL_DATI_NUMULTINTERV.AsInteger) and
    (ImpegnoForm.QryParamFoglioLavoroFL_DATI_NUMULTINTERV.AsInteger > 0)
end;

// Procedure che carica i dati di un soggetto
procedure TAppuntamentoQR.CaricaDatiSoggettoSuMemo(Lbl1: TQRLabel;
  Memo1: TQRMemo; RagSoc, Indirizzo, NumCivico, Citta, Provincia, Telefono,
  Cellulare: String);
var
  TmpStr, Value: String;
begin
  // ---------------------------------------------------------------------------
  // Ragione sociale
  Lbl1.Caption := Trim(RagSoc);
  // ---------------------------------------------------------------------------
  Value := '';
  // Indirizzo
  TmpStr := Trim(Indirizzo);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := TmpStr;
  Value := Value + TmpStr;
  // Numero civico
  TmpStr := Trim(NumCivico);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' ' + TmpStr;
  Value := Value + TmpStr;
  // Località
  TmpStr := Trim(Citta);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' - ' + TmpStr;
  Value := Value + TmpStr;
  // Provincia
  TmpStr := Trim(Provincia);
  if (TmpStr <> '') then
    TmpStr := ' (' + TmpStr + ')';
  Value := Value + TmpStr;
  // Telefono
  TmpStr := Trim(Telefono);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' ' + TmpStr;
  Value := Value + TmpStr;
  // Cellulare
  TmpStr := Trim(Cellulare);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ', ' + TmpStr;
  Value := Value + TmpStr;
  // Assegnazione
  Memo1.Left := Lbl1.Left + Lbl1.Width + SEP;
  Memo1.Width := QRMemoMotivoChiamata.Width + QRMemoMotivoChiamata.Left -
    Memo1.Left;
  Memo1.Lines.Clear;
  Memo1.Lines.Add(Value);
  // ---------------------------------------------------------------------------
end;

// Procedure che carica i dati di un soggetto
procedure TAppuntamentoQR.CaricaDatiSoggetto(Lbl1, Lbl2, Lbl3: TQRLabel;
  RagSoc, Indirizzo, NumCivico, Citta, Provincia, Telefono, Cellulare: String);
var
  TmpStr, Value: String;
begin
  // ---------------------------------------------------------------------------
  // Ragione sociale
  Lbl1.Caption := Trim(RagSoc);
  // ---------------------------------------------------------------------------
  Value := '';
  // Indirizzo
  TmpStr := Trim(Indirizzo);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := TmpStr;
  Value := Value + TmpStr;
  // Numero civico
  TmpStr := Trim(NumCivico);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' ' + TmpStr;
  Value := Value + TmpStr;
  // Località
  TmpStr := Trim(Citta);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' - ' + TmpStr;
  Value := Value + TmpStr;
  // Provincia
  TmpStr := Trim(Provincia);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' (' + TmpStr + ')';
  Value := Value + TmpStr;
  // Assegnazione
  Lbl2.Caption := Value;
  Lbl2.Left := Lbl1.Left + Lbl1.Width + SEP;
  // ---------------------------------------------------------------------------
  Value := '';
  // Telefono
  TmpStr := Trim(Telefono);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := TmpStr;
  Value := Value + TmpStr;
  // Cellulare
  TmpStr := Trim(Cellulare);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ', ' + TmpStr;
  Value := Value + TmpStr;
  // Assegnazione
  Lbl3.Caption := Value;
  Lbl3.Left := Lbl2.Left + Lbl2.Width + SEP;
  // ---------------------------------------------------------------------------
end;

procedure TAppuntamentoQR.QRBandImmobileBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  TmpStr, Value: String;
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // ---------------------------------------------------------------------------
  Value := '';
  // Citta
  TmpStr := Trim(ImpegnoForm.QryAssCOMUNEIMM.AsString);
  if (TmpStr <> '') then
    TmpStr := TmpStr;
  Value := Value + TmpStr;
  // Provincia
  TmpStr := Trim(ImpegnoForm.QryAssPROVINCIAIMM.AsString);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' (' + TmpStr + ') ';
  Value := Value + TmpStr;
  // Indirizzo
  TmpStr := Trim(ImpegnoForm.QryAssINDIRIZZOIMM.AsString);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' ' + TmpStr;
  Value := Value + TmpStr;
  // Numero civico
  TmpStr := Trim(ImpegnoForm.QryAssNUMCIVICOIMM.AsString);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' ' + TmpStr;
  Value := Value + TmpStr;
  // Palazzo
  TmpStr := Trim(ImpegnoForm.QryAssPALAZZOIMM.AsString);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' pal.' + TmpStr;
  Value := Value + TmpStr;
  // Scala
  TmpStr := Trim(ImpegnoForm.QryAssSCALAIMM.AsString);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' sc.' + TmpStr;
  Value := Value + TmpStr;
  // Piano
  TmpStr := Trim(ImpegnoForm.QryAssPIANOIMM.AsString);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' p.' + TmpStr + '°';
  Value := Value + TmpStr;
  // Interno
  TmpStr := Trim(ImpegnoForm.QryAssINTERNOIMM.AsString);
  if (Value <> '') and (TmpStr <> '') then
    TmpStr := ' int. ' + TmpStr;
  Value := Value + TmpStr;
  // Assegnazione
  QRLabelUbicazioneImpiento1.Caption := Value;
  // ---------------------------------------------------------------------------
  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaUbicazioneImpiento.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QRBandProprietarioBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // Carica i dati
  CaricaDatiSoggetto(QRLabelProprietarioImpianto1, QRLabelProprietarioImpianto2,
    QRLabelProprietarioImpianto3, ImpegnoForm.QryAssRAGSOCPROP.AsString,
    ImpegnoForm.QryAssINDIRIZZOPROP.AsString,
    ImpegnoForm.QryAssNUMCIVICOPROP.AsString,
    ImpegnoForm.QryAssCITTAPROP.AsString,
    ImpegnoForm.QryAssPROVINCIAPROP.AsString,
    ImpegnoForm.QryAssTELEFONOPROP.AsString,
    ImpegnoForm.QryAssCELLULAREPROP.AsString);
  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaProprietarioImpianto.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QRBandUtenteBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // Carica i dati
  CaricaDatiSoggetto(QRLabelUtenteImpianto1, QRLabelUtenteImpianto2,
    QRLabelUtenteImpianto3, ImpegnoForm.QryAssRAGSOCUT.AsString,
    ImpegnoForm.QryAssINDIRIZZOUT.AsString,
    ImpegnoForm.QryAssNUMCIVICOUT.AsString, ImpegnoForm.QryAssCITTAUT.AsString,
    ImpegnoForm.QryAssPROVINCIAUT.AsString,
    ImpegnoForm.QryAssTELEFONOUT.AsString,
    ImpegnoForm.QryAssCELLULAREUT.AsString);
  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaUtenteImpianto.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QRDBText112Print(Sender: TObject; var Value: string);
begin
  if (Trim(Value) <> '') then
    Value := 'Inst. ' + Value;
end;

procedure TAppuntamentoQR.QRDBText1Print(Sender: TObject; var Value: string);
begin
  if (Trim(Value) <> '') then
    Value := 'Prod. ' + Value;
end;

procedure TAppuntamentoQR.QRBandInizioFineIntevento1BeforePrint
  (Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  // Caricamento dati
  QRLTecnico.Caption := ImpegnoForm.DBETecnico.Text;
end;

procedure TAppuntamentoQR.QRBandInstallatoreBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // Carica i dati
  CaricaDatiSoggetto(QRLabelAmministratoreImpianto1,
    QRLabelAmministratoreImpianto2, QRLabelAmministratoreImpianto3,
    ImpegnoForm.QryAssRAGSOCINST.AsString,
    ImpegnoForm.QryAssINDIRIZZOINST.AsString,
    ImpegnoForm.QryAssNUMCIVICOINST.AsString,
    ImpegnoForm.QryAssCITTAINST.AsString,
    ImpegnoForm.QryAssPROVINCIAINST.AsString,
    ImpegnoForm.QryAssTELEFONOINST.AsString,
    ImpegnoForm.QryAssCELLULAREINST.AsString);
  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaAmministratoreImpianto.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QRBandPropUtAmmBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // Carica i dati
  QRLabelPropRidotto1.Caption := Trim(ImpegnoForm.QryAssRAGSOCPROP.AsString) +
    ' ' + Trim(ImpegnoForm.QryAssTELEFONOPROP.AsString);
  QRLabelUtRidotto1.Caption := Trim(ImpegnoForm.QryAssRAGSOCUT.AsString) + ' ' +
    Trim(ImpegnoForm.QryAssTELEFONOUT.AsString);
  QRLabelAmmRidotto1.Caption := Trim(ImpegnoForm.QryAssRAGSOCINST.AsString) +
    ' ' + Trim(ImpegnoForm.QryAssTELEFONOINST.AsString);

  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaPropUtAmm1.Height := Sender.Height + SX_BAND_LABEL_CORRECTION;
  QRLabelEtichettaPropUtAmm2.Height := Sender.Height + SX_BAND_LABEL_CORRECTION;
  QRLabelEtichettaPropUtAmm3.Height := Sender.Height + SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QRLabelEtichettaTipoApparecchioPrint(Sender: TObject;
  var Value: String);
begin
  Value := ' ' + Value;
end;

procedure TAppuntamentoQR.QRBandContrattoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  // Se la banda è abilitata carica i campi altrimenti esce subito
  if Sender.Height = 0 then
    Exit;
  // ---------------------------------------------------------------------------
  // STATO DEL CONTRATTO
  // Se l'impianto è sotto contratto stampa un grosso "SI" ma se è scaduto
  // stampa un grosso "SCADUTO" e lo pone in evidenza
  if ImpegnoForm.QryAssCONTRATTO_STATO.AsString = 'T' then
  begin
    // Se scaduto
    if ImpegnoForm.QryAssCOMPUTED_CONTRATTO_SCADUTO.AsString = 'T' then
    begin
      QRLabelDatiContrattoStato.Caption := 'SCADUTO ';
      QRLabelDatiContrattoDescrizValidita.Caption := 'Scaduto dal';
      QRLabelDatiContrattoDescrizValidita.Font.Style := [fsItalic, fsBold];
      QRLabelDatiContrattoDataScadenza.Font.Style := [fsBold];
      // Se NON scaduto
    end
    else
    begin
      QRLabelDatiContrattoStato.Caption := '';
      QRLabelDatiContrattoStato.Font.Style := [];
      // Non stampa i marcatore
      QRLabelMarkerLeft.Enabled := False;
      QRLabelMarkerRight.Enabled := False;
    end;
    // Dati comuni tra
    QRLabelDatiContrattoDataScadenza.Caption :=
      ImpegnoForm.QryAssCONTRATTO_VALIDITA_FINE.AsString;
    // Se l'impianto NON è sotto contratto
  end
  else if ImpegnoForm.QryAssCONTRATTO_STATO.AsString = 'F' then
  begin
    QRLabelDatiContrattoStato.Caption := 'NO ';
    QRLabelDatiContratto1.Enabled := False;
    QRLabelDatiContrattoImporto.Enabled := False;
    QRLabelDatiContrattoDataScadenza.Enabled := False;
    // Se l'impianto è SOSPESO
  end
  else if ImpegnoForm.QryAssCONTRATTO_STATO.AsString = 'S' then
  begin
    QRLabelDatiContrattoStato.Caption := 'SOSPESO ';
    QRLabelDatiContrattoDescrizValidita.Caption := 'Sospeso dal';
    QRLabelDatiContrattoDescrizValidita.Font.Style := [fsItalic, fsBold];
    QRLabelDatiContrattoDataScadenza.Caption :=
      ImpegnoForm.QryAssCONTRATTO_SOSP_DATA.AsString;
    QRLabelDatiContrattoDataScadenza.Font.Style := [fsBold];
    // Se l'impianto è DISMESSO
  end
  else if ImpegnoForm.QryAssCONTRATTO_STATO.AsString = 'D' then
  begin
    QRLabelDatiContrattoStato.Caption := 'DISMESSO ';
    QRLabelDatiContrattoDescrizValidita.Caption := 'Dismesso dal';
    QRLabelDatiContrattoDescrizValidita.Font.Style := [fsItalic, fsBold];
    QRLabelDatiContrattoDataScadenza.Caption :=
      ImpegnoForm.QryAssCONTRATTO_DISMESSO_DATA.AsString;
    QRLabelDatiContrattoDataScadenza.Font.Style := [fsItalic, fsBold];
  end;
  // ---------------------------------------------------------------------------
  // Descrizione
  QRLabelDatiContratto1.Caption := ImpegnoForm.QryAssCONTRATTO_TIPO.AsString;
  // Importo
  if ImpegnoForm.QryAssCONTRATTO_IMPORTO.AsFloat <> 0 then
    QRLabelDatiContrattoImporto.Caption :=
      FormatFloat('#,##0.00',
      ImpegnoForm.QryAssCONTRATTO_IMPORTONETTOIVACOMP.AsFloat)
  else
    QRLabelDatiContrattoImporto.Caption := '';
  // ---------------------------------------------------------------------------
  // Dimensionamento verticale dei componenti che si devono adattare
  // all'altezza della banda che può cambiare.
  QRLabelEtichettaDatiContratto.Height := Sender.Height +
    SX_BAND_LABEL_CORRECTION;
  SfondoContrattoValidita.Height := Sender.Height + SX_BAND_LABEL_CORRECTION;
end;

procedure TAppuntamentoQR.QROP_UltimaPrint(Sender: TObject; var Value: String);
begin
  // Se il campo = 0 che nel caso delle date é '30/12/1899' non stampa nulla.
  if (Trim(Value) <> '') and (StrToDate(Value) = 0) then
    Value := '- - -';
end;

procedure TAppuntamentoQR.QRPrecInt_PrzUnitPrint(Sender: TObject;
  var Value: String);
begin
  // Elimina il simbolo dell'Euro e elimina gli eventuali spazi
  if LeftStr(Value, 1) = '€' then
    Value := Trim(RightStr(Value, Length(Value) - 1));
  // Se il prezzo è zero non lo stampa per niente.
  if (Value = '0') or (Value = '0.00') or (Value = '0,00') or (Value = '0.000')
    or (Value = '0,000') or (Value = '0.0000') or (Value = '0,0000') then
    Value := '';
  // Se è una OP compresa nell'abbonamento stampa "Abb."
  if (ImpegnoForm.QryIntPrecINABBONAMENTO.AsString = 'T')
  // then Value := 'Abb.';
  then
    Value := '';
end;

procedure TAppuntamentoQR.QRPrecInt_QtaPrint(Sender: TObject;
  var Value: String);
begin
  // Elimina il simbolo dell'Euro e elimina gli eventuali spazi
  if LeftStr(Value, 1) = '€' then
    Value := Trim(RightStr(Value, Length(Value) - 1));
  // Se il prezzo è zero non lo stampa per niente.
  if (Value = '0') or (Value = '0.00') or (Value = '0,00') or (Value = '0.000')
    or (Value = '0,000') or (Value = '0.0000') or (Value = '0,0000') then
    Value := '';
  // Se è una OP non stampa la Qta
  if (ImpegnoForm.QryIntPrecTIPORECORD.AsString = '20-OPERAZIONE PIANIFICATA')
  then
    Value := '';
end;

procedure TAppuntamentoQR.QROP_PeriodicitaPrint(Sender: TObject;
  var Value: String);
begin
  // Elimina il simbolo dell'Euro e elimina gli eventuali spazi
  if LeftStr(Value, 1) = '€' then
    Value := Trim(RightStr(Value, Length(Value) - 1));
  // Se il prezzo è zero non lo stampa per niente.
  if (Value = '0') or (Value = '0.00') or (Value = '0,00') or (Value = '0.000')
    or (Value = '0,000') or (Value = '0.0000') or (Value = '0,0000') then
    Value := '';
end;

end.
