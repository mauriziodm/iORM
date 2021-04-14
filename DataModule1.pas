unit DataModule1;

interface

//uses
//  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
//  DB, IBODataset, DBCtrls, IB_Components, DBTables, ComCtrls, Qrprntr, quickrpt,
//  SmartKey, FileCtrl, IniFiles, QRCtrls, Registry,
//  Mask, StdCtrls, IB_StoredProc, ZLIBArchive, cxGridBandedTableView,
//  cxCustomPivotGrid, cxContainer, cxEdit, ImgList, cxEditRepositoryItems,
//  AppEvnts, PLab, cxGridCardView, cxClasses, cxStyles, cxGridTableView,
//  IB_SessionProps, ExtCtrls, IB_Process, ThreadLev,
//  cxGrid, cxGridLevel, cxGraphics, cxGridCustomView,
//  cxGridCustomTableView, cxCurrencyEdit,
//  Variants, dxPSCore,
//  PLTypes, Math, cxDBEdit, FormMessage,
//  cxDBCheckListBox, cxDropDownEdit, cxDBLookupComboBox, cxPC, FormLevanteListAnag,
//  UnitCambiaDefaultPrinter, cxDBPivotGrid, cxScheduler, cxGridDBBandedTableView,
//  UnitFileRepository, IB_Script, cxTextEdit, cxGridDBTableView, cxCustomData,
//  IB_Access, PLBaseLab, dxCore, cxDBEditRepository, cxLocalization,
//  cxPropertiesStore;

uses
  Windows, Messages, System.SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, IBODataset, DBCtrls, IB_Components, ComCtrls, Qrprntr, quickrpt,
  SmartKey, FileCtrl, IniFiles, QRCtrls, Registry,
  Mask, StdCtrls, cxGridBandedTableView,
  cxCustomPivotGrid, cxContainer, cxEdit, ImgList, cxEditRepositoryItems,
  AppEvnts, cxGridCardView, cxClasses, cxStyles, cxGridTableView,
  IB_SessionProps, ExtCtrls, IB_Process, ThreadLev,
  cxGrid, cxGridLevel, cxGraphics, cxGridCustomView,
  cxGridCustomTableView, cxCurrencyEdit,
  Variants, Math, cxDBEdit, FormMessage,
  cxDBCheckListBox, cxDropDownEdit, cxDBLookupComboBox, cxPC, FormLevanteListAnag,
  UnitCambiaDefaultPrinter, cxDBPivotGrid, cxScheduler, cxGridDBBandedTableView,
  UnitFileRepository, IB_Script, cxTextEdit, cxGridDBTableView, cxCustomData,
  IB_Access, dxCore, cxDBEditRepository, cxLocalization,
  cxPropertiesStore, cxImageList, System.ImageList, dxPSCore, ZLIBArchive;

const

  // --------------------------------------------------------------------------
  // Costanti per compatibilità Linux
  // --------------------------------------------------------------------------
  // LINUX = True;
  LINUX = False;
  // --------------------------------------------------------------------------
  // Costanti per l'importazionde della lunghezza max di alcuni campi
  // --------------------------------------------------------------------------
  INDIRIZZOMAXLEN = 40;
  COMMISSIONATODALEN = 150;
  DIPROPRIETADILEN = 150;
  // --------------------------------------------------------------------------
  // Costanti per l'importazionde dei documenti
  // --------------------------------------------------------------------------
  MARCATORE_DOCUMENTO_SOLA_LETTURA = '(Sola Lettura)';
  // --------------------------------------------------------------------------
  // Costanti per la gestione dei documenti esterni (MAGO)
  // --------------------------------------------------------------------------
  EXT_DOC_REGISTRO = '***';
  // --------------------------------------------------------------------------
  // Costanti di parametri per la versione LEVARCO
  // --------------------------------------------------------------------------
  LEVARCO_MODE = True;
//  LEVARCO_MODE = False;
//  LEVARCO_PASSWORD = True;
  LEVARCO_PASSWORD = False;
  LEVARCO_ABSOLUTE_LOCK_DATE = '30/04/2022'; // Nella 4.11.128 per Levarco era al 31/12/2016
  // --------------------------------------------------------------------------
  // Costanti di parametri per la versione DEMO
  // --------------------------------------------------------------------------
  D_MODE = False;
  DEMO_DAYS = 60;
  DEMO_ABSOLUTE_LOCK_DATE = '30/06/2011';
  DEMO_FIRST_RUN_USER_ID = '00000';
  // --------------------------------------------------------------------------
  // Costanti per la protezione dei vari moduli (Indice del carattere per l'attivazione o meno del tipo di documento nella chiave hardware)
  // --------------------------------------------------------------------------
  MOD_CLIENTI = 15; // 1
  MOD_CEFALOMETRIE = 16; // 2
  MOD_ARTICOLI = 17; // 3
  MOD_PRATICHE = 18; // 4
  MOD_PREVENTIVI = 19; // 5
  MOD_ORDINI = 20; // 6
  MOD_SAL = 21; // 7
  MOD_DDT = 22; // 8
  MOD_FATTURE = 23; // 9
  MOD_NOTE_ACCREDITO = 24; // 10
  MOD_BOLLE_ENTRATA = 25; // 11
  MOD_SCADENZARIO = 26; // 12
  MOD_TESTI = 27; // 13
  MOD_FAX = 28; // 14
  MOD_CONTATTI = 29; // 15
  MOD_EXT_FILE = 30; // 16
  MOD_CONFORMITA = 31; // 17
  MOD_FATT_RIEPILOGATIVA = 32; // 18
  MOD_MULTIAZIENDALE = 33; // 19
  MOD_IMPORTAZIONE_ARCHIVI = 34; // 20
  MOD_FATTURE_ACQUISTO = 35; // 21
  MOD_RICEVUTE_FISCALI = 36; // 22
  MOD_SCADENZARIO_PASSIVO = 37; // 23
  MOD_ORDINI_FORNITORI = 38; // 24
  MOD_FATTURE_RF = 39; // 25
  MOD_DISCO_RIFATTURAZIONE = 40; // 26
  MOD_BUONO_CONSEGNA = 41; // 27
  MOD_SEGRETERIA = 42; // 28
  MOD_PRIMANOTA = 43; // 29
  MOD_PASSWORD = 44; // 30
  MOD_GIORNALE_MAGAZZINO = 45; // 31
  MOD_CONDIZIONI_VENDITA = 46; // 32
  MOD_AGENDA = 47; // 33
  MOD_GIORNALE_CANTIERE = 48; // 34
  // --------------------------------------------------------------------------
  // Indici dei documenti per l'array che conterrà a sua volta gli indici (sempre dei documenti)
  // da usare per vedere nelle checklistbox dei tipi di documento selezionati nei filtri documenti.
  // (Ho docuto fare così perchè nelle suddette CheckListBox l'indice di un documneto cambia in base
  // a quali documenti sono attivi e allora ho creato un array che a sua volta contiene gli indici
  // di un altro array, gli array delle checklistbox appunto).
  // NB: Il primo numero a SX indica da quale gruppo appartiene l'indice
  // 1 = Documenti di vendita
  // 2 = Documenti di acquisto
  // 3 = Altri documenti
  // --------------------------------------------------------------------------
  IDX_VEND_PREVENTIVI = 101;
  IDX_VEND_ORDINI = 102;
  IDX_VEND_SAL = 103;
  IDX_VEND_BUONICONSEGNA = 104;
  IDX_VEND_DDT = 105;
  IDX_VEND_FATTURE = 106;
  IDX_VEND_RICEVUTEFISCALI = 107;
  IDX_VEND_FATTURERICEVUTEFISCALI = 108;
  IDX_VEND_NOTEDICREDITO = 109;
  IDX_VEND_COMMESSA = 110;
  IDX_VEND_CARICOCANTIERE = 111;
  IDX_VEND_SCARICOCANTIERE = 112;
  IDX_VEND_CONTO = 113;
  IDX_VEND_INTERVENTO = 114;

  IDX_ACQ_ORDINIFORNITORI = 201;
  IDX_ACQ_BOLLEENTRATA = 202;
  IDX_ACQ_FATTUREACQUISTO = 203;
  IDX_ACQ_NOTEDICREDITO_FORNITORI = 204;

  IDX_ALTRI_TESTI = 301;
  IDX_ALTRI_FAXRICEVUTI = 302;
  IDX_ALTRI_FAXINVIATI = 303;
  IDX_ALTRI_FILESESTERNI = 304;
  IDX_ALTRI_CONFORMITA = 305;
  IDX_ALTRI_CONTATTI = 306;
  IDX_RAPP_GIORN = 307;
  // --------------------------------------------------------------------------
  // Costanti che contengono alcuni codici utilizzati nel sistema di lettura del codice a barre dei documenti
  // --------------------------------------------------------------------------
  // Costanti che indica il tipo di codice a barre letto.
  BARCODE_TIPOCODICE_CMD = '0';
  BARCODE_TIPOCODICE_DOCUMENTO = '1';
  BARCODE_TIPOCODICE_ARTICOLO = '2';
  BARCODE_TIPOCODICE_AGENTE = '3';
  // Costanti che indicano il tipo di documento letto (ovviamente nel caso si sia letto un documento)
  BARCODE_DOC_INTERVENTO = '1';
  BARCODE_DOC_PREVENTIVO = '2';
  BARCODE_DOC_ORDINE = '3';
  BARCODE_DOC_SAL = '4';
  BARCODE_DOC_BUONO_CONSEGNA = '5';
  BARCODE_DOC_DDT = '6';
  BARCODE_DOC_RICEVUTA_FISCALE = '7';
  BARCODE_DOC_FATTURA = '8';
  BARCODE_DOC_FATTURA_RICEVUTA_FISCALE = '9';
  BARCODE_DOC_NOTA_CREDITO = 'A';
  BARCODE_DOC_COMMESSA = 'B';
  BARCODE_DOC_CARICO_CANTIERE = 'C';
  BARCODE_DOC_SCARICO_CANTIERE = 'D';
  BARCODE_DOC_ESTRATTO_CONTO = 'E';
  BARCODE_DOC_ORDINE_FORNITORE = 'F';
  BARCODE_DOC_BOLLA_ENTRATA = 'G';
  BARCODE_DOC_FATTURA_ACQUISTO = 'H';
  BARCODE_DOC_NOTA_CREDITO_FORNITORE = 'I';
  // Costanti contenenti i codici dei comandi letti con il barcode
  BARCODE_CMD_CONVERTIINTERVENTO = '1';
  // --------------------------------------------------------------------------
  // COstanti che contengono le impostazioni IVA di default
  // --------------------------------------------------------------------------
  DEFAULT_CODICE_IVA = 1;
  DEFAULT_DESCRIZIONE_IVA = '22%';
  DEFAULT_ALIQUOTA_IVA = 22;
  // --------------------------------------------------------------------------
  // Altre costanti
  // --------------------------------------------------------------------------
  SOGLIADRAGDROP = 3; // Soglia di spostamento dopo la quale avviene l'attivazione del drag drop.
  RECORD_MODIFIED = 'M'; // Valore del flag che indica che il record è stato modificato e quindi è da sincronizzare
  RECORD_SYNCHRONIZED = 'S'; // Valore del flag che indica che ilrecord è stato sincronizzato
  MOLTIPLICATORE_AGGIUNTA_CODCHIAVE = 100000; // Moltiplicatore usato per aggiungere il codice chiave ai codici quando attivato (Con sincronizzazione)
  // --------------------------------------------------------------------------
  // Alcune costanti che fungono da parametri per la visualizzazione dei pannelli
  // --------------------------------------------------------------------------
  StartingTopPosition = 7;
  Separation = 5;
  PanelHeight = 109;

  PANEL_DATI_ENTE_GAS_TOP = 200;
  PANEL_DATI_ENTE_GAS_LEFT = 265;
  // --------------------------------------------------------------------------
  // Costanti che riguardano i colori di visualizzazione delle griglie
  // --------------------------------------------------------------------------
  COLORE_ARTICOLI_SOTTOSCORTA = clRed;
  COLORE_ARTICOLI_SOTTO_PUNTO_RIORDINO = $002B95FF;
  // --------------------------------------------------------------------------
  // Costante che indica a quale riga deve essere presente la clausola WHERE
  // delle query per poter far funzionare le funzioni 'AddSQLTo...'
  // --------------------------------------------------------------------------
  // WHERE_LINE_INDEX                              = 15;
  // --------------------------------------------------------------------------
  // Costanti che contengono i nomi dei files contenenti le icone del TIPO DOCUMENTO O FORM VISUALIZZATA
  // --------------------------------------------------------------------------
  DT_SOGGETTO = 'dt_soggetto.bmp';
  DT_RUBRICA = 'dt_rubrica.bmp';
  DT_DOCUMENTI = 'dt_documenti.bmp';
  DT_DOCUMENTO = 'dt_documento.bmp';
  DT_ARTICOLI = 'dt_articoli.bmp';
  DT_GIORNMAG = 'dt_giornmag.bmp';
  DT_CONDVEND = 'dt_condvend.bmp';
  DT_PRATICHE = 'dt_pratiche.bmp';
  DT_ASSISTENZE = 'dt_assistenze.bmp';
  DT_IMPEGNI = 'dt_impegni.bmp';
  DT_PRIMANOTA = 'dt_primanota.bmp';
  DT_IMPOSTAZIONI = 'dt_impostazioni.bmp';
  DT_AGENDA = 'dt_agenda.bmp';
  // --------------------------------------------------------------------------
  // Costanti che contengono gli indici per accedere all'array AutoQuery che contiene
  // l'abilitazione o meno di ogni pagina (Tabs) della schermata principale
  // ad eseguire automaticamente le query quando l'utente si posiziona o essi.
  // --------------------------------------------------------------------------
  IDX_AUTOQUERY_RUBRICA = 0;
  IDX_AUTOQUERY_PRATICHE = 1;
  IDX_AUTOQUERY_DOCUMENTI = 2;
  IDX_AUTOQUERY_SCADENZE = 3;
  IDX_AUTOQUERY_ARTICOLI = 4;
  IDX_AUTOQUERY_GM = 5;
  IDX_AUTOQUERY_CV = 6;
  IDX_AUTOQUERY_PRIMANOTA = 7;
  IDX_AUTOQUERY_ASSISTENZE = 8;
  IDX_AUTOQUERY_IMPEGNI = 9;
  IDX_AUTOQUERY_AGENDA = 10;
  IDX_AUTOQUERY_GC = 11;
  IDX_AUTOQUERY_PARTITARIO = 12;
  IDX_AUTOQUERY_GOS = 13;
  // --------------------------------------------------------------------------
  // Costanti per la stampa (griglie DevExpress) dei TOTALI
  // --------------------------------------------------------------------------
  TP_PAGE_HEADER = 0;
  TP_PAGE_FOOTER = 1;

  // --------------------------------------------------------------------------
  // Costanti per la stampa delle ETICHETTE
  // --------------------------------------------------------------------------
  IDX_ETICHETTA_ARTICOLO = 0;
  IDX_ETICHETTA_SOGGETTO = 1;

  // --------------------------------------------------------------------------
  // Costanti per l'accesso alla TImageList delle icone relative agli STATI DEI DOCUMENTO E DEI RIGHI
  // --------------------------------------------------------------------------
  IDX_DS_MOVMAG_NULLA = 0;
  IDX_DS_MOVMAG_SCARICO = 1;
  IDX_DS_MOVMAG_IMPEGNATO = 2;
  IDX_DS_MOVMAG_ORDINATO = 3;
  IDX_DS_MOVMAG_CARICO = 4;
  IDX_DS_IMPORT = 5;
  IDX_DS_EXPORT = 6;
  IDX_DS_IMPORT_EXPORT = 7;
  IDX_DS_DA_FATTURARE = 8;
  IDX_DS_FATTURATO = 9;

  // --------------------------------------------------------------------------
  // Costanti per il posizionamento e il dimensionamento delle icone relative agli STATI DEI DOCUMENTI E DEI RIGHI
  // --------------------------------------------------------------------------
  DS_LEFT_MARGIN = 0;
  DS_TOP_MARGIN = 1;
  DS_ICON_WIDTH = 10;
  DS_ICON_SEPARATION = 1;

  // --------------------------------------------------------------------------
  // Costanti per indicare i valori dei FLAGS DI STATO DEI DOCUMENTI E DEI RIGHI
  // --------------------------------------------------------------------------
  FLAG_VALUE_IMPORTED = 'I';
  FLAG_VALUE_EXPORTED = 'E';
  FLAG_VALUE_IMPORTED_EXPORTED = 'B';
  FLAG_VALUE_DA_FATTURARE = 'F';
  FLAG_VALUE_FATTURATO = '*';

  // --------------------------------------------------------------------------
  // Costanti per la posizione del bit del tipo di intervento richiesto/effettuato negli impegni
  // --------------------------------------------------------------------------
  BitInterventoPrimaAccensione = 1; // BIT 0
  BitInterventoMalfunzionamento = 2; // BIT 1
  BitInterventoManutenzione = 4; // BIT 2
  BitInterventoProvaCombustione = 8; // BIT 3
  { A word is arranged like this... }
  { The Word   -  0  0  0  0  0  0 0 0 0 0 0 0 0 0 0 0 }
  { Bit Number - 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0 }
  Bit0 = 1;
  Bit1 = 2;
  Bit2 = 4;
  Bit3 = 8;
  Bit4 = 16;
  Bit5 = 32;
  Bit6 = 64;
  Bit7 = 128;
  Bit8 = 256;
  Bit9 = 512;
  Bit10 = 1024;
  Bit11 = 2048;
  Bit12 = 4096;
  Bit13 = 8192;
  Bit14 = 16384;
  Bit15 = 32768;

  // --------------------------------------------------------------------------
  // Costanti per i tipi di righi nei documenti
  // --------------------------------------------------------------------------
  TIPORIGODOC_CHAR_GRAYED = '_'; // Se il tipo di rigo finisce con questo carattere l'importo deve essere visualizzato in grigio o cmq in secondo piano
  TIPORIGODOC_Normale = '';
  // TIPORIGODOC_Riferimento = 'Riferimento';
  TIPORIGODOC_SottorigoTemporaneo = 'Sottorigo temporaneo';
  TIPORIGODOC_NoCalc = 'Non calcolare_';
  // Beni significativi e beni non significativi
  TIPORIGODOC_BeneSignificativo = 'Bene significat_';
  TIPORIGODOC_BeneNonSignificativo = 'Bene non significat_';
  TIPORIGODOC_BS_UpperLine = 'BS_UpperLine_';
  TIPORIGODOC_BS_ValoreComplessivo = 'BS_ValComplessivo';
  TIPORIGODOC_BS_ValoreBS = 'BS_ValBeniSign';
  TIPORIGODOC_BS_IvaAgevolata = 'BS_IvaAgevolata';
  TIPORIGODOC_BS_IvaOrdinaria = 'BS_IvaOrdinaria';
  TIPORIGODOC_BS_AltriCosti = 'BS_ValBeniNonSign';
  TIPORIGODOC_BS_BottomLine = 'BS_BottomLine_';
  // Totale a corpo
  TIPORIGODOC_TC_Rigo = 'TC_Rigo_';
  TIPORIGODOC_TC_Totale = 'TC_Totale';

type
  TOnCellClick = procedure(Sender: TObject; ACol, ARow: Integer; AButton: TMouseButton; AShift: TShiftState) of object;

  // Modalità di inserimento di nuovi articoli nel documsnto
  TAddArtMode = (AM_Append, AM_Insert, AM_Edit);

  // Dichiara un Record che conterrà dati utili per la distinta base
  TDiBaValues = Record
    ImportoMargine, PrezzoDiVendita, PrezzoDiVenditaIvaComp, Totale: Double;
  end;

  // Flags per il controllo della versione demo
  TDemoFlags = record
    InfoDemoShowed: Boolean;
    GiorniMancantiFineDemo: Integer;
    DataPrimoAvvio: TDateTime;
    DataScadenza: TDateTime;
    DataBloccoTotale: TDateTime;
  end;

  // Dichiara la struttura che contiene i dati dello speciale articolo Manodopera
  TManodopera = record
    Codice: String;
    Descrizione: String;
    UM: String;
    PrezzoUnitario1: Currency;
    PrezzoUnitario2: Currency;
    PrezzoUnitario3: Currency;
    PrezzoUnitario4: Currency;
    CostoUnitario: Currency;
  end;

  // Dichiara la struttura che contiene gli sconti per fasce di prezzo
  TFasciaRicarichi = record
    PrezzoAl: Double;
    Ricarico1: Double;
    Ricarico2: Double;
    Ricarico3: Double;
    Ricarico4: Double;
  end;

  TDM1 = class(TDataModule)
    TableAliquoteIVA: TIBOTable;
    SourceAliquoteIVA: TDataSource;
    TableProgressivi: TIBOTable;
    SourceProgressivi: TDataSource;
    TableDatiAzienda: TIBOTable;
    SourceDatiAzienda: TDataSource;
    TableTesti: TIBOTable;
    SourceTesti: TDataSource;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    TableContatti: TIBOTable;
    SourceContatti: TDataSource;
    TableContattiCodice: TIntegerField;
    TableContattiCliente: TIntegerField;
    TableContattiData: TDateField;
    TableContattiOggetto: TStringField;
    TableContattiPratica: TIntegerField;
    TableProgressiviProgArt: TIntegerField;
    TableConformita: TIBOTable;
    SourceConformita: TDataSource;
    TimerSmartKey: TTimer;
    TableContattiParlatoDi: TMemoField;
    TableContattiPratica2: TIntegerField;
    TableContattiPratica3: TIntegerField;
    TableContattiNote: TStringField;
    TableContattiArgomento: TStringField;
    TableContattiProvenienza: TStringField;
    TableStatiDocumenti: TIBOTable;
    SourceStatiDocumenti: TDataSource;
    TableStatiDocumentiDescrizione: TStringField;
    TableStatiDocumentiTipoDocumento: TStringField;
    TableStatiDocumentiForeground: TStringField;
    TableStatiDocumentiBackground: TStringField;
    TableStatiDocumentiNote: TStringField;
    TableContattiDataPratica1: TDateField;
    TableContattiDataPratica2: TDateField;
    TableContattiDataPratica3: TDateField;
    TableContattiDescPratica1: TStringField;
    TableContattiDescPratica2: TStringField;
    TableContattiDescPratica3: TStringField;
    TableContattiStatoDescrizione: TStringField;
    TableContattiStatoForeground: TStringField;
    TableContattiStatoBackground: TStringField;
    TableProgressiviMsgPreventivi: TStringField;
    TableProgressiviMsgOrdini: TStringField;
    TableProgressiviMsgOrdiniFornitori: TStringField;
    TableProgressiviMsgSAL: TStringField;
    TableProgressiviMsgDDT: TStringField;
    TableProgressiviMsgFatture: TStringField;
    TableProgressiviMsgNoteAccredito: TStringField;
    TableProgressiviMsgBolleEntrata: TStringField;
    TableProgressiviMsgFattureAcquisto: TStringField;
    TableProgressiviMsgRicevuteFiscali: TStringField;
    TableProgressiviMsgBuoniConsegna: TStringField;
    TableProgressiviCopiePreventivi: TSmallintField;
    TableProgressiviCopieOrdini: TSmallintField;
    TableProgressiviCopieOrdForn: TSmallintField;
    TableProgressiviCopieSAL: TSmallintField;
    TableProgressiviCopieDDT: TSmallintField;
    TableProgressiviCopieFatture: TSmallintField;
    TableProgressiviCopieNoteAccredito: TSmallintField;
    TableProgressiviCopieBolleEntrata: TSmallintField;
    TableProgressiviCopieFattAcquisto: TSmallintField;
    TableProgressiviCopieRicFisc: TSmallintField;
    TableProgressiviCopieBuonoConsegna: TSmallintField;
    TableContattiRagSocCli: TStringField;
    TableContattiIndirizzoCli: TStringField;
    TableContattiCittaCli: TStringField;
    TableContattiCAPCli: TStringField;
    TableContattiProvinciaCli: TStringField;
    FontDialog1: TFontDialog;
    TableContattiTipo: TStringField;
    TableContattiMezzo: TStringField;
    TableContattiPeriodicita: TSmallintField;
    TableContattiContattoSuccessivo: TIntegerField;
    TableContattiContattoPrecedente: TIntegerField;
    TableContattiAnticipoAllarme: TSmallintField;
    TableContattiDataSuccessivo: TDateField;
    TableContattiDataPrecedente: TDateField;
    TableContattiAllarme: TStringField;
    DBAzienda: TIBODatabase;
    TableProgressiviENABLEPROGART: TStringField;
    TableContattiORA: TStringField;
    TableConformitaCODICE: TIntegerField;
    TableConformitaCLIENTE: TIntegerField;
    TableConformitaDATA: TDateTimeField;
    TableConformitaNUOVOIMPIANTO: TStringField;
    TableConformitaTRASFORMAZIONE: TStringField;
    TableConformitaAMPLIAMENTO: TStringField;
    TableConformitaMANUTSTRAORDINARIA: TStringField;
    TableConformitaALTRO: TStringField;
    TableConformitaTXTALTRO: TStringField;
    TableConformitaCOMMISSIONATODA: TStringField;
    TableConformitaNELCOMUNEDI: TStringField;
    TableConformitaPROVINCIA: TStringField;
    TableConformitaVIA: TStringField;
    TableConformitaNUMERO: TStringField;
    TableConformitaSCALA: TStringField;
    TableConformitaPIANO: TStringField;
    TableConformitaDIPROPRIETADI: TStringField;
    TableConformitaRISPETTATOPROGETTO: TStringField;
    TableConformitaSEGUITONORMATECNICA: TStringField;
    TableConformitaINSTALLATOCOMPONENTI: TStringField;
    TableConformitaCONTROLLATOIMPIANTO: TStringField;
    TableConformitaALLEGATOPROGETTO: TStringField;
    TableConformitaALLEGATORELAZIONE: TStringField;
    TableConformitaALLEGATOSCHEMA: TStringField;
    TableConformitaALLEGATORIFCONFORMITA: TStringField;
    TableConformitaALLEGATOCOPIACERTIFICATO: TStringField;
    TableConformitaNORMATECNICA: TStringField;
    TableConformitaALLEGATIFACOLTATIVI: TStringField;
    TableConformitaUSOINDUSTRIALE: TStringField;
    TableConformitaUSOCIVILE: TStringField;
    TableConformitaUSOCOMMERCIO: TStringField;
    TableConformitaALTRIUSI: TStringField;
    TableConformitaNOTE: TStringField;
    TableConformitaPRATICA: TIntegerField;
    TableConformitaPRATICA2: TIntegerField;
    TableConformitaPRATICA3: TIntegerField;
    TableConformitaDATAPRATICA1: TDateTimeField;
    TableConformitaDATAPRATICA2: TDateTimeField;
    TableConformitaDATAPRATICA3: TDateTimeField;
    TableConformitaOGGETTO: TStringField;
    TableConformitaSTATODESCRIZIONE: TStringField;
    TableConformitaSTATOFOREGROUND: TStringField;
    TableConformitaSTATOBACKGROUND: TStringField;
    TableConformitaILSOTTOSCRITTO: TStringField;
    TableConformitaRAGSOCCLI: TStringField;
    TableConformitaINDIRIZZOCLI: TStringField;
    TableConformitaCITTACLI: TStringField;
    TableConformitaCAPCLI: TStringField;
    TableConformitaPROVINCIACLI: TStringField;
    TableConformitaMATIDONEIAMBIENT: TStringField;
    TableConformitaCOMPIMPESISTENTE: TStringField;
    TableConformitaRISPONDENTENORME: TStringField;
    TableConformitaCONFORMEART7: TStringField;
    TableConformitaALLEGATI: TStringField;
    TableConformitaNATOCITTA: TStringField;
    TableConformitaNATOPROV: TStringField;
    TableConformitaNATOIL: TDateTimeField;
    TableConformitaRESIDENTECITTA: TStringField;
    TableConformitaRESIDENTEINDIRIZZO: TStringField;
    TableConformitaRESIDENTEPROV: TStringField;
    TableConformitaPRIMACCCODICESOGG: TIntegerField;
    TableConformitaPRIMACCNUMCALDAIE: TSmallintField;
    TableConformitaPRIMACCDATA: TDateTimeField;
    TableTestiCODICE: TIntegerField;
    TableTestiDATA: TDateTimeField;
    TableTestiCLIENTE: TIntegerField;
    TableTestiPRATICA: TIntegerField;
    TableTestiNOTE: TStringField;
    TableTestiARGOMENTO: TStringField;
    TableTestiPROVENIENZA: TStringField;
    TableTestiPRATICA2: TIntegerField;
    TableTestiPRATICA3: TIntegerField;
    TableTestiDATAPRATICA1: TDateTimeField;
    TableTestiDATAPRATICA2: TDateTimeField;
    TableTestiDATAPRATICA3: TDateTimeField;
    TableTestiSTATODESCRIZIONE: TStringField;
    TableTestiSTATOFOREGROUND: TStringField;
    TableTestiSTATOBACKGROUND: TStringField;
    TableTestiOGGETTO: TStringField;
    TableTestiRAGSOCCLI: TStringField;
    TableTestiINDIRIZZOCLI: TStringField;
    TableTestiCITTACLI: TStringField;
    TableTestiCAPCLI: TStringField;
    TableTestiPROVINCIACLI: TStringField;
    DBGenerale: TIBODatabase;
    TableDatiAziendaRAGIONESOCIALE: TStringField;
    TableDatiAziendaSETTORE: TStringField;
    TableDatiAziendaINDIRIZZO: TStringField;
    TableDatiAziendaPROVINCIA: TStringField;
    TableDatiAziendaTELEFONO: TStringField;
    TableDatiAziendaP_IVA: TStringField;
    TableDatiAziendaCAP: TStringField;
    TableDatiAziendaREGALBOARTIGIANIDI: TStringField;
    TableDatiAziendaNUMREGALBOARTIGIANI: TStringField;
    TableDatiAziendaREGREGISTRODITTEDI: TStringField;
    TableDatiAziendaNUMREGREGISTRODITTE: TStringField;
    TableDatiAziendaFAX: TStringField;
    TableDatiAziendaEMAIL: TStringField;
    TableDatiAziendaNATOCITTA: TStringField;
    TableDatiAziendaNATOPROV: TStringField;
    TableDatiAziendaNATOIL: TDateTimeField;
    TableDatiAziendaRESIDENTECITTA: TStringField;
    TableDatiAziendaRESIDENTEINDIRIZZO: TStringField;
    TableDatiAziendaRESIDENTEPROV: TStringField;
    TableConformitaDESCPRATICA1: TStringField;
    TableConformitaDESCPRATICA2: TStringField;
    TableConformitaDESCPRATICA3: TStringField;
    TableTestiDESCPRATICA1: TStringField;
    TableTestiDESCPRATICA2: TStringField;
    TableTestiDESCPRATICA3: TStringField;
    TableTestiTEXTFILE: TBlobField;
    TableProgressiviINDEXFIELD: TIntegerField;
    TableDatiAziendaCITTA: TStringField;
    TableAliquoteIVASINCHRO: TStringField;
    TableConformitaINTERNO: TStringField;
    TableProgressiviVERSIONEARCBASE: TIntegerField;
    TableConformitaRIFDOCUMFISCALE: TStringField;
    TableAliquoteIVAALIQUOTAIVA: TIBOFloatField;
    TableAliquoteIVADESCRIZIONEIVA: TStringField;
    TableAliquoteIVACODICEIVA: TIntegerField;
    QueryDocSel: TIBOQuery;
    SourceQueryDocSel: TDataSource;
    IB_SessionProps1: TIB_SessionProps;
    GridsStyleRepository: TcxStyleRepository;
    tvGridHeader: TcxStyle;
    tvGrayContent: TcxStyle;
    tvSelected: TcxStyle;
    tvBackground: TcxStyle;
    tvGroupByBox: TcxStyle;
    tvGridGroupRow: TcxStyle;
    MasterTableViewStyleSheet: TcxGridTableViewStyleSheet;
    tvContentEven: TcxStyle;
    tvContentOdd: TcxStyle;
    tvContentEvenModifica: TcxStyle;
    tvContentOddModifica: TcxStyle;
    tvBackgroundModifica: TcxStyle;
    TableProgressiviCODICEOPERA: TStringField;
    TableProgressiviDESCRIZIONEOPERA: TStringField;
    TableProgressiviUMOPERA: TStringField;
    TableProgressiviPRZUNITOPERA1: TIBOFloatField;
    TableProgressiviPRZUNITOPERA2: TIBOFloatField;
    TableProgressiviPRZUNITOPERA3: TIBOFloatField;
    TableProgressiviPRZUNITOPERA4: TIBOFloatField;
    TabsBackground: TcxStyle;
    Tab: TcxStyle;
    tvDisableStyleSheet: TcxGridTableViewStyleSheet;
    tvDisBackground: TcxStyle;
    tvDisContent: TcxStyle;
    tvDisHeader: TcxStyle;
    cvEnabledStyleSheet: TcxGridCardViewStyleSheet;
    cvEnBackground: TcxStyle;
    cvEnContent: TcxStyle;
    cvEnContentBold: TcxStyle;
    cvEnContentRed: TcxStyle;
    cvDisabledStyleSheet: TcxGridCardViewStyleSheet;
    cvDisBackground: TcxStyle;
    cvDisContent: TcxStyle;
    cvDisContentBold: TcxStyle;
    cvDisContentRed: TcxStyle;
    PrintStyleSheet: TcxGridTableViewStyleSheet;
    PrintBackground: TcxStyle;
    PrintContentEven: TcxStyle;
    PrintContentOdd: TcxStyle;
    PrintGridHeader: TcxStyle;
    PrintGroup: TcxStyle;
    ApplicationEvents1: TApplicationEvents;
    cxEditRepository1: TcxEditRepository;
    EdPropQtaOpera: TcxEditRepositoryMaskItem;
    EdPropQtaOld: TcxEditRepositoryTextItem;
    ImgListStatiDoc: TImageList;
    TableProgressiviDEFAULTABILITAMOVMAG: TStringField;
    TableProgressiviDEFAULTSOLOARTPREFERITI: TStringField;
    tvAnotherStyleSheet: TcxGridTableViewStyleSheet;
    tvAnotherContent1: TcxStyle;
    tvAnotherContent1Bold: TcxStyle;
    TableConformitaPRIMACCDATICALDAIA: TBlobField;
    TableProgressiviSTARTPREVENTIVO: TBlobField;
    TableProgressiviENDPREVENTIVO: TBlobField;
    TableProgressiviABILITASTARTPREVENTIVO: TStringField;
    TableProgressiviABILITAENDPREVENTIVO: TStringField;
    TableConformitaFOGLIO: TStringField;
    TableConformitaPARTICELLA: TStringField;
    TableConformitaSUB: TStringField;
    AgDateCalendarContent: TcxStyle;
    AgDateCalendarHeader: TcxStyle;
    tvGroupFooter: TcxStyle;
    tvAnotherContent2: TcxStyle;
    tvContent: TcxStyle;
    tvGCDetail: TcxGridTableViewStyleSheet;
    tvGCDetailContent: TcxStyle;
    tvGCDetailFooter: TcxStyle;
    tvGCDetailGroupByBox: TcxStyle;
    tvGCDetailColumnHeader: TcxStyle;
    tvGCDetailSelection: TcxStyle;
    tvGCDetailBackground: TcxStyle;
    tvGCMaster: TcxGridTableViewStyleSheet;
    tvStampaGC: TcxGridTableViewStyleSheet;
    tvStampaGCBackground: TcxStyle;
    tvStampaGCGridHeader: TcxStyle;
    tvStampaGCGroup: TcxStyle;
    tvStampaGCContent: TcxStyle;
    tvStampaGCFooter: TcxStyle;
    tvStampaGCDetBackground: TcxStyle;
    tvStampaGCDetGridHeader: TcxStyle;
    tvStampaGCDetGroup: TcxStyle;
    tvStampaGCDetContent: TcxStyle;
    tvStampaGCDetFooter: TcxStyle;
    tvStampaGCDet: TcxGridTableViewStyleSheet;
    QryLabArt: TIBOQuery;
    QryLabSogg: TIBOQuery;
    QryLabArtCODICESTAZIONE: TStringField;
    QryLabArtPROGRIGO: TIntegerField;
    QryLabArtCODICEARTICOLO: TStringField;
    QryLabArtDESCRIZIONE: TStringField;
    QryLabArtDESCRIZIONE2: TStringField;
    QryLabArtDESCRIZIONE3: TStringField;
    QryLabArtDESCRIZIONE4: TStringField;
    QryLabArtDESCRIZIONE5: TStringField;
    QryLabArtUNITADIMISURA: TStringField;
    QryLabArtPREZZODIVENDITA: TIBOFloatField;
    QryLabArtPREZZODIVENDITA2: TIBOFloatField;
    QryLabArtPREZZODIVENDITA3: TIBOFloatField;
    QryLabArtPREZZODIVENDITA4: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP1: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP2: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP3: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP4: TIBOFloatField;
    QryLabArtBARCODE: TStringField;
    QryLabArtMARCA: TStringField;
    QryLabArtTIPODOCUMENTO: TStringField;
    QryLabArtREGISTRO: TStringField;
    QryLabArtNUMORDPREV: TIntegerField;
    QryLabArtDATADOCUMENTO: TDateTimeField;
    QryLabArtCODICECLIENTE: TIntegerField;
    QryLabSoggCODICESTAZIONE: TStringField;
    QryLabSoggPROGRIGO: TIntegerField;
    QryLabSoggCODICE: TIntegerField;
    QryLabSoggRAGIONESOCIALE: TStringField;
    QryLabSoggINDIRIZZO: TStringField;
    QryLabSoggCITTA: TStringField;
    QryLabSoggCAP: TStringField;
    QryLabSoggPROVINCIA: TStringField;
    TableProgressiviEVIDENZIACONSEGNAENTRO: TSmallintField;
    TableConformitaS1QAPROGIMPGAS: TStringField;
    TableConformitaS1QAPROGIMPGASRIF: TStringField;
    TableConformitaS1QAPROGCAMINO: TStringField;
    TableConformitaS1QAPROGCAMINORIF: TStringField;
    TableConformitaS1QAPROGPREVINC: TStringField;
    TableConformitaS1QAPROGPREVINCRIF: TStringField;
    TableConformitaS1QBDICHGASPREC: TStringField;
    TableConformitaS1QBDICHGASPRECNUM: TStringField;
    TableConformitaS1QBDICHGASPRECDATA: TDateTimeField;
    TableConformitaS1QBDICHGASPRECDITTA: TStringField;
    TableConformitaS1QBDICCAMINOPREC: TStringField;
    TableConformitaS1QBDICCAMINOPRECNUM: TStringField;
    TableConformitaS1QBDICCAMINOPRECDATA: TDateTimeField;
    TableConformitaS1QBDICCAMINOPRECDITTA: TStringField;
    TableConformitaS1QCPROGIMPINTGAS: TStringField;
    TableConformitaS1QCPROGIMPINTGASRIF: TStringField;
    TableConformitaS1QCCPI: TStringField;
    TableConformitaS1QCCPIRIF: TStringField;
    TableConformitaS1QCRELTEC: TStringField;
    TableConformitaS1QCRELTECRIF: TStringField;
    TableConformitaS1QCALL2: TStringField;
    TableConformitaS1QCALL2RIF: TStringField;
    TableConformitaS2QANUOVOIMPGAS: TStringField;
    TableConformitaS2QAMODIMPESIST: TStringField;
    TableConformitaS2QAINSTAPPGAS: TStringField;
    TableConformitaS2QAINSTTRATTOTUBO: TStringField;
    TableConformitaS2QAINSTPZSPEC: TStringField;
    TableConformitaS2QACOLLEGAPPCANNAFUM: TStringField;
    TableConformitaS2QAREALAPVENT: TStringField;
    TableConformitaS2QAREALAPAERAZ: TStringField;
    TableConformitaS2QACAMINOSINGOLO: TStringField;
    TableConformitaS2QACANNACOLLETTIVA: TStringField;
    TableConformitaS2QACANNACOLLRAMIF: TStringField;
    TableConformitaS2QAALTRO: TStringField;
    TableConformitaS2QAALTRODESC: TStringField;
    TableConformitaS2QBAPPCOLLKW: TStringField;
    TableConformitaS2QBAPPCOLLKWTOT: TIBOFloatField;
    TableConformitaS2QBSOLOPRED: TStringField;
    TableConformitaS2QBSOLOPREDKWTOT: TIBOFloatField;
    TableConformitaS2QBCOLLEGAMENTODI: TStringField;
    TableConformitaS2QBCOLLEGAMENTODIDESC: TStringField;
    TableConformitaS2QBSOSTITUZIONEDI: TStringField;
    TableConformitaS2QBSOSTITUZIONEDIDESC: TStringField;
    TableConformitaS2QBADEGNORMA: TStringField;
    TableConformitaS2QBADEGNORMADESC: TStringField;
    TableConformitaS2QBALTRO: TStringField;
    TableConformitaS2QBALTRODESC: TStringField;
    TableConformitaS2QCESECCONFPROG: TStringField;
    TableConformitaS2QCESECCURAINST: TStringField;
    TableConformitaS3QAAPVENTEFF1: TStringField;
    TableConformitaS3QAAPVENTEFF1CM: TIBOFloatField;
    TableConformitaS3QAAPVENTEFF1NOTA: TStringField;
    TableConformitaS3QAAPVENTEFF2: TStringField;
    TableConformitaS3QAAPVENTEFF2CM: TIBOFloatField;
    TableConformitaS3QAAPVENTEFF2NOTA: TStringField;
    TableConformitaS3QACONTMANCFIAMMA: TStringField;
    TableConformitaS3QBUNI: TStringField;
    TableConformitaS3QBUNIDESC: TStringField;
    TableConformitaS3QBDM120496: TStringField;
    TableConformitaS3QBALTRO: TStringField;
    TableConformitaS3QBALTRODESC: TStringField;
    TableConformitaS3QBNOTE: TStringField;
    TableConformitaS4TENUTATUBGAS: TStringField;
    TableConformitaS4TENUTATUBGASA: TStringField;
    TableConformitaS4TENUTACAMINO: TStringField;
    TableConformitaS4TENUTACAMINOA: TStringField;
    TableConformitaS4NOTE: TStringField;
    TableConformitaS4ALLOBBDATA: TDateTimeField;
    TableConformitaS2QAQN: TIBOFloatField;
    TableConformitaS3QAAPPCE: TStringField;
    TableConformitaS2QBBGIMAGE: TBlobField;
    TableConformitaRIFMODEL_CODICE: TIntegerField;
    TableConformitaDESCMODELLO: TStringField;
    TableConformitaDESCIMPIANTO: TBlobField;
    WizardStyleController: TcxEditStyleController;
    TableStatiDocumentiSINCHRO: TStringField;
    TableConformitaSINCHRO: TStringField;
    TableConformitaS4NOTETENUTACAMINO: TStringField;
    TableConformitaS3QACONTMANCFIAMMANOTA: TStringField;
    TableConformitaS1QADICHCONFMODB: TStringField;
    TableConformitaS1QADICHCONFMODD: TStringField;
    TableConformitaCAP: TStringField;
    TableConformitaCOMMITCODICE: TIntegerField;
    TableConformitaCOMMITDENOMINAZIONE: TStringField;
    TableConformitaCOMMITINDIRIZZO: TStringField;
    TableConformitaCOMMITNUMCIVICO: TStringField;
    TableConformitaCOMMITSCALA: TStringField;
    TableConformitaCOMMITPIANO: TStringField;
    TableConformitaCOMMITINTERNO: TStringField;
    TableConformitaCOMMITCAP: TStringField;
    TableConformitaCOMMITLOCALITA: TStringField;
    TableConformitaCOMMITPROVINCIA: TStringField;
    TableConformitaPROPCODICE: TIntegerField;
    TableConformitaPROPDENOMINAZIONE: TStringField;
    TableConformitaPROPINDIRIZZO: TStringField;
    TableConformitaPROPNUMCIVICO: TStringField;
    TableConformitaPROPSCALA: TStringField;
    TableConformitaPROPPIANO: TStringField;
    TableConformitaPROPINTERNO: TStringField;
    TableConformitaPROPCAP: TStringField;
    TableConformitaPROPLOCALITA: TStringField;
    TableConformitaPROPPROVINCIA: TStringField;
    TableConformitaIMMOBCODICE: TIntegerField;
    TableConformitaCOMMITTELEFONO: TStringField;
    TableConformitaCOMMITPIVA: TStringField;
    TableConformitaCOMMITCODICEFISCALE: TStringField;
    TableConformitaPROPTELEFONO: TStringField;
    TableConformitaPROPPIVA: TStringField;
    TableConformitaPROPCODICEFISCALE: TStringField;
    TableConformitaIMPIANTOINSERVIZIO: TStringField;
    TableConformitaSOSTITUZAPPARECCHIOINSTALLATO: TStringField;
    TableConformitaSOCGASCODICE: TIntegerField;
    TableDatiAziendaNUMCIVICO: TStringField;
    TableDatiAziendaRESIDENTENUMCIVICO: TStringField;
    TableDatiAziendaRTNOME: TStringField;
    TableDatiAziendaRTNATOCITTA: TStringField;
    TableDatiAziendaRTNATOPROV: TStringField;
    TableDatiAziendaRTNATOIL: TDateTimeField;
    TableDatiAziendaRTRESIDENTECITTA: TStringField;
    TableDatiAziendaRTRESIDENTEINDIRIZZO: TStringField;
    TableDatiAziendaRTRESIDENTENUMCIVICO: TStringField;
    TableDatiAziendaRTRESIDENTEPROV: TStringField;
    TableTestiNUMCIVICOCLI: TStringField;
    TableContattiNUMCIVICOCLI: TStringField;
    TableConformitaNUMCIVICOCLI: TStringField;
    EdPropQta: TcxEditRepositoryCurrencyItem;
    TableDatiAziendaCELLULARE: TStringField;
    TableConformitaCODFORNGAS: TStringField;
    TableProgressiviTIPOCALCOLOLISTINIARTICOLI: TStringField;
    PivotGridStyleRepository: TcxStyleRepository;
    GosOrePivotGridStyleSheet: TcxPivotGridStyleSheet;
    TableProgressiviPROGARTDESTINATION: TStringField;
    TableProgressiviULTPRZACQ_BOLLEENTR: TStringField;
    TableProgressiviULTPRZACQ_FATTACQUI: TStringField;
    TableProgressiviSCONTOSOGGNELRIGO: TStringField;
    TableProgressiviTESTOEMAIL: TMemoField;
    TableProgressiviGENERAZAUTOMATICAPRIMANOTA: TStringField;
    QryLabSoggNUMCIVICO: TStringField;
    TableConformitaRESPTECNICO: TStringField;
    TableConformitaCOMMITALLEGOBBLIG: TStringField;
    TableProgressiviRICARICOLISTINO1: TIBOFloatField;
    TableProgressiviRICARICOLISTINO2: TIBOFloatField;
    TableProgressiviRICARICOLISTINO3: TIBOFloatField;
    TableProgressiviRICARICOLISTINO4: TIBOFloatField;
    TableProgressiviALTRIDOCINELENCOSEPARATO: TStringField;
    TableProgressiviSCONTOBASEACQ: TIBOFloatField;
    QryGruppoArcoSetImportazioneTerminata: TIB_Cursor;
    QryGruppoArcoGruppi: TIB_Cursor;
    QryGruppoArcoGroupPresent: TIB_Cursor;
    QryGruppoArcoInsertGruppo: TIB_Cursor;
    QryGruppoArcoUpdateGruppo: TIB_Cursor;
    TableDatiAziendaCA_PID: TStringField;
    TableDatiAziendaCA_CODICEATTIVAZIONE: TStringField;
    QryGruppoArcoGeneraBarcode: TIB_Cursor;
    QryGruppoArcoListaArticoli: TIB_Cursor;
    TableProgressiviARCO_CARICAGRUPPI: TStringField;
    TableProgressiviARCO_BARCODE: TStringField;
    QryGruppoArcoCopiaGruppiDaJolly: TIB_Cursor;
    QryArticoloExist: TIB_Cursor;
    TableConformitaNOTERELTIPMAT: TMemoField;
    TableConformitaPROGETTOREDATTODA: TStringField;
    TableDatiAziendaRTQUALIFICA: TStringField;
    TableDatiAziendaRTESTREMIISCRIZIONEALBO: TStringField;
    TableProgressiviMAG_ORDINATONELDISPONIBILE: TStringField;
    TableProgressiviSTESSANUMERAZFATTNOTECRED: TStringField;
    TableProgressiviBCL_CONSIDERA_SC1: TStringField;
    TableProgressiviBCL_CONSIDERA_SC2: TStringField;
    TableProgressiviBCL_CONSIDERA_SC3: TStringField;
    TableProgressiviRICARICHIPERFASCEPREZZO: TStringField;
    TableProgressiviDBVER: TIntegerField;
    TableProgressiviMSGCOMMESSA: TStringField;
    TableProgressiviMSGCARICOCANTIERE: TStringField;
    TableProgressiviMSGSCARICOCANTIERE: TStringField;
    TableProgressiviMSGCONTO: TStringField;
    TableProgressiviCOPIECOMMESSA: TSmallintField;
    TableProgressiviCOPIECARICOCANTIERE: TSmallintField;
    TableProgressiviCOPIESCARICOCANTIERE: TSmallintField;
    TableProgressiviCOPIEESTRATTOCONTO: TSmallintField;
    tvInfoUtiliBackground: TcxStyle;
    tvInfoUtiliContent: TcxStyle;
    tvInfoUtiliHeader: TcxStyle;
    tvInfoUtili: TcxGridTableViewStyleSheet;
    tvInfoUtiliContentEven: TcxStyle;
    ExcelSaveDialog: TSaveDialog;
    TableProgressiviASCIISTARTDOCBARCODE: TIntegerField;
    AgContentImpianto: TcxStyle;
    AgContentNoImpianto: TcxStyle;
    AgContentGenerico: TcxStyle;
    QryVendBancoSelCantieri: TIB_Cursor;
    TableProgressiviPSWD_FIDO: TStringField;
    TableProgressiviPROGARTPRECODICE: TStringField;
    TableProgressiviRICERCAARTICOLOSURIGODOC: TStringField;
    TableProgressiviSTAMPABARCODEDOCUMENTI: TStringField;
    TableProgressiviRICART_CODICEPRINC: TStringField;
    TableProgressiviRICART_CODICEFORN: TStringField;
    TableProgressiviRICART_BARCODE: TStringField;
    TableProgressiviRICART_CODAGG: TStringField;
    TableProgressiviRICART_LISTFORN: TStringField;
    TableProgressiviRICDOC_PRATICA1: TStringField;
    TableProgressiviRICDOC_PRATICA2: TStringField;
    TableProgressiviRICDOC_PRATICA3: TStringField;
    TableProgressiviTIPO1: TStringField;
    TableProgressiviTIPO2: TStringField;
    TableProgressiviTIPO3: TStringField;
    TableProgressiviTIPO4: TStringField;
    TableProgressiviTIPO5: TStringField;
    TableProgressiviTIPO6: TStringField;
    TableProgressiviDEFAULTLABELPRINTERNAME: TStringField;
    TableProgressiviDEFAULTLABELFILENAME: TStringField;
    TableProgressiviDEFAULTLABELOPERATOREFILENAME: TStringField;
    QryLabArtJOLLY1: TStringField;
    QryLabArtJOLLY2: TStringField;
    QryLabArtJOLLY3: TStringField;
    QryLabArtJOLLY4: TStringField;
    QryLabArtJOLLY5: TStringField;
    QryLabArtJOLLY6: TStringField;
    QryLabArtJOLLY7: TStringField;
    QryLabArtJOLLY8: TStringField;
    QryLabArtJOLLY9: TStringField;
    QryLabArtJOLLY10: TStringField;
    QryLabSoggJOLLY1: TStringField;
    QryLabSoggJOLLY2: TStringField;
    QryLabSoggJOLLY3: TStringField;
    QryLabSoggJOLLY4: TStringField;
    QryLabSoggJOLLY5: TStringField;
    QryLabSoggJOLLY6: TStringField;
    QryLabSoggJOLLY7: TStringField;
    QryLabSoggJOLLY8: TStringField;
    QryLabSoggJOLLY9: TStringField;
    QryLabSoggJOLLY10: TStringField;
    TableProgressiviCODICEOPERA_2: TStringField;
    TableProgressiviDESCRIZIONEOPERA_2: TStringField;
    TableProgressiviPRZUNITOPERA1_2: TIBOFloatField;
    TableProgressiviCODICEOPERA_3: TStringField;
    TableProgressiviDESCRIZIONEOPERA_3: TStringField;
    TableProgressiviPRZUNITOPERA1_3: TIBOFloatField;
    TableProgressiviCODICEOPERA_4: TStringField;
    TableProgressiviDESCRIZIONEOPERA_4: TStringField;
    TableProgressiviPRZUNITOPERA1_4: TIBOFloatField;
    TableProgressiviCODICEOPERA_5: TStringField;
    TableProgressiviDESCRIZIONEOPERA_5: TStringField;
    TableProgressiviPRZUNITOPERA1_5: TIBOFloatField;
    tvGCDetailContent_Costo: TcxStyle;
    tvGCDetailHeader_Costo: TcxStyle;
    tvGCDetailContent_Qta: TcxStyle;
    tvGCDetailHeader_Qta: TcxStyle;
    tvGCDetailContent_Ricarico: TcxStyle;
    tvGCDetailHeader_Ricarico: TcxStyle;
    tvGCDetailContent_Vendita: TcxStyle;
    tvGCDetailHeader_Vendita: TcxStyle;
    tvGCDetailContent_DatiDoc: TcxStyle;
    tvGCDetailHeader_DatiDoc: TcxStyle;
    tvGCDetailContent_Costo_Bold: TcxStyle;
    tvGCDetailContent_Ricarico_Bold: TcxStyle;
    tvGCDetailContent_Vendita_Bold: TcxStyle;
    tvGroupSummary: TcxStyle;
    BandedGridsStyleRepository: TcxStyleRepository;
    btvGCMaster: TcxGridBandedTableViewStyleSheet;
    btvGCMasterStampa: TcxGridBandedTableViewStyleSheet;
    tvGridFooter: TcxStyle;
    TableProgressiviSECONDIATTESAEMAIL: TIntegerField;
    IB_Transaction1: TIB_Transaction;
    TransDocSel: TIB_Transaction;
    TransProgressivi: TIB_Transaction;
    TransVendBancoSelCantieri: TIB_Transaction;
    TablePratiche: TIBOTable;
    TablePraticheCodice: TIntegerField;
    TablePraticheDataApertura: TDateField;
    TablePraticheCliente: TIntegerField;
    TablePraticheDataChiusura: TDateField;
    TablePraticheDescrizione: TStringField;
    TablePraticheNote: TStringField;
    TablePraticheArgomento: TStringField;
    TablePraticheProvenienza: TStringField;
    TablePraticheStatoDescrizione: TStringField;
    TablePraticheStatoForeground: TStringField;
    TablePraticheStatoBackground: TStringField;
    TablePraticheAltriSoggetti: TStringField;
    TablePraticheSINCHRO: TStringField;
    SourcePratiche: TDataSource;
    TransPratiche: TIB_Transaction;
    TableProgressiviQRYARTTUTTIMAG: TStringField;
    TxtSaveDialog: TSaveDialog;
    TableConformitaTERMOTIPMAT_UNI: TStringField;
    TableConformitaTERMOTIPMAT_UNIDESC: TStringField;
    TableConformitaTERMOTIPMAT_ALTRO: TStringField;
    TableConformitaTERMOTIPMAT_ALTRODESC: TStringField;
    TableConformitaIDROTIPMAT_UNI: TStringField;
    TableConformitaIDROTIPMAT_UNIDESC: TStringField;
    TableConformitaIDROTIPMAT_ALTRO: TStringField;
    TableConformitaIDROTIPMAT_ALTRODESC: TStringField;
    TableConformitaTERMOTIPAPP_CE: TStringField;
    TableConformitaIDROTIPAPP_CE: TStringField;
    TableConformitaALLEGATOATTMATNONORM: TStringField;
    TableConformitaTERMOBACKGIMAGE: TBlobField;
    TableConformitaIDROBACKGIMAGE: TBlobField;
    QryLabArtCODICEFORNITORE: TStringField;
    QryLabArtDESCRIZIONEFORNITORE: TStringField;
    tvArtDetail: TcxGridTableViewStyleSheet;
    tvArtDetail_Selection: TcxStyle;
    tvArtDetail_Background: TcxStyle;
    tvArtDetail_Content: TcxStyle;
    tvArtDetail_Footer: TcxStyle;
    tvArtDetail_Group: TcxStyle;
    tvArtDetail_GroupByBox: TcxStyle;
    tvArtDetail_Header: TcxStyle;
    cvEnCardBorder: TcxStyle;
    cvEnCardCaptionRow: TcxStyle;
    cvEnCardCategoryRow: TcxStyle;
    cvEnCardCategorySeparator: TcxStyle;
    cvEnCardRowCapdion: TcxStyle;
    cvEnCardSelection: TcxStyle;
    TableProgressiviDOCGESTARTFORNSECONDARI: TStringField;
    TableProgressiviDOCCOLONNAIMPEXP: TStringField;
    cvEnCardProtocollo: TcxStyle;
    TableProgressiviFILTRADOCPERALTRISOGGETTI: TStringField;
    TimerPollingAllegatiAlarm: TTimer;
    SP_AllegatiAlarm: TIB_StoredProc;
    Trans_AllegatiAlarm: TIB_Transaction;
    SP_CreaNuovoAllegatoFG: TIBOStoredProc;
    tvContentGrayArial8: TcxStyle;
    TableProgressiviFL_LOGO_INTESTAZIONE: TStringField;
    TableProgressiviFL_DATI_PRESCRIZIONI: TStringField;
    TableProgressiviFL_DATI_CHIAMATA: TStringField;
    TableProgressiviFL_DATI_APPUNTAMENTO: TStringField;
    TableProgressiviFL_DATI_SOGGETTO: TStringField;
    TableProgressiviFL_DATI_SOGGETTO_NOTE: TStringField;
    TableProgressiviFL_DATI_IMPIANTO: TStringField;
    TableProgressiviFL_DATI_ABBONAMENTO: TStringField;
    TableProgressiviFL_DATI_IMMOBILE: TStringField;
    TableProgressiviFL_DATI_RESPIMP: TStringField;
    TableProgressiviFL_DATI_PROP_UT_AMM: TStringField;
    TableProgressiviFL_DATI_PROPRIETARIO: TStringField;
    TableProgressiviFL_DATI_UTENTE: TStringField;
    TableProgressiviFL_DATI_INSTALLATORE: TStringField;
    TableProgressiviFL_DATI_IMPIANTO_NOTE: TStringField;
    TableProgressiviFL_DATI_APPARECCHI: TStringField;
    TableProgressiviFL_DATI_APPARECCHI_SEPARATI: TStringField;
    TableProgressiviFL_DATI_OP: TStringField;
    TableProgressiviFL_DATI_PRECEDENTI: TStringField;
    TableProgressiviFL_DATI_NUMULTINTERV: TIntegerField;
    TableProgressiviFL_DATI_RAPPINT: TStringField;
    TableProgressiviFL_DATI_MERCE: TStringField;
    TableProgressiviFL_DATI_ALTRESPESE: TStringField;
    TableProgressiviFL_DATI_FIRME: TStringField;
    TableProgressiviFL_LOGO_PIEDE: TStringField;
    TableProgressiviFL_TITOLO: TStringField;
    TableProgressiviFL_COPIE: TIntegerField;
    TableProgressiviFL_DATI_OP_SOLODAFARE: TStringField;
    TableProgressiviDEFAULTALLEGATIFGPRINTERNAME: TStringField;
    btvArtDetail: TcxGridBandedTableViewStyleSheet;
    tvArtDetail_ContentHighlight: TcxStyle;
    TableDatiAziendaCODICEFISCALE: TStringField;
    TableProgressivi2: TIBOTable;
    SourceProgressivi2: TDataSource;
    TableProgressivi2INDEXFIELD: TIntegerField;
    TableProgressivi2SMTP_SERVER_FROM_EMAIL: TStringField;
    TableProgressivi2SMTP_SERVER_ADDRESS: TStringField;
    TableProgressivi2SMTP_SERVER_PORT: TStringField;
    TableProgressivi2SMTP_SERVER_SECURE: TStringField;
    TableProgressivi2SMTP_SERVER_USERNAME: TStringField;
    TableProgressivi2SMTP_SERVER_PASSWORD: TStringField;
    TableProgressivi2SMS_SERVER_FROM: TStringField;
    TableProgressivi2SMS_SERVER_USERNAME: TStringField;
    TableProgressivi2SMS_SERVER_PASSWORD: TStringField;
    TableProgressivi2SMS_SERVER_SOGLIA_AVVISO: TIntegerField;
    TableProgressivi2FAST_SELECTION_MODE: TStringField;
    TableAliquoteIVAEXPORT_CODICE: TStringField;
    TableProgressivi2MANODOPERANEIPRECEDENTIIMPIANTO: TStringField;
    TableProgressivi2VISUALIZZAMSGPERSCAD: TStringField;
    TimerTransactionStatus: TTimer;
    TableProgressivi2GOOGLE_USERNAME: TStringField;
    TableProgressivi2GOOGLE_PASSWORD: TStringField;
    TableProgressivi2GOOGLE_TASKS_ENABLED: TStringField;
    TableProgressivi2GOOGLE_TASKS_REFRESHTOKEN: TStringField;
    TableProgressivi2GOOGLE_CALENDAR_ENABLED: TStringField;
    TableProgressivi2GOOGLE_CALENDAR_REFRESHTOKEN: TStringField;
    TableProgressivi2NUMDOCUNIVOCO_ENABLED: TStringField;
    EdPropFilterDateEdit: TcxEditRepositoryDateItem;
    TableConformitaCOMPLETAMENTEREALIZZATODITTA: TStringField;
    TableConformitaPRESENTITUTTEDICHCONFALTREDITTE: TStringField;
    TableConformitaNORMAVERIFICATENUTA: TStringField;
    TableConformitaRAPPTECNICOCOMPATIBILITA11CIG: TStringField;
    TableConformitaDICHPROGETTISTAPREVENZINCENDI: TStringField;
    TableDatiAziendaTITOLARENOME: TStringField;
    TableDatiAziendaTITOLARECOGNOME: TStringField;
    TableDatiAziendaNAZIONESIGLA: TStringField;
    TableDatiAziendaTIPOPERSONA: TStringField;
    TableDatiAziendaCOD_EORI: TStringField;
    TableDatiAziendaREGIMEFISCALESIGLA: TStringField;
    TableDatiAziendaREA_UFFICIO: TStringField;
    TableDatiAziendaREA_NUMERO: TStringField;
    TableDatiAziendaREA_CAPITALESOCIALE: TIBOFloatField;
    TableDatiAziendaREA_SOCIOUNICOSIGLA: TStringField;
    TableDatiAziendaREA_STATOLIQUIDAZIONESIGLA: TStringField;
    IBOTable1: TIBOTable;
    EdPropPARegimeFiscale: TcxEditRepositoryLookupComboBoxItem;
    EdPropPASocioUnico: TcxEditRepositoryLookupComboBoxItem;
    EdPropPAStatoLiquidazione: TcxEditRepositoryLookupComboBoxItem;
    TableAliquoteIVAPA_NATURA: TStringField;
    EdPropPANaturaIVA: TcxEditRepositoryLookupComboBoxItem;
    EdPropPACondizioniPagamento: TcxEditRepositoryLookupComboBoxItem;
    EdPropPAModalitaPagamento: TcxEditRepositoryLookupComboBoxItem;
    EdPropPARitAccCausalePag: TcxEditRepositoryLookupComboBoxItem;
    TableProgressivi2BOLLOVIRTUALEDEFAULT: TStringField;
    TableProgressivi2BOLLOCODICEIVA: TIntegerField;
    TableProgressivi2BOLLOVIRTUALEDICITURA: TStringField;
    TableProgressivi2BOLLODESCRIZIONEIVA: TStringField;
    EdPropCodiceIVA: TcxEditRepositoryLookupComboBoxItem;
    TableProgressivi2BOLLOALIQUOTAIVA: TFloatField;
    EdPropPAEsigibilitaIVA: TcxEditRepositoryLookupComboBoxItem;
    EdPropPATipoDocumento: TcxEditRepositoryLookupComboBoxItem;
    TableDatiAziendaDATITRASMIT_ENABLED: TStringField;
    TableDatiAziendaDATITRASMIT_IDPAESE: TStringField;
    TableDatiAziendaDATITRASMIT_IDCODICE: TStringField;
    TableDatiAziendaDATITRASMIT_TELEFONO: TStringField;
    TableDatiAziendaTERZOINT_ENABLED: TStringField;
    TableDatiAziendaTERZOINT_IDPAESE: TStringField;
    TableDatiAziendaTERZOINT_IDCODICE: TStringField;
    TableDatiAziendaTERZOINT_CODICEFISCALE: TStringField;
    TableDatiAziendaTERZOINT_TIPOPERSONA: TStringField;
    TableDatiAziendaTERZOINT_DENOMINAZIONE: TStringField;
    TableDatiAziendaTERZOINT_NOME: TStringField;
    TableDatiAziendaTERZOINT_COGNOME: TStringField;
    TableDatiAziendaTERZOINT_TITOLO: TStringField;
    TableDatiAziendaTERZOINT_CODEORI: TStringField;
    TableDatiAziendaDATITRASMIT_EMAIL: TStringField;
    TableProgressiviSCONTOLISTINO1: TIBOFloatField;
    TableProgressiviSCONTOLISTINO2: TIBOFloatField;
    TableProgressiviSCONTOLISTINO3: TIBOFloatField;
    TableProgressiviSCONTOLISTINO4: TIBOFloatField;
    TableDatiAziendaRTSETDEFAULTPROGETTOREDATTODA: TStringField;
    TableProgressivi2BOLLOAUTOMATICO: TStringField;
    TableProgressivi2BOLLOAUTOMATICOIMPORTO: TIBOFloatField;
    TableProgressivi2BOLLOAUTOMATICOSOGLIA: TIBOFloatField;
    TableAliquoteIVABOLLOAUTOMATICO: TStringField;
    TableProgressiviDEFAULTALLEGATIFGCOPIE: TSmallintField;
    TableProgressiviCOSTOUNITOPERA1: TIBOFloatField;
    TableProgressiviCOSTOUNITOPERA1_2: TIBOFloatField;
    TableProgressiviCOSTOUNITOPERA1_3: TIBOFloatField;
    TableProgressiviCOSTOUNITOPERA1_4: TIBOFloatField;
    TableProgressiviCOSTOUNITOPERA1_5: TIBOFloatField;
    tvGridBandHeader: TcxStyle;
    tvStampaGCGridBandHeader: TcxStyle;
    TableDatiAziendaEXPORT_CODICEDITTA: TStringField;
    TableDatiAziendaEXPORT_CONTOCLIENTI: TStringField;
    TableDatiAziendaEXPORT_CONTOCASSA: TStringField;
    TableDatiAziendaEXPORT_CONTORICAVOCOSTO: TStringField;
    TableDatiAziendaEXPORT_CONTORICAVOCOSTORITACC: TStringField;
    TableDatiAziendaEXPORT_CONTOSPESE: TStringField;
    TableDatiAziendaEXPORT_CONTOBOLLO: TStringField;
    TableDatiAziendaEXPORT_CONTOABBUONIATTIVI: TStringField;
    TableDatiAziendaEXPORT_CONTOABBUONIPASSIVI: TStringField;
    TableDatiAziendaEXPORT_CODICECAUSALEPRIMANOTA: TStringField;
    TableDatiAziendaEXPORT_DESCCAUSALEPRIMANOTA: TStringField;
    TableDatiAziendaEXPORT_NONESPORTACI1SEZERO: TStringField;
    TableDatiAziendaEXPORT_ULTIMAEXP: TDateTimeField;
    TableDatiAziendaEXPORT_ULTIMAEXP_DAL: TDateTimeField;
    TableDatiAziendaEXPORT_ULTIMAEXP_AL: TDateTimeField;
    TableDatiAziendaEXPORT_ULTIMAEXP_FATTURE: TStringField;
    TableDatiAziendaEXPORT_ULTIMAEXP_PRIMANOTA: TStringField;
    TableDatiAziendaEXPORT_EXPORTEDFILEPATH: TStringField;
    cxLocalizer: TcxLocalizer;
    TableDatiAziendaEXPORT_CONTOCLIENTIESTERO: TStringField;
    TableDatiAziendaEXPORT_SOTTOCONTORICAVOCOSTO: TStringField;
    TableDatiAziendaEXPORT_SOTTOCONTORICCOSTORITACC: TStringField;
    EdPropDocRowType: TcxEditRepositoryComboBoxItem;
    EdPropCheckBox: TcxEditRepositoryCheckBoxItem;
    EdPropImporto: TcxEditRepositoryCurrencyItem;
    EdPropMarginePerc: TcxEditRepositoryCurrencyItem;
    EdPropImportoMicroPrz: TcxEditRepositoryCurrencyItem;
    tvGCDetailContent_Qta_Bold: TcxStyle;
    TableDatiAziendaTITOLARECOGNOMENOME: TStringField;
    TableProgressiviFL_MESSAGGIO: TMemoField;
    TableProgressiviFL_LABEL_APPUNTAMENTO: TStringField;
    TableProgressiviFL_LABEL_CHIAMATA: TStringField;
    TableProgressiviFL_LABEL_CLIENTE: TStringField;
    TableProgressiviFL_LABEL_LUOGO: TStringField;
    TableProgressiviFL_LABEL_MOTIVO: TStringField;
    TableProgressiviFL_LABEL_NOTE: TStringField;
    TableProgressiviFL_DATI_INTESTAZFATTURA: TStringField;
    TableProgressiviFL_DATI_RAPPINT_STATO: TStringField;
    TableProgressiviFL_DATI_RAPPINT_NUMRIGHEDATAORA: TIntegerField;
    TableProgressiviFL_DATI_RAPPINT_ALTEZZARELAZINT: TIntegerField;
    TableProgressiviFL_MESSAGGIO_ALTEZZA: TIntegerField;
    EdPropResponseTypeFE: TcxEditRepositoryImageComboBoxItem;
    ImagesFE: TcxImageList;
    ImageFETiming: TcxImageList;
    EdPropTimingIndexFE: TcxEditRepositoryImageComboBoxItem;
    TableDatiAziendaFE_ENABLED: TStringField;
    TableDatiAziendaFE_PROVIDERID: TStringField;
    TableDatiAziendaFE_USERNAME: TStringField;
    TableDatiAziendaFE_PASSWORD: TStringField;
    TableDatiAziendaFE_COMPANYID: TStringField;
    TableDatiAziendaFE_ENABLESENDSALESINV: TStringField;
    TableDatiAziendaFE_ENABLERECEIVESALESNOT: TStringField;
    TableDatiAziendaFE_ENABLERECEIVEPURCHASEINV: TStringField;
    TableDatiAziendaFE_BASEURLWS: TStringField;
    TableDatiAziendaFE_BASEURLAUTH: TStringField;
    TableProgressivi2FE_SCADENZE: TStringField;
    TableDatiAziendaFE_PURCHASEINVDAYSBEFORE: TIntegerField;
    TableProgressivi2SMTP_SERVER_FROM_NAME: TStringField;
    TableProgressivi2BOLLOADDEBITAINFATTURA: TStringField;
    TableProgressiviFL_LABEL_RICHIEDENTE: TStringField;
    TableProgressiviFL_DATI_RICHIEDENTE: TStringField;
    TableAliquoteIVAENABLED: TStringField;
    TableDatiAziendaFE_CODICEDESTINATARIO: TStringField;
    ZLB1: TZLBArchive;
    TableProgressivi2PRM_PROXVISITA_INBASEA: TStringField;
    TableProgressivi2PRM_PROXVISITA_ADDPERIODSU: TStringField;
    TableProgressivi2PRM_AUTODOC_OPFATTE: TStringField;
    TableProgressivi2PRM_AUTODOC_RIFCONTRATTO: TStringField;
    TableProgressivi2PRM_AUTODOC_DICITURA: TStringField;
    TableProgressivi2PRM_AUTODOC_DICITURATXT: TStringField;
    TableProgressivi2PRM_AUTOCLOSE_ENABLED: TStringField;
    TableProgressivi2PRM_AUTOCLOSE_SOLOMANUT: TStringField;
    TableProgressivi2PRM_AUTOCLOSE_FATTURA: TStringField;
    TableProgressivi2PRM_AUTOCLOSE_SCAD: TStringField;
    procedure CaricaNuovoListinoPrePost(Sender: TObject; var ATable: TIBOTable; var OkToPost: Boolean); // Personale
    procedure AttivaTabelle(ApriSoloPercorsiAziende, NuovaAzienda: Boolean); // Personale
    procedure InizializzaArchiviVari;
    function GetLeftPosition: Integer; // Personale
    function GetTopPosition: Integer; // Personale
    function CalcolaTotaleCampoStr(Source: TIBODataset; Campo: String): String; // Personale
    // procedure CreaScadenzeDocumento;     // Personale
    function FineMese(GG, MM: Integer): Integer; // Personale
    function CalcolaDataScadenza(Data: TDateTime; Giorni: Integer; FM: String; DatiSogg: TIB_Cursor): TDateTime;
    function ControlloMeseSospensione(Data: TDateTime; DatiSogg: TIB_Cursor): TDateTime;
    function ControllaFineMese(GG, MM, AA: Word): Word;
    function EliminaCaratteriNonValidi(InStr: String): String;
    // procedure CaricaScaricaMagazzino;   // Personale
    function SettaStampante(QRToSet: TQuickRep; Copie: Integer): Boolean; // Personale
    procedure EsportaDocFiscSelezionati; // Personale
    procedure EsportaDocFisc(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate); // Personale
    // procedure EsportaRigoDocFisc(ListaDoc:TBookmarkList);     // Personale
    procedure DM1Create(Sender: TObject); // Personale
    procedure AddSQL(Qry: TIBOQuery; AndOr, Linea: String); // Personale
    function ControllaDataStr(Data: String): Boolean; // Personale
    // procedure CaricaRighiDocumento(DocTipo, Registro:String; DocNum:Longint; DocData:TDate);     // Personale
    // procedure SalvaRighiDocumento(TipoDocumento, Registro:String; NumDoc:Longint; DocData:TDate; Soggetto:Longint; AccorpaRighi:Boolean);     // Personale
    procedure EliminaDocFisc(Qry: TIBOQuery; TipoDoc, Registro: String; NumeroDoc: Longint; DataDoc: TDate; CancellaDagliImpegni: Boolean = False); // Personale
    procedure EliminaTesto(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
    procedure EliminaTracciato(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
    procedure EliminaContatto(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
    procedure EliminaExtFile(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
    procedure EliminaConformitaOld(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
    procedure EliminaLDE(const Qry: TIBOQuery; const AID: Integer); // Personale
    function NextCodiceArticolo: String; // Personale
    // procedure AggiornaPrezziDOcumento;     // Personale
    function SlashFinale(DirToCtrl: String): String; // Personale
    procedure FocusRefresh;
    // ======================== INIZIO PROTEZIONI HARDWARE =================================================
    function CheckDemo: Boolean;
    procedure ReadSmartKey; // Personale
    function ControlloDate(KeyPort: Integer; labelsm: String; passwordsm: String): Boolean;
    function ModCtrl(CodMod: Integer): Integer;
    procedure InitCopyProtection(ReturnDemoPermission: Boolean);
    procedure TimerSmartKeyTimer(Sender: TObject);
    function ControllaDocumento(DocType: String): Integer;
    // ======================== FINE PROTEZIONI HARDWARE =================================================
    procedure Attendere; // Personale
    procedure ChiudiAttendere; // Personale
    function NumScadenzeDocumento(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate): Integer;
    function StrToColor(StrColor: String; DefaultColor: TColor): TColor;
    procedure SelezionaStato(TipoDocumento: String; Tabella: TIBODataset; Chiamante: Integer);
    procedure SelezionaCliente(FieldCliente, FieldCodPrat, FieldDataPrat: TField; RagSoc: String);
    procedure SelezionaArticolo(CodArt, Descrizione: String; AddMode: TAddArtMode; const AQta: Double; const ACodicePratica: Integer = 0;
      const ADataPratica: TDateTime = 0);
    function ExpArtToCodice(Descrizione: String): String;
    function ExpArtToCodiceStm(Descrizione: String): String;
    function ExpArtToQta(Descrizione: String): Double;
    function ExpDocToDocType(Descrizione: String): String;
    function ExpDocToDocNum(Descrizione: String): Longint;
    function ExpDocToDocDate(Descrizione: String): TDate;
    function ExpDocToDocReg(Descrizione: String): String;
    function ExpDocToID(Descrizione: String): Integer;
    // procedure ImportaDocFisc(TipoDoc, Registro:String; NumDoc:Longint; DataDoc:TDate; AbilitaRiferimento:Integer);
    procedure EliminaExpLDE(const AID: Integer);
    procedure EliminaExpDoc(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate);
    procedure EliminaExpArt(CodArt, CodArtStm: String);
    procedure EliminaExpConformita(NumDoc: Integer; DataDoc: TDate);
    procedure AzzeraBacheca;
    procedure EsportaRicevutaFiscale(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate); // Personale
    procedure CopiaFile(Sorgente, Destinazione: String);
    procedure EliminaFile(NomeFile: String);
    procedure InizializzaArchiviLevGen;
    procedure ControllaEsistenzaCartellaAzienda(PercorsoAzienda: String);
    procedure ApriTabella(Tabella: TIBOTable; Ristruttura: Boolean);
    function RifToNumDoc(Riferimento: String; Lungh: Integer): String;
    function RifToDataDoc(Riferimento: String): String;
    function PadR(StrIn, PadChar: String; Lungh: Integer): String;
    function PadL(StrIn, PadChar: String; Lungh: Integer): String;
    function StrLeft(StrIn: String; Lungh: Integer): String;
    function StrRight(StrIn: String; Lungh: Integer): String;
    procedure ColoreModulo(Report: TQuickRep; Colore1, Colore2: TColor; SpessoreLinee, ForzaAltezzaShape, ForzaDiminuzioneLarghezzaShape: Shortint);
    function CopieDocFisc(TipoDoc: String): Longint;
    procedure VisualizzaCliente(CodiceCliente: Longint; FromMainMenu: Boolean = False);
    procedure VisualizzaPratica(Codice: Longint; Data: TDate; FromDocument: Boolean; FromMainMenu: Boolean = False);
    procedure VisualizzaAssistenza(Codice: Longint; Data: TDate; FromDocument: Boolean; FromMainMenu: Boolean = False);
    procedure VisualizzaCantiereImpianto(Caller_IdPratica, Caller_CodicePratica: TIntegerField; Caller_DataPratica: TDateTimeField; FromDocument: Boolean);
    function BarCodeEsistente(CodToSearch: String): Boolean;
    function Arrotonda(Numero: Double; Decimali: Byte): Double;
    procedure AggiungiSoggettoAllaPratica(CodicePratica: Longint; DataAperturaPratica: TDate; CodiceSoggetto: Longint);
    function AddJollyChar(StrInput: String): String;
    function UIDCheck(NomeUtente, Passw: String; const AVerificaPassword: Boolean): Boolean;
    procedure AzzeraCartellaTemp;
    procedure BackupCheck;
    function VirgolaPunto(Numero: Extended; Decimali: Smallint = -1): String;
    procedure ClearSKeyData;
    procedure AccorpaRighiDocFisc;
    procedure ReturnToTab(Key: Char);
    function RitornaTestoPrimaDi(C: String; var S: String; Cut: Boolean): String;
    procedure TableConformitaPrimAccCodiceSoggChange(Sender: TField);
    procedure TableConformitaCLIENTEChange(Sender: TField);
    procedure TableContattiClienteChange(Sender: TField);
    procedure TableTestiCLIENTEChange(Sender: TField);
    procedure WinExec(FileName: String; Parameters: String = '');
    function WinExecAndWait32(FileName: String; Visibility: Integer): Cardinal;
    function LockDatabaseAccess: Boolean;
    procedure UnLockDatabaseAccess;
    function LockedDatabase: Boolean;
    function EliminaTagHtml(StrIn: String): String;
    procedure NuovoDocFisc(NextTipoDocumento, Registro: String; Cliente, Pratica: Longint; DataPratica: String; Mode, Copies: Integer;
      SoloRighiDelCliente, SoloRighiDellaPratica: Boolean; DataNuovoDocumento: TDate = 0); // Personale
    procedure ShowWait(Sezione, Messaggio: String);
    procedure CloseWait;
    procedure CodGruppoToDescrizione(Codice1, Codice2, Codice3, Codice4, Codice5, Codice6: String; EditComponent: TEdit);
    procedure CodArticoloToDescrizione(Codice: String; EditComponent: TEdit);
    procedure SettaPosizioneInizialePerControlloInizioDragAndDrop(XX, YY: Integer);
    procedure ControllaSpostamentoMousePerInizioDragAndDrop(XX, YY: Integer; Oggetto: TObject);
    procedure TrovaCondVend(CodiceArticolo: String; Qta: Real; CodiceSoggetto: Longint; var Sc1, Sc2, Sc3, Importo: Real; TipoCondVend: String);
    procedure InizializzaCausaliDocumenti;
    procedure CopiaFileConSostituzioneCarattere(InFile, OutFile: String; OldChar, NewChar: Char);
    procedure EliminaCampoCitta;
    procedure DocFatturato(DocTipo, DocReg: String; DocNum: Longint; DocData: TDate);
    procedure TableConformitaDATAValidate(Sender: TField);
    procedure SetPanelState(Stato: Shortint; Pannello: TPanel; Etichetta: TLabel; LivelloAttivo: Integer);
    function ControllaSeBisognaAggiungereIlCodiceChiave(CodiceAssegnato: Longint): Longint;
    function ControlloSeModificabileDallaStazione(Codice: Longint): Boolean;
    function ControllaSeProprioMagazzino(CodiceMag: Longint): Boolean;
    function ControllaSeProprioRegistro(Reg: String): Boolean;
    procedure ControllaCampoProgRigo;
    procedure AddSQLToIB_Cursor(Qry: TIB_Cursor; AndOr, Linea: String); // Personale
    procedure AddSQLToIB_Query(Qry: TIB_Query; AndOr, Linea: String); // Personale
    procedure EliminaBanca(Abi, Cab: String); // Personale
    procedure CaricaDescrizionePagamento(Codice: Longint; EditComp: TEdit);
    procedure CaricaDescrizionePratica(CodPrat: Longint; DataPrat: TDate; EditComp: TEdit);
    function GetDescrizionePratica(ID: Integer): String;
    procedure CaricaDatiBanca(Abi, Cab: String; EditBanca, EditABI, EditCAB: TEdit; EditBIC: TEdit = nil);
    function ArcBaseTrovaUltimaVersione: String;
    procedure ControllaNuovoArcBase(Silent: Boolean);
    procedure EliminaBancheSeStrutturaConCodice;
    function GetColumnByName(Qry: TIB_Query; ColName: String): Integer;
    procedure ColoraTuttiCampi(F: TWinControl; C: TColor);
    procedure ControlEnter(Sender: TObject);
    procedure ControlExit(Sender: TObject);
    function ConfermaModifiche: TModalResult;
    procedure ControllaSecurity;
    function RecordSelezionati(Qry: TIB_Query; var BS: TStrings): TStrings;
    procedure CaricaRagSocCli(Codice: Longint; EditComp: TEdit);
    procedure CaricaTipoExtFile(Codice: Longint; EditComp: TEdit; RegistroField: TStringField);
    procedure SalvaGriglieDevExpress(G: TcxGrid; NomeVista: String; NomeFormNelNomeFile: Boolean);
    procedure RipristinaDevExpress(G: TcxGrid; NomeVista: String; NomeFormNelNomeFile: Boolean; ForzaNomeFile: String = ''; ForzaNomeTableView: String = '');
    procedure SalvaDevExPropertiesStore(PS: TcxPropertiesStore; NomeVista: String; NomeFormNelNomeFile: Boolean);
    procedure RipristinaDevExpPropertiesStore(PS: TcxPropertiesStore; NomeVista: String; NomeFormNelNomeFile: Boolean);
    procedure QGridCustomDrawColumnHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure QGridCustomDrawPartBackground(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure QGridCustomDrawGroupCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean;
      DescrizioneAggiuntiva: String);
    function GeneraOrderBy(tv: TcxGridDBTableView): String;
    function DateVarToSQL(V: Variant): String;
    function StrVarToSQL(V: Variant): String;
    function IntVarToSQL(V: Variant): String;
    function FloatVarToSQL(V: Variant; Decimali: Smallint = -1): String;
    function FloatVarToSQL_DefaultIfNull(V: Variant; Def: String): String;
    function NoNullIntValue(DC: TcxCustomDataController; RowIndex, ColIndex: Integer): Longint;
    function NoNullFloatValue(DC: TcxCustomDataController; RowIndex, ColIndex: Integer): Double;
    function NoNullStringValue(DC: TcxCustomDataController; RowIndex, ColIndex: Integer): String;
    function NoNullBoolValue(DC: TcxCustomDataController; RowIndex, ColIndex: Integer; Default: Boolean = False): Boolean;
    function IsDelphiRunning: Boolean;
    function Messaggi(Titolo, Messaggio, Note: String; Btn: TMsgDlgButtons; KeyPressChar: Word; KeyPressProcedure: TKeyPressProcedure): TModalResult;
    procedure DBAziendaError(Sender: TObject; const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    function NextCodice(Tabella, Campo: String; MaxRange: Integer = 0): Longint;
    function NextCodicePratica(Tipo: String): Integer;
    function GetCodiceIvaCli(CodCli: Longint): Integer;
    function GetCodiceIvaArticolo(CodArt: String): Integer;
    function DocExist(TipoDoc: String; NumDoc: Integer; Registro: String; DataDoc: TDate): Boolean;
    function DiBaPrezzoAcquisto(CodArt: String): Currency;
    function DistintaBaseExist(CodArt: String): Boolean;
    procedure CaricaParametriProgressivi;
    procedure ResetPrintTotals;
    procedure AddTotalSeparation(SepWidth, ANom, ADenom: Integer);
    procedure AddPrintTotal(ACanvas: TCanvas; ARect: TRect; Caption, Value: String; Evidenza: Boolean; AWidth, ANom, ADenom: Integer; Position: Byte);
    procedure dxPrinterDefaultDrawPageFooter(AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      PrintLine: Boolean = True);
    procedure dxPrinterDefaultDrawPageHeader(AReportLink: TBasedxReportLink; ACanvas: TCanvas; var ARect: TRect; ANom, ADenom: Integer;
      PrintLine: Boolean = True);
    procedure PrepareGridForReport(G: TcxGrid; MultiLineText: Boolean);
    procedure RestoreGridAfterReport(G: TcxGrid; MultiLineText: Boolean);
    function FilesCount(Cartella, TipoFile: String): Integer;
    procedure CopySQLWhereCondition(Source, Dest: TStrings);
    function DateToItalianLongDate(D: TDate): String;
    procedure CopyRowDevExpress(SDC: TcxCustomDataController; SRI: Integer; DDC: TcxCustomDataController; DRI: Integer; QtaMasterRow: Double;
      QtaDetailRowIndex: Integer);
    procedure CopyAllRowsDevExpress(SDC, DDC: TcxCustomDataController; DRI: Integer; QtaMasterRow: Double; QtaDetailRowIndex: Integer);
    procedure EdPropQtaOperaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    function CheckIfExpandable(MDC: TcxCustomDataController; RI: Integer; ForAllDetailLevel: Boolean = False): Boolean;
    procedure SostituisciArticolo(Modalita: Byte);
    function DisplayTextsBlankIfZero(DC: TcxCustomDataController; RI, CI: Integer): String;
    procedure SelezionaTipoExtFile(FieldCodiceExtPrg: TField);
    function DefaultAbilitaMovMag: Boolean;
    procedure RiattivazioneDemo(KeyPressed: Word);
    function CalcolaImportoScontato(Importo: Double; S1, S2, S3: Real; Decimali: Byte): Double;
    function CalcolaSconto(ImportoDaScontare, ImportoScontato: Double; Decimali: Byte): Double;
    procedure AggiungiRicercaCampo(SQL: TStrings; Campo, Testo: String; MettiAND: Boolean);
    function RicercaParametroQuotato(var Testo: String): String;
    function RicercaParametro(var Testo: String): String;
    function WhereExists(SQL: TStrings): Integer;
    procedure ApriDocFisc(TipoDoc: String; NumDoc: Longint; Registro: String; DataDoc: TDateTime; Modifica: Boolean = False; AForceRecalc: Boolean = False);
    procedure EliminaDocFisc2(TipoDoc, Registro: String; NumeroDoc: Longint; DataDoc: TDate); // Personale
    function ConfermaCheckIn: TModalResult;
    procedure EsportaSoloRifDocFisc(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate); // Personale
    Procedure SetBit(SetWord, BitNum: Word);
    Procedure ClearBit(SetWord, BitNum: Word);
    Procedure ToggleBit(SetWord, BitNum: Word);
    Function GetBitStat(SetWord, BitNum: Word): Boolean;
    function ExternalDocsPresent: Boolean;
    procedure DefaultizzaPuntoRirdinoScortaMinima;
    procedure DefaultizzaCodiceArticoloFornitore;
    function IsReadOnlyDoc(SI: String): Boolean;
    function IsDocumentoDiIngresso(T: String): Boolean;
    function IsFatturaEletronica(T: String): Boolean;
    procedure UnisciDescrizioneArticoloEstesa;
    procedure EsportaImpegniSelezionati; // Personale
    function ExpImpegnoToID(Descrizione: String): Integer;
    procedure EliminaExpImpegno(IDImpegno: Integer);
    procedure ControllaListinoArcobalenoPerQuegliZeriMancantiNelCodice;
    function DescArtToDescGruppo(CodArt: String): String;
    procedure SetStatoPrimanota(NumPrm: Integer; DataPrm: TDate; NuovoStato: String);
    procedure SetStatoScadenza(TipoScad: String; NumScad: Integer; DataScad: TDate; NuovoStato: String);
    procedure SetStatoDocumento(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate; ID: Integer; IsLde: Boolean; NuovoStato: String);
    procedure SetStatoDocumentoDopoFatturazione(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc: TDate);
    procedure SetStatoDocumentoDopoEstrattoConto(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc: TDate);
    procedure SetStatoNuovoDocumento(DS: TDataSet; NuovoStato: String);
    procedure Set_RifDoc_CorrispettivoNonPagato_Chiuso(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc: TDate; Silent: Boolean;
      RifDoc_CorrispNoPag: String = 'NP');
    procedure SetRegistroDocumento(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate; NuovoRegistro: String);
    procedure SetRegistroRappGiorn(RegDoc: String; NumDoc: Integer; DataDoc: TDate; NuovoRegistro: String);
    procedure SetConsegnatoDocumento(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc: TDate);
    function ScadenzeInSofferenza(CodiceCliente: Longint): Boolean;
    procedure NuovoArticolo(CodArt, DescArt, UMArt: String; PrezzoListino, S1Art, S2Art, S3Art: Double);
    function StrVarToSQL_DefaultIfNull(V: Variant; Def: String): String;
    procedure TableConformitaBeforePost(DataSet: TDataSet);
    procedure TableStatiDocumentiBeforePost(DataSet: TDataSet);
    procedure TableConformitaS2QBAPPCOLLKWTOTChange(Sender: TField);
    procedure TableConformitaCOMMITCODICEChange(Sender: TField);
    procedure TableConformitaPROPCODICEChange(Sender: TField);
    procedure TableConformitaIMMOBCODICEChange(Sender: TField);
    function NextProtocolloDocFisc(const DataDoc: TDate; const DataRifFieldName: String): Longint;
    function NextNumDocFisc(TipoDoc, Registro: String; DataDoc: TDate; ProgressivoInfinito: Boolean): Longint;
    function NextNumDocFisc_GestVerDoc(TipoDoc: String; DataDoc: TDate): Longint;
    function NextNumRegistroData(Tabella, Campo, CampoData, Registro: String; DataDoc: TDate): Integer;
    function NextNumData(Tabella, Campo, CampoData: String; DataDoc: TDate): Integer;
    function NextCodiceNegativo(Tabella, Campo: String): Integer;
    procedure InviaEmail(CodiceCliente: Integer; Oggetto: String; Allegato: String);
    procedure BullzipCreaSettings(NomeFilePdf: String = 'documento.pdf');
    procedure TableConformitaCOMMITALLEGOBBLIGChange(Sender: TField);
    function GetCodiceSoggettoPratica(CodPrat: Integer; DataPrat: TDate): Integer;
    procedure ListaVisteGriglia(NomeGrid: String; Lista: TStrings);
    procedure SalvaAgendaDevExpress(G: TcxScheduler; NomeVista: String);
    procedure RipristinaAgendaDevExpress(G: TcxScheduler; NomeVista: String);
    procedure GruppoArco_RicalcolaDopoCaricamentoAnagrafica;
    function VerificaCodiceAttivazioneTeletrasporto: Boolean;
    procedure GruppoArco_ControllaGruppiSottogruppi;
    procedure GruppoArco_CalcolaBarcode;
    procedure GruppoArco_CopiaCodiciGruppi;
    procedure CopiaCodiciAttivazionePerGuardian;
    procedure EseguiQueryCalcolaListini(SoloArticoliAppenaImportati: Boolean = False);
    procedure CaricaFasceRicarichi;
    function GetRicaricoPerPrezzo(Prezzo: Double; Listino: Smallint; CaricaDatabase: Boolean = True): Double;
    procedure IvaArcobalenoToIvaLevante(DI: String; var CodIva: Integer; var DescIva: String; var AliqIva: Double);
    procedure QGridCustomDrawBandHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridBandHeaderViewInfo; var ADone: Boolean);
    function GetBandIndexByCaption(BTV: TcxGridDBBandedTableView; Cpt: String): Integer;
    function IsNewListPrice(CodiceDistributore, CodiceFiliale, TipoFile: String; Versione: TDateTime): Boolean;
    procedure MarkListPrizeVersion(CodiceDistributore, CodiceFiliale, TipoFile: String; Versione: TDateTime; FullPathFileName: String);
    function MinutiToStr(M: Double): String;
    function GetRicaricoArticolo(CodArt: String; Listino: Integer): Double;
    function NextCodiceImpegno(const AIDProgressivo, AIDProgressivoAnno: Boolean; const ADataDoc: TDate): Integer;
    function IsInPratica(DS: TIBODataset; FieldName: String): Boolean;
    function IsInSoggetto(DS: TIBODataset; FieldName: String): Boolean;
    function DocTypeCodeToDocType(C: String): String;
    function DocTypeToDocTypeCode(C: String): String;
    procedure DocBarCodeToDocData(BC: String; var DocTipo: String; var DocNum: Integer; var DocReg: String; var DocData: TDateTime);
    function NextBarcodeDocumento(DocTipo: String; DocNum: Integer; DocReg: String; DocData: TDateTime): String;
    procedure ApriImpegno(ID: Integer; Modal: Boolean = False);
    function MaxNumDocOfTypeInBacheca(TipoDoc: String): Integer;
    function VerificaPassword(Password: String): Boolean;
    function GetNomeAgenteByCodice(Cod: Integer): String;
    function GruppoArco_CalcolaCarattereControlloEAN13(Codice: String): String;
    procedure ListinoNettoGruppoArco_EliminaGruppiArco;
    procedure ListinoNettoGruppoArco_EliminaArticoli;
    procedure ListinoNettoGruppoArco_ConvertiCodiciGruppi;
    procedure ListinoNettoGruppoArco_ConvertiCodiciGruppiArticoli;
    procedure SetDefaultPrinter(PrinterName: String);
    function GetDefaultPrinterName: string;
    function CodiceToIndexManodopera(Codice: String): Integer;
    function CodiceIsManodopera(Codice: Variant): Boolean;
    function IsIntervento(ID: Integer): Boolean;
    function GUIDAsString: string;
    procedure EliminaViste;
    procedure CreaViste;
    function ExpDocToDocDateStr(Descrizione: String): String;
    function ExpDocToDocRagioneSocialeStr(Descrizione: String): String;
    procedure TableProgressiviSECONDIATTESAEMAILGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure SalvaFileIniNelRepository(NomeFile: String);
    procedure TablePraticheBeforePost(DataSet: TDataSet);
    function GoAutoquery(AutoqueryIndex: Integer): Boolean;
    procedure ApriDocFiscLocalizzaRigo(TipoDoc: String; NumDoc: Longint; Registro: String; DataDoc: TDateTime; GUIDToSearch: String; Modifica: Boolean = False);
    function ClienteEsistente(CodToSearch: Longint; IvaToSearch, CodFiscToSearch: String): Boolean;
    function ArticoloEsistente(CodToSearch: String): Boolean;
    function InternetIsConnected: Boolean;
    function AggiungiRicercaCampoClientDataSet(Campo, Testo: String): String;
    procedure SetReportDateRange(DataDal, DataAl: String);
    procedure SetNotExportedDoc(TipoDoc, RegDoc: String; NumDoc: Integer; DataDoc: TDate);
    procedure SetNotExportedPrimanota(Codice: Integer; Data: TDate);
    procedure TableAliquoteIVABeforePost(DataSet: TDataSet);
    procedure SalvaDatePredefinitePerFiltri(DataDal, DataAl: String);
    procedure CaricaDatePredefinitePerFiltri(P: TMemIniFile);
    procedure EliminaImpegno(QryImp: TIBODataset; TipoImpegno, Registro: String; NumeroDoc: Integer);
    function ResOrd_GetFromDatabase: TDateTime;
    procedure ResOrd_PutOnDatabase(FullPathResOrdFileName: String; ResOrdDateTime: TDateTime);
    function ResOrd_CheckIfOld: Boolean;
    procedure ResOrd_DownloadFromTeletrasporto(Hidden: Boolean = False);
    function ResOrd_CheckIfNewestAlreadyDownloaded(CurrResOrdDate: TDateTime): Boolean;
    function GetTempFileName(Ext: String; Directory: String = ''): String;
    function GetExeByExtension(sExt: string): string;
    function RunAndWaitShell(sFile, sArgs: string; Handle: Cardinal; iVisibility: Integer): DWord;
    procedure SetAgenti(DS: TDataSet; SoggFieldName, PratFieldName, DataPratFieldName: String);
    procedure TimerPollingAllegatiAlarmTimer(Sender: TObject);
    procedure Allegati_EseguiPollingAlarm;
    function Generators_NextGenID(GenName: String; const ALevGenDB: Boolean = False): Integer;
    function CreaAllegatoFG(Tipo: String; IDImpegno, IDPratApp, IDBruc, Copie: Integer; CaricaDatiPrec: Boolean): Integer;
    procedure StampaAllegatoFG(ID: Integer; Preview: Boolean);
    procedure CaricaItemsAgenti(Items: TStrings; AgentiIndex: Integer; MasterValue: String);
    procedure AgenteChanged(AgentiIndex: Integer; dbeAgenteControl: TcxCustomTextEdit);
    procedure DBAziendaAfterConnect(Sender: TIB_Connection);
    procedure RepositoryUpdate_CheckForUpdate;
    function Csv_Num_LeftAlign(V: Double; Moltiplicatore: Integer; LunghezzaFissa: Integer = 0): String;
    function Csv_Num_RightAlign(V: Double; Moltiplicatore: Integer; LunghezzaFissa: Integer = 0): String;
    function Csv_Alpha_LeftAlign(V: String; LunghezzaFissa: Integer = 0): String;
    function Csv_Alpha_RightAlign(V: String; LunghezzaFissa: Integer = 0): String;
    procedure CheckForAlreadyInTransaction;
    procedure CheckForAlreadyInTransaction_LogError;
    function AliquotaIva_GetCodiceExport(CodiceIva: Integer): String;
    procedure TimerTransactionStatusTimer(Sender: TObject);
    procedure DBAziendaBeforeDisconnect(Sender: TIB_Connection);
    function Impegno_ID_To_MasterID(ID: Integer): Integer;
    procedure TableProgressivi2AfterOpen(DataSet: TDataSet);
    procedure TableProgressivi2AfterPost(DataSet: TDataSet);
    procedure ApplicationEvents1ShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure EdPropREASocioUnicoPropertiesEditValueChanged(Sender: TObject);
    procedure DBGeneraleError(Sender: TObject; const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
      SQLMessage, SQL: TStringList; var RaiseException: Boolean);
    procedure DBGeneraleAfterConnect(Sender: TIB_Connection);
    procedure TableDatiAziendaCalcFields(DataSet: TDataSet);
    procedure EdPropPACondizioniPagamentoPropertiesInitPopup(Sender: TObject);
    procedure EdPropPAModalitaPagamentoPropertiesInitPopup(Sender: TObject);
    procedure EdPropPANaturaIVAPropertiesInitPopup(Sender: TObject);
    procedure EdPropPARegimeFiscalePropertiesInitPopup(Sender: TObject);
    procedure EdPropPARitAccCausalePagPropertiesInitPopup(Sender: TObject);
    procedure EdPropPASocioUnicoPropertiesInitPopup(Sender: TObject);
    procedure EdPropPAStatoLiquidazionePropertiesInitPopup(Sender: TObject);
    procedure EdPropPATipoDocumentoPropertiesInitPopup(Sender: TObject);
    procedure EdPropPAEsigibilitaIVAPropertiesInitPopup(Sender: TObject);
    procedure TableAliquoteIVABeforeDelete(DataSet: TDataSet);

  private
    { Private declarations }
    FModoRistrutturazioneArchivi: boolean;
    // Thread per i messaggi Hint fatti da me e altri usi
    ThreadLevante: LevThread;
    fRepository_Param: TRepositoryFile;
    fRepository_Layouts: TRepositoryFile;
    fRepository_Menu: TRepositoryFile;
    fRepository_Loghi: TRepositoryFile;
    // Flag che fa in modo che l'eventuale messaggio che la chiave è scaduta o sta
    // scadendo venga visualizzato solo una volta (all'avvio).
    AvvertimentoScadenzaChiaveGiaVisualizzato: Boolean;
    fRepository_Param_AllUsers: TRepositoryFile;
    fRepository_Param_User: TRepositoryFile;

    FSilentWait: Boolean;

    procedure ControlloCodiciArticoloNulliDoc;
    procedure EsportaConformita(NumDoc: Integer; Registro: String; DataDoc: TDate);
    procedure EsportaLDE(TipoDoc: String; ID, NumDoc: Integer; Registro: String; DataDoc: TDate);
    function IsThisPcLevanteServer: Boolean;
    function GruppoArco_GroupPresent(Cod1, Cod2: Integer): Boolean;
    procedure GruppoArco_CaricaGruppo(Cod1, Cod2: Integer; Desc: String);
    function GetRicarichiPerFasceDiPrezzo: Boolean;
    function GetBCL_ConsideraSconto1: Boolean;
    function GetBCL_ConsideraSconto2: Boolean;
    function GetBCL_ConsideraSconto3: Boolean;
    function GetFirebirdRootDir: String;
    function GetFirebirdBinDir: String;
    function GetFirebirdDir: String;
    procedure PopolamentoMagQtaPerNuovoGC;
    procedure SettaVersioneDatabase;
    function GetDbVer: Integer;
    function AggiungiNoteSottorighiManodopera(MasterDesc: String; TipoDoc: String; NumDoc: Integer; RegDoc: String; DateDoc: TDate; NumRigo: Integer): String;
    function GeneraCodiceImpegno: Integer;
    function GeneraCodiceImpegnoProgressivo(const AAnno: Boolean; const ADataDoc: TDate): Integer;
    function CodiceImpegnoExist(CodToSearch: Integer): Boolean;
    procedure ConvertiAppuntamenti;
    function GeneraBarcodeDocumento(DocTipo: String; DocNum: Integer; DocReg: String; DocData: TDateTime): String;
    function DocBarcodeExist(CodToSearch: String): Boolean;
    procedure ControllaFilesConfigurazione;
    procedure EliminaTriggers;
    procedure CreaTriggers;
    function VistaExists(NomeVista: String): Boolean;
    function StoredProcedureExists(NomeSP: String): Boolean;
    function TriggerExists(NomeTrigger: String): Boolean;
    function UDFExists(Nome: String): Boolean;
    procedure GeneraGuidMancantiNeiRighi;
    procedure ScaricaFilesIniDalRepository;
    procedure SetDataInizialeFitriDefault_Old;
    procedure EsportaRelazioneIntervento(PrecQryIn: TIB_Cursor; ExtraRif: String);
    procedure CheckForCodiceOpera0;
    function GetCategCantCaption(P: TMemIniFile; Sez: String): String;
    procedure VisualizzaAvvertimentoScadenzaChiave(GiorniAllaScadenza: Integer);
    procedure ConversioneGiacenzeMagazzinoParte1;
    procedure ConversioneGiacenzeMagazzinoParte2;
    procedure Allegati_Alarm_EnableTimerPolling(En: Boolean);
    procedure Generators_VerificaPresenzaCreazioneGeneratore(GenName: String; const ALevGenDB: Boolean = False);
    procedure Generators_VerificaCreazione;
    procedure DefaultizzazioneMasterID;
    procedure DefaultizzazioneIdPratiche;
    procedure DefaultizzazioneIdScadenze;
    procedure DefaultizzazioneIdSecurity;
    procedure RegistraUdfEsterne;
    procedure EliminaUdfEsterne;
    function GetFastSelectionMode: Boolean;
    function RepositoryUpdate_CheckForNewUpdateFile: Boolean;
    procedure Google_CaricaParametri;
    procedure SvuotaEtichette;
    procedure VisualizzaBaseSetup;
    procedure CambiaNomeCampoStart;
    procedure InitializeEditRepositoryProperties;
    procedure BuildCurrencyDisplayFormat;
    procedure BuildMarginePercDisplayFormat;
    procedure SetModoRistrutturazioneArchivi(const Value: boolean);
  public
    { Public declarations }
    // Array che contiene i dati inseriti nella chiave hardware.
    // -------------------------------------------------------------------
    SKeyData: array [0 .. MAX_LENGTH_DATA] of AnsiChar;
    // -------------------------------------------------------------------

    // NB: Ho dovuto mettere un meccanismo che abilitasse o meno il validate della QTA della manodopera perchè
    // quando nel documento c'erano tante righi che non ci stavano tutti contemporaneamente a video
    // e io modificavo un rigo manodopera che era nelle ultime righe (oltre la capacità della schermata)
    // l'evento OnValidate veniva richiamato due volte (boh!) e questo causava una doppia conversione
    // del valore che scazzava tutto. Siccome l'evento veniva richiamato 2 volte a causa di alcune elaborazioni
    // del dato stesso all'interno dell'evento "OnEditValueChanged" della TableView ho inserito questo flag
    // per disabilitare l'esecuzione del validate all'inizio della gestione "OnEditValueChanged" della TableView
    // per poi ripristinare tutto all'uscita dello stesso gestore di evento.
    GoValidateQtaOreMinuti: Boolean;

    // VAriabili che contengono la posizione del cursore al MouseDown del pulsante dx per effettuare
    // il drag & drop in modo da monitorare poi gli spostamenti del mouse con il pulsante dx premuto
    // spostamente che se sono > di 10 pixels attivano d il BeginDrag (fatto così per fare in modo che
    // funzioni anche il MouseUp per l'apertura del Popup menù associato all'oggetto.
    DDX, DDY: Longint;
    PrecOnCellClick: TOnCellClick;

    // Variabile che contiene il codice utente/stazione prelevato dalla chiave
    CodiceUtente: String[4];

    // Variabile che contiene l'indirizzo di rete del server oppure 'LOCAL' se il server è locale
    ServerAddress: String;

    // Variabili che contengono il Login e la password al server interbase
    IBUser, IBPswd: String;

    // Questo flag specifica se la stazione attuale è il server oppure no
    IsServer: Boolean;

    // Variabili che contengono i percorsi dove si trovano rispettivamente gli archivi
    // condivisi sul server e quelli privati della stazione.
    CurrDir, ArcDir, AziendaCorrente, SystemDir, CartellaTmp, VolSerNum, GenDBFile, ArcDBFile, ArcBaseDir, TemaDir, HintsDir, ImpGridsDir,
      ImportFiltersDir, ExportFiltersDir, PuzzleDir, ReportDir, LoghiDir, BullzipDir, BullzipDir2, CommonAppDataDir, CommonAppDataLevanteDir, UserAppDataDir,
      UserAppDataLevanteDir, DesktopDir: String;

    // Questo flag usato per la scansione con TWAIN indice se vi è una scansione in corso e serve
    // per iniziare un ciclo per fare in modo che l'applicazione si fermi fino a scansione avvenuta
    // (modale), altrimenti non sapevo come fare.
    // Praticamente all'avvio del programma viene posto a False; all'avvio della scansione (function: TwainAcquire)
    // il flag viene posto a True per poi essere riportato a False in due punti della Unit 'Scanners': nella funzione
    // 'ProcessSourceMessage' quando la scansione viene annullata dall'utente e nella funzione 'TWNativeTransfer' quando
    // la scansione è terminata correttamente.
    TwainSessionInProgress: Boolean;

    // Queste variabili contengono alcuni parametri che regolano il comportamento della form dei documento
    // durante l'inserimento o la modifica dei documenti stessi.
    KioskTipoDocDefault: String; // Questa variabile contiene il documento di default per la modalità KIOSK (Vendita al banco)
    // TotaliRealTime:Boolean;           // Se 'True' il totale documento diventa RealTime

    // Questa variabile contiene il registro di default dei documenti multiregistro
    RegistroDefault: String;

    // Questa variabile contiene il magazzino di default movimentato  dalla stazione
    MagazzinoDefault: String;

    // Queste bitmap contengono le bitmap dei pulsanti delle form
    B1, B2, B3, B4, B5, B6, B7, B8, B9, B10, B11: TBitmap;

    // Queste variabili contengono il nome utente e la password e i permessi
    UID, PSWD, Permessi: String;

    // Questa variabile globale contiene il numero di caratteri (cifre)  da utilizzare per l'assegnazione
    // automatica del codice articolo agli articoli che non  ne hanno uno.
    NumCharCodArt: Smallint;

    // Questa variabile determina se i calcoli di un documento devono essere consederando che il documento
    // è impostato IVA compresa o esclusa
    ScorporoIVA: Boolean;

    // Questa variabile globale determina quanti decimali devono errese visualizzati nei microprezzi del listino articoli
    // e del corpo documenti in modo che si possano fare dei documenti in cui gli articoli del corpo sono ad esempio con 4 decimali
    // mentre il piede rimane opportunamente con 2 decimali.
    DecMicroPrz: Shortint;
    DecCalcoliIntermedi: Shortint;

    // Variabile che contiene la stringa da assegnare alla proprietà "DisplayFormat" dei campi
    DisplayFormatMicroPrz: String;

    // Variabile che contiene il nome dell'operatore corrente, viene impostata dalla funzione che controlla la validità del login dell'operatore
    // e serve sopratturro per poi impostare il campo 'Operatore' dei documenti con l'operatore corrente.
    IDOperatoreCorrente: String;

    // Variabile che contiene la data di validità del periodo di prova da utilizzare nella versione DEMO per fare in modo che
    // non possano essere emessi documenti con data successiva o antecedente alla scadenza del periodo di prova.
    DemoFlags: TDemoFlags;

    // Variabili che contengono i percorsi di Upload e Download degli archivi per la sincronizzazione
    UploadDir, DownloadDir: String;

    // Variabili che contengono alcuni parametri relativi alla SINCRONIZZAZIONE
    AbilitaSincronizzazione, BloccaModificaRecordsAltreStazioni, AggiungiCodiceChiaveAiCodici: Boolean;

    // Variabili che contengono i parametri che determinano il comportamento del programma in alcune situazioni e cioè:
    // TabDopoSelezioneSoggetto = Tab al quale deve automaticamente andare dopo aver selezionato il soggetto corrente.
    // TabDopoSelezionePratica = Come sopra ma dopo la selezione della pratica corrente
    // AutoQuery = Array di Numeri di Boolean che contiene, per ogni Tab l'attivazione o meno dell'esecuzione automatica della query
    // quando l'utente si sposta su tabel pagina e la query non è già attiva.
    TabAvvio, TabDopoSelezioneSoggetto, TabDopoSelezionePratica, TabDopoSelezioneImpianto: Byte;
    AutoQueryGlobaleDisabilitaSeSoggettoNonSelezionato, AutoQueryGlobaleDisabilitaSeSoggettoSelezionato: Boolean;
    AutoQuery: array [0 .. 13] of Boolean;

    // Variabile che contiene la data di inizio di default dei filtri
    FilterDataDalDefault, FilterDataAlDefault: String;

    // Dichiara la struttura che conterrà i dati della Manodopera
    Manodopera: array [0 .. 4] of TManodopera;

    // Dichiara l'array che conterrà in memoria le fasce di ricarico da applicare agli articoli
    Ricarichi: array of TFasciaRicarichi;

    // Questa variabile globale serve a tenere traccia di cove sono arrivato a tracciare i totali di una stampa.
    // Praticamente se ho una stampa che è larga 500 Pixels e decido di metterci sopra un totale largo 100 pixel
    // questa variabile avrà valore 500-100=400 in modo che il totale successivo sarà posizionato correttamente al suo fianco.
    TotalRight: Integer;

    // Questo array dinamico serve nelle stampe delle Quantumgrid per memorizzare gli indici delle colonne della griglia attuale
    // che devono essere rese invisibili prima della stampa e poi essere ripristinate alla fine della stampa stessa
    GridColumnToMakeInvisibleWhenPrinting: array of array of Integer;
    GridPrintingPrecCellAutoHeight: Boolean;
    GridPrintingPrecDataRowHeight: Integer;

    // Variabili contenenti alcuni parametri per la stampa delle etichette
    LunghezzaMaxDescrizioneArticoloEtichette: Integer;
    // Abilita o meno l'uso dei campi DESCRIZIONE2,3,4,5. Se attivo questo flag praticamente
    // si torna a quando non c'erano le descrizioni lunghe e quindi si usavano le descrizioni
    // aggiuntive come righi separati all'interno dei documenti.
    // NB: Se questo flag è attivo, nella form anagrafica articolo viene visualizzato
    // il pannello della descrizione ridotto, senza foto e con le 5 descrizioni per l'appunto.
    AbilitaDescrizioni2345: Boolean;
    // Lunghezza max della descrizione articolo
    // NB: Questo è solo un limite facoltativo che l'utente decide per limitare la descrizione che
    // normalmente è molto lunga (1000) come lunghezza max in caratteri
    LunghezzaMaxDescrizioneArticolo: Integer;

    // Variabile che contiene il flag che indica se alla selezione di un articolo da importare nel
    // documento, questo deve essere importato direttamente con il prezzo netto oppure
    // con il prezzo di listino e relativo sconto.
    PrezziNetti, PrezziAcquistoNetti: Boolean;

    // Contiene il valore per la proprietà DisplayFormat dei campi dele griglie DevExpress
    // per la corretta visualizzazione degli importi in Euro in base al numero di
    // decimale dopo la virgola impostati nel file layout.ini
    DisplayFormat: String;
    // Contiene il valore per la proprietà DisplayFormat dei campi dele griglie DevExpress
    // per la corretta visualizzazione dei margini in percentuale in base al numero di
    // decimale dopo la virgola impostati nel file layout.ini
    MarginDisplayFormat: String;

    // Contiene il flag che indica se per default il filtro "Visualizza solo gli articoli PREFERITI"
    // deve essere abilitato oppure no nella ricerca degli articoli
    DefaultVisualizzaSoloArticoliPreferiti: Boolean;

    // Parametro per gli aiuti in pillole HINTS
    HINT_DELAY: Integer;
    HINT_ENABLED: Boolean;

    // DAti reraliti ai parametri di stampa dell'ultima stampa
    CopieUltimaStampa, PagDaUltimaStampa, PagAUltimaStampa, IndexStampanteUltimaStampa: Integer;

    // Variabili che contengono alcune caption relative alle pratiche nelle varie form (Elenchi, Anagrafiche...)
    GridsColumnPraticaCaption, GridsColumnSottopratica1Caption, GridsColumnSottopratica2Caption, GridsColumnSottopratica3Caption, DocumentiPanelPraticaCaption,
      GridGCQtaCommessaCaption, GridGCQtaCaricoCaption, GridGCQtaScaricoCaption, GridGCQtaGiacenzaCaption, GridGCQtaMontataCaption, GridGCQTAResiduaCaption,
      DatiDocumento_LabelPratica, DatiDocumento_LabelAzionePratica, DatiDocumento_LabelJollyNum1: String;

    // Variabili che contengono alcune caption relative alle Categorie Cantieri
    CategCantCaption1, CategCantCaption2, CategCantCaption3, CategCantCaption4, CategCantCaption5, CategCantCaption6: String;

    // Caricamento variabili rlative a captions relative a campi relativi ai tecnici
    TecniciMenuCaption, GridsColumnTecnicoCaption: String;

    // Caricamento variabili rlative a captions relative a campi relativi agli agenti
    AgentiMenuCaption, Agenti2MenuCaption, Agenti3MenuCaption, Agenti4MenuCaption, GridsColumnAgenteCaption, GridsColumnAgente2Caption,
      GridsColumnAgente3Caption, GridsColumnAgente4Caption: String;
    Agente2LinkedToAgente1, Agente3LinkedToAgente2, Agente4LinkedToAgente3: Boolean;
    AgenteEditable, Agente2Editable, Agente3Editable, Agente4Editable: Boolean;

    // Caricamento variabili relative a captions degli impegni
    GridsImpegniColumnLuogoAppuntamentoCaption: String;

    // Variabili relative ad alcune captions e abilitazioni di voci di menà e filtri relativi
    // agli impegni
    MainMenuVisualizzaImpianti, MainMenuVisualizzaImpegni, VisualizzaNuovoAppuntamentoNormale, VisualizzaNuovoAppuntamentoAssistenza,
      VisualizzaFiltroTipoImpegno, VisualizzaFiltroTipoIntervento, VisualizzaFiltroImpiantoNoImpianto: Boolean;

    // Parametri per la creazione utomatica di un documento ed eliminazione e/o marcatore dell'impegno come fatto
    ImpegnoToDoc_TipoDoc: String;
    ImpegnoToDoc_EliminaImpegno: Boolean;
    ImpegnoToDoc_MarcaImpegnoComeFatto: Boolean;

    QueryQgendaSoloGiorniSelezionati: Boolean;
    AgendaNoImages: Boolean;
    AgendaAutoSelectSoggPrat: Boolean;
    AgendaGrayOnlyContentBackgroud: Boolean;
    AgendaStateDescription1, AgendaStateDescription2, AgendaStateDescription3, AgendaStateDescription4: String;

    // Variabile che contiene il parametro che indica di evidenziare, nell'elenco documenti,
    // quei documenti che hanno la data di consegna entro XXX giorni
    EvidenziaDocumentiConsegnaEntro: Shortint;

    // Flag che indica se, durante la creazione automatica delle scadenze dall'interno di un documento,
    // le note del documento devono essere copiate anche sul campo note di ogni scadenza generata.
    CopiaNoteDocumentoSulleScadenze: Boolean;

    // Flag che indica la modalità dei loghi separati per azienda
    SeparateLogoMode: Boolean;

    // Flag che indica se deve richiedere la Qtà quando si trascina un articolo
    // nella bacheca oppure quando si richiama un articolo per codice
    RichiediQta: Boolean;

    // Flag che abilita o meno  l'avvertimento del sottoscorta durante la compilazione
    // di un documento
    AvvertiSottoscorta: Boolean;

    // Flags per a gestione del fido e del partitario
    ConsideraDdtNelFido, DefaultVisualizzaDdt, DefaultVisualizzaRifFisc, DefaultVisualizzaInterventi, DefaultVisualizzaPrimanota,
      DefaultVisualizzaRighiDocComeNote, DefaultVisualizzaSoloPraticheAperte, DefaultNoBolliFatture, DefaultEscludiFattAcqui: Boolean;

    // Parametro che indica il tipo di calcolo dei listini di vendita
    TipoCalcoloListiniVenditaDefault: String;

    // Variabile che contiene la versione del database attualmente aperto
    DbVer: Integer;

    // Variabili che contengono i titoli delle 3 sezioni in cui è normalmente
    // suddiviso il GC (Materiali / Apparecchi, Manodopera, Altre spese)
    GC_TitoloSezioneMaterialiApparecchi, GC_TitoloSezioneOreDipendenti, GC_TitoloSezioneAltreSpese: String;
    // Flag che indica se, quando si è nel GC da fuori cantiere, la vista del GC stesso
    // debba essere riassuntiva oppure normale come se si fosse invece dentro al cantiere.
    GC_CantiereNoSel_VisualizzazioneRiassuntiva: Boolean;
    // Impostazioni di default del GC per impostare i costi e i ricarichi
    GC_Default_TipoRicarico: Byte;
    GC_Default_RicaricoPerc: Real;
    GC_Default_Listino: Byte;
    GC_Default_TipoCosto: Byte;
    GC_Default_TipoRicaricoComeDaCommessa: String;

    // Variabili per gestire alcuni permessi legati solo all'utente e non alla chiave
    AbilitaMenuUtilita, AbilitaMenuImpostazioni: Boolean;
    LimitazioniArticoliPerUtente, LimitazioniRisorseAgendaPerUtente: String;

    // Nome della stampante dedicata alle etichette
    DefaultLabelPrinterName: String;

    // Ultima data utilizzata per l'inserimento dei righi del GC
    GC_UltimaDataInsert: TDate;

    // Stringa su cui viene costruita l'indicazione del range delle date
    // di cui viene effettuata la stampa
    fReportRangeDate: String;

    // Variabili contenti i titoli delle label dei campi SUBSOGG
    RefCaptionLabelSubSogg1, RefCaptionLabelSubSogg2, RefCaptionLabelSubSogg3, RefCaptionLabelSubSogg4: String;

    // Flag che se True fa in modo che sia possibili modificare il registro dei documento solo
    // alla creazione del documento stesso e non lo consente più successivamente.
    ModificaRegistroSoloNuovoDocumento: Boolean;

    // Flag che se True fa in modo che, al salvataggio dei righi di un documento,
    // il CodiceMagazzino (1 e 2) venga preso dal rigo stesso (quindi ad es.
    // posso fare un DDT che scarica gli articoli da più magazzini).
    // Se invece è a False (default) viene salvato il valore della testata.
    SalvaMagazzinoDocumentoDalRigo: Boolean;

    // Flag che forza il programma a non considerare i documenti quando
    // stampa l'inventario ultimo acquisto
    fInventarioUltimoAcquistoIgnoraDocumenti: Boolean;

    // Flag che abilita/disabilita la speciale esportazione in bacheca delle ricevute fiscali
    // quello cioè delle ricevute fiscali non pagate
    fEsportazioneRicFiscNoPag: Boolean;

    // Flag che disabilita il caricamento degli Agenti su un documento
    // NB: Lo uso perchè altrimenti quando trasformo un appuntamento in intervento e quindi crea
    // il documento collegato all'appuntamento stesso mi si azzeravano gli agenti.
    DisabilitaSetAgenti: Boolean;

    // Flag che indica se quando si esporta un intervento in bacheca debbano essere esportate anche la
    // relazione intervento oppure no (la Exis non le vuoli gli altri invece si).
    CopiaRelazioneInterventoInBacheca: Boolean;

    // Parametri relativi agli allegati
    AllDocumento_FiltroDoc, AllDocumento_FiltroPrat, AllDocumento_FiltroSogg, AllDocumento_FiltroArticolo, AllDocumento_FiltroNulla: Boolean;
    AllPratica_FiltroDoc, AllPratica_FiltroPrat, AllPratica_FiltroSogg, AllPratica_FiltroArticolo, AllPratica_FiltroNulla: Boolean;
    AllSoggetto_FiltroDoc, AllSoggetto_FiltroPrat, AllSoggetto_FiltroSogg, AllSoggetto_FiltroArticolo, AllSoggetto_FiltroNulla: Boolean;
    AllArticolo_FiltroDoc, AllArticolo_FiltroPrat, AllArticolo_FiltroSogg, AllArticolo_FiltroArticolo, AllArticolo_FiltroNulla: Boolean;
    AllNulla_FiltroDoc, AllNulla_FiltroPrat, AllNulla_FiltroSogg, AllNulla_FiltroArticolo, AllNulla_FiltroNulla: Boolean;
    AllCreazione_LegaAlDocumentoCorrente, AllCreazione_LegaAllaPraticaCorrente, AllCreazione_LegaAlSoggettoCorrente,
      AllCreazione_LegaAlArticoloCorrente: Boolean;

    // Flag che indica se, nei documenti, far apparire la formTedoldi per
    // impostare i viaggi per le aziende di trasporto come editor di descrizione articolo
    // del rigo.
    ViaggioEditorEnabled: Boolean;

    // Flag che indica se la form di aggiornamento presente nel repository è già
    // stata visualizzata oppure no
    // NB: La uso perchè altrimenti all'avvio me la dava due volte
    fUpdateRepDownloadForm_Showed: Boolean;

    // MOdalità di pagamento e banca da inserire come default alla creazione di un nuovo soggetto
    CodicePagamentoDefault: Integer;
    BancaAbiDefault, BancaCabDefault: String;

    // Flag che abilita o disabilita la creazione ed esecuzione del ThreadLev
    // Siccome c'erano alcuni errori strani e incomprensibili con questo flag
    // posso disabilitare il Thread e vereificare se il problema viene da li oppure no.
    ThreadLevEnabled: Boolean;

    // Flags per GOOGLE CALENDAR
    GoogleCalendar_Enabled, GoogleCalendar_CreazioneAutomaticaDaAppuntamentoInvisible: Boolean;
    GoogleCalendar_EliminaAdAppuntamentoFatto: Boolean;

    // Flags per GOOGLE TASKS
    GoogleTasks_Enabled, GoogleTasks_CreazioneAutomaticaDaChiamata, GoogleTasks_CreazioneAutomaticaDaChiamataInvisibile: Boolean;
    GoogleTasks_EliminaAdAppuntamentoFatto: Boolean;

    // Flag che abilita o meno l'apertura/chiusura automatica del pannello degli allegati
    // (Post-It) in base alla presena o meno di records.
    AllegatiApriChiudiAutomatico: Boolean;

    // Flags che indicano l'abilitazione dei campi Categorie1..8 (clienti dalla 1 alla 5
    // e articoli dalla 6 alla 8). Se = '0' significa che la voce non è abilitata, se invece
    // diversa da '0' signific che è abilitata e contiene il titolo da visualizzare
    CategCaption1, CategCaption2, CategCaption3, CategCaption4, CategCaption5, CategCaption6, CategCaption7, CategCaption8: String;

    // Flag che indica se, per il ricalcolo dei prezzi di listino e di acquisto degli articoli,
    // alla variazione del PrezzoDiListino deve essere ricalcolato il PrezzoDiAcquisto (e/o viceversa)
    // in base agli sconti di acquisto impostati oppure se invece tali importi devono rimanere fissi e
    // ad essere ricalcolati devono essere gli sconti
    Articoli_RicalcoloPrzAcquistoImportiFissi: Boolean;
    // Flag che indica se, nell'anagrafica articolo, gli sconti di acquisto e altri campi correlati
    // siano visibili oppure no
    Articoli_ScontiAcquistoVisible, Articoli_ListiniDiVenditaVisible: Boolean;
    // Flag che indica se sono attivi i listini fornitori secondari automatici e bloccati
    // al numero dei fornitori con listino (1 prezzo per ogni fornitore in ciascun articolo)
    Articoli_ListiniFornitoriAutomatici: Boolean;

    // Flag che indica se, nell'elenco documenti, il bottone di espansione delle note/messaggi è premuto o meno
    // come default
    ElencoDoc_DataRowExpanded: Boolean;

    // Percorso del file eseguibile per lanciare LDE (Levante DOcument Editor)
    LDE_PageModelsDir, LDE_ExeFilePath, LDE_EmbededParamsEditor_ExeFilePath: String;

    // Flag per abilitazione/disabilitazione della verifica del codice fiscale in base al tipo di persona
    VerificaCodFisc_PersonaFisica, VerificaCodFisc_PersonaGiuridica, VerificaCodFisc_PubblicaAmministrazione: Boolean;

    // Parametro che determina il numero dei decimali dopo la virgola
    // dei margini percentuali e variazioni percentuali nel giornale di cantiere
    DecimaliMarginiPercentuali: Smallint;

    procedure CreaFornitoreArticolo(CodiceArticolo: String; CodiceFornitore: Integer); // Richiamato solo da "ControlloFornitoriArticolo"
    procedure ControlloFornitoriArticolo(CodiceArticolo: String); // Richiamato da diverse parti
    procedure EliminaListiniFornitoriArticolo(CodiceArticolo: String); // CHiamato 1 volta in  TClientiForm.QryArticoliBeforeDelete

    // REPOSITORY
    property Repository_Param_AllUsers: TRepositoryFile read fRepository_Param_AllUsers;
    property Repository_Param_User: TRepositoryFile read fRepository_Param_User;
    property Repository_Layouts: TRepositoryFile read fRepository_Layouts;
    property Repository_Menu: TRepositoryFile read fRepository_Menu;
    property Repository_Loghi: TRepositoryFile read fRepository_Loghi;

    property RicarichiPerFasceDiPrezzo: Boolean read GetRicarichiPerFasceDiPrezzo;
    property BCL_ConsideraSconto1: Boolean read GetBCL_ConsideraSconto1;
    property BCL_ConsideraSconto2: Boolean read GetBCL_ConsideraSconto2;
    property BCL_ConsideraSconto3: Boolean read GetBCL_ConsideraSconto3;
    property FirebirdDir: String read GetFirebirdDir;
    property FirebirdBinDir: String read GetFirebirdBinDir;

    // Flag che abilita la modalità FastSelection
    property FastSelectionMode: Boolean read GetFastSelectionMode;

    procedure SelezionaCantiereImpianto(FieldPratica, FieldDataPratica, FieldIDPratica, FieldCliente: TField; ClienteDocumento: Integer;
      CallerCode: Integer = 0); overload;
    procedure SelezionaCantiereImpianto(EditPratica, EditDataPratica, EditDescrizionePratica: TEdit; ClienteDocumento: Integer;
      CallerCode: Integer = 0); overload;
    procedure SelezionaSocGas(FieldCodice: TField);
    function GetPdfPrinterIndex: Integer;
    procedure SetPdfPrinterAsDefault;
    procedure SaveDefaultPrinter;
    procedure RestoreDefaultPrinter;
    procedure SalvaGrigliePivotDevExpress(G: TcxDBPivotGrid; NomeVista: String);
    procedure RipristinaPivotDevExpress(G: TcxDBPivotGrid; NomeVista: String);
    procedure CollapseAllPivotGridFields(G: TcxDBPivotGrid);
    procedure ExpandAllPivotGridFields(G: TcxDBPivotGrid);
    procedure OpenPivotGridCustomizationForm(G: TcxDBPivotGrid);
    procedure EliminaRapportoGiornaliero(Qry: TIBOQuery; Registro: String; NumeroDoc: Integer; DataDoc: TDate);
    function CreaFiltroTipoDocPerUltimoPrezzoAcquisto: String;
    procedure ImportaFileListinoArticoli(FileDaImportare, FileFiltroImp: String; RicalcolaListini: Boolean; R1, R2, R3, R4: Integer;
      CampoDanonModificare: String = '');
    function ArticoloExist(CodArt: String): Boolean;
    function CalcolaDisponibile(Giacenza, Impegnato, Ordinato: Double): Double;
    procedure GetDatiMagazzinoArticolo(CodArt: String; CodMag: Integer; var Giacenza: Double; var Impegnato: Double; var Ordinato: Double;
      var Disponibile: Double; var PuntoRiordino: Double; var ScortaMinima: Double; var LottoRiordino: Double);
    function ChiediQtaArticolo(CodArt, Descriz, UnitMis, QtaAuto: Variant): Double;
    function ExecuteExternalAppWithPipeRedirectionOnStrings(const CommandLIne: string; OutputStringList: TStrings; TestExitCode: Boolean = True): Boolean;
    procedure MyProcessMessages;
    procedure ChiediOreManodopera(CodDip, DescrizDip: Variant; DC: TcxCustomDataController; RI, OreIdx, NoteIdx: Integer); overload;
    procedure ChiediOreManodopera(CodDip, DescrizDip: Variant; FieldOre, FieldNote: TField); overload;
    procedure ConversioniVarieRighiPrvSenzaIndici;
    procedure OpenQueryAgenda(const QryAgenda, QryTecnici: TIBOQuery; const Scheduler: TcxScheduler);

    procedure LDE_OpenDocument(const ATipoDocumento: String; const AIDDocumento: Integer);
    procedure LDE_NewDocument(const ATipoDocumento: String; AIDSoggetto, AIDPratica: Integer);
    procedure LDE_DuplicateDocument(const ATipoDocumento: String; const AIDDocumento: Integer; AIDSoggetto, AIDPratica: Integer);
    procedure LDE_EmbeddedParams;

    procedure SetCodiceUtenteBySecurityIdOrByParams;

    procedure GridEdit(tv: TcxGridDBTableView; SetEdit: Boolean); overload;
    procedure GridEdit(btv: TcxGridDBBandedTableView; SetEdit: Boolean); overload;

    function NewQuery: TIB_Cursor;
    function NewQueryLevGen: TIB_Cursor;

    property ModoRistrutturazioneArchivi: boolean read FModoRistrutturazioneArchivi write SetModoRistrutturazioneArchivi;
  end;

var
  DM1: TDM1;

implementation

uses main, SchedaProgressivi, SchedaPreventiviOrdini, SchedaClienti,
  FormSelezioneStato,
  FormSelezioneCliente, FormAnagCli,
  FormSettaStampante, FormBackup, FormConformita,
  FormWait, FormPratica, UnitRistruttura,
  FormSostArt, FormExtPrg, UnitDemoProtection, FormRiattivazione,
  FormCheckIn, SchedaArticoli1, FormImportaArcBase, FormSocGas,
  FormQtaArticolo, Printers, JclMapi, JclSysInfo, cxGridDBDataDefinitions,
  FormImportazione, DComCrypto,
  FormAziende, FormQtaOpera,
  DateUtils, FormSelezionaPraticheImpianti,
  FormImpegni, FormPassword, cxDBRichEdit, WinInet, FormScambioDoc,
  ShellApi, cxSplitter, FormAllegatiFG, DataModule2, DecimalRounding_JH1,
  FormMenuAggiungi, FormUpdateRepDownload, cxDBCheckComboBox,
  UnitGoogleTasks, UnitGoogleCal, UnitRepositoryIniFile, StrUtils,
  FormBaseSetup, FormAssistenzeMobileMain, Levante.Version.InterfacesAndFactory,
  FormConfirm;

{$R *.DFM}

// =============================================================================
// INIZIO: PARTE PER VERIFICA E GESTIONE TRANSAZIONE GIA' IN ATTO
// -----------------------------------------------------------------------------
procedure TDM1.CheckForAlreadyInTransaction;
var
  MsgStr: String;
begin
  // Se non è in transazione esce subito
  if not DBAzienda.InTransaction then
    Exit;
  // Altrimenti visualizza un messaggio per l'utente
  MsgStr := 'ATTENZIONE!!!'#13'ATTENZIONE!!!'#13'ATTENZIONE!!!'#13#13'Una transazione è già in atto.'#13#13'E'' possibile una perdita di dati'#13#13;
  MsgStr := MsgStr +
    'Tenterò di confermare le operazioni precedenti'#13#13'Levante verrà chiuso per sicurezza, riavviarlo e verificare le ultime cose fatte'#13#13'Chiamare il centro servizi Levante per favore.';
  MessageBeep(MB_ICONEXCLAMATION);
  MessageDlg(MsgStr, mtError, [mbOk], 0);
  try
    // Annota l'errore
    CheckForAlreadyInTransaction_LogError;
    // Prova a fare il commit della transazione
    DM1.ShowWait('Levante', 'Sto tentando di confermare la transazione prima di chiudermi...');
    DBAzienda.Commit;
  finally
    DM1.ShowWait('Levante', 'Mi sto chiudento, riavviami e verifica le ultime cose fatte.');
    Sleep(3000);
    Application.ProcessMessages;
    Application.Terminate;
  end;
end;

procedure TDM1.CheckForAlreadyInTransaction_LogError;
var
  Q: TIB_Cursor;
  NextErrorID: Integer;
begin
  // Imposta la query che ricava la versione di file di aggiornamento
  // presente nel repository
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    // Determina il prossimo ID
    Q.SQL.Add('SELECT COALESCE(MAX(ID), 0) FROM ERRORS');
    Q.Open;
    NextErrorID := Q.Fields[0].AsInteger + 1;
    Q.Close;
    // IMposta la query per l'inserimento dell'errore
    Q.SQL.Clear;
    Q.SQL.Add('INSERT INTO ERRORS (ID, DESCRIZIONE, DATAORA, OPERATORE) VALUES(');
    Q.SQL.Add(IntToStr(NextErrorID) + ',');
    Q.SQL.Add(QuotedStr('Transazione già aperta, possibile perdita di dati.') + ',');
    Q.SQL.Add('CURRENT_TIMESTAMP,');
    Q.SQL.Add(QuotedStr(IDOperatoreCorrente));
    Q.SQL.Add(')');
    Q.ExecSQL;
    // Se non trova nulla esce subito
    if Q.Eof then
      Exit;
  finally
    Q.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE: PARTE PER VERIFICA E GESTIONE TRANSAZIONE GIA' IN ATTO
// =============================================================================

// =============================================================================
// INIZIO: PARTE PER SCARICAMENTO AGGIORNAMENTO DA REPOSITORY
// -----------------------------------------------------------------------------
// Procedure che verifica se c'è un aggiornamento sul repository più recente
// dell'eseguibile attuale e se lo trova avvia la procedura di scaricamento
// e avvio dell'aggiornamento
procedure TDM1.RepositoryUpdate_CheckForUpdate;
begin
  // Se non c'è alcun aggiornamento disponibile esce subito
  // NB: Anche se è già stato gestito l'aggiornamento in questa sessione.
  if DM1.fUpdateRepDownloadForm_Showed or (not RepositoryUpdate_CheckForNewUpdateFile) then
    Exit;
  // Se ci fosse la form di attesa la chiude altrimenti darebbe fastidio
  DM1.CloseWait;
  // Avvia la procedura di scaricamento e aggiornamento
  Application.CreateForm(TUpdateRepDownloadForm, UpdateRepDownloadForm);
  try
    // Flag che indica se la form di aggiornamento presente nel repository è già
    // stata visualizzata oppure no
    // NB: La uso perchè altrimenti all'avvio me la dava due volte
    DM1.fUpdateRepDownloadForm_Showed := True;
    // Visualizza la form
    UpdateRepDownloadForm.ShowModal;
  finally
    FreeAndNil(UpdateRepDownloadForm);
  end;
end;

// Function che verifica se nel repository c'è un aggiornamento più recente
// dell'eseguibile attuale
function TDM1.RepositoryUpdate_CheckForNewUpdateFile: Boolean;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := False;
  // Imposta la query che ricava la versione di file di aggiornamento
  // presente nel repository
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    Q.SQL.Add('SELECT VERSIONE FROM REPOSITORY WHERE TIPOFILE = ''UPD''');
    Q.Open;
    // Se non trova nulla esce subito
    if Q.Eof then
      Exit;
    // Altrimenti ritorna True se il file nel repository è più aggiornato
    Result := (Q.Fields[0].AsInteger > MainForm.PrgVersion);
    Q.Close;
  finally
    Q.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE: PARTE PER SCARICAMENTO AGGIORNAMENTO DA REPOSITORY
// =============================================================================

// Questa procedura viene richiamata dall'evento onChange della comboBox relativa
// ad un agente e se questo era legato ad un altro sotto di lui lo azzera
procedure TDM1.AgenteChanged(AgentiIndex: Integer; dbeAgenteControl: TcxCustomTextEdit);
var
  AbilitaLinkedTo: Boolean;
begin
  // Converte il parametro AgentiIndex aggiungendogli uno perchè deve controllare
  // se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  // che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  // NB: Se AgentiIndex > 3 esce subito
  if (AgentiIndex > 3) or (AgentiIndex < 1) then
    Exit;
  Inc(AgentiIndex);
  // Abilita o disabilita la parte di gestione dei LINKEDTONOME in base a come impostato
  AbilitaLinkedTo := (DM1.Agente2LinkedToAgente1 and (AgentiIndex = 2)) or (DM1.Agente3LinkedToAgente2 and (AgentiIndex = 3)) or
    (DM1.Agente4LinkedToAgente3 and (AgentiIndex = 4));
  // Se il livello successivo di agente non è abbinato a quello che è stato appena
  // modificato esce subito senza fare nulla
  if not AbilitaLinkedTo then
    Exit;
  // Altrimenti se arriva qui azzera il testo del livello successivo abbinato al presente
  dbeAgenteControl.EditingText := '';
  dbeAgenteControl.PostEditValue;
end;

procedure TDM1.CaricaItemsAgenti(Items: TStrings; AgentiIndex: Integer; MasterValue: String);
var
  Qry: TIB_Cursor;
  NomeTabella, NomeTabellaLinkedTo: String;
  AbilitaLinkedTo: Boolean;
begin
  // Inizializzazione
  MasterValue := Trim(MasterValue);
  Items.Clear;
  // Abilita o disabilita la parte di gestione dei LINKEDTONOME in base a come impostato
  AbilitaLinkedTo := (DM1.Agente2LinkedToAgente1 and (AgentiIndex = 2)) or (DM1.Agente3LinkedToAgente2 and (AgentiIndex = 3)) or
    (DM1.Agente4LinkedToAgente3 and (AgentiIndex = 4));
  // Determina il nome delle tabelle su cui operare
  if AgentiIndex > 1 then
  begin
    NomeTabella := 'AGENTI' + IntToStr(AgentiIndex);
    NomeTabellaLinkedTo := 'AGENTI' + IntToStr(AgentiIndex - 1);
  end
  else
  begin
    NomeTabella := 'AGENTI';
    NomeTabellaLinkedTo := ''; // Tanto non la usa
  end;
  // Crea la query che fornirà l'elenco dei registri disponibili
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT NOME FROM ' + NomeTabella);
    if AbilitaLinkedTo then
    begin
      // Se Master Value non è specificato esce subito
      if MasterValue = '' then
        Exit;
      Qry.SQL.Add('WHERE LINKEDTONOME = ' + QuotedStr(MasterValue));
    end;
    Qry.Open;
    Items.Add('');
    while not Qry.Eof do
    begin
      Items.Add(Qry.FieldByName('NOME').Value);
      Qry.Next;
    end;
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

// =============================================================================
// INIZIO PARTE PER GESTIONE FORM ALLEGATI
// -----------------------------------------------------------------------------
// Procedura che esegue il polling per vedere se ci sono allegati in
// allarme e imposta la relativa proprietà
procedure TDM1.TimerPollingAllegatiAlarmTimer(Sender: TObject);
begin
  // Esegue il polling degli allegati in allarme
  Allegati_EseguiPollingAlarm;
end;

// Procedure che esegue il polling
procedure TDM1.Allegati_EseguiPollingAlarm;
begin
// NB: Disabilito gli allarmi perchè a volte mi danno degli AV e credo siano loro
Exit;
  // Senza questo controllo (preso dal sorgente del componente) all'uscita del programma (cliccando sulla X
  // in alto a dx della finestra, non con l'uscita normale) mi dava un errore.
  { NB: Prima di XE2 era così ma non andava più
    //  if (not SP_AllegatiAlarm.CheckTransaction(True))
    //  and not(( csLoading in SP_AllegatiAlarm.ComponentState ) or ( csDestroying in SP_AllegatiAlarm.ComponentState ) or ( csFixups  in SP_AllegatiAlarm.ComponentState ))
  }
  if (csFreeNotification in SP_AllegatiAlarm.ComponentState) or (csLoading in SP_AllegatiAlarm.ComponentState) or (csDestroying in SP_AllegatiAlarm.ComponentState) or (csFixups in SP_AllegatiAlarm.ComponentState) then
    Exit;
  // Apre la stored procedure
  SP_AllegatiAlarm.Open;
  try
    // Aggiorna la proprietà che contiene il numero deggli allegati in allarme
    // presenti nell'azienda.
    MainForm.Allegati_Count_Alarm := SP_AllegatiAlarm.Fields[0].AsInteger;
  finally
    // Chiude la stored procedure
    SP_AllegatiAlarm.Close;
  end;
end;

// Procedure che attiva/disattica il Timer del polling er laverifica della presenza
// di allegati con allarme scaduto
procedure TDM1.Allegati_Alarm_EnableTimerPolling(En: Boolean);
begin
  if En then
  begin
    // Esegue il gesore di evento on Timer in modo che venga fatto subito un controllo
    // senza aspettare il timer
    TimerPollingAllegatiAlarmTimer(TimerPollingAllegatiAlarm);
  end;
  // Abilita/Disabilita il timer
  TimerPollingAllegatiAlarm.Enabled := En;
end;
// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE FORM ALLEGATI
// =============================================================================

// Procedure che esegue la stampa Silent dell'allegato F/G specificato
procedure TDM1.StampaAllegatoFG(ID: Integer; Preview: Boolean);
begin
  // Crea la Form dell'allegato e la imposta in omdalità di sola stampa
  // in pratica senza visualizzarla e quindi richiama esplicitamente
  // il metodo di apertura delle query del documento perchè
  // non venendo visualizzata non passa dall'onShow
  Application.CreateForm(TAllegatiFGForm, AllegatiFGForm);
  try
    AllegatiFGForm.Parent := MainForm;
    AllegatiFGForm.ID := ID;
    AllegatiFGForm.SoloPerStampare := True;
    AllegatiFGForm.ApriQueryAllegato;
    // Esegue la stampa
    AllegatiFGForm.StampaAllegatoFG(Preview, 0);
  finally
    AllegatiFGForm.Close;
  end;
end;

// Procedure che carica gli agenti appropriati dal soggetto oppure dalla pratica in base
// alla situazione.
procedure TDM1.SetAgenti(DS: TDataSet; SoggFieldName, PratFieldName, DataPratFieldName: String);
var
  Q: TIB_Cursor;
begin
  // Se questa funzione è disabilitata esce
  if DisabilitaSetAgenti then
    Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che memorizzerà il file di residuo ordini attuale
    // nel database dell'azienda.
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Azzera gli agenti
    DS.FieldByName('AGENTE').Clear;
    DS.FieldByName('AGENTE2').Clear;
    DS.FieldByName('AGENTE3').Clear;
    DS.FieldByName('AGENTE4').Clear;
    // Se nel dataset (documento) è specificato una pratica/cantiere allora prende gli agenti da li
    if (not DS.FieldByName(PratFieldName).IsNull) and (DS.FieldByName(PratFieldName).AsInteger <> 0) then
    begin
      Q.SQL.Add('SELECT FIRST 1 AGENTE, AGENTE2, AGENTE3, AGENTE4 FROM PRATICHE WHERE');
      Q.SQL.Add('    CODICE = ' + DS.FieldByName(PratFieldName).AsString);
      Q.SQL.Add('AND DATAAPERTURA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DS.FieldByName(DataPratFieldName).AsDateTime)));
      // Se invece nel documento non è specificata una pratica/cantiere usa gli agenti del soggetto
    end
    else if (not DS.FieldByName(SoggFieldName).IsNull) and (DS.FieldByName(SoggFieldName).AsInteger <> 0) then
    begin
      Q.SQL.Add('SELECT FIRST 1 AGENTE, AGENTE2, AGENTE3, AGENTE4 FROM CLIENTI WHERE');
      Q.SQL.Add('CODICE = ' + DS.FieldByName(SoggFieldName).AsString);
    end;
    // Se la query non è stata impostata significa che nel documento non era specificato ne il cliente esce subito
    if Q.SQL.Count = 0 then
      Exit;
    // Apre la query
    Q.Open;
    // Se non ha trovato nessun record esce subito
    if Q.Eof then
      Exit;
    // Carica gli agenti dal record trovato
    DS.FieldByName('AGENTE').Value := Q.FieldByName('AGENTE').Value;
    DS.FieldByName('AGENTE2').Value := Q.FieldByName('AGENTE2').Value;
    DS.FieldByName('AGENTE3').Value := Q.FieldByName('AGENTE3').Value;
    DS.FieldByName('AGENTE4').Value := Q.FieldByName('AGENTE4').Value;
    // Chiude la query
    Q.Close;
  finally
    // Pulizie finali
    Q.Free;
  end;
end;

// Procedura che salva il file di residuo ordini ricevuto come
// parametro del database dell'azienda imposta anche la data.
procedure TDM1.ResOrd_PutOnDatabase(FullPathResOrdFileName: String; ResOrdDateTime: TDateTime);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che memorizzerà il file di residuo ordini attuale
    // nel database dell'azienda.
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PROGRESS SET');
    Q.SQL.Add('RESIDUOORDINI = :P_RESIDUOORDINI,');
    Q.SQL.Add('DATARESORD = :P_DATARESORD');
    Q.Prepare;
    // Imposta i parametri
    Q.Params.ParamByName('P_RESIDUOORDINI').LoadFromFile(FullPathResOrdFileName);
    Q.Params.ParamByName('P_DATARESORD').AsDateTime := ResOrdDateTime;
    // Esegue la query
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Funzione che preleva il file del residuo ordini dal database dell'azienda
// e lo salva su una cartella locale per la successiva visualizzazione.
// Ritorna la data del residuo ordini appena elaborato
function TDM1.ResOrd_GetFromDatabase: TDateTime;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := StrToDate('01/01/1900');
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che memorizzerà il file di residuo ordini attuale
    // nel database dell'azienda.
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT FIRST 1 RESIDUOORDINI, DATARESORD FROM PROGRESS');
    // Apre la query
    Q.Open;
    // Salva i dati
    if not Q.FieldByName('RESIDUOORDINI').IsNull then
    begin
      Q.FieldByName('RESIDUOORDINI').SaveToFile(CartellaTmp + 'ResOrd_' + AziendaCorrente + '.XML');
      Result := Q.FieldByName('DATARESORD').AsDateTime;
    end;
  finally
    Q.Free;
  end;
end;

// Funzione che ritorna True se il file del residuo ordini
// attuale nel database è vecchio, se invece è di oggi ritorna False.
// In pratica controlla se è di oggi oppure no
function TDM1.ResOrd_CheckIfOld: Boolean;
var
  Q: TIB_Cursor;
  TmpStr: String;
  DifferenzaGiorni: Integer;
  DataResOrd, Oggi: TDateTime;
begin
  // Inizializzazione
  Result := False;
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che memorizzerà il file di residuo ordini attuale
    // nel database dell'azienda.
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add(
      'SELECT FIRST 1 CAST(COALESCE(DATARESORD, ''01/01/1900'') AS TIMESTAMP) AS DATARESORD, CAST(CURRENT_TIMESTAMP AS TIMESTAMP) AS ADESSO FROM PROGRESS');
    // Apre la query
    Q.Open;
    // Se il valore è nullo solleva una eccezione
    if Q.Fields[0].IsNull then
      raise Exception.Create('Campo DATARESORD nullo.');
    // Carica i dati su alcune variabili locali per comodità
    DataResOrd := Q.FieldByName('DATARESORD').AsDateTime;
    Oggi := Q.FieldByName('ADESSO').AsDateTime;
    // Elimina la parte decimale in modo da non considerare la parte Time
    DataResOrd := Trunc(DataResOrd);
    Oggi := Trunc(Oggi);
    // Calcola la differenza in giorni tra la data del residuo ordini e la data odierna
    DifferenzaGiorni := Trunc(Oggi - DataResOrd);
    // Se la data del residuo ordini è odierna significa che il file che abbiamo è aggiornato
    // e quindi ritorna False, altrimenti significa che è vecchio (oppure la data è sballata)
    // e quindi ritorna True.
    Result := (DifferenzaGiorni <> 0);
    // Chiude il dataset
    Q.Close;
    // Se risulta esserci un residuo ordini più recente sul teletrasporto rispetto
    // a quello già presente nel database.
    if Result then
    begin
      // Compone e visualizza il messaggio di avvertimento
      if (DifferenzaGiorni = 1) then
        TmpStr := 'Il residuo ordini è di ieri.'
      else if (DifferenzaGiorni > 1) then
        TmpStr := 'Il residuo ordini è di ' + IntToStr(DifferenzaGiorni) + ' giorni fa.'
      else
        TmpStr := 'Probabilmente c''è un problema sulla data di un computer perchè la differenza giorni tra il residuo ordini presente nel programma e la data odierna sul server è negativa ('
          + IntToStr(DifferenzaGiorni) + ').';
      Result := (DM1.Messaggi('Residuo ordini', TmpStr + #13#13'Scarico quello di oggi?', '', [mbYes, mbNo], 0, nil) = mrYes);
    end;
  finally
    Q.Free;
  end;
end;

// Funzione che ritorna True se c'è un file residuo ordini già
// scaricato e quindi già nel database più nuovo di quello che si sta
// visualizzando localmente.
// Ad es: se l'utente sta visualizzando un residuo ordini di ieri ma
// qualche altro utente ha già scaricato dal teletrasporto il redisuo ordini
// di oggi l'utente viene avvertito e invitato ad rinfrescare la visualizzazione.
function TDM1.ResOrd_CheckIfNewestAlreadyDownloaded(CurrResOrdDate: TDateTime): Boolean;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := False;
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che memorizzerà il file di residuo ordini attuale
    // nel database dell'azienda.
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT FIRST 1 CAST(COALESCE(DATARESORD, ''01/01/1900'') AS TIMESTAMP) AS DATARESORD FROM PROGRESS');
    // Apre la query
    Q.Open;
    // Imposta il valore da ritornare
    Result := (Q.FieldByName('DATARESORD').AsDateTime > CurrResOrdDate);
    // Chiude il dataset
    Q.Close;
    // Se risulta esserci un residuo ordini più recente già nel databse avverte l'utente
    // e gli chiede se vuole aggiornale lo schermo.
    if Result then
    begin
      Result := (DM1.Messaggi('Residuo ordini',
        'ATTENZIONE !!!'#13#13#13'Una residuo ordini più aggiornato di quello che vedi è già stato scaricato dal teletrasporto.'#13#13'Aggiorno lo schermo?',
        'NB: Rispondendo "SI" verrà mostrato il nuovo residuo ordini, rispondendo "NO" continuerai a lavorare sulla visualizzazione attuale.', [mbYes, mbNo], 0,
        nil) = mrYes);
    end;
  finally
    Q.Free;
  end;
end;

// Procedura che si occupa dello scaricamento di un nuovo file di residuo ordini
// dal server del teletraporto
// NB: Questa viene usata solo per il levante normale perchè LevanteLight ne usa
// un'altra.
procedure TDM1.ResOrd_DownloadFromTeletrasporto(Hidden: Boolean = False);
var
  DocImp: TStrings;
begin
  // Inizializzazione
  DocImp := TStringList.Create;
  try
    // Prima di tutto verifica se siamo connessi ad internet
    if not DM1.InternetIsConnected then
      raise Exception.Create('Connessione a Internet non disponibile.');
    // Apre il teletrasporto
    MainForm.ApriTeletrasporto(Hidden);
    try
      // Avvia l'importazione automatica di tutti i documenti
      ScambioDocForm.DownloadFileResOrd(DocImp);
    finally
      // Chiude il teletrasporto
      ScambioDocForm.SBChiudiTeletrasportoClick(ScambioDocForm.SBChiudiTeletrasporto);
    end;
  finally
    // Pulizie finali
    DocImp.Free;
  end;
end;

// =============================================================================
// SALVATAGGIO/CARICAMENTO DELL'INTERVALLO DI DATE PER I FILTRI PER DATA
// -----------------------------------------------------------------------------
procedure TDM1.SetDataInizialeFitriDefault_Old;
var
  GG, MM, AA: Word;
begin
  DecodeDate(Date, AA, MM, GG);
  // Inizializzazione della data iniziale di default per i filtri per data
  FilterDataDalDefault := ' 01/01/' + IntToStr(AA);
  FilterDataAlDefault := '   /  /20  ';
end;

procedure TDM1.SalvaDatePredefinitePerFiltri(DataDal, DataAl: String);
var
  P: TMemIniFile;
begin
  // Prima chiede conferma
  if not DM1.Messaggi('Levante', 'Confermi di voler cambiare le date predefinite?',
    'NB: L''operazione causerà la chiusura di tutti elenchi attualmente aperti.', [mbYes, mbNo], 0, nil) = mrOk then
    Exit;
  // Apre il file Param.ini dove ci sono l'indirizzo del server e l'azienda corrente
  P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
  try
    // Salva le date ricevute come parametro verificando prima che siano valide
    if DM1.ControllaDataStr(DataDal) then
      P.WriteString('FILTERS', 'FromDate', DataDal)
    else
      P.WriteString('FILTERS', 'FromDate', '');
    if DM1.ControllaDataStr(DataAl) then
      P.WriteString('FILTERS', 'ToDate', DataAl)
    else
      P.WriteString('FILTERS', 'ToDate', '');
    // Update del file ini
    P.UpdateFile;
    // Ricarica subito le date per aggiornare le variabili globali usate poi nei fitrli
    CaricaDatePredefinitePerFiltri(P);
  finally
    P.Free;
  end;
end;

procedure TDM1.CaricaDatePredefinitePerFiltri(P: TMemIniFile);
var
  CurrDate: String;
  GG, MM, AA: Word;
begin
  // Rimedia l'anno in corso
  DecodeDate(Date, AA, MM, GG);
  // Carica la data di partenza dell'intervallo di date e se non è valida
  // assegna per default il 1° gennaio dell'anno in corso
  CurrDate := P.ReadString('FILTERS', 'FromDate', '');
  if DM1.ControllaDataStr(CurrDate) then
    Self.FilterDataDalDefault := CurrDate
  else
    Self.FilterDataDalDefault := ' 01/01/' + IntToStr(AA);
  // Carica la data finale dell'intervallo di date e se non è valida
  // assegna per default una data nulla in modo che non sia limite al futuro (soprattutto per le scadenze).
  CurrDate := P.ReadString('FILTERS', 'ToDate', '');
  if DM1.ControllaDataStr(CurrDate) then
    Self.FilterDataAlDefault := CurrDate
  else
    Self.FilterDataAlDefault := '   /  /20  ';
  // Azzera tutte le query interessate in modo che al prossimo utilizzo
  // usino l'impostazione appena caricata
  if ClientiForm <> nil then
  begin
    ClientiForm.RxSpeedButtonResetQuery.Tag := 1;
    ClientiForm.RxSpeedButtonResetQueryClick(Self);
  end;
end;
// =============================================================================

// Procedura che imposta la stringa su cui viene costruito l'indicazione
// del range di date relativo alla stampa di un elenco.
procedure TDM1.SetReportDateRange(DataDal, DataAl: String);
begin
  // Inizializzazione
  fReportRangeDate := '';
  // Se impostata correttamente aggiunge l'indicazione della data DAL
  if DM1.ControllaDataStr(DataDal) then
  begin
    fReportRangeDate := 'dal ' + DataDal;
  end;
  // Se impostata correttamente aggiunge l'indicazione della data AL
  if DM1.ControllaDataStr(DataAl) then
  begin
    if fReportRangeDate <> '' then
      fReportRangeDate := fReportRangeDate + ' al ' + DataAl
    else
      fReportRangeDate := fReportRangeDate + ' fino al ' + DataAl;
  end;
end;

// Ritorna True se in qualche maniere si è connessi ad internet altrimenti False
function TDM1.InternetIsConnected: Boolean;
var
  dwFlags: Cardinal;
begin
  Result := InternetGetConnectedState(@dwFlags, 0);
end;
{
  // Ritorna True se in qualche maniere si è connessi ad internet altrimenti False
  function  TDM1.InternetIsConnected: Boolean;
  var
  dwConnectionTypes: DWORD;
  begin
  dwConnectionTypes :=
  INTERNET_CONNECTION_MODEM +
  INTERNET_CONNECTION_LAN +
  INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
  end;
}

// Funzione che ritorna l'abilitazione o meno all'autoquery in base alla situazione
function TDM1.GoAutoquery(AutoqueryIndex: Integer): Boolean;
begin
  // Inizializzazione
  Result := False;
  // Se siamo in modalità Levante Light l'Autoquery è abilitata per default.
  if MainForm.IsLevanteLight then
  begin
    Result := True;
    Exit;
  end;
  // Se siamo con nessun soggetto selezionato ritorna True se la specifica Autoquery è abilitata
  // e deve essere anche a False la forzatura a tutte le autoquery disabilitate a cliente non selezionato.
  if MainForm.ModoAssistenzeRDP or (ClientiForm.ClienteCorrente = '') or (ClientiForm.ClienteCorrente = '0') then
  begin
    Result := AutoQuery[AutoqueryIndex] and (not AutoQueryGlobaleDisabilitaSeSoggettoNonSelezionato);
    // Se siamo con un soggetto selezionato ritorna True se la specifica Autoquery è abilitata
    // e deve essere anche a False la forzatura a tutte le autoquery disabilitate a cliente selezionato.
  end
  else
  begin
    Result := AutoQuery[AutoqueryIndex] and (not AutoQueryGlobaleDisabilitaSeSoggettoSelezionato);
  end;
end;

// Funzione che ritorna una stringa contenente un GUID
function TDM1.GUIDAsString: string;
var
  aGuid: TGUID;
begin
  System.SysUtils.CreateGUID(aGuid);
  Result := GUIDToString(aGuid);
end;

function TDM1.IsIntervento(ID: Integer): Boolean;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := False;
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT TIPOIMPEGNO FROM IMPEGNI WHERE ID = ' + IntToStr(ID));
    Q.Open;
    if not Q.Eof then
    begin
      Result := (Q.Fields[0].AsString = 'Intervento');
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TDM1.VerificaPassword(Password: String): Boolean;
begin
  Result := False;
  Application.CreateForm(TPasswordForm, PasswordForm);
  PasswordForm.Password := Password;
  Result := (PasswordForm.ShowModal = mrYes);
  if not Result then
    raise Exception.Create('Password errata!');
end;

// Funzione che ritorna il numero di documento più alto del tipo specificato nel parametro contenuto
// nella bacheca.
function TDM1.MaxNumDocOfTypeInBacheca(TipoDoc: String): Integer;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := 0;
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che cerca se c'è già un record relativo a questo distributore e questa filiale
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    Q.SQL.Add('SELECT MAX(NUMORDPREV) FROM TMPRIGHI WHERE TIPODOCUMENTO = ''' + TipoDoc + '''');
    Q.Open;
    if not Q.Eof then
    begin
      Result := Q.Fields[0].AsInteger;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

// Procedura che apre un impegno
procedure TDM1.ApriImpegno(ID: Integer; Modal: Boolean = False);
begin
  if DM1.ModCtrl(MOD_CONTATTI) > 0 then
  begin
    Application.CreateForm(TImpegnoForm, ImpegnoForm);
    if MainForm.ModoAssistenzeRDP then
    begin
      ImpegnoForm.Parent := AssistenzeMobileMainForm.TabImpegno;
      ImpegnoForm.Align := alClient;
      AssistenzeMobileMainForm.MainPageControl.ActivePage := AssistenzeMobileMainForm.TabImpegno;
    end
    else
      ImpegnoForm.Parent := MainForm;
    ImpegnoForm.CurrentID := ID;
    ImpegnoForm.Tag := 1;
    if Modal then
      ImpegnoForm.ShowModal
    else
      ImpegnoForm.Show;
  end;
end;

// Converte il codice a barre del documento ricevuto nei campi
// TipoDocumento, NUmero documento, Registro, Data documento.
procedure TDM1.DocBarCodeToDocData(BC: String; var DocTipo: String; var DocNum: Integer; var DocReg: String; var DocData: TDateTime);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  DocTipo := '';
  DocNum := 0;
  DocReg := '';
  DocData := StrToDate('01/01/1900');
  // Inizializzazione
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che cerca se c'è già un record relativo a questo distributore e questa filiale
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT TIPODOCUMENTO, NUMORDPREV, REGISTRO, DATADOCUMENTO FROM PRVORDCL WHERE BARCODE = ''' + BC + '''');
    Q.Open;
    if not Q.Eof then
    begin
      DocTipo := Q.FieldByName('TIPODOCUMENTO').AsString;
      DocNum := Q.FieldByName('NUMORDPREV').AsInteger;
      DocReg := Q.FieldByName('REGISTRO').AsString;
      DocData := Q.FieldByName('DATADOCUMENTO').AsDateTime;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

// Converte il codice documento (quello dei codici a barre dei documenti
// cioè il 2° carattere del codice nel rispettivo Tipo di documento per esteso.
function TDM1.DocTypeToDocTypeCode(C: String): String;
begin
  Result := '';
  if C = 'Intervento' then
    Result := '1'
  else if C = 'Preventivo' then
    Result := '2'
  else if C = 'Ordine' then
    Result := '3'
  else if C = 'S.A.L.' then
    Result := '4'
  else if C = 'Buono_cons' then
    Result := '5'
  else if C = 'D.D.T.' then
    Result := '6'
  else if C = 'Ricev.fisc' then
    Result := '7'
  else if C = 'Fattura' then
    Result := '8'
  else if C = 'Fatt.R.F.' then
    Result := '9'
  else if C = 'Nota_accre' then
    Result := 'A'
  else if C = 'Commessa' then
    Result := 'B'
  else if C = 'Carico_cantiere' then
    Result := 'C'
  else if C = 'Scarico_cantiere' then
    Result := 'D'
  else if C = 'Estratto_conto' then
    Result := 'E'
  else if C = 'Ord.fornit' then
    Result := 'F'
  else if C = 'Bolla_entr' then
    Result := 'G'
  else if C = 'Fatt.acqui' then
    Result := 'H'
  else if C = 'N.C.fornit' then
    Result := 'I';
end;

// Converte il codice documento (quello dei codici a barre dei documenti
// cioè il 2° carattere del codice nel rispettivo Tipo di documento per esteso.
function TDM1.DocTypeCodeToDocType(C: String): String;
begin
  Result := '';
  if C = '1' then
    Result := 'Intervento'
  else if C = '2' then
    Result := 'Preventivo'
  else if C = '3' then
    Result := 'Ordine'
  else if C = '4' then
    Result := 'S.A.L.'
  else if C = '5' then
    Result := 'Buono_cons'
  else if C = '6' then
    Result := 'D.D.T.'
  else if C = '7' then
    Result := 'Ricev.fisc'
  else if C = '8' then
    Result := 'Fattura'
  else if C = '9' then
    Result := 'Fatt.R.F.'
  else if C = 'A' then
    Result := 'Nota_accre'
  else if C = 'B' then
    Result := 'Commessa'
  else if C = 'C' then
    Result := 'Carico_cantiere'
  else if C = 'D' then
    Result := 'Scarico_cantiere'
  else if C = 'E' then
    Result := 'Estratto_conto'
  else if C = 'F' then
    Result := 'Ord.fornit'
  else if C = 'G' then
    Result := 'Bolla_entr'
  else if C = 'H' then
    Result := 'Fatt.acqui'
  else if C = 'I' then
    Result := 'N.C.fornit';
end;

// FUnzione che ritorna True se il documento è assegnato ad una pratica
function TDM1.IsInPratica(DS: TIBODataset; FieldName: String): Boolean;
begin
  Result := ((not DS.FieldByName(FieldName).IsNull) and (DS.FieldByName(FieldName).AsInteger <> 0));
end;

function TDM1.IsInSoggetto(DS: TIBODataset; FieldName: String): Boolean;
begin
  Result := ((not DS.FieldByName(FieldName).IsNull) and (DS.FieldByName(FieldName).AsInteger <> 0));
end;

// Funzione che ritorna un nome di file temporaneo
function TDM1.GetTempFileName(Ext: String; Directory: String = ''): String;
begin
  // Inizializzazione
  if Ext = '' then
    Ext := 'tmp';
  if Directory = '' then
    Directory := DM1.CartellaTmp;
  Directory := SlashFinale(Directory);
  // Cicla finchè non viene trovato un nome valido
  repeat
    // Genera il nome file temporaneo
    Result := Directory + 'TempFile___' + FormatDateTime('dd_mm_yyyy___hh_nn_ss_zzz', Now) + '.' + Ext;
  until not FileExists(Directory + Result);
end;

// Procedura che annota l'ultima versione del listino appena caricato nell'apposita
procedure TDM1.MarkListPrizeVersion(CodiceDistributore, CodiceFiliale, TipoFile: String; Versione: TDateTime; FullPathFileName: String);
var
  Q: TIB_Cursor;
  FullPathCompressedFileName: String;
begin
  // Verifica la presenza del file da salvare
  if not FileExists(FullPathFileName) then
    raise Exception.Create('File "' + FullPathFileName + '" non trovato.');
  // Genera il nome del file temporaneo da utilitzzare per la creazione del file compresso
  FullPathCompressedFileName := GetTempFileName('zlb', DM1.CartellaTmp);
  // Crea il file compresso e ci carica dentro il file da salvare.
  ZLB1.CreateArchive(FullPathCompressedFileName);
  ZLB1.AddFile(FullPathFileName);
  ZLB1.CloseArchive;
  // Avvia la transazione
  DM1.DBAzienda.StartTransaction;
  try
    try
      // Imposta la query che cerca se c'è già un record relativo a questo distributore e questa filiale
      Q := TIB_Cursor.Create(Self);
      Q.DatabaseName := DM1.ArcDBFile;
      Q.IB_Connection := DM1.DBAzienda;
      // Elimina l'eventuale registrazione precedente riguardande lo stesso listino
      Q.SQL.Add('DELETE FROM LISTINIRICEVUTI WHERE CODICEDISTRIBUTORE = ''' + CodiceDistributore + ''' AND CODICEFILIALE = ''' + CodiceFiliale +
        ''' AND TIPO = ''' + TipoFile + '''');
      Q.ExecSQL;
      // Query che effettua una registrazione aggiornata del listino appena ricevuto.
      Q.SQL.Clear;
      Q.SQL.Add('INSERT INTO LISTINIRICEVUTI (CODICEDISTRIBUTORE, CODICEFILIALE, TIPO, ULTIMAVERSIONESCARICATA, ULTIMOFILESCARICATO) VALUES (');
      Q.SQL.Add('''' + CodiceDistributore + ''',');
      Q.SQL.Add('''' + CodiceFiliale + ''',');
      Q.SQL.Add('''' + TipoFile + ''',');
      Q.SQL.Add('''' + FormatDateTime('mm/dd/yyy hh.nn.ss', Versione) + ''',');
      Q.SQL.Add(':P_FILE');
      Q.SQL.Add(')');
      // Imposta i parametri
      Q.Prepare;
      Q.Params.ParamByName('P_FILE').LoadFromFile(FullPathCompressedFileName);
      // Esegue la query
      Q.ExecSQL;
      // Dopo averlo importato, elimina il file
      DM1.EliminaFile(FullPathFileName);
      // Se tutto è andato bene conferma tutto
      DM1.DBAzienda.Commit;
    except
      // Se invece qualcosa è andato storto annulla tutto
      DM1.DBAzienda.Rollback;
      raise;
    end;
    // Pulizie finali
  finally
    if Assigned(Q) then
      Q.Free;
  end;
end;

// Funzione che ritorna True se la versione e cioè la data e ora del file del listino ricevuto
// come parametro sono successivi a quello dell'ultimo listino caricato dallo stesso distributore e
// stessa filiale.
function TDM1.IsNewListPrice(CodiceDistributore, CodiceFiliale, TipoFile: String; Versione: TDateTime): Boolean;
var
  Q: TIB_Cursor;
  V1, V2: TDateTime;
begin
  // Inizializzazione
  Result := False;
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT FIRST 1 ULTIMAVERSIONESCARICATA FROM LISTINIRICEVUTI WHERE CODICEDISTRIBUTORE = ''' + CodiceDistributore + ''' AND CODICEFILIALE = ''' +
      CodiceFiliale + ''' AND TIPO = ''' + TipoFile + '''');
    Q.Open;
    // Siamo già EOF significa che non ha trovato nessun record relativo al distributore
    // e alla filiale e quindi non è mai stato caricato il relativo listino precedentemente
    // e quindi lo autorizza subito ed esce
    if Q.Eof then
    begin
      Result := True;
      Exit;
    end;
    // Se invece ha trovato il record legge qual'è l'ultima versione scaricata
    // e se quella che si sta controllando è più attuale autorizza lo scaricamento
    // altrimenti no.
    // NB: Ho dovuto usare questo trucchetto di assegnare i valori da
    // confrontare a delle variabili locali perchè altrimenti non funzionava correttamente.
    V1 := StrToDateTime(DateTimeToStr(Versione));
    V2 := StrToDateTime(DateTimeToStr(Q.Fields[0].AsDateTime));
    Result := V1 > V2;
    // Chiude la query
    Q.Close;
  finally
    Q.Free;
  end;
end;

// Procedura che ricava le informazioni sull'aliquota IVA a partire dalla descrizione
// IVA che riceve al caricamento dei documenti dal teletrasporto in modo da ricavare
// anche il codice IVA e la descrizione come caricati su levante
procedure TDM1.IvaArcobalenoToIvaLevante(DI: String; var CodIva: Integer; var DescIva: String; var AliqIva: Double);
var
  PrecPos: TBookmark;
  AliquotaIvaDaCercare: Double;
begin
  // Inizializzazione
  CodIva := 0;
  DescIva := '';
  AliqIva := 0;
  // Controlla se la descrizione IVA da elaborare contiene il carattere "%" alla fine come
  // ultimo carattere, nel qual caso lo elimina perchè significa che la descrizione
  // IVA è un numero ma non riesce poi a convertirla il numero nelle righe successive e quindi
  // poi le mette come areticoli di esenza (succede con invio documenti da Levante a Levante)
  if RightStr(DI, 1) = '%' then
    DI := LeftStr(DI, Length(DI) - 1);
  // Converte il parametro DI che contiene l'aliquota iva da ricercare
  // in numero e se non lo trova ritorna zero in modo che poi tutta la procedura
  // ritornerà la prima aliquota IVA a 0 (un articolo di esenza o non imponibile).
  try
    if Trim(DI) <> '' then
      AliquotaIvaDaCercare := StrToFloat(DI)
    else
      AliquotaIvaDaCercare := 0;
  except
    AliquotaIvaDaCercare := 0;
  end;
  // Salva la situazione attuale
  PrecPos := TableAliquoteIVA.GetBookmark;
  TableAliquoteIVA.DisableControls;
  try
    // Cicla per tutte le aliquote iva finchè trova la prima con
    // la stessa percentuale.
    TableAliquoteIVA.First;
    while (not TableAliquoteIVA.Eof) and (TableAliquoteIVAALIQUOTAIVA.AsFloat <> AliquotaIvaDaCercare) do
      TableAliquoteIVA.Next;
    // Controlla se è uscito dal ciclo perchè ha trovato l'aliquota IVA
    // voluta oppure perchè è arrivato alla fine dei records senza trovare nulla
    // e si comporta di cnseguenza.
    if TableAliquoteIVA.Eof then
    begin
      raise Exception.Create('Aliquota IVA non trovata!!!');
    end
    else
    begin
      CodIva := TableAliquoteIVACODICEIVA.AsInteger;
      DescIva := TableAliquoteIVADESCRIZIONEIVA.AsString;
      AliqIva := TableAliquoteIVAALIQUOTAIVA.AsFloat;
    end;
  finally
    // Ripristina la situazione iniziale
    TableAliquoteIVA.GotoBookmark(PrecPos);
    TableAliquoteIVA.FreeBookmark(PrecPos);
    TableAliquoteIVA.EnableControls;
  end;

end;

// Funzione che ritorna la directory root del server Firebird SQL attualmente
// installato
function TDM1.GetFirebirdRootDir: String;
  function GetFirebirdRootDirFromParamsIniFile: String;
  var
    P: TMemIniFile;
  begin
    P := TMemIniFile.Create(CurrDir + 'param.ini');
    try
      Result := Trim(P.ReadString('ARCPATH', 'FirebirdRootDir', ''));
    finally
      P.Free;
    end;
  end;
  function GetFirebirdRootDirFromRegistry: String;
  var
    Registry: TRegistry;
  begin
    Result := '';
    Registry := TRegistry.Create(KEY_READ);
    try
      Registry.RootKey := HKEY_LOCAL_MACHINE;
      Registry.OpenKey('\SOFTWARE\Firebird Project\Firebird Server\Instances\', False);
      Result := Trim(Registry.ReadString('DefaultInstance'));
    finally
      Registry.Free;
    end;
  end;
begin
  Result := GetFirebirdRootDirFromParamsIniFile;
  if Result = '' then
    Result := GetFirebirdRootDirFromRegistry;
  if Result = '' then
    raise Exception.Create('Firebird root dir non trovata.');
  Result := SlashFinale(Result);
end;

// Funzione che ritorna il ricarico da utilizzare per il prezzo ricevuto come parametro
function TDM1.GetRicaricoPerPrezzo(Prezzo: Double; Listino: Smallint; CaricaDatabase: Boolean = True): Double;
var
  i: Integer;
begin
  // Inizializzazione
  Result := 0;
  i := 0;
  // Se richiesto carica le fasce di ricarico in memoria
  if CaricaDatabase then
    CaricaFasceRicarichi;
  // Cicla tra le varie fasce di prezzo (sono ordinate in modo ASCENDENTE
  // fino a quando non individua la fascia giusta.
  // Uso un ciclo While in modo da evitare eventuali ottimizzazioni del compilatore
  while (Prezzo > Ricarichi[i].PrezzoAl) and (i < (Length(Ricarichi) - 1)) do
    Inc(i);
  // A questo punto imposta il ricarico da ritornare in base al listino prescelto.
  case Listino of
    1:
      Result := Ricarichi[i].Ricarico1;
    2:
      Result := Ricarichi[i].Ricarico2;
    3:
      Result := Ricarichi[i].Ricarico3;
    4:
      Result := Ricarichi[i].Ricarico4;
  else
    raise Exception.Create('Listino richiesto non trovato.');
  end;
end;

// Funzione che ritorna il ricarico dell'articolo specificato e del listino specificato
// come impostato nell'anagrafica articolo, se l'articolo non esiste ritorna
// i margini di default come impostati nei parametri e progressivi.
function TDM1.GetRicaricoArticolo(CodArt: String; Listino: Integer): Double;
var
  Q: TIB_Cursor;
begin
  Result := 0;
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT RICARICO AS RICARICO1, RICARICO2, RICARICO3, RICARICO4 FROM ARTICOLI');
    Q.SQL.Add('WHERE CODICEARTICOLO = ''' + CodArt + '''');
    Q.Open;
    if (not Q.Eof) and (Trim(CodArt) <> '') then
    begin
      case Listino of
        1:
          Result := Q.FieldByName('RICARICO1').AsFloat;
        2:
          Result := Q.FieldByName('RICARICO2').AsFloat;
        3:
          Result := Q.FieldByName('RICARICO3').AsFloat;
        4:
          Result := Q.FieldByName('RICARICO4').AsFloat;
      end;
    end
    else
    begin
      case Listino of
        1:
          Result := TableProgressiviRICARICOLISTINO1.AsFloat;
        2:
          Result := TableProgressiviRICARICOLISTINO2.AsFloat;
        3:
          Result := TableProgressiviRICARICOLISTINO3.AsFloat;
        4:
          Result := TableProgressiviRICARICOLISTINO4.AsFloat;
      end;
    end;
  finally
    Q.Free;
  end;
end;

// Procedura che carica nell'apposita struttura le fasce di ricarico da applicare
// agli articoli per il calcolo dei listini di vendita.
procedure TDM1.CaricaFasceRicarichi;
var
  Q: TIB_Cursor;
  i, NumRecords: Integer;
begin
  // Visualizza la form dei messaggi
  DM1.ShowWait('Caricamento fasce ricarichi', 'Ricerca fascia di ricarico per prezzo...');
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT * FROM RICARICHI ORDER BY ALPREZZO');
    Q.Open;
    NumRecords := Q.RecordCount;
    SetLength(Ricarichi, NumRecords);
    for i := 0 to NumRecords - 1 do
    begin
      Ricarichi[i].PrezzoAl := Q.FieldByName('ALPREZZO').AsDouble;
      Ricarichi[i].Ricarico1 := Q.FieldByName('RICARICO1').AsDouble;
      Ricarichi[i].Ricarico2 := Q.FieldByName('RICARICO2').AsDouble;
      Ricarichi[i].Ricarico3 := Q.FieldByName('RICARICO3').AsDouble;
      Ricarichi[i].Ricarico4 := Q.FieldByName('RICARICO4').AsDouble;
      Q.Next;
    end;
    Q.Close;
  finally
    DM1.CloseWait;
    Q.Free;
  end;
end;

// Funzione che riceve la giacenza, impegnato e ordinato di un articolo e ne
// calcola la disponibilità in base anche al metodo scelto.
// NB: CI sono 2 metodi, 1 che è GIACENZA - IMPEGNATO e l'altro che è
// GIACENZA + ORDINATO - IMPEGNATO.
function TDM1.CalcolaDisponibile(Giacenza, Impegnato, Ordinato: Double): Double;
begin
  Result := Giacenza - Impegnato;
  if TableProgressiviMAG_ORDINATONELDISPONIBILE.AsBoolean then
    Result := Result + Ordinato;
end;

// Procedura che ritorna nelle rispettive variabili passate per riferimento
// la GIACENZA, IMPEGNATO, ORDINATO, DISPONIBILITA dell'articolo-
procedure TDM1.GetDatiMagazzinoArticolo(CodArt: String; CodMag: Integer; var Giacenza: Double; var Impegnato: Double; var Ordinato: Double;
  var Disponibile: Double; var PuntoRiordino: Double; var ScortaMinima: Double; var LottoRiordino: Double);
var
  Q: TIB_Cursor;
begin
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Imposta la query per il reperimento dei dati
    Q.SQL.Add('SELECT COALESCE(A.PUNTORIORDINO,0) AS PUNTORIORDINO, COALESCE(A.SCORTAMINIMA,0) AS SCORTAMINIMA, COALESCE(A.LOTTORIORDINO,0) AS LOTTORIORDINO,');
    Q.SQL.Add('  (SELECT COALESCE(MAG.OUT_GIACENZA,0)   FROM MAG_GET_GIACENZE(' + QuotedStr(CodArt) + ', ' + IntToStr(CodMag) +
      ', ''01/01/2900'', ''T'', ''T'') MAG) AS GIACENZA,');
    Q.SQL.Add('  (SELECT COALESCE(MAG.OUT_IMPEGNATO,0)  FROM MAG_GET_GIACENZE(' + QuotedStr(CodArt) + ', ' + IntToStr(CodMag) +
      ', ''01/01/2900'', ''T'', ''T'') MAG) AS IMPEGNATO,');
    Q.SQL.Add('  (SELECT COALESCE(MAG.OUT_ORDINATO,0)   FROM MAG_GET_GIACENZE(' + QuotedStr(CodArt) + ', ' + IntToStr(CodMag) +
      ', ''01/01/2900'', ''T'', ''T'') MAG) AS ORDINATO');
    Q.SQL.Add('FROM ARTICOLI A');
    Q.SQL.Add('WHERE A.CODICEARTICOLO = ' + QuotedStr(CodArt));
    Q.Open;
    // Carica i risultati nelle variabili
    PuntoRiordino := Q.FieldByName('PUNTORIORDINO').AsFloat;
    ScortaMinima := Q.FieldByName('SCORTAMINIMA').AsFloat;
    LottoRiordino := Q.FieldByName('LOTTORIORDINO').AsFloat;
    Giacenza := Q.FieldByName('GIACENZA').AsFloat;
    Impegnato := Q.FieldByName('IMPEGNATO').AsFloat;
    Ordinato := Q.FieldByName('ORDINATO').AsFloat;
    Disponibile := Giacenza - Impegnato;
    // Chiuse tutto
    Q.Close;
  finally
    // Pulizie finali
    Q.Free;
  end;
end;

// Funzione che verifica se il documento con la data ricevuta come parametro è antecedente
// all'ultima, nel qual caso ritorna False.
// Procedura che ricopia i dati Partita IVA, PID e  Codice di attivazione
// nel file Param.ini in modo che possa leggerli anche il Guardian in modo che
// possa scaricare la pagina delle comunicazioni corretta.
procedure TDM1.CopiaCodiciAttivazionePerGuardian;
var
  P: TMemIniFile;
begin
  P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
  try
    // Se il codice di attivazione attuale è valido copia i dati di attivazione
    // nel file Param.ini altimenti niente.
    if DM1.VerificaCodiceAttivazioneTeletrasporto then
    begin
      P.WriteString('ActivationKey', 'PartitaIVA', TableDatiAziendaP_IVA.AsString);
      P.WriteString('ActivationKey', 'PID', TableDatiAziendaCA_PID.AsString);
      P.WriteString('ActivationKey', 'CodiceAttivazione', TableDatiAziendaCA_CODICEATTIVAZIONE.AsString);
      P.UpdateFile;
    end;
  finally
    P.Free;
  end;
end;

// Funzione che ritorna True se il codice di attivazione del teletrasporto
// è corretto e cioè coincide con la cifratura del PID e della Partita IVA
// dell'azienda attualmente inseriti, il PID viene usato anche per costruire
// il nome del file Anagrafica Articoli da scaricare per l'aggiornamento
// del listino.
// NB: Se siamo in modalità Levante Light il controllo di validità del codice di attivazione
// con i dati appositi di questa modalità
function TDM1.VerificaCodiceAttivazioneTeletrasporto: Boolean;
begin
  if MainForm.IsLevanteLight then
  begin
    Result := VerifyString_XOR(Uppercase(Trim(MainForm.StartFrame.EditPID.Text) + Trim(MainForm.StartFrame.EditPIVA.Text)),
      Trim(MainForm.StartFrame.EditCodiceAttivazione.Text));
  end
  else
  begin
    Result := VerifyString_XOR(Uppercase(Trim(TableDatiAziendaCA_PID.AsString) + Trim(TableDatiAziendaP_IVA.AsString)),
      Trim(TableDatiAziendaCA_CODICEATTIVAZIONE.AsString));
  end;
end;


// =============================================================================
// INIZIO PARTE DI POST ELABORAZIONE DOPO IL CARICAMENTO DEL LISTINO DEL GRUPPO ARCOBALENO
// -----------------------------------------------------------------------------

// Funzione che ritorna il carattere di controlle per il codice a barre EAN13
function TDM1.GruppoArco_CalcolaCarattereControlloEAN13(Codice: String): String;
var
  SumPari, SumDispari, SumAll, DecinaSuperiore, Checksum: Integer;
begin
  Result := '';
  SumPari := StrToInt(Codice[2]) + StrToInt(Codice[4]) + StrToInt(Codice[6]) + StrToInt(Codice[8]) + StrToInt(Codice[10]) + StrToInt(Codice[12]);
  SumPari := SumPari * 3;
  SumDispari := StrToInt(Codice[1]) + StrToInt(Codice[3]) + StrToInt(Codice[5]) + StrToInt(Codice[7]) + StrToInt(Codice[9]) + StrToInt(Codice[11]);
  SumAll := SumPari + SumDispari;
  DecinaSuperiore := (Trunc(SumAll / 10) + 1) * 10;
  Checksum := DecinaSuperiore - SumAll;
  Result := Codice + RightStr(IntToStr(Checksum), 1);
end;

procedure TDM1.GruppoArco_CalcolaBarcode;
var
  CurrCodArt: String;
  NumCicli, NotifyCount: Integer;
begin
  // Inizializzazione
  NumCicli := 1;
  NotifyCount := 1;
  // Per prima cosa apre la query che conterrà l'elenco degli articoli del gruppo arcobaleno
  // appena importati
  if QryGruppoArcoListaArticoli.Active then
    QryGruppoArcoListaArticoli.Close;
  if not QryGruppoArcoListaArticoli.Prepared then
    QryGruppoArcoListaArticoli.Prepare;
  QryGruppoArcoListaArticoli.Open;
  try
    DBAzienda.StartTransaction;
    try
      // Cicla per tutti gli articoli
      while not QryGruppoArcoListaArticoli.Eof do
      begin
        // Aggiorna lo schermo
        if NotifyCount >= 133 then
        begin
          DM1.ShowWait('', 'Calcolo codice a barre - Articolo N° ' + IntToStr(NumCicli));
          NotifyCount := 0;
        end;
        // Punta al CodiceArticolo corrente
        CurrCodArt := QryGruppoArcoListaArticoli.Fields[0].AsString;
        // Imposta il codice a barre dell'articolo
        if not QryGruppoArcoGeneraBarcode.Prepared then
          QryGruppoArcoGeneraBarcode.Prepare;
        QryGruppoArcoGeneraBarcode.ParamByName('P_CODICEARTICOLO').AsString := CurrCodArt;
        QryGruppoArcoGeneraBarcode.ParamByName('P_BARCODE').AsString := DM1.GruppoArco_CalcolaCarattereControlloEAN13('200000' + PadR(CurrCodArt, '0', 6));
        QryGruppoArcoGeneraBarcode.ExecSQL;
        // Avanti il prossimo
        Inc(NumCicli);
        Inc(NotifyCount);
        QryGruppoArcoListaArticoli.Next;
      end;
      DBAzienda.Commit;
    except
      DBAzienda.Rollback;
    end;
  finally
    QryGruppoArcoListaArticoli.Close;
  end;
end;

// Procedura che inserisce o aggiorna un gruppo controllando prima se esiste già oppure no.
procedure TDM1.GruppoArco_CaricaGruppo(Cod1, Cod2: Integer; Desc: String);
begin
  // Se esiste già il gruppo lo aggiorna
  if GruppoArco_GroupPresent(Cod1, Cod2) then
  begin
    with QryGruppoArcoUpdateGruppo do
    begin
      if not Prepared then
        Prepare;
      ParamByName('P_CODICE1').AsInteger := Cod1;
      ParamByName('P_CODICE2').AsInteger := Cod2;
      ParamByName('P_DESCRIZIONE').AsString := Desc;
      ExecSQL;
    end;
    // Se invece il gruppo non esiste lo crea nuovo
  end
  else
  begin
    with QryGruppoArcoInsertGruppo do
    begin
      if not Prepared then
        Prepare;
      ParamByName('P_CODICE1').AsInteger := Cod1;
      ParamByName('P_CODICE2').AsInteger := Cod2;
      ParamByName('P_DESCRIZIONE').AsString := Desc;
      ExecSQL;
    end;
  end;
end;

// =============================================================================
// INIZIO - Parte che ricalcola i codici di gruppi e sottogruppi perchè dal gruppo
// arcobaleno ci arrivano con codici alfanumerici e noi invece li abbiamo come
// codici numerici.
// -----------------------------------------------------------------------------
// Procedura che elimina eventuali residui di gruppi e sottogruppi di importazioni
// precedenti.
procedure TDM1.ListinoNettoGruppoArco_EliminaGruppiArco;
var
  Q: TIB_Cursor;
begin
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('DELETE FROM GRUPPI WHERE JOLLY10 = ''ARCO''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Procedura azzera tutti gli articoli e viene usato per radere al suolo tutti
// gli articoli SONO SU MINILEVANTE
procedure TDM1.ListinoNettoGruppoArco_EliminaArticoli;
var
  Q: TIB_Cursor;
begin
  // Se non siamo in modalità LevanteLight esce subito
  if not MainForm.IsLevanteLight then
    Exit;
  // Prosegue
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('DELETE FROM ARTICOLI WHERE JOLLY10 = ''ARCO''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Questa procedura  converte i codici gruppo e sottogruppe provenienti dal listino del gruppo
// arcobaleno che sono alfanumerici di 4 caretteri in codici solo numerici adatti a levante.
// per fare questo converte ogni carattere nel rispettivo codice ascii e gli sottrae il numero 32 (codice ascii dello spazio)
// in questo modo il codice occupera un numero con 8 cifre + una prima cifra fissa a 9
// e quindi in tutto 9 cifre di cui la prima a sx sempre fissa a 9.
procedure TDM1.ListinoNettoGruppoArco_ConvertiCodiciGruppi;
var
  Q, QUpd: TIB_Cursor;
  SourceCode1, SourceCode2, SourceCode3, DestCode1, DestCode2, DestCode3: String;
  i, NumCicli, NotifyCount: Integer;
begin
  // Inizializzazione
  NumCicli := 1;
  NotifyCount := 1;
  Q := TIB_Cursor.Create(Self);
  QUpd := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà l'elenco degli articoli
    // appena importati del Gruppo Arcobaleno da elaborare
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    QUpd.DatabaseName := DM1.ArcDBFile;
    QUpd.IB_Connection := DM1.DBAzienda;
    // Impostazione query per update gruppi con codici elaborati
    QUpd.SQL.Add('UPDATE GRUPPI SET');
    QUpd.SQL.Add('CODICE1 = :P_NEWCODICE1,');
    QUpd.SQL.Add('CODICE2 = :P_NEWCODICE2,');
    QUpd.SQL.Add('CODICE3 = :P_NEWCODICE3,');
    QUpd.SQL.Add('CODICE4 = :P_NEWCODICE4,');
    QUpd.SQL.Add('CODICE5 = :P_NEWCODICE5,');
    QUpd.SQL.Add('CODICE6 = :P_NEWCODICE6,');
    QUpd.SQL.Add('FLAGAPPENAIMPORTATO = ''F''');
    QUpd.SQL.Add('WHERE CODICE1 = :P_OLDCODICE1');
    QUpd.SQL.Add('  AND CODICE2 = :P_OLDCODICE2');
    QUpd.SQL.Add('  AND CODICE3 = :P_OLDCODICE3');
    QUpd.SQL.Add('  AND CODICE4 = :P_OLDCODICE4');
    QUpd.SQL.Add('  AND CODICE5 = :P_OLDCODICE5');
    QUpd.SQL.Add('  AND CODICE6 = :P_OLDCODICE6');
    // Impostazione codice SQL per prelevamento elenco gruppi da elaborare
    Q.SQL.Add(
      'SELECT CODICE1, CODICE2, CODICE3, CODICE4, CODICE5, CODICE6, JOLLY6, JOLLY7, JOLLY8 FROM GRUPPI A WHERE JOLLY10 = ''ARCO'' AND FLAGAPPENAIMPORTATO = ''A'' AND CODICE1<=1000');
    Q.Open;
    DBAzienda.StartTransaction;
    try
      // Cicla per tutti gli articoli per cui elaborare i gruppi, sottogruppi
      while not Q.Eof do
      begin
        // Aggiorna lo schermo
        if NotifyCount >= 13 then
        begin
          DM1.ShowWait('', 'Elaborazione record N° ' + IntToStr(NumCicli));
          NotifyCount := 0;
        end;
        // Carica il codice da elaborare in una variabile locale per comodità
        SourceCode1 := Q.FieldByName('JOLLY6').AsString;
        SourceCode2 := Q.FieldByName('JOLLY7').AsString;
        SourceCode3 := Q.FieldByName('JOLLY8').AsString;
        // Fa in modo che sia lungo sempre 4 caretteri aggiungendo eventualmente degli spazi
        // vuoti se necessario
        SourceCode1 := PadL(SourceCode1, ' ', 4);
        SourceCode2 := PadL(SourceCode2, ' ', 4);
        SourceCode3 := PadL(SourceCode3, ' ', 4);
        // Converte i codici nella loro rappresentazione esadecimale
        DestCode1 := '9';
        DestCode2 := '9';
        DestCode3 := '9';
        for i := 1 to Length(SourceCode1) do
        begin
          DestCode1 := DestCode1 + PadR(IntToStr(Ord(SourceCode1[i]) - 32), '0', 2);
          DestCode2 := DestCode2 + PadR(IntToStr(Ord(SourceCode2[i]) - 32), '0', 2);
          DestCode3 := DestCode3 + PadR(IntToStr(Ord(SourceCode3[i]) - 32), '0', 2);
        end;
        // Effettua l'Update del gruppo corrente
        if not QUpd.Prepared then
          QUpd.Prepare;
        if Trim(SourceCode1) = '' then
          QUpd.Params.ParamByName('P_NEWCODICE1').AsInteger := -1
        else
          QUpd.Params.ParamByName('P_NEWCODICE1').AsInteger := StrToInt(DestCode1);
        if Trim(SourceCode2) = '' then
          QUpd.Params.ParamByName('P_NEWCODICE2').AsInteger := -1
        else
          QUpd.Params.ParamByName('P_NEWCODICE2').AsInteger := StrToInt(DestCode2);
        if Trim(SourceCode3) = '' then
          QUpd.Params.ParamByName('P_NEWCODICE3').AsInteger := -1
        else
          QUpd.Params.ParamByName('P_NEWCODICE3').AsInteger := StrToInt(DestCode3);
        QUpd.Params.ParamByName('P_NEWCODICE4').AsInteger := -1;
        QUpd.Params.ParamByName('P_NEWCODICE5').AsInteger := -1;
        QUpd.Params.ParamByName('P_NEWCODICE6').AsInteger := -1;
        QUpd.Params.ParamByName('P_OLDCODICE1').AsInteger := Q.FieldByName('CODICE1').Value;
        QUpd.Params.ParamByName('P_OLDCODICE2').AsInteger := Q.FieldByName('CODICE2').Value;
        QUpd.Params.ParamByName('P_OLDCODICE3').AsInteger := Q.FieldByName('CODICE3').Value;
        QUpd.Params.ParamByName('P_OLDCODICE4').AsInteger := Q.FieldByName('CODICE4').Value;
        QUpd.Params.ParamByName('P_OLDCODICE5').AsInteger := Q.FieldByName('CODICE5').Value;
        QUpd.Params.ParamByName('P_OLDCODICE6').AsInteger := Q.FieldByName('CODICE6').Value;
        QUpd.ExecSQL;
        // Avanti il prossimo
        Inc(NumCicli);
        Inc(NotifyCount);
        Q.Next;
      end;
      DBAzienda.Commit;
    except
      DBAzienda.Rollback;
    end;
  finally
    Q.Free;
  end;
end;

procedure TDM1.ListinoNettoGruppoArco_ConvertiCodiciGruppiArticoli;
var
  Q, QUpd: TIB_Cursor;
  SourceCode1, SourceCode2, SourceCode3, DestCode1, DestCode2, DestCode3: String;
  i, NumCicli, NotifyCount: Integer;
begin
  // Inizializzazione
  NumCicli := 1;
  NotifyCount := 1;
  Q := TIB_Cursor.Create(Self);
  QUpd := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà l'elenco degli articoli
    // appena importati del Gruppo Arcobaleno da elaborare
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    QUpd.DatabaseName := DM1.ArcDBFile;
    QUpd.IB_Connection := DM1.DBAzienda;
    // Impostazione query per update gruppi con codici elaborati
    QUpd.SQL.Add('UPDATE ARTICOLI SET');
    QUpd.SQL.Add('CODICEGRUPPO1 = :P_NEWCODICE1,');
    QUpd.SQL.Add('CODICEGRUPPO2 = :P_NEWCODICE2,');
    QUpd.SQL.Add('CODICEGRUPPO3 = :P_NEWCODICE3,');
    QUpd.SQL.Add('CODICEGRUPPO4 = :P_NEWCODICE4,');
    QUpd.SQL.Add('CODICEGRUPPO5 = :P_NEWCODICE5,');
    QUpd.SQL.Add('CODICEGRUPPO6 = :P_NEWCODICE6');
    QUpd.SQL.Add('WHERE CODICEARTICOLO = :P_CODICEARTICOLO');
    // Impostazione codice SQL per prelevamento elenco gruppi da elaborare
    Q.SQL.Add('SELECT CODICEARTICOLO, JOLLY6, JOLLY7, JOLLY8 FROM ARTICOLI WHERE JOLLY10 = ''ARCO'' AND FLAGAPPENAIMPORTATO = ''A''');
    Q.Open;
    DBAzienda.StartTransaction;
    try
      // Cicla per tutti gli articoli per cui elaborare i gruppi, sottogruppi
      while not Q.Eof do
      begin
        // Aggiorna lo schermo
        if NotifyCount >= 13 then
        begin
          DM1.ShowWait('', 'Elaborazione record N° ' + IntToStr(NumCicli));
          NotifyCount := 0;
        end;
        // Carica il codice da elaborare in una variabile locale per comodità
        SourceCode1 := Q.FieldByName('JOLLY6').AsString;
        SourceCode2 := Q.FieldByName('JOLLY7').AsString;
        SourceCode3 := Q.FieldByName('JOLLY8').AsString;
        // Fa in modo che sia lungo sempre 4 caretteri aggiungendo eventualmente degli spazi
        // vuoti se necessario
        SourceCode1 := PadL(SourceCode1, ' ', 4);
        SourceCode2 := PadL(SourceCode2, ' ', 4);
        SourceCode3 := PadL(SourceCode3, ' ', 4);
        // Converte i codici nella loro rappresentazione esadecimale
        DestCode1 := '9';
        DestCode2 := '9';
        DestCode3 := '9';
        for i := 1 to Length(SourceCode1) do
        begin
          DestCode1 := DestCode1 + PadR(IntToStr(Ord(SourceCode1[i]) - 32), '0', 2);
          DestCode2 := DestCode2 + PadR(IntToStr(Ord(SourceCode2[i]) - 32), '0', 2);
          DestCode3 := DestCode3 + PadR(IntToStr(Ord(SourceCode3[i]) - 32), '0', 2);
        end;
        // Effettua l'Update del gruppo corrente
        if not QUpd.Prepared then
          QUpd.Prepare;
        if Trim(SourceCode1) = '' then
          QUpd.Params.ParamByName('P_NEWCODICE1').Clear
        else
          QUpd.Params.ParamByName('P_NEWCODICE1').AsInteger := StrToInt(DestCode1);
        if Trim(SourceCode2) = '' then
          QUpd.Params.ParamByName('P_NEWCODICE2').Clear
        else
          QUpd.Params.ParamByName('P_NEWCODICE2').AsInteger := StrToInt(DestCode2);
        if Trim(SourceCode3) = '' then
          QUpd.Params.ParamByName('P_NEWCODICE3').Clear
        else
          QUpd.Params.ParamByName('P_NEWCODICE3').AsInteger := StrToInt(DestCode3);
        QUpd.Params.ParamByName('P_NEWCODICE4').Clear;
        QUpd.Params.ParamByName('P_NEWCODICE5').Clear;
        QUpd.Params.ParamByName('P_NEWCODICE6').Clear;
        QUpd.Params.ParamByName('P_CODICEARTICOLO').AsString := Q.FieldByName('CODICEARTICOLO').AsString;
        QUpd.ExecSQL;
        // Avanti il prossimo
        Inc(NumCicli);
        Inc(NotifyCount);
        Q.Next;
      end;
      DBAzienda.Commit;
    except
      DBAzienda.Rollback;
    end;
  finally
    Q.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - Parte che ricalcola i codici di gruppi e sottogruppi perchè dal gruppo
// arcobaleno ci arrivano con codici alfanumerici e noi invece li abbiamo come
// codici numerici.
// =============================================================================

// Procedura che rileva se il gruppo con i codici specificati è già èresente oppure no
function TDM1.GruppoArco_GroupPresent(Cod1, Cod2: Integer): Boolean;
begin
  Result := False;
  if QryGruppoArcoGroupPresent.Active then
    QryGruppoArcoGroupPresent.Close;
  if not QryGruppoArcoGroupPresent.Prepared then
    QryGruppoArcoGroupPresent.Prepare;
  QryGruppoArcoGroupPresent.ParamByName('P_CODICE1').AsInteger := Cod1;
  QryGruppoArcoGroupPresent.ParamByName('P_CODICE2').AsInteger := Cod2;
  QryGruppoArcoGroupPresent.Open;
  Result := (QryGruppoArcoGroupPresent.Fields[0].AsInteger > 0);
end;

// Questa procedura  converte i codici gruppo e sottogruppe provenienti dal listino del gruppo
// arcobaleno che sono alfanumerici di 4 caretteri in codici solo numerici adatti a levante.
// per fare questo converte ogni carattere nel rispettivo codice ascii e gli sottrae il numero 32 (codice ascii dello spazio)
// in questo modo il codice occupera un numero con 8 cifre + una prima cifra fissa a 9
// e quindi in tutto 9 cifre di cui la prima a sx sempre fissa a 9.
procedure TDM1.GruppoArco_CopiaCodiciGruppi;
var
  Q: TIB_Cursor;
  CodArt, SourceCode1, SourceCode2, DestCode1, DestCode2: String;
  i, NumCicli, NotifyCount: Integer;
begin
  // Inizializzazione
  NumCicli := 1;
  NotifyCount := 1;
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che ricaverà l'elenco degli articoli
    // appena importati del Gruppo Arcobaleno da elaborare
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add(
      'SELECT A.CODICEARTICOLO, A.JOLLY6 AS CODICEGRUPPO1, A.JOLLY7 AS CODICEGRUPPO2 FROM ARTICOLI A WHERE A.JOLLY10 = ''ARCO'' AND A.FLAGAPPENAIMPORTATO = ''A''');
    Q.Open;
    DBAzienda.StartTransaction;
    try
      // Cicla per tutti gli articoli per cui elaborare i gruppi, sottogruppi
      while not Q.Eof do
      begin
        // Aggiorna lo schermo
        if NotifyCount >= 133 then
        begin
          DM1.ShowWait('', 'Conversione codice gruppi - Articolo N° ' + IntToStr(NumCicli));
          NotifyCount := 0;
        end;
        // Carica il codice da elaborare in una variabile locale per comodità
        CodArt := Q.Fields[0].AsString;
        SourceCode1 := Q.Fields[1].AsString;
        SourceCode2 := Q.Fields[2].AsString;
        // Fa in modo che sia lungo sempre 4 caretteri aggiungendo eventualmente degli spazi
        // vuoti se necessario
        SourceCode1 := PadL(SourceCode1, ' ', 4);
        SourceCode2 := PadL(SourceCode2, ' ', 4);
        // Converte i codici nella loro rappresentazione esadecimale
        DestCode1 := '9';
        DestCode2 := '9';
        for i := 1 to Length(SourceCode1) do
        begin
          DestCode1 := DestCode1 + PadR(IntToStr(Ord(SourceCode1[i]) - 32), '0', 2);
          DestCode2 := DestCode2 + PadR(IntToStr(Ord(SourceCode2[i]) - 32), '0', 2);
        end;
        // Imposta la query che scriverà i gruppi, sottogruppi nell'articolo corrente
        with QryGruppoArcoCopiaGruppiDaJolly do
        begin
          if not Prepared then
            Prepare;
          Params.ParamByName('P_CODICEARTICOLO').AsString := CodArt;
          if Trim(SourceCode1) = '' then
            Params.ParamByName('P_CODICEGRUPPO1').Clear
          else
            Params.ParamByName('P_CODICEGRUPPO1').AsInteger := StrToInt(DestCode1);
          if Trim(SourceCode2) = '' then
            Params.ParamByName('P_CODICEGRUPPO2').Clear
          else
            Params.ParamByName('P_CODICEGRUPPO2').AsInteger := StrToInt(DestCode2);
          ExecSQL;
        end;
        // Avanti il prossimo
        Inc(NumCicli);
        Inc(NotifyCount);
        Q.Next;
      end;
      DBAzienda.Commit;
    except
      DBAzienda.Rollback;
    end;
  finally
    Q.Free;
  end;
end;

// Procedura che effettua il controllo ed eventualmente crea i gruppi/sottogruppi
// relativi agli articoli appena importati dal gruppo arcobaleno.
procedure TDM1.GruppoArco_ControllaGruppiSottogruppi;
var
  GruppoCorrente, SottogruppoCorrente, PrecGruppo, NumCicli, NotifyCount: Integer;
begin
  // Inizializzazione
  PrecGruppo := -1;
  NumCicli := 1;
  NotifyCount := 1;
  // Imposta la query che contiene l'elenco dei gruppi/sottogruppi (DISTINCT) ordinata
  // per CodiceGruppo1 + CodiceGruppo2.
  if QryGruppoArcoGruppi.Active then
    QryGruppoArcoGruppi.Close;
  QryGruppoArcoGruppi.Open;
  try
    DBAzienda.StartTransaction;
    try
      // Cicla per tutti i righi della query
      while not QryGruppoArcoGruppi.Eof do
      begin
        // Aggiorna lo schermo
        if NotifyCount >= 133 then
        begin
          DM1.ShowWait('', 'Controllo/Creazione gruppi - Articolo N° ' + IntToStr(NumCicli));
          NotifyCount := 0;
        end;
        // Carica i valori in variabili locali per comodità
        if QryGruppoArcoGruppi.FieldByName('CODICEGRUPPO1').IsNull then
          GruppoCorrente := -1
        else
          GruppoCorrente := QryGruppoArcoGruppi.FieldByName('CODICEGRUPPO1').AsInteger;
        if QryGruppoArcoGruppi.FieldByName('CODICEGRUPPO2').IsNull then
          SottogruppoCorrente := -1
        else
          SottogruppoCorrente := QryGruppoArcoGruppi.FieldByName('CODICEGRUPPO2').AsInteger;
        // Solo se il gruppo corrente <> -1 (cioè se non è nullo)
        if GruppoCorrente <> -1 then
        begin
          // Se il Gruppo attuale è diverso da quello del record precedente (interruzione) provvede
          // a caricarlo.
          if GruppoCorrente <> PrecGruppo then
          begin
            // Carica il Gruppo negli archivi dei gruppi di Levante.
            GruppoArco_CaricaGruppo(GruppoCorrente, -1, QryGruppoArcoGruppi.FieldByName('DESCGRUPPO1').AsString);
            // Memorizza il Gruppo Attuale nella variabile che contiene il Gruppo precedente
            PrecGruppo := GruppoCorrente;
          end;
          // Carica il Sottogruppo negli archivi di Levante
          // NB: Se il sotogruppo non è nullo
          if SottogruppoCorrente <> -1 then
            GruppoArco_CaricaGruppo(GruppoCorrente, SottogruppoCorrente, QryGruppoArcoGruppi.FieldByName('DESCGRUPPO2').AsString);
        end;
        // Avanti il prossimo
        Inc(NumCicli);
        Inc(NotifyCount);
        QryGruppoArcoGruppi.Next;
      end;
      DBAzienda.Commit;
    except
      DBAzienda.Rollback;
    end;
  finally
    QryGruppoArcoGruppi.Close;
  end;
end;

// Procedura che  ricalcola il prezzo di acquisto netto e i listini di vendita
// dopo il caricamento del file anagrafica del listino del Gruppo Arcobaleno.
procedure TDM1.GruppoArco_RicalcolaDopoCaricamentoAnagrafica;
begin
  // Richiama questa procedura che imposta gli sconti e ricalcola i listini per gli articoli appena importati
  ProgressiviForm.ImpostaScontiDiAcquistoDaConsiderare((DM1.TableProgressiviBCL_CONSIDERA_SC1.AsString = 'T'),
    (DM1.TableProgressiviBCL_CONSIDERA_SC2.AsString = 'T'), (DM1.TableProgressiviBCL_CONSIDERA_SC3.AsString = 'T'), True);
  // Esegue la query che imposta il flag FLAGAPPENAIMPORTATI = 'F' per indicare che l'importazione è terminata
  DM1.ShowWait('', 'Impostazione fine operazione.');
  if not QryGruppoArcoSetImportazioneTerminata.Prepared then
    QryGruppoArcoSetImportazioneTerminata.Prepare;
  QryGruppoArcoSetImportazioneTerminata.ExecSQL;
end;

// -----------------------------------------------------------------------------
// FINE PARTE DI POST ELABORAZIONE DOPO IL CARICAMENTO DEL LISTINO DEL GRUPPO ARCOBALENO
// =============================================================================

{ procedure TDM1.EseguiQueryCalcolaListini(R1,R2,R3,R4:Integer);
  var
  Q:TIB_Cursor;
  begin
  // Visualizza la form dei messaggi
  DM1.ShowWait('Levante', 'Ricalcolo listini.');
  Q := TIB_Cursor.Create(Self);
  try
  Q.DatabaseName := DM1.ArcDBFile;
  Q.IB_Connection := DM1.DBAzienda;
  Q.SQL.Add('UPDATE ARTICOLI SET');
  Q.SQL.Add('PREZZODIVENDITA  = ULTIMOPRZACQUISTO + (ULTIMOPRZACQUISTO * ' + IntToStr(R1) + ' / 100),');
  Q.SQL.Add('PREZZODIVENDITA2 = ULTIMOPRZACQUISTO + (ULTIMOPRZACQUISTO * ' + IntToStr(R2) + ' / 100),');
  Q.SQL.Add('PREZZODIVENDITA3 = ULTIMOPRZACQUISTO + (ULTIMOPRZACQUISTO * ' + IntToStr(R3) + ' / 100),');
  Q.SQL.Add('PREZZODIVENDITA4 = ULTIMOPRZACQUISTO + (ULTIMOPRZACQUISTO * ' + IntToStr(R4) + ' / 100),');
  Q.SQL.Add('PRZVENDIVACOMP1 = PREZZODIVENDITA  * 1.2,');
  Q.SQL.Add('PRZVENDIVACOMP2 = PREZZODIVENDITA2 * 1.2,');
  Q.SQL.Add('PRZVENDIVACOMP3 = PREZZODIVENDITA3 * 1.2,');
  Q.SQL.Add('PRZVENDIVACOMP4 = PREZZODIVENDITA4 * 1.2,');
  Q.SQL.Add('RICARICO  = ' + IntToStr(R1) + ',');
  Q.SQL.Add('RICARICO2 = ' + IntToStr(R2) + ',');
  Q.SQL.Add('RICARICO3 = ' + IntToStr(R3) + ',');
  Q.SQL.Add('RICARICO4 = ' + IntToStr(R4) + ',');
  Q.SQL.Add('IMPORTORICARICO  = PREZZODIVENDITA  - ULTIMOPRZACQUISTO,');
  Q.SQL.Add('IMPORTORICARICO2 = PREZZODIVENDITA2 - ULTIMOPRZACQUISTO,');
  Q.SQL.Add('IMPORTORICARICO3 = PREZZODIVENDITA3 - ULTIMOPRZACQUISTO,');
  Q.SQL.Add('IMPORTORICARICO4 = PREZZODIVENDITA4 - ULTIMOPRZACQUISTO,');
  Q.SQL.Add('SINCHRO = ''M''');
  Q.SQL.Add('WHERE SINCHRO = ''U''');
  // Esegue la query
  Q.ExecSQL;
  finally

  DM1.CloseWait;
  Q.Free;
  end;
  end;
}

// Procedura che ricalcola i listini di vendita in base ai ricarichi specificati
// per fasce di prezzo se questa funzione è abilitata, altrimenti per ricarichi normali.
procedure TDM1.EseguiQueryCalcolaListini(SoloArticoliAppenaImportati: Boolean = False);
var
  AlreadyInTransaction, CalcoloListinoVenditaPerSconti: Boolean;
  Qry, Qry2: TIB_Cursor;
  TotalCount, PartialCount: Integer;
  R1, R2, R3, R4, S1, S2, S3, S4, ImportoRicarico1, ImportoRicarico2, ImportoRicarico3, ImportoRicarico4, PrezzoDiVendita1, PrezzoDiVendita2, PrezzoDiVendita3,
    PrezzoDiVendita4, PrzVendIvaComp1, PrzVendIvaComp2, PrzVendIvaComp3, PrzVendIvaComp4, PrezzoDiListino, UltimoPrzAcquisto, AliquotaIVA, CostoReale: Double;
begin
  try
    DM1.ShowWait('', 'Inizializzazione...');

    // Inizializzazione
    AlreadyInTransaction := DM1.DBAzienda.InTransaction;
    R1 := 0;
    R2 := 0;
    R3 := 0;
    R4 := 0;
    S1 := 0;
    S2 := 0;
    S3 := 0;
    S4 := 0;
    TotalCount := 0;
    PartialCount := 0;
    Qry := TIB_Cursor.Create(Self);
    Qry2 := TIB_Cursor.Create(Self);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry2.DatabaseName := DM1.ArcDBFile;
    Qry2.IB_Connection := DM1.DBAzienda;

    // Se sono attivati i ricarichi per fasce di prezzo carica in memoria
    // le fasce di ricarico per prezzo di listino
    if DM1.RicarichiPerFasceDiPrezzo then
    begin
      CaricaFasceRicarichi;
    end;

    // Imposta la query che preleverà l'elenco degli articoli da aggiornare
    Qry.SQL.Add
      ('SELECT A.CODICEARTICOLO, A.PREZZODILISTINO, A.ULTIMOPRZACQUISTO, A.COSTOREALE, I.ALIQUOTAIVA, A.RICARICO, A.RICARICO2, A.RICARICO3, A.RICARICO4,');
    Qry.SQL.Add
      (' A.TIPOCALCOLOLISTINO, A.SCONTOLISTINO1, A.SCONTOLISTINO2, A.SCONTOLISTINO3, A.SCONTOLISTINO4 FROM ARTICOLI A LEFT JOIN ALIQIVA I ON(I.CODICEIVA = A.CODICEIVA)');
    if SoloArticoliAppenaImportati then
      Qry.SQL.Add('WHERE A.FLAGAPPENAIMPORTATO=''A''');

    // IMposta la query per l'UPDATE dell'articolo con i nuovi sconti
    Qry2.SQL.Add('UPDATE ARTICOLI SET');
    Qry2.SQL.Add(' TIPOCALCOLOLISTINO  = :P_TIPOCALCOLOLISTINO,');
    Qry2.SQL.Add(' RICARICO  = :P_RICARICO1,');
    Qry2.SQL.Add(' RICARICO2 = :P_RICARICO2,');
    Qry2.SQL.Add(' RICARICO3 = :P_RICARICO3,');
    Qry2.SQL.Add(' RICARICO4 = :P_RICARICO4,');
    Qry2.SQL.Add(' SCONTOLISTINO1  = :P_SCONTOLISTINO1,');
    Qry2.SQL.Add(' SCONTOLISTINO2  = :P_SCONTOLISTINO2,');
    Qry2.SQL.Add(' SCONTOLISTINO3  = :P_SCONTOLISTINO3,');
    Qry2.SQL.Add(' SCONTOLISTINO4  = :P_SCONTOLISTINO4,');
    Qry2.SQL.Add(' IMPORTORICARICO  = :P_IMPORTORICARICO1,');
    Qry2.SQL.Add(' IMPORTORICARICO2 = :P_IMPORTORICARICO2,');
    Qry2.SQL.Add(' IMPORTORICARICO3 = :P_IMPORTORICARICO3,');
    Qry2.SQL.Add(' IMPORTORICARICO4 = :P_IMPORTORICARICO4,');
    Qry2.SQL.Add(' PREZZODIVENDITA  = :P_PREZZODIVENDITA1,');
    Qry2.SQL.Add(' PREZZODIVENDITA2 = :P_PREZZODIVENDITA2,');
    Qry2.SQL.Add(' PREZZODIVENDITA3 = :P_PREZZODIVENDITA3,');
    Qry2.SQL.Add(' PREZZODIVENDITA4 = :P_PREZZODIVENDITA4,');
    Qry2.SQL.Add(' PRZVENDIVACOMP1 = :P_PRZVENDIVACOMP1,');
    Qry2.SQL.Add(' PRZVENDIVACOMP2 = :P_PRZVENDIVACOMP2,');
    Qry2.SQL.Add(' PRZVENDIVACOMP3 = :P_PRZVENDIVACOMP3,');
    Qry2.SQL.Add(' PRZVENDIVACOMP4 = :P_PRZVENDIVACOMP4');
    Qry2.SQL.Add('WHERE CODICEARTICOLO = :P_CODICEARTICOLO');

    // Avvio transazione
    if not AlreadyInTransaction then
      DM1.DBAzienda.StartTransaction;
    try
      // Apre l'elenco degli articoli e cicla per tutti gli articoli trovati per aggiornarli
      DM1.ShowWait('', 'Caricamento elenco articoli...');
      Qry.Open;
      while not Qry.Eof do
      begin
        // Incrementa i contatori
        Inc(TotalCount);
        Inc(PartialCount);
        if PartialCount >= 133 then
        begin
          PartialCount := 0;
          DM1.ShowWait('', 'Ricalcolo listini di vendita - Articolo N° ' + IntToStr(TotalCount));
        end;
        // Caricamento dati articolo
        PrezzoDiListino := Qry.FieldByName('PREZZODILISTINO').AsDouble;
        UltimoPrzAcquisto := Qry.FieldByName('ULTIMOPRZACQUISTO').AsDouble; // E' la base per il calcolo listini
        CostoReale := Qry.FieldByName('COSTOREALE').AsDouble;
        AliquotaIVA := Qry.FieldByName('ALIQUOTAIVA').AsDouble;
        // Se si tratta un nuovo articolo appena aggiunto (non di uno già presente e solo aggiornato) allora
        // imposta il metodo di calcolo dei listini di vendita (a ricarico o a sconti) in base a come
        // impostato nei parametri altrimenti usa il metodo già specificato nell'articolo stesso.
        // NB: Per determinare se si tratta di un articolo nuovo appena creato dall'importazione controlla
        // se il campo "Ricarico" IsNull.
        // NB: Non posso semplicemente controllare se il campo TIPOCALCOLOLISTINO dell'articolo è NULL per
        // determinare se è un articolo appena creato perchè questo campo ha un valore defaultizzato
        // a "D" direttamente dal DB
        if Qry.FieldByName('RICARICO').IsNull then
          CalcoloListinoVenditaPerSconti := (Uppercase(Trim(DM1.TableProgressiviTIPOCALCOLOLISTINIARTICOLI.AsString)) = 'S')
        else
          CalcoloListinoVenditaPerSconti := (Uppercase(Trim(Qry.FieldByName('TIPOCALCOLOLISTINO').AsString)) = 'S');

        // In base al tipo di calcolo dei listini di vendita esegue il calcolo corretto
        // Listini per ricarico
        if not CalcoloListinoVenditaPerSconti then
        begin
          // ===================================================================
          // CALCOLO CON METODO A RICARICHI SUL PREZZI DI ACQUISTO
          // -------------------------------------------------------------------
          // Se sono abilitati i ricarichi per fasce di prezzo utilizza i ricarichi relativi alla fascia di prezzo
          // opportuna, altirmenti usa i ricarichi fissi preimpostati.
          if DM1.RicarichiPerFasceDiPrezzo then
          begin
            R1 := DM1.GetRicaricoPerPrezzo(CostoReale, 1, False);
            R2 := DM1.GetRicaricoPerPrezzo(CostoReale, 2, False);
            R3 := DM1.GetRicaricoPerPrezzo(CostoReale, 3, False);
            R4 := DM1.GetRicaricoPerPrezzo(CostoReale, 4, False);
          end
          else
          begin
            R1 := DM1.TableProgressiviRICARICOLISTINO1.AsFloat;
            R2 := DM1.TableProgressiviRICARICOLISTINO2.AsFloat;
            R3 := DM1.TableProgressiviRICARICOLISTINO3.AsFloat;
            R4 := DM1.TableProgressiviRICARICOLISTINO4.AsFloat;
          end;
          // Se stiamo rielaborando degli articoli appena importati fa in modo che se ci sono
          // già dei ricarici specificati lascia quelli altrimenti imposta quelli di default
          if SoloArticoliAppenaImportati then
          begin
            if Qry.FieldByName('RICARICO').IsNotNull then
              R1 := Qry.FieldByName('RICARICO').AsDouble;
            if Qry.FieldByName('RICARICO2').IsNotNull then
              R2 := Qry.FieldByName('RICARICO2').AsDouble;
            if Qry.FieldByName('RICARICO3').IsNotNull then
              R3 := Qry.FieldByName('RICARICO3').AsDouble;
            if Qry.FieldByName('RICARICO4').IsNotNull then
              R4 := Qry.FieldByName('RICARICO4').AsDouble;
          end;
          // Calcola l'importo ricarico
          ImportoRicarico1 := DM1.Arrotonda(UltimoPrzAcquisto * R1 / 100, DM1.DecMicroPrz);
          ImportoRicarico2 := DM1.Arrotonda(UltimoPrzAcquisto * R2 / 100, DM1.DecMicroPrz);
          ImportoRicarico3 := DM1.Arrotonda(UltimoPrzAcquisto * R3 / 100, DM1.DecMicroPrz);
          ImportoRicarico4 := DM1.Arrotonda(UltimoPrzAcquisto * R4 / 100, DM1.DecMicroPrz);
          // Calcola il prezzo di vendita
          PrezzoDiVendita1 := DM1.Arrotonda(UltimoPrzAcquisto + ImportoRicarico1, DM1.DecMicroPrz);
          PrezzoDiVendita2 := DM1.Arrotonda(UltimoPrzAcquisto + ImportoRicarico2, DM1.DecMicroPrz);
          PrezzoDiVendita3 := DM1.Arrotonda(UltimoPrzAcquisto + ImportoRicarico3, DM1.DecMicroPrz);
          PrezzoDiVendita4 := DM1.Arrotonda(UltimoPrzAcquisto + ImportoRicarico4, DM1.DecMicroPrz);
          // Calcola il prezzo di vendita IVA compresa
          PrzVendIvaComp1 := DM1.Arrotonda(PrezzoDiVendita1 * (100 + AliquotaIVA) / 100, DM1.DecMicroPrz);
          PrzVendIvaComp2 := DM1.Arrotonda(PrezzoDiVendita2 * (100 + AliquotaIVA) / 100, DM1.DecMicroPrz);
          PrzVendIvaComp3 := DM1.Arrotonda(PrezzoDiVendita3 * (100 + AliquotaIVA) / 100, DM1.DecMicroPrz);
          PrzVendIvaComp4 := DM1.Arrotonda(PrezzoDiVendita4 * (100 + AliquotaIVA) / 100, DM1.DecMicroPrz);
          // ===================================================================
          // Listini per sconti
        end
        else
        begin
          // ===================================================================
          // CALCOLO CON METODO A SCONTI SUL PREZZO DI LISTINO
          // -------------------------------------------------------------------
          // Carica gli sconti dei listini di vendita di default
          S1 := DM1.TableProgressiviSCONTOLISTINO1.AsFloat;
          S2 := DM1.TableProgressiviSCONTOLISTINO2.AsFloat;
          S3 := DM1.TableProgressiviSCONTOLISTINO3.AsFloat;
          S4 := DM1.TableProgressiviSCONTOLISTINO4.AsFloat;
          // Se stiamo rielaborando degli articoli appena importati fa in modo che se ci sono
          // già dei ricarici specificati lascia quelli altrimenti imposta quelli di default
          if SoloArticoliAppenaImportati then
          begin
            if Qry.FieldByName('SCONTOLISTINO1').IsNotNull then
              S1 := Qry.FieldByName('SCONTOLISTINO1').AsDouble;
            if Qry.FieldByName('SCONTOLISTINO2').IsNotNull then
              S2 := Qry.FieldByName('SCONTOLISTINO2').AsDouble;
            if Qry.FieldByName('SCONTOLISTINO3').IsNotNull then
              S3 := Qry.FieldByName('SCONTOLISTINO3').AsDouble;
            if Qry.FieldByName('SCONTOLISTINO4').IsNotNull then
              S4 := Qry.FieldByName('SCONTOLISTINO4').AsDouble;
          end;
          // Calcola il prezzo di vendita
          PrezzoDiVendita1 := DM1.Arrotonda((PrezzoDiListino * (100 - S1) / 100), DM1.DecMicroPrz);
          PrezzoDiVendita2 := DM1.Arrotonda((PrezzoDiListino * (100 - S2) / 100), DM1.DecMicroPrz);
          PrezzoDiVendita3 := DM1.Arrotonda((PrezzoDiListino * (100 - S3) / 100), DM1.DecMicroPrz);
          PrezzoDiVendita4 := DM1.Arrotonda((PrezzoDiListino * (100 - S4) / 100), DM1.DecMicroPrz);
          // Calcola il prezzo di vendita IVA compresa
          PrzVendIvaComp1 := DM1.Arrotonda(PrezzoDiVendita1 * (100 + AliquotaIVA) / 100, DM1.DecMicroPrz);
          PrzVendIvaComp2 := DM1.Arrotonda(PrezzoDiVendita2 * (100 + AliquotaIVA) / 100, DM1.DecMicroPrz);
          PrzVendIvaComp3 := DM1.Arrotonda(PrezzoDiVendita3 * (100 + AliquotaIVA) / 100, DM1.DecMicroPrz);
          PrzVendIvaComp4 := DM1.Arrotonda(PrezzoDiVendita4 * (100 + AliquotaIVA) / 100, DM1.DecMicroPrz);
          // Calcola l'importo ricarico
          ImportoRicarico1 := DM1.Arrotonda((PrezzoDiVendita1 - UltimoPrzAcquisto), DM1.DecMicroPrz);
          ImportoRicarico2 := DM1.Arrotonda((PrezzoDiVendita2 - UltimoPrzAcquisto), DM1.DecMicroPrz);
          ImportoRicarico3 := DM1.Arrotonda((PrezzoDiVendita3 - UltimoPrzAcquisto), DM1.DecMicroPrz);
          ImportoRicarico4 := DM1.Arrotonda((PrezzoDiVendita4 - UltimoPrzAcquisto), DM1.DecMicroPrz);
          // ===================================================================
        end;

        // Aggiorna l'articolo con i dati ricavati
        if not Qry2.Prepared then
          Qry2.Prepare;
        Qry2.Params.ParamByName('P_CODICEARTICOLO').AsString := Qry.FieldByName('CODICEARTICOLO').AsString;
        if CalcoloListinoVenditaPerSconti then
          Qry2.Params.ParamByName('P_TIPOCALCOLOLISTINO').AsString := 'S'
        else
          Qry2.Params.ParamByName('P_TIPOCALCOLOLISTINO').AsString := 'R';
        Qry2.Params.ParamByName('P_RICARICO1').AsDouble := R1;
        Qry2.Params.ParamByName('P_RICARICO2').AsDouble := R2;
        Qry2.Params.ParamByName('P_RICARICO3').AsDouble := R3;
        Qry2.Params.ParamByName('P_RICARICO4').AsDouble := R4;
        Qry2.Params.ParamByName('P_SCONTOLISTINO1').AsDouble := S1;
        Qry2.Params.ParamByName('P_SCONTOLISTINO2').AsDouble := S2;
        Qry2.Params.ParamByName('P_SCONTOLISTINO3').AsDouble := S3;
        Qry2.Params.ParamByName('P_SCONTOLISTINO4').AsDouble := S4;
        Qry2.Params.ParamByName('P_IMPORTORICARICO1').AsDouble := ImportoRicarico1;
        Qry2.Params.ParamByName('P_IMPORTORICARICO2').AsDouble := ImportoRicarico2;
        Qry2.Params.ParamByName('P_IMPORTORICARICO3').AsDouble := ImportoRicarico3;
        Qry2.Params.ParamByName('P_IMPORTORICARICO4').AsDouble := ImportoRicarico4;
        Qry2.Params.ParamByName('P_PREZZODIVENDITA1').AsDouble := PrezzoDiVendita1;
        Qry2.Params.ParamByName('P_PREZZODIVENDITA2').AsDouble := PrezzoDiVendita2;
        Qry2.Params.ParamByName('P_PREZZODIVENDITA3').AsDouble := PrezzoDiVendita3;
        Qry2.Params.ParamByName('P_PREZZODIVENDITA4').AsDouble := PrezzoDiVendita4;
        Qry2.Params.ParamByName('P_PRZVENDIVACOMP1').AsDouble := PrzVendIvaComp1;
        Qry2.Params.ParamByName('P_PRZVENDIVACOMP2').AsDouble := PrzVendIvaComp2;
        Qry2.Params.ParamByName('P_PRZVENDIVACOMP3').AsDouble := PrzVendIvaComp3;
        Qry2.Params.ParamByName('P_PRZVENDIVACOMP4').AsDouble := PrzVendIvaComp4;
        Qry2.ExecSQL;
        // Passa al prox articolo
        Qry.Next;
      end;
      // Conferma la transazione
      if not AlreadyInTransaction then
        DM1.DBAzienda.Commit;
    except
      // Annulla la transazione
      if not AlreadyInTransaction then
        DM1.DBAzienda.Rollback;
      raise;
    end;
  finally
    DM1.CloseWait;
    if Assigned(Qry) then
    begin
      Qry.Close;
      Qry.Free;
    end;
    if Assigned(Qry2) then
    begin
      Qry2.Close;
      Qry2.Free;
    end;
  end;
end;

// Procedura che provvede ad avviare una importazione automatica del file specificato
procedure TDM1.ImportaFileListinoArticoli(FileDaImportare, FileFiltroImp: String; RicalcolaListini: Boolean; R1, R2, R3, R4: Integer;
  CampoDanonModificare: String = '');
begin
  // Aggiorna lo schermo
  DM1.ShowWait('', 'Preparazione all''importazione automatica dell''aggiornamento del listino.');

  // Ora crea e visualizza la form di importatione archivi
  if ImportazioneForm <> nil then
    raise Exception.Create('Errore durante la creazione della form di importazione.'#13#13'L''operazione è stata interrotta.');
  Application.CreateForm(TImportazioneForm, ImportazioneForm);
  try
    try
      ImportazioneForm.NomeCampoDaNonModificareSeEsistente := CampoDanonModificare;
      // Visualizza la form
      ImportazioneForm.FormStyle := fsStayOnTop;
      ImportazioneForm.Show;
      // Imposta la modalità Silent
      ImportazioneForm.SilentMode := True;
      // Carica automaticamente il nome del filtro da utilizzare
      ImportazioneForm.ComboTipoImportazione.Text := FileFiltroImp;
      ImportazioneForm.ComboTipoImportazioneChange(ImportazioneForm.ComboTipoImportazione);
      ImportazioneForm.ComboTipoImportazione.Enabled := False;
      // Imposta il nome del file da importare
      ImportazioneForm.FileNameEdit.Text := FileDaImportare;
      ImportazioneForm.FileNameEdit.Enabled := False;
      // Avvia l'importazione
      ImportazioneForm.ButtonAvvia.Enabled := True;
      ImportazioneForm.ButtonAvviaClick(ImportazioneForm.ButtonAvvia);
      // Ricalcola i listini alla fine dell'aggiornamento automatico del listino in modalità CSV
      // NB: L'ho messo quì così anche se arriva un errore almeno mi ricalcola i prezzi degli articoli
      // aggiornati fino all'errore (almeno spero) senza casini
      if RicalcolaListini then
        EseguiQueryCalcolaListini;
      // Aggiorna lo schermo
      DM1.ShowWait('', 'Elimina file di aggiornamento listino.');
    finally
      // Distrugge la form importazione
      ImportazioneForm.Close;
    end;
  except
    // Ricalcola i listini alla fine dell'aggiornamento automatico del listino in modalità CSV
    // NB: L'ho messo quì così anche se arriva un errore almeno mi ricalcola i prezzi degli articoli
    // aggiornati fino all'errore (almeno spero) senza casini
    if RicalcolaListini then
      DM1.EseguiQueryCalcolaListini;
    // Distrugge la form importazione
    ImportazioneForm.Close;
  end;
end;

procedure TDM1.LDE_DuplicateDocument(const ATipoDocumento: String; const AIDDocumento: Integer; AIDSoggetto, AIDPratica: Integer);
var
  LParameters: String;
begin
  ShowWait('Levante', 'Duplicazione documento');
  try
    LParameters := Format('"DUPLICATE" %s %d %d %d "%s" "%s" "%s" "%s" "%s"', [ATipoDocumento, AIDDocumento, AIDSoggetto, AIDPratica, ServerAddress, ArcDBFile, IBUser, IBPswd,
      DM1.PuzzleDir]);
    DM1.WinExec(LDE_ExeFilePath, LParameters);
    Sleep(3000);
  finally
    CloseWait;
  end;
end;

procedure TDM1.LDE_EmbeddedParams;
var
  LParameters: String;
begin
  ShowWait('Levante', 'Caricamento LDE Embedded Params Editor');
  try
    // LCmdLine := Format('"' + LDE_ExeFilePath + '" "NEW" "%s" %d %d "%s" "%s" "%s" "%s"', [ATipoDocumento, AIDSOggetto, AIDPratica, ServerAddress, ArcDBFile, IBUser, IBPswd]);
    LParameters := Format('"NEW" "%s" %d %d "%s" "%s" "%s" "%s" "%s"', ['NONE', -1, -1, ServerAddress, ArcDBFile, IBUser, IBPswd, DM1.PuzzleDir]);
    DM1.WinExec(LDE_EmbededParamsEditor_ExeFilePath, LParameters);
    Sleep(3000);
  finally
    CloseWait;
  end;
end;

procedure TDM1.LDE_NewDocument(const ATipoDocumento: String; AIDSoggetto, AIDPratica: Integer);
var
  LParameters: String;
begin
  ShowWait('Levante', 'Carico il documento');
  try
    // LCmdLine := Format('"' + LDE_ExeFilePath + '" "NEW" "%s" %d %d "%s" "%s" "%s" "%s"', [ATipoDocumento, AIDSOggetto, AIDPratica, ServerAddress, ArcDBFile, IBUser, IBPswd]);
    LParameters := Format('"NEW" "%s" %d %d "%s" "%s" "%s" "%s" "%s"', [ATipoDocumento, AIDSoggetto, AIDPratica, ServerAddress, ArcDBFile, IBUser, IBPswd,
      DM1.PuzzleDir]);
    DM1.WinExec(LDE_ExeFilePath, LParameters);
    Sleep(3000);
  finally
    CloseWait;
  end;
end;

procedure TDM1.LDE_OpenDocument(const ATipoDocumento: String; const AIDDocumento: Integer);
var
  LParameters: String;
begin
  ShowWait('Levante', 'Carico il documento');
  try
    LParameters := Format('"OPEN" "%s" %d "%s" "%s" "%s" "%s" "%s"', [ATipoDocumento, AIDDocumento, ServerAddress, ArcDBFile, IBUser, IBPswd, DM1.PuzzleDir]);
    DM1.WinExec(LDE_ExeFilePath, LParameters);
    Sleep(3000);
  finally
    CloseWait;
  end;
end;

// Funzione che ritorna l'elenco delle viste disponibili per la griglia ricevuta come parametro
procedure TDM1.ListaVisteGriglia(NomeGrid: String; Lista: TStrings);
var
  SearchRec: TSearchRec;
  TmpStr: String;
begin
  // Prima di tutto controlla che la cartella esista
  if DirectoryExists(DM1.ImpGridsDir) then
  begin
    // Poi cerca il primo file
    if FindFirst(DM1.ImpGridsDir + NomeGrid + '___*.ini', faAnyFile, SearchRec) = 0 then
    begin
      // Se lo trova aggiunge al risultato il nome della vista trovata
      TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name) - Length(NomeGrid) - 3);
      TmpStr := LeftStr(TmpStr, Length(TmpStr) - 4);
      Lista.Add(TmpStr);
      // Trova anche gli eventuali altri files dello stesso tipo
      while (FindNext(SearchRec) = 0) do
      begin
        // Se lo trova inserisce il nome della vista nell'elenco
        TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name) - Length(NomeGrid) - 3);
        TmpStr := LeftStr(TmpStr, Length(TmpStr) - 4);
        Lista.Add(TmpStr);
      end;
    end;
    // Distrugge SearchRec
    FindClose(SearchRec);
  end;
end;

// Funzione che ritorna True se il PC è il server di Levante oppure False
// se non lo è
function TDM1.IsThisPcLevanteServer: Boolean;
begin
  // Inizializzazione
  Result := (Uppercase(ServerAddress) = Trim(JclSysInfo.GetLocalComputerName)) or (ServerAddress = Trim(JclSysInfo.GetIPAddress(''))) or
    (ServerAddress = '127.0.0.1') or (Uppercase(ServerAddress) = 'LOCAL');
end;

// Procedura che crea il file settings.ini per il corretto funzionamento
// del Bullzip per l'invio della mail
procedure TDM1.BullzipCreaSettings(NomeFilePdf: String = 'documento.pdf');
var
  Settings: TStrings;
begin
  Settings := TStringList.Create;
  try
    // Compone il file
    Settings.Add('[PDF Printer]');
    Settings.Add('  afterprintprogram=');
    Settings.Add('  author=');
    Settings.Add('  creationdate=');
    Settings.Add('  creator=');
    Settings.Add('  keylength=128');
    Settings.Add('  keywords=');
    Settings.Add('  mergefile=');
    Settings.Add('  mergeposition=bottom');
    Settings.Add('  moddate=');
    Settings.Add('  output=' + DM1.CartellaTmp + NomeFilePdf);
    Settings.Add('  ownerpassword=');
    Settings.Add('  permissions=');
    Settings.Add('  settingsprogram=');
    Settings.Add('  showpdf=no');
    Settings.Add('  subject=');
    Settings.Add('  superimpose=');
    Settings.Add('  target=default');
    Settings.Add('  title=');
    Settings.Add('  userpassword=');
    Settings.Add('  watermarkrotation=c2c');
    Settings.Add('  watermarksize=6');
    Settings.Add('  watermarktext=');
    Settings.Add('  watermarktransparency=85');
    Settings.Add('  confirmoverwrite=no');
    Settings.Add('  showsaveas=never');
    Settings.Add('  showsettings=never');
    Settings.Add('  suppresserrors=yes');
    Settings.Add('  usedefaultauthor=yes');
    Settings.Add('  usedefaulttitle=yes');
    Settings.Add('  appendposition=');
    // Salva il file
    Settings.SaveToFile(BullzipDir + 'runonce.ini');
    Settings.SaveToFile(BullzipDir2 + 'runonce.ini');
  finally
    Settings.Free;
  end;
end;

// Procedura che si occupa di inviare una email con allegato
// il documento di cui al file DOcumento.pdf che deve essere presente
// nella cartella Temporanea di levante
procedure TDM1.InviaEmail(CodiceCliente: Integer; Oggetto: String; Allegato: String);
var
  Q: TIB_Cursor;
  EmailAddress: String;
begin
  EmailAddress := '';
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che preleverà l'indirizzo email memorizzato
    // nella scheda anagrafica del soggetto
    Q.DatabaseName := ArcDBFile;
    Q.IB_Connection := DBAzienda;
    Q.SQL.Add('SELECT EMAIL FROM CLIENTI WHERE CODICE = ' + IntToStr(CodiceCliente));
    Q.Open;
    if not Q.Eof then
    begin
      EmailAddress := Q.FieldByName('EMAIL').AsString;
    end;
    // Invia l'email
    JclSimpleSendMail(EmailAddress, '', Oggetto, TableProgressiviTESTOEMAIL.AsString, (DM1.CartellaTmp + Allegato), True);
    // Elimina il file allegato
    DM1.EliminaFile(DM1.CartellaTmp + Allegato);
  finally
    Q.Free;
  end;
end;

// Funzione che ritorna il soggetto intestatario di una pratica/cantiere
function TDM1.GetCodiceSoggettoPratica(CodPrat: Longint; DataPrat: TDate): Integer;
var
  Q: TIB_Cursor;
begin
  Result := -1;
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che preleverà l'indirizzo email memorizzato
    // nella scheda anagrafica del soggetto
    Q.DatabaseName := ArcDBFile;
    Q.IB_Connection := DBAzienda;
    Q.SQL.Add('SELECT CLIENTE FROM PRATICHE WHERE CODICE=' + IntToStr(CodPrat) + ' AND DATAAPERTURA = ''' + FormatDateTime('mm/dd/yyyy', DataPrat) + '''');
    Q.Open;
    if Q.Eof then
      Exit;
    Result := Q.FieldByName('CLIENTE').AsInteger;
  finally
    Q.Free;
  end;
end;

procedure TDM1.SetCodiceUtenteBySecurityIdOrByParams;
  procedure SetCodiceUtenteBySecurityID;
  var
    Q: TIB_Cursor;
  begin
    Q := TIB_Cursor.Create(Self);
    try
      Q.DatabaseName := GenDBFile;
      Q.IB_Connection := DBGenerale;
      Q.SQL.Add('SELECT ID FROM SECURITY WHERE NOMEUTENTE = ''' + IDOperatoreCorrente + '''');
      Q.Open;
      // Se non trova alcun agente ritorna un errore.
      if Q.Eof then
      begin
        DM1.Messaggi('Levante', 'ID security non presente!!!', '', [mbOk], 0, nil);
        Exit;
      end;
      DM1.CodiceUtente := PadR(Q.FieldByName('ID').AsString, '0', 4);
    finally
      Q.Free;
    end;
  end;
  procedure SetCodiceUtenteByParams;
  var
    P: TMemIniFile;
    LCodiceUtente: String;
  begin
    P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
    try
      LCodiceUtente := P.ReadString('BACHECA', 'IDBacheca', '');
      if LCodiceUtente <> '' then
        DM1.CodiceUtente := LCodiceUtente;
    finally
      P.Free;
    end;
  end;
begin
  if LEVARCO_PASSWORD then
    SetCodiceUtenteBySecurityID
  else
    SetCodiceUtenteByParams;
end;

// Funzione che ritorna il NOme dell'agente relativo al codice ricevuto
function TDM1.GetNomeAgenteByCodice(Cod: Integer): String;
var
  Q: TIB_Cursor;
begin
  Result := '';
  Q := TIB_Cursor.Create(Self);
  try
    // Imposta la query che preleverà l'indirizzo email memorizzato
    // nella scheda anagrafica del soggetto
    Q.DatabaseName := ArcDBFile;
    Q.IB_Connection := DBAzienda;
    Q.SQL.Add('SELECT FIRST 1 NOME FROM AGENTI WHERE CODICE=' + IntToStr(Cod));
    Q.Open;
    // Se non trova alcun agente ritorna un errore.
    if Q.Eof then
    begin
      DM1.Messaggi('Levante', 'Soggetto non trovato!', '', [mbOk], 0, nil);
      Exit;
    end;
    Result := Q.FieldByName('NOME').AsString;
  finally
    Q.Free;
  end;
end;

function TDM1.CreaFiltroTipoDocPerUltimoPrezzoAcquisto: String;
begin
  // ==========================================================================
  // Prima di tutto costruisce la parte di filtro da usare nella SubQuery
  // che calcola l'UltimoPrezzoAcquisto per decidere di quali tipi di
  // documento deve tenere presente.
  // --------------------------------------------------------------------------
  // Inizializzazione
  Result := '';
  // Se deve tenere presente le Bolle di Entrata...
  if DM1.TableProgressiviULTPRZACQ_BOLLEENTR.AsString <> 'F' then
  begin
    if Result <> '' then
      Result := Result + ' OR ';
    Result := Result + 'R1.TIPODOCUMENTO = ''Bolla_entr''';
  end;
  // Se deve tenere presente le Fatture di acquisto...
  if DM1.TableProgressiviULTPRZACQ_FATTACQUI.AsString <> 'F' then
  begin
    if Result <> '' then
      Result := Result + ' OR ';
    Result := Result + 'R1.TIPODOCUMENTO = ''Fatt.acqui''';
  end;
  // Se viene cosiderato almeno un documento aggiunge le parentesi, altrimenti
  // imposta una condizione impossibile in modo che sia sempre falsa (altrimenti in assenza
  // di un filtro considererebbe tutti i documenti) e quindi alla fine utilizzerebbe
  // sempre il campo ULTIMOPRZACQUISTO
  if Result <> '' then
    Result := '(' + Result + ')'
  else
    Result := '(1=2)';
  // ==========================================================================
end;

procedure TDM1.ChiediOreManodopera(CodDip, DescrizDip: Variant; DC: TcxCustomDataController; RI, OreIdx, NoteIdx: Integer);
begin
  // Defaultizza
  if VarIsNull(CodDip) then
    CodDip := '';
  if VarIsNull(DescrizDip) then
    DescrizDip := '';
  // Crea la form
  Application.CreateForm(TQtaOperaForm, QtaOperaForm);
  // Imposta i dati
  QtaOperaForm.CodiceDipendente := CodDip;
  QtaOperaForm.DescrizDipendente := DescrizDip;
  // Imposta i parametri per l'accesso ai campi destinazione nella griglia
  QtaOperaForm.DC := DC;
  QtaOperaForm.RecordIndex := RI;
  QtaOperaForm.OreItemIndex := OreIdx;
  QtaOperaForm.NoteItemIndex := NoteIdx;
  // Visualizza la form
  QtaOperaForm.ShowModal;
end;

procedure TDM1.ChiediOreManodopera(CodDip, DescrizDip: Variant; FieldOre, FieldNote: TField);
begin
  // Defaultizza
  if VarIsNull(CodDip) then
    CodDip := '';
  if VarIsNull(DescrizDip) then
    DescrizDip := '';
  // Crea la form
  Application.CreateForm(TQtaOperaForm, QtaOperaForm);
  // Imposta i dati
  QtaOperaForm.CodiceDipendente := CodDip;
  QtaOperaForm.DescrizDipendente := DescrizDip;
  // Imposta i parametri per l'accesso ai campi destinazione nella griglia
  QtaOperaForm.OreField := FieldOre;
  QtaOperaForm.NoteField := FieldNote;
  // Visualizza la form
  QtaOperaForm.ShowModal;
end;

function TDM1.ChiediQtaArticolo(CodArt, Descriz, UnitMis, QtaAuto: Variant): Double;
begin
  if VarIsNull(CodArt) then
    CodArt := '';
  if VarIsNull(Descriz) then
    Descriz := '';
  if VarIsNull(UnitMis) then
    UnitMis := '';
  if VarIsNull(QtaAuto) then
    QtaAuto := '1';
  Result := QtaAuto;
  Application.CreateForm(TQtaArticoloForm, QtaArticoloForm);
  try
    QtaArticoloForm.Codice := CodArt;
    QtaArticoloForm.Descrizione := Descriz;
    QtaArticoloForm.UnitaDiMisura := UnitMis;
    QtaArticoloForm.Qta := QtaAuto;
    QtaArticoloForm.ShowModal;
    Result := QtaArticoloForm.Qta;
  finally
    QtaArticoloForm.Close;
    QtaArticoloForm.Free;
  end;
end;

// Funzione che ritorna True se l'articoli esiste oppure False se non esiste
function TDM1.ArticoloExist(CodArt: String): Boolean;
begin
  Result := False;
  if QryArticoloExist.Active then
    QryArticoloExist.Close;
  if not QryArticoloExist.Prepared then
    QryArticoloExist.Prepare;
  QryArticoloExist.Params.ParamByName('P_CODART').AsString := CodArt;
  QryArticoloExist.Open;
  try
    Result := (QryArticoloExist.Fields[0].AsInteger > 0);
  finally
    QryArticoloExist.Close;
  end;
end;

// Inserisce un nuovo articolo nell'archivio articoli con i dati a disposizione.
procedure TDM1.NuovoArticolo(CodArt, DescArt, UMArt: String; PrezzoListino, S1Art, S2Art, S3Art: Double);
var
  Q: TIB_Cursor;
  R1, R2, R3, R4: Double;
  UltimoPrzAcquisto, ImpRicarico, ImpRicarico1, ImpRicarico2, ImpRicarico3, ImpRicarico4, PrezzoDiVend1, PrezzoDiVend2, PrezzoDiVend3, PrezzoDiVend4,
    CostoReale: Double;
  BCL_Csc1, BCL_Csc2, BCL_Csc3: String;
  BCL_S1Art, BCL_S2Art, BCL_S3Art: Double;
begin
  // Calcola il costo reale considerando tutti gli sconti di acquisto
  CostoReale := DM1.CalcolaImportoScontato(PrezzoListino, S1Art, S2Art, S3Art, DM1.DecMicroPrz);

  // Calcola il costo utilizzato come base per il calcolo dei listini di vendita considerando
  // solo gli sconti voluti dall'utente per questo scopo in modo da non mangiarsi l'extra sconto
  if DM1.TableProgressiviBCL_CONSIDERA_SC1.AsBoolean then
  begin
    BCL_Csc1 := 'T';
    BCL_S1Art := S1Art;
  end
  else
  begin
    BCL_Csc1 := 'F';
    BCL_S1Art := 0;
  end;
  if DM1.TableProgressiviBCL_CONSIDERA_SC2.AsBoolean then
  begin
    BCL_Csc2 := 'T';
    BCL_S2Art := S2Art;
  end
  else
  begin
    BCL_Csc2 := 'F';
    BCL_S2Art := 0;
  end;
  if DM1.TableProgressiviBCL_CONSIDERA_SC3.AsBoolean then
  begin
    BCL_Csc3 := 'T';
    BCL_S3Art := S2Art;
  end
  else
  begin
    BCL_Csc3 := 'F';
    BCL_S3Art := 0;
  end;
  UltimoPrzAcquisto := DM1.CalcolaImportoScontato(PrezzoListino, BCL_S1Art, BCL_S2Art, BCL_S3Art, DM1.DecMicroPrz);

  // Se sono attivati i ricarichi per fasce di prezzo, provvede a impostare
  // i ricarichi in base alla fascia di prezzo appropriata.
  if DM1.RicarichiPerFasceDiPrezzo then
  begin
    DM1.CaricaFasceRicarichi;
    R1 := DM1.GetRicaricoPerPrezzo(CostoReale, 1, False);
    R2 := DM1.GetRicaricoPerPrezzo(CostoReale, 2, False);
    R3 := DM1.GetRicaricoPerPrezzo(CostoReale, 3, False);
    R4 := DM1.GetRicaricoPerPrezzo(CostoReale, 4, False);
    // Altrimenti se non sono attivati i ricarichi per fasce di prezzo utilizza i ricarichi
    // normali fissi.
  end
  else
  begin
    R1 := DM1.TableProgressiviRICARICOLISTINO1.AsFloat;
    R2 := DM1.TableProgressiviRICARICOLISTINO2.AsFloat;
    R3 := DM1.TableProgressiviRICARICOLISTINO3.AsFloat;
    R4 := DM1.TableProgressiviRICARICOLISTINO4.AsFloat;
  end;

  ImpRicarico := PrezzoListino - UltimoPrzAcquisto;
  ImpRicarico1 := Arrotonda((UltimoPrzAcquisto * R1 / 100), DM1.DecMicroPrz);
  ImpRicarico2 := Arrotonda((UltimoPrzAcquisto * R2 / 100), DM1.DecMicroPrz);
  ImpRicarico3 := Arrotonda((UltimoPrzAcquisto * R3 / 100), DM1.DecMicroPrz);
  ImpRicarico4 := Arrotonda((UltimoPrzAcquisto * R4 / 100), DM1.DecMicroPrz);
  PrezzoDiVend1 := Arrotonda((UltimoPrzAcquisto + ImpRicarico1), DM1.DecMicroPrz);
  PrezzoDiVend2 := Arrotonda((UltimoPrzAcquisto + ImpRicarico2), DM1.DecMicroPrz);
  PrezzoDiVend3 := Arrotonda((UltimoPrzAcquisto + ImpRicarico3), DM1.DecMicroPrz);
  PrezzoDiVend4 := Arrotonda((UltimoPrzAcquisto + ImpRicarico4), DM1.DecMicroPrz);
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('INSERT INTO ARTICOLI (CODICEARTICOLO, BARCODE, DESCRIZIONE, UNITADIMISURA,');
    Q.SQL.Add(' PREZZODILISTINO, PREZZODILISTINOIVACOMP, CODICEIVA, ABILITAMOVMAG,');
    Q.SQL.Add(' SCONTODIACQUISTO, SCONTODIACQUISTO2, SCONTODIACQUISTO3, ULTIMOPRZACQUISTO, COSTOREALE,');
    Q.SQL.Add(' BCL_CONSIDERA_SCONTO1, BCL_CONSIDERA_SCONTO2, BCL_CONSIDERA_SCONTO3,');
    Q.SQL.Add(' RICARICO, RICARICO2, RICARICO3, RICARICO4, IMPORTORICARICO, IMPORTORICARICO2, IMPORTORICARICO3, IMPORTORICARICO4,');
    Q.SQL.Add(' PREZZODIVENDITA, PREZZODIVENDITA2, PREZZODIVENDITA3, PREZZODIVENDITA4,');
    Q.SQL.Add(' PRZVENDIVACOMP1, PRZVENDIVACOMP2, PRZVENDIVACOMP3, PRZVENDIVACOMP4)');
    Q.SQL.Add('VALUES (');
    Q.SQL.Add(AnsiQuotedStr(CodArt, '''') + ',');
    Q.SQL.Add(AnsiQuotedStr(CodArt, '''') + ',');
    Q.SQL.Add(AnsiQuotedStr(DescArt, '''') + ',');
    Q.SQL.Add(AnsiQuotedStr(UMArt, '''') + ',');
    Q.SQL.Add(VirgolaPunto(PrezzoListino) + ',');
    Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoListino * 1.20), DM1.DecMicroPrz)) + ',');
    Q.SQL.Add('1,');
    Q.SQL.Add('''T'',');
    Q.SQL.Add(VirgolaPunto(S1Art) + ',');
    Q.SQL.Add(VirgolaPunto(S2Art) + ',');
    Q.SQL.Add(VirgolaPunto(S3Art) + ',');
    Q.SQL.Add(VirgolaPunto(UltimoPrzAcquisto) + ',');
    Q.SQL.Add(VirgolaPunto(CostoReale) + ',');
    Q.SQL.Add('''' + BCL_Csc1 + ''',');
    Q.SQL.Add('''' + BCL_Csc2 + ''',');
    Q.SQL.Add('''' + BCL_Csc3 + ''',');
    // Se i ricaricchi sono tutti a 0 (zero) pone i prezzi di vendita = al prezzo di listino, altrimenti calcola con i ricarichi
    if (R1 = 0) and (R2 = 0) and (R3 = 0) and (R4 = 0) then
    begin
      if UltimoPrzAcquisto <> 0 then
      begin
        Q.SQL.Add(VirgolaPunto(Arrotonda((ImpRicarico * 100 / UltimoPrzAcquisto), DM1.DecMicroPrz)) + ',');
        Q.SQL.Add(VirgolaPunto(Arrotonda((ImpRicarico * 100 / UltimoPrzAcquisto), DM1.DecMicroPrz)) + ',');
        Q.SQL.Add(VirgolaPunto(Arrotonda((ImpRicarico * 100 / UltimoPrzAcquisto), DM1.DecMicroPrz)) + ',');
        Q.SQL.Add(VirgolaPunto(Arrotonda((ImpRicarico * 100 / UltimoPrzAcquisto), DM1.DecMicroPrz)) + ',');
      end
      else
      begin
        Q.SQL.Add('0,');
        Q.SQL.Add('0,');
        Q.SQL.Add('0,');
        Q.SQL.Add('0,');
      end;
      Q.SQL.Add(VirgolaPunto(ImpRicarico) + ',');
      Q.SQL.Add(VirgolaPunto(ImpRicarico) + ',');
      Q.SQL.Add(VirgolaPunto(ImpRicarico) + ',');
      Q.SQL.Add(VirgolaPunto(ImpRicarico) + ',');
      Q.SQL.Add(VirgolaPunto(PrezzoListino) + ',');
      Q.SQL.Add(VirgolaPunto(PrezzoListino) + ',');
      Q.SQL.Add(VirgolaPunto(PrezzoListino) + ',');
      Q.SQL.Add(VirgolaPunto(PrezzoListino) + ',');
      Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoListino * 1.20), DM1.DecMicroPrz)) + ',');
      Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoListino * 1.20), DM1.DecMicroPrz)) + ',');
      Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoListino * 1.20), DM1.DecMicroPrz)) + ',');
      Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoListino * 1.20), DM1.DecMicroPrz)));
    end
    else
    begin
      Q.SQL.Add(VirgolaPunto(R1) + ',');
      Q.SQL.Add(VirgolaPunto(R2) + ',');
      Q.SQL.Add(VirgolaPunto(R3) + ',');
      Q.SQL.Add(VirgolaPunto(R4) + ',');
      Q.SQL.Add(VirgolaPunto(ImpRicarico1) + ',');
      Q.SQL.Add(VirgolaPunto(ImpRicarico2) + ',');
      Q.SQL.Add(VirgolaPunto(ImpRicarico3) + ',');
      Q.SQL.Add(VirgolaPunto(ImpRicarico4) + ',');
      Q.SQL.Add(VirgolaPunto(PrezzoDiVend1) + ',');
      Q.SQL.Add(VirgolaPunto(PrezzoDiVend2) + ',');
      Q.SQL.Add(VirgolaPunto(PrezzoDiVend3) + ',');
      Q.SQL.Add(VirgolaPunto(PrezzoDiVend4) + ',');
      Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoDiVend1 * 1.20), DM1.DecMicroPrz)) + ',');
      Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoDiVend2 * 1.20), DM1.DecMicroPrz)) + ',');
      Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoDiVend3 * 1.20), DM1.DecMicroPrz)) + ',');
      Q.SQL.Add(VirgolaPunto(Arrotonda((PrezzoDiVend4 * 1.20), DM1.DecMicroPrz)));
    end;
    Q.SQL.Add(')');
    Q.ExecSQL;
    // Effettua il controllo dei magazzini dell'articolo e se non ci sono gli opportuni records nella tabella MAGAZZINI li crea
    // ControlloMagazziniArticolo(CodArt);
  finally
    Q.Free;
  end;
end;

// Ritorna True se ci sono scadenze scadute e non pagate per il soggetto specificato
function TDM1.ScadenzeInSofferenza(CodiceCliente: Longint): Boolean;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := False;
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT COUNT(*) FROM SCADENZ WHERE');
    Q.SQL.Add('    CLIENTE=' + IntToStr(CodiceCliente));
    Q.SQL.Add('AND DATASCADENZA < ''' + FormatDateTime('mm/dd/yyyy', Date) + '''');
    Q.SQL.Add('AND IMPORTOPAGATO < IMPORTO');
    Q.Open;
    if Q.Eof then
      Exit;
    Result := (Q.Fields[0].AsInteger > 0);
  finally
    Q.Free;
  end;
end;

// Questa procedura imposta lo stato relativo all'// Questa procedura cambia lo stato del documento
procedure TDM1.SetRegistroDocumento(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate; NuovoRegistro: String);
var
  Q: TIB_Cursor;
begin
  // Annulla tutto se NuovoStato è nullo
  if NuovoRegistro = '' then
    Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Query che cambia il registro della testata documento
    Q.SQL.Add('UPDATE PRVORDCL T SET T.REGISTRO = ''' + NuovoRegistro + '''');
    Q.SQL.Add('WHERE T.TIPODOCUMENTO = ''' + TipoDoc + '''');
    Q.SQL.Add('  AND T.REGISTRO = ''' + RegDoc + '''');
    Q.SQL.Add('  AND T.NUMORDPREV = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.ExecSQL;
    // Query che cambia il registro dei righi del documento
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE RIGHIPRV T SET T.REGISTRO = ''' + NuovoRegistro + '''');
    Q.SQL.Add('WHERE T.TIPODOCUMENTO = ''' + TipoDoc + '''');
    Q.SQL.Add('  AND T.REGISTRO = ''' + RegDoc + '''');
    Q.SQL.Add('  AND T.NUMORDPREV = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.ExecSQL;
    // Query che cambia il registro dei righi ore del documento
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE RAPGIORNRIGHI T SET T.REGISTRO = ''' + NuovoRegistro + '''');
    Q.SQL.Add('WHERE T.TIPODOC = ''' + TipoDoc + '''');
    Q.SQL.Add('  AND T.REGISTRO = ''' + RegDoc + '''');
    Q.SQL.Add('  AND T.NUMDOC = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.ExecSQL;
    // Se il documento è un intervento cambia lo stato anche dell'impegno
    if TipoDoc = 'Intervento' then
    begin
      Q.SQL.Clear;
      Q.SQL.Add('UPDATE IMPEGNI I SET I.REGISTRO = ''' + NuovoRegistro + '''');
      Q.SQL.Add('WHERE I.TIPOIMPEGNO = ''' + TipoDoc + '''');
      Q.SQL.Add('  AND I.REGISTRO = ''' + RegDoc + '''');
      Q.SQL.Add('  AND I.ID = ' + IntToStr(NumDoc));
      Q.ExecSQL;
    end;
  finally
    Q.Free;
  end;
end;

// Questa procedura imposta lo stato relativo all'// Questa procedura cambia lo stato del documento
procedure TDM1.SetRegistroRappGiorn(RegDoc: String; NumDoc: Longint; DataDoc: TDate; NuovoRegistro: String);
var
  Q: TIB_Cursor;
begin
  // Annulla tutto se NuovoStato è nullo
  if NuovoRegistro = '' then
    Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Query che cambia il registro della testata documento
    Q.SQL.Add('UPDATE RAPGIORN T SET T.REGISTRO = ''' + NuovoRegistro + '''');
    Q.SQL.Add('WHERE T.REGISTRO = ''' + RegDoc + '''');
    Q.SQL.Add('  AND T.NUMDOC = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.ExecSQL;
    // Query che cambia il registro dei righi ore del documento
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE RAPGIORNRIGHI T SET T.REGISTRO = ''' + NuovoRegistro + '''');
    Q.SQL.Add('WHERE T.TIPODOC = ''Rapp.giorn.''');
    Q.SQL.Add('  AND T.REGISTRO = ''' + RegDoc + '''');
    Q.SQL.Add('  AND T.NUMDOC = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.ExecSQL;
    // Query che cambia il registro dei righi spese del documento
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE RAPGIORNRIGHISPESE T SET T.REGISTRO = ''' + NuovoRegistro + '''');
    Q.SQL.Add('WHERE T.TIPODOC = ''Rapp.giorn.''');
    Q.SQL.Add('  AND T.REGISTRO = ''' + RegDoc + '''');
    Q.SQL.Add('  AND T.NUMDOC = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Setta lo stato del documento come evento "Dopo la creazione" del documento
procedure TDM1.SetStatoDocumentoDopoFatturazione(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate);
var
  P: TMemIniFile;
  NuovoStato: String;
begin
  P := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    NuovoStato := P.ReadString(TipoDoc, 'StatoDopoFatturazione', '');
    if NuovoStato <> '' then
      SetStatoDocumento(TipoDoc, RegDoc, NumDoc, DataDoc, 0, False, NuovoStato);
  finally
    P.Free;
  end;
end;

// Setta lo stato del documento come evento "Dopo la creazione" del documento
procedure TDM1.SetStatoDocumentoDopoEstrattoConto(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate);
var
  P: TMemIniFile;
  NuovoStato: String;
begin
  P := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    NuovoStato := P.ReadString(TipoDoc, 'StatoDopoEstrattoConto', '');
    if NuovoStato <> '' then
      SetStatoDocumento(TipoDoc, RegDoc, NumDoc, DataDoc, 0, False, NuovoStato);
  finally
    P.Free;
  end;
end;

// Setta lo stato del documento come evento "Dopo la creazione" del documento
// Questa procedura cambia lo stato del documento
procedure TDM1.SetStatoNuovoDocumento(DS: TDataSet; NuovoStato: String);
var
  Q: TIB_Cursor;
begin
  // Annulla tutto se NuovoStato è nullo
  if NuovoStato = '' then
    Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT S.DESCRIZIONE, S.FOREGROUND, S.BACKGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + '''');
    Q.Open;
    if not Q.Eof then
    begin
      DS.FieldByName('STATODESCRIZIONE').Value := Q.FieldByName('DESCRIZIONE').AsString;
      DS.FieldByName('STATOFOREGROUND').Value := Q.FieldByName('FOREGROUND').AsString;
      DS.FieldByName('STATOBACKGROUND').Value := Q.FieldByName('BACKGROUND').AsString;
    end;
  finally
    Q.Free;
  end;
end;

// Questa procedura cambia lo stato del documento
procedure TDM1.SetConsegnatoDocumento(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PRVORDCL T SET');
    Q.SQL.Add('T.CONSEGNATO = ''T''');
    Q.SQL.Add('WHERE T.TIPODOCUMENTO = ''' + TipoDoc + '''');
    Q.SQL.Add('  AND T.REGISTRO = ''' + RegDoc + '''');
    Q.SQL.Add('  AND T.NUMORDPREV = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Questa setta il documendo come NON ESPORTATO
procedure TDM1.SetNotExportedDoc(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PRVORDCL T SET');
    Q.SQL.Add('T.EXPORTED = ''F''');
    Q.SQL.Add('WHERE T.TIPODOCUMENTO = ''' + TipoDoc + '''');
    Q.SQL.Add('  AND T.REGISTRO = ''' + RegDoc + '''');
    Q.SQL.Add('  AND T.NUMORDPREV = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

procedure TDM1.SetNotExportedPrimanota(Codice: Integer; Data: TDate);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PRIMANOT P SET');
    Q.SQL.Add('P.EXPORTED = ''F''');
    Q.SQL.Add('WHERE P.CODICE = ''' + IntToStr(Codice) + '''');
    Q.SQL.Add('  AND p.DATA = ''' + FormatDateTime('mm/dd/yyyy', Data) + '''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Questa procedura cambia lo stato del movimento di primanota
procedure TDM1.SetStatoPrimanota(NumPrm: Longint; DataPrm: TDate; NuovoStato: String);
var
  Q: TIB_Cursor;
begin
  // Annulla tutto se NuovoStato è nullo
  if NuovoStato = '' then
    Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE PRIMANOT P SET');
    Q.SQL.Add('P.STATODESCRIZIONE = ''' + NuovoStato + ''',');
    Q.SQL.Add('P.STATOFOREGROUND = (SELECT FIRST 1 S.FOREGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + '''),');
    Q.SQL.Add('P.STATOBACKGROUND = (SELECT FIRST 1 S.BACKGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + ''')');
    Q.SQL.Add('WHERE P.CODICE = ' + IntToStr(NumPrm));
    Q.SQL.Add('  AND P.DATA = ''' + FormatDateTime('mm/dd/yyyy', DataPrm) + '''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Questa procedura cambia lo stato della scadenza
procedure TDM1.SetStatoScadenza(TipoScad: String; NumScad: Longint; DataScad: TDate; NuovoStato: String);
var
  Q: TIB_Cursor;
begin
  // Annulla tutto se NuovoStato è nullo
  if NuovoStato = '' then
    Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('UPDATE SCADENZ S SET');
    Q.SQL.Add('S.STATODESCRIZIONE = ''' + NuovoStato + '''');
    Q.SQL.Add('WHERE S.TIPO = ''' + TipoScad + '''');
    Q.SQL.Add('  AND S.CODICE = ' + IntToStr(NumScad));
    Q.SQL.Add('  AND S.DATASCADENZA = ''' + FormatDateTime('mm/dd/yyyy', DataScad) + '''');
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Questa procedura setta il documento specificato come "RifDoc_COrrispettivoNonPagatoChiuso"
procedure TDM1.Set_RifDoc_CorrispettivoNonPagato_Chiuso(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate; Silent: Boolean;
  RifDoc_CorrispNoPag: String = 'NP');
var
  Q: TIB_Cursor;
begin
  try
    // Inizializzazione
    Q := TIB_Cursor.Create(nil);
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // -------------------------------------------------------------------------
    // Se è già stato specificata l'informazione nel parametro apposito non è necessario eseguire la query
    if RifDoc_CorrispNoPag = 'NP' then
    begin
      // Query che verifica se il documento specificato è marcato come "RifDoc_CorrispettivoNonPagato"
      // NB: Se non lo è esce, se era già marcato come "Chiuso" avvisa l'utente della cosa e di controllare.
      Q.SQL.Add('SELECT T.RIFDOC_CORRISPNOPAG FROM PRVORDCL T');
      Q.SQL.Add('WHERE T.TIPODOCUMENTO = ' + QuotedStr(TipoDoc));
      Q.SQL.Add('  AND T.REGISTRO = ' + QuotedStr(RegDoc));
      Q.SQL.Add('  AND T.NUMORDPREV = ' + IntToStr(NumDoc));
      Q.SQL.Add('  AND T.DATADOCUMENTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DataDoc)));
      Q.Open;
      // Se non trova il documento esce subito
      if Q.Eof then
        Exit;
      // Per comodità
      RifDoc_CorrispNoPag := Trim(Q.Fields[0].AsString);
      Q.Close;
    end;
    // Se il documento non è marcato come RifDoc_CorrispettivoNonPagato esce subito
    if (RifDoc_CorrispNoPag = '') OR (RifDoc_CorrispNoPag = 'F') then
      Exit
      // Se invece è già stato chiuso come RifDoc_COrrispNoPag avvisa l'utente e gli suggerisce di
      // verificare la cosa perchè il documento risulta già chiuso sotto questo aspetto.
    else if (RifDoc_CorrispNoPag = 'C') then
    begin
      if not Silent then
        DM1.Messaggi('Levante', 'ATTENZIONE!'#13#13'Sto marcando il documento (' + TipoDoc + ' n. ' + IntToStr(NumDoc) + RegDoc + ' del ' +
          FormatDateTime('dd/mm/yyyy', DataDoc) +
          ') come "Corrispettivo non pagato chiuso" ma mi risulta già chiuso precedentemente.'#13#13'TI CONSIGLIO DI CONTROLLARE SE CI SONO STATI ERRORI !!!',
          '', [mbOk], 0, nil);
      Exit;
    end;
    // -------------------------------------------------------------------------
    // Eventuale conferma dell'operatore
    if not Silent then
    begin
      if DM1.Messaggi('Levante', 'CONFERMA'#13#13'Marcare il documento ' + TipoDoc + ' n. ' + IntToStr(NumDoc) + RegDoc + ' del ' + FormatDateTime('dd/mm/yyyy',
        DataDoc) + ' come "Corrispettivo non pagato chiuso"?', '', [mbYes, mbNo], 0, nil) <> mrYes then
        Exit;
    end;
    // -------------------------------------------------------------------------
    // Query che
    Q.SQL.Clear;
    Q.SQL.Add('UPDATE PRVORDCL T SET T.RIFDOC_CORRISPNOPAG = ' + QuotedStr('C'));
    Q.SQL.Add('WHERE T.TIPODOCUMENTO = ' + QuotedStr(TipoDoc));
    Q.SQL.Add('  AND T.REGISTRO = ' + QuotedStr(RegDoc));
    Q.SQL.Add('  AND T.NUMORDPREV = ' + IntToStr(NumDoc));
    Q.SQL.Add('  AND T.DATADOCUMENTO = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', DataDoc)));
    Q.ExecSQL;
    // Pulizie finali
  finally
    if Assigned(Q) then
      Q.Free;
  end;
end;

// Questa procedura cambia lo stato del documento
procedure TDM1.SetStatoDocumento(TipoDoc, RegDoc: String; NumDoc: Longint; DataDoc: TDate; ID: Integer; IsLde: Boolean; NuovoStato: String);
var
  Q: TIB_Cursor;
begin
  // Annulla tutto se NuovoStato è nullo
  if NuovoStato = '' then
    Exit;
  // Inizializzazione
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // Se è un LDE...
    if IsLde then
    begin
      Q.SQL.Add('UPDATE LDE_DOCUMENTI T SET');
      Q.SQL.Add('T.STATODESCRIZIONE = ''' + NuovoStato + ''',');
      Q.SQL.Add('T.STATOFOREGROUND = (SELECT FIRST 1 S.FOREGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + '''),');
      Q.SQL.Add('T.STATOBACKGROUND = (SELECT FIRST 1 S.BACKGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + ''')');
      Q.SQL.Add('WHERE T.ID = ' + IntToStr(ID));
    end
    // Se è una Dichiarazione di conformità...
    else if TipoDoc = 'Conformita' then
    begin
      Q.SQL.Add('UPDATE CONFORM T SET');
      Q.SQL.Add('T.STATODESCRIZIONE = ''' + NuovoStato + ''',');
      Q.SQL.Add('T.STATOFOREGROUND = (SELECT FIRST 1 S.FOREGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + '''),');
      Q.SQL.Add('T.STATOBACKGROUND = (SELECT FIRST 1 S.BACKGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + ''')');
      Q.SQL.Add('WHERE T.CODICE = ' + IntToStr(NumDoc));
      Q.SQL.Add('  AND T.DATA = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
      // Se è una Lettera/Testo...
    end
    else if TipoDoc = 'Lettera' then
    begin
      Q.SQL.Add('UPDATE TESTI T SET');
      Q.SQL.Add('T.STATODESCRIZIONE = ''' + NuovoStato + ''',');
      Q.SQL.Add('T.STATOFOREGROUND = (SELECT FIRST 1 S.FOREGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + '''),');
      Q.SQL.Add('T.STATOBACKGROUND = (SELECT FIRST 1 S.BACKGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + ''')');
      Q.SQL.Add('WHERE T.CODICE = ' + IntToStr(NumDoc));
      Q.SQL.Add('  AND T.DATA = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
      // Se invece è un altro tipo di documento...
    end
    else
    begin
      Q.SQL.Add('UPDATE PRVORDCL T SET');
      Q.SQL.Add('T.STATODESCRIZIONE = ''' + NuovoStato + ''',');
      Q.SQL.Add('T.STATOFOREGROUND = (SELECT FIRST 1 S.FOREGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + '''),');
      Q.SQL.Add('T.STATOBACKGROUND = (SELECT FIRST 1 S.BACKGROUND FROM STATI S WHERE S.DESCRIZIONE = ''' + NuovoStato + ''')');
      Q.SQL.Add('WHERE T.TIPODOCUMENTO = ''' + TipoDoc + '''');
      Q.SQL.Add('  AND T.REGISTRO = ''' + RegDoc + '''');
      Q.SQL.Add('  AND T.NUMORDPREV = ' + IntToStr(NumDoc));
      Q.SQL.Add('  AND T.DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    end;
    // Esegue la query
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;

// Questa funzione mi ritorna la descrizione del gruppo a cui appartiene l'articolo
// NB: Mi ritorna la descrizione del primo livello di gruppo dell'articolo (DESCGRUPPO1)
function TDM1.DescArtToDescGruppo(CodArt: String): String;
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  Result := '';
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT G.DESCRIZIONE FROM ARTICOLI A');
    Q.SQL.Add('INNER JOIN GRUPPI G ON (G.CODICE1=A.CODICEGRUPPO1 AND G.CODICE2=-1 AND G.CODICE3=-1 AND G.CODICE4=-1 AND G.CODICE5=-1 AND G.CODICE6=-1)');
    Q.SQL.Add('WHERE CODICEARTICOLO=''' + CodArt + '''');
    Q.Open;
    if not Q.Eof then
    begin
      Result := Q.Fields[0].AsString;
    end;
  finally
    Q.Close;
    Q.Free;
  end;
end;

procedure TDM1.GridEdit(tv: TcxGridDBTableView; SetEdit: Boolean);
begin
  // In base al parametro ricevuto mette la griglia del corpo documento
  // in modalità di editing oppure no
  tv.OptionsData.Appending := SetEdit;
  tv.OptionsData.Deleting := SetEdit;
  tv.OptionsData.Editing := SetEdit;
  tv.OptionsData.Inserting := SetEdit;
  // Se siamo in modifica attiva il DragDrop
  if SetEdit then
    tv.DragMode := dmManual
  else
    tv.DragMode := dmAutomatic;
end;

// Procedura che calcola il codice a barre degli articoli del gruppo arcobaleno
// dopo il caricamento del file dell'anagrafica articoli
procedure TDM1.GridEdit(btv: TcxGridDBBandedTableView; SetEdit: Boolean);
begin
  // In base al parametro ricevuto mette la griglia del corpo documento
  // in modalità di editing oppure no
  btv.OptionsData.Appending := SetEdit;
  btv.OptionsData.Deleting := SetEdit;
  btv.OptionsData.Editing := SetEdit;
  btv.OptionsData.Inserting := SetEdit;
  // Se siamo in modifica attiva il DragDrop
  if SetEdit then
    btv.DragMode := dmManual
  else
    btv.DragMode := dmAutomatic;
end;

// Controlla se ci sono degli articoli nel listino marcati come appartentnei al listino
// del gruppo arcobaleno che hanno il codice con meno di 6 caratteri (mancano gli zeri iniziali)
// e se ci sono aggiunge gli zeri iniziali mancanti.
procedure TDM1.ControllaListinoArcobalenoPerQuegliZeriMancantiNelCodice;
var
  Qry, QryUpd: TIB_Cursor;
  NuovoCodiceArticolo, VecchioCodiceArticolo: String;
  TotArticoli, ArticoliCounter: Integer;
begin
  Qry := TIB_Cursor.Create(nil);
  QryUpd := TIB_Cursor.Create(nil);
  try
    ShowWait('Controllo codici Gruppo Arcobaleno', 'Inizializzazione');
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    QryUpd.DatabaseName := DM1.ArcDBFile;
    QryUpd.IB_Connection := DM1.DBAzienda;
    // Imposta la query che preleverà il numero che indica quanti articoli saranno
    // da controllare
    Qry.SQL.Add('SELECT COUNT(*) FROM ARTICOLI WHERE JOLLY10 =''ARCO''');
    Qry.Open;
    TotArticoli := Qry.Fields[0].AsInteger;
    Qry.Close;
    // Imposta la query che ricerca tutti gli articoli del gruppo arcobaleno
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT CODICEARTICOLO FROM ARTICOLI WHERE JOLLY10=''ARCO''');
    Qry.Open;
    // Azzeramento contatore
    ArticoliCounter := 0;
    // Cicla per tutti gli articoli trovati.
    while not Qry.Eof do
    begin
      // Se il CodiceArticolo dell'articolo attuale è lungo meno di 6 caratteri
      // significa che mancano alcuni zeri iniziali (il codice Arcobaleno normalmente
      // è di 6 caratteri)
      VecchioCodiceArticolo := Qry.Fields[0].AsString;
      // INcrementa in contatore e aggiorna lo schermo
      Inc(ArticoliCounter, 1);
      ShowWait('', 'Elaborazione articolo  ' + IntToStr(ArticoliCounter) + ' su ' + IntToStr(TotArticoli)); // + '  (' + VecchioCodiceArticolo + ')');
      if Length(VecchioCodiceArticolo) < 6 then
      begin
        // Inizio Transazione
        // DM1.DBAzienda.StartTransaction;
        // try
        // Costruisce il nuovo codice corretto nella variabile
        NuovoCodiceArticolo := DM1.PadR(VecchioCodiceArticolo, '0', 6);

        // Costruisce ed esegue la query che cambierà il codice articolo negli ARTICOLI
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add('UPDATE ARTICOLI SET CODICEARTICOLO = ''' + NuovoCodiceArticolo + ''' WHERE CODICEARTICOLO = ''' + VecchioCodiceArticolo + '''');
        QryUpd.ExecSQL;
        // Costruisce ed esegue la query che cambierà il codice articolo nei MAGAZZINI
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add('UPDATE MAGAZZINI SET CODICEARTICOLO = ''' + NuovoCodiceArticolo + ''' WHERE CODICEARTICOLO = ''' + VecchioCodiceArticolo + '''');
        QryUpd.ExecSQL;
        // Costruisce ed esegue la query che cambierà il codice articolo nei DIBATESTATE
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add('UPDATE DIBATESTATE SET TIPODOCUMENTO = ''' + NuovoCodiceArticolo + ''' WHERE TIPODOCUMENTO = ''' + VecchioCodiceArticolo + '''');
        QryUpd.ExecSQL;
        // Costruisce ed esegue la query che cambierà il codice articolo nei DIBARIGHI
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add('UPDATE DIBARIGHI SET TIPODOCUMENTO = ''' + NuovoCodiceArticolo + ''' WHERE TIPODOCUMENTO = ''' + VecchioCodiceArticolo + '''');
        QryUpd.ExecSQL;
        // Costruisce ed esegue la query che cambierà il codice articolo nei DIBARIGHI
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add('UPDATE DIBARIGHI SET CODICEARTICOLO = ''' + NuovoCodiceArticolo + ''' WHERE CODICEARTICOLO = ''' + VecchioCodiceArticolo + '''');
        QryUpd.ExecSQL;
        // Costruisce ed esegue la query che cambierà il codice articolo in CONDVEND
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add('UPDATE CONDVEND SET CODICEARTICOLO = ''' + NuovoCodiceArticolo + ''' WHERE CODICEARTICOLO = ''' + VecchioCodiceArticolo + '''');
        QryUpd.ExecSQL;
        // Costruisce ed esegue la query che cambierà il codice articolo in RIGHIPRV
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add('UPDATE RIGHIPRV SET CODICEARTICOLO = ''' + NuovoCodiceArticolo + ''' WHERE CODICEARTICOLO = ''' + VecchioCodiceArticolo + '''');
        QryUpd.ExecSQL;
        // Costruisce ed esegue la query che cambierà il codice articolo in RIGHICONF
        QryUpd.SQL.Clear;
        QryUpd.SQL.Add('UPDATE RIGHICONF SET CODICEARTICOLO = ''' + NuovoCodiceArticolo + ''' WHERE CODICEARTICOLO = ''' + VecchioCodiceArticolo + '''');
        QryUpd.ExecSQL;
        // Commit
        // DM1.DBAzienda.Commit;
        // except
        // DM1.DBAzienda.RollBack;
        // end;
      end;
      // Avanti il prossimo
      Qry.Next;
    end;
  finally
    Qry.Free;
    CloseWait;
  end;
end;

// ==============================================================================================================
// INIZIO FUNZIONI E PROCEDURE PER IL SETTAGGIO E CONTROLLO DEI BITS DI UN INTERNO
// --------------------------------------------------------------------------------------------------------------
Procedure TDM1.SetBit(SetWord, BitNum: Word);
Begin
  SetWord := SetWord Or BitNum; { Set bit }
End;

Procedure TDM1.ClearBit(SetWord, BitNum: Word);
Begin
  SetWord := SetWord Or BitNum; { Set bit }
  SetWord := SetWord Xor BitNum; { Toggle bit }
End;

Procedure TDM1.ToggleBit(SetWord, BitNum: Word);
Begin
  SetWord := SetWord Xor BitNum; { Toggle bit }
End;

Function TDM1.GetBitStat(SetWord, BitNum: Word): Boolean;
Begin
  If SetWord And BitNum = BitNum Then { If bit is set }
    GetBitStat := True
  Else
    GetBitStat := False;
End;
// --------------------------------------------------------------------------------------------------------------
// FINE FUNZIONI E PROCEDURE PER IL SETTAGGIO E CONTROLLO DEI BITS DI UN INTERNO
// ==============================================================================================================

// ==============================================================================================================
// INIZIO FUNZIONI E PROCEDURE PER LA RICERCA SU CAMPI DI TESTO COME UN MOTORE DI RICERCA SU INTERNET
// CON LE PAROLE SLEGATE.
// --------------------------------------------------------------------------------------------------------------
function TDM1.AggiungiRicercaCampoClientDataSet(Campo, Testo: String): String;
var
  R: TStrings; // Contiene l'elenco delle parole da ricerare
  C: String; // Variabile di appoggio
  i: Integer;
begin
  // Inizializzazione
  Result := '';
  // Crea la StringList che conterrà l'elenco delle parole da ricerare
  R := TStringList.Create;
  try
    // Prima di tutto cicla per vedere se ci sono parametri racciusi tra apici '"' e se ce ne sono
    // li carica per primi e li toglie dal testo da ricercare.
    C := RicercaParametroQuotato(Testo);
    while C <> '' do
    begin
      R.Add(C);
      C := RicercaParametroQuotato(Testo);
    end;
    // Poi cicla per prelevare anche le parole da ricercare non quotate
    C := RicercaParametro(Testo);
    while C <> '' do
    begin
      R.Add(C);
      C := RicercaParametro(Testo);
    end;
    // Ovviamente procede solo se è stato trovato qualcosa
    if R.Count > 0 then
    begin
      // Ora cicla per tutte le parole da ricercare e aggiunge le opportune clausole WHERE
      for i := 0 to R.Count - 1 do
      begin
        // Costruisce su C la linea con la consizione da aggiungere
        C := '(' + Campo + ' LIKE ' + QuotedStr(DM1.AddJollyChar(R[i])) + ')';
        // Se non è la prima condizione aggiunge l'AND
        if i > 0 then
          C := ' AND ' + C;
        // Aggiunge la condizione ottenuta
        Result := Result + C;
      end;
    end;
    // Racchiude tutto tra parentesi
    Result := '(' + Result + ')';
  finally
    R.Free;
  end;
end;

procedure TDM1.AggiungiRicercaCampo(SQL: TStrings; Campo, Testo: String; MettiAND: Boolean);
var
  R: TStrings; // Contiene l'elenco delle parole da ricerare
  C: String; // Variabile di appoggio
  i: Integer;
  AggiungiAnd: Boolean;
begin
  // Crea la StringList che conterrà l'elenco delle parole da ricerare
  R := TStringList.Create;
  try
    // Prima di tutto cicla per vedere se ci sono parametri racciusi tra apici '"' e se ce ne sono
    // li carica per primi e li toglie dal testo da ricercare.
    C := RicercaParametroQuotato(Testo);
    while C <> '' do
    begin
      R.Add(C);
      C := RicercaParametroQuotato(Testo);
    end;
    // Poi cicla per prelevare anche le parole da ricercare non quotate
    C := RicercaParametro(Testo);
    while (C <> '') or (Length(Testo) > 0) do
    begin
      R.Add(C);
      C := RicercaParametro(Testo);
    end;
    // Ovviamente procede solo se è stato trovato qualcosa
    if R.Count > 0 then
    begin
      // Se non c'è il WHERE lo mette
      if WhereExists(SQL) = -1 then
        SQL.Add('WHERE');
      // Se l'ultima linea contiene il WHERE alla fine allora non mette
      // l'AND prima della condizione da inserire altrimenti lo mette;
      if (Trim(Uppercase(RightStr(SQL[SQL.Count - 1], 5))) = 'WHERE') or not MettiAND then
        SQL.Add('(')
      else
        SQL.Add('AND (');
      // Ora cicla per tutte le parole da ricercare e aggiunge le opportune clausole WHERE
      AggiungiAnd := False;
      for i := 0 to R.Count - 1 do
      begin
        // Se la parola da ricercare attuale  è nulla nel senso che magari l'utente ha
        // fatto una ricerca per "I Tecnici" la prima lettera (I) una volta elaborata viene
        // eliminata e questo fa scatenare un errore. Quindi in questo caso la scartiamo
        if R[i] <> '' then
        begin
          // Costruisce su C la linea con la consizione da aggiungere
          C := 'UPPER(' + Campo + ') LIKE UPPER(' + QuotedStr(DM1.AddJollyChar(R[i])) + ')';
          // Se non è la prima condizione aggiunge l'AND
          if AggiungiAnd then
            C := 'AND ' + C;
          // Aggiunge la condizione ottenuta
          SQL.Add(C);
          // Imposta il flag che indica al programma che nei prossimi passaggi deve aggiungere l'AND
          AggiungiAnd := True;
        end;
      end;
      SQL.Add(')'); // Per sicurezza racchiude le clausole agiunte tra parentesi
    end;
  finally
    R.Free;
  end;
end;

function TDM1.RicercaParametro(var Testo: String): String;
var
  Pos1: Integer;
  LastChar: String[1];
begin
  // Questa funzione ricerca parametri di ricerca e ritorna il primo
  // praticamente ricerca se ci sono spazi vuoti e ritorna il testo
  // precedente al primo spazio trovato
  // --------------------------------------------------------------------------
  // Inizializzazione
  Result := '';
  // Prima di tutto trimma la stringa ricevuta in modo che  non ci siano spazi inutili
  // e pericolosi all'inizio e alla fine
  Testo := Trim(Testo);
  // Cerca il primo spazio
  Pos1 := Pos(' ', Testo);
  // Se uno spazio è stato trovato ritorna il testo precedente ed elimina il tutto dalla stringa
  // di ricerca altrimenti ritorna tutto il testo.
  if Pos1 > 0 then
  begin
    Result := RitornaTestoPrimaDi(' ', Testo, True);
  end
  else
  begin
    Result := Testo;
    Testo := '';
  end;
  // Se l'ultima lettera del parametro di ricerca appena trovato è una vocale la elimina
  // in questo modo trova tutto senza il problema del singolare o plurale
  if Result <> '' then
  begin
    LastChar := Uppercase(Result[Length(Result)]);
    if (LastChar = 'A') or (LastChar = 'E') or (LastChar = 'I') or (LastChar = 'O') or (LastChar = 'U') then
      Result := LeftStr(Result, Length(Result) - 1);
  end;
end;

function TDM1.RicercaParametroQuotato(var Testo: String): String;
var
  Pos1, Pos2: Integer;
begin
  // Questa funzione cerca eventuali parametri di ricerca quotati e se ne trova lo ritorna eliminandolo
  // dalla stringa di ricerca stessa.
  // --------------------------------------------------------------------------------------------------
  // Inizializzazione
  Result := '';
  // Cerca il primo carattere " e se non lo trova esce restituendo ''
  Pos1 := PosEx('"', Testo, 1);
  if Pos1 = 0 then
    Exit;
  // Cerca il secondo carattere " e se non lo trova esce restituendo ''
  Pos2 := PosEx('"', Testo, Pos1 + 1);
  if Pos2 = 0 then
    Exit;
  // Ora preleva il testo compreso tra questi caratteri e lo ritorna come
  // parametro di ricerca (ovviamente senza apici)
  Result := Copy(Testo, Pos1 + 1, Pos2 - Pos1 - 1); // Con +1 e -1 evito di prendere anche gli apici
  // Elimina il parametro appena prelevato dal testo di ricerca
  Delete(Testo, Pos1, Pos2 - Pos1 + 1);
end;

function TDM1.WhereExists(SQL: TStrings): Integer;
var
  i: Integer;
begin
  // Questa funzione verifica se nell'enunciato query esiste già il WHERE oppure no
  // ------------------------------------------------------------------------------
  // Inizializzazione
  Result := -1;
  // Cicla per tutte li righe che compongono l'enunciato SQL e cerca, se trova ritorna True ed esce
  for i := 0 to SQL.Count - 1 do
  begin
    // Se i primi 5 caratteri contengono la parola WHERE...
    if LeftStr(Uppercase(SQL[i]), 5) = 'WHERE' then
    begin
      Result := i;
      Exit;
    end;
  end;
end;
// ==============================================================================================================

// Funzione che controlla se il tipo documento esteso contiene il marcatore che indica che il
// documento corrente deve essere a sola lettura.
function TDM1.IsReadOnlyDoc(SI: String): Boolean;
begin
  Result := (RightStr(SI, Length(MARCATORE_DOCUMENTO_SOLA_LETTURA)) = MARCATORE_DOCUMENTO_SOLA_LETTURA);
end;

// Funzione che controlla se il tipo documento ricevuto come parametro è un documento di
// ingresso oppure no.
function TDM1.IsDocumentoDiIngresso(T: String): Boolean;
begin
  Result := (T = 'Bolla_entr') or (T = 'Fatt.acqui') or (T = 'N.C.fornit') or (T = 'Ord.fornit');
end;

function TDM1.IsFatturaEletronica(T: String): Boolean;
begin
  Result := (T = 'Fattura') or (T = 'Nota_accre') or (T = 'Fatt.acqui') or (T = 'N.C.fornit');
end;

// Verifica se i documenti esterni sono presenti nell'azienda oppure no
function TDM1.ExternalDocsPresent: Boolean;
var
  Qry: TIB_Cursor;
begin
  // Inizializzazione
  Result := False;

  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*) AS PRESENTE FROM PROGREG WHERE REGISTRO = ''' + EXT_DOC_REGISTRO + '''');
    Qry.Open;
    // Ritorna il risultato
    Result := Qry.Fields[0].AsInteger > 0;
  finally
    Qry.Free;
  end;
end;

// Procedura che apre il documento fiscale
procedure TDM1.ApplicationEvents1ShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
begin
  // Enable/Disable hints for the application
  CanShow := DM1.HINT_ENABLED;
end;

procedure TDM1.ApriDocFisc(TipoDoc: String; NumDoc: Longint; Registro: String; DataDoc: TDateTime; Modifica: Boolean = False; AForceRecalc: Boolean = False);
begin
  ShowWait('Levante', 'Operazione in corso...');
  try
    Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
    PreventiviOrdiniForm.Parent := MainForm;
    PreventiviOrdiniForm.DistintaBase := False;
    PreventiviOrdiniForm.TipoDoc := TipoDoc;
    PreventiviOrdiniForm.NumeroDoc := NumDoc;
    PreventiviOrdiniForm.Registro := Registro;
    PreventiviOrdiniForm.DataDoc := DataDoc;
    if Modifica then
      PreventiviOrdiniForm.Tag := MODE_TELETRASPORTO
    else
      PreventiviOrdiniForm.Tag := MODE_OPEN;
    PreventiviOrdiniForm.Show;
    if AForceRecalc then
      PreventiviOrdiniForm.CalcolaTotali(AForceRecalc);
  finally
    DM1.CloseWait;
  end;
end;

procedure TDM1.ApriDocFiscLocalizzaRigo(TipoDoc: String; NumDoc: Longint; Registro: String; DataDoc: TDateTime; GUIDToSearch: String;
  Modifica: Boolean = False);
begin
  // Apre il documento
  ApriDocFisc(TipoDoc, NumDoc, Registro, DataDoc, Modifica);
  // Localizza il rigo voluto
  if not PreventiviOrdiniForm.LocateGUID(PreventiviOrdiniForm.tvCorpo.DataController, GUIDToSearch) then
  begin
    DM1.Messaggi('Levante', 'Rigo non individuato...', '', [mbOk], 0, nil);
  end;
end;

function TDM1.CalcolaImportoScontato(Importo: Double; S1, S2, S3: Real; Decimali: Byte): Double;
begin
  // Questa funzione calcola l'importo scontato dell'importo ricevuto e in base ai 3 possibili sconti che riceve
  // -----------------------------------------------------------------------------------------------------------
  if S1 <> 0 then
    Importo := Importo - (Importo * S1 / 100);
  if S2 <> 0 then
    Importo := Importo - (Importo * S2 / 100);
  if S3 <> 0 then
    Importo := Importo - (Importo * S3 / 100);
  Result := Arrotonda(Importo, Decimali);
end;

function TDM1.CalcolaSconto(ImportoDaScontare, ImportoScontato: Double; Decimali: Byte): Double;
begin
  // Questa funzione calcola lo sconto a partire da un importo da scontare e da quello già scontato
  // -----------------------------------------------------------------------------------------------------------
  Result := 0;
  if ImportoDaScontare = 0 then
    Exit;
  Result := (ImportoDaScontare - ImportoScontato) * 100 / ImportoDaScontare;
  Result := Arrotonda(Result, Decimali);
end;

function TDM1.DefaultAbilitaMovMag: Boolean;
var
  Qry: TIB_Cursor;
  Tabella: String;
begin
  // Questa funzione ritorna il valore del flag
  // ------------------------------------------
  Result := False;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DEFAULTABILITAMOVMAG FROM PROGRESS');
    Qry.Open;
    if not Qry.Eof then
      Result := (Qry.Fields[0].AsString = 'T');
  finally
    Qry.Free;
  end;
end;

function TDM1.DisplayTextsBlankIfZero(DC: TcxCustomDataController; RI, CI: Integer): String;
begin
  // Default per il valore da ritornare
  Result := '';
  // Controlla che il valore non sia nullo
  if VarIsNull(DC.Values[RI, CI]) then
    Exit;
  // Se il valore <> 0 ritorna il valore stesso come stringa, altrimenti lascia la stringa nulla
  if DC.Values[RI, CI] <> 0 then
    Result := DC.DisplayTexts[RI, CI];
end;

procedure TDM1.SostituisciArticolo(Modalita: Byte);
begin
  // Questa procedura si occupa di richiamare la form della sostituzione degli articoli
  // provvedendo anche a crea la form e a impostarla in base al parametro ricevuto.
  // ----------------------------------------------------------------------------------
  if SostArtForm = nil then
  begin
    Application.CreateForm(TSostArtForm, SostArtForm);
    SostArtForm.Parent := MainForm;
    SostArtForm.Modalita := Modalita;
    SostArtForm.Show;
  end;
end;

function TDM1.CheckIfExpandable(MDC: TcxCustomDataController; RI: Integer; ForAllDetailLevel: Boolean = False): Boolean;
// var
// DDC:TcxCustomDataController;
begin
  // Questa funzione ritorna True se il rigo specificato dai parametri contiene dei sottorighi
  // -----------------------------------------------------------------------------------------
  Result := MDC.IsDetailDataControllerExist(RI, RELATION_IDX_SOTTORIGHI_NORMALI);
  // Se viene specificato di voler controllare se il rigo è espandibile rispetto anche a eventuali
  // sottorighi di manodopera...
  if ForAllDetailLevel then
    Result := Result or MDC.IsDetailDataControllerExist(RI, RELATION_IDX_SOTTORIGHI_ORE);
  { *** VECCHIA VERSIONE PIU' LENTA ***
    // DDC punta al DetailDataController
    DDC := MDC.GetDetailDataController(RI, 0);
    Result := (DDC.RecordCount > 0);
  }
end;

procedure TDM1.CopyRowDevExpress(SDC: TcxCustomDataController; SRI: Integer; DDC: TcxCustomDataController; DRI: Integer; QtaMasterRow: Double;
  QtaDetailRowIndex: Integer);
var
  i, NRI: Integer; // NRI = NewRoWsIndex
begin
  // Questa procedura effettua una copia del rigo dal DataController sorgente (SDC) ed esattamente del rigo con indice SRI
  // sul DataController destinazione (DDC) sul rigo con indice DRI.
  // NB: Ovviamente i due DataController devono avere una struttura identica.
  // ---------------------------------------------------------------------------------------------------------------------
  // Inserisce un nuovo record nel DataController destinazione e prima del rocord puntato da DRI (DestinationRowIndex)
  // e ne memorizza l'indice in NRI (NewRecordIndex)
  NRI := DDC.InsertRecord(DRI);
  // Cicla per tutte le colonne (Items) per effttuarne la copia.
  // Esattamente tante volte quante sono le colonne contenute nel datacontroller che
  // ne copntiene di meno.
  for i := 0 to MinIntValue([SDC.ItemCount, DDC.ItemCount]) - 1 do
  begin
    // Se il valore da copiare nel DataController sorgente <> nullo
    if not VarIsNull(SDC.Values[SRI, i]) then
    begin
      // Nel caso l'Index della colonna attuale corrisponda a quello della Qtà
      // e se l'indice della colonna Qtà specificato dal parametro <> -1
      // provvede a creare i nuovi righi con Qtà moltiplicata per la Qtà del rigo principale
      if (QtaDetailRowIndex <> -1) and (i = QtaDetailRowIndex) then
        DDC.Values[NRI, i] := (SDC.Values[SRI, i] * QtaMasterRow)
      else
        DDC.Values[NRI, i] := SDC.Values[SRI, i];
      // Ricalcola i totali del rigo
      if DM1.ScorporoIVA then
      begin
        PreventiviOrdiniForm.CalcolaPerModificaPrezzoUnitarioIVACompresa(NRI, DDC);
        PreventiviOrdiniForm.CalcolaImportoRigo(DDC, NRI);
      end
      else
      begin
        PreventiviOrdiniForm.CalcolaPerModificaPrezzoUnitario(NRI, DDC);
        PreventiviOrdiniForm.CalcolaImportoRigo(DDC, NRI);
      end;
    end;
  end;
end;

function TDM1.MinutiToStr(M: Double): String;
var
  Ore, Minuti: Integer;
begin
  Result := '';
  // Questa funzione riceve un numero di minuti e crea una stringa
  // con lo stesso valore convertito in ore e minuti in forma estesa.
  Ore := Trunc(M / 60);
  Minuti := Trunc(M - (Ore * 60));
  // Se le ore sono > 0 aggiunge le ore al risultato
  if Ore > 0 then
  begin
    Result := IntToStr(Ore);
    if Ore = 1 then
      Result := Result + ' ora'
    else
      Result := Result + ' ore';
  end;
  // Se i minuti sono > 0 aggiunge anche i minuti
  if Minuti > 0 then
  begin
    // Se Result <> '' significa che sono state già aggiunte delle ore
    // e quindi aggiunge la 'e'
    if Result <> '' then
      Result := Result + ' e ';
    Result := Result + IntToStr(Minuti);
    if Minuti = 1 then
      Result := Result + ' minuto'
    else
      Result := Result + ' minuti';
  end;
end;

procedure TDM1.CopyAllRowsDevExpress(SDC, DDC: TcxCustomDataController; DRI: Integer; QtaMasterRow: Double; QtaDetailRowIndex: Integer);
var
  i: Integer;
begin
  // Questa procedura effettua la copia di tutti i righi contenuti nel datacontroller di origine (SDC)
  // all'interno del Datacontroller destinazione (DDC) inserendoli nel rigo con indice DRI (DestinationRowIndex)
  // ------------------------------------------------------------------------------------------------------------
  // Cicla per tutti i records del DataController sorgente (NB: Cicla alla rovescio)
  // ed effettua la copia del record corrente.
  for i := SDC.RecordCount - 1 downto 0 do
  begin
    // Se la Qtà = 0 evita di copiare il rigo
    if (not VarIsNull(SDC.Values[i, QtaDetailRowIndex])) and (SDC.Values[i, QtaDetailRowIndex] <> 0) then
    begin
      CopyRowDevExpress(SDC, i, DDC, DRI, QtaMasterRow, QtaDetailRowIndex);
    end;
  end;
end;

function TDM1.DateToItalianLongDate(D: TDate): String;
var
  Year, Month, Day: Word;
  MeseStr: String;
begin
  // Questa funzione converte una data ricevuta nel formato lungo italiano
  // ES: Parametro "01/01/2004" --> "01 gennaio 2004"
  // ---------------------------------------------------------------------
  begin
    // Scompone la data
    DecodeDate(D, Year, Month, Day);
    // Imposta in MeseStr il nome italiano completa del mese
    case Month of
      1:
        MeseStr := 'gennaio';
      2:
        MeseStr := 'febbraio';
      3:
        MeseStr := 'marzo';
      4:
        MeseStr := 'aprile';
      5:
        MeseStr := 'maggio';
      6:
        MeseStr := 'giugno';
      7:
        MeseStr := 'luglio';
      8:
        MeseStr := 'agosto';
      9:
        MeseStr := 'settembre';
      10:
        MeseStr := 'ottobre';
      11:
        MeseStr := 'novembre';
      12:
        MeseStr := 'dicembre';
    end;
    // Compone la stringa da ritornare
    Result := IntToStr(Day) + ' ' + MeseStr + ' ' + IntToStr(Year);
  end;
end;

// ====================================================================================================================
// FUNZIONI E PROCEDURE PER LA STAMPA DEI TOTALI
// --------------------------------------------------------------------------------------------------------------------
procedure TDM1.ResetPrintTotals;
begin
  // Resetta a 0 (zero) il valore da sottrarre alla larghezza del canvas della stampa per trovare il limite destro
  // del prossimo totale che verrà stampato.
  TotalRight := 0;
end;

procedure TDM1.AddTotalSeparation(SepWidth, ANom, ADenom: Integer);
begin
  // Aggiunge il parametro SepWidth opportunamente modificato in base a ANom e ADenom
  // in modo da creare una certa separazione dal totale precedente a quello successivo
  Inc(TotalRight, MulDiv(SepWidth, ANom, ADenom));
end;

procedure TDM1.AddPrintTotal(ACanvas: TCanvas; ARect: TRect; Caption, Value: String; Evidenza: Boolean; AWidth, ANom, ADenom: Integer; Position: Byte);
var
  R: TRect;
  XX, YY: Integer;
  TOTAL_HEIGHT, TOTAL_CAPTION_X_OFFSET, TOTAL_CAPTION_Y_OFFSET, TOTAL_DIST_FROM_LINE, TOTAL_CAPTION_FONT_HEIGHT, TOTAL_FONT_HEIGHT, TOTAL_X_OFFSET,
    TOTAL_Y_OFFSET, TOTAL_FRAME_WIDTH: Integer;
begin
  // Imposta il valore di alcune variabili tenendo presente i fattori di Magnificazione e Demagnificazione
  AWidth := MulDiv(AWidth, ANom, ADenom);
  TOTAL_HEIGHT := MulDiv(27, ANom, ADenom);
  TOTAL_CAPTION_X_OFFSET := MulDiv(2, ANom, ADenom);
  TOTAL_CAPTION_Y_OFFSET := MulDiv(2, ANom, ADenom);
  TOTAL_DIST_FROM_LINE := MulDiv(0, ANom, ADenom);
  TOTAL_CAPTION_FONT_HEIGHT := MulDiv(8, ANom, ADenom);
  TOTAL_FONT_HEIGHT := MulDiv(14, ANom, ADenom);
  TOTAL_X_OFFSET := MulDiv(3, ANom, ADenom);
  TOTAL_Y_OFFSET := MulDiv(1, ANom, ADenom);
  TOTAL_FRAME_WIDTH := MulDiv(1, ANom, ADenom);
  // Imposta dimensione e posizione del TRect del totale attuale variando in base se deve essere stampato
  // nel PageHeader o nel PageFooter
  case Position of
    TP_PAGE_HEADER:
      begin
        R.Right := ARect.Right - TotalRight;
        R.Left := R.Right - AWidth;
        R.Bottom := ARect.Bottom - TOTAL_DIST_FROM_LINE;
        R.Top := R.Bottom - TOTAL_HEIGHT;
      end;
    TP_PAGE_FOOTER:
      begin
        R.Right := ARect.Right - TotalRight;
        R.Left := R.Right - AWidth;
        R.Top := ARect.Top + TOTAL_DIST_FROM_LINE;
        R.Bottom := R.Top + TOTAL_HEIGHT;
      end;
  end;
  // Se in evidenza...
  if Evidenza then
  begin
    ACanvas.Pen.Width := 1;
    ACanvas.Pen.Color := clBlue;
    ACanvas.Brush.Color := clSilver;
    ACanvas.Brush.Style := bsSolid;
    // Altrimenti se non è in evidenza...
  end
  else
  begin
    ACanvas.Pen.Width := 1;
    ACanvas.Pen.Color := clBlue;
    ACanvas.Brush.Color := clWhite;
    ACanvas.Brush.Style := bsSolid;
  end;
  // Disegna il rettangolo esterno
  ACanvas.Rectangle(R);
  // Disegna il valore del Totale attuale
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Color := clBlack;
  ACanvas.Font.Style := [fsBold];
  ACanvas.Font.Height := TOTAL_FONT_HEIGHT;
  XX := R.Right - ACanvas.TextWidth(Value) - TOTAL_X_OFFSET;
  YY := R.Bottom - ACanvas.TextHeight(Value) - TOTAL_Y_OFFSET;
  ACanvas.TextRect(Rect(R.Left + TOTAL_FRAME_WIDTH, R.Top + TOTAL_FRAME_WIDTH, R.Right - TOTAL_FRAME_WIDTH, R.Bottom - TOTAL_FRAME_WIDTH), XX, YY, Value);
  // Disegna la Caption del totale attuale
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Color := clBlue;
  ACanvas.Font.Style := [];
  ACanvas.Font.Height := TOTAL_CAPTION_FONT_HEIGHT;
  ACanvas.TextOut(R.Left + TOTAL_CAPTION_X_OFFSET, R.Top + TOTAL_CAPTION_Y_OFFSET, Caption);
  // Ridisegna la linea più spessa superiore perchè è stata sovrascritta dal rettangolo del totale
  case Position of
    TP_PAGE_HEADER:
      begin
        ACanvas.Pen.Width := MulDiv(2, ANom, ADenom);
        ACanvas.MoveTo(R.Left, R.Bottom - (ACanvas.Pen.Width div 2));
        ACanvas.LineTo(R.Right, R.Bottom - (ACanvas.Pen.Width div 2));
      end;
    TP_PAGE_FOOTER:
      begin
        ACanvas.Pen.Width := MulDiv(2, ANom, ADenom);
        ACanvas.MoveTo(R.Left, R.Top + (ACanvas.Pen.Width div 2));
        ACanvas.LineTo(R.Right, R.Top + (ACanvas.Pen.Width div 2));
      end;
  end;
  // Aggiorna il valore della variabile globale "TotalRight"
  Inc(TotalRight, AWidth - MulDiv(1, ANom, ADenom));
end;

procedure TDM1.dxPrinterDefaultDrawPageFooter(AReportLink: TBasedxReportLink; ACanvas: TCanvas; APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
  PrintLine: Boolean = True);
var
  S: String;
begin
  // IMposta il brush a bianco o trasparente altrimenti in anteprima ci sono dei brutti rettangoli neri
  ACanvas.Brush.Color := clWhite;
  ACanvas.Brush.Style := bsClear;

  // Inizializza la stringa da stampare nel footer della pagina
  S := 'Stampa eseguita con software gestionale Levante   -   ' + DateToStr(Date) + '   -   Pagina ' + IntToStr(APageIndex + 1) + ' di ' +
    IntToStr(AReportLink.PageCount);
  // Disegna una riga orizzontale di spessore maggiorano
  if PrintLine then
  begin
    ACanvas.Pen.Color := clBlue;
    ACanvas.Pen.Width := MulDiv(2, ANom, ADenom);
    ACanvas.Pen.Style := psSolid;
    ACanvas.MoveTo(ARect.Left, ARect.Top + (ACanvas.Pen.Width div 2));
    ACanvas.LineTo(ARect.Right, ARect.Top + (ACanvas.Pen.Width div 2));
  end;
  // Scritta Levante
  if (AReportLink.Name <> 'GridPartitarioLink') and (AReportLink.Name <> 'GridPrimanotaLink') then
  begin
    ACanvas.TextOut(ARect.Left, ARect.Top + (ACanvas.Pen.Width div 2) + MulDiv(2, ANom, ADenom), S);
  end;
end;

procedure TDM1.dxPrinterDefaultDrawPageHeader(AReportLink: TBasedxReportLink; ACanvas: TCanvas; var ARect: TRect; ANom, ADenom: Integer;
  PrintLine: Boolean = True);
var
  S: String;
  DataDellaStampa: TDate;
begin
  // IMposta il brush a bianco o trasparente altrimenti in anteprima ci sono dei brutti rettangoli neri
  ACanvas.Brush.Color := clWhite;
  ACanvas.Brush.Style := bsClear;

  // Inizializza la stringa da stampare nel footer della pagina
  S := AReportLink.ReportTitle.Text;
  if Trim(ClientiForm.RagSocCS) <> '' then
    S := S + ' - ' + Trim(ClientiForm.RagSocCS);
  if Trim(ClientiForm.DescPraticaCorrente) <> '' then
    S := S + ' - ' + Trim(ClientiForm.DescPraticaCorrente);

  // Se siamo nella stampa dell'inventario ultimo costo ed è specificata una data nel filtro dell'elenco articoli
  // riporta tale data nella stampa, altrimenti riporta la data attuale
  if (AReportLink.Name = 'GridArtInventarioUltimoCostoLink') and (DM1.ControllaDataStr(ClientiForm.EditArtDataMagazzino.Text)) then
  begin
    DataDellaStampa := StrToDate(Trim(ClientiForm.EditArtDataMagazzino.Text));
    S := S + '   (' + DateToStr(DataDellaStampa) + ')';
  end;

  // Stampa l'eventuale indicazione del range di date per cui sono filtrati i dati che vanno stampati
  if DM1.fReportRangeDate <> '' then
  begin
    S := S + ' - ' + DM1.fReportRangeDate;
  end;

  // Disegna una riga orizzontale di spessore maggiorato
  if PrintLine then
  begin
    ACanvas.Pen.Color := clBlue;
    ACanvas.Pen.Width := MulDiv(2, ANom, ADenom);
    ACanvas.Pen.Style := psSolid;
    ACanvas.MoveTo(ARect.Left, ARect.Bottom - (ACanvas.Pen.Width div 2));
    ACanvas.LineTo(ARect.Right, ARect.Bottom - (ACanvas.Pen.Width div 2));
  end;
  // Scritta Levante
  // ACanvas.Font.Name    := 'Arial';
  // ACanvas.Font.Height  := MulDiv(12, ANom, ADenom);
  // ACanvas.Font.Color   := clBlue;
  // ACanvas.Font.Style   := [fsBold, fsItalic];
  ACanvas.TextOut(ARect.Left, (ARect.Bottom - (ACanvas.Pen.Width div 2) - MulDiv(3, ANom, ADenom) - ACanvas.TextHeight(S)), S);
end;

procedure TDM1.PrepareGridForReport(G: TcxGrid; MultiLineText: Boolean);
var
  i, CI: Integer;
  tv: TcxGridTableView;
  Temp: String;
begin
  // Svuota l'array
  SetLength(GridColumnToMakeInvisibleWhenPrinting, 0);
  // Cicla per tutte le view della griglia
  for i := 0 to G.ViewCount - 1 do
  begin
    // Solo le table view altrimenti quando stampa ad es. un grafico da un errore
    if G.Views[i] is TcxGridTableView then
    begin
      // tv Punta alla View corrente
      tv := G.Views[i] as TcxGridTableView;
      // Aggiunge all'array un elemento per la vista attuale
      SetLength(GridColumnToMakeInvisibleWhenPrinting, Length(GridColumnToMakeInvisibleWhenPrinting) + 1);
      SetLength(GridColumnToMakeInvisibleWhenPrinting[Length(GridColumnToMakeInvisibleWhenPrinting) - 1], 0);

      // Tutte le colonne con Tag = -1 (significa che sono collnne che non dovranno essere stampate) e che sono visibili
      // attualmente a video dovranno essere rese invisibili nella stampa. Gli indici di queste colonne saranno annotati
      // nell'apposito array dinamico per poter poi essere ripristinate visibili alla fine della stampa stessa
      // -----------------------------------------------------------------------------------------------------------------
      for CI := 0 to tv.ColumnCount - 1 do
      begin
        if (tv.Columns[CI].Tag = -1) and tv.Columns[CI].Visible then
        begin
          SetLength(GridColumnToMakeInvisibleWhenPrinting[i], Length(GridColumnToMakeInvisibleWhenPrinting[i]) + 1);
          GridColumnToMakeInvisibleWhenPrinting[i, Length(GridColumnToMakeInvisibleWhenPrinting[i]) - 1] := CI;
          tv.Columns[CI].Visible := False;
        end;
      end;
      // -----------------------------------------------------------------------------------------------------------------

      // Questa procedura effettua alcuni cambiamenti estetici nella griglia ricevuta come parametro
      // per prepararla alla fase di generazione della stampa.
      // -----------------------------------------------------------------------------------------------------------------
      // Le linee di separazione delle colonne devono essere blu
      tv.OptionsView.GridLineColor := clBlue;
      // Modifica lo Style sheet della View
      tv.Styles.StyleSheet := DM1.PrintStyleSheet;
      // -----------------------------------------------------------------------------------------------------------------

      // Se il parametro MultiLineText = True imposta la griglia in modo che se una dicitura non ci sta in larghezza continua
      // aumenta l'altezza della riga e va a capo.
      // -----------------------------------------------------------------------------------------------------------------
      if MultiLineText then
      begin
        // Salva i valori precedente
        GridPrintingPrecCellAutoHeight := tv.OptionsView.CellAutoHeight;
        GridPrintingPrecDataRowHeight := tv.OptionsView.DataRowHeight;
        // Imposta la stampa multiline
        tv.OptionsView.CellAutoHeight := True;
        tv.OptionsView.DataRowHeight := 0;
      end;
      // -----------------------------------------------------------------------------------------------------------------
    end;
  end;
end;

procedure TDM1.RestoreGridAfterReport(G: TcxGrid; MultiLineText: Boolean);
var
  i, CI: Integer;
  tv: TcxGridTableView;
begin
  // Cicla per tutte le view della griglia
  for i := 0 to G.ViewCount - 1 do
  begin
    // Solo le table view altrimenti quando stampa ad es. un grafico da un errore
    if G.Views[i] is TcxGridTableView then
    begin
      // tv Punta alla View corrente
      tv := G.Views[i] as TcxGridTableView;

      // Ripristina visibili le colonne che erano state rese invisibili prima della stampa
      // -----------------------------------------------------------------------------------------------------------------
      for CI := 0 to Length(GridColumnToMakeInvisibleWhenPrinting[i]) - 1 do
      begin
        tv.Columns[GridColumnToMakeInvisibleWhenPrinting[i, CI]].Visible := True;
      end;
      // -----------------------------------------------------------------------------------------------------------------

      // Questa procedura effettua alcuni cambiamenti estetici nella griglia ricevuta come parametro
      // per rimetterla a posto dopo la stampa.
      // -----------------------------------------------------------------------------------------------------------------
      // Le linee di separazione delle colonne devono essere blu
      tv.OptionsView.GridLineColor := clDefault;
      // Modifica lo Style sheet della View
      tv.Styles.StyleSheet := DM1.MasterTableViewStyleSheet;
      // -----------------------------------------------------------------------------------------------------------------

      // Ripristina i valori delle proprietà per la stampa multiline
      // -----------------------------------------------------------------------------------------------------------------
      if MultiLineText then
      begin
        // Salva i valori precedente
        tv.OptionsView.CellAutoHeight := GridPrintingPrecCellAutoHeight;
        tv.OptionsView.DataRowHeight := GridPrintingPrecDataRowHeight;
      end;
      // -----------------------------------------------------------------------------------------------------------------
    end;
  end;
end;

// ====================================================================================================================

procedure TDM1.CaricaParametriProgressivi;
begin
  // Carica i dati della manodopera nella struttura apposita
  Manodopera[0].Codice := Uppercase(TableProgressiviCODICEOPERA.AsString);
  Manodopera[0].Descrizione := TableProgressiviDESCRIZIONEOPERA.AsString;
  Manodopera[0].UM := 'H';
  Manodopera[0].PrezzoUnitario1 := TableProgressiviPRZUNITOPERA1.AsCurrency;
  Manodopera[0].CostoUnitario := TableProgressiviCOSTOUNITOPERA1.AsCurrency;

  Manodopera[1].Codice := Uppercase(TableProgressiviCODICEOPERA_2.AsString);
  Manodopera[1].Descrizione := TableProgressiviDESCRIZIONEOPERA_2.AsString;
  Manodopera[1].UM := 'H';
  Manodopera[1].PrezzoUnitario1 := TableProgressiviPRZUNITOPERA1_2.AsCurrency;
  Manodopera[1].CostoUnitario := TableProgressiviCOSTOUNITOPERA1_2.AsCurrency;

  Manodopera[2].Codice := Uppercase(TableProgressiviCODICEOPERA_3.AsString);
  Manodopera[2].Descrizione := TableProgressiviDESCRIZIONEOPERA_3.AsString;
  Manodopera[2].UM := 'H';
  Manodopera[2].PrezzoUnitario1 := TableProgressiviPRZUNITOPERA1_3.AsCurrency;
  Manodopera[2].CostoUnitario := TableProgressiviCOSTOUNITOPERA1_3.AsCurrency;

  Manodopera[3].Codice := Uppercase(TableProgressiviCODICEOPERA_4.AsString);
  Manodopera[3].Descrizione := TableProgressiviDESCRIZIONEOPERA_4.AsString;
  Manodopera[3].UM := 'H';
  Manodopera[3].PrezzoUnitario1 := TableProgressiviPRZUNITOPERA1_4.AsCurrency;
  Manodopera[3].CostoUnitario := TableProgressiviCOSTOUNITOPERA1_4.AsCurrency;

  Manodopera[4].Codice := Uppercase(TableProgressiviCODICEOPERA_5.AsString);
  Manodopera[4].Descrizione := TableProgressiviDESCRIZIONEOPERA_5.AsString;
  Manodopera[4].UM := 'H';
  Manodopera[4].PrezzoUnitario1 := TableProgressiviPRZUNITOPERA1_5.AsCurrency;
  Manodopera[4].CostoUnitario := TableProgressiviCOSTOUNITOPERA1_5.AsCurrency;

  // Carica il parametro che stabilisce se il filtro "Visualizza solo gli articoli PREFERITI"
  // è abilitato per default oppure no.
  DefaultVisualizzaSoloArticoliPreferiti := (TableProgressiviDEFAULTSOLOARTPREFERITI.AsString = 'T');
  // Carica il parametro per evidenziare i documenti con consegna entro...
  EvidenziaDocumentiConsegnaEntro := TableProgressiviEVIDENZIACONSEGNAENTRO.AsInteger;
  // Carica il parametri che indica il tipo di calcolo da utilizzare per calcolare i listini di vendita
  TipoCalcoloListiniVenditaDefault := TableProgressiviTIPOCALCOLOLISTINIARTICOLI.AsString;
end;

function TDM1.DiBaPrezzoAcquisto(CodArt: String): Currency;
var
  Qry: TIB_Cursor;
begin
  // Questa funzione verifica la presenza o meno del documento specificato nei parametri
  Result := 0;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT SUM(A.ULTIMOPRZACQUISTO * R.QTA) AS TOTALE FROM RIGHIPRV R');
    Qry.SQL.Add('LEFT JOIN ARTICOLI A ON (A.CODICEARTICOLO = R.CODICEARTICOLO)');
    Qry.SQL.Add('WHERE R.TIPODOCUMENTO = ''' + CodArt + '''');
    Qry.Open;
    Result := Qry.FieldByName('TOTALE').AsCurrency;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.Messaggi(Titolo, Messaggio, Note: String; Btn: TMsgDlgButtons; KeyPressChar: Word; KeyPressProcedure: TKeyPressProcedure): TModalResult;
begin
  // Crea la Dialog
  Application.CreateForm(TMessageForm, MessageForm);
  // Assegna i parametri
  MessageForm.Caption := Titolo;
  MessageForm.Msg.Lines.Clear;
  MessageForm.Note.Lines.Clear;
  MessageForm.KeyPressChar := KeyPressChar;
  MessageForm.KeyPressProcedure := KeyPressProcedure;
  // Carica il messaggio
  MessageForm.Msg.Lines.Add('');
  while Pos(#13, Messaggio) > 0 do
    MessageForm.Msg.Lines.Add(DM1.RitornaTestoPrimaDi(#13, Messaggio, True));
  MessageForm.Msg.Lines.Add(Messaggio);
  MessageForm.Msg.Lines.Add('');
  // Carica le note se sono state passate, altrimenti fà in modo che sia come se non ci fossero
  if Note <> '' then
  begin
    MessageForm.Msg.Lines.Add('');
    while Pos(#13, Note) > 0 do
      MessageForm.Note.Lines.Add(DM1.RitornaTestoPrimaDi(#13, Note, True));
    MessageForm.Note.Lines.Add(Note);
    MessageForm.Note.Lines.Add('');
  end;
  // Rende visibili solo i pulsanti elencati nel parametro Btn
  MessageForm.BtnSi.Visible := mbYes in Btn;
  MessageForm.BtnNO.Visible := mbNo in Btn;
  MessageForm.BtnOK.Visible := mbOk in Btn;
  MessageForm.BtnAnnulla.Visible := mbCancel in Btn;
  // Visualizza la form
  Result := MessageForm.ShowModal;
end;

function TDM1.IsDelphiRunning: Boolean;
begin
  // Ritorna True se Delphi è in esecuzione
  Result := FindWindow('TAppBuilder', nil) > 0;
end;

function TDM1.GeneraOrderBy(tv: TcxGridDBTableView): String;
var
  FieldName, Order: String;
  i, ii: Integer;
begin
  try
    // Inizializzazione
    Order := '';
    // Cicla per tutte le items (colonne della DBTableView) per cercare quella che ha la proprietà
    // 'SortIndex' = 0 e quindi la colonna per effettuare l'ordinamento.
    // Successivamente aggiunge la linea con l'ORDER BY corretta.
    for i := 0 to tv.SortedItemCount - 1 do
    begin
      // Se è al primo passaggio inserisce la stringa "ORDER BY " all'inizio, se invece è ad un passaggio
      // successivo mette solo la ","
      if i > 0 then
        Order := Order + ',';

      // Se la colonna punta ad un campo reale allora lo considera nell'ordinamento
      // altrimenti no e avvisa l'utente.
      if tv.Columns[tv.SortedItems[i].Index].DataBinding.Field.FieldKind = fkData then
        Order := Order + IntToStr(tv.Columns[tv.SortedItems[i].Index].DataBinding.Field.Index + 1) // Order by con l'indice del campo
      else
        DM1.Messaggi('Levante - Ordinamenti', 'La colonna "' + tv.SortedItems[i].Caption +
          '" non può essere selezionata per l''ordinamento dei dati.'#13#13'Tale colonna non sarà considerata.', '', [mbOk], 0, nil);

      // Se la Column è marcata come in ordinamento discendante inserisce la clausola DESC
      if (tv.SortedItems[i].SortOrder = soDescending) and (Trim(Order) <> '') then
        Order := Order + ' DESC';
    end;
  finally
    // Alla fine controlla, se il valore di ritorno non contiene nulla toglie anche l'ORDER BY
    if Trim(Order) <> '' then
      Order := 'ORDER BY ' + Order;
    // Ritorna il valore ottenuto
    Result := Order;
  end;
end;

procedure TDM1.QGridCustomDrawGroupCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean;
  DescrizioneAggiuntiva: String);
var
  GroupCaption, GroupTotals: String;
  TotalsRect: TRect;
begin
  // Prima di tutto elimina i caratteri precedenti i ":"
  GroupCaption := AViewInfo.Text;
  GroupCaption := DM1.StrRight(GroupCaption, Length(GroupCaption) - Pos(' : ', GroupCaption) - 2);
  // Ovviamente solo se la parentesi esiste
  if Pos(' (', GroupCaption) > 0 then
  begin
    // Preleva il contenuto alla dx della parentesi aperta (totali) e la memorizza in GroupTotals
    GroupTotals := DM1.StrRight(GroupCaption, Length(GroupCaption) - Pos(' (', GroupCaption));
    // Poi fà in modo che GroupCaption contenga solo il testo della acption senza i totali
    // Per farlo pernde il testo prima della parentesi, e se non c'è la parentesi lascia tutto.
    GroupCaption := DM1.StrLeft(GroupCaption, Pos(' (', GroupCaption));
  end;
  // Sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // Visualizza il testo dell'intestazione
  ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
  ACanvas.DrawText(LeftStr(GroupCaption, 65) + DescrizioneAggiuntiva, AViewInfo.TextAreaBounds, cxAlignLeft or cxAlignVCenter);
  // TotalsRec è il nuovo TRect locale per poterlo modificare
  TotalsRect := AViewInfo.TextAreaBounds;
  // Modifica TotalsRec per restringerlo e spostarlo più a dx per la visualizzazione dei totali.
  Inc(TotalsRect.Left, 300);
  // Sfondo
  ACanvas.FillRect(TotalsRect);
  // Visualizza i totali
  ACanvas.Font.Style := ACanvas.Font.Style - [fsBold];
  ACanvas.DrawText('   ' + GroupTotals, TotalsRect, cxAlignLeft or cxAlignVCenter);
  // Disabilita il visualizzazione di default.
  ADone := True;
end;

procedure TDM1.QGridCustomDrawColumnHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
var
  R: TRect;
  X, Y: Integer;
  Titolo: String;
begin
  // Ricava il titolo della colonna da visualizzare
  // Titolo := Sender.Items[AViewInfo.Index].Caption;
  Titolo := AViewInfo.Text;
  // Se non c'è il pulsante del mouse premuto sull'intestazione della colonna e se i dati
  // non sono raggruppati per questa colonna, imposta R in modo che non sia visibile il bordo sx
  // perchè altrimenti  è brutto.
  if (AViewInfo.Column.GroupIndex = -1) and not AViewInfo.IsPressed then
  begin
    R := Rect(AViewInfo.Bounds.Left - 1, AViewInfo.Bounds.Top, AViewInfo.Bounds.Right, AViewInfo.Bounds.Bottom);
    // Però se si inizia il DragDrop dell'intestazione della colonna per il raggruppamento e quando
    // i dati sono raggruppati per la colonna lascia il bordo normale altrimenti non si vedrebbe il bordo sx.
  end
  else
  begin
    R := AViewInfo.Bounds;
  end;
  // IMposta il colore di sfondo dell'intestazione e il font
  // ACanvas.Brush.Color := Sender.Styles.Header.Color;
  // ACanvas.Font.Color  := Sender.Styles.Header.Font.Color;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // Visualizza il testo dell'intestazione
  ACanvas.DrawText(Titolo, AViewInfo.TextAreaBounds, cxAlignHCenter or cxAlignVCenter);
  // Imposta il colore del bordo degli header
  // if Sender.Focused then begin
  // ACanvas.Pen.Color   := clBlack;
  // ACanvas.Brush.Color := clBlack;
  // end else begin
  ACanvas.Pen.Color := Sender.OptionsView.GridLineColor;
  ACanvas.Brush.Color := Sender.OptionsView.GridLineColor;
  // end;
  // DIsegna il bordo dell'intestazione
  ACanvas.FrameRect(R);
  // Se è la colonna di ordinamento visualizza il triangolino
  if AViewInfo.Column.SortIndex > -1 then
  begin
    X := AViewInfo.Bounds.Right - 13;
    Y := AViewInfo.Bounds.Top + 5;
    if AViewInfo.Column.SortOrder = soDescending then
    begin
      ACanvas.Polygon([Point(X, Y), Point(X + 8, Y), Point(X + 4, Y + 7)]);
    end
    else
    begin
      ACanvas.Polygon([Point(X + 4, Y), Point(X + 8, Y + 7), Point(X, Y + 7)]);
    end;
  end;
  // Disabilita il visualizzazione di default.
  ADone := True;
end;

procedure TDM1.QGridCustomDrawBandHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridBandHeaderViewInfo; var ADone: Boolean);
var
  R: TRect;
  X, Y: Integer;
begin
  // imposta R in modo che non sia visibile il bordo sx
  // perchè altrimenti  è brutto.
  R := Rect(AViewInfo.Bounds.Left - 1, AViewInfo.Bounds.Top, AViewInfo.Bounds.Right, AViewInfo.Bounds.Bottom + 1);
  // IMposta il colore di sfondo dell'intestazione e il font
  ACanvas.Brush.Color := Sender.Styles.Header.Color;
  ACanvas.Font.Color := Sender.Styles.Header.Font.Color;
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // Visualizza il testo dell'intestazione
  ACanvas.DrawText(AViewInfo.Text, AViewInfo.TextAreaBounds, cxAlignHCenter or cxAlignVCenter);
  // Imposta il colore del bordo degli header
  // if Sender.Focused then begin
  // ACanvas.Pen.Color   := clBlack;
  // ACanvas.Brush.Color := clBlack;
  // end else begin
  ACanvas.Pen.Color := Sender.OptionsView.GridLineColor;
  ACanvas.Brush.Color := Sender.OptionsView.GridLineColor;
  // end;
  // DIsegna il bordo dell'intestazione
  ACanvas.FrameRect(R);
  // Disabilita il visualizzazione di default.
  ADone := True;
end;

procedure TDM1.QGridCustomDrawPartBackground(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  // Fà in modo che il testo del GroupByBox sia in Italiano
  with AViewInfo do
  begin
    if GetHitTest(Bounds.TopLeft).HitTestCode = htGroupByBox then
    begin
      if Text <> '' then
        Text := 'Trascina qui il titolo della colonna per raggruppare.';
    end;
  end;
end;

// Funzione che apre la form per il Check-In di un documento in ingresso dal Teletrasporto
function TDM1.ConfermaCheckIn: TModalResult;
begin
  Application.CreateForm(TChekInForm, ChekInForm);
  ChekInForm.Parent := MainForm;
  ChekInForm.Show;
  // Cicla finchè non si esce dalla form di CheckIn simulando una chiamata
  // ShowModal del checkin stesso
  while ChekInForm <> nil do
    Application.ProcessMessages;
end;

function TDM1.ConfermaModifiche: TModalResult;
begin
  // Crea e visualizza la Dialog che chiede conferma di salvataggio delle modifiche apportate
  Result := Messaggi('Conferma', 'Confermi le modifiche apportate?', 'NB: Se si sceglie ''NO'' le modifiche andranno perdute.',
    [mbYes, mbNo, mbCancel], 0, nil);
end;

procedure TDM1.ControlEnter(Sender: TObject);
begin
  if Sender is TDBComboBox then
  begin
    if (Sender as TDBComboBox).Color = COLOR_MODIFICA then
      (Sender as TDBComboBox).Color := COLOR_FOCUS;
  end
  else if Sender is TEdit then
  begin
    if (Sender as TEdit).Color = COLOR_MODIFICA then
      (Sender as TEdit).Color := COLOR_FOCUS;
  end
  else if Sender is TDBEdit then
  begin
    if (Sender as TDBEdit).Color = COLOR_MODIFICA then
      (Sender as TDBEdit).Color := COLOR_FOCUS;
  end
  else if Sender is TDBLookupComboBox then
  begin
    if (Sender as TDBLookupComboBox).Color = COLOR_MODIFICA then
      (Sender as TDBLookupComboBox).Color := COLOR_FOCUS;
  end
  else if Sender is TRadioButton then
  begin
    if (Sender as TRadioButton).ParentColor then
      (Sender as TRadioButton).Color := COLOR_FOCUS;
  end
  else if Sender is TCheckBox then
  begin
    if (Sender as TCheckBox).ParentColor then
      (Sender as TCheckBox).Color := COLOR_FOCUS;
  end
  else if Sender is TDBCheckBox then
  begin
    if (Sender as TDBCheckBox).ParentColor then
      (Sender as TDBCheckBox).Color := COLOR_FOCUS;
  end
  else if Sender is TDBRadioGroup then
  begin
    if (Sender as TDBRadioGroup).ParentColor then
      (Sender as TDBRadioGroup).Color := COLOR_FOCUS;
  end
  else if Sender is TDBMemo then
  begin
    if (Sender as TDBMemo).Color = COLOR_MODIFICA then
      (Sender as TDBMemo).Color := COLOR_FOCUS;
  end
  else if Sender is TMaskEdit then
  begin
    if (Sender as TMaskEdit).Color = COLOR_MODIFICA then
      (Sender as TMaskEdit).Color := COLOR_FOCUS;
  end
  else if Sender is TComboBox then
  begin
    if (Sender as TComboBox).Color = COLOR_MODIFICA then
      (Sender as TComboBox).Color := COLOR_FOCUS;
  end
  else if Sender is TDriveComboBox then
  begin
    if (Sender as TDriveComboBox).Color = COLOR_MODIFICA then
      (Sender as TDriveComboBox).Color := COLOR_FOCUS;
  end
  else if Sender is TDBMemo then
  begin
    if (Sender as TDBMemo).Color = COLOR_MODIFICA then
      (Sender as TDBMemo).Color := COLOR_FOCUS;
  end
  else if Sender is TRichEdit then
  begin
    if (Sender as TRichEdit).Color = COLOR_MODIFICA then
      (Sender as TRichEdit).Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBComboBox then
  begin
    if (Sender as TcxDBComboBox).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBComboBox).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBCheckBox then
  begin
    if (Sender as TcxDBCheckBox).ParentColor then
      (Sender as TcxDBCheckBox).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBDateEdit then
  begin
    if (Sender as TcxDBDateEdit).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBDateEdit).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBTimeEdit then
  begin
    if (Sender as TcxDBTimeEdit).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBTimeEdit).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBRadioGroup then
  begin
    if (Sender as TcxDBRadioGroup).ParentColor then
      (Sender as TcxDBRadioGroup).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBCheckListBox then
  begin
    if (Sender as TcxDBCheckListBox).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBCheckListBox).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBLookupComboBox then
  begin
    if (Sender as TcxDBLookupComboBox).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBLookupComboBox).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxTextEdit then
  begin
    if (Sender as TcxTextEdit).Style.Color = COLOR_MODIFICA then
      (Sender as TcxTextEdit).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBTextEdit then
  begin
    if (Sender as TcxDBTextEdit).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBTextEdit).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBButtonEdit then
  begin
    if (Sender as TcxDBButtonEdit).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBButtonEdit).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBRichEdit then
  begin
    if (Sender as TcxDBRichEdit).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBRichEdit).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxComboBox then
  begin
    if (Sender as TcxComboBox).Style.Color = COLOR_MODIFICA then
      (Sender as TcxComboBox).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBBlobEdit then
  begin
    if (Sender as TcxDBBlobEdit).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBBlobEdit).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBRadioGroup then
  begin
    if (Sender as TcxDBRadioGroup).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBRadioGroup).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBMemo then
  begin
    if (Sender as TcxDBMemo).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBMemo).Style.Color := COLOR_FOCUS;
  end
  else if Sender is TcxDBCurrencyEdit then
  begin
    if (Sender as TcxDBCurrencyEdit).Style.Color = COLOR_MODIFICA then
      (Sender as TcxDBCurrencyEdit).Style.Color := COLOR_FOCUS;
  end;
end;

procedure TDM1.ControlExit(Sender: TObject);
begin
  if Sender is TDBComboBox then
  begin
    if (Sender as TDBComboBox).Color = COLOR_FOCUS then
      (Sender as TDBComboBox).Color := COLOR_MODIFICA;
  end
  else if Sender is TEdit then
  begin
    if (Sender as TEdit).Color = COLOR_FOCUS then
      (Sender as TEdit).Color := COLOR_MODIFICA;
  end
  else if Sender is TDBEdit then
  begin
    if (Sender as TDBEdit).Color = COLOR_FOCUS then
      (Sender as TDBEdit).Color := COLOR_MODIFICA;
  end
  else if Sender is TDBLookupComboBox then
  begin
    if (Sender as TDBLookupComboBox).Color = COLOR_FOCUS then
      (Sender as TDBLookupComboBox).Color := COLOR_MODIFICA;
  end
  else if Sender is TRadioButton then
  begin
    if not(Sender as TRadioButton).ParentColor then
      (Sender as TRadioButton).ParentColor := True;;
  end
  else if Sender is TCheckBox then
  begin
    if not(Sender as TCheckBox).ParentColor then
      (Sender as TCheckBox).ParentColor := True;;
  end
  else if Sender is TDBCheckBox then
  begin
    if not(Sender as TDBCheckBox).ParentColor then
      (Sender as TDBCheckBox).ParentColor := True;;
  end
  else if Sender is TDBRadioGroup then
  begin
    if not(Sender as TDBRadioGroup).ParentColor then
      (Sender as TDBRadioGroup).ParentColor := True;;
  end
  else if Sender is TDBMemo then
  begin
    if (Sender as TDBMemo).Color = COLOR_FOCUS then
      (Sender as TDBMemo).Color := COLOR_MODIFICA;
  end
  else if Sender is TMaskEdit then
  begin
    if (Sender as TMaskEdit).Color = COLOR_FOCUS then
      (Sender as TMaskEdit).Color := COLOR_MODIFICA;
  end
  else if Sender is TComboBox then
  begin
    if (Sender as TComboBox).Color = COLOR_FOCUS then
      (Sender as TComboBox).Color := COLOR_MODIFICA;
  end
  else if Sender is TDriveComboBox then
  begin
    if (Sender as TDriveComboBox).Color = COLOR_FOCUS then
      (Sender as TDriveComboBox).Color := COLOR_MODIFICA;
  end
  else if Sender is TDBMemo then
  begin
    if (Sender as TDBMemo).Color = COLOR_FOCUS then
      (Sender as TDBMemo).Color := COLOR_MODIFICA;
  end
  else if Sender is TRichEdit then
  begin
    if (Sender as TRichEdit).Color = COLOR_FOCUS then
      (Sender as TRichEdit).Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBComboBox then
  begin
    if (Sender as TcxDBComboBox).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBComboBox).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBCheckBox then
  begin
    if not(Sender as TcxDBCheckBox).ParentColor then
      (Sender as TcxDBCheckBox).ParentColor := True;;
  end
  else if Sender is TcxDBDateEdit then
  begin
    if (Sender as TcxDBDateEdit).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBDateEdit).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBTimeEdit then
  begin
    if (Sender as TcxDBTimeEdit).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBTimeEdit).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBRadioGroup then
  begin
    if not(Sender as TcxDBRadioGroup).ParentColor then
      (Sender as TcxDBRadioGroup).ParentColor := True;
  end
  else if Sender is TcxDBCheckListBox then
  begin
    if (Sender as TcxDBCheckListBox).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBCheckListBox).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBLookupComboBox then
  begin
    if (Sender as TcxDBLookupComboBox).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBLookupComboBox).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxTextEdit then
  begin
    if (Sender as TcxTextEdit).Style.Color = COLOR_FOCUS then
      (Sender as TcxTextEdit).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBTextEdit then
  begin
    if (Sender as TcxDBTextEdit).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBTextEdit).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBButtonEdit then
  begin
    if (Sender as TcxDBButtonEdit).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBButtonEdit).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBRichEdit then
  begin
    if (Sender as TcxDBRichEdit).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBRichEdit).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxComboBox then
  begin
    if (Sender as TcxComboBox).Style.Color = COLOR_FOCUS then
      (Sender as TcxComboBox).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBBlobEdit then
  begin
    if (Sender as TcxDBBlobEdit).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBBlobEdit).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBRadioGroup then
  begin
    if (Sender as TcxDBRadioGroup).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBRadioGroup).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBMemo then
  begin
    if (Sender as TcxDBMemo).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBMemo).Style.Color := COLOR_MODIFICA;
  end
  else if Sender is TcxDBCurrencyEdit then
  begin
    if (Sender as TcxDBCurrencyEdit).Style.Color = COLOR_FOCUS then
      (Sender as TcxDBCurrencyEdit).Style.Color := COLOR_MODIFICA;
  end;
end;

procedure TDM1.ColoraTuttiCampi(F: TWinControl; C: TColor);
var
  i: Integer;
begin
  // Questa funzione cicla per tutti i controlli e li colora del colore specificato
  // ------------------------------------------------------------------------------
  // Cicla per tutti i controlli della form
  for i := 0 to F.ControlCount - 1 do
  begin
    // Se uno dei seguenti tipo (Pannelli, Form ecc, cioè controlli che possono contenere altri controlli)
    // Richiama ricorsivamente sempre questa funzione per colorare anche i controlli conetnuti in essi
    if (F.Controls[i] is TForm) or (F.Controls[i] is TPanel) or (F.Controls[i] is TScrollBox) or (F.Controls[i] is TPageControl) or (F.Controls[i] is TTabSheet)
      or (F.Controls[i] is TcxPageControl) or (F.Controls[i] is TcxTabSheet) then
    begin
      ColoraTuttiCampi((F.Controls[i] as TWinControl), C);
      // Se invece è uno degli altri tipi di controllo
    end
    else
    begin
      // Se la proprietà Tag del componente <> -1 lo colora altrimenti no
      if F.Controls[i].Tag <> -1 then
      begin
        // Se il controllo corrente è del tipo tra quelli da impostare...
        if F.Controls[i] is TDBEdit then
        begin
          TDBEdit(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TEdit then
        begin
          TEdit(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TMaskEdit then
        begin
          TMaskEdit(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TDBComboBox then
        begin
          TDBComboBox(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TDBLookupComboBox then
        begin
          TDBLookupComboBox(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TComboBox then
        begin
          TComboBox(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TDriveComboBox then
        begin
          TDriveComboBox(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TDBCheckBox then
        begin
          if C = COLOR_FOCUS then
            TDBCheckBox(F.Controls[i]).Color := C
          else
            TDBCheckBox(F.Controls[i]).ParentColor := True;
        end
        else if F.Controls[i] is TDBRadioGroup then
        begin
          if C = COLOR_FOCUS then
            TDBRadioGroup(F.Controls[i]).Color := C
          else
            TDBRadioGroup(F.Controls[i]).ParentColor := True;
        end
        else if F.Controls[i] is TRichEdit then
        begin
          TRichEdit(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TDBMemo then
        begin
          TDBMemo(F.Controls[i]).Color := C;
        end
        else if F.Controls[i] is TcxCurrencyEdit then
        begin
          TcxCurrencyEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBComboBox then
        begin
          TcxDBComboBox(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBDateEdit then
        begin
          TcxDBDateEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBTextEdit then
        begin
          TcxDBTextEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBTimeEdit then
        begin
          TcxDBTimeEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxTextEdit then
        begin
          TcxTextEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBCheckListBox then
        begin
          TcxDBCheckListBox(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBLookupComboBox then
        begin
          TcxDBLookupComboBox(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxComboBox then
        begin
          TcxComboBox(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBButtonEdit then
        begin
          TcxDBButtonEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBRichEdit then
        begin
          TcxDBRichEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBBlobEdit then
        begin
          TcxDBBlobEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBMemo then
        begin
          TcxDBMemo(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBCurrencyEdit then
        begin
          TcxDBCurrencyEdit(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBImageComboBox then
        begin
          TcxDBImageComboBox(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBCheckComboBox then
        begin
          TcxDBCheckComboBox(F.Controls[i]).Style.Color := C;
        end
        else if F.Controls[i] is TcxDBSpinEdit then
        begin
          TcxDBSpinEdit(F.Controls[i]).Style.Color := C;
          // I Radio Group vengono gestini in modo un pò differente
          // In pratica solo se stiamo uscendo dalla modalità di modifica
          // gli rimettiamo la proprietà ParentColor = True.
        end
        else if F.Controls[i] is TcxDBRadioGroup then
        begin
          if (C = COLOR_NORMALE) then
            (F.Controls[i] as TcxDBRadioGroup).ParentColor := True;
          // I TcxDBCheckBox vengono gestini in modo un pò differente
          // In pratica solo se stiamo uscendo dalla modalità di modifica
          // gli rimettiamo la proprietà ParentColor = True.
        end
        else if F.Controls[i] is TcxDBCheckBox then
        begin
          if (C = COLOR_NORMALE) then
            (F.Controls[i] as TcxDBCheckBox).ParentColor := True;
        end;
      end;
    end;
  end;
end;

function TDM1.GetColumnByName(Qry: TIB_Query; ColName: String): Integer;
var
  i: Integer;
begin
  // Valore ritornato se non trova la Colonna
  Result := -1;
  // Cicla finchè non trova la colonna con il nome fornito
  for i := 0 to Qry.Fields.ColumnCount - 1 do
  begin
    // Se la colonna qttuale è quella che stiamo cercando...
    if Qry.Fields.Columns[i].FieldName = ColName then
      Result := i;
  end;
end;

// -----------------------------------------------------------------------------
procedure TDM1.OpenPivotGridCustomizationForm(G: TcxDBPivotGrid);
begin
  with G do
  begin
    OptionsView.DataFields := Customization.Visible;
    OptionsView.RowFields := Customization.Visible;
    OptionsView.ColumnFields := Customization.Visible;
    OptionsView.FilterFields := Customization.Visible;
    Customization.FormBounds := Rect(MainForm.Left + MainForm.MainLeftPanel.Left + 8, MainForm.Top + MainForm.MainLeftPanel.Top + MainForm.ImgDocTipo.Height +
      32, MainForm.Left + MainForm.MainLeftPanel.Left + MainForm.MainLeftPanel.Width + 4, MainForm.Top + MainForm.MainLeftPanel.Top +
      (MainForm.MainLeftPanel.Height + 30));
    Customization.Form.Caption := ' Elenco campi';
  end;
end;

procedure TDM1.ExpandAllPivotGridFields(G: TcxDBPivotGrid);
var
  i: Integer;
begin
  G.BeginUpdate;
  try
    for i := 0 to G.FieldCount - 1 do
    begin
      G.Fields[i].ExpandAll;
    end;
  finally
    G.EndUpdate;
  end;
end;

procedure TDM1.CollapseAllPivotGridFields(G: TcxDBPivotGrid);
var
  i: Integer;
begin
  G.BeginUpdate;
  try
    for i := 0 to G.FieldCount - 1 do
    begin
      G.Fields[i].CollapseAll;
    end;
  finally
    G.EndUpdate;
  end;
end;

// Procedura che carica nel repository il file INI ricevuto come parametro
procedure TDM1.SalvaFileIniNelRepository(NomeFile: String);
var
  RI: TRepositoryIniFile;
begin
  RI := TRepositoryIniFile.Create(NomeFile, DM1.DBGenerale);
  try
    RI.UpdateFile;
  finally
    RI.Free;
  end;
end;

procedure TDM1.SalvaGrigliePivotDevExpress(G: TcxDBPivotGrid; NomeVista: String);
var
  NomeFile: String;
begin
  // Imposta il nome del file
  NomeFile := G.Name + '___' + NomeVista + '.ini';
  // Salva le impostazioni visive
  G.StoreToIniFile(ImpGridsDir + NomeFile);
  // Alla fine seleziona la vista appena salvata come predefinita e la carica
  RipristinaPivotDevExpress(G, NomeVista);
  // Salva il file INI ottenuto nel repository
  SalvaFileIniNelRepository(ImpGridsDir + NomeFile);
end;

procedure TDM1.SalvaAgendaDevExpress(G: TcxScheduler; NomeVista: String);
var
  NomeFile: String;
begin
  // Imposta il nome del file
  NomeFile := G.Name + '___' + NomeVista + '.ini';
  // Salva le impostazioni visive
  G.StoreToIniFile(ImpGridsDir + NomeFile);
  // Alla fine seleziona la vista appena salvata come predefinita e la carica
  RipristinaAgendaDevExpress(G, NomeVista);
  // Salva il file INI ottenuto nel repository
  SalvaFileIniNelRepository(ImpGridsDir + NomeFile);
end;

procedure TDM1.SalvaGriglieDevExpress(G: TcxGrid; NomeVista: String; NomeFormNelNomeFile: Boolean);
var
  i: Integer;
  NomeFile, NomeGridConNomeForm: String;

  procedure SalvaLevel(Lv: TcxGridLevel);
  var
    C: Integer;
  begin
    // Salva le impostazioni della GridView del livello attuale
    // NB: Se si tratta del corpo di un documento, salva/carica le impostazioni
    // delle colonne senza specificare l'ultimo parametro perchè altrimenti
    // non funziona correttamente, probabilmente perchè questa griglia contiene
    // anche delle sottoviste (sottorighi) e specificando il nome della vista
    // durante il salvataggio/ripristino succede che salva/carica le impostazioni
    // delle varie GridView considerandole tutte uguali.
    if G.Name = 'GridCorpo' then
      Lv.GridView.StoreToIniFile(ImpGridsDir + NomeFile, False, [], '')
    else
      Lv.GridView.StoreToIniFile(ImpGridsDir + NomeFile, False, [], Lv.GridView.Name);
    // Richiama ricorsivamente se stessa per salvare i sottolivelli del livello attuale
    for C := 0 to Lv.Count - 1 do
      SalvaLevel(Lv.Items[C]);
  end;

begin
  // Compone la variabile che contiene il nome della Grid ricevuta come parametro
  // da utilizzare per composizione del nome del file. Tale nome può comprendere
  // anche il nome dell'OWNER della griglia (di solito la form che la contiene)
  // oppure no in base all'apposito parametro.
  NomeGridConNomeForm := G.Name;
  if NomeFormNelNomeFile then
    NomeGridConNomeForm := G.Owner.Name + '___' + NomeGridConNomeForm;
  // Imposta il nome del file
  NomeFile := NomeGridConNomeForm + '___' + NomeVista + '.ini';
  // Salva le impostazioni di tutti i livelli
  for i := 0 to G.Levels.Count - 1 do
    SalvaLevel(G.Levels[i]);
  // Alla fine seleziona la vista appena salvata come predefinita e la carica
  RipristinaDevExpress(G, NomeVista, NomeFormNelNomeFile);
  // Salva il file INI ottenuto nel repository
  SalvaFileIniNelRepository(ImpGridsDir + NomeFile);
end;

procedure TDM1.SalvaDevExPropertiesStore(PS: TcxPropertiesStore; NomeVista: String; NomeFormNelNomeFile: Boolean);
var
  NomeFile: String;
begin
  // Compone la variabile che contiene il nome della Grid ricevuta come parametro
  // da utilizzare per composizione del nome del file. Tale nome può comprendere
  // anche il nome dell'OWNER della griglia (di solito la form che la contiene)
  // oppure no in base all'apposito parametro.
  NomeFile := NomeVista + '.ini';
  if NomeFormNelNomeFile then
    NomeFile := PS.Owner.Name + '___' + NomeFile;
  // Esegue il salvataggio
  PS.StorageName := ImpGridsDir + NomeFile;
  PS.StoreTo;
  // Alla fine seleziona la vista appena salvata come predefinita e la carica
  // RipristinaDevExpress(G, NomeVista, NomeFormNelNomeFile);
  // Salva il file INI ottenuto nel repository
  SalvaFileIniNelRepository(ImpGridsDir + NomeFile);
end;

procedure TDM1.OpenQueryAgenda(const QryAgenda, QryTecnici: TIBOQuery; const Scheduler: TcxScheduler);
var
  TmpStr: String;
  SelectedDaysCount: Integer;
  FirstSelectedDay, LastSelectedDay: TDateTime;
  P: TMemIniFile;
begin
  // Costruzione delle clausole OR
  TmpStr := '(TIPOIMPEGNO=''Appuntamento'' OR TIPOIMPEGNO=''Appuntam.'' OR TIPOIMPEGNO=''Generico''';
  if not MainForm.AgendaNoInterventi.Checked then
    TmpStr := TmpStr + ' OR TIPOIMPEGNO=''Intervento''';
  TmpStr := TmpStr + ')';

  Scheduler.Storage.BeginUpdate;
  try
    // Se la tabella è aperta la chiude
    if QryAgenda.Active then
      QryAgenda.Close;
    // Imposta nella clausa WHERE il periodo visualizzato
    // nel calendarietto in basso a sx in modo che carichi solo
    // i record relativi al periodo indicato.
    QryAgenda.SQL.Clear;
    QryAgenda.SQL.Add('SELECT ID, PARENTID, EVENTMESSAGE, START_EVENT, FINISH_EVENT, LOCATION, RESOURCEID, EVENTTYPE,');
    QryAgenda.SQL.Add('LABELCOLOR, OPTIONS, STATE, RECURRENCEINDEX, RECURENCEINFO, RAGSOCCLI, TIPOIMPEGNO, MASTER_ID,');
    QryAgenda.SQL.Add('CLIENTE, IDPRATICA');
    // In base alla modalità con le immagini (urgente, stampato, prescrizioni: più lento) oppure no
    if DM1.AgendaNoImages then
      QryAgenda.SQL.Add('FROM IMPEGNI')
    else
    begin
      QryAgenda.SQL.Add(', EXISTS_URGENTI, EXISTS_PRESCRIZIONI, EXISTS_STAMPATO');
      QryAgenda.SQL.Add('FROM AGENDA_LIST_VIEW');
    end;
    QryAgenda.SQL.Add('WHERE ' + TmpStr);
    // Costruisce le condizioni relative ai giorni da caricare
    if DM1.QueryQgendaSoloGiorniSelezionati then
    begin
      SelectedDaysCount := MainForm.AgendaDateNavigator.SelectedDays.Count;
      if SelectedDaysCount > 0 then
      begin
        FirstSelectedDay := MainForm.AgendaDateNavigator.SelectedDays[0];
        LastSelectedDay := MainForm.AgendaDateNavigator.SelectedDays[SelectedDaysCount - 1] + 1;
      end
      else
      begin
        FirstSelectedDay := StartOfTheDay(Now);
        LastSelectedDay := FirstSelectedDay + 1;
      end;
      QryAgenda.SQL.Add('AND START_EVENT < ''' + FormatDateTime('mm/dd/yyyy', LastSelectedDay) + '''');
      QryAgenda.SQL.Add('AND FINISH_EVENT >= ''' + FormatDateTime('mm/dd/yyyy', FirstSelectedDay) + '''');
    end
    else
    begin
      QryAgenda.SQL.Add('AND START_EVENT <= ''' + FormatDateTime('mm/dd/yyyy', MainForm.AgendaDateNavigator.RealLastDate) + '''');
      QryAgenda.SQL.Add('AND FINISH_EVENT >= ''' + FormatDateTime('mm/dd/yyyy', MainForm.AgendaDateNavigator.RealFirstDate) + '''');
    end;
    // Apre la tabella
    QryAgenda.Open;

    // Stessa cosa per la tabella dei tecnici
    if not QryTecnici.Active then
    begin
      QryTecnici.SQL.Clear;
      QryTecnici.SQL.Add('SELECT RESOURCEID, RESOURCENAME, RESOURCECOLOR');
      QryTecnici.SQL.Add('FROM TECNICI');
      QryTecnici.SQL.Add('WHERE ABILITATO <> ''F''');
      // Se è stata specificata una limitazione nei permessi dell'utente corrente
      // relativa alle risorse da visualizzare sull'agenda le inserisce
      // come clausola WHERE.
      if DM1.LimitazioniRisorseAgendaPerUtente <> '' then
        QryTecnici.SQL.Add('AND ' + DM1.LimitazioniRisorseAgendaPerUtente);
      // Apre la tabella dei tecnici
      QryTecnici.Open;
    end;

    // Se è la prima volta che si apre l'agenda in questa sessione, carica il
    // layout dell'agenda stessa
    if Scheduler.Tag = 0 then
    begin
      DM1.RipristinaAgendaDevExpress(Scheduler, '');
      // Apre il file con le impostazioni di visualizzazione
      P := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
      try
        Scheduler.OptionsView.WorkStart := P.ReadTime('AGENDA', 'WorkTimeStart', StrToTime('08.00.00'));
        Scheduler.OptionsView.WorkFinish := P.ReadTime('AGENDA', 'WorkTimeFinish', StrToTime('20.00.00'));
        Scheduler.ViewDay.WorkTimeOnly := P.ReadBool('AGENDA', 'WorkTimeOnly', False);
        Scheduler.ViewDay.TimeRulerMinutes := P.ReadBool('AGENDA', 'TimeRulerMinutes', False);
        Scheduler.ViewDay.TimeScale := P.ReadInteger('AGENDA', 'TimeScale', 15);
      finally
        P.Free;
      end;
      // Procedure che carica i nome dei tecnici nel TabControl a fianco dell'agenda
      // per la selezione dei tecnici visibili
      if Assigned(ClientiForm.AgendaForm) then
        ClientiForm.AgendaForm.CaricaTecnici;
      // Marca l'agenda come già impostata
      Scheduler.Tag := 1;
    end;

    // Reimposta la selezione attuale del calendarietto in basso a sx
    Scheduler.SelectedDays.Assign(MainForm.AgendaDateNavigator.SelectedDays);
  finally
    // Agenda.FullRefresh;
    Scheduler.Storage.EndUpdate;
  end;
end;

procedure TDM1.RipristinaAgendaDevExpress(G: TcxScheduler; NomeVista: String);
var
  NomeFile: String;
  V: TMemIniFile;
begin
  // Nel caso non fosse specificata nessuna vista, carica la predefinita
  if NomeVista = '' then
  begin
    V := TMemIniFile.Create(ImpGridsDir + 'VistePredefinite.ini');
    try
      NomeVista := V.ReadString('VistePredefinite', G.Name, '');
    finally
      V.Free;
    end;
    // Se il nome della vista è 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)'
    // significa che l'utente ha scelto di non caricare nessuna vista e quindi
    // pone il NomeVista = ''
  end
  else if NomeVista = 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)' then
  begin
    NomeVista := '';
    DM1.Messaggi('Informazione', 'La scelta effettuata avrà effetto al prossimo avvio di Levante.', '', [mbOk], 0, nil);
  end;
  // Imposta il nome del file
  NomeFile := G.Name + '___' + NomeVista + '.ini';
  // Carica le impostazioni visive
  G.RestoreFromIniFile(ImpGridsDir + NomeFile);
  // -----
  // Imposta la vista appena caricata come vista predefinita
  V := TMemIniFile.Create(ImpGridsDir + 'VistePredefinite.ini');
  try
    V.WriteString('VistePredefinite', G.Name, NomeVista);
    V.UpdateFile;
  finally
    V.Free;
  end;
end;

procedure TDM1.RipristinaPivotDevExpress(G: TcxDBPivotGrid; NomeVista: String);
var
  NomeFile: String;
  V: TMemIniFile;
begin
  // Nel caso non fosse specificata nessuna vista, carica la predefinita
  if NomeVista = '' then
  begin
    V := TMemIniFile.Create(ImpGridsDir + 'VistePredefinite.ini');
    try
      NomeVista := V.ReadString('VistePredefinite', G.Name, '');
    finally
      V.Free;
    end;
    // Se il nome della vista è 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)'
    // significa che l'utente ha scelto di non caricare nessuna vista e quindi
    // pone il NomeVista = ''
  end
  else if NomeVista = 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)' then
  begin
    NomeVista := '';
    DM1.Messaggi('Informazione', 'La scelta effettuata avrà effetto al prossimo avvio di Levante.', '', [mbOk], 0, nil);
  end;
  // Imposta il nome del file
  NomeFile := G.Name + '___' + NomeVista + '.ini';
  // Carica le impostazioni visive
  G.RestoreFromIniFile(ImpGridsDir + NomeFile);
  // Fa il collapse di tutto altrimenti visualizza sempre tutto
  // espanso e a me non piace
  DM1.CollapseAllPivotGridFields(G);
  // -----
  // Imposta la vista appena caricata come vista predefinita
  V := TMemIniFile.Create(ImpGridsDir + 'VistePredefinite.ini');
  try
    V.WriteString('VistePredefinite', G.Name, NomeVista);
    V.UpdateFile;
  finally
    V.Free;
  end;
end;

function TDM1.GetBandIndexByCaption(BTV: TcxGridDBBandedTableView; Cpt: String): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to BTV.Bands.Count do
  begin
    if BTV.Bands[i].Caption = Cpt then
    begin
      Result := i;
      Break;
    end;
  end;
end;

procedure TDM1.RipristinaDevExpPropertiesStore(PS: TcxPropertiesStore; NomeVista: String; NomeFormNelNomeFile: Boolean);
var
  NomeFile: String;
begin
  // Compone la variabile che contiene il nome della Grid ricevuta come parametro
  // da utilizzare per composizione del nome del file. Tale nome può comprendere
  // anche il nome dell'OWNER della griglia (di solito la form che la contiene)
  // oppure no in base all'apposito parametro.
  NomeFile := NomeVista + '.ini';
  if NomeFormNelNomeFile then
    NomeFile := PS.Owner.Name + '___' + NomeFile;
  // Esegue il caricamento
  PS.StorageName := ImpGridsDir + NomeFile;
  PS.RestoreFrom;
end;

procedure TDM1.RipristinaDevExpress(G: TcxGrid; NomeVista: String; NomeFormNelNomeFile: Boolean; ForzaNomeFile: String = ''; ForzaNomeTableView: String = '');
var
  i: Integer;
  NomeGriglia, NomeFile, NomeGridConNomeForm: String;
  V: TMemIniFile;
  procedure RestoreLevel(Lv: TcxGridLevel);
  var
    C: Integer;
    NomeTableView: String;
  begin
    if ForzaNomeTableView = '' then
      NomeTableView := Lv.GridView.Name
    else
      NomeTableView := ForzaNomeTableView;
    // Carica le impostazioni della GridView del livello attuale
    // NB: Se si tratta del corpo di un documento, salva/carica le impostazioni
    // delle colonne senza specificare l'ultimo parametro perchè altrimenti
    // non funziona correttamente, probabilmente perchè questa griglia contiene
    // anche delle sottoviste (sottorighi) e specificando il nome della vista
    // durante il salvataggio/ripristino succede che salva/carica le impostazioni
    // delle varie GridView considerandole tutte uguali.
    if NomeGriglia = 'GridCorpo' then
      Lv.GridView.RestoreFromIniFile(ImpGridsDir + NomeFile, False, False, [], '')
    else
      Lv.GridView.RestoreFromIniFile(ImpGridsDir + NomeFile, False, False, [], NomeTableView);
    // Richiama ricorsivamente se stessa per caricare i sottolivelli del livello attuale
    for C := 0 to Lv.Count - 1 do
      RestoreLevel(Lv.Items[C]);
  end;

begin
  // Compone la variabile che contiene il nome della Grid ricevuta come parametro
  // da utilizzare per composizione del nome del file. Tale nome può comprendere
  // anche il nome dell'OWNER della griglia (di solito la form che la contiene)
  // oppure no in base all'apposito parametro.
  if ForzaNomeFile = '' then
    NomeGriglia := G.Name
  else
    NomeGriglia := ForzaNomeFile;
  NomeGridConNomeForm := NomeGriglia;
  if NomeFormNelNomeFile then
    NomeGridConNomeForm := G.Owner.Name + '___' + NomeGridConNomeForm;
  // Nel caso non fosse specificata nessuna vista, carica la predefinita
  if NomeVista = '' then
  begin
    V := TMemIniFile.Create(ImpGridsDir + 'VistePredefinite.ini');
    try
      NomeVista := V.ReadString('VistePredefinite', NomeGridConNomeForm, '');
    finally
      V.Free;
    end;
    // Se il nome della vista è 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)'
    // significa che l'utente ha scelto di non caricare nessuna vista e quindi
    // pone il NomeVista = ''
  end
  else if NomeVista = 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)' then
  begin
    NomeVista := '';
    DM1.Messaggi('Informazione', 'La scelta effettuata avrà effetto al prossimo avvio di Levante.', '', [mbOk], 0, nil);
  end;
  // NB: Solo se Delphi non è in esecuzione altrimenti dà un errore e rompeva i maroni
  // if not DM1.IsDelphiRunning then begin
  // Imposta il nome del file
  NomeFile := NomeGridConNomeForm + '___' + NomeVista + '.ini';
  // Carica le impostazioni di tutti i livelli
  for i := 0 to G.Levels.Count - 1 do
    RestoreLevel(G.Levels[i]);
  // -----
  // Imposta la vista appena caricata come vista predefinita
  V := TMemIniFile.Create(ImpGridsDir + 'VistePredefinite.ini');
  try
    V.WriteString('VistePredefinite', NomeGridConNomeForm, NomeVista);
    V.UpdateFile;
  finally
    V.Free;
  end;
  // end;
end;
// -----------------------------------------------------------------------------

procedure TDM1.ControllaNuovoArcBase(Silent: Boolean);
var
  Qry: TIB_Cursor;
  ArcBaseFile: String;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    // Preleva il nome dell'ultimaversione del file ArcBase presente nel sistema
    ArcBaseFile := ArcBaseTrovaUltimaVersione;
    // Se ha trovato il file più recente...
    if ArcBaseFile <> '' then
    begin
      // IMposta la query che preleverà la versione attuale degli archivi di base già presenti nel database.
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT VERSIONEARCBASE FROM PROGRESS WHERE INDEXFIELD = 1');
      Qry.Open;
      // Se ha trovato il record
      if not Qry.Eof then
      begin
        // Se la versione del file trovato è più recente di quella caricata nel database...
        if StrToInt(StrLeft(ArcBaseFile, 3)) > Qry.FieldByName('VERSIONEARCBASE').AsInteger then
        begin
          // Se il campo VERSIONEARCBASE è nullo forza la modalità Silent altrimenti quando crea automatica
          // mente l'azienda di prova subito dopo l'installazione visualizza il messaggio e stà brutto.
          if (Qry.FieldByName('VERSIONEARCBASE').IsNull) or (Qry.FieldByName('VERSIONEARCBASE').AsInteger = 0) then
            Silent := True;
          // Visualizza un messaggio
          if (Silent) or (MessageDlg('A T T E N Z I O N E !!!'#13#13 + 'Lev@nte ha rilevato la presenza di un aggiornamento degli archivi di base'#13 +
            '(Banche, Modalità di pagamento, Aliquote IVA, Causali documenti ecc.)'#13#13 +
            'Per effettuare l''aggiornamento automatico cliccare sul pulsate "OK",'#13 + 'altrimenti cliccare su "Cancel" per annullare l''operazione.',
            mtInformation, [mbOk, mbCancel], 0) = mrOk) then
          begin
            // Avvia il processo
            Application.CreateForm(TImportaArcBaseForm, ImportaArcBaseForm);
            ImportaArcBaseForm.ImportaArchiviBase(ArcBaseFile);
            ImportaArcBaseForm.Close;
            ImportaArcBaseForm.Free;
            ImportaArcBaseForm := nil;
            // Aggiorna il marcatore della versione correntemente utilizzata dagli archivi dell'azienda
            if Qry.Active then
              Qry.Close;
            Qry.SQL.Clear;
            Qry.SQL.Add('UPDATE PROGRESS SET VERSIONEARCBASE = ' + DM1.StrLeft(ArcBaseFile, 3));
            Qry.ExecSQL;
          end;
        end;
      end;
      Qry.Close;
    end;
  finally
    Qry.Free;
  end;
end;

function TDM1.ArcBaseTrovaUltimaVersione: String;
var
  SearchRec: TSearchRec;
  PrecVer, LastVer: String;
begin
  // Questa funzione cerca la versione più recente del file che contiene gli archivi di base da importare
  // per il precaricamento di detti archivi e ne ritorna il nome.
  // NB: Se non trova nulla restituisce '';
  // --------------------------------------------------
  // Default
  Result := '';
  // Prima di tutto controlla che la cartella esista
  if DirectoryExists(ArcBaseDir) then
  begin
    // Poi cerca il primo file
    if FindFirst(ArcBaseDir + '*arcbase.FDB', faAnyFile, SearchRec) = 0 then
    begin
      // Se lo trova annota la versione del file trovato nella variabile LastVer
      PrecVer := StrLeft(SearchRec.Name, 3);
      // Trova anche gli eventuali altri files dello stesso tipo
      while (FindNext(SearchRec) = 0) do
      begin
        // Se ne trova lo annota se la versione è più recente
        LastVer := StrLeft(SearchRec.Name, 3);
        if StrToInt(LastVer) > StrToInt(PrecVer) then
          PrecVer := LastVer;
      end;
      // IMposta il valore di ritorno
      Result := PrecVer + 'arcbase.fdb';
    end;
    // Distrugge SearchRec
    FindClose(SearchRec);
  end;
end;

function TDM1.FilesCount(Cartella, TipoFile: String): Integer;
var
  SearchRec: TSearchRec;
begin
  // Questa funzione conta quantu files ci sono nella cartella ricevuta come parametro
  // NB: Nella cartella devono essere specificati il percorso e il tipo di files
  // ad esempio: "c:\programmi\dcom\levante\etichette\*.eti"
  // --------------------------------------------------
  // Default
  Result := 0;
  // Prima di tutto controlla che la cartella esista
  if DirectoryExists(Cartella) then
  begin
    // Poi cerca il primo file
    if FindFirst(Cartella + TipoFile, faAnyFile, SearchRec) = 0 then
    begin
      // Aggiorna il contatore
      Inc(Result, 1);
      // Trova anche gli eventuali altri files dello stesso tipo
      while (FindNext(SearchRec) = 0) do
        Inc(Result, 1);
    end;
    // Distrugge SearchRec
    FindClose(SearchRec);
  end;
end;

function TDM1.DocExist(TipoDoc: String; NumDoc: Integer; Registro: String; DataDoc: TDate): Boolean;
var
  Qry: TIB_Cursor;
begin
  // Questa funzione verifica la presenza o meno del documento specificato nei parametri
  Result := False;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*) AS COUNTDOC FROM PRVORDCL WHERE');
    Qry.SQL.Add('TIPODOCUMENTO = ''' + TipoDoc + '''');
    Qry.SQL.Add('AND NUMORDPREV = ' + IntToStr(NumDoc));
    Qry.SQL.Add('AND REGISTRO = ''' + Registro + '''');
    Qry.SQL.Add('AND DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Qry.Open;
    Result := Qry.FieldByName('COUNTDOC').AsInteger > 0;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.DistintaBaseExist(CodArt: String): Boolean;
var
  Qry: TIB_Cursor;
begin
  // Questa funzione verifica la presenza o meno del documento specificato nei parametri
  Result := False;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*) AS COUNTDOC FROM DIBATESTATE WHERE');
    Qry.SQL.Add('TIPODOCUMENTO = ''' + CodArt + '''');
    Qry.SQL.Add('AND NUMORDPREV = 1');
    Qry.SQL.Add('AND REGISTRO = ''DIBA''');
    Qry.SQL.Add('AND DATADOCUMENTO = ''01/01/1900''');
    Qry.Open;
    Result := Qry.FieldByName('COUNTDOC').AsInteger > 0;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.CaricaDatiBanca(Abi, Cab: String; EditBanca, EditABI, EditCAB, EditBIC: TEdit);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    if (Abi <> '') and (Cab <> '') then
    begin
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Dati Banca
      Qry.SQL.Add('SELECT BANCA, BANCABIC FROM BANCHE WHERE ABI = ''' + Abi + ''' AND CAB = ''' + Cab + '''');
      Qry.Open;
      if Qry.Eof then
      begin
        EditBanca.Text := '';
        EditABI.Text := '';
        EditCAB.Text := '';
        if Assigned(EditBIC) then
          EditBIC.Text := '';
      end
      else
      begin
        EditBanca.Text := Qry.FieldByName('BANCA').AsString;
        EditABI.Text := Abi;
        EditCAB.Text := Cab;
        if Assigned(EditBIC) then
          EditBIC.Text := Qry.FieldByName('BANCABIC').AsString;
      end;
      Qry.Close;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.CaricaTipoExtFile(Codice: Longint; EditComp: TEdit; RegistroField: TStringField);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE, REGISTRO FROM EXTPRG WHERE CODICE = ' + IntToStr(Codice));
    Qry.Open;
    if Qry.Eof then
    begin
      EditComp.Text := '';
      if RegistroField <> nil then
        RegistroField.Value := '-';
    end
    else
    begin
      EditComp.Text := Qry.FieldByName('DESCRIZIONE').AsString;
      if RegistroField <> nil then
        RegistroField.Value := Qry.FieldByName('REGISTRO').AsString;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.CaricaRagSocCli(Codice: Longint; EditComp: TEdit);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT RAGIONESOCIALE FROM CLIENTI WHERE CODICE = ' + IntToStr(Codice));
    Qry.Open;
    if Qry.Eof then
      EditComp.Text := ''
    else
      EditComp.Text := Qry.FieldByName('RAGIONESOCIALE').AsString;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

// =============================================================================
// CARICA DESCRIZIONE PRATICA IN DIVERSE FORME
// -----------------------------------------------------------------------------
procedure TDM1.CaricaDescrizionePratica(CodPrat: Longint; DataPrat: TDate; EditComp: TEdit);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT TIPO, DESCRIZIONE FROM PRATICHE WHERE CODICE = ' + IntToStr(CodPrat) + ' AND DATAAPERTURA = ''' + FormatDateTime('mm/dd/yyyy',
      DataPrat) + '''');
    Qry.Open;
    if not Qry.Eof then
    begin
      // if Qry.FieldByName('TIPO').AsString = 'P' then begin
      EditComp.Text := Qry.FieldByName('DESCRIZIONE').AsString;
      // end else if Qry.FieldByName('TIPO').AsString = 'A' then begin
      // EditComp.Text := Qry.FieldByName('COSTRUTTORE').AsString + ' - ' + Qry.FieldByName('MODELLO').AsString;
      // end else begin
      // EditComp.Text := '';
      // end;
    end
    else
    begin
      EditComp.Text := '';
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.GetDescrizionePratica(ID: Integer): String;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM PRATICHE WHERE ID = ' + IntToStr(ID));
    Qry.Open;
    if not Qry.Eof then
    begin
      Result := Qry.Fields[0].AsString;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;
// =============================================================================

procedure TDM1.CaricaDescrizionePagamento(Codice: Longint; EditComp: TEdit);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONE FROM PAGAM WHERE CODICE = ' + IntToStr(Codice));
    Qry.Open;
    if Qry.Eof then
      EditComp.Text := ''
    else
      EditComp.Text := Qry.FieldByName('DESCRIZIONE').AsString;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.ControllaSeProprioRegistro(Reg: String): Boolean;
begin
  // Questa funzione si occupa di controllare se nel codice ricevuto come parametro è presente il codice della stazione stessa
  // in modo da controllare praticamente se il record è stato  generato dalla stazione stessa oppure da un altra stazione.
  Result := True;
  // Esegue il controllo solo se il Flag DM1.AggiungiCodiceChiaveAiCodici = True
  // Controlla anche che il codice sia > 0 perchè se così non fosse significherebbe che si tratta di un nuovo record e quindi non deve bloccare nulla.
  if DM1.AggiungiCodiceChiaveAiCodici and (Reg <> '') then
  begin
    // Controlla se  il registro che si vuole modificare è quello predefinoto assegnato alla stazione.
    // Se True significa che il record è stato generato da questa stazione e quindi RItorna True per autorizzarne la modifica
    Result := (Reg = RegistroDefault);
    // Se Result = False significa che il record è stato generato da un'altra stazione e quindi Ritorna False per impedirne la modifica oppure
    // visualizza un messaggio.
    if not Result then
    begin
      // Se il Flag DM1.BloccaModificaRecordsAltreStazioni = True, ritorna False definitivamente e visualizza il relativo messaggio
      if BloccaModificaRecordsAltreStazioni then
      begin
        MessageBeep(0);
        MessageDlg('A T T E N Z I O N E !!!'#13#13 + 'Documento con registro NON assegnato a questa postazione.'#13#13 +
          'Essendoci la funzione di SINCRONIZZAZIONE attivata, solo la postazione a cui'#13 +
          'è stato assegnato il registro potrà emettere e/o modificare documenti con il registro stesso'#13 + '(per evitare POSSIBILI PERDITE DI DATI).',
          mtInformation, [mbOk], 0);
        // Altrimenti visualizza un messaggio di avvertimento ma permette di modificare il record RItornanto True
      end
      else
      begin
        MessageBeep(0);
        if MessageDlg('A T T E N Z I O N E !!!'#13#13 + 'Documento con registro NON assegnato a questa postazione.'#13#13 +
          'Essendoci la funzione di SINCRONIZZAZIONE attivata, esiste il pericolo che si'#13 +
          'modifichino documenti con registro assegnato ad altre postazioni'#13 + 'causando POSSIBILI PERDITE DI DATI.'#13#13 +
          'Modificare il documento SOLO SE SI E'' SICURI CHE ALTRE POSTAZIONI NON LO ABBIANO MODIFICATO.'#13#13 +
          'Si desidera modificare ugualmente il documento?', mtInformation, [mbOk, mbNo], 0) = mrOk then
          Result := True;
      end;
    end;
  end;
end;

function TDM1.ControllaSeProprioMagazzino(CodiceMag: Longint): Boolean;
begin
  // Questa funzione si occupa di controllare se nel codice ricevuto come parametro è presente il codice della stazione stessa
  // in modo da controllare praticamente se il record è stato  generato dalla stazione stessa oppure da un altra stazione.
  Result := True;
  // Esegue il controllo solo se il Flag DM1.AggiungiCodiceChiaveAiCodici = True
  // Controlla anche che il codice sia > 0 perchè se così non fosse significherebbe che si tratta di un nuovo record e quindi non deve bloccare nulla.
  if DM1.AggiungiCodiceChiaveAiCodici and (CodiceMag > 0) then
  begin
    // Controlla se  il codice del magazzino che si vuole modificare è quello predefinoto assegnato alla stazione.
    // Se True significa che il record è stato generato da questa stazione e quindi RItorna True per autorizzarne la modifica
    Result := (CodiceMag = StrToInt(DM1.MagazzinoDefault));
    // Se Result = False significa che il record è stato generato da un'altra stazione e quindi Ritorna False per impedirne la modifica oppure
    // visualizza un messaggio.
    if not Result then
    begin
      // Se il Flag DM1.BloccaModificaRecordsAltreStazioni = True, ritorna False definitivamente e visualizza il relativo messaggio
      if BloccaModificaRecordsAltreStazioni then
      begin
        MessageBeep(0);
        MessageDlg('A T T E N Z I O N E !!!'#13#13 + 'Magazzino NON assegnato a questa postazione.'#13#13 +
          'Essendoci la funzione di SINCRONIZZAZIONE attivata, solo la postazione a cui'#13 +
          'è stato assegnato il magazzino potrà modificarlo (per evitare possibili perdite di dati).', mtInformation, [mbOk], 0);
        // Altrimenti visualizza un messaggio di avvertimento ma permette di modificare il record RItornanto True
      end
      else
      begin
        MessageBeep(0);
        if MessageDlg('A T T E N Z I O N E !!!'#13#13 + 'Magazzino NON assegnato a questa postazione.'#13#13 +
          'Essendoci la funzione di SINCRONIZZAZIONE attivata, esiste il pericolo che due'#13 +
          'postazioni modifichino lo stesso magazzino causando POSSIBILI PERDITE DI DATI.'#13#13 +
          'Modificare il magazzino SOLO SE SI E'' SICURI CHE ALTRE POSTAZIONI NON LO ABBIANO MODIFICATO.'#13#13 +
          'Si desidera modificare ugualmente il magazzino?', mtInformation, [mbOk, mbNo], 0) = mrOk then
          Result := True;
      end;
    end;
  end;
end;

function TDM1.ControlloSeModificabileDallaStazione(Codice: Longint): Boolean;
begin
  // Questa funzione si occupa di controllare se nel codice ricevuto come parametro è presente il codice della stazione stessa
  // in modo da controllare praticamente se il record è stato  generato dalla stazione stessa oppure da un altra stazione.
  Result := True;
  // Esegue il controllo solo se il Flag DM1.AggiungiCodiceChiaveAiCodici = True
  // Controlla anche che il codice sia > 0 perchè se così non fosse significherebbe che si tratta di un nuovo record e quindi non deve bloccare nulla.
  if DM1.AggiungiCodiceChiaveAiCodici and (Codice > 0) then
  begin
    // Controlla se nel codice ricevuto è presente il codice di questa stazione.
    // Per fare questo divide il codice per il fattore di moltiplicazione e prende solo la parte intera e la confronta con il codice chiave della stazione
    // Se True significa che il record è stato generato da questa stazione e quindi RItorna True per autorizzarne la modifica
    Result := (Trunc(Codice / MOLTIPLICATORE_AGGIUNTA_CODCHIAVE) = StrToInt(CodiceUtente));
    // Se Result = False significa che il record è stato generato da un'altra stazione e quindi Ritorna False per impedirne la modifica oppure
    // visualizza un messaggio.
    if not Result then
    begin
      // Se il Flag DM1.BloccaModificaRecordsAltreStazioni = True, ritorna False definitivamente e visualizza il relativo messaggio
      if BloccaModificaRecordsAltreStazioni then
      begin
        MessageBeep(0);
        MessageDlg('A T T E N Z I O N E !!!'#13#13 + 'Record creato da un''altra postazione.'#13#13 +
          'Essendoci la funzione di SINCRONIZZAZIONE attivata, solo la postazione'#13 +
          'che ha creato il record potrà modificarlo (per evitare POSSIBILI PERDITE DI DATI).', mtInformation, [mbOk], 0);
        // Altrimenti visualizza un messaggio di avvertimento ma permette di modificare il record RItornanto True
      end
      else
      begin
        MessageBeep(0);
        if MessageDlg('A T T E N Z I O N E !!!'#13#13 + 'Record creato da un''altra postazione.'#13#13 +
          'Essendoci la funzione di SINCRONIZZAZIONE attivata, esiste il pericolo che due'#13 +
          'postazioni modifichino lo stesso record causando POSSIBILI PERDITE DI DATI.'#13#13 +
          'Modificare il record SOLO SE SI E'' SICURI CHE ALTRE POSTAZIONI NON LO ABBIANO MODIFICATO.'#13#13 + 'Si desidera modificare ugualmente il record?',
          mtInformation, [mbOk, mbNo], 0) = mrOk then
          Result := True;
      end;
    end;
  end;
end;

function TDM1.ControllaSeBisognaAggiungereIlCodiceChiave(CodiceAssegnato: Longint): Longint;
begin
  // Assegna il valore di default
  Result := CodiceAssegnato;
  // Se è abilitata l'aggiunta del codice chiave ai codici automatici, provvede ad aggiungere il codice della chiave al codice appena assegnato
  // NB: Il codice chiave viene assegnato * 10000, cioè il codice è così: 999900034 dove 9999 è il codice chiave * 10000 e il resto è il codice assegnato
  // quindi il codice progressivo può arrivare al massimo a 99.999.
  if DM1.AggiungiCodiceChiaveAiCodici then
    Result := CodiceAssegnato + (StrToInt(CodiceUtente) * MOLTIPLICATORE_AGGIUNTA_CODCHIAVE);
end;

procedure TDM1.SetPanelState(Stato: Shortint; Pannello: TPanel; Etichetta: TLabel; LivelloAttivo: Integer);
var
  TopPosition: Integer;
begin
  // Prima di tutto calcola la posizione Y del prossimo pannello attivo
  TopPosition := StartingTopPosition + ((Separation + PanelHeight) * (LivelloAttivo - 1));

  // In base allo stato del pannello lo visualizza in modo opportuno
  case Stato of
    // Invisibile
    0:
      begin
        Pannello.Visible := False;
      end;
    // Disattivo
    1:
      begin
        Pannello.Enabled := False;
        Pannello.BevelOuter := bvNone;
        Pannello.Color := COLOR_SUBPANEL_BG_SELECTED;
        Etichetta.Color := COLOR_SUBPANEL_STEP_BG_SELECTED;
        Etichetta.Font.Color := COLOR_SUBPANEL_STEP_FONT_SELECTED;
        Pannello.Visible := True;
      end;
    // Attivo
    2:
      begin
        Pannello.Top := TopPosition;
        Pannello.Enabled := True;
        Pannello.BevelOuter := bvRaised;
        Pannello.Color := COLOR_SUBPANEL_BG;
        Etichetta.Caption := IntToStr(LivelloAttivo);
        Etichetta.Color := COLOR_SUBPANEL_STEP_BG;
        Etichetta.Font.Color := COLOR_SUBPANEL_STEP_FONT;
        Pannello.Visible := True;
      end;
  end;
end;

function TDM1.GetCodiceIvaArticolo(CodArt: String): Integer;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT CODICEIVA FROM ARTICOLI WHERE CODICEARTICOLO = ''' + CodArt + '''');
    Qry.Open;
    Result := Qry.FieldByName('CODICEIVA').AsInteger;
    // Se il risultato <= 0 restituisce comunque 1
    // if Result <= 0 then Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.GetCodiceIvaCli(CodCli: Longint): Integer;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT CODICEIVA FROM CLIENTI WHERE CODICE = ' + IntToStr(CodCli));
    Qry.Open;
    Result := Qry.FieldByName('CODICEIVA').AsInteger;
    // Se il risultato <= 0 restituisce comunque 1
    // if Result <= 0 then Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

// =============================================================================
// INIZIO - GENERAZIONE CODICI A BARRE PER DOCUMENTI
// -----------------------------------------------------------------------------
// Funzione che genera un nuovo codice a barre per un documento
// NB: Controlla anche che non sia già stato usato.
function TDM1.NewQuery: TIB_Cursor;
begin
  Result := TIB_Cursor.Create(Self);
  Result.DatabaseName := DM1.ArcDBFile;
  Result.IB_Connection := DM1.DBAzienda;
end;

function TDM1.NewQueryLevGen: TIB_Cursor;
begin
  Result := TIB_Cursor.Create(Self);
  Result.DatabaseName := DM1.GenDBFile;
  Result.IB_Connection := DM1.DBGenerale;
end;

function TDM1.NextBarcodeDocumento(DocTipo: String; DocNum: Integer; DocReg: String; DocData: TDateTime): String;
begin
  // Genera il nuovo codice e poi lo controlla per evitare duplicati
  // e se esiste già ne ricenera un altro dopo almeno 1 secondo in modo che sia diverso
  Result := GeneraBarcodeDocumento(DocTipo, DocNum, DocReg, DocData);
  while DocBarcodeExist(Result) do
  begin
    Sleep(1100); // Attende poco più di 1 secondo in modo da essere sicuri che il prossimo codice generato sia diverso dal precedente
    Result := GeneraBarcodeDocumento(DocTipo, DocNum, DocReg, DocData);
  end;
end;

// Funzione che calcola un nuovo codice a barre per un documento
function TDM1.GeneraBarcodeDocumento(DocTipo: String; DocNum: Integer; DocReg: String; DocData: TDateTime): String;
begin
  Result := BARCODE_TIPOCODICE_DOCUMENTO + DocTypeToDocTypeCode(DocTipo) + IntToStr(GeneraCodiceImpegno);
end;

// Funzione che verifica che non esista già il codice impegno ricevuto come
// parametro
function TDM1.DocBarcodeExist(CodToSearch: String): Boolean;
var
  Qry: TIB_Cursor;
begin
  // Inizializzazione
  Result := True;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*) AS QUANTI FROM PRVORDCL WHERE BARCODE = ''' + CodToSearch + '''');
    Qry.Open;
    Result := (Qry.Fields[0].AsInteger > 0);
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

// -------

// Funzione che genera un nuovo codice per un nuovo impegno
// e lo controlla per evitare duplicati.
function TDM1.NextCodiceImpegno(const AIDProgressivo, AIDProgressivoAnno: Boolean; const ADataDoc: TDate): Integer;
begin
  if AIDProgressivo then
    Result := GeneraCodiceImpegnoProgressivo(AIDProgressivoAnno, ADataDoc)
  else
  begin
    // Genera il nuovo codice e poi lo controlla per evitare duplicati
    // e se esiste già ne ricenera un altro dopo almeno 1 secondo in modo che sia diverso
    Result := GeneraCodiceImpegno;
    while CodiceImpegnoExist(Result) do
    begin
      Sleep(1100); // Attende poco più di 1 secondo in modo da essere sicuri che il prossimo codice generato sia diverso dal precedente
      Result := GeneraCodiceImpegno;
    end;
  end;
end;

// Funzione che genera il codice univoco degli impegni
function TDM1.GeneraCodiceImpegno: Integer;
var
  Present: TDateTime;
  OutStr: String;
begin
  // Inizializzazione
  Result := 0;
  OutStr := '';
  Present := Now;
  // Ricava solo le ultime 2 cifre dell'anno
  OutStr := RightStr(IntToStr(YearOf(Present)), 2);
  // Aggiunge 3 cifre che sono i giorni passati dall'inizio dell'anno
  OutStr := OutStr + PadR(IntToStr(DayOfTheYear(Present)), '0', 3);
  // Aggiunge 5 cifre che sono i secondi passati dall'inizio del giorno
  OutStr := OutStr + PadR(IntToStr(SecondOfTheDay(Present)), '0', 5);
  // Ritorna il numeraccio così ottenuto
  Result := StrToInt(OutStr);
end;

function TDM1.GeneraCodiceImpegnoProgressivo(const AAnno: Boolean; const ADataDoc: TDate): Integer;
var
  Qry: TIB_Cursor;
  AA, MM, GG: Word;
  CondizioneTipoDoc: String;
begin
  // Query che restituirà l'ultimo numero usato
  Qry := TIB_Cursor.Create(Self);
  try
    // Recupera l'anno in corso
    DecodeDate(ADataDoc, AA, MM, GG);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MAX(ID) AS LASTID FROM IMPEGNI WHERE');
    Qry.SQL.Add('    DATAORACHIAMATA >= ''01/01/' + IntToStr(AA) + '''');
    Qry.SQL.Add('AND DATAORACHIAMATA <= ''12/31/' + IntToStr(AA) + '''');
    Qry.SQL.Add('AND ID >= 0 AND ID <= 999999');
    // Qry.SQL.SaveToFile('c:\sql.sql');
    Qry.Open;
    Result := Qry.FieldByName('LASTID').AsInteger + 1;
    // Se ci deve essere il preambolo con l'anno (es: 190001 per il primo impegno dell'anno)
    if AAnno then
    begin
      // Elimina il preambolo
      Result := Round(Frac(Result / 10000) * 10000);
      // Verifica che la numerazione non abbia superato 9999 altrimetni va in conflitto con la presenta dell'anno
      if Result > 9999 then
        raise Exception.Create('Si è raggiunto il numero massimo progressivo per gli impegni');
      Result := Result + ((AA - 2000) * 10000);
    end;
    // Se il risultato <= 0 restituisce comunque 1
    if Result <= 0 then
      Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

// Funzione che verifica che non esista già il codice impegno ricevuto come
// parametro
function TDM1.CodiceImpegnoExist(CodToSearch: Integer): Boolean;
var
  Qry: TIB_Cursor;
begin
  // Inizializzazione
  Result := True;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*) AS QUANTI FROM IMPEGNI WHERE ID = ' + IntToStr(CodToSearch));
    Qry.Open;
    Result := (Qry.Fields[0].AsInteger > 0);
    Qry.Close;
  finally
    Qry.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - GENERAZIONE CODICI A BARRE PER DOCUMENTI
// =============================================================================

function TDM1.NextCodice(Tabella, Campo: String; MaxRange: Integer = 0): Integer;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MAX(' + Campo + ') AS LASTCODICE FROM ' + Tabella);
    if MaxRange <> 0 then
      Qry.SQL.Add('WHERE ' + Campo + ' <= ' + IntToStr(MaxRange));
    Qry.Open;
    Result := Qry.FieldByName('LASTCODICE').AsInteger + 1;
    // Se il risultato <= 0 restituisce comunque 1
    if Result <= 0 then
      Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.NextCodiceNegativo(Tabella, Campo: String): Integer;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MIN(' + Campo + ') AS LASTCODICE FROM ' + Tabella);
    Qry.Open;
    Result := Qry.FieldByName('LASTCODICE').AsInteger - 1;
    // Se il risultato >= 0 restituisce comunque -1
    if Result >= 0 then
      Result := -1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.NextCodicePratica(Tipo: String): Integer;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MAX(CODICE) AS LASTCODICE FROM PRATICHE WHERE TIPO = ''' + Tipo + '''');
    Qry.Open;
    Result := Qry.FieldByName('LASTCODICE').AsInteger + 1;
    // Se il risultato <= 0 restituisce comunque 1
    if Result <= 0 then
      Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.DocFatturato(DocTipo, DocReg: String; DocNum: Longint; DocData: TDate);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Marcaa il documento come fatturato
    Qry.SQL.Add('UPDATE PRVORDCL SET DAFATTURARE = ''*'' WHERE');
    Qry.SQL.Add('    TipoDocumento = ''' + DocTipo + '''');
    Qry.SQL.Add('AND Registro = ''' + DocReg + '''');
    Qry.SQL.Add('AND NumOrdPrev = ' + IntToStr(DocNum));
    Qry.SQL.Add('AND DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DocData) + '''');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.CopiaFileConSostituzioneCarattere(InFile, OutFile: String; OldChar, NewChar: Char);
var
  iFileHandle, oFileHandle: Integer;
  Buffer: Char;
begin
  // Questa funzione copia il file specificato in 'InFile' nel file specificato in 'OutFile' sovrascrivendolo
  // e sostituendo tutte le occorrenze del carattere 'OldChar' con il carattere sostitutivo specificato in 'NewChar'.
  // Viene usata nei filtri di importazione per eliminare il carattere TAB (Ascii = 9) che è facilmente contenuto
  // nel file CONV.INI, altrimenti con windows 95/98/ME dà un errore.
  // -----------------------------------------------------------------------------------------------------------------
  // Apre l'input file
  iFileHandle := FileOpen(InFile, fmOpenRead);
  // Se qualcosa è andato storto solleva un eccezione
  if iFileHandle = -1 then
    raise Exception.Create('Impossibile aprire il file di input.');
  // Apre l'output file
  oFileHandle := FileCreate(OutFile);
  // Se qualcosa è andato storto solleva un eccezione
  if oFileHandle = -1 then
    raise Exception.Create('Impossibile aprire il file di output.');
  try
    // Cicla per tutto il file di input carattere per carattere
    while FileRead(iFileHandle, Buffer, 1) > 0 do
    begin
      // Se il carattere appena prelevato è il carattere da sostituire provvede alla sostituzione
      if Buffer = OldChar then
        Buffer := NewChar;
      // Ricopia il Buffer  nel file di output
      FileWrite(oFileHandle, Buffer, 1);
      // Và al prossimo carattere
      // FileSeek(iFileHandle, 1, 1);
    end;
  finally
    FileClose(iFileHandle);
    FileClose(oFileHandle);
  end;
end;

procedure TDM1.TrovaCondVend(CodiceArticolo: String; Qta: Real; CodiceSoggetto: Longint; var Sc1, Sc2, Sc3, Importo: Real; TipoCondVend: String);
var
  Qry: TIB_Cursor;
  Trovato: Boolean;
  CodGrp1, CodGrp2, CodGrp3: Longint;
begin
  // Valori di default
  Trovato := False;
  Sc1 := 0;
  Sc2 := 0;
  Sc3 := 0;
  Importo := -1;
  CodGrp1 := -1;
  CodGrp2 := -1;
  CodGrp3 := -1;
  // Crea la query
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    // --------------------------------------------------------------------------------------------------------------------------------------------------------
    // Prima di tutto cerca una condizione di vendita associata all'articolo specifico e al soggetto specifico
    // --------------------------------------------------------------------------------------------------------------------------------------------------------
    if not Trovato then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT DAQTA1,SCONTO1,IMPORTO1,DAQTA2,SCONTO2,IMPORTO2,DAQTA3,SCONTO3,IMPORTO3');
      Qry.SQL.Add('FROM CONDVEND');
      Qry.SQL.Add('WHERE CODICEARTICOLO = ''' + CodiceArticolo + '''');
      Qry.SQL.Add('  AND CODICESOGGETTO = ' + IntToStr(CodiceSoggetto));
      Qry.SQL.Add('  AND TIPO = ''' + TipoCondVend + '''');
      Qry.Open;
      // Se ha trovato al condizione imposta i valori da ritornare e Trovato := True;
      if not Qry.Eof then
      begin
        // Trovato := True;
        Trovato := True;
      end;
    end;

    // --------------------------------------------------------------------------------------------------------------------------------------------------------
    // Poi cerca se c'è una condizione di vendita associato all'articolo specifico ma generica per tutti i soggetti
    // --------------------------------------------------------------------------------------------------------------------------------------------------------
    if not Trovato then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT DAQTA1,SCONTO1,IMPORTO1,DAQTA2,SCONTO2,IMPORTO2,DAQTA3,SCONTO3,IMPORTO3');
      Qry.SQL.Add('FROM CONDVEND');
      Qry.SQL.Add('WHERE CODICEARTICOLO = ''' + CodiceArticolo + '''');
      Qry.SQL.Add('  AND CODICESOGGETTO = 0');
      Qry.SQL.Add('  AND TIPO = ''' + TipoCondVend + '''');
      Qry.Open;
      // Se ha trovato al condizione imposta i valori da ritornare e Trovato := True;
      if not Qry.Eof then
      begin
        // Trovato := True;
        Trovato := True;
      end;
    end;

    // --------------------------------------------------------------------------------------------------------------------------------------------------------
    // Se a questo punto è stata trovata una condizione di vendita carica gli sconti nei parametri da ritornare
    // --------------------------------------------------------------------------------------------------------------------------------------------------------
    if Trovato then
    begin
      // Se la qtà >= della terza soglia ritorna i valori della terza quantità
      if (Qta >= Qry.FieldByName('DAQTA3').AsFloat) and (Qry.FieldByName('DAQTA3').AsFloat > 0) then
      begin
        // Se  l'importo secco non è nullo ritorna quello, altrimenti ritorna gli sconti.
        if Qry.FieldByName('IMPORTO3').IsNull then
        begin
          Sc1 := Qry.FieldByName('SCONTO3').AsFloat;
        end
        else
        begin
          Importo := Qry.FieldByName('IMPORTO3').AsFloat;
        end;
        // Se la qtà >= della seconda soglia ritorna i valori della seconda quantità
      end
      else if (Qta >= Qry.FieldByName('DAQTA2').AsFloat) and (Qry.FieldByName('DAQTA2').AsFloat > 0) then
      begin
        // Se  l'importo secco non è nullo ritorna quello, altrimenti ritorna gli sconti.
        if Qry.FieldByName('IMPORTO2').IsNull then
        begin
          Sc1 := Qry.FieldByName('SCONTO2').AsFloat;
        end
        else
        begin
          Importo := Qry.FieldByName('IMPORTO2').AsFloat;
        end;
        // Se la qtà >= della prima soglia ritorna i valori della prima quantità
      end
      else if Qta >= Qry.FieldByName('DAQTA1').AsFloat then
      begin
        // Se  l'importo secco non è nullo ritorna quello, altrimenti ritorna gli sconti.
        if Qry.FieldByName('IMPORTO1').IsNull then
        begin
          Sc1 := Qry.FieldByName('SCONTO1').AsFloat;
        end
        else
        begin
          Importo := Qry.FieldByName('IMPORTO1').AsFloat;
        end;
      end;

      // --------------------------------------------------------------------------------------------------------------------------------------------------------
      // Se a questo punto NON è stata trovata una condizione di vendita carica cerca le condizioni per gruppo, sottogruppo ecc.
      // --------------------------------------------------------------------------------------------------------------------------------------------------------
    end
    else
    begin

      // --------------------------------------------------------------------------------------------------------------------------------------------------------
      // Se non ha trovato condizioni specifiche allora cerca condizioni per gruppi, prima deve sapere a quale gruppo appartiene l'articolo
      // --------------------------------------------------------------------------------------------------------------------------------------------------------
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT CODICEGRUPPO1,CODICEGRUPPO2,CODICEGRUPPO3');
      Qry.SQL.Add('FROM ARTICOLI');
      Qry.SQL.Add('WHERE CODICEARTICOLO = ''' + CodiceArticolo + '''');
      Qry.Open;
      // Se ha trovato l'articolo imposta i valori della variabili che conterranno i codici dei gruppi dell'articolo
      if not Qry.Eof then
      begin
        // Se i codici di gruppo trovati non sono nulli li copia nelle relative variabili
        if not Qry.FieldByName('CODICEGRUPPO1').IsNull then
          CodGrp1 := Qry.FieldByName('CODICEGRUPPO1').AsInteger;
        if not Qry.FieldByName('CODICEGRUPPO2').IsNull then
          CodGrp2 := Qry.FieldByName('CODICEGRUPPO2').AsInteger;
        if not Qry.FieldByName('CODICEGRUPPO3').IsNull then
          CodGrp3 := Qry.FieldByName('CODICEGRUPPO3').AsInteger;
      end;

      // ========================================================================================================================================================

      // Trovato = False;
      Trovato := False;

      // ---------------------------------------------------------------------------
      // Procede con la ricerca della condizione del gruppo1 del soggetto specifico
      // ---------------------------------------------------------------------------
      // Ovviamente solo se il CodiceGruppo1 è valido
      if (CodGrp1 > -1) and (not Trovato) then
      begin
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('SELECT DAQTA1,SCONTO1,IMPORTO1,DAQTA2,SCONTO2,IMPORTO2,DAQTA3,SCONTO3,IMPORTO3');
        Qry.SQL.Add('FROM CONDVEND');
        Qry.SQL.Add('WHERE CODICEGRUPPO1 = ' + IntToStr(CodGrp1));
        Qry.SQL.Add('  AND CODICEGRUPPO2 = -1');
        Qry.SQL.Add('  AND CODICEGRUPPO3 = -1');
        Qry.SQL.Add('  AND TIPO = ''' + TipoCondVend + '''');
        Qry.SQL.Add('  AND CODICESOGGETTO = ' + IntToStr(CodiceSoggetto));
        Qry.Open;
        // Se ha trovato al condizione imposta i valori da ritornare e Trovato := True;
        if not Qry.Eof then
        begin
          // Trovato := True ma solo per non far cercare la condizione della stesso gruppo ma generico di tutti i soggetti
          Trovato := True;
        end;
      end;
      // ---------------------------------------------------------------------------
      // Procede con la ricerca della condizione del gruppo1 generica di tutti i soggetti
      // ---------------------------------------------------------------------------
      // Ovviamente solo se il CodiceGruppo1 è valido
      if (CodGrp1 > -1) and (not Trovato) then
      begin
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('SELECT DAQTA1,SCONTO1,IMPORTO1,DAQTA2,SCONTO2,IMPORTO2,DAQTA3,SCONTO3,IMPORTO3');
        Qry.SQL.Add('FROM CONDVEND');
        Qry.SQL.Add('WHERE CODICEGRUPPO1 = ' + IntToStr(CodGrp1));
        Qry.SQL.Add('  AND CODICEGRUPPO2 = -1');
        Qry.SQL.Add('  AND CODICEGRUPPO3 = -1');
        Qry.SQL.Add('  AND TIPO = ''' + TipoCondVend + '''');
        Qry.SQL.Add('  AND CODICESOGGETTO = 0');
        Qry.Open;
        // Se ha trovato al condizione imposta i valori da ritornare e Trovato := True;
        if not Qry.Eof then
        begin
          // Trovato := True ma solo per non far cercare la condizione della stesso gruppo ma generico di tutti i soggetti
          Trovato := True;
        end;
      end;
      // ------------------------------------------------------------
      // Se a questo punto è stata trovata una condizione di vendita livello1 carica gli sconti nei parametri da ritornare
      // ------------------------------------------------------------
      if Trovato then
      begin
        // Se la qtà >= della terza soglia ritorna i valori della terza quantità
        if (Qta >= Qry.FieldByName('DAQTA3').AsFloat) and (Qry.FieldByName('DAQTA3').AsFloat > 0) then
          Sc1 := Qry.FieldByName('SCONTO3').AsFloat
          // Se la qtà >= della seconda soglia ritorna i valori della seconda quantità
        else if (Qta >= Qry.FieldByName('DAQTA2').AsFloat) and (Qry.FieldByName('DAQTA2').AsFloat > 0) then
          Sc1 := Qry.FieldByName('SCONTO2').AsFloat
          // Se la qtà >= della prima soglia ritorna i valori della prima quantità
        else if Qta >= Qry.FieldByName('DAQTA1').AsFloat then
          Sc1 := Qry.FieldByName('SCONTO1').AsFloat;
      end;

      // ========================================================================================================================================================

      // Trovato = False;
      Trovato := False;

      // ---------------------------------------------------------------------------
      // Procede con la ricerca della condizione del gruppo2 del soggetto specifico
      // ---------------------------------------------------------------------------
      // Ovviamente solo se il CodiceGruppo1 è valido
      if (CodGrp1 > -1) and (CodGrp2 > -1) and (not Trovato) then
      begin
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('SELECT DAQTA1,SCONTO1,IMPORTO1,DAQTA2,SCONTO2,IMPORTO2,DAQTA3,SCONTO3,IMPORTO3');
        Qry.SQL.Add('FROM CONDVEND');
        Qry.SQL.Add('WHERE CODICEGRUPPO1 = ' + IntToStr(CodGrp1));
        Qry.SQL.Add('  AND CODICEGRUPPO2 = ' + IntToStr(CodGrp2));
        Qry.SQL.Add('  AND CODICEGRUPPO3 = -1');
        Qry.SQL.Add('  AND TIPO = ''' + TipoCondVend + '''');
        Qry.SQL.Add('  AND CODICESOGGETTO = ' + IntToStr(CodiceSoggetto));
        Qry.Open;
        // Se ha trovato al condizione imposta i valori da ritornare e Trovato := True;
        if not Qry.Eof then
        begin
          // Trovato := True ma solo per non far cercare la condizione della stesso gruppo ma generico di tutti i soggetti
          Trovato := True;
        end;
      end;
      // ---------------------------------------------------------------------------
      // Procede con la ricerca della condizione del gruppo2 generica di tutti i soggetti
      // ---------------------------------------------------------------------------
      // Ovviamente solo se il CodiceGruppo1 è valido
      if (CodGrp1 > -1) and (CodGrp2 > -1) and (not Trovato) then
      begin
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('SELECT DAQTA1,SCONTO1,IMPORTO1,DAQTA2,SCONTO2,IMPORTO2,DAQTA3,SCONTO3,IMPORTO3');
        Qry.SQL.Add('FROM CONDVEND');
        Qry.SQL.Add('WHERE CODICEGRUPPO1 = ' + IntToStr(CodGrp1));
        Qry.SQL.Add('  AND CODICEGRUPPO2 = ' + IntToStr(CodGrp2));
        Qry.SQL.Add('  AND CODICEGRUPPO3 = -1');
        Qry.SQL.Add('  AND TIPO = ''' + TipoCondVend + '''');
        Qry.SQL.Add('  AND CODICESOGGETTO = 0');
        Qry.Open;
        // Se ha trovato al condizione imposta i valori da ritornare e Trovato := True;
        if not Qry.Eof then
        begin
          // Trovato := True ma solo per non far cercare la condizione della stesso gruppo ma generico di tutti i soggetti
          Trovato := True;
        end;
      end;
      // ------------------------------------------------------------
      // Se a questo punto è stata trovata una condizione di vendita livello2 carica gli sconti nei parametri da ritornare
      // ------------------------------------------------------------
      if Trovato then
      begin
        // Se la qtà >= della terza soglia ritorna i valori della terza quantità
        if (Qta >= Qry.FieldByName('DAQTA3').AsFloat) and (Qry.FieldByName('DAQTA3').AsFloat > 0) then
          Sc2 := Qry.FieldByName('SCONTO3').AsFloat
          // Se la qtà >= della seconda soglia ritorna i valori della seconda quantità
        else if (Qta >= Qry.FieldByName('DAQTA2').AsFloat) and (Qry.FieldByName('DAQTA2').AsFloat > 0) then
          Sc2 := Qry.FieldByName('SCONTO2').AsFloat
          // Se la qtà >= della prima soglia ritorna i valori della prima quantità
        else if Qta >= Qry.FieldByName('DAQTA1').AsFloat then
          Sc2 := Qry.FieldByName('SCONTO1').AsFloat;
      end;

      // ========================================================================================================================================================

      // Trovato = False;
      Trovato := False;

      // ---------------------------------------------------------------------------
      // Procede con la ricerca della condizione del gruppo3 del soggetto specifico
      // ---------------------------------------------------------------------------
      // Ovviamente solo se il CodiceGruppo1 è valido
      if (CodGrp1 > -1) and (CodGrp2 > -1) and (CodGrp3 > -1) and (not Trovato) then
      begin
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('SELECT DAQTA1,SCONTO1,IMPORTO1,DAQTA2,SCONTO2,IMPORTO2,DAQTA3,SCONTO3,IMPORTO3');
        Qry.SQL.Add('FROM CONDVEND');
        Qry.SQL.Add('WHERE CODICEGRUPPO1 = ' + IntToStr(CodGrp1));
        Qry.SQL.Add('  AND CODICEGRUPPO2 = ' + IntToStr(CodGrp2));
        Qry.SQL.Add('  AND CODICEGRUPPO3 = ' + IntToStr(CodGrp3));
        Qry.SQL.Add('  AND TIPO = ''' + TipoCondVend + '''');
        Qry.SQL.Add('  AND CODICESOGGETTO = ' + IntToStr(CodiceSoggetto));
        Qry.Open;
        // Se ha trovato al condizione imposta i valori da ritornare e Trovato := True;
        if not Qry.Eof then
        begin
          // Trovato := True ma solo per non far cercare la condizione della stesso gruppo ma generico di tutti i soggetti
          Trovato := True;
        end;
      end;
      // ---------------------------------------------------------------------------
      // Procede con la ricerca della condizione del gruppo3 generica di tutti i soggetti
      // ---------------------------------------------------------------------------
      // Ovviamente solo se il CodiceGruppo1 è valido
      if (CodGrp1 > -1) and (CodGrp2 > -1) and (CodGrp3 > -1) and (not Trovato) then
      begin
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('SELECT DAQTA1,SCONTO1,IMPORTO1,DAQTA2,SCONTO2,IMPORTO2,DAQTA3,SCONTO3,IMPORTO3');
        Qry.SQL.Add('FROM CONDVEND');
        Qry.SQL.Add('WHERE CODICEGRUPPO1 = ' + IntToStr(CodGrp1));
        Qry.SQL.Add('  AND CODICEGRUPPO2 = ' + IntToStr(CodGrp2));
        Qry.SQL.Add('  AND CODICEGRUPPO3 = ' + IntToStr(CodGrp3));
        Qry.SQL.Add('  AND TIPO = ''' + TipoCondVend + '''');
        Qry.SQL.Add('  AND CODICESOGGETTO = 0');
        Qry.Open;
        // Se ha trovato al condizione imposta i valori da ritornare e Trovato := True;
        if not Qry.Eof then
        begin
          // Trovato := True ma solo per non far cercare la condizione della stesso gruppo ma generico di tutti i soggetti
          Trovato := True;
        end;
      end;
      // ------------------------------------------------------------
      // Se a questo punto è stata trovata una condizione di vendita livello3 carica gli sconti nei parametri da ritornare
      // ------------------------------------------------------------
      if Trovato then
      begin
        // Se la qtà >= della terza soglia ritorna i valori della terza quantità
        if (Qta >= Qry.FieldByName('DAQTA3').AsFloat) and (Qry.FieldByName('DAQTA3').AsFloat > 0) then
          Sc3 := Qry.FieldByName('SCONTO3').AsFloat
          // Se la qtà >= della seconda soglia ritorna i valori della seconda quantità
        else if (Qta >= Qry.FieldByName('DAQTA2').AsFloat) and (Qry.FieldByName('DAQTA2').AsFloat > 0) then
          Sc3 := Qry.FieldByName('SCONTO2').AsFloat
          // Se la qtà >= della prima soglia ritorna i valori della prima quantità
        else if Qta >= Qry.FieldByName('DAQTA1').AsFloat then
          Sc3 := Qry.FieldByName('SCONTO1').AsFloat;
      end;

      // ========================================================================================================================================================

    end;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.SettaPosizioneInizialePerControlloInizioDragAndDrop(XX, YY: Integer);
begin
  // Salva la posizione attuale del mouse sul controllo e imposta il nome
  DDX := XX;
  DDY := YY;
end;

procedure TDM1.ControllaSpostamentoMousePerInizioDragAndDrop(XX, YY: Integer; Oggetto: TObject);
begin
  // Controlla se lo spostamento del mouse (dopo aver premuto il pulsante del mouse) è stato superiore ad una certa soglia
  // superata la quale si attiva il drag and drop.
  if ((Abs(DDX - XX) > 5) or (Abs(DDY - YY) > 5)) and (DDX <> -1) and (DDY <> -1) then
  begin
    // Reimposta i valori di riposo delle variabili
    DDX := -1;
    DDY := -1;
    // Attiva il DragDrop facendo il cast in base al tipo dell'oggetto
    if Oggetto is TListView then
      (Oggetto as TListView).BeginDrag(False, 0);
  end;
end;

procedure TDM1.CodArticoloToDescrizione(Codice: String; EditComponent: TEdit);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Preleva la descrizione del gruppo
    Qry.SQL.Add('SELECT DESCRIZIONE FROM ARTICOLI WHERE CODICEARTICOLO = ''' + Trim(Codice) + '''');
    Qry.Open;
    if not Qry.Eof then
      EditComponent.Text := Qry.FieldByName('Descrizione').AsString
    else
      EditComponent.Text := '';
  finally
    Qry.Free;
  end;
end;

procedure TDM1.CodGruppoToDescrizione(Codice1, Codice2, Codice3, Codice4, Codice5, Codice6: String; EditComponent: TEdit);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Controlla che i COdici ricevuti non siamo stringhe nulle e nell'evntualità le trasforma in -1
    if (Trim(Codice1) = '') then
      Codice1 := '0';
    if (Trim(Codice2) = '') then
      Codice2 := '0';
    if (Trim(Codice3) = '') then
      Codice3 := '0';
    if (Trim(Codice4) = '') then
      Codice4 := '0';
    if (Trim(Codice5) = '') then
      Codice5 := '0';
    if (Trim(Codice6) = '') then
      Codice6 := '0';
    // Preleva la descrizione del gruppo
    Qry.SQL.Add('SELECT DESCRIZIONE FROM GRUPPI WHERE');
    Qry.SQL.Add('    CODICE1 = ' + Codice1);
    Qry.SQL.Add('AND CODICE2 = ' + Codice2);
    Qry.SQL.Add('AND CODICE3 = ' + Codice3);
    Qry.SQL.Add('AND CODICE4 = ' + Codice4);
    Qry.SQL.Add('AND CODICE5 = ' + Codice5);
    Qry.SQL.Add('AND CODICE6 = ' + Codice6);
    Qry.Open;
    if not Qry.Eof then
      EditComponent.Text := Qry.FieldByName('Descrizione').AsString
    else
      EditComponent.Text := '';
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TDM1.ShowWait(Sezione, Messaggio: String);
begin
  // Se la WaitForm non è stata ancora create esce ovviamente
  if not Assigned(WaitForm) then
    Exit;
  // Visualizza la formWait con il messaggio
  if Sezione <> '' then
    WaitForm.LabelSezione.Caption := Sezione;
  WaitForm.LabelMessaggio.Caption := Messaggio;
  if not WaitForm.Visible then
  begin
    WaitForm.Show;
  end;
  WaitForm.Update;
  Application.ProcessMessages;
end;

procedure TDM1.CloseWait;
begin
  // Chiude la wait form
  if Assigned(WaitForm) then
    WaitForm.Close;
end;

// -------------------------------------------------------------------------------
// In questa funzione il parametro 'Mode' indica cosa la funzione deve fare
// dopo aver creato il nuovo documento secondo il seguente schema:
// 0 := Non fà nulla (genera solo il documento)
// 1 := Genera il documento e poi lo apre il modalità di MODIFICA
// 2 := Genera il documento, lo apre, lo stampa e poi lo chiude.
// 3 := Genera il documento, lo apre, genera le scadenze, lo stampa e poi lo chiude.
// 4 := Genera il documento (la form però è già creata)e poi si mette in modalità di Modifica (Usato per Vendita al Banco)
// I parametri 'SoloRighiDelCliente' e 'SoloRighiDellaPratica' se .F. indicano che i documenti saranno riepilogati
// senza tenere conto di che cliente sono e/o di quale partita fanno parte; altrimenti
// saranno generati documenti riepilogativi separati in base alla situazione
// (Es: Fatturazione differita dove le bolle vengono riepilogate separatamente per cliente).
// NB: Se si è in modalità KIOSK (Vendita al banco) il parametri NextTipoDocumento Viene IGNORATO.
procedure TDM1.NuovoDocFisc(NextTipoDocumento, Registro: String; Cliente, Pratica: Longint; DataPratica: String; Mode, Copies: Integer;
  SoloRighiDelCliente, SoloRighiDellaPratica: Boolean; DataNuovoDocumento: TDate = 0); // Personale
var
  QryTmp: TIB_Cursor;
  Messaggi: String;
  LO: TMemIniFile;
  TmpStr: String;
  DistintaBase, fNumDocUnivoco_ProgressivoInfinito: Boolean;
begin
  // Inizializza il flag che indica se si tratta di una distintabase oppure no
  // (soprattutto se non lo è, visto che per la creazione della distinta base non+
  // viene più utilizzata questa procedura)
  DistintaBase := False;
  // NB: Se il parametro Registro = '' Imposta il registro di default della stazione
  if Registro = '' then
    Registro := DM1.RegistroDefault;
  // Inizializzazione della data per il nuovo documento
  if DataNuovoDocumento = 0 then
    DataNuovoDocumento := Date;
  // Se il parametro cliente = 0 significa che il documento non è nominativo e quindi
  // non sarà legato ad alcun cliente/fornitore
  // In base al tipo documento carica il messaggio corretto
  // NB: Se il tipo del documento non corrisponde a nessuno di quelli sottoelencati significa
  // che si stà creando una nuova distinta base e quindi imposta il relativo Flag a True;
  if NextTipoDocumento = 'Preventivo' then
    Messaggi := DM1.TableProgressiviMsgPreventivi.Value
  else if NextTipoDocumento = 'Ordine' then
    Messaggi := DM1.TableProgressiviMsgOrdini.Value
  else if NextTipoDocumento = 'S.A.L.' then
    Messaggi := DM1.TableProgressiviMsgSAL.Value
  else if NextTipoDocumento = 'D.D.T.' then
    Messaggi := DM1.TableProgressiviMsgDDT.Value
  else if NextTipoDocumento = 'Fattura' then
    Messaggi := DM1.TableProgressiviMsgFatture.Value
  else if (NextTipoDocumento = 'Nota_accre') or (NextTipoDocumento = 'N.C.fornit') then
    Messaggi := DM1.TableProgressiviMsgNoteAccredito.Value
  else if NextTipoDocumento = 'Ord.fornit' then
    Messaggi := DM1.TableProgressiviMsgOrdiniFornitori.Value
  else if NextTipoDocumento = 'Bolla_entr' then
    Messaggi := DM1.TableProgressiviMsgBolleEntrata.Value
  else if NextTipoDocumento = 'Fatt.acqui' then
    Messaggi := DM1.TableProgressiviMsgFattureAcquisto.Value
  else if NextTipoDocumento = 'Ricev.fisc' then
    Messaggi := DM1.TableProgressiviMsgRicevuteFiscali.Value
  else if NextTipoDocumento = 'Fatt.R.F.' then
    Messaggi := DM1.TableProgressiviMsgFatture.Value
  else if NextTipoDocumento = 'Buono_cons' then
    Messaggi := DM1.TableProgressiviMsgBuoniConsegna.Value
  else if NextTipoDocumento = 'Commessa' then
    Messaggi := DM1.TableProgressiviMSGCOMMESSA.Value
  else if NextTipoDocumento = 'Carico_cantiere' then
    Messaggi := DM1.TableProgressiviMSGCARICOCANTIERE.Value
  else if NextTipoDocumento = 'Scarico_cantiere' then
    Messaggi := DM1.TableProgressiviMSGSCARICOCANTIERE.Value
  else if NextTipoDocumento = 'Estratto_conto' then
    Messaggi := DM1.TableProgressiviMSGCONTO.Value
  else if NextTipoDocumento = 'Intervento' then
    Messaggi := ''
  else
    DistintaBase := True;
  // Se  il parametro MOde = 0 oppure = 1 Crea la form del documento altrimenti non può andare avanti
  // in quanto deve operare sulla query  che è presente nella form del documento stesso
  if (Mode = 0) or (Mode = 1) then
  begin
    // Crea la form del documento
    Application.CreateForm(TPreventiviOrdiniForm, PreventiviOrdiniForm);
    if MainForm.ModoAssistenzeRDP then
    begin
      PreventiviOrdiniForm.Align := alClient;
      PreventiviOrdiniForm.Parent := AssistenzeMobileMainForm.TabImpegno;
    end
    else
      PreventiviOrdiniForm.Parent := MainForm;
    PreventiviOrdiniForm.TipoDoc := NextTipoDocumento;
    // IMposta il Flag DistintaBase della form del documetno appena creata
    PreventiviOrdiniForm.DistintaBase := DistintaBase;
    // Chiama la funzione che imposta il nome delle tabella su cui la form lavora
    PreventiviOrdiniForm.ImpostaNomiTabelle;
    // Se invece si è in modalità KIOSK (Mode = 4)...
  end
  else if Mode = 4 then
  begin
    PreventiviOrdiniForm.TipoDoc := NextTipoDocumento;
    // Chiama la funzione che imposta il nome delle tabella su cui la form lavora
    PreventiviOrdiniForm.ImpostaNomiTabelle;
  end;
  // Prima di tutto azzera il contenuto dei TEdit della banca e del pagamemnto
  PreventiviOrdiniForm.DescrizionePagamento.Text := '';
  PreventiviOrdiniForm.Banca.Text := '';
  PreventiviOrdiniForm.Abi.Text := '';
  PreventiviOrdiniForm.Cab.Text := '';
  // Ovviamente la query del documento deve essere aperta altrimenti dà un errore 'Cannot perform this operation on a closed Dataset'
  // quindi imposta la query con una ricerca impossibile in modo che non ritorni niente
  if not PreventiviOrdiniForm.QryDocumento.Active then
  begin
    PreventiviOrdiniForm.QryDocumento.SQL.Clear;
    PreventiviOrdiniForm.QryDocumento.SQL.Add('SELECT T.*, C.TIPOPERSONA, C.NAZIONESIGLA FROM ' + PreventiviOrdiniForm.TestateTable + ' T');
    PreventiviOrdiniForm.QryDocumento.SQL.Add('LEFT OUTER JOIN CLIENTI C ON (C.CODICE=T.CODICECLIENTE)');
    PreventiviOrdiniForm.QryDocumento.SQL.Add('WHERE T.TIPODOCUMENTO = ''ZXZXZXZXZX''');
    PreventiviOrdiniForm.QryDocumento.Open;
  end;
  // Effettua l'append del nuovo record
  PreventiviOrdiniForm.QryDocumento.Append;
  PreventiviOrdiniForm.QryDocumentoTipoDocumento.Value := NextTipoDocumento;
  PreventiviOrdiniForm.QryDocumentoDataDocumento.Value := DataNuovoDocumento;
  PreventiviOrdiniForm.QryDocumentoMessaggi.Value := Messaggi;
  // IMpostazione bollo di default
  PreventiviOrdiniForm.QryDocumentoBOLLOVIRTUALE.Value := DM1.TableProgressivi2BOLLOVIRTUALEDEFAULT.AsString;
  if PreventiviOrdiniForm.QryDocumentoBOLLOVIRTUALE.IsNull or (PreventiviOrdiniForm.QryDocumentoBOLLOVIRTUALE.AsString = '') then
    PreventiviOrdiniForm.QryDocumentoBOLLOVIRTUALE.Value := 'T';
  PreventiviOrdiniForm.QryDocumentoBOLLOADDEBITAINFATTURA.Value := DM1.TableProgressivi2BOLLOADDEBITAINFATTURA.AsString;
  if PreventiviOrdiniForm.QryDocumentoBOLLOADDEBITAINFATTURA.IsNull or (PreventiviOrdiniForm.QryDocumentoBOLLOADDEBITAINFATTURA.AsString = '') then
    PreventiviOrdiniForm.QryDocumentoBOLLOADDEBITAINFATTURA.Value := 'T';
  // Imposta il registro di default della stazione
  PreventiviOrdiniForm.QryDocumentoRegistro.Value := Registro;
  // IMposta il magazzino di default della stazione
  PreventiviOrdiniForm.QryDocumentoCodiceMagazzino.Value := StrToInt(DM1.MagazzinoDefault);
  // Imposta il nome dell'operatore che ha creato il documento
  PreventiviOrdiniForm.QryDocumentoOperatore.Value := DM1.IDOperatoreCorrente;
  PreventiviOrdiniForm.QryDocumentoConsegnato.Value := 'F';
  // IMposta la data di creazione del documento
  PreventiviOrdiniForm.QryDocumentoDATAULTMOD_CREAZIONE.Value := Now;
  // In base ai parametri di Layouts.ini carica o imposta alcuni campi
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // Flag che abilita o meno l'aggiunta dell'anno al numero del documento in fase di stampa
    // (es: Fature 125/2013-)
    fNumDocUnivoco_ProgressivoInfinito := (DM1.TableProgressivi2NUMDOCUNIVOCO_ENABLED.AsString = 'T') and
      LO.ReadBool(NextTipoDocumento, 'NumDocUnivoco_ProgressivoInfinito', False);
    // Se è specificato un registro di default specifico per questo tipo di documento
    // lo assegna.
    if LO.ReadString(NextTipoDocumento, 'RegistroDefault', '') <> '' then
      PreventiviOrdiniForm.QryDocumentoRegistro.Value := LO.ReadString(NextTipoDocumento, 'RegistroDefault', '');
    // Se invece è abilitata la gestione delle versioni multiple dello stesso documento si assicura che il registro
    // sia nullo
    if LO.ReadBool(NextTipoDocumento, 'AbilitaGestioneVersioniDocumento', False) then
      PreventiviOrdiniForm.QryDocumentoRegistro.Clear;
    // Se è abilitato nel documento imposta automaticamente la data e l'ora di inizio trasporto
    if LO.ReadBool(NextTipoDocumento, 'DataOraInizioTrasportoAutomatici', True) then
    begin
      PreventiviOrdiniForm.QryDocumentoDataTrasp.Value := DateToStr(Now);
      PreventiviOrdiniForm.QryDocumentoOraTrasp.Value := FormatDateTime('hh:nn', Now);
    end;
    // Imposta per default il nome esteso del documento = al primo della lista dei nomi del documento stesso
    TmpStr := LO.ReadString(NextTipoDocumento, 'ListaNomiDoc', NextTipoDocumento + ';');
    PreventiviOrdiniForm.QryDocumentoTipoDocumentoEsteso.Value := DM1.RitornaTestoPrimaDi(';', TmpStr, False);
    // Carica le azioni di default che il documento deve compiere rispetto al magazzino e al cantiere
    PreventiviOrdiniForm.QryDocumentoSEGNOOPERAZIONE.AsString := Uppercase(LO.ReadString(NextTipoDocumento, 'AzioneMagazzino', '='));
    PreventiviOrdiniForm.QryDocumentoSEGNOOPERAZIONECANTIERE.AsString := Uppercase(LO.ReadString(NextTipoDocumento, 'AzioneCantiere', '='));
    // Carica la causale di default del documento
    PreventiviOrdiniForm.QryDocumentoCausale.Value := Uppercase(LO.ReadString(NextTipoDocumento, 'CausaleDefault', ''));
    PreventiviOrdiniForm.QryDocumentoCausaleCantiere.Value := Uppercase(LO.ReadString(NextTipoDocumento, 'CausaleCantiereDefault', ''));
    // Imposta lo stato documento DopoCreazione se è stata specificato nel layouts.ini per il documento
    SetStatoNuovoDocumento(PreventiviOrdiniForm.QryDocumento, LO.ReadString(NextTipoDocumento, 'StatoDopoCreazione', ''));
    // Carica il flag che abilita o meno i caricamento delle spese di incasso.
    // In base al tipo di documento cambia il default.
    if (NextTipoDocumento = 'Fattura') or (NextTipoDocumento = 'Fatt.R.F.') or (NextTipoDocumento = 'Fatt.acqui') then
      PreventiviOrdiniForm.CaricaSpeseIncasso := LO.ReadBool(NextTipoDocumento, 'CaricaSpeseIncasso', True)
    else
      PreventiviOrdiniForm.CaricaSpeseIncasso := LO.ReadBool(NextTipoDocumento, 'CaricaSpeseIncasso', False);
    // Se abilitato imposta la data di registrazione del protocollo
    if LO.ReadBool(NextTipoDocumento, 'ProtocolloAutomatico_Data', False) then
      PreventiviOrdiniForm.QryDocumentoPROTOCOLLO_DATA.Value := Now;
    // Imposta alcuni default relativi al riferimento ad altro documento (di solito viene usato negli interventi con rif. alle Ricevute fiscali)
    if LO.ReadBool(NextTipoDocumento, 'V_RifDoc', (NextTipoDocumento = 'Intervento')) then
    begin
      PreventiviOrdiniForm.QryDocumentoRIFDOC_TIPO.Value := LO.ReadString(NextTipoDocumento, 'RifDocTipoDefault', 'Ricev.fisc');
      PreventiviOrdiniForm.QryDocumentoRIFDOC_CORRISPNOPAG.Value := LO.ReadString(NextTipoDocumento, 'RifDocCorrispNoPagDefault', 'F');
    end;
  finally
    LO.Free;
  end;
  // Imposta i valori di default dei campi relativi alla Ritenuta d'Acconto
  // NB: L'ho spostato prima dell'assegnazione del cliente e della pratica
  PreventiviOrdiniForm.QryDocumentoRITACCSUPERCIMP.Value := 'T';
  PreventiviOrdiniForm.QryDocumentoRITACCSUIMPORTOIMP.Value := 'F';
  PreventiviOrdiniForm.QryDocumentoRITACCPERCIMPONIBILE.Value := 100;
  PreventiviOrdiniForm.QryDocumentoRITACCIMPONIBILE.Value := 0;
  PreventiviOrdiniForm.QryDocumentoRITACCPERC.Value := 0;
  PreventiviOrdiniForm.QryDocumentoRITACC.Value := 0;
  // Imposta il codice cliente
  PreventiviOrdiniForm.QryDocumentoCodiceCliente.Value := Cliente;
  // Imposta il prezzo unitario della mano d'opera di default
  PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA.Value := DM1.Manodopera[0].PrezzoUnitario1;
  PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA1.Value := DM1.Manodopera[1].PrezzoUnitario1;
  PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA2.Value := DM1.Manodopera[2].PrezzoUnitario1;
  PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA3.Value := DM1.Manodopera[3].PrezzoUnitario1;
  PreventiviOrdiniForm.QryDocumentoPRZUNITOPERA4.Value := DM1.Manodopera[4].PrezzoUnitario1;
  PreventiviOrdiniForm.QryDocumentoCOSTOUNITOPERA.Value := DM1.Manodopera[0].CostoUnitario;
  PreventiviOrdiniForm.QryDocumentoCOSTOUNITOPERA1.Value := DM1.Manodopera[1].CostoUnitario;
  PreventiviOrdiniForm.QryDocumentoCOSTOUNITOPERA2.Value := DM1.Manodopera[2].CostoUnitario;
  PreventiviOrdiniForm.QryDocumentoCOSTOUNITOPERA3.Value := DM1.Manodopera[3].CostoUnitario;
  PreventiviOrdiniForm.QryDocumentoCOSTOUNITOPERA4.Value := DM1.Manodopera[4].CostoUnitario;
  // Se a questo punto il listino del documento è nullo assegna automaticamente il listino 1
  if (PreventiviOrdiniForm.QryDocumentoListino.IsNull) or (Cliente = 0) then
    PreventiviOrdiniForm.QryDocumentoListino.Value := 1;
  // Se il parametro 'Pratica' > 0 assegna il nuovo documento alla pratica specificata.
  if DataPratica <> '' then
    PreventiviOrdiniForm.QryDocumentoDataPratica1.Value := StrToDate(DataPratica);
  if Pratica > 0 then
    PreventiviOrdiniForm.QryDocumentoPratica.Value := Pratica;
  // Se è in modalità 2 o 3 sighifica che si stà generando il documento in modo automatico e quindi
  // gli deve assegnare subito il numero progressivo altrimenti rimane nullo.
  // Se non è di tipo 1 non deve fare il post del record altrimenti da errore perchè il numero documento è NULL
  if (Mode = 2) or (Mode = 3) then
  begin
    PreventiviOrdiniForm.QryDocumentoNumOrdPrev.Value := DM1.NextNumDocFisc(PreventiviOrdiniForm.QryDocumentoTipoDocumento.Value,
      PreventiviOrdiniForm.QryDocumentoRegistro.Value, PreventiviOrdiniForm.QryDocumentoDataDocumento.Value, fNumDocUnivoco_ProgressivoInfinito);
    PreventiviOrdiniForm.QryDocumento.Post;
    // IMposta le varabili della form del documento in modo che contengano subito i dati relativi al nuovo documento stesso
    // altrimento poi dice che c'è già un altro documento con lo stesso numero.
    PreventiviOrdiniForm.TipoDoc := PreventiviOrdiniForm.QryDocumentoTipoDocumento.Value;
    PreventiviOrdiniForm.Registro := PreventiviOrdiniForm.QryDocumentoRegistro.Value;
    PreventiviOrdiniForm.NumeroDoc := PreventiviOrdiniForm.QryDocumentoNumOrdPrev.Value;
    PreventiviOrdiniForm.DataDoc := PreventiviOrdiniForm.QryDocumentoDataDocumento.Value;
  end;
  // Se si tratta di un preventivo controlla l'abilitazione dei testi iniziale e finale ed eventualmente
  // li precarica dei parametri e progressivi.
  if (NextTipoDocumento = 'Preventivo') then
  begin
    if (TableProgressiviABILITASTARTPREVENTIVO.AsString = 'T') and (not TableProgressiviSTARTPREVENTIVO.IsNull) then
      PreventiviOrdiniForm.QryDocumentoSTARTMEMO.Value := TableProgressiviSTARTPREVENTIVO.Value;
    if (TableProgressiviABILITAENDPREVENTIVO.AsString = 'T') and (not TableProgressiviENDPREVENTIVO.IsNull) then
      PreventiviOrdiniForm.QryDocumentoENDMEMO.Value := TableProgressiviENDPREVENTIVO.Value;
  end;

  // Se il parametro 'Mode' è = 2 oppure a 3 (Cioè solo se si stà facendo
  // la fatturazione differita di fine mese) avvia l'importazione
  // automatica dei righi esportati, altrimenti salta l'operazione in quanto
  // l'importazione sarà manuale con il drag & drop.
  if (Mode = 2) or (Mode = 3) then
  begin
    // Pulisce la griglia da eventuali righi ancora presente (è capitato nella fatturazione riapilogativa differita)
    PreventiviOrdiniForm.tvCorpo.DataController.RecordCount := 0;
    // Effettua l'importazione dei righi selezionati per l'importazione
    // nel nuovo documento.
    // ------------------------------------------------------------------------
    // Crea l'oggetto query, lo imposta e lo esegue per avere tutti i righi da riepilogare
    QryTmp := TIB_Cursor.Create(Self);
    QryTmp.DatabaseName := DM1.GenDBFile;
    QryTmp.IB_Connection := DM1.DBGenerale;
    try
      QryTmp.SQL.Add('SELECT DISTINCT TIPODOCUMENTO, REGISTRO, NUMORDPREV, DATADOCUMENTO');
      QryTmp.SQL.Add('FROM TMPRIGHI');
      // Ovviamente solo documenti dello stesso registro
      DM1.AddSQLToIB_Cursor(QryTmp, 'AND', 'REGISTRO = ''' + Registro + '''');
      // Controlla se devono essere rieplogati solo i righi del cliente oppure tutti.
      if SoloRighiDelCliente then
        DM1.AddSQLToIB_Cursor(QryTmp, 'AND', 'CODICECLIENTE = ' + IntToStr(Cliente));
      // Controlla se devono essere rieplogati solo i righi della pratica di cui fà parte
      // il nuovo documento.
      if (SoloRighiDellaPratica) then
      begin
        DM1.AddSQLToIB_Cursor(QryTmp, 'AND', 'PRATICA = ' + IntToStr(Pratica));
        DM1.AddSQLToIB_Cursor(QryTmp, 'AND', 'DATAPRATICA = ''' + FormatDateTime('mm/dd/yyyy', StrToDate(DataPratica)) + '''');
      end;
      // Li ordina dal più vecchio al più nuovo.
      QryTmp.SQL.Add('ORDER BY DATADOCUMENTO, NUMORDPREV, REGISTRO, TIPODOCUMENTO');
      QryTmp.Open;
      // Si pone all'inizio dei documenti da riepilogare e cicla per riepilogarli
      // tutti.
      QryTmp.First;
      while not QryTmp.Eof do
      begin
        // Esegue l'importazione del documento.
        PreventiviOrdiniForm.ImportaDocFisc(QryTmp.FieldByName('TipoDocumento').Value, QryTmp.FieldByName('Registro').Value,
          QryTmp.FieldByName('NumOrdPrev').Value, QryTmp.FieldByName('DataDocumento').Value, PreventiviOrdiniForm.RifEnabled, False);
        // ELimina il documento appena importato
        PreventiviOrdiniForm.EliminaDocImportato(QryTmp.FieldByName('TipoDocumento').Value, QryTmp.FieldByName('Registro').Value,
          QryTmp.FieldByName('NumOrdPrev').Value, QryTmp.FieldByName('DataDocumento').Value);
        // Marca il documento come fatturato
        DocFatturato(QryTmp.FieldByName('TipoDocumento').Value, QryTmp.FieldByName('Registro').Value, QryTmp.FieldByName('NumOrdPrev').Value,
          QryTmp.FieldByName('DataDocumento').Value);
        QryTmp.Next;
      end;
    finally
      QryTmp.Close;
      QryTmp.Free;
    end;
  end;
  // ------------------------------------------------------------------------
  // in base al valore del parametro 'Mode' intraprende delle azioni o meno come indicato all'inizio
  // della funzione.
  case Mode of
    // Distrugge la form in quanto in MOde 0 doveva creare solo il documento senza visualizzare la form
    0:
      begin
        PreventiviOrdiniForm.Free;
      end;
    // Visualizza la form che deve essere già stata creata un pò più su
    1:
      begin
        PreventiviOrdiniForm.Tag := MODE_NEW;
        if not PreventiviOrdiniForm.IsImpegno then
          PreventiviOrdiniForm.Show;
      end;
    2:
      begin
        // Conferma il documento
        PreventiviOrdiniForm.ModalResultCreaScad := mrNo; // Non crea le scadenze
        PreventiviOrdiniForm.RxSpeedModifica.Down := False;
        PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
        // Prima della stampa carica le preferenze di stampa perchè in caso di fatturazione differita non
        // le carica nella  procedure 'CaricaLayout'
        // Inizializzazione pannello delle preferenze di stampa
        // NB: Non c'è bisogno di mettere anche la "StmPref_LoadPreferences" perchè
        // stiamo creando un nuovo documento e quindi sicuramente non avrà
        // delle impostazioni precedentemente salvate
        PreventiviOrdiniForm.StmPref_Initialize;
        // Stampa sulla stampante se le copie sono > 0
        if Copies > 0 then
          PreventiviOrdiniForm.StampaDocFisc(NextTipoDocumento, Registro, PreventiviOrdiniForm.QryDocumentoNumOrdPrev.Value,
            PreventiviOrdiniForm.QryDocumentoDataDocumento.Value, 1, Copies, False);
      end;
    3:
      begin
        // Conferma il documento
        PreventiviOrdiniForm.ModalResultCreaScad := mrYes; // Crea le scadenze
        PreventiviOrdiniForm.RxSpeedModifica.Down := False;
        PreventiviOrdiniForm.RxSpeedModificaClick(PreventiviOrdiniForm.RxSpeedModifica);
        // Prima della stampa carica le preferenze di stampa perchè in caso di fatturazione differita non
        // le carica nella  procedure 'CaricaLayout'
        // Inizializzazione pannello delle preferenze di stampa
        // NB: Non c'è bisogno di mettere anche la "StmPref_LoadPreferences" perchè
        // stiamo creando un nuovo documento e quindi sicuramente non avrà
        // delle impostazioni precedentemente salvate
        PreventiviOrdiniForm.StmPref_Initialize;
        // Stampa sulla stampante se le copie sono > 0
        if Copies > 0 then
          PreventiviOrdiniForm.StampaDocFisc(NextTipoDocumento, Registro, PreventiviOrdiniForm.QryDocumentoNumOrdPrev.Value,
            PreventiviOrdiniForm.QryDocumentoDataDocumento.Value, 1, Copies, False);
      end;
    // Pone la proprietà Tag della Form dei documento = 3 che significa che la form si metterà in modalità KIOSK
    4:
      begin
        PreventiviOrdiniForm.Tag := MODE_KIOSK;
        if PreventiviOrdiniForm.Visible then
          PreventiviOrdiniForm.FormShow(Self)
        else
          PreventiviOrdiniForm.Show;
        // Se è in modalità MagKioskMode richiede sempre prima il cantiere con il touch screen
        if MainForm.MagKioskMode then
          PreventiviOrdiniForm.RichiediCantiereTouchScreen;
      end;
  end;
end;

function TDM1.EliminaTagHtml(StrIn: String): String;
var
  StartTag, LenTag: Shortint;
  OldPattern: String;
begin
  Result := StrIn;
  // Questa funzione elimina tutti i Tag html eventualmente presenti nella stringa in entrata
  // NB: Mette un carattere SPAZIO al posto del Tag
  // ----------------------------------------------------------------------------------------
  // Cicla finchè trova il carattere iniziale dei Tag Html ('<')
  while Pos('<', Result) > 0 do
  begin
    // STartTag e EndTag contengono il carattere di inizio e fine del Tag Html
    StartTag := Pos('<', Result);
    LenTag := Pos('>', Result) - StartTag + 1; // Per differenza contiene la lunghezza in caratteri del tag
    // Elimina il tag
    if LenTag > 0 then
    begin
      // Delete(Result, StartTag, LenTag)
      OldPattern := Copy(Result, StartTag, LenTag);
      Result := StringReplace(Result, OldPattern, ' ', [])
    end;
  end;
end;

procedure TDM1.CreaFornitoreArticolo(CodiceArticolo: String; CodiceFornitore: Integer);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;
    // Query che crea il magazzino nell'articolo
    Qry.SQL.Add
      ('INSERT INTO LISTFORN (CODICEARTICOLO, CODICEFORNITORE, PREZZODILISTINO, SCONTODIACQUISTO1, SCONTODIACQUISTO2, SCONTODIACQUISTO3, PREZZODIACQUISTO, CODICEARTICOLOFORNITORE, DESCRIZIONEFORNITORE, SINCHRO)');
    Qry.SQL.Add('VALUES (''' + CodiceArticolo + ''',''' + IntToStr(CodiceFornitore) + ''', 0, 0, 0, 0, 0, '''', '''', ''M'')');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaListiniFornitoriArticolo(CodiceArticolo: String);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;
    // Query che elimina tutti i magazzini dell'articolo
    Qry.SQL.Add('DELETE FROM LISTFORN WHERE CODICEARTICOLO =''' + CodiceArticolo + '''');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.ControlloFornitoriArticolo(CodiceArticolo: String);
var
  Qry, Qry2: TIB_Cursor;
begin
  // Solo se abilitato
  if not DM1.Articoli_ListiniFornitoriAutomatici then
    Exit;

  Qry := TIB_Cursor.Create(Self);
  Qry2 := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;
    Qry2.DatabaseName := ArcDBFile;
    Qry2.IB_Connection := DBAzienda;
    // Query che contiene l'elenco dei fornitori
    Qry.SQL.Add('SELECT CODICE FROM CLIENTI WHERE FORNITORECONLISTINO = ''T''');
    Qry.Open;
    // Cicla per tutti i magazzini
    while not Qry.Eof do
    begin
      // Prima controlla se il magazzino corrente esiste già per l'articolo
      Qry2.SQL.Clear;
      Qry2.SQL.Add('SELECT COUNT(*) AS EXIST FROM LISTFORN WHERE CODICEFORNITORE= ' + Qry.FieldByName('CODICE').AsString + ' AND CODICEARTICOLO = ''' +
        CodiceArticolo + '''');
      Qry2.Open;
      // Se il magazzino controllato non esiste lo crea
      if Qry2.FieldByName('EXIST').AsInteger = 0 then
      begin
        // Crea il magazzino
        CreaFornitoreArticolo(CodiceArticolo, Qry.FieldByName('CODICE').AsInteger);
      end;
      Qry2.Close;
      // Và al prossimo magazzino da controllare
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
    Qry2.Free;
  end;
end;

function TDM1.LockDatabaseAccess: Boolean;
var
  Qry: TIB_Cursor;
begin
  Result := True;
  // Imposta a '1' il campo 'EXCLUSIVEDATABASEACCESS' della tabella 'DatiAzienda' per indicare
  // ai client che non possono connettersi a questa azienda perchè ci sono operazioni
  // di ristrutturazione in corso.
  Qry := TIB_Cursor.Create(Self);
  try
    // Continua se è l'unico utente collegano al database
    if DBAzienda.Users.Count = 1 then
    begin
      Qry.DatabaseName := GenDBFile;
      Qry.IB_Connection := DBGenerale;
      // Imposta il flag di bolccaggio
      Qry.SQL.Add('UPDATE AZIENDE SET EXCLUSIVEDATABASEACCESS = ''1'' WHERE AZIENDA = ''' + AziendaCorrente + '''');
      Qry.ExecSQL;
      // Se invece non è l'unico utente collegato dà un messaggio e ritorna False
    end
    else
    begin
      Result := False;
      MessageBeep(0);
      MessageDlg
        ('A T T E N Z I O N E !!!'#13#13'Per effettuare le operazioni richieste non devono esserci altre sessioni attive di Levante.'#13'Attualmente sono attive '
        + IntToStr(DBAzienda.Users.Count - 1) + ' sessioni oltre a questa.'#13'Assicurarsi che non ci siano altre sessioni attive prima di continuare.',
        mtInformation, [mbOk], 0);
    end;
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TDM1.UnLockDatabaseAccess;
var
  Qry: TIB_Cursor;
begin
  // Imposta a '1' il campo 'EXCLUSIVEDATABASEACCESS' della tabella 'DatiAzienda' per indicare
  // ai client che non possono connettersi a questa azienda perchè ci sono operazioni
  // di ristrutturazione in corso.
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := GenDBFile;
    Qry.IB_Connection := DBGenerale;
    // Imposta il flag di bolccaggio
    Qry.SQL.Add('UPDATE AZIENDE SET EXCLUSIVEDATABASEACCESS = ''0'' WHERE AZIENDA = ''' + AziendaCorrente + '''');
    Qry.ExecSQL;
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

function TDM1.LockedDatabase: Boolean;
var
  Qry: TIB_Cursor;
begin
  // Imposta a '1' il campo 'EXCLUSIVEDATABASEACCESS' della tabella 'DatiAzienda' per indicare
  // ai client che non possono connettersi a questa azienda perchè ci sono operazioni
  // di ristrutturazione in corso.
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := GenDBFile;
    Qry.IB_Connection := DBGenerale;
    // Preleva il nome dell'azienda (campi chiave)
    Qry.SQL.Add('SELECT EXCLUSIVEDATABASEACCESS FROM AZIENDE WHERE AZIENDA = ''' + AziendaCorrente + '''');
    Qry.Open;
    Result := Qry.FieldByName('EXCLUSIVEDATABASEACCESS').AsString = '1';
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

function TDM1.ExecuteExternalAppWithPipeRedirectionOnStrings(const CommandLIne: string; OutputStringList: TStrings; TestExitCode: Boolean = True): Boolean;
const
  BufSize = 256;
var
  StartUp: TStartupInfo;
  ProcessInfo: TProcessInformation;
  OutPutReadTmp, OutputRead, OutputWrite: THandle;
  ErrorWrite: THandle;
  SecurityAttrib: TSecurityAttributes;
  Buffer: array [0 .. BufSize - 1] of Char;
  BytesRead: Cardinal;
  j: Integer;
  Code: Cardinal;
  S: string;
  OSError: Integer;
  CurrLine: String;

  Command: STring;

begin
  // Inizializzazione
  Result := False;
  // Inizializzazione degli attributi di sicurezza
  with SecurityAttrib do
  begin
    nLength := SizeOf(SecurityAttrib);
    lpSecurityDescriptor := nil;
    bInheritHandle := True;
  end;

  // Prima di tutto crea la Pipe
  CreatePipe(OutPutReadTmp, OutputWrite, @SecurityAttrib, 0);
  // Duplicate handles, to intecept StdError too...
  DuplicateHandle(GetCurrentProcess, OutputWrite, GetCurrentProcess, @ErrorWrite, 0, True, DUPLICATE_SAME_ACCESS);
  DuplicateHandle(GetCurrentProcess, OutPutReadTmp, GetCurrentProcess, @OutputRead, 0, False, DUPLICATE_SAME_ACCESS);
  // This handle is no longer useful, close it
  CloseHandle(OutPutReadTmp);

  // Inizializzazione dei Flags di Startup
  FillChar(StartUp, SizeOf(StartUp), 0);
  with StartUp do
  begin
    cb := SizeOf(StartUp);
    lpTitle := PChar('Application');
    dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    hStdInput := GetStdHandle(STD_INPUT_HANDLE); // We do not need StdInput
    hStdOutput := OutputWrite;
    hStdError := ErrorWrite;
    wShowWindow := SW_HIDE; // Run in a non visible window
  end;

  // Avvio del processo da avviare
  if not CreateProcess(nil, PChar(CommandLIne), nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, StartUp, ProcessInfo) then
    RaiseLastOSError;

  // Close unnecessary handles
  CloseHandle(ProcessInfo.hThread);

  // Close handles or the pipe won't close them in the child process and ReadFile will hang
  CloseHandle(OutputWrite);
  CloseHandle(ErrorWrite);

  // Wait for spawned process to complete...
  repeat
    // Read the pipe...
    if (not ReadFile(OutputRead, Buffer, SizeOf(Buffer), BytesRead, nil)) or (not(BytesRead > 0)) then
    begin
      OSError := GetLastError;
      if OSError <> ERROR_BROKEN_PIPE then
        raise EOSError.CreateFmt('Error while reading on child process pipe: %d', [OSError]);
    end;

    // Write buffer to our message window
    SetLength(S, BytesRead);
    for j := 0 to BytesRead - 1 do
    begin
      S[j + 1] := Buffer[j];
    end;
    // Aggiorna lo schermo
    // LaunchBackupForm.Memo1.Lines.Add(S);
    while DM1.RitornaTestoPrimaDi(#13, S, False) <> '' do
    begin
      CurrLine := DM1.RitornaTestoPrimaDi(#13, S, True);
      // CurrLine := RightStr(CurrLine, Length(CurrLine)-1);   // Elimina il primo carattere perchè è un ascii
      // Maschera nomeutente e password del database
      CurrLine := StringReplace(CurrLine, 'SYSDBA', '***', [rfReplaceAll, rfIgnoreCase]);
      CurrLine := StringReplace(CurrLine, 'th3cla', '***', [rfReplaceAll, rfIgnoreCase]);
      CurrLine := StringReplace(CurrLine, '1DR0GAT3', '***', [rfReplaceAll, rfIgnoreCase]);
      // Aggiunge la linea al meno
      OutputStringList.Add(CurrLine);
    end;

    GetExitCodeProcess(ProcessInfo.hProcess, Code);
    // Sleep(100); // Do not test too often.. 100   ##### ATTENZIONE FORSE E' DA RIMETTERE #####
  until (Code <> STILL_ACTIVE) and (BytesRead = 0);

  // Salva il contenuto del memo1 per una eventuale analisi
  OutputStringList.SaveToFile(DM1.CartellaTmp + 'LastExternalExecutionPipe.txt');

  if TestExitCode and (Code <> 0) then
    raise Exception.CreateFmt('Process terminated with error %d', [Code]);

  CloseHandle(OutputRead);
  CloseHandle(ProcessInfo.hProcess);

  Result := True;
end;

// Avvia l'eseguibile senza attendere la sua fine
procedure TDM1.WinExec(FileName, Parameters: String);
var
  LExeFileName, LExePath: String;
begin
  LExeFileName := ExtractFileName(FileName);
  LExePath := ExtractFilePath(FileName);
  if LExePath = '' then
    LExePath := CurrDir;
  LExePath := '"' + LExePath + '"';
  ShellApi.ShellExecute(Application.Handle, 'open', PChar(FileName), PChar(Parameters), PChar(LExePath), SW_SHOW);
end;

function TDM1.WinExecAndWait32(FileName: String; Visibility: Integer): Cardinal;
var { by Pat Ritchey }
  zAppName: array [0 .. 512] of Char;
  zCurDir: array [0 .. 255] of Char;
  WorkDir: String;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);

  FillChar(StartupInfo, SizeOf(StartupInfo), #0);

  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;

  if (not CreateProcess(nil, zAppName, { pointer to command line string }
    nil, { pointer to process security attributes }
    nil, { pointer to thread security attributes }
    False, { handle inheritance flag }
    CREATE_NEW_CONSOLE or { creation flags }
    NORMAL_PRIORITY_CLASS, nil, { pointer to new environment block }
    zCurDir, { pointer to current directory name }
    StartupInfo, { pointer to STARTUPINFO }
    ProcessInfo)) then
  begin
    Result := $FFFFFFFF; { pointer to PROCESS_INF }
    MessageBox(Application.Handle, PChar(SysErrorMessage(GetLastError)), 'Yipes!', 0);
  end
  else
  begin
    WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, Result);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
  end;
end;

function TDM1.RunAndWaitShell(sFile: string; sArgs: string; Handle: Cardinal; iVisibility: Integer): DWord;
var
  Info: TShellExecuteInfo;
  pInfo: PShellExecuteInfo;
  exitCode: Word;
begin
  { Pointer to Info }
  pInfo := @Info;

  { Fill info }
  With Info do
  begin
    cbSize := SizeOf(Info);
    fMask := SEE_MASK_NOCLOSEPROCESS;
    wnd := Handle;
    lpVerb := 'Open';
    lpFile := PChar(sFile);
    { Executable parameters }
    lpParameters := PChar(sArgs + #0);
    lpDirectory := nil;
    nShow := iVisibility;
    hInstApp := 0;
  end;

  { Execute }
  ShellExecuteEx(pInfo);

  { Wait to finish }
  repeat
    exitCode := WaitforSingleObject(Info.hProcess, 500);
    Application.ProcessMessages;
  until (exitCode <> WAIT_TIMEOUT);

  Result := exitCode;
end;

function TDM1.GetExeByExtension(sExt: string): string;
var
  sExtDesc: string;
begin
  with TRegistry.Create do
  begin
    try
      RootKey := HKEY_CLASSES_ROOT;
      if OpenKeyReadOnly(sExt) then
      begin
        sExtDesc := ReadString('');
        CloseKey;
      end;
      if sExtDesc <> '' then
      begin
        if OpenKeyReadOnly(sExtDesc + '\Shell\Open\Command') then
        begin
          Result := ReadString('');
        end
      end;
    finally
      Free;
    end;
  end;

  if Result <> '' then
  begin
    if Result[1] = '"' then
    begin
      // Result:=Copy(Result,2,-1 + Pos('"',Copy(Result,2,MaxINt))) ;
      Result := Copy(Result, 2, -1 + Pos('"', Copy(Result, 2, 999999)));
    end
  end;
end;

function TDM1.RitornaTestoPrimaDi(C: String; var S: String; Cut: Boolean): String;
var
  Tmp: Integer;
begin
  // Questa funzione ritorna il testo della stringa ricevuta some parametro (S) che si
  // trova prima del carattere di riferimento ricevuto in (C).
  // Questa funzione serve per riconoscere se nella stringa ricevuta come parametro
  // è contenuto la caption per una label. Serve per la funzione che costruisce il layout
  // di una form per controllare e prelevare un eventuale Caption di Label.
  // ES: 'L-Prova_Pippero' significa che prima di pippero che è la caption della label
  // che descrive la funzione del campo, c'è la stringa 'L-Prova' che significa che
  // si deve creare un componente tlabel che fungerà da titolo con giustificazione a
  // sinistra (L- = Sx; R- = Dx; C- = Centrato) e con Caption := 'Prova'
  // Questa funzione ritornerà appunto la stringa 'L-Prova' alla funzione chiamante che
  // poi la utilizzerà come crede.
  Result := '';
  Tmp := Pos(C, S);
  if Tmp > 0 then
  begin
    Result := DM1.StrLeft(S, Tmp - 1);
    if Cut then
      S := DM1.StrRight(S, Length(S) - Tmp);
  end;
end;

procedure TDM1.ReturnToTab(Key: Char);
begin
  if Ord(Key) = 13 then
  begin
    keybd_event(VK_TAB, 0, 0, 0);
    keybd_event(VK_TAB, 0, KEYEVENTF_KEYUP, 0);
  end;
end;

function TDM1.NoNullIntValue(DC: TcxCustomDataController; RowIndex, ColIndex: Integer): Longint;
var
  V: Variant;
begin
  // Questa funzione restituisce il valore Intero contenuto nella Column
  // facendo in modo che se il suo valore è NULL venga restituito 0.
  Result := 0;
  V := DC.Values[RowIndex, ColIndex];
  if not VarIsNull(V) then
    Result := V;
end;

function TDM1.NoNullBoolValue(DC: TcxCustomDataController; RowIndex, ColIndex: Integer; Default: Boolean): Boolean;
var
  V: Variant;
begin
  // Questa funzione restituisce il valore Intero contenuto nella Column
  // facendo in modo che se il suo valore è NULL venga restituito 0.
  Result := Default;
  V := DC.Values[RowIndex, ColIndex];
  if VarIsNull(V) then
    Exit;
  Result := VarToStrDef(V, 'F') = 'T';
end;

function TDM1.NoNullFloatValue(DC: TcxCustomDataController; RowIndex, ColIndex: Integer): Double;
var
  V: Variant;
begin
  // Questa funzione restituisce il valore Intero contenuto nella Column
  // facendo in modo che se il suo valore è NULL venga restituito 0.
  Result := 0;
  V := DC.Values[RowIndex, ColIndex];
  if not VarIsNull(V) then
    Result := V;
end;

function TDM1.NoNullStringValue(DC: TcxCustomDataController; RowIndex, ColIndex: Integer): String;
var
  V: Variant;
begin
  // Questa funzione restituisce il valore Intero contenuto nella Column
  // facendo in modo che se il suo valore è NULL venga restituito 0.
  Result := '';
  V := DC.Values[RowIndex, ColIndex];
  if not VarIsNull(V) then
    Result := V;
end;

function TDM1.StrVarToSQL_DefaultIfNull(V: Variant; Def: String): String;
begin
  // Questa funzione riceve un Variant e costruisce con questo una riga
  // da inserire in una query. Se il Variane è NULL restituisce la stringa
  // specificata come default.
  // -------------------------------------------------------------------
  Result := StrVarToSQL(V);
  if Result = 'NULL' then
    Result := AnsiQuotedStr(Def, '''');
end;

function TDM1.StrVarToSQL(V: Variant): String;
begin
  // Questa funzione riceve un Variant e costruisce con questo una riga
  // da inserire in una query.
  // -------------------------------------------------------------------
  // Inizializzazione
  Result := 'NULL';
  // Se il valore ricevuto non è nullo...
  if not VarIsNull(V) then
  begin
    Result := AnsiQuotedStr(VarToStr(V), '''');
  end;
end;

function TDM1.DateVarToSQL(V: Variant): String;
begin
  // Questa funzione riceve un Variant e costruisce con questo una riga
  // da inserire in una query.
  // -------------------------------------------------------------------
  // Inizializzazione
  Result := 'NULL';
  // Se il valore ricevuto non è nullo...
  if not VarIsNull(V) then
  begin
    Result := AnsiQuotedStr(FormatDateTime('mm/dd/yyyy', VarToDateTime(V)), '''');
  end;
end;

function TDM1.IntVarToSQL(V: Variant): String;
begin
  // Questa funzione riceve un Variant e costruisce con questo una riga
  // da inserire in una query.
  // -------------------------------------------------------------------
  // Inizializzazione
  Result := 'NULL';
  // Se il valore ricevuto non è nullo...
  if not VarIsNull(V) then
  begin
    Result := VarToStr(V);
  end;
end;

function TDM1.FloatVarToSQL_DefaultIfNull(V: Variant; Def: String): String;
begin
  // Questa funzione riceve un Variant e costruisce con questo una riga
  // da inserire in una query. Se il Variane è NULL restituisce la stringa
  // specificata come default.
  // -------------------------------------------------------------------
  Result := FloatVarToSQL(V);
  if Result = 'NULL' then
    Result := Def;
end;

function TDM1.FloatVarToSQL(V: Variant; Decimali: Smallint = -1): String;
begin
  // Questa funzione riceve un Variant e costruisce con questo una riga
  // da inserire in una query.
  // -------------------------------------------------------------------
  // Inizializzazione
  Result := 'NULL';
  // Se il valore ricevuto non è nullo...
  if not VarIsNull(V) then
  begin
    Result := VirgolaPunto(Double(V), Decimali);
  end;
end;

function TDM1.VirgolaPunto(Numero: Extended; Decimali: Smallint = -1): String;
var
  ParteDecimaleStr: String;
  ParteDecimale: Real;
  Segno: String;
begin
  // Se il parametro Decimali = -1 allora lo assume = a DM1.DecMicroPrz altrimenti lo usa così come
  // lo ha ricevuto.
  if Decimali = (-1) then
    Decimali := DecMicroPrz;
  // Se il numero è negativo e al tesmpo stesso è minore di zero ma maggiore di 1 (0,71)
  // la funzione faceva sparire il meno davanti al numero, ora invece verifico e salvo
  // nella variabile Segno l'eventuale '-' da ripristinare prima di ritornare il valore
  // alla procedura chiamante
  Segno := '';
  if (Numero < 0) and (Numero > -1) then
    Segno := '-';
  // Converte il numero in stringa sostituendo il carattere di separazione della parte decimale
  // qualunque essa sia nel carattere '.' in modo che possa essere usato per la costruzione
  // delle query SQL.
  // NB: HO messo la funzione Abs perchè altrimenti con i numeri negativi dava un problema.
  ParteDecimale := Arrotonda(Abs(Numero - Trunc(Numero)), Decimali);
  // A questo punto la variabile ParteDecimale potrebbe in alcuni casi particolari contenere un numero >= 1
  // (es. nel caso la parte decimale fosse 0.992 con DevMicroPrz = 2 ora la variabile conterrebbe 1 per
  // via della funzione Arrotonda). Se questo dosse il caso somma la parte intera della variabile
  // ParteDecimale al Numero.
  if ParteDecimale >= 1 then
  begin
    // Se Numero è negativo sottrae altrimenti somma
    if Numero < 0 then
      Numero := Numero - Trunc(ParteDecimale)
    else
      Numero := Numero + Trunc(ParteDecimale);
    // Ripulisce ParteDecimale della sua parte intera
    ParteDecimale := ParteDecimale - Trunc(ParteDecimale);
  end;
  // COnverte la parte decimale del numero in stringa usando la funzione 'Format' e specificando
  // un numero di decimali come impostato in DecMicroPrz, in questo modo si risolve un problema
  // di precisione di conversione della funzione FloatToStr (Prima la usavo e mi scazzava in alcuni casi)
  ParteDecimaleStr := Format('%0.' + IntToStr(Decimali) + 'f', [ParteDecimale]);
  // Taglia anche la parte eccedente dei decimali oltre i numero dei decimali dei microprezzi
  Result := Segno + IntToStr(Trunc(Numero));
  if Decimali <> 0 then
    Result := Result + '.' + StrLeft(StrRight(ParteDecimaleStr, Length(ParteDecimaleStr) - 2), Decimali);
end;

// Procedura che verifica l'esistenza di nuove versioni dei files di parametri
// ed eventualmente scarica le versioni più aggiornate
procedure TDM1.ControllaFilesConfigurazione;
var
  AlreadyConnected: Boolean;
begin
  // Se non è già connesso al LevGen ci si connette
  AlreadyConnected := DM1.DBGenerale.Connected;
  if not AlreadyConnected then
    DM1.AttivaTabelle(True, False);
  try
    // =========================================================================
    // PARAM_ALLUSERS.INI
    // -------------------------------------------------------------------------
    fRepository_Param_AllUsers := TRepositoryFile.Create;
    fRepository_Param_AllUsers.Azienda := ''; // NON separato per azienda
    fRepository_Param_AllUsers.FileNameNoExt := 'Param_AllUsers';
    fRepository_Param_AllUsers.FileDir := DM1.CommonAppDataLevanteDir;
    fRepository_Param_AllUsers.OriginalFileNameWithExt := 'param.ini';
    fRepository_Param_AllUsers.OriginalFileDir := DM1.CurrDir;
    fRepository_Param_AllUsers.IB_Connection := DM1.DBGenerale;
    fRepository_Param_AllUsers.ForceLocal := False;
    fRepository_Param_AllUsers.CheckFile;
    // =========================================================================
    // =========================================================================
    // PARAM_USER.INI
    // -------------------------------------------------------------------------
    fRepository_Param_User := TRepositoryFile.Create;
    fRepository_Param_User.Azienda := ''; // NON separato per azienda
    fRepository_Param_User.FileNameNoExt := 'Param_User_' + GetLocalUserName;
    fRepository_Param_User.FileDir := DM1.UserAppDataLevanteDir;
    fRepository_Param_User.OriginalFileNameWithExt := 'param.ini';
    fRepository_Param_User.OriginalFileDir := DM1.CurrDir;
    fRepository_Param_User.IB_Connection := DM1.DBGenerale;
    fRepository_Param_User.ForceLocal := False;
    fRepository_Param_User.CheckFile;
    // =========================================================================
    // =========================================================================
    // LAYOUTS.INI
    // -------------------------------------------------------------------------
    fRepository_Layouts := TRepositoryFile.Create;
    fRepository_Layouts.Azienda := ''; // NON separato per azienda
    fRepository_Layouts.FileNameNoExt := 'layouts';
    fRepository_Layouts.FileDir := DM1.UserAppDataLevanteDir;
    fRepository_Layouts.OriginalFileNameWithExt := 'layouts.ini';
    fRepository_Layouts.OriginalFileDir := DM1.CurrDir;
    fRepository_Layouts.IB_Connection := DM1.DBGenerale;
    fRepository_Layouts.ForceLocal := False;
    fRepository_Layouts.CheckFile;
    // =========================================================================
    // =========================================================================
    // MENU.INI
    // -------------------------------------------------------------------------
    fRepository_Menu := TRepositoryFile.Create;
    fRepository_Menu.Azienda := ''; // NON separato per azienda
    fRepository_Menu.FileNameNoExt := 'menu';
    fRepository_Menu.FileDir := DM1.UserAppDataLevanteDir;
    fRepository_Menu.OriginalFileNameWithExt := 'menu.ini';
    fRepository_Menu.OriginalFileDir := DM1.CurrDir;
    fRepository_Menu.IB_Connection := DM1.DBGenerale;
    fRepository_Menu.ForceLocal := False;
    fRepository_Menu.CheckFile;
    // =========================================================================
  finally
    // Se prima di entrare in questa procedura non era connesso si disconnette
    // altrimenti lascia tutto così.
    if not AlreadyConnected then
      DM1.DBGenerale.Disconnect;
  end;
end;

procedure TDM1.VisualizzaBaseSetup;
begin
  // Visualizza la schermata di avvio
  // MainForm.VisualizzaAvvio(True);
  // Visualizza la form delle aziende
  Application.CreateForm(TBaseSetupForm, BaseSetupForm);
  // BaseSetupForm.Parent := MainForm;
  BaseSetupForm.ShowModal;
end;

procedure TDM1.DM1Create(Sender: TObject);
var
  P: TMemIniFile;
  SysDir: array [0 .. MAX_PATH - 1] of Char;
  SerialNum: Integer;
  a, b: DWord;
begin
  Self.GoValidateQtaOreMinuti := True;
  // Inizializzazione
  DisabilitaSetAgenti := False;
  AvvertimentoScadenzaChiaveGiaVisualizzato := False;
  // Flag che indica se la form di aggiornamento presente nel repository è già
  // stata visualizzata oppure no
  // NB: La uso perchè altrimenti all'avvio me la dava due volte
  fUpdateRepDownloadForm_Showed := False;
  // Imposta il nome e utente e la password per l'accesso a Interbase.
  // IBUser := '1DR0GAT3';
  // IBPswd := 'th3cla';
  // NomeUtente e password per MarVin
  // IBUser := 'SYSDBA';
  // IBPswd := 'masterkey';
  // Inizializzazioen ultima data usata per l'inserimento dei righi GC
  GC_UltimaDataInsert := Date;
  // Inizializzazione di altri permessi non dipendenti dalla chiave di protezione
  AbilitaMenuImpostazioni := True;
  AbilitaMenuUtilita := True;
  // Inizializza le variabili per l'attivazione del DragAndDrop
  DDX := -1;
  DDX := -1;
  // Inizializza la variabile che contiene la data di inizio e fine del periodo demo
  DemoFlags.InfoDemoShowed := False;
  DemoFlags.GiorniMancantiFineDemo := 0;
  DemoFlags.DataPrimoAvvio := StrToDate('01/01/1900');
  DemoFlags.DataScadenza := StrToDate('01/01/1900');
  DemoFlags.DataBloccoTotale := StrToDate('01/01/1900');
  // Nome operatore di default è nullo
  IDOperatoreCorrente := '';

  // Carica il percorso della cartella dei dati delle applicazioni dell'utente corrente
  UserAppDataDir := SlashFinale(GetAppdataFolder);
  UserAppDataLevanteDir := SlashFinale(UserAppDataDir + 'Levante\');
  if not DirectoryExists(UserAppDataLevanteDir) then
    CreateDir(UserAppDataLevanteDir);
  // Carica il percorso della cartella dei dati delle applicazioni comuni a tutti

  // gli utenti.
  // Mauri 29/06/2020: Ora ho eliminato la CoverDir, il DGPrgVer non c'è più sostituito
  //  da un apposito campo nel LEVGEN.GDB e, rimane il file "Param_AllUser" che però
  //  qui sposto nella "UserAppDataLevanteDir". In questo modo non serve più accedere
  //  alla cartella pubblica del programma e ci togliamo di mezzo tutti i problemi successi
  //  recentemente.
  CommonAppDataLevanteDir := UserAppDataLevanteDir;
//  CommonAppDataDir := SlashFinale(GetCommonAppdataFolder);
//  CommonAppDataLevanteDir := SlashFinale(CommonAppDataDir + 'Levante\');
//  if not DirectoryExists(CommonAppDataLevanteDir) then
//    CreateDir(CommonAppDataLevanteDir);

    // Se non esistono crea le cartelle 'Upload' e 'Download' che serviranno per la sincronizzazione degli archivi
    UploadDir := UserAppDataLevanteDir + 'Upload';
    UploadDir := SlashFinale(UploadDir);
    if not DirectoryExists(UploadDir) then
      CreateDir(UploadDir);

    DownloadDir := UserAppDataLevanteDir + 'Download';
    DownloadDir := SlashFinale(DownloadDir);
    if not DirectoryExists(DownloadDir) then
      CreateDir(DownloadDir);

  // Carica il percorso del desktop
  DesktopDir := SlashFinale(GetDesktopFolder);
  // Carica nella variabile 'CurrDir' la directory attuale e la assegna come percorso
  // per la sessione privata
  CurrDir := ExtractFileDir(Application.ExeName);
  CurrDir := SlashFinale(CurrDir);
  // Carica nella variabile 'GebDBFile' il precorso completo e il nome file del database generale
  GenDBFile := CurrDir + 'LevGen.gdb';

  // Localization (Italiano)
  // NB: Ho disabilitato tutto per il momento perchè quando nelle griglie
  // si raggruppava una colonna con una data con dtgByMonth mi aggiungeva,
  // al mese, anche il giorno della settimana. Disbilitandolo il problema
  // non appare più
  // if FileExists(DM1.CurrDir + 'cxLOCALIZATION.ini') then
  // begin
  // cxLocalizer.FileName := DM1.CurrDir + 'cxLOCALIZATION.ini';
  // cxLocalizer.Active := True;
  // cxLocalizer.Language := 'Italiano (Italia)';
  // end;

  // ==========================================================================
  // PARAM.INI - ORIGINARIO
  // NB: Dal param.ini prende ormai solo il ServerAddress
  // --------------------------------------------------------------------------
  // Apre il file Param.ini dove ci sono l'indirizzo del server e l'azienda corrente
  P := TMemIniFile.Create(CurrDir + 'param.ini');
  // Preleva l'indirizzo del server interbase
  // NB: Se l'indirizzo del server è LOCAL lo converte nell'indirizzo
  // del computer stesso
  ServerAddress := Trim(P.ReadString('ARCPATH', 'ServerAddress', 'LOCAL'));
  // if (Uppercase(ServerAddress) = 'LOCAL') or (Trim(ServerAddress) = '')
  // then ServerAddress := '127.0.0.1';
  // Carica UserName e Password
  IBUser := Trim(P.ReadString('ARCPATH', 'UserName', '1DR0GAT3'));
  IBPswd := Trim(P.ReadString('ARCPATH', 'Password', 'th3cla'));
  if (IBPswd <> 'th3cla') and (IBPswd <> 'masterkey') then
    IBPswd := SimpleDecrypt(IBPswd);
  // Se è specificato un percorso specifico per accedere al LEVGEN.GDB sul
  // param.ini lo usa (serve per evitare l'eventualità che due postazioni
  // diverse acceda al DB con due percorsi diversi che causerebbe un errore
  // di file già in uso)
  GenDBFile := P.ReadString('ARCPATH', 'LevGenPath', GenDBFile);
  // CArica il percorso dei modelli del LDE (Levante Document Editor)
  LDE_PageModelsDir := P.ReadString('LDE', 'PageModelsDir', 'LDE_PageModels');
  if Trim(LDE_PageModelsDir) = '' then
    LDE_PageModelsDir := 'LDE_PageModels';
  LDE_PageModelsDir := SlashFinale(CurrDir + 'LDE_PageModels');
  // CArica il percorso del file eseguibile del LDE (Levante Document Editor)
  LDE_ExeFilePath := P.ReadString('LDE', 'ExeFilePath', CurrDir + 'LevanteDocumentEditor.exe');
  if Trim(LDE_ExeFilePath) = '' then
    LDE_ExeFilePath := CurrDir + 'LevanteDocumentEditor.exe';
  // CArica il percorso del file eseguibile del LDE (Levante Document Editor)
  LDE_EmbededParamsEditor_ExeFilePath := P.ReadString('LDE', 'EmbeddedParamsEditor_ExeFilePath', CurrDir + 'LDE_EmbeddedParamsEditor.exe');
  if Trim(LDE_EmbededParamsEditor_ExeFilePath) = '' then
    LDE_EmbededParamsEditor_ExeFilePath := CurrDir + 'LDE_EmbeddedParamsEditor.exe';
  P.Free;
  // ==========================================================================

  // Se il ServerAddress = 'LOCAL' significa che il pc è il server
  IsServer := IsThisPcLevanteServer;
  // Imposta la variabile che contiene il percorso della cartella dei files temporanei
  CartellaTmp := UserAppDataLevanteDir + 'TmpDir';
  CartellaTmp := SlashFinale(CartellaTmp);
  if not DirectoryExists(CartellaTmp) then
    CreateDir(CartellaTmp);
  // Carica nella variabile 'SystemDir' il percorso della WindowsSystemDirectory
  GetSystemDirectory(SysDir, MAX_PATH);
  SystemDir := SysDir;
  SystemDir := SlashFinale(SystemDir);
  // Carica il numero di serie del volume
  GetVolumeInformation(PChar('c:\'), nil, 0, @SerialNum, a, b, nil, 0);
  VolSerNum := IntToStr(SerialNum);
  // Imposta la variabile che contiene il percorso dei files con i settaggi delle griglie
  ImpGridsDir := SlashFinale(UserAppDataLevanteDir + 'ImpGrids');
  if not DirectoryExists(ImpGridsDir) then
    CreateDir(ImpGridsDir);

  // Se necessario visualizza la form del base setup
  if MainForm.ModoSetup then
    VisualizzaBaseSetup;

  // ##########
  // Inizializzazione sistema per la gestione centralizzata dei files
  // di parametri.
  ControllaFilesConfigurazione;
  // if not MainForm.ModoRistrutturazioneTabelle then ControllaFilesConfigurazione;
  // ##########

  // ==========================================================================
  // PARAM.INI - ALL USERS
  // --------------------------------------------------------------------------
  P := TMemIniFile.Create(DM1.Repository_Param_AllUsers.FullLocalFileName);
  // Preleva i parametri per gli aiuti in pillole
  HINT_DELAY := P.ReadInteger('HINTS', 'HintDelay', 5) * 1000;
  HINT_ENABLED := P.ReadBool('HINTS', 'HintEnabled', True);
  // Abilita/Disabilita gli hints altrimenti mi si vedono gli hints veggchi dove sono rimasti
  Application.ShowHint := HINT_ENABLED;
  // Carica il flag abilitare la copia automatica delle note documento nelle relative scadenze
  CopiaNoteDocumentoSulleScadenze := P.ReadBool('SCADENZE', 'CopiaNoteDocumentoSulleScadenze', False);
  // Parametro che contiene il percorso completo del file con la traduzione in italiano
  P.Free;
  // ==========================================================================

  // ==========================================================================
  // LAYOUTS.INI
  // --------------------------------------------------------------------------
  // Apre il file con le impostazioni di visualizzazione
  P := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  // Parametro che determina il numero dei decimali dopo la virgola
  // dei margini percentuali e variazioni percentuali nel giornale di cantiere
  // e dei documenti
  DecimaliMarginiPercentuali := P.ReadInteger('DOCUMENTI_GENERALE', 'DecimaliMarginiPercentuali', 0);
  // Flags per GOOGLE CALENDAR
  GoogleCalendar_CreazioneAutomaticaDaAppuntamentoInvisible := P.ReadBool('GoogleCalendar', 'CreazioneAutomaticaDaAppuntamentoInvisible', True);
  GoogleCalendar_EliminaAdAppuntamentoFatto := P.ReadBool('GoogleCalendar', 'EliminaAdAppuntamentoFatto', True);
  // Flags per GOOGLE TASKS
  GoogleTasks_CreazioneAutomaticaDaChiamata := P.ReadBool('GoogleTasks', 'CreazioneAutomaticaDaChiamata', True);
  GoogleTasks_CreazioneAutomaticaDaChiamataInvisibile := P.ReadBool('GoogleTasks', 'CreazioneAutomaticaDaChiamataInvisibile', True);
  GoogleTasks_EliminaAdAppuntamentoFatto := P.ReadBool('GoogleTasks', 'EliminaAdAppuntamentoFatto', True);
  // Flag che abilita o disabilita la creazione ed esecuzione del ThreadLev
  // Siccome c'erano alcuni errori strani e incomprensibili con questo flag
  // posso disabilitare il Thread e vereificare se il problema viene da li oppure no.
  ThreadLevEnabled := P.ReadBool('ThreadLev', 'Enabled', False);
  // Carica alcuni parametri relativi agli allegati
  // ----------------------------------------------
  // Come deve filtrare quando è in un documento
  AllDocumento_FiltroDoc := P.ReadBool('Allegati', 'AllDocumento_FiltroDoc', True);
  AllDocumento_FiltroPrat := P.ReadBool('Allegati', 'AllDocumento_FiltroPrat', False);
  AllDocumento_FiltroSogg := P.ReadBool('Allegati', 'AllDocumento_FiltroSogg', False);
  AllDocumento_FiltroNulla := P.ReadBool('Allegati', 'AllDocumento_FiltroNulla', False);
  AllDocumento_FiltroArticolo := P.ReadBool('Allegati', 'AllDocumento_FiltroArticolo', False);
  // Come deve filtrare quando è in una pratica
  AllPratica_FiltroDoc := P.ReadBool('Allegati', 'AllPratica_FiltroDoc', False);
  AllPratica_FiltroPrat := P.ReadBool('Allegati', 'AllPratica_FiltroPrat', True);
  AllPratica_FiltroSogg := P.ReadBool('Allegati', 'AllPratica_FiltroSogg', False);
  AllPratica_FiltroNulla := P.ReadBool('Allegati', 'AllPratica_FiltroNulla', False);
  AllPratica_FiltroArticolo := P.ReadBool('Allegati', 'AllPratica_FiltroArticolo', False);
  // Come deve filtrare quando è in una soggetto
  AllSoggetto_FiltroDoc := P.ReadBool('Allegati', 'AllSoggetto_FiltroDoc', False);
  AllSoggetto_FiltroPrat := P.ReadBool('Allegati', 'AllSoggetto_FiltroPrat', False);
  AllSoggetto_FiltroSogg := P.ReadBool('Allegati', 'AllSoggetto_FiltroSogg', True);
  AllSoggetto_FiltroNulla := P.ReadBool('Allegati', 'AllSoggetto_FiltroNulla', False);
  AllSoggetto_FiltroArticolo := P.ReadBool('Allegati', 'AllSoggetto_FiltroArticolo', False);
  // Come deve filtrare quando è in un articolo
  AllArticolo_FiltroDoc := P.ReadBool('Allegati', 'AllArticolo_FiltroDoc', False);
  AllArticolo_FiltroPrat := P.ReadBool('Allegati', 'AllArticolo_FiltroPrat', False);
  AllArticolo_FiltroSogg := P.ReadBool('Allegati', 'AllArticolo_FiltroSogg', False);
  AllArticolo_FiltroNulla := P.ReadBool('Allegati', 'AllArticolo_FiltroNulla', False);
  AllArticolo_FiltroArticolo := P.ReadBool('Allegati', 'AllArticolo_FiltroArticolo', True);
  // Come deve filtrare quando è fuori da tutto
  AllNulla_FiltroDoc := P.ReadBool('Allegati', 'AllNulla_FiltroDoc', False);
  AllNulla_FiltroPrat := P.ReadBool('Allegati', 'AllNulla_FiltroPrat', False);
  AllNulla_FiltroSogg := P.ReadBool('Allegati', 'AllNulla_FiltroSogg', False);
  AllNulla_FiltroNulla := P.ReadBool('Allegati', 'AllNulla_FiltroNulla', True);
  AllNulla_FiltroArticolo := P.ReadBool('Allegati', 'AllNulla_FiltroArticolo', False);
  // Decidono a cosa si deve legare un allegato alla creazione
  AllCreazione_LegaAlDocumentoCorrente := P.ReadBool('Allegati', 'AllCreazione_LegaAlDocumentoCorrente', True);
  AllCreazione_LegaAllaPraticaCorrente := P.ReadBool('Allegati', 'AllCreazione_LegaAllaPraticaCorrente', True);
  AllCreazione_LegaAlSoggettoCorrente := P.ReadBool('Allegati', 'AllCreazione_LegaAlSoggettoCorrente', True);
  AllCreazione_LegaAlArticoloCorrente := P.ReadBool('Allegati', 'AllCreazione_LegaAlArticoloCorrente', True);
  // ----------------------------------------------
  // Alcuni valori di default da carica sui nuovi soggetti
  CodicePagamentoDefault := P.ReadInteger('FormAnagraficaClienti', 'CodicePagamentoDefault', -1);
  BancaAbiDefault := P.ReadString('FormAnagraficaClienti', 'BancaAbiDefault', '');
  BancaCabDefault := P.ReadString('FormAnagraficaClienti', 'BancaCabDefault', '');
  // Flag per abilitazione/disabilitazione della verifica del codice fiscale in base al tipo di persona
  VerificaCodFisc_PersonaFisica := P.ReadBool('FormAnagraficaClienti', 'VerificaCodFisc_PersonaFisica', True);
  VerificaCodFisc_PersonaGiuridica := P.ReadBool('FormAnagraficaClienti', 'VerificaCodFisc_PersonaGiuridica', True);
  VerificaCodFisc_PubblicaAmministrazione := P.ReadBool('FormAnagraficaClienti', 'VerificaCodFisc_PubblicaAmministrazione', True);
  // Flag che forza il programma a non considerare i documenti quando
  // stampa l'inventario ultimo acquisto
  fInventarioUltimoAcquistoIgnoraDocumenti := P.ReadBool('FormAnagraficaArticoli', 'InventarioUltimoAcquistoIgnoraDocumenti', False);
  // relazione intervento oppure no (la Exis non le vuoli gli altri invece si).
  CopiaRelazioneInterventoInBacheca := P.ReadBool('DOCUMENTI_GENERALE', 'CopiaRelazioneInterventoInBacheca', False);
  // Flag che se True fa in modo che sia possibili modificare il registro dei documento solo
  // alla creazione del documento stesso e non lo consente più successivamente.
  ModificaRegistroSoloNuovoDocumento := P.ReadBool('DOCUMENTI_GENERALE', 'ModificaRegistroSoloNuovoDoc', True);
  SalvaMagazzinoDocumentoDalRigo := P.ReadBool('DOCUMENTI_GENERALE', 'SalvaMagazzinoDocumentoDalRigo', False);
  // Flag che abilita/disabilita la speciale esportazione in bacheca delle ricevute fiscali
  // quello cioè delle ricevute fiscali non pagate
  fEsportazioneRicFiscNoPag := P.ReadBool('DOCUMENTI_GENERALE', 'AbilitaEsportazioneRicFiscNoPag', True);
  // Carica i titoli per i campi SubSogg per comporre la descrizione nel riferimento
  // quando si esporta/importa un documento in bacheca
  RefCaptionLabelSubSogg1 := P.ReadString('SUBSOGG', 'RifCaptionLabelSubSogg1', '');
  RefCaptionLabelSubSogg2 := P.ReadString('SUBSOGG', 'RifCaptionLabelSubSogg2', '');
  RefCaptionLabelSubSogg3 := P.ReadString('SUBSOGG', 'RifCaptionLabelSubSogg3', '');
  RefCaptionLabelSubSogg4 := P.ReadString('SUBSOGG', 'RifCaptionLabelSubSogg4', '');
  // Variabili che contengono i titoli delle 3 sezioni in cui è normalmente
  // suddiviso il GC (Materiali / Apparecchi, Manodopera, Altre spese)
  GC_TitoloSezioneMaterialiApparecchi := P.ReadString('GiornaleCantiere', 'TitoloSezioneMaterialiApparecchi', 'Materiali / Apparecchi');
  GC_TitoloSezioneOreDipendenti := P.ReadString('GiornaleCantiere', 'TitoloSezioneOreDipendenti', 'Manodopera');
  GC_TitoloSezioneAltreSpese := P.ReadString('GiornaleCantiere', 'TitoloSezioneAltreSpese', 'Altre spese');
  // Flag che indica se, quando si è nel GC da fuori cantiere, la vista del GC stesso
  // debba essere riassuntiva oppure normale come se si fosse invece dentro al cantiere.
  GC_CantiereNoSel_VisualizzazioneRiassuntiva := P.ReadBool('GiornaleCantiere', 'CantiereNoSel_VisualizzazioneRiassuntiva', True);
  // Impostazioni di default del GC per impostare i costi e i ricarichi
  GC_Default_TipoRicarico := P.ReadInteger('GiornaleCantiere', 'Default_TipoRicarico', 0);
  GC_Default_RicaricoPerc := P.ReadFloat('GiornaleCantiere', 'Default_RicaricoPerc', 0);
  GC_Default_Listino := P.ReadInteger('GiornaleCantiere', 'Default_Listino', 1);
  GC_Default_TipoCosto := P.ReadInteger('GiornaleCantiere', 'Default_TipoCosto', 1);
  GC_Default_TipoRicaricoComeDaCommessa := P.ReadString('GiornaleCantiere', 'Default_TipoRicaricoComeDaCommessa', 'F');
  // Variabili che contengono i titoli delle categorie clienti/articoli
  CategCaption1 := P.ReadString('Categoria1', 'MenuCaption', '0');
  CategCaption2 := P.ReadString('Categoria2', 'MenuCaption', '0');
  CategCaption3 := P.ReadString('Categoria3', 'MenuCaption', '0');
  CategCaption4 := P.ReadString('Categoria4', 'MenuCaption', '0');
  CategCaption5 := P.ReadString('Categoria5', 'MenuCaption', '0');
  CategCaption6 := P.ReadString('Categoria6', 'MenuCaption', '0');
  CategCaption7 := P.ReadString('Categoria7', 'MenuCaption', '0');
  CategCaption8 := P.ReadString('Categoria8', 'MenuCaption', '0');
  // Variabili che contengono i titoli delle categorie cantiere
  CategCantCaption1 := GetCategCantCaption(P, 'CategCant1');
  CategCantCaption2 := GetCategCantCaption(P, 'CategCant2');
  CategCantCaption3 := GetCategCantCaption(P, 'CategCant3');
  CategCantCaption4 := GetCategCantCaption(P, 'CategCant4');
  CategCantCaption5 := GetCategCantCaption(P, 'CategCant5');
  CategCantCaption6 := GetCategCantCaption(P, 'CategCant6');
  // Carica le impostazioni della valuta
  Application.UpdateFormatSettings := False;
  FormatSettings.CurrencyString := P.ReadString('VALUTA', 'SimboloValuta', '');
  FormatSettings.CurrencyFormat := P.ReadInteger('VALUTA', 'FormatoValuta', 2);
  FormatSettings.NegCurrFormat := P.ReadInteger('VALUTA', 'FormatoNegativoValuta', 12);
  FormatSettings.ThousandSeparator := P.ReadString('VALUTA', 'SeparatoreMigliaia', '.')[1];
  FormatSettings.DecimalSeparator := P.ReadString('VALUTA', 'SeparatoreDecimali', ',')[1];
  FormatSettings.CurrencyDecimals := P.ReadInteger('VALUTA', 'DecimaliValuta', 2);
  FormatSettings.TimeSeparator := P.ReadString('VALUTA', 'SeparatoreOreMinuti', '.')[1];
  FormatSettings.DateSeparator := P.ReadString('VALUTA', 'SeparatoreData', '/')[1];
  FormatSettings.ShortDateFormat := P.ReadString('VALUTA', 'FormatoData', 'dd/mm/yyyy');
  // Carica il numero di decimali dei microprezzi.
  DecMicroPrz := P.ReadInteger('VALUTA', 'DecimaliMicroprezzi', 2);
  DecCalcoliIntermedi := 8;
  // Carica il numero di caratteri da usare per l'assegnazione automatica del codice articolo
  // agli articoli che non lo hanno (se abilitato)
  NumCharCodArt := P.ReadInteger('FormAnagraficaArticoli', 'MaxCharAutoCodArt', 8);
  // Carica la variabile che contiene il tipo documento di default per la modalità KIOSK
  KioskTipoDocDefault := P.ReadString('VenditaAlBanco', 'TipoDocDefault', 'Ricev.fisc');
  // Carica le variabili che impostano alcuni comportamenti dei documenti
  // TotaliRealTime      := P.ReadBool('VenditaAlBanco', 'TotaliRealTime', True);
  // cArica il parametri che indica che gli articoli vanno importati direttamente con il prezzo netto
  // oppure con il prezzo di listino + lo sconto.
  PrezziNetti := P.ReadBool('FormAnagraficaArticoli', 'PrezziNetti', True);
  PrezziAcquistoNetti := P.ReadBool('FormAnagraficaArticoli', 'PrezziAcquistoNetti', False);

  // Flag che indica se, per il ricalcolo dei prezzi di listino e di acquisto degli articoli,
  // alla variazione del PrezzoDiListino deve essere ricalcolato il PrezzoDiAcquisto (e/o viceversa)
  // in base agli sconti di acquisto impostati oppure se invece tali importi devono rimanere fissi e
  // ad essere ricalcolati devono essere gli sconti
  Articoli_RicalcoloPrzAcquistoImportiFissi := P.ReadBool('FormAnagraficaArticoli', 'RicalcoloPrzAcquistoImportiFissi', False);
  // Flag che indica se, nell'anagrafica articolo, gli sconti di acquisto e altri campi correlati
  // siano visibili oppure no
  Articoli_ScontiAcquistoVisible := P.ReadBool('FormAnagraficaArticoli', 'ScontiAcquistoVisible', True);
  Articoli_ListiniDiVenditaVisible := P.ReadBool('FormAnagraficaArticoli', 'ListiniDiVenditaVisible', True);
  // Flag che indica se sono attivi i listini fornitori secondari automatici e bloccati
  // al numero dei fornitori con listino (1 prezzo per ogni fornitore in ciascun articolo)
  Articoli_ListiniFornitoriAutomatici := P.ReadBool('FormAnagraficaArticoli', 'ListiniFornitoriAutomatici', False);

  // Carica i parametri della funzione di SINCRONIZZAZIONE tra stazioni non collegato in realtime tra di loro
  AbilitaSincronizzazione := P.ReadBool('SYNCHRO', 'AbilitaSincronizzazione', False);
  BloccaModificaRecordsAltreStazioni := P.ReadBool('SYNCHRO', 'BloccaModificaRecordsAltreStazioni', True);
  AggiungiCodiceChiaveAiCodici := P.ReadBool('SYNCHRO', 'AggiungiCodiceChiaveAiCodici', False);
  // Carica i parametri della sezione [AUTOMAZIONE] del Layouts.ini, per il significato vedi la
  // dichiarazione delle variabili e degli array all'inizio di questa Unit.
  TabAvvio := P.ReadInteger('AUTOMAZIONE', 'TabAvvio', IDX_AUTOQUERY_RUBRICA);
  TabDopoSelezioneSoggetto := P.ReadInteger('AUTOMAZIONE', 'TabDopoSelezioneSoggetto', IDX_AUTOQUERY_DOCUMENTI);
  TabDopoSelezionePratica := P.ReadInteger('AUTOMAZIONE', 'TabDopoSelezionePratica', IDX_AUTOQUERY_DOCUMENTI);
  TabDopoSelezioneImpianto := P.ReadInteger('AUTOMAZIONE', 'TabDopoSelezioneImpianto', IDX_AUTOQUERY_IMPEGNI);
  AutoQuery[IDX_AUTOQUERY_RUBRICA] := P.ReadBool('AUTOMAZIONE', 'TabRubricaAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_PRATICHE] := P.ReadBool('AUTOMAZIONE', 'TabPraticheAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_ASSISTENZE] := P.ReadBool('AUTOMAZIONE', 'TabAssistenzeAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_DOCUMENTI] := P.ReadBool('AUTOMAZIONE', 'TabDocumentiAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_SCADENZE] := P.ReadBool('AUTOMAZIONE', 'TabScadenzeAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_ARTICOLI] := P.ReadBool('AUTOMAZIONE', 'TabArticoliAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_GM] := P.ReadBool('AUTOMAZIONE', 'TabGiornMagAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_CV] := P.ReadBool('AUTOMAZIONE', 'TabCondVendAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_PRIMANOTA] := P.ReadBool('AUTOMAZIONE', 'TabPrimanotaAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_IMPEGNI] := P.ReadBool('AUTOMAZIONE', 'TabIMpegniAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_AGENDA] := P.ReadBool('AUTOMAZIONE', 'TabAgendaAutoQuery', True);
  AutoQuery[IDX_AUTOQUERY_GC] := P.ReadBool('AUTOMAZIONE', 'TabGiornCantAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_PARTITARIO] := P.ReadBool('AUTOMAZIONE', 'TabPartitarioAutoQuery', False);
  AutoQuery[IDX_AUTOQUERY_GOS] := P.ReadBool('AUTOMAZIONE', 'TabGOSAutoQuery', False);
  AutoQueryGlobaleDisabilitaSeSoggettoNonSelezionato := P.ReadBool('AUTOMAZIONE', 'ForceAllAutoQueriesOffWhenSoggNonSelected', True);
  AutoQueryGlobaleDisabilitaSeSoggettoSelezionato := P.ReadBool('AUTOMAZIONE', 'ForceAllAutoQueriesOffWhenSoggSelected', True);

  // Carica la variabile che contiene il tipo documento di default generato dal menu
  // "Elimina e crea documento" dell'evento in agenda selezionato
  // Parametri per la creazione utomatica di un documento ed eliminazione e/o marcatore dell'impegno come fatto
  ImpegnoToDoc_TipoDoc := P.ReadString('AGENDA', 'ImpegnoToDoc_TipoDoc', 'D.D.T.');
  ImpegnoToDoc_EliminaImpegno := P.ReadBool('AGENDA', 'ImpegnoToDoc_EliminaImpegno', False);
  ImpegnoToDoc_MarcaImpegnoComeFatto := P.ReadBool('AGENDA', 'ImpegnoToDoc_MarcaImpegnoComeFatto', True);

  // Flag che indica se caricare gli eventi solo dei giorni strettamente selezionati nel
  // calendarietto oppure anche tutti quelli del periodo esteso che si può vedere nel calendarietto stesso.
  QueryQgendaSoloGiorniSelezionati := P.ReadBool('AGENDA', 'QuerySoloGiorniSelezionati', False);
  // Flag che indica se caricare i records relativi all'agenda dall'apposita vista con i campi
  // aggiuntivi per i simboli (urgente, stampato, prescrizioni...) oppure direttamente
  // sulla tabella impegni (senza simboli ma molto più veloce).
  AgendaNoImages := P.ReadBool('AGENDA', 'NoImages', False);
  // Flag che forza lo sfondo dell-agenda laterale a bianca&grigia (default) altrimenti
  // le colonne saranno colorate come l-agenda normale (vecchia) in base al colore
  // impostato nei /Tecnici/
  AgendaGrayOnlyContentBackgroud := P.ReadBool('AGENDA', 'GrayOnlyContentBackgroud', True);
  // Abilita o meno l'autoselezione di soggetto e pratica/cantiere quando si clicca
  // su un appuntamento
  AgendaAutoSelectSoggPrat := P.ReadBool('AGENDA', 'AutoSelectSoggPrat', False);
  // Descrizioni degli stati di eventi dell'agenda
  AgendaStateDescription1 := P.ReadString('AGENDA', 'StateDescription1', 'Free');
  AgendaStateDescription2 := P.ReadString('AGENDA', 'StateDescription2', 'Tentative');
  AgendaStateDescription3 := P.ReadString('AGENDA', 'StateDescription3', 'Busy');
  AgendaStateDescription4 := P.ReadString('AGENDA', 'StateDescription4', 'Out of office');
  // Carica altuni parametri relativi alla stampa delle etichette
  LunghezzaMaxDescrizioneArticoloEtichette := P.ReadInteger('ETICHETTE', 'LunghezzaMaxDescrizioneArticolo', 35);
  // Carica il flag che indica se tornare a prima che ci fossero le descrizioni lunghe
  // (cioè con le descrizioni aggiuntive  DESCRIZIONE2,3,4,5 come righi separati).
  AbilitaDescrizioni2345 := P.ReadBool('FormAnagraficaArticoli', 'AbilitaDescrizioni2345', False);
  // Carica la lunghezza max della descrizione articolo nell'apposita variabile.
  // NB: Questo è solo un limite facoltativo che l'utente decide per limitare la descrizione che
  // normalmente è molto lunga (1000) come lunghezza max in caratteri
  LunghezzaMaxDescrizioneArticolo := P.ReadInteger('FormAnagraficaArticoli', 'LunghezzaMaxDescrizioneArticolo', 0);
  // Carica il parametro che indica se i loghi sono separati per azienda
  // oppure unici per tutte le aziende
  SeparateLogoMode := P.ReadBool('LOGHI', 'LoghiSeparatiPerAziende', False);
  // Carica il flag che indica se deve richiedere la Qtà quando si esporta un
  // articolo in bacheca o si richiama un articolo per codice
  RichiediQta := P.ReadBool('FormAnagraficaArticoli', 'RichiediQta', True);
  // Carica il flag che indica se deve avvertire chel'articolo
  // stà andando sottoscorta
  AvvertiSottoscorta := P.ReadBool('FormAnagraficaArticoli', 'AvvertiSottoscorta', False);
  // Carica i flag per la gestione del Partitario e del Fido
  ConsideraDdtNelFido := P.ReadBool('PARTITARIO', 'ConsideraDdtNelFido', False);
  DefaultVisualizzaDdt := P.ReadBool('PARTITARIO', 'DefaultVisualizzaDdt', False);
  DefaultVisualizzaRifFisc := P.ReadBool('PARTITARIO', 'DefaultVisualizzaRifFisc', False);
  DefaultVisualizzaInterventi := P.ReadBool('PARTITARIO', 'DefaultVisualizzaInterventi', False);
  DefaultVisualizzaPrimanota := P.ReadBool('PARTITARIO', 'DefaultVisualizzaPrimanota', True);
  DefaultVisualizzaRighiDocComeNote := P.ReadBool('PARTITARIO', 'DefaultVisualizzaRighiDocComeNote', False);
  DefaultVisualizzaSoloPraticheAperte := P.ReadBool('PARTITARIO', 'DefaultVisualizzaSoloPraticheAperte', False);
  DefaultNoBolliFatture := P.ReadBool('PARTITARIO', 'DefaultNoBolliFatture', False);
  DefaultEscludiFattAcqui := P.ReadBool('PARTITARIO', 'DefaultEscludiFattAcqui', False);
  // Carica il flag che indica se, nei documenti, far apparire la formTedoldi per
  // impostare i viaggi per le aziende di trasporto come editor di descrizione articolo
  // del rigo.
  ViaggioEditorEnabled := P.ReadBool('DOCUMENTI_GENERALE', 'ViaggioEditorEnabled', False);
  P.Free;
  // ==========================================================================

  // ==========================================================================
  // MENU.INI
  // --------------------------------------------------------------------------
  // Apre il file con le impostazioni di visualizzazione del menu
  P := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  // Caricamento captions main manù
  with MainForm do
  begin
    MainMenuCaptions[0] := P.ReadString('MainMenuCaptions', 'SBSoggetto', 'Soggetto selezionato');
    MainMenuCaptions[1] := P.ReadString('MainMenuCaptions', 'SBPratica', 'Cantiere selezionato');
    MainMenuCaptions[2] := P.ReadString('MainMenuCaptions', 'SBAssistenza', 'Impianto selezionato');
    MainMenuCaptions[3] := P.ReadString('MainMenuCaptions', 'SBRubrica', 'Rubrica');
    MainMenuCaptions[4] := P.ReadString('MainMenuCaptions', 'SBDocumenti', 'Documenti');
    MainMenuCaptions[5] := P.ReadString('MainMenuCaptions', 'SBGM', 'Giornale di magazzino');
    MainMenuCaptions[6] := P.ReadString('MainMenuCaptions', 'SBCV', 'Condizioni di vendita');
    MainMenuCaptions[7] := P.ReadString('MainMenuCaptions', 'SBArticoli', 'Articoli / Listino');
    MainMenuCaptions[8] := P.ReadString('MainMenuCaptions', 'SBPratiche', 'Cantieri');
    MainMenuCaptions[9] := P.ReadString('MainMenuCaptions', 'SBScadenze', 'Scadenzario');
    MainMenuCaptions[10] := P.ReadString('MainMenuCaptions', 'SBPrimanota', 'Primanota');
    MainMenuCaptions[11] := P.ReadString('MainMenuCaptions', 'SBAssistenze', 'Impianti e contratti');
    MainMenuCaptions[12] := P.ReadString('MainMenuCaptions', 'SBImpegni', 'Chiamate / Interventi');
    MainMenuCaptions[13] := P.ReadString('MainMenuCaptions', 'SBAgenda', 'Agenda');
    MainMenuCaptions[14] := P.ReadString('MainMenuCaptions', 'SBGC', 'Giornale di cantiere');
    MainMenuCaptions[15] := P.ReadString('MainMenuCaptions', 'SBPartitario', 'Partitario');
    MainMenuCaptions[16] := P.ReadString('MainMenuCaptions', 'SBGOS', 'Giornale manodopera/spese');
    MainMenuCaptions[17] := P.ReadString('MainMenuCaptions', 'SBResOrd', 'Residuo ordini');
    MainMenuCaptions[18] := P.ReadString('MainMenuCaptions', 'SBComunicazioni', 'Comunicazioni');
  end;
  // Caricamento variabili relative a captions relative a campi relativi alle pratiche
  // nelle varie forms (anagrafiche, elenchi ecc..)
  GridsColumnPraticaCaption := P.ReadString('TitoliPratiche', 'GridsColumnPraticaCaption', 'Cantiere');
  GridsColumnSottopratica1Caption := P.ReadString('TitoliPratiche', 'GridsColumnSottopratica1Caption', 'Sottocant.1');
  GridsColumnSottopratica2Caption := P.ReadString('TitoliPratiche', 'GridsColumnSottopratica2Caption', 'Sottocant.2');
  GridsColumnSottopratica3Caption := P.ReadString('TitoliPratiche', 'GridsColumnSottopratica3Caption', 'Sottocant.3');
  DocumentiPanelPraticaCaption := P.ReadString('TitoliPratiche', 'DocumentiPanelPraticaCaption', 'CANTIERE');
  GridGCQtaCommessaCaption := P.ReadString('TitoliPratiche', 'GridGCQtaCommessaCaption', 'Comm.');
  GridGCQtaCaricoCaption := P.ReadString('TitoliPratiche', 'GridGCQtaCaricoCaption', 'Carico');
  GridGCQtaScaricoCaption := P.ReadString('TitoliPratiche', 'GridGCQtaScaricoCaption', 'Scarico');
  GridGCQtaGiacenzaCaption := P.ReadString('TitoliPratiche', 'GridGCQtaGiacenzaCaption', 'Giacenza');
  GridGCQtaMontataCaption := P.ReadString('TitoliPratiche', 'GridGCQtaMontataCaption', 'Montato');
  GridGCQTAResiduaCaption := P.ReadString('TitoliPratiche', 'GridGCQtaResiduaCaption', 'Residuo');
  // Dati dai titoli documenti
  DatiDocumento_LabelPratica := P.ReadString('TitoliDocumenti', 'DatiDocumento_LabelPratica', 'Cantiere/Impianto');
  DatiDocumento_LabelAzionePratica := P.ReadString('TitoliDocumenti', 'DatiDocumento_LabelAzionePratica', 'Cantiere');
  DatiDocumento_LabelJollyNum1 := P.ReadString('TitoliDocumenti', 'DatiDocumento_LabelJollyNum1', 'Trattenute');
  // Caricamento variabili rlative a captions relative a campi relativi ai tecnici
  TecniciMenuCaption := P.ReadString('TitoliTecnici', 'TecniciMenuCaption', 'Tecnici');
  GridsColumnTecnicoCaption := P.ReadString('TitoliTecnici', 'GridsColumnTecnicoCaption', 'Tecnico');
  // Caricamento variabili rlative a captions relative a campi relativi agli Agenti
  AgentiMenuCaption := P.ReadString('TitoliAgenti', 'AgentiMenuCaption', 'Agenti');
  Agenti2MenuCaption := P.ReadString('TitoliAgenti', 'Agenti2MenuCaption', '');
  Agenti3MenuCaption := P.ReadString('TitoliAgenti', 'Agenti3MenuCaption', '');
  Agenti4MenuCaption := P.ReadString('TitoliAgenti', 'Agenti4MenuCaption', '');
  GridsColumnAgenteCaption := P.ReadString('TitoliAgenti', 'GridsColumnAgenteCaption', 'Agente');
  GridsColumnAgente2Caption := P.ReadString('TitoliAgenti', 'GridsColumnAgente2Caption', '');
  GridsColumnAgente3Caption := P.ReadString('TitoliAgenti', 'GridsColumnAgente3Caption', '');
  GridsColumnAgente4Caption := P.ReadString('TitoliAgenti', 'GridsColumnAgente4Caption', '');
  Agente2LinkedToAgente1 := P.ReadBool('TitoliAgenti', 'Agente2LinkedToAgente1', False);
  Agente3LinkedToAgente2 := P.ReadBool('TitoliAgenti', 'Agente3LinkedToAgente2', False);
  Agente4LinkedToAgente3 := P.ReadBool('TitoliAgenti', 'Agente4LinkedToAgente3', False);
  AgenteEditable := P.ReadBool('TitoliAgenti', 'AgenteEditable', False);
  Agente2Editable := P.ReadBool('TitoliAgenti', 'Agente2Editable', False);
  Agente3Editable := P.ReadBool('TitoliAgenti', 'Agente3Editable', False);
  Agente4Editable := P.ReadBool('TitoliAgenti', 'Agente4Editable', False);
  // Caricamento flag che abilita/disabilita la voce Impianti/Contratti anche se attivato nella chiavetta
  MainMenuVisualizzaImpianti := P.ReadBool('ImpostazioniAgendaImpegni', 'MainMenuVisualizzaImpianti', True);
  MainMenuVisualizzaImpegni := P.ReadBool('ImpostazioniAgendaImpegni', 'MainMenuVisualizzaChiamateAppuntamenti', True);
  // Caricamento variabili relative all'abilitazione di alcune voci di menù e filtri relativi
  // agli impegni
  VisualizzaNuovoAppuntamentoNormale := P.ReadBool('ImpostazioniAgendaImpegni', 'VisualizzaNuovoAppuntamentoNormale', False);
  VisualizzaNuovoAppuntamentoAssistenza := P.ReadBool('ImpostazioniAgendaImpegni', 'VisualizzaNuovoAppuntamentoAssistenza', True);
  VisualizzaFiltroTipoImpegno := P.ReadBool('ImpostazioniAgendaImpegni', 'VisualizzaFiltroTipoImpegno', True);
  VisualizzaFiltroTipoIntervento := P.ReadBool('ImpostazioniAgendaImpegni', 'VisualizzaFiltroTipoIntervento', True);
  VisualizzaFiltroImpiantoNoImpianto := P.ReadBool('ImpostazioniAgendaImpegni', 'VisualizzaFiltroImpiantoNoImpianto', True);
  // Carica il titolo del campo Luogo dell'elenco degli appuntamenti
  GridsImpegniColumnLuogoAppuntamentoCaption := P.ReadString('TitoliImpegno', 'Appuntamento_LabelLuogo', 'Luogo');
  P.Free;
  // ==========================================================================

  // ==========================================================================
  // PARAM.INI - USER
  // --------------------------------------------------------------------------
  P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
  // Inizializza il sistema di protezione dalla copia
  DM1.InitCopyProtection(False);
  // releva l'azienda e l'operatore corrente
  AziendaCorrente := P.ReadString('ARCPATH', 'AziendaCorrente', 'PROVA');
  IDOperatoreCorrente := P.ReadString('ARCPATH', 'IDOperatore', '');
  // Inizializzazione della data iniziale di default per i filtri per data
  CaricaDatePredefinitePerFiltri(P);
  // Carica il nome dell'eventuale stampante dedicata alla stampa delle etichette
  DefaultLabelPrinterName := P.ReadString('ETICHETTE', 'LabelPrinter', '');
  // Inizializza il registro di default della stazione
  DM1.RegistroDefault := P.ReadString('MULTIREGISTRO', 'RegistroDefault', '-');
  // Inizializza il magazzino di default della stazione
  DM1.MagazzinoDefault := P.ReadString('MULTIMAGAZZINO', 'MagazzinoDefault', '1');
  // Richiama per la prima volta il controllo della chiave
  TimerSmartKeyTimer(Self);
  // Flag che abilita o meno l'apertura/chiusura automatica del pannello degli allegati
  // (Post-It) in base alla presena o meno di records.
  AllegatiApriChiudiAutomatico := P.ReadBool('ALLEGATI', 'ApriChiudiAutomaticamente', True);
  // Flag che indica se, nell'elenco documenti, il bottone di espansione delle note/messaggi è premuto o meno
  // come default
  ElencoDoc_DataRowExpanded := P.ReadBool('ELENCHI_GIORNALI', 'Doc_DataRowExpanded', False);
  // Imposta l'intervallo in secondi per il controllo della chiave di protezione
  // ************************************************************************************
  // TOLTA PERCHE' POTEVA ESSERE UN PUNTO DEBOLE DELLE PROTEZIONI
  // TimerSmartKey.Interval := P.ReadInteger('COMMON', 'IntervalloControllo', 60) * 1000;
  // ************************************************************************************
  TimerSmartKey.Enabled := True;
  // Distruge l'oggetto 'P'
  P.Free;
  // ==========================================================================

  // Imposta la variabile che contiene il percorso dei files con i settaggi delle griglie
  ImportFiltersDir := SlashFinale(CurrDir + 'FiltriImport');
  if not DirectoryExists(ImportFiltersDir) then
    CreateDir(ImportFiltersDir);

  // Imposta la variabile che contiene il percorso dei files con i settaggi delle griglie
  ExportFiltersDir := SlashFinale(CurrDir + 'FiltriExport');
  if not DirectoryExists(ExportFiltersDir) then
    CreateDir(ExportFiltersDir);

//  // Imposta la variabile che contiene il percorso dei files della cover
//  CoverDir := SlashFinale(CommonAppDataLevanteDir + 'cover');
//  if not DirectoryExists(CoverDir) then
//    CreateDir(CoverDir);

  // Imposta la variabile che contiene il percorso dei files del tema di visualizzazione e carica il tema stesso
  TemaDir := SlashFinale(CurrDir + 'tema');
  if not DirectoryExists(TemaDir) then
    CreateDir(TemaDir);

  // Imposta la variabile che contiene il percorso dei files delle tessere del puzzle (disegno)
  PuzzleDir := SlashFinale(CurrDir + 'puzzle');
  if not DirectoryExists(PuzzleDir) then
    CreateDir(PuzzleDir);

  // Imposta la variabile che contiene il percorso dei files dei reports
  ReportDir := SlashFinale(CurrDir + 'Reports');
  if not DirectoryExists(ReportDir) then
    CreateDir(ReportDir);

  // ========================================================================== BULZIP DIR
  // Imposta la variabile che contiene il percorso dei files contenenti
  // i parametri per il Bullzip PDF Printer
  BullzipDir := SlashFinale(GetAppdataFolder) + 'Bullzip';
  if not DirectoryExists(BullzipDir) then
    CreateDir(BullzipDir);
  BullzipDir := BullzipDir + '\PDF Printer';
  if not DirectoryExists(BullzipDir) then
    CreateDir(BullzipDir);
  BullzipDir := SlashFinale(BullzipDir);
  // ========================================================================== BULZIP DIR
  // Imposta la variabile che contiene il percorso dei files contenenti
  // i parametri per il Bullzip PDF Printer
  BullzipDir2 := SlashFinale(GetLocalAppData) + 'PDF Writer';
  if not DirectoryExists(BullzipDir2) then
    CreateDir(BullzipDir2);
  BullzipDir2 := BullzipDir2 + '\Bullzip PDF Printer';
  if not DirectoryExists(BullzipDir2) then
    CreateDir(BullzipDir2);
  BullzipDir2 := SlashFinale(BullzipDir2);
  // ========================================================================== BULZIP DIR

  // Imposta la variabile che contiene il percorso dei loghi intestazione
  // LoghiDir := UserAppDataLevanteDir;

  // Imposta la variabile che contiene il percorso dei files di testo degli Hints
  HintsDir := SlashFinale(CurrDir + 'hints');
  if not DirectoryExists(HintsDir) then
    CreateDir(HintsDir);

  // ####################### DA ELIMINARE
  B1 := TBitmap.Create;
  B2 := TBitmap.Create;
  B3 := TBitmap.Create;
  B4 := TBitmap.Create;
  B5 := TBitmap.Create;
  B6 := TBitmap.Create;
  B7 := TBitmap.Create;
  B8 := TBitmap.Create;
  B9 := TBitmap.Create;
  B10 := TBitmap.Create;
  B11 := TBitmap.Create;
  // ####################### DA ELIMINARE

  // Se è abilitato il modulo delle condizioni di vendita, verifica che il flag PrezziNetti sia impostato a True in quanto
  // comunque se fosse False il programma si comporterebbe come se non lo fosse per un coflitto fra i prezzi non netti
  // e la funzione 'AggiornaCondVendArticolo' quindi se così fosse forzerebbe il flag a True avvertendo l'utente.
  // if (DM1.ModCtrl(MOD_CONDIZIONI_VENDITA) > 0) and not PrezziNetti then begin
  // Messaggi('Informazione', 'Il modulo ''Condizioni di Vendita'' è attivato ma il flag ''Prezzi Netti'' non lo è.'#13#13#13'Se le Condizioni di Vendita sono attive è INDISPENSABILE che anche i Prezzi Netti lo siano, quindi il programma considererà automaticamente abilitati anche i Prezzi Netti', 'NB: Si consiglia di chiamare il CENTRO SERVIZI per eliminare il problema.', [mbOK], 0, nil);
  // PrezziNetti := True;
  // end;

  // Imposta in una variabile globale il valore da adottare poi nelle colonne delle griglie nella proprietà DIsplayFormat
  // per la visualizzazione dei prezzi.
  // E anche per i margini percentuale
  BuildCurrencyDisplayFormat;
  BuildMarginePercDisplayFormat;
  // procedure che impsta alcuni DisplayFOrmats e altre proprietà similari
  // dell'EditRepository
  InitializeEditRepositoryProperties;
end;

// Costruisce i DisplayFormat per il margine in percentuale
procedure TDM1.BuildMarginePercDisplayFormat;
var
  i: Integer;
begin
  // Imposta in una variabile globale il valore da adottare poi nelle colonne delle griglie nella proprietà DIsplayFormat
  // per la visualizzazione dei prezzi.
  MarginDisplayFormat := '0.';
  for i := 1 to DM1.DecimaliMarginiPercentuali do
    MarginDisplayFormat := MarginDisplayFormat + '#';
  MarginDisplayFormat := MarginDisplayFormat + '%;-0.';
  for i := 1 to DM1.DecimaliMarginiPercentuali do
    MarginDisplayFormat := MarginDisplayFormat + '#';
  MarginDisplayFormat := MarginDisplayFormat + '%';
end;

// Costruisce i DisplayFormat per gli importi (prezzi)
procedure TDM1.BuildCurrencyDisplayFormat;
var
  i: Integer;
begin
  // Imposta in una variabile globale il valore da adottare poi nelle colonne delle griglie nella proprietà DIsplayFormat
  // per la visualizzazione dei prezzi.
  DisplayFormat := ',0.';
  for i := 1 to DM1.DecMicroPrz do
    DisplayFormat := DisplayFormat + '0';
  DisplayFormat := DisplayFormat + ';-,0.';
  for i := 1 to DM1.DecMicroPrz do
    DisplayFormat := DisplayFormat + '0';
  // Imposta in una variabile globale il valore da adottare poi nella proprietà "DisplayFormat" dei
  // Campi contenenti importi al fuori del corpo documento e che devono avere i decimali dei MicroPrezzi.
  DisplayFormatMicroPrz := FormatSettings.CurrencyString + ' #.';
  for i := 1 to DM1.DecMicroPrz do
    DisplayFormatMicroPrz := DisplayFormatMicroPrz + '0';
end;

// procedure che impsta alcuni DisplayFOrmats e altre proprietà similari
// dell'EditRepository
procedure TDM1.InitializeEditRepositoryProperties;
begin
  EdPropMarginePerc.Properties.DisplayFormat := DM1.MarginDisplayFormat;
  EdPropMarginePerc.Properties.DecimalPlaces := DM1.DecimaliMarginiPercentuali;

  EdPropImportoMicroPrz.Properties.DisplayFormat := DM1.DisplayFormat;
  EdPropImportoMicroPrz.Properties.DecimalPlaces := DM1.DecMicroPrz;
end;

// Funzione che ritorna il titolo del campo1 depurato dalle eventuali
// intestazioni.
function TDM1.GetCategCantCaption(P: TMemIniFile; Sez: String): String;
var
  TmpStr: String;
  Position: Smallint;
begin
  // Inizializzazione
  Position := 0;
  // TmpStr COntiene il titolo interno comprensivo degli veentuali titoli principali
  // secondo il protocollo delle categorie jolly
  TmpStr := P.ReadString(Sez, 'Campo1', '0');
  // Cicla finchè ci sono caratteri '_' nel titolo
  repeat
    // Position contiene la posizione del primo carattere '_' oppure 0 se non ce ne sono
    Position := Pos('_', TmpStr);
    // Se è stato trovato il carattere '_' elimina il carattere stesso e tutto quello che lo precede
    if Position <> 0 then
      TmpStr := RightStr(TmpStr, Position);
    // Se non ce ne sono più di caratteri '_' esce
  until (Position = 0);
  // Ritorna tutti i caratteri a destra dell'ultimo carattere '_'
  Result := TmpStr;
end;

// =============================================================================
// INIZIO - GESTIONE STAMPANTI
// -----------------------------------------------------------------------------
function TDM1.GetPdfPrinterIndex: Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Printer.Printers.Count - 1 do
  begin
    if Printer.Printers.Strings[i] = 'Bullzip PDF Printer' then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TDM1.GetDefaultPrinterName: string;
begin
  if (Printer.PrinterIndex >= 0) then
  begin
    Result := Printer.Printers[Printer.PrinterIndex];
  end
  else
  begin
    Result := '';
  end;
end;

procedure TDM1.SetDefaultPrinter(PrinterName: String);
var
  j: Integer;
  Device: PChar;
  Driver: PChar;
  Port: PChar;
  HdeviceMode: THandle;
  aPrinter: TPrinter;
begin
  Printer.PrinterIndex := -1;
  getmem(Device, 255);
  getmem(Driver, 255);
  getmem(Port, 255);
  aPrinter := TPrinter.Create;
  for j := 0 to Printer.Printers.Count - 1 do
  begin
    if Printer.Printers[j] = PrinterName then
    begin
      aPrinter.PrinterIndex := j;
      aPrinter.getprinter(Device, Driver, Port, HdeviceMode);
      StrCat(Device, ',');
      StrCat(Device, Driver);
      StrCat(Device, Port);
      WriteProfileString('windows', 'device', Device);
      StrCopy(Device, 'windows');
      // Informa tutte le altre eventuali applicazioni che  la stampante
      // predefinita è cambiata.
      // NB: Siccome la Exis aveva dei problemi e si bloccava Levante sul
      // PC della segreteria provo a commentare la seguente linea
      // per vedere se risolvo
      // SendMessage(HWND_BROADCAST, WM_WININICHANGE,0, Longint(@Device)) ;
    end;
  end;
  Freemem(Device, 255);
  Freemem(Driver, 255);
  Freemem(Port, 255);
  aPrinter.Free;
end;
procedure TDM1.SetModoRistrutturazioneArchivi(const Value: boolean);
begin
  // NB: Questa proprietà una volta messa a True non può più essere riportata a false
  // NB: Solo il server puà entrare in modalità di ristrutturazione
  FModoRistrutturazioneArchivi := (FModoRistrutturazioneArchivi or Value) and IsServer;
//  FModoRistrutturazioneArchivi := True; // Per test sulla ristrutturazione
end;

// -----------------------------------------------------------------------------
// FINE - GESTIONE STAMPANTI
// =============================================================================

// Controlla se è ora di fare il backup
procedure TDM1.BackupCheck;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    // IMposta la query che preleva i dati del sistema di backup
    Qry.SQL.Add('SELECT BACKUPENABLED, BACKUPULTIMO, BACKUPPERIODICITA FROM PARAMETRI WHERE RECORDID = 1');
    Qry.Open;
    if Qry.Eof then
      raise Exception.Create('Record dei parametri non trovato.');
    // Prosegue con il controllo, se il backup è scaduto...
    if (Qry.FieldByName('BACKUPENABLED').AsString <> 'F') and
      (Date >= (Qry.FieldByName('BACKUPULTIMO').AsDateTime + Qry.FieldByName('BACKUPPERIODICITA').AsInteger)) and
      (Qry.FieldByName('BACKUPPERIODICITA').AsInteger > 0) then
    begin
      // Avverte e propone il backup
      Application.CreateForm(TBackupForm, BackupForm);
      BackupForm.Giorni := Round(Date - Qry.FieldByName('BACKUPULTIMO').AsDateTime);
      BackupForm.ShowModal;
    end;
  finally
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TDM1.AzzeraCartellaTemp;
var
  SearchRec: TSearchRec;
begin
  // Prima di tutto controlla se la cartella dei files temporanei del BDE esiste
  if not DirectoryExists(CartellaTmp) then
  begin
    // Se non esiste la crea
    CreateDir(CartellaTmp);
  end;
  // Se la cartella esiste la imposta come PrivateDirectory del BDE
  // NB: Prima cancella tutti i files che essa contiene
  if DirectoryExists(CartellaTmp) then
  begin
    // Elimina tutti gli eventuali files presenti nella cartella
    if FindFirst(CartellaTmp + '*.*', faAnyFile, SearchRec) = 0 then
    begin
      DeleteFile(CartellaTmp + SearchRec.Name);
      while (FindNext(SearchRec) = 0) do
      begin
        DeleteFile(CartellaTmp + SearchRec.Name);
      end;
    end;
    FindClose(SearchRec);
//    Session.PrivateDir := CartellaTmp; // Commentata perchè tanto sembrava relativa al BDE
  end;
end;

function TDM1.UIDCheck(NomeUtente, Passw: String; const AVerificaPassword: Boolean): Boolean;
var
  Qry: TIB_Cursor;
  Contatore: Integer;
begin
  // Inizializza il risultato
  Result := False;
  // Crea la query per vedere se l'utente esiste e se la password è corretta
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := GenDBFile;
  Qry.IB_Connection := DBGenerale;
  Qry.SQL.Add('SELECT MOD_Clienti, MOD_Cefalometrie, MOD_Articoli, MOD_Pratiche, MOD_Preventivi, MOD_Ordini, MOD_SAL, MOD_DDT,');
  Qry.SQL.Add(' MOD_Fatture, MOD_Note_Accredito, MOD_Bolle_Entrata, MOD_Scadenzario, MOD_Testi, MOD_Fax, MOD_Contatti, MOD_Ext_File,');
  Qry.SQL.Add(' MOD_Conformita, MOD_Fatt_Riepilogativa, MOD_Multiaziendale, MOD_Importazione_Archivi, MOD_Fatture_Acquisto,');
  Qry.SQL.Add(' MOD_Ricevute_Fiscali, MOD_Scadenzario_Passivo, MOD_Ordini_Fornitori, MOD_Fatture_RF, MOD_Disco_Rifatturazione,');
  Qry.SQL.Add(' MOD_Buono_Consegna, MOD_Segreteria, MOD_Primanota, MOD_Password, MOD_Giornale_Magazzino, MOD_Condizioni_Vendita,');
  Qry.SQL.Add(' MOD_Agenda, MOD_Giornale_Cantiere, AbilitaMenuImpostazioni, AbilitaMenuUtilita, SoloArticoli, SoloRisorseAgenda');
  Qry.SQL.Add('FROM SECURITY');
  Qry.SQL.Add('WHERE NomeUtente = ''' + NomeUtente + '''');
  if AVerificaPassword then
    Qry.SQL.Add('  AND Pswd = ''' + Passw + '''');
  Qry.Open;
  // Se il nome utente e password sono validi...
  if not(Qry.Eof and Qry.BOF) then
  begin
    // Imposta la variabile che contiene il nome dell'operatore corrente
    IDOperatoreCorrente := NomeUtente;
    // Carica i permessi dell'utente nella variabile globale 'Permessi'
    Permessi := '';
    // Cicla per tutti i campi della query
    for Contatore := 0 to Qry.Fields.ColumnCount - 1 do
    begin
      // Carica nella stringa Permessi solo i campi il nui nome inizia con 'MOD_'
      if LeftStr(Qry.Fields[Contatore].FieldName, 4) = 'MOD_' then
      begin
        if (not Qry.Fields[Contatore].IsNull) and (Trim(Qry.Fields[Contatore].Value) <> '') then
          Permessi := Permessi + Qry.Fields[Contatore].Value
        else
          Permessi := Permessi + '0';
      end;
    end;
    // Carica altri permessi non presenti nella chiave di protezione
    AbilitaMenuImpostazioni := (Qry.FieldByName('AbilitaMenuImpostazioni').IsNull) or (Qry.FieldByName('AbilitaMenuImpostazioni').AsInteger > 1);
    AbilitaMenuUtilita := (Qry.FieldByName('AbilitaMenuUtilita').IsNull) or (Qry.FieldByName('AbilitaMenuUtilita').AsInteger > 1);
    LimitazioniArticoliPerUtente := Trim(Qry.FieldByName('SOLOARTICOLI').AsString);
    LimitazioniRisorseAgendaPerUtente := Trim(Qry.FieldByName('SOLORISORSEAGENDA').AsString);
    // Il risultato è True;
    Result := True;
    // Se invece l'utente non viene riconosciuto e se il modulo password è attivo...
  end
  else if StrToInt(SKeyData[MOD_PASSWORD]) > 0 then
  begin
    IDOperatoreCorrente := '';
    // Chiede prima conferma
    MessageBeep(0);
    MessageDlg('U T E N T E   N O N   R I C O N O S C I U T O   !!!', mtWarning, [mbOk], 0);
  end;
  // Distrugge la query
  Qry.Free;
end;

function TDM1.AddJollyChar(StrInput: String): String;
begin
  // Controlla se ci sono già dei carattri jolly all'inizio o alla fine e se ce ne sono
  // non aggiunge nulla, in modo che volendo si possa fare quello che si vuole, altrimenti
  // aggiunge il carattere jolly all'inizio e alla fine.
  Result := StrInput;
  if (StrInput[1] <> '%') and (StrInput[Length(StrInput)] <> '%') then
    Result := '%' + StrInput + '%';
end;

procedure TDM1.AggiungiSoggettoAllaPratica(CodicePratica: Longint; DataAperturaPratica: TDate; CodiceSoggetto: Longint);
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Crea la query che aggiunge il soggetto alla pratica
    Qry.SQL.Add('UPDATE Pratiche');
    Qry.SQL.Add('SET AltriSoggetti = AltriSoggetti || ''<' + IntToStr(CodiceSoggetto) + '>'',');
    Qry.SQL.Add('    SINCHRO = ''' + RECORD_MODIFIED + '''');
    Qry.SQL.Add('WHERE Codice = ' + IntToStr(CodicePratica));
    Qry.SQL.Add('  AND DataApertura = ''' + FormatDateTime('mm/dd/yyyy', DataAperturaPratica) + '''');
    Qry.SQL.Add('  AND NOT AltriSoggetti LIKE ''%<' + IntToStr(CodiceSoggetto) + '>%''');
    Qry.ExecSQL;
  finally
    // Distrugge la query
    Qry.Free;
  end;
end;

function TDM1.Arrotonda(Numero: Double; Decimali: Byte): Double;
begin
  // NB: Siccome il vecchio metodo mi dava un problema con alcuni numeri
  // usando il SimpleRoundTo (734,50 con iva al 21% scazzava) ho trovato
  // alcune discussioni su internet dove effettivamente si parlava di alcuni problemi
  // del SimpleRoundTo con alcuni particolari numeri e si consigliava di usare questa
  // funzione DecimalRound facente parte di una libreria DecimalRounding (JH1) che
  // è nel file "DecimalRounding_JH1.pas"
  Result := DecimalRound(Numero, Decimali, MaxRelErrDbl, drHalfUp);
  {
    Negativo := (Numero < 0);
    if Negativo then Numero := Abs(Numero);
    Result := SimpleRoundTo(Numero, (Decimali*(-1)));
    if Negativo then Result := Result * (-1);
  }
end;
{
  function  TDM1.Arrotonda(Numero:Double; Decimali:Byte):Double;
  var
  Moltiplicatore, ParteIntera:Integer;
  NumeroMOltiplicato:Double;
  begin
  // Calcola il moltiplicatore
  Moltiplicatore := StrToInt('1' + StringOfChar('0', Decimali));
  // Pone la parte intera del numero e la parte decimale nella rispettiva variabile
  NumeroMoltiplicato := Numero * Moltiplicatore;
  ParteIntera   := Trunc(NumeroMoltiplicato);
  // Se la parte decimale >= 0.5 arrotonda per eccesso, altrimenti per difetto (lo lascia così)
  // ATTENZIONE: Devo controllare se > 0.499999999999 (11 volte 9) perchè se facevo >= 5 non andava bene
  //              a causa dell'errore di precisione nella rappresentazione dei numero in virgola mobile
  //              NON PROVARE A RIMETTERE 0.5 (Per testare provare in un documento con PrzUnit 2,51 e Qtà 12,50
  //              deve risultare un importo 31,38.
  // ATTENZIONE: Ho modificato inserendo questa condizione che in base al segno del numero da arrotondare
  //              si comporta in due modi diversi (dopo che un utente ha segnalato che se in una fattura
  //              mettiamo PrzUnitario = -33156,63 (negativo) e Qtà = 1 l'importoRigo veniva = a 33156,62
  //              con questa modifica ora è tutto corretto
  if Abs(NumeroMoltiplicato - ParteIntera) > 0.499999999999 then begin
  if Numero > 0 then Inc(ParteIntera) else Dec(ParteIntera);
  end;
  // Ridivide per il moltiplicatore
  Result := ParteIntera / Moltiplicatore;
  end;
}

function TDM1.ClienteEsistente(CodToSearch: Longint; IvaToSearch, CodFiscToSearch: String): Boolean;
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query, lo imposta e lo esegue per vedere se il codice articolo è già esistente
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*)');
    Qry.SQL.Add('FROM Clienti');
    Qry.SQL.Add('WHERE Codice = ' + IntToStr(CodToSearch));
    if IvaToSearch <> '' then
      Qry.SQL.Add('   OR PartitaIVA = ''' + IvaToSearch + '''');
    if CodFiscToSearch <> '' then
      Qry.SQL.Add('   OR CODICEFISCALE = ''' + CodFiscToSearch + '''');
    Qry.Open;
    // Se la query trova almeno 2 record con lo stesso valore significa che il codice era già usato
    // (perchè il primo è il record attuale stesso)
    Result := (Qry.Fields[0].Value > 1);
  finally
    // Distrugge la query
    Qry.Free;
  end;
end;

function TDM1.ArticoloEsistente(CodToSearch: String): Boolean;
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query, lo imposta e lo esegue per vedere se il codice articolo è già esistente
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;
    Qry.SQL.Add('SELECT FIRST 1 CODICEARTICOLO');
    Qry.SQL.Add('FROM Articoli');
    Qry.SQL.Add('WHERE CodiceArticolo = ' + QuotedStr(CodToSearch));
    Qry.Open;
    // Se la query trova almeno 2 record con lo stesso valore significa che il codice era già usato
    // (perchè il primo è il record attuale stesso)
    Result := not Qry.Eof;
  finally
    // Distrugge la query
    Qry.Free;
  end;
end;

function TDM1.BarCodeEsistente(CodToSearch: String): Boolean;
var
  Qry: TIB_Cursor;
begin
  Result := True;
  // Crea l'oggetto query, lo imposta e lo esegue per vedere se il codice articolo è già esistente
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*)');
    Qry.SQL.Add('FROM Articoli');
    Qry.SQL.Add('WHERE BarCode = ''' + CodToSearch + '''');
    Qry.Open;
    // Se la query trova almeno 2 record con lo stesso valore significa che il codice era già usato
    // (perchè il primo è il record attuale stesso)
    Result := (Qry.Fields[0].Value > 1);
  finally
    // Distrugge la query
    Qry.Free;
  end;
end;

procedure TDM1.VisualizzaCliente(CodiceCliente: Longint; FromMainMenu: Boolean = False);
begin
  if (DM1.ModCtrl(MOD_CLIENTI) > 0) and (CodiceCliente <> 0) then
  begin
    // Se stiamo aprendo l'anagrafica da dentro un documento
    // e non dal MainMenu imposta a nil la proprietà
    // che mantiene memorizzata l'ultima voce del MainMenu stesso
    // che era selezionata prima di entrare nell'anagrafica.
    if not FromMainMenu then
      MainForm.PrecSelectedMainMenuItem := nil;
    // Crea, imposta e visualizza la form anagrafica
    Application.CreateForm(TAnagCliForm, AnagCliForm);
    MainForm.SetParentComponent(AnagCliForm);
    AnagCliForm.CodiceCliente := CodiceCliente;
    AnagCliForm.Tag := 1;
    AnagCliForm.Show;
  end;
end;

procedure TDM1.VisualizzaPratica(Codice: Longint; Data: TDate; FromDocument: Boolean; FromMainMenu: Boolean = False);
begin
  if DM1.ModCtrl(MOD_PRATICHE) > 0 then
  begin
    // Se stiamo aprendo l'anagrafica da dentro un documento
    // e non dal MainMenu imposta a nil la proprietà
    // che mantiene memorizzata l'ultima voce del MainMenu stesso
    // che era selezionata prima di entrare nell'anagrafica.
    if not FromMainMenu then
      MainForm.PrecSelectedMainMenuItem := nil;
    // Crea, imposta e visualizza la form anagrafica
    Application.CreateForm(TPraticaForm, PraticaForm);
    PraticaForm.Mode := MODE_PRATICHE;
    PraticaForm.FromDocument := FromDocument;
    MainForm.SetParentComponent(PraticaForm);
    PraticaForm.CodicePratica := Codice;
    PraticaForm.DataApertura := Data;
    PraticaForm.Tag := 1;
    PraticaForm.Show;
  end;
end;

procedure TDM1.VisualizzaAssistenza(Codice: Longint; Data: TDate; FromDocument: Boolean; FromMainMenu: Boolean = False);
begin
  if DM1.ModCtrl(MOD_CONTATTI) > 0 then
  begin
    // Se stiamo aprendo l'anagrafica da dentro un documento
    // e non dal MainMenu imposta a nil la proprietà
    // che mantiene memorizzata l'ultima voce del MainMenu stesso
    // che era selezionata prima di entrare nell'anagrafica.
    if not FromMainMenu then
      MainForm.PrecSelectedMainMenuItem := nil;
    // Crea, imposta e visualizza la form anagrafica
    Application.CreateForm(TPraticaForm, PraticaForm);
    PraticaForm.Mode := MODE_ASSISTENZE;
    PraticaForm.FromDocument := FromDocument;
    MainForm.SetParentComponent(PraticaForm);
    PraticaForm.CodicePratica := Codice;
    PraticaForm.DataApertura := Data;
    PraticaForm.Tag := 1;
    PraticaForm.Show;
  end;
end;

// VIualizza un cantiere o un impianto a seconda del caso
procedure TDM1.VisualizzaCantiereImpianto(Caller_IdPratica, Caller_CodicePratica: TIntegerField; Caller_DataPratica: TDateTimeField; FromDocument: Boolean);
var
  Qry: TIB_Cursor;
  Tipo: String;
begin
  // Verifica dei parametri
  if ((not Assigned(Caller_IdPratica)) or (Caller_IdPratica.AsInteger = 0)) and ((not Assigned(Caller_CodicePratica)) or (Caller_CodicePratica.AsInteger = 0))
    and ((not Assigned(Caller_DataPratica)) or (Caller_DataPratica.AsFloat = 0)) then
    Exit;
  // Crea la query che rileverà se si tratta di un cantiere oppure di un impianto
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;
    Qry.SQL.Add('SELECT TIPO FROM PRATICHE');
    Qry.SQL.Add('WHERE CODICE = ' + Caller_CodicePratica.AsString);
    Qry.SQL.Add('  AND DATAAPERTURA = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Caller_DataPratica.AsDateTime)));
    Qry.Open;
    // Se non trova nulla avvisa l'utente ed esce
    if Qry.Eof then
    begin
      DM1.Messaggi('Levante', 'Pratica/cantiere/impianto non trovato!', '', [mbOk], 0, nil);
      Exit;
    end;
    // Carica il tipo di pratica nell'apposita variabile
    // e poi chiude la query
    Tipo := Qry.Fields[0].AsString;
    Qry.Close;
    // In base al tipo di pratica...s
    if Tipo = 'P' then
    begin
      // RIchiama l'anagrafica come Pratica/Cantiere
      VisualizzaPratica(Caller_CodicePratica.AsInteger, Caller_DataPratica.AsDateTime, FromDocument);
      // IMposta le proprietà dell'anagrafica che puntano ai campi del documenti relativi alla pratica stessa
      PraticaForm.Caller_IdPratica := Caller_IdPratica;
      PraticaForm.Caller_CodicePratica := Caller_CodicePratica;
      PraticaForm.Caller_DataPratica := Caller_DataPratica;
    end
    else if Tipo = 'A' then
    begin
      // RIchiama l'anagrafica come Impianto
      VisualizzaAssistenza(Caller_CodicePratica.AsInteger, Caller_DataPratica.AsDateTime, FromDocument);
      // IMposta le proprietà dell'anagrafica che puntano ai campi del documenti relativi alla pratica stessa
      PraticaForm.Caller_IdPratica := Caller_IdPratica;
      PraticaForm.Caller_CodicePratica := Caller_CodicePratica;
      PraticaForm.Caller_DataPratica := Caller_DataPratica;
    end
    else
    begin
      DM1.Messaggi('Levante', 'Tipo di pratica non corretto!', '', [mbOk], 0, nil);
    end;
  finally
    // Distrugge la query
    Qry.Free;
  end;
end;

function TDM1.CopieDocFisc(TipoDoc: String): Longint;
var
  Copie: Longint;
begin
  // Inizializza il valore di NextNumDoc
  Copie := 1;

  IF TipoDoc = 'Preventivo' then
  begin
    Copie := DM1.TableProgressiviCopiePreventivi.Value;
  end
  else if TipoDoc = 'Ordine' then
  begin
    Copie := DM1.TableProgressiviCopieOrdini.Value;
  end
  else if TipoDoc = 'S.A.L.' then
  begin
    Copie := DM1.TableProgressiviCopieSAL.Value;
  end
  else if TipoDoc = 'D.D.T.' then
  begin
    Copie := DM1.TableProgressiviCopieDDT.Value;
  end
  else if TipoDoc = 'Fattura' then
  begin
    Copie := DM1.TableProgressiviCopieFatture.Value;
  end
  else if TipoDoc = 'Nota_accre' then
  begin
    Copie := DM1.TableProgressiviCopieNoteAccredito.Value;
  end
  else if TipoDoc = 'Ord.fornit' then
  begin
    Copie := DM1.TableProgressiviCopieOrdForn.Value;
  end
  else if TipoDoc = 'Bolla_entr' then
  begin
    Copie := DM1.TableProgressiviCopieBolleEntrata.Value;
  end
  else if TipoDoc = 'Fatt.acqui' then
  begin
    Copie := DM1.TableProgressiviCopieFattAcquisto.Value;
  end
  else if TipoDoc = 'Ricev.fisc' then
  begin
    Copie := DM1.TableProgressiviCopieRicFisc.Value;
  end
  else if TipoDoc = 'Fatt.R.F.' then
  begin
    Copie := DM1.TableProgressiviCopieRicFisc.Value;
  end
  else if TipoDoc = 'Buono_cons' then
  begin
    Copie := DM1.TableProgressiviCopieBuonoConsegna.Value;
  end
  else if TipoDoc = 'Commessa' then
  begin
    Copie := DM1.TableProgressiviCOPIECOMMESSA.Value;
  end
  else if TipoDoc = 'Carico_cantiere' then
  begin
    Copie := DM1.TableProgressiviCOPIECARICOCANTIERE.Value;
  end
  else if TipoDoc = 'Scarico_cantiere' then
  begin
    Copie := DM1.TableProgressiviCOPIESCARICOCANTIERE.Value;
  end
  else if TipoDoc = 'Estratto_conto' then
  begin
    Copie := DM1.TableProgressiviCOPIEESTRATTOCONTO.Value;
  end
  else if TipoDoc = 'Intervento' then
  begin
    Copie := 0;
  end
  else if TipoDoc = 'N.C.fornit' then
  begin
    Copie := 0;
  end;

  Result := Copie;
end;

procedure TDM1.ColoreModulo(Report: TQuickRep; Colore1, Colore2: TColor; SpessoreLinee, ForzaAltezzaShape, ForzaDiminuzioneLarghezzaShape: Shortint);
var
  Contatore, Contatore2: Integer;
  Tipo, Colore: String;
  TempBand: TQRBand;
  TempChild: TQRChildBand;
  TempSubDetail: TQRSubDetail;
begin
  // Forza lo spessore delle linee perchè altrimenti avevo alcuni problemi con alcune linee
  // che in stampa diretta (no preview) erano troppo spesse, in questo modo perdo l'uso del
  // parametro però risolve diversi problemi.
  // Per mantenere l'uso del parametro ho deciso di sottrarre 3 al parametro, che normalmente
  // ha valore = 3 in modo da ottenere cmq. zero normalmente ma se serve posso aumentare dal
  // layouts.ini come prima.
  SpessoreLinee := SpessoreLinee - 3;
  if SpessoreLinee < 0 then
    SpessoreLinee := 0;
  // Cicla per tutti i componenti del report (in questo modo cicla per tutte le bande)
  for Contatore := 0 to Report.ControlCount - 1 do
  begin
    // Se è una banda di tipo TQRBand...
    if Report.Controls[Contatore] is TQRBand then
    begin
      TempBand := (Report.Controls[Contatore] as TQRBand);
      // Cicla per tutti i componenti della banda attuale
      for Contatore2 := 0 to TempBand.ControlCount - 1 do
      begin
        // In base al valore memorizzato nella proprietà 'Tag' colora il componente
        // nella maniera opportuna. La prima cifra a sinistra indica di che tipo di
        // componente si tratta (1=QRLabel, 2=QRDBText, 3=QRShape solo contorno,
        // 4=QRShape anche interno/brush, 5=QRDBText del castelletto IVA);
        // la seconda cifra indica se usare il Colore1 oppure il colore2.
        // NB: Il tipo 5 non viene colorato ma semplicemente disabilitato
        // se il flag che specifica se stampare il castelletto è False
        // il secondo numero della proprietà TAG = 0
        Tipo := IntToStr(TempBand.Controls[Contatore2].Tag);
        Colore := Tipo[2];
        Tipo := Tipo[1];
        case StrToInt(Tipo) of
          1:
            begin
              if Colore = '1' then
                (TempBand.Controls[Contatore2] as TQRLabel).Font.Color := Colore1
              else
                (TempBand.Controls[Contatore2] as TQRLabel).Font.Color := Colore2;
            end;
          2:
            begin
              if Colore = '1' then
                (TempBand.Controls[Contatore2] as TQRDBText).Font.Color := Colore1
              else
                (TempBand.Controls[Contatore2] as TQRDBText).Font.Color := Colore2;
            end;
          3:
            begin
              (TempBand.Controls[Contatore2] as TQRShape).Pen.Width := SpessoreLinee;
              if Colore = '1' then
                (TempBand.Controls[Contatore2] as TQRShape).Pen.Color := Colore1
              else
                (TempBand.Controls[Contatore2] as TQRShape).Pen.Color := Colore2;
              // Se ForzaAltezzaShape > -1 forza l'altezza dello shape al valore specificato dal parametro stesso
              if ForzaAltezzaShape > -1 then
                (TempBand.Controls[Contatore2] as TQRShape).Height := ForzaAltezzaShape;
              // Se ForzaAltezzaShape = 0, altrimenti in stampa non vengono le linee orizzontali
              if ForzaAltezzaShape = 0 then
                (TempBand.Controls[Contatore2] as TQRShape).Shape := qrsHorLine;
              // Se ForzaDiminuzioneLarghezzaShape > -1 forza diminuisce la larghezza dello shape del valore specificato
              // dal parametro stesso
              if ForzaDiminuzioneLarghezzaShape > -1 then
                (TempBand.Controls[Contatore2] as TQRShape).Width := (TempBand.Controls[Contatore2] as TQRShape).Width - ForzaDiminuzioneLarghezzaShape;
            end;
          4:
            begin
              if Colore = '1' then
              begin
                (TempBand.Controls[Contatore2] as TQRShape).Pen.Color := Colore1;
                (TempBand.Controls[Contatore2] as TQRShape).Brush.Color := Colore1;
              end
              else
              begin
                (TempBand.Controls[Contatore2] as TQRShape).Pen.Color := Colore2;
                (TempBand.Controls[Contatore2] as TQRShape).Brush.Color := Colore2;
              end;
              // Se ForzaAltezzaShape > -1 forza l'altezza dello shape al valore specificato dal parametro stesso
              if ForzaAltezzaShape > -1 then
                (TempBand.Controls[Contatore2] as TQRShape).Height := ForzaAltezzaShape;
              // Se ForzaAltezzaShape = 0, altrimenti in stampa non vengono le linee orizzontali
              if ForzaAltezzaShape = 0 then
                (TempBand.Controls[Contatore2] as TQRShape).Shape := qrsHorLine;
              // Se ForzaDiminuzioneLarghezzaShape > -1 forza diminuisce la larghezza dello shape del valore specificato
              // dal parametro stesso
              if ForzaDiminuzioneLarghezzaShape > -1 then
                (TempBand.Controls[Contatore2] as TQRShape).Width := (TempBand.Controls[Contatore2] as TQRShape).Width - ForzaDiminuzioneLarghezzaShape;
            end;
        end;
      end;
      // Se è una banda di tipo TQRChildBand...
    end
    else if Report.Controls[Contatore] is TQRChildBand then
    begin
      TempChild := (Report.Controls[Contatore] as TQRChildBand);
      // Cicla per tutti i componenti della banda attuale
      for Contatore2 := 0 to TempChild.ControlCount - 1 do
      begin
        // In base al valore memorizzato nella proprietà 'Tag' colora il componente
        // nella maniera opportuna. La prima cifra a sinistra indica di che tipo di
        // componente si tratta (1=QRLabel, 2=QRDBText, 3=QRShape solo contorno,
        // 4=QRShape anche interno/brush); la seconda cifra indica se usare il Colore1
        // oppure il colore2.
        Tipo := IntToStr(TempChild.Controls[Contatore2].Tag);
        Colore := Tipo[2];
        Tipo := Tipo[1];
        case StrToInt(Tipo) of
          1:
            begin
              if Colore = '1' then
              begin
                (TempChild.Controls[Contatore2] as TQRLabel).Font.Color := Colore1;
              end
              else
              begin
                (TempChild.Controls[Contatore2] as TQRLabel).Font.Color := Colore2;
              end;
            end;
          2:
            begin
              if Colore = '1' then
              begin
                (TempChild.Controls[Contatore2] as TQRDBText).Font.Color := Colore1;
              end
              else
              begin
                (TempChild.Controls[Contatore2] as TQRDBText).Font.Color := Colore2;
              end;
            end;
          3:
            begin
              (TempChild.Controls[Contatore2] as TQRShape).Pen.Width := SpessoreLinee;
              if Colore = '1' then
              begin
                (TempChild.Controls[Contatore2] as TQRShape).Pen.Color := Colore1;
              end
              else
              begin
                (TempChild.Controls[Contatore2] as TQRShape).Pen.Color := Colore2;
              end;
              // Se ForzaAltezzaShape > -1 forza l'altezza dello shape al valore specificato dal parametro stesso
              if ForzaAltezzaShape > -1 then
                (TempChild.Controls[Contatore2] as TQRShape).Height := ForzaAltezzaShape;
              // Se ForzaAltezzaShape = 0, altrimenti in stampa non vengono le linee orizzontali
              if ForzaAltezzaShape = 0 then
                (TempChild.Controls[Contatore2] as TQRShape).Shape := qrsHorLine;
              // Se ForzaDiminuzioneLarghezzaShape > -1 forza diminuisce la larghezza dello shape del valore specificato
              // dal parametro stesso
              if ForzaDiminuzioneLarghezzaShape > -1 then
                (TempChild.Controls[Contatore2] as TQRShape).Width := (TempChild.Controls[Contatore2] as TQRShape).Width - ForzaDiminuzioneLarghezzaShape;
            end;
          4:
            begin
              if Colore = '1' then
              begin
                (TempChild.Controls[Contatore2] as TQRShape).Pen.Color := Colore1;
                (TempChild.Controls[Contatore2] as TQRShape).Brush.Color := Colore1;
              end
              else
              begin
                (TempChild.Controls[Contatore2] as TQRShape).Pen.Color := Colore2;
                (TempChild.Controls[Contatore2] as TQRShape).Brush.Color := Colore2;
              end;
              // Se ForzaAltezzaShape > -1 forza l'altezza dello shape al valore specificato dal parametro stesso
              if ForzaAltezzaShape > -1 then
                (TempChild.Controls[Contatore2] as TQRShape).Height := ForzaAltezzaShape;
              // Se ForzaAltezzaShape = 0, altrimenti in stampa non vengono le linee orizzontali
              if ForzaAltezzaShape = 0 then
                (TempChild.Controls[Contatore2] as TQRShape).Shape := qrsHorLine;
              // Se ForzaDiminuzioneLarghezzaShape > -1 forza diminuisce la larghezza dello shape del valore specificato
              // dal parametro stesso
              if ForzaDiminuzioneLarghezzaShape > -1 then
                (TempChild.Controls[Contatore2] as TQRShape).Width := (TempChild.Controls[Contatore2] as TQRShape).Width - ForzaDiminuzioneLarghezzaShape;
            end;
        end;
      end;
      // Se è una banda di tipo TQRSubDetail...
    end
    else if Report.Controls[Contatore] is TQRSubDetail then
    begin
      TempSubDetail := (Report.Controls[Contatore] as TQRSubDetail);
      // Cicla per tutti i componenti della banda attuale
      for Contatore2 := 0 to TempSubDetail.ControlCount - 1 do
      begin
        // In base al valore memorizzato nella proprietà 'Tag' colora il componente
        // nella maniera opportuna. La prima cifra a sinistra indica di che tipo di
        // componente si tratta (1=QRLabel, 2=QRDBText, 3=QRShape solo contorno,
        // 4=QRShape anche interno/brush); la seconda cifra indica se usare il Colore1
        // oppure il colore2.
        Tipo := IntToStr(TempSubDetail.Controls[Contatore2].Tag);
        Colore := Tipo[2];
        Tipo := Tipo[1];
        case StrToInt(Tipo) of
          1:
            begin
              if Colore = '1' then
              begin
                (TempSubDetail.Controls[Contatore2] as TQRLabel).Font.Color := Colore1;
              end
              else
              begin
                (TempSubDetail.Controls[Contatore2] as TQRLabel).Font.Color := Colore2;
              end;
            end;
          2:
            begin
              if Colore = '1' then
              begin
                (TempSubDetail.Controls[Contatore2] as TQRDBText).Font.Color := Colore1;
              end
              else
              begin
                (TempSubDetail.Controls[Contatore2] as TQRDBText).Font.Color := Colore2;
              end;
            end;
          3:
            begin
              (TempSubDetail.Controls[Contatore2] as TQRShape).Pen.Width := SpessoreLinee;
              if Colore = '1' then
              begin
                (TempSubDetail.Controls[Contatore2] as TQRShape).Pen.Color := Colore1;
              end
              else
              begin
                (TempSubDetail.Controls[Contatore2] as TQRShape).Pen.Color := Colore2;
              end;
              // Se ForzaAltezzaShape > -1 forza l'altezza dello shape al valore specificato dal parametro stesso
              if ForzaAltezzaShape > -1 then
                (TempSubDetail.Controls[Contatore2] as TQRShape).Height := ForzaAltezzaShape;
              // Se ForzaAltezzaShape = 0, altrimenti in stampa non vengono le linee orizzontali
              if ForzaAltezzaShape = 0 then
                (TempSubDetail.Controls[Contatore2] as TQRShape).Shape := qrsHorLine;
              // Se ForzaDiminuzioneLarghezzaShape > -1 forza diminuisce la larghezza dello shape del valore specificato
              // dal parametro stesso
              if ForzaDiminuzioneLarghezzaShape > -1 then
                (TempSubDetail.Controls[Contatore2] as TQRShape).Width := (TempSubDetail.Controls[Contatore2] as TQRShape).Width -
                  ForzaDiminuzioneLarghezzaShape;
            end;
          4:
            begin
              if Colore = '1' then
              begin
                (TempSubDetail.Controls[Contatore2] as TQRShape).Pen.Color := Colore1;
                (TempSubDetail.Controls[Contatore2] as TQRShape).Brush.Color := Colore1;
              end
              else
              begin
                (TempSubDetail.Controls[Contatore2] as TQRShape).Pen.Color := Colore2;
                (TempSubDetail.Controls[Contatore2] as TQRShape).Brush.Color := Colore2;
              end;
              // Se ForzaAltezzaShape > -1 forza l'altezza dello shape al valore specificato dal parametro stesso
              if ForzaAltezzaShape > -1 then
                (TempSubDetail.Controls[Contatore2] as TQRShape).Height := ForzaAltezzaShape;
              // Se ForzaAltezzaShape = 0, altrimenti in stampa non vengono le linee orizzontali
              if ForzaAltezzaShape = 0 then
                (TempSubDetail.Controls[Contatore2] as TQRShape).Shape := qrsHorLine;
              // Se ForzaDiminuzioneLarghezzaShape > -1 forza diminuisce la larghezza dello shape del valore specificato
              // dal parametro stesso
              if ForzaDiminuzioneLarghezzaShape > -1 then
                (TempSubDetail.Controls[Contatore2] as TQRShape).Width := (TempSubDetail.Controls[Contatore2] as TQRShape).Width -
                  ForzaDiminuzioneLarghezzaShape;
            end;
        end;
      end;
    end;
  end;
end;

procedure TDM1.ApriTabella(Tabella: TIBOTable; Ristruttura: Boolean);
begin
  // Se aperta chiude la tabella
  if Tabella.Active then
    Tabella.Active := False;
  // Finalmente apre la tabella
  Tabella.Active := True;
end;

procedure TDM1.InizializzaArchiviLevGen;
var
  P: TMemIniFile;
  Qry: TIB_Cursor;
begin
  // Se l'archivio delle aziende è vuoto significa che il programma
  // è al primo avvio e quindi crea automaticamente l'azienda di prova
  // e la seleziona come azienda attiva.
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;

    // -----------------------------------------------------------------------
    // IMposta la query che verifica se l'azienda di prova è presente...
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) FROM AZIENDE WHERE AZIENDA = ''PROVA''');
    Qry.Open;
    // E se non è presente la crea
    if Qry.Fields[0].AsInteger = 0 then
    begin
      // IMposta la query che aggiunge l'azienda
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO AZIENDE (AZIENDA, PERCORSO) VALUES (''PROVA'', ''' + CurrDir + 'PROVA\'')');
      Qry.ExecSQL;
      // Seleziona l'azienda di prova come azienda attiva
      P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
      P.WriteString('ARCPATH', 'AziendaCorrente', 'PROVA');
      P.UpdateFile;
      P.Free;
    end;
    // -----------------------------------------------------------------------

    // -----------------------------------------------------------------------
    // IMposta la query che verifica se il record dei parametri è presente...
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) FROM PARAMETRI');
    Qry.Open;
    // E se non è presente la crea
    if Qry.Fields[0].AsInteger = 0 then
    begin
      // IMposta la query che aggiunge l'azienda
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO PARAMETRI (RecordID, BackupUltimo, BackupDrive, BackupPeriodicita, BackupChiaveSACS, BackupNumCopie)');
      Qry.SQL.Add('VALUES (');
      Qry.SQL.Add('1,');
      Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', Now) + ''',');
      Qry.SQL.Add('''C'',');
      Qry.SQL.Add('1,');
      Qry.SQL.Add('''F'',');
      Qry.SQL.Add('10');
      Qry.SQL.Add(')');
      Qry.ExecSQL;
      // Seleziona l'azienda di prova come azienda attiva
      P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
      P.WriteString('ARCPATH', 'AziendaCorrente', 'PROVA');
      P.UpdateFile;
      P.Free;
    end;
    // -----------------------------------------------------------------------
  finally
    Qry.Free;
  end;
end;

procedure TDM1.ControllaEsistenzaCartellaAzienda(PercorsoAzienda: String);
begin
  PercorsoAzienda := SlashFinale(PercorsoAzienda);
  // Controlla se la directory dell'azienda esiste e se non esiste la
  // crea e crea anche gli archivi vuoti nuovi.
  if not DirectoryExists(PercorsoAzienda) then
  begin
    CreateDir(PercorsoAzienda);
  end;
end;

procedure TDM1.EliminaFile(NomeFile: String);
begin
  DeleteFile(PChar(NomeFile));
end;

procedure TDM1.CopiaFile(Sorgente, Destinazione: String);
begin
  CopyFile(PChar(Sorgente), PChar(Destinazione), False);
end;

procedure TDM1.EliminaExpArt(CodArt, CodArtStm: String);
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query, lo imposta e lo esegue per eliminare tutti i righi del documento esportato
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('DELETE');
    Qry.SQL.Add('FROM TmpRighi');
    Qry.SQL.Add('WHERE CODICEARTICOLO = ''' + CodArt + ''' AND CODICEARTICOLOSTM = ''' + CodArtStm +
      ''' AND (TIPODOCUMENTO = ''ARTICOLO'' OR TIPODOCUMENTO = ''CANTIERE'')');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaExpImpegno(IDImpegno: Integer);
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query, lo imposta e lo esegue per eliminare tutti i righi del documento esportato
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('DELETE');
    Qry.SQL.Add('FROM TmpRighi');
    Qry.SQL.Add('WHERE NUMORDPREV = ''' + IntToStr(IDImpegno) + ''' AND TIPODOCUMENTO = ''Chiamata''');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaExpLDE(const AID: Integer);
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query, lo imposta e lo esegue per eliminare tutti i righi del documento esportato
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('DELETE');
    Qry.SQL.Add('FROM TmpRighi');
    Qry.SQL.Add('WHERE ID = ' + IntToStr(AID));
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaExpDoc(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate);
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query, lo imposta e lo esegue per eliminare tutti i righi del documento esportato
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('DELETE');
    Qry.SQL.Add('FROM TmpRighi');
    Qry.SQL.Add('WHERE TipoDocumento = ''' + TipoDoc + '''');
    Qry.SQL.Add('  AND Registro = ''' + Registro + '''');
    Qry.SQL.Add('  AND NumOrdPrev = ' + IntToStr(NumDoc));
    Qry.SQL.Add('  AND DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Qry.SQL.Add('  AND STATION_ID = ' + CodiceUtente);
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaExpConformita(NumDoc: Longint; DataDoc: TDate);
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query, lo imposta e lo esegue per eliminare tutti i righi del documento esportato
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('DELETE');
    Qry.SQL.Add('FROM TmpRighi');
    Qry.SQL.Add('WHERE TipoDocumento = ''Conformita''');
    Qry.SQL.Add('  AND NumOrdPrev = ' + IntToStr(NumDoc));
    Qry.SQL.Add('  AND DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
    Qry.SQL.Add('  AND STATION_ID = ' + CodiceUtente);
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.AzzeraBacheca;
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto query, lo imposta e lo esegue per eliminare tutti i righi del documento esportato
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('DELETE');
    Qry.SQL.Add('FROM TmpRighi');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.AccorpaRighiDocFisc;
begin
  //
end;



// procedure TDM1.ImportaDocFisc(TipoDoc, Registro:String; NumDoc:Longint; DataDoc:TDate; AbilitaRiferimento:Integer);
// var
// Qry : TIBOQuery;
//
// begin
// Qry := TIBOQuery.Create(Self);
// // Effettua l'importazione dei righi selezionati per l'importazione
// //  nel nuovo documento.
// // ------------------------------------------------------------------------
// try
// TableRighiDocumento.DisableControls;
// // Trova il primo record del documento da importare (mi serve per poi avere il codice cliente)
// if TableTmpRighi.Locate('TipoDocumento;NumOrdPrev;DataDocumento', VarArrayOf([TipoDoc,NumDoc,DataDoc]), []) then begin
// // Inserisce il rigo del riferimento se abilitato.
// // NB: 0 = Riferimento disabilitato
// //     1 = Riferimento abilitato e importazione dei righi
// if AbilitaRiferimento > 0 then begin
// TableRighiDocumento.Append;
// TableRighiDocumentoDescrizione.Value   := '---> Rif. ' + TipoDoc +
// ' N. ' + IntToStr(NumDoc) + Registro +
// ' del ' + DateToStr(DataDoc);
// TableRighiDocumentoNoteRigo.Value      := IntToStr(TableTmpRighiCodiceCliente.Value);
// TableRighiDocumentoCodiceIVA.Value     := -9;
// TableRighiDocumento.Post;
// end;
//
// // Crea l'oggetto query, lo imposta e lo esegue per avere tutti i righi del documento
// Qry.SQL.Add('INSERT');
// Qry.SQL.Add('INTO "' + DM1.CurrDir + 'RighiVis.DB" (TipoDocumento, Registro, NumOrdPrev, DataDocumento, CodiceArticolo, Descrizione, PrezzoUnitario, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo, CodiceIVA, Margine,NoteRigo,MovMag,PrezzoUnitarioIVACompresa)');
// Qry.SQL.Add('SELECT TipoDocumento, Registro, NumOrdPrev, DataDocumento, CodiceArticolo, Descrizione, PrezzoUnitario, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo, CodiceIVA, Margine, NoteRigo, MovMag, PrezzoUnitarioIVACompresa');
// Qry.SQL.Add('FROM "' + CurrDir + 'TmpRighi.DB"');
// Qry.SQL.Add('WHERE TipoDocumento = "' + TipoDoc + '"');
// Qry.SQL.Add('  AND Registro = "' + Registro + '"');
// Qry.SQL.Add('  AND NumOrdPrev = ' + IntToStr(NumDoc));
// Qry.SQL.Add('  AND DataDocumento = "' + FormatDateTime('mm/dd/yyyy', DataDoc) + '"');
// Qry.ExecSQL;
//
// // Elimina il documento appena importato
// EliminaExpDoc(TipoDoc, Registro, NumDoc, DataDoc);
// end else begin
// MessageBeep(0);
// MessageDlg('Documento da importare non trovato !!!', mtError, [mbOk], 0);
// end;
//
// finally
// Qry.Free;
// DM1.TableRighiDocumento.EnableControls;
// end;
// end;

function TDM1.ExpArtToCodice(Descrizione: String): String;
var
  StartPos, Count: Byte;
begin
  StartPos := Pos('{', Descrizione) + 1; // Altrimenti mi becca anche la parentesi graffa
  Count := Pos('}', Descrizione) - StartPos;
  Result := Copy(Descrizione, StartPos, Count);
end;

function TDM1.ExpArtToCodiceStm(Descrizione: String): String;
var
  StartPos, Count: Byte;
begin
  StartPos := Pos('}{', Descrizione) + 2; // Altrimenti mi becca anche la parentesi graffa
  Count := Pos('}[', Descrizione) - StartPos;
  Result := Copy(Descrizione, StartPos, Count);
end;

function TDM1.ExpArtToQta(Descrizione: String): Double;
var
  StartPos, Count: Byte;
begin
  StartPos := Pos('[', Descrizione) + 1; // Altrimenti mi becca anche la parentesi quadra
  Count := Pos(']', Descrizione) - StartPos;
  if (StartPos > 1) and (Count > 0) and (Count <> 255) then
    Result := StrToFloat(Copy(Descrizione, StartPos, Count))
  else
    Result := 0;
end;

function TDM1.ExpImpegnoToID(Descrizione: String): Integer;
var
  StartPos, Count: Byte;
begin
  StartPos := Pos('{', Descrizione) + 1; // Altrimenti mi becca anche la parentesi graffa
  Count := Pos('}', Descrizione) - StartPos;
  Result := StrToInt(Copy(Descrizione, StartPos, Count));
end;

function TDM1.ExpDocToDocType(Descrizione: String): String;
var
  Contatore: Integer;
begin
  // Restituisce la substringa antecedente al primo spazio (Tipo del documento)
  Result := Copy(Descrizione, 0, Pos(' ', Descrizione) - 1);
end;

function TDM1.ExpDocToID(Descrizione: String): Integer;
var
  Q: TIB_Cursor;
begin
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    Q.SQL.Add('SELECT RIFDOC_ID FROM TMPRIGHI WHERE');
    Q.SQL.Add('TIPODOCUMENTO = ' + QuotedStr(ExpDocToDocType(Descrizione)));
    Q.SQL.Add('REGISTRO = ' + QuotedStr(ExpDocToDocReg(Descrizione)));
    Q.SQL.Add('NUMORDPREV = ' + IntToStr(ExpDocToDocNum(Descrizione)));
    Q.SQL.Add('DATADOCUMENTO = ' + ExpDocToDocDateStr(Descrizione));
    Q.Open;
    if not Q.Eof then
      Result := Q.Fields[0].AsInteger;
    Q.Close;
  finally
    Q.Free;
  end;
end;

function TDM1.ExpDocToDocNum(Descrizione: String): Longint;
var
  Contatore, Inizio, Fine: Integer;
begin
  Inizio := Pos(' ', Descrizione);
  Descrizione[Inizio] := '-'; // Altrimenti non rileva il secondo spazio
  Fine := Pos(' ', Descrizione);
  // Restituisce il numero del documento (Compreso tra i due spazi)
  Result := StrToInt(Copy(Descrizione, Inizio + 1, Fine - Inizio - 1));
end;

function TDM1.ExpDocToDocReg(Descrizione: String): String;
var
  Contatore, Inizio, Fine: Integer;
begin
  Descrizione[Pos(' ', Descrizione)] := '-'; // Altrimenti non rileva il secondo spazio.
  Inizio := Pos(' ', Descrizione); // Fissa la posizione di inizio della data
  Descrizione[Inizio] := '-'; // Altrimenti non rileva terzo spazio
  Fine := Pos(' ', Descrizione); // Fissa la posizione di fine della data
  // Restituisce il registro
  Result := Copy(Descrizione, Inizio + 1, Fine - Inizio - 1);
end;

function TDM1.ExpDocToDocDate(Descrizione: String): TDate;
begin
  // Restituisce il cliente
  Result := StrToDate(ExpDocToDocDateStr(Descrizione));
end;

function TDM1.ExpDocToDocDateStr(Descrizione: String): String;
var
  Contatore, Inizio, Fine: Integer;
begin
  Descrizione[Pos(' ', Descrizione)] := '-'; // Altrimenti non rileva il secondo spazio.
  Descrizione[Pos(' ', Descrizione)] := '-'; // Altrimenti non rileva il terzo spazio.
  Inizio := Pos(' ', Descrizione); // Fissa la posizione di inizio della data
  Descrizione[Pos(' ', Descrizione)] := '-'; // Altrimenti non rileva il quarto spazio.
  // Determina la fine della data e l'innizio dell'eventuale ragione sociale
  // NB: Se la RagSoc non c'è assune che la data finisce all'ultimao carattere
  Fine := Pos(' ', Descrizione); // Fissa la posizione di fine della data
  if Fine = 0 then
    Fine := Length(Descrizione);
  // Restituisce il cliente
  Result := Copy(Descrizione, Inizio + 1, Fine - Inizio);
  // Sostituisce la dicitura del mese perchè come era non mi piaceva
  Result := StringReplace(Result, 'JAN', '1', []);
  Result := StringReplace(Result, 'FEB', '2', []);
  Result := StringReplace(Result, 'MAR', '3', []);
  Result := StringReplace(Result, 'APR', '4', []);
  Result := StringReplace(Result, 'MAY', '5', []);
  Result := StringReplace(Result, 'JUN', '6', []);
  Result := StringReplace(Result, 'JUL', '7', []);
  Result := StringReplace(Result, 'AUG', '8', []);
  Result := StringReplace(Result, 'SEP', '9', []);
  Result := StringReplace(Result, 'OCT', '10', []);
  Result := StringReplace(Result, 'NOV', '11', []);
  Result := StringReplace(Result, 'DEC', '12', []);
  Result := StringReplace(Result, '-', '/', [rfReplaceAll]);
end;

function TDM1.ExpDocToDocRagioneSocialeStr(Descrizione: String): String;
var
  Contatore, Inizio, Fine: Integer;
begin
  Result := '';
  Descrizione[Pos(' ', Descrizione)] := '-'; // Altrimenti non rileva il secondo spazio.
  Descrizione[Pos(' ', Descrizione)] := '-'; // Altrimenti non rileva il terzo spazio.
  Descrizione[Pos(' ', Descrizione)] := '-'; // Altrimenti non rileva il quarto spazio.

  // Determina L'inizio della ragione sociale e se non c'è ritorna una stringa nulla
  Inizio := Pos(' ', Descrizione);
  if Inizio = 0 then
    Exit;

  Fine := Length(Descrizione); // Fissa la posizione di fine della data
  // Restituisce il cliente
  Result := Copy(Descrizione, Inizio + 1, Fine - Inizio);
end;

function TDM1.RifToNumDoc(Riferimento: String; Lungh: Integer): String;
var
  Inizio, Fine, Contatore: Integer;
  Tmp: String;
begin
  Tmp := '';
  Inizio := Pos('° ', Riferimento) + 1;
  Fine := Pos(' ', Riferimento) - 1;
  for Contatore := Inizio to Fine do
  begin
    Tmp := Tmp + Riferimento[Contatore];
  end;
  Result := PadR(Tmp, ' ', Lungh);
end;

function TDM1.RifToDataDoc(Riferimento: String): String;
var
  Inizio, Fine, Contatore: Integer;
  Tmp: String;
  TmpDate: TDate;
begin
  Tmp := '';
  Inizio := Pos('del ', Riferimento) + 4;
  Fine := Length(Riferimento);
  for Contatore := Inizio to Fine do
  begin
    Tmp := Tmp + Riferimento[Contatore];
  end;
  TmpDate := StrToDate(Tmp);
  Result := FormatDateTime('yymmdd', TmpDate);
end;

// Funzione che riceve il codice IVA di Levante e ritorna il codice IVA per l'esportazione
function TDM1.AliquotaIva_GetCodiceExport(CodiceIva: Integer): String;
var
  Qry: TIB_Cursor;
begin
  Result := '';
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT EXPORT_CODICE FROM ALIQIVA WHERE CODICEIVA = ' + IntToStr(CodiceIva));
    Qry.Open;
    if Qry.Eof then
      Exit;
    Result := Qry.Fields[0].AsString;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.PadR(StrIn, PadChar: String; Lungh: Integer): String;
var
  Contatore: Integer;
begin
  // Aggiunge alla SINISTRA della stringa ricevuta tanti caratteri PadChar fino ad arrivare alla lunghezza specificata in Lungh
  for Contatore := Length(StrIn) to Lungh - 1 do
  begin
    StrIn := PadChar + StrIn;
  end;
  Result := StrIn;
end;

function TDM1.PadL(StrIn, PadChar: String; Lungh: Integer): String;
var
  Contatore: Integer;
begin
  // Aggiunge alla DESTRA della stringa ricevuta tanti caratteri PadChar fino ad arrivare alla lunghezza specificata in Lungh
  for Contatore := Length(StrIn) to Lungh - 1 do
  begin
    StrIn := StrIn + PadChar;
  end;
  Result := StrIn;
end;

// Funzione che ritorna il valore ricevuto in formato idoneo ad essere esportato
// in un file csv a larghezza fissa
function TDM1.Csv_Num_LeftAlign(V: Double; Moltiplicatore, LunghezzaFissa: Integer): String;
var
  Value: Int64;
begin
  // Defaultizzazione moltiplicatore
  if Moltiplicatore = 0 then
    Moltiplicatore := 1;
  // Moltiplica il valore per il moltiplicatore e ne considera solo la parte intera
  // Value := Trunc(V * Moltiplicatore);
  Value := Trunc(Arrotonda((V * Moltiplicatore), 0));
  // Lo converte in stringa
  Result := IntToStr(Value);
  // Se si è specificata una lunghezza fissa del campo (csv fixed width)...
  if LunghezzaFissa > 0 then
  begin
    // Lo allinea a sx e gli aggiunge eventuali spazi per fargli raggiungere la lunghezza voluta
    Result := PadL(Result, ' ', LunghezzaFissa);
    // Nel caso sia più lungo della lunghezza specificata elimina i caratteri in eccesso
    Result := LeftStr(Result, LunghezzaFissa);
  end;
end;

function TDM1.Csv_Num_RightAlign(V: Double; Moltiplicatore: Integer; LunghezzaFissa: Integer = 0): String;
var
  Value: Int64;
begin
  // Defaultizzazione moltiplicatore
  if Moltiplicatore = 0 then
    Moltiplicatore := 1;
  // Moltiplica il valore per il moltiplicatore e ne considera solo la parte intera
  // Value := Trunc(V * Moltiplicatore);
  Value := Trunc(Arrotonda((V * Moltiplicatore), 0));
  // Lo converte in stringa
  Result := IntToStr(Value);
  // Se si è specificata una lunghezza fissa del campo (csv fixed width)...
  if LunghezzaFissa > 0 then
  begin
    // Lo allinea a dx e gli aggiunge eventuali spazi per fargli raggiungere la lunghezza voluta
    Result := PadR(Result, ' ', LunghezzaFissa);
    // Nel caso sia più lungo della lunghezza specificata elimina i caratteri in eccesso
    Result := RightStr(Result, LunghezzaFissa);
  end;
end;

// Funzione che ritorna il valore ricevuto in formato idoneo ad essere esportato
// in un file csv a larghezza fissa
function TDM1.Csv_Alpha_LeftAlign(V: String; LunghezzaFissa: Integer = 0): String;
begin
  // Assegna il valore
  Result := V;
  // Se si è specificata una lunghezza fissa del campo (csv fixed width)...
  if LunghezzaFissa > 0 then
  begin
    // Lo allinea a sx e gli aggiunge eventuali spazi per fargli raggiungere la lunghezza voluta
    Result := PadL(Result, ' ', LunghezzaFissa);
    // Nel caso sia più lungo della lunghezza specificata elimina i caratteri in eccesso
    Result := LeftStr(Result, LunghezzaFissa);
  end;
end;

function TDM1.Csv_Alpha_RightAlign(V: String; LunghezzaFissa: Integer): String;
begin
  // Assegna il valore
  Result := V;
  // Se si è specificata una lunghezza fissa del campo (csv fixed width)...
  if LunghezzaFissa > 0 then
  begin
    // Lo allinea a sx e gli aggiunge eventuali spazi per fargli raggiungere la lunghezza voluta
    Result := PadR(Result, ' ', LunghezzaFissa);
    // Nel caso sia più lungo della lunghezza specificata elimina i caratteri in eccesso
    Result := RightStr(Result, LunghezzaFissa);
  end;
end;

function TDM1.StrLeft(StrIn: String; Lungh: Integer): String;
var
  Contatore: Integer;
  Tmp: String;
begin
  Tmp := '';
  // Se la stringa ricevuta è < della lunghezza specificata nel parametro 'Lungh' la allunga
  if Length(StrIn) < Lungh then
    StrIn := PadL(StrIn, ' ', Lungh);

  for Contatore := 1 to Lungh do
  begin
    Tmp := Tmp + StrIn[Contatore];
  end;
  Result := Tmp;
end;

function TDM1.StrRight(StrIn: String; Lungh: Integer): String;
var
  Contatore: Integer;
  Tmp: String;
begin
  Tmp := '';
  // Se la stringa ricevuta è < della lunghezza specificata nel parametro 'Lungh' la allunga
  if Length(StrIn) < Lungh then
    StrIn := PadR(StrIn, ' ', Lungh);

  for Contatore := Length(StrIn) - Lungh + 1 to Length(StrIn) do
  begin
    Tmp := Tmp + StrIn[Contatore];
  end;
  Result := Tmp;
end;

procedure TDM1.SelezionaStato(TipoDocumento: String; Tabella: TIBODataset; Chiamante: Integer);
begin
  // Crea la form di selezione dello stato dei documenti,
  // imposta alcune variabili globali.
  Application.CreateForm(TSelezioneStatoForm, SelezioneStatoForm);
  SelezioneStatoForm.TipoDocumento := TipoDocumento;
  SelezioneStatoForm.Tabella := Tabella;
  SelezioneStatoForm.Tag := Chiamante;
  SelezioneStatoForm.ShowModal;
end;

function TDM1.StrToColor(StrColor: String; DefaultColor: TColor): TColor;
begin
  Result := DefaultColor;
  if StrColor = 'clBlack' then
    Result := clBlack
  else if StrColor = 'clMaroon' then
    Result := clMaroon
  else if StrColor = 'clGreen' then
    Result := clGreen
  else if StrColor = 'clOlive' then
    Result := clOlive
  else if StrColor = 'clNavy' then
    Result := clNavy
  else if StrColor = 'clPurple' then
    Result := clPurple
  else if StrColor = 'clTeal' then
    Result := clTeal
  else if StrColor = 'clGray' then
    Result := clGray
  else if StrColor = 'clSilver' then
    Result := clSilver
  else if StrColor = 'clRed' then
    Result := clRed
  else if StrColor = 'clLime' then
    Result := clLime
  else if StrColor = 'clYellow' then
    Result := clYellow
  else if StrColor = 'clBlue' then
    Result := clBlue
  else if StrColor = 'clFuchsia' then
    Result := clFuchsia
  else if StrColor = 'clAqua' then
    Result := clAqua
  else if StrColor = 'clWhite' then
    Result := clWhite;
end;

procedure TDM1.SelezionaCliente(FieldCliente, FieldCodPrat, FieldDataPrat: TField; RagSoc: String);
begin
  DM1.Attendere;
  try
    Application.CreateForm(TSelezioneClienteForm, SelezioneClienteForm);
    MainForm.SetParentComponent(SelezioneClienteForm);
    SelezioneClienteForm.FieldCliente := FieldCliente;
    SelezioneClienteForm.FieldCodPrat := FieldCodPrat;
    SelezioneClienteForm.FieldDataPrat := FieldDataPrat;

    // IMposta il filtro per ragione sociale in base al parametro ricevuto in modo che la form poi esegua la ricerca automaticamente
    // firltrando per il dato impostato
    SelezioneClienteForm.EditClientiRagSoc.Text := RagSoc;

    SelezioneClienteForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TDM1.SelezionaSocGas(FieldCodice: TField);
begin
  DM1.Attendere;
  try
    Application.CreateForm(TSocGasForm, SocGasForm);
    SocGasForm.FieldCodice := FieldCodice;
    SocGasForm.Parent := MainForm;
    SocGasForm.DblClickMode := DblClickModeSelection;
    SocGasForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TDM1.SelezionaArticolo(CodArt, Descrizione: String; AddMode: TAddArtMode; const AQta: Double; const ACodicePratica: Integer = 0;
      const ADataPratica: TDateTime = 0);
begin
  DM1.Attendere;
  try
    Application.CreateForm(TArticoliForm, ArticoliForm);
    ArticoliForm.Parent := MainForm;

    // IMposta il filtro per ragione sociale in base al parametro ricevuto in modo che la form poi esegua la ricerca automaticamente
    // firltrando per il dato impostato
    if Trim(CodArt) <> '' then
      ArticoliForm.EditArtCodice.Text := CodArt;
    if Trim(Descrizione) <> '' then
      ArticoliForm.EditArtDescrizione.Text := Descrizione;

    // Se il documento chiamante fa parte di una pratica imposta i dati della pratica
    // in modo che risulti visibile anche la giacenza del cantiere
    if ACodicePratica <> 0 then
    begin
      ArticoliForm.PratCodice := ACodicePratica;
      ArticoliForm.PratDataApertura := ADataPratica;
    end;

    // Imposta il codice che indentifica la Form Chiamante
    ArticoliForm.Tag := 999; // Abilita la seleziona dell'articolo
    ArticoliForm.Qta := AQta;
    ArticoliForm.AddMode := AddMode;

    ArticoliForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TDM1.SelezionaTipoExtFile(FieldCodiceExtPrg: TField);
begin
  DM1.Attendere;
  try
    Application.CreateForm(TExtPrgForm, ExtPrgForm);
    ExtPrgForm.FieldCodiceExtPrg := FieldCodiceExtPrg;
    ExtPrgForm.Parent := MainForm;
    ExtPrgForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TDM1.SelezionaCantiereImpianto(FieldPratica, FieldDataPratica, FieldIDPratica, FieldCliente: TField; ClienteDocumento: Integer; CallerCode: Integer);
begin
  DM1.Attendere;
  try
    Application.CreateForm(TSelezionaPraticheImpiantiForm, SelezionaPraticheImpiantiForm);
    SelezionaPraticheImpiantiForm.CallerCode := CallerCode;
    SelezionaPraticheImpiantiForm.FieldPratica := FieldPratica;
    SelezionaPraticheImpiantiForm.FieldDataPratica := FieldDataPratica;
    SelezionaPraticheImpiantiForm.FieldIDPratica := FieldIDPratica;
    SelezionaPraticheImpiantiForm.FieldCliente := FieldCliente;
    SelezionaPraticheImpiantiForm.CodiceSoggettoDocumento := ClienteDocumento;
    MainForm.SetParentComponent(SelezionaPraticheImpiantiForm);
    SelezionaPraticheImpiantiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TDM1.SelezionaCantiereImpianto(EditPratica, EditDataPratica, EditDescrizionePratica: TEdit; ClienteDocumento: Integer; CallerCode: Integer);
begin
  DM1.Attendere;
  try
    Application.CreateForm(TSelezionaPraticheImpiantiForm, SelezionaPraticheImpiantiForm);
    SelezionaPraticheImpiantiForm.CallerCode := CallerCode;
    SelezionaPraticheImpiantiForm.EditPratica := EditPratica;
    SelezionaPraticheImpiantiForm.EditDataPratica := EditDataPratica;
    SelezionaPraticheImpiantiForm.EditDescrizionePratica := EditDescrizionePratica;
    SelezionaPraticheImpiantiForm.CodiceSoggettoDocumento := ClienteDocumento;
    MainForm.SetParentComponent(SelezionaPraticheImpiantiForm);
    SelezionaPraticheImpiantiForm.Show;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TDM1.Attendere;
begin
  Screen.Cursor := crHourGlass;
  MainForm.Attendere.Visible := True;
  MainForm.Attendere.Update;
end;

procedure TDM1.ChiudiAttendere;
begin
  MainForm.Attendere.Visible := False;
  Screen.Cursor := crDefault;
end;

function TDM1.NumScadenzeDocumento(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate): Integer;
Var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT count(*) as Risultato');
    Qry.SQL.Add('FROM Scadenz');
    Qry.SQL.Add('WHERE');
    Qry.SQL.Add('    (TipoDoc = ''' + TipoDoc + ''')');
    Qry.SQL.Add('AND (Registro = ''' + Registro + ''')');
    Qry.SQL.Add('AND (NumDoc = ' + IntToStr(NumDoc) + ')');
    Qry.SQL.Add('AND (DataDoc = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
    Qry.Open;
    Result := Qry.FieldByName('Risultato').Value;
  finally
    Qry.Free;
  end;
end;


// =====================================================================================================
// ======================== INIZIO PROTEZIONI HARDWARE =================================================
// =====================================================================================================

procedure TDM1.ClearSKeyData;
begin
  // Inizializza vuoto l'array globale SKeyData che ospita il buffer della chiave
  FillChar(SKeyData, SizeOf(SKeyData), ' ');
end;

function TDM1.CheckDemo: Boolean;
var
  P_ID: String; // Identificatore programma
  DP: TDemoProt;
  DK: String; // Demo Key
  T: String; // Stringa di appoggio usata per costruire i messaggi
  KeyPressProcedure: TKeyPressProcedure;
  KeyPressChar: Word;
begin
  // Questa funzione si occupa di gestire le protezioni della versione DEMO del programma.
  // -------------------------------------------------------------------------------------
  // Inizializzazione
  Result := False;
  DP := TDemoProt.Create;
  KeyPressChar := 65; // 'A'
  KeyPressProcedure := RiattivazioneDemo;
  RiattivazioneForm := nil;
  try
    // Per sicurezza compone il program ID in più passaggi
    P_ID := 'T';
    P_ID := P_ID + 'H';
    P_ID := P_ID + 'C';
    P_ID := P_ID + 'L';
    // Per sicurezza compone la chiave in più passaggi
    DK := 'M';
    DK := DK + 'A';
    DK := DK + 'U';
    DK := DK + 'R';
    DK := DK + '0'; // zero
    DK := DK + 'S';
    DK := DK + 'T';
    DK := DK + 'R';
    DK := DK + '0'; // zero
    DK := DK + 'N';
    DK := DK + 'Z';
    DK := DK + '0'; // zero
    // Imposta la chiave di cifratura
    DP.Key := DK;
    // Verifica se i marcatori sono al loro posto e sono validi
    DP.CheckProtection(P_ID);
    // Imposta il risultato della funzione in base al risultato dei controlli della protezione
    Result := DP.ClearToRun;
    // Se la verifica delle protezioni ha dato esito negativo controlla anche
    // se i marcatori sono tutti assenti, nel qual caso significherebbe che
    // il sistema è perfettamente pulito ed è la prima volta che il programma
    // viene avviato e quindi provvede ad attivare il programma creando anche
    // ex-novo tutti i marcatori.
    if not DP.ClearToRun then
    begin
      // Se il controllo ha dato esito negativo provvede alla creazione della form di riattivazione
      Application.CreateForm(TRiattivazioneForm, RiattivazioneForm);
      RiattivazioneForm.DP := DP;
      // Se è un errore di marcatori ed è la prima volta che si avvia il programma
      // provvede alla creazione exnovo del programma
      if DP.PrimoAvvio and (DP.ErrorCode = ecMarkerError) then
      begin

        // Attiva la versione DEMO creando ex-novo i marcatori
        DP.CreateNewMarkers(P_ID, Now, DEMO_DAYS, StrToDate(DEMO_ABSOLUTE_LOCK_DATE), DEMO_FIRST_RUN_USER_ID);
        // Ricontrolla se i marcatori sono al loro posto e se sono validi
        DP.CheckProtection(P_ID);
        // Aggiorna il risultato della funzione in base ai marcatori appena creati
        // NB: Se anche adesso i marcatori non sono validi significa che ci sono
        // stati problemi durante il Write dei marcatori sul disco.
        Result := DP.ClearToRun;

        // Se è un semplice errore di marcatori e non è il primo avvio di programma
        // (significa molto probabilmente che l'utente ha spataccato con i marcatori)
      end
      else if DP.ErrorCode = ecMarkerError then
      begin

        // Compone il messaggio
        T := 'ERRORE! - Lev@nte P error (';
        if DP.Marker1.Present then
          T := T + '1'
        else
          T := T + '0';
        if DP.Marker1.Contents then
          T := T + '1'
        else
          T := T + '0';
        if DP.Marker1.FileDate then
          T := T + '1'
        else
          T := T + '0';
        T := T + '-';
        if DP.Marker2.Present then
          T := T + '1'
        else
          T := T + '0';
        if DP.Marker2.Contents then
          T := T + '1'
        else
          T := T + '0';
        if DP.Marker2.FileDate then
          T := T + '1'
        else
          T := T + '0';
        T := T + '-';
        if DP.Marker3.Present then
          T := T + '1'
        else
          T := T + '0';
        if DP.Marker3.Contents then
          T := T + '1'
        else
          T := T + '0';
        if DP.Marker3.FileDate then
          T := T + '1'
        else
          T := T + '0';
        T := T + '-';
        if DP.Marker4.Present then
          T := T + '1'
        else
          T := T + '0';
        if DP.Marker4.Contents then
          T := T + '1'
        else
          T := T + '0';
        if DP.Marker4.FileDate then
          T := T + '1'
        else
          T := T + '0';
        T := T + ')'#13#13#13'Per ulteriori informazioni: 800.085.851'#13'(Chiamata gratuita escluso cellulari).';
        // Visualizza il messaggio
        DM1.Messaggi('ERRORE !!!', T, '', [mbOk], KeyPressChar, KeyPressProcedure);

        // Se è stata superata la data di blocco assoluto
      end
      else if DP.ErrorCode = ecAbsoluteLock then
      begin

        // Visualizza il messaggio
        DM1.Messaggi('Validità Versione Demo',
          'ERRORE! - Lev@nte P error (Abs.Lck)'#13#13#13'Per ulteriori informazioni: 800.085.851'#13'(Chiamata gratuita escluso cellulari).',
          'NB: Si consiglia di chiamare il CENTRO SERVIZI per risolvere il problema', [mbOk], KeyPressChar, KeyPressProcedure);

        // Se è stata superata la fine del periodo demo
      end
      else if DP.ErrorCode = ecDateTooHigh then
      begin

        // Visualizza il messaggio
        DM1.Messaggi('Scadenza Periodo Demo', 'Il periodo di prova (' + IntToStr(DP.GiorniDemo) + ' giorni) del programma è terminato.' +
          #13#13#13'Grazie per aver valutato Lev@nte software, ci auguriamo che il programma soddisfi pienamente le sue necessità, ' +
          'se così non fosse la preghiamo di contattarci per i consigli o le richieste di modifiche che ritiene necessarie per un continuo miglioramento del prodotto.'
          + #13#13#13'Per ulteriori informazioni: 800.085.851'#13'(Chiamata gratuita escluso cellulari).',
          'NB: Nel caso intendesse proseguire con l''acquisto del programma tutti i dati inseriti finora saranno automaticamente importati.', [mbOk],
          KeyPressChar, KeyPressProcedure);

        // Se la data attuale è antecedente la data di primo avvio
      end
      else if DP.ErrorCode = ecDateTooLow then
      begin

        DM1.Messaggi('Validità Versione Demo', 'La data attuale è antecedente l''inizio del periodo di prova' + #13#13#13'Il periodo di prova (' +
          IntToStr(DP.GiorniDemo) + ' giorni) del programma ' + ' inizia il ' + DateToStr(DP.DataOraPrimoAvvio) + ' e termina il ' +
          DateToStr(DP.DataScadenzaPeriodoDemo) + '.',
          'NB: Per ulteriori informazioni o aiuto sull''utilizzo del programma chiare il CENTRO SERVIZI: 0541/475704', [mbOk], KeyPressChar, KeyPressProcedure);

      end;
    end;

    // Se a questo punto il controllo delle protezioni ha dato esito positivo aggiorna il flags
    if DP.ClearToRun then
    begin
      DemoFlags.GiorniMancantiFineDemo := DP.GiorniMancantiFineDemo;
      DemoFlags.DataPrimoAvvio := DP.DataOraPrimoAvvio;
      DemoFlags.DataScadenza := DP.DataScadenzaPeriodoDemo;
      DemoFlags.DataBloccoTotale := DP.DataBloccoAssoluto;
    end;
  finally
    DP.Free;
    if RiattivazioneForm <> nil then
      RiattivazioneForm.Free;
  end;
end;

procedure TDM1.RiattivazioneDemo(KeyPressed: Word);
begin
  // Se passa di quì significa che l'utente ha premuto ALT+A per la visualizzazione
  // della form di attivazione della demo e quindi la visualizza.
  RiattivazioneForm.ShowModal;
end;

function TDM1.ControllaDocumento(DocType: String): Integer;
begin
  Result := 0;
  DocType := Trim(DocType);
  // In base al tipo di documento ritorna l'abilitazione o meno.
  if DocType = 'Preventivo' then
    Result := ModCtrl(MOD_PREVENTIVI)
  else if DocType = 'Ordine' then
    Result := ModCtrl(MOD_ORDINI)
  else if DocType = 'S.A.L.' then
    Result := ModCtrl(MOD_SAL)
  else if DocType = 'D.D.T.' then
    Result := ModCtrl(MOD_DDT)
  else if DocType = 'Fattura' then
    Result := ModCtrl(MOD_FATTURE)
  else if DocType = 'Nota_accre' then
    Result := ModCtrl(MOD_NOTE_ACCREDITO)
  else if DocType = 'N.C.fornit' then
    Result := ModCtrl(MOD_NOTE_ACCREDITO)
  else if DocType = 'Ord.fornit' then
    Result := ModCtrl(MOD_ORDINI_FORNITORI)
  else if DocType = 'Bolla_entr' then
    Result := ModCtrl(MOD_BOLLE_ENTRATA)
  else if DocType = 'Fatt.acqui' then
    Result := ModCtrl(MOD_FATTURE_ACQUISTO)
  else if DocType = 'Ricev.fisc' then
    Result := ModCtrl(MOD_RICEVUTE_FISCALI)
  else if DocType = 'Fatt.R.F.' then
    Result := ModCtrl(MOD_FATTURE_RF)
  else if DocType = 'Buono_cons' then
    Result := ModCtrl(MOD_BUONO_CONSEGNA)
  else if DocType = 'Commessa' then
    Result := ModCtrl(MOD_PRATICHE)
  else if DocType = 'Carico_cantiere' then
    Result := ModCtrl(MOD_PRATICHE)
  else if DocType = 'Scarico_cantiere' then
    Result := ModCtrl(MOD_PRATICHE)
  else if DocType = 'Estratto_conto' then
    Result := ModCtrl(MOD_PRATICHE)
  else if DocType = 'Intervento' then
    Result := ModCtrl(MOD_CONTATTI);
end;

procedure TDM1.InitCopyProtection(ReturnDemoPermission: Boolean);
begin
  // Se è in esecuzione normale disabilita tutti i moduli, se invece è in modalità
  // DEMO abilita i moduli che devono essere attivi in tale modalità.
  if ReturnDemoPermission then
  begin // Se in modalità DEMO
    // Inizializza l'array che contiene il contenuto della memoria della chiave hardware
    // per fare in modo che, anche se la chiave non è presente, il programma funzioni ugualmente
    // in modalità demo e/o solo con i moduli liberi funzionanti.
    // *** CLIENTI, ARTICOLI, IMPORTAZIONE ARCHIVI ***
    SKeyData[MOD_CLIENTI] := '1';
    SKeyData[MOD_ARTICOLI] := '1';
    SKeyData[MOD_PRATICHE] := '1';
    SKeyData[MOD_PREVENTIVI] := '1';
    SKeyData[MOD_ORDINI] := '1';
    SKeyData[MOD_SAL] := '1';
    SKeyData[MOD_DDT] := '1';
    SKeyData[MOD_FATTURE] := '1';
    SKeyData[MOD_NOTE_ACCREDITO] := '1';
    SKeyData[MOD_BOLLE_ENTRATA] := '1';
    SKeyData[MOD_SCADENZARIO] := '1';
    SKeyData[MOD_TESTI] := '1';
    SKeyData[MOD_FAX] := '0';
    SKeyData[MOD_CONTATTI] := '1';
    SKeyData[MOD_EXT_FILE] := '1';
    SKeyData[MOD_CONFORMITA] := '1';
    SKeyData[MOD_FATT_RIEPILOGATIVA] := '1';
    SKeyData[MOD_MULTIAZIENDALE] := '1';
    SKeyData[MOD_IMPORTAZIONE_ARCHIVI] := '1';
    SKeyData[MOD_FATTURE_ACQUISTO] := '1';
    SKeyData[MOD_RICEVUTE_FISCALI] := '1';
    SKeyData[MOD_SCADENZARIO_PASSIVO] := '1';
    SKeyData[MOD_CEFALOMETRIE] := '0';
    SKeyData[MOD_ORDINI_FORNITORI] := '1';
    SKeyData[MOD_FATTURE_RF] := '1';
    SKeyData[MOD_DISCO_RIFATTURAZIONE] := '1';
    SKeyData[MOD_BUONO_CONSEGNA] := '1';
    SKeyData[MOD_SEGRETERIA] := '0';
    SKeyData[MOD_PRIMANOTA] := '1';
    SKeyData[MOD_PASSWORD] := '0';
    SKeyData[MOD_GIORNALE_MAGAZZINO] := '1';
    SKeyData[MOD_CONDIZIONI_VENDITA] := '0';
    SKeyData[MOD_AGENDA] := '1';
    SKeyData[MOD_GIORNALE_CANTIERE] := '1';
    // Se invece è in modalità LevanteLight lascia attivi solo i moduli necessari
  end
  else if MainForm.IsLevanteLight then
  begin
    // Inizializza l'array che contiene il contenuto della memoria della chiave hardware
    // per fare in modo che, anche se la chiave non è presente, il programma funzioni ugualmente
    // in modalità Levante Light e/o solo con i moduli liberi funzionanti.
    SKeyData[MOD_CLIENTI] := '0';
    SKeyData[MOD_ARTICOLI] := '1';
    SKeyData[MOD_PRATICHE] := '0';
    SKeyData[MOD_PREVENTIVI] := '0';
    SKeyData[MOD_ORDINI] := '0';
    SKeyData[MOD_SAL] := '0';
    SKeyData[MOD_DDT] := '0';
    SKeyData[MOD_FATTURE] := '0';
    SKeyData[MOD_NOTE_ACCREDITO] := '0';
    SKeyData[MOD_BOLLE_ENTRATA] := '1';
    SKeyData[MOD_SCADENZARIO] := '0';
    SKeyData[MOD_TESTI] := '0';
    SKeyData[MOD_FAX] := '0';
    SKeyData[MOD_CONTATTI] := '0';
    SKeyData[MOD_EXT_FILE] := '0';
    SKeyData[MOD_CONFORMITA] := '0';
    SKeyData[MOD_FATT_RIEPILOGATIVA] := '0';
    SKeyData[MOD_MULTIAZIENDALE] := '0';
    SKeyData[MOD_IMPORTAZIONE_ARCHIVI] := '0';
    SKeyData[MOD_FATTURE_ACQUISTO] := '1';
    SKeyData[MOD_RICEVUTE_FISCALI] := '0';
    SKeyData[MOD_SCADENZARIO_PASSIVO] := '0';
    SKeyData[MOD_CEFALOMETRIE] := '0';
    SKeyData[MOD_ORDINI_FORNITORI] := '0';
    SKeyData[MOD_FATTURE_RF] := '0';
    SKeyData[MOD_DISCO_RIFATTURAZIONE] := '0';
    SKeyData[MOD_BUONO_CONSEGNA] := '0';
    SKeyData[MOD_SEGRETERIA] := '0';
    SKeyData[MOD_PRIMANOTA] := '0';
    SKeyData[MOD_PASSWORD] := '0';
    SKeyData[MOD_GIORNALE_MAGAZZINO] := '0';
    SKeyData[MOD_CONDIZIONI_VENDITA] := '0';
    SKeyData[MOD_AGENDA] := '0';
    SKeyData[MOD_GIORNALE_CANTIERE] := '0';
    // Se è in esecuzione in modlità LEVARCO
    // abilita i moduli che devono essere attivi in tale modalità.
    // Se però la data attuale ha superato il limite non attiva un bel nulla.
  end
  else if LEVARCO_MODE and (Now <= StrToDate(LEVARCO_ABSOLUTE_LOCK_DATE)) then
  begin
    // Inizializza l'array che contiene il contenuto della memoria della chiave hardware
    // per fare in modo che, anche se la chiave non è presente, il programma funzioni ugualmente
    // in modalità demo e/o solo con i moduli liberi funzionanti.
    // *** CLIENTI, ARTICOLI, IMPORTAZIONE ARCHIVI ***
    SKeyData[MOD_CLIENTI] := '1';
    SKeyData[MOD_ARTICOLI] := '1';
    SKeyData[MOD_PRATICHE] := '1';
    SKeyData[MOD_PREVENTIVI] := '1';
    SKeyData[MOD_ORDINI] := '1';
    SKeyData[MOD_SAL] := '1';
    SKeyData[MOD_DDT] := '1';
    SKeyData[MOD_FATTURE] := '1';
    SKeyData[MOD_NOTE_ACCREDITO] := '1';
    SKeyData[MOD_BOLLE_ENTRATA] := '1';
    SKeyData[MOD_SCADENZARIO] := '1';
    SKeyData[MOD_TESTI] := '1';
    SKeyData[MOD_FAX] := '0';
    SKeyData[MOD_CONTATTI] := '1';
    SKeyData[MOD_EXT_FILE] := '1';
    SKeyData[MOD_CONFORMITA] := '1';
    SKeyData[MOD_FATT_RIEPILOGATIVA] := '1';
    SKeyData[MOD_MULTIAZIENDALE] := '1';
    SKeyData[MOD_IMPORTAZIONE_ARCHIVI] := '1';
    SKeyData[MOD_FATTURE_ACQUISTO] := '1';
    SKeyData[MOD_RICEVUTE_FISCALI] := '1';
    SKeyData[MOD_SCADENZARIO_PASSIVO] := '1';
    SKeyData[MOD_CEFALOMETRIE] := '0';
    SKeyData[MOD_ORDINI_FORNITORI] := '1';
    SKeyData[MOD_FATTURE_RF] := '1';
    SKeyData[MOD_DISCO_RIFATTURAZIONE] := '1';
    SKeyData[MOD_BUONO_CONSEGNA] := '1';
    SKeyData[MOD_SEGRETERIA] := '0';
    SKeyData[MOD_PRIMANOTA] := '1';

    if LEVARCO_PASSWORD then
      SKeyData[MOD_PASSWORD] := '1' // Password abilitate
    else
      SKeyData[MOD_PASSWORD] := '0'; // Password disabilitate

    SKeyData[MOD_GIORNALE_MAGAZZINO] := '1';
    SKeyData[MOD_CONDIZIONI_VENDITA] := '0';
    SKeyData[MOD_AGENDA] := '1';
    SKeyData[MOD_GIORNALE_CANTIERE] := '1';
    // Se è in modalità normale registrata
  end
  else
  begin
    // Inizializza l'array che contiene il contenuto della memoria della chiave hardware
    // per fare in modo che, anche se la chiave non è presente, il programma funzioni ugualmente
    // in modalità demo e/o solo con i moduli liberi funzionanti.
    // *** CLIENTI, ARTICOLI, IMPORTAZIONE ARCHIVI ***
    SKeyData[MOD_CLIENTI] := '0';
    SKeyData[MOD_ARTICOLI] := '0';
    SKeyData[MOD_PRATICHE] := '0';
    SKeyData[MOD_PREVENTIVI] := '0';
    SKeyData[MOD_ORDINI] := '0';
    SKeyData[MOD_SAL] := '0';
    SKeyData[MOD_DDT] := '0';
    SKeyData[MOD_FATTURE] := '0';
    SKeyData[MOD_NOTE_ACCREDITO] := '0';
    SKeyData[MOD_BOLLE_ENTRATA] := '0';
    SKeyData[MOD_SCADENZARIO] := '0';
    SKeyData[MOD_TESTI] := '0';
    SKeyData[MOD_FAX] := '0';
    SKeyData[MOD_CONTATTI] := '0';
    SKeyData[MOD_EXT_FILE] := '0';
    SKeyData[MOD_CONFORMITA] := '0';
    SKeyData[MOD_FATT_RIEPILOGATIVA] := '0';
    SKeyData[MOD_MULTIAZIENDALE] := '0';
    SKeyData[MOD_IMPORTAZIONE_ARCHIVI] := '0';
    SKeyData[MOD_FATTURE_ACQUISTO] := '0';
    SKeyData[MOD_RICEVUTE_FISCALI] := '0';
    SKeyData[MOD_SCADENZARIO_PASSIVO] := '0';
    SKeyData[MOD_CEFALOMETRIE] := '0';
    SKeyData[MOD_ORDINI_FORNITORI] := '0';
    SKeyData[MOD_FATTURE_RF] := '0';
    SKeyData[MOD_DISCO_RIFATTURAZIONE] := '0';
    SKeyData[MOD_BUONO_CONSEGNA] := '0';
    SKeyData[MOD_SEGRETERIA] := '0';
    SKeyData[MOD_PRIMANOTA] := '0';
    SKeyData[MOD_PASSWORD] := '0';
    SKeyData[MOD_GIORNALE_MAGAZZINO] := '0';
    SKeyData[MOD_CONDIZIONI_VENDITA] := '0';
    SKeyData[MOD_AGENDA] := '0';
    SKeyData[MOD_GIORNALE_CANTIERE] := '0';
  end;
  // Inizializza anche il codice utente che altrimenti rimane non assegnato
  CodiceUtente := '-1';
  // Nel caso di modalità LEVARCO provvede ad informare l'utente se mancano
  // meno di 30 giorni alla scadenza assoluta
  if LEVARCO_MODE then
    VisualizzaAvvertimentoScadenzaChiave(Trunc(StrToDate(LEVARCO_ABSOLUTE_LOCK_DATE) - Trunc(Now)));
end;

function TDM1.ModCtrl(CodMod: Integer): Integer;
begin
  // La funzione ritorna un valore intero con il seguente significato:
  // 0 := Modulo disabilitato
  // 1 := Modulo abilitato sola lettura
  // 2 := Modulo abilitato lettura/scrittura
  Result := 0;
  if SKeyData[CodMod] <> '0' then
  begin
    // Se è attivo il modulo di controllo delle password ritorna il valore dei permessi dell'utente
    // per il modulo richiesto, altrimenti ritorna il permesso inserito nella chiave.
    if SKeyData[MOD_PASSWORD] = '0' then
    begin
      if StrToInt(SKeyData[CodMod]) > 0 then
        Result := 2;
    end
    else
      Result := StrToInt(Permessi[CodMod - 14]); // NB: -14 perchè l'indice della chiave inizia da 15, quello dei permessi da 1
  end;
end;

procedure TDM1.ReadSmartKey;
var
  labelsm: String[MAX_LENGTH_LABEL];
  passwordsm: String[MAX_LENGTH_PW];
  KeyPort: Smallint;
begin
  labelsm := 'D';
  labelsm := labelsm + '-';
  labelsm := labelsm + 'C';
  labelsm := labelsm + 'O';
  labelsm := labelsm + 'M';
  labelsm := labelsm + '_';
  labelsm := labelsm + 'T';
  labelsm := labelsm + 'H';
  labelsm := labelsm + 'E';
  labelsm := labelsm + 'C';
  labelsm := labelsm + 'L';
  labelsm := labelsm + 'A';

  passwordsm := '4';
  passwordsm := passwordsm + '9';
  passwordsm := passwordsm + '1';
  passwordsm := passwordsm + 'S';
  passwordsm := passwordsm + 'C';
  passwordsm := passwordsm + 'F';
  passwordsm := passwordsm + 'R';
  passwordsm := passwordsm + '2';
  passwordsm := passwordsm + 'S';
  passwordsm := passwordsm + 'U';
  passwordsm := passwordsm + 'D';
  passwordsm := passwordsm + '2';
  passwordsm := passwordsm + '2';
  passwordsm := passwordsm + '4';
  passwordsm := passwordsm + 'S';
  passwordsm := passwordsm + 'P';

  ClearSKeyData;

  // Se è in modalità DEMO esegue la protezione software, altrimenti quella hardware.
  if D_MODE then
  begin
    // Se il controllo delle protezioni autorizza il programma a girare...
    if CheckDemo then
    begin
      // Inizializza i permessi della versione demo
      InitCopyProtection(True);
      // Se invece il controllo delle protezioni DEMO non vanno a buon fine
    end
    else
    begin
      // Disabilita tutti i permessi
      InitCopyProtection(False);
      // Esce dal programma
      Application.Terminate;
    end;
    // Se è in modalità LEVARCO c'è solo la LEVARCO_ABSOLUTE_LOCK_DATE
  end
  else if LEVARCO_MODE then
  begin
    // NB: IL controllo se la data attuale ha superato il limite è già
    // nella InitCopyProtection
    InitCopyProtection(False);
    // Se invece è in modalità di esecuzione normale con la chiave
  end
  else
  begin
    // Azzera la situazione
    InitCopyProtection(False);
    // Apertura SMARTKEY
    if SmartKey.LocateSKey(KeyPort, labelsm) = 0 then
    begin
      // Lettura SMARTKEY
      if SmartKey.ReadSKey(KeyPort, labelsm, passwordsm, SKeyData) = 0 then
      begin
        // *** CONTROLLO VERSIONE ***
        if MainForm.PrgVersionNoBuild > StrToInt(SKeyData[4] + SKeyData[5] + SKeyData[6]) then
          InitCopyProtection(False);
        if not ControlloDate(KeyPort, labelsm, passwordsm) then
          InitCopyProtection(False);
      end;
    end;
  end;
  // Alla fine di tutto comunque disattiva quei moduli che non devono apparire per nessun motivo
  // SKeyData[MOD_CONTATTI]                := '0';
  SKeyData[MOD_CEFALOMETRIE] := '0';
  SKeyData[MOD_DISCO_RIFATTURAZIONE] := '0';
  SKeyData[MOD_SEGRETERIA] := '0';
  SKeyData[MOD_FAX] := '0';
end;

function TDM1.ControlloDate(KeyPort: Integer; labelsm: String; passwordsm: String): Boolean;
var
  GGUA, MMUA, AAUA, GGPA, MMPA, AAPA: array [0 .. 1] of AnsiChar;
  TTUA: array [0 .. 3] of AnsiChar;
  GiorniDiProva, Counter: Integer;
  Oggi, Ora: String[8];
  DataPrimoAvvio, DataScadenzaChiave: TDate;
  GiorniAllaScadenza: Double;
begin

  Result := False;
  Oggi := FormatDateTime('dd/mm/yy', Date);
  Ora := FormatDateTime('hh/nn/ss', System.SysUtils.Time);

  // Controlla i primi 4 caratteri (codice utente/stazione)
  CodiceUtente := SKeyData[0];
  CodiceUtente := CodiceUtente + SKeyData[1];
  CodiceUtente := CodiceUtente + SKeyData[2];
  CodiceUtente := CodiceUtente + SKeyData[3];
  // if PrgName = 'THCL' then begin
  // Carica e calcola la quantità di giorni concessi per la demo
  GiorniDiProva := (StrToInt(SKeyData[7] + SKeyData[8]) * 30);
  // Esegue il controllo date solo se GiorniDiProva > 0
  if GiorniDiProva > 0 then
  begin
    // Lettura DATA PRIMO AVVIO
    GGPA[0] := SKeyData[9];
    GGPA[1] := SKeyData[10];
    MMPA[0] := SKeyData[11];
    MMPA[1] := SKeyData[12];
    AAPA[0] := SKeyData[13];
    AAPA[1] := SKeyData[14];
    // Lettura DATA E ORA ULTIMO AVVIO
    TTUA[0] := SKeyData[54];
    TTUA[1] := SKeyData[55];
    TTUA[2] := SKeyData[56];
    TTUA[3] := SKeyData[57];

    GGUA[0] := SKeyData[58];
    GGUA[1] := SKeyData[59];
    MMUA[0] := SKeyData[60];
    MMUA[1] := SKeyData[61];
    AAUA[0] := SKeyData[62];
    AAUA[1] := SKeyData[63];
    // Controlla se la data di primo avvio è già stata inserita...
    if ((GGPA[0] + GGPA[1] + MMPA[0] + MMPA[1] + AAPA[0] + AAPA[1]) = '000000') or ((GGPA[0] + GGPA[1] + MMPA[0] + MMPA[1] + AAPA[0] + AAPA[1]) = '      ') then
    begin
      // Riempie il contenuto della chiave con dei puntini fino al totale
      // riempimento (altrimenti non funziona correttamente).
      for Counter := (Length(Trim(SKeyData))) to 64 do
        SKeyData[Counter] := '.';
      // Se arriva quì significa che siamo al primo avvio e allora
      // provvedo a registrare la data di primo avvio nella chiave.
      SKeyData[9] := Oggi[1];
      SKeyData[10] := Oggi[2];
      SKeyData[11] := Oggi[4];
      SKeyData[12] := Oggi[5];
      SKeyData[13] := Oggi[7];
      SKeyData[14] := Oggi[8];
      // Inserisco anche la data e ora di ultimo avvio
      SKeyData[54] := Ora[1];
      SKeyData[55] := Ora[2];
      SKeyData[56] := Ora[4];
      SKeyData[57] := Ora[5];

      SKeyData[58] := Oggi[1];
      SKeyData[59] := Oggi[2];
      SKeyData[60] := Oggi[4];
      SKeyData[61] := Oggi[5];
      SKeyData[62] := Oggi[7];
      SKeyData[63] := Oggi[8];
      // Scrive nella chiave
      SmartKey.WriteSKey(KeyPort, labelsm, passwordsm, SKeyData);
      // Lettura DATA PRIMO AVVIO
      GGPA[0] := Oggi[1];
      GGPA[1] := Oggi[2];
      MMPA[0] := Oggi[4];
      MMPA[1] := Oggi[5];
      AAPA[0] := Oggi[7];
      AAPA[1] := Oggi[8];
      // Lettura DATA E ORA ULTIMO AVVIO
      GGUA[0] := Oggi[1];
      GGUA[1] := Oggi[2];
      MMUA[0] := Oggi[4];
      MMUA[1] := Oggi[5];
      AAUA[0] := Oggi[7];
      AAUA[1] := Oggi[8];
      TTUA[0] := Ora[1];
      TTUA[1] := Ora[2];
      TTUA[2] := Ora[4];
      TTUA[3] := Ora[5];
    end;
    // Calcola alcune date che mi servono.
    // NB: Calcola anche quanti giorni mancano alla scadenza
    DataPrimoAvvio := StrToDate(GGPA[0] + GGPA[1] + '/' + MMPA[0] + MMPA[1] + '/' + AAPA[0] + AAPA[1]);
    DataScadenzaChiave := DataPrimoAvvio + GiorniDiProva;
    GiorniAllaScadenza := DataScadenzaChiave - Trunc(Now);
    // Controllo che la data odierna non sia antecedente alla data
    // dell'ultimo avvio, nel qual caso significa che il furbetto ha
    // mandato indietro l'orologio per fregarci e quindi non parto.
    // Se invece la data odierna è supeRiore o uguale alla data odieran
    // prosegue il controllo...
    if (StrToFloat(Oggi[7] + Oggi[8] + Oggi[4] + Oggi[5] + Oggi[1] + Oggi[2] + Ora[1] + Ora[2] + Ora[4] + Ora[5]) >=
      StrToFloat(AAUA[0] + AAUA[1] + MMUA[0] + MMUA[1] + GGUA[0] + GGUA[1] + TTUA[0] + TTUA[1] + TTUA[2] + TTUA[3])) then
    begin
      // Aggiorna la data di ULTIMO AVVIO con la data e ora attuale
      // Inserisco anche la data e ora di ultimo avvio
      SKeyData[58] := Oggi[1];
      SKeyData[59] := Oggi[2];
      SKeyData[60] := Oggi[4];
      SKeyData[61] := Oggi[5];
      SKeyData[62] := Oggi[7];
      SKeyData[63] := Oggi[8];
      SKeyData[54] := Ora[1];
      SKeyData[55] := Ora[2];
      SKeyData[56] := Ora[4];
      SKeyData[57] := Ora[5];
      SmartKey.WriteSKey(KeyPort, labelsm, passwordsm, SKeyData);
      // Controlla se è già trascorso il periodo di prova, se non è ancora
      // trascorso ritorna il valor TRUE.
      if (StrToDate(Oggi[1] + Oggi[2] + '/' + Oggi[4] + Oggi[5] + '/' + Oggi[7] + Oggi[8]) - StrToDate(GGPA[0] + GGPA[1] + '/' + MMPA[0] + MMPA[1] + '/' +
        AAPA[0] + AAPA[1])) <= GiorniDiProva then
        Result := True;
      // Se il periodo di validità della chiave non è ancora scaduto ma rimangono ancora pochi giorni allo scadere
      // avverte l'utente.
      // NB: Se i giorni mancanti alla scadenza sono negativi significa che il periodo di validità della
      // chiave è giò passato da un certo numero di giorni e in questo caso l'avertimento è diverso.
      VisualizzaAvvertimentoScadenzaChiave(Trunc(GiorniAllaScadenza));
    end;
  end
  else
  begin
    Result := True;
  end;
  // end;
end;

procedure TDM1.TimerSmartKeyTimer(Sender: TObject);
begin
  // Esegue il controllo periodico della chiave di protezione
  ReadSmartKey;
end;

procedure TDM1.VisualizzaAvvertimentoScadenzaChiave(GiorniAllaScadenza: Integer);
begin
  // Se l'avvertimento è già stato visualizzato non lo visualizza più
  if DM1.AvvertimentoScadenzaChiaveGiaVisualizzato then
    Exit;
  // Se il periodo di validità della chiave non è ancora scaduto ma rimangono ancora pochi giorni allo scadere
  // avverte l'utente.
  // NB: Se i giorni mancanti alla scadenza sono negativi significa che il periodo di validità della
  // chiave è giò passato da un certo numero di giorni e in questo caso l'avertimento è diverso.
  if GiorniAllaScadenza < 0 then
  begin
    DM1.Messaggi('Levante - Attivazione', 'A T T E N Z I O N E !!!'#13#13'La chiave di attivazione di Levante è già scaduta da ' +
      IntToStr(Abs(GiorniAllaScadenza)) + ' giorni.'#13#13'Per la riattivazione chiama il centro servizi.', '', [mbOk], 0, nil);
    DM1.AvvertimentoScadenzaChiaveGiaVisualizzato := True;
  end
  else if GiorniAllaScadenza < 30 then
  begin
    DM1.Messaggi('Levante - Attivazione', 'A T T E N Z I O N E !!!'#13#13'Mancano ' + IntToStr(Abs(GiorniAllaScadenza)) +
      ' giorni alla scadenza della chiave.'#13#13'Chiama il centro servizi per riattivarla.', '', [mbOk], 0, nil);
    DM1.AvvertimentoScadenzaChiaveGiaVisualizzato := True;
  end;
end;


// =====================================================================================================
// ======================== FINE PROTEZIONI HARDWARE ===================================================
// =====================================================================================================

procedure TDM1.FocusRefresh;
begin
  PostMessage(MainForm.Handle, WM_LButtonDown, 0, 0);
  PostMessage(MainForm.Handle, WM_LButtonUp, 0, 0);
end;

function TDM1.SlashFinale(DirToCtrl: String): String; // Personale
begin
  Result := DirToCtrl;
  if Result[Length(Result)] <> '\' then
    Result := Result + '\';
end;


// procedure TDM1.AggiornaPrezziDocumento;
// var
// PrecPos:TBookmarkStr;
// begin
// PrecPos := TableRighiDocumento.Bookmark;
// TableRighiDocumento.DisableControls;
// TableRighiDocumento.First;
// while not TableRighiDocumento.Eof do begin
// if Trim(TableRighiDocumentoCodiceArticolo.Value) <> '' then begin
// if TableArticoli.Locate('CodiceArticolo', TableRighiDocumentoCodiceArticolo.Value, [loCaseInsensitive]) then begin
// TableRighiDocumento.Edit;
// TableRighiDocumentoPrezzoAcquistoArticolo.Value := TableArticoliUltimoPrzAcquisto.Value;
// // Se il documento è una bolla di entrata merci oppure una fattura di acquisto
// //  aggiorna con il prezzo di acquisto in quanto si tratta di un carico di magazzino
// //  o comunque di un documento di acquisto, altrimenti viene aggiornato con il prezzo di
// //  vendita appropriato in base al listino selezionato.
// if (TablePreventiviOrdiniTipoDocumento.Value = 'Bolla_entr')
// or (TablePreventiviOrdiniTipoDocumento.Value = 'Fatt.acqui') then begin
// TableRighiDocumentoMargine.Value := 0;
// end else begin
// case TablePreventiviOrdiniListino.Value of
// 1: TableRighiDocumentoMargine.Value := TableArticoliRicarico.Value;
// 2: TableRighiDocumentoMargine.Value := TableArticoliRicarico2.Value;
// 3: TableRighiDocumentoMargine.Value := TableArticoliRicarico3.Value;
// 4: TableRighiDocumentoMargine.Value := TableArticoliRicarico4.Value;
// end;
// end;
// TableRighiDocumento.Post;
// end else begin
// MessageBeep(0);
// MessageDlg('Articolo "' + TableRighiDocumentoDescrizione.Value + '" non trovato; tale articolo non sarà aggiornato !!!', mtWarning, [mbOk], 0);
// end;
// end;
// TableRighiDocumento.Next;
// end;
// TableRighiDocumento.Bookmark := PrecPos;
// TableRighiDOcumento.EnableControls;
// end;

function TDM1.NextCodiceArticolo(): String; // Personale
begin
  // Calcola il prossimo codice da assegnare e lo aggiorna nei progressivi
  TableProgressivi.Edit;
  TableProgressiviProgArt.Value := TableProgressiviProgArt.Value + 1;
  TableProgressivi.Post;
  Result := IntToStr(TableProgressiviProgArt.Value);
  // Cicla fino a quando il risultato è lungo 8 caratteri inserendo, se necessario,
  // degli 0 (zeri) all'inizio del codice fino a quando non raggiunge la lunghezza stabilita.
  while Length(Result) < NumCharCodArt do
  begin
    Result := '0' + Result;
  end;
  // Aggiunge il Precodice
  Result := Trim(TableProgressiviPROGARTPRECODICE.AsString) + Result;
end;

procedure TDM1.EliminaBanca(Abi, Cab: String); // Personale
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;
    Qry.SQL.Add('DELETE FROM BANCHE WHERE ABI = ''' + Abi + ''' AND CAB = ''' + Cab + '''');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaTesto(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
begin
  Qry.DeleteSQL.Clear;
  Qry.DeleteSQL.Add('DELETE');
  Qry.DeleteSQL.Add('FROM Testi');
  Qry.DeleteSQL.Add('WHERE');
  if CodToDel = -9999 then
    Qry.DeleteSQL.Add('Codice IS NULL')
  else
    Qry.DeleteSQL.Add('(Codice = ' + IntToStr(CodToDel) + ')');
  Qry.DeleteSQL.Add('AND (Data = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
  Qry.Delete;
  Qry.ApplyUpdates;
  Qry.CommitUpdates;
end;
{
  procedure TDM1.EliminaTesto(Qry:TIBOQuery; CodToDel:Longint; DataDoc:TDate);     // Personale
  var
  Q : TIB_Cursor;
  begin
  Q := TIB_Cursor.Create(Self);
  DM1.DBAzienda.StartTransaction;
  try try
  Q.DatabaseName := DM1.ArcDBFile;
  Q.IB_Connection := DM1.DBAzienda;
  // Elimina i righi del documento
  Q.SQL.Add('DELETE FROM TESTI WHERE CODICE = ' + IntToStr(CodToDel) + ' AND DATA = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
  Q.ExecSQL;
  DM1.DBAzienda.Commit;
  except
  DM1.DBAzienda.Rollback;
  end;
  finally
  Q.Free;
  end;
  end;
}

procedure TDM1.EliminaTracciato(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
begin
  Qry.DeleteSQL.Clear;
  Qry.DeleteSQL.Add('DELETE');
  Qry.DeleteSQL.Add('FROM Tracc');
  Qry.DeleteSQL.Add('WHERE');
  if CodToDel = -9999 then
    Qry.DeleteSQL.Add('Codice IS NULL')
  else
    Qry.DeleteSQL.Add('(Codice = ' + IntToStr(CodToDel) + ')');
  Qry.DeleteSQL.Add('AND (Data = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
  Qry.Delete;
  Qry.ApplyUpdates;
  Qry.CommitUpdates;
end;

procedure TDM1.EliminaContatto(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
begin
  Qry.DeleteSQL.Clear;
  Qry.DeleteSQL.Add('DELETE');
  Qry.DeleteSQL.Add('FROM Contatti');
  Qry.DeleteSQL.Add('WHERE');
  if CodToDel = -9999 then
    Qry.DeleteSQL.Add('Codice IS NULL')
  else
    Qry.DeleteSQL.Add('(Codice = ' + IntToStr(CodToDel) + ')');
  Qry.DeleteSQL.Add('AND (Data = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
  Qry.Delete;
  Qry.ApplyUpdates;
  Qry.CommitUpdates;
end;

procedure TDM1.EliminaExtFile(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
begin
  Qry.DeleteSQL.Clear;
  Qry.DeleteSQL.Add('DELETE');
  Qry.DeleteSQL.Add('FROM ExtFile');
  Qry.DeleteSQL.Add('WHERE');
  if CodToDel = -9999 then
    Qry.DeleteSQL.Add('Codice IS NULL')
  else
    Qry.DeleteSQL.Add('(Codice = ' + IntToStr(CodToDel) + ')');
  Qry.DeleteSQL.Add('AND (Data = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
  Qry.Delete;
  Qry.ApplyUpdates;
  Qry.CommitUpdates;
end;

procedure TDM1.EliminaDocFisc(Qry: TIBOQuery; TipoDoc, Registro: String; NumeroDoc: Longint; DataDoc: TDate; CancellaDagliImpegni: Boolean = False);
// Personale
var
  QryLocal: TIB_Cursor;
  InTransaction: Boolean;
begin
  InTransaction := DBAzienda.InTransaction;
  QryLocal := TIB_Cursor.Create(Self);
  QryLocal.DatabaseName := ArcDBFile;
  QryLocal.IB_Connection := DBAzienda;
  try
    if not InTransaction then
      DBAzienda.StartTransaction;
    try
      // Elimina la testata del documento
      Qry.DeleteSQL.Clear;
      Qry.DeleteSQL.Add('DELETE FROM PRVORDCL WHERE');
      Qry.DeleteSQL.Add('    (TipoDocumento = ''' + TipoDoc + ''')');
      Qry.DeleteSQL.Add('AND (Registro = ''' + Registro + ''')');
      if NumeroDoc = -9999 then
        Qry.DeleteSQL.Add('AND (NumOrdPrev IS NULL)')
      else
        Qry.DeleteSQL.Add('AND (NumOrdPrev = ' + IntToStr(NumeroDoc) + ')');
      if (not CancellaDagliImpegni) then
        Qry.DeleteSQL.Add('AND (DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      // Delete del record
      Qry.Delete;
      Qry.ApplyUpdates;
      Qry.CommitUpdates;

      // Elimina anche i righi del documento
      QryLocal.SQL.Clear;
      QryLocal.SQL.Add('DELETE FROM RighiPrv WHERE');
      QryLocal.SQL.Add('    (TipoDocumento = ''' + TipoDoc + ''')');
      QryLocal.SQL.Add('AND (Registro = ''' + Registro + ''')');
      if NumeroDoc = -9999 then
        QryLocal.SQL.Add('AND (NumOrdPrev IS NULL)')
      else
        QryLocal.SQL.Add('AND (NumOrdPrev = ' + IntToStr(NumeroDoc) + ')');
      if (not CancellaDagliImpegni) then
        QryLocal.SQL.Add('AND (DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      QryLocal.ExecSQL;

      // Elimina anche i sottorighi manodopera del documento
      QryLocal.SQL.Clear;
      QryLocal.SQL.Add('DELETE FROM RAPGIORNRIGHI WHERE');
      QryLocal.SQL.Add('    (TIPODOC = ''' + TipoDoc + ''')');
      QryLocal.SQL.Add('AND (REGISTRO = ''' + Registro + ''')');
      if NumeroDoc = -9999 then
        QryLocal.SQL.Add('AND (NUMDOC IS NULL)')
      else
        QryLocal.SQL.Add('AND (NUMDOC = ' + IntToStr(NumeroDoc) + ')');
      if (not CancellaDagliImpegni) then
        QryLocal.SQL.Add('AND (DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      QryLocal.ExecSQL;

      // Se è un intervento elimina anche l'impegno
      if (not CancellaDagliImpegni) and (TipoDoc = 'Intervento') then
      begin
        QryLocal.SQL.Clear;
        QryLocal.SQL.Add('DELETE FROM IMPEGNI WHERE');
        QryLocal.SQL.Add('    ID = ' + IntToStr(NumeroDoc));
        QryLocal.SQL.Add('AND TIPOIMPEGNO = ''' + TipoDoc + '''');
        QryLocal.SQL.Add('AND REGISTRO = ''' + Registro + '''');
        // NB: Non uso la data perchè nell'impegno il campo ha anche l'ora mentre nel
        // documento no e questo creava problemi (tanto l'ID del documento è univoco)
        QryLocal.ExecSQL;
      end;

      // NB: IL BLOCCO DI CODICE L'HO COMMENTATO PERCHE' HO DECISO DI NON FAR MAI ELIMINARE
      // E DETTAGLI DELLE NOTIFICHE ANCHE QUANDO SI ELIMINA UN DOCUMENTO
      // Elimina anche le notifiche fattura elettronica
      // QryLocal.SQL.Clear;
      // QryLocal.SQL.Add('DELETE FROM PRVORDCL_FE WHERE');
      // QryLocal.SQL.Add('    (TIPODOC = ''' + TipoDoc + ''')');
      // QryLocal.SQL.Add('AND (REGDOC = ''' + Registro + ''')');
      // if NumeroDoc = -9999 then QryLocal.SQL.Add('AND (NUMDOC IS NULL)') else QryLocal.SQL.Add('AND (NUMDOC = ' + IntToStr(NumeroDoc) + ')');
      // if (not CancellaDagliImpegni) then QryLocal.SQL.Add('AND (DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      // QryLocal.SQL.Add('AND (RESPONSETYPE <> ''rtReceivedFromProvider'')');
      // QryLocal.ExecSQL;

      if not InTransaction then
        DBAzienda.Commit;

      // Se è visibile l'agenda laterale la aggiorna
      if Assigned(ClientiForm.AgendaForm) and (ClientiForm.AgendaForm.Splitter.State = ssOpened) then
        ClientiForm.AgendaForm.EseguiQueryAgenda;
    except
      if not InTransaction then
        DBAzienda.Rollback;
      raise;
    end;
  finally
    QryLocal.Free;
  end;
end;

procedure TDM1.EliminaImpegno(QryImp: TIBODataset; TipoImpegno, Registro: String; NumeroDoc: Longint);
var
  Qry: TIB_Cursor;
  InTransaction: Boolean;
  PrecWaitMsg: String;
  MasterID: Integer;
begin
  // ===========================================================================
  // ELIMINAZIONE GOOGLE TASK  &  GOOGLE CALENDAR
  // ---------------------------------------------------------------------------
  // Salva il messaggio attuale della wait form
  if Assigned(WaitForm) then
    PrecWaitMsg := WaitForm.LabelMessaggio.Caption;
  try
    // RIcava il Master ID
    MasterID := Impegno_ID_To_MasterID(NumeroDoc);
    // Google Tasks
    if DM1.GoogleTasks_Enabled then
    begin
      DM1.ShowWait('', 'Sto comunicando con Google Tasks...');
      try
        GoogleTasks_DeleteTaskByMaster_ID(MasterID, False);
      except
        DM1.Messaggi('Levante', 'Google Tasks'#13#13'Temo di non essere riuscito a eliminare il Task.', '', [mbOk], 0, nil);
      end;
    end;
    // Goocle Calendar
    if DM1.GoogleCalendar_Enabled then
    begin
      DM1.ShowWait('', 'Sto comunicando con Google Calendar...');
      try
        GCal_DeleteEventByMaster_ID(MasterID, False);
      except
        DM1.Messaggi('Levante', 'Google Calendar'#13#13'Mi dispiace, non sono riuscito a eliminare l''evento.', '', [mbOk], 0, nil);
      end;
    end;
  finally
    // Ripristina il messaggio della wait form precedente
    if PrecWaitMsg <> '' then
      DM1.ShowWait('', PrecWaitMsg);
    // Pulizie
    Qry.Free;
  end;
  // ===========================================================================

  // Se non è già avviata una transazione la avvia
  InTransaction := DBAzienda.InTransaction;
  if not InTransaction then
    DBAzienda.StartTransaction;
  try
    try
      // Creazione dellìoggetto query
      Qry := TIB_Cursor.Create(Self);
      Qry.DatabaseName := ArcDBFile;
      Qry.IB_Connection := DBAzienda;
      // Eliminazione dell'impegno corrente
      // NB: Non uso la data perchè nell'impegno il campo ha anche l'ora mentre nel
      // documento no e questo creava problemi (tanto l'ID del documento è univoco)
      QryImp.DeleteSQL.Clear;
      QryImp.DeleteSQL.Add('DELETE FROM IMPEGNI WHERE');
      QryImp.DeleteSQL.Add('    ID = ' + IntToStr(NumeroDoc));
      // NB: Queste due righe sotto non servono a una mazza perchè
      // tanto l'ID è la chiave primaria e quindi è già univoca di suo
      // QryImp.DeleteSQL.Add('AND TIPOIMPEGNO = ''' + TipoImpegno + '''');
      // QryImp.DeleteSQL.Add('AND REGISTRO = ''' + Registro + '''');
      // Delete del record
      QryImp.Delete;
      QryImp.ApplyUpdates;
      QryImp.CommitUpdates;
      // Se si tratta di un intervento elimina anche la parte documento
      if TipoImpegno = 'Intervento' then
      begin
        // Elimina la testata del documento
        Qry.SQL.Clear;
        Qry.SQL.Add('DELETE FROM PRVORDCL WHERE');
        Qry.SQL.Add('    (TipoDocumento = ''' + TipoImpegno + ''')');
        Qry.SQL.Add('AND (Registro = ''' + Registro + ''')');
        if NumeroDoc = -9999 then
          Qry.SQL.Add('AND (NumOrdPrev IS NULL)')
        else
          Qry.SQL.Add('AND (NumOrdPrev = ' + IntToStr(NumeroDoc) + ')');
        Qry.ExecSQL;
        // Elimina i righi del documento
        Qry.SQL.Clear;
        Qry.SQL.Add('DELETE FROM RighiPrv WHERE');
        Qry.SQL.Add('    (TipoDocumento = ''' + TipoImpegno + ''')');
        Qry.SQL.Add('AND (Registro = ''' + Registro + ''')');
        if NumeroDoc = -9999 then
          Qry.SQL.Add('AND (NumOrdPrev IS NULL)')
        else
          Qry.SQL.Add('AND (NumOrdPrev = ' + IntToStr(NumeroDoc) + ')');
        Qry.ExecSQL;
        // Elimina anche i sottorighi manodopera del documento
        Qry.SQL.Clear;
        Qry.SQL.Add('DELETE FROM RAPGIORNRIGHI WHERE');
        Qry.SQL.Add('    (TIPODOC = ''' + TipoImpegno + ''')');
        Qry.SQL.Add('AND (REGISTRO = ''' + Registro + ''')');
        if NumeroDoc = -9999 then
          Qry.SQL.Add('AND (NUMDOC IS NULL)')
        else
          Qry.SQL.Add('AND (NUMDOC = ' + IntToStr(NumeroDoc) + ')');
        Qry.ExecSQL;
      end;
      // Se tutto è andato bene conferma la transazione
      if not InTransaction then
        DBAzienda.Commit;
    except
      // Se invece c'è stato un errore annula tutto
      if not InTransaction then
        DBAzienda.Rollback;
      raise;
    end;
  finally
    // Pulizie finali
    if Assigned(Qry) then
      Qry.Free;
  end;
end;

procedure TDM1.EliminaDocFisc2(TipoDoc, Registro: String; NumeroDoc: Longint; DataDoc: TDate); // Personale
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    // Elimina i righi del documento
    Qry.SQL.Add('DELETE FROM RighiPrv WHERE');
    Qry.SQL.Add('(TipoDocumento = ''' + TipoDoc + ''')');
    Qry.SQL.Add('AND (Registro = ''' + Registro + ''')');
    if NumeroDoc = -9999 then
      Qry.SQL.Add('AND (NumOrdPrev IS NULL)')
    else
      Qry.SQL.Add('AND (NumOrdPrev = ' + IntToStr(NumeroDoc) + ')');
    Qry.SQL.Add('AND (DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
    Qry.ExecSQL;

    // Elimina la testata del documento
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM PRVORDCL WHERE');
    Qry.SQL.Add('(TipoDocumento = ''' + TipoDoc + ''')');
    Qry.SQL.Add('AND (Registro = ''' + Registro + ''')');
    if NumeroDoc = -9999 then
      Qry.SQL.Add('AND (NumOrdPrev IS NULL)')
    else
      Qry.SQL.Add('AND (NumOrdPrev = ' + IntToStr(NumeroDoc) + ')');
    Qry.SQL.Add('AND (DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaRapportoGiornaliero(Qry: TIBOQuery; Registro: String; NumeroDoc: Longint; DataDoc: TDate); // Personale
var
  QryLocal: TIB_Cursor;
begin
  QryLocal := TIB_Cursor.Create(Self);
  DM1.DBAzienda.StartTransaction;
  try
    try
      QryLocal.DatabaseName := DM1.ArcDBFile;
      QryLocal.IB_Connection := DM1.DBAzienda;

      // Prima imposta la proprietà DeleteSQL della Query ricevuta come parametro
      // in modo che la Qry stessa lo possa eliminare
      Qry.DeleteSQL.Clear;
      Qry.DeleteSQL.Add('DELETE');
      Qry.DeleteSQL.Add('FROM RAPGIORN');
      Qry.DeleteSQL.Add('WHERE');
      Qry.DeleteSQL.Add('(REGISTRO = ''' + Registro + ''')');
      if NumeroDoc = -9999 then
        Qry.DeleteSQL.Add('AND (NUMDOC IS NULL)')
      else
        Qry.DeleteSQL.Add('AND (NUMDOC = ' + IntToStr(NumeroDoc) + ')');
      Qry.DeleteSQL.Add('AND (DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      // Delete del record
      Qry.Delete;
      Qry.ApplyUpdates;
      Qry.CommitUpdates;

      // Elimina i righi del documento
      QryLocal.SQL.Add('DELETE FROM RAPGIORNRIGHI WHERE');
      QryLocal.SQL.Add(' (REGISTRO = ''' + Registro + ''')');
      if NumeroDoc = -9999 then
        QryLocal.SQL.Add('AND (NUMDOC IS NULL)')
      else
        QryLocal.SQL.Add('AND (NUMDOC = ' + IntToStr(NumeroDoc) + ')');
      QryLocal.SQL.Add('AND (DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      QryLocal.ExecSQL;

      // Elimina i righi del documento
      QryLocal.SQL.Clear;
      QryLocal.SQL.Add('DELETE FROM RAPGIORNRIGHISPESE WHERE');
      QryLocal.SQL.Add(' (REGISTRO = ''' + Registro + ''')');
      if NumeroDoc = -9999 then
        QryLocal.SQL.Add('AND (NUMDOC IS NULL)')
      else
        QryLocal.SQL.Add('AND (NUMDOC = ' + IntToStr(NumeroDoc) + ')');
      QryLocal.SQL.Add('AND (DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      QryLocal.ExecSQL;

      // COmmit
      DM1.DBAzienda.Commit;
    except
      // Rollback
      DM1.DBAzienda.Rollback;
    end;
  finally
    QryLocal.Free;
  end;
end;

procedure TDM1.EliminaLDE(const Qry: TIBOQuery; const AID: Integer);
begin
  DM1.DBAzienda.StartTransaction;
  try
    Qry.DeleteSQL.Clear;
    Qry.DeleteSQL.Add('DELETE FROM LDE_DOCUMENTI WHERE ID = ' + IntToStr(AID));
    Qry.Delete;
    Qry.ApplyUpdates;
    Qry.CommitUpdates;
    DM1.DBAzienda.Commit;
  except
    DM1.DBAzienda.Rollback;
  end;
end;

procedure TDM1.EliminaConformitaOld(Qry: TIBOQuery; CodToDel: Longint; DataDoc: TDate); // Personale
var
  QryLocal: TIB_Cursor;
begin
  QryLocal := TIB_Cursor.Create(Self);
  DM1.DBAzienda.StartTransaction;
  try
    try
      // Prima imposta la proprietà DeleteSQL della Query ricevuta come parametro
      // in modo che la Qry stessa lo possa eliminare
      Qry.DeleteSQL.Clear;
      Qry.DeleteSQL.Add('DELETE');
      Qry.DeleteSQL.Add('FROM Conform');
      Qry.DeleteSQL.Add('WHERE');
      if CodToDel = -9999 then
        Qry.DeleteSQL.Add('Codice IS NULL')
      else
        Qry.DeleteSQL.Add('(Codice = ' + IntToStr(CodToDel) + ')');
      Qry.DeleteSQL.Add('AND (Data = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      // Delete del record
      Qry.Delete;
      Qry.ApplyUpdates;
      Qry.CommitUpdates;

      // Elimina anche i righi del documento
      QryLocal.DatabaseName := ArcDBFile;
      QryLocal.IB_Connection := DBAzienda;
      QryLocal.SQL.Add('DELETE');
      QryLocal.SQL.Add('FROM RighiConf');
      QryLocal.SQL.Add('WHERE');
      if CodToDel = -9999 then
        QryLocal.SQL.Add('CodiceDichiarazione IS NULL')
      else
        QryLocal.SQL.Add('(CodiceDichiarazione = ' + IntToStr(CodToDel) + ')');
      QryLocal.SQL.Add('AND (DataDichiarazione = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      QryLocal.ExecSQL;

      // Elimina anche i righi del documento
      QryLocal.SQL.Clear;
      QryLocal.SQL.Add('DELETE');
      QryLocal.SQL.Add('FROM RIGHIPRV');
      QryLocal.SQL.Add('WHERE');
      if CodToDel = -9999 then
        QryLocal.SQL.Add('NUMORDPREV IS NULL')
      else
        QryLocal.SQL.Add('(NUMORDPREV = ' + IntToStr(CodToDel) + ')');
      QryLocal.SQL.Add('AND TIPODOCUMENTO = ''Conformita''');
      QryLocal.SQL.Add('AND (DATADOCUMENTO = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      QryLocal.ExecSQL;

      DM1.DBAzienda.Commit;
    finally
      QryLocal.Free;
    end;
  except
    DM1.DBAzienda.Rollback;
  end;
end;





// procedure TDM1.CaricaRighiDocumento(DocTipo, Registro:String; DocNum:Longint; DocData:TDate);
// begin
//
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('DELETE');
// QueryJolly.SQL.Add('FROM "' + CurrDir + 'RighiVis.DB"');
// QueryJolly.ExecSQL;
//
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('INSERT');
// QueryJolly.SQL.Add('INTO "' + CurrDir + 'RighiVis.DB" (TipoDocumento, Registro, NumOrdPrev, DataDocumento, CodiceCliente,' +
// 'CodiceArticolo, Descrizione, PrezzoUnitario, QTA, ScontoRigo,' +
// 'ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,' +
// 'Selezionato, CodiceIVA, Margine, NoteRigo, MovMag, PrezzoUnitarioIVACompresa)');
// QueryJolly.SQL.Add('SELECT D1.TipoDocumento, D1.Registro, D1.NumOrdPrev, D1.DataDocumento, D1.CodiceCliente,' +
// 'D1.CodiceArticolo, D1.Descrizione, D1.PrezzoUnitario, D1.QTA, D1.ScontoRigo,' +
// 'D1.ScontoRigo2, D1.ScontoRigo3, D1.UnitaDiMisura, D1.PrezzoAcquistoArticolo,' +
// 'D1.Selezionato, D1.CodiceIVA, D1.Margine, D1.NoteRigo, D1.MovMag, D1.PrezzoUnitarioIVACompresa');
// QueryJolly.SQL.Add('FROM "' + ArcDir + 'RighiPrv.DB" D1');
// QueryJolly.SQL.Add('WHERE');
// QueryJolly.SQL.Add('    (D1.TipoDocumento = "' + DocTipo + '")');
// QueryJolly.SQL.Add('AND (D1.Registro = "' + Registro + '")');
// QueryJolly.SQL.Add('AND (D1.NumOrdPrev = ' + IntToStr(DocNum) + ')');
// QueryJolly.SQL.Add('AND (D1.DataDocumento = "' + FormatDateTime('mm/dd/yyyy', DocData) + '")');
// QueryJolly.ExecSQL;
// QueryJolly.Close;
// end;


// procedure TDM1.SalvaRighiAccorpatiInUnUnicoRigo;
// var
// TotQTA: Real;
// begin
// // Calcola il totale dei prezzi unitario e delle QTA
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('SELECT SUM(QTA) as QTA');
// QueryJolly.SQL.Add('FROM "' + CurrDir + 'RighiVis.DB"');
// QueryJolly.Sql.Add('WHERE CodiceArticolo = "'  + TableRighiDocumentoCodiceArticolo.AsString + '"');
// QueryJolly.Sql.Add('  AND Descrizione = "' + TableRighiDocumentoDescrizione.AsString + '"');
// if not TableRighiDocumentoPrezzoUnitario.IsNull then QueryJolly.Sql.Add('  AND PrezzoUnitario = ' + FloatToStrDot(TableRighiDocumentoPrezzoUnitario.AsCurrency));
// if not TableRighiDocumentoScontoRigo.IsNull     then QueryJolly.Sql.Add('  AND ScontoRigo  = ' + FloatToStrDot(TableRighiDocumentoScontoRigo.AsFLoat));
// if not TableRighiDocumentoScontoRigo2.IsNull    then QueryJolly.Sql.Add('  AND ScontoRigo2 = ' + FloatToStrDot(TableRighiDocumentoScontoRigo2.AsFLoat));
// if not TableRighiDocumentoScontoRigo3.IsNull    then QueryJolly.Sql.Add('  AND ScontoRigo3 = ' + FloatToStrDot(TableRighiDocumentoScontoRigo3.AsFLoat));
// QueryJolly.Sql.Add('  AND UnitaDiMisura = "' + TableRighiDocumentoUnitaDiMisura.AsString + '"');
// if not TableRighiDocumentoPrezzoAcquistoArticolo.IsNull then QueryJolly.Sql.Add('  AND PrezzoAcquistoArticolo = ' + FloatToStrDot(TableRighiDocumentoPrezzoAcquistoArticolo.AsCurrency));
// QueryJolly.Sql.Add('  AND Selezionato = "' + TableRighiDocumentoSelezionato.AsString + '"');
// QueryJolly.Sql.Add('  AND CodiceIVA = ' + IntToStr(TableRighiDocumentoCodiceIVA.AsInteger));
// if not TableRighiDocumentoMargine.IsNull     then QueryJolly.Sql.Add('  AND Margine  = ' + FloatToStrDot(TableRighiDocumentoMargine.AsFLoat));
// QueryJolly.Sql.Add('  AND MovMag = "' + TableRighiDocumentoMovMag.AsString + '"');
// if not TableRighiDocumentoPrezzoUnitarioIVACompresa.IsNull then QueryJolly.Sql.Add('  AND PrezzoUnitarioIVACompresa = ' + FloatToStrDot(TableRighiDocumentoPrezzoUnitarioIVACompresa.AsCurrency));
// QueryJolly.Open;
// // Assegna i totali a delle variabili di appoggio
// TotQTA            := QueryJolly.FieldByName('QTA').AsFloat;

// // Salva il rigo unico che raggruppa i righi con le stesse caratteristiche
// TableRighiPreventiviOrdini.Append;
// TableRighiPreventiviOrdiniTipoDocumento.Value                := TableRighiDocumentoTipoDocumento.Value;
// TableRighiPreventiviOrdiniRegistro.Value                     := TableRighiDocumentoRegistro.Value;
// TableRighiPreventiviOrdiniNumOrdPrev.Value                   := TableRighiDocumentoNumOrdPrev.Value;
// TableRighiPreventiviOrdiniDataDocumento.Value                := TableRighiDocumentoDataDocumento.Value;
// TableRighiPreventiviOrdiniCodiceCliente.Value                := TableRighiDocumentoCodiceCliente.Value;
// TableRighiPreventiviOrdiniCodiceArticolo.Value               := TableRighiDocumentoCodiceArticolo.Value;
// TableRighiPreventiviOrdiniDescrizione.Value                  := TableRighiDocumentoDescrizione.Value;
// if not TableRighiDocumentoPrezzoUnitario.IsNull              then TableRighiPreventiviOrdiniPrezzoUnitario.Value               := TableRighiDocumentoPrezzoUnitario.Value;
// if TotQTA > 0                                                then TableRighiPreventiviOrdiniQTA.Value                          := TotQTA;
// if not TableRighiDocumentoScontoRigo.IsNull                  then TableRighiPreventiviOrdiniScontoRigo.Value                   := TableRighiDocumentoScontoRigo.Value;
// if not TableRighiDocumentoScontoRigo2.IsNull                 then TableRighiPreventiviOrdiniScontoRigo2.Value                  := TableRighiDocumentoScontoRigo2.Value;
// if not TableRighiDocumentoScontoRigo3.IsNull                 then TableRighiPreventiviOrdiniScontoRigo3.Value                  := TableRighiDocumentoScontoRigo3.Value;
// TableRighiPreventiviOrdiniUnitaDiMisura.Value                := TableRighiDocumentoUnitaDiMisura.Value;
// if not TableRighiDocumentoPrezzoAcquistoArticolo.IsNull      then TableRighiPreventiviOrdiniPrezzoAcquistoArticolo.Value       := TableRighiDocumentoPrezzoAcquistoArticolo.Value;
// TableRighiPreventiviOrdiniSelezionato.Value                  := TableRighiDocumentoSelezionato.Value;
// TableRighiPreventiviOrdiniCodiceIVA.Value                    := TableRighiDocumentoCodiceIVA.Value;
// TableRighiPreventiviOrdiniMargine.Value                      := TableRighiDocumentoMargine.Value;
// TableRighiPreventiviOrdiniMovMag.Value                       := TableRighiDocumentoMovMag.Value;
// if not TableRighiDocumentoPrezzoUnitarioIVACompresa.IsNull   then TableRighiPreventiviOrdiniPrezzoUnitarioIVACompresa.Value    := TableRighiDocumentoPrezzoUnitarioIVACompresa.Value;
// TableRighiPreventiviOrdini.Post;

// // Elimina i righi appena salvati
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('DELETE');
// QueryJolly.SQL.Add('FROM "' + CurrDir + 'RighiVis.DB"');
// QueryJolly.Sql.Add('WHERE CodiceArticolo = "'  + TableRighiDocumentoCodiceArticolo.AsString + '"');
// QueryJolly.Sql.Add('  AND Descrizione = "' + TableRighiDocumentoDescrizione.AsString + '"');
// if not TableRighiDocumentoPrezzoUnitario.IsNull then QueryJolly.Sql.Add('  AND PrezzoUnitario = ' + FloatToStrDot(TableRighiDocumentoPrezzoUnitario.AsCurrency));
// if not TableRighiDocumentoScontoRigo.IsNull     then QueryJolly.Sql.Add('  AND ScontoRigo  = ' + FloatToStrDot(TableRighiDocumentoScontoRigo.AsFLoat));
// if not TableRighiDocumentoScontoRigo2.IsNull    then QueryJolly.Sql.Add('  AND ScontoRigo2 = ' + FloatToStrDot(TableRighiDocumentoScontoRigo2.AsFLoat));
// if not TableRighiDocumentoScontoRigo3.IsNull    then QueryJolly.Sql.Add('  AND ScontoRigo3 = ' + FloatToStrDot(TableRighiDocumentoScontoRigo3.AsFLoat));
// QueryJolly.Sql.Add('  AND UnitaDiMisura = "' + TableRighiDocumentoUnitaDiMisura.AsString + '"');
// if not TableRighiDocumentoPrezzoAcquistoArticolo.IsNull then QueryJolly.Sql.Add('  AND PrezzoAcquistoArticolo = ' + FloatToStrDot(TableRighiDocumentoPrezzoAcquistoArticolo.AsCurrency));
// QueryJolly.Sql.Add('  AND Selezionato = "' + TableRighiDocumentoSelezionato.AsString + '"');
// QueryJolly.Sql.Add('  AND CodiceIVA = ' + IntToStr(TableRighiDocumentoCodiceIVA.AsInteger));
// if not TableRighiDocumentoMargine.IsNull     then QueryJolly.Sql.Add('  AND Margine  = ' + FloatToStrDot(TableRighiDocumentoMargine.AsFLoat));
// QueryJolly.Sql.Add('  AND MovMag = "' + TableRighiDocumentoMovMag.AsString + '"');
// if not TableRighiDocumentoPrezzoUnitarioIVACompresa.IsNull then QueryJolly.Sql.Add('  AND PrezzoUnitarioIVACompresa = ' + FloatToStrDot(TableRighiDocumentoPrezzoUnitarioIVACompresa.AsCurrency));
// QueryJolly.ExecSQL;
// end;


// procedure TDM1.SalvaRighiDocumento(TipoDocumento, Registro:String; NumDoc:Longint; DocData:TDate; Soggetto:Longint; AccorpaRighi:Boolean);
// begin
// // Prima esegue una query che elimina dal file 'RighiPrv' i righi del documento
// //  di cui si devono aggiornare i righi modificati e/o aggiunti.
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('DELETE');
// QueryJolly.SQL.Add('FROM "' + ArcDir + 'RighiPrv.DB"');
// QueryJolly.SQL.Add('WHERE');
// QueryJolly.SQL.Add('    (TipoDocumento = "' + TipoDocumento + '")');
// QueryJolly.SQL.Add('AND (Registro = "' + Registro + '")');
// QueryJolly.SQL.Add('AND (NumOrdPrev = ' + IntToStr(NumDoc) + ')');
// QueryJolly.SQL.Add('AND (DataDocumento = "' + FormatDateTime('mm/dd/yyyy', DocData) + '")');
// QueryJolly.Prepare;
// QueryJolly.ExecSQL;
// // Poi esegue una query che assegna ai righi del documento temporanei
// //  il tipo e il numero documento.
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('UPDATE "' + CurrDir + 'RighiVis.DB"');
// QueryJolly.SQL.Add('SET TipoDocumento = "' + TipoDocumento + '", Registro = "' + Registro + '", NumOrdPrev = ' + IntToStr(NumDoc) + ', DataDocumento = "' + FormatDateTime('mm/dd/yyyy', DocData) + '", CodiceCliente = ' + IntToStr(Soggetto));
// QueryJolly.Prepare;
// QueryJolly.ExecSQL;
// // Se non è abilitato l'accorpamento dei righi salva tutto in colpo
// if not AccorpaRighi then begin
// // Poi esegue una query che copia sul file 'RighiPrv' i righi del documento
// //  modificati e/o aggiunti.
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('INSERT');
// QueryJolly.SQL.Add('INTO "' + ArcDir + 'RighiPrv.DB" (TipoDocumento, Registro, NumOrdPrev, DataDocumento, CodiceCliente,' +
// 'CodiceArticolo, Descrizione, PrezzoUnitario, QTA, ScontoRigo,' +
// 'ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,' +
// 'Selezionato, CodiceIVA, Margine, NoteRigo, MovMag, PrezzoUnitarioIVACompresa)');
// QueryJolly.SQL.Add('SELECT D1.TipoDocumento, D1.Registro, D1.NumOrdPrev, D1.DataDocumento, D1.CodiceCliente,' +
// 'D1.CodiceArticolo, D1.Descrizione, D1.PrezzoUnitario, D1.QTA, D1.ScontoRigo,' +
// 'D1.ScontoRigo2, D1.ScontoRigo3, D1.UnitaDiMisura, D1.PrezzoAcquistoArticolo,' +
// 'D1.Selezionato, D1.CodiceIVA, D1.Margine, D1.NoteRigo, D1.MovMag, D1.PrezzoUnitarioIVACompresa');
// QueryJolly.SQL.Add('FROM "' + CurrDir + 'RighiVis.DB" D1');
// QueryJolly.Prepare;
// QueryJolly.ExecSQL;
// QueryJolly.Close;
// // Se invece è attivo l'accorpamento dei righi...
// end else begin
// // Salva i righi dei riferimenti ai documenti in modo che siano i primi del documento
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('INSERT');
// QueryJolly.SQL.Add('INTO "' + ArcDir + 'RighiPrv.DB" (TipoDocumento, Registro, NumOrdPrev, DataDocumento, CodiceCliente,' +
// 'CodiceArticolo, Descrizione, PrezzoUnitario, QTA, ScontoRigo,' +
// 'ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,' +
// 'Selezionato, CodiceIVA, Margine, NoteRigo, MovMag, PrezzoUnitarioIVACompresa)');
// QueryJolly.SQL.Add('SELECT D1.TipoDocumento, D1.Registro, D1.NumOrdPrev, D1.DataDocumento, D1.CodiceCliente,' +
// 'D1.CodiceArticolo, D1.Descrizione, D1.PrezzoUnitario, D1.QTA, D1.ScontoRigo,' +
// 'D1.ScontoRigo2, D1.ScontoRigo3, D1.UnitaDiMisura, D1.PrezzoAcquistoArticolo,' +
// 'D1.Selezionato, D1.CodiceIVA, D1.Margine, D1.NoteRigo, D1.MovMag, D1.PrezzoUnitarioIVACompresa');
// QueryJolly.SQL.Add('FROM "' + CurrDir + 'RighiVis.DB" D1');
// QueryJolly.SQL.Add('WHERE CodiceIVA = -9');
// QueryJolly.ExecSQL;
// QueryJolly.Close;
// // Elimina i righi dei riferimenti appena salvati
// QueryJolly.Close;
// QueryJolly.SQL.Clear;
// QueryJolly.SQL.Add('DELETE');
// QueryJolly.SQL.Add('FROM "' + CurrDir + 'RighiVis.DB"');
// QueryJolly.Sql.Add('WHERE CodiceIVA = -9');
// QueryJolly.ExecSQL;
// // Si posiziona sul primo rigo
// TableRighiDocumento.First;
// // Cicla finchè ci sono righi da salvare
// while not TableRighiDocumento.Eof do begin
// // Richiama la procedura che salva il rigo corrente insieme a tutti gli altri righi che hanno lo stesso
// //  codice articolo, PrezzoUnitario, Sconti 1,2 e 3 e COdice IVA accorpandoli in un unico rigo.
// SalvaRighiAccorpatiInUnUnicoRigo;
// // Si posiziona sul primo rigo
// TableRighiDocumento.First;
// end;
// // Ricarica i righi del documento per aggiornare lo schermo che altrimenti appare vuoto in quanto i righi di RighiVis.db sono
// //  stati eliminati durante l'operazione di salvataggio con accorpamento.
// PreventiviOrdiniForm.CaricaRighiDocumento(TipoDocumento, Registro, NumDoc, DocData);
// end;
// end;

function TDM1.ControllaDataStr(Data: String): Boolean; // Personale
begin
  // Controlla la data e ritorna 'True' se la data è valida, altrimenti 'False'.
  // e che la data non sia nulla (Length >= 8).
  if Length(Trim(Data)) >= 8 then
  begin
    try
      StrToDate(Data);
      Result := True;
    except
      Result := False;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

procedure TDM1.CopySQLWhereCondition(Source, Dest: TStrings);
var
  i, WhereLineNumber: Integer;
begin
  // Questa funzione effettua una copia della clausola WHERE da una query sorgente
  // a una query destinazione.
  // NB: Requisito fondamentale per il corretto funzionamento è che la parola WHERE
  // deve essere inserita all'inizio della riga in cui si trova.
  // --------------------------------------------------------------------------------
  // Cicla per tutte le righe alla ricerca della riga che contiene la clausola WHERE
  i := 0;
  while (i < Source.Count) and (Uppercase(StrLeft(Source[i], 5)) <> 'WHERE') do
    Inc(i, 1);
  // Se la clausola WHERE è stata effettivamente trovata...
  if i < Source.Count then
  begin
    // Assegna l'indice delle riga che contiene la clausola WHERE
    WhereLineNumber := i;
    // CIcla per effettuare la copia di tutte le condizioni inserite dopo la clausola WHERE
    for i := WhereLineNumber to Source.Count - 1 do
    begin
      // Controlla che la riga non contenga la clausola ORDER, altrimenti la evita
      // Controlla che la riga non contenga la clausola UNION ALL, altrimenti la evita
      // Controlla che la riga non contenga la clausola GROUP BY, altrimenti la evita
      if (Uppercase(StrLeft(Source[i], 5)) <> 'ORDER') and (Uppercase(StrLeft(Source[i], 9)) <> 'UNION ALL') and (Uppercase(StrLeft(Source[i], 8)) <> 'GROUP BY')
      then
      begin
        // Copia la rica corrente
        Dest.Add(Source[i]);
      end
      else
      begin
        // Altrimento finisce quì
        Break;
      end;
    end;
  end;
end;

procedure TDM1.AddSQL(Qry: TIBOQuery; AndOr, Linea: String); // Personale
begin
  // Controlla se la clausola WHERE è già stata inserita e se non lo è la inserisce
  if WhereExists(Qry.SQL) = -1 then
    Qry.SQL.Add('WHERE');
  // Se l'ultima linea contiene il WHERE alla fine allora non mette
  // l'AND prima della condizione da inserire altrimenti lo mette;
  if not(Trim(Uppercase(RightStr(Qry.SQL[Qry.SQL.Count - 1], 5))) = 'WHERE') then
    Linea := AndOr + ' ' + Linea;
  // Aggiunge la linea così ottenuta
  Qry.SQL.Add(Linea);
end;

procedure TDM1.AddSQLToIB_Cursor(Qry: TIB_Cursor; AndOr, Linea: String); // Personale
begin
  // Controlla se la clausola WHERE è già stata inserita e se non lo è la inserisce
  if WhereExists(Qry.SQL) = -1 then
    Qry.SQL.Add('WHERE');
  // Se l'ultima linea contiene il WHERE alla fine allora non mette
  // l'AND prima della condizione da inserire altrimenti lo mette;
  if not(Trim(Uppercase(RightStr(Qry.SQL[Qry.SQL.Count - 1], 5))) = 'WHERE') then
    Linea := AndOr + ' ' + Linea;
  // Aggiunge la linea così ottenuta
  Qry.SQL.Add(Linea);
end;

procedure TDM1.AddSQLToIB_Query(Qry: TIB_Query; AndOr, Linea: String); // Personale
begin
  // Controlla se la clausola WHERE è già stata inserita e se non lo è la inserisce
  if WhereExists(Qry.SQL) = -1 then
    Qry.SQL.Add('WHERE');
  // Se l'ultima linea contiene il WHERE alla fine allora non mette
  // l'AND prima della condizione da inserire altrimenti lo mette;
  if not(Trim(Uppercase(RightStr(Qry.SQL[Qry.SQL.Count - 1], 5))) = 'WHERE') then
    Linea := AndOr + ' ' + Linea;
  // Aggiunge la linea così ottenuta
  Qry.SQL.Add(Linea);
end;

function TDM1.NextProtocolloDocFisc(const DataDoc: TDate; const DataRifFieldName: String): Longint;
var
  Qry: TIB_Cursor;
  AA, MM, GG: Word;
  CondizioneTipoDoc: String;
begin
  // Query che restituirà l'ultimo numero usato
  Qry := TIB_Cursor.Create(Self);
  try
    // Recupera l'anno in corso
    DecodeDate(DataDoc, AA, MM, GG);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MAX(PROTOCOLLO) AS LASTCODICE FROM PRVORDCL');
    Qry.SQL.Add('WHERE');
    Qry.SQL.Add(DataRifFieldName + ' >= ''01/01/' + IntToStr(AA) + '''');
    Qry.SQL.Add('AND ' + DataRifFieldName + ' <= ''12/31/' + IntToStr(AA) + '''');
    Qry.Open;
    Result := Qry.FieldByName('LASTCODICE').AsInteger + 1;
    // Se il risultato <= 0 restituisce comunque 1
    if Result <= 0 then
      Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.NextNumDocFisc(TipoDoc, Registro: String; DataDoc: TDate; ProgressivoInfinito: Boolean): Longint;
var
  Qry: TIB_Cursor;
  AA, MM, GG: Word;
  CondizioneTipoDoc: String;
begin
  // Costruisce su questa variabile la condizione che fa in modo che la
  // numerazione delle fatture e delle note di credito possano essere unite
  // o separate.
  if ((TipoDoc = 'Fattura') or (TipoDoc = 'Nota_accre')) and (DM1.TableProgressiviSTESSANUMERAZFATTNOTECRED.AsString = 'T') then
    CondizioneTipoDoc := '(TIPODOCUMENTO = ''Fattura''   OR   TIPODOCUMENTO = ''Nota_accre'')'
  else
    CondizioneTipoDoc := '(TIPODOCUMENTO = ''' + TipoDoc + ''')';
  // Query che restituirà l'ultimo numero usato
  Qry := TIB_Cursor.Create(Self);
  try
    // Recupera l'anno in corso
    DecodeDate(DataDoc, AA, MM, GG);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MAX(NUMORDPREV) AS LASTCODICE FROM PRVORDCL');
    Qry.SQL.Add('WHERE');
    Qry.SQL.Add(CondizioneTipoDoc);
    Qry.SQL.Add('AND REGISTRO = ''' + Registro + '''');
    // Se è attivato il progressivo infinito non aggiunge la condizione che filtra per
    // l'anno in corso.
    if not ProgressivoInfinito then
    begin
      Qry.SQL.Add('AND DATADOCUMENTO >= ''01/01/' + IntToStr(AA) + '''');
      Qry.SQL.Add('AND DATADOCUMENTO <= ''12/31/' + IntToStr(AA) + '''');
    end;
    // Qry.SQL.SaveToFile('c:\sql.sql');
    Qry.Open;
    Result := Qry.FieldByName('LASTCODICE').AsInteger + 1;
    // Se il risultato <= 0 restituisce comunque 1
    if Result <= 0 then
      Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

// Variante della funzione NextNumDocFisc da utilizzare quanso è abilitata la gestione
// delle versioni multiple di uno stesso documento.
function TDM1.NextNumDocFisc_GestVerDoc(TipoDoc: String; DataDoc: TDate): Longint;
var
  Qry: TIB_Cursor;
  CondizioneTipoDoc: String;
begin
  // Costruisce su questa variabile la condizione che fa in modo che la
  // numerazione delle fatture e delle note di credito possano essere unite
  // o separate.
  if ((TipoDoc = 'Fattura') or (TipoDoc = 'Nota_accre')) and (DM1.TableProgressiviSTESSANUMERAZFATTNOTECRED.AsString = 'T') then
    CondizioneTipoDoc := '(TIPODOCUMENTO = ''Fattura''   OR   TIPODOCUMENTO = ''Nota_accre'')'
  else
    CondizioneTipoDoc := '(TIPODOCUMENTO = ''' + TipoDoc + ''')';
  // Query che restituirà l'ultimo numero usato
  Qry := TIB_Cursor.Create(Self);
  try
    // IMposta la query
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MAX(NUMORDPREV) AS LASTCODICE FROM PRVORDCL');
    Qry.SQL.Add('WHERE');
    Qry.SQL.Add(CondizioneTipoDoc);
    Qry.SQL.Add('AND REGISTRO LIKE ' + QuotedStr(FormatDateTime('yy', DataDoc) + '.%'));
    // Qry.SQL.SaveToFile('c:\sql.sql');
    Qry.Open;
    Result := Qry.FieldByName('LASTCODICE').AsInteger + 1;
    // Se il risultato <= 0 restituisce comunque 1
    if Result <= 0 then
      Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.NextNumRegistroData(Tabella, Campo, CampoData, Registro: String; DataDoc: TDate): Integer;
var
  Qry: TIB_Cursor;
  AA, MM, GG: Word;
begin
  // Query che restituirà l'ultimo numero usato
  Qry := TIB_Cursor.Create(Self);
  try
    // Recupera l'anno in corso
    DecodeDate(DataDoc, AA, MM, GG);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MAX(' + Campo + ') AS LASTCODICE FROM ' + Tabella);
    Qry.SQL.Add('WHERE REGISTRO = ''' + Registro + '''');
    Qry.SQL.Add('AND ' + CampoData + ' >= ''01/01/' + IntToStr(AA) + '''');
    Qry.SQL.Add('AND ' + CampoData + ' <= ''12/31/' + IntToStr(AA) + '''');
    Qry.Open;
    Result := Qry.FieldByName('LASTCODICE').AsInteger + 1;
    // Se il risultato <= 0 restituisce comunque 1
    if Result <= 0 then
      Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.NextNumData(Tabella, Campo, CampoData: String; DataDoc: TDate): Integer;
var
  Qry: TIB_Cursor;
  AA, MM, GG: Word;
begin
  // Query che restituirà l'ultimo numero usato
  Qry := TIB_Cursor.Create(Self);
  try
    // Recupera l'anno in corso
    DecodeDate(DataDoc, AA, MM, GG);
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT MAX(' + Campo + ') AS LASTCODICE FROM ' + Tabella);
    Qry.SQL.Add('WHERE');
    Qry.SQL.Add(CampoData + ' >= ''01/01/' + IntToStr(AA) + '''');
    Qry.SQL.Add('AND ' + CampoData + ' <= ''12/31/' + IntToStr(AA) + '''');
    Qry.Open;
    Result := Qry.FieldByName('LASTCODICE').AsInteger + 1;
    // Se il risultato <= 0 restituisce comunque 1
    if Result <= 0 then
      Result := 1;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TDM1.RecordSelezionati(Qry: TIB_Query; var BS: TStrings): TStrings;
begin
  // Carica la lista dei records selezionati
  Qry.SelectedBookmarks(BS);
  // Se non vi sono records selezionati aggiunge il record corrente
  if BS.Count = 0 then
    BS.Add(Qry.Bookmark);
end;

{
  procedure TDM1.ForEachRowEsportaDocumentoSelezionato(ARowIndex: Integer; ARowInfo: TcxRowInfo);
  var
  DocNum:Longint;
  DocType, Registro:String;
  DocDate:TDate;
  begin
  with ClientiForm.tvDoc do begin
  if ARowInfo.Level <> DataController.Groups.GroupingItemCount then Exit;
  // Assegna il tipo, numero, data e registro del documento a delle variabili locali per comodità successiva
  DocType       := DataController.Values[ARowInfo.RecordIndex, GetColumnByFieldName('TIPODOC').Index];
  DocDate       := DataController.Values[ARowInfo.RecordIndex, GetColumnByFieldName('DATADOC').Index];
  Registro      := DataController.Values[ARowInfo.RecordIndex, GetColumnByFieldName('REGISTRO').Index];
  DocNum        := DataController.Values[ARowInfo.RecordIndex, GetColumnByFieldName('CODICEDOC').Index];
  //    DocType       := DataController.Values[ARowInfo.RecordIndex, GetColumnByFieldName('TIPODOC').Index];
  //    DocDate       := DataController.Values[ARowInfo.RecordIndex, GetColumnByFieldName('DATADOC').Index];
  //    Registro      := DataController.Values[ARowInfo.RecordIndex, GetColumnByFieldName('REGISTRO').Index];
  //    DocNum        := DataController.Values[ARowInfo.RecordIndex, GetColumnByFieldName('CODICEDOC').Index];
  end;
  ShowWait('Bacheca', 'Esportazione ' + DocType + ' N° ' + IntToStr(DocNum) + ' del '  + DateToStr(DocDate));
  // Visto che si sta esportando un intero documento, prima elimina tutti i righi esportati
  //  dello stesso documento, in modo da evitare duplicati.
  EliminaExpDoc(DocType, Registro, DocNum, DocDate);
  // Se si tratta di una Ricevuta fiscale richiama la procedura di esportazione
  //  delle Ricevute Fiscali (che è particolare), altrimenti la procedura normale.
  if DocType = 'Ricev.fisc' then begin
  DM1.EsportaRicevutaFiscale(DocType, Registro, DocNum, DocDate);
  // Se si tratta di una dichiarazione di onformità...
  end else if DocType = 'Conformita' then begin
  DM1.EsportaConformita(DocNum, DocDate);
  end else begin
  // Se l'utente stà tenendo premuto il tasto SHIFT esporta solo il riferimento al documento
  //  (1 per ogni aliquota IVA) senza righi, altrimenti esegue l'esportazione normale
  if (Windows.GetKeyState(VK_SHIFT) < 0) then DM1.EsportaSoloRifDocFisc(DocType, Registro, DocNum, DocDate)
  else DM1.EsportaDocFisc(DocType, Registro, DocNum, DocDate);
  end;
  end;

  procedure TDM1.EsportaDocFiscSelezionati;     // Personale
  begin
  // Copia tutti righi da esportare nel file 'TmpRighi' da dove, in seguito,
  //  potranno essere importati in nuovi documenti con il relativo riferimento.
  //  Copia solo i righi dei documenti specificati dal parametro ricevuto
  //  dal chiamante (ListaDoc).
  ShowWait('Bacheca', 'Esportazione...');
  try
  DBAzienda.StartTransaction;
  try
  ClientiForm.tvDoc.BeginUpdate;
  ClientiForm.tvDoc.DataController.ForEachRow(True, ForEachRowEsportaDocumentoSelezionato);
  DBAzienda.Commit;
  except
  DBAzienda.Rollback;
  end;
  finally
  CloseWait;
  ClientiForm.tvDoc.EndUpdate;
  end;
  end;
}
{
  procedure TDM1.EsportaDocFiscSelezionati;     // Personale
  var
  i, SelRec, DocNum:Longint;
  DocType, Registro:String;
  DocDate:TDate;
  begin
  // Copia tutti righi da esportare nel file 'TmpRighi' da dove, in seguito,
  //  potranno essere importati in nuovi documenti con il relativo riferimento.
  //  Copia solo i righi dei documenti specificati dal parametro ricevuto
  //  dal chiamante (ListaDoc).
  Attendere;
  try
  ClientiForm.tvDoc.BeginUpdate;
  // SelRec contiene il numeero di records selezionati
  SelRec := ClientiForm.tvDoc.Controller.SelectedRecordCount;
  // Ovviamente procede solo se vi sono documenti selezionati
  if SelRec > 0 then begin
  // Cicla per tutti i documenti selezionati e li esporta
  for i := 0 to SelRec-1 do begin
  // Focus sul record attuale
  // *** Vecchia versione ***
  //            ClientiForm.tvDoc.Controller.SelectedRecords[i].Focused := True;
  // Assegna il tipo, numero, data e registro del documento a delle variabili locali per comodità successiva
  DocType       := ClientiForm.tvDoc.Controller.SelectedRecords[i].Values[ClientiForm.tvDoc.GetColumnByFieldName('TIPODOC').Index];
  DocDate       := ClientiForm.tvDoc.Controller.SelectedRecords[i].Values[ClientiForm.tvDoc.GetColumnByFieldName('DATADOC').Index];
  Registro      := ClientiForm.tvDoc.Controller.SelectedRecords[i].Values[ClientiForm.tvDoc.GetColumnByFieldName('REGISTRO').Index];
  DocNum        := ClientiForm.tvDoc.Controller.SelectedRecords[i].Values[ClientiForm.tvDoc.GetColumnByFieldName('CODICEDOC').Index];
  // *** Vecchia versione ***
  //            DocType       := ClientiForm.tvDoc.Controller.FocusedRow.Values[ClientiForm.tvDoc.GetColumnByFieldName('TIPODOC').Index];
  //            DocDate       := ClientiForm.tvDoc.Controller.FocusedRow.Values[ClientiForm.tvDoc.GetColumnByFieldName('DATADOC').Index];
  //            Registro      := ClientiForm.tvDoc.Controller.FocusedRow.Values[ClientiForm.tvDoc.GetColumnByFieldName('REGISTRO').Index];
  //            DocNum        := ClientiForm.tvDoc.Controller.FocusedRow.Values[ClientiForm.tvDoc.GetColumnByFieldName('CODICEDOC').Index];
  // Visto che si sta esportando un intero documento, prima elimina tutti i righi esportati
  //  dello stesso documento, in modo da evitare duplicati.
  //            EliminaExpDoc(DocType, Registro, DocNum, DocDate);
  // Se si tratta di una Ricevuta fiscale richiama la procedura di esportazione
  //  delle Ricevute Fiscali (che è particolare), altrimenti la procedura normale.
  if DocType = 'Ricev.fisc' then begin
  //               DM1.EsportaRicevutaFiscale(DocType, Registro, DocNum, DocDate);
  // Se si tratta di una dichiarazione di onformità...
  end else if DocType = 'Conformita' then begin
  //               DM1.EsportaConformita(DocNum, DocDate);
  end else begin
  // Se l'utente stà tenendo premuto il tasto SHIFT esporta solo il riferimento al documento
  //  (1 per ogni aliquota IVA) senza righi, altrimenti esegue l'esportazione normale
  //               if (Windows.GetKeyState(VK_SHIFT) < 0) then DM1.EsportaSoloRifDocFisc(DocType, Registro, DocNum, DocDate)
  //               else DM1.EsportaDocFisc(DocType, Registro, DocNum, DocDate);
  end;
  end;
  // Se non ci sono documenti selezionati visualizza un messaggio che spiega la situazione
  end else begin
  MessageBeep(0);
  MessageDlg('Non ci sono documenti selezionati.', mtInformation, [mbOk], 0);
  end;
  finally
  ChiudiAttendere;
  ClientiForm.tvDoc.EndUpdate;
  end;
  end;
}
procedure TDM1.EsportaDocFiscSelezionati; // Personale
var
  i, DocNum, DocID, RecIdx, RecID: Integer;
  DocType, Registro: String;
  DocDate: TDate;
  DS: TDataSet;
  DocIsLDE: Boolean;
begin
  with ClientiForm.tvDoc do
  begin
    DS := DataController.DataSet;
    ShowWait('Bacheca', 'Esportazione...');
    BeginUpdate;
    try
      DBAzienda.StartTransaction;
      try
        for i := 0 to DataController.GetSelectedCount - 1 do
        begin
          // Si posiziona sul record
          Controller.SelectedRecords[i].Focused := True;
          // Assegna il tipo, numero, data e registro del documento a delle variabili locali per comodità successiva
          DocType := DS.FieldByName('TIPODOC').Value;
          DocDate := DS.FieldByName('DATADOC').Value;
          Registro := DS.FieldByName('REGISTRO').Value;
          DocNum := DS.FieldByName('CODICEDOC').Value;
          DocID := DS.FieldByName('ID').AsInteger;
          DocIsLDE := DS.FieldByName('IS_LDE').AsString = 'T';
          ShowWait('Bacheca', 'Esportazione ' + DocType + ' N° ' + IntToStr(DocNum) + ' del ' + DateToStr(DocDate));
          // Visto che si sta esportando un intero documento, prima elimina tutti i righi esportati
          // dello stesso documento, in modo da evitare duplicati.
          EliminaExpDoc(DocType, Registro, DocNum, DocDate);
          // Se si tratta di un LDE
          if DocIsLDE then
            DM1.EsportaLDE(DocType, DocID, DocNum, Registro, DocDate)
            // Se si tratta di una Ricevuta fiscale richiama la procedura di esportazione
            // delle Ricevute Fiscali (che è particolare), altrimenti la procedura normale.
          else if (DocType = 'Ricev.fisc') and (DM1.fEsportazioneRicFiscNoPag) then
            DM1.EsportaRicevutaFiscale(DocType, Registro, DocNum, DocDate)
            // Se si tratta di una Conformità (VECCHIA)
          else if DocType = 'Conformita' then
            DM1.EsportaConformita(DocNum, Registro, DocDate)
            // Altrimenti è un documento normale
          else
          begin
            // Se l'utente stà tenendo premuto il tasto SHIFT esporta solo il riferimento al documento
            // (1 per ogni aliquota IVA) senza righi, altrimenti esegue l'esportazione normale
            if (Windows.GetKeyState(VK_SHIFT) < 0) then
              DM1.EsportaSoloRifDocFisc(DocType, Registro, DocNum, DocDate)
            else
              DM1.EsportaDocFisc(DocType, Registro, DocNum, DocDate);
          end;
        end;
        DBAzienda.Commit;
      except
        DBAzienda.Rollback;
      end;
    finally
      CloseWait;
      EndUpdate;
    end;
  end;
end;

procedure TDM1.EsportaImpegniSelezionati; // Personale
var
  i, SelRec: Longint;
  IDImpegno: Integer;
  DataChiamata, DataIntervento: TDateTime;
  TipoImpegno, Registro: String;
begin
  // Copia tutti righi da esportare nel file 'TmpRighi' da dove, in seguito,
  // potranno essere importati in nuovi documenti con il relativo riferimento.
  // Copia solo i righi dei documenti specificati dal parametro ricevuto
  // dal chiamante (ListaDoc).
  Attendere;
  try
    // SelRec contiene il numeero di records selezionati
    SelRec := ClientiForm.tvImpegni.Controller.SelectedRecordCount;
    // Ovviamente procede solo se vi sono documenti selezionati
    if SelRec > 0 then
    begin
      // Cicla per tutti i documenti selezionati e li esporta
      for i := 0 to SelRec - 1 do
      begin
        // Focus sul record attuale
        ClientiForm.tvImpegni.Controller.SelectedRecords[i].Focused := True;
        // Assegna il tipo, numero, data e registro del documento a delle variabili locali per comodità successiva
        TipoImpegno := ClientiForm.tvImpegni.Controller.FocusedRow.Values[ClientiForm.tvImpegni.GetColumnByFieldName('TIPOIMPEGNO').Index];
        IDImpegno := ClientiForm.tvImpegni.Controller.FocusedRow.Values[ClientiForm.tvImpegni.GetColumnByFieldName('ID').Index];
        DataChiamata := ClientiForm.tvImpegni.Controller.FocusedRow.Values[ClientiForm.tvImpegni.GetColumnByFieldName('DATAORACHIAMATA').Index];
        Registro := ClientiForm.tvImpegni.Controller.FocusedRow.Values[ClientiForm.tvImpegni.GetColumnByFieldName('REGISTRO').Index];
        // Se è un intervento...
        if TipoImpegno = 'Intervento' then
        begin
          DataIntervento := ClientiForm.tvImpegni.Controller.FocusedRow.Values[ClientiForm.tvImpegni.GetColumnByFieldName('DATAORAINTERVENTO').Index];
          EsportaDocFisc(TipoImpegno, Registro, IDImpegno, DataIntervento);
        end
        // Se invece è una chiamata/appuntamento
        else
          DM2.EsportaChiamataAppuntamentoInBacheca(IDImpegno);
      end;
      // Se non ci sono documenti selezionati visualizza un messaggio che spiega la situazione
    end
    else
    begin
      raise Exception.Create('Non ci sono voci selezionate.');
    end;
  finally
    ChiudiAttendere;
  end;
end;

// Funzione che ritorna una descrizione articolo di un rigo manodopera aggiungendogli
// anche le note di tutti gli eventuali sottorighi presenti.
function TDM1.AggiungiNoteSottorighiManodopera(MasterDesc: String; TipoDoc: String; NumDoc: Integer; RegDoc: String; DateDoc: TDate; NumRigo: Integer): String;
var
  Qry: TIB_Cursor;
begin
  // Inizializzazione
  Result := MasterDesc;
  Qry := TIB_Cursor.Create(Self);
  try
    // Impostazione query
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    {
      // =========================================================================
      // ESPORTAZIONE RELAZIONE INTERVENTO
      // -------------------------------------------------------------------------
      // Se il documento è un Intervento, esporta anche l'eventuale
      //  relazione di intervento...
      if TipoDoc = 'Intervento' then begin
      // Imposta la query che preòeverà la relazione dell'intervento
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT RELAZIONEINTERVENTO FROM IMPEGNI WHERE ID=' + IntToStr(NumDoc));
      Qry.Open;
      // Se ha trovato il documento e se il campo non è nullo o vuoto, aggiunge la relazione
      //  alla descrizione del rigo.
      if (not Qry.Eof) and (not Qry.FieldByName('RELAZIONEINTERVENTO').IsNull) and (Trim(Qry.FieldByName('RELAZIONEINTERVENTO').AsString) <> '') then begin
      Result := Result + #13'- ' + Trim(Qry.FieldByName('RELAZIONEINTERVENTO').AsString);
      end;
      Qry.Close;
      end;
      // =========================================================================
    }
    // =========================================================================
    // ESPORTAZIONE NOTE SUI RIGHI DI MANODOPERA RAPPGIORN
    // -------------------------------------------------------------------------
    // Imposta la query che preleverà tutti i sottorighi di manodopera
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT CODDIPENDENTE, NOTE FROM RAPGIORNRIGHI WHERE');
    Qry.SQL.Add('  TIPODOC = ''' + TipoDoc + '''');
    Qry.SQL.Add('  AND NUMDOC = ' + IntToStr(NumDoc));
    Qry.SQL.Add('  AND REGISTRO = ''' + RegDoc + '''');
    Qry.SQL.Add('  AND DATADOC = ''' + FormatDateTime('mm/dd/yyyy', DateDoc) + '''');
    Qry.SQL.Add('  AND NUMRIGO = ' + IntToStr(NumRigo));
    Qry.Open;
    // Cicla per tutti i sottorighi trovati
    while not Qry.Eof do
    begin
      // Se il rigo attuale non è il sottorigo di default obbligatrio
      // e il campo NOTE non è nullo o vuoto provvede ad aggiungere
      // le note del rigo attuale alla descrizione del rigo principale.
      if (Qry.FieldByName('CODDIPENDENTE').AsInteger <> -1) and (Trim(Qry.FieldByName('NOTE').AsString) <> '') then
      begin
        Result := Result + #13'- ' + Trim(Qry.FieldByName('NOTE').AsString);
      end;
      // Avanti il prossimo
      Qry.Next;
    end;
    Qry.Close;
    // =========================================================================
  finally
    Qry.Free;
  end;
end;

// Oassandogli un codice articolo ritorna l'indice della relatica manodopera
// altrimenti -1
function TDM1.CodiceToIndexManodopera(Codice: String): Integer;
var
  i: Integer;
begin
  Result := -1;
  Codice := Trim(Codice);
  for i := 0 to Length(Manodopera) - 1 do
  begin
    if Codice = Manodopera[i].Codice then
    begin
      Result := i;
      Break;
    end;
  end;
end;

// Passandogli un codice articolo ritorna True se è un codice di manodopera
function TDM1.CodiceIsManodopera(Codice: Variant): Boolean;
begin
  Result := (not VarIsNull(Codice)) and (CodiceToIndexManodopera(Codice) <> -1);
end;

procedure TDM1.EsportaDocFisc(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate); // Personale
var
  QryIn, QryOut: TIB_Cursor;
  PrecImportExportValue: String;
  Descrizione, ExtraRif: String;
begin
  // Crea la query che preleva i righi del documento da esportare dall'archivio dei righidoc dell'azienda
  QryIn := TIB_Cursor.Create(Self);
  QryIn.DatabaseName := DM1.ArcDBFile;
  QryIn.IB_Connection := DM1.DBAzienda;
  // Crea la query che inserisce i righi del documento da esportare dall'archivio temporaneo dei righi esportati
  QryOut := TIB_Cursor.Create(Self);
  QryOut.DatabaseName := DM1.GenDBFile;
  QryOut.IB_Connection := DM1.DBGenerale;
  try
    try
      // Solo se è un documento esportabile
      if (TipoDoc = 'Preventivo') or (TipoDoc = 'Ordine') or (TipoDoc = 'S.A.L.') or (TipoDoc = 'D.D.T.') or (TipoDoc = 'Fattura') or (TipoDoc = 'Nota_accre')
        or (TipoDoc = 'Ord.fornit') or (TipoDoc = 'Bolla_entr') or (TipoDoc = 'Fatt.acqui') or (TipoDoc = 'Ricev.fisc') or (TipoDoc = 'Fatt.R.F.') or
        (TipoDoc = 'Buono_cons') or (TipoDoc = 'N.C.fornit') or (TipoDoc = 'Intervento') or (TipoDoc = 'Commessa') or (TipoDoc = 'Carico_cantiere') or
        (TipoDoc = 'Scarico_cantiere') or (TipoDoc = 'Estratto_conto') then
      begin
        // Crea la query per l'inserimento dei righi del documento da esportare direttamente
        // nel file dei righi esportati (TmpRighi).
        QryIn.SQL.Add
          ('SELECT D1.TipoDocumento, D1.TipoDocumentoEsteso, D1.Registro, D1.NumOrdPrev, D1.DataDocumento, D2.ProgRigo, D2.ProgRigo2, D1.CodiceCliente, D2.CodiceArticolo, D2.CodiceArticoloStm, D2.Descrizione, D2.PrezzoUnitario, D2.QTA, D2.ScontoRigo, D2.ScontoRigo2,');
        QryIn.SQL.Add
          (' D2.ScontoRigo3, D2.UnitaDiMisura, D2.PrezzoAcquistoArticolo, D2.CodiceIVA, D2.DescrizioneIVA, D2.AliquotaIVA, D2.Margine, D2.ImportoMargine, D2.NoteRigo, D1.Pratica, D1.DataPratica1, D1.SegnoOperazione AS MOVMAG,');
        QryIn.SQL.Add
          (' D2.PrezzoUnitarioIVACompresa, D2.QtaOpera, D2.CodiceMagazzino, D2.CodiceMagazzino2, D1.SELEZIONATO, D2.MINUTIPREVISTI, D2.Tipo1, D2.Tipo2, D2.Tipo3, D2.Tipo4, D2.Tipo5, D2.Tipo6,');
        QryIn.SQL.Add(' D2.SOTTOCANTIERE1, D2.SOTTOCANTIERE2, D2.SOTTOCANTIERE3, D2.SOTTOCANTIERE4, D2.SOTTOCANTIERE5, D2.SOTTOCANTIERE6,');
        QryIn.SQL.Add(' D2.GUID, D2.GUID_REF, D1.RAGSOCCLI, D1.SUBSOGGCAMPO1, D1.SUBSOGGCAMPO2, D1.SUBSOGGCAMPO3, P.DESCRIZIONE AS DESCPRATICA,');
        QryIn.SQL.Add
          (' D1.RifDoc_Tipo, D1.RifDoc_Num, D1.RifDoc_Reg, D1.RifDoc_Data, D1.RifDoc_CorrispNoPag, D2.RowType, D2.RowSection, D2.RowPrintPrices, D2.PrezzoUnitarioAutocalc, I.RDA');
        QryIn.SQL.Add('FROM PrvOrdCl D1');
        QryIn.SQL.Add
          ('LEFT JOIN RIGHIPRV D2 ON (D2.TIPODOCUMENTO=D1.TIPODOCUMENTO AND D2.REGISTRO=D1.REGISTRO AND D2.NUMORDPREV=D1.NUMORDPREV AND D2.DATADOCUMENTO=D1.DATADOCUMENTO)');
        QryIn.SQL.Add('LEFT JOIN PRATICHE P ON (P.CODICE=D1.PRATICA AND P.DATAAPERTURA=D1.DATAPRATICA1)');
        QryIn.SQL.Add('LEFT JOIN IMPEGNI I ON (I.ID = D1.NUMORDPREV)');
        QryIn.SQL.Add('WHERE');
        QryIn.SQL.Add('    (D1.TipoDocumento = ''' + TipoDoc + ''')');
        QryIn.SQL.Add('AND (D1.Registro = ''' + Registro + ''')');
        QryIn.SQL.Add('AND (D1.NumOrdPrev = ' + IntToStr(NumDoc) + ')');
        QryIn.SQL.Add('AND (D1.DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
        QryIn.SQL.Add('ORDER BY PROGRIGO, PROGRIGO2');
        QryIn.Open;

        // Salva il valore del flag IMportExport
        PrecImportExportValue := QryIn.FieldByName('SELEZIONATO').AsString;


        // Costruisce il valore (eventuale) dell'EXTRARIF con cui esportare gli eventuali
        // dati relativi ei SubSogg
        // -----------------------------------------------------------------
        ExtraRif := '';
        // Aggiunge l'eventuale RDA
        if Trim(QryIn.FieldByName('RDA').AsString) <> '' then
          ExtraRif := ExtraRif + Format(' (RDA %s)', [Trim(QryIn.FieldByName('RDA').AsString)]);
        // Aggiunge anche gli eventuali campo SUBSOGG1
        if QryIn.FieldByName('SUBSOGGCAMPO1').AsString <> '' then
          ExtraRif := ExtraRif + ' ' + DM1.RefCaptionLabelSubSogg1 + ' ' + QryIn.FieldByName('SUBSOGGCAMPO1').AsString;
        if QryIn.FieldByName('SUBSOGGCAMPO2').AsString <> '' then
          ExtraRif := ExtraRif + ' ' + DM1.RefCaptionLabelSubSogg2 + ' ' + QryIn.FieldByName('SUBSOGGCAMPO2').AsString;
        if QryIn.FieldByName('SUBSOGGCAMPO3').AsString <> '' then
          ExtraRif := ExtraRif + ' ' + DM1.RefCaptionLabelSubSogg3 + ' ' + QryIn.FieldByName('SUBSOGGCAMPO3').AsString;
        // Limita il campo a 200 caratteri
        ExtraRif := LeftStr(Trim(ExtraRif), 200);
        // -----------------------------------------------------------------

        // Se si tratta di un intervento ed è stata scritta una relazione di intervento provvede
        // ad aggiungerla come prima riga del documento in esportazione
        if (TipoDoc = 'Intervento') and DM1.CopiaRelazioneInterventoInBacheca then
          EsportaRelazioneIntervento(QryIn, ExtraRif);

        // Cicla per tutti i righi trovati da QryIn e li inserisce nella tabella TmpRighi dei righi esportati
        while (not QryIn.Eof) do
        begin
          QryOut.SQL.Clear;
          QryOut.SQL.Add
            ('insert into tmprighi (STATION_ID, TipoDocumento, TipoDocumentoEsteso, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, CodiceArticoloStm, Pratica, DataPratica,');
          QryOut.SQL.Add
            ('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
          QryOut.SQL.Add
            ('Margine, ImportoMargine, NoteRigo, MovMag, QtaOpera, CodiceMagazzino, CodiceMagazzino2, MinutiPrevisti, Tipo1, Tipo2, Tipo3, Tipo4, Tipo5, Tipo6,');
          QryOut.SQL.Add('SOTTOCANTIERE1, SOTTOCANTIERE2, SOTTOCANTIERE3, SOTTOCANTIERE4, SOTTOCANTIERE5, SOTTOCANTIERE6,');
          QryOut.SQL.Add
            ('GUID_REF, GUID_ANCESTOR, RAGSOCCLI, EXTRA_RIFERIMENTO, DESCPRATICA, RifDoc_Tipo, RifDoc_Num, RifDoc_Reg, RifDoc_Data, RifDoc_CorrispNoPag,');
          QryOut.SQL.Add('RowType, RowSection, RowPrintPrices, PrezzoUnitarioAutocalc)');
          QryOut.SQL.Add('values (');
          QryOut.SQL.Add(CodiceUtente + ',');
          QryOut.SQL.Add('''' + QryIn.FieldByName('TipoDocumento').AsString + ''',');
          QryOut.SQL.Add('''' + QryIn.FieldByName('TipoDocumentoEsteso').AsString + ''',');
          QryOut.SQL.Add('''' + QryIn.FieldByName('Registro').AsString + ''',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('NumOrdPrev').AsInteger) + ',');
          QryOut.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', QryIn.FieldByName('DataDocumento').AsDateTime) + ''',');
          // Se ProgRigo è null lo mette a null perchè poi quando importa nel documento
          // se è null non lo importa (documento senza righi)
          if QryIn.FieldByName('ProgRigo').IsNull then
            QryOut.SQL.Add('NULL,')
          else
            QryOut.SQL.Add(IntToStr(QryIn.FieldByName('ProgRigo').AsInteger) + ',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('ProgRigo2').AsInteger) + ',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('CodiceCliente').AsInteger) + ',');
          QryOut.SQL.Add(AnsiQuotedStr(QryIn.FieldByName('CodiceArticolo').AsString, '''') + ',');
          QryOut.SQL.Add(AnsiQuotedStr(QryIn.FieldByName('CodiceArticoloStm').AsString, '''') + ',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('Pratica').AsInteger) + ',');
          QryOut.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', QryIn.FieldByName('DataPratica1').AsDateTime) + ''',');
          // Se ProgRigo è null lo mette a null perchè poi quando importa nel documento
          // se è null non lo importa (documento senza righi)
          if QryIn.FieldByName('CodiceIVA').IsNull then
            QryOut.SQL.Add('NULL,')
          else
            QryOut.SQL.Add(IntToStr(QryIn.FieldByName('CodiceIVA').AsInteger) + ',');
          QryOut.SQL.Add('''' + QryIn.FieldByName('DescrizioneIVA').AsString + ''',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('AliquotaIVA').AsFloat) + ',');

          // Costruisce la descrizione da esportare e se è un rigo di manodopera principale
          // proccede ad aggiungere alla descrizione anche le note dei sottorighi presenti.
          // -----------------------------------------------------------------
          Descrizione := QryIn.FieldByName('Descrizione').AsString;

          if DM1.CodiceIsManodopera(QryIn.FieldByName('CodiceArticolo').AsString) and (QryIn.FieldByName('ProgRigo2').AsInteger = -1) then
          begin
            Descrizione := AggiungiNoteSottorighiManodopera(Descrizione, QryIn.FieldByName('TipoDocumento').AsString, QryIn.FieldByName('NumOrdPrev').AsInteger,
              QryIn.FieldByName('Registro').AsString, QryIn.FieldByName('DataDocumento').AsDateTime, QryIn.FieldByName('ProgRigo').AsInteger);
          end;
          // Invio la descrizione così ottenuta alla query
          QryOut.SQL.Add(AnsiQuotedStr(LeftStr(Descrizione, 5000), '''') + ',');
          // -----------------------------------------------------------------

          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('PrezzoUnitario').AsFloat) + ',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('PrezzoUnitarioIVACompresa').AsFloat) + ',');
          // Se la quantità da esportare è nulla la pone a nulla esplicitamente anche nel rigo esportato
          // altrimenti la proprietà .AsFloat lo farebbe diventare 0 (zero) e quindi nel documento
          // che importerà il rigo apparirebbe lo 0. Nei prezzi invece questo non accade perchè effettivamente
          // il prezzo diventa 0 ma non viene visualizzato.
          if QryIn.FieldByName('QTA').IsNull then
            QryOut.SQL.Add('NULL,')
          else
            QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('QTA').AsFloat) + ',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('ScontoRigo').AsFloat) + ',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('ScontoRigo2').AsFloat) + ',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('ScontoRigo3').AsFloat) + ',');
          QryOut.SQL.Add('''' + QryIn.FieldByName('UnitaDiMisura').AsString + ''',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('PrezzoAcquistoArticolo').AsFloat) + ',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('Margine').AsFloat) + ',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('ImportoMargine').AsFloat) + ',');
          QryOut.SQL.Add('''' + QryIn.FieldByName('NoteRigo').AsString + ''',');
          QryOut.SQL.Add('''' + QryIn.FieldByName('MovMag').AsString + ''',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('QtaOpera').AsFloat) + ',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('CodiceMagazzino').AsInteger) + ',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('CodiceMagazzino2').AsInteger) + ',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('MINUTIPREVISTI').AsInteger) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('TIPO1').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('TIPO2').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('TIPO3').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('TIPO4').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('TIPO5').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('TIPO6').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('SOTTOCANTIERE1').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('SOTTOCANTIERE2').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('SOTTOCANTIERE3').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('SOTTOCANTIERE4').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('SOTTOCANTIERE5').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('SOTTOCANTIERE6').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('GUID_REF').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('GUID').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RAGSOCCLI').AsString) + ',');
          QryOut.SQL.Add(AnsiQuotedStr(ExtraRif, '''') + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('DESCPRATICA').AsString) + ',');

          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RifDoc_Tipo').AsString) + ',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('RifDoc_Num').AsInteger) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RifDoc_Reg').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', QryIn.FieldByName('RifDoc_Data').AsDateTime)) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RifDoc_CorrispNoPag').AsString) + ',');

          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RowType').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RowSection').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RowPrintPrices').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('PrezzoUnitarioAutocalc').AsString));

          QryOut.SQL.Add(')');
          QryOut.ExecSQL;
          // Avanza al prossimo rigo
          QryIn.Next;
        end;
        // Marca il documento come esportato
        ClientiForm.MarcaImportExport(TipoDoc, Registro, NumDoc, DataDoc, FLAG_VALUE_EXPORTED, PrecImportExportValue);
      end;
    except
      // QryOut.SQL.SaveToFile('c:\sql.txt');
    end;
  finally
    QryIn.Free;
    QryOut.Free;
  end;
end;

// Se si tratta di un intervento e è stata scritta una relazione di intervento provvede
// ad aggiungerla come prima riga del documento in esportazione
procedure TDM1.EsportaRelazioneIntervento(PrecQryIn: TIB_Cursor; ExtraRif: String);
var
  QryIn, QryOut: TIB_Cursor;
  NewGUID: String;
begin
  if PrecQryIn.FieldByName('TipoDocumento').AsString <> 'Intervento' then
    Exit;
  // Crea la query che preleva i righi del documento da esportare dall'archivio dei righidoc dell'azienda
  QryIn := TIB_Cursor.Create(Self);
  QryIn.DatabaseName := DM1.ArcDBFile;
  QryIn.IB_Connection := DM1.DBAzienda;
  // Crea la query che inserisce i righi del documento da esportare dall'archivio temporaneo dei righi esportati
  QryOut := TIB_Cursor.Create(Self);
  QryOut.DatabaseName := DM1.GenDBFile;
  QryOut.IB_Connection := DM1.DBGenerale;
  try
    // Imposta la query che preòeverà la relazione dell'intervento
    QryIn.SQL.Clear;
    QryIn.SQL.Add('SELECT RELAZIONEINTERVENTO FROM IMPEGNI WHERE ID=' + PrecQryIn.FieldByName('NumOrdPrev').AsString);
    QryIn.Open;
    // Continua solo se ha trovato l'intervento e se la relazione è presente
    if QryIn.Eof or (Trim(QryIn.FieldByName('RELAZIONEINTERVENTO').AsString) = '') then
      Exit;

    // Imposta la query per l'inserimento del rigo con la relazione
    QryOut.SQL.Add
      ('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, CodiceArticolo, Pratica, DataPratica,');
    QryOut.SQL.Add
      ('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, PrezzoUnitarioIVACompresa, QTA, ScontoRigo, ScontoRigo2, ScontoRigo3, UnitaDiMisura, PrezzoAcquistoArticolo,');
    QryOut.SQL.Add
      ('Margine, ImportoMargine, NoteRigo, MovMag, PrzUnitOpera, QtaOpera, CodiceMagazzino, MinutiPrevisti, Tipo1, Tipo2, Tipo3, Tipo4, Tipo5, Tipo6,');
    QryOut.SQL.Add
      ('GUID_REF, GUID_ANCESTOR, RAGSOCCLI, DESCPRATICA, EXTRA_RIFERIMENTO, RifDoc_Tipo, RifDoc_Num, RifDoc_Reg, RifDoc_Data, RifDoc_CorrispNoPag)');
    QryOut.SQL.Add('values (');
    QryOut.SQL.Add(CodiceUtente + ',');
    QryOut.SQL.Add('''' + PrecQryIn.FieldByName('TipoDocumento').AsString + ''',');
    QryOut.SQL.Add('''' + PrecQryIn.FieldByName('Registro').AsString + ''',');
    QryOut.SQL.Add(IntToStr(PrecQryIn.FieldByName('NumOrdPrev').AsInteger) + ',');
    QryOut.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', PrecQryIn.FieldByName('DataDocumento').AsDateTime) + ''',');
    QryOut.SQL.Add('0,');
    QryOut.SQL.Add('-1,');
    QryOut.SQL.Add(IntToStr(PrecQryIn.FieldByName('CodiceCliente').AsInteger) + ',');
    QryOut.SQL.Add(''''','); // CodiceArticolo
    QryOut.SQL.Add(IntToStr(PrecQryIn.FieldByName('Pratica').AsInteger) + ',');
    QryOut.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', PrecQryIn.FieldByName('DataPratica1').AsDateTime) + ''',');
    QryOut.SQL.Add('NULL,'); // CodiceIVA
    QryOut.SQL.Add('NULL,'); // DescrizioneIVA
    QryOut.SQL.Add('NULL,'); // AliquotaIVA

    // Come descrizione del rigo mette la relazione dell'intervento
    // -----------------------------------------------------------------
    QryOut.SQL.Add(AnsiQuotedStr(LeftStr(QryIn.FieldByName('RELAZIONEINTERVENTO').AsString, 1000), '''') + ',');
    // -----------------------------------------------------------------

    QryOut.SQL.Add('NULL,'); // Prezzo Unitario
    QryOut.SQL.Add('NULL,'); // Prezzo Unitario IVA compresa
    QryOut.SQL.Add('NULL,'); // Qta
    QryOut.SQL.Add('NULL,'); // Scontorigo1
    QryOut.SQL.Add('NULL,'); // Scontorigo2
    QryOut.SQL.Add('NULL,'); // Scontorigo3
    QryOut.SQL.Add('NULL,'); // Unita Di MIsura
    QryOut.SQL.Add('NULL,'); // Prezzo acquisto articolo
    QryOut.SQL.Add('NULL,'); // Margine
    QryOut.SQL.Add('NULL,'); // Importo margine
    QryOut.SQL.Add('NULL,'); // Note rigo
    QryOut.SQL.Add('NULL,'); // MovMag
    QryOut.SQL.Add('NULL,'); // PrzUnitOpera
    QryOut.SQL.Add('NULL,'); // QtaOpera
    QryOut.SQL.Add('NULL,'); // CodiceMagazzino
    QryOut.SQL.Add('NULL,'); // MINUTIPREVISTI
    QryOut.SQL.Add('NULL,'); // TIPO1
    QryOut.SQL.Add('NULL,'); // TIPO2
    QryOut.SQL.Add('NULL,'); // TIPO3
    QryOut.SQL.Add('NULL,'); // TIPO4
    QryOut.SQL.Add('NULL,'); // TIPO5
    QryOut.SQL.Add('NULL,'); // TIPO6

    // GUID
    // --------------------------
    NewGUID := GUIDAsString;
    QryOut.SQL.Add(QuotedStr(NewGUID) + ',');
    QryOut.SQL.Add(QuotedStr(GUIDAsString) + ',');
    // --------------------------

    QryOut.SQL.Add(QuotedStr(PrecQryIn.FieldByName('RAGSOCCLI').AsString) + ',');
    QryOut.SQL.Add(QuotedStr(PrecQryIn.FieldByName('DESCPRATICA').AsString) + ',');
    QryOut.SQL.Add(AnsiQuotedStr(ExtraRif, '''') + ',');

    // RifDoc_
    QryOut.SQL.Add(QuotedStr(PrecQryIn.FieldByName('RifDoc_Tipo').AsString) + ',');
    QryOut.SQL.Add(IntToStr(PrecQryIn.FieldByName('RifDoc_Num').AsInteger) + ',');
    QryOut.SQL.Add(QuotedStr(PrecQryIn.FieldByName('RifDoc_Reg').AsString) + ',');
    QryOut.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', PrecQryIn.FieldByName('RifDoc_Data').AsDateTime)) + ',');
    QryOut.SQL.Add(QuotedStr(PrecQryIn.FieldByName('RifDoc_CorrispNoPag').AsString));

    QryOut.SQL.Add(')');
    QryOut.ExecSQL;
  finally
    QryIn.Free;
    QryOut.Free;
  end;
end;

procedure TDM1.EsportaSoloRifDocFisc(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate); // Personale
var
  QryIn, QryIva, QryOut: TIB_Cursor;
  PrecImportExportValue: String;
  i: Integer;
  ia: String;
  ExtraRif: String;
begin
  // Crea la query che preleva i totali del documento per poterne esportare solo il rigo
  // di riferimento senza i righi.
  QryIn := TIB_Cursor.Create(Self);
  QryIn.DatabaseName := DM1.ArcDBFile;
  QryIn.IB_Connection := DM1.DBAzienda;
  // Crea la query che preleverà i dati IVA
  QryIva := TIB_Cursor.Create(Self);
  QryIva.DatabaseName := DM1.ArcDBFile;
  QryIva.IB_Connection := DM1.DBAzienda;
  // Crea la query che inserisce i righi del documento da esportare dall'archivio temporaneo dei righi esportati
  QryOut := TIB_Cursor.Create(Self);
  QryOut.DatabaseName := DM1.GenDBFile;
  QryOut.IB_Connection := DM1.DBGenerale;
  try
    // Solo se è un documento esportabile
    if (TipoDoc = 'Preventivo') or (TipoDoc = 'Ordine') or (TipoDoc = 'S.A.L.') or (TipoDoc = 'D.D.T.') or (TipoDoc = 'Fattura') or (TipoDoc = 'Nota_accre') or
      (TipoDoc = 'Ord.fornit') or (TipoDoc = 'Bolla_entr') or (TipoDoc = 'Fatt.acqui') or (TipoDoc = 'Ricev.fisc') or (TipoDoc = 'Fatt.R.F.') or
      (TipoDoc = 'Buono_cons') or (TipoDoc = 'N.C.fornit') or (TipoDoc = 'Commessa') or (TipoDoc = 'Carico_cantiere') or (TipoDoc = 'Scarico_cantiere') or
      (TipoDoc = 'Estratto_conto') or (TipoDoc = 'Intervento') then
    begin
      // Crea la query per l'inserimento dei righi del documento da esportare direttamente
      // nel file dei righi esportati (TmpRighi).
      QryIn.SQL.Add
        ('SELECT D1.TipoDocumento, D1.Registro, D1.NumOrdPrev, D1.DataDocumento, D1.CodiceCliente, D1.RagSocCli, D1.TotaleImponibile1, D1.TotaleImponibile2, D1.TotaleImponibile3, D1.TotaleImponibile4,');
      QryIn.SQL.Add(' D1.Pratica, D1.DataPratica1, D1.CodiceIVA1, D1.CodiceIVA2, D1.CodiceIVA3, D1.CodiceIVA4, D1.SELEZIONATO, P.DESCRIZIONE AS DESCPRATICA,');
      QryIn.SQL.Add(' D1.RifDoc_Tipo, D1.RifDoc_Num, D1.RifDoc_Reg, D1.RifDoc_Data, D1.RifDoc_CorrispNoPag,');
      QryIn.SQL.Add(' (SELECT DESCRIZIONEIVA FROM ALIQIVA WHERE CODICEIVA = D1.CODICEIVA1) AS DESCRIZIONEIVA1,');
      QryIn.SQL.Add(' (SELECT DESCRIZIONEIVA FROM ALIQIVA WHERE CODICEIVA = D1.CODICEIVA2) AS DESCRIZIONEIVA2,');
      QryIn.SQL.Add(' (SELECT DESCRIZIONEIVA FROM ALIQIVA WHERE CODICEIVA = D1.CODICEIVA3) AS DESCRIZIONEIVA3,');
      QryIn.SQL.Add(' (SELECT DESCRIZIONEIVA FROM ALIQIVA WHERE CODICEIVA = D1.CODICEIVA4) AS DESCRIZIONEIVA4,');
      QryIn.SQL.Add(' (SELECT ALIQUOTAIVA FROM ALIQIVA WHERE CODICEIVA = D1.CODICEIVA1) AS ALIQUOTAIVA1,');
      QryIn.SQL.Add(' (SELECT ALIQUOTAIVA FROM ALIQIVA WHERE CODICEIVA = D1.CODICEIVA2) AS ALIQUOTAIVA2,');
      QryIn.SQL.Add(' (SELECT ALIQUOTAIVA FROM ALIQIVA WHERE CODICEIVA = D1.CODICEIVA3) AS ALIQUOTAIVA3,');
      QryIn.SQL.Add(' (SELECT ALIQUOTAIVA FROM ALIQIVA WHERE CODICEIVA = D1.CODICEIVA4) AS ALIQUOTAIVA4');
      QryIn.SQL.Add('FROM PrvOrdCl D1');
      QryIn.SQL.Add('LEFT JOIN PRATICHE P ON (P.CODICE = D1.PRATICA AND P.DATAAPERTURA = D1.DATAPRATICA1)');
      QryIn.SQL.Add('WHERE');
      QryIn.SQL.Add('    (D1.TipoDocumento = ''' + TipoDoc + ''')');
      QryIn.SQL.Add('AND (D1.Registro = ''' + Registro + ''')');
      QryIn.SQL.Add('AND (D1.NumOrdPrev = ' + IntToStr(NumDoc) + ')');
      QryIn.SQL.Add('AND (D1.DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      QryIn.Open;
      // Se il documento non è stato trovato...
      if QryIn.Eof then
        raise Exception.Create('Documento non trovato.');
      // Salva il valore del flag IMportExport
      PrecImportExportValue := QryIn.FieldByName('SELEZIONATO').AsString;

      // Se si tratta di un intervento e è stata scritta una relazione di intervento provvede
      // ad aggiungerla come prima riga del documento in esportazione
      if (TipoDoc = 'Intervento') and DM1.CopiaRelazioneInterventoInBacheca then
        EsportaRelazioneIntervento(QryIn, ExtraRif);

      // Cicla per controllare tutte le 4 possibili Aliquote IVA del documento ed eventualmente importarle
      for i := 1 to 4 do
      begin
        // ia contiene l'indice del codice iva attuale
        ia := IntToStr(i);
        // Se il codice IVA attuale è valido esporta un rigo di riferimento per questa aliquota IVA
        if (not QryIn.FieldByName('CodiceIVA' + ia).IsNull) and (QryIn.FieldByName('CodiceIVA' + ia).AsInteger > 0) then
        begin
          // Query che effettua l'inserimento in TmpRighi
          QryOut.SQL.Clear;
          QryOut.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente,');
          QryOut.SQL.Add
            ('CodiceIVA, DescrizioneIVA, AliquotaIVA, Descrizione, PrezzoUnitario, QTA, PrezzoAcquistoArticolo, RAGSOCCLI, DESCPRATICA, EXTRA_RIFERIMENTO)');
          QryOut.SQL.Add('values (');
          QryOut.SQL.Add(CodiceUtente + ',');
          QryOut.SQL.Add('''' + TipoDoc + ''',');
          QryOut.SQL.Add('''' + Registro + ''',');
          QryOut.SQL.Add(IntToStr(NumDoc) + ',');
          QryOut.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''',');
          QryOut.SQL.Add('0,');
          QryOut.SQL.Add('-1,');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('CodiceCliente').AsInteger) + ',');
          QryOut.SQL.Add(IntToStr(QryIn.FieldByName('CodiceIVA' + ia).AsInteger) + ',');
          QryOut.SQL.Add('''' + QryIn.FieldByName('DescrizioneIVA' + ia).AsString + ''',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('AliquotaIVA' + ia).AsFloat) + ',');
          QryOut.SQL.Add('''Imponibile ' + QryIn.FieldByName('DescrizioneIVA' + ia).AsString + ''',');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('TotaleImponibile' + ia).AsFloat) + ',');
          QryOut.SQL.Add('1,');
          QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('TotaleImponibile' + ia).AsFloat) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RAGSOCCLI').AsString) + ',');
          QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('DESCPRATICA').AsString) + ',');
          QryOut.SQL.Add(AnsiQuotedStr(ExtraRif, ''''));
          QryOut.SQL.Add(')');
          QryOut.ExecSQL;
        end;
      end;

      // Marca il documento come esportato
      ClientiForm.MarcaImportExport(TipoDoc, Registro, NumDoc, DataDoc, FLAG_VALUE_EXPORTED, PrecImportExportValue);
    end;
  finally
    QryIn.Free;
    QryOut.Free;
    QryIva.Free;
  end;
end;

procedure TDM1.EsportaLDE(TipoDoc: String; ID, NumDoc: Integer; Registro: String; DataDoc: TDate);
var
  QryOut: TIB_Cursor;
begin
  // Crea la query che inserisce i righi del documento da esportare dall'archivio temporaneo dei righi esportati
  QryOut := TIB_Cursor.Create(Self);
  QryOut.DatabaseName := DM1.GenDBFile;
  QryOut.IB_Connection := DM1.DBGenerale;
  try
    QryOut.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, NumOrdPrev, Registro, DataDocumento, ID)');
    QryOut.SQL.Add('values (');
    QryOut.SQL.Add(CodiceUtente + ',');
    QryOut.SQL.Add(QuotedStr(TipoDoc) + ',');
    QryOut.SQL.Add(IntToStr(NumDoc) + ',');
    QryOut.SQL.Add(QuotedStr(Registro) + ',');
    QryOut.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', DataDoc)) + ',');
    QryOut.SQL.Add(IntToStr(ID));
    QryOut.SQL.Add(')');
    QryOut.ExecSQL;
  finally
    QryOut.Free;
  end;
end;

procedure TDM1.EsportaConformita(NumDoc: Integer; Registro: String; DataDoc: TDate); // Personale
var
  QryOut: TIB_Cursor;
begin
  // Crea la query che inserisce i righi del documento da esportare dall'archivio temporaneo dei righi esportati
  QryOut := TIB_Cursor.Create(Self);
  QryOut.DatabaseName := DM1.GenDBFile;
  QryOut.IB_Connection := DM1.DBGenerale;
  try
    QryOut.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, NumOrdPrev, Registro, DataDocumento)');
    QryOut.SQL.Add('values (');
    QryOut.SQL.Add(CodiceUtente + ',');
    QryOut.SQL.Add(QuotedStr('Conformita') + ',');
    QryOut.SQL.Add(IntToStr(NumDoc) + ',');
    QryOut.SQL.Add(QuotedStr(Registro) + ',');
    QryOut.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', DataDoc)));
    QryOut.SQL.Add(')');
    QryOut.ExecSQL;
  finally
    QryOut.Free;
  end;
end;

procedure TDM1.EsportaRicevutaFiscale(TipoDoc, Registro: String; NumDoc: Longint; DataDoc: TDate); // Personale
var
  QryIn, QryOut: TIB_Cursor;
begin
  // Crea la query che preleva i righi del documento da esportare dall'archivio dei righidoc dell'azienda
  QryIn := TIB_Cursor.Create(Self);
  QryIn.DatabaseName := DM1.ArcDBFile;
  QryIn.IB_Connection := DM1.DBAzienda;
  // Crea la query che inserisce i righi del documento da esportare dall'archivio temporaneo dei righi esportati
  QryOut := TIB_Cursor.Create(Self);
  QryOut.DatabaseName := DM1.GenDBFile;
  QryOut.IB_Connection := DM1.DBGenerale;
  try
    // Solo se è una Ricevuta Fiscale
    if (TipoDoc = 'Ricev.fisc') then
    begin
      // Crea la query per l'inserimento dei righi del documento da esportare direttamente
      // nel file dei righi esportati (TmpRighi).
      QryIn.SQL.Add('SELECT CodiceCliente, Abbuono, RifDoc_Tipo, RifDoc_Num, RifDoc_Reg, RifDoc_Data, RifDoc_CorrispNoPag');
      QryIn.SQL.Add('FROM PrvOrdCl');
      QryIn.SQL.Add('WHERE');
      QryIn.SQL.Add('    (TipoDocumento = ''' + TipoDoc + ''')');
      QryIn.SQL.Add('AND (Registro = ''' + Registro + ''')');
      QryIn.SQL.Add('AND (NumOrdPrev = ' + IntToStr(NumDoc) + ')');
      QryIn.SQL.Add('AND (DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''')');
      QryIn.Open;
      // Cicla per tutti i righi trovati da QryIn e li inserisce nella tabella TmpRighi dei righi esportati
      while not QryIn.Eof do
      begin
        QryOut.SQL.Clear;
        QryOut.SQL.Add
          ('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceCliente, Descrizione, QTA, PrezzoUnitario,');
        QryOut.SQL.Add
          (' PrezzoUnitarioIVACompresa, PrezzoAcquistoArticolo, Margine, ImportoMargine, CodiceIVA, RifDoc_Tipo, RifDoc_Num, RifDoc_Reg, RifDoc_Data, RifDoc_CorrispNoPag)');
        QryOut.SQL.Add('values (');
        QryOut.SQL.Add(CodiceUtente + ',');
        QryOut.SQL.Add('''' + TipoDoc + ''',');
        QryOut.SQL.Add('''' + Registro + ''',');
        QryOut.SQL.Add(IntToStr(NumDoc) + ',');
        QryOut.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DataDoc) + ''',');
        QryOut.SQL.Add('0,');
        QryOut.SQL.Add('-1,');
        QryOut.SQL.Add(IntToStr(QryIn.FieldByName('CodiceCliente').AsInteger) + ',');
        QryOut.SQL.Add('''      a saldo'',');
        QryOut.SQL.Add('1,');
        QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('Abbuono').AsFloat) + ',');
        QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('Abbuono').AsFloat) + ',');
        QryOut.SQL.Add(DM1.VirgolaPunto(QryIn.FieldByName('Abbuono').AsFloat) + ',');
        QryOut.SQL.Add('0,');
        QryOut.SQL.Add('0,');
        QryOut.SQL.Add('-1,');

        QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RifDoc_Tipo').AsString) + ',');
        QryOut.SQL.Add(IntToStr(QryIn.FieldByName('RifDoc_Num').AsInteger) + ',');
        QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RifDoc_Reg').AsString) + ',');
        QryOut.SQL.Add(QuotedStr(FormatDateTime('mm/dd/yyyy', QryIn.FieldByName('RifDoc_Data').AsDate)) + ',');
        QryOut.SQL.Add(QuotedStr(QryIn.FieldByName('RifDoc_CorrispNoPag').AsString));

        QryOut.SQL.Add(')');
        QryOut.ExecSQL;
        // Avanza al prossimo rigo
        QryIn.Next;
      end;
      // Aggiorna lo stato del documento a già esportato
      QryIn.Close;
      QryIn.SQL.Clear;
      QryIn.SQL.Add('UPDATE PrvOrdCl SET Selezionato = ''*''');
      QryIn.SQL.Add('WHERE TipoDocumento = ''' + TipoDoc + '''');
      QryIn.SQL.Add('  AND Registro = ''' + Registro + '''');
      QryIn.SQL.Add('  AND NumOrdPrev = ' + IntToStr(NumDoc));
      QryIn.SQL.Add('  AND DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DataDoc) + '''');
      QryIn.ExecSQL;
    end;
  finally
    QryIn.Free;
    QryOut.Free;
  end;
end;





// procedure TDM1.EsportaRigoDocFisc(ListaDoc:TBookmarkList);     // Personale
// var
// Contatore:Longint;
// begin
// // Copia tutti righi da esportare nel file 'TmpRighi' da dove, in seguito,
// //  potranno essere importati in nuovi documenti con il relativo riferimento.
// //  Copia solo i righi specificati dal parametro ricevuto
// //  dal chiamante (ListaDoc).
// //----------------------------------
// // Cicla per tutti i documenti specificati da 'ListaDoc'
// for Contatore := 1 to ListaDoc.Count do begin
// // Si sposta sul documento di cui esportare i righi
// TableRighiDocumento.BookMark := ListaDoc.Items[Contatore-1];
// // Effettua l'inserimento dei righi selezionati nell'archivio
// //  temporaneo dei righi selezionati per essere importati in altri documenti.
// // ------------------------------------------------------------------------
// // Copia il rigo corrente nel file temporaneo dei righi per
// //  l'importazione in altri documenti.
// with DM1 do begin
// TableTmpRighi.Append;
// TableTmpRighiTipoDocumento.Value          := TableRighiDocumentoTipoDocumento.Value;
// TableTmpRighiRegistro.Value               := TableRighiDocumentoRegistro.Value;
// TableTmpRighiNumOrdPrev.Value             := TableRighiDocumentoNumOrdPrev.Value;
// TableTmpRighiDataDocumento.Value          := TableRighiDocumentoDataDocumento.Value;
// TableTmpRighiCodiceCliente.Value          := TableRighiDocumentoCodiceCliente.Value;
// TableTmpRighiCodiceArticolo.Value         := TableRighiDocumentoCodiceArticolo.Value;
// TableTmpRighiPratica.Value                := TablePreventiviOrdiniPratica.Value;
// TableTmpRighiCodiceIVA.Value              := TableRighiDocumentoCodiceIVA.Value;
// TableTmpRighiDescrizione.Value            := TableRighiDocumentoDescrizione.Value;
// if not TableRighiDocumentoPrezzoUnitario.IsNull then TableTmpRighiPrezzoUnitario.Value         := TableRighiDocumentoPrezzoUnitario.Value;
// if not TableRighiDocumentoPrezzoUnitarioIVACompresa.IsNull then TableTmpRighiPrezzoUnitarioIVACompresa.Value         := TableRighiDocumentoPrezzoUnitario.Value;
// if not TableRighiDocumentoQTA.IsNull            then TableTmpRighiQTA.Value                    := TableRighiDocumentoQTA.Value;
// if not TableRighiDocumentoScontoRigo.IsNull     then TableTmpRighiScontoRigo.Value             := TableRighiDocumentoScontoRigo.Value;
// if not TableRighiDocumentoScontoRigo2.IsNull    then TableTmpRighiScontoRigo2.Value            := TableRighiDocumentoScontoRigo2.Value;
// if not TableRighiDocumentoScontoRigo3.IsNull    then TableTmpRighiScontoRigo3.Value            := TableRighiDocumentoScontoRigo3.Value;
// TableTmpRighiUnitaDiMisura.Value          := TableRighiDocumentoUnitaDiMisura.Value;
// if not TableRighiDocumentoPrezzoAcquistoArticolo.IsNull then TableTmpRighiPrezzoAcquistoArticolo.Value := TableRighiDocumentoPrezzoAcquistoArticolo.Value;
// if not TableRighiDocumentoMargine.IsNull        then TableTmpRighiMargine.Value                := TableRighiDocumentoMargine.Value;
// if not TableRighiDocumentoImportoMargine.IsNull then TableTmpRighiImportoMargine.Value         := TableRighiDocumentoImportoMargine.Value;
// TableTmpRighiNoteRigo.Value               := TableRighiDocumentoNoteRigo.Value;
// TableTmpRighiMovMag.Value                 := TableRighiDocumentoMovMag.Value;
// TableTmpRighi.Post;
// // Marca il rigo come selezionato
// TableRighiDocumento.Edit;
// TableRighiDocumentoSelezionato.Value := '*';
// TableRighiDocumento.Post;
// end;
// // ------------------------------------------------------------------------
// end;
//
// end;

function TDM1.SettaStampante(QRToSet: TQuickRep; Copie: Integer): Boolean;
begin
  Result := False;
  // Se il parametro 'Copie' > 0 imposta direttamente il numero di copie da stampare
  // senza far comparire la dialog-box di impostazione della stampa.
  if Copie > 0 then
  begin
    Result := True;
    // Esegue il prepare del report per procurarsi i dati
    QRToSet.Prepare;
    try
      QRToSet.PrinterSettings.Copies := Copie;
      // Salva l'ultimo settaggio utilizzato dalla form di settaggio della stampa
      DM1.IndexStampanteUltimaStampa := QRToSet.QRPrinter.PrinterIndex;
      DM1.CopieUltimaStampa := Copie;
      DM1.PagDaUltimaStampa := 1;
      DM1.PagAUltimaStampa := QRToSet.QRPrinter.PageCount;
    finally
      QRToSet.QRPrinter.Free;
      QRToSet.QRPrinter := nil;
    end;
  end
  else
  begin
    // Se il numero di copie di default è 0 lo fà diventare 1
    if Copie = 0 then
      Copie := 1;
    // Se il numero delle copie di default è un numero negativo significa
    // che deve essere visualizzata la form con quel numero di copie predefinite.
    if Copie < 0 then
      Copie := Copie * (-1);
    // Crea la form dei parametri di stampa
    Application.CreateForm(TSettaStampanteForm, SettaStampanteForm);
    // Esegue il prepare del report per procurarsi i dati
    QRToSet.Prepare;
    try
      SettaStampanteForm.Copie := Copie;
      SettaStampanteForm.PagDa := 1;
      SettaStampanteForm.MaxPag := QRToSet.QRPrinter.PageCount;
      SettaStampanteForm.PagA := SettaStampanteForm.MaxPag;
      SettaStampanteForm.ListaStampanti.Items := QRToSet.QRPrinter.Printers;
      SettaStampanteForm.ListaStampanti.ItemIndex := QRToSet.QRPrinter.PrinterIndex;
      // Se l'utente preme il tasto di stampa imposta la stampante
      if SettaStampanteForm.ShowModal = mrOk then
      begin
        Result := True;
        QRToSet.PrinterSettings.PrinterIndex := SettaStampanteForm.ListaStampanti.ItemIndex;
        QRToSet.PrinterSettings.Copies := SettaStampanteForm.Copie;
        QRToSet.PrinterSettings.FirstPage := SettaStampanteForm.PagDa;
        QRToSet.PrinterSettings.LastPage := SettaStampanteForm.PagA;
        // Salva l'ultimo settaggio utilizzato dalla form di settaggio della stampa
        DM1.IndexStampanteUltimaStampa := SettaStampanteForm.ListaStampanti.ItemIndex;
        DM1.CopieUltimaStampa := SettaStampanteForm.Copie;
        DM1.PagDaUltimaStampa := SettaStampanteForm.PagDa;
        DM1.PagAUltimaStampa := SettaStampanteForm.PagA;
      end;
    finally
      QRToSet.QRPrinter.Free;
      QRToSet.QRPrinter := nil;
    end;
  end;
end;




// procedure TDM1.CaricaScaricaMagazzino;
// begin
// // Disabilita i controlli delle tabelle
// TableArticoli.DisableControls;
// TableRighiDocumento.DisableControls;
// // Cicla per tutti i righi
// // Si posizione all'inizio dei righi del documento
// TableRighiDocumento.First;
// while not TableRighiDocumento.eof do begin
// if TableArticoli.Locate('CodiceArticolo', TableRighiDocumentoCodiceArticolo.Value, [loCaseInsensitive]) then begin
// // Se è abilitata la movimentazione di magazzino dell'articolo
// if TableArticoliAbilitaMovMag.Value <> 'F' then begin
// // Effettua lo scarico o il carico di magazzino in base al tipo di documento
// //  in cui mi trovo.
// // -------------------------------------
// //  Se si tratta di un ordine cliente e il campo 'MovMag' <> 'I' cioè se non
// //  è già stato impegnato, lo impegna.
// if (TablePreventiviOrdiniTipoDocumento.Value = 'Ordine') and (TableRighiDocumentoMovMag.Value <> 'I') then begin
// TableArticoli.Edit;
// TableArticoliMerceImpegnata.Value := TableArticoliMerceImpegnata.Value + TableRighiDocumentoQTA.Value;
// Tablearticoli.Post;
// // Marca il rigo corrente gome già movimentato in magazzino
// TableRighiDocumento.Edit;
// TableRighiDocumentoMovMag.Value := 'I';
// TableRighiDocumento.Post;
// // Se si tratta di una fattura di vendita, di un DDT oppure di una ricevuta fiscale
// //  e il campo 'MovMag' <> '=' che significa che il rigo proviene da un altro
// //  documento che ne ha già effettuato lo scarico (e quindi diventa inerte e non
// //  più movimentabile in alcun modo).
// end else if ((TablePreventiviOrdiniTipoDocumento.Value = 'D.D.T.')or(TablePreventiviOrdiniTipoDocumento.Value = 'Fattura')or(TablePreventiviOrdiniTipoDocumento.Value = 'Ricev.fisc')or(TablePreventiviOrdiniTipoDocumento.Value = 'Fatt.R.F.')or(TablePreventiviOrdiniTipoDocumento.Value = 'Buono_cons')) and (TableRighiDocumentoMovMag.Value <> '=') then begin
// // Se il rigo è già marcato come scaricato '-' non lo scarica più ma lo marca '='
// //  altrimenti effettua lo scarico di magazzino normale.
// //  (Se è marcato '-' si vede che sono righi importati da un DDT che quindi sono già scaricati
// if TableRighiDocumentoMovMag.Value = '-' then begin
// TableRighiDocumento.Edit;
// TableRighiDocumentoMovMag.Value := '=';
// TableRighiDocumento.Post;
// end else begin
// TableArticoli.Edit;
// TableArticoliEsistenza.Value := TableArticoliEsistenza.Value - TableRighiDocumentoQTA.Value;
// // Se è marcato 'I' significa che è un rigo proveniente da un Ordine cliente
// //  nel quale è stato eseguito l'impegno della merce e quindi sottrae la
// //  quantità del rigo dalla merce impegnata.
// if TableRighiDocumentoMovMag.Value = 'I' then TableArticoliMerceImpegnata.Value := TableArticoliMerceImpegnata.Value - TableRighiDocumentoQTA.Value;
// TableArticoli.Post;
// // Marca il rigo corrente gome già movimentato in magazzino
// TableRighiDocumento.Edit;
// TableRighiDocumentoMovMag.Value := '-';
// TableRighiDocumento.Post;
// end;
// // Se si tratta di una Bolla di entrata merci, di una Fattura di acquisto  oppure di una nota di accredito
// //  e il campo 'MovMag' <> '=' che significa che il rigo proviene da un altro
// //  documento che ne ha già effettuato il carico (e quindi diventa inerte e non
// //  più movimentabile in alcun modo).
// end else if ((TablePreventiviOrdiniTipoDocumento.Value = 'Bolla_entr')or(TablePreventiviOrdiniTipoDocumento.Value = 'Fatt.acqui')or(TablePreventiviOrdiniTipoDocumento.Value = 'Nota_accre')) and (TableRighiDocumentoMovMag.Value <> '=') then begin
// // Se il rigo è già marcato come caricato '+' non lo carica più ma lo marca '='
// //  altrimenti effettua il carico di magazzino normale.
// //  (Se è marcato '+' si vede che sono righi importati da una bolla di entrata che quindi sono già caricati
// if TableRighiDocumentoMovMag.Value = '+' then begin
// TableRighiDocumento.Edit;
// TableRighiDocumentoMovMag.Value := '=';
// TableRighiDocumento.Post;
// end else begin
// TableArticoli.Edit;
// TableArticoliEsistenza.Value := TableArticoliEsistenza.Value + TableRighiDocumentoQTA.Value;
// // Se è marcato 'O' significa che è un rigo proveniente da un Ordine fornitore
// //  nel quale è stato eseguito l'ordine della merce e quindi sottrae la
// //  quantità del rigo dalla merce ordinata.
// if TableRighiDocumentoMovMag.Value = 'O' then TableArticoliMerceOrdinata.Value := TableArticoliMerceOrdinata.Value - TableRighiDocumentoQTA.Value;
// TableArticoli.Post;
// // Marca il rigo corrente gome già movimentato in magazzino
// TableRighiDocumento.Edit;
// TableRighiDocumentoMovMag.Value := '+';
// TableRighiDocumento.Post;
// end;
// //  Se si tratta di un ordine a fornitore e il campo 'MovMag' <> 'O' cioè se non
// //  è già stato ordinato, lo ordina.
// end else if (TablePreventiviOrdiniTipoDocumento.Value = 'Ord.fornit') and (TableRighiDocumentoMovMag.Value <> 'O') then begin
// TableArticoli.Edit;
// TableArticoliMerceOrdinata.Value := TableArticoliMerceOrdinata.Value + TableRighiDocumentoQTA.Value;
// Tablearticoli.Post;
// // Marca il rigo corrente gome già movimentato in magazzino
// TableRighiDocumento.Edit;
// TableRighiDocumentoMovMag.Value := 'O';
// TableRighiDocumento.Post;
// end;
// end;
// end;
// TableRighiDocumento.Next;
// end;
// // Riabilita i controlli delle tabelle
// TableArticoli.EnableControls;
// TableRighiDocumento.EnableControls;
// end;

function TDM1.EliminaCaratteriNonValidi(InStr: String): String; // Personale
var
  Contatore: Integer;
begin
  Result := '';
  // Cicla per ogni carattere della stringa
  for Contatore := 1 to Length(InStr) do
  begin
    // Se non è ne una lettera ne un numero, sostituisce il carattere con
    // l'underscore.
    if ((Ord(InStr[Contatore]) >= 48) and (Ord(InStr[Contatore]) <= 57)) or ((Ord(InStr[Contatore]) >= 65) and (Ord(InStr[Contatore]) <= 90)) or
      ((Ord(InStr[Contatore]) >= 97) and (Ord(InStr[Contatore]) <= 122)) then
    begin
      Result := Result + InStr[Contatore];
    end
    else
    begin
      Result := Result + '_';
    end;
  end;
end;

function TDM1.ControllaFineMese(GG, MM, AA: Word): Word;
var
  GGMese: Word;
begin
  GGMese := 0;
  // Controlla che il giorno non
  // superi l'ultimo del mese (es. 31 novembre), nel qual caso lo riporta
  // alla fine del mese corretta.
  case MM of
    1, 3, 5, 7, 8, 10, 12:
      GGMese := 31;
    4, 6, 9, 11:
      GGMese := 30;
    2:
      GGMese := 28;
  end;
  if GG > GGMese then
  begin
    GG := GGMese;
  end;
  Result := GG;
end;

function TDM1.ControlloMeseSospensione(Data: TDateTime; DatiSogg: TIB_Cursor): TDateTime;
var
  AA, MM, GG: Word;
  SpostaScadAlGiorno: Integer;
begin
  // Prima di tutto pone nella variabile locale il campo SpostaScadAlGiorno
  SpostaScadAlGiorno := DatiSogg.FieldByName('SPOSTASCADALGIORNO').AsInteger;
  // Decodifica la data della scadenza per poi confrontare il mese con
  // quello del mese di sospensione dei pagamenti e se conincide lo passa
  // al mese successivo.
  DecodeDate(Data, AA, MM, GG);
  // Se SpostaScadAlGiorno > 0 decrementa il mese di 1 per compensare il fatto che la data della scadenza precedente
  // è stata spostata
  // NB: Se la scadenza cadeva a gennaio ora MM = 0 e quindi è necessario riportarlo a dicembre (dell'anno prima)
  if (SpostaScadAlGiorno > 0) then
    Dec(MM);
  if (MM = 0) then
  begin
    MM := 12;
    Dec(AA);
  end;
  // Se la scadenza attuale ricade in un mese da saltare...
  if DatiSogg.FieldByName('SALTAMESE' + IntToStr(MM)).AsString = 'T' then
  begin
    // IMposta la nuova data sostitutiva
    Inc(MM); // Mese successivo
    // Se il mese a questo punto = 13 significa che è stato spostato a
    // gennaio dell'anno successivo.
    if MM > 12 then
    begin
      MM := 1; // Il mese diventa gennaio
      Inc(AA); // Incrementa l'anno
    end;
    // Giorno impostato nell'anagrafica cliente per lo spostamento delle scadenze dei mesi vietato
    GG := DatiSogg.FieldByName('SALTAMESESPOSTAALGIORNO').AsInteger;
    // Per default li sposta tutti alla fine del mese
    if GG < 1 then
      GG := 31;
    // Si Assicura che il giorno non superi la fine del mese
    GG := ControllaFineMese(GG, MM, AA);
    // RItorna la data modificata
    Result := EncodeDate(AA, MM, GG);
  end
  else
  begin
    // RItorna la data non modificatas
    Result := Data;
  end;
end;

function TDM1.CalcolaDataScadenza(Data: TDateTime; Giorni: Integer; FM: String; DatiSogg: TIB_Cursor): TDateTime;
var
  AA, MM, GG: Word;
  Mesi: Integer;
  SpostaScadAlGiorno: Integer;
begin
  // Prima di tutto pone nella variabile locale il campo SpostaScadAlGiorno
  SpostaScadAlGiorno := DatiSogg.FieldByName('SPOSTASCADALGIORNO').AsInteger;
  // Cnoverte i giorni in mesi
  Mesi := Trunc(Giorni / 30);
  // Decodifica la data ottenuta e aggiunge i mesi per il calcolo della
  // data e poi la ricompone in formato TDateTime
  DecodeDate(Data, AA, MM, GG);
  MM := MM + Mesi;
  // Se SpostaScadAlGiorno > 0 decrementa il mese di 1 per compensare il fatto che la data della scadenza precedente
  // è stata spostata (altrimenti in 30/60GG salterebbe un mese nella 2° scadenza).
  // Solo sulle scadenze successive alla prima (Per controllare se è la prima controlla la corrispondenza
  // della data di riferimento ricevuta con il parametro Data e la Data del documento).
  if (Data <> PreventiviOrdiniForm.QryDocumentoDataDocumento.AsDateTime) and (SpostaScadAlGiorno > 0) then
  begin
    Dec(MM);
    // Controlla che il mese così ottenuto non sia superiore o uguale a 12, nel qual caso provvede
    // ad incrementare l'anno e a rimettere a posto il mese di conseguenza.
    // NB: In questo caso si controlla se il mese è uguale o maggiore e non semplicemente maggiore
    // di 12 per compensare il fatto che si èmandato indietro il mese per compensare lo spostamento di data.
    while MM >= 12 do
    begin
      // if MM >= 12 then begin
      AA := AA + 1;
      MM := MM - 12;
    end;
    // Altrimenti procede regolarmente
  end
  else
  begin
    // Controlla che il mese così ottenuto non sia superiore a 12, nel qual caso provvede
    // ad incrementare l'anno e a rimettere a posto il mese di conseguenza.
    while MM > 12 do
    begin
      // if MM > 12 then begin
      AA := AA + 1;
      MM := MM - 12;
    end;
  end;
  // Se la scadenza deve essere portata a fine mese...
  if FM = 'T' then
    GG := FineMese(GG, MM);
  // Se è impostato di spostare le scadenze ad un dato giorno del mese successivo, lo esegue
  if SpostaScadAlGiorno > 0 then
  begin
    Inc(MM); // Mese successivo
    // Se il mese > 12 corregge anno e mese
    if MM > 12 then
    begin
      Dec(MM, 12);
      Inc(AA, 1);
    end;
    GG := DatiSogg.FieldByName('SPOSTASCADALGIORNO').AsInteger; // Giorno del mese successivo
  end;
  // Controlla che giorni della data calcolata non siano superiori
  // alla fine del mese (es. 31 novembre) nel qual caso la riporta
  // alla corretta fine del mese.
  GG := ControllaFineMese(GG, MM, AA);
  // Ritorna la data ottenuta
  Result := EncodeDate(AA, MM, GG);
end;

function TDM1.FineMese(GG, MM: Integer): Integer;
begin
  case MM of
    1, 3, 5, 7, 8, 10, 12:
      GG := 31;
    4, 6, 9, 11:
      GG := 30;
    2:
      GG := 28;
  end;
  Result := GG;
end;

function TDM1.CalcolaTotaleCampoStr(Source: TIBODataset; Campo: String): String;
var
  Tot: Real;
  PrecPos: TBookmark;
begin
  Tot := 0;
  Source.DisableControls;
  PrecPos := Source.Bookmark;
  Source.First;
  while not Source.Eof do
  begin
    Tot := Tot + Source.FieldByName(Campo).AsFloat;
    Source.Next;
  end;
  Source.Bookmark := PrecPos;
  Source.EnableControls;
  Result := FormatCurr(FormatSettings.CurrencyString + ' #' + FormatSettings.ThousandSeparator + '###' + FormatSettings.DecimalSeparator + '##', Tot);
end;

function TDM1.GetLeftPosition: Integer;
begin
  if Screen.Width > 800 then
    Result := Round((Screen.Width - 800) / 2)
  else
    Result := 0;
end;

function TDM1.GetTopPosition: Integer;
begin
  if Screen.Height > 600 then
    Result := Round((Screen.Height - 600) / 2)
  else
    Result := 0;
end;

// Procedura che crea i triggers
procedure TDM1.CreaTriggers;
var
  Q1: TIB_Cursor;
begin
  Exit;
  // Inizializzazione
  DM1.ShowWait('', 'Inizializzazione creazione triggers');
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.GenDBFile;
    Q1.IB_Connection := DM1.DBGenerale;
    // ========================================================================
    // CREAZIONE TRIGGER REPOSOTORY
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione trigger: REPOSITORY_VERSIONE_UPDATE');
    Q1.SQL.Clear;

    // Q1.SQL.Add('SET TERM !! ;');
    Q1.SQL.Add('CREATE TRIGGER REPOSITORY_VERSION_UPDATE FOR REPOSITORY');
    Q1.SQL.Add('BEFORE UPDATE AS');
    Q1.SQL.Add('BEGIN');
    Q1.SQL.Add('  NEW.VERSIONE = (OLD.VERSIONE + 1);');
    Q1.SQL.Add('END');
    // Q1.SQL.Add('SET TERM ; !!');

    Q1.ExecSQL;
    // ========================================================================
  finally
    DM1.ShowWait('', 'Fine creazione triggers');
    Q1.Free;
  end;
end;

// Procedura che elimina tutti i triggers dal database
procedure TDM1.EliminaTriggers;
var
  Q1, Q2: TIB_Cursor;
begin
  Exit;
  // Inizializzazione
  DM1.ShowWait('', 'Inizializzazione controllo triggers');
  Q1 := TIB_Cursor.Create(Self);
  Q2 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.GenDBFile;
    Q1.IB_Connection := DM1.DBGenerale;
    Q2.DatabaseName := DM1.GenDBFile;
    Q2.IB_Connection := DM1.DBGenerale;
    // ========================================================================
    // ELIMINAZIONE DI TUTTE I TRIGGERS DEL DATABASE
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Caricamento elenco triggers');
    Q1.SQL.Clear;
    Q1.SQL.Add('SELECT DISTINCT RDB$TRIGGER_NAME FROM RDB$TRIGGERS WHERE RDB$TRIGGER_NAME NOT LIKE ''RDB$%''');
    Q1.Open;
    // Cicla per tutte le viste trovate e le elimina
    while not Q1.Eof do
    begin
      // Elimina la vista corrente
      DM1.ShowWait('', 'Rimozione trigger: ' + Q1.Fields[0].AsString);
      Q2.SQL.Clear;
      Q2.SQL.Add('DROP TRIGGER ' + Q1.Fields[0].AsString);
      Q2.ExecSQL;
      // Va alla prossima vista da eliminare
      Q1.Next;
    end;
    Q1.Close
    // ========================================================================
  finally
    DM1.ShowWait('', 'Fine rimozione triggers');
    if Q1.Active then
      Q1.Close;
    if Q2.Active then
      Q2.Close;
    Q1.Free;
    Q2.Free;
  end;
end;

// Procvedure che, durante la ristrutturazione genera i GUID per i righi
// che ne sono sprovvisti.
procedure TDM1.GeneraGuidMancantiNeiRighi;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;
    Q1.SQL.Add('UPDATE RIGHIPRV SET GUID=GENERA_GUID(), GUID_REF=GUID WHERE GUID IS NULL');
    Q1.ExecSQL;
  finally
    Q1.Free;
  end;
end;

// Funzione che ritorna true se la UDF esiste
function TDM1.UDFExists(Nome: String): Boolean;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;
    Q1.SQL.Add('SELECT COUNT(*) FROM RDB$FUNCTIONS WHERE RDB$FUNCTION_NAME=''' + Nome + '''');
    Q1.Open;
    Result := (Q1.Fields[0].AsInteger > 0);
    Q1.Close;
  finally
    Q1.Free;
  end;
end;

// Funzione che ritorna true se la vista esiste
function TDM1.VistaExists(NomeVista: String): Boolean;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;
    Q1.SQL.Add('SELECT COUNT(*) FROM RDB$VIEW_RELATIONS WHERE RDB$VIEW_NAME=''' + NomeVista + '''');
    Q1.Open;
    Result := (Q1.Fields[0].AsInteger > 0);
    Q1.Close;
  finally
    Q1.Free;
  end;
end;

// Funzione che ritorna true se la vista esiste
function TDM1.StoredProcedureExists(NomeSP: String): Boolean;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;
    Q1.SQL.Add('SELECT COUNT(*) FROM RDB$PROCEDURES WHERE RDB$PROCEDURE_NAME=''' + NomeSP + '''');
    Q1.Open;
    Result := (Q1.Fields[0].AsInteger > 0);
    Q1.Close;
  finally
    Q1.Free;
  end;
end;

// Funzione che ritorna true se la vista esiste
function TDM1.TriggerExists(NomeTrigger: String): Boolean;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;
    Q1.SQL.Add('SELECT COUNT(*) FROM RDB$TRIGGERS WHERE RDB$TRIGGER_NAME=''' + NomeTrigger + '''');
    Q1.Open;
    Result := (Q1.Fields[0].AsInteger > 0);
    Q1.Close;
  finally
    Q1.Free;
  end;
end;

// Procedura che aggiorna la vista necessaria per il nuovo magazzino
procedure TDM1.EliminaViste;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  DM1.ShowWait('', 'Inizializzazione controllo viste');
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;

    // ------------------------------------------------------------------------
    // Elimina trigger LDE_PUZZLE_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: LDE_PUZZLE_AFTERDELETE');
    if TriggerExists('LDE_PUZZLE_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER LDE_PUZZLE_AFTERDELETE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    // Elimina trigger LDE_PAGINE_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: LDE_PAGINE_AFTERDELETE');
    if TriggerExists('LDE_PAGINE_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER LDE_PAGINE_AFTERDELETE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // ------------------------------------------------------------------------
    // Elimina trigger LDE_DOCUMENTI_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: LDE_DOCUMENTI_AFTERDELETE');
    if TriggerExists('LDE_DOCUMENTI_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER LDE_DOCUMENTI_AFTERDELETE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina trigger PRVORDCL_FE_BEFOREINSERT
    DM1.ShowWait('', 'Rimozione trigger: PRVORDCL_FE_BEFOREINSERT');
    if TriggerExists('PRVORDCL_FE_BEFOREINSERT') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRVORDCL_FE_BEFOREINSERT');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina trigger PRVORDCL_DOCCORRELATI_BEFOREINSERT
    DM1.ShowWait('', 'Rimozione trigger: PRVORDCL_DOCCORRELATI_BI');
    if TriggerExists('PRVORDCL_DOCCORRELATI_BI') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRVORDCL_DOCCORRELATI_BI');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina trigger LABSOGG_BEFOREINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: LABSOGG_BEFOREINSERTUPDATE');
    if TriggerExists('LABSOGG_BEFOREINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER LABSOGG_BEFOREINSERTUPDATE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina trigger LABART_BEFOREINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: LABART_BEFOREINSERTUPDATE');
    if TriggerExists('LABART_BEFOREINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER LABART_BEFOREINSERTUPDATE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina stored procedure EVENT_UPDATE
    DM1.ShowWait('', 'Rimozione stored procedure: EVENT_UPDATE');
    if StoredProcedureExists('EVENT_UPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE EVENT_UPDATE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure EVENT_IMPEGNO_REF_STORE
    DM1.ShowWait('', 'Rimozione stored procedure: EVENT_IMPEGNO_REF_STORE');
    if StoredProcedureExists('EVENT_IMPEGNO_REF_STORE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE EVENT_IMPEGNO_REF_STORE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina stored procedure TASK_IMPEGNO_REF_STORE
    DM1.ShowWait('', 'Rimozione stored procedure: TASK_IMPEGNO_REF_STORE');
    if StoredProcedureExists('TASK_IMPEGNO_REF_STORE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE TASK_IMPEGNO_REF_STORE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina trigger COM_STORICO_BEFOREINSERT
    DM1.ShowWait('', 'Rimozione trigger: COM_STORICO_BEFOREINSERT');
    if TriggerExists('COM_STORICO_BEFOREINSERT') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER COM_STORICO_BEFOREINSERT');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina trigger COM_MESSAGGI_BEFOREINSERT
    DM1.ShowWait('', 'Rimozione trigger: COM_MESSAGGI_BEFOREINSERT');
    if TriggerExists('COM_MESSAGGI_BEFOREINSERT') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER COM_MESSAGGI_BEFOREINSERT');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina trigger COM_MESSAGGI_BEFOREUPDATE
    DM1.ShowWait('', 'Rimozione trigger: COM_MESSAGGI_BEFOREUPDATE');
    if TriggerExists('COM_MESSAGGI_BEFOREUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER COM_MESSAGGI_BEFOREUPDATE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina trigger COM_MESSAGGI_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: COM_MESSAGGI_AFTERDELETE');
    if TriggerExists('COM_MESSAGGI_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER COM_MESSAGGI_AFTERDELETE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure COM_CREAPREDEFINITE
    DM1.ShowWait('', 'Rimozione stored procedure: COM_CREAPREDEFINITE');
    if StoredProcedureExists('COM_CREAPREDEFINITE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE COM_CREAPREDEFINITE');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina vista COM_ELENCO_VIEW
    DM1.ShowWait('', 'Rimozione vista: COM_ELENCO_VIEW');
    if VistaExists('COM_ELENCO_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW COM_ELENCO_VIEW');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure COM_GET_RIF_INFO
    DM1.ShowWait('', 'Rimozione stored procedure: COM_GET_RIF_INFO');
    if StoredProcedureExists('COM_GET_RIF_INFO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE COM_GET_RIF_INFO');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure COM_LIST_PROC
    DM1.ShowWait('', 'Rimozione stored procedure: COM_LIST_PROC');
    if StoredProcedureExists('COM_LIST_PROC') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE COM_LIST_PROC');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina vista COM_BASE_VIEW
    DM1.ShowWait('', 'Rimozione vista: COM_BASE_VIEW');
    if VistaExists('COM_BASE_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW COM_BASE_VIEW');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina stored procedure ALLEGATI_MANUT_EXPORT_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: ALLEGATI_MANUT_EXPORT_LIST_VIEW');
    if VistaExists('ALLEGATI_MANUT_EXPORT_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW ALLEGATI_MANUT_EXPORT_LIST_VIEW');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPIANTI_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: IMPIANTI_LIST_VIEW');
    if VistaExists('IMPIANTI_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW IMPIANTI_LIST_VIEW');
      Q1.ExecSQL;
    end;
    // Elimina la Stored Procedure IMPIANTI_HIGHLIGHTS (usata dalla IMPIANTI_LIST_VIEW)
    DM1.ShowWait('', 'Rimozione vista: IMPIANTI_HIGHLIGHTS');
    if StoredProcedureExists('IMPIANTI_HIGHLIGHTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPIANTI_HIGHLIGHTS');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPEGNI_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: IMPEGNI_LIST_VIEW');
    if VistaExists('IMPEGNI_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW IMPEGNI_LIST_VIEW');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure SOGG_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: SOGG_LIST_VIEW');
    if VistaExists('SOGG_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW SOGG_LIST_VIEW');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure PRAT_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: PRAT_LIST_VIEW');
    if VistaExists('PRAT_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW PRAT_LIST_VIEW');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure AGENDA_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: AGENDA_LIST_VIEW');
    if VistaExists('AGENDA_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW AGENDA_LIST_VIEW');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure STRADARIO_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: STRADARIO_LIST_VIEW');
    if VistaExists('STRADARIO_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW STRADARIO_LIST_VIEW');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina stored procedure STRADARIO_CERTIFICATO
    DM1.ShowWait('', 'Rimozione vista: STRADARIO_CERTIFICATO');
    if StoredProcedureExists('STRADARIO_CERTIFICATO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE STRADARIO_CERTIFICATO');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPIANTI_URGENTI_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: IMPIANTI_URGENTI_EXISTS');
    if StoredProcedureExists('IMPIANTI_URGENTI_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPIANTI_URGENTI_EXISTS');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure SOGG_URGENTI_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: SOGG_URGENTI_EXISTS');
    if StoredProcedureExists('SOGG_URGENTI_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE SOGG_URGENTI_EXISTS');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPIANTI_PRESCRIZ_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: IMPIANTI_PRESCRIZ_EXISTS');
    if StoredProcedureExists('IMPIANTI_PRESCRIZ_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPIANTI_PRESCRIZ_EXISTS');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure IMPEGNI_PRESCRIZ_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: IMPEGNI_PRESCRIZ_EXISTS');
    if StoredProcedureExists('IMPEGNI_PRESCRIZ_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPEGNI_PRESCRIZ_EXISTS');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure SOGG_PRESCRIZ_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: SOGG_PRESCRIZ_EXISTS');
    if StoredProcedureExists('SOGG_PRESCRIZ_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE SOGG_PRESCRIZ_EXISTS');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPIANTI_CHIAMATE_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: IMPIANTI_CHIAMATE_EXISTS');
    if StoredProcedureExists('IMPIANTI_CHIAMATE_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPIANTI_CHIAMATE_EXISTS');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure SOGG_CHIAMATE_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: SOGG_CHIAMATE_EXISTS');
    if StoredProcedureExists('SOGG_CHIAMATE_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE SOGG_CHIAMATE_EXISTS');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPIANTI_ALLEGATITOSEND_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: IMPIANTI_ALLEGATITOSEND_EXISTS');
    if StoredProcedureExists('IMPIANTI_ALLEGATITOSEND_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPIANTI_ALLEGATITOSEND_EXISTS');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPIANTI_CORRISPNOPAG_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: IMPIANTI_CORRISPNOPAG_EXISTS');
    if StoredProcedureExists('IMPIANTI_CORRISPNOPAG_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPIANTI_CORRISPNOPAG_EXISTS');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure SOGG_CORRISPNOPAG_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: SOGG_CORRISPNOPAG_EXISTS');
    if StoredProcedureExists('SOGG_CORRISPNOPAG_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE SOGG_CORRISPNOPAG_EXISTS');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPIANTI_SCADSOFF_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: IMPIANTI_SCADSOFF_EXISTS');
    if StoredProcedureExists('IMPIANTI_SCADSOFF_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPIANTI_SCADSOFF_EXISTS');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure SOGG_SCADSOFF_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: SOGG_SCADSOFF_EXISTS');
    if StoredProcedureExists('SOGG_SCADSOFF_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE SOGG_SCADSOFF_EXISTS');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // Elimina trigger AGENTI1_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: AGENTI1_AFTERUPDATE');
    if TriggerExists('AGENTI1_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER AGENTI1_AFTERUPDATE');
      Q1.ExecSQL;
    end;
    // Elimina trigger AGENTI2_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: AGENTI2_AFTERUPDATE');
    if TriggerExists('AGENTI2_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER AGENTI2_AFTERUPDATE');
      Q1.ExecSQL;
    end;
    // Elimina trigger AGENTI3_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: AGENTI3_AFTERUPDATE');
    if TriggerExists('AGENTI3_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER AGENTI3_AFTERUPDATE');
      Q1.ExecSQL;
    end;
    // Elimina trigger AGENTI4_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: AGENTI4_AFTERUPDATE');
    if TriggerExists('AGENTI4_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER AGENTI4_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRATAPP_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: PRATAPP_AFTERDELETE');
    if TriggerExists('PRATAPP_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRATAPP_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRATAPP_BEFOREINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: PRATAPP_BEFOREINSERTUPDATE');
    if TriggerExists('PRATAPP_BEFOREINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRATAPP_BEFOREINSERTUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger IMPEGNI_AFTERUPDATE
    // nb: Questo era il trigger vecchio ma lo lascio perchè se c'è lo deve eliminare
    DM1.ShowWait('', 'Rimozione trigger: IMPEGNI_AFTERUPDATE');
    if TriggerExists('IMPEGNI_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER IMPEGNI_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger IMPEGNI_AFTERINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: IMPEGNI_AFTERINSERTUPDATE');
    if TriggerExists('IMPEGNI_AFTERINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER IMPEGNI_AFTERINSERTUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger IMPEGNI_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: IMPEGNI_AFTERDELETE');
    if TriggerExists('IMPEGNI_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER IMPEGNI_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger ALLEGATI_BEFOREINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: ALLEGATI_BEFOREINSERTUPDATE');
    if TriggerExists('ALLEGATI_BEFOREINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER ALLEGATI_BEFOREINSERTUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger ALLEGATIMAN_BEFOREINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: ALLEGATIMAN_BEFOREINSERTUPDATE');
    if TriggerExists('ALLEGATIMAN_BEFOREINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER ALLEGATIMAN_BEFOREINSERTUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRATICHE_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: PRATICHE_AFTERDELETE');
    if TriggerExists('PRATICHE_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRATICHE_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRATICHE_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: PRATICHE_AFTERUPDATE');
    if TriggerExists('PRATICHE_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRATICHE_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRATICHE_BEFOREINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: PRATICHE_BEFOREINSERTUPDATE');
    if TriggerExists('PRATICHE_BEFOREINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRATICHE_BEFOREINSERTUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger CLIENTI_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: CLIENTI_AFTERUPDATE');
    if TriggerExists('CLIENTI_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER CLIENTI_AFTERUPDATE');
      Q1.ExecSQL;
    end;
    // Elimina trigger CLIENTI_BEFOREINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: CLIENTI_BEFOREINSERTUPDATE');
    if TriggerExists('CLIENTI_BEFOREINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER CLIENTI_BEFOREINSERTUPDATE');
      Q1.ExecSQL;
    end;
    // Elimina trigger CLIENTI_DELETE
    DM1.ShowWait('', 'Rimozione trigger: CLIENTI_AFTERDELETE');
    if TriggerExists('CLIENTI_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER CLIENTI_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRIMANOT_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: PRIMANOT_AFTERUPDATE');
    if TriggerExists('PRIMANOT_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRIMANOT_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRIMANOT_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: PRIMANOT_AFTERDELETE');
    if TriggerExists('PRIMANOT_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRIMANOT_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger SCADENZ_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: SCADENZ_AFTERUPDATE');
    if TriggerExists('SCADENZ_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER SCADENZ_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger SCADENZ_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: SCADENZ_AFTERDELETE');
    if TriggerExists('SCADENZ_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER SCADENZ_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger RAPGIORN_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: RAPGIORN_AFTERUPDATE');
    if TriggerExists('RAPGIORN_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER RAPGIORN_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger RAPGIORN_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: RAPGIORN_AFTERDELETE');
    if TriggerExists('RAPGIORN_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER RAPGIORN_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger TESTI_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: TESTI_AFTERUPDATE');
    if TriggerExists('TESTI_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER TESTI_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger TESTI_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: TESTI_AFTERDELETE');
    if TriggerExists('TESTI_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER TESTI_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger CONFORM_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: CONFORM_AFTERUPDATE');
    if TriggerExists('CONFORM_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER CONFORM_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger CONFORM_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: CONFORM_AFTERDELETE');
    if TriggerExists('CONFORM_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER CONFORM_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRVORDCL_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: PRVORDCL_AFTERUPDATE');
    if TriggerExists('PRVORDCL_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRVORDCL_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger PRVORDCL_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: PRVORDCL_AFTERDELETE');
    if TriggerExists('PRVORDCL_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER PRVORDCL_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger EXTFILE_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: EXTFILE_AFTERUPDATE');
    if TriggerExists('EXTFILE_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER EXTFILE_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger EXTFILE_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: EXTFILE_AFTERDELETE');
    if TriggerExists('EXTFILE_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER EXTFILE_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger MAGAZZINI_BEFOREINSERTUPDATE
    DM1.ShowWait('', 'Rimozione trigger: MAGAZZINI_BEFOREINSERTUPDATE');
    if TriggerExists('MAGAZZINI_BEFOREINSERTUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER MAGAZZINI_BEFOREINSERTUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger ARTICOLI_BEFOREINSERT
    DM1.ShowWait('', 'Rimozione trigger: ARTICOLI_BEFOREINSERT');
    if TriggerExists('ARTICOLI_BEFOREINSERT') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER ARTICOLI_BEFOREINSERT');
      Q1.ExecSQL;
    end;

    // Elimina trigger ARTICOLI_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: ARTICOLI_AFTERUPDATE');
    if TriggerExists('ARTICOLI_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER ARTICOLI_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger ARTICOLI_BEFOREUPDATE
    DM1.ShowWait('', 'Rimozione trigger: ARTICOLI_BEFOREUPDATE');
    if TriggerExists('ARTICOLI_BEFOREUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER ARTICOLI_BEFOREUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger ARTICOLI_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: ARTICOLI_AFTERDELETE');
    if TriggerExists('ARTICOLI_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER ARTICOLI_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger ANAGMAGA_BEFOREUPDATE
    DM1.ShowWait('', 'Rimozione trigger: ANAGMAGA_BEFOREUPDATE');
    if TriggerExists('ANAGMAGA_BEFOREUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER ANAGMAGA_BEFOREUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina trigger ANAGMAGA_BEFOREINSERT
    DM1.ShowWait('', 'Rimozione trigger: ANAGMAGA_BEFOREINSERT');
    if TriggerExists('ANAGMAGA_BEFOREINSERT') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER ANAGMAGA_BEFOREINSERT');
      Q1.ExecSQL;
    end;

    // Elimina trigger RIGHIPRV_COSTOMEDIO_AFTERDELETE
    DM1.ShowWait('', 'Rimozione trigger: RIGHIPRV_COSTOMEDIO_AFTERDELETE');
    if TriggerExists('RIGHIPRV_COSTOMEDIO_AFTERDELETE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER RIGHIPRV_COSTOMEDIO_AFTERDELETE');
      Q1.ExecSQL;
    end;

    // Elimina trigger RIGHIPRV_COSTOMEDIO_AFTERINSERT
    DM1.ShowWait('', 'Rimozione trigger: RIGHIPRV_COSTOMEDIO_AFTERINSERT');
    if TriggerExists('RIGHIPRV_COSTOMEDIO_AFTERINSERT') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER RIGHIPRV_COSTOMEDIO_AFTERINSERT');
      Q1.ExecSQL;
    end;

    // Elimina trigger RIGHIPRV_COSTOMEDIO_AFTERUPDATE
    DM1.ShowWait('', 'Rimozione trigger: RIGHIPRV_COSTOMEDIO_AFTERUPDATE');
    if TriggerExists('RIGHIPRV_COSTOMEDIO_AFTERUPDATE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP TRIGGER RIGHIPRV_COSTOMEDIO_AFTERUPDATE');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure IMP_PRESCRIZIONI_VIEW
    DM1.ShowWait('', 'Rimozione vista: IMP_PRESCRIZIONI_VIEW');
    if VistaExists('IMP_PRESCRIZIONI_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW IMP_PRESCRIZIONI_VIEW');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure OP_CREAPREDEFINITE
    DM1.ShowWait('', 'Rimozione stored procedure: OP_CREAPREDEFINITE');
    if StoredProcedureExists('OP_CREAPREDEFINITE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE OP_CREAPREDEFINITE');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure OP_EXISTS
    DM1.ShowWait('', 'Rimozione stored procedure: OP_EXISTS');
    if StoredProcedureExists('OP_EXISTS') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE OP_EXISTS');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure IMP_ULTIMI_INTERVENTI_VIEW
    DM1.ShowWait('', 'Rimozione vista: IMP_ULTIMI_INTERVENTI_VIEW');
    if VistaExists('IMP_ULTIMI_INTERVENTI_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW IMP_ULTIMI_INTERVENTI_VIEW');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GET_PARAM_ALLEGATIFG
    DM1.ShowWait('', 'Rimozione stored procedure: GET_PARAM_ALLEGATIFG');
    if StoredProcedureExists('GET_PARAM_ALLEGATIFG') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GET_PARAM_ALLEGATIFG');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GET_PARAM_FOGLIO_LAVORO
    DM1.ShowWait('', 'Rimozione stored procedure: GET_PARAM_FOGLIO_LAVORO');
    if StoredProcedureExists('GET_PARAM_FOGLIO_LAVORO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GET_PARAM_FOGLIO_LAVORO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure PRATAPP_GETSCADENZAGARANZIA
    DM1.ShowWait('', 'Rimozione stored procedure: PRATAPP_GETSCADENZAGARANZIA');
    if StoredProcedureExists('PRATAPP_GETSCADENZAGARANZIA') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE PRATAPP_GETSCADENZAGARANZIA');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure IMP_AGGIORNA_TECNICO_ALL
    DM1.ShowWait('', 'Rimozione stored procedure: IMP_AGGIORNA_TECNICO_ALL');
    if StoredProcedureExists('IMP_AGGIORNA_TECNICO_ALL') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMP_AGGIORNA_TECNICO_ALL');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure ALLIMP_EXPORT_SEL_ENTI
    DM1.ShowWait('', 'Rimozione stored procedure: ALLIMP_EXPORT_SEL_ENTI');
    if StoredProcedureExists('ALLIMP_EXPORT_SEL_ENTI') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE ALLIMP_EXPORT_SEL_ENTI');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure PROC_ALLIMP_TODO
    DM1.ShowWait('', 'Rimozione stored procedure: ALLIMP_TODO');
    if StoredProcedureExists('ALLIMP_TODO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE ALLIMP_TODO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure ALLIMP_NUOVO_ALLEGATO_FG
    DM1.ShowWait('', 'Rimozione stored procedure: ALLIMP_NUOVO_ALLEGATO_FG');
    if StoredProcedureExists('ALLIMP_NUOVO_ALLEGATO_FG') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE ALLIMP_NUOVO_ALLEGATO_FG');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure ALLIMP_COPIA_DATI_ALLEGATI_FG
    DM1.ShowWait('', 'Rimozione stored procedure: ALLIMP_COPIA_DATI_ALLEGATI_FG');
    if StoredProcedureExists('ALLIMP_COPIA_DATI_ALLEGATI_FG') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE ALLIMP_COPIA_DATI_ALLEGATI_FG');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure ALL_PING_ALARM
    DM1.ShowWait('', 'Rimozione stored procedure: ALL_PING_ALARM');
    if StoredProcedureExists('ALL_PING_ALARM') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE ALL_PING_ALARM');
      Q1.ExecSQL;
    end;

    // Elimina vista ALLEGATI_VIEW
    DM1.ShowWait('', 'Rimozione vista: ALLEGATI_VIEW');
    if VistaExists('ALLEGATI_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW ALLEGATI_VIEW');
      Q1.ExecSQL;
    end;

    // Elimina vista GOS_ORE
    DM1.ShowWait('', 'Rimozione vista: GOS_ORE');
    if VistaExists('GOS_ORE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GOS_ORE');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_BASE
    DM1.ShowWait('', 'Rimozione stored procedure: GC_BASE');
    if StoredProcedureExists('GC_BASE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_BASE');
      Q1.ExecSQL;
    end;

    // Elimina vista GC_BASE_RIGHI_NEW
    DM1.ShowWait('', 'Rimozione vista: GC_BASE_RIGHI_NEW');
    if VistaExists('GC_BASE_RIGHI_NEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GC_BASE_RIGHI_NEW');
      Q1.ExecSQL;
    end;

    // Elimina vista GC_BASE_SEZIONI
    DM1.ShowWait('', 'Rimozione vista: GC_BASE_SEZIONI');
    if VistaExists('GC_BASE_SEZIONI') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GC_BASE_SEZIONI');
      Q1.ExecSQL;
    end;

    // Elimina vista GC_BASE_GUADAGNI
    DM1.ShowWait('', 'Rimozione vista: GC_BASE_GUADAGNI');
    if VistaExists('GC_BASE_GUADAGNI') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GC_BASE_GUADAGNI');
      Q1.ExecSQL;
    end;

    // Elimina vista GC_BASE_IMPORTI
    DM1.ShowWait('', 'Rimozione vista: GC_BASE_IMPORTI');
    if VistaExists('GC_BASE_IMPORTI') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GC_BASE_IMPORTI');
      Q1.ExecSQL;
    end;

    // Elimina vista GC_BASE_PRZVEND
    DM1.ShowWait('', 'Rimozione vista: GC_BASE_PRZVEND');
    if VistaExists('GC_BASE_PRZVEND') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GC_BASE_PRZVEND');
      Q1.ExecSQL;
    end;

    // Elimina vista GC_BASE_COSTOMEDIO
    DM1.ShowWait('', 'Rimozione vista: GC_BASE_COSTOMEDIO');
    if VistaExists('GC_BASE_COSTOMEDIO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GC_BASE_COSTOMEDIO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_SET_COSTO_MEDIO_ARTICOLO
    DM1.ShowWait('', 'Rimozione stored procedure: GC_SET_COSTO_MEDIO_ARTICOLO');
    if StoredProcedureExists('GC_SET_COSTO_MEDIO_ARTICOLO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_SET_COSTO_MEDIO_ARTICOLO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_GET_COSTO_MEDIO_ARTICOLO
    DM1.ShowWait('', 'Rimozione stored procedure: GC_GET_COSTO_MEDIO_ARTICOLO');
    if StoredProcedureExists('GC_GET_COSTO_MEDIO_ARTICOLO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_GET_COSTO_MEDIO_ARTICOLO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_CALCOLA_COSTO_MEDIO_ARTICOLO
    DM1.ShowWait('', 'Rimozione stored procedure: GC_CALCOLA_COSTO_MEDIO_ARTICOLO');
    if StoredProcedureExists('GC_CALCOLA_COSTO_MEDIO_ARTICOLO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_CALCOLA_COSTO_MEDIO_ARTICOLO');
      Q1.ExecSQL;
    end;

    // Elimina vista GC_BASE_RIGHI
    DM1.ShowWait('', 'Rimozione vista: GC_BASE_RIGHI');
    if VistaExists('GC_BASE_RIGHI') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GC_BASE_RIGHI');
      Q1.ExecSQL;
    end;

    // Elimina vista GC_BASE_RIGHI_NEW
    DM1.ShowWait('', 'Rimozione vista: GC_BASE_RIGHI_NEW');
    if VistaExists('GC_BASE_RIGHI_NEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW GC_BASE_RIGHI_NEW');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_IS_RIGOPRV_DA_VISUALIZZARE
    DM1.ShowWait('', 'Rimozione stored procedure: GC_IS_RIGOPRV_DA_VISUALIZZARE');
    if StoredProcedureExists('GC_IS_RIGOPRV_DA_VISUALIZZARE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_IS_RIGOPRV_DA_VISUALIZZARE');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_IS_RIGO_MANODOPERA_CON_DETT
    DM1.ShowWait('', 'Rimozione stored procedure: GC_IS_RIGO_MANODOPERA_CON_DETT');
    if StoredProcedureExists('GC_IS_RIGO_MANODOPERA_CON_DETT') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_IS_RIGO_MANODOPERA_CON_DETT');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_ISMANODOPERA
    DM1.ShowWait('', 'Rimozione stored procedure: GC_ISMANODOPERA');
    if StoredProcedureExists('GC_ISMANODOPERA') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_ISMANODOPERA');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_CODART_TO_OPERADESCRIZIONE
    DM1.ShowWait('', 'Rimozione stored procedure: GC_CODART_TO_OPERADESCRIZIONE');
    if StoredProcedureExists('GC_CODART_TO_OPERADESCRIZIONE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_CODART_TO_OPERADESCRIZIONE');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_CODART_TO_OPERAINDEX
    DM1.ShowWait('', 'Rimozione stored procedure: GC_CODART_TO_OPERAINDEX');
    if StoredProcedureExists('GC_CODART_TO_OPERAINDEX') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_CODART_TO_OPERAINDEX');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_GET_PRZVEND_COMMESSA
    DM1.ShowWait('', 'Rimozione stored procedure: GC_GET_PRZVEND_COMMESSA');
    if StoredProcedureExists('GC_GET_PRZVEND_COMMESSA') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_GET_PRZVEND_COMMESSA');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_GET_PRESENTEINCOMMESSA
    DM1.ShowWait('', 'Rimozione stored procedure: GC_GET_PRESENTEINCOMMESSA');
    if StoredProcedureExists('GC_GET_PRESENTEINCOMMESSA') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_GET_PRESENTEINCOMMESSA');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_GET_RICARICO
    DM1.ShowWait('', 'Rimozione stored procedure: GC_GET_RICARICO');
    if StoredProcedureExists('GC_GET_RICARICO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_GET_RICARICO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_GET_RICARICO_FP
    DM1.ShowWait('', 'Rimozione stored procedure: GC_GET_RICARICO_FP');
    if StoredProcedureExists('GC_GET_RICARICO_FP') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_GET_RICARICO_FP');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GC_TRACK_DOC
    DM1.ShowWait('', 'Rimozione stored procedure: GC_TRACK_DOC');
    if StoredProcedureExists('GC_TRACK_DOC') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GC_TRACK_DOC');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_CONV1_PARTE1
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_CONV1_PARTE1');
    if StoredProcedureExists('MAG_CONV1_PARTE1') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_CONV1_PARTE1');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_CONV1_PARTE2
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_CONV1_PARTE2');
    if StoredProcedureExists('MAG_CONV1_PARTE2') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_CONV1_PARTE2');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_CHECK_MOVMAG
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_CHECK_MOVMAG');
    if StoredProcedureExists('MAG_CHECK_MOVMAG') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_CHECK_MOVMAG');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_AZZERAMENTO_MAGAZZINO
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_AZZERAMENTO_MAGAZZINO');
    if StoredProcedureExists('MAG_AZZERAMENTO_MAGAZZINO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_AZZERAMENTO_MAGAZZINO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_SET_GIACENZA_ARTICOLO
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_SET_GIACENZA_ARTICOLO');
    if StoredProcedureExists('MAG_SET_GIACENZA_ARTICOLO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_SET_GIACENZA_ARTICOLO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_CHIUSURA_GENERALE
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_CHIUSURA_GENERALE');
    if StoredProcedureExists('MAG_CHIUSURA_GENERALE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_CHIUSURA_GENERALE');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_CHIUSURA_ARTICOLO
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_CHIUSURA_ARTICOLO');
    if StoredProcedureExists('MAG_CHIUSURA_ARTICOLO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_CHIUSURA_ARTICOLO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_GET_GIACENZE_DETTAGLIO
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_GET_GIACENZE_DETTAGLIO');
    if StoredProcedureExists('MAG_GET_GIACENZE_DETTAGLIO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_GET_GIACENZE_DETTAGLIO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_GET_GIACENZE_ALL
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_GET_GIACENZE_ALL');
    if StoredProcedureExists('MAG_GET_GIACENZE_ALL') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_GET_GIACENZE_ALL');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure MAG_GET_GIACENZE
    DM1.ShowWait('', 'Rimozione stored procedure: MAG_GET_GIACENZE');
    if StoredProcedureExists('MAG_GET_GIACENZE') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE MAG_GET_GIACENZE');
      Q1.ExecSQL;
    end;

    // Elimina vista SCAD_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: SCAD_LIST_VIEW');
    if VistaExists('SCAD_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW SCAD_LIST_VIEW');
      Q1.ExecSQL;
    end;

    // Elimina vista DOC_LIST_VIEW
    DM1.ShowWait('', 'Rimozione vista: DOC_LIST_VIEW');
    if VistaExists('DOC_LIST_VIEW') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW DOC_LIST_VIEW');
      Q1.ExecSQL;
    end;

    // ------------------------------------------------------------------------
    // Elimina stored procedure IMPEGNI_GETAPPARECCHI
    DM1.ShowWait('', 'Rimozione stored procedure: IMPEGNI_GETAPPARECCHI');
    if StoredProcedureExists('IMPEGNI_GETAPPARECCHI') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPEGNI_GETAPPARECCHI');
      Q1.ExecSQL;
    end;
    // ------------------------------------------------------------------------

    // Elimina vista MAG_ART
    DM1.ShowWait('', 'Rimozione vista: MAG_ART');
    if VistaExists('MAG_ART') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP VIEW MAG_ART');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure ART_AUMENTA_PREZZO_LISTINO
    DM1.ShowWait('', 'Rimozione stored procedure: ART_AUMENTA_PREZZO_LISTINO');
    if StoredProcedureExists('ART_AUMENTA_PREZZO_LISTINO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE ART_AUMENTA_PREZZO_LISTINO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure ART_RICALC_LIST_ART_PRZACQFISSO
    DM1.ShowWait('', 'Rimozione stored procedure: ART_RICALC_LIST_ART_PRZACQFISSO');
    if StoredProcedureExists('ART_RICALC_LIST_ART_PRZACQFISSO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE ART_RICALC_LIST_ART_PRZACQFISSO');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure ART_RICALCOLA_LISTINI_ARTICOLO
    DM1.ShowWait('', 'Rimozione stored procedure: ART_RICALCOLA_LISTINI_ARTICOLO');
    if StoredProcedureExists('ART_RICALCOLA_LISTINI_ARTICOLO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE ART_RICALCOLA_LISTINI_ARTICOLO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GET_DA_MONTARE_ARTICOLO
    DM1.ShowWait('', 'Rimozione stored procedure: GET_DA_MONTARE_ARTICOLO');
    if StoredProcedureExists('GET_DA_MONTARE_ARTICOLO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GET_DA_MONTARE_ARTICOLO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure GET_ULTIMOPRZACQUISTO_ARTICOLO
    DM1.ShowWait('', 'Rimozione stored procedure: GET_ULTIMOPRZACQUISTO_ARTICOLO');
    if StoredProcedureExists('GET_ULTIMOPRZACQUISTO_ARTICOLO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE GET_ULTIMOPRZACQUISTO_ARTICOLO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure DOC_NUOVO_RIGO_DOCUMENTO
    DM1.ShowWait('', 'Rimozione stored procedure: GET_ULTIMOPRZACQUISTO_ARTICOLO');
    if StoredProcedureExists('DOC_NUOVO_RIGO_DOCUMENTO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE DOC_NUOVO_RIGO_DOCUMENTO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure DISABLE_INDEX_MAGO
    DM1.ShowWait('', 'Rimozione stored procedure: DISABLE_INDEX_MAGO');
    if StoredProcedureExists('DISABLE_INDEX_MAGO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE DISABLE_INDEX_MAGO');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure OP_ADDNEWOP_TO_IMPIANTI
    DM1.ShowWait('', 'Rimozione stored procedure: OP_ADDNEWOP_TO_IMPIANTI');
    if StoredProcedureExists('OP_ADDNEWOP_TO_IMPIANTI') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE OP_ADDNEWOP_TO_IMPIANTI');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure OP_PRATAPP_ADDALL
    DM1.ShowWait('', 'Rimozione stored procedure: OP_PRATAPP_ADDALL');
    if StoredProcedureExists('OP_PRATAPP_ADDALL') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE OP_PRATAPP_ADDALL');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure OP_PRATAPP_ADD
    DM1.ShowWait('', 'Rimozione stored procedure: OP_PRATAPP_ADD');
    if StoredProcedureExists('OP_PRATAPP_ADD') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE OP_PRATAPP_ADD');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure IMPAPPSEL_SETAPPSEL
    DM1.ShowWait('', 'Rimozione stored procedure: IMPAPPSEL_SETAPPSEL');
    if StoredProcedureExists('IMPAPPSEL_SETAPPSEL') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPAPPSEL_SETAPPSEL');
      Q1.ExecSQL;
    end;
    // Elimina stored procedure IMPAPPSEL_GETSELECTED
    DM1.ShowWait('', 'Rimozione stored procedure: IMPAPPSEL_GETSELECTED');
    if StoredProcedureExists('IMPAPPSEL_GETSELECTED') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE IMPAPPSEL_GETSELECTED');
      Q1.ExecSQL;
    end;

    // Elimina stored procedure PARTITARIO_COMPONINOTADOCUMENTO
    DM1.ShowWait('', 'Rimozione stored procedure: PARTITARIO_COMPONINOTADOCUMENTO');
    if StoredProcedureExists('PARTITARIO_COMPONINOTADOCUMENTO') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP PROCEDURE PARTITARIO_COMPONINOTADOCUMENTO');
      Q1.ExecSQL;
    end;

    // Elimina UDF GUID_GEN
    DM1.ShowWait('', 'Rimozione UDF: GUID_GEN');
    if UDFExists('GENERA_GUID') then
    begin
      Q1.SQL.Clear;
      Q1.SQL.Add('DROP EXTERNAL FUNCTION GENERA_GUID');
      Q1.ExecSQL;
    end;

  finally
    DM1.ShowWait('', 'Fine rimozione viste');
    if Q1.Active then
      Q1.Close;
    Q1.Free;
  end;
end;

procedure TDM1.CreaViste;
var
  Q1: TIB_Cursor;
  S1: TIB_Script;
begin
  // Inizializzazione
  DM1.ShowWait('', 'Inizializzazione creazione viste');
  Q1 := TIB_Cursor.Create(Self);
  S1 := TIB_Script.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;
    Q1.ParamCheck := False;

    S1.IB_Connection := DM1.DBAzienda;

    // Commit work
    Q1.SQL.Clear;
    Q1.SQL.Add('COMMIT WORK');
    Q1.ExecSQL;

    // ========================================================================
    // CREAZIONE DATABASE EXCEPTION
    // ------------------------------------------------------------------------
    // Imposta la query che abilita/disabilita alcuni indici per velocizzare l'importazione dal MAGO
    DM1.ShowWait('', 'Creazione DATABASE EXCEPTIONS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'EXCEPTIONS.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE UDF GENERA_GUID
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione UDF: GENERA_GUID');
    Q1.SQL.Clear;
    Q1.SQL.LoadFromFile(CurrDir + 'UDF_GUID_GEN.SQL');
    Q1.ExecSQL;
    // Forza la generazione dei GUID per i righi che ne sono sprovvisti
    DM1.ShowWait('', 'Genera GUID mancanti nei righi dei documenti...');
    GeneraGuidMancantiNeiRighi;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE PARTITARIO_COMPONINOTADOCUMENTO
    // ------------------------------------------------------------------------
    // Stored Procedure che compone una descrizione contenente la descrizione dei primi righi di un documento
    DM1.ShowWait('', 'Creazione stored procedure: PARTITARIO_COMPONINOTADOCUMENTO');
    Q1.SQL.Clear;
    Q1.SQL.LoadFromFile(CurrDir + 'PROC_PARTITARIO_COMPONINOTADOCUMENTO.SQL');
    Q1.ExecSQL;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE PROC_IMPAPPSEL_SETAPPSEL
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPAPPSEL_SETAPPSEL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPAPPSEL_SETAPPSEL.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE STORED PROCEDURE  IMPAPPSEL_GETSELECTED
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPAPPSEL_GETSELECTED');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPAPPSEL_GETSELECTED.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE OP_PRATAPP_ADD
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge una OP all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: OP_PRATAPP_ADD');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_OP_PRATAPP_ADD.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE STORED PROCEDURE OP_PRATAPP_ADDALL
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: OP_PRATAPP_ADDALL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_OP_PRATAPP_ADDALL.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE STORED PROCEDURE OP_ADDNEWOP_TO_IMPIANTI.SQL
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: OP_ADDNEWOP_TO_IMPIANTI');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_OP_ADDNEWOP_TO_IMPIANTI.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE DISABLE_INDEX_MAGO
    // ------------------------------------------------------------------------
    // Imposta la query che abilita/disabilita alcuni indici per velocizzare l'importazione dal MAGO
    DM1.ShowWait('', 'Creazione stored procedure: DISABLE_INDEX_MAGO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_DISABLE_INDEX_MAGO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE DOC_NUOVO_RIGO_DOCUMENTO
    // ------------------------------------------------------------------------
    // Stored procedure che restituisce l'ultimo prezzo di acquisto di un articolo
    DM1.ShowWait('', 'Creazione stored procedure: DOC_NUOVO_RIGO_DOCUMENTO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_DOC_NUOVO_RIGO_DOCUMENTO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GET_ULTIMOPRZACQUISTO_ARTICOLO
    // ------------------------------------------------------------------------
    // Stored procedure che restituisce l'ultimo prezzo di acquisto di un articolo
    DM1.ShowWait('', 'Creazione stored procedure: GET_ULTIMOPRZACQUISTO_ARTICOLO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GET_ULTIMOPRZACQUISTO_ARTICOLO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GET_DA_MONTARE_ARTICOLO
    // ------------------------------------------------------------------------
    // Stored procedure che restituisce la qtà residua da montare rispetto alla giacenza di un articolo in un cantiere
    DM1.ShowWait('', 'Creazione stored procedure: GET_DA_MONTARE_ARTICOLO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GET_DA_MONTARE_ARTICOLO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE ART_RICALCOLA_LISTINI_ARTICOLO
    // ------------------------------------------------------------------------
    // Stored procedure che ricalcola i listini di vendita e i prezzi di costo
    DM1.ShowWait('', 'Creazione stored procedure: ART_RICALCOLA_LISTINI_ARTICOLO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_ART_RICALCOLA_LISTINI_ARTICOLO.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE STORED PROCEDURE ART_RICALCOLA_LISTINI_ARTICOLO_PRZACQFISSO
    // ------------------------------------------------------------------------
    // Stored procedure che ricalcola i listini di vendita e i prezzi di costo
    DM1.ShowWait('', 'Creazione stored procedure: ART_RICALCOLA_LISTINI_ARTICOLO_PRZACQFISSO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_ART_RICALCOLA_LISTINI_ARTICOLO_PRZACQFISSO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE ART_AUMENTA_PREZZO_LISTINO
    // ------------------------------------------------------------------------
    // Stored procedure che aumenta il prezzo di listino dell'articolo e ricalcola tutto il resto
    DM1.ShowWait('', 'Creazione stored procedure: ART_AUMENTA_PREZZO_LISTINO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_ART_AUMENTA_PREZZO_LISTINO.SQL');
    S1.Execute;
    // ========================================================================

    {
      // ========================================================================
      // CREAZIONE VISTA MAG_ART
      // ------------------------------------------------------------------------
      // Imposta la query che ricava l'elenco delle viste e la apre
      DM1.ShowWait('', 'Creazione vista: MAG_ART');
      Q1.SQL.Clear;
      Q1.SQL.LoadFromFile(CurrDir + 'VIEW_MAG_ART.SQL');
      S1.Execute;
      // ========================================================================
    }

    // ========================================================================
    // CREAZIONE STORED PROCEDURE PROC_IMPEGNI_GETAPPARECCHI.SQL
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPEGNI_GETAPPARECCHI ');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPEGNI_GETAPPARECCHI.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE VISTA DOC_LIST
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: DOC_LIST');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_DOC_LIST.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE VISTA SCAD_LIST_VIEW
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: SCAD_LIST_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_SCAD_LIST.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE MAG_GET_GIACENZE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione stored procedure: MAG_GET_GIACENZE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_MAG_GET_GIACENZE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE MAG_GET_GIACENZE_ALL
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione stored procedure: MAG_GET_GIACENZE_ALL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_MAG_GET_GIACENZE_ALL.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE MAG_GET_GIACENZE_DETTAGLIO
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione stored procedure: MAG_GET_GIACENZE_DETTAGLIO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_MAG_GET_GIACENZE_DETTAGLIO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE MAG_CHIUSURA_ARTICOLO
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione stored procedure: MAG_CHIUSURA_ARTICOLO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_MAG_CHIUSURA_ARTICOLO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE MAG_CHIUSURA_GENERALE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione stored procedure: MAG_CHIUSURA_GENERALE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_MAG_CHIUSURA_GENERALE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE MAG_SET_GIACENZA_ARTICOLO
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione stored procedure: MAG_SET_GIACENZA_ARTICOLO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_MAG_SET_GIACENZA_ARTICOLO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE MAG_AZZERAMENTO_MAGAZZINO
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione stored procedure: MAG_AZZERAMENTO_MAGAZZINO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_MAG_AZZERAMENTO_MAGAZZINO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE MAG_CONV1_PARTE2
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione stored procedure: MAG_CONV1_PARTE2');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_MAG_CONV1_PARTE2.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_TRACK_DOC
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_TRACK_DOC');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_TRACK_DOC.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_GET_RICARICO_FP
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_GET_RICARICO_FP');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_GET_RICARICO_FP.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_GET_RICARICO
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione storet procedure: GC_GET_RICARICO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_GET_RICARICO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_GET_PRESENTEINCOMMESSA
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_GET_PRESENTEINCOMMESSA');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_GET_PRESENTEINCOMMESSA.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_GET_PRZVEND_COMMESSA
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_GET_PRZVEND_COMMESSA');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_GET_PRZVEND_COMMESSA.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_CODART_TO_OPERAINDEX
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_CODART_TO_OPERAINDEX');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_CODART_TO_OPERAINDEX.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_CODART_TO_OPERADESCRIZIONE
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_CODART_TO_OPERADESCRIZIONE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_CODART_TO_OPERADESCRIZIONE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_IS_MANODOPERA
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_IS_MANODOPERA');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_IS_MANODOPERA.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_IS_RIGO_MANODOPERA_CON_DETT
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_IS_RIGO_MANODOPERA_CON_DETT');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_IS_RIGO_MANODOPERA_CON_DETT.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GC_IS_RIGOPRV_DA_VISUALIZZARE
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_IS_RIGOPRV_DA_VISUALIZZARE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_IS_RIGOPRV_DA_VISUALIZZARE.SQL');
    S1.Execute;
    // ========================================================================



    // ========================================================================
    // CREAZIONE VISTA GC_BASE_RIGHI
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi con già i ricarichi
    // e i campi personalizzabili (deroghe) in base alla scelta
    // del ricarico voluto sul cantiere (ricarico fisso, ricarico
    // come da listino 1..4 eventualmente anche con i ricarichi
    // per fasce di prezzo.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    {
      DM1.ShowWait('', 'Creazione vista: GC_BASE_RIGHI');
      Q1.SQL.Clear;
      Q1.SQL.LoadFromFile(CurrDir + 'VIEW_GC_BASE_RIGHI.SQL');
      S1.Execute;
    }
    // ========================================================================

    // ========================================================================
    // CREAZIONE PROCEDURE GC_CALCOLA_COSTO_MEDIO_ARTICOLO
    // Procedure che fornisce il costo medio dell'articolo
    // all'interno del cantiere
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_CALCOLA_COSTO_MEDIO_ARTICOLO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_CALCOLA_COSTO_MEDIO_ARTICOLO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE PROCEDURE GC_SET_COSTO_MEDIO_ARTICOLO
    // Procedure che fornisce il costo medio dell'articolo
    // all'interno del cantiere
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_SET_COSTO_MEDIO_ARTICOLO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_SET_COSTO_MEDIO_ARTICOLO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE PROCEDURE GC_GET_COSTO_MEDIO_ARTICOLO
    // Procedure che fornisce il costo medio dell'articolo
    // all'interno del cantiere
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_GET_COSTO_MEDIO_ARTICOLO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_GET_COSTO_MEDIO_ARTICOLO.SQL');
    S1.Execute;
    // ========================================================================



    // ========================================================================
    // CREAZIONE VISTA GC_BASE_COSTOMEDIO
    // Vista che fornisce il costo medio degli articoli
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    {
      DM1.ShowWait('', 'Creazione vista: GC_BASE_COSTOMEDIO');
      Q1.SQL.Clear;
      Q1.SQL.LoadFromFile(CurrDir + 'VIEW_GC_BASE_COSTOMEDIO.SQL');
      S1.Execute;
    }
    // ========================================================================



    // ========================================================================
    // CREAZIONE VISTA GC_BASE_PRZVEND
    // Vista che aggiunge alla vista dei righi base il calcolo del prezzo
    // di vendita.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    {
      DM1.ShowWait('', 'Creazione vista: GC_BASE_PRZVEND');
      Q1.SQL.Clear;
      Q1.SQL.LoadFromFile(CurrDir + 'VIEW_GC_BASE_PRZVEND.SQL');
      S1.Execute;
    }
    // ========================================================================



    // ========================================================================
    // CREAZIONE VISTA GC_BASE_IMPORTI
    // Vista che aggiunge alla vista di base dei prezzi di vendita
    // gli importi al costo e alla vendita
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    {
      DM1.ShowWait('', 'Creazione vista: GC_BASE_IMPORTI');
      Q1.SQL.Clear;
      Q1.SQL.LoadFromFile(CurrDir + 'VIEW_GC_BASE_IMPORTI.SQL');
      S1.Execute;
    }
    // ========================================================================



    // ========================================================================
    // CREAZIONE VISTA GC_BASE_GUADAGNI
    // Vista che aggiunge i guadagni unitari e totali alla
    // vista degli importi
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    {
      DM1.ShowWait('', 'Creazione vista: GC_BASE_GUADAGNI');
      Q1.SQL.Clear;
      Q1.SQL.LoadFromFile(CurrDir + 'VIEW_GC_BASE_GUADAGNI.SQL');
      S1.Execute;
    }
    // ========================================================================



    // ========================================================================
    // CREAZIONE VISTA GC_BASE_SEZIONI
    // Vista che aggiunge la suddivisione degli importi
    // nelle varie sezioni di cui è composto il GC
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    {
      DM1.ShowWait('', 'Creazione vista: GC_BASE_SEZIONI');
      Q1.SQL.Clear;
      Q1.SQL.LoadFromFile(CurrDir + 'VIEW_GC_BASE_SEZIONI.SQL');
      S1.Execute;
    }
    // ========================================================================

    // ========================================================================
    // CREAZIONE VISTA GC_BASE_RIGHI_NEW
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: GC_BASE_RIGHI_NEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_GC_BASE_RIGHI_NEW.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE PROCEDURE GC_BASE
    // Procedure che alimenta il giornale di cantiere
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: GC_BASE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GC_BASE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE VISTA GOS_ORE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione vista: GOS_ORE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_GOS_ORE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE PROCEDURE ALLEGATI_VIEW
    // Procedure che fornisce il costo medio dell'articolo
    // all'interno del cantiere
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: ALLEGATI_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_ALLEGATI.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE PROCEDURE ALL_PING_ALARM
    // Procedure che fornisce il costo medio dell'articolo
    // all'interno del cantiere
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione stored procedure: ALL_PING_ALARM');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_ALL_PING_ALARM.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE ALLIMP_COPIA_DATI_ALLEGATI_FG
    // ------------------------------------------------------------------------
    // Stored procedure che restituisce l'ultimo prezzo di acquisto di un articolo
    DM1.ShowWait('', 'Creazione stored procedure: ALLIMP_COPIA_DATI_ALLEGATI_FG');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_ALLIMP_COPIA_DATI_ALLEGATI_FG.SQL');
    S1.Execute;
    // ========================================================================
    // CREAZIONE STORED PROCEDURE ALLIMP_NUOVO_ALLEGATO_FG
    // ------------------------------------------------------------------------
    // Stored procedure che restituisce l'ultimo prezzo di acquisto di un articolo
    DM1.ShowWait('', 'Creazione stored procedure: ALLIMP_NUOVO_ALLEGATO_FG');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_ALLIMP_NUOVO_ALLEGATO_FG.SQL');
    S1.Execute;
    // ========================================================================
    // CREAZIONE STORED PROCEDURE ALLIMP_TODO
    // ------------------------------------------------------------------------
    // Stored procedure che restituisce l'ultimo prezzo di acquisto di un articolo
    DM1.ShowWait('', 'Creazione stored procedure: ALLIMP_TODO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_ALLIMP_TODO.SQL');
    S1.Execute;
    // ========================================================================
    // CREAZIONE STORED PROCEDURE ALLIMP_EXPORT_SEL_ENTI
    // ------------------------------------------------------------------------
    // Stored procedure che restituisce l'ultimo prezzo di acquisto di un articolo
    DM1.ShowWait('', 'Creazione stored procedure: ALLIMP_EXPORT_SEL_ENTI');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_ALLIMP_EXPORT_SEL_ENTI.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE IMP_AGGIORNA_TECNICO_ALL.SQL
    // ------------------------------------------------------------------------
    // Stored procedure che aggiorna il tecnico degli allegati relativi ad un impegno
    DM1.ShowWait('', 'Creazione stored procedure: IMP_AGGIORNA_TECNICO_ALL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMP_AGGIORNA_TECNICO_ALL.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE PROC_PRATAPP_GETSCADENZAGARANZIA.SQL
    // ------------------------------------------------------------------------
    // Stored procedure che aggiorna il tecnico degli allegati relativi ad un impegno
    DM1.ShowWait('', 'Creazione stored procedure: PRATAPP_GETSCADENZAGARANZIA');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_PRATAPP_GETSCADENZAGARANZIA.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE VISTA IMP_ULTIMI_INTERVENTI_VIEW
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione vista: IMP_ULTIMI_INTERVENTI');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_IMP_ULTIMI_INTERVENTI.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE VISTA IMP_PRESCRIZIONI_VIEW
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione vista: IMP_PRESCRIZIONI_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_IMP_PRESCRIZIONI.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GET_PARAM_FOGLIO_LAVORO
    // ------------------------------------------------------------------------
    // Stored procedure che ritorna i parametri di stampa del foglio di lavoro
    DM1.ShowWait('', 'Creazione stored procedure: GET_PARAM_FOGLIO_LAVORO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GET_PARAM_FOGLIO_LAVORO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE GET_PARAM_ALLEGATIFG
    // ------------------------------------------------------------------------
    // Stored procedure che ritorna i parametri di stampa del foglio di lavoro
    DM1.ShowWait('', 'Creazione stored procedure: GET_PARAM_ALLEGATIFG');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_GET_PARAM_ALLEGATIFG.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE OP_EXISTS
    // ------------------------------------------------------------------------
    // Stored procedure che ritorna i parametri di stampa del foglio di lavoro
    DM1.ShowWait('', 'Creazione stored procedure: OP_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_OP_EXISTS.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE OP_CREAPREDEFINITE
    // ------------------------------------------------------------------------
    // Stored procedure che ritorna i parametri di stampa del foglio di lavoro
    DM1.ShowWait('', 'Creazione stored procedure: OP_CREAPREDEFINITE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_OP_CREAPREDEFINITE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER TRIGGER_PRATAPP_BEFOREINSERTUPDATE.SQL
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRATAPP_BEFOREINSERTUPDATE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRATAPP_BEFOREINSERTUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER TRIGGER_PRATAPP_AFTERDELETE.SQL
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRATAPP_AFTERDELETE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRATAPP_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER IMPEGNI_AFTERINSERTUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_IMPEGNI_AFTERINSERTUPDATE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_IMPEGNI_AFTERINSERTUPDATE.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE TRIGGER IMPEGNI_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_IMPEGNI_AFTERDELETE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_IMPEGNI_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER ALLEGATIMAN_BEFOREINSERTUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_ALLEGATIMAN_BEFOREINSERTUPDATE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_ALLEGATIMAN_BEFOREINSERTUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER ALLEGATI_BEFOREINSERTUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_ALLEGATI_BEFOREINSERTUPDATE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_ALLEGATI_BEFOREINSERTUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER RIGHIPRV_GC_COSTOMEDIO_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_RIGHIPRV_GC_COSTOMEDIO_AFTERDELETE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_RIGHIPRV_GC_COSTOMEDIO_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER RIGHIPRV_GC_COSTOMEDIO_AFTERINSERT
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_RIGHIPRV_GC_COSTOMEDIO_AFTERINSERT');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_RIGHIPRV_GC_COSTOMEDIO_AFTERINSERT.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER RIGHIPRV_GC_COSTOMEDIO_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_RIGHIPRV_GC_COSTOMEDIO_AFTERUPDATE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_RIGHIPRV_GC_COSTOMEDIO_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER PRVORDCL_FE_BEFOREINSERT
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRVORDCL_FE_BEFOREINSERT.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRVORDCL_FE_BEFOREINSERT.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER ANAGMAGA_BEFOREINSERT
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_ANAGMAGA_BEFOREINSERT.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_ANAGMAGA_BEFOREINSERT.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER ANAGMAGA_BEFOREUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_ANAGMAGA_BEFOREUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_ANAGMAGA_BEFOREUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER ARTICOLI_BEFOREINSERT
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_ARTICOLI_BEFOREINSERT.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_ARTICOLI_BEFOREINSERT.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER ARTICOLI_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_ARTICOLI_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_ARTICOLI_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER ARTICOLI_BEFOREUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_ARTICOLI_BEFOREUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_ARTICOLI_BEFOREUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER ARTICOLI_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_ARTICOLI_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_ARTICOLI_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER MAGAZZINI_BEFOREINSERTUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_MAGAZZINI_BEFOREINSERTUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_MAGAZZINI_BEFOREINSERTUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER EXTFILE_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_EXTFILE_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_EXTFILE_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER EXTFILE_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_EXTFILE_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_EXTFILE_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER PRVORDCL_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRVORDCL_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRVORDCL_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER PRVORDCL_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRVORDCL_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRVORDCL_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER CONFORM_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_CONFORM_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_CONFORM_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER CONFORM_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_CONFORM_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_CONFORM_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER TESTI_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_TESTI_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_TESTI_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER TESTI_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_TESTI_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_TESTI_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER RAPGIORN_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_RAPGIORN_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_RAPGIORN_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER RAPGIORN_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_RAPGIORN_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_RAPGIORN_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER SCADENZ_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_SCADENZ_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_SCADENZ_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER SCADENZ_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_SCADENZ_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_SCADENZ_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER PRIMANOT_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRIMANOT_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRIMANOT_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER PRIMANOT_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRIMANOT_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRIMANOT_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER CLIENTI_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_CLIENTI_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_CLIENTI_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER CLIENTI_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_CLIENTI_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_CLIENTI_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER CLIENTI_BEFOREINSERTUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_CLIENTI_BEFOREINSERTUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_CLIENTI_BEFOREINSERTUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER PRATICHE_BEFOREINSERTUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRATICHE_BEFOREINSERTUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRATICHE_BEFOREINSERTUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER PRATICHE_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRATICHE_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRATICHE_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER PRATICHE_AFTERDELETE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_PRATICHE_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRATICHE_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER AGENTI1_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_AGENTI1_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_AGENTI1_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE TRIGGER AGENTI2_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_AGENTI2_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_AGENTI2_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE TRIGGER AGENTI3_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_AGENTI3_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_AGENTI3_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE TRIGGER AGENTI4_AFTERUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_AGENTI4_AFTERUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_AGENTI4_AFTERUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE SOGG_SCADSOFF_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: SOGG_SCADSOFF_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_SOGG_SCADSOFF_EXISTS.SQL');
    S1.Execute;
    // ========================================================================
    // CREAZIONE STORED PROCEDURE IMPIANTI_SCADSOFF_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPIANTI_SCADSOFF_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPIANTI_SCADSOFF_EXISTS.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE SOGG_CORRISPNOPAG_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: SOGG_CORRISPNOPAG_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_SOGG_CORRISPNOPAG_EXISTS.SQL');
    S1.Execute;
    // ========================================================================
    // CREAZIONE STORED PROCEDURE IMPIANTI_CORRISPNOPAG_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPIANTI_CORRISPNOPAG_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPIANTI_CORRISPNOPAG_EXISTS.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE IMPIANTI_ALLEGATITOSEND_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPIANTI_ALLEGATITOSEND_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPIANTI_ALLEGATITOSEND_EXISTS.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE IMPIANTI_CHIAMATE_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPIANTI_CHIAMATE_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPIANTI_CHIAMATE_EXISTS.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE STORED PROCEDURE SOGG_CHIAMATE_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: SOGG_CHIAMATE_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_SOGG_CHIAMATE_EXISTS.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE IMPIANTI_PRESCRIZ_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPIANTI_PRESCRIZ_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPIANTI_PRESCRIZ_EXISTS.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE STORED PROCEDURE IMPEGNI_PRESCRIZ_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPEGNI_PRESCRIZ_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPEGNI_PRESCRIZ_EXISTS.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE STORED PROCEDURE SOGG_PRESCRIZ_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: SOGG_PRESCRIZ_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_SOGG_PRESCRIZ_EXISTS.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE IMPIANTI_URGENTI_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: IMPIANTI_URGENTI_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPIANTI_URGENTI_EXISTS.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE STORED PROCEDURE SOGG_URGENTI_EXISTS
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: SOGG_URGENTI_EXISTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_SOGG_URGENTI_EXISTS.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE STRADARIO_CERTIFICATO
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: STRADARIO_CERTIFICATO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_STRADARIO_CERTIFICATO.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE VISTA IMPIANTI_LIST_VIEW
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Crea la StoredProcedure IMPIANTI_HIGHLIGHTS che poi serve alla IMPIANTI_LIST_VIEW
    DM1.ShowWait('', 'Creazione stored procedure: IMPIANTI_HIGHLIGHTS');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_IMPIANTI_HIGHLIGHTS.SQL');
    S1.Execute;
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: IMPIANTI_LIST_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_IMPIANTI_LIST.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE VISTA IMPEGNI_LIST_VIEW
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: IMPEGNI_LIST_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_IMPEGNI_LIST.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE VISTA SOGG_LIST_VIEW
    //    Vista che fornisce il primo step di dati per il GC
    //    ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: SOGG_LIST_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_SOGG_LIST.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE VISTA PRAT_LIST_VIEW
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: PRAT_LIST_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_PRAT_LIST.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE VISTA AGENDA_LIST_VIEW
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: AGENDA_LIST_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_AGENDA_LIST.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE VISTA STRADARIO_LIST_VIEW
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: STRADARIO_LIST_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_STRADARIO_LIST.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE VISTA ALLEGATI_MANUT_EXPORT_LIST_VIEW
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: ALLEGATI_MANUT_EXPORT_LIST_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_ALLEGATI_MANUT_EXPORT_LIST.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE VISTA COM_BASE_VIEW
    // Vista che fornisce il primo step di dati per il GC
    // ed esattamente i dati grezzi dei righi.
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: COM_BASE_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_COM_BASE.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE STORED PROCEDURE COM_LIST_PROC
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: COM_LIST_PROC');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_COM_LIST.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE STORED PROCEDURE COM_GET_RIF_INFO
    // ------------------------------------------------------------------------
    // Crea la SP che ricava i dati per i segnaposto delle comunicazioni
    DM1.ShowWait('', 'Creazione stored procedure: COM_GET_RIF_INFO');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_COM_GET_RIF_INFO.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE VISTA COM_ELENCO_VIEW
    // ------------------------------------------------------------------------
    // Imposta la query che ricava l'elenco delle viste e la apre
    DM1.ShowWait('', 'Creazione vista: COM_ELENCO_VIEW');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'VIEW_COM_ELENCO.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // CREAZIONE STORED PROCEDURE COM_CREAPREDEFINITE.SQL
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: COM_CREAPREDEFINITE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_COM_CREAPREDEFINITE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER TRIGGER_COM_MESSAGGI_BEFOREINSERT.SQL
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: COM_MESSAGGI_BEFOREINSERT');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_COM_MESSAGGI_BEFOREINSERT.SQL');
    S1.Execute;
    // ========================================================================
    // CREAZIONE TRIGGER TRIGGER_COM_MESSAGGI_BEFOREUPDATE.SQL
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: COM_MESSAGGI_BEFOREUPDATE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_COM_MESSAGGI_BEFOREUPDATE.SQL');
    S1.Execute;
    // ========================================================================
    // CREAZIONE TRIGGER TRIGGER_COM_MESSAGGI_AFTERDELETE.SQL
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: COM_MESSAGGI_AFTERDELETE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_COM_MESSAGGI_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================
    // CREAZIONE TRIGGER TRIGGER_COM_STORICO_BEFOREINSERT.SQL
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: COM_STORICO_BEFOREINSERT');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_COM_STORICO_BEFOREINSERT.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE PROC_TASK_IMPEGNO_REF_STORE.SQL
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: TASK_IMPEGNO_REF_STORE');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_TASK_IMPEGNO_REF_STORE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE STORED PROCEDURE PROC_EVENT_IMPEGNO_REF_STORE.SQL
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: EVENT_IMPEGNO_REF_STORE ');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_EVENT_IMPEGNO_REF_STORE.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    // Crea la SP che aggiunge tutte le OP associate all'apparecchio specificato
    DM1.ShowWait('', 'Creazione stored procedure: EVENT_UPDATE ');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'PROC_EVENT_UPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER LABART_BEFOREINSERTUPDATE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_LABART_BEFOREINSERTUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_LABART_BEFOREINSERTUPDATE.SQL');
    S1.Execute;
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_LABSOGG_BEFOREINSERTUPDATE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_LABSOGG_BEFOREINSERTUPDATE.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE PRVORDCL_DOCCORRELATI_BEFOREINSERT
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: PRVORDCL_DOCCORRELATI_BEFOREINSERT.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_PRVORDCL_DOCCORRELATI_BEFOREINSERT.SQL');
    S1.Execute;
    // ========================================================================

    // ========================================================================
    // CREAZIONE TRIGGER LDE_DOCUMENTI
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_LDE_DOCUMENTI_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_LDE_DOCUMENTI_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE TRIGGER LDE_PAGINE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_LDE_PAGINE_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_LDE_PAGINE_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================
    // ========================================================================
    // CREAZIONE TRIGGER LDE_PUZZLE
    // ------------------------------------------------------------------------
    DM1.ShowWait('', 'Creazione trigger: TRIGGER_LDE_PUZZLE_AFTERDELETE.SQL');
    S1.SQL.Clear;
    S1.SQL.LoadFromFile(CurrDir + 'TRIGGER_LDE_PUZZLE_AFTERDELETE.SQL');
    S1.Execute;
    // ========================================================================

  finally
    DM1.ShowWait('', 'Fine creazione viste');
    S1.Free;
    Q1.Free;
  end;
end;

procedure TDM1.PopolamentoMagQtaPerNuovoGC;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  DM1.ShowWait('Conversione per nuovo giornale di magazzino.', 'Inizializzazione...');
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;

    // Query che converte i righi di carico di GC
    DM1.ShowWait('', 'Conversione righi per CARICO nuovo Giornale di Cantiere.');
    Q1.SQL.Clear;
    Q1.SQL.Add('UPDATE RIGHIPRV R1 SET');
    Q1.SQL.Add('  R1.GC_CARICO_QTA = R1.QTA,');
    Q1.SQL.Add('  R1.GC_CARICO_IMPORTOACQ = (R1.PREZZOACQUISTOARTICOLO * R1.QTA),');
    Q1.SQL.Add('  R1.GC_CARICO_IMPORTOVEND = R1.IMPORTORIGO');
    Q1.SQL.Add
      ('WHERE (   (SELECT T1.SEGNOOPERAZIONECANTIERE FROM PRVORDCL T1 WHERE T1.TIPODOCUMENTO=R1.TIPODOCUMENTO AND T1.REGISTRO=R1.REGISTRO AND T1.NUMORDPREV=R1.NUMORDPREV AND T1.DATADOCUMENTO=R1.DATADOCUMENTO)   = ''+'')');
    Q1.SQL.Add('AND R1.GC_CARICO_QTA IS NULL');
    Q1.ExecSQL;

    // Query che converte i righi di carico di GC
    DM1.ShowWait('', 'Conversione righi per SCARICO nuovo Giornale di Cantiere.');
    Q1.SQL.Clear;
    Q1.SQL.Add('UPDATE RIGHIPRV R1 SET');
    Q1.SQL.Add('  R1.GC_SCARICO_QTA = R1.QTA,');
    Q1.SQL.Add('  R1.GC_SCARICO_IMPORTOACQ = (R1.PREZZOACQUISTOARTICOLO * R1.QTA),');
    Q1.SQL.Add('  R1.GC_SCARICO_IMPORTOVEND = R1.IMPORTORIGO');
    Q1.SQL.Add
      ('WHERE (   (SELECT T1.SEGNOOPERAZIONECANTIERE FROM PRVORDCL T1 WHERE T1.TIPODOCUMENTO=R1.TIPODOCUMENTO AND T1.REGISTRO=R1.REGISTRO AND T1.NUMORDPREV=R1.NUMORDPREV AND T1.DATADOCUMENTO=R1.DATADOCUMENTO)   = ''-'')');
    Q1.SQL.Add('AND R1.GC_SCARICO_QTA IS NULL');
    Q1.ExecSQL;

    // Query che converte i righi di carico di GC
    DM1.ShowWait('', 'Conversione righi COMMESSA Giornale di Cantiere.');
    Q1.SQL.Clear;
    Q1.SQL.Add('UPDATE RIGHIPRV R1 SET');
    Q1.SQL.Add('  R1.GC_COMMESSA_QTA = R1.QTA,');
    Q1.SQL.Add('  R1.GC_COMMESSA_IMPORTOACQ = (R1.PREZZOACQUISTOARTICOLO * R1.QTA),');
    Q1.SQL.Add('  R1.GC_COMMESSA_IMPORTOVEND = R1.IMPORTORIGO');
    Q1.SQL.Add
      ('WHERE (   (SELECT T1.SEGNOOPERAZIONECANTIERE FROM PRVORDCL T1 WHERE T1.TIPODOCUMENTO=R1.TIPODOCUMENTO AND T1.REGISTRO=R1.REGISTRO AND T1.NUMORDPREV=R1.NUMORDPREV AND T1.DATADOCUMENTO=R1.DATADOCUMENTO)   = ''C'')');
    Q1.SQL.Add('AND R1.GC_COMMESSA_QTA IS NULL');
    Q1.ExecSQL;

    // Query che converte i righi di carico di GC
    DM1.ShowWait('', 'Conversione righi MONTATI Giornale di Cantiere.');
    Q1.SQL.Clear;
    Q1.SQL.Add('UPDATE RIGHIPRV R1 SET');
    Q1.SQL.Add('  R1.GC_MONTATO_QTA = R1.QTA,');
    Q1.SQL.Add('  R1.GC_MONTATO_IMPORTOACQ = (R1.PREZZOACQUISTOARTICOLO * R1.QTA),');
    Q1.SQL.Add('    R1.GC_MONTATO_IMPORTOVEND = R1.IMPORTORIGO');
    Q1.SQL.Add
      ('WHERE (   (SELECT T1.SEGNOOPERAZIONECANTIERE FROM PRVORDCL T1 WHERE T1.TIPODOCUMENTO=R1.TIPODOCUMENTO AND T1.REGISTRO=R1.REGISTRO AND T1.NUMORDPREV=R1.NUMORDPREV AND T1.DATADOCUMENTO=R1.DATADOCUMENTO)   = ''M'')');
    Q1.SQL.Add('AND R1.GC_MONTATO_QTA IS NULL');
    Q1.ExecSQL;

    // Query che converte i righi di carico di GC
    DM1.ShowWait('', 'Conversione righi FATTURATI Giornale di Cantiere.');
    Q1.SQL.Clear;
    Q1.SQL.Add('UPDATE RIGHIPRV R1 SET');
    Q1.SQL.Add('  R1.GC_FATTURATO_QTA = R1.QTA,');
    Q1.SQL.Add('  R1.GC_FATTURATO_IMPORTOACQ = (R1.PREZZOACQUISTOARTICOLO * R1.QTA),');
    Q1.SQL.Add('  R1.GC_FATTURATO_IMPORTOVEND = R1.IMPORTORIGO');
    Q1.SQL.Add
      ('WHERE (   (SELECT T1.SEGNOOPERAZIONECANTIERE FROM PRVORDCL T1 WHERE T1.TIPODOCUMENTO=R1.TIPODOCUMENTO AND T1.REGISTRO=R1.REGISTRO AND T1.NUMORDPREV=R1.NUMORDPREV AND T1.DATADOCUMENTO=R1.DATADOCUMENTO)   = ''F'')');
    Q1.SQL.Add('AND R1.GC_FATTURATO_QTA IS NULL');
    Q1.ExecSQL;

  finally
    Q1.Free;
  end;
end;

procedure TDM1.SettaVersioneDatabase;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  DM1.ShowWait('Aggiornamento versione archivi.', 'Aggiorna la versione degli archivi...');
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;
    Q1.SQL.Add('UPDATE PROGRESS SET DBVER = ' + IntToStr(MainForm.PrgVersion));
    Q1.ExecSQL;
  finally
    Q1.Free;
  end;
end;

function TDM1.GetDbVer: Integer;
var
  Q1: TIB_Cursor;
begin
  // Inizializzazione
  Result := -1;
  DM1.ShowWait('Levante', 'Caricamento versione archivi...');
  Q1 := TIB_Cursor.Create(Self);
  try
    Q1.DatabaseName := DM1.ArcDBFile;
    Q1.IB_Connection := DM1.DBAzienda;
    Q1.SQL.Add('SELECT DBVER FROM PROGRESS');
    Q1.Open;
    if Q1.Eof then
      Exit;
    Result := Q1.Fields[0].AsInteger;
  finally
    // DM1.CloseWait;  // L'ho tolto perchè altrimenti è antiestetico
    Q1.Free;
  end;
end;

// Procedura che scarica tutti i files INI generici dal repository
procedure TDM1.ScaricaFilesIniDalRepository;
var
  P: TRepositoryIniFile;
begin
  P := TRepositoryIniFile.Create(CurrDir + 'NULLA.INI', DM1.DBGenerale);
  try
    P.DownloadRepositoryIniFiles;
  finally
    P.Free;
  end;
end;

procedure TDM1.MyProcessMessages;
begin
  Application.ProcessMessages;
end;

// =============================================================================
// INIZIO CONVERSIONE GIACENZA DA MAGAZZINO DINAMICO 1 A MAGAZZINO DINAMICO 2
// -----------------------------------------------------------------------------
// Procedura che verifica se deve essere fatta la conversione delle giacenze di magazzino
// dalla struttura del magazzino dinamico 1 a quella del magazzino dinamico 2. In pratica
// se nel database ci trova la vista MAG_ART significa che proveniamo da una versione con
// magazzino dinamico 1 e quindi avvia la prima parte della conversione. La prima parte della
// conversione ricava tutte le giacenze attuali (cioè nel modo vecchio) e le salva tutte nel
// MAGAZZINI_TEMP.
procedure TDM1.ConversioneGiacenzeMagazzinoParte1;
var
  S: TIB_Script;
  Q: TIB_Cursor;
begin
  try
    DM1.ShowWait('', 'Creazione stored procedure MAG_CONV1_PARTE1.');
    // Inizializzazione
    Q := TIB_Cursor.Create(Self);
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    S := TIB_Script.Create(Self);
    S.IB_Connection := DM1.DBAzienda;
    // Se la vista MAG_ART non esiste non deve continuare perchè altrimenti
    // da un errore.
    Q.SQL.Add('SELECT COUNT(*) AS QUANTI FROM RDB$RELATIONS WHERE RDB$RELATION_NAME = ''MAG_ART''');
    Q.Open;
    if Q.Fields[0].AsInteger = 0 then
      Exit;
    Q.Close;
    // Avvia la transazione
    DM1.DBAzienda.StartTransaction;
    try
      // Crea anche un'altra stored procedure che si occupa di verificare che
      // i campi MovMag dei righi dei documenti siano concordi al segno
      // della testata dei documenti stessi
      S.SQL.Clear;
      S.SQL.LoadFromFile(CurrDir + 'PROC_MAG_CHECK_MOVMAG.SQL');
      S.Execute;
      // Imposta la query che creerà la stored procedure  che effettuerà la prima
      // parte della conversione.
      S.SQL.Clear;
      S.SQL.LoadFromFile(CurrDir + 'PROC_MAG_CONV1_PARTE1.SQL');
      S.Execute;
      // Una volta creata la Stored procedure la avvia per porre in essere la prima
      // fase della conversione.
      DM1.ShowWait('', 'Conversione giacenze magazzini (1° parte).');
      S.SQL.Clear;
      S.SQL.Add('EXECUTE PROCEDURE MAG_CONV1_PARTE1;');
      S.Execute;
      // Se tutto è andato bene conferma la transazione
      DM1.DBAzienda.Commit;
    except
      // Se invece ci sono stati problemi esegue il roolback
      DM1.DBAzienda.Rollback;
      // Rilancia l'eccezione altrimenti non sarebbe visibile all'utente
      raise;
    end;
  finally
    // Pulizie finali
    DM1.CloseWait;
    if Assigned(Q) then
      Q.Free;
    if Assigned(S) then
      S.Free;
  end;
end;

// Procedura che esegue la 2° parte della conversione delle giacenze di magazzino
// dalla struttura del magazzino dinamico 1 a quella del magazzino dinamico 2. In pratica
// se nel database ci trova la vista MAG_ART significa che proveniamo da una versione con
// magazzino dinamico 1 e quindi avvia la prima parte della conversione. La prima parte della
// conversione ricava tutte le giacenze attuali (cioè nel modo vecchio) e le salva tutte nel
// MAGAZZINI_TEMP.
procedure TDM1.ConversioneGiacenzeMagazzinoParte2;
var
  S: TIB_Script;
begin
  // Inizializzazione
  S := TIB_Script.Create(Self);
  try
    DM1.ShowWait('', 'Conversione giacenze magazzini (2° parte).');
    S.IB_Connection := DM1.DBAzienda;
    // Avvia la transazione
    DM1.DBAzienda.StartTransaction;
    try
      // fase della conversione.
      S.SQL.Clear;
      S.SQL.Add('EXECUTE PROCEDURE MAG_CONV1_PARTE2;');
      S.Execute;
      // Se tutto è andato bene conferma la transazione
      DM1.DBAzienda.Commit;
    except
      // Se invece ci sono stati problemi esegue il roolback
      DM1.DBAzienda.Rollback;
      // Rilancia l'eccezione altrimenti non sarebbe visibile all'utente
      raise;
    end;
  finally
    // Pulizie finali
    DM1.CloseWait;
    S.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE CONVERSIONE GIACENZA DA MAGAZZINO DINAMICO 1 A MAGAZZINO DINAMICO 2
// =============================================================================

// =============================================================================
// INIZIO - GESTIONE GENERATORI
// -----------------------------------------------------------------------------
// Function che ritorna il prossimo progressivo per il generatore specificato
function TDM1.Generators_NextGenID(GenName: String; const ALevGenDB: Boolean): Integer;
var
  Q: TIB_Cursor;
begin
  GenName := Uppercase(GenName);
  Q := TIB_Cursor.Create(Self);
  try
    if ALevGenDB then
    begin
      Q.DatabaseName := DM1.GenDBFile;
      Q.IB_Connection := DM1.DBGenerale;
    end
    else
    begin
      Q.DatabaseName := DM1.ArcDBFile;
      Q.IB_Connection := DM1.DBAzienda;
    end;
    Q.SQL.Add('SELECT GEN_ID(' + GenName + ',1) FROM RDB$DATABASE');
    Q.Open;
    Result := Q.Fields[0].AsInteger;
    Q.Close;
  finally
    Q.Free;
  end;
end;

// Procedure che verifica la presenza di tutti i generatori usati nell'applicazione
// e se non ci sono li crea.
procedure TDM1.Generators_VerificaCreazione;
begin
  DM1.ShowWait('Levante', 'Verifica generators');
  // Verifica ed eventuale creazione dei generatori
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_PRATICHE');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_PRATAPPARECCHI');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_OPPRATICA');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_IMPEGNI');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_OPIMPEGNO');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_ALLEGATIMANUT');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_ENTI');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_COM_IMPOSTAZIONI');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_COM_MESSAGGI');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_COM_STORICO');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_TAGCOL_TABELLE');
  Generators_VerificaPresenzaCreazioneGeneratore('PRVORDCL_DOCCORRELATI');
  Generators_VerificaPresenzaCreazioneGeneratore('PA_PROGRESSIVOINVIO');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_PRVORDCL_FE');
  Generators_VerificaPresenzaCreazioneGeneratore('LDE_DOCUMENTI');
  Generators_VerificaPresenzaCreazioneGeneratore('LDE_PAGINE');
  Generators_VerificaPresenzaCreazioneGeneratore('LDE_PUZZLE');
  Generators_VerificaPresenzaCreazioneGeneratore('LDE_PUZZLEOBJ');
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_SCADENZE');
end;

// Procedure che si occupa di creare il generatore se non esiste.
procedure TDM1.Generators_VerificaPresenzaCreazioneGeneratore(GenName: String; const ALevGenDB: Boolean);
var
  Q: TIB_Cursor;
begin
  // Inizializzazione
  GenName := Uppercase(GenName);
  Q := TIB_Cursor.Create(Self);
  try
    if ALevGenDB then
    begin
      Q.DatabaseName := DM1.GenDBFile;
      Q.IB_Connection := DM1.DBGenerale;
    end
    else
    begin
      Q.DatabaseName := DM1.ArcDBFile;
      Q.IB_Connection := DM1.DBAzienda;
    end;
    // IMposta la query che verificheà la presenza o meno del generator
    Q.SQL.Clear;
    Q.SQL.Add('SELECT COUNT(*) FROM RDB$GENERATORS WHERE RDB$GENERATOR_NAME = ' + QuotedStr(GenName));
    Q.Open;
    // Se il generatore è presente esce subito
    if Q.Fields[0].AsInteger > 0 then
      Exit;
    // Se invece arriva qui significa che il generator non esiste e quindi lo crea
    Q.SQL.Clear;
    Q.SQL.Add('CREATE GENERATOR ' + GenName);
    Q.ExecSQL;
  finally
    Q.Free;
  end;
end;
// -----------------------------------------------------------------------------
// FINE - GESTIONE GENERATORI
// =============================================================================

procedure TDM1.AttivaTabelle(ApriSoloPercorsiAziende, NuovaAzienda: Boolean);
var
  QryAziende: TIB_Cursor;
  P: TMemIniFile;
  LDBGeneraleAlreadyConnected: Boolean;
begin
  // Crea la Qrery
  QryAziende := TIB_Cursor.Create(Self);
  try

    // Apre la connessione al databse generale se non è già attiva (perchè passa più volte da qui)
    LDBGeneraleAlreadyConnected := DBGenerale.Connected;
    // Si connette al database e, se necessario, lo crea anche
    if not LDBGeneraleAlreadyConnected then
      ConnettiDatabase(DBGenerale, ServerAddress, GenDBFile, IBUser, IBPswd);
    // Verifica la versione del db e imposta la modalità di ristrutturazione se necessario
    ModoRistrutturazioneArchivi := (TLevDBVersionFactory.NewDBVersionCheck.GetDBVer < MainForm.PrgVersion) or MainForm.CLI_Param_Ristrutturazione;
    // Se è in ristrutturazione...
    if ModoRistrutturazioneArchivi then
    begin
      // Effettua il controllo sul CharSet e se è nullo imposta il CharSet predefinito
      if ControllaCharSetDatabase(DBGenerale) then
        CambiaCharSetDefault(DBGenerale);
      // Esegue il controllo delle tabella per vedere se le deve creare o ristrutturare
      ControllaTabella('AZIENDE', GenDBFile, DBGenerale, ModoRistrutturazioneArchivi);
      ControllaTabella('TMPRIGHI', GenDBFile, DBGenerale, ModoRistrutturazioneArchivi);
      ControllaTabella('SECURITY', GenDBFile, DBGenerale, ModoRistrutturazioneArchivi);
      ControllaTabella('PARAMETRI', GenDBFile, DBGenerale, ModoRistrutturazioneArchivi);
      ControllaTabella('REPOSITORY', GenDBFile, DBGenerale, ModoRistrutturazioneArchivi);
      ControllaTabella('LL_USER', GenDBFile, DBGenerale, ModoRistrutturazioneArchivi);
      ControllaTabella('ERRORS', GenDBFile, DBGenerale, ModoRistrutturazioneArchivi);
      // Per fare in modo che non rimagna il titolo principale precedente
      CloseWait;
      ControllaFilesConfigurazione;
      // Inizializza gli archivi del database LevGen
      InizializzaArchiviLevGen;
      // COntrolla che l'archivio degli utenti contenga sempre almeno l'utente ADMIN
      ControllaSecurity;
      DefaultizzazioneIdSecurity;
    end;
    // Esegue alcune operazioni solo la prima volta che passa di qui
    if not LDBGeneraleAlreadyConnected then
    begin
      // Azzera anche il contenuto della cartella dei files temporanei (lo metto qui perchè così si esegue una volta sola)
      AzzeraCartellaTemp;
      // Scarica tutti gli eventuali files dal Repository
      ScaricaFilesIniDalRepository;
      // Verifica se c'è un nuovo aggiornamento nel repository e se lo trova
      // avvia la procedura di aggiornamento automatico della postazione
      RepositoryUpdate_CheckForUpdate;
    end;

    // -----------------------------------------------------------------------------------------------------------
    // Questo blocco carica dall'archivio AZIENDE i dati dell'azienda corrente
    // -----------------------------------------------------------------------------------------------------------
    // IMposta la query che cerca l'azienda correntemente selezionata
    QryAziende.DatabaseName := DM1.GenDBFile;
    QryAziende.IB_Connection := DM1.DBGenerale;
    QryAziende.SQL.Add('SELECT PERCORSO FROM AZIENDE WHERE AZIENDA = ''' + AziendaCorrente + '''');
    QryAziende.Open;
    // Se l'azienda non è stata trovata, imposta l'azienda di PROVA come corrente che c'è sempre
    if QryAziende.Eof then
    begin
      // Forza l'azienda corrente a PROVA
      AziendaCorrente := 'PROVA';
      // IMposta la query in modo che ritorni i dati dell'azienda di prova
      QryAziende.Close;
      QryAziende.SQL.Clear;
      QryAziende.SQL.Add('SELECT PERCORSO FROM AZIENDE WHERE AZIENDA = ''PROVA''');
      QryAziende.Open;
      // Se non viene trovata neanche quella di prova visualizza un errore ed esce dal programma brutalmente
      if QryAziende.Eof then
      begin
        MessageBeep(0);
        MessageDlg('Azienda di PROVA non presente nell''archivio delle aziende!!!', mtError, [mbOk], 0);
        Application.Terminate;
      end;
    end;

    { TODO : RIMETTERE A POSTO }
    // IMposta alcune variabili globali che contengono il nome dell'azienda corrente il path e il nome completo del file GDB
    ArcDir := SlashFinale(QryAziende.FieldByName('PERCORSO').AsString);
    if LINUX then
      ArcDBFile := ServerAddress + ':' + AziendaCorrente
    else
      ArcDBFile := ArcDir + AziendaCorrente + '.GDB';

    // Chiude la query
    QryAziende.Close;
    // -----------------------------------------------------------------------------------------------------------

    // ===========================================================================================================
    // CONTROLLO ESISTENZA CARTELLE SPECIALI
    // -----------------------------------------------------------------------------------------------------------
    ArcBaseDir := CurrDir + 'ArcBase';
    ArcBaseDir := SlashFinale(ArcBaseDir);
    if not DirectoryExists(ArcBaseDir) then
      CreateDir(ArcBaseDir);
    // COntrolla che la directory dell'azienda ci sia, se non c'è significa che
    // non è stata ancora creata e quindi la crea con tutti gli archivi vuoti.
    // NB: Solo se è il server
    if IsServer then
      ControllaEsistenzaCartellaAzienda(ArcDir);

    // Se connesso disconnette il database dei dati dell'azienda
    if DBAzienda.Connected then
      DBAzienda.Disconnect;

    // Se il flag 'ApriSoloPercorsiAziende' è attivato non apre le altre tabelle, altrimenti SI!
    if not ApriSoloPercorsiAziende then
    begin
      // Controlla se il database è bloccato per manutenzione e se lo è si rifiuta di continuare ed esce
      if LockedDatabase then
      begin
        Messaggi('ATTENZIONE !!!', 'L''accesso all''azienda ''' + AziendaCorrente +
          ''' è BLOCCATO per manutenzione.'#13#13'Si prega di riprovare fra pochi minuti.'#13#13'Il programma si chiuderà automaticamente.', 'NB: Se il problema persiste chiamare il centro di assistenza.',
          [mbOk], 0, nil);
        Exit;
      end;
      // Entra nella parte di controllo delle tabelle ed eventuale ristrutturazione (Se flag Ristruttura = True)
      // solo se si stà creando un nuovo file di database (ConnettiDatabase ritorna True) per creare anche le
      // tabelle, oppure se si è in modalità di Ristrutturazione; ovviamente solo il server può entrare.
      // NB: Se siamo in ristrutturazione ed è il server imposta la proprietà FORCED-WRITES = OFF per essere più
      // veloce, però se non siamo in ristrutturazione lo rimette subito a ON per evitare perdite di dati.
      if ModoRistrutturazioneArchivi then
        DBAzienda.ForcedWrites := dpbFalse
      else
        DBAzienda.ForcedWrites := dpbTrue;

      if ConnettiDatabase(DBAzienda, ServerAddress, ArcDBFile, IBUser, IBPswd) or ModoRistrutturazioneArchivi then
      begin

        // Effettua il controllo sul CharSet e se è nullo imposta il CharSet predefinito
        if ControllaCharSetDatabase(DBAzienda) then
        begin
          CambiaCharSetDefault(DBAzienda);
        end;

        // Aggiorna messaggio di stato a video
        DM1.ShowWait('Levante', 'Bloccaggio del Database');
        if not LockDatabaseAccess then
          Exit;

        if ModoRistrutturazioneArchivi then
        begin
          VerificaDatabase(DBGenerale, DBAzienda, IBUser, IBPswd, ArcDBFile, FirebirdBinDir);
          // Se siamo in ristrutturazione ma si è scelto di non fare la ristrutturazione perchè
          // magari si è scelto di fare solo la riparazione del database.
          if AziendeForm.CBNoRistrutturazione.Checked then
            Exit;
          // Procedura che verifica se deve essere fatta la conversione delle giacenze di magazzino
          // dalla struttura del magazzino dinamico 1 a quella del magazzino dinamico 2. In pratica
          // se nel database ci trova la vista MAG_ART significa che proveniamo da una versione con
          // magazzino dinamico 1 e quindi avvia la prima parte della conversione. La prima parte della
          // conversione ricava tutte le giacenze attuali (cioè nel modo vecchio) e le salva tutte nel
          // MAGAZZINI_TEMP.
          // NB: SOLO SE SIAMO IN RITRTUTTURAZIONE
          ConversioneGiacenzeMagazzinoParte1;
        end;


        // Rimuove tutte le viste presenti nel database in modo da togliere tutti i vincoli
        EliminaViste;
        EliminaTriggers;
        // Verifica la presenza ed eventualmente crea i generatori di ID
        Generators_VerificaCreazione;
        // Elimina e re-registra le udf esterne
        DM1.ShowWait('Levante', 'Elimina UDF esterne.');
        EliminaUdfEsterne;
        DM1.ShowWait('Levante', 'Registra UDF esterne.');
        RegistraUdfEsterne;

        // Solo se è in ristrutturazione effettuerà delle elaborazioni aggiuntive prima della ristrutturazione vera e propria
        if ModoRistrutturazioneArchivi then
        begin
          // Procedure che cambia il nome del campo START della tabella IMPEGNI perchè
          // da Firebird 2.1 in avanti "START" è una parola riseervata.
          CambiaNomeCampoStart;
          // Elimina il campo 'Città' nella tabella DATIAZIE perchè altrimenti dà problemi in quanto è con l'accento
          // ho dovuto fare così per levarmi di dosso questo problema
          // NB: DA ELIMINARE TRA QUALCHE VERSIONE !!!!!!
          try
            EliminaCampoCitta
          except
          end;
          // Funzione che inserisce un valore nel campo PROGRIGO dei righi di quei documenti vecchi creati quando ancora tale campo
          // non esisteva e quindi sono NULL
          ControllaCampoProgRigo;
          // Funzione che elimina la tabella delle banche se quella attualmente presente è ancora la versione che
          // contiene il CODICE come campo chiave in quanto tale archivio non è ristrutturabile e quindi
          // la elimina così voene creata direttamente nuova.
          EliminaBancheSeStrutturaConCodice;
          // Funzione che defaultizza a 0 (zero) il valore del punto di riordino e della scorta
          // minima per tutti gli articoli dove questi campi sono nulli.
          DefaultizzaPuntoRirdinoScortaMinima;
          // Funzione che defaultizza a '' (STRINGA VUOTA) il valore del CodiceArticoloFornitore
          // perchè altrimenti da quando abbiamo fatto la possibilità di inserire listini fornitori
          // secondari a volontà anche più codici articoli per un solo fornitore per un articolo
          // mi dava un errore perchè ora il campo è nella chiave.
          DefaultizzaCodiceArticoloFornitore;
          // Svuota le tabelle relative alle etichette
          SvuotaEtichette;
        end;

        // Esegue il controllo delle tabella per vedere se le deve creare o ristrutturare
        ControllaTabella('PROGRESS', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PROGRESS2', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PROGREG', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('ALIQIVA', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('BANCHE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('STATI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('DATIAZIE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PAGAM', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('ARTICOLI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('DIBATESTATE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('DIBARIGHI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('MAGAZZINI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('MAGAZZINI_TEMP', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LISTFORN', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CLIENTI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('SUBSOGG', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PRATICHE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('TESTI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('GC_COSTOMEDIO', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PRVORDCL', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('RIGHIPRV', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PRVORDCL_FE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PRVORDCL_DOCCORRELATI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('SCADENZ', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CONTATTI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('EXTPRG', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('EXTFILE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('ALLEGATI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CONFORM', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('RIGHICONF', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('DOCSEL', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEG1', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEG2', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEG3', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEG4', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEG5', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEG6', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEG7', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEG8', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEGCANT1', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEGCANT2', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEGCANT3', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEGCANT4', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEGCANT5', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CATEGCANT6', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PRIMANOT', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CAUSALI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('ANAGMAGA', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('GRUPPI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CONDVEND', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LABART', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LABSOGG', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('IMPEGNI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('TECNICI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PHOTOART', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('SOTTOCANTIERI1', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('SOTTOCANTIERI2', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('SOTTOCANTIERI3', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('CAUSALICANTIERI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('APPARECCHI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('SOCDISTRGAS', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('AUTOMEZZI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('DIPENDENTI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('TIPIOREDIPENDENTI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('RAPGIORN', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('RAPGIORNRIGHI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('RAPGIORNRIGHISPESE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('RICARICHI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LISTINIRICEVUTI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('AGENTI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('AGENTI2', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('AGENTI3', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('AGENTI4', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('TIPIRIGHI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('INDICE_CAT', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('INDICE_CAT_FORNITORI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('PRATAPPARECCHI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('OP', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('OPPRATICA', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('OPIMPEGNO', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('ALLEGATI_MANUT', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('IMPEGNI_APPSEL', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('STRADARIO_PROVINCE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('STRADARIO_COMUNI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('STRADARIO_CAP', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('STRADARIO_STRADE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('ENTI_X_ALLEGATI_MANUT', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('COM_IMPOSTAZIONI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('COM_MESSAGGI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('COM_STORICO', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('IMPEGNI_TASKS', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('IMPEGNI_GCAL', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('TAGCOL_TABELLE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LOOKUP_PA', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LDE_DOCUMENTI', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LDE_PAGINE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LDE_PUZZLE', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        ControllaTabella('LDE_PUZZLEOBJ', ArcDBFile, DBAzienda, ModoRistrutturazioneArchivi);
        // Per fare in modo che non rimagna il titolo principale precedente
        CloseWait;

        // Solo se è in ristrutturazione effettuerà delle elaborazioni aggiuntive dopo della ristrutturazione vera e propria
        if ModoRistrutturazioneArchivi then
        begin
          // Procedura che converte i codici articolo dei righi documento con valore NULL
          // in valore ''
          DM1.ShowWait('Levante', 'Correzione codici articolo nulli nei righi documenti.');
          ControlloCodiciArticoloNulliDoc;
          // Converte gli eventuali impegni di tipo "Appuntam." in "Appuntamento"
          DM1.ShowWait('Levante', 'Conversione impegni di tipo "Appuntam." in "Appuntamento"');
          ConvertiAppuntamenti;
          // Procedure che valorizza il Master_ID degli impegni che lo hanno a null
          DM1.ShowWait('Levante', 'Defaultizzazione Master_ID');
          DefaultizzazioneMasterID;
          // Procedure che valorizza il campo ID delle pratiche che lo hanno a null
          DM1.ShowWait('Levante', 'Defaultizzazione ID pratiche');
          DefaultizzazioneIdPratiche;
          // Procedure che valorizza il campo ID delle pratiche che lo hanno a null
          DM1.ShowWait('Levante', 'Defaultizzazione ID scadenze');
          DefaultizzazioneIdScadenze;
          // COnverte le OP senza IVA calcolando anche l'IVA compresa
          DM1.ShowWait('Levante', 'Verifica e convervione OP');
          DM2.ConvertiOpIva('OP');
          DM1.ShowWait('Levante', 'Verifica e convervione OPPRATICA');
          DM2.ConvertiOpIva('OPPRATICA');
          DM1.ShowWait('Levante', 'Verifica e convervione OPIMPEGNO');
          DM2.ConvertiOpIva('OPIMPEGNO');
          // Conversioni per fattura elettronica
          DM1.ShowWait('Levante', 'Defaultizzazione sigla nazione soggetti');
          DM2.DefaultizzaSiglaNazioneSoggetto;
          DM1.ShowWait('Levante', 'Defaultizzazione natura IVA (aliquote IVA)');
          DM2.DefaultizzaNaturaIVA_FE;
          // Documenti: converte il campo che indica se la fattura è in SPlitPayment, che prima era un checkbox,
          //  per renderlo adatto al nuovo combobox
          DM1.ShowWait('Levante', 'Conversione esibilità IVA nei documenti');
          DM2.ConvertiCampoEsibilitaIVAneiDocumenti;
        end;

        // Aggiorna messaggio di stato a video
        DM1.ShowWait('', 'Inizializzazione archivi');
        // Lancia la preocedura che inizializza gli archivi che necessitano di essere inizializzati
        // NB: Solo se è il server
        InizializzaArchiviVari;
        // Controllo presenza file di importazione degli archivi di base più recente
        DM1.ShowWait('Levante', 'Controllo presenza di Archivi di Base aggiornati');
        ControllaNuovoArcBase(NuovaAzienda);
        // Creazione delle viste
        CreaViste;
        CreaTriggers;
        // Crea le OP predefinite
        DM1.ShowWait('Levante', 'Creazione OP predefinite');
        DM2.CreaOpPredefinite;
        // Crea le comunicazioni automatiche predefinite
        DM1.ShowWait('Levante', 'Creazione comunuicazioni automatiche predefinite');
        DM2.CreaComunicazioniAutomatichePredefinite;
        // Procedura che esegue la 2° parte della conversione delle giacenze di magazzino
        // dalla struttura del magazzino dinamico 1 a quella del magazzino dinamico 2. In pratica
        // se nel database ci trova la vista MAG_ART significa che proveniamo da una versione con
        // magazzino dinamico 1 e quindi avvia la prima parte della conversione. La prima parte della
        // conversione ricava tutte le giacenze attuali (cioè nel modo vecchio) e le salva tutte nel
        // MAGAZZINI_TEMP.
        // NB: SOLO SE SIAMO IN RITRTUTTURAZIONE
        if ModoRistrutturazioneArchivi then
          ConversioneGiacenzeMagazzinoParte2;
        // Effettua, se necessario la conversione dei rapporti giornalieri
        RistRappGiorn_ConvertiRapportiGiornalieri;
        // Converte il campo TIPODOC dei righi perchè c'erano delle discrepanze
        DM1.ShowWait('Levante', 'Conversione TIPODOC righi...');
        RistRappGiorn_ConvertiTipoDocRighiRappGiorn;
        // Crea valori tabella LOOKUP_PA
        DM1.ShowWait('Levante', 'Creazione tabella di lookup per la fattura elettronica PA...');
        DM2.CreaLookupTableFatturaPA;
        DM1.ShowWait('Levante', 'Crea nature IVA F.E. ver. 1.6.1 se non esistenti...');
        DM2.CreaAliquotaIVA_Ristrutturazione;
        DM1.ShowWait('Levante', 'Crea causali F.E. ver. 1.6.1 se non esistenti...');
        DM2.CreaCausali_1_6_1;
        // Se il soggetto è una persona fisica copia il cognome+nome nella ragione sociale
        DM1.ShowWait('Levante', 'Copia Cognome+Nome nel campo RagioneSociale per le persone fisiche...');
        DM2.PersoneFisiche_CopiaCognomeNomeInRagioneSociale;
        // Aggiorna le versione del database
        SettaVersioneDatabase;
        // Sblocca il database
        DM1.ShowWait('Levante', 'Sbloccaggio del Database');
        UnLockDatabaseAccess;
      end;
      // Verifica se PageSize del database è quello corretto ed evetualmente lo cambia
      if not IsCorrectDatabasePageSize(DBAzienda) then
      begin
        DM1.Messaggi('Levante - Controllo Integrità Archivi',
          'ATTENZIONE!!!'#13#13'La dimensione della pagina (page size) del database non è corretta.'#13#13'CHIAMARE IL CENTRO SERVIZI!!!',
          'Dimensione pagina corretta:   ' + IntToStr(DB_PAGE_SIZE) + #13#13'Dimensione pagina attuale:   ' + IntToStr(DBAzienda.PageSize), [mbOk], 0, nil);
      end;
      // Carica e confronta la versione del database con quella del programma
      // e se non coincidono ferma tutto.
      DbVer := GetDbVer;
      if DbVer <> MainForm.PrgVersion then
      begin
        DM1.Messaggi('Controllo versione database',
          'Le versione degli archivi e del programma non sono allineate.'#13#13'Per evitare una possibile perdita di dati l''esecuzione del programma verrà terminata.',
          'NB: Per ulteriori informazioni chiamare il Centro Servizi Levante.', [mbOk], 0, nil);
        // Chiude tutto
        MainForm.TimerStartStop.Interval := 500;
        MainForm.TimerStartStop.Tag := 9;
        MainForm.TimerStartStop.Enabled := True;
      end;

      // Per introduzione fattura elettronica 1.6.1:
      // Disabilita le aliquote IVA con le vecchie NaturaIVA N2, N3 e N6 non più
      //  utilizzabili dal 01/01/2021 (quindi le disabiliterà a partire da questo giorno)
      DM1.ShowWait('Levante', 'Verifica Nature IVA...');
      DM2.DisabilitaVecchieNatureIVA_1_6_1;

      // Attiva le tabelle
      DM1.ShowWait('Levante', 'Attivazione tabelle di base...');
      ApriTabella(TableAliquoteIVA, ModoRistrutturazioneArchivi);
      ApriTabella(TableStatiDocumenti, ModoRistrutturazioneArchivi);
      ApriTabella(TableDatiAzienda, ModoRistrutturazioneArchivi);
      ApriTabella(TableProgressivi, ModoRistrutturazioneArchivi);
      ApriTabella(TableProgressivi2, ModoRistrutturazioneArchivi);
      ApriTabella(TablePratiche, ModoRistrutturazioneArchivi);
      ApriTabella(TableTesti, ModoRistrutturazioneArchivi);
      ApriTabella(TableConformita, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_RegimeFiscale, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_SocioUnico, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_StatoLiquidazione, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_NaturaIVA, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_CondizioniPagamento, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_ModalitaPagamento, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_RitAccCausalePag, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_EsigibilitaIVA, ModoRistrutturazioneArchivi);
      ApriTabella(DM2.TableLookupPA_TipoDocumento, ModoRistrutturazioneArchivi);
      // Per fare in modo che non rimagna il titolo principale precedente
      CloseWait;

      // Controlla il CodiceOpera1 e se è vuoto lo pone uguale a "O0", altrimenti
      // lo lascia come era
      DM1.ShowWait('Levante', 'Controllo codice opera...');
      CheckForCodiceOpera0;

      // Inizializza il sistema di lettura dei codici a barre
      DM1.ShowWait('Levante', 'Inizializzazione sistema BarCode...');
      MainForm.BarCodeReadingInit;

      // Aggiorna l'azienda corrente sul file dei parametri
      // NB: Solo se è un'azienda normale, se invece è un'azienda
      // esterna non aggiorna nulla.
      if AziendaCorrente <> 'AZIENDA_ESTERNA' then
      begin
        P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
        try
          P.WriteString('ARCPATH', 'AziendaCorrente', DM1.AziendaCorrente);
          P.WriteString('ARCPATH', 'IDOperatore', DM1.IDOperatoreCorrente);
          P.UpdateFile;
        finally
          P.Free;
        end;
      end;

      // Esegue il primo controllo all'avvio della chiave di protezione
      TimerSmartKeyTimer(Self);

      // Se non siamo in ristrutturazione attiva il timer per il polling
      // relativo agli allegati con allarme scaduto
      // NB: Disattivo gli allarmi sugli allegati (PostIt) perchè davano alcuni AV (penso)
//      Allegati_Alarm_EnableTimerPolling((not ApriSoloPercorsiAziende) and (not ModoRistrutturazioneArchivi));

      // Controlla ed eventualmente elimina i righi orfani presenti
      // NB: Spostato al momento della ristrutturazione degli archivi per motivi prestazionali
      // EliminaRighiDocumentiOrfani;

      // =========================================================================
      // LOGHI.INI
      // -------------------------------------------------------------------------
      DM1.ShowWait('Levante', 'Verifica files intestazione documenti...');
      fRepository_Loghi := TRepositoryFile.Create;
      fRepository_Loghi.FileNameNoExt := 'loghi';
      fRepository_Loghi.FileDir := UserAppDataLevanteDir; // DM1.CurrDir;
      if DM1.SeparateLogoMode then
        fRepository_Loghi.Azienda := DM1.AziendaCorrente
      else
        fRepository_Loghi.Azienda := '';
      fRepository_Loghi.OriginalFileNameWithExt := 'loghi.ini';
      fRepository_Loghi.OriginalFileDir := DM1.CurrDir;
      fRepository_Loghi.IB_Connection := DM1.DBGenerale;
      fRepository_Loghi.ForceLocal := False;
      fRepository_Loghi.OtherFileName1 := 'Intestaz1.bmp';
      fRepository_Loghi.OtherFileName2 := 'Piede1.bmp';
      fRepository_Loghi.OtherFileName3 := 'Intestaz2.bmp';
      fRepository_Loghi.OtherFileName4 := 'Piede2.bmp';
      fRepository_Loghi.OtherFileName5 := 'Intestaz3.bmp';
      fRepository_Loghi.OtherFileName6 := 'Piede3.bmp';
      fRepository_Loghi.CheckFile;
      // =========================================================================

      // =========================================================================
      // Se il flag apposito indica che i loghi sono separati per aziende dirotta
      // l'apposita cartella nella cartella dell'azienda
      // if SeparateLogoMode then LoghiDir := ArcDir else LoghiDir := CurrDir;
      LoghiDir := Repository_Loghi.AziendaDir;
      // ===========================================================================================================

    end;
  finally
    QryAziende.Free;
    CloseWait;
  end;
end;

// Procedure che cambia il nome del campo START della tabella IMPEGNI perchè
// da Firebird 2.1 in avanti "START" è una parola riseervata.
procedure TDM1.CambiaNomeCampoStart;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Verifica la presenza del campo START nella tabella IMPEGNI
    Qry.SQL.Add('SELECT * FROM RDB$RELATION_FIELDS WHERE RDB$FIELD_NAME=''START'' AND RDB$RELATION_NAME=''IMPEGNI''');
    Qry.Open;
    // Se il campo START è presente allora lo rinomina
    if not Qry.Eof then
    begin
      DM1.DBAzienda.ExecSQL('ALTER TABLE IMPEGNI ALTER COLUMN START TO START_EVENT');
      DM1.DBAzienda.ExecSQL('ALTER TABLE IMPEGNI ALTER COLUMN FINISH TO FINISH_EVENT');
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

// Procedure che valorizza il Master_ID degli impegni che lo hanno a null
procedure TDM1.DefaultizzazioneMasterID;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE IMPEGNI I SET');
    Qry.SQL.Add('I.MASTER_ID = (SELECT GEN_ID(GEN_ID_IMPEGNI, 1) FROM RDB$DATABASE)');
    Qry.SQL.Add('WHERE I.MASTER_ID IS NULL');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

// Svuota le tabelle relative alle etichette
procedure TDM1.SvuotaEtichette;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('DELETE FROM LABART');
    Qry.ExecSQL;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM LABSOGG');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

// Procedure che valorizza il Master_ID degli impegni che lo hanno a null
function TDM1.Impegno_ID_To_MasterID(ID: Integer): Integer;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COALESCE(MASTER_ID,0) FROM IMPEGNI WHERE ID = ' + IntToStr(ID));
    Qry.Open;
    if not Qry.Eof then
      Result := Qry.Fields[0].AsInteger;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

// Procedure che valorizza il campo ID delle pratiche che lo hanno a null
procedure TDM1.DefaultizzazioneIdPratiche;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE PRATICHE P SET');
    Qry.SQL.Add('P.ID = (SELECT GEN_ID(GEN_ID_PRATICHE, 1) FROM RDB$DATABASE)');
    Qry.SQL.Add('WHERE P.ID IS NULL');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.DefaultizzazioneIdScadenze;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE SCADENZ S SET');
    Qry.SQL.Add('S.ID = (SELECT GEN_ID(GEN_ID_SCADENZE, 1) FROM RDB$DATABASE)');
    Qry.SQL.Add('WHERE S.ID IS NULL');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.DefaultizzazioneIdSecurity;
var
  Qry: TIB_Cursor;
begin
  Generators_VerificaPresenzaCreazioneGeneratore('GEN_ID_SECURITY', True);
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;
    Qry.SQL.Add('UPDATE SECURITY S SET');
    Qry.SQL.Add('S.ID = (SELECT GEN_ID(GEN_ID_SECURITY, 1) FROM RDB$DATABASE)');
    Qry.SQL.Add('WHERE S.ID IS NULL');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

// Procedure che accumula alcune conversioni da fare durante la ristrutturazione soprattutto
// alla tabella RighiPRV
// Questa provedura viene richiamata dalla funzione "ControllaTabella" prima della creazione
// degli indici per motivi prestazionali
procedure TDM1.ConversioniVarieRighiPrvSenzaIndici;
var
  Q: TIB_Script;
begin
  Q := TIB_Script.Create(Self);
  try
    Q.IB_Connection := DM1.DBAzienda;
    // Carica ed esegue lo script che eseguirà alcune conversioni relative
    // alla tabella RIGHIPRV da eseguirsi senza tutti gli indici.
    Q.SQL.LoadFromFile(CurrDir + 'SCRIPT_RESTRUCT_RIGHIPRV_NOIDX.SQL');
    Q.Execute;
  finally
    CloseWait;
    Q.Free;
  end;
  // Funzione che unisce in un unico campo (DESCRIZIONE) le descrizioni di quei righi
  // che hanno la descrizione lunga alla vecchia maniera e cioè 5 righe su 5 campi.
  // NB: Idispensabile da quando abbiamo messo le descrizione lunghe che stanno
  // tutte su un unico campo.
  // NB: Commentato perchè non dovrebbe servire più, se poi dovesse servire cmq. non lo cancello
  {
    if not AbilitaDescrizioni2345 then begin
    DM1.ShowWait('Levante', 'Controllo e unione vecchie descrizioni i una sola descrizione lunga.');
    UnisciDescrizioneArticoloEstesa;  //####
    end;
  }
  // Esegue la conversione dei righi dal vecchio GC
  // NB: Non più necessaria perchè tanto questi campi non si usano più
  {
    PopolamentoMagQtaPerNuovoGC;  //####
  }
end;

// Procedure che esegue uno script che registra alcune UDF esterne
procedure TDM1.RegistraUdfEsterne;
var
  Q: TIB_Script;
begin
  Q := TIB_Script.Create(Self);
  try
    Q.IB_Connection := DM1.DBAzienda;
    // Carica ed esegue lo script che eseguirà alcune conversioni relative
    // alla tabella RIGHIPRV da eseguirsi senza tutti gli indici.
    Q.SQL.LoadFromFile(CurrDir + 'SCRIPT_REGISTER_EXTERNAL_FUNCTIONS.SQL');
    Q.Execute;
  finally
    Q.Free;
  end;
end;

// Procedure che elimina le UDF esterne presenti
procedure TDM1.EliminaUdfEsterne;
var
  Q, QDel: TIB_Cursor;
begin
  try
    // IMpostazione della query che elimina l'UDF
    QDel := TIB_Cursor.Create(Self);
    QDel.DatabaseName := DM1.ArcDBFile;
    QDel.IB_Connection := DM1.DBAzienda;
    // IMpostazione query per elenco UDF presenti nel database
    Q := TIB_Cursor.Create(Self);
    Q.DatabaseName := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT RDB$FUNCTION_NAME FROM RDB$FUNCTIONS WHERE RDB$SYSTEM_FLAG IS NULL OR RDB$SYSTEM_FLAG = 0');
    Q.Open;
    // Cicla per tutte le UDF non di sistema trovate e le elimina
    while not Q.Eof do
    begin
      // Elimina la UDF corrente
      QDel.SQL.Clear;
      QDel.SQL.Add('DROP EXTERNAL FUNCTION ' + Q.Fields[0].AsString);
      QDel.ExecSQL;
      // Avanti il prossimo
      Q.Next;
    end;
    // Chiude la query
    Q.Close;
  finally
    if Assigned(Q) then
      Q.Free;
    if Assigned(QDel) then
      QDel.Free;
  end;
end;

// Controlla il CodiceOpera1 e se è vuoto lo pone uguale a "O0", altrimenti
// lo lascia come era
procedure TDM1.CheckForCodiceOpera0;
begin
  if TableProgressiviCODICEOPERA.IsNull or (Trim(TableProgressiviCODICEOPERA.AsString) = '') then
  begin
    TableProgressivi.Edit;
    try
      try
        TableProgressiviCODICEOPERA.Value := 'M0';
        TableProgressivi.Post;
      except
        TableProgressivi.Cancel;
        TableProgressivi.CancelUpdates;
      end;
    finally
      TableProgressivi.ApplyUpdates;
      TableProgressivi.CommitUpdates;
    end;
  end;
end;

// Se ci sono dei righi con CodiceArticoloStm nullo e al contempo
// invece il CodiceArticolo è valorizzato pone CodiceArticoloStm
// uguale al CodiceArticolo.
// Converte gli "Appuntam." in "Appuntamenti"
procedure TDM1.ConvertiAppuntamenti;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    Qry.SQL.Add('UPDATE IMPEGNI I SET');
    Qry.SQL.Add('I.TIPOIMPEGNO = ''Appuntamento''');
    Qry.SQL.Add('WHERE I.TIPOIMPEGNO = ''Appuntam.''');

    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

// Se ci sono dei righi del disegno della dichiarazione di conformità che hanno
// il campo S3SEZIONE nullo lo modifica per default in 'GAS'

// Procedura che converte tutti i codici articolo con valore NULL in codici
// articolo con valore ''
procedure TDM1.ControlloCodiciArticoloNulliDoc;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE RIGHIPRV SET CODICEARTICOLO = '''' WHERE CODICEARTICOLO IS NULL');
    Qry.ExecSQL;

    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE DIBARIGHI SET CODICEARTICOLO = '''' WHERE CODICEARTICOLO IS NULL');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

// Funzione che unisce in un unico campo (DESCRIZIONE) le descrizioni di quei righi
// che hanno la descrizione lunga alla vecchia maniera e cioè 5 righe su 5 campi.
// NB: Idispensabile da quando abbiamo messo le descrizione lunghe che stanno
// tutte su un unico campo.
procedure TDM1.UnisciDescrizioneArticoloEstesa;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    Qry.SQL.Clear;
    Qry.SQL.Add
      ('UPDATE ARTICOLI SET DESCRIZIONE = DESCRIZIONE || '' '' || DESCRIZIONE2, DESCRIZIONE2 = NULL WHERE (NOT DESCRIZIONE IS NULL) AND (NOT DESCRIZIONE2 IS NULL)');
    Qry.ExecSQL;

    Qry.SQL.Clear;
    Qry.SQL.Add
      ('UPDATE ARTICOLI SET DESCRIZIONE = DESCRIZIONE || '' '' || DESCRIZIONE3, DESCRIZIONE3 = NULL WHERE (NOT DESCRIZIONE IS NULL) AND (NOT DESCRIZIONE3 IS NULL)');
    Qry.ExecSQL;

    Qry.SQL.Clear;
    Qry.SQL.Add
      ('UPDATE ARTICOLI SET DESCRIZIONE = DESCRIZIONE || '' '' || DESCRIZIONE4, DESCRIZIONE4 = NULL WHERE (NOT DESCRIZIONE IS NULL) AND (NOT DESCRIZIONE4 IS NULL)');
    Qry.ExecSQL;

    Qry.SQL.Clear;
    Qry.SQL.Add
      ('UPDATE ARTICOLI SET DESCRIZIONE = DESCRIZIONE || '' '' || DESCRIZIONE5, DESCRIZIONE5 = NULL WHERE (NOT DESCRIZIONE IS NULL) AND (NOT DESCRIZIONE5 IS NULL)');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;



// Funzione che defaultizza a 0 (zero) il valore del punto di riordino e della scorta
// minima per tutti gli articoli dove questi campi sono nulli.

// Funzione che defaultizza a 0 (zero) il valore del punto di riordino e della scorta
// minima per tutti gli articoli dove questi campi sono nulli.
procedure TDM1.DefaultizzaCodiceArticoloFornitore;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    Qry.SQL.Add('UPDATE LISTFORN SET CODICEARTICOLOFORNITORE = '''' WHERE CODICEARTICOLOFORNITORE IS NULL');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.DefaultizzaPuntoRirdinoScortaMinima;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE ARTICOLI SET PUNTORIORDINO = 0 WHERE  PUNTORIORDINO IS NULL');
    Qry.ExecSQL;

    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE ARTICOLI SET SCORTAMINIMA = 0 WHERE  SCORTAMINIMA IS NULL');
    Qry.ExecSQL;

    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE ARTICOLI SET LOTTORIORDINO = 0 WHERE  LOTTORIORDINO IS NULL');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaBancheSeStrutturaConCodice;
var
  Qry: TIB_Cursor;
begin
  // Funzione che elimina la tabella delle banche se quella attualmente presente è ancora la versione che
  // contiene il CODICE come campo chiave in quanto tale archivio non è ristrutturabile e quindi
  // la elimina così voene creata direttamente nuova.
  // ----------------------------------------------------------------------------------------------------
  Qry := TIB_Cursor.Create(Self);
  try
    // Inizializza la connessione della query
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // IMposta la query per controllare se esiste il campo CODICE nell'attuale tabella BANCHE
    Qry.SQL.Add('SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS WHERE UPPER(RDB$RELATION_NAME) = ''BANCHE'' AND UPPER(RDB$FIELD_NAME) = ''CODICE''');
    Qry.Open;
    // se esiste elimina la tabella
    if not Qry.Eof then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('DROP TABLE BANCHE');
      Qry.ExecSQL;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.ControllaCampoProgRigo;
var
  Qry: TIB_Cursor;
begin
  // Questa funzione controlla il campo ProgRigo di tutti i righi dei documenti e delle dichiarazioni di conformità
  // e se ne trova alcuni nulli ne imposta il valore progressivamente in modo che non rimangano nulli perchè
  // con la nuova struttura degli archivi fà parte della chiave primaria.
  Qry := TIB_Cursor.Create(Self);
  try
    // Inizializza la connessione della query
    Qry.DatabaseName := ArcDBFile;
    Qry.IB_Connection := DBAzienda;

    if TableExist('RIGHIPRV', ArcDBFile, DBAzienda) then
    begin
      // Prima si assicura che il campo progrigo non sia nullo altrimenti se tutti i righi hanno il prog rigo nullo non funzionano le query successive
      Qry.SQL.Add('UPDATE RIGHIPRV SET PROGRIGO=99999 WHERE PROGRIGO IS NULL');
      try
        Qry.ExecSQL;
      except
      end;
      // Query per la tabella RIGHIPRV
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE RIGHIPRV');
      Qry.SQL.Add('SET PROGRIGO=((SELECT MAX(PROGRIGO) FROM RIGHIPRV) + 1)');
      Qry.SQL.Add('WHERE PROGRIGO IS NULL OR PROGRIGO = 99999');
      try
        Qry.ExecSQL;
      except
      end;
    end;

    if TableExist('RIGHICONF', ArcDBFile, DBAzienda) then
    begin
      // Prima si assicura che il campo progrigo non sia nullo altrimenti se tutti i righi hanno il prog rigo nullo non funzionano le query successive
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE RIGHICONF SET PROGRIGO=99999 WHERE PROGRIGO IS NULL');
      try
        Qry.ExecSQL;
      except
      end;
      // Query per la tabella RIGHICONF
      Qry.SQL.Clear;
      Qry.SQL.Add('UPDATE RIGHICONF');
      Qry.SQL.Add('SET PROGRIGO=((SELECT MAX(PROGRIGO) FROM RIGHICONF) + 1)');
      Qry.SQL.Add('WHERE PROGRIGO IS NULL OR PROGRIGO = 99999');
      try
        Qry.ExecSQL;
      except
      end;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.EliminaCampoCitta;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    if TableExist('DATIAZIE', ArcDBFile, DBAzienda) then
    begin
      // Inizializza la connessione della query
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('ALTER TABLE DATIAZIE DROP Città');
      Qry.ExecSQL;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.ControllaSecurity;
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto Qry
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.GenDBFile;
    Qry.IB_Connection := DM1.DBGenerale;

    // Nell'archivio Password ci deve sempre essere un utente ADMIN con tutte le abilitazioni
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM SECURITY WHERE NOMEUTENTE = ''ADMIN''');
    Qry.Open;
    if Qry.FieldByName('EXIST').AsInteger = 0 then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO SECURITY (NOMEUTENTE,PSWD,MOD_PASSWORD) VALUES (''ADMIN'',''ADMIN'',''2'')');
      Qry.ExecSQL;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.InizializzaArchiviVari;
var
  Qry: TIB_Cursor;
begin
  // Crea l'oggetto Qry
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    // Nell'archivio Clienti ci deve sempre essere un cliente finto (con tutti i campi vuoti)
    // e con codice '0' perchè è indispensabile per il corretto funzionamento dei documenti
    // non nominativi (Ricevute fiscali, preventivi ecc.). Se non lo trova lo crea.
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM CLIENTI WHERE CODICE = 0');
    Qry.Open;
    if Qry.FieldByName('EXIST').AsInteger = 0 then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO CLIENTI (CODICE) VALUES (0)');
      Qry.ExecSQL;
    end;

    // Nell'archivio Articoli ci deve sempre essere un articolo con codice
    // = '' e descrizione = 'VARIE'. Serve per la gestione del giornale
    // di cantiere per quei righi documento che specificano articoli senza codice
    // quindi quei righi inseriti a mano dall'utente direttamente sul documento e
    // quindi non presenti nell'archivio articoli.
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM ARTICOLI WHERE CODICEARTICOLO = ''''');
    Qry.Open;
    if Qry.FieldByName('EXIST').AsInteger = 0 then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO ARTICOLI (CODICEARTICOLO, DESCRIZIONE) VALUES ('''', ''VARIE'')');
      Qry.ExecSQL;
    end;

    // Nell'archivio dei progressivi ci deve essere sempre
    // un record con IndexField := 1
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM PROGRESS');
    Qry.Open;
    if Qry.FieldByName('EXIST').AsInteger = 0 then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO PROGRESS (INDEXFIELD) VALUES (1)');
      Qry.ExecSQL;
    end;
    // Nell'archivio dei progressivi ci deve essere sempre
    // un record con IndexField := 1
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM PROGRESS2');
    Qry.Open;
    if Qry.FieldByName('EXIST').AsInteger = 0 then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO PROGRESS2 (INDEXFIELD, SMTP_SERVER_PORT, SMTP_SERVER_SECURE, SMS_SERVER_SOGLIA_AVVISO) VALUES (1, ''25'', ''NO'', 0)');
      Qry.ExecSQL;
    end;

    // Nell'archivio dei Registri dei progressivi ci deve essere sempre almeno
    // un registro, se non c'è ne crea uno di default di nome '-'
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM PROGREG');
    Qry.Open;
    if Qry.FieldByName('EXIST').AsInteger = 0 then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO PROGREG (REGISTRO) VALUES (''-'')');
      Qry.ExecSQL;
    end;

    // Nell'archivio dei Magazzini ci deve essere sempre almeno
    // un magazzino con codice = 1, se non c'è lo crea
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM ANAGMAGA');
    Qry.Open;
    if Qry.FieldByName('EXIST').AsInteger = 0 then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO ANAGMAGA (CODICE,DESCRIZIONE) VALUES (1,''UNICO'')');
      Qry.ExecSQL;
    end;

    // Nell'archivio dei dati azienda ci deve sempre essere un record
    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT COUNT(*) AS EXIST FROM DATIAZIE');
    Qry.Open;
    if Qry.FieldByName('EXIST').AsInteger = 0 then
    begin
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO DATIAZIE (RAGIONESOCIALE) VALUES (''AZIENDA DI PROVA'')');
      Qry.ExecSQL;
    end;

    {
      // -----------------------------------------------------------------------
      // Nell'archivio LABART ci deve essere almeno un record particolare per fornire
      //  i dati durante l'imostazione delle etichette
      Qry.Close; Qry.SQL.Clear;
      Qry.SQL.Add('SELECT COUNT(*) FROM LABART WHERE CODICESTAZIONE = ''0000'' AND PROGRIGO = 1');
      Qry.Open;
      if Qry.Fields[0].AsInteger = 0 then begin
      Qry.Close; Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO LABART (PROGRIGO, CODICESTAZIONE, CODICEARTICOLO, DESCRIZIONE, DESCRIZIONE2, DESCRIZIONE3, DESCRIZIONE4, DESCRIZIONE5,');
      Qry.SQL.Add(' UNITADIMISURA, PREZZODIVENDITA, PREZZODIVENDITA2, PREZZODIVENDITA3, PREZZODIVENDITA4, PRZVENDIVACOMP1, PRZVENDIVACOMP2, PRZVENDIVACOMP3, PRZVENDIVACOMP4,');
      Qry.SQL.Add(' BARCODE, MARCA, TIPODOCUMENTO, REGISTRO, NUMORDPREV, DATADOCUMENTO, CODICECLIENTE)');
      Qry.SQL.Add('VALUES (1, ''0000'', ''CodiceArticolo'', ''Descrizione articolo'', ''Descrizione articolo2'', ''Descrizione articolo3'', ''Descrizione articolo4'', ''Descrizione articolo5'',');
      Qry.SQL.Add(' ''UM'', 10, 20, 30, 40, 12, 24, 36, 48, ''BarCode'', ''Marca'', ''TipoDocumento'', ''Reg.'', 1234, ''2004/12/31'', 123)');
      Qry.ExecSQL;
      end;
      // -----------------------------------------------------------------------

      // -----------------------------------------------------------------------
      // Nell'archivio LABSOGG ci deve essere almeno un record particolare per fornire
      //  i dati durante l'imostazione delle etichette
      Qry.Close; Qry.SQL.Clear;
      Qry.SQL.Add('SELECT COUNT(*) FROM LABSOGG WHERE CODICESTAZIONE = ''0000'' AND PROGRIGO = 1');
      Qry.Open;
      if Qry.Fields[0].AsInteger = 0 then begin
      Qry.Close; Qry.SQL.Clear;
      Qry.SQL.Add('INSERT INTO LABSOGG (PROGRIGO, CODICESTAZIONE, CODICE, RAGIONESOCIALE, INDIRIZZO, NUMCIVICO, CITTA, CAP, PROVINCIA)');
      Qry.SQL.Add('VALUES (1, ''0000'', 123, ''RAGIONE SOCIALE'', ''INDIRIZZO'', ''NUM'', ''CITTA'', ''12345'', ''PR'')');
      Qry.ExecSQL;
      end;
      // -----------------------------------------------------------------------
    }
  finally
    Qry.Free;
  end;
end;

procedure TDM1.InizializzaCausaliDocumenti;
var
  L: TMemIniFile;
  Causali: TStrings;
  i: Integer;
  TmpCausale, TmpDescrizione, TmpSegnoOp, TmpDaFatturare: String;
  Qry: TIB_Cursor;
begin
  // Questa procedura si occupa di riempire l'archivio della causali dei documenti con quelle che per default devono
  // NECESSARIAMENTE essere presenti.
  // ----------------------------------------------------------------------------------------------------------------
  // Inizializza ed apre il file Layouts.ini
  L := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  // Crea la query
  Qry := TIB_Cursor.Create(Self);
  try
    // Inizializza la connessione della query
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Crea l'oggetto che conterrà l'elenco di tutte le causali da creare
    Causali := TStringList.Create;
    // Carica l'elenco delle causali da creare
    L.ReadSectionValues('CausaliDocumenti', Causali);
    // Cicla per tutte le causali da creare
    for i := 0 to Causali.Count - 1 do
    begin
      // IMporta in delle variabli temporanee i dati della causale corrente
      TmpCausale := Causali[i];
      TmpCausale := DM1.StrRight(TmpCausale, Length(TmpCausale) - 3); // Purufuca dal numero progressivo dei righi in Layouts.ini
      TmpDescrizione := Trim(DM1.RitornaTestoPrimaDi(',', TmpCausale, True));
      TmpSegnoOp := Trim(DM1.RitornaTestoPrimaDi(',', TmpCausale, True));
      TmpDaFatturare := Trim(TmpCausale);
      // Query che controlla che non vi sia già una causale con la stessa descrizione
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT COUNT(*) AS QUANTE FROM CAUSALI WHERE DESCRIZIONE = ''' + TmpDescrizione + '''');
      Qry.Open;
      // Se non esiste già la crea
      if Qry.FieldByName('QUANTE').Value = 0 then
      begin
        // Query che inserisce la nuova causale
        Qry.Close;
        Qry.SQL.Clear;
        Qry.SQL.Add('INSERT INTO CAUSALI (DESCRIZIONE,SEGNOOPERAZIONE,DAFATTURARE,READONLY) VALUES (''' + TmpDescrizione + ''',''' + TmpSegnoOp + ''',''' +
          TmpDaFatturare + ''', ''1'')');
        Qry.ExecSQL;
      end;
    end;
  finally
    L.Free;
    Qry.Close;
    Qry.Free;
  end;
end;

procedure TDM1.CaricaNuovoListinoPrePost(Sender: TObject; var ATable: TIBOTable; var OkToPost: Boolean);
begin
  // Riempie i campi che contengono la copia non modificabile dall'utente
  // del codice articolo fornitore e della descrizione fornitore.
  ATable.FieldByName('CodiceFornitore').Value := ATable.FieldByName('CodiceArticolo').Value;
  ATable.FieldByName('DescrizioneFornitore').Value := ATable.FieldByName('Descrizione').Value;

  // Imposta il codice IVA di default
  ATable.FieldByName('CodiceIVA').Value := 1;

  // IMposta il prezzo di vendita del listino 1 (IVA fissa al 20%)
  ATable.FieldByName('PrezzoDiVendita').Value := ATable.FieldByName('PrezzoDiListino').Value;
  ATable.FieldByName('PrzVendIVAComp1').Value := ATable.FieldByName('PrezzoDiVendita').Value + (ATable.FieldByName('PrezzoDiVendita').Value * 20 / 100);

  OkToPost := True;

end;

procedure TDM1.TableConformitaPrimAccCodiceSoggChange(Sender: TField);
begin
  ConformitaForm.CaricaDatiDestinatarioRichiestaPrimaAccensione(DM1.TableConformitaPRIMACCCODICESOGG.AsInteger);
end;

procedure TDM1.TableConformitaCLIENTEChange(Sender: TField);
var
  Qry: TIB_Cursor;
  NewIndirizzo: String;
begin
  // Carica i dati del destinatario della richiesta prima accensione caldaia
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add('SELECT RAGIONESOCIALE, INDIRIZZO, NUMCIVICO, SCALA, PIANO, INTERNO, CITTA, CAP, PROVINCIA');
    Qry.SQL.Add('FROM CLIENTI');
    Qry.SQL.Add('WHERE CODICE = ' + DM1.TableConformitaCLIENTE.AsString);
    Qry.Open;
    if not Qry.Eof then
    begin
      DM1.TableConformitaRAGSOCCLI.Value := Qry.FieldByName('RAGIONESOCIALE').AsString;
      DM1.TableConformitaCAPCLI.Value := Qry.FieldByName('CAP').AsString;
      DM1.TableConformitaCITTACLI.Value := Qry.FieldByName('CITTA').AsString;
      DM1.TableConformitaPROVINCIACLI.Value := Qry.FieldByName('PROVINCIA').AsString;
      // COmposizione campi INDIRIZZO
      NewIndirizzo := '';
      if not Qry.FieldByName('INDIRIZZO').IsNull then
        NewIndirizzo := NewIndirizzo + Qry.FieldByName('INDIRIZZO').AsString;
      if not Qry.FieldByName('NUMCIVICO').IsNull then
        NewIndirizzo := NewIndirizzo + ' N. ' + Qry.FieldByName('NUMCIVICO').AsString;
      if not Qry.FieldByName('SCALA').IsNull then
        NewIndirizzo := NewIndirizzo + ' scala ' + Qry.FieldByName('SCALA').AsString;
      if not Qry.FieldByName('PIANO').IsNull then
        NewIndirizzo := NewIndirizzo + ' piano ' + Qry.FieldByName('PIANO').AsString;
      if not Qry.FieldByName('INTERNO').IsNull then
        NewIndirizzo := NewIndirizzo + ' int. ' + Qry.FieldByName('INTERNO').AsString;
      DM1.TableConformitaINDIRIZZOCLI.Value := LeftStr(NewIndirizzo, INDIRIZZOMAXLEN);
    end
    else
    begin
      MessageBeep(0);
      MessageDlg('CARICA DATI DESTINATARIO RICHIESTA PRIMA ACCENSIONE'#13#13'Soggetto non trovato !!!', mtError, [mbOk], 0)
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.TableContattiClienteChange(Sender: TField);
var
  QryCli: TIB_Cursor;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add('SELECT RagioneSociale, Indirizzo, NumCivico, Citta, CAP, Provincia, Fax');
    QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + TableContattiCliente.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      DM1.TableContattiRagSocCli.Value := QryCli.FieldByName('RagioneSociale').AsString;
      DM1.TableContattiIndirizzoCli.Value := QryCli.FieldByName('Indirizzo').AsString;
      DM1.TableContattiNUMCIVICOCLI.Value := QryCli.FieldByName('NumCivico').AsString;
      DM1.TableContattiCittaCli.Value := QryCli.FieldByName('Citta').AsString;
      DM1.TableContattiCAPCli.Value := QryCli.FieldByName('CAP').AsString;
      DM1.TableContattiProvinciaCli.Value := QryCli.FieldByName('Provincia').AsString;
    end;
  finally
    QryCli.Close;
    QryCli.Free;
  end;
end;

procedure TDM1.TableDatiAziendaCalcFields(DataSet: TDataSet);
begin
  TableDatiAziendaTITOLARECOGNOMENOME.Value := Format('%s %s', [TableDatiAziendaTITOLARECOGNOME.AsString, TableDatiAziendaTITOLARENOME.AsString]);
end;

procedure TDM1.TableTestiCLIENTEChange(Sender: TField);
var
  QryCli: TIB_Cursor;
begin
  // Carica i dati del cliente
  QryCli := TIB_Cursor.Create(Self);
  try
    QryCli.DatabaseName := DM1.ArcDBFile;
    QryCli.IB_Connection := DM1.DBAzienda;
    QryCli.SQL.Add('SELECT RagioneSociale, Indirizzo, NumCivico, Citta, CAP, Provincia, Fax');
    QryCli.SQL.Add('FROM Clienti WHERE Codice = ' + TableTestiCLIENTE.AsString);
    QryCli.Open;
    // Carica i dati l'indirizzo del cliente come destinazione merci del documento attuale
    if not QryCli.Eof then
    begin
      DM1.TableTestiRAGSOCCLI.Value := QryCli.FieldByName('RagioneSociale').AsString;
      DM1.TableTestiINDIRIZZOCLI.Value := QryCli.FieldByName('Indirizzo').AsString;
      DM1.TableTestiNUMCIVICOCLI.Value := QryCli.FieldByName('NumCivico').AsString;
      DM1.TableTestiCITTACLI.Value := QryCli.FieldByName('Citta').AsString;
      DM1.TableTestiCAPCLI.Value := QryCli.FieldByName('CAP').AsString;
      DM1.TableTestiPROVINCIACLI.Value := QryCli.FieldByName('Provincia').AsString;
    end;
  finally
    QryCli.Close;
    QryCli.Free;
  end;
end;

procedure TDM1.TableConformitaDATAValidate(Sender: TField);
begin
  // Se è la versione DEMO controlla che la data del documento inserita non sia successiva alla data di scadenza
  // del periodo di prova, nel qual caso visualizza un messaggio e forza la data alla data di fine del periodo stesso.
  if D_MODE then
  begin
    if (TDateField(Sender).AsDateTime < DM1.DemoFlags.DataPrimoAvvio) or (TDateField(Sender).AsDateTime > DM1.DemoFlags.DataScadenza) then
    begin
      raise Exception.Create('ATTENZIONE!!!' + #13#13'Nella versione dimostrativa di Lev@nte NON E'' POSSIBILE emettere documenti' +
        #13'con data antecedente o successiva al periodo di prova.' + #13#13'Il periodo di prova attuale è dal ' + DateToStr(DM1.DemoFlags.DataPrimoAvvio) +
        ' al ' + DateToStr(DM1.DemoFlags.DataScadenza) + '.');
    end;
  end;
end;

procedure TDM1.DBAziendaError(Sender: TObject; const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
begin
  // Inizializzazione
  RaiseException := True;
  // Cambia il testo degli errorri più frequenti
  case SQLCODE of
    // Key Violation
    - 803:
      begin
        ErrorMessage.Clear;
        ErrorMessage.Add('Codice o documento già esistente.');
      end;
  end;
end;

procedure TDM1.DBGeneraleAfterConnect(Sender: TIB_Connection);
begin
  // Disabilita l'evento "onError" che normalmente intercetta eventuali problemi
  // accorsi durante la connessione al database, una volta che la connessione
  // è avvenuta con successo l'evento viene disabilitato.
  (Sender as TIBODatabase).OnError := nil;
end;

procedure TDM1.DBGeneraleError(Sender: TObject; const ERRCODE: Integer; ErrorMessage, ErrorCodes: TStringList; const SQLCODE: Integer;
  SQLMessage, SQL: TStringList; var RaiseException: Boolean);
begin
  // Se capita un errore durante la connessisone poi propone
  // la visualizzazione delle impostazioni di base.
  DM1.Messaggi('Levante',
    'Ops!!!'#13#13'non riesco a connettermi al database.'#13#13'Il messaggio di errore è riportato nelle note qui sotto.'#13#13'Dopo l''OK verranno visualizzati i parametri di base.',
    'Note:'#13#13 + ErrorMessage.Text, [mbOk], 0, nil);
  VisualizzaBaseSetup;
end;

procedure TDM1.EdPropPACondizioniPagamentoPropertiesInitPopup(Sender: TObject);
begin
  EdPropPACondizioniPagamento.Properties.ListSource := DM2.SourceLookupPA_CondizioniPagamento;
end;

procedure TDM1.EdPropPAEsigibilitaIVAPropertiesInitPopup(Sender: TObject);
begin
  EdPropPAEsigibilitaIVA.Properties.ListSource := DM2.SourceLookupPA_EsigibilitaIVA;
end;

procedure TDM1.EdPropPAModalitaPagamentoPropertiesInitPopup(Sender: TObject);
begin
  EdPropPAModalitaPagamento.Properties.ListSource := DM2.SourceLookupPA_ModalitaPagamento;
end;

procedure TDM1.EdPropPANaturaIVAPropertiesInitPopup(Sender: TObject);
begin
  EdPropPANaturaIVA.Properties.ListSource := DM2.SourceLookupPA_NaturaIVA;
end;

procedure TDM1.EdPropPARegimeFiscalePropertiesInitPopup(Sender: TObject);
begin
  EdPropPARegimeFiscale.Properties.ListSource := DM2.SourceLookupPA_RegimeFiscale;
end;

procedure TDM1.EdPropPARitAccCausalePagPropertiesInitPopup(Sender: TObject);
begin
  EdPropPARitAccCausalePag.Properties.ListSource := DM2.SourceLookupPA_RitAccCausalePag;
end;

procedure TDM1.EdPropPASocioUnicoPropertiesInitPopup(Sender: TObject);
begin
  EdPropPASocioUnico.Properties.ListSource := DM2.SourceLookupPA_SocioUnico;
end;

procedure TDM1.EdPropPAStatoLiquidazionePropertiesInitPopup(Sender: TObject);
begin
  EdPropPAStatoLiquidazione.Properties.ListSource := DM2.SourceLookupPA_StatoLiquidazione;
end;

procedure TDM1.EdPropPATipoDocumentoPropertiesInitPopup(Sender: TObject);
begin
  EdPropPATipoDocumento.Properties.ListSource := DM2.SourceLookupPA_TipoDocumento;
end;

procedure TDM1.EdPropQtaOperaPropertiesValidate(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  V, HH, MM: Integer;
begin
  // Se è attivato il validate del campo
  // NB: Ho dovuto mettere un meccanismo che abilitasse o meno il validate della QTA della manodopera perchè
  // quando nel documento c'erano tante righi che non ci stavano tutti contemporaneamente a video
  // e io modificavo un rigo manodopera che era nelle ultime righe (oltre la capacità della schermata)
  // l'evento OnValidate veniva richiamato due volte (boh!) e questo causava una doppia conversione
  // del valore che scazzava tutto. Siccome l'evento veniva richiamato 2 volte a causa di alcune elaborazioni
  // del dato stesso all'interno dell'evento "OnEditValueChanged" della TableView ho inserito questo flag
  // per disabilitare l'esecuzione del validate all'inizio della gestione "OnEditValueChanged" della TableView
  // per poi ripristinare tutto all'uscita dello stesso gestore di evento.
  if GoValidateQtaOreMinuti then
  begin
    // Prima controlla che la variabile Error non sia a True, nel qual caso significherebbe
    // che già il valore inserito non è valido e quindi è inutile ricontrollarlo.
    if not Error then
    begin
      if not VarIsNull(DisplayValue) then
      begin
        // HH COntiene le ore inserite e MM i minuti V invece contiene il valore inserito dall'utente
        V := Trunc(DisplayValue);
        HH := Trunc(V / 100);
        MM := V mod 100;
        // Converte le ore e i minuti così ottenuti in minuti totali da inserire come valore nel campo
        DisplayValue := MM + (HH * 60);
        // Controlla che i minuti siano validi
        Error := MM > 59;
      end;
    end;
    // Se a questo punto Error = True visualizza un messaggio di errore e imposta 00:00 come valore
    if Error then
    begin
      ErrorText :=
        'Dato inserito NON VALIDO'#13#13#13'NB: Inserire la mano d''opera nel formato ''hh:mm'' (es: 01:30) ricordandosi di digitare anche tutti gli zeri.';
    end;
  end;
end;

procedure TDM1.EdPropREASocioUnicoPropertiesEditValueChanged(Sender: TObject);
begin
  with (Sender as TcxDBComboBox) do
  begin
    EditValue := LeftStr(VarToStr(EditValue), 2);
  end;
end;

procedure TDM1.TableConformitaBeforePost(DataSet: TDataSet);
var
  S: String;
begin
  // Marca il record come modificato
  DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
  // Compone il campo COMMISSIONATODA utile per le stampe
  S := '';
  if (not DataSet.FieldByName('COMMITDENOMINAZIONE').IsNull) and (Trim(DataSet.FieldByName('COMMITDENOMINAZIONE').AsString) <> '') then
    S := S + DataSet.FieldByName('COMMITDENOMINAZIONE').AsString;
  if (not DataSet.FieldByName('COMMITINDIRIZZO').IsNull) and (Trim(DataSet.FieldByName('COMMITINDIRIZZO').AsString) <> '') then
    S := S + ' ' + DataSet.FieldByName('COMMITINDIRIZZO').AsString;
  if (not DataSet.FieldByName('COMMITNUMCIVICO').IsNull) and (Trim(DataSet.FieldByName('COMMITNUMCIVICO').AsString) <> '') then
    S := S + ' N. ' + DataSet.FieldByName('COMMITNUMCIVICO').AsString;
  if (not DataSet.FieldByName('COMMITSCALA').IsNull) and (Trim(DataSet.FieldByName('COMMITSCALA').AsString) <> '') then
    S := S + ' scala ' + DataSet.FieldByName('COMMITSCALA').AsString;
  if (not DataSet.FieldByName('COMMITPIANO').IsNull) and (Trim(DataSet.FieldByName('COMMITPIANO').AsString) <> '') then
    S := S + ' piano ' + DataSet.FieldByName('COMMITPIANO').AsString;
  if (not DataSet.FieldByName('COMMITINTERNO').IsNull) and (Trim(DataSet.FieldByName('COMMITINTERNO').AsString) <> '') then
    S := S + ' int. ' + DataSet.FieldByName('COMMITINTERNO').AsString;
  if (not DataSet.FieldByName('COMMITCAP').IsNull) and (Trim(DataSet.FieldByName('COMMITCAP').AsString) <> '') then
    S := S + ' - ' + DataSet.FieldByName('COMMITCAP').AsString;
  if (not DataSet.FieldByName('COMMITLOCALITA').IsNull) and (Trim(DataSet.FieldByName('COMMITLOCALITA').AsString) <> '') then
    S := S + ' ' + DataSet.FieldByName('COMMITLOCALITA').AsString;
  if (not DataSet.FieldByName('COMMITPROVINCIA').IsNull) and (Trim(DataSet.FieldByName('COMMITPROVINCIA').AsString) <> '') then
    S := S + ' (' + DataSet.FieldByName('COMMITPROVINCIA').AsString + ')';
  DataSet.FieldByName('COMMISSIONATODA').Value := LeftStr(S, COMMISSIONATODALEN);
  // Compone il campo DIPROPRIETADI utile per le stampe
  S := '';
  if (not DataSet.FieldByName('PROPDENOMINAZIONE').IsNull) and (Trim(DataSet.FieldByName('PROPDENOMINAZIONE').AsString) <> '') then
    S := S + DataSet.FieldByName('PROPDENOMINAZIONE').AsString;
  if (not DataSet.FieldByName('PROPINDIRIZZO').IsNull) and (Trim(DataSet.FieldByName('PROPINDIRIZZO').AsString) <> '') then
    S := S + ' ' + DataSet.FieldByName('PROPINDIRIZZO').AsString;
  if (not DataSet.FieldByName('PROPNUMCIVICO').IsNull) and (Trim(DataSet.FieldByName('PROPNUMCIVICO').AsString) <> '') then
    S := S + ' N. ' + DataSet.FieldByName('PROPNUMCIVICO').AsString;
  if (not DataSet.FieldByName('PROPSCALA').IsNull) and (Trim(DataSet.FieldByName('PROPSCALA').AsString) <> '') then
    S := S + ' scala ' + DataSet.FieldByName('PROPSCALA').AsString;
  if (not DataSet.FieldByName('PROPPIANO').IsNull) and (Trim(DataSet.FieldByName('PROPPIANO').AsString) <> '') then
    S := S + ' piano ' + DataSet.FieldByName('PROPPIANO').AsString;
  if (not DataSet.FieldByName('PROPINTERNO').IsNull) and (Trim(DataSet.FieldByName('PROPINTERNO').AsString) <> '') then
    S := S + ' int. ' + DataSet.FieldByName('PROPINTERNO').AsString;
  if (not DataSet.FieldByName('PROPCAP').IsNull) and (Trim(DataSet.FieldByName('PROPCAP').AsString) <> '') then
    S := S + ' - ' + DataSet.FieldByName('PROPCAP').AsString;
  if (not DataSet.FieldByName('PROPLOCALITA').IsNull) and (Trim(DataSet.FieldByName('PROPLOCALITA').AsString) <> '') then
    S := S + ' ' + DataSet.FieldByName('PROPLOCALITA').AsString;
  if (not DataSet.FieldByName('PROPPROVINCIA').IsNull) and (Trim(DataSet.FieldByName('PROPPROVINCIA').AsString) <> '') then
    S := S + ' (' + DataSet.FieldByName('PROPPROVINCIA').AsString + ')';
  DataSet.FieldByName('DIPROPRIETADI').Value := LeftStr(S, DIPROPRIETADILEN);
end;

procedure TDM1.TableStatiDocumentiBeforePost(DataSet: TDataSet);
begin
  // Marca il record come modificato
  DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
end;

procedure TDM1.TableConformitaS2QBAPPCOLLKWTOTChange(Sender: TField);
begin
  // Calcola la potenza totale dell'impianto QN
  TableConformitaS2QAQN.Value := TableConformitaS2QBAPPCOLLKWTOT.AsFloat + TableConformitaS2QBSOLOPREDKWTOT.AsFloat;
end;

procedure TDM1.TableConformitaCOMMITCODICEChange(Sender: TField);
var
  Qry: TIB_Cursor;
begin
  // Carica i dati del destinatario della richiesta prima accensione caldaia
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add('SELECT RAGIONESOCIALE, INDIRIZZO, NUMCIVICO, SCALA, PIANO, INTERNO, CITTA, CAP, PROVINCIA, TELEFONO, PARTITAIVA, CODICEFISCALE');
    Qry.SQL.Add('FROM CLIENTI');
    Qry.SQL.Add('WHERE CODICE = ' + DM1.TableConformitaCOMMITCODICE.AsString);
    Qry.Open;
    if not Qry.Eof then
    begin
      DM1.TableConformitaCOMMITDENOMINAZIONE.Value := Qry.FieldByName('RAGIONESOCIALE').AsString;
      DM1.TableConformitaCOMMITINDIRIZZO.Value := Qry.FieldByName('INDIRIZZO').AsString;
      DM1.TableConformitaCOMMITNUMCIVICO.Value := Qry.FieldByName('NUMCIVICO').AsString;
      DM1.TableConformitaCOMMITSCALA.Value := Qry.FieldByName('SCALA').AsString;
      DM1.TableConformitaCOMMITPIANO.Value := Qry.FieldByName('PIANO').AsString;
      DM1.TableConformitaCOMMITINTERNO.Value := Qry.FieldByName('INTERNO').AsString;
      DM1.TableConformitaCOMMITCAP.Value := Qry.FieldByName('CAP').AsString;
      DM1.TableConformitaCOMMITLOCALITA.Value := Qry.FieldByName('CITTA').AsString;
      DM1.TableConformitaCOMMITPROVINCIA.Value := Qry.FieldByName('PROVINCIA').AsString;
      DM1.TableConformitaCOMMITTELEFONO.Value := Qry.FieldByName('TELEFONO').AsString;
      DM1.TableConformitaCOMMITPIVA.Value := Qry.FieldByName('PARTITAIVA').AsString;
      DM1.TableConformitaCOMMITCODICEFISCALE.Value := Qry.FieldByName('CODICEFISCALE').AsString;
    end
    else
    begin
      MessageBeep(0);
      MessageDlg('CARICA DATI DESTINATARIO RICHIESTA PRIMA ACCENSIONE'#13#13'Soggetto non trovato !!!', mtError, [mbOk], 0)
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.TableConformitaPROPCODICEChange(Sender: TField);
var
  Qry: TIB_Cursor;
begin
  // Carica i dati del destinatario della richiesta prima accensione caldaia
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add('SELECT RAGIONESOCIALE, INDIRIZZO, NUMCIVICO, SCALA, PIANO, INTERNO, CITTA, CAP, PROVINCIA, TELEFONO, PARTITAIVA, CODICEFISCALE');
    Qry.SQL.Add('FROM CLIENTI');
    Qry.SQL.Add('WHERE CODICE = ' + DM1.TableConformitaPROPCODICE.AsString);
    Qry.Open;
    if not Qry.Eof then
    begin
      DM1.TableConformitaPROPDENOMINAZIONE.Value := Qry.FieldByName('RAGIONESOCIALE').AsString;
      DM1.TableConformitaPROPINDIRIZZO.Value := Qry.FieldByName('INDIRIZZO').AsString;
      DM1.TableConformitaPROPNUMCIVICO.Value := Qry.FieldByName('NUMCIVICO').AsString;
      DM1.TableConformitaPROPSCALA.Value := Qry.FieldByName('SCALA').AsString;
      DM1.TableConformitaPROPPIANO.Value := Qry.FieldByName('PIANO').AsString;
      DM1.TableConformitaPROPINTERNO.Value := Qry.FieldByName('INTERNO').AsString;
      DM1.TableConformitaPROPCAP.Value := Qry.FieldByName('CAP').AsString;
      DM1.TableConformitaPROPLOCALITA.Value := Qry.FieldByName('CITTA').AsString;
      DM1.TableConformitaPROPPROVINCIA.Value := Qry.FieldByName('PROVINCIA').AsString;
      DM1.TableConformitaPROPTELEFONO.Value := Qry.FieldByName('TELEFONO').AsString;
      DM1.TableConformitaPROPPIVA.Value := Qry.FieldByName('PARTITAIVA').AsString;
      DM1.TableConformitaPROPCODICEFISCALE.Value := Qry.FieldByName('CODICEFISCALE').AsString;
    end
    else
    begin
      MessageBeep(0);
      MessageDlg('CARICA DATI DESTINATARIO RICHIESTA PRIMA ACCENSIONE'#13#13'Soggetto non trovato !!!', mtError, [mbOk], 0)
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.TableConformitaIMMOBCODICEChange(Sender: TField);
var
  Qry: TIB_Cursor;
begin
  // Carica i dati del destinatario della richiesta prima accensione caldaia
  Qry := TIB_Cursor.Create(Self);
  Qry.DatabaseName := DM1.ArcDBFile;
  Qry.IB_Connection := DM1.DBAzienda;
  try
    Qry.SQL.Add('SELECT RAGIONESOCIALE, INDIRIZZO, NUMCIVICO, SCALA, PIANO, INTERNO, CITTA, CAP, PROVINCIA');
    Qry.SQL.Add('FROM CLIENTI');
    Qry.SQL.Add('WHERE CODICE = ' + DM1.TableConformitaIMMOBCODICE.AsString);
    Qry.Open;
    if not Qry.Eof then
    begin
      DM1.TableConformitaVIA.Value := Qry.FieldByName('INDIRIZZO').AsString;
      DM1.TableConformitaNUMERO.Value := Qry.FieldByName('NUMCIVICO').AsString;
      DM1.TableConformitaSCALA.Value := Qry.FieldByName('SCALA').AsString;
      DM1.TableConformitaPIANO.Value := Qry.FieldByName('PIANO').AsString;
      DM1.TableConformitaINTERNO.Value := Qry.FieldByName('INTERNO').AsString;
      DM1.TableConformitaCAP.Value := Qry.FieldByName('CAP').AsString;
      DM1.TableConformitaNELCOMUNEDI.Value := Qry.FieldByName('CITTA').AsString;
      DM1.TableConformitaPROVINCIA.Value := Qry.FieldByName('PROVINCIA').AsString;
    end
    else
    begin
      MessageBeep(0);
      MessageDlg('CARICA DATI DESTINATARIO RICHIESTA PRIMA ACCENSIONE'#13#13'Soggetto non trovato !!!', mtError, [mbOk], 0)
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TDM1.SetPdfPrinterAsDefault;
begin
  ChangeDefaultPrinter('Bullzip PDF Printer');
end;

procedure TDM1.RestoreDefaultPrinter;
begin
  ChangeDefaultPrinter('AL-C2600(D331F5)');
end;

procedure TDM1.SaveDefaultPrinter;
begin
  //
end;

procedure TDM1.TableConformitaCOMMITALLEGOBBLIGChange(Sender: TField);
var
  Tmp: String;
begin
  // Elimina l'eventuale dicitura tra parentesi che indica di che tipo di valore si tratta
  with Sender as TStringField do
  begin
    if IsNull then
      Exit;
    Tmp := Value;
    Tmp := RitornaTestoPrimaDi('   (', Tmp, False);
    if Tmp <> '' then
      Value := Tmp;
  end;
end;

function TDM1.GetRicarichiPerFasceDiPrezzo: Boolean;
begin
  Result := (DM1.TableProgressiviRICARICHIPERFASCEPREZZO.AsString = 'T');
end;

function TDM1.GetBCL_ConsideraSconto1: Boolean;
begin
  Result := (TableProgressiviBCL_CONSIDERA_SC1.AsString = 'T');
end;

function TDM1.GetBCL_ConsideraSconto2: Boolean;
begin
  Result := (TableProgressiviBCL_CONSIDERA_SC2.AsString = 'T');
end;

function TDM1.GetBCL_ConsideraSconto3: Boolean;
begin
  Result := (TableProgressiviBCL_CONSIDERA_SC3.AsString = 'T');
end;

function TDM1.GetFirebirdBinDir: String;
begin
  Result := GetFirebirdRootDir;
  if Result <> '' then
    Result := Result + 'BIN\';
end;

function TDM1.GetFirebirdDir: String;
begin
  Result := GetFirebirdRootDir;
end;

procedure TDM1.TableProgressiviSECONDIATTESAEMAILGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  if Sender.IsNull then
    Text := '6';
end;

procedure TDM1.TablePraticheBeforePost(DataSet: TDataSet);
begin
  // Marca il record come modificato
  DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
  // Imposta i colori di visualizzazione e lo stato della pratica:
  // - Se c'è òa data di chiusura significa che la pratica è chiusa
  // altrimenti che è aperta.
  if TablePraticheDataChiusura.IsNull then
  begin
    TablePraticheStatoDescrizione.Value := 'Aperta';
    TablePraticheStatoForeground.Value := 'clBlack';
    TablePraticheStatoBackground.Value := 'clSilver';
  end
  else
  begin
    TablePraticheStatoDescrizione.Value := 'Chiusa';
    TablePraticheStatoForeground.Value := 'clGray';
    TablePraticheStatoBackground.Value := 'clSilver';
  end;
end;

procedure TDM1.TableAliquoteIVABeforeDelete(DataSet: TDataSet);
var
  LMessage: string;
begin
  inherited;
  // Operazione non autorizzata
  if not TConfirmForm.AuthorizationRequest then
    Abort;
  // 2° conferma con raccomandazioni
  LMessage := 'A T T E N Z I O N E !!!'#13#13'L''operazione potrebbe causare problemi se l''aliquota IVA è presente in documenti emessi in precedenza.'#13#13 +
    'I documenti potrebbero non essere più accessibili.'#13#13 +
    'CONSULTARE IL SERVIZIO DI ASSISTENZA prima di proseguire.'#13#13 +
    'Se vuoi proseguire ugualmente digita "ignora le raccomandazioni", poi clicca su "Conferma".';
  if not TConfirmForm.ConfirmationRequest(Format('Elimina aliquota IVA %s, "%s"', [TableAliquoteIVACodiceIVA.AsString, TableAliquoteIVADescrizioneIVA.AsString]), LMessage, 'ignora le raccomandazioni', 800, 450) then
    Abort;
end;

procedure TDM1.TableAliquoteIVABeforePost(DataSet: TDataSet);
begin
  if (TableAliquoteIVACODICEIVA.IsNull) or (TableAliquoteIVACODICEIVA.AsInteger < 1) then
    raise Exception.Create('Codice IVA non valido.'#13#13'NB: Il codice IVA deve essere un numero maggiore di zero.');
end;

// Funzione che crea un nuovo allegato F o G relativo all'impegno specificato e ritorna l'ID
function TDM1.CreaAllegatoFG(Tipo: String; IDImpegno, IDPratApp, IDBruc, Copie: Integer; CaricaDatiPrec: Boolean): Integer;
var
  CaricaDatiPrecChr: Char;
begin
  // Verifica dati
  if Trim(Tipo) = '' then
    raise Exception.Create('Tipo di allegato non corretto o inesistente.');
  // Inizializzazione
  Result := -1;
  if CaricaDatiPrec then
    CaricaDatiPrecChr := 'T'
  else
    CaricaDatiPrecChr := 'F';
  // IMposta i parametri per l'esecuzione della stored procedure
  if DM1.SP_CreaNuovoAllegatoFG.Active then
    DM1.SP_CreaNuovoAllegatoFG.Close;
  if not DM1.SP_CreaNuovoAllegatoFG.Prepared then
    DM1.SP_CreaNuovoAllegatoFG.Prepare;
  DM1.SP_CreaNuovoAllegatoFG.Params.ParamByName('IN_TIPOALLEGATO').AsString := Tipo;
  DM1.SP_CreaNuovoAllegatoFG.Params.ParamByName('IN_IDIMPEGNO').AsInteger := IDImpegno;
  DM1.SP_CreaNuovoAllegatoFG.Params.ParamByName('IN_IDPRATAPP').AsInteger := IDPratApp;
  DM1.SP_CreaNuovoAllegatoFG.Params.ParamByName('IN_COPIADATIPREC').AsString := CaricaDatiPrecChr;
  DM1.SP_CreaNuovoAllegatoFG.Params.ParamByName('IN_COPIE').AsInteger := Copie;
  if IDBruc > 0 then
    DM1.SP_CreaNuovoAllegatoFG.Params.ParamByName('IN_BRUCID').AsInteger := IDBruc
  else
    DM1.SP_CreaNuovoAllegatoFG.Params.ParamByName('IN_BRUCID').Clear;
  // Esegue la stored procedure
  DM1.SP_CreaNuovoAllegatoFG.ExecProc;
  // Legge il risultato
  Result := DM1.SP_CreaNuovoAllegatoFG.Params.ParamByName('OUT_IDNUOVOALLEGATO').AsInteger;
end;

procedure TDM1.DBAziendaBeforeDisconnect(Sender: TIB_Connection);
begin
  if Assigned(ThreadLevante) then
  begin
    ThreadLevante.Terminate;
    Application.ProcessMessages;
    ThreadLevante := nil;
  end;
end;

procedure TDM1.DBAziendaAfterConnect(Sender: TIB_Connection);
begin
  // Sistituisce l'evento "onError" che normalmente intercetta eventuali problemi
  // accorsi durante la connessione al database, una volta che la connessione
  // è avvenuta con successo l'evento viene sostituito con un altro adatto a gestire
  // la situazione durante il normale funzionamento dell'applicazione
  (Sender as TIBODatabase).OnError := DBAziendaError;

  // Crea e avvia il Thread di Levante
  // NB: Solo se non siamo ne in ristrutturazione e ne in MiniLevante
  if ThreadLevEnabled and (not ModoRistrutturazioneArchivi) and (not MainForm.IsLevanteLight) then
  begin
    ThreadLevante := LevThread.Create;
    ThreadLevante.Resume;
  end;
end;

function TDM1.GetFastSelectionMode: Boolean;
begin
  Result := TableProgressivi2FAST_SELECTION_MODE.AsBoolean;
end;

procedure TDM1.TimerTransactionStatusTimer(Sender: TObject);
begin
  if DBAzienda.InTransaction then
    MainForm.LabelStatus.Caption := 'In transaction'
  else
    MainForm.LabelStatus.Caption := '- - -';
end;

procedure TDM1.TableProgressivi2AfterOpen(DataSet: TDataSet);
begin
  Google_CaricaParametri;
end;

// Procedure che aggiorna alcuni flag di Google Apps
procedure TDM1.Google_CaricaParametri;
begin
  GoogleTasks_Enabled := (TableProgressivi2GOOGLE_TASKS_ENABLED.AsString = 'T');
  GoogleCalendar_Enabled := (TableProgressivi2GOOGLE_CALENDAR_ENABLED.AsString = 'T');
end;

procedure TDM1.TableProgressivi2AfterPost(DataSet: TDataSet);
begin
  Google_CaricaParametri;
end;

end.
