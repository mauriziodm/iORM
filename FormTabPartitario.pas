unit FormTabPartitario;
interface                                                                                                                                          
                                                                                                                                  
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPerTabPageControlPrincipale, cxCustomData,
  cxGraphics, cxEdit, cxTextEdit,
  cxCurrencyEdit, ExtCtrls, cxContainer, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, CheckLst, Mask, MAURI_SB, Buttons,
  cxPC, DB, IBODataset, IB_Components, cxMaskEdit, cxDropDownEdit,
  Menus, cxStyles, cxFilter, cxData, cxDataStorage, cxCalendar,
  cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxNavigator, dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations;

const
  INCLUDI_DDT = 0;
  INCLUDI_RICFISC = 1;
  INCLUDI_INTERVENTI = 2;
  INCLUDI_PRIMANOTA = 3;
  ESCLUDI_FATT_ACQUI = 4;

  OTHER_RIGHI_COME_NOTE = 0;
  OTHER_SOLO_PRAT_APERTE = 1;
  OTHER_NO_BOLLI_FATT = 2;

type
  TTabPartitarioForm = class(TModelPerTabPageControlPrincipaleForm)
    PageControlPartitario: TcxPageControl;
    TabPartSoggetti: TcxTabSheet;
    PanelPartitario: TPanel;
    PanelPartFiltri: TPanel;
    SubPanelPartFiltri: TPanel;
    Label25: TLabel;
    Label77: TLabel;
    PartFilterSet: TSpeedButton;
    PartFilterOtt: TSpeedButton;
    PartFilterNov: TSpeedButton;
    PartFilterDic: TSpeedButton;
    PartFilterAgo: TSpeedButton;
    PartFilterLug: TSpeedButton;
    PartFilterGiu: TSpeedButton;
    PartFilterMag: TSpeedButton;
    PartFilterGen: TSpeedButton;
    PartFilterFeb: TSpeedButton;
    PartFilterMar: TSpeedButton;
    PartFilterApr: TSpeedButton;
    PartFilterMesiTutti: TSpeedButton;
    PartFilterMesiNessuno: TSpeedButton;
    SBPartFilterOpenClose: TSpeedButtonRollOver;
    StaticText11: TStaticText;
    StaticText8: TStaticText;
    PartFilterInclude: TCheckListBox;
    StaticText80: TStaticText;
    PartFilterDescrizione: TEdit;
    GridPart: TcxGrid;
    tvPart: TcxGridTableView;
    tvPartTEMPID: TcxGridColumn;
    tvPartDATA: TcxGridColumn;
    tvPartDESCRIZIONE: TcxGridColumn;
    tvPartDARE: TcxGridColumn;
    tvPartAVERE: TcxGridColumn;
    tvPartBANCA: TcxGridColumn;
    tvPartNOTE: TcxGridColumn;
    tvPartDOCTIPO: TcxGridColumn;
    tvPartDOCNUM: TcxGridColumn;
    tvPartDOCREG: TcxGridColumn;
    tvPartDOCDATA: TcxGridColumn;
    lvPart: TcxGridLevel;
    Panel23: TPanel;
    PartSoggCollapseButton: TSpeedButton;
    PartSoggExpandButton: TSpeedButton;
    Panel21: TPanel;
    Label78: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    RiportoDare: TcxCurrencyEdit;
    RiportoAvere: TcxCurrencyEdit;
    RiportoSaldo: TcxCurrencyEdit;
    RiportoSegno: TcxTextEdit;
    Panel25: TPanel;
    Label79: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    LabelTotSaldo: TLabel;
    Shape25: TShape;
    Label90: TLabel;
    PanelFido: TPanel;
    Label80: TLabel;
    TotPartFido: TcxCurrencyEdit;
    TotDare: TcxCurrencyEdit;
    TotAvere: TcxCurrencyEdit;
    TotSaldo: TcxCurrencyEdit;
    TotPerDare: TcxCurrencyEdit;
    TotPerAvere: TcxCurrencyEdit;
    TotPerSaldo: TcxCurrencyEdit;
    TotSegno: TcxTextEdit;
    TotPerSegno: TcxTextEdit;
    TabPartIva: TcxTabSheet;
    Panel1: TPanel;
    PanelPartIvaFiltri: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    PartIvaFilterSet: TSpeedButton;
    PartIvaFilterOtt: TSpeedButton;
    PartIvaFilterNov: TSpeedButton;
    PartIvaFilterDic: TSpeedButton;
    PartIvaFilterAgo: TSpeedButton;
    PartIvaFilterLug: TSpeedButton;
    PartIvaFilterGiu: TSpeedButton;
    PartIvaFilterMag: TSpeedButton;
    PartIvaFilterGen: TSpeedButton;
    PartIvaFilterFeb: TSpeedButton;
    PartIvaFilterMar: TSpeedButton;
    PartIvaFilterApr: TSpeedButton;
    PartIvaFilterMesiTutti: TSpeedButton;
    PartIvaFilterMesiNessuno: TSpeedButton;
    SBPartIvaFilterOpenClose: TSpeedButtonRollOver;
    StaticText68: TStaticText;
    PartIvaFilterDescrizione: TEdit;
    GridPartIva: TcxGrid;
    tvPartIva: TcxGridTableView;
    tvPartIvaTEMPID: TcxGridColumn;
    tvPartIvaDATA: TcxGridColumn;
    tvPartIvaDESCRIZIONE: TcxGridColumn;
    tvPartIvaDARE: TcxGridColumn;
    tvPartIvaAVERE: TcxGridColumn;
    tvPartIvaBANCA: TcxGridColumn;
    tvPartIvaNOTE: TcxGridColumn;
    tvPartIvaDOCTIPO: TcxGridColumn;
    tvPartIvaDOCNUM: TcxGridColumn;
    tvPartIvaDOCREG: TcxGridColumn;
    tvPartIvaDOCDATA: TcxGridColumn;
    lvPartIva: TcxGridLevel;
    Panel9: TPanel;
    PartIvaCollapseButton: TSpeedButton;
    PartIvaExpandButton: TSpeedButton;
    Panel10: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    RiportoPartIvaDare: TcxCurrencyEdit;
    RiportoPartIvaAvere: TcxCurrencyEdit;
    RiportoPartIvaSaldo: TcxCurrencyEdit;
    RiportoPartIvaSegno: TcxTextEdit;
    Panel11: TPanel;
    Label31: TLabel;
    Label49: TLabel;
    Label52: TLabel;
    Label62: TLabel;
    Shape3: TShape;
    Label63: TLabel;
    Panel22: TPanel;
    Label64: TLabel;
    cxCurrencyEdit4: TcxCurrencyEdit;
    TotPartIvaDare: TcxCurrencyEdit;
    TotPartIvaAvere: TcxCurrencyEdit;
    TotPartIvaSaldo: TcxCurrencyEdit;
    TotPartIvaPerDare: TcxCurrencyEdit;
    TotPartIvaPerAvere: TcxCurrencyEdit;
    TotPartIvaPerSaldo: TcxCurrencyEdit;
    TotPartIvaSegno: TcxTextEdit;
    TotPartIvaPerSegno: TcxTextEdit;
    TabPartAltro: TcxTabSheet;
    Panel8: TPanel;
    PanelPartAltroFiltri: TPanel;
    Panel30: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    PartAltroFilterSet: TSpeedButton;
    PartAltroFilterOtt: TSpeedButton;
    PartAltroFilterNov: TSpeedButton;
    PartAltroFilterDic: TSpeedButton;
    PartAltroFilterAgo: TSpeedButton;
    PartAltroFilterLug: TSpeedButton;
    PartAltroFilterGiu: TSpeedButton;
    PartAltroFilterMag: TSpeedButton;
    PartAltroFilterGen: TSpeedButton;
    PartAltroFilterFeb: TSpeedButton;
    PartAltroFilterMar: TSpeedButton;
    PartAltroFilterApr: TSpeedButton;
    PartAltroFilterMesiTutti: TSpeedButton;
    PartAltroFilterMesiNessuno: TSpeedButton;
    SBPartAltroFilterOpenClose: TSpeedButtonRollOver;
    StaticText85: TStaticText;
    PartAltroFilterDescrizione: TEdit;
    GridPartAltro: TcxGrid;
    tvPartAltro: TcxGridTableView;
    tvPartAltroTEMPID: TcxGridColumn;
    tvPartAltroDATA: TcxGridColumn;
    tvPartAltroDESCRIZIONE: TcxGridColumn;
    tvPartAltroDARE: TcxGridColumn;
    tvPartAltroAVERE: TcxGridColumn;
    tvPartAltroBANCA: TcxGridColumn;
    tvPartAltroDOCTIPO: TcxGridColumn;
    tvPartAltroDOCNUM: TcxGridColumn;
    tvPartAltroDOCREG: TcxGridColumn;
    tvPartAltroDOCDATA: TcxGridColumn;
    tvPartAltroTIPO1: TcxGridColumn;
    tvPartAltroTIPO2: TcxGridColumn;
    tvPartAltroTIPO3: TcxGridColumn;
    tvPartAltroTIPO4: TcxGridColumn;
    tvPartAltroTIPO5: TcxGridColumn;
    tvPartAltroTIPO6: TcxGridColumn;
    lvPartAltro: TcxGridLevel;
    Panel36: TPanel;
    SpeedButton59: TSpeedButton;
    PartAltroExpandButton: TSpeedButton;
    Panel37: TPanel;
    Label67: TLabel;
    Label68: TLabel;
    Label71: TLabel;
    Label73: TLabel;
    RiportoPartAltroDare: TcxCurrencyEdit;
    RiportoPartAltroAvere: TcxCurrencyEdit;
    RiportoPartAltroSaldo: TcxCurrencyEdit;
    RiportoPartAltroSegno: TcxTextEdit;
    Panel38: TPanel;
    Label74: TLabel;
    Label75: TLabel;
    Label82: TLabel;
    Label95: TLabel;
    Shape4: TShape;
    Label123: TLabel;
    Panel39: TPanel;
    Label124: TLabel;
    cxCurrencyEdit14: TcxCurrencyEdit;
    TotPartAltroDare: TcxCurrencyEdit;
    TotPartAltroAvere: TcxCurrencyEdit;
    TotPartAltroSaldo: TcxCurrencyEdit;
    TotPartAltroPerDare: TcxCurrencyEdit;
    TotPartAltroPerAvere: TcxCurrencyEdit;
    TotPartAltroPerSaldo: TcxCurrencyEdit;
    TotPartAltroSegno: TcxTextEdit;
    TotPartAltroPerSegno: TcxTextEdit;
    PartAltroFilterLabelTipo1: TStaticText;
    PartAltroFilterTipo1: TcxComboBox;
    PartAltroFilterLabelTipo2: TStaticText;
    PartAltroFilterTipo2: TcxComboBox;
    PartAltroFilterLabelTipo3: TStaticText;
    PartAltroFilterTipo3: TcxComboBox;
    PartAltroFilterLabelTipo4: TStaticText;
    PartAltroFilterTipo4: TcxComboBox;
    PartAltroFilterLabelTipo5: TStaticText;
    PartAltroFilterTipo5: TcxComboBox;
    PartAltroFilterLabelTipo6: TStaticText;
    PartAltroFilterTipo6: TcxComboBox;
    MenuGrids: TPopupMenu;
    Selezionavista1: TMenuItem;
    Salvaimpostazionicolonne1: TMenuItem;
    Ripristinacolonneeliminate1: TMenuItem;
    N17: TMenuItem;
    EsportainformatoExcel1: TMenuItem;
    tvPartAltroNOTE: TcxGridColumn;
    tvPartSOGGETTO: TcxGridColumn;
    tvPartSALDO: TcxGridColumn;
    tvPartRIFPRATICA: TcxGridColumn;
    tvPartAGENTE: TcxGridColumn;
    tvPartSTATODESCRIZIONE: TcxGridColumn;
    tvPartSTATOFOREGROUND: TcxGridColumn;
    tvPartSTATOBACKGROUND: TcxGridColumn;
    tvPartIvaSOGGETTO: TcxGridColumn;
    tvPartIvaRIFPRATICA: TcxGridColumn;
    tvPartIvaAGENTE: TcxGridColumn;
    tvPartIvaSTATODESCRIZIONE: TcxGridColumn;
    tvPartIvaSTATOFOREGROUND: TcxGridColumn;
    tvPartIvaSTATOBACKGROUND: TcxGridColumn;
    tvPartAltroSOGGETTO: TcxGridColumn;
    tvPartAltroRIFPRATICA: TcxGridColumn;
    tvPartAltroAGENTE: TcxGridColumn;
    tvPartAltroSTATODESCRIZIONE: TcxGridColumn;
    tvPartAltroSTATOFOREGROUND: TcxGridColumn;
    tvPartAltroSTATOBACKGROUND: TcxGridColumn;
    SpeedButton21: TSpeedButton;
    Esportainformatotesto1: TMenuItem;
    tvPartAGENTE2: TcxGridColumn;
    tvPartAGENTE3: TcxGridColumn;
    tvPartAGENTE4: TcxGridColumn;
    LabelPartAgente: TStaticText;
    PartFilterAgente: TcxComboBox;
    LabelPartAgente2: TStaticText;
    PartFilterAgente2: TcxComboBox;
    LabelPartAgente3: TStaticText;
    PartFilterAgente3: TcxComboBox;
    LabelPartAgente4: TStaticText;
    PartFilterAgente4: TcxComboBox;
    LabelPartIvaAgente: TStaticText;
    PartIvaFilterAgente: TcxComboBox;
    LabelPartIvaAgente2: TStaticText;
    PartIvaFilterAgente2: TcxComboBox;
    LabelPartIvaAgente3: TStaticText;
    PartIvaFilterAgente3: TcxComboBox;
    LabelPartIvaAgente4: TStaticText;
    PartIvaFilterAgente4: TcxComboBox;
    tvPartIvaAGENTE2: TcxGridColumn;
    tvPartIvaAGENTE3: TcxGridColumn;
    tvPartIvaAGENTE4: TcxGridColumn;
    LabelPartAltroAgente: TStaticText;
    PartAltroFilterAgente: TcxComboBox;
    LabelPartAltroAgente2: TStaticText;
    PartAltroFilterAgente2: TcxComboBox;
    LabelPartAltroAgente3: TStaticText;
    PartAltroFilterAgente3: TcxComboBox;
    LabelPartAltroAgente4: TStaticText;
    PartAltroFilterAgente4: TcxComboBox;
    tvPartAltroAGENTE2: TcxGridColumn;
    tvPartAltroAGENTE3: TcxGridColumn;
    tvPartAltroAGENTE4: TcxGridColumn;
    StaticText35: TStaticText;
    PartFilterTipoSoggetto: TcxComboBox;
    PartFilterBanca: TcxComboBox;
    PartFilterDal: TcxDateEdit;
    PartFilterAl: TcxDateEdit;
    PartIvaFilterDal: TcxDateEdit;
    PartIvaFilterAl: TcxDateEdit;
    PartAltroFilterDal: TcxDateEdit;
    PartAltroFilterAl: TcxDateEdit;
    tvPartAltroSALDO: TcxGridColumn;
    tvPartIvaSALDO: TcxGridColumn;
    StaticText1: TStaticText;
    PartFilterOther: TCheckListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure PanelPartFiltriResize(Sender: TObject);
    procedure SBPartFilterOpenCloseClick(Sender: TObject);
    procedure SBPartIvaFilterOpenCloseClick(Sender: TObject);
    procedure SBPartAltroFilterOpenCloseClick(Sender: TObject);
    procedure PartFilterIncludeClickCheck(Sender: TObject);
    procedure PartFilterIncludeExit(Sender: TObject);
    procedure PartFilterIncludeMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PartFilterDescrizioneKeyPress(Sender: TObject;
      var Key: Char);
    procedure PartFilterMesiTuttiClick(Sender: TObject);
    procedure PartFilterMesiTuttiMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PartFilterMesiNessunoClick(Sender: TObject);
    procedure PartFilterMesiNessunoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PartFilterGenClick(Sender: TObject);
    procedure PartFilterGenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PartIvaFilterMesiTuttiClick(Sender: TObject);
    procedure PartIvaFilterMesiTuttiMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PartIvaFilterMesiNessunoClick(Sender: TObject);
    procedure PartIvaFilterMesiNessunoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PartIvaFilterGenClick(Sender: TObject);
    procedure PartIvaFilterGenMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PartAltroFilterMesiTuttiClick(Sender: TObject);
    procedure PartAltroFilterMesiTuttiMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PartAltroFilterMesiNessunoClick(Sender: TObject);
    procedure PartAltroFilterMesiNessunoMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PartAltroFilterGenClick(Sender: TObject);
    procedure PartAltroFilterGenMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvPartCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvPartCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvPartCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure tvPartDblClick(Sender: TObject);
    procedure tvPartEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure PageControlPartitarioChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PartAltroFilterTipo1PropertiesInitPopup(Sender: TObject);
    procedure PartSoggExpandButtonClick(Sender: TObject);
    procedure PartSoggCollapseButtonClick(Sender: TObject);
    procedure PartIvaCollapseButtonClick(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure PartIvaExpandButtonClick(Sender: TObject);
    procedure PartAltroExpandButtonClick(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure Salvaimpostazionicolonne1Click(Sender: TObject);
    procedure Ripristinacolonneeliminate1Click(Sender: TObject);
    procedure EsportainformatoExcel1Click(Sender: TObject);
    procedure tvPartSALDOGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure tvPartTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems2GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant;
      AIsFooter: Boolean; var AText: String);
    procedure tvPartDataControllerGroupingChanged(Sender: TObject);
    procedure tvPartCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvPartIvaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvPartAltroCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure MenuGridsPopup(Sender: TObject);
    procedure tvPartDataControllerSortingChanged(Sender: TObject);
    procedure tvPartIvaDataControllerSortingChanged(Sender: TObject);
    procedure tvPartAltroDataControllerSortingChanged(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure Esportainformatotesto1Click(Sender: TObject);
    procedure tvPartDAREGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure PartFilterAgentePropertiesEditValueChanged(Sender: TObject);
    procedure PartFilterAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure PartFilterAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure PartFilterAgentePropertiesInitPopup(Sender: TObject);
    procedure PartFilterAgente2PropertiesInitPopup(Sender: TObject);
    procedure PartFilterAgente3PropertiesInitPopup(Sender: TObject);
    procedure PartFilterAgente4PropertiesInitPopup(Sender: TObject);
    procedure PartIvaFilterAgentePropertiesEditValueChanged(
      Sender: TObject);
    procedure PartIvaFilterAgente2PropertiesEditValueChanged(
      Sender: TObject);
    procedure PartIvaFilterAgente3PropertiesEditValueChanged(
      Sender: TObject);
    procedure PartIvaFilterAgentePropertiesInitPopup(Sender: TObject);
    procedure PartIvaFilterAgente2PropertiesInitPopup(Sender: TObject);
    procedure PartIvaFilterAgente3PropertiesInitPopup(Sender: TObject);
    procedure PartIvaFilterAgente4PropertiesInitPopup(Sender: TObject);
    procedure PartAltroFilterAgentePropertiesEditValueChanged(
      Sender: TObject);
    procedure PartAltroFilterAgente2PropertiesEditValueChanged(
      Sender: TObject);
    procedure PartAltroFilterAgente3PropertiesEditValueChanged(
      Sender: TObject);
    procedure PartAltroFilterAgentePropertiesInitPopup(Sender: TObject);
    procedure PartAltroFilterAgente2PropertiesInitPopup(Sender: TObject);
    procedure PartAltroFilterAgente3PropertiesInitPopup(Sender: TObject);
    procedure PartAltroFilterAgente4PropertiesInitPopup(Sender: TObject);
    procedure PartFilterTipoSoggettoPropertiesInitPopup(Sender: TObject);
    procedure cxComboBox1PropertiesInitPopup(Sender: TObject);
    procedure tvPartAltroDataControllerGroupingChanged(Sender: TObject);
    procedure tvPartAltroTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure tvPartIvaDataControllerGroupingChanged(Sender: TObject);
  private
    function CalcolaScopertoCliente(DocType: String; DocNum: Integer;
      DocReg: String; DocDate: TDate; CodCli: String): Currency;
    function CaricaDocumentiPartitario(ID: Integer): Integer;
    function CaricaDocumentiPartitarioAltro(ID: Integer): Integer;
    function CaricaDocumentiPartitarioIva(ID: Integer): Integer;
    function CaricaPrimanotaSulPartitario(ID: Integer): Integer;
    function ControllaScopertoCliente(DocType: String; DocNum: Integer;
      DocReg: String; DocDate: TDate; CodCli: String; ImportoDoc: Currency;
      VisualizzaMessaggio: Boolean): Boolean;
    procedure EseguiQueryPartitarioAltroRiporti;
    procedure EseguiQueryPartitarioAltroTotali;
    procedure EseguiQueryPartitarioIvaRiporti;
    procedure EseguiQueryPartitarioIvaTotali;
    procedure EseguiQueryPartitarioRiporti;
    procedure EseguiQueryPartitarioTotali;
    procedure EsequiQueryPartitario;
    procedure EsequiQueryPartitarioAltro;
    procedure EsequiQueryPartitarioIva;
    procedure CaricaFormLayout;
    procedure CaricaTitoli;
    { Private declarations }
  public
    { Public declarations }
    procedure TrovaButtonClick(Sender: TObject); override;
    procedure ResetQueryButtonClick(Sender: TObject); override;
    procedure ApriDocumento(var DocType:String; var Registro:String; var DocNum:Longint; var DocDate:TDate);
    function GetCurrentGrid: TcxGrid;
  end;

var
  TabPartitarioForm: TTabPartitarioForm;

implementation

uses DataModule1, DataModuleStyles, SchedaClienti, DateUtils, FormPrimanota, main, IniFiles, StrUtils, cxGridExportLink;

{$R *.dfm}


procedure TTabPartitarioForm.CaricaFormLayout;
var
  LO: TMemIniFile;
  Sez: String;
begin
   // Caricamento di titoli e captions
   CaricaTitoli;
   // Apertura file layouts.ini
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try
     // ========================================================================
     // Settaggio CELL AUTO HEIGHT per le griglie
     // ------------------------------------------------------------------------
     Sez := 'CellAutoHeight';
     tvPart.OptionsView.CellAutoHeight       := LO.ReadBool(Sez, 'tvPart',      True);
     tvPartIva.OptionsView.CellAutoHeight    := LO.ReadBool(Sez, 'tvPartIva',   True);
     tvPartAltro.OptionsView.CellAutoHeight  := LO.ReadBool(Sez, 'tvPartAltro', True);
     // ========================================================================

     // ========================================================================
     // PARTITARIO
     // ------------------------------------------------------------------------
     Sez := 'PARTITARIO';
     // Filtri
     Self.PartAltroFilterTIPO1.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo1', False);
     Self.PartAltroFilterTIPO2.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo2', False);
     Self.PartAltroFilterTIPO3.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo3', False);
     Self.PartAltroFilterTIPO4.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo4', False);
     Self.PartAltroFilterTIPO5.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo5', False);
     Self.PartAltroFilterTIPO6.Visible := LO.ReadBool(Sez, 'Filter_TipoRigo6', False);
     Self.PartAltroFilterLabelTipo1.Visible := Self.PartAltroFilterTIPO1.Visible;
     Self.PartAltroFilterLabelTipo2.Visible := Self.PartAltroFilterTIPO2.Visible;
     Self.PartAltroFilterLabelTipo3.Visible := Self.PartAltroFilterTIPO3.Visible;
     Self.PartAltroFilterLabelTipo4.Visible := Self.PartAltroFilterTIPO4.Visible;
     Self.PartAltroFilterLabelTipo5.Visible := Self.PartAltroFilterTIPO5.Visible;
     Self.PartAltroFilterLabelTipo6.Visible := Self.PartAltroFilterTIPO6.Visible;
     // Colonne
     Self.tvPartAltroTIPO1.Visible := LO.ReadBool(Sez, 'PartAltro_Column_Tipo1', False);
     Self.tvPartAltroTIPO2.Visible := LO.ReadBool(Sez, 'PartAltro_Column_Tipo2', False);
     Self.tvPartAltroTIPO3.Visible := LO.ReadBool(Sez, 'PartAltro_Column_Tipo3', False);
     Self.tvPartAltroTIPO4.Visible := LO.ReadBool(Sez, 'PartAltro_Column_Tipo4', False);
     Self.tvPartAltroTIPO5.Visible := LO.ReadBool(Sez, 'PartAltro_Column_Tipo5', False);
     Self.tvPartAltroTIPO6.Visible := LO.ReadBool(Sez, 'PartAltro_Column_Tipo6', False);

     // Agenti partitario clienti/fornitori
     LabelPartAgente.Visible            := (DM1.GridsColumnAgenteCaption <> '');
     LabelPartAgente2.Visible           := (DM1.GridsColumnAgente2Caption <> '');
     LabelPartAgente3.Visible           := (DM1.GridsColumnAgente3Caption <> '');
     LabelPartAgente4.Visible           := (DM1.GridsColumnAgente4Caption <> '');
     PartFilterAgente.Visible           := (DM1.GridsColumnAgenteCaption <> '');
     PartFilterAgente2.Visible          := (DM1.GridsColumnAgente2Caption <> '');
     PartFilterAgente3.Visible          := (DM1.GridsColumnAgente3Caption <> '');
     PartFilterAgente4.Visible          := (DM1.GridsColumnAgente4Caption <> '');
     // Agenti partitario IVA
     LabelPartIvaAgente.Visible            := (DM1.GridsColumnAgenteCaption <> '');
     LabelPartIvaAgente2.Visible           := (DM1.GridsColumnAgente2Caption <> '');
     LabelPartIvaAgente3.Visible           := (DM1.GridsColumnAgente3Caption <> '');
     LabelPartIvaAgente4.Visible           := (DM1.GridsColumnAgente4Caption <> '');
     PartIvaFilterAgente.Visible           := (DM1.GridsColumnAgenteCaption <> '');
     PartIvaFilterAgente2.Visible          := (DM1.GridsColumnAgente2Caption <> '');
     PartIvaFilterAgente3.Visible          := (DM1.GridsColumnAgente3Caption <> '');
     PartIvaFilterAgente4.Visible          := (DM1.GridsColumnAgente4Caption <> '');
     // Agenti partitario ALTRO
     LabelPartAltroAgente.Visible            := (DM1.GridsColumnAgenteCaption <> '');
     LabelPartAltroAgente2.Visible           := (DM1.GridsColumnAgente2Caption <> '');
     LabelPartAltroAgente3.Visible           := (DM1.GridsColumnAgente3Caption <> '');
     LabelPartAltroAgente4.Visible           := (DM1.GridsColumnAgente4Caption <> '');
     PartAltroFilterAgente.Visible           := (DM1.GridsColumnAgenteCaption <> '');
     PartAltroFilterAgente2.Visible          := (DM1.GridsColumnAgente2Caption <> '');
     PartAltroFilterAgente3.Visible          := (DM1.GridsColumnAgente3Caption <> '');
     PartAltroFilterAgente4.Visible          := (DM1.GridsColumnAgente4Caption <> '');
     // ========================================================================
   finally
     LO.Free;
   end;
end;


procedure TTabPartitarioForm.CaricaTitoli;
var
  M: TMemIniFile;
  Sez: String;
begin
  M := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  try
    Sez := 'PARTITARIO';
    // ----- PARTITARIO SOGGETTI -----
    // Titoli colonne
    tvPartAGENTE.Caption              := DM1.GridsColumnAgenteCaption;
    tvPartAGENTE2.Caption             := DM1.GridsColumnAgente2Caption;
    tvPartAGENTE3.Caption             := DM1.GridsColumnAgente3Caption;
    tvPartAGENTE4.Caption             := DM1.GridsColumnAgente4Caption;
    tvPartRIFPRATICA.Caption          := DM1.GridsColumnPraticaCaption;
    // Titoli filtri
    LabelPartAgente.Caption           := ' ' + DM1.GridsColumnAgenteCaption;
    LabelPartAgente2.Caption          := ' ' + DM1.GridsColumnAgente2Caption;
    LabelPartAgente3.Caption          := ' ' + DM1.GridsColumnAgente3Caption;
    LabelPartAgente4.Caption          := ' ' + DM1.GridsColumnAgente4Caption;
    // ----- PARTITARIO IVA -----
    // Titoli colonne
    tvPartIvaAGENTE.Caption           := DM1.GridsColumnAgenteCaption;
    tvPartIvaAGENTE2.Caption          := DM1.GridsColumnAgente2Caption;
    tvPartIvaAGENTE3.Caption          := DM1.GridsColumnAgente3Caption;
    tvPartIvaAGENTE4.Caption          := DM1.GridsColumnAgente4Caption;
    tvPartIvaRIFPRATICA.Caption       := DM1.GridsColumnPraticaCaption;
    // Titoli filtri
    LabelPartIvaAgente.Caption        := ' ' + DM1.GridsColumnAgenteCaption;
    LabelPartIvaAgente2.Caption       := ' ' + DM1.GridsColumnAgente2Caption;
    LabelPartIvaAgente3.Caption       := ' ' + DM1.GridsColumnAgente3Caption;
    LabelPartIvaAgente4.Caption       := ' ' + DM1.GridsColumnAgente4Caption;
    // ----- PARTITARIO ALTRO -----
    // Titoli colonne
    tvPartAltroAGENTE.Caption         := DM1.GridsColumnAgenteCaption;
    tvPartAltroAGENTE2.Caption        := DM1.GridsColumnAgente2Caption;
    tvPartAltroAGENTE3.Caption        := DM1.GridsColumnAgente3Caption;
    tvPartAltroAGENTE4.Caption        := DM1.GridsColumnAgente4Caption;
    tvPartAltroRIFPRATICA.Caption     := DM1.GridsColumnPraticaCaption;
    tvPartAltroTIPO1.Caption          := M.ReadString(Sez, 'PartAltro_Column_Tipo1', 'Tipo 1');
    tvPartAltroTIPO2.Caption          := M.ReadString(Sez, 'PartAltro_Column_Tipo2', 'Tipo 2');
    tvPartAltroTIPO3.Caption          := M.ReadString(Sez, 'PartAltro_Column_Tipo3', 'Tipo 3');
    tvPartAltroTIPO4.Caption          := M.ReadString(Sez, 'PartAltro_Column_Tipo4', 'Tipo 4');
    tvPartAltroTIPO5.Caption          := M.ReadString(Sez, 'PartAltro_Column_Tipo5', 'Tipo 5');
    tvPartAltroTIPO6.Caption          := M.ReadString(Sez, 'PartAltro_Column_Tipo6', 'Tipo 6');
    // Titoli filtri
    LabelPartAltroAgente.Caption      := ' ' + DM1.GridsColumnAgenteCaption;
    LabelPartAltroAgente2.Caption     := ' ' + DM1.GridsColumnAgente2Caption;
    LabelPartAltroAgente3.Caption     := ' ' + DM1.GridsColumnAgente3Caption;
    LabelPartAltroAgente4.Caption     := ' ' + DM1.GridsColumnAgente4Caption;
    PartAltroFilterLabelTipo1.Caption := ' ' + M.ReadString(Sez, 'FilterPartAltro_TipoRigo1', 'Tipo rigo 1');
    PartAltroFilterLabelTipo2.Caption := ' ' + M.ReadString(Sez, 'FilterPartAltro_TipoRigo2', 'Tipo rigo 2');
    PartAltroFilterLabelTipo3.Caption := ' ' + M.ReadString(Sez, 'FilterPartAltro_TipoRigo3', 'Tipo rigo 3');
    PartAltroFilterLabelTipo4.Caption := ' ' + M.ReadString(Sez, 'FilterPartAltro_TipoRigo4', 'Tipo rigo 4');
    PartAltroFilterLabelTipo5.Caption := ' ' + M.ReadString(Sez, 'FilterPartAltro_TipoRigo5', 'Tipo rigo 5');
    PartAltroFilterLabelTipo6.Caption := ' ' + M.ReadString(Sez, 'FilterPartAltro_TipoRigo6', 'Tipo rigo 6');
  finally
    M.Free;
  end;
end;






// =============================================================================
// INIZIO - QUERY PER INTERROGAZIONE PARTITARIO E RELATIVI TOTALI
// -----------------------------------------------------------------------------

// Carica id dati sul partitario
procedure TTabPartitarioForm.EsequiQueryPartitario;
var
  ID: Integer;
begin
  // Inizializzazione
  ID := 0;
  // Disabilita l'aggiornameno a video
  tvPart.BeginUpdate;
  try
    // Suova la griglia;
    tvPart.DataController.RecordCount := 0;

    // Caricamento documenti
    DM1.ShowWait('Levante', 'Caricamento documenti...');
    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente
    if Trim(PartFilterBanca.Text) = '' then ID := CaricaDocumentiPartitario(ID);

    // Caricamento primanota
    if PartFilterInclude.Checked[INCLUDI_PRIMANOTA] then
    begin
      DM1.ShowWait('Levante', 'Caricamento movimenti...');
      CaricaPrimanotaSulPartitario(ID);
    end;

    // Caricamento Riporti
    DM1.ShowWait('Levante', 'Caricamento riporti...');
    EseguiQueryPartitarioRiporti;

    // CAricamento totali
    DM1.ShowWait('Levante', 'Caricamento totali...');
    EseguiQueryPartitarioTotali;

  finally
    DM1.CloseWait;
    // Riabilita l'aggiornamento a video
    tvPart.EndUpdate;
  end;
end;

function TTabPartitarioForm.CalcolaScopertoCliente(DocType:String; DocNum:Integer; DocReg:String; DocDate:TDate; CodCli:String): Currency;
var
  Q: TIB_Cursor;
  TmpTotDare, TmpTotAvere: Currency;
begin
  // Inizializzazione
  TmpTotDare := 0;
  TmpTotAvere := 0;
  Result := 0;
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente
    // =========================================================================
    // TOTALE DARE DOCUMENTI
    // -------------------------------------------------------------------------
    Q.SQL.Clear;
    Q.SQL.Add('SELECT SUM(T.TOTALEDAPAGARE)');
    Q.SQL.Add('FROM PRVORDCL T');
    Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fattura''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.R.F.''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''N.C.fornit''');
    if DM1.ConsideraDdtNelFido then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''D.D.T.''   AND   T.DAFATTURARE = ''F'')');
    Q.SQL.Add('      )');
    Q.SQL.Add(' AND NOT (T.TipoDocumento = ''' + DocType + ''' AND T.NumOrdPrev = ' + IntToStr(DocNum) + ' AND T.Registro = ''' + DocReg + ''' AND T.DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DocDate) + ''')');
    Q.SQL.Add(' AND T.CodiceCliente = ' + CodCli);
    // Apertura
    Q.Open;
    TmpTotDare := Q.Fields[0].AsCurrency;
    Q.Close;
    // =========================================================================

    // =========================================================================
    // TOTALE AVERE DOCUMENTI
    // -------------------------------------------------------------------------
    Q.SQL.Clear;
    Q.SQL.Add('SELECT SUM(T.TOTALEDAPAGARE)');
    Q.SQL.Add('FROM PRVORDCL T');
    Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fatt.acqui''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Nota_accre''');
    Q.SQL.Add('      )');
    Q.SQL.Add(' AND NOT (T.TipoDocumento = ''' + DocType + ''' AND T.NumOrdPrev = ' + IntToStr(DocNum) + ' AND T.Registro = ''' + DocReg + ''' AND T.DataDocumento = ''' + FormatDateTime('mm/dd/yyyy', DocDate) + ''')');
    Q.SQL.Add(' AND T.CodiceCliente = ' + CodCli);
    // Apertura
    Q.Open;
    TmpTotAvere := Q.Fields[0].AsCurrency;
    Q.Close;
    // =========================================================================

    // =========================================================================
    // TOTALE DARE/AVERE PRIMANOTA
    // -------------------------------------------------------------------------
    Q.SQL.Clear;
    Q.SQL.Add('SELECT SUM(P.CASSAENTRATE) AS CASSAENTRATE, SUM(P.CASSAUSCITE) AS CASSAUSCITE, SUM(P.FUORIENTRATE) AS FUORIENTRATE, SUM(P.FUORIUSCITE) AS FUORIUSCITE, SUM(P.ABBUONIATTIVI) AS ABBUONIATTIVI, SUM(P.ABBUONIPASSIVI) AS ABBUONIPASSIVI');
    Q.SQL.Add('FROM PRIMANOT P');
    Q.SQL.Add('WHERE 1=1');
    Q.SQL.Add(' AND P.Cliente = ' + CodCli);
    // Apertura
    Q.Open;
    TmpTotAvere := TmpTotAvere + Q.FieldByName('CASSAENTRATE').AsCurrency + Q.FieldByName('FUORIENTRATE').AsCurrency + Q.FieldByName('ABBUONIPASSIVI').AsCurrency;
    TmpTotDare := TmpTotDare + Q.FieldByName('CASSAUSCITE').AsCurrency + Q.FieldByName('FUORIUSCITE').AsCurrency + Q.FieldByName('ABBUONIATTIVI').AsCurrency;
    Q.Close;
    // =========================================================================

    // Calcola lo scoperto attuale del cliente
    Result := TmpTotDare - TmpTotAvere;

  // Chiusura finale
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

function TTabPartitarioForm.ControllaScopertoCliente(DocType:String; DocNum:Integer; DocReg:String; DocDate:TDate; CodCli:String; ImportoDoc:Currency; VisualizzaMessaggio:Boolean): Boolean;
var
  Q: TIB_Cursor;
  TmpTotScoperto, TmpImportoFidoConcesso: Currency;
begin
  // Inizializzazione
  TmpTotScoperto := 0;
  TmpImportoFidoConcesso := 0;
  Result := False;
  // Il controllo ha senso solo se sitmao facendo un documento di vendita
  if (DocType = 'Fattura')
  or (DocType = 'Fatt.R.F.')
  or (DocType = 'N.C.fornit')
  or (  (DocType = 'D.D.T.') and (DM1.ConsideraDdtNelFido)  )
  then begin
    // Inizializza la query
    Q := TIB_Cursor.Create(nil);
    try
      Q.DatabaseName  := DM1.ArcDBFile;
      Q.IB_Connection := DM1.DBAzienda;

      // =========================================================================
      // CARICA L'IMPORTO DI FIDO CONCESSO AL CLIENTE
      // -------------------------------------------------------------------------
      Q.SQL.Add('SELECT IMPORTOFIDO');
      Q.SQL.Add('FROM CLIENTI C');
      Q.SQL.Add('WHERE CODICE = ' + CodCli);
      // Apertura
      Q.Open;
      // Caricamento del fido concesso in una variabile locale per comodità
      if not Q.Eof then TmpImportoFidoConcesso := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================

      // Calcola lo scoperto attuale del cliente
      TmpTotScoperto := CalcolaScopertoCliente(DocType, DocNum, DocReg, DocDate, CodCli) + ImportoDoc;

      // Eseguq il controllo
      if (TmpTotScoperto > TmpImportoFidoConcesso) and (TmpImportoFidoConcesso <> 0) then begin
        Result := True;
        if VisualizzaMessaggio then begin
          // Se il cliente ha sforato il fido visualizza un messaggio di avvertimento
          if DM1.Messaggi('ATTENZIONE !!! - Controllo fido cliente', 'FIDO SUPERATO !!!'#13#13'Il debito accumulato dal soggetto ha superato l''importo del fido concesso.'#13#13#13'CONFERMARE UGUALMENTE IL DOCUMENTO?', '', [mbYes,mbNo],0, nil) = mrYes
          then Result := False;
          // Se abilitato, richiede una password per sbloccare il documento e andare avanti anche fuori fido
          if not Result then begin
            Result := not DM1.VerificaPassword(DM1.TableProgressiviPSWD_FIDO.AsString);
          end;
        end;
      end;

    // Chiusura finale
    finally
      if Q.Active then Q.Close;
      Q.Free;
    end;
  end;
end;


procedure TTabPartitarioForm.EseguiQueryPartitarioTotali;
var
  Q: TIB_Cursor;
  TmpTotDare, TmpTotAvere: Currency;
begin
  // Inizializzazione
  TmpTotDare := 0;
  TmpTotAvere := 0;
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente
    if Trim(PartFilterBanca.Text) = '' then begin
      // =========================================================================
      // TOTALE DARE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(T.TOTALEDAPAGARE), SUM(T.BOLLOIMPORTO)');
      Q.SQL.Add('FROM PRVORDCL T');
      Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=T.CODICECLIENTE AND T.CODICECLIENTE<>0)');
      Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fattura''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.R.F.''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''N.C.fornit''');
      if PartFilterInclude.Checked[0] then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''D.D.T.''   AND   T.DAFATTURARE = ''F'')');
      if PartFilterInclude.Checked[1] then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''Ricev.fisc'')');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] then
        Q.SQL.Add('AND (   coalesce(T.PRATICA,0)>0 AND (SELECT FIRST 1 PP.DATACHIUSURA FROM PRATICHE PP WHERE PP.Codice=T.Pratica AND PP.DataApertura=T.DataPratica1) IS NULL   )');

      if PartFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartFilterDescrizione.Text, True);

      if PartFilterTipoSoggetto.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'C.CLIENTEFORNITORE' , PartFilterTipoSoggetto.Text, True);

      if PartFilterAgente.Text  <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartFilterAgente.Text, True);
      if PartFilterAgente2.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartFilterAgente2.Text, True);
      if PartFilterAgente3.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartFilterAgente3.Text, True);
      if PartFilterAgente4.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterDal.EditText)) + '''');
      if DM1.ControllaDataStr(PartFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterAl.EditText)) + '''');
      // Apertura
      Q.Open;
      TmpTotDare := Q.Fields[0].AsCurrency;
      if PartFilterOther.Checked[OTHER_NO_BOLLI_FATT] then
        TmpTotDare := TmpTotDare - Q.Fields[1].AsCurrency;
      Q.Close;
      // =========================================================================

      // =========================================================================
      // TOTALE AVERE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(T.TOTALEDAPAGARE), SUM(T.BOLLOIMPORTO)');
      Q.SQL.Add('FROM PRVORDCL T');
      Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=T.CODICECLIENTE AND T.CODICECLIENTE<>0)');
      Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fatt.acqui''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Nota_accre''');
      if PartFilterInclude.Checked[INCLUDI_INTERVENTI] then Q.SQL.Add('OR T.TIPODOCUMENTO = ''Intervento''');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] then
        Q.SQL.Add('AND (   coalesce(T.PRATICA,0)>0 AND (SELECT FIRST 1 PP.DATACHIUSURA FROM PRATICHE PP WHERE PP.Codice=T.Pratica AND PP.DataApertura=T.DataPratica1) IS NULL   )');

      if PartFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartFilterDescrizione.Text, True);

      if PartFilterTipoSoggetto.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'C.CLIENTEFORNITORE' , PartFilterTipoSoggetto.Text, True);

      if PartFilterAgente.Text  <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartFilterAgente.Text, True);
      if PartFilterAgente2.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartFilterAgente2.Text, True);
      if PartFilterAgente3.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartFilterAgente3.Text, True);
      if PartFilterAgente4.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterDal.EditText)) + '''');
      if DM1.ControllaDataStr(PartFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterAl.EditText)) + '''');
      // Apertura
      Q.Open;
      TmpTotAvere := Q.Fields[0].AsCurrency;
      if PartFilterOther.Checked[OTHER_NO_BOLLI_FATT] then
        TmpTotAvere := TmpTotAvere - Q.Fields[1].AsCurrency;
      Q.Close;
      // =========================================================================
    end;

    // =========================================================================
    // TOTALE DARE/AVERE PRIMANOTA
    // -------------------------------------------------------------------------
    if PartFilterInclude.Checked[INCLUDI_PRIMANOTA] then
    begin
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(P.CASSAENTRATE) AS CASSAENTRATE, SUM(P.CASSAUSCITE) AS CASSAUSCITE, SUM(P.FUORIENTRATE) AS FUORIENTRATE, SUM(P.FUORIUSCITE) AS FUORIUSCITE, SUM(P.ABBUONIATTIVI) AS ABBUONIATTIVI, SUM(P.ABBUONIPASSIVI) AS ABBUONIPASSIVI');
      Q.SQL.Add('FROM PRIMANOT P');
      Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=P.CLIENTE AND P.CLIENTE<>0)');
      Q.SQL.Add('WHERE 1=1');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
          DM1.AddSQLToIB_Cursor(Q, 'AND', '((P.Pratica='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (P.Pratica2='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (P.Pratica3='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'P.Cliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] then
        Q.SQL.Add('AND (   coalesce(P.PRATICA,0)>0 AND (SELECT FIRST 1 PP.DATACHIUSURA FROM PRATICHE PP WHERE PP.Codice=P.Pratica AND PP.DataApertura=P.DataPratica1) IS NULL   )');

      if PartFilterDescrizione.Text <> '' then begin
        Q.SQL.Add('AND (');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.DESCRIZIONE', PartFilterDescrizione.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.NOTE', PartFilterDescrizione.Text, False);
        Q.SQL.Add('    )');
      end;

      if PartFilterTipoSoggetto.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'C.CLIENTEFORNITORE' , PartFilterTipoSoggetto.Text, True);
      if PartFilterBanca.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.DESCFUORI' , PartFilterBanca.Text, True);

      if PartFilterAgente.Text  <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE' , PartFilterAgente.Text, True);
      if PartFilterAgente2.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE2', PartFilterAgente2.Text, True);
      if PartFilterAgente3.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE3', PartFilterAgente3.Text, True);
      if PartFilterAgente4.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE4', PartFilterAgente4.Text, True);

      if DM1.ControllaDataStr(PartFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'P.Data >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterDal.EditText)) + '''');
      if DM1.ControllaDataStr(PartFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'P.Data <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterAl.EditText)) + '''');
      // Apertura
      Q.Open;
      TmpTotAvere := TmpTotAvere + Q.FieldByName('CASSAENTRATE').AsCurrency + Q.FieldByName('FUORIENTRATE').AsCurrency + Q.FieldByName('ABBUONIPASSIVI').AsCurrency;
      TmpTotDare := TmpTotDare + Q.FieldByName('CASSAUSCITE').AsCurrency + Q.FieldByName('FUORIUSCITE').AsCurrency + Q.FieldByName('ABBUONIATTIVI').AsCurrency;
      Q.Close;
    end;
    // =========================================================================

    // Aggiorna i riporti a video
    TotPerDare.Value   := TmpTotDare;
    TotPerAvere.Value  := TmpTotAvere;
    TotPerSaldo.Value  := Abs(TmpTotDare - TmpTotAvere);
    if TmpTotDare = TmpTotAvere then TotPerSegno.Text := '-'
    else if TmpTotDare > TmpTotAvere then TotPerSegno.Text := 'D'
    else TotPerSegno.Text := 'A';
    TotDare.Value      := TotPerDare.Value + RiportoDare.Value;
    TotAvere.Value     := TotPerAvere.Value + RiportoAvere.Value;
    TotSaldo.Value     := Abs(TotDare.Value - TotAvere.Value);
    if TotDare.Value = TotAvere.Value then TotSegno.Text := '-'
    else if TotDare.Value > TotAvere.Value then TotSegno.Text := 'D'
    else TotSegno.Text := 'A';
  // Chiusura finale
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

procedure TTabPartitarioForm.EseguiQueryPartitarioRiporti;
var
  Q: TIB_Cursor;
  TmpRiportoDare, TmpRiportoAvere: Currency;
begin
  // Se non è specificato il filtro DataDal non fa nulla e mette i riporti := 0;
  if not DM1.ControllaDataStr(PartFilterDal.EditText) then begin
    RiportoDare.Value := 0;
    RiportoAvere.Value := 0;
    RiportoSaldo.Value := 0;
    RiportoSegno.Text := '-';
    Exit;
  end;
  // Inizializzazione
  TmpRiportoDare := 0;
  TmpRiportoAvere := 0;
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente
    if Trim(PartFilterBanca.Text) = '' then begin
      // =========================================================================
      // RIPORTO DARE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(T.TOTALEDAPAGARE), SUM(T.BOLLOIMPORTO)');
      Q.SQL.Add('FROM PRVORDCL T');
      Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=T.CODICECLIENTE AND T.CODICECLIENTE<>0)');
      Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fattura''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.R.F.''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''N.C.fornit''');
      if PartFilterInclude.Checked[INCLUDI_DDT]     then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''D.D.T.''   AND   T.DAFATTURARE = ''F'')');
      if PartFilterInclude.Checked[INCLUDI_RICFISC] then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''Ricev.fisc'')');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] then
        Q.SQL.Add('AND (   coalesce(T.PRATICA,0)>0 AND (SELECT FIRST 1 PP.DATACHIUSURA FROM PRATICHE PP WHERE PP.Codice=T.Pratica AND PP.DataApertura=T.DataPratica1) IS NULL   )');

      if PartFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartFilterDescrizione.Text, True);

      if PartFilterTipoSoggetto.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'C.CLIENTEFORNITORE' , PartFilterTipoSoggetto.Text, True);

      if PartFilterAgente.Text  <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartFilterAgente.Text, True);
      if PartFilterAgente2.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartFilterAgente2.Text, True);
      if PartFilterAgente3.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartFilterAgente3.Text, True);
      if PartFilterAgente4.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterDal.EditText)) + '''');
      // Apertura
//Q.SQL.SaveToFile('c:\SQL_DOCDARE.txt');
      Q.Open;
      TmpRiportoDare := Q.Fields[0].AsCurrency;
      if PartFilterOther.Checked[OTHER_NO_BOLLI_FATT] then
        TmpRiportoDare := TmpRiportoDare - Q.Fields[1].AsCurrency;
      Q.Close;
      // =========================================================================

      // =========================================================================
      // RIPORTO AVERE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(T.TOTALEDAPAGARE), SUM(T.BOLLOIMPORTO)');
      Q.SQL.Add('FROM PRVORDCL T');
      Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=T.CODICECLIENTE AND T.CODICECLIENTE<>0)');
      Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fatt.acqui''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Nota_accre''');
      if PartFilterInclude.Checked[INCLUDI_INTERVENTI] then Q.SQL.Add('OR T.TIPODOCUMENTO = ''Intervento''');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] then
        Q.SQL.Add('AND (   coalesce(T.PRATICA,0)>0 AND (SELECT FIRST 1 PP.DATACHIUSURA FROM PRATICHE PP WHERE PP.Codice=T.Pratica AND PP.DataApertura=T.DataPratica1) IS NULL   )');

      if PartFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartFilterDescrizione.Text, True);

      if PartFilterTipoSoggetto.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'C.CLIENTEFORNITORE' , PartFilterTipoSoggetto.Text, True);

      if PartFilterAgente.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartFilterAgente.Text, True);
      if PartFilterAgente2.Text <> ''     then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartFilterAgente2.Text, True);
      if PartFilterAgente3.Text <> ''     then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartFilterAgente3.Text, True);
      if PartFilterAgente4.Text <> ''     then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterDal.EditText)) + '''');
      // Apertura
//Q.SQL.SaveToFile('c:\SQL_DOCAVERE.txt');
      Q.Open;
      TmpRiportoAvere := Q.Fields[0].AsCurrency;
      if PartFilterOther.Checked[OTHER_NO_BOLLI_FATT] then
        TmpRiportoAvere := TmpRiportoAvere - Q.Fields[1].AsCurrency;
      Q.Close;
      // =========================================================================
    end;

    // =========================================================================
    // RIPORTO DARE/AVERE PRIMANOTA
    // -------------------------------------------------------------------------
    if PartFilterInclude.Checked[INCLUDI_PRIMANOTA] then
    begin
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(P.CASSAENTRATE) AS CASSAENTRATE, SUM(P.CASSAUSCITE) AS CASSAUSCITE, SUM(P.FUORIENTRATE) AS FUORIENTRATE, SUM(P.FUORIUSCITE) AS FUORIUSCITE, SUM(P.ABBUONIATTIVI) AS ABBUONIATTIVI, SUM(P.ABBUONIPASSIVI) AS ABBUONIPASSIVI');
      Q.SQL.Add('FROM PRIMANOT P');
      Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=P.CLIENTE AND P.CLIENTE<>0)');
      Q.SQL.Add('WHERE 1=1');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
          DM1.AddSQLToIB_Cursor(Q, 'AND', '((P.Pratica='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (P.Pratica2='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (P.Pratica3='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'P.Cliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] then
        Q.SQL.Add('AND (   coalesce(P.PRATICA,0)>0 AND (SELECT FIRST 1 PP.DATACHIUSURA FROM PRATICHE PP WHERE PP.Codice=P.Pratica AND PP.DataApertura=P.DataPratica1) IS NULL   )');

      if PartFilterDescrizione.Text <> '' then begin
        Q.SQL.Add('AND (');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.DESCRIZIONE', PartFilterDescrizione.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.NOTE', PartFilterDescrizione.Text, False);
        Q.SQL.Add('    )');
      end;

      if PartFilterTipoSoggetto.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'C.CLIENTEFORNITORE' , PartFilterTipoSoggetto.Text, True);
      if PartFilterBanca.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.DESCFUORI' , PartFilterBanca.Text, True);

      if PartFilterAgente.Text  <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE' , PartFilterAgente.Text, True);
      if PartFilterAgente2.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE2', PartFilterAgente2.Text, True);
      if PartFilterAgente3.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE3', PartFilterAgente3.Text, True);
      if PartFilterAgente4.Text <> ''      then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE4', PartFilterAgente4.Text, True);

      if DM1.ControllaDataStr(PartFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'P.Data < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterDal.EditText)) + '''');
      // Apertura
  //Q.SQL.SaveToFile('c:\SQL_PRIMANOTA.txt');
      Q.Open;
      TmpRiportoAvere := TmpRiportoAvere + Q.FieldByName('CASSAENTRATE').AsCurrency + Q.FieldByName('FUORIENTRATE').AsCurrency + Q.FieldByName('ABBUONIPASSIVI').AsCurrency;
      TmpRiportoDare := TmpRiportoDare + Q.FieldByName('CASSAUSCITE').AsCurrency + Q.FieldByName('FUORIUSCITE').AsCurrency + Q.FieldByName('ABBUONIATTIVI').AsCurrency;
      Q.Close;
    end;
    // =========================================================================

    // Aggiorna i riporti a video
    RiportoDare.Value  := TmpRiportoDare;
    RiportoAvere.Value := TmpRiportoAvere;
    RiportoSaldo.Value := Abs(TmpRiportoDare - TmpRiportoAvere);
    if TmpRiportoDare = TmpRiportoAvere then RiportoSegno.Text := '-'
    else if TmpRiportoDare > TmpRiportoAvere then RiportoSegno.Text := 'D'
    else RiportoSegno.Text := 'A';
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

// Procedura che carica i movimenti di promanota nel partitario
function TTabPartitarioForm.CaricaPrimanotaSulPartitario(ID: Integer): Integer;
var
  Q: TIB_Cursor;
  RI: Integer;
  TmpDare, TmpAvere, TmpSaldo: Currency;
begin
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT P.CODICE, P.DATA, P.DESCRIZIONE, COALESCE(P.CASSAENTRATE,0) AS CASSAENTRATE, COALESCE(P.CASSAUSCITE,0) AS CASSAUSCITE, COALESCE(P.FUORIENTRATE,0) AS FUORIENTRATE, COALESCE(P.FUORIUSCITE,0) AS FUORIUSCITE,');
    Q.SQL.Add(' P.DESCFUORI, COALESCE(P.ABBUONIATTIVI,0) AS ABBUONIATTIVI, COALESCE(P.ABBUONIPASSIVI,0) AS ABBUONIPASSIVI, P.NOTE, P.STATODESCRIZIONE, P.STATOBACKGROUND, P.STATOFOREGROUND,');
    Q.SQL.Add(' P.AGENTE, P.AGENTE2, P.AGENTE3, P.AGENTE4,');
    Q.SQL.Add(' CAST(C.RAGIONESOCIALE || ''   ('' || C.CODICE || '')'' AS VARCHAR(200)) AS SOGGETTO,');
    Q.SQL.Add(' CAST((SELECT A.DESCRIZIONE FROM Pratiche A WHERE A.Codice=P.Pratica AND A.DataApertura=P.DataPratica1)||''  (''||P.PRATICA|| '', ''||P.DATAPRATICA1||'')'' AS VARCHAR(120)) AS RIFPRATICA');
    Q.SQL.Add('FROM PRIMANOT P');
    Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=P.CLIENTE AND P.CLIENTE<>0)');
    Q.SQL.Add('WHERE 1=1');

    // Filtri
    if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((P.Pratica='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (P.Pratica2='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (P.Pratica3='+ClientiForm.PraticaCorrente+' AND P.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
    end else begin
      if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'P.Cliente = ' + ClientiForm.ClienteCorrente);
    end;

    if PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] then
      Q.SQL.Add('AND (   coalesce(P.PRATICA,0)>0 AND (SELECT FIRST 1 PP.DATACHIUSURA FROM PRATICHE PP WHERE PP.Codice=P.Pratica AND PP.DataApertura=P.DataPratica1) IS NULL   )');

    if PartFilterDescrizione.Text <> '' then begin
      Q.SQL.Add('AND (');
      DM1.AggiungiRicercaCampo(Q.SQL, 'P.DESCRIZIONE', PartFilterDescrizione.Text, False);
      Q.SQL.Add('OR');
      DM1.AggiungiRicercaCampo(Q.SQL, 'P.NOTE', PartFilterDescrizione.Text, False);
      Q.SQL.Add('    )');
    end;

    // Escludi fatture di acquisto e movimenti relativi
    if PartFilterInclude.Checked[ESCLUDI_FATT_ACQUI] then
      Q.SQL.Add('AND COALESCE(P.RelativoFattAcqui,''F'') <> ''T''');

    if PartFilterTipoSoggetto.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'C.CLIENTEFORNITORE' , PartFilterTipoSoggetto.Text, True);
    if PartFilterBanca.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.DESCFUORI' , PartFilterBanca.Text, True);

    if PartFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE' , PartFilterAgente.Text, True);
    if PartFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE2', PartFilterAgente2.Text, True);
    if PartFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE3', PartFilterAgente3.Text, True);
    if PartFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.AGENTE4', PartFilterAgente4.Text, True);

    if DM1.ControllaDataStr(PartFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'Data >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterDal.EditText)) + '''');
    if DM1.ControllaDataStr(PartFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'Data <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterAl.EditText)) + '''');

    // Apertura
    Q.Open;
    // Caricamento
    while not Q.Eof do begin
      Inc(ID);
      with tvPart.DataController do begin
        RI := AppendRecord;
        Values[RI, tvPartTEMPID.Index] := ID;
        Values[RI, tvPartDATA.Index] := Q.FieldByName('DATA').AsDate;
        Values[RI, tvPartDESCRIZIONE.Index] := Q.FieldByName('DESCRIZIONE').AsString;

        TmpAvere := Q.FieldByName('CASSAENTRATE').AsCurrency + Q.FieldByName('FUORIENTRATE').AsCurrency;
        Values[RI, tvPartAVERE.Index] := TmpAvere;

        TmpDare := Q.FieldByName('CASSAUSCITE').AsCurrency + Q.FieldByName('FUORIUSCITE').AsCurrency;
        Values[RI, tvPartDARE.Index] := TmpDare;

        TmpSaldo := TmpDare - TmpAvere;
        Values[RI, tvPartSALDO.Index] := TmpSaldo;

        Values[RI, tvPartBANCA.Index] := Q.FieldByName('DESCFUORI').AsString;
        Values[RI, tvPartNOTE.Index] := Q.FieldByName('NOTE').AsString;
        Values[RI, tvPartDOCTIPO.Index] := 'PRIMANOTA';
        Values[RI, tvPartDOCNUM.Index] := Q.FieldByName('CODICE').AsInt64;
        Values[RI, tvPartDOCREG.Index] := '-';
        Values[RI, tvPartDOCDATA.Index] := Q.FieldByName('DATA').AsDate;
        Values[RI, tvPartSOGGETTO.Index] := Q.FieldByName('SOGGETTO').AsString;
        Values[RI, tvPartRIFPRATICA.Index]        := Q.FieldByName('RIFPRATICA').AsString;
        Values[RI, tvPartAGENTE.Index]            := Q.FieldByName('AGENTE').AsString;
        Values[RI, tvPartAGENTE2.Index]           := Q.FieldByName('AGENTE2').AsString;
        Values[RI, tvPartAGENTE3.Index]           := Q.FieldByName('AGENTE3').AsString;
        Values[RI, tvPartAGENTE4.Index]           := Q.FieldByName('AGENTE4').AsString;
        Values[RI, tvPartSTATODESCRIZIONE.Index]  := Q.FieldByName('STATODESCRIZIONE').AsString;
        Values[RI, tvPartSTATOFOREGROUND.Index]   := Q.FieldByName('STATOFOREGROUND').AsString;
        Values[RI, tvPartSTATOBACKGROUND.Index]   := Q.FieldByName('STATOBACKGROUND').AsString;
        // Se c'è un abbuono aggiunge un record per l'abbuono
        if (Q.FieldByName('ABBUONIATTIVI').AsFloat <> 0) or (Q.FieldByName('ABBUONIPASSIVI').AsFloat <> 0) then begin
          Inc(ID);
          RI := AppendRecord;
          Values[RI, tvPartTEMPID.Index] := ID;
          Values[RI, tvPartDATA.Index] := Q.FieldByName('DATA').AsDate;
          Values[RI, tvPartDESCRIZIONE.Index] := 'Abbuono su ' + Q.FieldByName('DESCRIZIONE').AsString;

          TmpAvere := Q.FieldByName('ABBUONIPASSIVI').AsCurrency;
          Values[RI, tvPartAVERE.Index] := TmpAvere;

          TmpDare := Q.FieldByName('ABBUONIATTIVI').AsCurrency;
          Values[RI, tvPartDARE.Index] := TmpDare;

          TmpSaldo := TmpDare - TmpAvere;
          Values[RI, tvPartSALDO.Index] := TmpSaldo;

          Values[RI, tvPartDOCTIPO.Index] := 'PRIMANOTA';
          Values[RI, tvPartDOCNUM.Index] := Q.FieldByName('CODICE').AsInt64;
          Values[RI, tvPartDOCREG.Index] := '-';
          Values[RI, tvPartDOCDATA.Index] := Q.FieldByName('DATA').AsDate;
          Values[RI, tvPartSOGGETTO.Index] := Q.FieldByName('SOGGETTO').AsString;
          Values[RI, tvPartRIFPRATICA.Index]        := Q.FieldByName('RIFPRATICA').AsString;
          Values[RI, tvPartAGENTE.Index]            := Q.FieldByName('AGENTE').AsString;
          Values[RI, tvPartAGENTE2.Index]           := Q.FieldByName('AGENTE2').AsString;
          Values[RI, tvPartAGENTE3.Index]           := Q.FieldByName('AGENTE3').AsString;
          Values[RI, tvPartAGENTE4.Index]           := Q.FieldByName('AGENTE4').AsString;
          Values[RI, tvPartSTATODESCRIZIONE.Index]  := Q.FieldByName('STATODESCRIZIONE').AsString;
          Values[RI, tvPartSTATOFOREGROUND.Index]   := Q.FieldByName('STATOFOREGROUND').AsString;
          Values[RI, tvPartSTATOBACKGROUND.Index]   := Q.FieldByName('STATOBACKGROUND').AsString;
        end;
      end;
      Q.Next;
    end;
  finally
    Result := ID;
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

// Procedura che carica i documenti nel partitario
function TTabPartitarioForm.CaricaDocumentiPartitario(ID: Integer): Integer;
var
  Q: TIB_Cursor;
  RI: Integer;
  CurrDocTipo: String;
  TmpImporto: Currency;
begin
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT T.TIPODOCUMENTO, T.NUMORDPREV, T.REGISTRO, T.DATADOCUMENTO, COALESCE(T.TOTALEDAPAGARE,0) AS TOTALEDAPAGARE, COALESCE(T.BOLLOIMPORTO,0) AS BOLLOIMPORTO,');
    Q.SQL.Add('  T.STATODESCRIZIONE, T.STATOBACKGROUND, T.STATOFOREGROUND, T.AGENTE, T.AGENTE2, T.AGENTE3, T.AGENTE4,');
    if PartFilterOther.Checked[OTHER_RIGHI_COME_NOTE] then
      Q.SQL.Add('CAST(   (SELECT N.OUTVAR FROM PARTITARIO_COMPONINOTADOCUMENTO(T.TIPODOCUMENTO, T.REGISTRO, T.NUMORDPREV, T.DATADOCUMENTO) N) || COALESCE(T.NOTE,'''')   AS VARCHAR(1000)) AS NOTE,')
    else
      Q.SQL.Add('T.NOTE,');
    Q.SQL.Add(' CAST(C.RAGIONESOCIALE || ''   ('' || C.CODICE || '')'' AS VARCHAR(200)) AS SOGGETTO,');
    Q.SQL.Add(' CAST((SELECT P.DESCRIZIONE FROM Pratiche P WHERE P.Codice=T.Pratica AND P.DataApertura=T.DataPratica1)||''  (''||T.PRATICA|| '', ''||T.DATAPRATICA1||'')'' AS VARCHAR(120)) AS RIFPRATICA');
    Q.SQL.Add('FROM PRVORDCL T');
    Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=T.CODICECLIENTE AND T.CODICECLIENTE<>0)');
    Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fattura''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.R.F.''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Nota_accre''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.acqui''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''N.C.fornit''');
    if PartFilterInclude.Checked[INCLUDI_DDT]         then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''D.D.T.''   AND   T.DAFATTURARE = ''F'')');
    if PartFilterInclude.Checked[INCLUDI_RICFISC]     then Q.SQL.Add('OR T.TIPODOCUMENTO = ''Ricev.fisc''');
    if PartFilterInclude.Checked[INCLUDI_INTERVENTI]  then Q.SQL.Add('OR T.TIPODOCUMENTO = ''Intervento''');  // Intervento è stato aggiunto per la Exis
    Q.SQL.Add('      )');

    if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
    end else begin
      if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
    end;

    if PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] then
      Q.SQL.Add('AND (   coalesce(T.PRATICA,0)>0 AND (SELECT FIRST 1 PP.DATACHIUSURA FROM PRATICHE PP WHERE PP.Codice=T.Pratica AND PP.DataApertura=T.DataPratica1) IS NULL   )');

    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente

    if PartFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartFilterDescrizione.Text, True);

    if PartFilterTipoSoggetto.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'C.CLIENTEFORNITORE' , PartFilterTipoSoggetto.Text, True);

    if PartFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartFilterAgente.Text, True);
    if PartFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartFilterAgente2.Text, True);
    if PartFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartFilterAgente3.Text, True);
    if PartFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartFilterAgente4.Text, True);

    if DM1.ControllaDataStr(PartFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterDal.EditText)) + '''');
    if DM1.ControllaDataStr(PartFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartFilterAl.EditText)) + '''');

    // Escludi fatture di acquisto e movimenti relativi
    if PartFilterInclude.Checked[ESCLUDI_FATT_ACQUI] then
      Q.SQL.Add('AND T.TIPODOCUMENTO <> ''Fatt.acqui''');

    // Apertura
    Q.Open;
    // Caricamento
    while not Q.Eof do begin
      Inc(ID);
      with tvPart.DataController do begin
        CurrDocTipo := Q.FieldByName('TIPODOCUMENTO').AsString;
        RI := AppendRecord;
        Values[RI, tvPartTEMPID.Index] := ID;
        Values[RI, tvPartDATA.Index] := Q.FieldByName('DATADOCUMENTO').AsDate;
        Values[RI, tvPartDESCRIZIONE.Index] := CurrDocTipo + ' ' + Q.FieldByName('NUMORDPREV').AsString + Q.FieldByName('REGISTRO').AsString + ' del ' + Q.FieldByName('DATADOCUMENTO').AsString;

        // Carica l'importo del documento corrente su una variabile locale considerando o meno il bollo
        TmpImporto := Q.FieldByName('TOTALEDAPAGARE').AsCurrency;
        if PartFilterOther.Checked[OTHER_NO_BOLLI_FATT] then
          TmpImporto := TmpImporto - Q.FieldByName('BOLLOIMPORTO').AsCurrency;
        if (CurrDocTipo = 'Fattura') or (CurrDocTipo = 'Fatt.R.F.') or (CurrDocTipo = 'N.C.fornit') or (CurrDocTipo = 'D.D.T.') or (CurrDocTipo = 'Ricev.fisc') then begin
          Values[RI, tvPartDARE.Index] := TmpImporto;
          Values[RI, tvPartAVERE.Index] := 0;
          Values[RI, tvPartSALDO.Index] := TmpImporto;
        end else if (CurrDocTipo = 'Fatt.acqui') or (CurrDocTipo = 'Nota_accre') or (CurrDocTipo = 'Intervento') then begin
          Values[RI, tvPartDARE.Index] := 0;
          Values[RI, tvPartAVERE.Index] := TmpImporto;
          Values[RI, tvPartSALDO.Index] := TmpImporto * (-1);
        end;

        Values[RI, tvPartNOTE.Index]      := Q.FieldByName('NOTE').AsString;
        Values[RI, tvPartDOCTIPO.Index]   := Q.FieldByName('TIPODOCUMENTO').AsString;
        Values[RI, tvPartDOCNUM.Index]    := Q.FieldByName('NUMORDPREV').AsInt64;
        Values[RI, tvPartDOCREG.Index]    := Q.FieldByName('REGISTRO').AsString;
        Values[RI, tvPartDOCDATA.Index]   := Q.FieldByName('DATADOCUMENTO').AsDate;
        Values[RI, tvPartSOGGETTO.Index]  := Q.FieldByName('SOGGETTO').AsString;
        Values[RI, tvPartRIFPRATICA.Index]        := Q.FieldByName('RIFPRATICA').AsString;
        Values[RI, tvPartAGENTE.Index]            := Q.FieldByName('AGENTE').AsString;
        Values[RI, tvPartAGENTE2.Index]           := Q.FieldByName('AGENTE2').AsString;
        Values[RI, tvPartAGENTE3.Index]           := Q.FieldByName('AGENTE3').AsString;
        Values[RI, tvPartAGENTE4.Index]           := Q.FieldByName('AGENTE4').AsString;
        Values[RI, tvPartSTATODESCRIZIONE.Index]  := Q.FieldByName('STATODESCRIZIONE').AsString;
        Values[RI, tvPartSTATOFOREGROUND.Index]   := Q.FieldByName('STATOFOREGROUND').AsString;
        Values[RI, tvPartSTATOBACKGROUND.Index]   := Q.FieldByName('STATOBACKGROUND').AsString;
      end;
      Q.Next;
    end;
  finally
    Result := ID;
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;











// Carica i dati sul partitario iva
procedure TTabPartitarioForm.EsequiQueryPartitarioIva;
var
  ID: Integer;
begin
  // Inizializzazione
  ID := 0;
  // Disabilita l'aggiornameno a video
  tvPartIva.BeginUpdate;
  try
    // Suova la griglia;
    tvPartIva.DataController.RecordCount := 0;

    // Caricamento documenti
    DM1.ShowWait('Levante', 'Caricamento documenti...');
    ID := CaricaDocumentiPartitarioIva(ID);

    // Caricamento Riporti
    DM1.ShowWait('Levante', 'Caricamento riporti...');
    EseguiQueryPartitarioIvaRiporti;

    // CAricamento totali
    DM1.ShowWait('Levante', 'Caricamento totali...');
    EseguiQueryPartitarioIvaTotali;

  finally
    DM1.CloseWait;
    // Riabilita l'aggiornamento a video
    tvPartIva.EndUpdate;
  end;
end;

// Procedura che carica i documenti nel partitario
function TTabPartitarioForm.CaricaDocumentiPartitarioIva(ID: Integer): Integer;
var
  Q: TIB_Cursor;
  RI: Integer;
  CurrDocTipo: String;
begin
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    Q.SQL.Add('SELECT T.TIPODOCUMENTO, T.NUMORDPREV, T.REGISTRO, T.DATADOCUMENTO, COALESCE(T.TOTALEIVA,0) AS TOTALEIVA, T.NOTE, T.STATODESCRIZIONE, T.STATOBACKGROUND, T.STATOFOREGROUND, T.AGENTE, T.AGENTE2, T.AGENTE3, T.AGENTE4,');
    Q.SQL.Add(' CAST(C.RAGIONESOCIALE || ''   ('' || C.CODICE || '')'' AS VARCHAR(200)) AS SOGGETTO,');
    Q.SQL.Add(' CAST((SELECT P.DESCRIZIONE FROM Pratiche P WHERE P.Codice=T.Pratica AND P.DataApertura=T.DataPratica1)||''  (''||T.PRATICA|| '', ''||T.DATAPRATICA1||'')'' AS VARCHAR(120)) AS RIFPRATICA');
    Q.SQL.Add('FROM PRVORDCL T');
    Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=T.CODICECLIENTE AND T.CODICECLIENTE<>0)');
    Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fattura''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.R.F.''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Nota_accre''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.acqui''');
    Q.SQL.Add('       OR T.TIPODOCUMENTO = ''N.C.fornit''');
    Q.SQL.Add('      )');

    if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
    end else begin
      if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
    end;

    if PartIvaFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartIvaFilterDescrizione.Text, True);

    if PartIvaFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartIvaFilterAgente.Text, True);
    if PartIvaFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartIvaFilterAgente2.Text, True);
    if PartIvaFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartIvaFilterAgente3.Text, True);
    if PartIvaFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartIvaFilterAgente4.Text, True);

    if DM1.ControllaDataStr(PartIvaFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartIvaFilterDal.EditText)) + '''');
    if DM1.ControllaDataStr(PartIvaFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartIvaFilterAl.EditText)) + '''');

    // Apertura
    Q.Open;
    // Caricamento
    while not Q.Eof do begin
      Inc(ID);
      with tvPartIva.DataController do begin
        CurrDocTipo := Q.FieldByName('TIPODOCUMENTO').AsString;
        RI := AppendRecord;
        Values[RI, tvPartIvaTEMPID.Index] := ID;
        Values[RI, tvPartIvaDATA.Index] := Q.FieldByName('DATADOCUMENTO').AsDate;
        Values[RI, tvPartIvaDESCRIZIONE.Index] := CurrDocTipo + ' ' + Q.FieldByName('NUMORDPREV').AsString + Q.FieldByName('REGISTRO').AsString + ' del ' + Q.FieldByName('DATADOCUMENTO').AsString;

        if (CurrDocTipo = 'Fattura') or (CurrDocTipo = 'Fatt.R.F.') or (CurrDocTipo = 'N.C.fornit') or (CurrDocTipo = 'D.D.T.') then begin
          Values[RI, tvPartIvaDARE.Index]   := 0;
          Values[RI, tvPartIvaAVERE.Index]  := Q.FieldByName('TOTALEIVA').AsCurrency;
          Values[RI, tvPartIvaSALDO.Index]  := Q.FieldByName('TOTALEIVA').AsCurrency * (-1);
        end else if (CurrDocTipo = 'Fatt.acqui') or (CurrDocTipo = 'Nota_accre') then begin
          Values[RI, tvPartIvaDARE.Index]   := Q.FieldByName('TOTALEIVA').AsCurrency;
          Values[RI, tvPartIvaAVERE.Index]  := 0;
          Values[RI, tvPartIvaSALDO.Index]  := Q.FieldByName('TOTALEIVA').AsCurrency;
        end;

        Values[RI, tvPartIvaNOTE.Index]               := Q.FieldByName('NOTE').AsString;
        Values[RI, tvPartIvaDOCTIPO.Index]            := Q.FieldByName('TIPODOCUMENTO').AsString;
        Values[RI, tvPartIvaDOCNUM.Index]             := Q.FieldByName('NUMORDPREV').AsInt64;
        Values[RI, tvPartIvaDOCREG.Index]             := Q.FieldByName('REGISTRO').AsString;
        Values[RI, tvPartIvaDOCDATA.Index]            := Q.FieldByName('DATADOCUMENTO').AsDate;
        Values[RI, tvPartIvaSOGGETTO.Index]           := Q.FieldByName('SOGGETTO').AsString;
        Values[RI, tvPartIvaRIFPRATICA.Index]         := Q.FieldByName('RIFPRATICA').AsString;
        Values[RI, tvPartIvaAGENTE.Index]             := Q.FieldByName('AGENTE').AsString;
        Values[RI, tvPartIvaAGENTE2.Index]            := Q.FieldByName('AGENTE2').AsString;
        Values[RI, tvPartIvaAGENTE3.Index]            := Q.FieldByName('AGENTE3').AsString;
        Values[RI, tvPartIvaAGENTE4.Index]            := Q.FieldByName('AGENTE4').AsString;
        Values[RI, tvPartIvaSTATODESCRIZIONE.Index]   := Q.FieldByName('STATODESCRIZIONE').AsString;
        Values[RI, tvPartIvaSTATOFOREGROUND.Index]    := Q.FieldByName('STATOFOREGROUND').AsString;
        Values[RI, tvPartIvaSTATOBACKGROUND.Index]    := Q.FieldByName('STATOBACKGROUND').AsString;
      end;
      Q.Next;
    end;
  finally
    Result := ID;
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

procedure TTabPartitarioForm.EseguiQueryPartitarioIvaTotali;
var
  Q: TIB_Cursor;
  TmpTotDare, TmpTotAvere: Currency;
begin
  // Inizializzazione
  TmpTotDare := 0;
  TmpTotAvere := 0;
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente
//    if Trim(PartIvaFilterBanca.Text) = '' then begin
      // =========================================================================
      // TOTALE DARE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(T.TOTALEIVA)');
      Q.SQL.Add('FROM PRVORDCL T');
      Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fattura''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.R.F.''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''N.C.fornit''');
//      if PartFilterInclude.Checked[0] then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''D.D.T.''   AND   T.DAFATTURARE = ''F'')');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartIvaFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartIvaFilterDescrizione.Text, True);

      if PartIvaFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartIvaFilterAgente.Text, True);
      if PartIvaFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartIvaFilterAgente2.Text, True);
      if PartIvaFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartIvaFilterAgente3.Text, True);
      if PartIvaFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartIvaFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartIvaFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartIvaFilterDal.EditText)) + '''');
      if DM1.ControllaDataStr(PartIvaFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartIvaFilterAl.EditText)) + '''');
      // Apertura
      Q.Open;
      TmpTotAvere := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================

      // =========================================================================
      // TOTALE AVERE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(T.TOTALEIVA)');
      Q.SQL.Add('FROM PRVORDCL T');
      Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fatt.acqui''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Nota_accre''');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartIvaFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartIvaFilterDescrizione.Text, True);

      if PartIvaFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartIvaFilterAgente.Text, True);
      if PartIvaFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartIvaFilterAgente2.Text, True);
      if PartIvaFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartIvaFilterAgente3.Text, True);
      if PartIvaFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartIvaFilterAgente4.Text, True);

      if DM1.ControllaDataStr(PartIvaFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartIvaFilterDal.EditText)) + '''');
      if DM1.ControllaDataStr(PartIvaFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartIvaFilterAl.EditText)) + '''');
      // Apertura
      Q.Open;
      TmpTotDare := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================
//    end;

    // Aggiorna i riporti a video
    TotPartIvaPerDare.Value   := TmpTotDare;
    TotPartIvaPerAvere.Value  := TmpTotAvere;
    TotPartIvaPerSaldo.Value  := Abs(TmpTotDare - TmpTotAvere);
    if TmpTotDare = TmpTotAvere then TotPartIvaPerSegno.Text := '-'
    else if TmpTotDare > TmpTotAvere then TotPartIvaPerSegno.Text := 'D'
    else TotPartIvaPerSegno.Text := 'A';
    TotPartIvaDare.Value      := TotPartIvaPerDare.Value + RiportoPartIvaDare.Value;
    TotPartIvaAvere.Value     := TotPartIvaPerAvere.Value + RiportoPartIvaAvere.Value;
    TotPartIvaSaldo.Value     := Abs(TotPartIvaDare.Value - TotPartIvaAvere.Value);
    if TotPartIvaDare.Value = TotPartIvaAvere.Value then TotPartIvaSegno.Text := '-'
    else if TotPartIvaDare.Value > TotPartIvaAvere.Value then TotPartIvaSegno.Text := 'D'
    else TotPartIvaSegno.Text := 'A';
  // Chiusura finale
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

procedure TTabPartitarioForm.EseguiQueryPartitarioIvaRiporti;
var
  Q: TIB_Cursor;
  TmpRiportoDare, TmpRiportoAvere: Currency;
begin
  // Se non è specificato il filtro DataDal non fa nulla e mette i riporti := 0;
  if not DM1.ControllaDataStr(PartIvaFilterDal.EditText) then begin
    RiportoPartIvaDare.Value := 0;
    RiportoPartIvaAvere.Value := 0;
    RiportoPartIvaSaldo.Value := 0;
    RiportoPartIvaSegno.Text := '-';
    Exit;
  end;
  // Inizializzazione
  TmpRiportoDare := 0;
  TmpRiportoAvere := 0;
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente
//    if Trim(PartFilterBanca.Text) = '' then begin
      // =========================================================================
      // RIPORTO DARE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(T.TOTALEIVA)');
      Q.SQL.Add('FROM PRVORDCL T');
      Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fattura''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Fatt.R.F.''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''N.C.fornit''');
//      if PartFilterInclude.Checked[0] then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''D.D.T.''   AND   T.DAFATTURARE = ''F'')');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartIvaFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartIvaFilterDescrizione.Text, True);

      if PartIvaFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartIvaFilterAgente.Text, True);
      if PartIvaFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartIvaFilterAgente2.Text, True);
      if PartIvaFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartIvaFilterAgente3.Text, True);
      if PartIvaFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartIvaFilterAgente4.Text, True);

      if DM1.ControllaDataStr(PartIvaFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartIvaFilterDal.EditText)) + '''');
      // Apertura
      Q.Open;
      TmpRiportoAvere := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================

      // =========================================================================
      // RIPORTO AVERE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(T.TOTALEIVA)');
      Q.SQL.Add('FROM PRVORDCL T');
      Q.SQL.Add('WHERE (T.TIPODOCUMENTO = ''Fatt.acqui''');
      Q.SQL.Add('       OR T.TIPODOCUMENTO = ''Nota_accre''');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;
      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente

      if PartIvaFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartIvaFilterDescrizione.Text, True);

      if PartIvaFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartIvaFilterAgente.Text, True);
      if PartIvaFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartIvaFilterAgente2.Text, True);
      if PartIvaFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartIvaFilterAgente3.Text, True);
      if PartIvaFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartIvaFilterAgente4.Text, True);

      if DM1.ControllaDataStr(PartIvaFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartIvaFilterDal.EditText)) + '''');
      // Apertura
      Q.Open;
      TmpRiportoDare := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================
//    end;

    // Aggiorna i riporti a video
    RiportoPartIvaDare.Value  := TmpRiportoDare;
    RiportoPartIvaAvere.Value := TmpRiportoAvere;
    RiportoPartIvaSaldo.Value := Abs(TmpRiportoDare - TmpRiportoAvere);
    if TmpRiportoDare = TmpRiportoAvere then RiportoPartIvaSegno.Text := '-'
    else if TmpRiportoDare > TmpRiportoAvere then RiportoPartIvaSegno.Text := 'D'
    else RiportoPartIvaSegno.Text := 'A';
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;












// Carica i dati sul partitario ALTRO
procedure TTabPartitarioForm.EsequiQueryPartitarioAltro;
var
  ID: Integer;
begin
  // Inizializzazione
  ID := 0;

  // NB: Per effettuare questa interrogazione l'utente deve aver scelto
  //      almeno un conto
  if  (Trim(PartAltroFilterTipo1.Text) = '')
  and (Trim(PartAltroFilterTipo2.Text) = '')
  and (Trim(PartAltroFilterTipo3.Text) = '')
  and (Trim(PartAltroFilterTipo4.Text) = '')
  and (Trim(PartAltroFilterTipo5.Text) = '')
  and (Trim(PartAltroFilterTipo6.Text) = '')
  then begin
    DM1.Messaggi('Levante', 'E'' necessario fare almeno una selezione.', '', [mbOk], 0, nil);
    Exit;
  end;

  // Disabilita l'aggiornameno a video
  tvPartAltro.BeginUpdate;
  try
    // Suova la griglia;
    tvPartAltro.DataController.RecordCount := 0;

    // Caricamento documenti
    DM1.ShowWait('Levante', 'Caricamento documenti...');
    ID := CaricaDocumentiPartitarioAltro(ID);

    // Caricamento Riporti
    DM1.ShowWait('Levante', 'Caricamento riporti...');
    EseguiQueryPartitarioAltroRiporti;

    // CAricamento totali
    DM1.ShowWait('Levante', 'Caricamento totali...');
    EseguiQueryPartitarioAltroTotali;

  finally
    DM1.CloseWait;
    // Riabilita l'aggiornamento a video
    tvPartAltro.EndUpdate;
  end;
end;

// Procedura che carica i documenti nel partitario
function TTabPartitarioForm.CaricaDocumentiPartitarioAltro(ID: Integer): Integer;
var
  Q: TIB_Cursor;
  RI: Integer;
  CurrDocTipo: String;
begin
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
//    Q.SQL.Add('SELECT R.TIPODOCUMENTO, R.NUMORDPREV, R.REGISTRO, R.DATADOCUMENTO, R.IMPORTORIGO, T.NOTE, R.TIPO1, R.TIPO2, R.TIPO3, R.TIPO4, R.TIPO5, R.TIPO6');
    Q.SQL.Add('SELECT R.TIPODOCUMENTO, R.NUMORDPREV, R.REGISTRO, R.DATADOCUMENTO, COALESCE(SUM(R.IMPORTORIGO),0) AS IMPORTORIGO, T.STATODESCRIZIONE, T.STATOBACKGROUND, T.STATOFOREGROUND, T.AGENTE, T.AGENTE2, T.AGENTE3, T.AGENTE4');
    Q.SQL.Add(', CAST(C.RAGIONESOCIALE || ''   ('' || C.CODICE || '')'' AS VARCHAR(200)) AS SOGGETTO');
//    Q.SQL.Add(', CAST((SELECT (CASE P.TIPO WHEN ''A'' THEN P.COSTRUTTORE||'' ''||P.MODELLO ELSE P.DESCRIZIONE END) FROM Pratiche P WHERE P.Codice=R.Pratica AND P.DataApertura=R.DataPratica1)||''  (''||R.PRATICA|| '', ''||R.DATAPRATICA1||'')'' AS VARCHAR(120)) AS RIFPRATICA');
    Q.SQL.Add(', CAST(P.DESCRIZIONE||''  (''||R.PRATICA|| '', ''||R.DATAPRATICA1||'')'' AS VARCHAR(120)) AS RIFPRATICA');

    if Trim(PartAltroFilterTipo1.Text) <> '' then Q.SQL.Add(', R.TIPO1');
    if Trim(PartAltroFilterTipo2.Text) <> '' then Q.SQL.Add(', R.TIPO2');
    if Trim(PartAltroFilterTipo3.Text) <> '' then Q.SQL.Add(', R.TIPO3');
    if Trim(PartAltroFilterTipo4.Text) <> '' then Q.SQL.Add(', R.TIPO4');
    if Trim(PartAltroFilterTipo5.Text) <> '' then Q.SQL.Add(', R.TIPO5');
    if Trim(PartAltroFilterTipo6.Text) <> '' then Q.SQL.Add(', R.TIPO6');

    Q.SQL.Add('FROM RIGHIPRV R');
    Q.SQL.Add('LEFT JOIN PRVORDCL T ON (T.TIPODOCUMENTO=R.TIPODOCUMENTO   AND   T.NUMORDPREV=R.NUMORDPREV   AND   T.REGISTRO=R.REGISTRO   AND   T.DATADOCUMENTO=R.DATADOCUMENTO)');
    Q.SQL.Add('LEFT JOIN CLIENTI C ON (C.CODICE=T.CODICECLIENTE AND T.CODICECLIENTE<>0)');
    Q.SQL.Add('LEFT JOIN PRATICHE P ON (P.CODICE=T.PRATICA AND P.DATAAPERTURA=T.DATAPRATICA1)');
    Q.SQL.Add('WHERE (R.TIPODOCUMENTO = ''Fattura''');
    Q.SQL.Add('       OR R.TIPODOCUMENTO = ''Fatt.R.F.''');
    Q.SQL.Add('       OR R.TIPODOCUMENTO = ''Nota_accre''');
    Q.SQL.Add('       OR R.TIPODOCUMENTO = ''Fatt.acqui''');
    Q.SQL.Add('       OR R.TIPODOCUMENTO = ''N.C.fornit''');
    Q.SQL.Add('      )');

    if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
    end else begin
      if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
    end;

    if PartAltroFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartAltroFilterDescrizione.Text, True);

    if PartAltroFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartAltroFilterAgente.Text, True);
    if PartAltroFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartAltroFilterAgente2.Text, True);
    if PartAltroFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartAltroFilterAgente3.Text, True);
    if PartAltroFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartAltroFilterAgente4.Text, True);

    if DM1.ControllaDataStr(PartAltroFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartAltroFilterDal.EditText)) + '''');
    if DM1.ControllaDataStr(PartAltroFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartAltroFilterAl.EditText)) + '''');

    // Tipi di righi
    if (Trim(PartAltroFilterTipo1.Text) <> '') and (Trim(PartAltroFilterTipo1.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo1 = ''' + Trim(PartAltroFilterTipo1.Text) + '''');
    if (Trim(PartAltroFilterTipo2.Text) <> '') and (Trim(PartAltroFilterTipo2.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo2 = ''' + Trim(PartAltroFilterTipo2.Text) + '''');
    if (Trim(PartAltroFilterTipo3.Text) <> '') and (Trim(PartAltroFilterTipo3.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo3 = ''' + Trim(PartAltroFilterTipo3.Text) + '''');
    if (Trim(PartAltroFilterTipo4.Text) <> '') and (Trim(PartAltroFilterTipo4.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo4 = ''' + Trim(PartAltroFilterTipo4.Text) + '''');
    if (Trim(PartAltroFilterTipo5.Text) <> '') and (Trim(PartAltroFilterTipo5.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo5 = ''' + Trim(PartAltroFilterTipo5.Text) + '''');
    if (Trim(PartAltroFilterTipo6.Text) <> '') and (Trim(PartAltroFilterTipo6.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo6 = ''' + Trim(PartAltroFilterTipo6.Text) + '''');

    // Aggiunge il GroupBy
    Q.SQL.Add('GROUP BY R.TIPODOCUMENTO, R.NUMORDPREV, R.REGISTRO, R.DATADOCUMENTO, T.STATODESCRIZIONE, T.STATOBACKGROUND, T.STATOFOREGROUND, T.AGENTE, T.AGENTE2, T.AGENTE3, T.AGENTE4, SOGGETTO, RIFPRATICA');
    if Trim(PartAltroFilterTipo1.Text) <> '' then Q.SQL.Add(', R.TIPO1');
    if Trim(PartAltroFilterTipo2.Text) <> '' then Q.SQL.Add(', R.TIPO2');
    if Trim(PartAltroFilterTipo3.Text) <> '' then Q.SQL.Add(', R.TIPO3');
    if Trim(PartAltroFilterTipo4.Text) <> '' then Q.SQL.Add(', R.TIPO4');
    if Trim(PartAltroFilterTipo5.Text) <> '' then Q.SQL.Add(', R.TIPO5');
    if Trim(PartAltroFilterTipo6.Text) <> '' then Q.SQL.Add(', R.TIPO6');

    // Apertura
    Q.Open;
    // Caricamento
    while not Q.Eof do begin
      Inc(ID);
      with tvPartAltro.DataController do begin
        CurrDocTipo := Q.FieldByName('TIPODOCUMENTO').AsString;
        RI := AppendRecord;
        Values[RI, tvPartAltroTEMPID.Index] := ID;
        Values[RI, tvPartAltroDATA.Index] := Q.FieldByName('DATADOCUMENTO').AsDate;
        Values[RI, tvPartAltroDESCRIZIONE.Index] := CurrDocTipo + ' ' + Q.FieldByName('NUMORDPREV').AsString + Q.FieldByName('REGISTRO').AsString + ' del ' + Q.FieldByName('DATADOCUMENTO').AsString;

        if (CurrDocTipo = 'Fattura') or (CurrDocTipo = 'Fatt.R.F.') or (CurrDocTipo = 'N.C.fornit') or (CurrDocTipo = 'D.D.T.') then begin
          Values[RI, tvPartAltroDARE.Index]     := 0;
          Values[RI, tvPartAltroAVERE.Index]    := Q.FieldByName('IMPORTORIGO').AsCurrency;
          Values[RI, tvPartAltroSALDO.Index]    := Q.FieldByName('IMPORTORIGO').AsCurrency * (-1);
        end else if (CurrDocTipo = 'Fatt.acqui') or (CurrDocTipo = 'Nota_accre') then begin
          Values[RI, tvPartAltroDARE.Index]     := Q.FieldByName('IMPORTORIGO').AsCurrency;
          Values[RI, tvPartAltroAVERE.Index]    := 0;
          Values[RI, tvPartAltroSALDO.Index]    := Q.FieldByName('IMPORTORIGO').AsCurrency;
        end;

//        Values[RI, tvPartAltroNOTE.Index]               := Q.FieldByName('NOTE').AsString;
        Values[RI, tvPartAltroDOCTIPO.Index]            := Q.FieldByName('TIPODOCUMENTO').AsString;
        Values[RI, tvPartAltroDOCNUM.Index]             := Q.FieldByName('NUMORDPREV').AsInt64;
        Values[RI, tvPartAltroDOCREG.Index]             := Q.FieldByName('REGISTRO').AsString;
        Values[RI, tvPartAltroDOCDATA.Index]            := Q.FieldByName('DATADOCUMENTO').AsDate;
        Values[RI, tvPartAltroSOGGETTO.Index]           := Q.FieldByName('SOGGETTO').AsString;
        Values[RI, tvPartAltroRIFPRATICA.Index]         := Q.FieldByName('RIFPRATICA').AsString;
        Values[RI, tvPartAltroAGENTE.Index]             := Q.FieldByName('AGENTE').AsString;
        Values[RI, tvPartAltroAGENTE2.Index]            := Q.FieldByName('AGENTE2').AsString;
        Values[RI, tvPartAltroAGENTE3.Index]            := Q.FieldByName('AGENTE3').AsString;
        Values[RI, tvPartAltroAGENTE4.Index]            := Q.FieldByName('AGENTE4').AsString;
        Values[RI, tvPartAltroSTATODESCRIZIONE.Index]   := Q.FieldByName('STATODESCRIZIONE').AsString;
        Values[RI, tvPartAltroSTATOFOREGROUND.Index]    := Q.FieldByName('STATOFOREGROUND').AsString;
        Values[RI, tvPartAltroSTATOBACKGROUND.Index]    := Q.FieldByName('STATOBACKGROUND').AsString;
        if Trim(PartAltroFilterTipo1.Text) <> '' then Values[RI, tvPartAltroTIPO1.Index] := Q.FieldByName('TIPO1').AsString else Values[RI, tvPartAltroTIPO1.Index] := '- - -';
        if Trim(PartAltroFilterTipo2.Text) <> '' then Values[RI, tvPartAltroTIPO2.Index] := Q.FieldByName('TIPO2').AsString else Values[RI, tvPartAltroTIPO2.Index] := '- - -';
        if Trim(PartAltroFilterTipo3.Text) <> '' then Values[RI, tvPartAltroTIPO3.Index] := Q.FieldByName('TIPO3').AsString else Values[RI, tvPartAltroTIPO3.Index] := '- - -';
        if Trim(PartAltroFilterTipo4.Text) <> '' then Values[RI, tvPartAltroTIPO4.Index] := Q.FieldByName('TIPO4').AsString else Values[RI, tvPartAltroTIPO4.Index] := '- - -';
        if Trim(PartAltroFilterTipo5.Text) <> '' then Values[RI, tvPartAltroTIPO5.Index] := Q.FieldByName('TIPO5').AsString else Values[RI, tvPartAltroTIPO5.Index] := '- - -';
        if Trim(PartAltroFilterTipo6.Text) <> '' then Values[RI, tvPartAltroTIPO6.Index] := Q.FieldByName('TIPO6').AsString else Values[RI, tvPartAltroTIPO6.Index] := '- - -';
      end;
      Q.Next;
    end;
  finally
    Result := ID;
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

procedure TTabPartitarioForm.EseguiQueryPartitarioAltroTotali;
var
  Q: TIB_Cursor;
  TmpTotDare, TmpTotAvere: Currency;
begin
  // Inizializzazione
  TmpTotDare := 0;
  TmpTotAvere := 0;
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente
//    if Trim(PartIvaFilterBanca.Text) = '' then begin
      // =========================================================================
      // TOTALE DARE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(R.IMPORTORIGO)');
      Q.SQL.Add('FROM RIGHIPRV R');
      Q.SQL.Add('LEFT JOIN PRVORDCL T ON (T.TIPODOCUMENTO=R.TIPODOCUMENTO   AND   T.NUMORDPREV=R.NUMORDPREV   AND   T.REGISTRO=R.REGISTRO   AND   T.DATADOCUMENTO=R.DATADOCUMENTO)');
      Q.SQL.Add('WHERE (R.TIPODOCUMENTO = ''Fattura''');
      Q.SQL.Add('       OR R.TIPODOCUMENTO = ''Fatt.R.F.''');
      Q.SQL.Add('       OR R.TIPODOCUMENTO = ''N.C.fornit''');
//      if PartFilterInclude.Checked[0] then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''D.D.T.''   AND   T.DAFATTURARE = ''F'')');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartAltroFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartAltroFilterDescrizione.Text, True);

      if PartAltroFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartAltroFilterAgente.Text, True);
      if PartAltroFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartAltroFilterAgente2.Text, True);
      if PartAltroFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartAltroFilterAgente3.Text, True);
      if PartAltroFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartAltroFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartAltroFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartAltroFilterDal.EditText)) + '''');
      if DM1.ControllaDataStr(PartAltroFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartAltroFilterAl.EditText)) + '''');

      // Tipi di righi
      if (Trim(PartAltroFilterTipo1.Text) <> '') and (Trim(PartAltroFilterTipo1.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo1 = ''' + Trim(PartAltroFilterTipo1.Text) + '''');
      if (Trim(PartAltroFilterTipo2.Text) <> '') and (Trim(PartAltroFilterTipo2.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo2 = ''' + Trim(PartAltroFilterTipo2.Text) + '''');
      if (Trim(PartAltroFilterTipo3.Text) <> '') and (Trim(PartAltroFilterTipo3.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo3 = ''' + Trim(PartAltroFilterTipo3.Text) + '''');
      if (Trim(PartAltroFilterTipo4.Text) <> '') and (Trim(PartAltroFilterTipo4.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo4 = ''' + Trim(PartAltroFilterTipo4.Text) + '''');
      if (Trim(PartAltroFilterTipo5.Text) <> '') and (Trim(PartAltroFilterTipo5.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo5 = ''' + Trim(PartAltroFilterTipo5.Text) + '''');
      if (Trim(PartAltroFilterTipo6.Text) <> '') and (Trim(PartAltroFilterTipo6.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo6 = ''' + Trim(PartAltroFilterTipo6.Text) + '''');

      // Apertura
      Q.Open;
      TmpTotAvere := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================

      // =========================================================================
      // TOTALE AVERE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(R.IMPORTORIGO)');
      Q.SQL.Add('FROM RIGHIPRV R');
      Q.SQL.Add('LEFT JOIN PRVORDCL T ON (T.TIPODOCUMENTO=R.TIPODOCUMENTO   AND   T.NUMORDPREV=R.NUMORDPREV   AND   T.REGISTRO=R.REGISTRO   AND   T.DATADOCUMENTO=R.DATADOCUMENTO)');
      Q.SQL.Add('WHERE (R.TIPODOCUMENTO = ''Fatt.acqui''');
      Q.SQL.Add('       OR R.TIPODOCUMENTO = ''Nota_accre''');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartAltroFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartAltroFilterDescrizione.Text, True);

      if PartAltroFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartAltroFilterAgente.Text, True);
      if PartAltroFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartAltroFilterAgente2.Text, True);
      if PartAltroFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartAltroFilterAgente3.Text, True);
      if PartAltroFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartAltroFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartAltroFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartAltroFilterDal.EditText)) + '''');
      if DM1.ControllaDataStr(PartAltroFilterAl.EditText)  then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartAltroFilterAl.EditText)) + '''');

      // Tipi di righi
      if (Trim(PartAltroFilterTipo1.Text) <> '') and (Trim(PartAltroFilterTipo1.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo1 = ''' + Trim(PartAltroFilterTipo1.Text) + '''');
      if (Trim(PartAltroFilterTipo2.Text) <> '') and (Trim(PartAltroFilterTipo2.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo2 = ''' + Trim(PartAltroFilterTipo2.Text) + '''');
      if (Trim(PartAltroFilterTipo3.Text) <> '') and (Trim(PartAltroFilterTipo3.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo3 = ''' + Trim(PartAltroFilterTipo3.Text) + '''');
      if (Trim(PartAltroFilterTipo4.Text) <> '') and (Trim(PartAltroFilterTipo4.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo4 = ''' + Trim(PartAltroFilterTipo4.Text) + '''');
      if (Trim(PartAltroFilterTipo5.Text) <> '') and (Trim(PartAltroFilterTipo5.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo5 = ''' + Trim(PartAltroFilterTipo5.Text) + '''');
      if (Trim(PartAltroFilterTipo6.Text) <> '') and (Trim(PartAltroFilterTipo6.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo6 = ''' + Trim(PartAltroFilterTipo6.Text) + '''');

      // Apertura
      Q.Open;
      TmpTotDare := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================
//    end;

    // Aggiorna i riporti a video
    TotPartAltroPerDare.Value   := TmpTotDare;
    TotPartAltroPerAvere.Value  := TmpTotAvere;
    TotPartAltroPerSaldo.Value  := Abs(TmpTotDare - TmpTotAvere);
    if TmpTotDare = TmpTotAvere then TotPartAltroPerSegno.Text := '-'
    else if TmpTotDare > TmpTotAvere then TotPartAltroPerSegno.Text := 'D'
    else TotPartAltroPerSegno.Text := 'A';
    TotPartAltroDare.Value      := TotPartAltroPerDare.Value + RiportoPartAltroDare.Value;
    TotPartAltroAvere.Value     := TotPartAltroPerAvere.Value + RiportoPartAltroAvere.Value;
    TotPartAltroSaldo.Value     := Abs(TotPartAltroDare.Value - TotPartAltroAvere.Value);
    if TotPartAltroDare.Value = TotPartAltroAvere.Value then TotPartAltroSegno.Text := '-'
    else if TotPartAltroDare.Value > TotPartAltroAvere.Value then TotPartAltroSegno.Text := 'D'
    else TotPartAltroSegno.Text := 'A';
  // Chiusura finale
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;

procedure TTabPartitarioForm.EseguiQueryPartitarioAltroRiporti;
var
  Q: TIB_Cursor;
  TmpRiportoDare, TmpRiportoAvere: Currency;
begin
  // Se non è specificato il filtro DataDal non fa nulla e mette i riporti := 0;
  if not DM1.ControllaDataStr(PartAltroFilterDal.EditText) then begin
    RiportoPartAltroDare.Value := 0;
    RiportoPartAltroAvere.Value := 0;
    RiportoPartAltroSaldo.Value := 0;
    RiportoPartAltroSegno.Text := '-';
    Exit;
  end;
  // Inizializzazione
  TmpRiportoDare := 0;
  TmpRiportoAvere := 0;
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName  := DM1.ArcDBFile;
    Q.IB_Connection := DM1.DBAzienda;
    // NB: IL filltro per bancha non esiste per i documenti, se l'utente
    //      specifica un filtraggio per banca non carica i documenti per niente
//    if Trim(PartFilterBanca.Text) = '' then begin
      // =========================================================================
      // RIPORTO DARE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(R.IMPORTORIGO)');
      Q.SQL.Add('FROM RIGHIPRV R');
      Q.SQL.Add('LEFT JOIN PRVORDCL T ON (T.TIPODOCUMENTO=R.TIPODOCUMENTO   AND   T.NUMORDPREV=R.NUMORDPREV   AND   T.REGISTRO=R.REGISTRO   AND   T.DATADOCUMENTO=R.DATADOCUMENTO)');
      Q.SQL.Add('WHERE (R.TIPODOCUMENTO = ''Fattura''');
      Q.SQL.Add('       OR R.TIPODOCUMENTO = ''Fatt.R.F.''');
      Q.SQL.Add('       OR R.TIPODOCUMENTO = ''N.C.fornit''');
//      if PartFilterInclude.Checked[0] then Q.SQL.Add('OR (T.TIPODOCUMENTO = ''D.D.T.''   AND   T.DAFATTURARE = ''F'')');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2='''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3='''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartAltroFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartAltroFilterDescrizione.Text, True);

      if PartAltroFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartAltroFilterAgente.Text, True);
      if PartAltroFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartAltroFilterAgente2.Text, True);
      if PartAltroFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartAltroFilterAgente3.Text, True);
      if PartAltroFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartAltroFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartAltroFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartAltroFilterDal.EditText)) + '''');

      // Tipi di righi
      if (Trim(PartAltroFilterTipo1.Text) <> '') and (Trim(PartAltroFilterTipo1.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo1 = ''' + Trim(PartAltroFilterTipo1.Text) + '''');
      if (Trim(PartAltroFilterTipo2.Text) <> '') and (Trim(PartAltroFilterTipo2.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo2 = ''' + Trim(PartAltroFilterTipo2.Text) + '''');
      if (Trim(PartAltroFilterTipo3.Text) <> '') and (Trim(PartAltroFilterTipo3.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo3 = ''' + Trim(PartAltroFilterTipo3.Text) + '''');
      if (Trim(PartAltroFilterTipo4.Text) <> '') and (Trim(PartAltroFilterTipo4.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo4 = ''' + Trim(PartAltroFilterTipo4.Text) + '''');
      if (Trim(PartAltroFilterTipo5.Text) <> '') and (Trim(PartAltroFilterTipo5.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo5 = ''' + Trim(PartAltroFilterTipo5.Text) + '''');
      if (Trim(PartAltroFilterTipo6.Text) <> '') and (Trim(PartAltroFilterTipo6.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo6 = ''' + Trim(PartAltroFilterTipo6.Text) + '''');

      // Apertura
      Q.Open;
      TmpRiportoAvere := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================

      // =========================================================================
      // RIPORTO AVERE DOCUMENTI
      // -------------------------------------------------------------------------
      Q.SQL.Clear;
      Q.SQL.Add('SELECT SUM(R.IMPORTORIGO)');
      Q.SQL.Add('FROM RIGHIPRV R');
      Q.SQL.Add('LEFT JOIN PRVORDCL T ON (T.TIPODOCUMENTO=R.TIPODOCUMENTO   AND   T.NUMORDPREV=R.NUMORDPREV   AND   T.REGISTRO=R.REGISTRO   AND   T.DATADOCUMENTO=R.DATADOCUMENTO)');
      Q.SQL.Add('WHERE (R.TIPODOCUMENTO = ''Fatt.acqui''');
      Q.SQL.Add('       OR R.TIPODOCUMENTO = ''Nota_accre''');
      Q.SQL.Add('      )');
      // Filtri
      if ClientiForm.PraticaCorrente <> '' then begin
        DM1.AddSQLToIB_Cursor(Q, 'AND', '((T.Pratica='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA1'''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica2='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA2'''+ClientiForm.DataPraticaCorrenteSQL+''') OR (T.Pratica3='+ClientiForm.PraticaCorrente+' AND T.DATAPRATICA3'''+ClientiForm.DataPraticaCorrenteSQL+'''))');
      end else begin
        if ClientiForm.ClienteCorrente <> '' then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.CodiceCliente = ' + ClientiForm.ClienteCorrente);
      end;

      if PartAltroFilterDescrizione.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.NOTE', PartAltroFilterDescrizione.Text, True);

      if PartAltroFilterAgente.Text  <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE' , PartAltroFilterAgente.Text, True);
      if PartAltroFilterAgente2.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE2', PartAltroFilterAgente2.Text, True);
      if PartAltroFilterAgente3.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE3', PartAltroFilterAgente3.Text, True);
      if PartAltroFilterAgente4.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'T.AGENTE4', PartAltroFilterAgente4.Text, True);

      // NB: IL filltro per bancha non esiste per i documenti, se l'utente
      //      specifica un filtraggio per banca non carica i documenti per niente
      if DM1.ControllaDataStr(PartAltroFilterDal.EditText) then DM1.AddSQLToIB_Cursor(Q, 'AND', 'T.DataDocumento < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PartAltroFilterDal.EditText)) + '''');

      // Tipi di righi
      if (Trim(PartAltroFilterTipo1.Text) <> '') and (Trim(PartAltroFilterTipo1.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo1 = ''' + Trim(PartAltroFilterTipo1.Text) + '''');
      if (Trim(PartAltroFilterTipo2.Text) <> '') and (Trim(PartAltroFilterTipo2.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo2 = ''' + Trim(PartAltroFilterTipo2.Text) + '''');
      if (Trim(PartAltroFilterTipo3.Text) <> '') and (Trim(PartAltroFilterTipo3.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo3 = ''' + Trim(PartAltroFilterTipo3.Text) + '''');
      if (Trim(PartAltroFilterTipo4.Text) <> '') and (Trim(PartAltroFilterTipo4.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo4 = ''' + Trim(PartAltroFilterTipo4.Text) + '''');
      if (Trim(PartAltroFilterTipo5.Text) <> '') and (Trim(PartAltroFilterTipo5.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo5 = ''' + Trim(PartAltroFilterTipo5.Text) + '''');
      if (Trim(PartAltroFilterTipo6.Text) <> '') and (Trim(PartAltroFilterTipo6.Text) <> 'TUTTI') then DM1.AddSQLToIB_Cursor(Q, 'AND', 'R.Tipo6 = ''' + Trim(PartAltroFilterTipo6.Text) + '''');

      // Apertura
      Q.Open;
      TmpRiportoDare := Q.Fields[0].AsCurrency;
      Q.Close;
      // =========================================================================
//    end;

    // Aggiorna i riporti a video
    RiportoPartAltroDare.Value  := TmpRiportoDare;
    RiportoPartAltroAvere.Value := TmpRiportoAvere;
    RiportoPartAltroSaldo.Value := Abs(TmpRiportoDare - TmpRiportoAvere);
    if TmpRiportoDare = TmpRiportoAvere then RiportoPartAltroSegno.Text := '-'
    else if TmpRiportoDare > TmpRiportoAvere then RiportoPartAltroSegno.Text := 'D'
    else RiportoPartAltroSegno.Text := 'A';
  finally
    if Q.Active then Q.Close;
    Q.Free;
  end;
end;


// -----------------------------------------------------------------------------
// FINE - QUERY PER INTERROGAZIONE PARTITARIO E RELATIVI TOTALI
// =============================================================================

























procedure TTabPartitarioForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Annulla il puntatore
  TabPartitarioForm := nil;
end;

procedure TTabPartitarioForm.FormCreate(Sender: TObject);
begin
  inherited;
  PageControlPartitario.Align := alClient;
  CloseFilterPanel(PanelPartFiltri, SBPartFilterOpenClose, False);
  CloseFilterPanel(PanelPartIvaFiltri, SBPartIvaFilterOpenClose, False);
  OpenFilterPanel(PanelPartAltroFiltri, SBPartAltroFilterOpenClose, False);
end;

procedure TTabPartitarioForm.PanelPartFiltriResize(Sender: TObject);
begin
  inherited;
  CalcolaLeftFiltriSubPanel(Sender as TPanel);
end;

procedure TTabPartitarioForm.SBPartFilterOpenCloseClick(Sender: TObject);
begin
  inherited;
  if PanelPartFiltri.Tag = 1
  then CloseFilterPanel(PanelPartFiltri, SBPartFilterOpenClose)
  else OpenFilterPanel(PanelPartFiltri, SBPartFilterOpenClose);
end;

procedure TTabPartitarioForm.SBPartIvaFilterOpenCloseClick(
  Sender: TObject);
begin
  inherited;
  if PanelPartIvaFiltri.Tag = 1
  then CloseFilterPanel(PanelPartIvaFiltri, SBPartIvaFilterOpenClose)
  else OpenFilterPanel(PanelPartIvaFiltri, SBPartIvaFilterOpenClose);
end;

procedure TTabPartitarioForm.SBPartAltroFilterOpenCloseClick(
  Sender: TObject);
begin
  inherited;
  if PanelPartAltroFiltri.Tag = 1
  then CloseFilterPanel(PanelPartAltroFiltri, SBPartAltroFilterOpenClose)
  else OpenFilterPanel(PanelPartAltroFiltri, SBPartAltroFilterOpenClose);
end;

procedure TTabPartitarioForm.PartFilterIncludeClickCheck(Sender: TObject);
begin
  inherited;
   // Se passa di quì significa che l'utente ha cliccato esattamente nel riquadrino del check della voce
   //  e quindi marca la proprietà Tag del componente in modo che poi il gestore dell'evento OnMouseUp che gestisce
   //  i click per la selezione o meno della voce (per fare in modo che anche cliccando sulla descrizione della voce
   //  si selezioni o deselezioni la voce stessa). In questo modo tale gestore di evento salta la riga che
   //  assegna il valore alla proprietà checked[i] altrimenti è come se l'utente avesse cliccato due volte.
   (Sender as TCheckListBox).Tag := 1;
end;

procedure TTabPartitarioForm.PartFilterIncludeExit(Sender: TObject);
begin
  inherited;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   (Sender as TCheckListBox).ItemIndex := -1;
end;

procedure TTabPartitarioForm.PartFilterIncludeMouseUp(Sender: TObject;
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

procedure TTabPartitarioForm.PartFilterDescrizioneKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then ClientiForm.RxSpeedButtonTrovaClick(Self);
end;

procedure TTabPartitarioForm.PartFilterMesiTuttiClick(Sender: TObject);
begin
  inherited;
   PartFilterDal.EditText := DM1.FilterDataDalDefault;
   PartFilterAl.EditText  := DM1.FilterDataAlDefault;
   // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
   //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
   //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
   //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
//   if ImpMesiTutti.Tag = 0 then begin
      // In questo modo posso metterli tutti in DOWN contemporaneamente
      PartFilterGen.GroupIndex := 1201;
      PartFilterFeb.GroupIndex := 1202;
      PartFilterMar.GroupIndex := 1203;
      PartFilterApr.GroupIndex := 1204;
      PartFilterMag.GroupIndex := 1205;
      PartFilterGiu.GroupIndex := 1206;
      PartFilterLug.GroupIndex := 1207;
      PartFilterAgo.GroupIndex := 1208;
      PartFilterSet.GroupIndex := 1209;
      PartFilterOtt.GroupIndex := 1210;
      PartFilterNov.GroupIndex := 1211;
      PartFilterDic.GroupIndex := 1212;
      PartFilterGen.Down   := False;
      PartFilterFeb.Down   := False;
      PartFilterMar.Down   := False;
      PartFilterApr.Down   := False;
      PartFilterMag.Down   := False;
      PartFilterGiu.Down   := False;
      PartFilterLug.Down   := False;
      PartFilterAgo.Down   := False;
      PartFilterSet.Down   := False;
      PartFilterOtt.Down   := False;
      PartFilterNov.Down   := False;
      PartFilterDic.Down   := False;
//   end else begin
      // Rimette il Tag del pulsante = 0
      PartFilterMesiTutti.Tag := 0;
//   end;
end;

procedure TTabPartitarioForm.PartFilterMesiTuttiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PartFilterMesiTuttiClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.PartFilterMesiNessunoClick(Sender: TObject);
begin
  inherited;
   PartFilterDal.Clear;
   PartFilterAl.Clear;
   // In questo modo posso metterli tutti in DOWN contemporaneamente
   PartFilterGen.GroupIndex := 600;
   PartFilterFeb.GroupIndex := 600;
   PartFilterMar.GroupIndex := 600;
   PartFilterApr.GroupIndex := 600;
   PartFilterMag.GroupIndex := 600;
   PartFilterGiu.GroupIndex := 600;
   PartFilterLug.GroupIndex := 600;
   PartFilterAgo.GroupIndex := 600;
   PartFilterSet.GroupIndex := 600;
   PartFilterOtt.GroupIndex := 600;
   PartFilterNov.GroupIndex := 600;
   PartFilterDic.GroupIndex := 600;
   PartFilterGen.Down   := False;
   PartFilterFeb.Down   := False;
   PartFilterMar.Down   := False;
   PartFilterApr.Down   := False;
   PartFilterMag.Down   := False;
   PartFilterGiu.Down   := False;
   PartFilterLug.Down   := False;
   PartFilterAgo.Down   := False;
   PartFilterSet.Down   := False;
   PartFilterOtt.Down   := False;
   PartFilterNov.Down   := False;
   PartFilterDic.Down   := False;
end;

procedure TTabPartitarioForm.PartFilterMesiNessunoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PartFilterMesiNessunoClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.PartFilterGenClick(Sender: TObject);
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
      PartFilterMesiNessunoClick(Self);
      (Sender as TSpeedButton).Down := True;
   end;
   // Se il pulsante è premuto (down)...
   if (Sender as TSpeedButton).Down then begin
      // In base all'indice del mese imposta le date nel modo opportuno
      case Mese of
         1:begin
            PartFilterDal.Text := ' 01/01/' + IntToStr(AA);
            PartFilterAl.Text  := ' 31/01/' + IntToStr(AA);
         end;
         2:begin
            PartFilterDal.Text := ' 01/02/' + IntToStr(AA);
            PartFilterAl.Text  := ' ' + IntToStr(DaysInAMonth(CurrentYear, 2)) + '/02/' + IntToStr(AA);
         end;
         3:begin
            PartFilterDal.Text := ' 01/03/' + IntToStr(AA);
            PartFilterAl.Text  := ' 31/03/' + IntToStr(AA);
         end;
         4:begin
            PartFilterDal.Text := ' 01/04/' + IntToStr(AA);
            PartFilterAl.Text  := ' 30/04/' + IntToStr(AA);
         end;
         5:begin
            PartFilterDal.Text := ' 01/05/' + IntToStr(AA);
            PartFilterAl.Text  := ' 31/05/' + IntToStr(AA);
         end;
         6:begin
            PartFilterDal.Text := ' 01/06/' + IntToStr(AA);
            PartFilterAl.Text  := ' 30/06/' + IntToStr(AA);
         end;
         7:begin
            PartFilterDal.Text := ' 01/07/' + IntToStr(AA);
            PartFilterAl.Text  := ' 31/07/' + IntToStr(AA);
         end;
         8:begin
            PartFilterDal.Text := ' 01/08/' + IntToStr(AA);
            PartFilterAl.Text  := ' 31/08/' + IntToStr(AA);
         end;
         9:begin
            PartFilterDal.Text := ' 01/09/' + IntToStr(AA);
            PartFilterAl.Text  := ' 30/09/' + IntToStr(AA);
         end;
         10:begin
            PartFilterDal.Text := ' 01/10/' + IntToStr(AA);
            PartFilterAl.Text  := ' 31/10/' + IntToStr(AA);
         end;
         11:begin
            PartFilterDal.Text := ' 01/11/' + IntToStr(AA);
            PartFilterAl.Text  := ' 30/11/' + IntToStr(AA);
         end;
         12:begin
            PartFilterDal.Text := ' 01/12/' + IntToStr(AA);
            PartFilterAl.Text  := ' 31/12/' + IntToStr(AA);
         end;
      end;
   // Se invece il mese non è premuto...
   end else begin
      PartFilterDal.Text := '';
      PartFilterAl.Text  := '';
   end;
end;

procedure TTabPartitarioForm.PartFilterGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      PartFilterGenClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.PartIvaFilterMesiTuttiClick(Sender: TObject);
begin
  inherited;
   PartIvaFilterDal.EditText := DM1.FilterDataDalDefault;
   PartIvaFilterAl.EditText  := DM1.FilterDataAlDefault;
   // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
   //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
   //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
   //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
//   if ImpMesiTutti.Tag = 0 then begin
      // In questo modo posso metterli tutti in DOWN contemporaneamente
      PartIvaFilterGen.GroupIndex := 1501;
      PartIvaFilterFeb.GroupIndex := 1502;
      PartIvaFilterMar.GroupIndex := 1503;
      PartIvaFilterApr.GroupIndex := 1504;
      PartIvaFilterMag.GroupIndex := 1505;
      PartIvaFilterGiu.GroupIndex := 1506;
      PartIvaFilterLug.GroupIndex := 1507;
      PartIvaFilterAgo.GroupIndex := 1508;
      PartIvaFilterSet.GroupIndex := 1509;
      PartIvaFilterOtt.GroupIndex := 1510;
      PartIvaFilterNov.GroupIndex := 1511;
      PartIvaFilterDic.GroupIndex := 1515;
      PartIvaFilterGen.Down   := False;
      PartIvaFilterFeb.Down   := False;
      PartIvaFilterMar.Down   := False;
      PartIvaFilterApr.Down   := False;
      PartIvaFilterMag.Down   := False;
      PartIvaFilterGiu.Down   := False;
      PartIvaFilterLug.Down   := False;
      PartIvaFilterAgo.Down   := False;
      PartIvaFilterSet.Down   := False;
      PartIvaFilterOtt.Down   := False;
      PartIvaFilterNov.Down   := False;
      PartIvaFilterDic.Down   := False;
//   end else begin
      // Rimette il Tag del pulsante = 0
      PartIvaFilterMesiTutti.Tag := 0;
//   end;
end;

procedure TTabPartitarioForm.PartIvaFilterMesiTuttiMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PartIvaFilterMesiTuttiClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.PartIvaFilterMesiNessunoClick(
  Sender: TObject);
begin
  inherited;
   PartIvaFilterDal.Clear;
   PartIvaFilterAl.Clear;
   // In questo modo posso metterli tutti in DOWN contemporaneamente
   PartIvaFilterGen.GroupIndex := 600;
   PartIvaFilterFeb.GroupIndex := 600;
   PartIvaFilterMar.GroupIndex := 600;
   PartIvaFilterApr.GroupIndex := 600;
   PartIvaFilterMag.GroupIndex := 600;
   PartIvaFilterGiu.GroupIndex := 600;
   PartIvaFilterLug.GroupIndex := 600;
   PartIvaFilterAgo.GroupIndex := 600;
   PartIvaFilterSet.GroupIndex := 600;
   PartIvaFilterOtt.GroupIndex := 600;
   PartIvaFilterNov.GroupIndex := 600;
   PartIvaFilterDic.GroupIndex := 600;
   PartIvaFilterGen.Down   := False;
   PartIvaFilterFeb.Down   := False;
   PartIvaFilterMar.Down   := False;
   PartIvaFilterApr.Down   := False;
   PartIvaFilterMag.Down   := False;
   PartIvaFilterGiu.Down   := False;
   PartIvaFilterLug.Down   := False;
   PartIvaFilterAgo.Down   := False;
   PartIvaFilterSet.Down   := False;
   PartIvaFilterOtt.Down   := False;
   PartIvaFilterNov.Down   := False;
   PartIvaFilterDic.Down   := False;
end;

procedure TTabPartitarioForm.PartIvaFilterMesiNessunoMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PartIvaFilterMesiNessunoClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.PartIvaFilterGenClick(Sender: TObject);
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
      PartIvaFilterMesiNessunoClick(Self);
      (Sender as TSpeedButton).Down := True;
   end;
   // Se il pulsante è premuto (down)...
   if (Sender as TSpeedButton).Down then begin
      // In base all'indice del mese imposta le date nel modo opportuno
      case Mese of
         1:begin
            PartIvaFilterDal.Text := ' 01/01/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 31/01/' + IntToStr(AA);
         end;
         2:begin
            PartIvaFilterDal.Text := ' 01/02/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' ' + IntToStr(DaysInAMonth(CurrentYear, 2)) + '/02/' + IntToStr(AA);
         end;
         3:begin
            PartIvaFilterDal.Text := ' 01/03/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 31/03/' + IntToStr(AA);
         end;
         4:begin
            PartIvaFilterDal.Text := ' 01/04/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 30/04/' + IntToStr(AA);
         end;
         5:begin
            PartIvaFilterDal.Text := ' 01/05/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 31/05/' + IntToStr(AA);
         end;
         6:begin
            PartIvaFilterDal.Text := ' 01/06/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 30/06/' + IntToStr(AA);
         end;
         7:begin
            PartIvaFilterDal.Text := ' 01/07/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 31/07/' + IntToStr(AA);
         end;
         8:begin
            PartIvaFilterDal.Text := ' 01/08/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 31/08/' + IntToStr(AA);
         end;
         9:begin
            PartIvaFilterDal.Text := ' 01/09/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 30/09/' + IntToStr(AA);
         end;
         10:begin
            PartIvaFilterDal.Text := ' 01/10/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 31/10/' + IntToStr(AA);
         end;
         11:begin
            PartIvaFilterDal.Text := ' 01/11/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 30/11/' + IntToStr(AA);
         end;
         12:begin
            PartIvaFilterDal.Text := ' 01/12/' + IntToStr(AA);
            PartIvaFilterAl.Text  := ' 31/12/' + IntToStr(AA);
         end;
      end;
   // Se invece il mese non è premuto...
   end else begin
      PartIvaFilterDal.Text := '';
      PartIvaFilterAl.Text  := '';
   end;
end;

procedure TTabPartitarioForm.PartIvaFilterGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      PartIvaFilterGenClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.PartAltroFilterMesiTuttiClick(
  Sender: TObject);
begin
  inherited;
   PartAltroFilterDal.EditText := DM1.FilterDataDalDefault;
   PartAltroFilterAl.EditText  := DM1.FilterDataAlDefault;
   // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
   //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
   //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
   //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
//   if ImpMesiTutti.Tag = 0 then begin
      // In questo modo posso metterli tutti in DOWN contemporaneamente
      PartAltroFilterGen.GroupIndex := 1601;
      PartAltroFilterFeb.GroupIndex := 1602;
      PartAltroFilterMar.GroupIndex := 1603;
      PartAltroFilterApr.GroupIndex := 1604;
      PartAltroFilterMag.GroupIndex := 1605;
      PartAltroFilterGiu.GroupIndex := 1606;
      PartAltroFilterLug.GroupIndex := 1607;
      PartAltroFilterAgo.GroupIndex := 1608;
      PartAltroFilterSet.GroupIndex := 1609;
      PartAltroFilterOtt.GroupIndex := 1610;
      PartAltroFilterNov.GroupIndex := 1611;
      PartAltroFilterDic.GroupIndex := 1616;
      PartAltroFilterGen.Down   := False;
      PartAltroFilterFeb.Down   := False;
      PartAltroFilterMar.Down   := False;
      PartAltroFilterApr.Down   := False;
      PartAltroFilterMag.Down   := False;
      PartAltroFilterGiu.Down   := False;
      PartAltroFilterLug.Down   := False;
      PartAltroFilterAgo.Down   := False;
      PartAltroFilterSet.Down   := False;
      PartAltroFilterOtt.Down   := False;
      PartAltroFilterNov.Down   := False;
      PartAltroFilterDic.Down   := False;
//   end else begin
      // Rimette il Tag del pulsante = 0
      PartAltroFilterMesiTutti.Tag := 0;
//   end;
end;

procedure TTabPartitarioForm.PartAltroFilterMesiTuttiMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PartAltroFilterMesiTuttiClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.PartAltroFilterMesiNessunoClick(
  Sender: TObject);
begin
  inherited;
   PartAltroFilterDal.Clear;
   PartAltroFilterAl.Clear;
   // In questo modo posso metterli tutti in DOWN contemporaneamente
   PartAltroFilterGen.GroupIndex := 600;
   PartAltroFilterFeb.GroupIndex := 600;
   PartAltroFilterMar.GroupIndex := 600;
   PartAltroFilterApr.GroupIndex := 600;
   PartAltroFilterMag.GroupIndex := 600;
   PartAltroFilterGiu.GroupIndex := 600;
   PartAltroFilterLug.GroupIndex := 600;
   PartAltroFilterAgo.GroupIndex := 600;
   PartAltroFilterSet.GroupIndex := 600;
   PartAltroFilterOtt.GroupIndex := 600;
   PartAltroFilterNov.GroupIndex := 600;
   PartAltroFilterDic.GroupIndex := 600;
   PartAltroFilterGen.Down   := False;
   PartAltroFilterFeb.Down   := False;
   PartAltroFilterMar.Down   := False;
   PartAltroFilterApr.Down   := False;
   PartAltroFilterMag.Down   := False;
   PartAltroFilterGiu.Down   := False;
   PartAltroFilterLug.Down   := False;
   PartAltroFilterAgo.Down   := False;
   PartAltroFilterSet.Down   := False;
   PartAltroFilterOtt.Down   := False;
   PartAltroFilterNov.Down   := False;
   PartAltroFilterDic.Down   := False;
end;

procedure TTabPartitarioForm.PartAltroFilterMesiNessunoMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PartAltroFilterMesiNessunoClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.PartAltroFilterGenClick(Sender: TObject);
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
      PartAltroFilterMesiNessunoClick(Self);
      (Sender as TSpeedButton).Down := True;
   end;
   // Se il pulsante è premuto (down)...
   if (Sender as TSpeedButton).Down then begin
      // In base all'indice del mese imposta le date nel modo opportuno
      case Mese of
         1:begin
            PartAltroFilterDal.Text := ' 01/01/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 31/01/' + IntToStr(AA);
         end;
         2:begin
            PartAltroFilterDal.Text := ' 01/02/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' ' + IntToStr(DaysInAMonth(CurrentYear, 2)) + '/02/' + IntToStr(AA);
         end;
         3:begin
            PartAltroFilterDal.Text := ' 01/03/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 31/03/' + IntToStr(AA);
         end;
         4:begin
            PartAltroFilterDal.Text := ' 01/04/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 30/04/' + IntToStr(AA);
         end;
         5:begin
            PartAltroFilterDal.Text := ' 01/05/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 31/05/' + IntToStr(AA);
         end;
         6:begin
            PartAltroFilterDal.Text := ' 01/06/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 30/06/' + IntToStr(AA);
         end;
         7:begin
            PartAltroFilterDal.Text := ' 01/07/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 31/07/' + IntToStr(AA);
         end;
         8:begin
            PartAltroFilterDal.Text := ' 01/08/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 31/08/' + IntToStr(AA);
         end;
         9:begin
            PartAltroFilterDal.Text := ' 01/09/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 30/09/' + IntToStr(AA);
         end;
         10:begin
            PartAltroFilterDal.Text := ' 01/10/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 31/10/' + IntToStr(AA);
         end;
         11:begin
            PartAltroFilterDal.Text := ' 01/11/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 30/11/' + IntToStr(AA);
         end;
         12:begin
            PartAltroFilterDal.Text := ' 01/12/' + IntToStr(AA);
            PartAltroFilterAl.Text  := ' 31/12/' + IntToStr(AA);
         end;
      end;
   // Se invece il mese non è premuto...
   end else begin
      PartAltroFilterDal.Text := '';
      PartAltroFilterAl.Text  := '';
   end;
end;

procedure TTabPartitarioForm.PartAltroFilterGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      PartAltroFilterGenClick(Sender);
      ClientiForm.RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TTabPartitarioForm.tvPartCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TTabPartitarioForm.tvPartCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
var
  CurrColor: TColor;
begin
  // Inizializzazione
  ADone := True;

  // In base alla situazione determina il colore
  if AViewInfo.Selected
  then CurrColor := Sender.Styles.Selection.Color
  else CurrColor := (Sender.Styles as TcxGridTableViewStyles).Group.Color;

  // Disegna il rettangolo di sfondo
  DMStyles.DrawGradient(ACanvas.Canvas, AviewInfo.Bounds, clWhite, CurrColor, 30, True);
  // Cosi il testo è trasparente
  ACanvas.Brush.Style := bsClear;

  // Campo
  ACanvas.Font.Name := 'Arial';
  ACanvas.Font.Size := 8;
  ACanvas.Font.Style := [fsBold];
  ACanvas.DrawTexT('    ' + AViewInfo.GridRecord.DisplayTexts[tvPartAltroDESCRIZIONE.Index], AViewInfo.TextAreaBounds, cxAlignLeft or cxAlignBottom);

//  ACanvas.DrawComplexFrame(AViewInfo.Bounds, (Sender as TcxGridTableView).OptionsView.GridLineColor, (Sender as TcxGridTableView).OptionsView.GridLineColor, [bTop], 1);
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, clBlack, clBlack, [bTop], 1);
end;

procedure TTabPartitarioForm.tvPartCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TTabPartitarioForm.tvPartDblClick(Sender: TObject);
begin
  inherited;
   // Visualizza il documento
   ClientiForm.RxSpeedButtonVisualizzaClick(Self);
end;

procedure TTabPartitarioForm.tvPartEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  inherited;
   // Prima di tutto controlla che il bersaglio non sia nullo
   if Target <> nil then begin
      // In base al bersaglio attiva la funzione corretta.
      if Target is TSpeedButton then begin
         TSpeedButton(Target).OnClick(Self);
      end;
   end;
end;

procedure TTabPartitarioForm.TrovaButtonClick(Sender: TObject);
begin
  inherited;
   if PageControlPartitario.ActivePage = TabPartSoggetti then begin
     EsequiQueryPartitario;
   end else if PageControlPartitario.ActivePage = TabPartIva then begin
     EsequiQueryPartitarioIva;
   end else if PageControlPartitario.ActivePage = TabPartAltro then begin
     EsequiQueryPartitarioAltro;
   end;
end;

procedure TTabPartitarioForm.ResetQueryButtonClick(Sender: TObject);
begin
  inherited;
      if (PageControlPartitario.ActivePage = TabPartSoggetti) then begin
        PartFilterInclude.Checked[INCLUDI_DDT]        := DM1.DefaultVisualizzaDdt;
        PartFilterInclude.Checked[INCLUDI_RICFISC]    := DM1.DefaultVisualizzaRifFisc;
        PartFilterInclude.Checked[INCLUDI_INTERVENTI] := DM1.DefaultVisualizzaInterventi;
        PartFilterInclude.Checked[INCLUDI_PRIMANOTA]  := DM1.DefaultVisualizzaPrimanota;
        PartFilterInclude.Checked[ESCLUDI_FATT_ACQUI] := DM1.DefaultEscludiFattAcqui;

        PartFilterOther.Checked[OTHER_RIGHI_COME_NOTE]  := DM1.DefaultVisualizzaRighiDocComeNote;
        PartFilterOther.Checked[OTHER_SOLO_PRAT_APERTE] := DM1.DefaultVisualizzaSoloPraticheAperte;
        PartFilterOther.Checked[OTHER_NO_BOLLI_FATT] := DM1.DefaultNoBolliFatture;

        PartFilterDescrizione.Text   := '';
        PartFilterTipoSoggetto.Text  := '';
        PartFilterBanca.Text         := '';
        PartFilterAgente.Text        := '';
        PartFilterAgente2.Text       := '';
        PartFilterAgente3.Text       := '';
        PartFilterAgente4.Text       := '';
        // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
        //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
        //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
        //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
        PartFilterMesiTutti.Tag := 1;
        PartFilterMesiNessunoClick(Self);
        // Seleziona solo i documenti dell'anno in corso se non si è dentro
        //  un cantiere altrimenti li visualizza senza limiti di date
        if ClientiForm.PraticaCorrente = '' then PartFilterMesiTuttiClick(Self);
        // Azzera la query
        if ClientiForm.RxSpeedButtonResetQuery.Tag = 1 then tvPart.DataController.RecordCount := 0;
      end;
      if (PageControlPartitario.ActivePage = TabPartIva) then begin
        PartIvaFilterDescrizione.Text   := '';
        PartIvaFilterAgente.Text        := '';
        PartIvaFilterAgente2.Text       := '';
        PartIvaFilterAgente3.Text       := '';
        PartIvaFilterAgente4.Text       := '';
        // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
        //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
        //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
        //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
        PartIvaFilterMesiTutti.Tag := 1;
        PartIvaFilterMesiNessunoClick(Self);
        // Seleziona solo i documenti dell'anno in corso se non si è dentro
        //  un cantiere altrimenti li visualizza senza limiti di date
        if ClientiForm.PraticaCorrente = '' then PartIvaFilterMesiTuttiClick(Self);
        // Azzera la query
        if ClientiForm.RxSpeedButtonResetQuery.Tag = 1 then tvPartIva.DataController.RecordCount := 0;
      end;
      if (PageControlPartitario.ActivePage = TabPartAltro) then begin
        PartAltroFilterDescrizione.Text   := '';
        PartAltroFilterAgente.Text        := '';
        PartAltroFilterAgente2.Text       := '';
        PartAltroFilterAgente3.Text       := '';
        PartAltroFilterAgente4.Text       := '';
        // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
        //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
        //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
        //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
        PartAltroFilterMesiTutti.Tag := 1;
        PartAltroFilterMesiNessunoClick(Self);
        // Azzera filtraggio per tipo movimento
        PartAltroFilterTipo1.Text := '';
        PartAltroFilterTipo2.Text := '';
        PartAltroFilterTipo3.Text := '';
        PartAltroFilterTipo4.Text := '';
        PartAltroFilterTipo5.Text := '';
        PartAltroFilterTipo6.Text := '';
        // Seleziona solo i documenti dell'anno in corso se non si è dentro
        //  un cantiere altrimenti li visualizza senza limiti di date
        if ClientiForm.PraticaCorrente = '' then PartAltroFilterMesiTuttiClick(Self);
        // Azzera la query
        if ClientiForm.RxSpeedButtonResetQuery.Tag = 1 then tvPartAltro.DataController.RecordCount := 0;
      end;
end;

procedure TTabPartitarioForm.PageControlPartitarioChange(Sender: TObject);
begin
  inherited;
  // Se la pagina attiva è quella dei soggetti...
  if PageControlPartitario.ActivePage = TabPartSoggetti then begin
    // Se la query non è attiva, azzera i filtri e e effettua la ricerca automaticamente
    if (tvPart.DataController.RecordCount = 0) then begin
      ClientiForm.RxSpeedButtonResetQueryClick(Self);
      if DM1.GoAutoquery(IDX_AUTOQUERY_PARTITARIO) then ClientiForm.RxSpeedButtonTrovaClick(Self);
    end;
  // Se invece la pagina attiva è quella dell'IVA...
  end else if PageControlPartitario.ActivePage = TabPartIva then begin
    // Se la query non è attiva, azzera i filtri e e effettua la ricerca automaticamente
    if (tvPartIva.DataController.RecordCount = 0) then begin
      ClientiForm.RxSpeedButtonResetQueryClick(Self);
      if DM1.GoAutoquery(IDX_AUTOQUERY_PARTITARIO) then ClientiForm.RxSpeedButtonTrovaClick(Self);
    end;
  // Se invece la pagina attiva è quella dell'ALTRO...
  //  NB
  end else if PageControlPartitario.ActivePage = TabPartAltro then begin
    // Se la query non è attiva, azzera i filtri e e effettua la ricerca automaticamente
    if (tvPartAltro.DataController.RecordCount = 0) then begin
      ClientiForm.RxSpeedButtonResetQueryClick(Self);
      // NB: In questa pagina non può essere automatico mai, in quanto prima l'operatore
      //      deve necessariamente spceificare di quale conto vuole l'interrogazione.
      //if DM1.GoAutoquery(IDX_AUTOQUERY_PARTITARIO) then ClientiForm.RxSpeedButtonTrovaClick(Self);
    end;
  end;
end;

procedure TTabPartitarioForm.FormShow(Sender: TObject);
begin
  inherited;
  // Carica il layout della form
  CaricaFormLayout;
  // Caricamento delle impostazioni di visualizzazione delle griglie
  if not MainForm.IsLevanteLight then begin
    DM1.RipristinaDevExpress(GridPart, '', False);
    DM1.RipristinaDevExpress(GridPartIva, '', False);
    DM1.RipristinaDevExpress(GridPartAltro, '', False);
  end;
  // Imposta visibile la prima pagina
  PageControlPartitario.ActivePage := TabPartSoggetti;
  PageControlPartitarioChange(PageControlPartitario);
  // Se c'è un cliente selezionato visualizza il fido concesso
  if ClientiForm.ClienteCorrente <> '' then begin
    TotPartFido.Value := ClientiForm.FidoConcesso;
    PanelFido.Visible := True;
  end else begin
    PanelFido.Visible := False;
  end;
end;

procedure TTabPartitarioForm.ApriDocumento(var DocType, Registro: String;
  var DocNum: Integer; var DocDate: TDate);
begin
  // Se siamo nella pagina del partitario soggetti e c'è un rigo selezionato...
  if (PageControlPartitario.ActivePage = TabPartSoggetti) and (Assigned(tvPart.Controller.FocusedRecord)) and (tvPart.DataController.FocusedRecordIndex <> -1) and (tvPart.Controller.FocusedRecord.IsData) then begin
    // Se la seleziona attuale è un documento...
    if tvPart.DataController.Values[tvPart.DataController.FocusedRecordIndex, tvPartDOCTIPO.Index] <> 'PRIMANOTA'
    then begin
      DocType    := tvPart.DataController.Values[tvPart.DataController.FocusedRecordIndex, tvPartDOCTIPO.Index];
      DocNum     := tvPart.DataController.Values[tvPart.DataController.FocusedRecordIndex, tvPartDOCNUM.Index];
      DocDate    := tvPart.DataController.Values[tvPart.DataController.FocusedRecordIndex, tvPartDOCDATA.Index];
      Registro   := tvPart.DataController.Values[tvPart.DataController.FocusedRecordIndex, tvPartDOCREG.Index];
    // Se invece si tratta di un movimento di primanota procede con la sua apertura
    end else begin
      // Crea e visualizza la form della primanota simulando il fatto che si tratti di un TAB
      //  ovviamente crea la Form solo se non è già esistente
      if PrimanotaForm = nil then begin
         Application.CreateForm(TPrimanotaForm, PrimanotaForm);
         PrimanotaForm.Parent     := MainForm;
         PrimanotaForm.Tag := 1;
         PrimanotaForm.CodToOpen  := tvPart.DataController.Values[tvPart.DataController.FocusedRecordIndex, tvPartDOCNUM.Index];
         PrimanotaForm.DataToOpen := tvPart.DataController.Values[tvPart.DataController.FocusedRecordIndex, tvPartDOCDATA.Index];
      end;
      PrimanotaForm.Show;
    end;

  // Se siamo nella pagina del partitario Iva e c'è un rigo selezionato...
  end else if (PageControlPartitario.ActivePage = TabPartIva) and (Assigned(tvPartIva.Controller.FocusedRecord)) and (tvPartIva.DataController.FocusedRecordIndex <> -1) and (tvPartIva.Controller.FocusedRecord.IsData) then begin
    // Se la seleziona attuale è un documento...
    if tvPartIva.DataController.Values[tvPartIva.DataController.FocusedRecordIndex, tvPartIvaDOCTIPO.Index] <> 'PRIMANOTA'
    then begin
      DocType    := tvPartIva.DataController.Values[tvPartIva.DataController.FocusedRecordIndex, tvPartIvaDOCTIPO.Index];
      DocNum     := tvPartIva.DataController.Values[tvPartIva.DataController.FocusedRecordIndex, tvPartIvaDOCNUM.Index];
      DocDate    := tvPartIva.DataController.Values[tvPartIva.DataController.FocusedRecordIndex, tvPartIvaDOCDATA.Index];
      Registro   := tvPartIva.DataController.Values[tvPartIva.DataController.FocusedRecordIndex, tvPartIvaDOCREG.Index];
    // Se invece si tratta di un movimento di primanota procede con la sua apertura
    end else begin
      // Crea e visualizza la form della primanota simulando il fatto che si tratti di un TAB
      //  ovviamente crea la Form solo se non è già esistente
      if PrimanotaForm = nil then begin
         Application.CreateForm(TPrimanotaForm, PrimanotaForm);
         PrimanotaForm.Parent     := MainForm;
         PrimanotaForm.Tag := 1;
         PrimanotaForm.CodToOpen  := tvPartIva.DataController.Values[tvPartIva.DataController.FocusedRecordIndex, tvPartIvaDOCNUM.Index];
         PrimanotaForm.DataToOpen := tvPartIva.DataController.Values[tvPartIva.DataController.FocusedRecordIndex, tvPartIvaDOCDATA.Index];
      end;
      PrimanotaForm.Show;
    end;

  // Se siamo nella pagina del partitario Altro e c'è un rigo selezionato...
  end else if (PageControlPartitario.ActivePage = TabPartAltro) and (Assigned(tvPartAltro.Controller.FocusedRecord)) and (tvPartAltro.DataController.FocusedRecordIndex <> -1) and (tvPartAltro.Controller.FocusedRecord.IsData) then begin
    // Se la seleziona attuale è un documento...
    if tvPartAltro.DataController.Values[tvPartAltro.DataController.FocusedRecordIndex, tvPartAltroDOCTIPO.Index] <> 'PRIMANOTA'
    then begin
      DocType    := tvPartAltro.DataController.Values[tvPartAltro.DataController.FocusedRecordIndex, tvPartAltroDOCTIPO.Index];
      DocNum     := tvPartAltro.DataController.Values[tvPartAltro.DataController.FocusedRecordIndex, tvPartAltroDOCNUM.Index];
      DocDate    := tvPartAltro.DataController.Values[tvPartAltro.DataController.FocusedRecordIndex, tvPartAltroDOCDATA.Index];
      Registro   := tvPartAltro.DataController.Values[tvPartAltro.DataController.FocusedRecordIndex, tvPartAltroDOCREG.Index];
    // Se invece si tratta di un movimento di primanota procede con la sua apertura
    end else begin
      // Crea e visualizza la form della primanota simulando il fatto che si tratti di un TAB
      //  ovviamente crea la Form solo se non è già esistente
      if PrimanotaForm = nil then begin
         Application.CreateForm(TPrimanotaForm, PrimanotaForm);
         PrimanotaForm.Parent     := MainForm;
         PrimanotaForm.Tag := 1;
         PrimanotaForm.CodToOpen  := tvPartAltro.DataController.Values[tvPartAltro.DataController.FocusedRecordIndex, tvPartAltroDOCNUM.Index];
         PrimanotaForm.DataToOpen := tvPartAltro.DataController.Values[tvPartAltro.DataController.FocusedRecordIndex, tvPartAltroDOCDATA.Index];
      end;
      PrimanotaForm.Show;
    end;
  end;
end;

procedure TTabPartitarioForm.PartAltroFilterTipo1PropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
  inherited;
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DESCRIZIONE FROM TIPIRIGHI WHERE LIVELLO = ' + QuotedStr(RightStr((Sender as TcxComboBox).Name, 1)) +
        ' AND ABILITATO <> ''F'' ORDER BY DESCRIZIONE');
      Qry.Open;
      (Sender as TcxComboBox).Properties.Items.Clear;
      (Sender as TcxComboBox).Properties.Items.Add('');
      (Sender as TcxComboBox).Properties.Items.Add('TUTTI');
      while not Qry.Eof do begin
         (Sender as TcxComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTabPartitarioForm.PartSoggExpandButtonClick(Sender: TObject);
begin
  inherited;
  tvPart.ViewData.Expand(True);
end;

procedure TTabPartitarioForm.PartSoggCollapseButtonClick(Sender: TObject);
begin
  inherited;
  tvPart.ViewData.Collapse(True);
end;

procedure TTabPartitarioForm.PartIvaCollapseButtonClick(Sender: TObject);
begin
  inherited;
  tvPartIva.ViewData.Collapse(True);
end;

procedure TTabPartitarioForm.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  tvPartAltro.ViewData.Collapse(True);
end;

procedure TTabPartitarioForm.PartIvaExpandButtonClick(Sender: TObject);
begin
  inherited;
  tvPartIva.ViewData.Expand(True);
end;

procedure TTabPartitarioForm.PartAltroExpandButtonClick(Sender: TObject);
begin
  inherited;
  tvPartAltro.ViewData.Expand(True);
end;

procedure TTabPartitarioForm.Selezionavista1Click(Sender: TObject);
var
   CurrGrid:TcxControl;
   CurrItemCaption:String;
begin
   // Caption della voce selezionata
   CurrItemCaption := (Sender as TMenuItem).Caption;
   // Se la Caption della voce selezionata contiene il carattere & (incasina tutto)
   //  lo toglie.
   CurrItemCaption := StringReplace(CurrItemCaption, '&', #0, [rfReplaceAll]);
   // Se la voce attuale è la radice del menu di selezione viste esce subito
   if (Sender as TMenuItem).Name = 'Selezionavista1' then Exit;
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GetCurrentGrid;
   // Carica la vista attuale
   if CurrGrid is TcxGrid then DM1.RipristinaDevExpress((CurrGrid as TcxGrid), CurrItemCaption, False);
end;

function TTabPartitarioForm.GetCurrentGrid: TcxGrid;
begin
  // Inizializzazione
  Result := nil;
  // In base alla pagina selezionata Elenco Viste punta alla griglia
  //  corretta
  if      PageControlPartitario.ActivePage = TabPartSoggetti  then Result := GridPart
  else if PageControlPartitario.ActivePage = TabPartIva       then Result := GridPartIva
  else if PageControlPartitario.ActivePage = TabPartAltro     then Result := GridPartAltro
  ;
end;


procedure TTabPartitarioForm.Salvaimpostazionicolonne1Click(
  Sender: TObject);
var
   Vista:String;
   CurrGrid:TcxControl;
begin
   // Chiede il nome della vista
   if InputQuery('Salvataggio vista', 'Con quale nome devo salvare la vista?', Vista) then begin
      // Controlla che la vista non sia nullo
      if Trim(Vista) = '' then raise Exception.Create('Il nome della vista non può essere vuoto.');
   end else begin
      // Se l'utente ha cliccato su Cancel annulla l'operazione
      Exit;
   end;
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GetCurrentGrid;
   // Carica la vista attuale
   if CurrGrid is TcxGrid then DM1.SalvaGriglieDevExpress((CurrGrid as TcxGrid), Vista, False);
//   if CurrGrid is TcxDBPivotGrid then DM1.SalvaGrigliePivotDevExpress((CurrGrid as TcxDBPivotGrid), Vista);
//   if CurrGrid is TcxScheduler then DM1.SalvaAgendaDevExpress((CurrGrid as TcxScheduler), Vista);
end;

procedure TTabPartitarioForm.Ripristinacolonneeliminate1Click(
  Sender: TObject);
var
   CurrGrid:TcxControl;
begin
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   CurrGrid := GetCurrentGrid;
   // Carica la vista attuale
   if CurrGrid is TcxGrid then (CurrGrid as TcxGrid).FocusedView.Controller.Customization := True;
//   if CurrGrid is TcxDBPivotGrid then (CurrGrid as TcxDBPivotGrid).Customization.Visible := True;
end;

procedure TTabPartitarioForm.EsportainformatoExcel1Click(Sender: TObject);
var
  CurrGrid: TcxGrid;
begin
  // In base alla pagina selezionata alla griglia
  //  corretta
  CurrGrid := GetCurrentGrid;
  // Richiama la procedura che si occuperà dell'operazione
  MainForm.EsportaGridSuExcel(CurrGrid);
end;

procedure TTabPartitarioForm.tvPartSALDOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  // Fa in modo che i valori del saldo non vengano mai visualizzati perchè
  //  non sarebbero corretti e servono solo per i tuotli sui gruppi
  AText := '';
end;

procedure TTabPartitarioForm.tvPartTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems2GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: String);
begin
  inherited;

  if VarIsNull(AValue) then AText := '- - -'
  else begin
    if AValue = 0 then AText := '- - -'
    else if AValue < 0 then Atext := Copy(Atext, 2, 9999) + ' - A'
    else Atext := Atext + ' - D';
  end;

end;

procedure TTabPartitarioForm.tvPartDataControllerGroupingChanged(
  Sender: TObject);
var
  i: Integer;
  Grouped: Boolean;
begin
  inherited;
  // Inizializzazione
  Grouped := False;
  // Se c'è almeno un raggruppamento rende visibile la colonna SALDO
  try
    for i := 0 to tvPart.ColumnCount -1 do begin
      if tvPart.Columns[i].GroupIndex <> -1 then begin
        Grouped := True;
        break;
      end;
    end;
  finally
    tvPartSALDO.Visible := Grouped;
  end;
end;

procedure TTabPartitarioForm.tvPartCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Solo se non è selezionata
  if not AViewInfo.Selected then begin
    // IMposta il colore del Font in base allo stato del documento
    if  (not VarIsNull(AViewInfo.GridRecord.Values[tvPartSTATODESCRIZIONE.Index]))
    and (not VarIsNull(AViewInfo.GridRecord.Values[tvPartSTATOFOREGROUND.Index]))
    then begin
      ACanvas.Font.Color := DM1.StrToColor(AViewInfo.GridRecord.Values[tvPartSTATOFOREGROUND.Index], ACanvas.Font.Color);
    end;
  end;
end;

procedure TTabPartitarioForm.tvPartIvaCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Solo se non è selezionata
  if not AViewInfo.Selected then begin
    // IMposta il colore del Font in base allo stato del documento
    if  (not VarIsNull(AViewInfo.GridRecord.Values[tvPartIvaSTATODESCRIZIONE.Index]))
    and (not VarIsNull(AViewInfo.GridRecord.Values[tvPartIvaSTATOFOREGROUND.Index]))
    then begin
      ACanvas.Font.Color := DM1.StrToColor(AViewInfo.GridRecord.Values[tvPartIvaSTATOFOREGROUND.Index], ACanvas.Font.Color);
    end;
  end;
end;

procedure TTabPartitarioForm.tvPartAltroCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Solo se non è selezionata
  if not AViewInfo.Selected then begin
    // IMposta il colore del Font in base allo stato del documento
    if  (not VarIsNull(AViewInfo.GridRecord.Values[tvPartAltroSTATODESCRIZIONE.Index]))
    and (not VarIsNull(AViewInfo.GridRecord.Values[tvPartAltroSTATOFOREGROUND.Index]))
    then begin
      ACanvas.Font.Color := DM1.StrToColor(AViewInfo.GridRecord.Values[tvPartAltroSTATOFOREGROUND.Index], ACanvas.Font.Color);
    end;
  end;
end;

procedure TTabPartitarioForm.MenuGridsPopup(Sender: TObject);
var
   CurrGrid:TComponent;
   CurrMenuItem:TMenuItem;
   i: Integer;
   ListaViste: TStrings;
begin
   // ==========================================================================
   // Caricamento delle viste delle griglia attualmente visualizzata
   // --------------------------------------------------------------------------
   // In base alla pagina selezionata Elenco Viste punta alla griglia
   //  corretta
   if      PageControlPartitario.ActivePage = TabPartSoggetti         then CurrGrid := GridPart
   else if PageControlPartitario.ActivePage = TabPartIva              then CurrGrid := GridPartIva
   else if PageControlPartitario.ActivePage = TabPartAltro            then CurrGrid := GridPartAltro
   else begin
     // Rende invisibili le voci corrispondenti alle viste
     Selezionavista1.Visible              := False;
     Salvaimpostazionicolonne1.Visible    := False;
     Ripristinacolonneeliminate1.Visible  := False;
   end;
   // Rende visibili le voci corrispondenti alle viste
   Selezionavista1.Visible              :=  (not MainForm.IsLevanteLight);
   Salvaimpostazionicolonne1.Visible    :=  (not MainForm.IsLevanteLight);
   Ripristinacolonneeliminate1.Visible  :=  (not MainForm.IsLevanteLight);
   // Carica l'elenco delle viste disponibili per questa griglia
   //  in una StringList
   ListaViste := TStringList.Create;
   try
     DM1.ListaVisteGriglia(CurrGrid.Name, ListaViste);
     // Svuota l'elenco delle viste
     Selezionavista1.Clear;
     // Aggiunge la voce di selezione di nessuna vista
     CurrMenuItem := TMenuItem.Create(Self);
     CurrMenuItem.Caption := 'NESSUNA  (Avrà effetto al prossimo riavvio di Levante)';
     CurrMenuItem.Name := 'NessunaVista';
     CurrMenuItem.OnClick := Selezionavista1Click;
     Selezionavista1.Add(CurrMenuItem);
     // Aggiunge le altre eventuali viste presenti
     for i := 0 to ListaViste.Count -1 do begin
       CurrMenuItem := TMenuItem.Create(Self);
       CurrMenuItem.Caption := ListaViste.Strings[i];
       CurrMenuItem.OnClick := Selezionavista1Click;
       Selezionavista1.Add(CurrMenuItem);
     end;
   finally
     ListaViste.Free;
   end;
   // ==========================================================================
end;

procedure TTabPartitarioForm.tvPartDataControllerSortingChanged(
  Sender: TObject);
begin
  inherited;
   tvPart.Controller.GoToFirst(False);
end;

procedure TTabPartitarioForm.tvPartIvaDataControllerGroupingChanged(
  Sender: TObject);
var
  i: Integer;
  Grouped: Boolean;
begin
  inherited;
  // Inizializzazione
  Grouped := False;
  // Se c'è almeno un raggruppamento rende visibile la colonna SALDO
  try
    for i := 0 to tvPartIva.ColumnCount -1 do begin
      if tvPartIva.Columns[i].GroupIndex <> -1 then begin
        Grouped := True;
        break;
      end;
    end;
  finally
    tvPartIvaSALDO.Visible := Grouped;
  end;

end;

procedure TTabPartitarioForm.tvPartIvaDataControllerSortingChanged(
  Sender: TObject);
begin
  inherited;
   tvPartIva.Controller.GoToFirst(False);
end;

procedure TTabPartitarioForm.tvPartAltroDataControllerGroupingChanged(
  Sender: TObject);
var
  i: Integer;
  Grouped: Boolean;
begin
  inherited;
  // Inizializzazione
  Grouped := False;
  // Se c'è almeno un raggruppamento rende visibile la colonna SALDO
  try
    for i := 0 to tvPartAltro.ColumnCount -1 do begin
      if tvPartAltro.Columns[i].GroupIndex <> -1 then begin
        Grouped := True;
        break;
      end;
    end;
  finally
    tvPartAltroSALDO.Visible := Grouped;
  end;
end;

procedure TTabPartitarioForm.tvPartAltroDataControllerSortingChanged(
  Sender: TObject);
begin
  inherited;
   tvPartAltro.Controller.GoToFirst(False);
end;

procedure TTabPartitarioForm.tvPartAltroTcxGridDataControllerTcxDataSummaryDefaultGroupSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  // Lo zero non lo visualizza
  if (not VarIsNull(AValue)) and (AValue = 0)
  then AText := '';
end;

procedure TTabPartitarioForm.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  DM1.SalvaDatePredefinitePerFiltri(PartFilterDal.EditText, PartFilterAl.EditText);
end;

procedure TTabPartitarioForm.Esportainformatotesto1Click(Sender: TObject);
var
  CurrGrid: TcxGrid;
begin
  // In base alla pagina selezionata alla griglia
  //  corretta
  CurrGrid := GetCurrentGrid;
  // Richiama la procedura che si occuperà dell'operazione
  MainForm.EsportaGridSuTesto(CurrGrid);
end;

procedure TTabPartitarioForm.tvPartDAREGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  // Lo zero non lo visualizza
  if (not VarIsNull(ARecord.Values[Sender.Index])) and (ARecord.Values[Sender.Index] = 0)
  then AText := '';
end;

procedure TTabPartitarioForm.PartFilterAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(1, PartFilterAgente2);
end;

procedure TTabPartitarioForm.PartFilterAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(2, PartFilterAgente3);
end;

procedure TTabPartitarioForm.PartFilterAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(3, PartFilterAgente4);
end;

procedure TTabPartitarioForm.PartFilterAgentePropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(PartFilterAgente.Properties.Items, 1, '');
end;

procedure TTabPartitarioForm.PartFilterAgente2PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(PartFilterAgente2.Properties.Items, 2, PartFilterAgente.Text);
end;

procedure TTabPartitarioForm.PartFilterAgente3PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(PartFilterAgente3.Properties.Items, 3, PartFilterAgente2.Text);
end;

procedure TTabPartitarioForm.PartFilterAgente4PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(PartFilterAgente4.Properties.Items, 4, PartFilterAgente3.Text);
end;

procedure TTabPartitarioForm.PartIvaFilterAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(1, PartIvaFilterAgente2);
end;

procedure TTabPartitarioForm.PartIvaFilterAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(2, PartIvaFilterAgente3);
end;

procedure TTabPartitarioForm.PartIvaFilterAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(3, PartIvaFilterAgente4);
end;

procedure TTabPartitarioForm.PartIvaFilterAgentePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(PartIvaFilterAgente.Properties.Items, 1, '');
end;

procedure TTabPartitarioForm.PartIvaFilterAgente2PropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(PartIvaFilterAgente2.Properties.Items, 2, PartIvaFilterAgente.Text);
end;

procedure TTabPartitarioForm.PartIvaFilterAgente3PropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(PartIvaFilterAgente3.Properties.Items, 3, PartIvaFilterAgente2.Text);
end;

procedure TTabPartitarioForm.PartIvaFilterAgente4PropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(PartIvaFilterAgente4.Properties.Items, 4, PartIvaFilterAgente3.Text);
end;

procedure TTabPartitarioForm.PartAltroFilterAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(1, PartAltroFilterAgente2);
end;

procedure TTabPartitarioForm.PartAltroFilterAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(2, PartAltroFilterAgente3);
end;

procedure TTabPartitarioForm.PartAltroFilterAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(3, PartAltroFilterAgente4);
end;

procedure TTabPartitarioForm.PartAltroFilterAgentePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(PartAltroFilterAgente.Properties.Items, 1, '');
end;

procedure TTabPartitarioForm.PartAltroFilterAgente2PropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(PartAltroFilterAgente2.Properties.Items, 2, PartAltroFilterAgente.Text);
end;

procedure TTabPartitarioForm.PartAltroFilterAgente3PropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(PartAltroFilterAgente3.Properties.Items, 3, PartAltroFilterAgente2.Text);
end;

procedure TTabPartitarioForm.PartAltroFilterAgente4PropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le items
  DM1.CaricaItemsAgenti(PartAltroFilterAgente4.Properties.Items, 4, PartAltroFilterAgente3.Text);
end;

procedure TTabPartitarioForm.PartFilterTipoSoggettoPropertiesInitPopup(
  Sender: TObject);
var
   LO: TMemIniFile;
   TmpStr: String;
begin
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   try
     with (Sender as TcxComboBox).Properties do begin
       Items.Clear;
       Items.Add('');
       TmpStr := LO.ReadString('FormAnagraficaClienti', 'TipoSoggetto', 'Soggetto');
       while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do begin
          Items.Add(DM1.RitornaTestoPrimaDi('_', TmpStr, True));
       end;
     end;
   finally
     LO.Free;
   end;
end;

procedure TTabPartitarioForm.cxComboBox1PropertiesInitPopup(
  Sender: TObject);
var
   Qry:TIBOQuery;
begin
   inherited;
   // Crea l'oggetto query
   Qry := TIBOQuery.Create(Self);
   try
     Qry.DatabaseName := DM1.ArcDBFile;
     Qry.IB_Connection := DM1.DBAzienda;
     // IMposta l'interrogazione e la esegue (elenca le proprie banche appoggio)
     Qry.SQL.Add('SELECT DescBreve');
     Qry.SQL.Add('FROM Banche');
     Qry.SQL.Add('WHERE MiaBanca = ''T''');
     Qry.SQL.Add('ORDER BY DescBreve');
     Qry.Open;
     // Ora carica tutte le nostre proprie banche appoggio nella combo box
     with (Sender as TcxComboBox).Properties do begin
       Items.Clear;
       Items.Add('');
       while not Qry.EOF do begin
         if (Qry.FieldByName('DescBreve').AsString <> '') then Items.Add(Qry.FieldByName('DescBreve').Value) else raise Exception.Create('Manca la descrizione breve ad una nostra banca appoggio!');
         Qry.Next;
       end;
     end;
   finally
     // Distrugge la query
     Qry.Free;
   end;
end;

end.
