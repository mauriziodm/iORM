unit SchedaArticoli1;

interface                                                                                                     

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, Mask, DBCtrls,
  Menus, DB, IBODataset,
  Buttons, IB_Components, bmpPanel, IB_Grid, MAURI_SB, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxGraphics, CheckLst, cxStyles,
  cxCustomData, cxEdit, cxDBData,
  cxTextEdit, cxCurrencyEdit, cxCheckBox, cxCalendar, cxTimeEdit, Variants,
  DataModule1, cxMemo, cxCheckComboBox, StrUtils, cxDropDownEdit, cxFilter,
  cxData, cxDataStorage, cxContainer, cxMaskEdit, ExtCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, dxCore, cxDateUtils, dxDateRanges, dxScrollbarAnnotations;

type
  TArticoliForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    QryArticoli: TIBOQuery;
    SourceArticoli: TDataSource;
    QryArticoliCODICEARTICOLO: TStringField;
    QryArticoliDESCRIZIONE: TStringField;
    QryArticoliUNITADIMISURA: TStringField;
    QryArticoliGIACENZA: TIBOFloatField;
    QryArticoliIMPEGNATO: TIBOFloatField;
    QryArticoliDISPONIBILE: TIBOFloatField;
    QryArticoliORDINATO: TIBOFloatField;
    QryArticoliPREZZODIVENDITA: TIBOFloatField;
    QryArticoliPREZZODIVENDITA2: TIBOFloatField;
    QryArticoliPREZZODIVENDITA3: TIBOFloatField;
    QryArticoliPREZZODIVENDITA4: TIBOFloatField;
    QryArticoliPRZVENDIVACOMP1: TIBOFloatField;
    QryArticoliPRZVENDIVACOMP2: TIBOFloatField;
    QryArticoliPRZVENDIVACOMP3: TIBOFloatField;
    QryArticoliPRZVENDIVACOMP4: TIBOFloatField;
    QryArticoliPUNTORIORDINO: TIBOFloatField;
    QryArticoliSCORTAMINIMA: TIBOFloatField;
    QryArticoliABILITAMOVMAG: TStringField;
    QryArticoliUBICAZIONE: TStringField;
    QryArticoliGRUPPO1: TStringField;
    QryArticoliGRUPPO2: TStringField;
    QryArticoliGRUPPO3: TStringField;
    QryArticoliARTICOLOCOMPOSTO: TStringField;
    MenuGriglia: TPopupMenu;
    Selezionavista1: TMenuItem;
    Salvalavistaattuale1: TMenuItem;
    Ripristinacolonneeliminate1: TMenuItem;
    QryArticoliULTIMOPRZACQUISTO: TIBOFloatField;
    QryArticoliGRUPPO4: TStringField;
    QryArticoliGRUPPO5: TStringField;
    QryArticoliGRUPPO6: TStringField;
    QryArticoliCODICIAGGIUNTIVI: TStringField;
    QryArticoliQUANTITAAUTOMATICA: TIBOFloatField;
    QryArticoliMARCA: TStringField;
    QryArticoliULTIMOCOSTOREALE: TIBOFloatField;
    QryArticoliIMPORTOULTIMOCOSTOREALE: TCurrencyField;
    ClientArea: TPanel;
    GridArt: TcxGrid;
    tvArt: TcxGridDBTableView;
    tvArtCODICEARTICOLO: TcxGridDBColumn;
    tvArtDESCRIZIONE: TcxGridDBColumn;
    tvArtMARCA: TcxGridDBColumn;
    tvArtUNITADIMISURA: TcxGridDBColumn;
    tvArtGIACENZA: TcxGridDBColumn;
    tvArtIMPEGNATO: TcxGridDBColumn;
    tvArtORDINATO: TcxGridDBColumn;
    tvArtDISPONIBILE: TcxGridDBColumn;
    tvArtPREZZODIVENDITA: TcxGridDBColumn;
    tvArtPREZZODIVENDITA2: TcxGridDBColumn;
    tvArtPREZZODIVENDITA3: TcxGridDBColumn;
    tvArtPREZZODIVENDITA4: TcxGridDBColumn;
    tvArtPRZVENDIVACOMP1: TcxGridDBColumn;
    tvArtPRZVENDIVACOMP2: TcxGridDBColumn;
    tvArtPRZVENDIVACOMP3: TcxGridDBColumn;
    tvArtPRZVENDIVACOMP4: TcxGridDBColumn;
    tvArtPUNTORIORDINO: TcxGridDBColumn;
    tvArtSCORTAMINIMA: TcxGridDBColumn;
    tvArtABILITAMOVMAG: TcxGridDBColumn;
    tvArtUBICAZIONE: TcxGridDBColumn;
    tvArtGRUPPO1: TcxGridDBColumn;
    tvArtGRUPPO2: TcxGridDBColumn;
    tvArtGRUPPO3: TcxGridDBColumn;
    tvArtGRUPPO4: TcxGridDBColumn;
    tvArtGRUPPO5: TcxGridDBColumn;
    tvArtGRUPPO6: TcxGridDBColumn;
    tvArtULTIMOPRZACQUISTO: TcxGridDBColumn;
    tvArtULTIMOCOSTOREALE: TcxGridDBColumn;
    tvArtIMPORTOULTIMOCOSTOREALE: TcxGridDBColumn;
    tvArtARTICOLOCOMPOSTO: TcxGridDBColumn;
    tvArtQUANTITAAUTOMATICA: TcxGridDBColumn;
    tvArtCODICIAGGIUNTIVI: TcxGridDBColumn;
    lvArt: TcxGridLevel;
    PanelFiltri: TPanel;
    Panel5: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    MenuArticoli: TPopupMenu;
    MIArticolo: TMenuItem;
    MIArticoloComposto: TMenuItem;
    QryArticoliPREZZODILISTINO: TIBOFloatField;
    QryArticoliSCONTODIACQUISTO: TIBOFloatField;
    QryArticoliSCONTODIACQUISTO2: TIBOFloatField;
    QryArticoliSCONTODIACQUISTO3: TIBOFloatField;
    QryArticoliCODICEFORNITORE: TStringField;
    tvArtPREZZODILISTINO: TcxGridDBColumn;
    tvArtSCONTODIACQUISTO: TcxGridDBColumn;
    tvArtSCONTODIACQUISTO2: TcxGridDBColumn;
    tvArtSCONTODIACQUISTO3: TcxGridDBColumn;
    tvArtCODICEFORNITORE: TcxGridDBColumn;
    SubPanelFiltri: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    BitBtnArtGruppo1: TSpeedButtonRollOver;
    BitBtnArtGruppo2: TSpeedButtonRollOver;
    BitBtnArtGruppo3: TSpeedButtonRollOver;
    Label40: TLabel;
    BitBtnArtCodiceMagazzino: TSpeedButtonRollOver;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    BitBtnArtGruppo4: TSpeedButtonRollOver;
    BitBtnArtGruppo5: TSpeedButtonRollOver;
    BitBtnArtGruppo6: TSpeedButtonRollOver;
    SBArtFilterOpenClose: TSpeedButtonRollOver;
    StaticText5: TStaticText;
    GruppiTitolo: TStaticText;
    StaticText19: TStaticText;
    EditArtCodice: TEdit;
    StaticText18: TStaticText;
    EditArtDescrizione: TEdit;
    StaticText21: TStaticText;
    EditArtMarca: TEdit;
    StaticText22: TStaticText;
    EditBarCode: TEdit;
    DescGruppo1: TEdit;
    DescGruppo2: TEdit;
    DescGruppo3: TEdit;
    CodiceGruppo1: TEdit;
    CodiceGruppo2: TEdit;
    CodiceGruppo3: TEdit;
    StaticText38: TStaticText;
    CodiceMagazzino: TEdit;
    DescrizioneMagazzino: TEdit;
    SoloGiacAttiva: TCheckListBox;
    StaticText10: TStaticText;
    EditArtUbicazione: TEdit;
    StaticText13: TStaticText;
    Composti: TCheckListBox;
    DescGruppo4: TEdit;
    DescGruppo5: TEdit;
    DescGruppo6: TEdit;
    CodiceGruppo4: TEdit;
    CodiceGruppo5: TEdit;
    CodiceGruppo6: TEdit;
    StaticText49: TStaticText;
    FilterArtTrova: TEdit;
    TransArtListForn: TIB_Transaction;
    QryArtListForn: TIBOQuery;
    QryArtListFornCODICEARTICOLO: TStringField;
    QryArtListFornCODICEFORNITORE: TIntegerField;
    QryArtListFornPREZZODIACQUISTO: TIBOFloatField;
    QryArtListFornCODICEARTICOLOFORNITORE: TStringField;
    QryArtListFornDESCRIZIONEFORNITORE: TStringField;
    QryArtListFornRAGIONESOCIALE: TStringField;
    QryArtListFornFORNITOREPREFERITO: TStringField;
    SourceArtListForn: TDataSource;
    SourceArtMag: TDataSource;
    QryArtMag: TIBOQuery;
    QryArtMagCODMAG: TIntegerField;
    QryArtMagDESCMAG: TStringField;
    QryArtMagGIACENZA: TIBOFloatField;
    QryArtMagIMPEGNATO: TIBOFloatField;
    QryArtMagORDINATO: TIBOFloatField;
    QryArtMagDISPONIBILE: TFloatField;
    TransArtMag: TIB_Transaction;
    TransArticoli: TIB_Transaction;
    lvLF: TcxGridLevel;
    lvArtMag: TcxGridLevel;
    tvLF: TcxGridDBTableView;
    tvArtMag: TcxGridDBTableView;
    tvLFCODICEARTICOLO: TcxGridDBColumn;
    tvLFCODICEFORNITORE: TcxGridDBColumn;
    tvLFPREZZODIACQUISTO: TcxGridDBColumn;
    tvLFCODICEARTICOLOFORNITORE: TcxGridDBColumn;
    tvLFDESCRIZIONEFORNITORE: TcxGridDBColumn;
    tvLFRAGIONESOCIALE: TcxGridDBColumn;
    tvLFPREFERITO: TcxGridDBColumn;
    tvArtMagCODMAG: TcxGridDBColumn;
    tvArtMagDESCMAG: TcxGridDBColumn;
    tvArtMagGIACENZA: TcxGridDBColumn;
    tvArtMagIMPEGNATO: TcxGridDBColumn;
    tvArtMagORDINATO: TcxGridDBColumn;
    tvArtMagDISPONIBILE: TcxGridDBColumn;
    QryArticoliDATAULTMOD_CREAZIONE: TDateTimeField;
    QryArticoliDATAULTMOD_GENERALE: TDateTimeField;
    QryArticoliDATAULTMOD_COSTO: TDateTimeField;
    QryArticoliDATAULTMOD_VENDITA: TDateTimeField;
    QryArticoliDATAULTMOD_LISTINO: TDateTimeField;
    tvArtDATAULTMOD_CREAZIONE: TcxGridDBColumn;
    tvArtDATAULTMOD_GENERALE: TcxGridDBColumn;
    tvArtDATAULTMOD_COSTO: TcxGridDBColumn;
    tvArtDATAULTMOD_VENDITA: TcxGridDBColumn;
    tvArtDATAULTMOD_LISTINO: TcxGridDBColumn;
    QryArtListFornPREZZODILISTINO: TIBOFloatField;
    QryArtListFornSCONTODIACQUISTO1: TIBOFloatField;
    QryArtListFornSCONTODIACQUISTO2: TIBOFloatField;
    QryArtListFornSCONTODIACQUISTO3: TIBOFloatField;
    tvLFPREZZODILISTINO: TcxGridDBColumn;
    tvLFSCONTODIACQUISTO1: TcxGridDBColumn;
    tvLFSCONTODIACQUISTO2: TcxGridDBColumn;
    tvLFSCONTODIACQUISTO3: TcxGridDBColumn;
    Label101: TLabel;
    EditArtDataMagazzino: TcxDateEdit;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    QryArticoliGC_GIACENZA: TIBOFloatField;
    tvArtGC_GIACENZA: TcxGridDBColumn;
    QryArticoliCATEGORIA1: TStringField;
    QryArticoliCATEGORIA2: TStringField;
    QryArticoliCATEGORIA3: TStringField;
    tvArtCATEGORIA1: TcxGridDBColumn;
    tvArtCATEGORIA2: TcxGridDBColumn;
    tvArtCATEGORIA3: TcxGridDBColumn;
    PanelCategorieArticoli: TPanel;
    LabelArtCategoria1: TStaticText;
    editArtCategoria1: TcxComboBox;
    LabelArtCategoria2: TStaticText;
    editArtCategoria2: TcxComboBox;
    LabelArtCategoria3: TStaticText;
    editArtCategoria3: TcxComboBox;
    procedure EseguiQueryArticoli;     // Personale
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure RxSpeedButtonResetQueryClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure Articolo1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CaricaMagazzinoDefaultArticoli;
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure BitBtnCodiceMagazzinoClick(Sender: TObject);
    procedure CodiceGruppo1Change(Sender: TObject);
    procedure CodiceGruppo2Change(Sender: TObject);
    procedure BitBtnArtGruppo2Click(Sender: TObject);
    procedure BitBtnArtGruppo3Click(Sender: TObject);
    procedure BitBtnArtGruppo1Click(Sender: TObject);
    procedure tvArtDblClick(Sender: TObject);
    procedure tvArtKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvArtCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvArtCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure RxSpeedButtonVisualizzaDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvArtDataControllerGroupingChanged(Sender: TObject);
    procedure tvArtDataControllerSortingChanged(Sender: TObject);
    procedure tvArtCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure SoloGiacAttivaClickCheck(Sender: TObject);
    procedure SoloGiacAttivaExit(Sender: TObject);
    procedure SoloGiacAttivaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditArtCodiceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CompostiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuArticoliPopup(Sender: TObject);
    procedure MIArticoloClick(Sender: TObject);
    procedure MIArticoloCompostoClick(Sender: TObject);
    procedure MenuGrigliaPopup(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure Salvalavistaattuale1Click(Sender: TObject);
    procedure Ripristinacolonneeliminate1Click(Sender: TObject);
    procedure tvArtCustomDrawPartBackground(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo;
      var ADone: Boolean);
    procedure SoloGiacAttivaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnArtGruppo4Click(Sender: TObject);
    procedure BitBtnArtGruppo5Click(Sender: TObject);
    procedure BitBtnArtGruppo6Click(Sender: TObject);
    procedure CodiceGruppo3Change(Sender: TObject);
    procedure CodiceGruppo4Change(Sender: TObject);
    procedure CodiceGruppo5Change(Sender: TObject);
    procedure QryArticoliCalcFields(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FilterArtTrovaKeyPress(Sender: TObject; var Key: Char);
    procedure tvArtSCONTODIACQUISTOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormResize(Sender: TObject);
    procedure PanelFiltriResize(Sender: TObject);
    procedure SBArtFilterOpenCloseClick(Sender: TObject);
    procedure QryArtMagCalcFields(DataSet: TDataSet);
    procedure tvLFCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvLFCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvLFCustomDrawPartBackground(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo;
      var ADone: Boolean);
    procedure tvArtMagGIACENZACustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure tvArtMagIMPEGNATOCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure tvArtMagORDINATOCustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure tvArtMagDISPONIBILECustomDrawFooterCell(
      Sender: TcxGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
    procedure tvArtMagCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvArtMagCustomDrawFooterCell(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvArtMagCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvArtMagCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure tvArtDataControllerDetailExpanded(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure tvArtDataControllerDetailExpanding(
      ADataController: TcxCustomDataController; ARecordIndex: Integer;
      var AAllow: Boolean);
    procedure tvLFDblClick(Sender: TObject);
    procedure tvLFEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvArtPREZZODILISTINOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure tvArtGC_GIACENZAGetDisplayTexttvLFPREZZODILISTINOGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvArtGC_GIACENZACustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure editArtCategoria1PropertiesInitPopup(Sender: TObject);
    procedure tvLFPREZZODILISTINOGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvLFCODICEARTICOLOFORNITOREGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
  private
    fTotaliArtMag_Giacenza: Double;
    fTotaliArtMag_Impegnato: Double;
    fTotaliArtMag_Ordinato: Double;
    fTotaliArtMag_Disponibile: Double;
    fPratCodice: Integer;
    fPratDataApertura: TDateTime;
    fArtFilter_Categoria2_Caption: String;
    fArtFilter_Categoria3_Caption: String;
    fArtFilter_Categoria1_Caption: String;
    FQta: Double;
    function GetDataFiltroRicerca: TDateTime;
    procedure RicalcolaDimensioni;
    procedure CalcolaLeftFiltriSubPanel(PanelFiltriMain: TPanel);
    procedure SetArtFilter_Categoria1_Caption(const Value: String);
    procedure SetArtFilter_Categoria2_Caption(const Value: String);
    procedure SetArtFilter_Categoria3_Caption(const Value: String);
    procedure CaricaFormLayout;
    { Private declarations }
  public
    { Public declarations }
    // Flag che indica se si deve Fare un INSERT un APPEND oppure un EDIT con l'articolo selezionato
    AddMode:TAddArtMode;
    // Proprietà che indicano il cantiere per il quale ritornare le giacence di cantiere
    property PratCodice:Integer read fPratCodice write fPratCodice;
    property PratDataApertura:TDateTime read fPratDataApertura write fPratDataApertura;
    // Proprietà che indica la Qtà da inserire nel documento una volta selezionato l'articolo voluto.
    //  NB: Ho aggiunto questa proprietà per risolvere un problema riscontrato da Tattini con l'uso del palmarino
    //       in pratica loro erano in una condizione di NON univocità dei codici a barre quindi gli capitava
    //       anche usando il palmarino che quando importava il documento del palmare stesso Levante
    //       trovasse più di un articolo per un dato codice quindi proponeva di scegliere tra quelli
    //       trovati, il problema è che in questa fase perdeva la Qtà impostata nel palmare.
    property Qta: Double read FQta write FQta;

    // =========================================================================
    // Proprietà per rendere visibili o meno alcuni filtri
    // -------------------------------------------------------------------------
    // Articoli
    property ArtFilter_Categoria1_Caption:String                  read fArtFilter_Categoria1_Caption                write SetArtFilter_Categoria1_Caption;
    property ArtFilter_Categoria2_Caption:String                  read fArtFilter_Categoria2_Caption                write SetArtFilter_Categoria2_Caption;
    property ArtFilter_Categoria3_Caption:String                  read fArtFilter_Categoria3_Caption                write SetArtFilter_Categoria3_Caption;
    // =========================================================================
  end;

var
  ArticoliForm: TArticoliForm;

implementation

uses main, FormAnagArt, 
  FormHelp, 
  FormConformita, FormAnagMaga, SchedaClienti, FormCondVend, FormGruppi,
  FormSostArt, SchedaPreventiviOrdini, FormImpegni, FormTabGC;

{$R *.DFM}

procedure TArticoliForm.CaricaMagazzinoDefaultArticoli;
var
   Qry: TIB_Cursor;
begin
   // Se è impostata la visualizzazione di tutti i magazzini per default...
   if DM1.TableProgressiviQRYARTTUTTIMAG.AsString = 'T' then begin
     CodiceMagazzino.Text       := '';
     DescrizioneMagazzino.Text  := '';
     Exit;
   end;
   // Se vuoto imposta il magazzino di ricerca
   if Trim(CodiceMagazzino.Text) = '' then begin
      CodiceMagazzino.Text := ' ' + DM1.MagazzinoDefault;
      // Preleva la descrizione del magazzino di default
      Qry := TIB_Cursor.Create(Self);
      try
         Qry.DatabaseName := DM1.ArcDBFile;
         Qry.IB_Connection := DM1.DBAzienda;
         Qry.SQL.Add('SELECT DESCRIZIONE FROM ANAGMAGA WHERE CODICE = ' + DM1.MagazzinoDefault);
         Qry.Open;
         if not Qry.Eof then DescrizioneMagazzino.Text := ' ' + Qry.FieldByName('DESCRIZIONE').AsString;
         Qry.Close;
      finally
         Qry.Free;
      end;
   end;
end;



{
procedure TArticoliForm.EseguiQueryArticoli;
var
   i:Integer;
   TmpStr: String;
   MagVisible: Boolean;
   DataMagazzino: TDateTime;
begin
   // IMposta il flag che indica se le colonne relative alle giacenze di magazzino
   //  sono visibili oppure no.
   MagVisible := (tvArtGIACENZA.Visible or tvArtIMPEGNATO.Visible or tvArtORDINATO.Visible or tvArtDISPONIBILE.Visible);
   // DataMagazzino contiene il parametro per considerare solo i documendi antecedenti alla data voluta
   //  come giacenza di magazzino. Serve per avere  ad esempio l'inventario ad una certa data.
   if DM1.ControllaDataStr(EditArtDataMagazzino.Text) then begin
     DataMagazzino := StrToDate(Trim(EditArtDataMagazzino.Text));             // DataMagazzino contiene la data del filtro
     if DM1.ControllaDataDocumentoSePrimaDellaChiusura(DataMagazzino) then begin
       DM1.Messaggi('Levante', 'La deve essere successiva al ' + DateToStr(DM1.GetUltimaChiusura), '', [mbOk], 0, nil);
       Exit;
     end;
   end;
   DataMagazzino := StartOfTheDay(IncDay(DataMagazzino, 1));                // Modifica il filtro in modo che la data sia il primo istante del giorno successivo a quello inserito nei filtri
   //---------------------------------------------
   // In base alle condizioni di filtraggio inserite dall'utente costruisce
   //  il testo dell'interrogazione SQL.
   //---------------------------------------------
   // Chiude la query, la azzera e inserisce le prime righe
   QryArticoli.Close;
   QryArticoli.SQL.Clear;
   QryArticoli.SQL.Add('SELECT A.CodiceArticolo, A.Descrizione, A.UnitaDiMisura, A.UltimoPrzAcquisto, A.ArticoloComposto,');
   QryArticoli.SQL.Add(' A.QuantitaAutomatica,');

   // Giacenza magazzini
   if MagVisible then begin
     QryArticoli.SQL.Add(' MA.GIACENZA,');
     QryArticoli.SQL.Add(' MA.IMPEGNATO,');
     QryArticoli.SQL.Add(' MA.ORDINATO,');
   end else begin
     QryArticoli.SQL.Add(' 0 AS GIACENZA,');
     QryArticoli.SQL.Add(' 0 AS IMPEGNATO,');
     QryArticoli.SQL.Add(' 0 AS ORDINATO,');
   end;

   QryArticoli.SQL.Add(' A.PrezzoDiVendita, A.PrezzoDiVendita2, A.PrezzoDiVendita3, A.PrezzoDiVendita4, A.PrzVendIVAComp1, A.PrzVendIVAComp2, A.PrzVendIVAComp3, A.PrzVendIVAComp4, A.PuntoRiordino, A.ScortaMinima, A.AbilitaMovMag, A.Ubicazione, A.CodiciAggiuntivi, A.Marca,');

   // Gruppi
   if tvArtGRUPPO1.Visible or (tvArtGRUPPO1.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=-1 AND Codice3=-1 AND Codice4=-1 AND Codice5=-1 AND Codice6=-1) || ''  ('' || A.CodiceGruppo1 || '')'' AS VARCHAR(70)) AS GRUPPO1,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(70)) AS GRUPPO1,');
   if tvArtGRUPPO2.Visible or (tvArtGRUPPO2.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=-1 AND Codice4=-1 AND Codice5=-1 AND Codice6=-1) || ''  ('' || A.CodiceGruppo2 || '')'' AS VARCHAR(70)) AS GRUPPO2,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(70)) AS GRUPPO2,');
   if tvArtGRUPPO3.Visible or (tvArtGRUPPO3.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND Codice4=-1 AND Codice5=-1 AND Codice6=-1) || ''  ('' || A.CodiceGruppo3 || '')'' AS VARCHAR(70)) AS GRUPPO3,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(70)) AS GRUPPO3,');
   if tvArtGRUPPO4.Visible or (tvArtGRUPPO4.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND Codice4=A.CodiceGruppo4 AND Codice5=-1 AND Codice6=-1) || ''  ('' || A.CodiceGruppo4 || '')'' AS VARCHAR(70)) AS GRUPPO4,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(70)) AS GRUPPO4,');
   if tvArtGRUPPO5.Visible or (tvArtGRUPPO5.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND Codice4=A.CodiceGruppo4 AND Codice5=A.CodiceGruppo5 AND Codice6=-1) || ''  ('' || A.CodiceGruppo5 || '')'' AS VARCHAR(70)) ');
     QryArticoli.SQL.Add('     AS GRUPPO5,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(70)) AS GRUPPO5,');
   if tvArtGRUPPO6.Visible or (tvArtGRUPPO6.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND Codice4=A.CodiceGruppo4 AND Codice5=A.CodiceGruppo5 AND Codice6=A.CodiceGruppo6) || ''  ('' || A.CodiceGruppo6 || '')'' ');
     QryArticoli.SQL.Add('     AS VARCHAR(70)) AS GRUPPO6,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(70)) AS GRUPPO6,');

   // Parte per il calcolo dell'ultimo prezzo acquisto articolo dinamico
   if tvArtULTIMOCOSTOREALE.Visible or tvArtIMPORTOULTIMOcostoreale.Visible then begin
     QryArticoli.SQL.Add(' COALESCE(');
     QryArticoli.SQL.Add('    (');
     QryArticoli.SQL.Add('      SELECT FIRST 1 R1.PREZZOUNITARIO');
     QryArticoli.SQL.Add('      FROM RIGHIPRV R1');
     QryArticoli.SQL.Add('      WHERE R1.CODICEARTICOLO = A.CODICEARTICOLO');
     // Nel caso in cui sia stata specificata una data alla quale vedere la giacenze, deve restituire
     //  l'ultimo prezzo di acuisto a quella data.
     if DM1.ControllaDataStr(EditArtDataMagazzino.Text) then begin
       QryArticoli.SQL.Add('      AND R1.DATADOCUMENTO < ''' + FormatDateTime('mm/dd/yyyy', DataMagazzino) + '''');
     end;
     QryArticoli.SQL.Add('      AND ' + DM1.CreaFiltroTipoDocPerUltimoPrezzoAcquisto);
     QryArticoli.SQL.Add('      ORDER BY R1.DATADOCUMENTO DESC, R1.NUMORDPREV DESC');
     QryArticoli.SQL.Add('    )');
     QryArticoli.SQL.Add(' , A.COSTOREALE) AS ULTIMOCOSTOREALE');
   end else QryArticoli.SQL.Add(' 0 AS ULTIMOCOSTOREALE');

   QryArticoli.SQL.Add('FROM Articoli A');

   // ==========================================================================
   //  JOIN CON LA VISTA PER IL CALCOLO DELLE GIACENZE DI MAGAZZINO
   // --------------------------------------------------------------------------
   if MagVisible then begin
     // Nel caso si sia richiesto di visualizzare le giacenze di un particolare magazzino
     //  e non di tutti i magazzini provvede a costruire la clausola where per filtrare solo
     //  quel magazzino.
     // NB: IMposta il filtro opportuno anche se viene specificato di vedere le giacenze
     //      ad una certa data specificata nel relativo filtro
     TmpStr := '';
     if Trim(CodiceMagazzino.Text) <> '' then begin
       if TmpStr <> '' then TmpStr := TmpStr + ' AND ';                         // Aggiunge l'AND se ci sono condizioni precedenti
       TmpStr := TmpStr + 'M.CODICEMAGAZZINO = ' + Trim(CodiceMagazzino.Text) + ' ';
     end;
     if DM1.ControllaDataStr(EditArtDataMagazzino.Text) then begin
       if TmpStr <> '' then TmpStr := TmpStr + ' AND ';                         // Aggiunge l'AND se ci sono condizioni precedenti
       TmpStr := TmpStr + 'M.DATADOCUMENTO < ''' + FormatDateTime('mm/dd/yyyy', DataMagazzino) + '''';
     end;
     // Se TmpStr non è vuota allora gli aggiunge il WHERE all'inizio
     if TmpStr <> '' then TmpStr := 'WHERE ' + TmpStr;
     // Poi imposta il JOIN stesso
     QryArticoli.SQL.Add('LEFT JOIN');
     QryArticoli.SQL.Add('(SELECT M.CODICEARTICOLO, SUM(M.GIACENZA) AS GIACENZA, SUM(M.ORDINATO) AS ORDINATO, SUM(M.IMPEGNATO) AS IMPEGNATO FROM MAG_ART AS M ' + TmpStr + ' GROUP BY M.CODICEARTICOLO)');
     QryArticoli.SQL.Add('AS MA ON (MA.CODICEARTICOLO = A.CODICEARTICOLO)');
   end;
   // ==========================================================================

   // Gli articoli con COdiceArticolo = '' non devono essere visibili
   DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEARTICOLO <> ''''');
   // In base al contenuto dei campi di filtraggio in fondo alla form costruisce
   //  le condizioni della query.
   if EditBarCode.Text <> ''        then DM1.AddSQL(QryArticoli, 'AND', 'A.BarCode = ''' + EditBarCode.Text + '''');

   // Se è specificato un codice articolo da ricercare, lo cerca in tutti i tipi di codice compresi quelli aggiuntivi
   //  NB: Nei codici aggiuntivi i codici sono considerati racchiusi tra '<Codice>' oppure '[Codice]', il tipo
   //       con le parentesi quadre serve perchè altrimenti non posso  importare nulla nel campo
   //       CodiciAggiuntivi perchè se uso i caratteri <> si incasina il sistema di importazione.
   if EditArtCodice.Text <> '' then begin
      DM1.AddSQL(QryArticoli, 'AND', '(A.CodiceArticolo LIKE ''' + EditArtCodice.Text + ''' OR A.BarCode LIKE  ''' + EditArtCodice.Text + ''' OR A.CodiceFornitore LIKE  ''' + EditArtCodice.Text +  ''' OR A.CodiciAggiuntivi LIKE  ''%<' + EditArtCodice.Text + '>%'' OR A.CodiciAggiuntivi LIKE  ''%[' + EditArtCodice.Text + ']%''');
      QryArticoli.SQL.Add('OR (SELECT COUNT(*) FROM LISTFORN LF WHERE LF.CODICEARTICOLO = A.CODICEARTICOLO AND LF.CODICEARTICOLOFORNITORE LIKE ''' + EditArtCodice.Text + ''') > 0');
      QryArticoli.SQL.Add(')');
   end;

   if EditArtDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.DESCRIZIONE', EditArtDescrizione.Text, True);
   if EditArtMarca.Text <> ''       then DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.MARCA', EditArtMarca.Text, True);
   if CodiceGruppo1.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO1 = ' + CodiceGruppo1.Text);
   if CodiceGruppo2.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO2 = ' + CodiceGruppo2.Text);
   if CodiceGruppo3.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO3 = ' + CodiceGruppo3.Text);
   if CodiceGruppo4.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO4 = ' + CodiceGruppo4.Text);
   if CodiceGruppo5.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO5 = ' + CodiceGruppo5.Text);
   if CodiceGruppo6.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO6 = ' + CodiceGruppo6.Text);
   if EditArtUbicazione.Text <> ''  then DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.UBICAZIONE', EditArtUbicazione.Text, True);

   // Se si è scelto di visualizzare solo gli articoli PREFERITI
   if SoloGiacAttiva.Checked[0] then DM1.AddSQL(QryArticoli, 'AND', 'A.PREFERITO <> ''F''');
   // Se si è scelto di visualizzare solo gli articoli già movimentati
   if SoloGiacAttiva.Checked[1] then DM1.AddSQL(QryArticoli, 'AND', '(SELECT COUNT(*) FROM RIGHIPRV R WHERE R.CODICEARTICOLO=A.CODICEARTICOLO AND   ((R.MAG_QTA IS NOT NULL AND R.MAG_QTA <> 0) OR (R.MAG_IMPEGNATO IS NOT NULL AND R.MAG_IMPEGNATO <> 0) OR (R.MAG_ORDINATO IS NOT NULL AND R.MAG_ORDINATO <> 0))) > 0');
   // Se si è scelto di visualizzare solo gli articoli con giacenza > 0
   if SoloGiacAttiva.Checked[2]     then DM1.AddSQL(QryArticoli, 'AND', 'MA.GIACENZA > 0');
   // Se si è scelto di visualizzare solo gli articoli sotto il punto di riordino
   if SoloGiacAttiva.Checked[3]     then DM1.AddSQL(QryArticoli, 'AND', 'MA.GIACENZA < A.PuntoRiordino');
   // Se si è scelto di visualizzare solo gli articoli sotto scorta
   if SoloGiacAttiva.Checked[4]     then DM1.AddSQL(QryArticoli, 'AND', 'MA.GIACENZA < A.ScortaMinima');

   // Se si è scelto di visualizzare solo gli articoli composti
   if Composti.Checked[0]       then DM1.AddSQL(QryArticoli, 'AND', 'A.ARTICOLOCOMPOSTO = ''T''');
   // Se si è scelto di visualizzare solo gli articoli NON composti
   if Composti.Checked[1]       then DM1.AddSQL(QryArticoli, 'AND', '(A.ARTICOLOCOMPOSTO <> ''T'' OR A.ARTICOLOCOMPOSTO IS NULL)');

   // Aggiunge alla query l'ORDER BY
   QryArticoli.SQL.Add(DM1.GeneraOrderBy(tvArt));

   // Attiva la Query
   QryArticoli.Open;
   // ========================================================================================================================
end;
}

function TArticoliForm.GetDataFiltroRicerca: TDateTime;
begin
  // Inizializzazione
  Result := StrToDate('01/01/2900');
  // Result contiene il parametro per considerare solo i documendi antecedenti alla data voluta
  //  come giacenza di magazzino. Serve per avere  ad esempio l'inventario ad una certa data.
  if DM1.ControllaDataStr(EditArtDataMagazzino.Text) then begin
    Result := StrToDate(Trim(EditArtDataMagazzino.Text));             // DataMagazzino contiene la data del filtro
  end;
end;

procedure TArticoliForm.EseguiQueryArticoli;
var
   i:Integer;
   TmpStr, Mag_CodMag, Mag_DataRichiesta: String;
   MagVisible: Boolean;
   DataMagazzino: TDateTime;
   RicercaPerCodice:Boolean;
   SubQueryGiacenza, SubQueryImpegnato, SubQueryOrdinato: String;
begin
   // Se è attivata la gestione degli articoli secondari di fornitori secondari
   //  abilita il Drag & Drop sulgli articoli secondari, altrimenti no
   if DM1.TableProgressiviDOCGESTARTFORNSECONDARI.AsString = 'T'
   then tvLF.DragMode := dmAutomatic
   else tvLF.DragMode := dmManual;
   // IMposta il flag che indica se l'interrogazione attuale è effettuale cercando un
   //  codice oppure no, questo perchè in caso di ricerca per codice modifica
   //  leggermente alcune parti della query per aumentarne la velocità.
   RicercaPerCodice := (Trim(EditArtCodice.Text)<>'') or (Trim(EditBarCode.Text)<>'');
   // IMposta il flag che indica se le colonne relative alle giacenze di magazzino
   //  sono visibili oppure no.
   MagVisible := (tvArtGIACENZA.Visible or tvArtIMPEGNATO.Visible or tvArtORDINATO.Visible or tvArtDISPONIBILE.Visible);
   // DataMagazzino contiene il parametro per considerare solo i documendi alla data voluta
   //  come giacenza di magazzino. Serve per avere  ad esempio l'inventario ad una certa data.
   DataMagazzino := GetDataFiltroRicerca;
   //---------------------------------------------
   // In base alle condizioni di filtraggio inserite dall'utente costruisce
   //  il testo dell'interrogazione SQL.
   //---------------------------------------------
   // Chiude la query, la azzera e inserisce le prime righe
   QryArticoli.Close;
   QryArticoli.SQL.Clear;
   QryArticoli.SQL.Add('SELECT');
   if RicercaPerCodice
     then QryArticoli.SQL.Add('DISTINCT(A.CODICEARTICOLO),')
     else QryArticoli.SQL.Add(' A.CODICEARTICOLO,');
   QryArticoli.SQL.Add(' A.Descrizione, A.UnitaDiMisura, A.UltimoPrzAcquisto, A.ArticoloComposto, A.QuantitaAutomatica,');

   // ========================================================================
   //  PARTE PER IL CALCOLO DELLE GIACENZE DI MAGAZZINO
   // ------------------------------------------------------------------------
   // Nel caso si sia richiesto di visualizzare le giacenze di un particolare magazzino
   //  e non di tutti i magazzini provvede a costruire la clausola where per filtrare solo
   //  quel magazzino.
   // NB: IMposta il filtro opportuno anche se viene specificato di vedere le giacenze
   //      ad una certa data specificata nel relativo filtro
   if Trim(CodiceMagazzino.Text) <> '' then Mag_CodMag := Trim(CodiceMagazzino.Text) else Mag_CodMag := 'NULL';
   if DM1.ControllaDataStr(EditArtDataMagazzino.Text) then Mag_DataRichiesta := QuotedStr(FormatDateTime('mm/dd/yyyy', DataMagazzino)) else Mag_DataRichiesta := 'NULL';
   // Se si sono chieste le giacenze solo per un magazzino specifico...
   if (Mag_CodMag <> 'NULL') then begin
     // Costruzione delle Subqueryes relative al magazzino su stringhe per comodità
     SubQueryGiacenza  := '(SELECT MAG.OUT_GIACENZA FROM MAG_GET_GIACENZE(A.CODICEARTICOLO,' + Mag_CodMag + ',' + Mag_DataRichiesta + ') MAG)';
     SubQueryImpegnato := '(SELECT MAG.OUT_IMPEGNATO FROM MAG_GET_GIACENZE(A.CODICEARTICOLO,' + Mag_CodMag + ',' + Mag_DataRichiesta + ') MAG)';
     SubQueryOrdinato  := '(SELECT MAG.OUT_ORDINATO FROM MAG_GET_GIACENZE(A.CODICEARTICOLO,' + Mag_CodMag + ',' + Mag_DataRichiesta + ') MAG)';
   // Se invece si vuole il totale delle giacenze di tutti i magazzini...     
   end else begin
     SubQueryGiacenza  := '(SELECT MAG.OUT_GIACENZA  FROM MAG_GET_GIACENZE_ALL(A.CODICEARTICOLO,' + Mag_DataRichiesta + ') MAG)';
     SubQueryImpegnato := '(SELECT MAG.OUT_IMPEGNATO FROM MAG_GET_GIACENZE_ALL(A.CODICEARTICOLO,' + Mag_DataRichiesta + ') MAG)';
     SubQueryOrdinato  := '(SELECT MAG.OUT_ORDINATO  FROM MAG_GET_GIACENZE_ALL(A.CODICEARTICOLO,' + Mag_DataRichiesta + ') MAG)';
   end;
   // Se il magazzino non è visibile ritorna sempre 0
   if MagVisible then begin
     // Imposta i campi del magazzino
     QryArticoli.SQL.Add(SubQueryGiacenza  + ' AS GIACENZA,');
     QryArticoli.SQL.Add(SubQueryImpegnato + ' AS IMPEGNATO,');
     QryArticoli.SQL.Add(SubQueryOrdinato  + ' AS ORDINATO,');
   end else begin
     QryArticoli.SQL.Add(' 0 AS GIACENZA,');
     QryArticoli.SQL.Add(' 0 AS IMPEGNATO,');
     QryArticoli.SQL.Add(' 0 AS ORDINATO,');
   end;
   // ========================================================================

   // ========================================================================
   //  PARTE PER IL CALCOLO DELLE GIACENZE DI CANTIERE
   // ------------------------------------------------------------------------
   // Ovviamente solo se è impostata una pratica altrimenti ritorna zero
   if fPratCodice <> 0
   then QryArticoli.SQL.Add(' (SELECT OUTVAR FROM GET_DA_MONTARE_ARTICOLO(A.CODICEARTICOLO,' + IntToStr(fPratCodice) + ',' + QuotedStr(FormatDateTime('mm/dd/yyyy',fPratDataApertura)) + ', ''TipoDoc'', 0, ''Reg'', ''01/01/1900'')) AS GC_GIACENZA,')
   else QryArticoli.SQL.Add('  CAST(NULL AS DECIMAL(10,4)) AS GC_GIACENZA,');
   // ========================================================================

   QryArticoli.SQL.Add(' A.PrezzoDiVendita, A.PrezzoDiVendita2, A.PrezzoDiVendita3, A.PrezzoDiVendita4, A.PrzVendIVAComp1, A.PrzVendIVAComp2, A.PrzVendIVAComp3, A.PrzVendIVAComp4, A.PuntoRiordino, A.ScortaMinima, A.AbilitaMovMag, A.Ubicazione, A.CodiciAggiuntivi, A.Marca,');

   // Gruppi
   if tvArtGRUPPO1.Visible or (tvArtGRUPPO1.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=-1 AND Codice3=-1 AND Codice4=-1 AND Codice5=-1 AND Codice6=-1) || ''  ('' || A.CodiceGruppo1 || '')'' AS VARCHAR(150)) AS GRUPPO1,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(150)) AS GRUPPO1,');
   if tvArtGRUPPO2.Visible or (tvArtGRUPPO2.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=-1 AND Codice4=-1 AND Codice5=-1 AND Codice6=-1) || ''  ('' || A.CodiceGruppo2 || '')'' AS VARCHAR(150)) AS GRUPPO2,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(150)) AS GRUPPO2,');
   if tvArtGRUPPO3.Visible or (tvArtGRUPPO3.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND Codice4=-1 AND Codice5=-1 AND Codice6=-1) || ''  ('' || A.CodiceGruppo3 || '')'' AS VARCHAR(150)) AS GRUPPO3,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(150)) AS GRUPPO3,');
   if tvArtGRUPPO4.Visible or (tvArtGRUPPO4.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND Codice4=A.CodiceGruppo4 AND Codice5=-1 AND Codice6=-1) || ''  ('' || A.CodiceGruppo4 || '')'' AS VARCHAR(150)) AS GRUPPO4,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(150)) AS GRUPPO4,');
   if tvArtGRUPPO5.Visible or (tvArtGRUPPO5.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND Codice4=A.CodiceGruppo4 AND Codice5=A.CodiceGruppo5 AND Codice6=-1) || ''  ('' || A.CodiceGruppo5 || '')'' AS VARCHAR(150)) ');
     QryArticoli.SQL.Add('     AS GRUPPO5,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(150)) AS GRUPPO5,');
   if tvArtGRUPPO6.Visible or (tvArtGRUPPO6.GroupIndex > -1) then begin
     QryArticoli.SQL.Add(' CAST((SELECT Descrizione FROM Gruppi WHERE Codice1=A.CodiceGruppo1 AND Codice2=A.CodiceGruppo2 AND Codice3=A.CodiceGruppo3 AND Codice4=A.CodiceGruppo4 AND Codice5=A.CodiceGruppo5 AND Codice6=A.CodiceGruppo6) || ''  ('' || A.CodiceGruppo6 || '')'' ');
     QryArticoli.SQL.Add('     AS VARCHAR(150)) AS GRUPPO6,');
   end else QryArticoli.SQL.Add(' CAST('''' AS VARCHAR(150)) AS GRUPPO6,');

   // ========================================================================
   //  PARTE PER IL CALCOLO DELL'ULTIMO PREZZO DI ACQUISTO DINAMICO
   // ------------------------------------------------------------------------
   if tvArtULTIMOCOSTOREALE.Visible or tvArtIMPORTOULTIMOcostoreale.Visible then begin
     QryArticoli.SQL.Add(' COALESCE(');
     QryArticoli.SQL.Add('    (');
     QryArticoli.SQL.Add('      SELECT FIRST 1 R1.PREZZOACQUISTOARTICOLO');
     QryArticoli.SQL.Add('      FROM RIGHIPRV R1');
     QryArticoli.SQL.Add('      WHERE R1.CODICEARTICOLO = A.CODICEARTICOLO');
     // Nel caso in cui sia stata specificata una data alla quale vedere la giacenze, deve restituire
     //  l'ultimo prezzo di acuisto a quella data.
     if DM1.ControllaDataStr(EditArtDataMagazzino.Text) then begin
       QryArticoli.SQL.Add('      AND R1.DATADOCUMENTO < ''' + FormatDateTime('mm/dd/yyyy', DataMagazzino) + '''');
     end;
     QryArticoli.SQL.Add('      AND ' + DM1.CreaFiltroTipoDocPerUltimoPrezzoAcquisto);
     QryArticoli.SQL.Add('      ORDER BY R1.DATADOCUMENTO DESC, R1.NUMORDPREV DESC');
     QryArticoli.SQL.Add('    )');
     QryArticoli.SQL.Add(' , A.COSTOREALE) AS ULTIMOCOSTOREALE,');
   end else QryArticoli.SQL.Add(' 0 AS ULTIMOCOSTOREALE,');
   // ========================================================================

   QryArticoli.SQL.Add(' A.PREZZODILISTINO, A.SCONTODIACQUISTO, A.SCONTODIACQUISTO2, A.SCONTODIACQUISTO3, A.CODICEFORNITORE,');
   QryArticoli.SQL.Add(' A.DATAULTMOD_CREAZIONE, A.DATAULTMOD_GENERALE, A.DATAULTMOD_COSTO, A.DATAULTMOD_VENDITA, A.DATAULTMOD_LISTINO,');
   QryArticoli.SQL.Add(' A.CATEGORIA1, A.CATEGORIA2, A.CATEGORIA3');

   QryArticoli.SQL.Add('FROM Articoli A');

   // Gli articoli con COdiceArticolo = '' non devono essere visibili
   DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEARTICOLO <> ''''');

   // In base al contenuto dei campi di filtraggio in fondo alla form costruisce
   //  le condizioni della query.
   if EditBarCode.Text <> ''        then DM1.AddSQL(QryArticoli, 'AND', 'A.BarCode = ''' + EditBarCode.Text + '''');

   // Se è specificato un codice articolo da ricercare, lo cerca in tutti i tipi di codice compresi quelli aggiuntivi
   //  NB: Nei codici aggiuntivi i codici sono considerati racchiusi tra '<Codice>' oppure '[Codice]', il tipo
   //       con le parentesi quadre serve perchè altrimenti non posso  importare nulla nel campo
   //       CodiciAggiuntivi perchè se uso i caratteri <> si incasina il sistema di importazione.
   if EditArtCodice.Text <> '' then begin
      TmpStr := '';
      // Se è abilitata la ricerca per codice principale
      if DM1.TableProgressiviRICART_CODICEPRINC.AsString <> 'F' then begin
        if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
        TmpStr := TmpStr + 'UPPER(A.CodiceArticolo) LIKE ''' + Uppercase(EditArtCodice.Text) + '''';
      end;
      // Se è abilitata la ricerca per Barcode
      if DM1.TableProgressiviRICART_BARCODE.AsString <> 'F' then begin
        if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
        TmpStr := TmpStr + 'UPPER(A.BarCode) LIKE ''' + Uppercase(EditArtCodice.Text) + '''';
      end;
      // Se è abilitata la ricerca per Codice articolo fornitore
      if DM1.TableProgressiviRICART_CODICEFORN.AsString <> 'F' then begin
        if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
        TmpStr := TmpStr + 'UPPER(A.CodiceFornitore) LIKE ''' + Uppercase(EditArtCodice.Text) + '''';
      end;
      // Se è abilitata la ricerca per Codici aggiuntivi
      if DM1.TableProgressiviRICART_CODAGG.AsString <> 'F' then begin
        if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
        TmpStr := TmpStr + '(UPPER(A.CodiciAggiuntivi) LIKE  ''%<' + Uppercase(EditArtCodice.Text) + '>%'' OR UPPER(A.CodiciAggiuntivi) LIKE  ''%[' + Uppercase(EditArtCodice.Text) + ']%'')';
      end;
      // Se è abilitata la ricerca per il sistema di gestione dei listini fornitori
      if DM1.TableProgressiviRICART_LISTFORN.AsString <> 'F' then begin
        if TmpStr <> '' then TmpStr := TmpStr + ' OR ';
        TmpStr := TmpStr + 'EXISTS (SELECT LF.CODICEARTICOLO FROM LISTFORN LF WHERE LF.CODICEARTICOLO = A.CODICEARTICOLO AND UPPER(LF.CODICEARTICOLOFORNITORE) LIKE ''' + Uppercase(EditArtCodice.Text) + ''')';
      end;
      // Se la TmpStr contiene qualcosa aggiunge la ricerca alla query
      if TmpStr <> '' then QryArticoli.SQL.Add('AND (' + TmpStr + ')');
   end;

   if EditArtDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.DESCRIZIONE', EditArtDescrizione.Text, True);
   if EditArtMarca.Text <> ''       then DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.MARCA', EditArtMarca.Text, True);
   if CodiceGruppo1.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO1 = ' + CodiceGruppo1.Text);
   if CodiceGruppo2.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO2 = ' + CodiceGruppo2.Text);
   if CodiceGruppo3.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO3 = ' + CodiceGruppo3.Text);
   if CodiceGruppo4.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO4 = ' + CodiceGruppo4.Text);
   if CodiceGruppo5.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO5 = ' + CodiceGruppo5.Text);
   if CodiceGruppo6.Text <>  ''     then DM1.AddSQL(QryArticoli, 'AND', 'A.CODICEGRUPPO6 = ' + CodiceGruppo6.Text);
   if editArtCategoria1.Text <>  '' then DM1.AddSQL(QryArticoli, 'AND', 'A.CATEGORIA1 = ' + QuotedStr(editArtCategoria1.Text));
   if editArtCategoria2.Text <>  '' then DM1.AddSQL(QryArticoli, 'AND', 'A.CATEGORIA2 = ' + QuotedStr(editArtCategoria2.Text));
   if editArtCategoria3.Text <>  '' then DM1.AddSQL(QryArticoli, 'AND', 'A.CATEGORIA3 = ' + QuotedStr(editArtCategoria3.Text));
   if EditArtUbicazione.Text <> ''  then DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.UBICAZIONE', EditArtUbicazione.Text, True);

   // Se si è scelto di visualizzare solo gli articoli PREFERITI
   if SoloGiacAttiva.Checked[0] then DM1.AddSQL(QryArticoli, 'AND', 'A.PREFERITO <> ''F''');
   // Se si è scelto di visualizzare solo gli articoli già movimentati
   if SoloGiacAttiva.Checked[1] then DM1.AddSQL(QryArticoli, 'AND', '(SELECT COUNT(*) FROM RIGHIPRV R WHERE R.CODICEARTICOLO=A.CODICEARTICOLO AND (R.COMPUTED_MAG_QTA <> 0 OR R.COMPUTED_MAG_IMP <> 0 OR R.COMPUTED_MAG_ORD <> 0)) > 0');
   // Se si è scelto di visualizzare solo gli articoli con giacenza > 0
   if SoloGiacAttiva.Checked[2]     then DM1.AddSQL(QryArticoli, 'AND', SubQueryGiacenza+' > 0');
   // Se si è scelto di visualizzare solo gli articoli sotto il punto di riordino
   if SoloGiacAttiva.Checked[3]     then DM1.AddSQL(QryArticoli, 'AND', SubQueryGiacenza+' < A.PuntoRiordino');
   // Se si è scelto di visualizzare solo gli articoli sotto scorta
   if SoloGiacAttiva.Checked[4]     then DM1.AddSQL(QryArticoli, 'AND', SubQueryGiacenza+' < A.ScortaMinima');

   // Se si è scelto di visualizzare solo gli articoli composti
   if Composti.Checked[0]       then DM1.AddSQL(QryArticoli, 'AND', 'A.ARTICOLOCOMPOSTO = ''T''');
   // Se si è scelto di visualizzare solo gli articoli NON composti
   if Composti.Checked[1]       then DM1.AddSQL(QryArticoli, 'AND', '(A.ARTICOLOCOMPOSTO <> ''T'' OR A.ARTICOLOCOMPOSTO IS NULL)');

   // Aggiunge la ricerca con campo TROVA
   if Trim(FilterArtTrova.Text) <> '' then begin
     DM1.AddSQL(QryArticoli, 'AND', '(');
     DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.CODICEARTICOLO', FilterArtTrova.Text, False);
     QryArticoli.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.BARCODE', FilterArtTrova.Text, False);
     QryArticoli.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.DESCRIZIONE', FilterArtTrova.Text, False);
     QryArticoli.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.MARCA', FilterArtTrova.Text, False);
     QryArticoli.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.CODICEFORNITORE', FilterArtTrova.Text, False);
     QryArticoli.SQL.Add('OR');
     DM1.AggiungiRicercaCampo(QryArticoli.SQL, 'A.CODICIAGGIUNTIVI', FilterArtTrova.Text, False);
     QryArticoli.SQL.Add(')');
   end;

   // Se è stata specificata una restrizione nel'accesso alle risorse
   //  dell'agenda per utente la applica
   if DM1.LimitazioniArticoliPerUtente <> '' then begin
     DM1.AddSQL(QryArticoli, 'AND', '(' + DM1.LimitazioniArticoliPerUtente + ')');
   end;

   // Aggiunge alla query l'ORDER BY
   QryArticoli.SQL.Add(DM1.GeneraOrderBy(tvArt));

   // Attiva la Query
   QryArticoli.Open;
   // Si posizione all'inizio
   tvArt.DataController.GotoFirst;
end;



procedure TArticoliForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     close;
end;

procedure TArticoliForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
   MessageBeep(0);
   tvArt.Controller.DeleteSelection;
end;


procedure TArticoliForm.FormCreate(Sender: TObject);
begin
   // Inizializzazione
   fPratCodice := 0;
   fPratDataApertura := 0;
   FQta := 0;
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Schedario articoli)';
   // Ricalcola le dimensioni dei pannelli
   RicalcolaDimensioni;
   // IMpostazione dell'altezza automatica articoli nel relativo elenco
   if not MainForm.ModoAssistenzeRDP then
     tvArt.OptionsView.CellAutoHeight := ClientiForm.tvArt.OptionsView.CellAutoHeight;
   // Impostazione il pannello dei filtri aperto di default
   ClientiForm.OpenFilterPanel(PanelFiltri, SBArtFilterOpenClose, False);
end;

procedure TArticoliForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.ShowWait('Levante', 'Attendere...');
   try
     EseguiQueryArticoli;
     GridArt.SetFocus;
   finally
      DM1.CloseWait;
   end;
end;

procedure TArticoliForm.RxSpeedButtonResetQueryClick(Sender: TObject);
begin
   FilterArtTrova.Text       := '';
   EditBarCode.Text          := '';
   EditArtCodice.Text        := '';
   EditArtDescrizione.Text   := '';
   EditArtMarca.Text         := '';
   CodiceGruppo1.Text        := '';
   CodiceGruppo2.Text        := '';
   CodiceGruppo3.Text        := '';
   DescGruppo1.Text          := '';
   DescGruppo2.Text          := '';
   DescGruppo3.Text          := '';
   CodiceMagazzino.Text      := '';
   DescrizioneMagazzino.Text := '';
   EditArtUbicazione.Text    := '';
   EditArtDataMagazzino.EditText := '';
   SoloGiacAttiva.Checked[0] := DM1.DefaultVisualizzaSoloArticoliPreferiti;
   SoloGiacAttiva.Checked[1] := False;
   SoloGiacAttiva.Checked[2] := False;
   SoloGiacAttiva.Checked[3] := False;
   SoloGiacAttiva.Checked[4] := False;
   Composti.Checked[0]       := False;
   Composti.Checked[1]       := False;
   editArtCategoria1.Text    := '';
   editArtCategoria2.Text    := '';
   editArtCategoria3.Text    := '';
   // Ripristina il magazzino di default
   CaricaMagazzinoDefaultArticoli;
end;

procedure TArticoliForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
     // Se siamo su un record valido
     if (tvArt.Controller.FocusedRecord = nil) or (not tvArt.Controller.FocusedRecord.IsData) then Exit;
     DM1.Attendere;
     try
       if DM1.ModCtrl(MOD_ARTICOLI) > 0 then begin
          // Se è un articolo composto e siamo dentro un documento aperto,
          //  evita di aprire l'articolo altrimenti darebbe problemi dovuti al
          //  fatto che la PreventiviOrdiniForm è già esistente (il documento) e viene usata
          //  anche nella Distinta base.
          if (QryArticoliARTICOLOCOMPOSTO.AsString = 'T') and (Assigned(PreventiviOrdiniForm)) then begin
            DM1.Messaggi('Levante', 'Non è possibile visualizzare la scheda di un articolo composto da dentro un documento.', '', [mbOk], 0, nil);
            Exit;
          end;
          // Crea la form dell'anagrafica articolo
          Application.CreateForm(TAnagArtForm, AnagArtForm);
          // La riga sottostante è stata sostituita con la successiva per risolvere l'errore
          //  che dava il programma quando girava su Win95/98/ME (Questo programma ha eseguito una operazione non valida...)
          //  Il problema lo dava solo quando assegnavo la proprietà Parent della form AnagArtForm.
          //  con le altre form andava bene.
          //  NB: 06/03/2020 - sostituito con MainForm.SetParentComponent(...)
  //        AnagArtForm.Parent := MainForm;
//          MainForm.FormSetParentPlatformDependent(AnagArtForm, MainForm);
          MainForm.SetParentComponent(AnagArtForm);
          AnagArtForm.CodiceArticolo := QryArticoli.FieldByName('CODICEARTICOLO').AsString;
          AnagArtForm.Tag := 1;
          AnagArtForm.Show;
       end;
     finally
       DM1.ChiudiAttendere;
     end;
end;

procedure TArticoliForm.RxSpeedButtonNuovoClick(Sender: TObject);
var
   ClientPoint, ScreenPoint: TPoint;
begin
   // Esegue la conversione delle coordinate dove dovrà apparire il menù
   //  da coordinate client della finestra a coordinate assolute dello schermo.
   //  (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
   ClientPoint.X := ClientTopPanel.Left + RxSpeedButtonNuovo.Left + POPUP_X_OFFSET;
   ClientPoint.Y := RxSpeedButtonNuovo.Top + POPUP_Y_OFFSET;
   ScreenPoint   := ClientToScreen(ClientPoint);
   MenuArticoli.Popup(ScreenPoint.X, ScreenPoint.Y);
end;

procedure TArticoliForm.Articolo1Click(Sender: TObject);
begin
   RxSpeedButtonNuovoClick(Self);
end;

procedure TArticoliForm.FormShow(Sender: TObject);
begin
   CaricaMagazzinoDefaultArticoli;
   DM1.FocusRefresh;
   // Caricamento delle impostazioni di visualizzazione delle griglie
   DM1.RipristinaDevExpress(GridArt, '', False);
   // Se è stata impostata una pratica rende visibile la colonna
   //  con la giacenza di cantiere/impianto
   tvArtGC_GIACENZA.Visible := (fPratCodice <> 0);
   // Se la query non è attiva e il filtro del CodiceArticolo <> '' significa che
   //  la form è stata richiamata perchè sono stati trovati più di un articolo
   //  da una precedente ricerca nel documento e quindi questa schermata viene
   //  richiamata per poter scegliere tra quelli trivati.
   if (not QryArticoli.Active) and ((EditArtCodice.Text <> '') or (EditArtDescrizione.Text <> '')) then RxSpeedButtonTrovaClick(Self)
   // Se invece la query non è attiva, azzera i filtri e e effettua la ricerca automaticamente
   else if (not QryArticoli.Active) then begin
     RxSpeedButtonResetQueryClick(Self);
     if DM1.GoAutoquery(IDX_AUTOQUERY_ARTICOLI) then RxSpeedButtonTrovaClick(Self);
   end;
   // In base alla proprietà Tag della form viene individuatase la form è stata richiamata
   //  dal menù 'Archivi' oppure dall'interno di documento per la selezione di articoli da inserire nel
   //  documento stesso; nel primo caso il focus và automaticamente al filtro del codice a barre, nel secondo caso
   //  invece và alla griglia
   if Tag > 0 then GridArt.SetFocus else EditBarCode.SetFocus;

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   RxSpeedButtonVisualizza.Enabled :=  not MainForm.IsLevanteLight;
   if DM1.ModCtrl(MOD_ARTICOLI) > 1 then begin
      RxSpeedButtonNuovo.Enabled := True and not MainForm.IsLevanteLight;
      RxSpeedButtonElimina.Enabled := True and not MainForm.IsLevanteLight;
   end else begin
      RxSpeedButtonNuovo.Enabled := False;
      RxSpeedButtonElimina.Enabled := False;
   end;

   // Carica il layout della form
   CaricaFormLayout;
end;

procedure TArticoliForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      case key of

         // ESC
         27 : begin
            if RxSpeedButtonUscita.Enabled then begin
               RxSpeedButtonUscitaClick(Self);
            end;
         end;

         // F3 = Nuovo
         114: begin
            if RxSpeedButtonNuovo.Enabled then begin
               RxSpeedButtonNuovoClick(Self);
            end;
         end;

         // F4 = Elimina
         115: begin
            if RxSpeedButtonElimina.Enabled then begin
               RxSpeedButtonEliminaClick(Self);
            end;
         end;

         // F5 = Trova
         116: begin
            if RxSpeedButtonTrova.Enabled then begin
               RxSpeedButtonTrovaClick(Self);
            end;
         end;

         // F6 = Azzera condizioni ricerca
         117: begin
            if RxSpeedButtonResetQuery.Enabled then begin
               RxSpeedButtonResetQueryClick(Self);
            end;
         end;

         // F10 = Visualizza
         121: begin
            if RxSpeedButtonVisualizza.Enabled then begin
               RxSpeedButtonVisualizzaClick(Self);
            end;
         end;

         // F11
         122: begin
           if (ssShift in Shift)
             then SBArtFilterOpenCloseClick(SBArtFilterOpenClose)
           else if FilterArtTrova.Visible and FilterArtTrova.Enabled
             then FilterArtTrova.SetFocus;
         end;
      end;
end;

procedure TArticoliForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TArticoliForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('ARTICOLI');
end;

procedure TArticoliForm.BitBtnCodiceMagazzinoClick(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TAnagMagaForm, AnagMagaForm);
      MainForm.SetParentComponent(AnagMagaForm);
      AnagMagaForm.Tag := 995;   // Abilita la seleziona dell'aliquota IVA
      AnagMagaForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TArticoliForm.CodiceGruppo1Change(Sender: TObject);
begin
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo1.Text) = '' then begin
      CodiceGruppo2.Text  := '';
      DescGruppo2.Text    := '';
      CodiceGruppo2.Color := GruppiTitolo.Color;
      DescGruppo2.Color   := GruppiTitolo.Color;
      CodiceGruppo2.TabStop := False;
      BitBtnArtGruppo2.Enabled := False;
   end else begin
      CodiceGruppo2.Color := CodiceGruppo1.Color;
      DescGruppo2.Color   := CodiceGruppo1.Color;
      CodiceGruppo2.TabStop := True;
      BitBtnArtGruppo2.Enabled := True;
   end;
end;

procedure TArticoliForm.CodiceGruppo2Change(Sender: TObject);
begin
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo2.Text) = '' then begin
      CodiceGruppo3.Text  := '';
      DescGruppo3.Text    := '';
      CodiceGruppo3.Color := GruppiTitolo.Color;
      DescGruppo3.Color   := GruppiTitolo.Color;
      CodiceGruppo3.TabStop := False;
      BitBtnArtGruppo3.Enabled := False;
   end else begin
      CodiceGruppo3.Color := CodiceGruppo1.Color;
      DescGruppo3.Color   := CodiceGruppo1.Color;
      CodiceGruppo3.TabStop := True;
      BitBtnArtGruppo3.Enabled := True;
   end;
end;

procedure TArticoliForm.BitBtnArtGruppo2Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      MainForm.SetParentComponent(GruppiForm);
      GruppiForm.Tag := 994;   // Abilita la selezione
      GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
      GruppiForm.LivelloAttivo := 2;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TArticoliForm.BitBtnArtGruppo3Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      MainForm.SetParentComponent(GruppiForm);
      GruppiForm.Tag := 994;   // Abilita la selezione
      GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
      GruppiForm.Selezionato2  := StrToInt(CodiceGruppo2.Text);
      GruppiForm.LivelloAttivo := 3;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TArticoliForm.BitBtnArtGruppo1Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      MainForm.SetParentComponent(GruppiForm);
      GruppiForm.Tag := 994;   // Abilita la selezione
      GruppiForm.LivelloAttivo := 1;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TArticoliForm.tvArtDblClick(Sender: TObject);
var
   SelRec, i:Longint;
begin
   // Se non c'è alcun rigo selezionato non fa nulla
   if (tvArt.Controller.SelectedRecordCount = 0) or (tvArt.Controller.FocusedRecord = nil) or (not tvArt.Controller.FocusedRecord.IsData) then exit;
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: DOCUMENTO FISCALE (FormPreventiviOrdini)
      999: begin
              // SelRec contiene il numeero di records selezionati
              SelRec := tvArt.Controller.SelectedRecordCount;
              // Inserisce il nuovo rigo nel documento.
              PreventiviOrdiniForm.GridCorpo.BeginUpdate;
              try
                // Cicla per tutti i righi selezionati
                for i := 0 to SelRec-1 do
                begin
                  PreventiviOrdiniForm.InserisciNuovoRigoDocumento(
                    tvArt.Controller.SelectedRecords[i].Values[tvArt.GetColumnByFieldName('CODICEARTICOLO').Index],
                    '',
                    PreventiviOrdiniForm.QryDocumentoCodiceMagazzino.AsString,
                    AddMode,
                    FQta,
                    False);
                end;
                // ----- OLD CODE ----- (Mauri 03/02/2021 per problema Deltacom)
                // Cicla per tutti i righi selezionati
//                for i := 0 to SelRec-1 do
//                begin
//                   // Si sposta sul rigo e lo inserisce nella tabella TmpRighi
//                   tvArt.Controller.SelectedRecords[i].Focused := True;
//                   PreventiviOrdiniForm.InserisciNuovoRigoDocumento(
//                     tvArt.Controller.FocusedRow.Values[tvArt.GetColumnByFieldName('CODICEARTICOLO').Index],
//                     '',
//                     PreventiviOrdiniForm.QryDocumentoCodiceMagazzino.AsString,
//                     AddMode,
//                     0,
//                     False);
//                end;
                // ----- OLD CODE ----- (Mauri 03/02/2021 per problema Deltacom)
                // Se abilitato e necessario ricalcola i totali del documento
                PreventiviOrdiniForm.CalcolaTotali(False);
              finally
                PreventiviOrdiniForm.GridCorpo.EndUpdate;
              end;
              // Torna al documento
              Close;
              PreventiviOrdiniForm.AddArt.SetFocus;
           end;
      // Form chiamante: DICHIARAZIONE DI CONFORMITA' (FormPreventiviOrdini)
      998: begin
              // SelRec contiene il numeero di records selezionati
              SelRec := tvArt.Controller.SelectedRecordCount;
              // Cicla per tutti i righi selezionati
              for i := 0 to SelRec-1 do begin
                 // Si sposta sul rigo e lo inserisce nella tabella TmpRighi
                 tvArt.Controller.SelectedRecords[i].Focused := True;
                 // Inserisce il nuovo rigo nel documento.
                 ConformitaForm.InserisciNuovoRigo(tvArt.Controller.FocusedRow.Values[tvArt.GetColumnByFieldName('CODICEARTICOLO').Index],
                                                   '',
                                                   1,
                                                   (ConformitaForm.RxSpeedButtonNuovo.Tag = 1));
              end;
              // Torna al documento
              Close;
              ConformitaForm.GridRT.SetFocus;
           end;
      // Form chiamante: GIORNALE DI MAGAZZINO' (FormClienti)
      997: begin
              // Inserisce il nuovo rigo nel documento.
              ClientiForm.GMCodiceArticolo.Text      := ' ' + QryArticoli.FieldByName('CodiceArticolo').AsString;
              Close;
              ClientiForm.GMCodiceArticolo.SetFocus;
           end;
      // Form chiamante: ANAGRAFICA CONDIZIONI DI VENDITA
      996: begin
              // Inserisce il nuovo rigo nel documento.
              CondVendForm.CodiceArticolo.Field.Value := QryArticoli.FieldByName('CodiceArticolo').AsString;
              // Aggiorna la descrizione dell'articolo
              DM1.CodArticoloToDescrizione(QryArticoli.FieldByName('CodiceArticolo').AsString, CondVendForm.DescrizioneArticolo);
              // Chiude tutto
              Close;
              CondVendForm.CodiceArticolo.SetFocus;
           end;
      // Form chiamante: CONDIZIONI DI VENDITA (FormClienti)
      995: begin
              // Inserisce il nuovo rigo nel documento.
              ClientiForm.CVCodiceArticolo.Text      := ' ' + QryArticoli.FieldByName('CodiceArticolo').AsString;
              ClientiForm.CVDescrizioneArticolo.Text := ' ' + QryArticoli.FieldByName('Descrizione').AsString;
              Close;
              ClientiForm.CVCodiceArticolo.SetFocus;
           end;
      // Form chiamante: SOSTITUZIONE ARTICOLI (FormSostArt)
      994: begin
              SostArtForm.TECodiceArticoloDaSostituire.Text      := QryArticoli.FieldByName('CodiceArticolo').AsString;
              SostArtForm.TEDescrizioneArticoloDaSostituire.Text := QryArticoli.FieldByName('Descrizione').AsString;
              Close;
              SostArtForm.TECodiceArticoloDaSostituire.SetFocus;
           end;
      // Form chiamante: SOSTITUZIONE ARTICOLI (FormSostArt)
      993: begin
              SostArtForm.TECodiceArticoloSostituto.Text      := QryArticoli.FieldByName('CodiceArticolo').AsString;
              SostArtForm.TEDescrizioneArticoloSostituto.Text := QryArticoli.FieldByName('Descrizione').AsString;
              Close;
              SostArtForm.TECodiceArticoloSostituto.SetFocus;
           end;
      // Form chiamante: GIORNALE DI CANTIERE' (FormClienti)
      992: begin
              // Inserisce il nuovo rigo nel documento.
              TabGCForm.GCCodiceArticolo.Text      := ' ' + QryArticoli.FieldByName('CodiceArticolo').AsString;
              Close;
              TabGCForm.GCCodiceArticolo.SetFocus;
           end;
      // Form chiamante: IMPEGNI (FormImpegni)
      991: begin
              ImpegnoForm.QryImpCODICEARTICOLO.AsString := QryArticoli.FieldByName('CodiceArticolo').AsString;
              ImpegnoForm.QryImpDESCRIZIONEARTICOLO.AsString := QryArticoli.FieldByName('Descrizione').AsString;
              Close;
              ImpegnoForm.DbeArticolo.SetFocus;
           end;
      // Form chiamante: GIORNALE DI CANTIERE (TabGCForm) ---> Pulsante Aggiungi Materiali/Apparecchi
      990: begin
              // SelRec contiene il numeero di records selezionati
              SelRec := tvArt.Controller.SelectedRecordCount;
              // Cicla per tutti i righi selezionati
              for i := 0 to SelRec-1 do begin
                 // Si sposta sul rigo e lo inserisce nella tabella TmpRighi
                 tvArt.Controller.SelectedRecords[i].Focused := True;
                 // Inserisce il nuovo rigo nel documento.
                 TabGCForm.InserisciNuovoRigoCantiere(tvArt.Controller.FocusedRow.Values[tvArt.GetColumnByFieldName('CODICEARTICOLO').Index],
                                                      '',
                                                      DM1.MagazzinoDefault,
                                                      AddMode);
              end;
              // Torna al documento
              Close;
              TabGCForm.GridGC.SetFocus;
           end;
   else
      // Visualizza l'anagrafica dell'articolo
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TArticoliForm.tvArtGC_GIACENZACustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  // Grassetto
  ACanvas.Font.Style := [fsBold];
end;

procedure TArticoliForm.tvArtGC_GIACENZAGetDisplayTexttvLFPREZZODILISTINOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  // Non visualizza gli zeri
  if AText = '0' then AText := '';
end;

procedure TArticoliForm.tvArtKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // NB: Per evitare il problema che quando premevano invio quando si spostavano articoli sulla bacheca mi richiedeva
   //      due volte la Qtà per ogni articolo e faceva casino ho messo che uso la proprietà Tag per capire che la pressione
   //      dell'Invio è avvenuta a seguito di richiesta Qtà a sua volta in seguito allo spostamento di articoli nella bacheca
   //      e se questo è il caso non esegue il BblClick e questo risolve il problema.
          // NB: La proprietà Tag viene impostata nell'evento OnEndGrag della Griglia
   if GridArt.Tag = 1 then begin
     GridArt.Tag := 0;
     Exit;
   end;
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvArtDblClick(Self);
end;

procedure TArticoliForm.tvArtCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
   GR:TcxCustomGridRecord;
   PuntoDiRiordino, ScortaMinima : Double;
   Movimentabile : Boolean;
begin
   // GR punta al record corrente
   GR := AViewInfo.GridRecord;

   // Carica nelle variabili il punti di riordino e scorta minima
   PuntoDiRiordino := 0;
   if not VarIsNull(GR.Values[tvArt.GetColumnByFieldName('PUNTORIORDINO').Index]) then PuntoDiRiordino := GR.Values[tvArt.GetColumnByFieldName('PUNTORIORDINO').Index];
   ScortaMinima := 0;
   if not VarIsNull(GR.Values[tvArt.GetColumnByFieldName('SCORTAMINIMA').Index]) then PuntoDiRiordino := GR.Values[tvArt.GetColumnByFieldName('SCORTAMINIMA').Index];

   // Carica il flag che indica se l'articolo è movimentabile oppure no
   Movimentabile := True;
   if not VarIsNull(GR.Values[tvArt.GetColumnByFieldName('ABILITAMOVMAG').Index]) then Movimentabile := (GR.Values[tvArt.GetColumnByFieldName('ABILITAMOVMAG').Index] = 'T');

   // Solo se non è selezionata e se è movimentabile
   if (not AViewInfo.Selected) and Movimentabile then begin
      // In base al fatto che la disponibilità si trovi sotto al punto di riordino oppure sotto la scorta minima
      //  visualizza la riga in colori diversi per rendere il fatto più evidente.
      if GR.Values[tvArt.GetColumnByFieldName('DISPONIBILE').Index] <= ScortaMinima then begin
         ACanvas.Font.Color := COLORE_ARTICOLI_SOTTOSCORTA;
      end else if GR.Values[tvArt.GetColumnByFieldName('DISPONIBILE').Index] <= PuntoDiRiordino then begin
         ACanvas.Font.Color := COLORE_ARTICOLI_SOTTO_PUNTO_RIORDINO;
      end;
   end;

   // ==========================================================================
   // Anche se è selezionata...
   // --------------------------------------------------------------------------
   // Se si stà visualizzando un articolo composto lo evidenzia
   if (not VarIsNull(GR.Values[tvArtARTICOLOCOMPOSTO.Index])) and (GR.Values[tvArtARTICOLOCOMPOSTO.Index] = 'T') then begin
      ACanvas.Font.Style := ACanvas.Font.Style + [fsBold];
   end;
   // ==========================================================================

   // ==========================================================================
   // Se la riga è espansa la visualizza con il colore di sfondo opportuno
   // --------------------------------------------------------------------------
   if GR.Expanded then begin
     ACanvas.Brush.Color := lvArt.Styles.TabsBackground.Color;
     ACanvas.Font.Color := lvArt.Styles.TabsBackground.TextColor;
//     ACanvas.Font.Style := [fsBold];
   end;
   // ==========================================================================
end;

procedure TArticoliForm.tvArtCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TArticoliForm.RxSpeedButtonVisualizzaDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := False;
   // Cerca di riconoscere il mittente per accettare o meno l'operazione
   // ------------------------------------------------------------------
   // Se il mittente proviene da una TcxGrid o TcxView...
   //  Controlla se il mittente è di tipo TcxDragControlObject che è il tipo di oggetto
   //  che le griglie DevExpress passano surante il DragAndDrop.
   if Source is TcxDragControlObject then begin
      // Se il mittente è una vista (che è sempre contenuta in un GridSite)...
      if TcxDragControlObject(Source).Control is TcxGridSite then begin
         // La vista diventa il controllo predefinito per comodità
         with TcxGridSite(TcxDragControlObject(Source).Control).GridView do begin
            // Controlla se la vista è tra quelle da riconoscere
            if (Name = 'tvArt')
            then accept := True;
         end;
      end;
   end;
end;

procedure TArticoliForm.tvArtDataControllerGroupingChanged(
  Sender: TObject);
begin
   if tvArt.GroupedColumnCount > 0 then tvArt.OptionsView.GridLines := glBoth else tvArt.OptionsView.GridLines := glVertical;
end;

procedure TArticoliForm.tvArtDataControllerSortingChanged(Sender: TObject);
begin
   // Fà rifare l'interrogazione con il nuovo ordinamento
   // NB: Solo se non c'è alcun raggruppamento
   if tvArt.DataController.DataModeController.GridMode and (tvArt.GroupedColumnCount = 0) then RxSpeedButtonTrovaClick(Self);
   tvArt.Controller.GoToFirst(False);
end;

procedure TArticoliForm.tvArtCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TArticoliForm.SoloGiacAttivaClickCheck(Sender: TObject);
begin
   // Se passa di quì significa che l'utente ha cliccato esattamente nel riquadrino del check della voce
   //  e quindi marca la proprietà Tag del componente in modo che poi il gestore dell'evento OnMouseUp che gestisce
   //  i click per la selezione o meno della voce (per fare in modo che anche cliccando sulla descrizione della voce
   //  si selezioni o deselezioni la voce stessa). In questo modo tale gestore di evento salta la riga che
   //  assegna il valore alla proprietà checked[i] altrimenti è come se l'utente avesse cliccato due volte.
   (Sender as TCheckListBox).Tag := 1;
end;

procedure TArticoliForm.SoloGiacAttivaExit(Sender: TObject);
begin
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   (Sender as TCheckListBox).ItemIndex := -1;
end;

procedure TArticoliForm.SoloGiacAttivaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   CheckIndex:Integer;
begin
   // ----------------------------------------------------------------------------------------------------
   // Questo codice server per fare in modo che anche se l'utente clicca sul titolo della voce, questa
   //  venga selezinata o deselezionata come se si fosse cliccato sul riquadrino del segno di check)
   // ----------------------------------------------------------------------------------------------------
   // Quale voce si trova sotto il mouse?
   CheckIndex := SoloGiacAttiva.ItemAtPos(Point(X,Y), True);
   // Se c'era una voce cambia il suo stato
   if CheckIndex <> -1 then begin
      if SoloGiacAttiva.Tag = 0 then SoloGiacAttiva.Checked[CheckIndex] := not SoloGiacAttiva.Checked[CheckIndex];
      // Rimette la Proprietà Tag del componente = 0
      SoloGiacAttiva.Tag := 0;
      // Solo se sè cliccato con il pulsante SX del mouse
      if Button = mbRight then begin
         // Esegue la ricerca
         RxSpeedButtonTrovaClick(Self);
      end;
   end;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   SoloGiacAttiva.ItemIndex := -1;
   // ----------------------------------------------------------------------------------------------------
end;

procedure TArticoliForm.EditArtCodiceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = 13 then begin
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TArticoliForm.CompostiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   CLB:TCheckListBox;
   CheckIndex, i:Integer;
begin
   // ----------------------------------------------------------------------------------------------------
   // Questo codice server per fare in modo che anche se l'utente clicca sul titolo della voce, questa
   //  venga selezinata o deselezionata come se si fosse cliccato sul riquadrino del segno di check)
   // ----------------------------------------------------------------------------------------------------
   // CLB Punta alla CheckListBox
   CLB := Sender as TCheckListBox;
   // Quale voce si trova sotto il mouse?
   CheckIndex := CLB.ItemAtPos(Point(X,Y), True);
   // Se c'era una voce cambia il suo stato
   if CheckIndex <> -1 then begin
      // Azzera tutti i check tranne quello su cui si è cliccato
      //  così non se ne possono selezionare più di uno alla volta
      //  in pratica si comportano come dei RadioButton
      for i := 0 to CLB.Count -1 do begin
         if i <> CheckIndex then CLB.Checked[i] := False;
      end;
      // Se la propietà Tag = 0 imposta il componente
      if CLB.Tag = 0 then CLB.Checked[CheckIndex] := not CLB.Checked[CheckIndex];
      // Rimette la Proprietà Tag del componente = 0
      CLB.Tag := 0;
      // Solo se sè cliccato con il pulsante SX del mouse
      if Button = mbRight then begin
         // Esegue la ricerca
         RxSpeedButtonTrovaClick(Self);
      end;
   end;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   CLB.ItemIndex := -1;
   // ----------------------------------------------------------------------------------------------------
end;

procedure TArticoliForm.editArtCategoria1PropertiesInitPopup(Sender: TObject);
var
  Qry: TIB_Cursor;
  Combo:TcxComboBox;
  StcIndex: String;
begin
  // Inizializzazione
  Combo := (Sender as TcxComboBox);
  StcIndex := IntToStr(StrToInt(RightStr(Combo.Name, 1)) + 5);  // Le 3 categorie per gli articolo sono la 4, 5 e 6
  Combo.Properties.Items.Clear;
  Combo.Properties.Items.Add('');
  // Altrimenti provvede a caricare i dati
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta query
    Qry.SQL.Add('SELECT DISTINCT CAMPO1 FROM CATEG' + StcIndex);
    Qry.Open;
    // Caricamento dati
    while not Qry.Eof do
    begin
      Combo.Properties.Items.Add(Qry.Fields[0].AsString);
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TArticoliForm.MenuArticoliPopup(Sender: TObject);
begin
   // In base ai permessi visualizza o meno le voci
   MIArticolo.Visible         := ( DM1.ModCtrl(MOD_ARTICOLI) > 1 );
   MIArticoloComposto.Visible := ( DM1.ModCtrl(MOD_ARTICOLI) > 1 ) and False;  // NB: Sempre disabilitato perchè non è possibile inserire un articolo composto da dentro un documento
   // Richiama il gestore di default dell'evento
   ClientiForm.PopupMenuPopupGestoreDefault(Sender);
end;

procedure TArticoliForm.MIArticoloClick(Sender: TObject);
begin
   DM1.Attendere;
   Application.CreateForm(TAnagArtForm, AnagArtForm);
   // La riga sottostante è stata sostituita con la successiva per risolvere l'errore
   //  che dava il programma quando girava su Win95/98/ME (Questo programma ha eseguito una operazione non valida...)
   //  Il problema lo dava solo quando assegnavo la proprietà Parent della form AnagArtForm.
   //  con le altre form andava bene.
//           AnagArtForm.Parent := MainForm;
   MainForm.FormSetParentPlatformDependent(AnagArtForm, MainForm);
   AnagArtForm.DistintaBase := False;
   AnagArtForm.Tag := 2;
   AnagArtForm.Show;
   DM1.ChiudiAttendere;
end;

procedure TArticoliForm.MIArticoloCompostoClick(Sender: TObject);
begin
   DM1.Attendere;
   Application.CreateForm(TAnagArtForm, AnagArtForm);
   // La riga sottostante è stata sostituita con la successiva per risolvere l'errore
   //  che dava il programma quando girava su Win95/98/ME (Questo programma ha eseguito una operazione non valida...)
   //  Il problema lo dava solo quando assegnavo la proprietà Parent della form AnagArtForm.
   //  con le altre form andava bene.
//           AnagArtForm.Parent := MainForm;
   MainForm.FormSetParentPlatformDependent(AnagArtForm, MainForm);
   AnagArtForm.DistintaBase := True;
   AnagArtForm.Tag := 2;
   AnagArtForm.Show;
   DM1.ChiudiAttendere;
end;

procedure TArticoliForm.MenuGrigliaPopup(Sender: TObject);
var
   SearchRec:TSearchRec;
   TmpStr:String;
   CurrGrid:TcxGrid;
   CurrMenuItem:TMenuItem;
begin
   // ==========================================================================
   // Caricamento delle viste delle griglia attualmente visualizzata
   // --------------------------------------------------------------------------
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridArt;
   // Svuota l'elenco delle viste
   Selezionavista1.Clear;
   // Aggiunge la voce di selezione di nessuna vista
   CurrMenuItem := TMenuItem.Create(Self);
   CurrMenuItem.Caption := 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)';
   CurrMenuItem.Name := 'NessunaVista';
   CurrMenuItem.OnClick := Selezionavista1Click;
   Selezionavista1.Add(CurrMenuItem);
   // Prima di tutto controlla che la cartella esista
   if DirectoryExists(DM1.ImpGridsDir) then begin
      // Poi cerca il primo file
      if FindFirst(DM1.ImpGridsDir + CurrGrid.Name + '___*.ini', faAnyFile, SearchRec) = 0 then begin
         // Se lo trova inserisce il nome della vista nell'elenco
         TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name)-Length(CurrGrid.Name)-3);
         CurrMenuItem := TMenuItem.Create(Self);
         CurrMenuItem.Caption := LeftStr(TmpStr, Length(TmpStr)-4);
         CurrMenuItem.OnClick := Selezionavista1Click;
         Selezionavista1.Add(CurrMenuItem);
         // Trova anche gli eventuali altri files dello stesso tipo
         while (FindNext(SearchRec) = 0) do begin
            // Se lo trova inserisce il nome della vista nell'elenco
            TmpStr := RightStr(SearchRec.Name, Length(SearchRec.Name)-Length(CurrGrid.Name)-3);
            CurrMenuItem := TMenuItem.Create(Self);
            CurrMenuItem.Caption := LeftStr(TmpStr, Length(TmpStr)-4);
            CurrMenuItem.OnClick := Selezionavista1Click;
            Selezionavista1.Add(CurrMenuItem);
         end;
      end;
      // Distrugge SearchRec
      FindClose(SearchRec);
   end;
   // ==========================================================================
end;

procedure TArticoliForm.Selezionavista1Click(Sender: TObject);
var
   CurrGrid:TcxGrid;
   CurrItemCaption:String;
begin
   // Caption della voce selezionata
   CurrItemCaption := (Sender as TMenuItem).Caption;
   CurrItemCaption := RightStr(CurrItemCaption, Length(CurrItemCaption)-1);  // Elimina la & che mi ritrovo all'inizio
   // Se la voce attuale è la radice del menu di selezione viste esce subito
   if (Sender as TMenuItem).Name = 'Selezionavista1' then Exit;
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GridArt;
   // Carica la vista attuale
   DM1.RipristinaDevExpress(CurrGrid, CurrItemCaption, False);
end;

procedure TArticoliForm.SetArtFilter_Categoria1_Caption(const Value: String);
var
  FilterVisible: Boolean;
begin
  fArtFilter_Categoria1_Caption := Value;
  FilterVisible := (Value <> '0') and (Value <> '');
  LabelArtCategoria1.Visible := FilterVisible;
  LabelArtCategoria1.Caption := Value;
  editArtCategoria1.Visible := FilterVisible;
end;

procedure TArticoliForm.SetArtFilter_Categoria2_Caption(const Value: String);
var
  FilterVisible: Boolean;
begin
  fArtFilter_Categoria2_Caption := Value;
  FilterVisible := (Value <> '0') and (Value <> '');
  LabelArtCategoria2.Visible := FilterVisible;
  LabelArtCategoria2.Caption := Value;
  editArtCategoria2.Visible := FilterVisible;
end;

procedure TArticoliForm.SetArtFilter_Categoria3_Caption(const Value: String);
var
  FilterVisible: Boolean;
begin
  fArtFilter_Categoria3_Caption := Value;
  FilterVisible := (Value <> '0') and (Value <> '');
  LabelArtCategoria3.Visible := FilterVisible;
  LabelArtCategoria3.Caption := Value;
  editArtCategoria3.Visible := FilterVisible;
end;

procedure TArticoliForm.Salvalavistaattuale1Click(Sender: TObject);
var
   Vista:String;
begin
      // Chiede il nome della vista
      if InputQuery('Salvataggio vista', 'Con quale nome devo salvare la vista?', Vista) then begin
         // Controlla che la vista non sia nullo
         if Trim(Vista) = '' then raise Exception.Create('Il nome della vista non può essere vuoto.');
      end else begin
         // Se l'utente ha cliccato su Cancel annulla l'operazione
         Exit;
      end;
      // Salva le impostazioni delle colonne dei clienti
      DM1.SalvaGriglieDevExpress(GridArt, Vista, False);
end;

procedure TArticoliForm.Ripristinacolonneeliminate1Click(Sender: TObject);
begin
   tvArt.Controller.Customization := True
end;

procedure TArticoliForm.tvArtCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TArticoliForm.SoloGiacAttivaKeyPress(Sender: TObject;
  var Key: Char);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TArticoliForm.BitBtnArtGruppo4Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      MainForm.SetParentComponent(GruppiForm);
      GruppiForm.Tag := 994;   // Abilita la selezione
      GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
      GruppiForm.Selezionato2  := StrToInt(CodiceGruppo2.Text);
      GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
      GruppiForm.LivelloAttivo := 4;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TArticoliForm.BitBtnArtGruppo5Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      MainForm.SetParentComponent(GruppiForm);
      GruppiForm.Tag := 994;   // Abilita la selezione
      GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
      GruppiForm.Selezionato2  := StrToInt(CodiceGruppo2.Text);
      GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
      GruppiForm.Selezionato4  := StrToInt(CodiceGruppo4.Text);
      GruppiForm.LivelloAttivo := 5;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TArticoliForm.BitBtnArtGruppo6Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      MainForm.SetParentComponent(GruppiForm);
      GruppiForm.Tag := 994;   // Abilita la selezione
      GruppiForm.Selezionato1  := StrToInt(CodiceGruppo1.Text);
      GruppiForm.Selezionato2  := StrToInt(CodiceGruppo2.Text);
      GruppiForm.Selezionato3  := StrToInt(CodiceGruppo3.Text);
      GruppiForm.Selezionato4  := StrToInt(CodiceGruppo4.Text);
      GruppiForm.Selezionato5  := StrToInt(CodiceGruppo5.Text);
      GruppiForm.LivelloAttivo := 6;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TArticoliForm.CodiceGruppo3Change(Sender: TObject);
begin
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo3.Text) = '' then begin
      CodiceGruppo4.Text  := '';
      DescGruppo4.Text    := '';
      CodiceGruppo4.Color := GruppiTitolo.Color;
      DescGruppo4.Color   := GruppiTitolo.Color;
      CodiceGruppo4.TabStop := False;
      BitBtnArtGruppo4.Enabled := False;
   end else begin
      CodiceGruppo4.Color := CodiceGruppo1.Color;
      DescGruppo4.Color   := CodiceGruppo1.Color;
      CodiceGruppo4.TabStop := True;
      BitBtnArtGruppo4.Enabled := True;
   end;
end;

procedure TArticoliForm.CodiceGruppo4Change(Sender: TObject);
begin
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo4.Text) = '' then begin
      CodiceGruppo5.Text  := '';
      DescGruppo5.Text    := '';
      CodiceGruppo5.Color := GruppiTitolo.Color;
      DescGruppo5.Color   := GruppiTitolo.Color;
      CodiceGruppo5.TabStop := False;
      BitBtnArtGruppo5.Enabled := False;
   end else begin
      CodiceGruppo5.Color := CodiceGruppo1.Color;
      DescGruppo5.Color   := CodiceGruppo1.Color;
      CodiceGruppo5.TabStop := True;
      BitBtnArtGruppo5.Enabled := True;
   end;
end;

procedure TArticoliForm.CodiceGruppo5Change(Sender: TObject);
begin
   // Se il codice gruppo è nullo disattiva la selezione del gruppo2, altrimenti la attiva
   if Trim(CodiceGruppo5.Text) = '' then begin
      CodiceGruppo6.Text  := '';
      DescGruppo6.Text    := '';
      CodiceGruppo6.Color := GruppiTitolo.Color;
      DescGruppo6.Color   := GruppiTitolo.Color;
      CodiceGruppo6.TabStop := False;
      BitBtnArtGruppo6.Enabled := False;
   end else begin
      CodiceGruppo6.Color := CodiceGruppo1.Color;
      DescGruppo6.Color   := CodiceGruppo1.Color;
      CodiceGruppo6.TabStop := True;
      BitBtnArtGruppo6.Enabled := True;
   end;
end;

procedure TArticoliForm.QryArticoliCalcFields(DataSet: TDataSet);
begin
   // Calcola l'importo prezzo di acquisto (UltimoPrezzoDiAcquisto * Giacenza)
   QryArticoliIMPORTOULTIMOCOSTOREALE.Value := QryArticoliULTIMOCOSTOREALE.AsCurrency * QryArticoliGIACENZA.AsFloat;
   // Calcola la qtà disponibile in magazzino
   QryArticoliDISPONIBILE.Value := DM1.CalcolaDisponibile(QryArticoliGIACENZA.AsFloat, QryArticoliIMPEGNATO.AsFloat, QryArticoliORDINATO.AsFloat);
end;

procedure TArticoliForm.SpeedButton3Click(Sender: TObject);
begin
  tvArt.ViewData.Collapse(True);
end;

procedure TArticoliForm.SpeedButton4Click(Sender: TObject);
begin
  tvArt.ViewData.Expand(True);
end;

procedure TArticoliForm.FilterArtTrovaKeyPress(Sender: TObject;
  var Key: Char);
begin
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then RxSpeedButtonTrovaClick(Self);
end;

procedure TArticoliForm.tvArtSCONTODIACQUISTOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // Inizializzazione
  AText := '';
  // Compone il testo da visualizzare
  // Sconto1
  if (not VarIsNull(ARecord.Values[tvArtSCONTODIACQUISTO.Index])) and (ARecord.Values[tvArtSCONTODIACQUISTO.Index] <> 0)
    then AText := FloatToStr(DM1.Arrotonda(ARecord.Values[tvArtSCONTODIACQUISTO.Index], 2)) + '%';
  // Sconto2
  if (not VarIsNull(ARecord.Values[tvArtSCONTODIACQUISTO2.Index])) and (ARecord.Values[tvArtSCONTODIACQUISTO2.Index] <> 0)
    then AText := Atext + ' + ' + FloatToStr(DM1.Arrotonda(ARecord.Values[tvArtSCONTODIACQUISTO2.Index], 2)) + '%';
  // Sconto3
  if (not VarIsNull(ARecord.Values[tvArtSCONTODIACQUISTO3.Index])) and (ARecord.Values[tvArtSCONTODIACQUISTO3.Index] <> 0)
    then AText := Atext + ' + ' + FloatToStr(DM1.Arrotonda(ARecord.Values[tvArtSCONTODIACQUISTO3.Index],2 )) + '%';
end;



procedure TArticoliForm.RicalcolaDimensioni;
const
   LEFT_BORDER                  = 16;
   RIGHT_BORDER                 = 16;
   TOP_BORDER                   = 84;
   BOTTOM_BORDER                = 5;
begin
   // Imposta le dimensioni
   ClientArea.Left    := LEFT_BORDER;
   ClientArea.Top     := TOP_BORDER;
   ClientArea.Width   := Self.Width - LEFT_BORDER - RIGHT_BORDER;
   ClientArea.Height  := Self.Height - TOP_BORDER - BOTTOM_BORDER;
end;

procedure TArticoliForm.CalcolaLeftFiltriSubPanel(PanelFiltriMain:TPanel);
var
  WidthDiff: Integer;
  FiltriSubPanel: TPanel;
begin
  // Ricava il SubPanel da centrare
  FiltriSubPanel := PanelFiltriMain.Controls[0] as TPanel;
  // Calcolo della posizione del SubPanel
  WidthDiff := PanelFiltriMain.Width - FiltriSubPanel.Width;
  FiltriSubPanel.Left := Trunc(WidthDiff/2);
  if FiltriSubPanel.Left < 0 then FiltriSubPanel.Left := 0;
  PanelFiltriMain.Update;
  Application.ProcessMessages;
end;


procedure TArticoliForm.FormResize(Sender: TObject);
begin
  // Ricalcola le dimensioni dei pannelli
  RicalcolaDimensioni;
end;

procedure TArticoliForm.PanelFiltriResize(Sender: TObject);
begin
  CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TArticoliForm.SBArtFilterOpenCloseClick(Sender: TObject);
begin
  if PanelFiltri.Tag = 1
  then ClientiForm.CloseFilterPanel(PanelFiltri, SBArtFilterOpenClose)
  else ClientiForm.OpenFilterPanel(PanelFiltri, SBArtFilterOpenClose);
end;

procedure TArticoliForm.QryArtMagCalcFields(DataSet: TDataSet);
begin
  // Clacolo disponibile
  QryArtMagDISPONIBILE.Value := (QryArtMagGIACENZA.AsFloat - QryArtMagIMPEGNATO.AsFloat);
end;

procedure TArticoliForm.tvLFPREZZODILISTINOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if VarIsNull(ARecord.Values[Sender.Index])
  or (ARecord.Values[Sender.Index] = 0)
  then AText := '- - -';
end;

procedure TArticoliForm.tvLFCODICEARTICOLOFORNITOREGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  if VarIsNull(ARecord.Values[Sender.Index])
  or (Trim(ARecord.Values[Sender.Index]) = '')
  then AText := '- - -';
end;

procedure TArticoliForm.tvLFCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TArticoliForm.tvLFCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TArticoliForm.tvLFCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  // Richiama la gestione predefinita dell'evento
  DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TArticoliForm.tvArtMagGIACENZACustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  // IMposta il totale da visualizzare perchè altrimenti in modalità
  //  GridMode i totali non funzionano.
  AViewInfo.Text := FloatToStr(fTotaliArtMag_Giacenza);
  // Traccia il totale senza però il bordo
  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.DrawTexT(AViewInfo.Text,AViewInfo.TextAreaBounds,cxAlignCenter,True);
  ADone := True;
end;

procedure TArticoliForm.tvArtMagIMPEGNATOCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  // IMposta il totale da visualizzare perchè altrimenti in modalità
  //  GridMode i totali non funzionano.
  AViewInfo.Text := FloatToStr(fTotaliArtMag_Impegnato);
  // Traccia il totale senza però il bordo
  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.DrawTexT(AViewInfo.Text,AViewInfo.TextAreaBounds,cxAlignCenter,True);
  ADone := True;
end;

procedure TArticoliForm.tvArtMagORDINATOCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  // IMposta il totale da visualizzare perchè altrimenti in modalità
  //  GridMode i totali non funzionano.
  AViewInfo.Text := FloatToStr(fTotaliArtMag_Ordinato);
  // Traccia il totale senza però il bordo
  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.DrawTexT(AViewInfo.Text,AViewInfo.TextAreaBounds,cxAlignCenter,True);
  ADone := True;
end;

procedure TArticoliForm.tvArtMagDISPONIBILECustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  // IMposta il totale da visualizzare perchè altrimenti in modalità
  //  GridMode i totali non funzionano.
  AViewInfo.Text := FloatToStr(fTotaliArtMag_Disponibile);
  // Traccia il totale senza però il bordo
  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.DrawTexT(AViewInfo.Text,AViewInfo.TextAreaBounds,cxAlignCenter,True);
  ADone := True;
end;

procedure TArticoliForm.tvArtMagCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TArticoliForm.tvArtMagCustomDrawFooterCell(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  // Traccia il totale senza però il bordo
  ACanvas.FillRect(AViewInfo.Bounds);
  ACanvas.DrawTexT(AViewInfo.Text,AViewInfo.TextAreaBounds,cxAlignCenter,True);
  ADone := True;
end;

procedure TArticoliForm.tvArtMagCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TArticoliForm.tvArtMagCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  // Richiama la gestione predefinita dell'evento
  DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TArticoliForm.tvArtDataControllerDetailExpanded(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  // Se il campo CODICEARTICOLO della row attuale della griglia è nulla
  //  esce subito altrimenti da degli errori
  if VarIsNull(ADataController.Values[ARecordIndex, tvArtCODICEARTICOLO.Index]) then
  begin
    if QryArtMag.Active then QryArtMag.Close;
    if QryArtListForn.Active then QryArtListForn.Close;
    Exit;
  end;

  GridArt.BeginUpdate;
  try

    // ===========================================================================
    // PARTE CHE APRE LE QUERY DEI LISTINI FORNITORI
    // ---------------------------------------------------------------------------
    // Se non ci sono i records relativi all'articolo li crea
    DM1.ControlloFornitoriArticolo(ADataController.Values[ARecordIndex, tvArtCODICEARTICOLO.Index]);
    // Reimposta la query per visualizzare solo i dettagli dell'articolo attuale.
    if QryArtListForn.Active then QryArtListForn.Close;
    if not QryArtListForn.Prepared then QryArtListForn.Prepare;
    QryArtListForn.ParamByName('CODICEARTICOLO').AsString := ADataController.Values[ARecordIndex, tvArtCODICEARTICOLO.Index];
    QryArtListForn.Open;
    // ===========================================================================

    // ===========================================================================
    // PARTE CHE APRE LE QUERY DEI DETTAGLI MAGAZZINO
    // ---------------------------------------------------------------------------
    if QryArtMag.Active then QryArtMag.Close;
    if not QryArtMag.Prepared then QryArtMag.Prepare;
    QryArtMag.Params.ParamByName('P_CODART').AsString := ADataController.Values[ARecordIndex, tvArtCODICEARTICOLO.Index];
    QryArtMag.Params.ParamByName('P_DATARICHIESTA').AsDateTime := GetDataFiltroRicerca;
    QryArtMag.Open;
    // Calcolo dei totali in variabili appoggioglobali
    // NB: HO dovuto fare così perchè altrimenti in GridMode=True i totali non funziano.
    QryArtMag.DisableControls;
    try
      QryArtMag.First;
      fTotaliArtMag_Giacenza    := 0;
      fTotaliArtMag_Impegnato   := 0;
      fTotaliArtMag_Ordinato    := 0;
      fTotaliArtMag_Disponibile := 0;
      while not QryArtMag.Eof do begin
        fTotaliArtMag_Giacenza  := fTotaliArtMag_Giacenza  + QryArtMagGIACENZA.AsFloat;
        fTotaliArtMag_Impegnato := fTotaliArtMag_Impegnato + QryArtMagIMPEGNATO.AsFloat;
        fTotaliArtMag_Ordinato  := fTotaliArtMag_Ordinato  + QryArtMagORDINATO.AsFloat;
        QryArtMag.Next;
      end;
      fTotaliArtMag_Disponibile := fTotaliArtMag_Giacenza - fTotaliArtMag_Impegnato;
    finally
      QryArtMag.EnableControls;
    end;
    // ===========================================================================

  finally
    GridArt.EndUpdate;
  end;

end;

procedure TArticoliForm.tvArtDataControllerDetailExpanding(
  ADataController: TcxCustomDataController; ARecordIndex: Integer;
  var AAllow: Boolean);
begin
  tvArt.DataController.CollapseDetails;
end;

procedure TArticoliForm.tvLFDblClick(Sender: TObject);
var
   SelRec, i:Longint;
   tv: tcxGridDBTableView;
begin
   // Se non è attivata la gestione degli articoli secondari di fornitori secondari esce subito
   if DM1.TableProgressiviDOCGESTARTFORNSECONDARI.AsString <> 'T' then Exit;
   // tv Punta alla TableView Corrente
   tv := (GridArt.FocusedView as tcxGridDBTableView);
   // Se non c'è alcun rigo selezionato non fa nulla
   if (tv.Controller.SelectedRecordCount = 0) or (tv.Controller.FocusedRecord = nil) or (not tv.Controller.FocusedRecord.IsData) then exit;
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: DOCUMENTO FISCALE (FormPreventiviOrdini)
      999: begin
              // SelRec contiene il numeero di records selezionati
              SelRec := tv.Controller.SelectedRecordCount;
              // Cicla per tutti i righi selezionati
              for i := 0 to SelRec-1 do begin
                 // Si sposta sul rigo e lo inserisce nella tabella TmpRighi
                 tv.Controller.SelectedRecords[i].Focused := True;
                 // Inserisce il nuovo rigo nel documento.
                 PreventiviOrdiniForm.InserisciNuovoRigoDocumento(tv.Controller.FocusedRow.Values[tv.GetColumnByFieldName('CODICEARTICOLO').Index],
                                                                  tv.Controller.FocusedRow.Values[tv.GetColumnByFieldName('CODICEARTICOLOFORNITORE').Index],
                                                                  PreventiviOrdiniForm.QryDocumentoCodiceMagazzino.AsString,
                                                                  AddMode);
              end;
              // Torna al documento
              Close;
              PreventiviOrdiniForm.AddArt.SetFocus;
           end;
      // Form chiamante: DICHIARAZIONE DI CONFORMITA' (FormPreventiviOrdini)
      998: begin
              // SelRec contiene il numeero di records selezionati
              SelRec := tv.Controller.SelectedRecordCount;
              // Cicla per tutti i righi selezionati
              for i := 0 to SelRec-1 do begin
                 // Si sposta sul rigo e lo inserisce nella tabella TmpRighi
                 tv.Controller.SelectedRecords[i].Focused := True;
                 // Inserisce il nuovo rigo nel documento.
                 ConformitaForm.InserisciNuovoRigo(tv.Controller.FocusedRow.Values[tv.GetColumnByFieldName('CODICEARTICOLO').Index],
                                                   tv.Controller.FocusedRow.Values[tv.GetColumnByFieldName('CODICEARTICOLOFORNITORE').Index],
                                                   1,
                                                   (ConformitaForm.RxSpeedButtonNuovo.Tag = 1));
              end;
              // Torna al documento
              Close;
              ConformitaForm.GridRT.SetFocus;
           end;
      // Form chiamante: GIORNALE DI CANTIERE (TabGCForm) ---> Pulsante Aggiungi Materiali/Apparecchi
      990: begin
              // SelRec contiene il numeero di records selezionati
              SelRec := tv.Controller.SelectedRecordCount;
              // Cicla per tutti i righi selezionati
              for i := 0 to SelRec-1 do begin
                 // Si sposta sul rigo e lo inserisce nella tabella TmpRighi
                 tv.Controller.SelectedRecords[i].Focused := True;
                 // Inserisce il nuovo rigo nel documento.
                 TabGCForm.InserisciNuovoRigoCantiere(tv.Controller.FocusedRow.Values[tv.GetColumnByFieldName('CODICEARTICOLO').Index],
                                                      tv.Controller.FocusedRow.Values[tv.GetColumnByFieldName('CODICEARTICOLOFORNITORE').Index],
                                                      DM1.MagazzinoDefault,
                                                      AddMode);
              end;
              // Torna al documento
              Close;
              TabGCForm.GridGC.SetFocus;
           end;
   else
      // Visualizza l'anagrafica dell'articolo
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TArticoliForm.tvLFEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  MDC, DDC: TcxCustomDataController;
  TV: TcxGridDBTableView;
  i, MRI: Integer;
  Qry: TIB_Cursor;
  Value_Qta: Double;
  Value_CodiceArticolo, Value_CodiceArticoloStm, Value_Descrizione, Value_UM: String;
begin
  // Verifica Target
  if Target = nil then Exit;
  try
    // Inizializzazione
    MRI := -1;
    // Crea la Qry per l'esportazione degli articoli
    Qry                  := TIB_Cursor.Create(Self);
    Qry.DatabaseName     := DM1.GenDBFile;
    Qry.IB_Connection    := DM1.DBGenerale;
    // TV Punta alla TableView interessata
    TV := ((Sender as TcxGridSite).GridView as TcxGridDBTableView);
    // DDC Punta al data controller della vista in Sender
    DDC := TV.DataController;
    // Se DDC è un Detail Data controller significa che l'utente sta
    //  trascinando un rigo di un dettaglio cioè di un fornitore, nel
    //  qual caso allora MDC punterà al Master Data controller,
    //  altrimenti invece MDC punterà anchesso al DataController di Sender.
    if TV.IsDetail then begin
      MDC := DDC.GetMasterDataController;
      // MRI contiene l'indice del MasterRecord
      MRI := DDC.GetMasterRecordIndex;
    end else MDC := DDC;

    // =========================================================================
    // Se il Target è uno SpeedButton esegue l'onClick dello SpeedButton Stesso
    // -------------------------------------------------------------------------
    if Target is TSpeedButton then begin
      TSpeedButton(Target).OnClick(Self);

    // =========================================================================
    // Se il bersaglio e la ListView della bacheca e se ci sono righi selezionati...
    // -------------------------------------------------------------------------
    end else if (Target is TListView) and (TListView(Target).Name = 'ListViewExpDoc') and (TV.Controller.SelectedRecordCount > 0) then begin
      // Cicla per tutti i righi selezionati
      for i := 0 to TV.Controller.SelectedRecordCount -1 do begin

        // Se la vista da cui si stanno trascinando i righi è di dettaglio significa che stiamo trascinando
        //  da un listino fornitore specifico e quindi i dati li prende da li alcuni e altri dal MasterRecord
        if TV.IsDetail then begin
          // Codice Articolo
          Value_CodiceArticolo := DM1.NoNullStringValue(MDC, MRI, tvArtCODICEARTICOLO.Index);
          // Codice Articolo STM
          if (not VarIsNull(TV.Controller.SelectedRecords[i].Values[tvLFCODICEARTICOLOFORNITORE.Index])) and (Trim(TV.Controller.SelectedRecords[i].Values[tvLFCODICEARTICOLOFORNITORE.Index]) <> '')
            then Value_CodiceArticoloStm := TV.Controller.SelectedRecords[i].Values[tvLFCODICEARTICOLOFORNITORE.Index]
            else Value_CodiceArticoloStm := Value_CodiceArticolo;
          // Descrizione
          if (not VarIsNull(TV.Controller.SelectedRecords[i].Values[tvLFDESCRIZIONEFORNITORE.Index])) and (Trim(TV.Controller.SelectedRecords[i].Values[tvLFDESCRIZIONEFORNITORE.Index]) <> '')
            then Value_Descrizione := TV.Controller.SelectedRecords[i].Values[tvLFDESCRIZIONEFORNITORE.Index]
            else Value_Descrizione := DM1.NoNullStringValue(MDC, MRI, tvArtDESCRIZIONE.Index);
          // Unita di misura
          Value_UM := DM1.NoNullStringValue(MDC, MRI, tvArtUNITADIMISURA.Index);
          // Qta contiene la qtà autoamtica dell'articolo oppure 1 se non è specificata
          if not VarIsNull(MDC.Values[MRI,tvArtQUANTITAAUTOMATICA.Index])
            then Value_Qta := MDC.Values[MRI,tvArtQUANTITAAUTOMATICA.Index]
            else Value_Qta := 1;
        // Se invece stiamo spostado dei righi principali prende tutto dal Master
        end else begin
          // Codice Articolo
          Value_CodiceArticolo := TV.Controller.SelectedRecords[i].Values[tvArtCODICEARTICOLO.Index];
          // Codice Articolo STM
          Value_CodiceArticoloStm := Value_CodiceArticolo;
          // Descrizione
          if (not VarIsNull(TV.Controller.SelectedRecords[i].Values[tvArtDESCRIZIONE.Index])) and (Trim(TV.Controller.SelectedRecords[i].Values[tvArtDESCRIZIONE.Index]) <> '')
            then Value_Descrizione := TV.Controller.SelectedRecords[i].Values[tvArtDESCRIZIONE.Index]
            else Value_Descrizione := '';
          // Unita di misura
          if (not VarIsNull(TV.Controller.SelectedRecords[i].Values[tvArtUNITADIMISURA.Index])) and (Trim(TV.Controller.SelectedRecords[i].Values[tvArtUNITADIMISURA.Index]) <> '')
            then Value_UM := TV.Controller.SelectedRecords[i].Values[tvArtUNITADIMISURA.Index]
            else Value_UM := '';
          // Qta contiene la qtà autoamtica dell'articolo oppure 1 se non è specificata
          if not VarIsNull(TV.Controller.SelectedRecords[i].Values[tvArtQUANTITAAUTOMATICA.Index])
            then Value_Qta := TV.Controller.SelectedRecords[i].Values[tvArtQUANTITAAUTOMATICA.Index]
            else Value_Qta := 1;
        end;

        // Se abilitato richiede la Qtà
        //  NB: Prima di visualizzare la form che richiede la Qta disabilita il gestore dell'evento
        //       'onKeyUp' della griglia perchè altrimenti succede una cosa strana e cioè che
        //       è come se si premesse di nuovo INVIO anche sulla griglia (dopo la chiusura della richiesta Qtà)
        //       ed era molto fastidioso.
        if DM1.RichiediQta then begin
          // NB: Per evitare il problema che quando premevano invio quando si spostavano articoli sulla bacheca mi richiedeva
          //      due volte la Qtà per ogni articolo e faceva casino ho messo che uso la proprietà Tag per capire che la pressione
          //      dell'Invio è avvenuta a seguito di richiesta Qtà a sua volta in seguito allo spostamento di articoli nella bacheca
          //      e se questo è il caso non esegue il BblClick e questo risolve il problema.
          // NB: La proprietà Tag poi viene controllata nell'evento OnKeyUp della Griglia
          GridArt.Tag := 1;
          Value_Qta := DM1.ChiediQtaArticolo(Value_CodiceArticoloStm, Value_Descrizione, Value_UM, Value_Qta);
        end;

        // Imposta la query per l'inserimento dell'articolo nella bacheca
        Qry.SQL.Clear;
        Qry.SQL.Add('INSERT INTO TMPRIGHI (STATION_ID, TIPODOCUMENTO, CODICEARTICOLO, CODICEARTICOLOSTM, DESCRIZIONE, QTA)');
        Qry.SQL.Add('VALUES(');
        Qry.SQL.Add(DM1.CodiceUtente + ',');
        Qry.SQL.Add('''ARTICOLO'',');
        Qry.SQL.Add(AnsiQuotedStr(Value_CodiceArticolo, '''') + ',');
        Qry.SQL.Add(AnsiQuotedStr(Value_CodiceArticoloStm, '''') + ',');
        Qry.SQL.Add(AnsiQuotedStr(LeftStr(Value_Descrizione, 20), '''') + ',');
        Qry.SQL.Add(DM1.FloatVarToSQL(Value_Qta));
        Qry.SQL.Add(')');
        Qry.ExecSQL;

        // Aggiorna  i documenti esportati
        MainForm.AggiornaDocumentiEsportati;
      end;
    end
    // =========================================================================

  finally
    // Pulizie finali
    if Assigned(Qry) then FreeAndNil(Qry);
  end;
end;

procedure TArticoliForm.tvArtPREZZODILISTINOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  // Lo zero non lo visualizza
  if (not VarIsNull(ARecord.Values[Sender.Index])) and (ARecord.Values[Sender.Index] = 0)
  then AText := '';
end;


procedure TArticoliForm.CaricaFormLayout;
begin
   // ========================================================================
   // ELENCO ARTICOLI
   // ------------------------------------------------------------------------
   // Filtri
   Self.ArtFilter_Categoria1_Caption := DM1.CategCaption6;
   Self.ArtFilter_Categoria2_Caption := DM1.CategCaption7;
   Self.ArtFilter_Categoria3_Caption := DM1.CategCaption8;
   // Colonne
   Self.tvArtCATEGORIA1.VisibleForCustomization := editArtCategoria1.Visible;
   Self.tvArtCATEGORIA2.VisibleForCustomization := editArtCategoria2.Visible;
   Self.tvArtCATEGORIA3.VisibleForCustomization := editArtCategoria3.Visible;
   Self.tvArtCATEGORIA1.Caption := DM1.CategCaption6;
   Self.tvArtCATEGORIA2.Caption := DM1.CategCaption7;
   Self.tvArtCATEGORIA3.Caption := DM1.CategCaption8;
   // Microprezzi
   (tvArtPREZZODILISTINO.GetProperties as TcxCurrencyEditProperties).DisplayFormat    := DM1.DisplayFormat;
   (tvArtULTIMOPRZACQUISTO.GetProperties as TcxCurrencyEditProperties).DisplayFormat  := DM1.DisplayFormat;
   (tvArtULTIMOCOSTOREALE.GetProperties as TcxCurrencyEditProperties).DisplayFormat   := DM1.DisplayFormat;
   (tvArtIMPORTOULTIMOCOSTOREALE.GetProperties as TcxCurrencyEditProperties).DisplayFormat  := DM1.DisplayFormat;
   (tvArtPREZZODIVENDITA.GetProperties as TcxCurrencyEditProperties).DisplayFormat    := DM1.DisplayFormat;
   (tvArtPREZZODIVENDITA2.GetProperties as TcxCurrencyEditProperties).DisplayFormat   := DM1.DisplayFormat;
   (tvArtPREZZODIVENDITA3.GetProperties as TcxCurrencyEditProperties).DisplayFormat   := DM1.DisplayFormat;
   (tvArtPREZZODIVENDITA4.GetProperties as TcxCurrencyEditProperties).DisplayFormat   := DM1.DisplayFormat;
   (tvArtPRZVENDIVACOMP1.GetProperties as TcxCurrencyEditProperties).DisplayFormat    := DM1.DisplayFormat;
   (tvArtPRZVENDIVACOMP2.GetProperties as TcxCurrencyEditProperties).DisplayFormat    := DM1.DisplayFormat;
   (tvArtPRZVENDIVACOMP3.GetProperties as TcxCurrencyEditProperties).DisplayFormat    := DM1.DisplayFormat;
   (tvArtPRZVENDIVACOMP4.GetProperties as TcxCurrencyEditProperties).DisplayFormat    := DM1.DisplayFormat;
   (tvLFPREZZODILISTINO.GetProperties as TcxCurrencyEditProperties).DisplayFormat     := DM1.DisplayFormat;
   (tvLFPREZZODIACQUISTO.GetProperties as TcxCurrencyEditProperties).DisplayFormat    := DM1.DisplayFormat;

   (tvArtPREZZODILISTINO.GetProperties as TcxCurrencyEditProperties).DecimalPlaces   := DM1.DecMicroPrz;
   (tvArtULTIMOPRZACQUISTO.GetProperties as TcxCurrencyEditProperties).DecimalPlaces := DM1.DecMicroPrz;
   (tvArtULTIMOCOSTOREALE.GetProperties as TcxCurrencyEditProperties).DecimalPlaces  := DM1.DecMicroPrz;
   (tvArtIMPORTOULTIMOCOSTOREALE.GetProperties as TcxCurrencyEditProperties).DecimalPlaces  := DM1.DecMicroPrz;
   (tvArtPREZZODIVENDITA.GetProperties as TcxCurrencyEditProperties).DecimalPlaces   := DM1.DecMicroPrz;
   (tvArtPREZZODIVENDITA2.GetProperties as TcxCurrencyEditProperties).DecimalPlaces  := DM1.DecMicroPrz;
   (tvArtPREZZODIVENDITA3.GetProperties as TcxCurrencyEditProperties).DecimalPlaces  := DM1.DecMicroPrz;
   (tvArtPREZZODIVENDITA4.GetProperties as TcxCurrencyEditProperties).DecimalPlaces  := DM1.DecMicroPrz;
   (tvArtPRZVENDIVACOMP1.GetProperties as TcxCurrencyEditProperties).DecimalPlaces   := DM1.DecMicroPrz;
   (tvArtPRZVENDIVACOMP2.GetProperties as TcxCurrencyEditProperties).DecimalPlaces   := DM1.DecMicroPrz;
   (tvArtPRZVENDIVACOMP3.GetProperties as TcxCurrencyEditProperties).DecimalPlaces   := DM1.DecMicroPrz;
   (tvArtPRZVENDIVACOMP4.GetProperties as TcxCurrencyEditProperties).DecimalPlaces   := DM1.DecMicroPrz;
   (tvLFPREZZODILISTINO.GetProperties as TcxCurrencyEditProperties).DecimalPlaces    := DM1.DecMicroPrz;
   (tvLFPREZZODIACQUISTO.GetProperties as TcxCurrencyEditProperties).DecimalPlaces   := DM1.DecMicroPrz;
   // ========================================================================
end;


end.

