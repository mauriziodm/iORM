unit FormSelezionaPraticheImpianti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase, ExtCtrls, bmpPanel,
  cxCustomData, cxGraphics, cxEdit, DB,
  cxDBData, cxTextEdit, cxCalendar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxPC, IBODataset, cxContainer, cxMaskEdit,
  cxDropDownEdit, StdCtrls, CheckLst, Mask, MAURI_SB, Buttons,
  IB_Components, cxCheckBox, cxCurrencyEdit, Menus, cxStyles, cxFilter,
  cxData, cxDataStorage, cxPCdxBarPopupMenu, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.ComCtrls, dxCore, cxDateUtils, cxNavigator;

type
  TSelezionaPraticheImpiantiForm = class(TModelBaseForm)
    cxPageControl1: TcxPageControl;
    TabCantieri: TcxTabSheet;
    TabImpianti: TcxTabSheet;
    PanelPratFiltri: TPanel;
    GridSelezioneCantiere: TcxGrid;
    tvSelezioneCantiere: TcxGridDBTableView;
    tvSelezioneCantiereCODICE: TcxGridDBColumn;
    tvSelezioneCantiereDESCRIZIONE: TcxGridDBColumn;
    tvSelezioneCantiereDATAAPERTURA: TcxGridDBColumn;
    tvSelezioneCantiereDATACHIUSURA: TcxGridDBColumn;
    tvSelezioneCantiereSTATODESCRIZIONE: TcxGridDBColumn;
    tvSelezioneCantiereRAGIONESOCIALE: TcxGridDBColumn;
    tvSelezioneCantiereSTATOFOREGROUND: TcxGridDBColumn;
    tvSelezioneCantiereSTATOBACKGROUND: TcxGridDBColumn;
    lvPrat: TcxGridLevel;
    Label34: TLabel;
    Label33: TLabel;
    PratOtt: TSpeedButton;
    PratNov: TSpeedButton;
    PratDic: TSpeedButton;
    PratAgo: TSpeedButton;
    PratLug: TSpeedButton;
    PratGiu: TSpeedButton;
    PratMag: TSpeedButton;
    PratGen: TSpeedButton;
    PratFeb: TSpeedButton;
    PratMar: TSpeedButton;
    PratApr: TSpeedButton;
    PratMesiTutti: TSpeedButton;
    PratMesiNessuno: TSpeedButton;
    PratSet: TSpeedButton;
    SBPratFilterOpenClose: TSpeedButtonRollOver;
    StaticText40: TStaticText;
    PratCodice: TEdit;
    StaticText43: TStaticText;
    CantieriApertiChiusi: TCheckListBox;
    StaticText55: TStaticText;
    PratStato: TcxComboBox;
    StaticText2: TStaticText;
    PratDescrizione: TEdit;
    QryPratiche: TIBOQuery;
    QryPraticheCODICE: TIntegerField;
    QryPraticheDESCRIZIONE: TStringField;
    QryPraticheDATAAPERTURA: TDateTimeField;
    QryPraticheDATACHIUSURA: TDateTimeField;
    QryPraticheSTATODESCRIZIONE: TStringField;
    QryPraticheRAGIONESOCIALE: TStringField;
    QryPraticheSTATOFOREGROUND: TStringField;
    QryPraticheSTATOBACKGROUND: TStringField;
    QryPraticheTIPO: TStringField;
    QryPraticheCLIENTE: TIntegerField;
    QryPraticheRAGSOC: TStringField;
    SourcePratiche: TDataSource;
    DSQ: TDataSource;
    Q: TIBOQuery;
    PanelAssFiltri: TPanel;
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
    SBAssFilterOpenClose: TSpeedButtonRollOver;
    StaticText32: TStaticText;
    StaticText29: TStaticText;
    StaticText20: TStaticText;
    FilterAbbonati: TCheckListBox;
    StaticText27: TStaticText;
    FilterInScadenza: TCheckListBox;
    StaticText28: TStaticText;
    FilterCostruttore: TcxComboBox;
    FilterModello: TcxComboBox;
    FilterLocalita: TcxComboBox;
    StaticText39: TStaticText;
    StaticText42: TStaticText;
    FilterTipoImpianto: TcxComboBox;
    FilterPeriodicita: TcxComboBox;
    StaticText23: TStaticText;
    FilterTipoData: TcxComboBox;
    StaticText57: TStaticText;
    FilterIndirizzo: TEdit;
    StaticText69: TStaticText;
    FilterTipoContratto: TcxComboBox;
    StaticText75: TStaticText;
    FilterAssTrova: TEdit;
    GridSelezioneImpianti: TcxGrid;
    tvSelezioneImpianti: TcxGridDBTableView;
    tvSelezioneImpiantiABBONATO: TcxGridDBColumn;
    tvSelezioneImpiantiSTATO: TcxGridDBColumn;
    tvSelezioneImpiantiRAGIONESOCIALE: TcxGridDBColumn;
    tvSelezioneImpiantiRAGSOCUT: TcxGridDBColumn;
    tvSelezioneImpiantiTIPOIMPIANTO: TcxGridDBColumn;
    tvSelezioneImpiantiPERIODICITA: TcxGridDBColumn;
    tvSelezioneImpiantiIMPORTOCONTRATTO: TcxGridDBColumn;
    tvSelezioneImpiantiTIPOCONTRATTO: TcxGridDBColumn;
    tvSelezioneImpiantiCELLULARE: TcxGridDBColumn;
    tvSelezioneImpiantiTELEFONO: TcxGridDBColumn;
    tvSelezioneImpiantiCAPIMM: TcxGridDBColumn;
    tvSelezioneImpiantiCOMUNEIMM: TcxGridDBColumn;
    tvSelezioneImpiantiDATAORAPROSSIMOAPPUNTAMENTO: TcxGridDBColumn;
    lvQ: TcxGridLevel;
    MenuGriglia: TPopupMenu;
    Selezionavista1: TMenuItem;
    Salvalavistaattuale1: TMenuItem;
    Ripristinacolonneeliminate1: TMenuItem;
    PratSelezione: TCheckListBox;
    FilterSelezione: TCheckListBox;
    StaticText1: TStaticText;
    FilterCodiceImpianto: TEdit;
    StaticText50: TStaticText;
    FilterCodiceCatasto: TEdit;
    StaticText11: TStaticText;
    FilterMatricola: TEdit;
    PanelFilterCategorieCantieri: TPanel;
    PratLabelCategCant1: TStaticText;
    PratCategCant1: TcxComboBox;
    PratLabelCategCant2: TStaticText;
    PratCategCant2: TcxComboBox;
    PratLabelCategCant3: TStaticText;
    PratCategCant3: TcxComboBox;
    PratLabelCategCant4: TStaticText;
    PratCategCant4: TcxComboBox;
    PratLabelCategCant5: TStaticText;
    PratCategCant5: TcxComboBox;
    PratLabelCategCant6: TStaticText;
    PratCategCant6: TcxComboBox;
    QryPraticheCATEGCANT1: TStringField;
    QryPraticheCATEGCANT2: TStringField;
    QryPraticheCATEGCANT3: TStringField;
    QryPraticheCATEGCANT4: TStringField;
    QryPraticheCATEGCANT5: TStringField;
    QryPraticheCATEGCANT6: TStringField;
    tvSelezioneCantiereCATEGCANT1: TcxGridDBColumn;
    tvSelezioneCantiereCATEGCANT2: TcxGridDBColumn;
    tvSelezioneCantiereCATEGCANT3: TcxGridDBColumn;
    tvSelezioneCantiereCATEGCANT4: TcxGridDBColumn;
    tvSelezioneCantiereCATEGCANT5: TcxGridDBColumn;
    tvSelezioneCantiereCATEGCANT6: TcxGridDBColumn;
    LabelPratAgente: TStaticText;
    PratAgente: TcxComboBox;
    LabelPratAgente2: TStaticText;
    PratAgente2: TcxComboBox;
    LabelPratAgente3: TStaticText;
    PratAgente3: TcxComboBox;
    LabelPratAgente4: TStaticText;
    PratAgente4: TcxComboBox;
    QryPraticheAGENTE: TStringField;
    QryPraticheAGENTE2: TStringField;
    QryPraticheAGENTE3: TStringField;
    QryPraticheAGENTE4: TStringField;
    tvSelezioneCantiereAGENTE: TcxGridDBColumn;
    tvSelezioneCantiereAGENTE2: TcxGridDBColumn;
    tvSelezioneCantiereAGENTE3: TcxGridDBColumn;
    tvSelezioneCantiereAGENTE4: TcxGridDBColumn;
    QTIPO: TStringField;
    QCODICE: TIntegerField;
    QDATAAPERTURA: TDateTimeField;
    QDESCRIZIONE: TStringField;
    QRAGIONESOCIALE: TStringField;
    QTELEFONO: TStringField;
    QCELLULARE: TStringField;
    QPROVINCIAIMM: TStringField;
    QCOMUNEIMM: TStringField;
    QCAPIMM: TStringField;
    QABBONATO: TStringField;
    QTIPOCONTRATTO: TStringField;
    QIMPORTOCONTRATTO: TIBOFloatField;
    QTIPOIMPIANTO: TStringField;
    QPERIODICITA: TIntegerField;
    QRAGSOCUT: TStringField;
    QCLIENTE: TIntegerField;
    QPROXVISITAENTRO: TDateTimeField;
    QDATAULTIMOINTERVENTO: TDateTimeField;
    QDATAORAPROSSIMOAPPUNTAMENTO: TDateTimeField;
    QINDIRIZZOIMM: TStringField;
    QSTATO: TStringField;
    tvSelezioneImpiantiDESCRIZIONE: TcxGridDBColumn;
    tvSelezioneImpiantiTIPO: TcxGridDBColumn;
    tvSelezioneImpiantiCODICE: TcxGridDBColumn;
    tvSelezioneImpiantiDATAAPERTURA: TcxGridDBColumn;
    tvSelezioneImpiantiPROVINCIAIMM: TcxGridDBColumn;
    tvSelezioneImpiantiCLIENTE: TcxGridDBColumn;
    tvSelezioneImpiantiPROXVISITAENTRO: TcxGridDBColumn;
    tvSelezioneImpiantiDATAULTIMOINTERVENTO: TcxGridDBColumn;
    tvSelezioneImpiantiINDIRIZZOIMM: TcxGridDBColumn;
    QID: TIntegerField;
    QryPraticheID: TIntegerField;
    TransQ: TIB_Transaction;
    TransPratiche: TIB_Transaction;
    PratDal: TcxDateEdit;
    PratAl: TcxDateEdit;
    AssDal: TcxDateEdit;
    AssAl: TcxDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonResetQueryClick(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure PratMesiTuttiClick(Sender: TObject);
    procedure PratMesiNessunoClick(Sender: TObject);
    procedure PratGenClick(Sender: TObject);
    procedure PratGenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PratStatoPropertiesInitPopup(Sender: TObject);
    procedure CantieriApertiChiusiClickCheck(Sender: TObject);
    procedure CantieriApertiChiusiMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PratCodiceKeyPress(Sender: TObject; var Key: Char);
    procedure tvSelezioneCantiereCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvSelezioneCantiereCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvSelezioneCantiereCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvSelezioneCantiereCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure tvSelezioneCantiereEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvSelezioneImpiantiCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure tvSelezioneImpiantiCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvSelezioneImpiantiCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvSelezioneImpiantiCustomDrawPartBackground(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo;
      var ADone: Boolean);
    procedure FilterPeriodicitaPropertiesInitPopup(Sender: TObject);
    procedure FilterTipoContrattoPropertiesInitPopup(Sender: TObject);
    procedure FilterCostruttorePropertiesInitPopup(Sender: TObject);
    procedure FilterModelloPropertiesInitPopup(Sender: TObject);
    procedure FilterLocalitaPropertiesInitPopup(Sender: TObject);
    procedure FilterAbbonatiClickCheck(Sender: TObject);
    procedure FilterAbbonatiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterAbbonatiExit(Sender: TObject);
    procedure AssMesiTuttiClick(Sender: TObject);
    procedure AssMesiNessunoClick(Sender: TObject);
    procedure AssMesiTuttiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AssMesiNessunoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PratMesiTuttiMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PratMesiNessunoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AssGenClick(Sender: TObject);
    procedure AssGenMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuGrigliaPopup(Sender: TObject);
    procedure Selezionavista1Click(Sender: TObject);
    procedure Salvalavistaattuale1Click(Sender: TObject);
    procedure Ripristinacolonneeliminate1Click(Sender: TObject);
    procedure SBAssFilterOpenCloseClick(Sender: TObject);
    procedure SBPratFilterOpenCloseClick(Sender: TObject);
    procedure tvSelezioneCantiereDblClick(Sender: TObject);
    procedure tvSelezioneCantiereKeyPress(Sender: TObject; var Key: Char);
    procedure tvSelezioneImpiantiEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvSelezioneImpiantiDblClick(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure PratSelezioneMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FilterCodiceImpiantoKeyPress(Sender: TObject; var Key: Char);
    procedure tvPratDataControllerGroupingChanged(Sender: TObject);
    procedure tvPratDataControllerSortingChanged(Sender: TObject);
    procedure tvQDataControllerGroupingChanged(Sender: TObject);
    procedure tvQDataControllerSortingChanged(Sender: TObject);
    procedure PratCategCant1PropertiesInitPopup(Sender: TObject);
    procedure QCalcFields(DataSet: TDataSet);
    procedure tvSelezioneImpiantiABBONATOCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure PratAgentePropertiesInitPopup(Sender: TObject);
    procedure PratAgente2PropertiesInitPopup(Sender: TObject);
    procedure PratAgente3PropertiesInitPopup(Sender: TObject);
    procedure PratAgente4PropertiesInitPopup(Sender: TObject);
    procedure PratAgentePropertiesEditValueChanged(Sender: TObject);
    procedure PratAgente2PropertiesEditValueChanged(Sender: TObject);
    procedure PratAgente3PropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CantieriApertiChiusiExit(Sender: TObject);
  private
    { Private declarations }
    FCallerCode:Integer;
    FCodiceSoggettoSelezionato:Integer;
    FCodiceSoggettoDocumento:Integer;
    fPrat_Filter_Visible_CategCant1: Boolean;
    fPrat_Filter_Visible_CategCant5: Boolean;
    fPrat_Filter_Visible_CategCant4: Boolean;
    fPrat_Filter_Visible_CategCant6: Boolean;
    fPrat_Filter_Visible_CategCant3: Boolean;
    fPrat_Filter_Visible_CategCant2: Boolean;
    procedure EseguiQueryPratiche;
    procedure EseguiQueryImpianti;
    procedure SetCodiceSoggettoDocumento(const Value: Integer);
    procedure SetCodiceSoggettoSelezionato(const Value: Integer);
    procedure CaricaTitoli;
    procedure CaricaLayout;
    procedure SetPrat_Filter_Visible_CategCant1(const Value: Boolean);
    procedure SetPrat_Filter_Visible_CategCant2(const Value: Boolean);
    procedure SetPrat_Filter_Visible_CategCant3(const Value: Boolean);
    procedure SetPrat_Filter_Visible_CategCant4(const Value: Boolean);
    procedure SetPrat_Filter_Visible_CategCant5(const Value: Boolean);
    procedure SetPrat_Filter_Visible_CategCant6(const Value: Boolean);
  public
    // Punta al componente Field in cui inserire il codice della pratica
    //  selezionata e la data.
    FieldPratica,FieldDataPratica,FieldIDPratica,FieldCliente : TField;
    EditPratica,EditDataPratica,EditDescrizionePratica : TEdit;
    { Public declarations }
    property CallerCode:Integer read FCallerCode write FCallerCode;
    property CodiceSoggettoSelezionato:Integer read FCodiceSoggettoSelezionato write SetCodiceSoggettoSelezionato;
    property CodiceSoggettoDocumento:Integer read FCodiceSoggettoDocumento write SetCodiceSoggettoDocumento;
    // Cantieri/Pratiche
    property Prat_Filter_Visible_CategCant1:Boolean           read fPrat_Filter_Visible_CategCant1            write SetPrat_Filter_Visible_CategCant1;
    property Prat_Filter_Visible_CategCant2:Boolean           read fPrat_Filter_Visible_CategCant2            write SetPrat_Filter_Visible_CategCant2;
    property Prat_Filter_Visible_CategCant3:Boolean           read fPrat_Filter_Visible_CategCant3            write SetPrat_Filter_Visible_CategCant3;
    property Prat_Filter_Visible_CategCant4:Boolean           read fPrat_Filter_Visible_CategCant4            write SetPrat_Filter_Visible_CategCant4;
    property Prat_Filter_Visible_CategCant5:Boolean           read fPrat_Filter_Visible_CategCant5            write SetPrat_Filter_Visible_CategCant5;
    property Prat_Filter_Visible_CategCant6:Boolean           read fPrat_Filter_Visible_CategCant6            write SetPrat_Filter_Visible_CategCant6;
  end;

var
  SelezionaPraticheImpiantiForm: TSelezionaPraticheImpiantiForm;

implementation

uses DataModule1, DataModuleStyles, FormHelp, FormPratica, SchedaClienti, main, DateUtils, StrUtils,
  FormRappGiorn, IniFiles, SchedaTesti;

{$R *.dfm}

procedure TSelezionaPraticheImpiantiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SelezionaPraticheImpiantiForm := nil;
end;

procedure TSelezionaPraticheImpiantiForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  CallerCode := 0;
  CodiceSoggettoDocumento := 0;
  if MainForm.ModoAssistenzeRDP or (ClientiForm.ClienteCorrente = '') or (ClientiForm.ClienteCorrente = '0')
  then CodiceSoggettoSelezionato := 0
  else CodiceSoggettoSelezionato := StrToInt(ClientiForm.ClienteCorrente);
end;

procedure TSelezionaPraticheImpiantiForm.FormShow(Sender: TObject);
begin
  inherited;
   DM1.FocusRefresh;
   // Carica il layout
   CaricaLayout;
   // Caricamento bitmaps pulsanti apertura/chiusura filtri
   ClientiForm.CloseFilterPanel(PanelPratFiltri, SBPratFilterOpenClose, False);
   ClientiForm.CloseFilterPanel(PanelAssFiltri, SBAssFilterOpenClose, False);
   // Se invece la query non è attiva, azzera i filtri e e effettua la ricerca automaticamente
   if (not QryPratiche.Active) then begin
     RxSpeedButtonResetQueryClick(Self);
     if DM1.AutoQuery[IDX_AUTOQUERY_PRATICHE] then RxSpeedButtonTrovaClick(Self);
   end;

   DM1.RipristinaDevExpress(GridSelezioneCantiere, '', False);
   DM1.RipristinaDevExpress(GridSelezioneImpianti, '', False);
end;


// Carica il layout
procedure TSelezionaPraticheImpiantiForm.CaricaLayout;
var
  LO: TMemIniFile;
  Sez:String;
begin
  CaricaTitoli;
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // ----- GRIGLIE CELL AUTO HEIGHT -----
//    tvPrat.OptionsView.CellAutoHeight := ClientiForm.tvPrat.OptionsView.CellAutoHeight;
//    tvQ.OptionsView.CellAutoHeight    := ClientiForm.tvAssistenze.OptionsView.CellAutoHeight;

    // ----- CANTIERI/PRATICHE -----
    // Filtri Agenti
    LabelPratAgente.Visible            := (DM1.GridsColumnAgenteCaption <> '');
    LabelPratAgente2.Visible           := (DM1.GridsColumnAgente2Caption <> '');
    LabelPratAgente3.Visible           := (DM1.GridsColumnAgente3Caption <> '');
    LabelPratAgente4.Visible           := (DM1.GridsColumnAgente4Caption <> '');
    PratAgente.Visible                 := LabelPratAgente.Visible;
    PratAgente2.Visible                := LabelPratAgente2.Visible;
    PratAgente3.Visible                := LabelPratAgente3.Visible;
    PratAgente4.Visible                := LabelPratAgente4.Visible;
    // Filtri Categorie cantieri
    Self.Prat_Filter_Visible_CategCant1            := (DM1.CategCantCaption1 <> '0');
    Self.Prat_Filter_Visible_CategCant2            := (DM1.CategCantCaption2 <> '0');
    Self.Prat_Filter_Visible_CategCant3            := (DM1.CategCantCaption3 <> '0');
    Self.Prat_Filter_Visible_CategCant4            := (DM1.CategCantCaption4 <> '0');
    Self.Prat_Filter_Visible_CategCant5            := (DM1.CategCantCaption5 <> '0');
    Self.Prat_Filter_Visible_CategCant6            := (DM1.CategCantCaption6 <> '0');
    // In base ai filtri abilitati o disabilitati relativi alle categorie cantieri
    //  cerca di limitarne l'occupazione se non visibili
    PanelFilterCategorieCantieri.Height := 0;
    PanelFilterCategorieCantieri.Visible := False;
    if (Self.Prat_Filter_Visible_CategCant1 or Self.Prat_Filter_Visible_CategCant2 or Self.Prat_Filter_Visible_CategCant3) then begin
      PanelFilterCategorieCantieri.Visible := True;
      PanelFilterCategorieCantieri.Height := 19;
    end;
    if (Self.Prat_Filter_Visible_CategCant4 or Self.Prat_Filter_Visible_CategCant5 or Self.Prat_Filter_Visible_CategCant6) then begin
      PanelFilterCategorieCantieri.Visible := True;
      PanelFilterCategorieCantieri.Height := 38;
    end;
    // Dimesiona il SubPanel che contiene i filtri in modo che riadatti
    PanelPratFiltri.Height := PanelFilterCategorieCantieri.Top + PanelFilterCategorieCantieri.Height;

    // ----- SELEZIONE IMPIANTI -----
    Sez := 'FormSelezionePraticheImpianti';
    TabImpianti.TabVisible := LO.ReadBool(Sez, 'VisualizzaTabImpiantiInSelezionePratiche', True);
    // Seleziona la pagina di default
    cxPageControl1.ActivePageIndex := LO.ReadInteger(Sez, 'DefaultPageIndex', 0);
  finally
    LO.Free;
  end;
end;


// Carica le caption dei vari campi
procedure TSelezionaPraticheImpiantiForm.CaricaTitoli;
var
  M: TMemIniFile;
  Sez:String;
begin
  Sez := 'TitoliPratiche';
  M := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  try
    // ----- PRATICHE -----
    TabCantieri.Caption           := M.ReadString(Sez, 'TabCantieriSelezionePratiche', 'Cantieri');
    TabImpianti.Caption           := M.ReadString(Sez, 'TabImpiantiSelezionePratiche', 'Impianti');
    CantieriApertiChiusi.Items[0] := M.ReadString(Sez, 'FilterCantieriAperti', 'Cantieri aperti');
    CantieriApertiChiusi.Items[1] := M.ReadString(Sez, 'FilterCantieriChiusi', 'Cantieri chiusi');
    // ----- AGENTI -----
    // Impostazione caption colonne griglie e filtri relative agli agenti
    tvSelezioneCantiereAGENTE.Caption               := DM1.GridsColumnAgenteCaption;
    tvSelezioneCantiereAGENTE2.Caption              := DM1.GridsColumnAgente2Caption;
    tvSelezioneCantiereAGENTE3.Caption              := DM1.GridsColumnAgente3Caption;
    tvSelezioneCantiereAGENTE4.Caption              := DM1.GridsColumnAgente4Caption;
    // Impostazione etichette filtri agenti
    LabelPratAgente.Caption            := ' ' + DM1.GridsColumnAgenteCaption;
    LabelPratAgente2.Caption           := ' ' + DM1.GridsColumnAgente2Caption;
    LabelPratAgente3.Caption           := ' ' + DM1.GridsColumnAgente3Caption;
    LabelPratAgente4.Caption           := ' ' + DM1.GridsColumnAgente4Caption;
  finally
    M.Free;
  end;
end;



procedure TSelezionaPraticheImpiantiForm.RxSpeedButtonResetQueryClick(
  Sender: TObject);
begin
  inherited;
  // ===========================================================================
  // TAB CANTIERI
  // ---------------------------------------------------------------------------
  if (cxPageControl1.ActivePage = TabCantieri) or (cxPageControl1.Tag = 1) then begin
    PratCodice.Text                := '';
    PratDescrizione.Text           := '';
    PratDal.Text                   := '';
    PratAl.Text                    := '';
    PratStato.Text                 := '';
    PratAgente.Text                := '';
    PratAgente2.Text               := '';
    PratAgente3.Text               := '';
    PratAgente4.Text               := '';
    PratCategCant1.Text            := '';
    PratCategCant2.Text            := '';
    PratCategCant3.Text            := '';
    PratCategCant4.Text            := '';
    PratCategCant5.Text            := '';
    PratCategCant6.Text            := '';
    CantieriApertiChiusi.Checked[0] := True;
    CantieriApertiChiusi.Checked[1] := False;
    // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
    //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
    //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
    //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
    PratMesiTutti.Tag := 1;
    PratMesiNessunoClick(Self);
    // Azzera la query
    if (RxSpeedButtonResetQuery.Tag = 1) then QryPratiche.Close;
  end;
  // ===========================================================================

  // ===========================================================================
  // TAB IMPIANTI
  // ---------------------------------------------------------------------------
  if (cxPageControl1.ActivePage = TabImpianti) or (cxPageControl1.Tag = 1) then begin
    FilterAssTrova.Text           := '';
    FilterAbbonati.Checked[0]     := True;
    FilterAbbonati.Checked[1]     := True;
    FilterInScadenza.Checked[0]   := False;
    FilterCodiceImpianto.Text     := '';
    FilterCodiceCatasto.Text      := '';
    FilterMatricola.Text          := '';
    FilterCostruttore.Text        := '';
    FilterModello.Text            := '';
    FilterLocalita.Text           := '';
    FilterIndirizzo.Text          := '';
    AssDal.Text                   := '';
    AssAl.Text                    := '';
    FilterTipoImpianto.Text       := '';
    FilterPeriodicita.Text        := '';
    FilterTipoData.Text           := 'Prossimo intervento';
    FilterTipoContratto.Text      := '';
    // Senza filtro per date che in questo caso è meglio
    AssMesiNessunoClick(AssMesiNessuno);
    // Azzera la query
    if RxSpeedButtonResetQuery.Tag = 1 then Q.Close;
  end;
  // ===========================================================================
end;

procedure TSelezionaPraticheImpiantiForm.RxSpeedButtonUscitaClick(
  Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TSelezionaPraticheImpiantiForm.RxSpeedButtonHelpClick(
  Sender: TObject);
begin
  inherited;
  HelpForm.Aiuto('PRATICHE');
end;

procedure TSelezionaPraticheImpiantiForm.RxSpeedButtonNuovoClick(
  Sender: TObject);
begin
  inherited;
  // ===========================================================================
  // CANTIERE
  // ---------------------------------------------------------------------------
  if cxPageControl1.ActivePage = TabCantieri then begin
    DM1.Attendere;
    try
      Application.CreateForm(TPraticaForm, PraticaForm);
      PraticaForm.Mode := MODE_PRATICHE;
      PraticaForm.Parent := MainForm;
      PraticaForm.CodiceCliente := '0';
      if ClientiForm.ClienteCorrente <> '' then PraticaForm.CodiceCliente  := ClientiForm.ClienteCorrente;
      PraticaForm.Tag := 2;
      PraticaForm.Show;
    finally
      DM1.ChiudiAttendere;
    end;
  end;
  // ===========================================================================

  // ===========================================================================
  // IMPIANTI
  // ---------------------------------------------------------------------------
  if cxPageControl1.ActivePage = TabImpianti then begin
    DM1.Attendere;
    try
      Application.CreateForm(TPraticaForm, PraticaForm);
      PraticaForm.Mode := MODE_ASSISTENZE;
      PraticaForm.Parent := MainForm;
      PraticaForm.CodiceCliente := '0';
      if ClientiForm.ClienteCorrente <> '' then PraticaForm.CodiceCliente  := ClientiForm.ClienteCorrente;
      PraticaForm.Tag := 2;
      PraticaForm.Show;
    finally
      DM1.ChiudiAttendere;
    end;
  end;
  // ===========================================================================
end;

procedure TSelezionaPraticheImpiantiForm.RxSpeedButtonTrovaClick(
  Sender: TObject);
begin
  inherited;
  // ===========================================================================
  // CANTIERI
  // ---------------------------------------------------------------------------
  if cxPageControl1.ActivePage = TabCantieri then begin
    DM1.ShowWait('Levante', 'Attendere!');
    try
      EseguiQueryPratiche;
      if (cxPageControl1.ActivePage = TabCantieri) and (GridSelezioneCantiere.Visible) and (GridSelezioneCantiere.Enabled)
      then GridSelezioneCantiere.SetFocus;
    finally
      DM1.CloseWait;
    end;
  end;
  // ===========================================================================

  // ===========================================================================
  // IMPIANTI
  // ---------------------------------------------------------------------------
  if cxPageControl1.ActivePage = TabImpianti then begin
    DM1.ShowWait('Levante', 'Attendere!');
    try
      EseguiQueryImpianti;
      if (cxPageControl1.ActivePage = TabImpianti) and (GridSelezioneImpianti.Visible) and (GridSelezioneImpianti.Enabled)
      then GridSelezioneImpianti.SetFocus;
    finally
      DM1.CloseWait;
    end;
  end;
  // ===========================================================================
end;


procedure TSelezionaPraticheImpiantiForm.EseguiQueryImpianti;
begin
      // Se i check di alcuni gruppi di filtri sono tutti NON CHECCKATI li checcka automaticamente tutti
      //  perchè altrimenti non visualizzerebbe nulla
      if not (FilterAbbonati.Checked[0] or FilterAbbonati.Checked[1]) then begin
         FilterAbbonati.Checked[0] := True;
         FilterAbbonati.Checked[1] := True;
      end;
      // Creazione query di ricerca
      Q.Close;
      Q.SQL.Clear;
      Q.SQL.Add('SELECT P.TIPO, P.CODICE, P.DATAAPERTURA, P.ID, P.DESCRIZIONE, CAST(C.RAGIONESOCIALE || ''  ('' || P.CLIENTE || '')'' AS VARCHAR(80) )  AS RAGIONESOCIALE,');
      Q.SQL.Add(' C.Telefono, C.Cellulare, P.ProvinciaIMM, P.ComuneIMM, P.CAPImm, P.CONTRATTO_STATO AS ABBONATO, P.CONTRATTO_TIPO AS TIPOCONTRATTO, COALESCE(P.CONTRATTO_IMPORTO,0) AS IMPORTOCONTRATTO,');
      Q.SQL.Add(' P.TipoImpianto, P.Periodicita, P.BREVEDESCRIZIONECALDAIA, P.RAGSOCUT, P.MATRICOLA,');
      Q.SQL.Add(' P.TipoImpianto, P.Periodicita, P.RAGSOCUT, P.CLIENTE, P.PROXVISITAENTRO,');

      // Data ultimo intervento
      Q.SQL.Add(' (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'') AS DataUltimoIntervento,');
//      QryAss.SQL.Add('     AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%'' OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) AS DataUltimoIntervento,');

      // DataOraProssimoAppuntamento
      Q.SQL.Add(' (SELECT MIN(I.START_EVENT) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Appuntamento'') AS DataOraProssimoAppuntamento,');

      // IndirizzoIMM
      Q.SQL.Add(' TRIM(CAST(P.INDIRIZZOIMM || '' '' || P.NUMCIVICOIMM AS VARCHAR(60))) AS INDIRIZZOIMM');

//      Q.SQL.Add(' P.CLIENTE');

      Q.SQL.Add('FROM PRATICHE P');
      Q.SQL.Add('LEFT JOIN CLIENTI C ON C.CODICE = P.CLIENTE');
      // Aggiunge una clausola WHERE finta in modo che non dia errore se non viene specificata nessuna condizione
      Q.SQL.Add('WHERE');
      Q.SQL.Add('P.TIPO = ''A''');

      // Visualizza solo le pratiche relative al soggetto selezionato oppure a al soggetto
      //  intestatario del documento se uno dei due è impostato.
      //  NB: Tutte le pratiche del cliente come primo intestatario e compunque anche quelle dove compare come
      //       altro soggetto.
      if FilterSelezione.Checked[0] then begin
        DM1.AddSQL(Q, 'AND', '(P.CLIENTE = ' + IntToStr(CodiceSoggettoSelezionato) + ' OR P.ALTRISOGGETTI LIKE ''%<' + IntToStr(CodiceSoggettoSelezionato) + '>%'')');
      end else if FilterSelezione.Checked[1] then begin
        DM1.AddSQL(Q, 'AND', '(P.CLIENTE = ' + IntToStr(CodiceSoggettoDocumento) + ' OR P.ALTRISOGGETTI LIKE ''%<' + IntToStr(CodiceSoggettoDocumento) + '>%'')');
      end;

      // In base al tipo impianto e alla periodicità
      if FilterTipoImpianto.Text <> '' then Q.SQL.Add('AND P.TIPOIMPIANTO LIKE ''%' + FilterTipoImpianto.Text + '%''');
      if FilterPeriodicita.Text <> '' then Q.SQL.Add('AND P.PERIODICITA = ' + FilterPeriodicita.Text);
      if FilterTipoContratto.Text <> '' then Q.SQL.Add('AND P.TIPOCONTRATTO LIKE ''%' + FilterTipoContratto.Text + '%''');
      // In base a se l'impianto è in abbonamento oppure no
      if not FilterAbbonati.Checked[0]  then Q.SQL.Add('AND P.ABBONATO <> ''T''');
      if not FilterAbbonati.Checked[1]  then Q.SQL.Add('AND P.ABBONATO = ''T''');
      // In base a se l'impianto è in scadenza (come manutenzione) oppure no.
      if FilterInScadenza.Checked[0] then Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA=P.CODICE AND I.DATAPRATICA1=P.DATAAPERTURA AND I.TIPOIMPEGNO=''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%'')) + P.Periodicita<=''' + FormatDateTime('mm/dd/yyyy', Date+30) + '''');
      // In base a se viene specificato un costruttore oppure un modello oppure una località
      if FilterCodiceImpianto.Text <> '' then Q.SQL.Add('AND P.CODICE = ' + Trim(FilterCodiceImpianto.Text));
      if FilterCodiceCatasto.Text <> '' then Q.SQL.Add('AND P.CODICECATASTO LIKE ''%' + Trim(FilterCodiceCatasto.Text) + '%''');
      if FilterMatricola.Text <> '' then Q.SQL.Add('AND P.MATRICOLA LIKE ''%' + Trim(FilterMatricola.Text) + '%''');
      if FilterCostruttore.Text <> '' then Q.SQL.Add('AND P.COSTRUTTORE LIKE ''%' + FilterCostruttore.Text + '%''');
      if FilterModello.Text <> '' then Q.SQL.Add('AND P.MODELLO LIKE ''%' + FilterModello.Text + '%''');
      if FilterLocalita.Text <> '' then Q.SQL.Add('AND P.COMUNEIMM LIKE ''%' + FilterLocalita.Text + '%''');
      if FilterIndirizzo.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'P.INDIRIZZOIMM', FilterIndirizzo.Text, True);

      // IN base a quale data su cui effettuare la ricerca, effettua appunta la ricerca sulla data selezionata
      if FilterTipoData.Text = 'Prossimo intervento' then begin
        // Date (Controllo sulla data del PROSSIMOINTERVENTOPREVISTO
        if DM1.ControllaDataStr(AssDal.Text) then begin
           Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
           Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) + P.PERIODICITA >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.Text)) + '''');
        end;
        if DM1.ControllaDataStr(AssAl.Text)  then begin
           //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
           //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
           //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
           Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
           Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) + P.PERIODICITA < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.Text)+1) + '''');
        end;

      end else if FilterTipoData.Text = 'Ultimo intervento' then begin
        // Date (Controllo sulla data dell'ultimo intervento eseguito
        if DM1.ControllaDataStr(AssDal.Text) then begin
           Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
           Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(AssDal.Text)) + '''');
        end;
        if DM1.ControllaDataStr(AssAl.Text)  then begin
           //  NB: Nella DataAl ho messo il confronyo < invece che <= e con la data indicata dal filtro +1 perchè in questi campi
           //       c'è anche la parte tempo e se lo lasciavo come era e mettevo ad esempio di visualizzare tutto fino
           //       al 31/10 non mi visualizzava quelli del 31/10 perchè lui intendeva fino all'inizio del giorno 31/10.
           Q.SQL.Add('AND (SELECT MAX(I.DATAORAINTERVENTO) FROM IMPEGNI I WHERE I.PRATICA = P.CODICE AND I.DATAPRATICA1 = P.DATAAPERTURA AND I.TIPOIMPEGNO = ''Intervento'' AND (I.TIPOINTERVENTO LIKE ''%Manutenzione%'' OR I.TIPOINTERVENTO LIKE ''%Prima accensione%''');
           Q.SQL.Add('     OR I.TIPOINTERVENTO LIKE ''%Collaudo%'')) < ''' + FormatDateTime('mm/dd/yyyy',StrToDate(AssAl.Text)+1) + '''');
        end;
      end;

      // Aggiunge la ricerca con campo TROVA
      if Trim(FilterAssTrova.Text) <> '' then begin
        DM1.AddSQL(Q, 'AND', '(');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.RAGSOCCLI', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.RAGSOCUT', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.RAGSOCINST', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.RAGSOCRESPIMP', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.COSTRUTTORE', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.MODELLO', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.MATRICOLA', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.BREVEDESCRIZIONECALDAIA', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.NOTEMONTAGGIO', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.NOTE', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.ARGOMENTO', FilterAssTrova.Text, False);
        Q.SQL.Add('OR');
        DM1.AggiungiRicercaCampo(Q.SQL, 'P.PROVENIENZA', FilterAssTrova.Text, False);
        Q.SQL.Add(')');
      end;

      // Esegue la query
      Q.Open;
      // Si posizione all'inizio
      tvSelezioneImpianti.DataController.GotoFirst;
end;

procedure TSelezionaPraticheImpiantiForm.EseguiQueryPratiche;
begin
      // Se non è checkato ne i cantieri aperti ne chiusi li richecca automaticamente tutti e due
      //  altrimenti non troverebbe nulla
      if not (CantieriApertiChiusi.Checked[0] or CantieriApertiChiusi.Checked[1]) then begin
         CantieriApertiChiusi.Checked[0] := True;
         CantieriApertiChiusi.Checked[1] := True;
      end;
      // Compone la query
      QryPratiche.Close;
      QryPratiche.SQL.Clear;
      QryPratiche.SQL.Add('SELECT P.TIPO, P.CODICE, P.ID, P.DESCRIZIONE, P.DATAAPERTURA, P.DATACHIUSURA, P.STATODESCRIZIONE');
      QryPratiche.SQL.Add(' , CAST(C.RAGIONESOCIALE || ''  ('' || P.CLIENTE || '')'' AS VARCHAR(80)) AS RAGIONESOCIALE');
      QryPratiche.SQL.Add(' , P.STATOFOREGROUND, P.STATOBACKGROUND, P.CLIENTE, C.RAGIONESOCIALE AS RAGSOC');
      QryPratiche.SQL.Add(' , CATEGCANT1, CATEGCANT2, CATEGCANT3, CATEGCANT4, CATEGCANT5, CATEGCANT6');
      QryPratiche.SQL.Add(' , P.AGENTE, P.AGENTE2, P.AGENTE3, P.AGENTE4');
      QryPratiche.SQL.Add('FROM PRATICHE P');
      QryPratiche.SQL.Add('LEFT JOIN CLIENTI C ON C.CODICE = P.CLIENTE');
      // Aggiunge una clausola WHERE finta in modo che non dia errore se non viene specificata nessuna condizione
      QryPratiche.SQL.Add('WHERE');
      QryPratiche.SQL.Add('P.TIPO = ''P''');

      // Visualizza solo le pratiche relative al soggetto selezionato oppure a al soggetto
      //  intestatario del documento se uno dei due è impostato.
      //  NB: Tutte le pratiche del cliente come primo intestatario e compunque anche quelle dove compare come
      //       altro soggetto.
      if PratSelezione.Checked[0] then begin
        DM1.AddSQL(QryPratiche, 'AND', '(P.CLIENTE = ' + IntToStr(CodiceSoggettoSelezionato) + ' OR P.ALTRISOGGETTI LIKE ''%<' + IntToStr(CodiceSoggettoSelezionato) + '>%'')');
      end else if PratSelezione.Checked[1] then begin
        DM1.AddSQL(QryPratiche, 'AND', '(P.CLIENTE = ' + IntToStr(CodiceSoggettoDocumento) + ' OR P.ALTRISOGGETTI LIKE ''%<' + IntToStr(CodiceSoggettoDocumento) + '>%'')');
      end;

      if PratCodice.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.CODICE = ' + PratCodice.Text);
      if PratStato.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.STATODESCRIZIONE = ''' + PratStato.Text + '''');
      if PratDescrizione.Text <> '' then begin
         DM1.AddSQL(QryPratiche, 'AND', '(');
         DM1.AggiungiRicercaCampo(QryPratiche.SQL, 'P.DESCRIZIONE', PratDescrizione.Text, False);
         QryPratiche.SQL.Add('OR');
         DM1.AggiungiRicercaCampo(QryPratiche.SQL, 'P.NOTE', PratDescrizione.Text, False);
         QryPratiche.SQL.Add('OR');
         DM1.AggiungiRicercaCampo(QryPratiche.SQL, 'P.ARGOMENTO', PratDescrizione.Text, False);
         QryPratiche.SQL.Add('OR');
         DM1.AggiungiRicercaCampo(QryPratiche.SQL, 'P.PROVENIENZA', PratDescrizione.Text, False);
         QryPratiche.SQL.Add('OR');
         DM1.AggiungiRicercaCampo(QryPratiche.SQL, 'P.RAGSOCCLI', PratDescrizione.Text, False);
         QryPratiche.SQL.Add('OR');
         DM1.AggiungiRicercaCampo(QryPratiche.SQL, 'P.COMMITDENOMINAZIONE', PratDescrizione.Text, False);
         QryPratiche.SQL.Add('OR');
         DM1.AggiungiRicercaCampo(QryPratiche.SQL, 'P.PROPDENOMINAZIONE', PratDescrizione.Text, False);
         QryPratiche.SQL.Add('OR');
         DM1.AggiungiRicercaCampo(QryPratiche.SQL, 'P.IMMOBLOCALITA', PratDescrizione.Text, False);
         QryPratiche.SQL.Add(')');
      end;
      if not CantieriApertiChiusi.Checked[0]  then QryPratiche.SQL.Add('AND NOT P.DATACHIUSURA IS NULL');
      if not CantieriApertiChiusi.Checked[1]  then QryPratiche.SQL.Add('AND P.DATACHIUSURA IS NULL');
      if DM1.ControllaDataStr(PratDal.Text) then DM1.AddSQL(QryPratiche, 'AND', 'P.DATAAPERTURA >= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PratDal.Text)) + '''');
      if DM1.ControllaDataStr(PratAl.Text)  then DM1.AddSQL(QryPratiche, 'AND', 'P.DATAAPERTURA <= ''' + FormatDateTime('mm/dd/yyyy',StrToDate(PratAl.Text)) + '''');
      // Categorie cantieri
      if PratCategCant1.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.CATEGCANT1 = ''' + PratCategCant1.Text + '''');
      if PratCategCant2.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.CATEGCANT2 = ''' + PratCategCant2.Text + '''');
      if PratCategCant3.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.CATEGCANT3 = ''' + PratCategCant3.Text + '''');
      if PratCategCant4.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.CATEGCANT4 = ''' + PratCategCant4.Text + '''');
      if PratCategCant5.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.CATEGCANT5 = ''' + PratCategCant5.Text + '''');
      if PratCategCant6.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.CATEGCANT6 = ''' + PratCategCant6.Text + '''');
      // Agenti
      if PratAgente.Text  <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.AGENTE  = ''' + PratAgente.Text + '''');
      if PratAgente2.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.AGENTE2 = ''' + PratAgente2.Text + '''');
      if PratAgente3.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.AGENTE3 = ''' + PratAgente3.Text + '''');
      if PratAgente4.Text <> '' then DM1.AddSQL(QryPratiche, 'AND', 'P.AGENTE4 = ''' + PratAgente4.Text + '''');
      // Aggiunge alla query l'ORDER BY
      QryPratiche.SQL.Add(DM1.GeneraOrderBy(tvSelezioneCantiere));
      QryPratiche.Open;
      // Si posizione all'inizio
      tvSelezioneCantiere.DataController.GotoFirst;
end;


procedure TSelezionaPraticheImpiantiForm.PratMesiTuttiClick(
  Sender: TObject);
begin
  inherited;
   PratDal.EditText := DM1.FilterDataDalDefault;
   PratAl.EditText  := DM1.FilterDataAlDefault;
   // Se il Tag del pulsante MesiTutti = 1 significa che questo gestore di evento è stato
   //  richiamato dall'evento OnChange del PageControl e non per un click dell'utente sul
   //  pulsante stesso, quindi imposta le date al primo giorno e all'ultimo dell'anno in corso
   //  ma non mette in  Down tutti i pulsanti dei mesi perchè mi piace di più.
//   if PratMesiTutti.Tag = 0 then begin
      // In questo modo posso metterli tutti in DOWN contemporaneamente
      PratGen.GroupIndex := 701;
      PratFeb.GroupIndex := 702;
      PratMar.GroupIndex := 703;
      PratApr.GroupIndex := 704;
      PratMag.GroupIndex := 705;
      PratGiu.GroupIndex := 706;
      PratLug.GroupIndex := 707;
      PratAgo.GroupIndex := 708;
      PratSet.GroupIndex := 709;
      PratOtt.GroupIndex := 710;
      PratNov.GroupIndex := 711;
      PratDic.GroupIndex := 712;
      PratGen.Down   := False;
      PratFeb.Down   := False;
      PratMar.Down   := False;
      PratApr.Down   := False;
      PratMag.Down   := False;
      PratGiu.Down   := False;
      PratLug.Down   := False;
      PratAgo.Down   := False;
      PratSet.Down   := False;
      PratOtt.Down   := False;
      PratNov.Down   := False;
      PratDic.Down   := False;
//   end else begin
      // Rimette il Tag del pulsante = 0
      PratMesiTutti.Tag := 0;
//   end;
end;

procedure TSelezionaPraticheImpiantiForm.PratMesiNessunoClick(
  Sender: TObject);
begin
  inherited;
   PratDal.Clear;
   PratAl.Clear;
   // In questo modo posso metterli tutti in DOWN contemporaneamente
   PratGen.GroupIndex := 700;
   PratFeb.GroupIndex := 700;
   PratMar.GroupIndex := 700;
   PratApr.GroupIndex := 700;
   PratMag.GroupIndex := 700;
   PratGiu.GroupIndex := 700;
   PratLug.GroupIndex := 700;
   PratAgo.GroupIndex := 700;
   PratSet.GroupIndex := 700;
   PratOtt.GroupIndex := 700;
   PratNov.GroupIndex := 700;
   PratDic.GroupIndex := 700;
   PratGen.Down   := False;
   PratFeb.Down   := False;
   PratMar.Down   := False;
   PratApr.Down   := False;
   PratMag.Down   := False;
   PratGiu.Down   := False;
   PratLug.Down   := False;
   PratAgo.Down   := False;
   PratSet.Down   := False;
   PratOtt.Down   := False;
   PratNov.Down   := False;
   PratDic.Down   := False;
end;

procedure TSelezionaPraticheImpiantiForm.PratGenClick(Sender: TObject);
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
      PratMesiNessunoClick(Self);
      (Sender as TSpeedButton).Down := True;
   end;
   // Se il pulsante è premuto (down)...
   if (Sender as TSpeedButton).Down then begin
      // In base all'indice del mese imposta le date nel modo opportuno
      case Mese of
         1:begin
            PratDal.EditText := ' 01/01/' + IntToStr(AA);
            PratAl.EditText  := ' 31/01/' + IntToStr(AA);
         end;
         2:begin
            PratDal.EditText := ' 01/02/' + IntToStr(AA);
            PratAl.EditText  := ' ' + IntToStr(DaysInAMonth(CurrentYear, 2)) + '/02/' + IntToStr(AA);
         end;
         3:begin
            PratDal.EditText := ' 01/03/' + IntToStr(AA);
            PratAl.EditText  := ' 31/03/' + IntToStr(AA);
         end;
         4:begin
            PratDal.EditText := ' 01/04/' + IntToStr(AA);
            PratAl.EditText  := ' 30/04/' + IntToStr(AA);
         end;
         5:begin
            PratDal.EditText := ' 01/05/' + IntToStr(AA);
            PratAl.EditText  := ' 31/05/' + IntToStr(AA);
         end;
         6:begin
            PratDal.EditText := ' 01/06/' + IntToStr(AA);
            PratAl.EditText  := ' 30/06/' + IntToStr(AA);
         end;
         7:begin
            PratDal.EditText := ' 01/07/' + IntToStr(AA);
            PratAl.EditText  := ' 31/07/' + IntToStr(AA);
         end;
         8:begin
            PratDal.EditText := ' 01/08/' + IntToStr(AA);
            PratAl.EditText  := ' 31/08/' + IntToStr(AA);
         end;
         9:begin
            PratDal.EditText := ' 01/09/' + IntToStr(AA);
            PratAl.EditText  := ' 30/09/' + IntToStr(AA);
         end;
         10:begin
            PratDal.EditText := ' 01/10/' + IntToStr(AA);
            PratAl.EditText  := ' 31/10/' + IntToStr(AA);
         end;
         11:begin
            PratDal.EditText := ' 01/11/' + IntToStr(AA);
            PratAl.EditText  := ' 30/11/' + IntToStr(AA);
         end;
         12:begin
            PratDal.EditText := ' 01/12/' + IntToStr(AA);
            PratAl.EditText  := ' 31/12/' + IntToStr(AA);
         end;
      end;
   // Se invece il mese non è premuto...
   end else begin
      PratDal.Text := '';
      PratAl.Text  := '';
   end;
end;

procedure TSelezionaPraticheImpiantiForm.PratGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      PratGenClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaPraticheImpiantiForm.PratStatoPropertiesInitPopup(
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
      Qry.SQL.Add('SELECT DESCRIZIONE FROM STATI WHERE TIPODOCUMENTO=''Cantieri/Pratiche''');
      Qry.Open;
      (Sender as TcxComboBox).Properties.Items.Clear;
      while not Qry.Eof do begin
         (Sender as TcxComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.CantieriApertiChiusiClickCheck(
  Sender: TObject);
begin
  inherited;
   // Se passa di quì significa che l'utente ha cliccato esattamente nel riquadrino del check della voce
   //  e quindi marca la proprietà Tag del componente in modo che poi il gestore dell'evento OnMouseUp che gestisce
   //  i click per la selezione o meno della voce (per fare in modo che anche cliccando sulla descrizione della voce
   //  si selezioni o deselezioni la voce stessa). In questo modo tale gestore di evento salta la riga che
   //  assegna il valore alla proprietà checked[i] altrimenti è come se l'utente avesse cliccato due volte.
   (Sender as TCheckListBox).Tag := 1;
end;

procedure TSelezionaPraticheImpiantiForm.CantieriApertiChiusiMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
   CheckIndex, i:Integer;
   CurrCheckListBox:TCheckListBox;
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
      // Se c'era una voce cambia il suo stato
      if CheckIndex <> -1 then begin
         if CurrCheckListBox.Tag = 0 then CurrCheckListBox.Checked[CheckIndex] := not CurrCheckListBox.Checked[CheckIndex];
         // Rimette la Proprietà Tag del componente = 0
         CurrCheckListBox.Tag := 0;
      end;
      // Esegue la ricerca
      RxSpeedButtonTrovaClick(Self);
   end;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   CurrCheckListBox.ItemIndex := -1;
   // ----------------------------------------------------------------------------------------------------
end;


procedure TSelezionaPraticheImpiantiForm.PratCodiceKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then RxSpeedButtonTrovaClick(Self);
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneCantiereCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Solo se non è selezionata
   if not AViewInfo.Selected then
   begin
      // Se la pratica è già chiusa la visualizza in grigio
      if AViewInfo.GridRecord.DisplayTexts[tvSelezioneCantiere.GetColumnByFieldName('DATACHIUSURA').Index] <> '' then
      begin
         ACanvas.Font.Color := clSilver;
      end;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneCantiereCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneCantiereCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneCantiereCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneCantiereEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
  inherited;
   // Prima di tutto controlla che il bersaglio non sia nullo
   if Target <> nil then begin
      // In base al bersagio attiva la funzione corretta.
      if Target is TSpeedButton then begin
         TSpeedButton(Target).OnClick(Self);
      // Se invece il Target è il pannellino del soggetto selezionato, seleziona il soggetto
      //  NB: Le labels che indicano i dati del soggetto selezionato hanno il nome che comincia ssmper con 'SS'
      end else if Target is TbmpPanel then begin
//         if TbmpPanel(Target).Name = 'MainLeftPanel' then RxSpeedButtonVisualizzaClick(Self);
      end else if Target is TPaintBox then begin
//         if DM1.StrLeft(TPaintBox(Target).Name, 2) = 'SB' then RxSpeedButtonVisualizzaClick(Self);
      end;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneImpiantiCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  QuantoMancaAlProssimoIntervento : Integer;
  Abbonato: String;
begin
   // IN base allo stato dell'abbonamento dell'impianto setta il colore con
   //  cui visualizzare la riga.
   // --------------------------------------------------------------------------
   // Solo se non è selezionata
   if not AViewInfo.Selected then begin
      // Inizializzazione
      Abbonato := '';
      if  (not (VarIsNull(AviewInfo.GridRecord.Values[tvSelezioneImpiantiABBONATO.Index]))) then Abbonato := AviewInfo.GridRecord.Values[tvSelezioneImpiantiABBONATO.Index];
      // Solo se l'impianto è in abbonamento
      if Abbonato = 'T' then begin
         // Variabile che contiene i giorni mancanti all'ultimo giorno
         if not VarIsNull(AViewInfo.GridRecord.Values[tvSelezioneImpianti.GetColumnByFieldName('PROXVISITAENTRO').Index]) then begin
            QuantoMancaAlProssimoIntervento := (AViewInfo.GridRecord.Values[tvSelezioneImpianti.GetColumnByFieldName('PROXVISITAENTRO').Index] - now);
         end else begin
            QuantoMancaAlProssimoIntervento := 300;  // Valore di default se non può calcolarlo
         end;
         // Se è già stato preso un appuntamento per la manutenzione programma visualizza la riga in blu
         if not VarIsNull(AViewInfo.GridRecord.Values[tvSelezioneImpianti.GetColumnByFieldName('DATAORAPROSSIMOAPPUNTAMENTO').Index]) then begin
            ACanvas.Font.Color := clBlue;
         // Se il prossimo intervento previsto cade entro 15 gg da oggi, visualizza tutto rosso
         end else if QuantoMancaAlProssimoIntervento <= 15 then begin
            ACanvas.Font.Color := clWhite;   // Rosso
            ACanvas.Brush.Color := clRed;
         // Se il prossimo intervento previsto cade tra 15 e 30 gg da oggi, visualizza tutto arancione
         end else if QuantoMancaAlProssimoIntervento <= 30 then begin
            ACanvas.Font.Color := clRed;   // Arancione
         // Se il prossimo intervento previsto cade oltre i 30 gg da oggi, visualizza tutto verde
         end else begin
            ACanvas.Font.Color := $0000D200;  // Verde
         end;
      // Se invece l'abbonamento è sospeso
      end else if Abbonato = 'S' then begin
         ACanvas.Font.Color := clGray;   // Grigio Chiaro
         if AViewInfo.Item = tvSelezioneImpiantiSTATO then ACanvas.Font.Style := [fsBold];
      // Se invece l'impianto è DISMESSO
      end else if Abbonato = 'D' then begin
         ACanvas.Brush.Color := $00A7A7A7;  // Grigio scuro
         ACanvas.Font.Color := $00E6E6E6;   // Grigio Chiaro
         if AViewInfo.Item = tvSelezioneImpiantiSTATO then ACanvas.Font.Style := [fsBold];
      end;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneImpiantiCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneImpiantiCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneImpiantiCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TSelezionaPraticheImpiantiForm.FilterPeriodicitaPropertiesInitPopup(
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
      Qry.SQL.Add('SELECT DISTINCT(PERIODICITA) FROM PRATICHE');
      Qry.Open;
      FilterPeriodicita.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterPeriodicita.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.FilterTipoContrattoPropertiesInitPopup(
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
      Qry.SQL.Add('SELECT DISTINCT(TIPOCONTRATTO) FROM PRATICHE');
      Qry.Open;
      FilterTipoContratto.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterTipoContratto.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.FilterCostruttorePropertiesInitPopup(
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
      Qry.SQL.Add('SELECT DISTINCT(COSTRUTTORE) FROM PRATICHE');
      Qry.Open;
      FilterCostruttore.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterCostruttore.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.FilterModelloPropertiesInitPopup(
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
      Qry.SQL.Add('SELECT DISTINCT(MODELLO) FROM PRATICHE WHERE COSTRUTTORE LIKE ''%' + FilterCostruttore.Text + '%''');
      Qry.Open;
      FilterModello.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterModello.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.FilterLocalitaPropertiesInitPopup(
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
      Qry.SQL.Add('SELECT DISTINCT(COMUNEIMM) FROM PRATICHE');
      Qry.Open;
      FilterLocalita.Properties.Items.Clear;
      while not Qry.Eof do begin
         FilterLocalita.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.FilterAbbonatiClickCheck(
  Sender: TObject);
begin
  inherited;
   // Se passa di quì significa che l'utente ha cliccato esattamente nel riquadrino del check della voce
   //  e quindi marca la proprietà Tag del componente in modo che poi il gestore dell'evento OnMouseUp che gestisce
   //  i click per la selezione o meno della voce (per fare in modo che anche cliccando sulla descrizione della voce
   //  si selezioni o deselezioni la voce stessa). In questo modo tale gestore di evento salta la riga che
   //  assegna il valore alla proprietà checked[i] altrimenti è come se l'utente avesse cliccato due volte.
   (Sender as TCheckListBox).Tag := 1;
end;

procedure TSelezionaPraticheImpiantiForm.FilterAbbonatiMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
   CheckIndex, i:Integer;
   CurrCheckListBox:TCheckListBox;
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
      // Se c'era una voce cambia il suo stato
      if CheckIndex <> -1 then begin
         if CurrCheckListBox.Tag = 0 then CurrCheckListBox.Checked[CheckIndex] := not CurrCheckListBox.Checked[CheckIndex];
         // Rimette la Proprietà Tag del componente = 0
         CurrCheckListBox.Tag := 0;
      end;
      // Esegue la ricerca
      RxSpeedButtonTrovaClick(Self);
   end;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   CurrCheckListBox.ItemIndex := -1;
   // ----------------------------------------------------------------------------------------------------
end;

procedure TSelezionaPraticheImpiantiForm.FilterAbbonatiExit(
  Sender: TObject);
begin
  inherited;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   (Sender as TCheckListBox).ItemIndex := -1;
end;

procedure TSelezionaPraticheImpiantiForm.AssMesiTuttiClick(
  Sender: TObject);
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

procedure TSelezionaPraticheImpiantiForm.AssMesiNessunoClick(
  Sender: TObject);
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

procedure TSelezionaPraticheImpiantiForm.AssMesiTuttiMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      AssMesiTuttiClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaPraticheImpiantiForm.AssMesiNessunoMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      AssMesiNessunoClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaPraticheImpiantiForm.PratMesiTuttiMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PratMesiTuttiClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaPraticheImpiantiForm.PratMesiNessunoMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      PratMesiNessunoClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaPraticheImpiantiForm.AssGenClick(Sender: TObject);
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

procedure TSelezionaPraticheImpiantiForm.AssGenMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
   // Facendo click con il pulsante DX deseleziona tutti i tipo di documento tranne
   //  quello su cui si è fatto click e poi richiama la ricerca.
   if Button = mbRight then begin
      (Sender as TSpeedButton).Down := True;
      AssGenClick(Sender);
      RxSpeedButtonTrovaClick(Self);
   end;
end;

procedure TSelezionaPraticheImpiantiForm.MenuGrigliaPopup(Sender: TObject);
var
   SearchRec:TSearchRec;
   TmpStr:String;
   CurrGrid:TcxGrid;
   CurrMenuItem:TMenuItem;
begin
  inherited;
   // ==========================================================================
   // Caricamento delle viste delle griglia attualmente visualizzata
   // --------------------------------------------------------------------------
  // In base alla pagina selezionata Elenco Viste punta alla griglia
  //  corretta
  if cxPageControl1.ActivePage = TabCantieri then
    CurrGrid := GridSelezioneCantiere
  else
    CurrGrid := GridSelezioneImpianti;
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

procedure TSelezionaPraticheImpiantiForm.Selezionavista1Click(
  Sender: TObject);
var
  CurrGrid:TcxGrid;
  CurrItemCaption:String;
begin
  // Caption della voce selezionata
  CurrItemCaption := (Sender as TMenuItem).Caption;
  // Se la Caption della voce selezionata contiene il carattere & (incasina tutto)
  //  lo toglie.
  CurrItemCaption := StringReplace(CurrItemCaption, '&', '', [rfReplaceAll]);
  // Se la voce attuale è la radice del menu di selezione viste esce subito
  if (Sender as TMenuItem).Name = 'Selezionavista1' then Exit;
  // In base alla pagina selezionata Elenco Viste punta alla griglia
  //  corretta
  if cxPageControl1.ActivePage = TabCantieri then
    CurrGrid := GridSelezioneCantiere
  else
    CurrGrid := GridSelezioneImpianti;
  // Carica la vista attuale
  DM1.RipristinaDevExpress(CurrGrid, CurrItemCaption, False);
end;

procedure TSelezionaPraticheImpiantiForm.Salvalavistaattuale1Click(
  Sender: TObject);
var
  Vista:String;
  CurrGrid:TcxGrid;
begin
  // Chiede il nome della vista
  if not InputQuery('Salvataggio vista', 'Con quale nome devo salvare la vista?', Vista) then
    Exit;
  // Controlla che la vista non sia nullo
  if Trim(Vista) = '' then raise Exception.Create('Il nome della vista non può essere vuoto.');
  // In base alla pagina selezionata Elenco Viste punta alla griglia
  //  corretta
  if cxPageControl1.ActivePage = TabCantieri then
    CurrGrid := GridSelezioneCantiere
  else
    CurrGrid := GridSelezioneImpianti;
  // Salva le impostazioni delle colonne dei clienti
  DM1.SalvaGriglieDevExpress(CurrGrid, Vista, False);
end;

procedure TSelezionaPraticheImpiantiForm.Ripristinacolonneeliminate1Click(
  Sender: TObject);
var
  CurrTableView: TcxGridDBTableView;
begin
  // In base alla pagina selezionata Elenco Viste punta alla griglia
  //  corretta
  if cxPageControl1.ActivePage = TabCantieri then
    CurrTableView := tvSelezioneCantiere
  else
    CurrTableView := tvSelezioneImpianti;
  CurrTableView.Controller.Customization := True;
end;

procedure TSelezionaPraticheImpiantiForm.SBAssFilterOpenCloseClick(
  Sender: TObject);
begin
  inherited;
  if PanelAssFiltri.Tag = 1
  then ClientiForm.CloseFilterPanel(PanelAssFiltri, SBAssFilterOpenClose)
  else ClientiForm.OpenFilterPanel(PanelAssFiltri, SBAssFilterOpenClose);
end;

procedure TSelezionaPraticheImpiantiForm.SBPratFilterOpenCloseClick(
  Sender: TObject);
begin
  inherited;
  if PanelPratFiltri.Tag = 1
  then ClientiForm.CloseFilterPanel(PanelPratFiltri, SBPratFilterOpenClose)
  else ClientiForm.OpenFilterPanel(PanelPratFiltri, SBPratFilterOpenClose);
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneCantiereDblClick(Sender: TObject);
  procedure CaricaCantiere;
  begin
    // Assegna il cliente della pratica al documento
    //  NB:Prima era dopo l'assegnazione dei dati della pratica ma questo causava nell'appuntamento un problema
    //      nella compilazione automatica del campo Luogo dell'appuntamento perchè metteva i dati del Soggetto
    //      invece che quelli della pratica.
    if Assigned(FieldCliente) and (   (FieldCliente.IsNull) or (FieldCliente.AsInteger = 0)   )
    then FieldCliente.Value := QryPratiche.FieldByName('CLIENTE').Value;
    // Effettua la selezione assegnando il codice della pratica selezionata  e la data
    //  ai campi appropriati puntati da 'FieldPratica' e 'FieldDataPratica'
    if Assigned(FieldDataPratica)        then FieldDataPratica.Value       := QryPratiche.FieldByName('DataApertura').Value;
    if Assigned(FieldPratica)            then FieldPratica.Value           := QryPratiche.FieldByName('Codice').Value;
    if Assigned(EditDataPratica)         then EditDataPratica.Text         := QryPratiche.FieldByName('DataApertura').AsString;
    if Assigned(EditPratica)             then EditPratica.Text             := QryPratiche.FieldByName('Codice').AsString;
    if Assigned(EditDescrizionePratica)  then EditDescrizionePratica.Text  := QryPratiche.FieldByName('Descrizione').AsString;
  end;
begin
  // Se non c'è alcun rigo selezionato non fa nulla
  if (tvSelezioneCantiere.Controller.SelectedRecordCount = 0) or (tvSelezioneCantiere.Controller.FocusedRecord = nil) or (not tvSelezioneCantiere.Controller.FocusedRecord.IsData) then exit;
  // In base al codice del chiamante...
  case CallerCode of
    // Se non c'è il chiamante ma sono stati impostati direttamente i campi
    //  da aggiornare alla selezione di una pratica...
    0: CaricaCantiere;
    // Se il chiamante è un rigo del rapporto giornaliero
    1:
    begin
      with RappGiornForm.tvOre.DataController do begin
        Values[FocusedRecordIndex, RappGiornForm.tvOreCODCANTIERE.Index] := QryPraticheCODICE.AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvOreDATACANTIERE.Index] := QryPraticheDATAAPERTURA.AsDateTime;
        Values[FocusedRecordIndex, RappGiornForm.tvOreDESCRIZCANTIERE.Index] := QryPraticheDESCRIZIONE.AsString;
        // IMposta anche il soggetto del rigo uguale a quello della pratica
        Values[FocusedRecordIndex, RappGiornForm.tvOreCODSOGGETTO.Index] := QryPraticheCLIENTE.AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvOreDESCRIZSOGGETTO.Index] := QryPraticheRAGSOC.AsString;
      end;
    end;
    // Se il chiamante è un rigo del rapporto giornaliero (SPESE)
    2:
    begin
      with RappGiornForm.tvSpese.DataController do begin
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseCODCANTIERE.Index] := QryPraticheCODICE.AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseDATACANTIERE.Index] := QryPraticheDATAAPERTURA.AsDateTime;
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseDESCRIZCANTIERE.Index] := QryPraticheDESCRIZIONE.AsString;
        // IMposta anche il soggetto del rigo uguale a quello della pratica
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseCODSOGGETTO.Index] := QryPraticheCLIENTE.AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseDESCRIZSOGGETTO.Index] := QryPraticheRAGSOC.AsString;
      end;
    end;
    // Se il chiamante è una Lettera/Testo
    3:
    begin
      CaricaCantiere;
      TestiForm.CaricaCantiere;
    end;
  end;
  // Chiude la form di selezione
  Close;
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneCantiereKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneImpiantiEndDrag(Sender,
  Target: TObject; X, Y: Integer);
begin
  inherited;
  inherited;
   // Prima di tutto controlla che il bersaglio non sia nullo
   if Target <> nil then begin
      // In base al bersagio attiva la funzione corretta.
      if Target is TSpeedButton then begin
         TSpeedButton(Target).OnClick(Self);
      // Se invece il Target è il pannellino del soggetto selezionato, seleziona il soggetto
      //  NB: Le labels che indicano i dati del soggetto selezionato hanno il nome che comincia ssmper con 'SS'
      end else if Target is TbmpPanel then begin
//         if TbmpPanel(Target).Name = 'MainLeftPanel' then RxSpeedButtonVisualizzaClick(Self);
      end else if Target is TPaintBox then begin
//         if DM1.StrLeft(TPaintBox(Target).Name, 2) = 'SB' then RxSpeedButtonVisualizzaClick(Self);
      end;
   end;
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneImpiantiDblClick(Sender: TObject);
  procedure CaricaImpianto;
  begin
    // Assegna il cliente della pratica al documento
    //  NB:Prima era dopo l'assegnazione dei dati della pratica ma questo causava nell'appuntamento un problema
    //      nella compilazione automatica del campo Luogo dell'appuntamento perchè metteva i dati del Soggetto
    //      invece che quelli della pratica.
    if Assigned(FieldCliente) and (   (FieldCliente.IsNull) or (FieldCliente.AsInteger = 0)   )
    then FieldCliente.Value := Q.FieldByName('CLIENTE').Value;
    // Effettua la selezione assegnando il codice della pratica selezionata  e la data
    //  ai campi appropriati puntati da 'FieldPratica' e 'FieldDataPratica'
    if Assigned(FieldDataPratica) then FieldDataPratica.Value                := Q.FieldByName('DataApertura').Value;
    if Assigned(FieldPratica) then FieldPratica.Value                        := Q.FieldByName('Codice').Value;
    if Assigned(FieldIDPratica) then FieldIDPratica.Value                    := Q.FieldByName('ID').Value;
    if Assigned(EditDataPratica) then EditDataPratica.Text                   := Q.FieldByName('DataApertura').AsString;
    if Assigned(EditPratica) then EditPratica.Text                           := Q.FieldByName('Codice').AsString;
    if Assigned(EditDescrizionePratica) then EditDescrizionePratica.Text     := Q.FieldByName('Descrizione').AsString;
  end;
begin
  inherited;
  // Se non c'è alcun rigo selezionato non fa nulla
  if (tvSelezioneImpianti.Controller.SelectedRecordCount = 0) or (tvSelezioneImpianti.Controller.FocusedRecord = nil) or (not tvSelezioneImpianti.Controller.FocusedRecord.IsData) then exit;
  // In base al codice del chiamante...
  case CallerCode of

    // Se non c'è il chiamante ma sono stati impostati direttamente i campi
    //  da aggiornare alla selezione di una pratica...
    0: CaricaImpianto;
    // Se il chiamante è un rigo del rapporto giornaliero
    1:
    begin
      with RappGiornForm.tvOre.DataController do begin
        Values[FocusedRecordIndex, RappGiornForm.tvOreCODCANTIERE.Index]        := Q.FieldByName('Codice').AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvOreDATACANTIERE.Index]       := Q.FieldByName('DataApertura').AsDateTime;
        Values[FocusedRecordIndex, RappGiornForm.tvOreDESCRIZCANTIERE.Index]    := Q.FieldByName('Descrizione').AsString;
        // IMposta anche il soggetto del rigo uguale a quello della pratica
        Values[FocusedRecordIndex, RappGiornForm.tvOreCODSOGGETTO.Index]        := Q.FieldByName('CLIENTE').AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvOreDESCRIZSOGGETTO.Index]    := Q.FieldByName('RAGIONESOCIALE').AsString;
      end;
    end;
    // Se il chiamante è un rigo del rapporto giornaliero (SPESE)
    2:
    begin
      with RappGiornForm.tvSpese.DataController do begin
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseCODCANTIERE.Index]      := Q.FieldByName('Codice').AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseDATACANTIERE.Index]     := Q.FieldByName('DataApertura').AsDateTime;
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseDESCRIZCANTIERE.Index]  := Q.FieldByName('Descrizione').AsString;
        // IMposta anche il soggetto del rigo uguale a quello della pratica
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseCODSOGGETTO.Index]      := Q.FieldByName('CLIENTE').AsInteger;
        Values[FocusedRecordIndex, RappGiornForm.tvSpeseDESCRIZSOGGETTO.Index]  := Q.FieldByName('RAGIONESOCIALE').AsString;
      end;
    end;
    // Se il chiamante è una Lettera/Testo
    3:
    begin
      CaricaImpianto;
      TestiForm.CaricaCantiere;
    end;
  end;
  // Chiude la form di selezione
  Close;
end;

procedure TSelezionaPraticheImpiantiForm.cxPageControl1Change(
  Sender: TObject);
begin
  inherited;
  if cxPageControl1.ActivePage = TabCantieri then begin

    if not QryPratiche.Active then RxSpeedButtonTrovaClick(RxSpeedButtonTrova);

  end else if cxPageControl1.ActivePage = TabImpianti then begin

    if not Q.Active then RxSpeedButtonTrovaClick(RxSpeedButtonTrova);

  end;
end;

procedure TSelezionaPraticheImpiantiForm.SetCodiceSoggettoDocumento(
  const Value: Integer);
begin
  FCodiceSoggettoDocumento := Value;
  // Se la proprietà contiene il codice del soggetto selezionato seleziona
  //  il check relativo al Soggetto selezionato e deseleziona quello dell'intestario.
  //  Praticamente il soggetto selezionato ha la priorità.
  if (CodiceSoggettoDocumento <> 0) and (CodiceSoggettoSelezionato = 0) then begin
    PratSelezione.Checked[0] := False;
    PratSelezione.Checked[1] := False;
  end else if (CodiceSoggettoSelezionato <> 0) then begin
//    PratSelezione.Checked[0] := True;  // Prima era così poi mi hanno chiesto di far vedere sempre tutti i cantieri
    PratSelezione.Checked[0] := False;
    PratSelezione.Checked[1] := False;
  end else begin
    PratSelezione.Checked[0] := False;
    PratSelezione.Checked[1] := False;
  end;
  FilterSelezione.Checked[0] := PratSelezione.Checked[0];
  FilterSelezione.Checked[1] := PratSelezione.Checked[1];
end;

procedure TSelezionaPraticheImpiantiForm.SetCodiceSoggettoSelezionato(
  const Value: Integer);
begin
  FCodiceSoggettoSelezionato := Value;
  // Se la proprietà contiene il codice del soggetto selezionato seleziona
  //  il check relativo al Soggetto selezionato e deseleziona quello dell'intestario.
  //  Praticamente il soggetto selezionato ha la priorità.
  if (CodiceSoggettoDocumento <> 0) and (CodiceSoggettoSelezionato = 0) then begin
    PratSelezione.Checked[0] := False;
    PratSelezione.Checked[1] := True;
  end else if (CodiceSoggettoSelezionato <> 0) then begin
    PratSelezione.Checked[0] := True;
    PratSelezione.Checked[1] := False;
  end else begin
    PratSelezione.Checked[0] := False;
    PratSelezione.Checked[1] := False;
  end;
  FilterSelezione.Checked[0] := PratSelezione.Checked[0];
  FilterSelezione.Checked[1] := PratSelezione.Checked[1];
end;

procedure TSelezionaPraticheImpiantiForm.PratSelezioneMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
   Voce:Byte;
   CLB : TCheckListBox;
begin
   // CLB contiene il riferimento al chiamante
   CLB := (Sender as TCheckListBox);
   // INdividua quale voce si trova sotto la freccia del mouse
   Voce := CLB.ItemAtPos(CLB.ScreenToClient(Mouse.CursorPos), True);
   // Solo se il mouse era su una voce
   if Voce <> -1 then begin
      case Voce of
         0: begin
            if CLB.Tag <> 1 then CLB.Checked[0] := not CLB.Checked[0];
            CLB.Checked[1] := False;
         end;
         1: begin
            CLB.Checked[0] := False;
            if CLB.Tag <> 1 then CLB.Checked[1] := not CLB.Checked[1];
         end;
      end;
   end;
   // Se è stato cliccato con il pulsante dx del mouse avvia anche la ricerca
   if Button = mbRight then RxSpeedButtonTrovaClick(Self);
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   CLB.ItemIndex := -1;
   // Resetta Tag := 0
   CLB.Tag := 0;
end;


procedure TSelezionaPraticheImpiantiForm.FilterCodiceImpiantoKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then RxSpeedButtonTrovaClick(Self);
   // Accetta solo numeri
   if (Ord(Key) < 48) or (Ord(Key) > 57) then Key := #0;
end;

procedure TSelezionaPraticheImpiantiForm.tvPratDataControllerGroupingChanged(
  Sender: TObject);
begin
  inherited;
   if tvSelezioneCantiere.GroupedColumnCount > 0 then tvSelezioneCantiere.OptionsView.GridLines := glBoth else tvSelezioneCantiere.OptionsView.GridLines := glVertical;
end;

procedure TSelezionaPraticheImpiantiForm.tvPratDataControllerSortingChanged(
  Sender: TObject);
begin
  inherited;
   // Fà rifare l'interrogazione con il nuovo ordinamento
   // NB: Solo se non c'è alcun raggruppamento
   if tvSelezioneCantiere.DataController.DataModeController.GridMode and (tvSelezioneCantiere.GroupedColumnCount = 0) then
     RxSpeedButtonTrovaClick(Self);
   tvSelezioneCantiere.Controller.GoToFirst(False);
end;

procedure TSelezionaPraticheImpiantiForm.tvQDataControllerGroupingChanged(
  Sender: TObject);
begin
  inherited;
   if tvSelezioneImpianti.GroupedColumnCount > 0 then
     tvSelezioneImpianti.OptionsView.GridLines := glBoth
   else
     tvSelezioneImpianti.OptionsView.GridLines := glVertical;
end;

procedure TSelezionaPraticheImpiantiForm.tvQDataControllerSortingChanged(
  Sender: TObject);
begin
  inherited;
   // Fà rifare l'interrogazione con il nuovo ordinamento
   // NB: Solo se non c'è alcun raggruppamento
   if tvSelezioneImpianti.DataController.DataModeController.GridMode and (tvSelezioneImpianti.GroupedColumnCount = 0) then
     RxSpeedButtonTrovaClick(Self);
   tvSelezioneImpianti.Controller.GoToFirst(False);
end;

procedure TSelezionaPraticheImpiantiForm.PratCategCant1PropertiesInitPopup(
  Sender: TObject);
var
  Qry: TIB_Cursor;
  Combo:TcxComboBox;
  StcIndex: String;
begin
  // Inizializzazione
  Combo := (Sender as TcxComboBox);
  StcIndex := RightStr(Combo.Name, 1);
  Combo.Properties.Items.Clear;
  Combo.Properties.Items.Add('');
  // Altrimenti provvede a caricare i dati
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta query
    Qry.SQL.Add('SELECT CAMPO1 FROM CATEGCANT' + StcIndex);
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

procedure TSelezionaPraticheImpiantiForm.SetPrat_Filter_Visible_CategCant1(
  const Value: Boolean);
begin
  fPrat_Filter_Visible_CategCant1 := Value;
  PratCategCant1.Visible := Value;
  PratLabelCategCant1.Visible := Value;
end;

procedure TSelezionaPraticheImpiantiForm.SetPrat_Filter_Visible_CategCant2(
  const Value: Boolean);
begin
  fPrat_Filter_Visible_CategCant2 := Value;
  PratCategCant2.Visible := Value;
  PratLabelCategCant2.Visible := Value;
end;

procedure TSelezionaPraticheImpiantiForm.SetPrat_Filter_Visible_CategCant3(
  const Value: Boolean);
begin
  fPrat_Filter_Visible_CategCant3 := Value;
  PratCategCant3.Visible := Value;
  PratLabelCategCant3.Visible := Value;
end;

procedure TSelezionaPraticheImpiantiForm.SetPrat_Filter_Visible_CategCant4(
  const Value: Boolean);
begin
  fPrat_Filter_Visible_CategCant4 := Value;
  PratCategCant4.Visible := Value;
  PratLabelCategCant4.Visible := Value;
end;

procedure TSelezionaPraticheImpiantiForm.SetPrat_Filter_Visible_CategCant5(
  const Value: Boolean);
begin
  fPrat_Filter_Visible_CategCant5 := Value;
  PratCategCant5.Visible := Value;
  PratLabelCategCant5.Visible := Value;
end;

procedure TSelezionaPraticheImpiantiForm.SetPrat_Filter_Visible_CategCant6(
  const Value: Boolean);
begin
  fPrat_Filter_Visible_CategCant6 := Value;
  PratCategCant6.Visible := Value;
  PratLabelCategCant6.Visible := Value;
end;

procedure TSelezionaPraticheImpiantiForm.QCalcFields(DataSet: TDataSet);
var
   QuantoMancaAlProssimoIntervento : Integer;
begin
   // IN base allo stato dell'abbonamento dell'impianto setta il colore con
   //  cui visualizzare la riga.
   // --------------------------------------------------------------------------
      // Solo se l'impianto è in abbonamento
      if QABBONATO.AsString = 'T' then begin
         // Variabile che contiene i giorni mancanti all'ultimo giorno
         if not QPROXVISITAENTRO.IsNull then begin
            QuantoMancaAlProssimoIntervento := Trunc((QPROXVISITAENTRO.AsDateTime - Now));
         end else begin
            QuantoMancaAlProssimoIntervento := 300;  // Valore di default se non può calcolarlo
         end;
         // Se è già stato preso un appuntamento per la manutenzione programma visualizza la riga in blu
         if not QDATAORAPROSSIMOAPPUNTAMENTO.IsNull then begin
            QSTATO.Value := 'App.preso';
         // Se il prossimo intervento previsto cade entro 15 gg da oggi, visualizza tutto rosso
         end else if QuantoMancaAlProssimoIntervento <= 15 then begin
           QSTATO.Value := 'URGENTE';
         // Se il prossimo intervento previsto cade tra 15 e 30 gg da oggi, visualizza tutto arancione
         end else if QuantoMancaAlProssimoIntervento <= 30 then begin
           QSTATO.Value := 'IN_SCAD';
         // Se il prossimo intervento previsto cade oltre i 30 gg da oggi, visualizza tutto verde
         end else begin
           QSTATO.Value := 'Ok';
         end;
      // Se invece l'abbonamento è stato sospeso, lo visualizza in grigio
      end else if QABBONATO.AsString = 'S' then begin
         QSTATO.Value := 'SOSPESO';
      // Se l'impianto è stato dismesso
      end else if QABBONATO.AsString = 'D' then begin
         QSTATO.Value := 'DISMESSO';
      // Se invece non è abbonato per niente
      end else begin
         QSTATO.Value := '';
      end;
end;

procedure TSelezionaPraticheImpiantiForm.tvSelezioneImpiantiABBONATOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Abbonato: String;
begin
  // Inizializzazione
  Abbonato := '';
  if  (not (VarIsNull(AviewInfo.GridRecord.Values[tvSelezioneImpiantiABBONATO.Index]))) then
    Abbonato := AviewInfo.GridRecord.Values[tvSelezioneImpiantiABBONATO.Index];
  // Se non è ne abbonato ne non abbonato (quindi o sospeso o dismesso) non traccia
  //  la cella.
  if (Abbonato = 'S') or (Abbonato = 'D') then
  begin
    ADone := True;
    // Se è dismesso cambia il colore dello sfondo
    if (Abbonato = 'D') then ACanvas.Brush.Color := $00A7A7A7;
    // Disegna lo sfondo della cella senza il controllo
    ACanvas.FillRect(AViewInfo.Bounds);
  end;
end;

procedure TSelezionaPraticheImpiantiForm.PratAgentePropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(PratAgente.Properties.Items, 1, '');
end;

procedure TSelezionaPraticheImpiantiForm.PratAgente2PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(PratAgente2.Properties.Items, 2, PratAgente.Text);
end;

procedure TSelezionaPraticheImpiantiForm.PratAgente3PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(PratAgente3.Properties.Items, 3, PratAgente2.Text);
end;

procedure TSelezionaPraticheImpiantiForm.PratAgente4PropertiesInitPopup(
  Sender: TObject);
begin
  // Carica le items
  DM1.CaricaItemsAgenti(PratAgente4.Properties.Items, 4, PratAgente3.Text);
end;

procedure TSelezionaPraticheImpiantiForm.PratAgentePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(1, PratAgente2);
end;

procedure TSelezionaPraticheImpiantiForm.PratAgente2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(2, PratAgente3);
end;

procedure TSelezionaPraticheImpiantiForm.PratAgente3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  //  Controlla se il livello successivo (quello eventualmente da azzerare perchè legato a quello
  //  che è stato appena modificato) è linkato al presente ed eventualmente poi azzerarlo.
  DM1.AgenteChanged(3, PratAgente4);
end;

procedure TSelezionaPraticheImpiantiForm.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  // F11
  if Key = 122 then begin
    // Cantieri
    if (cxPageControl1.ActivePage = TabCantieri) then begin
      if (ssShift in Shift)
        then SBPratFilterOpenCloseClick(SBPratFilterOpenClose)
      else if PratDescrizione.Visible and PratDescrizione.Enabled
        then PratDescrizione.SetFocus;

    // Impianti
    end else if (cxPageControl1.ActivePage = TabImpianti) then begin
      if (ssShift in Shift)
        then SBAssFilterOpenCloseClick(SBAssFilterOpenClose)
      else if FilterAssTrova.Visible and FilterAssTrova.Enabled
        then FilterAssTrova.SetFocus;

    end;
  end;
end;

procedure TSelezionaPraticheImpiantiForm.CantieriApertiChiusiExit(
  Sender: TObject);
begin
  inherited;
   // Fà in modo che non resti una voce selezionata e quindi evidenziata che non mi piace
   (Sender as TCheckListBox).ItemIndex := -1;
end;

end.
