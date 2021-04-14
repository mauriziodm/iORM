unit FormTabComunicazioni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPerTabPageControlPrincipale, dxPSGlbl, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxEdit, DB, cxDBData,
  cxImageComboBox, cxTextEdit, cxCheckBox, cxCalendar, cxCurrencyEdit,
  cxMemo, cxCheckComboBox, cxGridLevel, cxGridDBTableView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, Buttons, MAURI_SB, ExtCtrls, cxPC, cxContainer, cxMaskEdit,
  cxDropDownEdit, Mask, IBODataset, IB_Components, CheckLst, Menus,
  dxPSUtl, dxBkgnd, dxWrap, dxPrnDev,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore,
  dxPScxCommon, cxData, cxDataStorage, dxPSEngn, dxPrnPg,
  dxPSCompsProvider, cxPCdxBarPopupMenu, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxSchedulerLnk, dxPScxPivotGridLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations;

const
  COLORE_PRIMOPIANO = clBlack;
  COLORE_SECONDOPIANO  = $00525252;

type                                      
  TTabComunicazioniForm = class(TModelPerTabPageControlPrincipaleForm)
    PageControl: TcxPageControl;
    TabElenco: TcxTabSheet;
    PanelAssistenze: TPanel;
    PanelFiltri: TPanel;
    SubPanelFiltri: TPanel;
    SBFilterOpenClose: TSpeedButtonRollOver;
    LabelComCount: TLabel;
    StaticText75: TStaticText;
    FilterTrova: TEdit;
    Panel18: TPanel;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SBFilterRow_Old: TSpeedButton;
    GroupBox1: TGroupBox;
    PanelSelezioneColonne: TPanel;
    SubPanelSelezioneColonne: TPanel;
    TabComAuto: TcxTabSheet;
    Label47: TLabel;
    Label48: TLabel;
    AssOtt: TSpeedButton;
    AssNov: TSpeedButton;
    AssDic: TSpeedButton;
    AssAgo: TSpeedButton;
    AssLug: TSpeedButton;
    AssGiu: TSpeedButton;
    AssMag: TSpeedButton;
    AssGen: TSpeedButton;
    AssFeb: TSpeedButton;
    AssMar: TSpeedButton;
    AssApr: TSpeedButton;
    AssMesiTutti: TSpeedButton;
    AssMesiNessuno: TSpeedButton;
    AssSet: TSpeedButton;
    AssSaveDateFilter: TSpeedButton;
    StaticText23: TStaticText;
    FilterTipoData: TcxComboBox;
    Label2: TLabel;
    Shape1: TShape;
    SbGcVisMem1: TSpeedButton;
    SbGcVisMem4: TSpeedButton;
    SbGcVisMem2: TSpeedButton;
    SbGcVisMem5: TSpeedButton;
    SbGcVisMem3: TSpeedButton;
    SbGcVisMemAdd: TSpeedButton;
    Label3: TLabel;
    SbGcVisMem6: TSpeedButton;
    SbGcVisMem7: TSpeedButton;
    SbGcVisMem8: TSpeedButton;
    SbGcVisMem9: TSpeedButton;
    SbGcVisMem10: TSpeedButton;
    SbGcVisMemSetPredef: TSpeedButton;
    PanelList: TPanel;
    GridComAuto: TcxGrid;
    btvComAuto: TcxGridDBBandedTableView;
    btvComAutoMSG_AMEZZO: TcxGridDBBandedColumn;
    btvComAutoMSG_OGGETTO: TcxGridDBBandedColumn;
    btvComAutoCOMPUTED_INDIRIZZOFULL: TcxGridDBBandedColumn;
    btvComAutoCOMPUTED_MANCAINDIRIZZO: TcxGridDBBandedColumn;
    btvComAutoRIF_DATO: TcxGridDBBandedColumn;
    btvComAutoRIF_DESCRIZIONE: TcxGridDBBandedColumn;
    btvComAutoSOGG_RAGSOC: TcxGridDBBandedColumn;
    btvComAutoPRAT_DESCRIZIONE: TcxGridDBBandedColumn;
    btvComAutoID: TcxGridDBBandedColumn;
    btvComAutoPRAT_CODICE: TcxGridDBBandedColumn;
    btvComAutoPRAT_DATA: TcxGridDBBandedColumn;
    btvComAutoRIF_DATAORASCADENZA: TcxGridDBBandedColumn;
    btvComAutoRIF_TIMEOFFSET_DAYS: TcxGridDBBandedColumn;
    btvComAutoRIF_ID: TcxGridDBBandedColumn;
    btvComAutoRIF_TIME_THRESHOLD: TcxGridDBBandedColumn;
    btvComAutoRIF_TIPO: TcxGridDBBandedColumn;
    btvComAutoMSG_TYPE_LETTER: TcxGridDBBandedColumn;
    btvComAutoMSG_TYPE_EMAIL: TcxGridDBBandedColumn;
    btvComAutoMSG_TYPE_SMS: TcxGridDBBandedColumn;
    btvComAutoSOGG_INDIRIZZO: TcxGridDBBandedColumn;
    btvComAutoSOGG_CODICE: TcxGridDBBandedColumn;
    btvComAutoSOGG_NUMCIVICO: TcxGridDBBandedColumn;
    btvComAutoSOGG_COMUNE: TcxGridDBBandedColumn;
    btvComAutoSOGG_PROVINCIA: TcxGridDBBandedColumn;
    btvComAutoSOGG_CAP: TcxGridDBBandedColumn;
    btvComAutoSOGG_CELLULARE: TcxGridDBBandedColumn;
    btvComAutoSOGG_EMAIL: TcxGridDBBandedColumn;
    btvComAutoSOGG_COM_SMS: TcxGridDBBandedColumn;
    btvComAutoSOGG_COM_EMAIL: TcxGridDBBandedColumn;
    btvComAutoSOGG_COM_LETTERA: TcxGridDBBandedColumn;
    btvComAutoPRAT_ID: TcxGridDBBandedColumn;
    btvComAutoPRAT_COM_SMS: TcxGridDBBandedColumn;
    btvComAutoPRAT_COM_EMAIL: TcxGridDBBandedColumn;
    btvComAutoPRAT_COM_LETTERA: TcxGridDBBandedColumn;
    btvComAutoSOGG_INQUALITADI: TcxGridDBBandedColumn;
    lvLComAuto: TcxGridLevel;
    PanelFiltriComAuto: TPanel;
    SubPanelFiltriComAuto: TPanel;
    sbEsportaRigheSelezionate: TSpeedButtonRollOver;
    sbEsportaTutto: TSpeedButtonRollOver;
    PanelSelezioneColonneComAuto: TPanel;
    SubPanelSelezioneColonneComAuto: TPanel;
    Label1: TLabel;
    Shape2: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label4: TLabel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    QryComAuto: TIBOQuery;
    QryComAutoID: TIntegerField;
    QryComAutoRIF_ID: TIntegerField;
    QryComAutoRIF_TIPO: TStringField;
    QryComAutoRIF_DATO: TStringField;
    QryComAutoRIF_TIMEOFFSET_DAYS: TIntegerField;
    QryComAutoRIF_DATAORASCADENZA: TDateTimeField;
    QryComAutoRIF_TIME_THRESHOLD: TDateTimeField;
    QryComAutoRIF_DESCRIZIONE: TStringField;
    QryComAutoMSG_TYPE_LETTER: TStringField;
    QryComAutoMSG_TYPE_EMAIL: TStringField;
    QryComAutoMSG_TYPE_SMS: TStringField;
    QryComAutoMSG_OGGETTO: TStringField;
    QryComAutoSOGG_CODICE: TIntegerField;
    QryComAutoSOGG_RAGSOC: TStringField;
    QryComAutoSOGG_INDIRIZZO: TStringField;
    QryComAutoSOGG_NUMCIVICO: TStringField;
    QryComAutoSOGG_COMUNE: TStringField;
    QryComAutoSOGG_PROVINCIA: TStringField;
    QryComAutoSOGG_CAP: TStringField;
    QryComAutoSOGG_CELLULARE: TStringField;
    QryComAutoSOGG_EMAIL: TStringField;
    QryComAutoSOGG_INQUALITADI: TStringField;
    QryComAutoSOGG_COM_SMS: TStringField;
    QryComAutoSOGG_COM_EMAIL: TStringField;
    QryComAutoSOGG_COM_LETTERA: TStringField;
    QryComAutoPRAT_CODICE: TIntegerField;
    QryComAutoPRAT_DATA: TDateTimeField;
    QryComAutoPRAT_ID: TIntegerField;
    QryComAutoPRAT_DESCRIZIONE: TStringField;
    QryComAutoPRAT_COM_SMS: TStringField;
    QryComAutoPRAT_COM_EMAIL: TStringField;
    QryComAutoPRAT_COM_LETTERA: TStringField;
    QryComAutoMSG_AMEZZO: TStringField;
    QryComAutoCOMPUTED_INDIRIZZOFULL: TStringField;
    QryComAutoCOMPUTED_MANCAINDIRIZZO: TBooleanField;
    SourceComAuto: TDataSource;
    LabelComAutoCount: TLabel;
    QryCom: TIBOQuery;
    SourceCom: TDataSource;
    QryComID: TIntegerField;
    QryComRIF_ID: TIntegerField;
    QryComRIF_TIPO: TStringField;
    QryComRIF_RIFERIMENTO: TStringField;
    QryComID_SOURCE: TIntegerField;
    QryComID_SOGGETTO: TIntegerField;
    QryComRIF_SOGGETTO_FULL: TStringField;
    QryComDEST_RAGSOC: TStringField;
    QryComDEST_INDIRIZZO: TStringField;
    QryComDEST_NUMCIVICO: TStringField;
    QryComDEST_COMUNE: TStringField;
    QryComDEST_PROVINCIA: TStringField;
    QryComDEST_CAP: TStringField;
    QryComDEST_EMAIL: TStringField;
    QryComDEST_CELLULARE: TStringField;
    QryComID_PRATICA: TIntegerField;
    QryComPRATICA: TIntegerField;
    QryComDATAPRATICA1: TDateTimeField;
    QryComRIF_PRATICA_FULL: TStringField;
    QryComDATA: TDateTimeField;
    QryComMSG_TYPE: TStringField;
    QryComMSG_OGGETTO: TStringField;
    QryComDATAULTMOD_CREAZIONE: TDateTimeField;
    QryComDATAULTMOD_GENERALE: TDateTimeField;
    QryComNUMEROINVII: TIntegerField;
    QryComPRIMOINVIO_DATAORA: TDateTimeField;
    QryComULTIMOINVIO_DATAORA: TDateTimeField;
    QryComCOMPUTED_INDIRIZZOFULL: TStringField;
    GridCom: TcxGrid;
    btvCom: TcxGridDBBandedTableView;
    btvComMSG_TYPE: TcxGridDBBandedColumn;
    btvComMSG_OGGETTO: TcxGridDBBandedColumn;
    btvComCOMPUTED_INDIRIZZOFULL: TcxGridDBBandedColumn;
    btvComRIF_RIFERIMENTO: TcxGridDBBandedColumn;
    btvComRIF_SOGGETTO_FULL: TcxGridDBBandedColumn;
    btvComRIF_PRATICA_FULL: TcxGridDBBandedColumn;
    lvCom: TcxGridLevel;
    btvComID: TcxGridDBBandedColumn;
    btvComRIF_ID: TcxGridDBBandedColumn;
    btvComRIF_TIPO: TcxGridDBBandedColumn;
    btvComID_SOURCE: TcxGridDBBandedColumn;
    btvComID_SOGGETTO: TcxGridDBBandedColumn;
    btvComDEST_RAGSOC: TcxGridDBBandedColumn;
    btvComDEST_INDIRIZZO: TcxGridDBBandedColumn;
    btvComDEST_NUMCIVICO: TcxGridDBBandedColumn;
    btvComDEST_COMUNE: TcxGridDBBandedColumn;
    btvComDEST_PROVINCIA: TcxGridDBBandedColumn;
    btvComDEST_CAP: TcxGridDBBandedColumn;
    btvComDEST_EMAIL: TcxGridDBBandedColumn;
    btvComDEST_CELLULARE: TcxGridDBBandedColumn;
    btvComID_PRATICA: TcxGridDBBandedColumn;
    btvComPRATICA: TcxGridDBBandedColumn;
    btvComDATAPRATICA1: TcxGridDBBandedColumn;
    btvComDATA: TcxGridDBBandedColumn;
    btvComDATAULTMOD_CREAZIONE: TcxGridDBBandedColumn;
    btvComDATAULTMOD_GENERALE: TcxGridDBBandedColumn;
    btvComNUMEROINVII: TcxGridDBBandedColumn;
    btvComPRIMOINVIO_DATAORA: TcxGridDBBandedColumn;
    btvComULTIMOINVIO_DATAORA: TcxGridDBBandedColumn;
    QryComCOMPUTED_NUMEROINVIIFULL: TStringField;
    btvComCOMPUTED_NUMEROINVIIFULL: TcxGridDBBandedColumn;
    QryComCOMPUTED_MANCAINDIRIZZO: TBooleanField;
    btvComCOMPUTED_MANCAINDIRIZZO: TcxGridDBBandedColumn;
    QryComCOMPUTED_ALERT: TBooleanField;
    btvComCOMPUTED_ALERT: TcxGridDBBandedColumn;
    QrySto: TIBOQuery;
    SourceSto: TDataSource;
    QryStoID: TIntegerField;
    QryStoID_MSG: TIntegerField;
    QryStoDATAORAINVIO: TDateTimeField;
    QryStoDESTINAZIONE: TStringField;
    QryStoOPERATORE: TStringField;
    lvSto: TcxGridLevel;
    btvSto: TcxGridDBBandedTableView;
    btvStoID: TcxGridDBBandedColumn;
    btvStoID_MSG: TcxGridDBBandedColumn;
    btvStoDATAORAINVIO: TcxGridDBBandedColumn;
    btvStoDESTINAZIONE: TcxGridDBBandedColumn;
    btvStoOPERATORE: TcxGridDBBandedColumn;
    TransCom: TIB_Transaction;
    StaticText20: TStaticText;
    FilterTipo: TCheckListBox;
    StaticText36: TStaticText;
    FilterOggetto: TEdit;
    TimerAddMemoryGC: TTimer;
    MenuAggiungi: TPopupMenu;
    sms1: TMenuItem;
    email1: TMenuItem;
    lettera1: TMenuItem;
    Shape4: TShape;
    Label5: TLabel;
    LabelSmsCreditoResiduoCom: TLabel;
    Image2: TImage;
    SpeedButton14: TSpeedButton;
    Shape5: TShape;
    Label7: TLabel;
    LabelSmsCreditoResiduoComAuto: TLabel;
    Image1: TImage;
    SpeedButton13: TSpeedButton;
    Shape3: TShape;
    Shape6: TShape;
    TimerSmsCreditExpired: TTimer;
    dxPrinter: TdxComponentPrinter;
    GridComLink: TdxGridReportLink;
    Panel1: TPanel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SBFilterRow: TSpeedButton;
    AssDal: TcxDateEdit;
    AssAl: TcxDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure AssMesiNessunoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PanelSelezioneColonneResize(Sender: TObject);
    procedure QryComAutoCalcFields(DataSet: TDataSet);
    procedure btvComAutoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvComAutoCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvComAutoMSG_AMEZZOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvComAutoCOMPUTED_MANCAINDIRIZZOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvComAutoRIF_DATOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvComAutoSOGG_RAGSOCCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btvComAutoDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure btvComAutoDblClick(Sender: TObject);
    procedure QryComCalcFields(DataSet: TDataSet);
    procedure btvComDATAULTMOD_CREAZIONEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvComPRIMOINVIO_DATAORAGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvComCOMPUTED_NUMEROINVIIFULLGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvComCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btvComRIF_RIFERIMENTOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvComDataControllerDetailCollapsed(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure btvComDataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure btvStoDataControllerDataModeControllerDetailFirst(
      Sender: TcxDBDataModeController; ADataSet: TDataSet;
      const AMasterDetailKeyFieldNames: String;
      const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
    procedure btvStoDATAORAINVIOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure btvComDblClick(Sender: TObject);
    procedure SBFilterOpenCloseClick(Sender: TObject);
    procedure AssMesiTuttiClick(Sender: TObject);
    procedure AssSaveDateFilterClick(Sender: TObject);
    procedure AssMesiTuttiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AssMesiNessunoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AssGenClick(Sender: TObject);
    procedure AssGenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterTrovaKeyPress(Sender: TObject; var Key: Char);
    procedure FilterTipoClickCheck(Sender: TObject);
    procedure FilterTipoExit(Sender: TObject);
    procedure FilterTipoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure btvComCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure btvComDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure SbGcVisMem1Click(Sender: TObject);
    procedure SbGcVisMem1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerAddMemoryGCTimer(Sender: TObject);
    procedure SbGcVisMemAddClick(Sender: TObject);
    procedure SbGcVisMemSetPredefClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure sms1Click(Sender: TObject);
    procedure email1Click(Sender: TObject);
    procedure lettera1Click(Sender: TObject);
    procedure sbEsportaRigheSelezionateClick(Sender: TObject);
    procedure sbEsportaTuttoClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure TimerSmsCreditExpiredTimer(Sender: TObject);
    procedure dxPrinterCustomDrawPageFooter(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean);
    procedure dxPrinterCustomDrawPageHeader(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas;
      APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
      var ADefaultDrawText, ADefaultDrawBackground: Boolean);
    procedure GridComLinkCustomDrawBandCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxGridBandedTableView; ABand: TcxGridBand;
      AnItem: TdxReportCellString; var ADone: Boolean);
    procedure GridComLinkCustomDrawHeaderCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxGridTableView; AColumn: TcxGridColumn;
      AnItem: TdxReportCellString; var ADone: Boolean);
    procedure GridComLinkCustomDrawCell(Sender: TdxGridReportLink;
      ACanvas: TCanvas; AView: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AColumn: TcxGridColumn;
      AnItem: TAbstractdxReportCellData; var ADone: Boolean);
    procedure SBFilterRowClick(Sender: TObject);
    procedure btvComKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure CustomDraw_DrawCellBorder(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
    procedure CustomDraw_GetCellBackgroundColor(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo);
    procedure CustomDraw_GetCellFont(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
    procedure CreaNuovaComunicazione(SourceID:Integer; MsgType:String; SoggettoID, PraticaID, RifID:Integer; RifDato:String; Silent:Boolean=False);
    procedure CreaNuovaComunicazioneFromGrid(RI:Integer; Silent:Boolean=False);
    function GetGroupTitle(AViewInfo: TcxGridTableCellViewInfo): String;
    procedure StartSalvaVistaNelleMemorie;
    procedure StopSalvaVistaNelleMemorie;
    procedure InviaTutteLeComunicazioniAutomaticheSelezionate;
    function GetPrintFooterTitle(ARecord:TcxCustomGridRecord; InitialLevelIndex:Integer; SaltaUltimoLivello:Boolean=False): String;
    function GetGroupTextStyle(ALevel: Integer): TFontStyles;
    function ComponiTestoCreazioneUltMod(DataOraCreazione,
      DataOraUltMod: Variant): String;
    function ComponiTestoInvii(NumInvii:Integer; DataPrimo, DataUltimo: Variant): String;
    { Private declarations }
  public
    { Public declarations }


    procedure EseguiQueryCom;
    procedure EseguiQueryComAuto;
    procedure TrovaButtonClick(Sender: TObject); override;
    procedure EliminaButtonClick(Sender: TObject); override;
    procedure ResetQueryButtonClick(Sender: TObject); override;
    procedure VisualizzaButtonClick(Sender: TObject); override;
  end;

var
  TabComunicazioniForm: TTabComunicazioniForm;

implementation

uses DataModule2, StrUtils, DataModule1, SchedaClienti, DataModuleStyles,
  FormComunicazione, main, DateUtils, FormComRapportoFinale, FormConfirm;

{$R *.dfm}







procedure TTabComunicazioniForm.EseguiQueryComAuto;
begin
  // Creazione query di ricerca
  QryComAuto.Close;
  QryComAuto.SQL.Clear;
  QryComAuto.SQL.Add('SELECT * FROM COM_LIST_PROC');
  // Apre la query
  QryComAuto.Open;
  // Aggiorna il contatore delle comunicazioni automatiche
  MainForm.ComAuto_Count := btvComAuto.DataController.RecordCount;
  // Si posizione all'inizio
  btvComAuto.DataController.GotoFirst;
end;


procedure TTabComunicazioniForm.EseguiQueryCom;
begin

  // Se i check di alcuni gruppi di filtri sono tutti NON CHECCKATI li checcka automaticamente tutti
  //  perchè altrimenti non visualizzerebbe nulla
  if not (FilterTipo.Checked[0] or FilterTipo.Checked[1] or FilterTipo.Checked[2]) then begin
    FilterTipo.Checked[0] := True;
    FilterTipo.Checked[1] := True;
    FilterTipo.Checked[2] := True;
  end;


  // Creazione query di ricerca
  QryCom.Close;
  QryCom.SQL.Clear;
  QryCom.SQL.Add('SELECT CE.* FROM COM_ELENCO_VIEW CE');
  QryCom.SQL.Add('WHERE');
  QryCom.SQL.Add('1=1');

  // ===========================================================================
  // INIZIO: FILTRI
  // ---------------------------------------------------------------------------
  // Se c'è una pratica selezionata...
  if ClientiForm.ID_PraticaCorrente <> 0 then begin
     QryCom.SQl.Add('AND CE.ID_PRATICA = ' + IntToStr(ClientiForm.ID_PraticaCorrente));
     // Oppure se c'è un soggetto selezionato....
  end else if ClientiForm.ClienteCorrente <> '' then begin
     if ClientiForm.ID_ClienteCorrente <> 0 then QryCom.SQl.Add('AND CE.ID_SOGGETTO = ' + IntToStr(ClientiForm.ID_ClienteCorrente));
  end;

  // Filtro per oggetto
  if FilterOggetto.Text <> '' then DM1.AggiungiRicercaCampo(QryCom.SQL, 'CE.MSG_OGGETTO', FilterOggetto.Text, True);

  // In base al timp di messaggio
  if not FilterTipo.Checked[0] then QryCom.SQL.Add('AND CE.MSG_TYPE <> '  + QuotedStr('lettera'));
  if not FilterTipo.Checked[1] then QryCom.SQL.Add('AND CE.MSG_TYPE <> '  + QuotedStr('e-mail'));
  if not FilterTipo.Checked[2] then QryCom.SQL.Add('AND CE.MSG_TYPE <> '  + QuotedStr('sms'));

  // RIcerche per data
  // -----------------
  // Data di creazione
  if FilterTipoData.Text = 'Creazione' then begin
    if DM1.ControllaDataStr(AssDal.EditText) then begin
       QryCom.SQL.Add('AND CE.DATAULTMOD_CREAZIONE >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))));
    end;
    if DM1.ControllaDataStr(AssAl.EditText)  then begin
       //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
       //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
       //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
       QryCom.SQL.Add('AND CE.DATAULTMOD_CREAZIONE < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText)+1)));
    end;
  // Data di invio
  end else if FilterTipoData.Text = 'Invio' then begin
    // Date (Controllo sulla data dell'ultimo intervento eseguito
    if DM1.ControllaDataStr(AssDal.EditText) then begin
       QryCom.SQL.Add('AND EXISTS (SELECT STO.ID FROM COM_STORICO STO WHERE STO.ID_MSG = CE.ID AND STO.DATAORAINVIO >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))) + ')');
    end;
    if DM1.ControllaDataStr(AssAl.EditText)  then begin
       //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
       //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
       //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
       QryCom.SQL.Add('AND EXISTS (SELECT STO.ID FROM COM_STORICO STO WHERE STO.ID_MSG = CE.ID AND STO.DATAORAINVIO < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText))) + ')');
    end;
  // Data ultima modifica
  end else if FilterTipoData.Text = 'Ultima modifica' then begin
    if DM1.ControllaDataStr(AssDal.EditText) then begin
       QryCom.SQL.Add('AND CE.DATAULTMOD_GENERALE >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.EditText))));
    end;
    if DM1.ControllaDataStr(AssAl.EditText)  then begin
       //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
       //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
       //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
       QryCom.SQL.Add('AND CE.DATAULTMOD_GENERALE < ' + QuotedStr(FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.EditText)+1)));
    end;
  end;
  // -----------------

  // Aggiunge la ricerca con campo TROVA
  if Trim(FilterTrova.Text) <> '' then begin
    DM1.AddSQL(QryCom, 'AND', '(');
    DM1.AggiungiRicercaCampo(QryCom.SQL, 'CE.MSG_OGGETTO', FilterTrova.Text, False);
    QryCom.SQL.Add('OR');
    DM1.AggiungiRicercaCampo(QryCom.SQL, 'CE.RIF_RIFERIMENTO', FilterTrova.Text, False);
    QryCom.SQL.Add('OR');
    DM1.AggiungiRicercaCampo(QryCom.SQL, 'CE.RIF_SOGGETTO_FULL', FilterTrova.Text, False);
    QryCom.SQL.Add('OR');
    DM1.AggiungiRicercaCampo(QryCom.SQL, 'CE.RIF_PRATICA_FULL', FilterTrova.Text, False);
    QryCom.SQL.Add(')');
  end;

  // ---------------------------------------------------------------------------
  // FINE: FILTRI
  // ===========================================================================


  // Apre la query
  QryCom.Open;
  // Si posizione all'inizio
  btvCom.DataController.GotoFirst;
end;


procedure TTabComunicazioniForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  TabComunicazioniForm := nil;
end;

procedure TTabComunicazioniForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  PageControl.Align := alClient;
  CloseFilterPanel(PanelFiltri, SBFilterOpenClose, False);
  AssMesiNessunoClick(AssMesiNessuno);
end;

procedure TTabComunicazioniForm.AssMesiNessunoClick(Sender: TObject);
begin
  inherited;
   AssDal.Clear;
   AssAl.Clear;
   // In questo modo posso metterli tutti in DOWN contemporaneamente
   AssGen.GroupIndex := 600;
   AssFeb.GroupIndex := 600;
   AssMar.GroupIndex := 600;
   AssApr.GroupIndex := 600;
   AssMag.GroupIndex := 600;
   AssGiu.GroupIndex := 600;
   AssLug.GroupIndex := 600;
   AssAgo.GroupIndex := 600;
   AssSet.GroupIndex := 600;
   AssOtt.GroupIndex := 600;
   AssNov.GroupIndex := 600;
   AssDic.GroupIndex := 600;
   AssGen.Down   := False;
   AssFeb.Down   := False;
   AssMar.Down   := False;
   AssApr.Down   := False;
   AssMag.Down   := False;
   AssGiu.Down   := False;
   AssLug.Down   := False;
   AssAgo.Down   := False;
   AssSet.Down   := False;
   AssOtt.Down   := False;
   AssNov.Down   := False;
   AssDic.Down   := False;
end;

procedure TTabComunicazioniForm.FormShow(Sender: TObject);
var
  CurrMemoryButton: TSpeedButton;
begin
  inherited;
  // Carica il layout della form
//  CaricaFormLayout;
  // Carica la memoria predefinita e la seleziona come default iniziale
  DM2.CaricaTitoliMemorie('MEMORIECOMUNICAZIONI.INI', SbGcVisMem1, SbGcVisMem2, SbGcVisMem3, SbGcVisMem4, SbGcVisMem5, SbGcVisMem6, SbGcVisMem7, SbGcVisMem8, SbGcVisMem9, SbGcVisMem10);
  CurrMemoryButton := DM2.MemPredef_LoadSelection('MEMORIE_COMUNICAZIONI', SbGcVisMem1, SbGcVisMem2, SbGcVisMem3, SbGcVisMem4, SbGcVisMem5, SbGcVisMem6, SbGcVisMem7, SbGcVisMem8, SbGcVisMem9, SbGcVisMem10);
  if Assigned(CurrMemoryButton) then DM2.RichiamaMemoria(GridCom, btvCom, CurrMemoryButton, QryCom, False);  // NB: L'ultimo parametro = False altrimenti eseguirebbe due volte l'interrogazione alla creazione della form
  // Imposta visibile la prima pagina
  PageControl.ActivePage := TabElenco;
//  PageControlChange(PageControl);  // IN questo caso non ce n'è bisogno
end;

procedure TTabComunicazioniForm.PanelSelezioneColonneResize(
  Sender: TObject);
begin
  inherited;
  CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TTabComunicazioniForm.QryComAutoCalcFields(DataSet: TDataSet);
var
  TmpStr, TmpStr2, Spazio: String;
begin
  inherited;

  // ===========================================================================
  // Compone l'indirizzo completo di invio in base al tipo di messaggio
  // ---------------------------------------------------------------------------
  if          QryComAutoMSG_AMEZZO.AsString = 'lettera' then begin
    // Comune
    TmpStr := Trim(QryComAutoSOGG_COMUNE.AsString);
    // Provincia
    TmpStr2:= Trim(QryComAutoSOGG_PROVINCIA.AsString);
    if (TmpStr='') or (TmpStr2='') then Spazio := '' else Spazio := ' ';
    if (TmpStr2<>'') then TmpStr := TmpStr + Spazio + '(' + TmpStr2 + ')';
    // Indirizzo
    TmpStr2 := Trim(QryComAutoSOGG_INDIRIZZO.AsString);
    if (TmpStr='') or (TmpStr2='') then Spazio := '' else Spazio := ' - ';
    TmpStr := TmpStr + Spazio + TmpStr2;
    // Numero civico
    TmpStr2 := Trim(QryComAutoSOGG_NUMCIVICO.AsString);
    if (TmpStr='') or (TmpStr2='') then Spazio := '' else Spazio := ' ';
    TmpStr := TmpStr + Spazio + TmpStr2;
    // CAP
    TmpStr2 := Trim(QryComAutoSOGG_CAP.AsString);
    if (TmpStr='') or (TmpStr2='') then Spazio := '' else Spazio := ' - ';
    TmpStr := TmpStr + Spazio + TmpStr2;
    // Assegnazione
    QryComAutoCOMPUTED_INDIRIZZOFULL.Value := TmpStr;
    // Se manda il dato...
    if QryComAutoCOMPUTED_INDIRIZZOFULL.Value = '' then QryComAutoCOMPUTED_INDIRIZZOFULL.Value := 'Manca l''indirizzo';

  end else if QryComAutoMSG_AMEZZO.AsString = 'e-mail' then begin
    QryComAutoCOMPUTED_INDIRIZZOFULL.Value := Trim(QryComAutoSOGG_EMAIL.AsString);
    if QryComAutoCOMPUTED_INDIRIZZOFULL.Value = '' then QryComAutoCOMPUTED_INDIRIZZOFULL.Value := 'Manca l''indirizzo e-mail';

  end else if QryComAutoMSG_AMEZZO.AsString = 'sms' then begin
    QryComAutoCOMPUTED_INDIRIZZOFULL.Value := Trim(QryComAutoSOGG_CELLULARE.AsString);
    if QryComAutoCOMPUTED_INDIRIZZOFULL.Value = '' then QryComAutoCOMPUTED_INDIRIZZOFULL.Value := 'Manca il numero di cellulare';

  end;
  // ===========================================================================

  // Calcola il campo che idnica la mancanza dell'indirizzo, dell'e-mail, del numero di cellulcare (sms)
  QryComAutoCOMPUTED_MANCAINDIRIZZO.Value := (LeftStr(QryComAutoCOMPUTED_INDIRIZZOFULL.AsString,5) = 'Manca');

end;

procedure TTabComunicazioniForm.TrovaButtonClick(Sender: TObject);
begin
  inherited;
  // Se siamo nella pagine dell'elenco...
  if PageControl.ActivePage = TabElenco then begin
    DM1.ShowWait('Levante', 'Caricamento...');
    try
      EseguiQueryCom;
    finally
      DM1.CloseWait;
    end;
  // Se invece siamo nella pagina delle comunicazioni automatiche...
  end else if PageControl.ActivePage = TabComAuto then begin
    DM1.ShowWait('Levante', 'Caricamento...');
    try
      EseguiQueryComAuto;
    finally
      DM1.CloseWait;
    end;
  end;
end;

procedure TTabComunicazioniForm.btvComAutoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  CurrColumn: TcxGridDBBandedColumn;
begin
  inherited;
  // Custom Draw
  ADone := True;
  // Inizializzazione
  CurrColumn := AViewInfo.Item as TcxGridDBBandedColumn;
  // Determina il Font (compreso il colore) da utilizzare in base alla situazione
  CustomDraw_GetCellFont(Sender, ACanvas, AViewInfo);
  // Determina il colore di sfondo
  CustomDraw_GetCellBackgroundColor(Sender, ACanvas, AViewInfo);
  // Disegna il contenuto della cella in modo standard
  AviewInfo.EditViewInfo.Font             := ACanvas.Font;
  AviewInfo.EditViewInfo.TextColor        := ACanvas.Font.Color;
  AviewInfo.EditViewInfo.BackgroundColor  := ACanvas.Brush.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Procedure che disegna i bordi delle celle
  CustomDraw_DrawCellBorder(Sender, ACanvas, AViewInfo);
end;


// Funzione che ritorna il colore da usare come sfondo della cella in base alla situazione
procedure TTabComunicazioniForm.CustomDraw_GetCellBackgroundColor(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
begin
  // Se la riga è espansa la visualizza con il colore di sfondo opportuno
  if AviewInfo.GridRecord.Expanded then begin
    ACanvas.Brush.Color := lvCom.Styles.TabsBackground.Color;
    Exit;
  end;
  // Se il rigo del filtro (FilterRow) usa il colore specificato appositamente
  //  in ogni caso, anche se è il rigo selezionato che mi piace di più
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then begin
    ACanvas.Brush.Color := btvComAuto.Styles.FilterRowInfoText.Color;
    Exit;
  end;
end;


// Funzione che ritorna il Font (Anche il colore) della cella da disegnare
procedure TTabComunicazioniForm.CustomDraw_GetCellFont(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
var
  CurrColumn: TcxGridDBBandedColumn;
begin
  // Inizializzazione
  CurrColumn := AViewInfo.Item as TcxGridDBBandedColumn;
  // Se è il record del fitro di ricerca modifica...
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then begin
    ACanvas.Font.Name   := 'Tahoma';
    ACanvas.Font.Size   := 8;
    ACanvas.Font.Style  := [];
    ACanvas.Font.Color := clBlack;
  // Se la cella è nella prima riga dell'elenco degli impianti (quella in evidenza e colorata)
  //  determina il colore da usare per il font
  //  NB: La colonna btvAssistenzeTIPOIMPIANTO in ogni caso viene trattata in secondo pianto anche se è nella prima riga.
  end else if (CurrColumn.Position.RowIndex = 0) then begin
    ACanvas.Font.Name   := 'Tahoma';
    ACanvas.Font.Size   := 8;
    // Style
    if (CurrColumn = btvComAutoMSG_OGGETTO) or (CurrColumn = btvComMSG_OGGETTO)
      then ACanvas.Font.Style  := [fsBold]
      else ACanvas.Font.Style  := [];
    // Color
//    if (AViewInfo.GridRecord.Values[btvListCOMPUTED_MANCAINDIRIZZO.Index])
//      then ACanvas.Font.Color := $000000D7
//      else ACanvas.Font.Color := $00009700;
    ACanvas.Font.Color  := COLORE_PRIMOPIANO;
  // Se invece è nella seconda riga e quindi in secondo piano
  end else begin
    ACanvas.Font.Name   := 'Tahoma';
    ACanvas.Font.Size   := 7;
    if  (   (CurrColumn = btvComAutoCOMPUTED_INDIRIZZOFULL) and (AviewInfo.GridRecord.Values[btvComAutoCOMPUTED_MANCAINDIRIZZO.Index])   )
    or  (   (CurrColumn = btvComCOMPUTED_INDIRIZZOFULL) and (AviewInfo.GridRecord.Values[btvComCOMPUTED_MANCAINDIRIZZO.Index])   )
    then begin
      ACanvas.Font.Style  := [fsBold];
      ACanvas.Font.Color  := $000000D7;
    end else begin
      ACanvas.Font.Style  := [];
      ACanvas.Font.Color  := COLORE_SECONDOPIANO;
    end;
  end;
end;

// Procedure che disegna i bordi delle celle
procedure TTabComunicazioniForm.CustomDraw_DrawCellBorder(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo);
var
  CurrColumn: TcxGridDBBandedColumn;
  BorderColor: TColor;
begin
  // Inizializzazione
  CurrColumn := AViewInfo.Item as TcxGridDBBandedColumn;

  // ===========================================================================
  // BORDI
  // ---------------------------------------------------------------------------
  // Determina il colore dei bordi
  BorderColor := (Sender.OptionsView as TcxGridBandedTableOptionsView).GridLineColor;
  // Bordo Sx di separazione tra bande
  if CurrColumn.IsLeft  and (CurrColumn <> btvComAutoMSG_OGGETTO) and (CurrColumn <> btvComAutoCOMPUTED_INDIRIZZOFULL) and (CurrColumn <> btvComAutoCOMPUTED_MANCAINDIRIZZO)
  and (CurrColumn <> btvComMSG_OGGETTO) and (CurrColumn <> btvComCOMPUTED_INDIRIZZOFULL) and (CurrColumn <> btvComCOMPUTED_ALERT)
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bLeft], 1);
  // Bordo Dx di separazione al bordo estremo a destra di tutta la griglia
  if CurrColumn.IsMostRight
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bRight], 1);
  // Bordo Inferiore dell'ultimo record
  if  CurrColumn.IsBottom
  then ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bBottom], 1);
  // ===========================================================================

  // ===========================================================================
  // BORDI FILTER ROW
  // ---------------------------------------------------------------------------
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then begin
    // Determina il colore dei bordi
    BorderColor := (Sender.OptionsView as TcxGridBandedTableOptionsView).GridLineColor;
    // Separazione celle
    ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bLeft,bBottom], 1);
    if CurrColumn.IsRight then ACanvas.DrawComplexFrame(AViewInfo.Bounds, BorderColor, BorderColor, [bRight], 1);
  end;
  // ===========================================================================
end;






procedure TTabComunicazioniForm.btvComAutoCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 10;
var
  R: TRect;
  TmpStr: String;
  CurrColor: TColor;
  CurrItem: TcxCustomGridTableItem;
  RI: Integer;
  AValues: PVariant;
  AItems: TcxDataSummaryItems;
begin

  // Inizializzazione
  ADone := True;

  R := AViewInfo.TextAreaBounds;
  R.Bottom := R.Bottom - 3;

  ACanvas.Font.Name := 'Tahoma';

  // Colonna corrente
  CurrItem := Sender.GroupedItems[AViewInfo.GridRecord.Level];
  // Record Index Corrente
  RI := AViewInfo.GridRecord.RecordIndex;

  // RIcava i dati dei summaries del Group Corrente
  Sender.DataController.Summary.GetGroupSummaryInfo(AViewInfo.GridRecord.Index, AItems, AValues);

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Comunicazioni relative a
  TmpStr := '  Comunicazioni per:';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;

  // Campo
  TmpStr := AviewInfo.Text;
  ACanvas.Font.Size := 10;
  DM1.RitornaTestoPrimaDi(':', TmpStr, True);
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);

  // Impianti presenti
//  R.Right := 650;
  TmpStr := VarToStr(Variant(AValues^)[0]) + '  comunicazioni presenti  ';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);

end;

procedure TTabComunicazioniForm.btvComAutoMSG_AMEZZOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ImageIndex: Integer;
begin
  inherited;
  // Se è il rigo dei filtri lo visualizza normale
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then Exit;

  // ===========================================================================
  // Altrimenti continua con il tracciamento custom dell'icona associata
  //  al mezzo di comunicazione, non ho usato l'ImageComboBox perchè mi
  //  raddoppiava l'altezza della riga non so perchè ma è un problema che ho
  //  visto sul forum della DevExpress hanno avuto anche altri e non c'è
  //  soluzione al momento.
  // ---------------------------------------------------------------------------
  // In base al mezzo del messaggio determina l'indice dell'immagine da visualizzare
  //  NB: Se non trova l'immagine esce subito e disegna la cella normalmente
  if      AViewInfo.Text = 'lettera'  then ImageIndex := 0
  else if AViewInfo.Text = 'e-mail'   then ImageIndex := 1
  else if AViewInfo.Text = 'sms'      then ImageIndex := 2
  else Exit;
  // Custom Draw
  ADone := True;
  // Determina il colore di sfondo
  CustomDraw_GetCellBackgroundColor(Sender, ACanvas, AViewInfo);
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // Traccia la Bitmap
  ACanvas.DrawImage(DM2.ComunicazioniListImages, AViewInfo.Bounds.Left + 7, AViewInfo.Bounds.Top + 6, ImageIndex);
  // ===========================================================================

  // Procedure che disegna i bordi delle celle
  CustomDraw_DrawCellBorder(Sender, ACanvas, AViewInfo);
end;

procedure TTabComunicazioniForm.btvComAutoCOMPUTED_MANCAINDIRIZZOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ImageIndex: Integer;
begin
  inherited;
  // Se è il rigo dei filtri lo visualizza normale
  if (AViewInfo.GridRecord as TcxCustomGridRow).IsFilterRow then Exit;

  // ===========================================================================
  // Altrimenti continua con il tracciamento custom dell'icona associata
  //  al mezzo di comunicazione, non ho usato l'ImageComboBox perchè mi
  //  raddoppiava l'altezza della riga non so perchè ma è un problema che ho
  //  visto sul forum della DevExpress hanno avuto anche altri e non c'è
  //  soluzione al momento.
  // ---------------------------------------------------------------------------
  // Custom Draw
  ADone := True;
  // Determina il colore di sfondo
  CustomDraw_GetCellBackgroundColor(Sender, ACanvas, AViewInfo);
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);
  // In base al fatto che l'inirizzo sia specificato o meno decide l'icona da
  //  visualizzare
  if AViewInfo.Value then begin
    ImageIndex := 1;
    ACanvas.DrawImage(DM2.ComunicazioniListOk, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top + 2, ImageIndex);
  end;
  // ===========================================================================

  // Procedure che disegna i bordi delle celle
  CustomDraw_DrawCellBorder(Sender, ACanvas, AViewInfo);
end;

procedure TTabComunicazioniForm.btvComAutoRIF_DATOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 10;
var
  R: TRect;
  TmpStr: String;
begin
  // Imposta il disegno custom
  ADone := True;
  // Inizializzazione
  R := AViewInfo.TextAreaBounds;
  // Determina il Font (compreso il colore) da utilizzare in base alla situazione
  CustomDraw_GetCellFont(Sender, ACanvas, AViewInfo);
  // Determina il colore di sfondo
  CustomDraw_GetCellBackgroundColor(Sender, ACanvas, AViewInfo);
  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  // ===========================================================================
  // TRACCIAMENTO CELLA
  // ---------------------------------------------------------------------------
  // Parte del RIF_DATO (in pratica il tipo di comunicazione), contiene valori
  //  tipo "Impianti: data prox visita" e deve essere visualizata solo la parte
  //  dopo i due punti ":".
  TmpStr := AViewInfo.Text;
  DM1.RitornaTestoPrimaDi(':', TmpStr, True);
  TmpStr := Trim(TmpStr);
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Data di riferimento
  TmpStr := AViewInfo.GridRecord.DisplayTexts[btvComAutoRIF_DATAORASCADENZA.Index];
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // Offset (days)
  // Data di riferimento
  TmpStr := AViewInfo.GridRecord.DisplayTexts[btvComAutoRIF_TIMEOFFSET_DAYS.Index] + ' giorni ';
  if LeftStr(TmpStr,1) = '-'
    then TmpStr := RightStr(TmpStr,Length(TmpStr)-1) + 'prima'
    else TmpStr := TmpStr + 'dopo';
  TmpStr := '(invio ' + TmpStr + ')';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignTop);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO;
  // ===========================================================================

  // Procedure che disegna i bordi delle celle
  CustomDraw_DrawCellBorder(Sender, ACanvas, AViewInfo);
end;

procedure TTabComunicazioniForm.btvComAutoSOGG_RAGSOCCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 10;
var
  R: TRect;
  TmpStr: String;
begin
  // Imposta il disegno custom
  ADone := True;
  // Inizializzazione
  R := AViewInfo.TextAreaBounds;
  // Determina il Font (compreso il colore) da utilizzare in base alla situazione
  CustomDraw_GetCellFont(Sender, ACanvas, AViewInfo);

  // Determina il colore di sfondo
  CustomDraw_GetCellBackgroundColor(Sender, ACanvas, AViewInfo);

  // Disegna il rettangolo di sfondo
  ACanvas.FillRect(AViewInfo.Bounds);

  // Disegna il contenuto della cella in modo standard
  AviewInfo.EditViewInfo.Font             := ACanvas.Font;
  AviewInfo.EditViewInfo.TextColor        := ACanvas.Font.Color;
  AviewInfo.EditViewInfo.BackgroundColor  := ACanvas.Brush.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas);

  // Traccia il campo "in qualità di" allineato a destra
  TmpStr := Trim(AViewInfo.GridRecord.DisplayTexts[btvComAutoSOGG_INQUALITADI.Index]);
  if TmpStr <> '' then begin
    TmpStr := '  ' + TmpStr;
    ACanvas.Font.Size := 7;
    ACanvas.Font.Color := COLORE_SECONDOPIANO;
    ACanvas.Font.Style := [];
    ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignTop);
  end;

  // Procedure che disegna i bordi delle celle
  CustomDraw_DrawCellBorder(Sender, ACanvas, AViewInfo);
end;

procedure TTabComunicazioniForm.ResetQueryButtonClick(Sender: TObject);
begin
  inherited;
  // In base alla pagina visualizzata azzera i filtri corretti
  // ---------------------------------------------------------------------------
  // Pagina elenco
  if PageControl.ActivePage = TabElenco then begin
    FilterTrova.Text          := '';
    FilterTipo.Checked[0]     := True;
    FilterTipo.Checked[1]     := True;
    FilterTipo.Checked[2]     := True;
    FilterOggetto.Text        := '';
    FilterTipoData.Text       := 'Creazione';
    // Senza filtro per date che in questo caso è meglio
    AssMesiNessunoClick(AssMesiNessuno);
    // Seleziona solo i documenti dell'anno in corso se non si è dentro
    //  un cantiere altrimenti li visualizza senza limiti di date
    if ClientiForm.PraticaCorrente = '' then AssMesiTuttiClick(Self);
    // Chiude la FilterRow annullando tutti i filtri eventualmente attivi
    if btvCom.FilterRow.Visible then begin
      SBFilterRow.Down := False;
      SBFilterRowClick(SBFilterRow);
    end;

  // Pagina nuove comunicazioni automaticche da inviare
  end else if PageControl.ActivePage = TabComAuto then begin
    // Azzera i filtri della griglia
    btvComAuto.DataController.Filter.Clear;
  end;
end;

procedure TTabComunicazioniForm.btvComAutoDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  inherited;
  // Visualizza i totali
  LabelComAutoCount.Caption := '(' + ASender.FooterSummaryTexts[0] + ' comunicazioni in tutto)';
end;

// Crea una nuova comunicazione, secondo il modello specificato e la invia
procedure TTabComunicazioniForm.CreaNuovaComunicazione(SourceID:Integer; MsgType:String; SoggettoID, PraticaID, RifID:Integer; RifDato:String; Silent:Boolean=False);
begin
  // Crea la form della comunicazione
  //  la imposta e poi in base al parametro SILENT visualizza o meno
  //  la Form stessa, se non la visualizza tenta l'invio automatico senza
  //  dire nulla.
  Application.CreateForm(TComunicazioneForm, ComunicazioneForm);
  ComunicazioneForm.Parent := MainForm;
  ComunicazioneForm.P_NEW_SILENT := Silent;
  ComunicazioneForm.Tag := 2;
  if SoggettoID > 0 then ComunicazioneForm.P_NEW_ID_SOGGETTO  := SoggettoID;
  if PraticaID > 0  then ComunicazioneForm.P_NEW_ID_PRATICA   := PraticaID;
  if RifID > 0      then ComunicazioneForm.P_NEW_ID_RIF       := RifID;
  if RifDato <> ''  then ComunicazioneForm.P_NEW_RIF_DATO     := RifDato;
  ComunicazioneForm.P_NEW_TIPO_COMUNICAZIONE := MsgType;
  ComunicazioneForm.P_NEW_ID_MODELLO := SourceID;  // NB: Questo deve essere assegnato per ultimo perchè quando viene assegnato poi fa anche la sostituzione dei segnaposto e se manca dei dati poi non va bene
  // Visualizza la form
  ComunicazioneForm.Show;
end;

// Crea una nuova comunicazione a partire dala griglia
procedure TTabComunicazioniForm.CreaNuovaComunicazioneFromGrid(RI:Integer; Silent:Boolean=False);
var
  DC: TcxCustomDataController;
  IdSoggetto, IdPratica, IdRif: Integer;
  DatoDiRiferimento: String;
begin
  // Inizializzazione
  DC := btvComAuto.DataController;
  IdSoggetto := 0;
  IdPratica  := 0;
  IdRif      := 0;
  DatoDiRiferimento := DC.DisplayTexts[RI,btvComAutoRIF_DATO.Index];
  DatoDiRiferimento := DM1.RitornaTestoPrimaDi(':', DatoDiRiferimento, False);
  // Verifica e defaultizzazione dati
  if not VarIsNull(DC.Values[RI,btvComAutoSOGG_CODICE.Index])  then IdSoggetto  := DC.Values[RI,btvComAutoSOGG_CODICE.Index];
  if not VarIsNull(DC.Values[RI,btvComAutoPRAT_ID.Index])      then IdPratica   := DC.Values[RI,btvComAutoPRAT_ID.Index];
  if not VarIsNull(DC.Values[RI,btvComAutoRIF_ID.Index])       then IdRif       := DC.Values[RI,btvComAutoRIF_ID.Index];
  // RIchiama l'ìapposita procedura
  CreaNuovaComunicazione(DC.Values[RI,btvComAutoID.Index], DC.Values[RI,btvComAutoMSG_AMEZZO.Index], IdSoggetto, IdPratica, IdRif, DatoDiRiferimento, Silent);
  //  NB: IMposto anche questi campi anche se impostando il solo codice del soggetto in realtà li carica già
  //      dall'anagrafica soggetti, ma potrebbero essere diversi in alcune situazioni quindi lasciare così.
  ComunicazioneForm.QryMsgDEST_RAGSOC.Value     := VarToStr(DC.Values[RI,btvComAutoSOGG_RAGSOC.Index]);
  ComunicazioneForm.QryMsgDEST_INDIRIZZO.Value  := VarToStr(DC.Values[RI,btvComAutoSOGG_INDIRIZZO.Index]);
  ComunicazioneForm.QryMsgDEST_NUMCIVICO.Value  := VarToStr(DC.Values[RI,btvComAutoSOGG_NUMCIVICO.Index]);
  ComunicazioneForm.QryMsgDEST_COMUNE.Value     := VarToStr(DC.Values[RI,btvComAutoSOGG_COMUNE.Index]);
  ComunicazioneForm.QryMsgDEST_PROVINCIA.Value  := VarToStr(DC.Values[RI,btvComAutoSOGG_PROVINCIA.Index]);
  ComunicazioneForm.QryMsgDEST_CAP.Value        := VarToStr(DC.Values[RI,btvComAutoSOGG_CAP.Index]);
  ComunicazioneForm.QryMsgDEST_CELLULARE.Value  := VarToStr(DC.Values[RI,btvComAutoSOGG_CELLULARE.Index]);
  ComunicazioneForm.QryMsgDEST_EMAIL.Value      := VarToStr(DC.Values[RI,btvComAutoSOGG_EMAIL.Index]);
  // Se siamo in modalità Silent provvede a lanciare l'invio automatico della comunicazione
  //  corrente.
  //  NB: Metto qui l'invio automatico in caso di modalità Silent perchè altrimenti
  //      invierebbe la comunicazione prima delle righe qui sopra.
  if Silent then begin
    ComunicazioneForm.sbLetteraInviaClick(nil);
    ComunicazioneForm.RxSpeedButtonUscitaClick(nil);
  end;
end;


procedure TTabComunicazioniForm.VisualizzaButtonClick(Sender: TObject);
var
  DC: TcxCustomDataController;
  RI: Integer;
begin
  inherited;

  // Se siamo nella pagina delle comunicazioni effettuare apre
  //  la comunicazione selezionata.
  if PageControl.ActivePage = TabElenco then begin

    DC := btvCom.DataController;
    RI := DC.FocusedRecordIndex;
    DM1.ShowWait('Levante', 'Caricamento...');
    try
      DM2.COM_ApriComunicazione(DC.Values[RI,btvComID.Index]);
    finally
      DM1.CloseWait;
    end;

  // Se invece siamo nella pagina delle comunicazioni automatiche crea e visualizza una
  //  nuova comunicazione relativa alla riga focused
  end else if PageControl.ActivePage = TabComAuto then begin

    DM1.ShowWait('Levante', 'Caricamento...');
    try
    CreaNuovaComunicazioneFromGrid(btvComAuto.DataController.FocusedRecordIndex);
    finally
      DM1.CloseWait;
    end;

  end;
end;

procedure TTabComunicazioniForm.btvComAutoDblClick(Sender: TObject);
begin
  inherited;
  // Visualizza il documento
  if ClientiForm.RxSpeedButtonVisualizza.Enabled then
    ClientiForm.RxSpeedButtonVisualizzaClick(ClientiForm.RxSpeedButtonVisualizza);
end;

procedure TTabComunicazioniForm.QryComCalcFields(DataSet: TDataSet);
var
  TmpStr, TmpStr2, Spazio: String;
  NumeroInvii: Integer;
begin
  inherited;

  // ===========================================================================
  // Compone l'indirizzo completo di invio in base al tipo di messaggio
  // ---------------------------------------------------------------------------
  if          QryComMSG_TYPE.AsString = 'lettera' then begin
    // Comune
    TmpStr := Trim(QryComDEST_COMUNE.AsString);
    // Provincia
    TmpStr2:= Trim(QryComDEST_PROVINCIA.AsString);
    if (TmpStr='') or (TmpStr2='') then Spazio := '' else Spazio := ' ';
    if (TmpStr2<>'') then TmpStr := TmpStr + Spazio + '(' + TmpStr2 + ')';
    // Indirizzo
    TmpStr2 := Trim(QryComDEST_INDIRIZZO.AsString);
    if (TmpStr='') or (TmpStr2='') then Spazio := '' else Spazio := ' - ';
    TmpStr := TmpStr + Spazio + TmpStr2;
    // Numero civico
    TmpStr2 := Trim(QryComDEST_NUMCIVICO.AsString);
    if (TmpStr='') or (TmpStr2='') then Spazio := '' else Spazio := ' ';
    TmpStr := TmpStr + Spazio + TmpStr2;
    // CAP
    TmpStr2 := Trim(QryComDEST_CAP.AsString);
    if (TmpStr='') or (TmpStr2='') then Spazio := '' else Spazio := ' - ';
    TmpStr := TmpStr + Spazio + TmpStr2;
    // Assegnazione
    QryComCOMPUTED_INDIRIZZOFULL.Value := TmpStr;
    // Se manda il dato...
    if QryComCOMPUTED_INDIRIZZOFULL.Value = '' then QryComCOMPUTED_INDIRIZZOFULL.Value := 'Manca l''indirizzo';

  end else if QryComMSG_TYPE.AsString = 'e-mail' then begin
    QryComCOMPUTED_INDIRIZZOFULL.Value := Trim(QryComDEST_EMAIL.AsString);
    if QryComCOMPUTED_INDIRIZZOFULL.Value = '' then QryComCOMPUTED_INDIRIZZOFULL.Value := 'Manca l''indirizzo e-mail';

  end else if QryComMSG_TYPE.AsString = 'sms' then begin
    QryComCOMPUTED_INDIRIZZOFULL.Value := Trim(QryComDEST_CELLULARE.AsString);
    if QryComCOMPUTED_INDIRIZZOFULL.Value = '' then QryComCOMPUTED_INDIRIZZOFULL.Value := 'Manca il numero di cellulare';

  end;
  // ===========================================================================

  // ===========================================================================
  // Compone il campo che descrive il numero di invii effettuati per questa comunicazione
  // ---------------------------------------------------------------------------
  NumeroInvii := QryComNUMEROINVII.AsInteger;
  if      NumeroInvii = 0 then TmpStr := 'MAI INVIATO !!!'
  else if NumeroInvii = 1 then TmpStr := 'Inviato ' + IntToStr(NumeroInvii) + ' volta'
  else                         TmpStr := 'Inviato ' + IntToStr(NumeroInvii) + ' volte';
  // Assegnazione
  QryComCOMPUTED_NUMEROINVIIFULL.Value := TmpStr;
  // ===========================================================================

  // Calcola il campo che idnica la mancanza dell'indirizzo, dell'e-mail, del numero di cellulcare (sms)
  QryComCOMPUTED_MANCAINDIRIZZO.Value := (LeftStr(QryComCOMPUTED_INDIRIZZOFULL.AsString,5) = 'Manca');

  // Imposta il campo Alert che visualizza o meno la mano per evidenziare che c'è qualcosa che non va
  QryComCOMPUTED_ALERT.Value := (QryComCOMPUTED_MANCAINDIRIZZO.Value or (QryComNUMEROINVII.AsInteger = 0));

end;

procedure TTabComunicazioniForm.btvComDATAULTMOD_CREAZIONEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  // Assegnazione
  AText := ComponiTestoCreazioneUltMod(ARecord.Values[btvComDATAULTMOD_CREAZIONE.Index], ARecord.Values[btvComDATAULTMOD_GENERALE.Index]);
end;


// Function che compone il testo del campo di creazione e ultima modifica della comunicazione
function TTabComunicazioniForm.ComponiTestoCreazioneUltMod(DataOraCreazione, DataOraUltMod: Variant): String;
var
  TmpStr: String;
  TmpDateTime1, TmpDateTime2: TDateTime;
begin
  // Compone il testo del campo usando sia la data di prima creazione che
  //  la data dell'ultima modifica
  // ---------------------------------------------------------------------------
  // Data e ora di creazione del messaggio
  if (not VarIsNull(DataOraCreazione)) then begin
    TmpDateTime1 := DataOraCreazione;
    TmpStr := TmpStr + 'Creato il ' + FormatDateTime('dd/mm/yyyy', TmpDateTime1) + ' ore ' + FormatDateTime('hh.nn', TmpDateTime1);
  end;
  // ---------------------------------------------------------------------------
  // Data e ora di ultima modifica del messaggio
  if (not VarIsNull(DataOraUltMod)) then begin
    TmpDateTime2 := DataOraUltMod;
    if TmpDateTime2 <> TmpDateTime1
    then TmpStr := TmpStr + '   ult.mod. il ' + FormatDateTime('dd/mm/yyyy', TmpDateTime2) + ' ore ' + FormatDateTime('hh.nn', TmpDateTime2);
  end;
  // ---------------------------------------------------------------------------
  // Assegnazione
  Result := TmpStr;
end;

// Function che compone il testo del campo di creazione e ultima modifica della comunicazione
function TTabComunicazioniForm.ComponiTestoInvii(NumInvii:Integer; DataPrimo, DataUltimo: Variant): String;
var
  TmpStr: String;
  TmpDateTime1, TmpDateTime2: TDateTime;
begin
  inherited;
  // Compone il testo del campo usando sia la data di primo invio che di ultimo invio
  // ---------------------------------------------------------------------------
  // Data e ora del primo invio
  if (not VarIsNull(DataPrimo)) then begin
    TmpDateTime1 := DataPrimo;
    TmpStr := FormatDateTime('dd/mm/yyyy', TmpDateTime1) + ' ore ' + FormatDateTime('hh.nn', TmpDateTime1);
  end;
  // ---------------------------------------------------------------------------
  // Data e ora dell'ultimo invio
  if (not VarIsNull(DataUltimo)) then begin
    TmpDateTime2 := DataUltimo;
    if TmpDateTime2 <> TmpDateTime1
    then TmpStr := TmpStr + '   l''ultimo il ' + FormatDateTime('dd/mm/yyyy', TmpDateTime2) + ' ore ' + FormatDateTime('hh.nn', TmpDateTime2);
  end;
  // ---------------------------------------------------------------------------

  // In base  a quanti invii ci sono
  if      NumInvii = 0 then Result := ''
  else if NumInvii = 1 then Result := 'il ' + TmpStr
  else                      Result := 'Primo invio il ' + TmpStr;
end;

procedure TTabComunicazioniForm.btvComPRIMOINVIO_DATAORAGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  NumInvii: Integer;
begin
  inherited;
  // Inizializzazione
  NumInvii := DM1.NoNullIntValue(btvCom.DataController, ARecord.RecordIndex, btvComNUMEROINVII.Index);
  // Assegnazione
  AText := ComponiTestoInvii(NumInvii, ARecord.Values[btvComPRIMOINVIO_DATAORA.Index], ARecord.Values[btvComULTIMOINVIO_DATAORA.Index]);
end;




procedure TTabComunicazioniForm.btvComCOMPUTED_NUMEROINVIIFULLGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  // Se non è mai stato inviato visualizza "MAI INVIATO!!!"
  if DM1.NoNullIntValue(btvCom.DataController, ARecord.RecordIndex, btvComNUMEROINVII.Index) = 0
  then AText := 'MAI INVIATO !';
end;

procedure TTabComunicazioniForm.btvComCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  CurrColumn: TcxGridDBBandedColumn;
begin
  inherited;
  // Custom Draw
  ADone := True;
  // Inizializzazione
  CurrColumn := AViewInfo.Item as TcxGridDBBandedColumn;
  // Determina il Font (compreso il colore) da utilizzare in base alla situazione
  CustomDraw_GetCellFont(Sender, ACanvas, AViewInfo);
  // Se il messaggio non è mai stato inviato e il campo + il numero di invii lo visualizza in rosso
  //  e in grassetto
  if (AviewInfo.Item = btvComCOMPUTED_NUMEROINVIIFULL) and (DM1.NoNullIntValue(btvCom.DataController, AviewInfo.GridRecord.RecordIndex, btvComNUMEROINVII.Index) = 0) then begin
    ACanvas.Font.Color := $000000D7;
    ACanvas.Font.Style := [fsBold];
  end;
  // Determina il colore di sfondo
  CustomDraw_GetCellBackgroundColor(Sender, ACanvas, AViewInfo);
  // Disegna il contenuto della cella in modo standard
  AviewInfo.EditViewInfo.Font             := ACanvas.Font;
  AviewInfo.EditViewInfo.TextColor        := ACanvas.Font.Color;
  AviewInfo.EditViewInfo.BackgroundColor  := ACanvas.Brush.Color;
  AViewInfo.EditViewInfo.Paint(ACanvas);
  // Procedure che disegna i bordi delle celle
  CustomDraw_DrawCellBorder(Sender, ACanvas, AViewInfo);
end;


procedure TTabComunicazioniForm.btvComRIF_RIFERIMENTOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  // Se non è vuoto gli aggiunge "Rif." all'inizio
  if Trim(AText) <> '' then AText := 'Rif.  ' + AText;
end;

procedure TTabComunicazioniForm.btvComDataControllerDetailCollapsed(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
var
  i: Integer;
begin
  inherited;
  // Elimina tutti i Details in modo che se vengono riaperti vengano
  //  ricreati nuovi e quindi eventualmente aggiornati (prima non si aggiornavano mai).
  for i := 0 to lvSto.Count -1 do ADataController.ClearDetailLinkObject(ARecordIndex, i);
end;

procedure TTabComunicazioniForm.btvComDataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  inherited;
  // Attiva le query dei dettagli se non lo sono già
  //  NB: Prima era nell'evento onAfterOpen della query dell'elenco impianti
  //       ma ò'ho spostata qui perchè così viene eseguito solo se necessario
  //       con un elleggerimento dell'apertura dell'elenco perchè era un pò lento.
  //  NB: Visualizza un messaggio di attesa per l'operatore solo se necessario altrimenti era troppo invadente e non mi piacera.
  if (not QrySto.Active)
  then DM1.ShowWait('Levante', 'Caricamento...');
  try
    if not QrySto.Active  then QrySto.Open;
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabComunicazioniForm.btvStoDataControllerDataModeControllerDetailFirst(
  Sender: TcxDBDataModeController; ADataSet: TDataSet;
  const AMasterDetailKeyFieldNames: String;
  const AMasterDetailKeyValues: Variant; var AReopened: Boolean);
begin
  inherited;
  // Chiuede la query, imposta i nuovi parametri e la riapre.
  QrySto.DisableControls;
  try
    QrySto.Active := False;
    QrySto.Params.ParamByName('ID_MSG').Value := AMasterDetailKeyValues;
    QrySto.Active := True;
  finally
    QrySto.EnableControls;
  end;
  AReopened := True;
end;

procedure TTabComunicazioniForm.btvStoDATAORAINVIOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  TmpDateTime: TDateTime;
begin
  inherited;
  // Rielabora il dato
  if VarIsNull(ARecord.Values[Sender.Index]) then Exit;
  TmpDateTime := ARecord.Values[Sender.Index];
  AText := 'Invio del  ' + FormatDateTime('dd/mm/yyyy', TmpDateTime) + '  alle ore  ' + FormatDateTime('hh.nn', TmpDateTime);
end;

procedure TTabComunicazioniForm.btvComDblClick(Sender: TObject);
begin
  inherited;
  // Visualizza il documento
  if ClientiForm.RxSpeedButtonVisualizza.Enabled then ClientiForm.RxSpeedButtonVisualizzaClick(ClientiForm.RxSpeedButtonVisualizza);
end;

procedure TTabComunicazioniForm.btvComKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  // Se invece è stato premuto il puslante "Canc" con il focus sulla griglia
  // richiama la pressione del pulsante di cancellazione dei documenti, perchè
  // l'eliminazione interna della griglia sui documento è stata disabilitata perchè
  // dava un errore. Così gli faccio richiamare la mia funzione di cancellazione dei documenti
  // così funziona anche il Canc.
  if Key = 46 then
    EliminaButtonClick(nil);
end;

procedure TTabComunicazioniForm.SBFilterOpenCloseClick(Sender: TObject);
begin
  inherited;
  if PanelFiltri.Tag = 1
  then CloseFilterPanel(PanelFiltri, SBFilterOpenClose)
  else OpenFilterPanel(PanelFiltri, SBFilterOpenClose);
end;

procedure TTabComunicazioniForm.AssMesiTuttiClick(Sender: TObject);
begin
  inherited;
   AssDal.EditText := DM1.FilterDataDalDefault;
   AssAl.EditText  := DM1.FilterDataAlDefault;
   // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
   //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
   //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
   //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
//   if AssMesiTutti.Tag = 0 then begin
      // In questo modo posso metterli tutti in DOWN contemporaneamente
      AssGen.GroupIndex := 901;
      AssFeb.GroupIndex := 902;
      AssMar.GroupIndex := 903;
      AssApr.GroupIndex := 904;
      AssMag.GroupIndex := 905;
      AssGiu.GroupIndex := 906;
      AssLug.GroupIndex := 907;
      AssAgo.GroupIndex := 908;
      AssSet.GroupIndex := 909;
      AssOtt.GroupIndex := 910;
      AssNov.GroupIndex := 911;
      AssDic.GroupIndex := 912;
      AssGen.Down   := False;
      AssFeb.Down   := False;
      AssMar.Down   := False;
      AssApr.Down   := False;
      AssMag.Down   := False;
      AssGiu.Down   := False;
      AssLug.Down   := False;
      AssAgo.Down   := False;
      AssSet.Down   := False;
      AssOtt.Down   := False;
      AssNov.Down   := False;
      AssDic.Down   := False;
//   end else begin
      // Rimette il Tag del pulsante = 0
      AssMesiTutti.Tag := 0;
//   end;
end;

procedure TTabComunicazioniForm.AssSaveDateFilterClick(Sender: TObject);
begin
  inherited;
  DM1.SalvaDatePredefinitePerFiltri(AssDal.EditText, AssAl.EditText);
end;

procedure TTabComunicazioniForm.AssMesiTuttiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      AssMesiTuttiClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabComunicazioniForm.AssMesiNessunoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      AssMesiNessunoClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabComunicazioniForm.AssGenClick(Sender: TObject);
var
   GG, MM, AA: Word;
   Mese:Shortint;
begin
  inherited;
   // Mese contiene l'indice del mese premuto
   Mese := (Sender as TSpeedButton).Tag;
   // AA COntiene l'anno in corso
   DecodeDate(Date, AA, MM, GG);
   // Se il GroupIndex è <> 600 significa che è stato premuto il
   //  tasto di selezione di tutti i mesi e quindi si comporta di conseguenza
   if (Sender as TSpeedButton).GroupIndex <> 600 then begin
      AssMesiNessunoClick(Self);
      (Sender as TSpeedButton).Down := True;
   end;
   // Se il pulsante è premuto (down)...
   if (Sender as TSpeedButton).Down then begin
      // In base all'indice del mese imposta le date nel modo opportuno
      case Mese of
         1:begin
            AssDal.EditText := ' 01/01/' + IntToStr(AA);
            AssAl.EditText  := ' 31/01/' + IntToStr(AA);
         end;
         2:begin
            AssDal.EditText := ' 01/02/' + IntToStr(AA);
            AssAl.EditText  := ' ' + IntToStr(DaysInAMonth(CurrentYear, 2)) + '/02/' + IntToStr(AA);
         end;
         3:begin
            AssDal.EditText := ' 01/03/' + IntToStr(AA);
            AssAl.EditText  := ' 31/03/' + IntToStr(AA);
         end;
         4:begin
            AssDal.EditText := ' 01/04/' + IntToStr(AA);
            AssAl.EditText  := ' 30/04/' + IntToStr(AA);
         end;
         5:begin
            AssDal.EditText := ' 01/05/' + IntToStr(AA);
            AssAl.EditText  := ' 31/05/' + IntToStr(AA);
         end;
         6:begin
            AssDal.EditText := ' 01/06/' + IntToStr(AA);
            AssAl.EditText  := ' 30/06/' + IntToStr(AA);
         end;
         7:begin
            AssDal.EditText := ' 01/07/' + IntToStr(AA);
            AssAl.EditText  := ' 31/07/' + IntToStr(AA);
         end;
         8:begin
            AssDal.EditText := ' 01/08/' + IntToStr(AA);
            AssAl.EditText  := ' 31/08/' + IntToStr(AA);
         end;
         9:begin
            AssDal.EditText := ' 01/09/' + IntToStr(AA);
            AssAl.EditText  := ' 30/09/' + IntToStr(AA);
         end;
         10:begin
            AssDal.EditText := ' 01/10/' + IntToStr(AA);
            AssAl.EditText  := ' 31/10/' + IntToStr(AA);
         end;
         11:begin
            AssDal.EditText := ' 01/11/' + IntToStr(AA);
            AssAl.EditText  := ' 30/11/' + IntToStr(AA);
         end;
         12:begin
            AssDal.EditText := ' 01/12/' + IntToStr(AA);
            AssAl.EditText  := ' 31/12/' + IntToStr(AA);
         end;
      end;
   // Se invece il mese non è premuto...
   end else begin
      AssDal.Text := '';
      AssAl.Text  := '';
   end;
end;

procedure TTabComunicazioniForm.AssGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      AssGenClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabComunicazioniForm.FilterTrovaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then ClientiForm.RxSpeedButtonTrovaClick(Self);
end;

procedure TTabComunicazioniForm.FilterTipoClickCheck(Sender: TObject);
begin
  inherited;
   // Se passa di quì significa che l'utente ha cliccato esattamente nel riquadrino del check della voce
   //  e quindi marca la proprietà Tag del componente in modo che poi il gestore dell'evento OnMouseUp che gestisce
   //  i click per la selezione o meno della voce (per fare in modo che anche cliccando sulla descrizione della voce
   //  si selezioni o deselezioni la voce stessa). In questo modo tale gestore di evento salta la riga che
   //  assegna il valore alla proprietà checked[i] altrimenti è come se l'utente avesse cliccato due volte.
   (Sender as TCheckListBox).Tag := 1;
end;

procedure TTabComunicazioniForm.FilterTipoExit(Sender: TObject);
begin
  inherited;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   (Sender as TCheckListBox).ItemIndex := -1;
end;

procedure TTabComunicazioniForm.FilterTipoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   CheckIndex:Integer;
   CurrCheckListBox:TCheckListBox;
   i: Integer;
begin
  inherited;
   // ----------------------------------------------------------------------------------------------------
   // Questo codice server per fare in modo che anche se l'utente clicca sul titolo della voce, questa
   //  venga selezinata o deselezionata come se si fosse cliccato sul riquadrino del segno di check)
   // ----------------------------------------------------------------------------------------------------
   // La variabie CurrCheckListBox Punta alla CheckListBox che ha richiamata l'evento
   CurrCheckListBox := Sender as TCheckListBox;
   // Solo se sè cliccato con il pulsante SX del mouse
   if Button = mbLeft then begin
      // Quale voce si trova sotto il mouse?
      CheckIndex := CurrCheckListBox.ItemAtPos(Point(X,Y), True);
      // Se c'era una voce cambia il suo stato
      if CheckIndex <> -1 then begin
         if CurrCheckListBox.Tag = 0 then CurrCheckListBox.Checked[CheckIndex] := not CurrCheckListBox.Checked[CheckIndex];
         // Rimette la Proprietà Tag del componente = 0
         CurrCheckListBox.Tag := 0;
      end;
   // Se invece è stato premuto il pulsante DX
   end else if Button = mbRight then begin
      // Quale voce si trova sotto il mouse?
      CheckIndex := CurrCheckListBox.ItemAtPos(Point(X,Y), True);
      // Deseleziona tutti i documenti
      for i := 0 to CurrCheckListBox.Items.Count -1 do CurrCheckListBox.Checked[i] := False;
      // Chekka il documento
      CurrCheckListBox.Checked[CheckIndex] := True;
      // Esegue la ricerca
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   CurrCheckListBox.ItemIndex := -1;
   // ----------------------------------------------------------------------------------------------------
end;

procedure TTabComunicazioniForm.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  btvCom.ViewData.Collapse(True);
end;

procedure TTabComunicazioniForm.SpeedButton18Click(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  for i := 0 to lvCom.Count -1 do lvCom.Items[i].Visible := False;
  btvCom.ViewData.Expand(False);
  for i := 0 to lvCom.Count -1 do lvCom.Items[i].Visible := True;
end;

procedure TTabComunicazioniForm.btvComCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
const
  SPAZIO = 10;
var
  R: TRect;
  TmpStr: String;
  CurrColor: TColor;
  CurrItem: TcxCustomGridTableItem;
  RI: Integer;
  AValues: PVariant;
  AItems: TcxDataSummaryItems;
begin


  // Inizializzazione
  ADone := True;
  R := AViewInfo.TextAreaBounds;
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;

  // Colonna corrente
  CurrItem := Sender.GroupedItems[AViewInfo.GridRecord.Level];
  // Record Index Corrente
  RI := AViewInfo.GridRecord.RecordIndex;

  // RIcava i dati dei summaries del Group Corrente
  Sender.DataController.Summary.GetGroupSummaryInfo(AViewInfo.GridRecord.Index, AItems, AValues);

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender.Styles as TcxGridBandedTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Campo
  TmpStr := GetGroupTitle(AViewInfo);
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT(TmpStr, R, cxAlignLeft or cxAlignBottom);
  R.Left := R.Left + ACanvas.TextWidth(TmpStr) + SPAZIO + SPAZIO;

  // Impianti presenti
  R.Right := 650;
  TmpStr := VarToStr(Variant(AValues^)[0]) + '  comunicazioni presenti';
  ACanvas.Font.Style := [];
  ACanvas.DrawTexT(TmpStr, R, cxAlignRight or cxAlignBottom);

end;


function TTabComunicazioniForm.GetGroupTitle(AViewInfo:TcxGridTableCellViewInfo): String;
var
  InitialLevelIndex, CurrentLevelIndex: Integer;
  Row: TcxCustomGridRecord;
  FooterTitle: String;
begin
  // Inizializzazione
  Result := '';
  // Contiene il LevelIndex del footer che si sta tracciando
  InitialLevelIndex := AViewInfo.GridRecord.Level;
  // ALl'inizio contiene lo stesso valore di InitialLevelIndex ma poi viene usato durante l'elaborazione
  //  per ciclare tra i livelli precedenti e comporre così il titolo completo con tutti i testi di tutti i gruppi
  //  di tutti i Livelli di gruppo ai quali il footer è relativo.
  CurrentLevelIndex := InitialLevelIndex;
  // Row punta alla Row del Footer attuale, poi successivamente punterà
  //  alle Parent Row per risalire i titoli dei gruppi di livello precedenti.
  Row := AViewInfo.GridRecord;
  // Cicla finchè Row punta ad una Row Valida e cioè risale ogni GroupLevel finchè ce
  //  ne sono.
  while (Row <> nil) and (CurrentLevelIndex >= 0) do begin
    // Solo se la Row è relativa ad un Footer (not Row.IsData).
    if (not Row.IsData) and (Row.Level <= InitialLevelIndex) then begin
      // Compone il testo da ritornare aggiungendo il titolo del gruppo attuale.
      if FooterTitle <> ''
      then FooterTitle := Row.DisplayTexts[0]  + '  >  ' + FooterTitle
      else FooterTitle := Row.DisplayTexts[0];
      // Risale al livello precedente
      Dec(CurrentLevelIndex);
    end;
    // Risale alla PArentRow della Row Attuale.
    Row := Row.ParentRecord;
  end;
  // Compone il titolo da ritornale
  Result := FooterTitle;
end;


procedure TTabComunicazioniForm.btvComDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
begin
  inherited;
  // Visualizza i totali
  LabelComCount.Caption := '(' + ASender.FooterSummaryTexts[0] + ' comunicazioni presenti)';
end;

procedure TTabComunicazioniForm.EliminaButtonClick(Sender: TObject);
var
  LMessage: String;
begin
  inherited;
  // Chiede conferma per l'eliminazione (se non ci sono voci eselezionate esce)
  if btvCom.Controller.SelectedRecordCount = 1 then
    LMessage := 'Elimina comunicazione'
  else
  if btvCom.Controller.SelectedRecordCount > 1 then
    LMessage := Format('Elimina %d comunicazioni', [btvCom.Controller.SelectedRecordCount])
  else
    Exit;
  if not TConfirmForm.ConfirmationRequest(LMessage,
    Format('Per confermare digita "%s", poi clicca sul bottone "Conferma".', [LMessage]),
    LMessage,
    600, 300) then
      Exit;
  btvCom.Controller.DeleteSelection;
end;

procedure TTabComunicazioniForm.SbGcVisMem1Click(Sender: TObject);
begin
  inherited;
  try
    if SbGcVisMemAdd.Down then begin
      StopSalvaVistaNelleMemorie;
      if DM1.Messaggi('Memorizza vista', 'Confermi di voler salvare la vista attuale in questa memoria?', 'NB: La nuova vista sovrascriverà l''eventuale vista precedentemente memorizzata nella stessa memoria.', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
      DM2.SaveBandedTableView(GridCom, btvCom,   'M' + RightStr((Sender as TSpeedButton).Name, 1));
      DM2.SalvaCaptionMemoria('MEMORIECOMUNICAZIONI.INI', TSpeedButton(Sender), SbGcVisMem1,SbGcVisMem2,SbGcVisMem3,SbGcVisMem4,SbGcVisMem5,SbGcVisMem6,SbGcVisMem7,SbGcVisMem8,SbGcVisMem9,SbGcVisMem10);
      DM1.Messaggi('Memorizza vista', 'Memorizzato.', '', [mbOk], 0, nil);

    end else if SbGcVisMemSetPredef.Down then begin
      StopSalvaVistaNelleMemorie;
      if DM1.Messaggi('Imposta memoria predefinita', 'Confermi di voler impostare la memoria come predefinita?', '', [mbYes, mbNo], 0, nil) <> mrYes then Exit;
      DM2.MemPredef_SaveSelection('MEMORIE_COMUNICAZIONI', TSpeedButton(Sender), SbGcVisMem1,SbGcVisMem2,SbGcVisMem3,SbGcVisMem4,SbGcVisMem5,SbGcVisMem6,SbGcVisMem7,SbGcVisMem8,SbGcVisMem9,SbGcVisMem10);
      DM1.Messaggi('Imposta memoria predefinita', 'La memoria scelta è ora la predefinita per questa postazione.', '', [mbOk], 0, nil);
      // Selezione e carica la memoria scelta dall'utente
      DM2.RichiamaMemoria(GridCom, btvCom, TSpeedButton(Sender), QryCom, True);

    end else begin
      // Selezione e carica la memoria scelta dall'utente
      DM2.RichiamaMemoria(GridCom, btvCom, TSpeedButton(Sender), QryCom, True);
    end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabComunicazioniForm.SbGcVisMem1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      SbGcVisMem1Click(Sender);
   end;
end;

procedure TTabComunicazioniForm.StopSalvaVistaNelleMemorie;
begin
  TimerAddMemoryGC.Enabled := False;
  SbGcVisMemAdd.Down := False;
  SbGcVisMem1.Font.Size := 7;
  SbGcVisMem2.Font.Size := 7;
  SbGcVisMem3.Font.Size := 7;
  SbGcVisMem4.Font.Size := 7;
  SbGcVisMem5.Font.Size := 7;
  SbGcVisMem6.Font.Size := 7;
  SbGcVisMem7.Font.Size := 7;
  SbGcVisMem8.Font.Size := 7;
  SbGcVisMem9.Font.Size := 7;
  SbGcVisMem10.Font.Size := 7;
  SbGcVisMemAdd.Down := False;
  SbGcVisMemSetPredef.Down := False;
  PanelSelezioneColonne.Update;
end;

procedure TTabComunicazioniForm.StartSalvaVistaNelleMemorie;
begin
  SbGcVisMem1.Font.Size := 1;
  SbGcVisMem2.Font.Size := 1;
  SbGcVisMem3.Font.Size := 1;
  SbGcVisMem4.Font.Size := 1;
  SbGcVisMem5.Font.Size := 1;
  SbGcVisMem6.Font.Size := 1;
  SbGcVisMem7.Font.Size := 1;
  SbGcVisMem8.Font.Size := 1;
  SbGcVisMem9.Font.Size := 1;
  SbGcVisMem10.Font.Size := 1;
  PanelSelezioneColonne.Update;
  TimerAddMemoryGC.Tag := 0;
  TimerAddMemoryGC.Enabled := True;
end;

procedure TTabComunicazioniForm.TimerAddMemoryGCTimer(Sender: TObject);
begin
  inherited;
  if SbGcVisMem1.Font.Size = 1 then begin
    SbGcVisMem1.Font.Size := 7;
    SbGcVisMem2.Font.Size := 7;
    SbGcVisMem3.Font.Size := 7;
    SbGcVisMem4.Font.Size := 7;
    SbGcVisMem5.Font.Size := 7;
    SbGcVisMem6.Font.Size := 7;
    SbGcVisMem7.Font.Size := 7;
    SbGcVisMem8.Font.Size := 7;
    SbGcVisMem9.Font.Size := 7;
    SbGcVisMem10.Font.Size := 7;
  end else begin
    SbGcVisMem1.Font.Size := 1;
    SbGcVisMem2.Font.Size := 1;
    SbGcVisMem3.Font.Size := 1;
    SbGcVisMem4.Font.Size := 1;
    SbGcVisMem5.Font.Size := 1;
    SbGcVisMem6.Font.Size := 1;
    SbGcVisMem7.Font.Size := 1;
    SbGcVisMem8.Font.Size := 1;
    SbGcVisMem9.Font.Size := 1;
    SbGcVisMem10.Font.Size := 1;
  end;
  TimerAddMemoryGC.Tag := TimerAddMemoryGC.Tag + 1;
  if TimerAddMemoryGC.Tag = 20 then StopSalvaVistaNelleMemorie;
end;

procedure TTabComunicazioniForm.SbGcVisMemAddClick(Sender: TObject);
begin
  inherited;
  if SbGcVisMemAdd.Down then begin
    StartSalvaVistaNelleMemorie;
  end else begin
    StopSalvaVistaNelleMemorie;
  end;
end;

procedure TTabComunicazioniForm.SbGcVisMemSetPredefClick(Sender: TObject);
begin
  inherited;
  if TSpeedButton(Sender).Down then begin
    StartSalvaVistaNelleMemorie;
  end else begin
    StopSalvaVistaNelleMemorie;
  end;
end;



procedure TTabComunicazioniForm.PageControlChange(Sender: TObject);
begin
  inherited;
  // Se siamo nella pagina delle comunicazioni automatiche effettua sempre la ricerca
  //  delle comunicazioni automatiche che così sono sempre aggiornate quando ci entro.
  if PageControl.ActivePage = TabComAuto then begin
    TrovaButtonClick(nil);
  // Altrimenti chiude la query
  end else begin
    QryComAuto.Close;
  end;
end;

procedure TTabComunicazioniForm.sms1Click(Sender: TObject);
begin
  inherited;
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    DM2.COM_CreaNuovaComunicazione('sms', ClientiForm.ID_ClienteCorrente, ClientiForm.ID_PraticaCorrente);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabComunicazioniForm.email1Click(Sender: TObject);
begin
  inherited;
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    DM2.COM_CreaNuovaComunicazione('e-mail', ClientiForm.ID_ClienteCorrente, ClientiForm.ID_PraticaCorrente);
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabComunicazioniForm.lettera1Click(Sender: TObject);
begin
  inherited;
  try
    DM1.ShowWait('Levante', 'Operazione in corso...');
    DM2.COM_CreaNuovaComunicazione('lettera', ClientiForm.ID_ClienteCorrente, ClientiForm.ID_PraticaCorrente);
  finally
    DM1.CloseWait;
  end;
end;




// Procedure che effettua l'invio cumulativo di tutte le comunicazioni automatiche selezionate
procedure TTabComunicazioniForm.InviaTutteLeComunicazioniAutomaticheSelezionate;
var
  i: Integer;
  GridRec: TcxCustomGridRecord;
  TipoMsg, Oggetto, Riferimento, Soggetto, TmpStr: String;
  // COntatori
  Counter_DaInviare,
  Counter_Corrente,
  Counter_Inviati,
  Counter_Inviati_Lettere,
  Counter_Inviati_Sms,
  Counter_Inviati_Email,
  Counter_NonInviati,
  Counter_Errori: Integer;
begin
  inherited;
  try
    DM1.ShowWait('Invio comunicazioni', 'Sto preparando l''operazione');
    // Inizializzazione
    Counter_DaInviare       := 0;
    Counter_Corrente        := 0;
    Counter_Inviati         := 0;
    Counter_Inviati_Lettere := 0;
    Counter_Inviati_Sms     := 0;
    Counter_Inviati_Email   := 0;
    Counter_NonInviati      := 0;
    Counter_Errori          := 0;
    // Determina quanti sono in totale i records selezionati per l'invio senza
    //  però considerare le GroupRows
    for i := 0 to btvComAuto.Controller.SelectedRecordCount -1 do if btvComAuto.Controller.SelectedRecords[i].IsData then inc(Counter_DaInviare);
    // Cicla per tutte le comunicazioni automatiche da inviare (quelle selezionate)
    for i := 0 to btvComAuto.Controller.SelectedRecordCount -1 do begin
      try
        // Record corrente
        GridRec := btvComAuto.Controller.SelectedRecords[i];
        // Ovviamente considera solo i record di dati reali (non le GroupRow)
        if not GridRec.IsData then Continue;
        // Aggiorna i contatori
        inc(Counter_Corrente);
        // Carica dati del record corrente
        TipoMsg           := GridRec.DisplayTexts[btvComAutoMSG_AMEZZO.Index];
        Oggetto           := GridRec.DisplayTexts[btvComAutoMSG_OGGETTO.Index];
        Soggetto          := GridRec.DisplayTexts[btvComAutoSOGG_RAGSOC.Index];
        Riferimento       := GridRec.DisplayTexts[btvComAutoRIF_DESCRIZIONE.Index];
        // Se manca qualcosa di necessario all'invio (l'indirizzo o in genera la destinazione) lo salta
        //  NB: Uso il campo calcolato COMPUTED_MANCAINDIRIZZOome flag di allarme che manca qualcosa
        if GridRec.Values[btvComAutoCOMPUTED_MANCAINDIRIZZO.Index] then begin
          // Aggiorna i contatori
          inc(Counter_NonInviati);
          // Prosegue con il prox. record
          Continue;
        end;
        // Informa l'utente
        DM1.ShowWait('Invio comunicazione ' + IntToStr(Counter_Corrente) + ' su ' + IntToStr(Counter_DaInviare) + '  (' + TipoMsg + ')',    'Oggetto: ' + Oggetto + #13#13'Rif.: ' + Riferimento + #13'Sogg.: ' + Soggetto);
        // Effettua la crezione e in modalità Silent e l'invio della comunicazione
        CreaNuovaComunicazioneFromGrid(GridRec.RecordIndex, True);
        // Aggiorna i contatori
        inc(Counter_Inviati);
        if      TipoMsg = 'sms' then inc(Counter_Inviati_Sms)
        else if TipoMsg = 'e-mail' then inc(Counter_Inviati_Email)
        else if TipoMsg = 'lettera' then inc(Counter_Inviati_Lettere);
      except
        // Aggiorna i contatori
        inc(Counter_Errori);
        inc(Counter_NonInviati);
        raise;
      end;
    end;
    // Aggiorna l'interrogazione
    DM1.ShowWait('', 'Caricamento...');
  finally
    DM1.CloseWait;
    // Riesegue l'interrogazione per aggiornare lo schermo dopo l'operazione
    EseguiQueryComAuto;
    // Rapporto finale
    if ComRapportoFinaleForm = nil then begin
      Application.CreateForm(TComRapportoFinaleForm, ComRapportoFinaleForm);
      ComRapportoFinaleForm.LabelInviate.Caption        := 'Comunicazioni inviate su ' + IntToStr(Counter_DaInviare);
      ComRapportoFinaleForm.LabelNumInviate.Caption     := IntToStr(Counter_Inviati);
      ComRapportoFinaleForm.LabelNumNonInviate.Caption  := IntToStr(Counter_NonInviati);
      ComRapportoFinaleForm.LabelNumErrori.Caption      := IntToStr(Counter_Errori);
      // Visualizza la form
      ComRapportoFinaleForm.ShowModal;
    end;
  end;
end;


procedure TTabComunicazioniForm.sbEsportaTuttoClick(Sender: TObject);
begin
  inherited;
  // Chiede conferma prima di eseguire
  if DM1.Messaggi('Levante', 'Inviare tutte le comunicazioni automatiche?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  try
    // Avvisa l'utente
    DM1.ShowWait('Invio comunicazioni', 'Sto preparando l''operazione');
    // Seleziona tutte le comunicazioni presenti nell'elenco
    btvComAuto.Controller.SelectAllRecords;
    // Esegue l'invio
    InviaTutteLeComunicazioniAutomaticheSelezionate;
  finally
    // Pulizie finali
    DM1.CloseWait;
  end;
end;



procedure TTabComunicazioniForm.sbEsportaRigheSelezionateClick(Sender: TObject);
begin
  inherited;
  // Chiede conferma prima di eseguire
  if DM1.Messaggi('Levante', 'Inviare le comunicazioni automatiche selezionate?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  // Esegue l'invio
  InviaTutteLeComunicazioniAutomaticheSelezionate;
end;


procedure TTabComunicazioniForm.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  // Carica il credito residuo degli SMS
  DM1.ShowWait('Levante', 'Accedo al server degli SMS...');
  try
    DM2.SMS_CreditoResiduoLabel(LabelSmsCreditoResiduoCom);
    LabelSmsCreditoResiduoComAuto.Caption := LabelSmsCreditoResiduoCom.Caption;
    LabelSmsCreditoResiduoComAuto.Font.Assign(LabelSmsCreditoResiduoCom.Font);
    TimerSmsCreditExpired.Enabled := True;
  finally
    DM1.CloseWait;
  end;
end;

procedure TTabComunicazioniForm.TimerSmsCreditExpiredTimer(
  Sender: TObject);
begin
  inherited;
  (Sender as TTimer).Enabled := False;
  LabelSmsCreditoResiduoCom.Caption       := '- - -';
  LabelSmsCreditoResiduoComAuto.Caption   := '- - -';
end;

procedure TTabComunicazioniForm.dxPrinterCustomDrawPageFooter(
  Sender: TObject; AReportLink: TBasedxReportLink; ACanvas: TCanvas;
  APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
  var ADefaultDrawText, ADefaultDrawBackground: Boolean);
begin
  inherited;
   // Richiama il gestore di feault
   DM1.dxPrinterDefaultDrawPageFooter(AReportLink, ACanvas, APageIndex, ARect, ANom, ADenom);
   // Stampa i totali solo sull'ultima pagina
   if (APageIndex + 1) = AReportLink.PageCount then begin
      // Prima di tutto resetta il sistema di stampa dei totali
      DM1.ResetPrintTotals;
      // IN base al ReportLink attuale (alla stampa attuale) stampa i totali corretti.
      if AReportLink.Name = 'GridComLink' then begin
         DM1.AddTotalSeparation(30, ANom, ADenom);
         DM1.AddPrintTotal(ACanvas, ARect, 'Comunicazioni', IntToStr(btvCom.DataController.FilteredRecordCount), False, 60, ANom, ADenom, TP_PAGE_FOOTER);
      end;
   end;
end;

procedure TTabComunicazioniForm.dxPrinterCustomDrawPageHeader(
  Sender: TObject; AReportLink: TBasedxReportLink; ACanvas: TCanvas;
  APageIndex: Integer; var ARect: TRect; ANom, ADenom: Integer;
  var ADefaultDrawText, ADefaultDrawBackground: Boolean);
begin
  inherited;
   // Richiama il gestore di feault
   DM1.dxPrinterDefaultDrawPageHeader(AReportLink, ACanvas, ARect, ANom, ADenom);
end;

procedure TTabComunicazioniForm.GridComLinkCustomDrawBandCell(
  Sender: TdxGridReportLink; ACanvas: TCanvas;
  AView: TcxGridBandedTableView; ABand: TcxGridBand;
  AnItem: TdxReportCellString; var ADone: Boolean);
var
  ARect: TRect;
  AFont: TFont;
  AText: String;
  AScale: Integer;
  RealCellHeight: Integer;
begin
  inherited;
  // Inizializzazione
  ADone := True;
  AScale := Sender.RealScaleFactor div 2;
  RealCellHeight := AnItem.BoundsRect.Bottom - AnItem.BoundsRect.Top;
  AFont := TFont.Create;
  try
    AFont.Assign(AnItem.Font);
    AFont.Name := 'Arial';
    AFont.Size := 8 * AScale;
    AFont.Style := [];
    AFont.Color := clBlue;
    AText := AnItem.Text;
    // Tracciamento sfondo e contorno
    ARect.Left    := AnItem.BoundsRect.Left;
    ARect.Right   := AnItem.BoundsRect.Right;
    ARect.Top     := AnItem.BoundsRect.Top;
    ARect.Bottom  := AnItem.BoundsRect.Bottom + RealCellHeight;  // Fa in modo che vada proprio fuori in modo da non disegnare il bordo inferiore
    Sender.DrawRoundRect(ACanvas, ARect, RealCellHeight, RealCellHeight, $00FFDFDF, $00FFDFDF, TdxPSSolidFillPattern, clBlue);
    // Tracciamento testo
    ARect.Left    := AnItem.BoundsRect.Left     + RealCellHeight;
    ARect.Top     := AnItem.BoundsRect.Top      + (1 * AScale);
    ARect.Right   := AnItem.BoundsRect.Right    - RealCellHeight;
    ARect.Bottom  := AnItem.BoundsRect.Bottom   - (1 * AScale);
    Sender.drawText(ACAnvas, ARect, 0, AText, AFont, $00FFDFDF, taCenterX, taCenterY, True, False, False);
  finally
    AFont.Free;
  end;
end;

procedure TTabComunicazioniForm.GridComLinkCustomDrawHeaderCell(
  Sender: TdxGridReportLink; ACanvas: TCanvas; AView: TcxGridTableView;
  AColumn: TcxGridColumn; AnItem: TdxReportCellString; var ADone: Boolean);
var
  AText: String;
  R: TRect;
  AFont: TFont;
  AScale: Integer;
begin
  inherited;
  // Inizializzazione
  ADone := True;
  AScale := Sender.RealScaleFactor div 2;
  AFont := TFont.Create;
  try
    AFont.Assign(AnItem.Font);
    AFont.Name := 'Arial';
    AFont.Size := 8 * AScale;
    AFont.Style := [];
    AFont.Color := clBlue;
    AText := AnItem.Text;
    // TESTO
    R.Left    := AnItem.BoundsRect.Left;
    R.Right   := AnItem.BoundsRect.Right;
    R.Top     := AnItem.BoundsRect.Top;
    R.Bottom  := AnItem.BoundsRect.Bottom;
    Sender.DrawRectangle(ACanvas, R, $00FFDFDF, $00FFDFDF, TdxPSSolidFillPattern, $00FFDFDF);
    Sender.drawText(ACAnvas, R, 0, AText, AFont, $00FFDFDF, taCenterX, taCenterY, True, False, False);
    // BORDO DX
    if (AColumn.Tag = 1) or (AColumn.IsRight) then begin
      R.Left   := AnItem.BoundsRect.Right;
      R.Top    := AnItem.BoundsRect.Top;
      R.Right  := AnItem.BoundsRect.Right;
      R.Bottom := AnItem.BoundsRect.Bottom;
      Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
    end;
    // BORDO SX
    if (AColumn.IsLeft) then begin
      R.Left   := AnItem.BoundsRect.Left;
      R.Top    := AnItem.BoundsRect.Top;
      R.Right  := AnItem.BoundsRect.Left;
      R.Bottom := AnItem.BoundsRect.Bottom;
      Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
    end;
    // BORDO INFERIORE
    R.Left   := AnItem.BoundsRect.Left;
    R.Top    := AnItem.BoundsRect.Bottom;
    R.Right  := AnItem.BoundsRect.Right;
    R.Bottom := AnItem.BoundsRect.Bottom;
    Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
    // BORDO SUPERIORE
    R.Left   := AnItem.BoundsRect.Left;
    R.Top    := AnItem.BoundsRect.Top;
    R.Right  := AnItem.BoundsRect.Right;
    R.Bottom := AnItem.BoundsRect.Top;
    Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
  finally
    AFont.Free;
  end;
end;

procedure TTabComunicazioniForm.GridComLinkCustomDrawCell(
  Sender: TdxGridReportLink; ACanvas: TCanvas;
  AView: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AColumn: TcxGridColumn; AnItem: TAbstractdxReportCellData;
  var ADone: Boolean);
const
  SFONDO_HIGHLIGHT = $00E6E6E6;
var
  AText, ATextPrecLevels: String;
  R: TRect;
  AFont: TFont;
  AmpiezzaArrotondamentoBordi: Integer;
  HorizontalAlign: TcxTextAlignX;
  AScale: Integer;
  LarghezzaTotaleTesto, LarghezzaTestoCurrLev, LarghezzaTestoPrecLev, AltezzaTotaleTesto: Integer;
  LocalColumn: TcxGridDBBandedColumn;
  CurrFieldName: String;
  ColoreSfondo: TColor;
  ImageIndex: integer;
  TmpInt: Integer;
begin
  inherited;

  if AView.IsDetail then Exit;

  // Inizializzazione
  ADone := True;
  AScale := Sender.RealScaleFactor div 2;
  AFont := TFont.Create;
  try
    // =========================================================================
    // Se è una cella normale (non un group header)
    // -------------------------------------------------------------------------
    if ARecord.IsData then begin
      // LocalColumn punta alla colonna corrente per comodità
      LocalColumn := AColumn as TcxGridDBBandedColumn;
      CurrFieldName := LocalColumn.DataBinding.FieldName;
      // Impostazione del Rectangle per la stampa del testo
      R.Left    := AnItem.BoundsRect.Left;
      R.Top     := AnItem.BoundsRect.Top;
      R.Right   := AnItem.BoundsRect.Right;
      R.Bottom  := AnItem.BoundsRect.Bottom;

      ColoreSfondo := clWhite;  // Provo così che forse è meglio perchè nelle icone non mi fa la trasparenza
      // Disegna il rettangolo di sfondo se il colore dello sfondo è <> dal bianco
      if ColoreSfondo <> clWhite then begin
        ACanvas.Brush.Color := ColoreSfondo;
        ACanvas.FillRect(R);
      end;

      // Se è la cella del flag che indica che c'è qualcosa che non và (quella con la mano)
      if (CurrFieldName = 'COMPUTED_ALERT')
      then begin
        if ARecord.Values[AColumn.Index] then begin
          R.Left   := R.Left + Round(((R.Right - R.Left - (DM2.ComunicazioniListOk.Width * AScale)) / 2));
          R.Left   := R.Left + AScale;
          R.Top    := R.Top + AScale;
          R.Right  := R.Left + Round(DM2.ComunicazioniListOk.Width * AScale);
          R.Bottom := R.Top  + Round(DM2.ComunicazioniListOk.Width * AScale);
          // RIcava l'indice dell'immagine da stampare
          ImageIndex := 1;
          // Stampa l'immagine
          if (ImageIndex <> -1)
          then Sender.DrawGraphic(ACanvas, R, R, DM2.ComunicazioniListOk, ImageIndex, nil, False, False, clWhite);
        end;
      // Se invece è la cella che indica di che tipo di messaggios i tratta...
      end else if (CurrFieldName = 'MSG_TYPE')
      then begin
        R.Left   := R.Left + Round(((R.Right - R.Left - (DM2.ComunicazioniListImages.Width * AScale)) / 2));
        R.Left   := R.Left + AScale;
        R.Top    := R.Top + AScale;
        R.Right  := R.Left + Round(DM2.ComunicazioniListImages.Width * AScale);
        R.Bottom := R.Top  + Round(DM2.ComunicazioniListImages.Width * AScale);
        // RIcava l'indice dell'immagine da stampare
        AText := ARecord.DisplayTexts[AColumn.Index];
        if      AText = 'lettera'  then ImageIndex := 0
        else if AText = 'e-mail'   then ImageIndex := 1
        else if AText = 'sms'      then ImageIndex := 2
        else Exit;
        // Stampa l'immagine
        if (ImageIndex <> -1)
        then Sender.DrawGraphic(ACanvas, R, R, DM2.ComunicazioniListImages, ImageIndex, nil, True, True, clWhite);
      // Se invece è una cella con un testo normale...
      end else begin
        // Ricava il font da usare
        AFont.Assign(AnItem.Font);
        // Se è sulla seconda riga lo stampa in secondo piano.
        if (LocalColumn.Position.RowIndex > 0) then begin
          AFont.Color := clGray;
          AFont.Style := [];
        // Se invece è sulla prima riga lo stampa normale
        end else begin
          AFont.Color := clBlack;
          AFont.Style := [fsBold];
        end;
        // VALORE CELLA
        // Determinazione dell'allineamento orizzontale da utilizzare
        if      AColumn.Properties.Alignment.Horz = taLeftJustify   then HorizontalAlign := taLeft
        else if AColumn.Properties.Alignment.Horz = taRightJustify  then HorizontalAlign := taRight
        else if AColumn.Properties.Alignment.Horz = taCenter        then HorizontalAlign := taCenterX;
        // Determinazione del testo da stampare
        // Se è il campo della data di creazione della comunicazione e ultima modifica
        if (CurrFieldName = 'DATAULTMOD_CREAZIONE') then begin
          AText := ' ' + ComponiTestoCreazioneUltMod(ARecord.Values[btvComDATAULTMOD_CREAZIONE.Index], ARecord.Values[btvComDATAULTMOD_GENERALE.Index]);
        // Se è il campo della data di primo e ultimo invio...
        end else if (CurrFieldName = 'PRIMOINVIO_DATAORA') then begin
          TmpInt := 0;
          if not VarIsNull(ARecord.Values[btvComNUMEROINVII.Index]) then TmpInt :=  ARecord.Values[btvComNUMEROINVII.Index];
          AText := ' ' + ComponiTestoInvii(TmpInt, ARecord.Values[btvComPRIMOINVIO_DATAORA.Index], ARecord.Values[btvComULTIMOINVIO_DATAORA.Index]);
        // Altrimenti se è qualunque altro campo...
        end else begin
          AText := ' ' + ARecord.DisplayTexts[AColumn.Index] + ' ';
        end;
        // Tracciamento del valore
        Sender.drawText(ACanvas, R, 0, AText, AFont, ColoreSfondo, HorizontalAlign, taCenterY, True, False, False);
      end;

      // BORDO DX
      if (AColumn.IsRight) then begin
         R.Left   := AnItem.BoundsRect.Right;
         R.Top    := AnItem.BoundsRect.Top;
         R.Right  := AnItem.BoundsRect.Right;
         R.Bottom := AnItem.BoundsRect.Bottom;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
      // BORDO SX
      if (AColumn.IsLeft) then begin
         R.Left   := AnItem.BoundsRect.Left;
         R.Top    := AnItem.BoundsRect.Top;
         R.Right  := AnItem.BoundsRect.Left;
         R.Bottom := AnItem.BoundsRect.Bottom;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
      // BORDO INFERIORE
      if (AColumn.IsBottom) then begin
         R.Left   := AnItem.BoundsRect.Left;
         R.Top    := AnItem.BoundsRect.Bottom; // - AScale;
         R.Right  := AnItem.BoundsRect.Right;
         R.Bottom := AnItem.BoundsRect.Bottom; // - AScale;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;
      // BORDO INFERIORE ULTIMO RECORD
      if (ARecord.IsLast) and (AColumn.IsBottom) then begin
         R.Left   := AnItem.BoundsRect.Left;
         R.Top    := AnItem.BoundsRect.Bottom - AScale;
         R.Right  := AnItem.BoundsRect.Right;
         R.Bottom := AnItem.BoundsRect.Bottom - AScale;
         Sender.DrawRectangle(ACanvas, R, clBlue, clWhite, TdxPSSolidFillPattern, clBlue);
      end;

    // =========================================================================
    // Se invece non è una cella normale ma è un GroupHeader
    // -------------------------------------------------------------------------
    end else begin

      // Inizializzazione
      AText := ARecord.DisplayTexts[AColumn.Index];
      ATextPrecLevels := GetPrintFooterTitle(ARecord, ARecord.Level, True);
      AmpiezzaArrotondamentoBordi := 10 * AScale;
      // Determinazione della larghezza totale del testo
      Self.Canvas.Font.Name := 'Arial';
      Self.Canvas.Font.Size := 8;
      Self.Canvas.Font.Style := GetGroupTextStyle(ARecord.Level);
      LarghezzaTestoCurrLev := Self.Canvas.TextWidth(AText) * AScale;
      AltezzaTotaleTesto    := Self.Canvas.TextHeight(AText) * AScale;
      Self.Canvas.Font.Size := 5;
      Self.Canvas.Font.Style := Self.Canvas.Font.Style + [fsItalic];
      LarghezzaTestoPrecLev := Self.Canvas.TextWidth(ATextPrecLevels) * AScale;
      // Fattore di correzione perchè altrimenti a volte tronca le ultime lettere e allora aggiungo il 10% alla lunghezza del testo
      if Trim(AText) <> '' then Inc(LarghezzaTestoCurrLev, Round(LarghezzaTestoCurrLev/10));
      if Trim(ATextPrecLevels) <> '' then Inc(LarghezzaTestoPrecLev, Round(LarghezzaTestoPrecLev/10));
      // Otteniamo la larghezza totale dei testi
      LarghezzaTotaleTesto := LarghezzaTestoCurrLev + LarghezzaTestoPrecLev;
      // Nel Caso sia il primo gruppo e non è espanso visualizza anche una linea orizzontale a tutta larghezza
      // Se è il primo livello e non è espanso traccia anche la linea orizzontale fino al margine destro
      if (ARecord.Level = 0) and ((not ARecord.Expanded) or (AView.GroupedItemCount > 1)) then begin
        R.Left    := AnItem.BoundsRect.Left;
        R.Top     := AnItem.BoundsRect.Bottom - Round((AltezzaTotaleTesto - (AScale * 2)) / 2) - (2 * AScale);
        R.Right   := AnItem.BoundsRect.Right;
        R.Bottom  := R.Top;
        Sender.DrawRectangle(ACanvas, R, clBlue, $00FFDFDF, TdxPSSolidFillPattern, clBlue);
      end;
      // Modifica del Bounds Rect per il posizionamento del frame
      R.Left    := AnItem.BoundsRect.Left;
      R.Top     := AnItem.BoundsRect.Bottom - AltezzaTotaleTesto - (AScale * 2);
      R.Right   := AnItem.BoundsRect.Left + LarghezzaTotaleTesto + (AmpiezzaArrotondamentoBordi * 2);
      R.Bottom  := AnItem.BoundsRect.Bottom;
      // Se l'ultimo livello fa sparire gli arrotondamenti inferiori
      if (ARecord.Level = (AView.GroupedItemCount -1)) and (ARecord.Expanded) then R.Bottom := R.Bottom + AltezzaTotaleTesto;
      // Traccia il contorno
      Sender.DrawRoundRect(ACanvas, R, AmpiezzaArrotondamentoBordi, AmpiezzaArrotondamentoBordi, $00FFDFDF, $00FFDFDF, TdxPSSolidFillPattern, clBlue);
      // Modifica del Bounds Rect per il posizionamento del Testo
      R.Left    := R.Left + AmpiezzaArrotondamentoBordi;
      R.Right   := R.Left + LarghezzaTestoCurrLev;
      R.Top     := R.Top + AScale;
      R.Bottom  := AnItem.BoundsRect.Bottom - AScale;
      AFont.Name  := 'Arial';
      AFont.Color := clBlue;
      AFont.Size  := 8 * AScale;
      AFont.Style := GetGroupTextStyle(ARecord.Level);
      Sender.drawText(aCanvas, R, 0, AText, AFont, $00FFDFDF, taLeft, taTop, True, False, False);
      R.Left    := R.Right;
      R.Right   := R.Left + LarghezzaTestoPrecLev + Round(AmpiezzaArrotondamentoBordi / 2);
      R.Top     := R.Top + Round(4 * AScale);
      AFont.Size  := 5 * AScale;
      AFont.Style := AFont.Style + [fsItalic];
      Sender.drawText(aCanvas, R, 0, ATextPrecLevels, AFont, $00FFDFDF, taRight, taTop, True, False, False);
      // Se l'ultimo livello traccia la linea inferiore
      if (ARecord.Level = (AView.GroupedItemCount -1)) and (ARecord.Expanded) then begin
        R.Left    := AnItem.BoundsRect.Left;
        R.Top     := AnItem.BoundsRect.Bottom;
        R.Right   := AnItem.BoundsRect.Right;
        R.Bottom  := AnItem.BoundsRect.Bottom;
        Sender.DrawRectangle(ACanvas, R, clBlue, $00FFDFDF, TdxPSSolidFillPattern, clBlue);
      end;

    // =========================================================================
    end;
  finally
    AFont.Free;
  end;
end;

function TTabComunicazioniForm.GetGroupTextStyle(ALevel: Integer): TFontStyles;
begin
  if ALevel = 0 then Result := [fsBold] else Result := [];
end;

function TTabComunicazioniForm.GetPrintFooterTitle(ARecord:TcxCustomGridRecord; InitialLevelIndex:Integer; SaltaUltimoLivello:Boolean=False): String;
var
  CurrentLevelIndex: Integer;
  FooterTitle: String;
  Row: TcxCustomGridRecord;
begin
  // Inizializzazione
  Result := '';
  // Se la funzione non deve ritornare nel testo il titolo del livello più alto
  if SaltaUltimoLivello then Dec(InitialLevelIndex);
  // ALl'inizio contiene lo stesso valore di InitialLevelIndex ma poi viene usato durante l'elaborazione
  //  per ciclare tra i livelli precedenti e comporre così il titolo completo con tutti i testi di tutti i gruppi
  //  di tutti i Livelli di gruppo ai quali il footer è relativo.
  //  NB: InitialLevelIndex contiene il LevelIndex del footer che si sta tracciando
  CurrentLevelIndex := InitialLevelIndex;
  // Row punta alla Row del Footer attuale, poi successivamente punterà
  //  alle Parent Row per risalire i titoli dei gruppi di livello precedenti.
  Row := ARecord;
  // Cicla finchè Row punta ad una Row Valida e cioè risale ogni GroupLevel finchè ce
  //  ne sono.
  while (Row <> nil) and (CurrentLevelIndex >= 0) do begin
    // Solo se la Row è relativa ad un Footer (not Row.IsData).
    if (not Row.IsData) and (Row.Level <= InitialLevelIndex) then begin
      // Compone il testo da ritornare aggiungendo il titolo del gruppo attuale.
      if FooterTitle <> ''
      then FooterTitle := Row.DisplayTexts[0]  + '; ' + FooterTitle
      else FooterTitle := Row.DisplayTexts[0];
      // Risale al livello precedente
      Dec(CurrentLevelIndex);
    end;
    // Risale alla PArentRow della Row Attuale.
    Row := Row.ParentRecord;
  end;
  // Compone il titolo da ritornale
  FooterTitle := Trim(FooterTitle);
  if FooterTitle <> '' then FooterTitle := '(' + FooterTitle + ')';
  Result := FooterTitle;
end;






procedure TTabComunicazioniForm.SBFilterRowClick(Sender: TObject);
begin
  inherited;
  // Attiva/Disattiva la Filter Row
  btvCom.FilterRow.Visible := (Sender as TSpeedButton).Down;
  if not btvCom.FilterRow.Visible then btvCom.DataController.Filter.Clear;
end;

end.



