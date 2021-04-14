unit FormGruppi;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxTextEdit, cxMemo, cxCurrencyEdit, cxDropDownEdit, cxCheckBox,
  cxDBLookupComboBox, cxButtonEdit, DB, cxDBData, cxGridDBTableView,
  cxGridLevel, cxGridCardView, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, IB_Components,
  IBODataset, bmpPanel, StdCtrls, Mask, DBCtrls, ExtCtrls, Variants,
  Buttons, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  cxGridCustomLayoutView;

type
  TGruppiForm = class(TForm)
    ClientArea: TPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    PanelSelezionato1: TPanel;
    LabelSelezionato1: TLabel;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    PanelSelezionato2: TPanel;
    LabelSelezionato2: TLabel;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    QryGruppo1: TIBOQuery;
    SourceGruppo1: TDataSource;
    QryGruppo3: TIBOQuery;
    SourceGruppo3: TDataSource;
    QryGruppo2: TIBOQuery;
    SourceGruppo2: TDataSource;
    ClientTopPanel: TbmpPanel;
    PanelAnag2: TPanel;
    Shape2: TShape;
    Label2: TLabel;
    Descrizione2: TDBEdit;
    Codice2: TDBEdit;
    PanelAnag3: TPanel;
    Shape3: TShape;
    Label5: TLabel;
    Descrizione3: TDBEdit;
    Codice3: TDBEdit;
    PanelAnag1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    Descrizione1: TDBEdit;
    Codice1: TDBEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    QryGruppo1CODICE1: TIntegerField;
    QryGruppo1CODICE2: TIntegerField;
    QryGruppo1CODICE3: TIntegerField;
    QryGruppo1DESCRIZIONE: TStringField;
    QryGruppo1SINCHRO: TStringField;
    QryGruppo1DESCBREVE: TStringField;
    QryGruppo1SCONTODIACQUISTO1: TIBOFloatField;
    QryGruppo1SCONTODIACQUISTO2: TIBOFloatField;
    QryGruppo1SCONTODIACQUISTO3: TIBOFloatField;
    QryGruppo2CODICE1: TIntegerField;
    QryGruppo2CODICE2: TIntegerField;
    QryGruppo2CODICE3: TIntegerField;
    QryGruppo2DESCRIZIONE: TStringField;
    QryGruppo2SINCHRO: TStringField;
    QryGruppo2DESCBREVE: TStringField;
    QryGruppo2SCONTODIACQUISTO1: TIBOFloatField;
    QryGruppo2SCONTODIACQUISTO2: TIBOFloatField;
    QryGruppo2SCONTODIACQUISTO3: TIBOFloatField;
    QryGruppo3CODICE1: TIntegerField;
    QryGruppo3CODICE2: TIntegerField;
    QryGruppo3CODICE3: TIntegerField;
    QryGruppo3DESCRIZIONE: TStringField;
    QryGruppo3SINCHRO: TStringField;
    QryGruppo3DESCBREVE: TStringField;
    QryGruppo3SCONTODIACQUISTO1: TIBOFloatField;
    QryGruppo3SCONTODIACQUISTO2: TIBOFloatField;
    QryGruppo3SCONTODIACQUISTO3: TIBOFloatField;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    PanelSelezionato3: TPanel;
    LabelSelezionato3: TLabel;
    PanelGruppo5: TPanel;
    LabelGruppo5: TLabel;
    PanelSelezionato5: TPanel;
    LabelSelezionato5: TLabel;
    PanelAnag5: TPanel;
    Shape5: TShape;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Descrizione5: TDBEdit;
    Codice5: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    PanelGruppo6: TPanel;
    LabelGruppo6: TLabel;
    PanelSelezionato6: TPanel;
    LabelSelezionato6: TLabel;
    PanelAnag6: TPanel;
    Shape6: TShape;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Descrizione6: TDBEdit;
    Codice6: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    QryGruppo1CODICE4: TIntegerField;
    QryGruppo1CODICE5: TIntegerField;
    QryGruppo1CODICE6: TIntegerField;
    QryGruppo2CODICE4: TIntegerField;
    QryGruppo2CODICE5: TIntegerField;
    QryGruppo2CODICE6: TIntegerField;
    QryGruppo3CODICE4: TIntegerField;
    QryGruppo3CODICE5: TIntegerField;
    QryGruppo3CODICE6: TIntegerField;
    QryGruppo4: TIBOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    IBOFloatField1: TIBOFloatField;
    IBOFloatField2: TIBOFloatField;
    IBOFloatField3: TIBOFloatField;
    SourceGruppo4: TDataSource;
    QryGruppo5: TIBOQuery;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    IBOFloatField4: TIBOFloatField;
    IBOFloatField5: TIBOFloatField;
    IBOFloatField6: TIBOFloatField;
    SourceGruppo5: TDataSource;
    QryGruppo6: TIBOQuery;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    IBOFloatField7: TIBOFloatField;
    IBOFloatField8: TIBOFloatField;
    IBOFloatField9: TIBOFloatField;
    SourceGruppo6: TDataSource;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    PanelSelezionato4: TPanel;
    LabelSelezionato4: TLabel;
    PanelAnag4: TPanel;
    Shape4: TShape;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Descrizione4: TDBEdit;
    Codice4: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Grid1: TcxGrid;
    tvDiBa: TcxGridTableView;
    tvDiBaMOVMAG: TcxGridColumn;
    tvDiBaCODICEMAGAZZINO: TcxGridColumn;
    tvDiBaCODICEMAGAZZINO2: TcxGridColumn;
    tvDiBaCODICEARTICOLO: TcxGridColumn;
    tvDiBaCODICEARTICOLOSTM: TcxGridColumn;
    tvDiBaDESCRIZIONE: TcxGridColumn;
    tvDiBaPREZZOUNITARIO: TcxGridColumn;
    tvDiBaPREZZOUNITARIOIVACOMPRESA: TcxGridColumn;
    tvDiBaPRZUNITNETTO: TcxGridColumn;
    tvDiBaUNITADIMISURA: TcxGridColumn;
    tvDiBaQTA: TcxGridColumn;
    tvDiBaQTAINEVASIONE: TcxGridColumn;
    tvDiBaQTAEVASA: TcxGridColumn;
    tvDiBaQTADAEVADERE: TcxGridColumn;
    tvDiBaSCONTORIGO: TcxGridColumn;
    tvDiBaSCONTORIGO2: TcxGridColumn;
    tvDiBaSCONTORIGO3: TcxGridColumn;
    tvDiBaIMPORTORIGO: TcxGridColumn;
    tvDiBaIMPORTORIGOIVACOMPRESA: TcxGridColumn;
    tvDiBaCODICEIVA: TcxGridColumn;
    tvDiBaDESCRIZIONEIVA: TcxGridColumn;
    tvDiBaALIQUOTAIVA: TcxGridColumn;
    tvDiBaNOTERIGO: TcxGridColumn;
    tvDiBaPREZZOACQUISTOARTICOLO: TcxGridColumn;
    tvDiBaMARGINE: TcxGridColumn;
    tvDiBaIMPORTOMARGINE: TcxGridColumn;
    tvDiBaPRZUNITOPERA: TcxGridColumn;
    tvDiBaQTAOPERA: TcxGridColumn;
    tvDiBaIMPORTOOPERA: TcxGridColumn;
    tvDiBaIMPORTOCOMPONENTI: TcxGridColumn;
    tvDiBaSELEZIONATO: TcxGridColumn;
    tvDiBaMINUTIPREVISTI: TcxGridColumn;
    tvDiBaSOTTOCANTIERE1: TcxGridColumn;
    tvDiBaSOTTOCANTIERE2: TcxGridColumn;
    tvDiBaSOTTOCANTIERE3: TcxGridColumn;
    tvDiBaSOTTOCANTIERE4: TcxGridColumn;
    tvDiBaSOTTOCANTIERE5: TcxGridColumn;
    tvDiBaSOTTOCANTIERE6: TcxGridColumn;
    tvDiBaS3RIF: TcxGridColumn;
    tvDiBaS3UBICAZIONE: TcxGridColumn;
    tvDiBaS3COMPONENTE: TcxGridColumn;
    tvDiBaS3MATERIALE: TcxGridColumn;
    tvDiBaS3QTA: TcxGridColumn;
    tvDiBaS3DIAMETRO: TcxGridColumn;
    tvDiBaS3LUNGHEZZA: TcxGridColumn;
    tvDiBaS3INSTALLAZIONE: TcxGridColumn;
    tvDiBaS3CERTIFICAZIONE: TcxGridColumn;
    tvDiBaS3VENTILAZIONE: TcxGridColumn;
    tvDiBaS3SCARICO: TcxGridColumn;
    tvDiBaS3TIPO: TcxGridColumn;
    tvDiBaS3MODELLO: TcxGridColumn;
    tvDiBaS3PORTATATERMICA: TcxGridColumn;
    tvDiBaS3TIPOCOLLEGAMENTO: TcxGridColumn;
    tvDiBaS3INSTALLATOINSTALLABILE: TcxGridColumn;
    tvDiBaS3MATERIALEAPPARECCHIO: TcxGridColumn;
    tvDiBaTIPO1: TcxGridColumn;
    tvDiBaTIPO2: TcxGridColumn;
    tvDiBaTIPO3: TcxGridColumn;
    tvDiBaTIPO4: TcxGridColumn;
    tvDiBaTIPO5: TcxGridColumn;
    tvDiBaTIPO6: TcxGridColumn;
    tvDiBaTODELETE: TcxGridColumn;
    tvDiBaGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvDiBaGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvDiBaGC_RICARICO_MOD: TcxGridColumn;
    tvDiBaGC_RICARICO: TcxGridColumn;
    tvDiBaGC_QTA_MOD: TcxGridColumn;
    tvDiBaGC_QTA: TcxGridColumn;
    tvDiBaGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvDiBaGC_DESCRIZIONE: TcxGridColumn;
    tvDiBaGUID: TcxGridColumn;
    tvDiBaGUID_REF: TcxGridColumn;
    tvDiBaGUID_ANCESTOR: TcxGridColumn;
    tvDiBaORDER: TcxGridColumn;
    tvDiBaIDAPPARECCHIO: TcxGridColumn;
    tvDiBaIDOPIMPEGNO: TcxGridColumn;
    cvTot: TcxGridCardView;
    cvTotCOMPONENTI: TcxGridCardViewRow;
    cvTotMARGINE: TcxGridCardViewRow;
    cvTotIMPORTOMARGINE: TcxGridCardViewRow;
    cvTotTOTALECOMPONENTI: TcxGridCardViewRow;
    cvTotPRZUNITOPERA: TcxGridCardViewRow;
    cvTotQTAOPERA: TcxGridCardViewRow;
    cvTotIMPORTOOPERA: TcxGridCardViewRow;
    cvTotTOTALE: TcxGridCardViewRow;
    tvOre: TcxGridTableView;
    tvOreCODDIPENDENTE: TcxGridColumn;
    tvOreDESCRIZDIPENDENTE: TcxGridColumn;
    tvOreQTA: TcxGridColumn;
    tvOreNOTE: TcxGridColumn;
    tvOreSOTTOCANTIERE1: TcxGridColumn;
    tvOreSOTTOCANTIERE2: TcxGridColumn;
    tvOreSOTTOCANTIERE3: TcxGridColumn;
    tvOreTIPOORE1: TcxGridColumn;
    tvOreTIPOORE2: TcxGridColumn;
    tvOreTIPOORE3: TcxGridColumn;
    tvOrePRZUNITVEND: TcxGridColumn;
    tvOreIMPORTOVEND: TcxGridColumn;
    tvOreCOSTOORARIO: TcxGridColumn;
    tvOreIMPORTOCOSTOORARIO: TcxGridColumn;
    tvOreOPERAINDEX: TcxGridColumn;
    tvOreGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvOreGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvOreGC_RICARICO_MOD: TcxGridColumn;
    tvOreGC_RICARICO: TcxGridColumn;
    tvOreGC_QTA_MOD: TcxGridColumn;
    tvOreGC_QTA: TcxGridColumn;
    tvOreGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvOreGC_DESCRIZIONE: TcxGridColumn;
    tvOreGUID: TcxGridColumn;
    tvOreGUID_REF: TcxGridColumn;
    tvOreGUID_ANCESTOR: TcxGridColumn;
    tvList1: TcxGridDBTableView;
    lvList1: TcxGridLevel;
    tvList1DESCRIZIONE: TcxGridDBColumn;
    Grid2: TcxGrid;
    cxGridTableView1: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridColumn3: TcxGridColumn;
    cxGridColumn4: TcxGridColumn;
    cxGridColumn5: TcxGridColumn;
    cxGridColumn6: TcxGridColumn;
    cxGridColumn7: TcxGridColumn;
    cxGridColumn8: TcxGridColumn;
    cxGridColumn9: TcxGridColumn;
    cxGridColumn10: TcxGridColumn;
    cxGridColumn11: TcxGridColumn;
    cxGridColumn12: TcxGridColumn;
    cxGridColumn13: TcxGridColumn;
    cxGridColumn14: TcxGridColumn;
    cxGridColumn15: TcxGridColumn;
    cxGridColumn16: TcxGridColumn;
    cxGridColumn17: TcxGridColumn;
    cxGridColumn18: TcxGridColumn;
    cxGridColumn19: TcxGridColumn;
    cxGridColumn20: TcxGridColumn;
    cxGridColumn21: TcxGridColumn;
    cxGridColumn22: TcxGridColumn;
    cxGridColumn23: TcxGridColumn;
    cxGridColumn24: TcxGridColumn;
    cxGridColumn25: TcxGridColumn;
    cxGridColumn26: TcxGridColumn;
    cxGridColumn27: TcxGridColumn;
    cxGridColumn28: TcxGridColumn;
    cxGridColumn29: TcxGridColumn;
    cxGridColumn30: TcxGridColumn;
    cxGridColumn31: TcxGridColumn;
    cxGridColumn32: TcxGridColumn;
    cxGridColumn33: TcxGridColumn;
    cxGridColumn34: TcxGridColumn;
    cxGridColumn35: TcxGridColumn;
    cxGridColumn36: TcxGridColumn;
    cxGridColumn37: TcxGridColumn;
    cxGridColumn38: TcxGridColumn;
    cxGridColumn39: TcxGridColumn;
    cxGridColumn40: TcxGridColumn;
    cxGridColumn41: TcxGridColumn;
    cxGridColumn42: TcxGridColumn;
    cxGridColumn43: TcxGridColumn;
    cxGridColumn44: TcxGridColumn;
    cxGridColumn45: TcxGridColumn;
    cxGridColumn46: TcxGridColumn;
    cxGridColumn47: TcxGridColumn;
    cxGridColumn48: TcxGridColumn;
    cxGridColumn49: TcxGridColumn;
    cxGridColumn50: TcxGridColumn;
    cxGridColumn51: TcxGridColumn;
    cxGridColumn52: TcxGridColumn;
    cxGridColumn53: TcxGridColumn;
    cxGridColumn54: TcxGridColumn;
    cxGridColumn55: TcxGridColumn;
    cxGridColumn56: TcxGridColumn;
    cxGridColumn57: TcxGridColumn;
    cxGridColumn58: TcxGridColumn;
    cxGridColumn59: TcxGridColumn;
    cxGridColumn60: TcxGridColumn;
    cxGridColumn61: TcxGridColumn;
    cxGridColumn62: TcxGridColumn;
    cxGridColumn63: TcxGridColumn;
    cxGridColumn64: TcxGridColumn;
    cxGridColumn65: TcxGridColumn;
    cxGridColumn66: TcxGridColumn;
    cxGridColumn67: TcxGridColumn;
    cxGridColumn68: TcxGridColumn;
    cxGridColumn69: TcxGridColumn;
    cxGridColumn70: TcxGridColumn;
    cxGridColumn71: TcxGridColumn;
    cxGridColumn72: TcxGridColumn;
    cxGridColumn73: TcxGridColumn;
    cxGridColumn74: TcxGridColumn;
    cxGridColumn75: TcxGridColumn;
    cxGridColumn76: TcxGridColumn;
    cxGridCardView1: TcxGridCardView;
    cxGridCardViewRow1: TcxGridCardViewRow;
    cxGridCardViewRow2: TcxGridCardViewRow;
    cxGridCardViewRow3: TcxGridCardViewRow;
    cxGridCardViewRow4: TcxGridCardViewRow;
    cxGridCardViewRow5: TcxGridCardViewRow;
    cxGridCardViewRow6: TcxGridCardViewRow;
    cxGridCardViewRow7: TcxGridCardViewRow;
    cxGridCardViewRow8: TcxGridCardViewRow;
    cxGridTableView2: TcxGridTableView;
    cxGridColumn77: TcxGridColumn;
    cxGridColumn78: TcxGridColumn;
    cxGridColumn79: TcxGridColumn;
    cxGridColumn80: TcxGridColumn;
    cxGridColumn81: TcxGridColumn;
    cxGridColumn82: TcxGridColumn;
    cxGridColumn83: TcxGridColumn;
    cxGridColumn84: TcxGridColumn;
    cxGridColumn85: TcxGridColumn;
    cxGridColumn86: TcxGridColumn;
    cxGridColumn87: TcxGridColumn;
    cxGridColumn88: TcxGridColumn;
    cxGridColumn89: TcxGridColumn;
    cxGridColumn90: TcxGridColumn;
    cxGridColumn91: TcxGridColumn;
    cxGridColumn92: TcxGridColumn;
    cxGridColumn93: TcxGridColumn;
    cxGridColumn94: TcxGridColumn;
    cxGridColumn95: TcxGridColumn;
    cxGridColumn96: TcxGridColumn;
    cxGridColumn97: TcxGridColumn;
    cxGridColumn98: TcxGridColumn;
    cxGridColumn99: TcxGridColumn;
    cxGridColumn100: TcxGridColumn;
    cxGridColumn101: TcxGridColumn;
    cxGridColumn102: TcxGridColumn;
    tvList2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    lvList2: TcxGridLevel;
    Grid3: TcxGrid;
    cxGridTableView3: TcxGridTableView;
    cxGridColumn103: TcxGridColumn;
    cxGridColumn104: TcxGridColumn;
    cxGridColumn105: TcxGridColumn;
    cxGridColumn106: TcxGridColumn;
    cxGridColumn107: TcxGridColumn;
    cxGridColumn108: TcxGridColumn;
    cxGridColumn109: TcxGridColumn;
    cxGridColumn110: TcxGridColumn;
    cxGridColumn111: TcxGridColumn;
    cxGridColumn112: TcxGridColumn;
    cxGridColumn113: TcxGridColumn;
    cxGridColumn114: TcxGridColumn;
    cxGridColumn115: TcxGridColumn;
    cxGridColumn116: TcxGridColumn;
    cxGridColumn117: TcxGridColumn;
    cxGridColumn118: TcxGridColumn;
    cxGridColumn119: TcxGridColumn;
    cxGridColumn120: TcxGridColumn;
    cxGridColumn121: TcxGridColumn;
    cxGridColumn122: TcxGridColumn;
    cxGridColumn123: TcxGridColumn;
    cxGridColumn124: TcxGridColumn;
    cxGridColumn125: TcxGridColumn;
    cxGridColumn126: TcxGridColumn;
    cxGridColumn127: TcxGridColumn;
    cxGridColumn128: TcxGridColumn;
    cxGridColumn129: TcxGridColumn;
    cxGridColumn130: TcxGridColumn;
    cxGridColumn131: TcxGridColumn;
    cxGridColumn132: TcxGridColumn;
    cxGridColumn133: TcxGridColumn;
    cxGridColumn134: TcxGridColumn;
    cxGridColumn135: TcxGridColumn;
    cxGridColumn136: TcxGridColumn;
    cxGridColumn137: TcxGridColumn;
    cxGridColumn138: TcxGridColumn;
    cxGridColumn139: TcxGridColumn;
    cxGridColumn140: TcxGridColumn;
    cxGridColumn141: TcxGridColumn;
    cxGridColumn142: TcxGridColumn;
    cxGridColumn143: TcxGridColumn;
    cxGridColumn144: TcxGridColumn;
    cxGridColumn145: TcxGridColumn;
    cxGridColumn146: TcxGridColumn;
    cxGridColumn147: TcxGridColumn;
    cxGridColumn148: TcxGridColumn;
    cxGridColumn149: TcxGridColumn;
    cxGridColumn150: TcxGridColumn;
    cxGridColumn151: TcxGridColumn;
    cxGridColumn152: TcxGridColumn;
    cxGridColumn153: TcxGridColumn;
    cxGridColumn154: TcxGridColumn;
    cxGridColumn155: TcxGridColumn;
    cxGridColumn156: TcxGridColumn;
    cxGridColumn157: TcxGridColumn;
    cxGridColumn158: TcxGridColumn;
    cxGridColumn159: TcxGridColumn;
    cxGridColumn160: TcxGridColumn;
    cxGridColumn161: TcxGridColumn;
    cxGridColumn162: TcxGridColumn;
    cxGridColumn163: TcxGridColumn;
    cxGridColumn164: TcxGridColumn;
    cxGridColumn165: TcxGridColumn;
    cxGridColumn166: TcxGridColumn;
    cxGridColumn167: TcxGridColumn;
    cxGridColumn168: TcxGridColumn;
    cxGridColumn169: TcxGridColumn;
    cxGridColumn170: TcxGridColumn;
    cxGridColumn171: TcxGridColumn;
    cxGridColumn172: TcxGridColumn;
    cxGridColumn173: TcxGridColumn;
    cxGridColumn174: TcxGridColumn;
    cxGridColumn175: TcxGridColumn;
    cxGridColumn176: TcxGridColumn;
    cxGridColumn177: TcxGridColumn;
    cxGridColumn178: TcxGridColumn;
    cxGridCardView2: TcxGridCardView;
    cxGridCardViewRow9: TcxGridCardViewRow;
    cxGridCardViewRow10: TcxGridCardViewRow;
    cxGridCardViewRow11: TcxGridCardViewRow;
    cxGridCardViewRow12: TcxGridCardViewRow;
    cxGridCardViewRow13: TcxGridCardViewRow;
    cxGridCardViewRow14: TcxGridCardViewRow;
    cxGridCardViewRow15: TcxGridCardViewRow;
    cxGridCardViewRow16: TcxGridCardViewRow;
    cxGridTableView4: TcxGridTableView;
    cxGridColumn179: TcxGridColumn;
    cxGridColumn180: TcxGridColumn;
    cxGridColumn181: TcxGridColumn;
    cxGridColumn182: TcxGridColumn;
    cxGridColumn183: TcxGridColumn;
    cxGridColumn184: TcxGridColumn;
    cxGridColumn185: TcxGridColumn;
    cxGridColumn186: TcxGridColumn;
    cxGridColumn187: TcxGridColumn;
    cxGridColumn188: TcxGridColumn;
    cxGridColumn189: TcxGridColumn;
    cxGridColumn190: TcxGridColumn;
    cxGridColumn191: TcxGridColumn;
    cxGridColumn192: TcxGridColumn;
    cxGridColumn193: TcxGridColumn;
    cxGridColumn194: TcxGridColumn;
    cxGridColumn195: TcxGridColumn;
    cxGridColumn196: TcxGridColumn;
    cxGridColumn197: TcxGridColumn;
    cxGridColumn198: TcxGridColumn;
    cxGridColumn199: TcxGridColumn;
    cxGridColumn200: TcxGridColumn;
    cxGridColumn201: TcxGridColumn;
    cxGridColumn202: TcxGridColumn;
    cxGridColumn203: TcxGridColumn;
    cxGridColumn204: TcxGridColumn;
    tvList3: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    lvList3: TcxGridLevel;
    Grid4: TcxGrid;
    cxGridTableView5: TcxGridTableView;
    cxGridColumn205: TcxGridColumn;
    cxGridColumn206: TcxGridColumn;
    cxGridColumn207: TcxGridColumn;
    cxGridColumn208: TcxGridColumn;
    cxGridColumn209: TcxGridColumn;
    cxGridColumn210: TcxGridColumn;
    cxGridColumn211: TcxGridColumn;
    cxGridColumn212: TcxGridColumn;
    cxGridColumn213: TcxGridColumn;
    cxGridColumn214: TcxGridColumn;
    cxGridColumn215: TcxGridColumn;
    cxGridColumn216: TcxGridColumn;
    cxGridColumn217: TcxGridColumn;
    cxGridColumn218: TcxGridColumn;
    cxGridColumn219: TcxGridColumn;
    cxGridColumn220: TcxGridColumn;
    cxGridColumn221: TcxGridColumn;
    cxGridColumn222: TcxGridColumn;
    cxGridColumn223: TcxGridColumn;
    cxGridColumn224: TcxGridColumn;
    cxGridColumn225: TcxGridColumn;
    cxGridColumn226: TcxGridColumn;
    cxGridColumn227: TcxGridColumn;
    cxGridColumn228: TcxGridColumn;
    cxGridColumn229: TcxGridColumn;
    cxGridColumn230: TcxGridColumn;
    cxGridColumn231: TcxGridColumn;
    cxGridColumn232: TcxGridColumn;
    cxGridColumn233: TcxGridColumn;
    cxGridColumn234: TcxGridColumn;
    cxGridColumn235: TcxGridColumn;
    cxGridColumn236: TcxGridColumn;
    cxGridColumn237: TcxGridColumn;
    cxGridColumn238: TcxGridColumn;
    cxGridColumn239: TcxGridColumn;
    cxGridColumn240: TcxGridColumn;
    cxGridColumn241: TcxGridColumn;
    cxGridColumn242: TcxGridColumn;
    cxGridColumn243: TcxGridColumn;
    cxGridColumn244: TcxGridColumn;
    cxGridColumn245: TcxGridColumn;
    cxGridColumn246: TcxGridColumn;
    cxGridColumn247: TcxGridColumn;
    cxGridColumn248: TcxGridColumn;
    cxGridColumn249: TcxGridColumn;
    cxGridColumn250: TcxGridColumn;
    cxGridColumn251: TcxGridColumn;
    cxGridColumn252: TcxGridColumn;
    cxGridColumn253: TcxGridColumn;
    cxGridColumn254: TcxGridColumn;
    cxGridColumn255: TcxGridColumn;
    cxGridColumn256: TcxGridColumn;
    cxGridColumn257: TcxGridColumn;
    cxGridColumn258: TcxGridColumn;
    cxGridColumn259: TcxGridColumn;
    cxGridColumn260: TcxGridColumn;
    cxGridColumn261: TcxGridColumn;
    cxGridColumn262: TcxGridColumn;
    cxGridColumn263: TcxGridColumn;
    cxGridColumn264: TcxGridColumn;
    cxGridColumn265: TcxGridColumn;
    cxGridColumn266: TcxGridColumn;
    cxGridColumn267: TcxGridColumn;
    cxGridColumn268: TcxGridColumn;
    cxGridColumn269: TcxGridColumn;
    cxGridColumn270: TcxGridColumn;
    cxGridColumn271: TcxGridColumn;
    cxGridColumn272: TcxGridColumn;
    cxGridColumn273: TcxGridColumn;
    cxGridColumn274: TcxGridColumn;
    cxGridColumn275: TcxGridColumn;
    cxGridColumn276: TcxGridColumn;
    cxGridColumn277: TcxGridColumn;
    cxGridColumn278: TcxGridColumn;
    cxGridColumn279: TcxGridColumn;
    cxGridColumn280: TcxGridColumn;
    cxGridCardView3: TcxGridCardView;
    cxGridCardViewRow17: TcxGridCardViewRow;
    cxGridCardViewRow18: TcxGridCardViewRow;
    cxGridCardViewRow19: TcxGridCardViewRow;
    cxGridCardViewRow20: TcxGridCardViewRow;
    cxGridCardViewRow21: TcxGridCardViewRow;
    cxGridCardViewRow22: TcxGridCardViewRow;
    cxGridCardViewRow23: TcxGridCardViewRow;
    cxGridCardViewRow24: TcxGridCardViewRow;
    cxGridTableView6: TcxGridTableView;
    cxGridColumn281: TcxGridColumn;
    cxGridColumn282: TcxGridColumn;
    cxGridColumn283: TcxGridColumn;
    cxGridColumn284: TcxGridColumn;
    cxGridColumn285: TcxGridColumn;
    cxGridColumn286: TcxGridColumn;
    cxGridColumn287: TcxGridColumn;
    cxGridColumn288: TcxGridColumn;
    cxGridColumn289: TcxGridColumn;
    cxGridColumn290: TcxGridColumn;
    cxGridColumn291: TcxGridColumn;
    cxGridColumn292: TcxGridColumn;
    cxGridColumn293: TcxGridColumn;
    cxGridColumn294: TcxGridColumn;
    cxGridColumn295: TcxGridColumn;
    cxGridColumn296: TcxGridColumn;
    cxGridColumn297: TcxGridColumn;
    cxGridColumn298: TcxGridColumn;
    cxGridColumn299: TcxGridColumn;
    cxGridColumn300: TcxGridColumn;
    cxGridColumn301: TcxGridColumn;
    cxGridColumn302: TcxGridColumn;
    cxGridColumn303: TcxGridColumn;
    cxGridColumn304: TcxGridColumn;
    cxGridColumn305: TcxGridColumn;
    cxGridColumn306: TcxGridColumn;
    tvList4: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    lvList4: TcxGridLevel;
    Grid5: TcxGrid;
    cxGridTableView7: TcxGridTableView;
    cxGridColumn307: TcxGridColumn;
    cxGridColumn308: TcxGridColumn;
    cxGridColumn309: TcxGridColumn;
    cxGridColumn310: TcxGridColumn;
    cxGridColumn311: TcxGridColumn;
    cxGridColumn312: TcxGridColumn;
    cxGridColumn313: TcxGridColumn;
    cxGridColumn314: TcxGridColumn;
    cxGridColumn315: TcxGridColumn;
    cxGridColumn316: TcxGridColumn;
    cxGridColumn317: TcxGridColumn;
    cxGridColumn318: TcxGridColumn;
    cxGridColumn319: TcxGridColumn;
    cxGridColumn320: TcxGridColumn;
    cxGridColumn321: TcxGridColumn;
    cxGridColumn322: TcxGridColumn;
    cxGridColumn323: TcxGridColumn;
    cxGridColumn324: TcxGridColumn;
    cxGridColumn325: TcxGridColumn;
    cxGridColumn326: TcxGridColumn;
    cxGridColumn327: TcxGridColumn;
    cxGridColumn328: TcxGridColumn;
    cxGridColumn329: TcxGridColumn;
    cxGridColumn330: TcxGridColumn;
    cxGridColumn331: TcxGridColumn;
    cxGridColumn332: TcxGridColumn;
    cxGridColumn333: TcxGridColumn;
    cxGridColumn334: TcxGridColumn;
    cxGridColumn335: TcxGridColumn;
    cxGridColumn336: TcxGridColumn;
    cxGridColumn337: TcxGridColumn;
    cxGridColumn338: TcxGridColumn;
    cxGridColumn339: TcxGridColumn;
    cxGridColumn340: TcxGridColumn;
    cxGridColumn341: TcxGridColumn;
    cxGridColumn342: TcxGridColumn;
    cxGridColumn343: TcxGridColumn;
    cxGridColumn344: TcxGridColumn;
    cxGridColumn345: TcxGridColumn;
    cxGridColumn346: TcxGridColumn;
    cxGridColumn347: TcxGridColumn;
    cxGridColumn348: TcxGridColumn;
    cxGridColumn349: TcxGridColumn;
    cxGridColumn350: TcxGridColumn;
    cxGridColumn351: TcxGridColumn;
    cxGridColumn352: TcxGridColumn;
    cxGridColumn353: TcxGridColumn;
    cxGridColumn354: TcxGridColumn;
    cxGridColumn355: TcxGridColumn;
    cxGridColumn356: TcxGridColumn;
    cxGridColumn357: TcxGridColumn;
    cxGridColumn358: TcxGridColumn;
    cxGridColumn359: TcxGridColumn;
    cxGridColumn360: TcxGridColumn;
    cxGridColumn361: TcxGridColumn;
    cxGridColumn362: TcxGridColumn;
    cxGridColumn363: TcxGridColumn;
    cxGridColumn364: TcxGridColumn;
    cxGridColumn365: TcxGridColumn;
    cxGridColumn366: TcxGridColumn;
    cxGridColumn367: TcxGridColumn;
    cxGridColumn368: TcxGridColumn;
    cxGridColumn369: TcxGridColumn;
    cxGridColumn370: TcxGridColumn;
    cxGridColumn371: TcxGridColumn;
    cxGridColumn372: TcxGridColumn;
    cxGridColumn373: TcxGridColumn;
    cxGridColumn374: TcxGridColumn;
    cxGridColumn375: TcxGridColumn;
    cxGridColumn376: TcxGridColumn;
    cxGridColumn377: TcxGridColumn;
    cxGridColumn378: TcxGridColumn;
    cxGridColumn379: TcxGridColumn;
    cxGridColumn380: TcxGridColumn;
    cxGridColumn381: TcxGridColumn;
    cxGridColumn382: TcxGridColumn;
    cxGridCardView4: TcxGridCardView;
    cxGridCardViewRow25: TcxGridCardViewRow;
    cxGridCardViewRow26: TcxGridCardViewRow;
    cxGridCardViewRow27: TcxGridCardViewRow;
    cxGridCardViewRow28: TcxGridCardViewRow;
    cxGridCardViewRow29: TcxGridCardViewRow;
    cxGridCardViewRow30: TcxGridCardViewRow;
    cxGridCardViewRow31: TcxGridCardViewRow;
    cxGridCardViewRow32: TcxGridCardViewRow;
    cxGridTableView8: TcxGridTableView;
    cxGridColumn383: TcxGridColumn;
    cxGridColumn384: TcxGridColumn;
    cxGridColumn385: TcxGridColumn;
    cxGridColumn386: TcxGridColumn;
    cxGridColumn387: TcxGridColumn;
    cxGridColumn388: TcxGridColumn;
    cxGridColumn389: TcxGridColumn;
    cxGridColumn390: TcxGridColumn;
    cxGridColumn391: TcxGridColumn;
    cxGridColumn392: TcxGridColumn;
    cxGridColumn393: TcxGridColumn;
    cxGridColumn394: TcxGridColumn;
    cxGridColumn395: TcxGridColumn;
    cxGridColumn396: TcxGridColumn;
    cxGridColumn397: TcxGridColumn;
    cxGridColumn398: TcxGridColumn;
    cxGridColumn399: TcxGridColumn;
    cxGridColumn400: TcxGridColumn;
    cxGridColumn401: TcxGridColumn;
    cxGridColumn402: TcxGridColumn;
    cxGridColumn403: TcxGridColumn;
    cxGridColumn404: TcxGridColumn;
    cxGridColumn405: TcxGridColumn;
    cxGridColumn406: TcxGridColumn;
    cxGridColumn407: TcxGridColumn;
    cxGridColumn408: TcxGridColumn;
    tvList5: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    lvList5: TcxGridLevel;
    Grid6: TcxGrid;
    cxGridTableView9: TcxGridTableView;
    cxGridColumn409: TcxGridColumn;
    cxGridColumn410: TcxGridColumn;
    cxGridColumn411: TcxGridColumn;
    cxGridColumn412: TcxGridColumn;
    cxGridColumn413: TcxGridColumn;
    cxGridColumn414: TcxGridColumn;
    cxGridColumn415: TcxGridColumn;
    cxGridColumn416: TcxGridColumn;
    cxGridColumn417: TcxGridColumn;
    cxGridColumn418: TcxGridColumn;
    cxGridColumn419: TcxGridColumn;
    cxGridColumn420: TcxGridColumn;
    cxGridColumn421: TcxGridColumn;
    cxGridColumn422: TcxGridColumn;
    cxGridColumn423: TcxGridColumn;
    cxGridColumn424: TcxGridColumn;
    cxGridColumn425: TcxGridColumn;
    cxGridColumn426: TcxGridColumn;
    cxGridColumn427: TcxGridColumn;
    cxGridColumn428: TcxGridColumn;
    cxGridColumn429: TcxGridColumn;
    cxGridColumn430: TcxGridColumn;
    cxGridColumn431: TcxGridColumn;
    cxGridColumn432: TcxGridColumn;
    cxGridColumn433: TcxGridColumn;
    cxGridColumn434: TcxGridColumn;
    cxGridColumn435: TcxGridColumn;
    cxGridColumn436: TcxGridColumn;
    cxGridColumn437: TcxGridColumn;
    cxGridColumn438: TcxGridColumn;
    cxGridColumn439: TcxGridColumn;
    cxGridColumn440: TcxGridColumn;
    cxGridColumn441: TcxGridColumn;
    cxGridColumn442: TcxGridColumn;
    cxGridColumn443: TcxGridColumn;
    cxGridColumn444: TcxGridColumn;
    cxGridColumn445: TcxGridColumn;
    cxGridColumn446: TcxGridColumn;
    cxGridColumn447: TcxGridColumn;
    cxGridColumn448: TcxGridColumn;
    cxGridColumn449: TcxGridColumn;
    cxGridColumn450: TcxGridColumn;
    cxGridColumn451: TcxGridColumn;
    cxGridColumn452: TcxGridColumn;
    cxGridColumn453: TcxGridColumn;
    cxGridColumn454: TcxGridColumn;
    cxGridColumn455: TcxGridColumn;
    cxGridColumn456: TcxGridColumn;
    cxGridColumn457: TcxGridColumn;
    cxGridColumn458: TcxGridColumn;
    cxGridColumn459: TcxGridColumn;
    cxGridColumn460: TcxGridColumn;
    cxGridColumn461: TcxGridColumn;
    cxGridColumn462: TcxGridColumn;
    cxGridColumn463: TcxGridColumn;
    cxGridColumn464: TcxGridColumn;
    cxGridColumn465: TcxGridColumn;
    cxGridColumn466: TcxGridColumn;
    cxGridColumn467: TcxGridColumn;
    cxGridColumn468: TcxGridColumn;
    cxGridColumn469: TcxGridColumn;
    cxGridColumn470: TcxGridColumn;
    cxGridColumn471: TcxGridColumn;
    cxGridColumn472: TcxGridColumn;
    cxGridColumn473: TcxGridColumn;
    cxGridColumn474: TcxGridColumn;
    cxGridColumn475: TcxGridColumn;
    cxGridColumn476: TcxGridColumn;
    cxGridColumn477: TcxGridColumn;
    cxGridColumn478: TcxGridColumn;
    cxGridColumn479: TcxGridColumn;
    cxGridColumn480: TcxGridColumn;
    cxGridColumn481: TcxGridColumn;
    cxGridColumn482: TcxGridColumn;
    cxGridColumn483: TcxGridColumn;
    cxGridColumn484: TcxGridColumn;
    cxGridCardView5: TcxGridCardView;
    cxGridCardViewRow33: TcxGridCardViewRow;
    cxGridCardViewRow34: TcxGridCardViewRow;
    cxGridCardViewRow35: TcxGridCardViewRow;
    cxGridCardViewRow36: TcxGridCardViewRow;
    cxGridCardViewRow37: TcxGridCardViewRow;
    cxGridCardViewRow38: TcxGridCardViewRow;
    cxGridCardViewRow39: TcxGridCardViewRow;
    cxGridCardViewRow40: TcxGridCardViewRow;
    cxGridTableView10: TcxGridTableView;
    cxGridColumn485: TcxGridColumn;
    cxGridColumn486: TcxGridColumn;
    cxGridColumn487: TcxGridColumn;
    cxGridColumn488: TcxGridColumn;
    cxGridColumn489: TcxGridColumn;
    cxGridColumn490: TcxGridColumn;
    cxGridColumn491: TcxGridColumn;
    cxGridColumn492: TcxGridColumn;
    cxGridColumn493: TcxGridColumn;
    cxGridColumn494: TcxGridColumn;
    cxGridColumn495: TcxGridColumn;
    cxGridColumn496: TcxGridColumn;
    cxGridColumn497: TcxGridColumn;
    cxGridColumn498: TcxGridColumn;
    cxGridColumn499: TcxGridColumn;
    cxGridColumn500: TcxGridColumn;
    cxGridColumn501: TcxGridColumn;
    cxGridColumn502: TcxGridColumn;
    cxGridColumn503: TcxGridColumn;
    cxGridColumn504: TcxGridColumn;
    cxGridColumn505: TcxGridColumn;
    cxGridColumn506: TcxGridColumn;
    cxGridColumn507: TcxGridColumn;
    cxGridColumn508: TcxGridColumn;
    cxGridColumn509: TcxGridColumn;
    cxGridColumn510: TcxGridColumn;
    tvList6: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    lvList6: TcxGridLevel;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure EseguiQueryGruppo1;
    procedure EseguiQueryGruppo2;
    procedure EseguiQueryGruppo3;
    procedure EseguiQueryGruppo4;
    procedure EseguiQueryGruppo5;
    procedure EseguiQueryGruppo6;
    procedure RefreshScreen;
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    function  CanDeleteGruppo1(Cod1:Integer): Boolean;
    function  CanDeleteGruppo2(Cod1,Cod2:Integer): Boolean;
    function  CanDeleteGruppo3(Cod1,Cod2,Cod3:Integer): Boolean;
    function  CanDeleteGruppo4(Cod1,Cod2,Cod3,Cod4:Integer): Boolean;
    function  CanDeleteGruppo5(Cod1,Cod2,Cod3,Cod4,Cod5:Integer): Boolean;
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryGruppo1BeforePost(DataSet: TDataSet);
    procedure Descrizione1Enter(Sender: TObject);
    procedure Descrizione1Exit(Sender: TObject);
    procedure AggiornaScontiArticoliDelGruppo(G:TIBOQuery);
    procedure ValoriDefault(Qry:TIBOQuery);
    procedure tvList1DblClick(Sender: TObject);
  private
    { Private declarations }
    // Variabile per il posizionamento verticale dei pannelli
    YY: Integer;
    function CalcolaPosizioneAltezzaPannelloAttivo(var P: TPanel): Integer;
  public
    { Public declarations }
    // Contengono i codici dei rispettivi gruppi selezionati
    Selezionato1, Selezionato2, Selezionato3, Selezionato4, Selezionato5:Integer;
    // Contiene l'indicazione di quale livello sia attualmente attivo
    LivelloAttivo:Shortint;
  end;

var
  GruppiForm: TGruppiForm;

implementation

uses main, DataModule1, SchedaClienti, FormAnagArt, FormCondVend,
  SchedaArticoli1, FormAumentoListini, FormModificaMargini, FormTabGC, StrUtils;

{$R *.DFM}

{procedure TGruppiForm.AggiornaScontiArticoliDelGruppo(G:TIBOQuery);
var
   Qry : TIB_Cursor;
begin
   // Questa procedura si occupa di aggiornare gli sconti di tutti gli articoli
   //  che fanno parte del gruppo e che ne ereditano gli sconti.
   // --------------------------------------------------------------------------
   Qry := TIB_Cursor.Create(Self);
   // Visualizza il messaggio di operazione in corso e attende un pochino per farlo leggere
   DM1.ShowWait('Aggiornamento Sconti Articoli', 'Aggiorna mento degli sconti degli articoli del gruppo in corso...');
   Sleep(300);
   try
      // Imposta la query
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('UPDATE ARTICOLI SET');
      // Imposta gli sconti dell'articolo
      if not G.FieldByName('SCONTODIACQUISTO1').IsNull then Qry.SQL.Add('SCONTODIACQUISTO  = ' + DM1.FloatVarToSQL(G.FieldByName('SCONTODIACQUISTO1').AsFloat) + ',') else Qry.SQL.Add('SCONTODIACQUISTO  = 0,');
      if not G.FieldByName('SCONTODIACQUISTO2').IsNull then Qry.SQL.Add('SCONTODIACQUISTO2 = ' + DM1.FloatVarToSQL(G.FieldByName('SCONTODIACQUISTO2').AsFloat) + ',') else Qry.SQL.Add('SCONTODIACQUISTO2 = 0,');
      if not G.FieldByName('SCONTODIACQUISTO3').IsNull then Qry.SQL.Add('SCONTODIACQUISTO3 = ' + DM1.FloatVarToSQL(G.FieldByName('SCONTODIACQUISTO3').AsFloat) + ',') else Qry.SQL.Add('SCONTODIACQUISTO3 = 0,');
      // Calcola il conseguente UltimoPrzAcquisto
      Qry.SQL.Add('ULTIMOPRZACQUISTO = PREZZODILISTINO * (100 - SCONTODIACQUISTO) / 100,');
      Qry.SQL.Add('ULTIMOPRZACQUISTO = ULTIMOPRZACQUISTO * (100 - SCONTODIACQUISTO2) / 100,');
      Qry.SQL.Add('ULTIMOPRZACQUISTO = ULTIMOPRZACQUISTO * (100 - SCONTODIACQUISTO3) / 100,');
      // Calcola i prezzi di vendita
      Qry.SQL.Add('PREZZODIVENDITA  = ULTIMOPRZACQUISTO * (100 + RICARICO)  / 100,');
      Qry.SQL.Add('PREZZODIVENDITA2 = ULTIMOPRZACQUISTO * (100 + RICARICO2) / 100,');
      Qry.SQL.Add('PREZZODIVENDITA3 = ULTIMOPRZACQUISTO * (100 + RICARICO3) / 100,');
      Qry.SQL.Add('PREZZODIVENDITA4 = ULTIMOPRZACQUISTO * (100 + RICARICO4) / 100,');
      // Calcola l'importo dei margini
      Qry.SQL.Add('IMPORTORICARICO  = PREZZODIVENDITA  - ULTIMOPRZACQUISTO,');
      Qry.SQL.Add('IMPORTORICARICO2 = PREZZODIVENDITA2 - ULTIMOPRZACQUISTO,');
      Qry.SQL.Add('IMPORTORICARICO3 = PREZZODIVENDITA3 - ULTIMOPRZACQUISTO,');
      Qry.SQL.Add('IMPORTORICARICO4 = PREZZODIVENDITA4 - ULTIMOPRZACQUISTO,');
      // Calcola lo sconto dal prezzo di listino
      Qry.SQL.Add('SCONTOLISTINO1 = (PREZZODILISTINO - PREZZODIVENDITA)  * 100 / PREZZODILISTINO,');
      Qry.SQL.Add('SCONTOLISTINO2 = (PREZZODILISTINO - PREZZODIVENDITA2) * 100 / PREZZODILISTINO,');
      Qry.SQL.Add('SCONTOLISTINO3 = (PREZZODILISTINO - PREZZODIVENDITA3) * 100 / PREZZODILISTINO,');
      Qry.SQL.Add('SCONTOLISTINO4 = (PREZZODILISTINO - PREZZODIVENDITA4) * 100 / PREZZODILISTINO,');
      // Calcola il prezzo di vendita IVA compresa
      Qry.SQL.Add('PRZVENDIVACOMP1 = PREZZODIVENDITA  * (100 + (SELECT ALIQIVA.ALIQUOTAIVA FROM ALIQIVA WHERE ALIQIVA.CODICEIVA = ARTICOLI.CODICEIVA)) / 100,');
      Qry.SQL.Add('PRZVENDIVACOMP2 = PREZZODIVENDITA2 * (100 + (SELECT ALIQIVA.ALIQUOTAIVA FROM ALIQIVA WHERE ALIQIVA.CODICEIVA = ARTICOLI.CODICEIVA)) / 100,');
      Qry.SQL.Add('PRZVENDIVACOMP3 = PREZZODIVENDITA3 * (100 + (SELECT ALIQIVA.ALIQUOTAIVA FROM ALIQIVA WHERE ALIQIVA.CODICEIVA = ARTICOLI.CODICEIVA)) / 100,');
      Qry.SQL.Add('PRZVENDIVACOMP4 = PREZZODIVENDITA4 * (100 + (SELECT ALIQIVA.ALIQUOTAIVA FROM ALIQIVA WHERE ALIQIVA.CODICEIVA = ARTICOLI.CODICEIVA)) / 100');
      // Condizioni
      Qry.SQL.Add('WHERE CODICEGRUPPO1 = ' + G.FieldByName('CODICE1').AsString);
      if (G.FieldByName('CODICE2').AsInteger = -1) or (G.FieldByName('CODICE2').IsNull)
         then Qry.SQL.Add('AND (CODICEGRUPPO2 = -1 OR CODICEGRUPPO2 IS NULL)')
         else Qry.SQL.Add('AND CODICEGRUPPO2 = ' + G.FieldByName('CODICE2').AsString);
      if (G.FieldByName('CODICE3').AsInteger = -1) or (G.FieldByName('CODICE3').IsNull)
         then Qry.SQL.Add('AND (CODICEGRUPPO3 = -1 OR CODICEGRUPPO3 IS NULL)')
         else Qry.SQL.Add('AND CODICEGRUPPO3 = ' + G.FieldByName('CODICE3').AsString);
      if (G.FieldByName('CODICE4').AsInteger = -1) or (G.FieldByName('CODICE4').IsNull)
         then Qry.SQL.Add('AND (CODICEGRUPPO4 = -1 OR CODICEGRUPPO4 IS NULL)')
         else Qry.SQL.Add('AND CODICEGRUPPO4 = ' + G.FieldByName('CODICE4').AsString);
      if (G.FieldByName('CODICE5').AsInteger = -1) or (G.FieldByName('CODICE5').IsNull)
         then Qry.SQL.Add('AND (CODICEGRUPPO5 = -1 OR CODICEGRUPPO5 IS NULL)')
         else Qry.SQL.Add('AND CODICEGRUPPO5 = ' + G.FieldByName('CODICE5').AsString);
      if (G.FieldByName('CODICE6').AsInteger = -1) or (G.FieldByName('CODICE6').IsNull)
         then Qry.SQL.Add('AND (CODICEGRUPPO6 = -1 OR CODICEGRUPPO6 IS NULL)')
         else Qry.SQL.Add('AND CODICEGRUPPO6 = ' + G.FieldByName('CODICE6').AsString);
      Qry.SQL.Add('  AND USASCONTIGRUPPI = ''T''');
      Qry.SQL.Add('  AND ((NOT ARTICOLOCOMPOSTO = ''T'') OR ARTICOLOCOMPOSTO IS NULL)');
      // Esegue il tutto
      Qry.ExecSQL;
   finally
      Qry.Free;
      DM1.CloseWait;
   end;
end;
}
procedure TGruppiForm.AggiornaScontiArticoliDelGruppo(G:TIBOQuery);
var
   Qry : TIB_Cursor;
   Qry2 : TIB_Cursor;
   PrezzoDiVendita1, PrezzoDiVendita2, PrezzoDiVendita3, PrezzoDiVendita4,
   ImportoRicarico1, ImportoRicarico2, ImportoRicarico3, ImportoRicarico4,
   ScontoListino1, ScontoListino2, ScontoListino3, ScontoListino4,
   PrzVendIvaComp1, PrzVendIvaComp2, PrzVendIvaComp3, PrzVendIvaComp4,
   CostoReale, UltimoPrzAcquisto, BclSc1, BclSc2, BclSc3, ScontoGrp1, ScontoGrp2, ScontoGrp3: Double;
   TotalCounter, PartialCounter: Integer;
   UseTransaction: Boolean;
begin
  try
    // Avvia la transazione
    //  NB: Se è stato richiamato dall'anagrafica articoli oppure dall'anagrafica delle condizioni di vendita
    //       non usa la transazione altrimenti mi dava un errore di "Dataset non in Edit or Insert mode" poi alla
    //       successiva selezione del gruppo dall'interno dell'anagrafica chiamante.
    UseTransaction := (Tag <> 998) and (Tag <> 997);
    if UseTransaction then  DM1.DBAzienda.StartTransaction;
    // Visualizza il messaggio di operazione in corso e attende un pochino per farlo leggere
    DM1.ShowWait('Levante', 'Aggiorna mento degli sconti degli articoli del gruppo in corso...');
    Sleep(300);
    try
      DM1.ShowWait('', 'Inizializzazione...');
      // Inizializzazione
      TotalCounter := 0;
      PartialCounter := 0;
      Qry := TIB_Cursor.Create(Self);
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry2 := TIB_Cursor.Create(Self);
      Qry2.DatabaseName := DM1.ArcDBFile;
      Qry2.IB_Connection := DM1.DBAzienda;
      // Query che preleva l'elenco degli articoli da aggiornare, e cioè degli articoli
      //  facenti parte dello stesso gruppo.
      Qry.SQL.Add('SELECT A.CODICEARTICOLO, A.PREZZODILISTINO, A.SCONTODIACQUISTO, A.SCONTODIACQUISTO2, A.SCONTODIACQUISTO3,');
      Qry.SQL.Add(' A.RICARICO, A.RICARICO2, A.RICARICO3, A.RICARICO4, BCL_CONSIDERA_SCONTO1, BCL_CONSIDERA_SCONTO2, BCL_CONSIDERA_SCONTO3,');
      Qry.SQL.Add(' (SELECT AI.ALIQUOTAIVA FROM ALIQIVA AI WHERE AI.CODICEIVA = A.CODICEIVA) AS ALIQUOTAIVA');
      Qry.SQL.Add('FROM ARTICOLI A');
      Qry.SQL.Add('WHERE A.CODICEGRUPPO1 = ' + G.FieldByName('CODICE1').AsString);
      if (G.FieldByName('CODICE2').AsInteger = -1) or (G.FieldByName('CODICE2').IsNull)
         then Qry.SQL.Add('AND (A.CODICEGRUPPO2 = -1 OR A.CODICEGRUPPO2 IS NULL)')
         else Qry.SQL.Add('AND A.CODICEGRUPPO2 = ' + G.FieldByName('CODICE2').AsString);
      if (G.FieldByName('CODICE3').AsInteger = -1) or (G.FieldByName('CODICE3').IsNull)
         then Qry.SQL.Add('AND (A.CODICEGRUPPO3 = -1 OR A.CODICEGRUPPO3 IS NULL)')
         else Qry.SQL.Add('AND A.CODICEGRUPPO3 = ' + G.FieldByName('CODICE3').AsString);
      if (G.FieldByName('CODICE4').AsInteger = -1) or (G.FieldByName('CODICE4').IsNull)
         then Qry.SQL.Add('AND (A.CODICEGRUPPO4 = -1 OR A.CODICEGRUPPO4 IS NULL)')
         else Qry.SQL.Add('AND A.CODICEGRUPPO4 = ' + G.FieldByName('CODICE4').AsString);
      if (G.FieldByName('CODICE5').AsInteger = -1) or (G.FieldByName('CODICE5').IsNull)
         then Qry.SQL.Add('AND (A.CODICEGRUPPO5 = -1 OR A.CODICEGRUPPO5 IS NULL)')
         else Qry.SQL.Add('AND A.CODICEGRUPPO5 = ' + G.FieldByName('CODICE5').AsString);
      if (G.FieldByName('CODICE6').AsInteger = -1) or (G.FieldByName('CODICE6').IsNull)
         then Qry.SQL.Add('AND (A.CODICEGRUPPO6 = -1 OR A.CODICEGRUPPO6 IS NULL)')
         else Qry.SQL.Add('AND A.CODICEGRUPPO6 = ' + G.FieldByName('CODICE6').AsString);
      Qry.SQL.Add('  AND A.USASCONTIGRUPPI = ''T''');
      Qry.SQL.Add('  AND ((A.ARTICOLOCOMPOSTO <> ''T'') OR A.ARTICOLOCOMPOSTO IS NULL)');
      // Query che aggiorna l'articolo con i nuovi sconti e ricalcola anche gli altri campi
      Qry2.SQL.Add('UPDATE ARTICOLI SET');
      Qry2.SQL.Add(' COSTOREALE = :P_COSTOREALE,');
      Qry2.SQL.Add(' ULTIMOPRZACQUISTO = :P_ULTIMOPRZACQUISTO,');
      Qry2.SQL.Add(' SCONTODIACQUISTO  = :P_SCONTODIACQUISTO1,');
      Qry2.SQL.Add(' SCONTODIACQUISTO2 = :P_SCONTODIACQUISTO2,');
      Qry2.SQL.Add(' SCONTODIACQUISTO3 = :P_SCONTODIACQUISTO3,');
      Qry2.SQL.Add(' PREZZODIVENDITA  = :P_PREZZODIVENDITA1,');
      Qry2.SQL.Add(' PREZZODIVENDITA2 = :P_PREZZODIVENDITA2,');
      Qry2.SQL.Add(' PREZZODIVENDITA3 = :P_PREZZODIVENDITA3,');
      Qry2.SQL.Add(' PREZZODIVENDITA4 = :P_PREZZODIVENDITA4,');
      Qry2.SQL.Add(' IMPORTORICARICO  = :P_IMPORTORICARICO1,');
      Qry2.SQL.Add(' IMPORTORICARICO2 = :P_IMPORTORICARICO2,');
      Qry2.SQL.Add(' IMPORTORICARICO3 = :P_IMPORTORICARICO3,');
      Qry2.SQL.Add(' IMPORTORICARICO4 = :P_IMPORTORICARICO4,');
      Qry2.SQL.Add(' SCONTOLISTINO1 = :P_SCONTOLISTINO1,');
      Qry2.SQL.Add(' SCONTOLISTINO2 = :P_SCONTOLISTINO2,');
      Qry2.SQL.Add(' SCONTOLISTINO3 = :P_SCONTOLISTINO3,');
      Qry2.SQL.Add(' SCONTOLISTINO4 = :P_SCONTOLISTINO4,');
      Qry2.SQL.Add(' PRZVENDIVACOMP1 = :P_PRZVENDIVACOMP1,');
      Qry2.SQL.Add(' PRZVENDIVACOMP2 = :P_PRZVENDIVACOMP2,');
      Qry2.SQL.Add(' PRZVENDIVACOMP3 = :P_PRZVENDIVACOMP3,');
      Qry2.SQL.Add(' PRZVENDIVACOMP4 = :P_PRZVENDIVACOMP4');
      Qry2.SQL.Add('WHERE CODICEARTICOLO = :P_CODICEARTICOLO');
      // Provvede ad aprire l'elenco degli articoli facenti parte del gruppo appena modificato
      //  e con il flag che dice di usare gli sconti del gruppo.
      //  Poi cicla per tutti gli articoli trovati e li modifica
      DM1.ShowWait('', 'Apertura elenco articoli da aggiornare...');
      Qry.Open;
      while not Qry.Eof do begin
        Inc(TotalCounter);
        Inc(PartialCounter);
        if PartialCounter > 133 then begin
           DM1.ShowWait('', IntToStr(PartialCounter) + ' - Articoli elaborati...');
        end;
        // Carica su delle variabili locali gli sconti del gruppo defaultizzandoli a 0 (zero)
        if G.FieldByName('SCONTODIACQUISTO1').IsNull then ScontoGrp1 := 0 else ScontoGrp1 := G.FieldByName('SCONTODIACQUISTO1').AsFloat;
        if G.FieldByName('SCONTODIACQUISTO2').IsNull then ScontoGrp2 := 0 else ScontoGrp2 := G.FieldByName('SCONTODIACQUISTO2').AsFloat;
        if G.FieldByName('SCONTODIACQUISTO3').IsNull then ScontoGrp3 := 0 else ScontoGrp3 := G.FieldByName('SCONTODIACQUISTO3').AsFloat;
        // Imposta le variabili locali contenenti gli sconti di acquisto da utilizare
        //  per il calcolo del costo di acquisto per il calcolo dei listini di vendita
        //  NB: In queste variabili sono impostati solo gli sconti da considerare per il calcolo
        //       dei listini di vendita.
        if Qry.FieldByName('BCL_CONSIDERA_SCONTO1').AsString = 'T' then BclSc1 := ScontoGrp1  else BclSc1 := 0;
        if Qry.FieldByName('BCL_CONSIDERA_SCONTO2').AsString = 'T' then BclSc2 := ScontoGrp2  else BclSc2 := 0;
        if Qry.FieldByName('BCL_CONSIDERA_SCONTO3').AsString = 'T' then BclSc3 := ScontoGrp3  else BclSc3 := 0;
        // Calcola i nuovi valori da assegnare ai campi dell'articolo corrente
        CostoReale := DM1.CalcolaImportoScontato(Qry.FieldByName('PREZZODILISTINO').AsDouble, ScontoGrp1, ScontoGrp2, ScontoGrp3, DM1.DecMicroPrz);
        UltimoPrzAcquisto := DM1.CalcolaImportoScontato(Qry.FieldByName('PREZZODILISTINO').AsDouble, BclSc1, BclSc2, BclSc3, DM1.DecMicroPrz);
        PrezzoDiVendita1 := DM1.Arrotonda(UltimoPrzAcquisto * (100 + Qry.FieldByName('RICARICO').AsDouble) /100    , DM1.DecMicroPrz);
        PrezzoDiVendita2 := DM1.Arrotonda(UltimoPrzAcquisto * (100 + Qry.FieldByName('RICARICO2').AsDouble) /100   , DM1.DecMicroPrz);
        PrezzoDiVendita3 := DM1.Arrotonda(UltimoPrzAcquisto * (100 + Qry.FieldByName('RICARICO3').AsDouble) /100   , DM1.DecMicroPrz);
        PrezzoDiVendita4 := DM1.Arrotonda(UltimoPrzAcquisto * (100 + Qry.FieldByName('RICARICO4').AsDouble) /100   , DM1.DecMicroPrz);
        ImportoRicarico1 := PrezzoDiVendita1 - UltimoPrzAcquisto;
        ImportoRicarico2 := PrezzoDiVendita2 - UltimoPrzAcquisto;
        ImportoRicarico3 := PrezzoDiVendita3 - UltimoPrzAcquisto;
        ImportoRicarico4 := PrezzoDiVendita4 - UltimoPrzAcquisto;
        if Qry.FieldByName('PREZZODILISTINO').AsDouble <> 0 then begin
          ScontoListino1 := DM1.Arrotonda(   (Qry.FieldByName('PREZZODILISTINO').AsDouble - PrezzoDiVendita1) * 100 / Qry.FieldByName('PREZZODILISTINO').AsDouble   , 2);
          ScontoListino2 := DM1.Arrotonda(   (Qry.FieldByName('PREZZODILISTINO').AsDouble - PrezzoDiVendita2) * 100 / Qry.FieldByName('PREZZODILISTINO').AsDouble   , 2);
          ScontoListino3 := DM1.Arrotonda(   (Qry.FieldByName('PREZZODILISTINO').AsDouble - PrezzoDiVendita3) * 100 / Qry.FieldByName('PREZZODILISTINO').AsDouble   , 2);
          ScontoListino4 := DM1.Arrotonda(   (Qry.FieldByName('PREZZODILISTINO').AsDouble - PrezzoDiVendita4) * 100 / Qry.FieldByName('PREZZODILISTINO').AsDouble   , 2);
        end else begin
          ScontoListino1 := 0;
          ScontoListino2 := 0;
          ScontoListino3 := 0;
          ScontoListino4 := 0;
        end;
        PrzVendIvaComp1 := DM1.Arrotonda(PrezzoDiVendita1 * (100 + Qry.FieldByName('ALIQUOTAIVA').AsDouble) / 100   , DM1.DecMicroPrz);
        PrzVendIvaComp2 := DM1.Arrotonda(PrezzoDiVendita2 * (100 + Qry.FieldByName('ALIQUOTAIVA').AsDouble) / 100   , DM1.DecMicroPrz);
        PrzVendIvaComp3 := DM1.Arrotonda(PrezzoDiVendita3 * (100 + Qry.FieldByName('ALIQUOTAIVA').AsDouble) / 100   , DM1.DecMicroPrz);
        PrzVendIvaComp4 := DM1.Arrotonda(PrezzoDiVendita4 * (100 + Qry.FieldByName('ALIQUOTAIVA').AsDouble) / 100   , DM1.DecMicroPrz);
        // Aggiorna l'articolo attuale con i nuovi sconti di acquisto e i nuovi calcoli
        if not Qry2.Prepared then Qry2.Prepare;
        Qry2.Params.ParamByName('P_CODICEARTICOLO').AsString := Qry.FieldByName('CODICEARTICOLO').AsString;
        Qry2.Params.ParamByName('P_COSTOREALE').AsCurrency := CostoReale;
        Qry2.Params.ParamByName('P_ULTIMOPRZACQUISTO').AsCurrency := UltimoPrzAcquisto;
        Qry2.Params.ParamByName('P_SCONTODIACQUISTO1').AsDouble  := ScontoGrp1;
        Qry2.Params.ParamByName('P_SCONTODIACQUISTO2').AsDouble  := ScontoGrp2;
        Qry2.Params.ParamByName('P_SCONTODIACQUISTO3').AsDouble  := ScontoGrp3;
        Qry2.Params.ParamByName('P_PREZZODIVENDITA1').AsCurrency := PrezzoDiVendita1;
        Qry2.Params.ParamByName('P_PREZZODIVENDITA2').AsCurrency := PrezzoDiVendita2;
        Qry2.Params.ParamByName('P_PREZZODIVENDITA3').AsCurrency := PrezzoDiVendita3;
        Qry2.Params.ParamByName('P_PREZZODIVENDITA4').AsCurrency := PrezzoDiVendita4;
        Qry2.Params.ParamByName('P_IMPORTORICARICO1').AsCurrency := ImportoRicarico1;
        Qry2.Params.ParamByName('P_IMPORTORICARICO2').AsCurrency := ImportoRicarico2;
        Qry2.Params.ParamByName('P_IMPORTORICARICO3').AsCurrency := ImportoRicarico3;
        Qry2.Params.ParamByName('P_IMPORTORICARICO4').AsCurrency := ImportoRicarico4;
        Qry2.Params.ParamByName('P_SCONTOLISTINO1').AsDouble := ScontoListino1;
        Qry2.Params.ParamByName('P_SCONTOLISTINO2').AsDouble := ScontoListino2;
        Qry2.Params.ParamByName('P_SCONTOLISTINO3').AsDouble := ScontoListino3;
        Qry2.Params.ParamByName('P_SCONTOLISTINO4').AsDouble := ScontoListino4;
        Qry2.Params.ParamByName('P_PRZVENDIVACOMP1').AsCurrency := PrzVendIvaComp1;
        Qry2.Params.ParamByName('P_PRZVENDIVACOMP2').AsCurrency := PrzVendIvaComp2;
        Qry2.Params.ParamByName('P_PRZVENDIVACOMP3').AsCurrency := PrzVendIvaComp3;
        Qry2.Params.ParamByName('P_PRZVENDIVACOMP4').AsCurrency := PrzVendIvaComp4;
        Qry2.ExecSQL;
        // Avanti il prossimo
        Qry.Next;
      end;
      // Se tutto è andato bene conferma la transazione
      DM1.ShowWait('', 'Conferma variazioni...');
      if UseTransaction then DM1.DBAzienda.Commit;
    except
      // Rollback
      DM1.ShowWait('', 'Annullamento operazione...');
      if UseTransaction then DM1.DBAzienda.Rollback;
    end;
  finally
    DM1.CloseWait;
    if Assigned(Qry) then Qry.Free;
    if Assigned(Qry2) then Qry2.Free;
  end;
end;


function TGruppiForm.CanDeleteGruppo1(Cod1:Integer): Boolean;
var
   Qry:TIBOQuery;
begin
   Result := True;
   Qry := TIBOQuery.Create(Self);
   try
      // Query che controlla se ci sono sottogruppi del gruppo con codice ricevuto come parametro
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT COUNT(*) AS PRESENTI FROM GRUPPI WHERE CODICE1 = ' + IntToStr(Cod1));
      Qry.Open;
      if Qry.FieldByName('PRESENTI').AsInteger > 1 then Result := False;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;

function TGruppiForm.CanDeleteGruppo2(Cod1,Cod2:Integer): Boolean;
var
   Qry:TIBOQuery;
begin
   Result := True;
   Qry := TIBOQuery.Create(Self);
   try
      // Query che controlla se ci sono sottogruppi del gruppo con codice ricevuto come parametro
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT COUNT(*) AS PRESENTI FROM GRUPPI WHERE CODICE1 = ' + IntToStr(Cod1) + ' AND CODICE2 = ' + IntToStr(Cod2));
      Qry.Open;
      if Qry.FieldByName('PRESENTI').AsInteger > 1 then Result := False;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;

function TGruppiForm.CanDeleteGruppo3(Cod1,Cod2,Cod3:Integer): Boolean;
var
   Qry:TIBOQuery;
begin
   Result := True;
   Qry := TIBOQuery.Create(Self);
   try
      // Query che controlla se ci sono sottogruppi del gruppo con codice ricevuto come parametro
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT COUNT(*) AS PRESENTI FROM GRUPPI WHERE CODICE1 = ' + IntToStr(Cod1) + ' AND CODICE2 = ' + IntToStr(Cod2) + ' AND CODICE3 = ' + IntToStr(Cod3));
      Qry.Open;
      if Qry.FieldByName('PRESENTI').AsInteger > 1 then Result := False;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;

function TGruppiForm.CanDeleteGruppo4(Cod1,Cod2,Cod3,Cod4:Integer): Boolean;
var
   Qry:TIBOQuery;
begin
   Result := True;
   Qry := TIBOQuery.Create(Self);
   try
      // Query che controlla se ci sono sottogruppi del gruppo con codice ricevuto come parametro
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT COUNT(*) AS PRESENTI FROM GRUPPI WHERE CODICE1 = ' + IntToStr(Cod1) + ' AND CODICE2 = ' + IntToStr(Cod2) + ' AND CODICE3 = ' + IntToStr(Cod3) + ' AND CODICE4 = ' + IntToStr(Cod4));
      Qry.Open;
      if Qry.FieldByName('PRESENTI').AsInteger > 1 then Result := False;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;

function TGruppiForm.CanDeleteGruppo5(Cod1,Cod2,Cod3,Cod4,Cod5:Integer): Boolean;
var
   Qry:TIBOQuery;
begin
   Result := True;
   Qry := TIBOQuery.Create(Self);
   try
      // Query che controlla se ci sono sottogruppi del gruppo con codice ricevuto come parametro
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT COUNT(*) AS PRESENTI FROM GRUPPI WHERE CODICE1 = ' + IntToStr(Cod1) + ' AND CODICE2 = ' + IntToStr(Cod2) + ' AND CODICE3 = ' + IntToStr(Cod3) + ' AND CODICE4 = ' + IntToStr(Cod4) + ' AND CODICE5 = ' + IntToStr(Cod5));
      Qry.Open;
      if Qry.FieldByName('PRESENTI').AsInteger > 1 then Result := False;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;


function TGruppiForm.CalcolaPosizioneAltezzaPannelloAttivo(var P:TPanel): Integer;
const
  // Costanti per la visualizzazione dei pannelli.
  PANEL_SELECTED_HEIGHT = 30;
  PANEL_SEPARATOR = 5;
  LABEL_GRUPPO_FONT_SIZE_CURRENT = 72;
  LABEL_GRUPPO_FONT_SIZE_SELECTED = 20;
var
  PanelIndex:Integer;
begin
  // Caocola il PanelIndex (è l'ultimo carattere del nome)
  PanelIndex := StrToInt(RightStr(P.Name, 1));
  // Se il pannello che si sta elaborando è quello attivo...
  if PanelIndex = LivelloAttivo then begin

    P.Visible           := True;
    P.Enabled           := True;
    P.BevelOuter        := bvRaised;
    P.Top               := YY;
    P.Height            := ClientArea.Height - P.Top;
    (FindComponent('PanelSelezionato' + IntToStr(PanelIndex)) as TPanel).Visible := False;
    (FindComponent('LabelGruppo' + IntToStr(PanelIndex)) as TLabel).Color := COLOR_SUBPANEL_STEP_BG;
    (FindComponent('LabelGruppo' + IntToStr(PanelIndex)) as TLabel).Font.Color := COLOR_SUBPANEL_STEP_FONT;
    (FindComponent('LabelGruppo' + IntToStr(PanelIndex)) as TLabel).Font.Size := LABEL_GRUPPO_FONT_SIZE_CURRENT;
    (FindComponent('Grid' + IntToStr(PanelIndex)) as TcxGrid).Height := P.Height - 11;
    Inc(YY, (P.Height + PANEL_SEPARATOR));

  // Se invece si tratta di un pannello già selezionato...
  end else if PanelIndex < LivelloAttivo then begin

    // Gruppo disattivo
    P.Visible           := True;
    P.Enabled           := False;
    P.BevelOuter        := bvNone;
    P.Top               := YY;
    P.Height            := PANEL_SELECTED_HEIGHT;
    (FindComponent('LabelSelezionato' + IntToStr(PanelIndex)) as TLabel).Caption := (FindComponent('QryGruppo' + IntToStr(PanelIndex)) as TIBOQuery).FieldByName('Descrizione').AsString;
    (FindComponent('PanelSelezionato' + IntToStr(PanelIndex)) as TPanel).Align := alClient;
    (FindComponent('PanelSelezionato' + IntToStr(PanelIndex)) as TPanel).Visible := True;
    (FindComponent('LabelGruppo' + IntToStr(PanelIndex)) as TLabel).Color := COLOR_SUBPANEL_STEP_BG_SELECTED;
    (FindComponent('LabelGruppo' + IntToStr(PanelIndex)) as TLabel).Font.Color := COLOR_SUBPANEL_STEP_FONT_SELECTED;
    (FindComponent('LabelGruppo' + IntToStr(PanelIndex)) as TLabel).Font.Size := LABEL_GRUPPO_FONT_SIZE_SELECTED;
    Inc(YY, (P.Height + PANEL_SEPARATOR));

  // Altrimenti se è un pannello da non visualizzare...
  end else begin

    P.Visible := False;

  end;
end;


procedure TGruppiForm.RefreshScreen;
begin
   // Inizializzazione
   YY := 0;
   // Imposta la visualizzazione dei pannelli
   CalcolaPosizioneAltezzaPannelloAttivo(PanelGruppo1);
   CalcolaPosizioneAltezzaPannelloAttivo(PanelGruppo2);
   CalcolaPosizioneAltezzaPannelloAttivo(PanelGruppo3);
   CalcolaPosizioneAltezzaPannelloAttivo(PanelGruppo4);
   CalcolaPosizioneAltezzaPannelloAttivo(PanelGruppo5);
   CalcolaPosizioneAltezzaPannelloAttivo(PanelGruppo6);
   // Forza il painting della form
   Update;
end;


procedure TGruppiForm.EseguiQueryGruppo1;
begin
   // Imposta ed esegue la query che ritornerà i gruppi di primo livello
   if QryGruppo1.Active then QryGruppo1.Close;
   QryGruppo1.SQL.Clear;
   QryGruppo1.SQL.Add('SELECT * FROM GRUPPI WHERE');
   // Se la proprietà Tag della form > 0 significa che è stata richiamata per la selezione di un gruppo e quindi
   //  se la variabile SelezionatoX del gruppo è > -1 richiama solo tale gruppo
   if (Tag > 0)and(Selezionato1 > 0) then begin
      QryGruppo1.SQL.Add('    CODICE1 = ' + IntToStr(Selezionato1));
   // Altrimenti richiama tutti i gruppi di questo livello
   end else begin
      QryGruppo1.SQL.Add('    CODICE1 > 0');
   end;
   QryGruppo1.SQL.Add('AND CODICE2 = -1');
   QryGruppo1.SQL.Add('AND CODICE3 = -1');
   QryGruppo1.SQL.Add('AND CODICE4 = -1');
   QryGruppo1.SQL.Add('AND CODICE5 = -1');
   QryGruppo1.SQL.Add('AND CODICE6 = -1');
   QryGruppo1.SQL.Add('ORDER BY DESCRIZIONE');
   QryGruppo1.Open;
end;

procedure TGruppiForm.EseguiQueryGruppo2;
begin
   // Imposta ed esegue la query che ritornerà i gruppi di primo livello
   if QryGruppo2.Active then QryGruppo2.Close;
   QryGruppo2.SQL.Clear;
   QryGruppo2.SQL.Add('SELECT * FROM GRUPPI WHERE');
   QryGruppo2.SQL.Add('    CODICE1 = ' + IntToStr(Selezionato1));
   // Se la proprietà Tag della form > 0 significa che è stata richiamata per la selezione di un gruppo e quindi
   //  se la variabile SelezionatoX del gruppo è > -1 richiama solo tale gruppo
   if (Tag > 0)and(Selezionato2 > 0) then begin
      QryGruppo2.SQL.Add('AND CODICE2 = ' + IntToStr(Selezionato2));
   // Altrimenti richiama tutti i gruppi di questo livello
   end else begin
      QryGruppo2.SQL.Add('AND CODICE2 > 0');
   end;
   QryGruppo2.SQL.Add('AND CODICE3 = -1');
   QryGruppo2.SQL.Add('AND CODICE4 = -1');
   QryGruppo2.SQL.Add('AND CODICE5 = -1');
   QryGruppo2.SQL.Add('AND CODICE6 = -1');
   QryGruppo2.SQL.Add('ORDER BY DESCRIZIONE');
   QryGruppo2.Open;
end;

procedure TGruppiForm.EseguiQueryGruppo3;
begin
   // Imposta ed esegue la query che ritornerà i gruppi di primo livello
   if QryGruppo3.Active then QryGruppo3.Close;
   QryGruppo3.SQL.Clear;
   QryGruppo3.SQL.Add('SELECT * FROM GRUPPI WHERE');
   QryGruppo3.SQL.Add('    CODICE1 = ' + IntToStr(Selezionato1));
   QryGruppo3.SQL.Add('AND CODICE2 = ' + IntToStr(Selezionato2));
   // Se la proprietà Tag della form > 0 significa che è stata richiamata per la selezione di un gruppo e quindi
   //  se la variabile SelezionatoX del gruppo è > -1 richiama solo tale gruppo
   if (Tag > 0)and(Selezionato3 > 0) then begin
      QryGruppo3.SQL.Add('AND CODICE3 = ' + IntToStr(Selezionato3));
   // Altrimenti richiama tutti i gruppi di questo livello
   end else begin
      QryGruppo3.SQL.Add('AND CODICE3 > 0');
   end;
   QryGruppo3.SQL.Add('AND CODICE4 = -1');
   QryGruppo3.SQL.Add('AND CODICE5 = -1');
   QryGruppo3.SQL.Add('AND CODICE6 = -1');
   QryGruppo3.SQL.Add('ORDER BY DESCRIZIONE');
   QryGruppo3.Open;
end;

procedure TGruppiForm.EseguiQueryGruppo4;
begin
   // Imposta ed esegue la query che ritornerà i gruppi di primo livello
   if QryGruppo4.Active then QryGruppo4.Close;
   QryGruppo4.SQL.Clear;
   QryGruppo4.SQL.Add('SELECT * FROM GRUPPI WHERE');
   QryGruppo4.SQL.Add('    CODICE1 = ' + IntToStr(Selezionato1));
   QryGruppo4.SQL.Add('AND CODICE2 = ' + IntToStr(Selezionato2));
   QryGruppo4.SQL.Add('AND CODICE3 = ' + IntToStr(Selezionato3));
   // Se la proprietà Tag della form > 0 significa che è stata richiamata per la selezione di un gruppo e quindi
   //  se la variabile SelezionatoX del gruppo è > -1 richiama solo tale gruppo
   if (Tag > 0)and(Selezionato4 > 0) then begin
      QryGruppo4.SQL.Add('AND CODICE4 = ' + IntToStr(Selezionato4));
   // Altrimenti richiama tutti i gruppi di questo livello
   end else begin
      QryGruppo4.SQL.Add('AND CODICE4 > 0');
   end;
   QryGruppo4.SQL.Add('AND CODICE5 = -1');
   QryGruppo4.SQL.Add('AND CODICE6 = -1');
   QryGruppo4.SQL.Add('ORDER BY DESCRIZIONE');
   QryGruppo4.Open;
end;

procedure TGruppiForm.EseguiQueryGruppo5;
begin
   // Imposta ed esegue la query che ritornerà i gruppi di primo livello
   if QryGruppo5.Active then QryGruppo5.Close;
   QryGruppo5.SQL.Clear;
   QryGruppo5.SQL.Add('SELECT * FROM GRUPPI WHERE');
   QryGruppo5.SQL.Add('    CODICE1 = ' + IntToStr(Selezionato1));
   QryGruppo5.SQL.Add('AND CODICE2 = ' + IntToStr(Selezionato2));
   QryGruppo5.SQL.Add('AND CODICE3 = ' + IntToStr(Selezionato3));
   QryGruppo5.SQL.Add('AND CODICE4 = ' + IntToStr(Selezionato4));
   // Se la proprietà Tag della form > 0 significa che è stata richiamata per la selezione di un gruppo e quindi
   //  se la variabile SelezionatoX del gruppo è > -1 richiama solo tale gruppo
   if (Tag > 0)and(Selezionato5 > 0) then begin
      QryGruppo5.SQL.Add('AND CODICE5 = ' + IntToStr(Selezionato5));
   // Altrimenti richiama tutti i gruppi di questo livello
   end else begin
      QryGruppo5.SQL.Add('AND CODICE5 > 0');
   end;
   QryGruppo5.SQL.Add('AND CODICE6 = -1');
   QryGruppo5.SQL.Add('ORDER BY DESCRIZIONE');
   QryGruppo5.Open;
end;

procedure TGruppiForm.EseguiQueryGruppo6;
begin
   // Imposta ed esegue la query che ritornerà i gruppi di primo livello
   if QryGruppo6.Active then QryGruppo3.Close;
   QryGruppo6.SQL.Clear;
   QryGruppo6.SQL.Add('SELECT * FROM GRUPPI WHERE');
   QryGruppo6.SQL.Add('    CODICE1 = ' + IntToStr(Selezionato1));
   QryGruppo6.SQL.Add('AND CODICE2 = ' + IntToStr(Selezionato2));
   QryGruppo6.SQL.Add('AND CODICE3 = ' + IntToStr(Selezionato3));
   QryGruppo6.SQL.Add('AND CODICE4 = ' + IntToStr(Selezionato4));
   QryGruppo6.SQL.Add('AND CODICE5 = ' + IntToStr(Selezionato5));
   QryGruppo6.SQL.Add('AND CODICE6 > 0');
   QryGruppo6.SQL.Add('ORDER BY DESCRIZIONE');
   QryGruppo6.Open;
end;


procedure TGruppiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;

   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBImpostazioni.Down := False;
   // Il puntatore alla form := nil
   GruppiForm := nil;
end;

procedure TGruppiForm.FormCreate(Sender: TObject);
begin
   // Default di alcuni valori
   Selezionato1  := -1;
   Selezionato2  := -1;
   Selezionato3  := -1;
   Selezionato4  := -1;
   Selezionato5  := -1;
   LivelloAttivo := 1;

   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);

   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(GruppiForm, COLOR_NORMALE);

   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Gruppi, sottogruppi...)';

   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;
   PanelGruppo3.Color := COLOR_SUBPANEL_BG;
   PanelGruppo4.Color := COLOR_SUBPANEL_BG;
   PanelGruppo5.Color := COLOR_SUBPANEL_BG;
   PanelGruppo6.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo3.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo4.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo5.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo6.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo3.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo4.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo5.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo6.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   PanelSelezionato1.Color := COLOR_SUBPANEL_BG_SELECTED;
   PanelSelezionato2.Color := COLOR_SUBPANEL_BG_SELECTED;
   PanelSelezionato3.Color := COLOR_SUBPANEL_BG_SELECTED;
   PanelSelezionato4.Color := COLOR_SUBPANEL_BG_SELECTED;
   PanelSelezionato5.Color := COLOR_SUBPANEL_BG_SELECTED;

   LabelSelezionato1.Font.Color := COLOR_SUBPANEL_LABEL_FONT_SELECTED;
   LabelSelezionato2.Font.Color := COLOR_SUBPANEL_LABEL_FONT_SELECTED;
   LabelSelezionato3.Font.Color := COLOR_SUBPANEL_LABEL_FONT_SELECTED;
   LabelSelezionato4.Font.Color := COLOR_SUBPANEL_LABEL_FONT_SELECTED;
   LabelSelezionato5.Font.Color := COLOR_SUBPANEL_LABEL_FONT_SELECTED;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TGruppiForm.FormShow(Sender: TObject);
begin
   DM1.FocusRefresh;
   // Se Tag della form > 0 apre anche le query dei gruppi precedenti a quello attivo in modo da
   //  visualizzarne la descrizione.
   if Tag > 0 then begin
      if LivelloAttivo > 1 then EseguiQueryGruppo1;
      if LivelloAttivo > 2 then EseguiQueryGruppo2;
      if LivelloAttivo > 3 then EseguiQueryGruppo3;
      if LivelloAttivo > 4 then EseguiQueryGruppo4;
      if LivelloAttivo > 5 then EseguiQueryGruppo5;
   end;
   // Popola la griglia
   RxSpeedButtonTrovaClick(Self);
   // Aggiorna lo schermo
   RefreshScreen;
end;

procedure TGruppiForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se Tag della form > 0 esce dalla selezione senza selezionare nulla.
   if Tag > 0 then begin
      Close;
   // Se invece è una sessione normale...
   end else begin
      // IN base al livello attivo, torna al livello precedente oppure esce dalla form
      case LivelloAttivo of
         1:begin
            Close;
         end;
         2:begin
            Selezionato1  := -1;           // Deseleziona
            LivelloAttivo := 1;            // Torna al livello precedente
            QryGruppo2.Close;              // Chiude la query del gruppo
            RefreshScreen;                 // Aggiorna lo schermo
         end;
         3:begin
            Selezionato2  := -1;           // Deseleziona
            LivelloAttivo := 2;            // Torna al livello precedente
            QryGruppo3.Close;              // Chiude la query del gruppo
            RefreshScreen;                 // Aggiorna lo schermo
         end;
         4:begin
            Selezionato3  := -1;           // Deseleziona
            LivelloAttivo := 3;            // Torna al livello precedente
            QryGruppo4.Close;              // Chiude la query del gruppo
            RefreshScreen;                 // Aggiorna lo schermo
         end;
         5:begin
            Selezionato4  := -1;           // Deseleziona
            LivelloAttivo := 4;            // Torna al livello precedente
            QryGruppo5.Close;              // Chiude la query del gruppo
            RefreshScreen;                 // Aggiorna lo schermo
         end;
         6:begin
            Selezionato5  := -1;                           // Deseleziona
            LivelloAttivo := 5;                            // Torna al livello precedente
            QryGruppo6.Close;                              // Chiude la query del gruppo
            RefreshScreen;                                 // Aggiorna lo schermo
            RxSpeedButtonVisualizza.Enabled := True;       // Riattiva il pulsante visualizza
         end;
      end;
   end;
end;

procedure TGruppiForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   // In base al livello attivo esegue la query opportuna
   case LivelloAttivo of
      // Gruppo1
      1: begin
         EseguiQueryGruppo1;
         Grid1.SetFocus;
      end;
      // Gruppo2
      2: begin
         EseguiQueryGruppo2;
         Grid2.SetFocus;
      end;
      // Gruppo3
      3: begin
         EseguiQueryGruppo3;
         Grid3.SetFocus;
      end;
      // Gruppo4
      4: begin
         EseguiQueryGruppo4;
         Grid4.SetFocus;
      end;
      // Gruppo5
      5: begin
         EseguiQueryGruppo5;
         Grid5.SetFocus;
      end;
      // Gruppo6
      6: begin
         EseguiQueryGruppo6;
         Grid6.SetFocus;
      end;
   end;
   DM1.ChiudiAttendere;
end;


procedure TGruppiForm.ValoriDefault(Qry:TIBOQuery);
begin
   // Controlla che alcuni valori non rimangano nulli (altrimenti causerebbero dei problemi)
   //  ed eventualmente li inizializza con valori di default.
   // --------------------------------------------------------------------------------------
   // Controlla che gli sconti di acquisto non rimangano nulli ed eventualmente li inizializza a 0 (zero)
   if Qry.FieldByName('ScontoDiAcquisto1').IsNull then Qry.FieldByName('ScontoDiAcquisto1').Value := 0;
   if Qry.FieldByName('ScontoDiAcquisto2').IsNull then Qry.FieldByName('ScontoDiAcquisto2').Value := 0;
   if Qry.FieldByName('ScontoDiAcquisto3').IsNull then Qry.FieldByName('ScontoDiAcquisto3').Value := 0;
end;


procedure TGruppiForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // Se la query non è attiva esce
     case LivelloAttivo of
        1: begin if not QryGruppo1.Active then begin RxSpeedModifica.Down := False; Exit; end; end;
        2: begin if not QryGruppo2.Active then begin RxSpeedModifica.Down := False; Exit; end; end;
        3: begin if not QryGruppo3.Active then begin RxSpeedModifica.Down := False; Exit; end; end;
        4: begin if not QryGruppo4.Active then begin RxSpeedModifica.Down := False; Exit; end; end;
        5: begin if not QryGruppo5.Active then begin RxSpeedModifica.Down := False; Exit; end; end;
        6: begin if not QryGruppo6.Active then begin RxSpeedModifica.Down := False; Exit; end; end;
     end;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi, in base al livello attivo al momento
          case LivelloAttivo of
             1:begin
                QryGruppo1.Edit;
                Grid1.Visible                   := False;
                PanelAnag1.Visible              := True;
                Descrizione1.SetFocus;
             end;
             2:begin
                QryGruppo2.Edit;
                Grid2.Visible                   := False;
                PanelAnag2.Visible              := True;
                Descrizione2.SetFocus;
             end;
             3:begin
                QryGruppo3.Edit;
                Grid3.Visible                   := False;
                PanelAnag3.Visible              := True;
                Descrizione3.SetFocus;
             end;
             4:begin
                QryGruppo4.Edit;
                Grid4.Visible                   := False;
                PanelAnag4.Visible              := True;
                Descrizione4.SetFocus;
             end;
             5:begin
                QryGruppo5.Edit;
                Grid5.Visible                   := False;
                PanelAnag5.Visible              := True;
                Descrizione5.SetFocus;
             end;
             6:begin
                QryGruppo6.Edit;
                Grid6.Visible                   := False;
                PanelAnag6.Visible              := True;
                Descrizione6.SetFocus;
             end;
          end;
          // Colore di modifica dei campi
          DM1.ColoraTuttiCampi(GruppiForm, COLOR_MODIFICA);
          // Aggiorna lo stato dei pulsanti
          RxSpeedButtonNuovo.Enabled         := False;
          RxSpeedButtonElimina.Enabled       := False;
          RxSpeedButtonUscita.Enabled        := False;
//          RxSpeedButtonTrova.Enabled         := False;
          RxSpeedButtonVisualizza.Enabled    := False;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end else begin
        // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Disabilita la modifica dei campi
          case LivelloAttivo of
             1: QryGruppo1.Edit;
             2: QryGruppo2.Edit;
             3: QryGruppo3.Edit;
             4: QryGruppo4.Edit;
             5: QryGruppo5.Edit;
             6: QryGruppo6.Edit;
          end;
          // ---------------------------------------------------------------------------------------------
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
             case LivelloAttivo of
                1:begin
                   QryGruppo1.Edit;
                   if QryGruppo1.FieldByName('CODICE1').IsNull then QryGruppo1.FieldByName('CODICE1').Value := DM1.NextCodice('GRUPPI', 'CODICE1', 999);
                   // Defaultizza gli eventuali sconti nulli
                   ValoriDefault(QryGruppo1);
                   // Post
                   QryGruppo1.Post; QryGruppo1.ApplyUpdates; QryGruppo1.CommitUpdates;
                   // Aggiorna fli sconti degli articoli del gruppo
                   AggiornaScontiArticoliDelGruppo(QryGruppo1);
                end;
                2:begin
                   QryGruppo2.Edit;
                   if QryGruppo2.FieldByName('CODICE2').IsNull then QryGruppo2.FieldByName('CODICE2').Value := DM1.NextCodice('GRUPPI', 'CODICE2', 999);
                   // Defaultizza gli eventuali sconti nulli
                   ValoriDefault(QryGruppo2);
                   // Post
                   QryGruppo2.Post; QryGruppo2.ApplyUpdates; QryGruppo2.CommitUpdates;
                   // Aggiorna fli sconti degli articoli del gruppo
                   AggiornaScontiArticoliDelGruppo(QryGruppo2);
                end;
                3:begin
                   QryGruppo3.Edit;
                   if QryGruppo3.FieldByName('CODICE3').IsNull then QryGruppo3.FieldByName('CODICE3').Value := DM1.NextCodice('GRUPPI', 'CODICE3', 999);
                   // Defaultizza gli eventuali sconti nulli
                   ValoriDefault(QryGruppo3);
                   // Post
                   QryGruppo3.Post; QryGruppo3.ApplyUpdates; QryGruppo3.CommitUpdates;
                   // Aggiorna fli sconti degli articoli del gruppo
                   AggiornaScontiArticoliDelGruppo(QryGruppo3);
                end;
                4:begin
                   QryGruppo4.Edit;
                   if QryGruppo4.FieldByName('CODICE4').IsNull then QryGruppo4.FieldByName('CODICE4').Value := DM1.NextCodice('GRUPPI', 'CODICE4', 999);
                   // Defaultizza gli eventuali sconti nulli
                   ValoriDefault(QryGruppo4);
                   // Post
                   QryGruppo4.Post; QryGruppo4.ApplyUpdates; QryGruppo4.CommitUpdates;
                   // Aggiorna fli sconti degli articoli del gruppo
                   AggiornaScontiArticoliDelGruppo(QryGruppo4);
                end;
                5:begin
                   QryGruppo5.Edit;
                   if QryGruppo5.FieldByName('CODICE5').IsNull then QryGruppo5.FieldByName('CODICE5').Value := DM1.NextCodice('GRUPPI', 'CODICE5', 999);
                   // Defaultizza gli eventuali sconti nulli
                   ValoriDefault(QryGruppo5);
                   // Post
                   QryGruppo5.Post; QryGruppo5.ApplyUpdates; QryGruppo5.CommitUpdates;
                   // Aggiorna fli sconti degli articoli del gruppo
                   AggiornaScontiArticoliDelGruppo(QryGruppo5);
                end;
                6:begin
                   QryGruppo6.Edit;
                   if QryGruppo6.FieldByName('CODICE6').IsNull then QryGruppo6.FieldByName('CODICE6').Value := DM1.NextCodice('GRUPPI', 'CODICE6', 999);
                   // Defaultizza gli eventuali sconti nulli
                   ValoriDefault(QryGruppo6);
                   // Post
                   QryGruppo6.Post; QryGruppo6.ApplyUpdates; QryGruppo6.CommitUpdates;
                   // Aggiorna fli sconti degli articoli del gruppo
                   AggiornaScontiArticoliDelGruppo(QryGruppo6);
                end;
             end;
          end else if MR = mrNo then begin
             case LivelloAttivo of
                1:begin QryGruppo1.Cancel; QryGruppo1.CommitUpdates; end;
                2:begin QryGruppo2.Cancel; QryGruppo2.CommitUpdates; end;
                3:begin QryGruppo3.Cancel; QryGruppo3.CommitUpdates; end;
                4:begin QryGruppo4.Cancel; QryGruppo4.CommitUpdates; end;
                5:begin QryGruppo5.Cancel; QryGruppo5.CommitUpdates; end;
                6:begin QryGruppo6.Cancel; QryGruppo6.CommitUpdates; end;
             end;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;
          // ---------------------------------------------------------------------------------------------
          // Se non metto questa riga me dà errore
          Application.ProcessMessages;
          // Controlli al loro colore non editabile
          case LivelloAttivo of
             1:begin
                PanelAnag1.Visible                 := False;
                Grid1.Visible                      := True;
                Grid1.SetFocus;
             end;
             2:begin
                PanelAnag2.Visible                 := False;
                Grid2.Visible                      := True;
                Grid2.SetFocus;
             end;
             3:begin
                PanelAnag3.Visible                 := False;
                Grid3.Visible                      := True;
                Grid3.SetFocus;
             end;
             4:begin
                PanelAnag4.Visible                 := False;
                Grid4.Visible                      := True;
                Grid4.SetFocus;
             end;
             5:begin
                PanelAnag5.Visible                 := False;
                Grid5.Visible                      := True;
                Grid5.SetFocus;
             end;
             6:begin
                PanelAnag6.Visible                 := False;
                Grid6.Visible                      := True;
                Grid6.SetFocus;
             end;
          end;
          // Aggiorna lo stato dei pulsanti
          RxSpeedButtonNuovo.Enabled         := True;
          RxSpeedButtonElimina.Enabled       := True;
          RxSpeedButtonUscita.Enabled        := True;
//          RxSpeedButtonTrova.Enabled         := True;
          RxSpeedButtonVisualizza.Enabled    := True;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               case LivelloAttivo of
                  1: QryGruppo1.Edit;
                  2: QryGruppo1.Edit;
                  3: QryGruppo1.Edit;
                  4: QryGruppo4.Edit;
                  5: QryGruppo5.Edit;
                  6: QryGruppo6.Edit;
               end;
          end;
       end;
     end;
end;

procedure TGruppiForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // In base al livello attivo si comporta di conseguenza
   case LivelloAttivo of
      1:begin
         PanelAnag1.Visible := True;
         Descrizione1.SetFocus;   // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)
         // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
         if not QryGruppo1.Active then begin
            QryGruppo1.Close;
            QryGruppo1.SQL.Clear;
            QryGruppo1.SQL.Add('SELECT CODICE1,DESCRIZIONE FROM GRUPPI WHERE CODICE = -99999');
            QryGruppo1.Open;
         end;
         QryGruppo1.Append;
         QryGruppo1.FieldByName('Codice2').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo1.FieldByName('Codice3').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo1.FieldByName('Codice4').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo1.FieldByName('Codice5').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo1.FieldByName('Codice6').Value := -1;   // Valore di default dei codici di livello successivi al suo
      end;
      2:begin
         PanelAnag2.Visible := True;
         Descrizione2.SetFocus;   // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)
         // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
         if not QryGruppo2.Active then begin
            QryGruppo2.Close;
            QryGruppo2.SQL.Clear;
            QryGruppo2.SQL.Add('SELECT CODICE1,DESCRIZIONE FROM GRUPPI WHERE CODICE = -99999');
            QryGruppo2.Open;
         end;
         QryGruppo2.Append;
         QryGruppo2.FieldByName('Codice1').Value := Selezionato1;   // Valore di default dei codici di livello precedente al suo
         QryGruppo2.FieldByName('Codice3').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo2.FieldByName('Codice4').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo2.FieldByName('Codice5').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo2.FieldByName('Codice6').Value := -1;   // Valore di default dei codici di livello successivi al suo
      end;
      3:begin
         PanelAnag3.Visible := True;
         Descrizione3.SetFocus;   // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)
         // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
         if not QryGruppo3.Active then begin
            QryGruppo3.Close;
            QryGruppo3.SQL.Clear;
            QryGruppo3.SQL.Add('SELECT CODICE1,DESCRIZIONE FROM GRUPPI WHERE CODICE = -99999');
            QryGruppo3.Open;
         end;
         QryGruppo3.Append;
         QryGruppo3.FieldByName('Codice1').Value := Selezionato1;   // Valore di default dei codici di livello precedente al suo
         QryGruppo3.FieldByName('Codice2').Value := Selezionato2;   // Valore di default dei codici di livello precedente al suo
         QryGruppo3.FieldByName('Codice4').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo3.FieldByName('Codice5').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo3.FieldByName('Codice6').Value := -1;   // Valore di default dei codici di livello successivi al suo
      end;
      4:begin
         PanelAnag4.Visible := True;
         Descrizione4.SetFocus;   // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)
         // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
         if not QryGruppo4.Active then begin
            QryGruppo4.Close;
            QryGruppo4.SQL.Clear;
            QryGruppo4.SQL.Add('SELECT CODICE1,DESCRIZIONE FROM GRUPPI WHERE CODICE = -99999');
            QryGruppo4.Open;
         end;
         QryGruppo4.Append;
         QryGruppo4.FieldByName('Codice1').Value := Selezionato1;   // Valore di default dei codici di livello precedente al suo
         QryGruppo4.FieldByName('Codice2').Value := Selezionato2;   // Valore di default dei codici di livello precedente al suo
         QryGruppo4.FieldByName('Codice3').Value := Selezionato3;   // Valore di default dei codici di livello precedente al suo
         QryGruppo4.FieldByName('Codice5').Value := -1;   // Valore di default dei codici di livello successivi al suo
         QryGruppo4.FieldByName('Codice6').Value := -1;   // Valore di default dei codici di livello successivi al suo
      end;
      5:begin
         PanelAnag5.Visible := True;
         Descrizione5.SetFocus;   // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)
         // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
         if not QryGruppo5.Active then begin
            QryGruppo5.Close;
            QryGruppo5.SQL.Clear;
            QryGruppo5.SQL.Add('SELECT CODICE1,DESCRIZIONE FROM GRUPPI WHERE CODICE = -99999');
            QryGruppo5.Open;
         end;
         QryGruppo5.Append;
         QryGruppo5.FieldByName('Codice1').Value := Selezionato1;   // Valore di default dei codici di livello precedente al suo
         QryGruppo5.FieldByName('Codice2').Value := Selezionato2;   // Valore di default dei codici di livello precedente al suo
         QryGruppo5.FieldByName('Codice3').Value := Selezionato3;   // Valore di default dei codici di livello precedente al suo
         QryGruppo5.FieldByName('Codice4').Value := Selezionato4;   // Valore di default dei codici di livello precedente al suo
         QryGruppo5.FieldByName('Codice6').Value := -1;   // Valore di default dei codici di livello successivi al suo
      end;
      6:begin
         PanelAnag6.Visible := True;
         Descrizione6.SetFocus;   // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)
         // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
         if not QryGruppo6.Active then begin
            QryGruppo6.Close;
            QryGruppo6.SQL.Clear;
            QryGruppo6.SQL.Add('SELECT CODICE1,DESCRIZIONE FROM GRUPPI WHERE CODICE = -99999');
            QryGruppo6.Open;
         end;
         QryGruppo6.Append;
         QryGruppo6.FieldByName('Codice1').Value := Selezionato1;   // Valore di default dei codici di livello precedente al suo
         QryGruppo6.FieldByName('Codice2').Value := Selezionato2;   // Valore di default dei codici di livello precedente al suo
         QryGruppo6.FieldByName('Codice3').Value := Selezionato3;   // Valore di default dei codici di livello precedente al suo
         QryGruppo6.FieldByName('Codice4').Value := Selezionato4;   // Valore di default dei codici di livello precedente al suo
         QryGruppo6.FieldByName('Codice5').Value := Selezionato5;   // Valore di default dei codici di livello precedente al suo
      end;
   end;
   // Pone il nuovo record in modofica
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TGruppiForm.RxSpeedButtonEliminaClick(Sender: TObject);
var
   CodToDel:Integer;
begin
  // CodToDel Contiene il codice del gruppo da eliminare
  CodToDel := 0;
  case LivelloAttivo of
     1: CodToDel := QryGruppo1.FieldByName('Codice1').AsInteger;
     2: CodToDel := QryGruppo2.FieldByName('Codice2').AsInteger;
     3: CodToDel := QryGruppo3.FieldByName('Codice3').AsInteger;
     4: CodToDel := QryGruppo4.FieldByName('Codice4').AsInteger;
     5: CodToDel := QryGruppo5.FieldByName('Codice5').AsInteger;
     6: CodToDel := QryGruppo6.FieldByName('Codice6').AsInteger;
  end;
  // Chiede prima conferma
  MessageBeep(0);
  if MessageDlg('Vuoi veramente eliminare il gruppo?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
     MessageBeep(0);
     if MessageDlg('Sei sicuro/a ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
        MessageBeep(0);
        if MessageDlg('A T T E N Z I O N E !!!'#13#13'L''eliminazione del gruppo potrebbe causare problemi.'#13'Prima di continuare si consiglia di effettuare una copia di sicurezza dell''azienda.'#13#13'Continuare ugualmente con l''eliminazione?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
           // In base al livello attivo...
           case LivelloAttivo of
              1:begin
                 // Prima controlla che il gruppo non abbia sottogruppi, altrimenti non permette l'operazione
                 if CanDeleteGruppo1(CodToDel) then begin
                    QryGruppo1.Delete;
                    QryGruppo1.ApplyUpdates;
                    QryGruppo1.CommitUpdates;
                 end else begin
                    MessageDlg('Il gruppo che si vuole eliminare possiede ancora dei sottogruppi in archivio.'#13'Prima di poterlo cancellare sarà necessario rimuovere tutti i relativi sottogruppi.', mtInformation, [mbOk, mbNo], 0);
                 end;
              end;
              2:begin
                 // Prima controlla che il gruppo non abbia sottogruppi, altrimenti non permette l'operazione
                 if CanDeleteGruppo2(Selezionato1, CodToDel) then begin
                    QryGruppo2.Delete;
                    QryGruppo2.ApplyUpdates;
                    QryGruppo2.CommitUpdates;
                 end else begin
                    MessageDlg('Il gruppo che si vuole eliminare possiede ancora dei sottogruppi in archivio.'#13'Prima di poterlo cancellare sarà necessario rimuovere tutti i relativi sottogruppi.', mtInformation, [mbOk, mbNo], 0);
                 end;
              end;
              3:begin
                 // Prima controlla che il gruppo non abbia sottogruppi, altrimenti non permette l'operazione
                 if CanDeleteGruppo3(Selezionato1, Selezionato2, CodToDel) then begin
                    QryGruppo3.Delete;
                    QryGruppo3.ApplyUpdates;
                    QryGruppo3.CommitUpdates;
                 end else begin
                    MessageDlg('Il gruppo che si vuole eliminare possiede ancora dei sottogruppi in archivio.'#13'Prima di poterlo cancellare sarà necessario rimuovere tutti i relativi sottogruppi.', mtInformation, [mbOk, mbNo], 0);
                 end;
              end;
              4:begin
                 // Prima controlla che il gruppo non abbia sottogruppi, altrimenti non permette l'operazione
                 if CanDeleteGruppo4(Selezionato1, Selezionato2, Selezionato3, CodToDel) then begin
                    QryGruppo4.Delete;
                    QryGruppo4.ApplyUpdates;
                    QryGruppo4.CommitUpdates;
                 end else begin
                    MessageDlg('Il gruppo che si vuole eliminare possiede ancora dei sottogruppi in archivio.'#13'Prima di poterlo cancellare sarà necessario rimuovere tutti i relativi sottogruppi.', mtInformation, [mbOk, mbNo], 0);
                 end;
              end;
              5:begin
                 // Prima controlla che il gruppo non abbia sottogruppi, altrimenti non permette l'operazione
                 if CanDeleteGruppo5(Selezionato1, Selezionato2, Selezionato3, Selezionato4, CodToDel) then begin
                    QryGruppo5.Delete;
                    QryGruppo5.ApplyUpdates;
                    QryGruppo5.CommitUpdates;
                 end else begin
                    MessageDlg('Il gruppo che si vuole eliminare possiede ancora dei sottogruppi in archivio.'#13'Prima di poterlo cancellare sarà necessario rimuovere tutti i relativi sottogruppi.', mtInformation, [mbOk, mbNo], 0);
                 end;
              end;
              6:begin
                 // Prima controlla che il gruppo non abbia sottogruppi, altrimenti non permette l'operazione
//                 if CanDeleteGruppo6(CodToDel) then begin
                    QryGruppo6.Delete;
                    QryGruppo6.ApplyUpdates;
                    QryGruppo6.CommitUpdates;
//                 end else begin
//                    MessageDlg('Il gruppo che si vuole eliminare possiede ancora dei sottogruppi in archivio.'#13'Prima di poterlo cancellare sarà necessario rimuovere tutti i relativi sottogruppi.', mtInformation, [mbOk, mbNo], 0);
//                 end;
              end;
           end;
        end;
     end;
  end;
end;

procedure TGruppiForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
   // In base al livello attivo seleziona il gruppo corrente e passa al livello successivo
   case LivelloAttivo of
      1:begin
         if not QryGruppo1.Eof then begin                                  // Solo se c'è un record da selezionare
            Selezionato1  := QryGruppo1.FieldByName('Codice1').AsInteger;  // Seleziona
            LivelloAttivo := 2;                                            // Attiva il livello successivo
            RefreshScreen;                                                 // Aggiorna lo schermo
            RxSpeedButtonTrovaClick(Self);                                 // Esegue la query del nuovo gruppo attivo
         end;
      end;
      2:begin
         if not QryGruppo2.Eof then begin                                  // Solo se c'è un record da selezionare
            Selezionato2  := QryGruppo2.FieldByName('Codice2').AsInteger;  // Seleziona
            LivelloAttivo := 3;                                            // Attiva il livello successivo
            RefreshScreen;                                                 // Aggiorna lo schermo
            RxSpeedButtonTrovaClick(Self);                                 // Esegue la query del nuovo gruppo attivo
         end;
      end;
      3:begin
         if not QryGruppo3.Eof then begin                                  // Solo se c'è un record da selezionare
            Selezionato3  := QryGruppo3.FieldByName('Codice3').AsInteger;  // Seleziona
            LivelloAttivo := 4;                                            // Attiva il livello successivo
            RefreshScreen;                                                 // Aggiorna lo schermo
            RxSpeedButtonTrovaClick(Self);                                 // Esegue la query del nuovo gruppo attivo
         end;
      end;
      4:begin
         if not QryGruppo4.Eof then begin                                  // Solo se c'è un record da selezionare
            Selezionato4  := QryGruppo4.FieldByName('Codice4').AsInteger;  // Seleziona
            LivelloAttivo := 5;                                            // Attiva il livello successivo
            RefreshScreen;                                                 // Aggiorna lo schermo
            RxSpeedButtonTrovaClick(Self);                                 // Esegue la query del nuovo gruppo attivo
         end;
      end;
      5:begin
         if not QryGruppo5.Eof then begin                                  // Solo se c'è un record da selezionare
            Selezionato5  := QryGruppo5.FieldByName('Codice5').AsInteger;  // Seleziona
            LivelloAttivo := 6;                                            // Attiva il livello successivo
            RefreshScreen;                                                 // Aggiorna lo schermo
            RxSpeedButtonTrovaClick(Self);                                 // Esegue la query del nuovo gruppo attivo
            RxSpeedButtonVisualizza.Enabled := False;                      // Disabilita il pulsante visualizza in quanto non ci sono ulteriori livelli
         end;
      end;
   end;
end;

procedure TGruppiForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

      // F2 = Modifica
      113: begin
         if RxSpeedModifica.Enabled then begin
            RxSpeedModifica.Down := not RxSpeedModifica.Down;
            RxSpeedModificaClick(Self);
         end;
      end;

      // F3 = Nuovo
      114: begin
         if RxSpeedButtonNuovo.Enabled then begin
            RxSpeedButtonNuovoClick(Self);
         end;
      end;

      // F3 = Elimina
      115: begin
         if RxSpeedButtonElimina.Enabled then begin
            RxSpeedButtonEliminaClick(Self);
         end;
      end;

      // F10 = Visualizza
      121: begin
         if RxSpeedButtonVisualizza.Enabled then begin
            RxSpeedButtonVisualizzaClick(Self);
         end;
      end;

   end;
end;

procedure TGruppiForm.QryGruppo1BeforePost(DataSet: TDataSet);
begin
   // Marca il record come modificato
   DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
end;

procedure TGruppiForm.Descrizione1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TGruppiForm.Descrizione1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TGruppiForm.tvList1DblClick(Sender: TObject);
begin
   // Se la proprietà Tag della form = 0 vuol dire che è una sessione normale e quindi passa al livello successivo
   if Tag = 0 then begin
      // Se LivelloAttivo < 6 (Ultimo livello possibile) passa al livello successivo
      if LivelloAttivo < 6 then RxSpeedButtonVisualizzaClick(Self);
   // Altrimenti significa che si una sessione di selezione e quindi compila il controllo coretto in base al valore di LivelloAttivo
   //  e del valore del Tag della form
   end else begin
      // In base al valore del Tag della form identifica il chiamante
      case Tag of
         // Chiamante ---> FILTRI DEL GIORNALE DI MAGAZZINO
         999:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  ClientiForm.GMCodiceGruppo1.Text := ' ' + QryGruppo1.FieldByName('Codice1').AsString;
                  ClientiForm.GMDescGruppo1.Text   := ' ' + QryGruppo1.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.GMCodiceGruppo2.Text := '';
                  ClientiForm.GMDescGruppo2.Text   := '';
                  ClientiForm.GMCodiceGruppo3.Text := '';
                  ClientiForm.GMDescGruppo3.Text   := '';
                  ClientiForm.GMCodiceGruppo4.Text := '';
                  ClientiForm.GMDescGruppo4.Text   := '';
                  ClientiForm.GMCodiceGruppo5.Text := '';
                  ClientiForm.GMDescGruppo5.Text   := '';
                  ClientiForm.GMCodiceGruppo6.Text := '';
                  ClientiForm.GMDescGruppo6.Text   := '';
                  Close;
                  ClientiForm.GMCodiceGruppo1.SetFocus;
               end;
               2:begin
                  ClientiForm.GMCodiceGruppo2.Text := ' ' + QryGruppo2.FieldByName('Codice2').AsString;
                  ClientiForm.GMDescGruppo2.Text   := ' ' + QryGruppo2.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.GMCodiceGruppo3.Text := '';
                  ClientiForm.GMDescGruppo3.Text   := '';
                  ClientiForm.GMCodiceGruppo4.Text := '';
                  ClientiForm.GMDescGruppo4.Text   := '';
                  ClientiForm.GMCodiceGruppo5.Text := '';
                  ClientiForm.GMDescGruppo5.Text   := '';
                  ClientiForm.GMCodiceGruppo6.Text := '';
                  ClientiForm.GMDescGruppo6.Text   := '';
                  Close;
                  ClientiForm.GMCodiceGruppo2.SetFocus;
               end;
               3:begin
                  ClientiForm.GMCodiceGruppo3.Text := ' ' + QryGruppo3.FieldByName('Codice3').AsString;
                  ClientiForm.GMDescGruppo3.Text   := ' ' + QryGruppo3.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.GMCodiceGruppo4.Text := '';
                  ClientiForm.GMDescGruppo4.Text   := '';
                  ClientiForm.GMCodiceGruppo5.Text := '';
                  ClientiForm.GMDescGruppo5.Text   := '';
                  ClientiForm.GMCodiceGruppo6.Text := '';
                  ClientiForm.GMDescGruppo6.Text   := '';
                  Close;
                  ClientiForm.GMCodiceGruppo3.SetFocus;
               end;
               4:begin
                  ClientiForm.GMCodiceGruppo4.Text := ' ' + QryGruppo4.FieldByName('Codice4').AsString;
                  ClientiForm.GMDescGruppo4.Text   := ' ' + QryGruppo4.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.GMCodiceGruppo5.Text := '';
                  ClientiForm.GMDescGruppo5.Text   := '';
                  ClientiForm.GMCodiceGruppo6.Text := '';
                  ClientiForm.GMDescGruppo6.Text   := '';
                  Close;
                  ClientiForm.GMCodiceGruppo4.SetFocus;
               end;
               5:begin
                  ClientiForm.GMCodiceGruppo5.Text := ' ' + QryGruppo5.FieldByName('Codice5').AsString;
                  ClientiForm.GMDescGruppo5.Text   := ' ' + QryGruppo5.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.GMCodiceGruppo6.Text := '';
                  ClientiForm.GMDescGruppo6.Text   := '';
                  Close;
                  ClientiForm.GMCodiceGruppo5.SetFocus;
               end;
               6:begin
                  ClientiForm.GMCodiceGruppo6.Text := ' ' + QryGruppo6.FieldByName('Codice6').AsString;
                  ClientiForm.GMDescGruppo6.Text   := ' ' + QryGruppo6.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  Close;
                  ClientiForm.GMCodiceGruppo6.SetFocus;
               end;
            end;
         end;
         // Chiamante ---> GRUPPI NELL'ANAGRAFICA ARTICOLO
         998:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  AnagArtForm.CodiceGruppo1.Field.Value := QryGruppo1.FieldByName('Codice1').AsString;
                  AnagArtForm.CodiceGruppo2.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo2.Text          := '';
                  AnagArtForm.CodiceGruppo3.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo3.Text          := '';
                  AnagArtForm.CodiceGruppo4.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo4.Text          := '';
                  AnagArtForm.CodiceGruppo5.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo5.Text          := '';
                  AnagArtForm.CodiceGruppo6.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo6.Text          := '';
                  DM1.CodGruppoToDescrizione(AnagArtForm.QryArtCODICEGRUPPO1.AsString, '-1', '-1', '-1', '-1', '-1', AnagArtForm.DescGruppo1);
                  Close;
                  AnagArtForm.CodiceGruppo1.SetFocus;
               end;
               2:begin
                  AnagArtForm.CodiceGruppo2.Field.Value := QryGruppo2.FieldByName('Codice2').AsString;
                  AnagArtForm.CodiceGruppo3.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo3.Text          := '';
                  AnagArtForm.CodiceGruppo4.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo4.Text          := '';
                  AnagArtForm.CodiceGruppo5.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo5.Text          := '';
                  AnagArtForm.CodiceGruppo6.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo6.Text          := '';
                  DM1.CodGruppoToDescrizione(AnagArtForm.QryArtCODICEGRUPPO1.AsString, AnagArtForm.QryArtCODICEGRUPPO2.AsString, '-1', '-1', '-1', '-1', AnagArtForm.DescGruppo2);
                  Close;
                  AnagArtForm.CodiceGruppo2.SetFocus;
               end;
               3:begin
                  AnagArtForm.CodiceGruppo3.Field.Value := QryGruppo3.FieldByName('Codice3').AsString;
                  AnagArtForm.CodiceGruppo4.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo4.Text          := '';
                  AnagArtForm.CodiceGruppo5.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo5.Text          := '';
                  AnagArtForm.CodiceGruppo6.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo6.Text          := '';
                  DM1.CodGruppoToDescrizione(AnagArtForm.QryArtCODICEGRUPPO1.AsString, AnagArtForm.QryArtCODICEGRUPPO2.AsString, AnagArtForm.QryArtCODICEGRUPPO3.AsString, '-1', '-1', '-1', AnagArtForm.DescGruppo3);
                  Close;
                  AnagArtForm.CodiceGruppo3.SetFocus;
               end;
               4:begin
                  AnagArtForm.CodiceGruppo4.Field.Value := QryGruppo4.FieldByName('Codice4').AsString;
                  AnagArtForm.CodiceGruppo5.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo5.Text          := '';
                  AnagArtForm.CodiceGruppo6.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo6.Text          := '';
                  DM1.CodGruppoToDescrizione(AnagArtForm.QryArtCODICEGRUPPO1.AsString, AnagArtForm.QryArtCODICEGRUPPO2.AsString, AnagArtForm.QryArtCODICEGRUPPO3.AsString, AnagArtForm.QryArtCODICEGRUPPO4.AsString, '-1', '-1', AnagArtForm.DescGruppo4);
                  Close;
                  AnagArtForm.CodiceGruppo4.SetFocus;
               end;
               5:begin
                  AnagArtForm.CodiceGruppo5.Field.Value := QryGruppo5.FieldByName('Codice5').AsString;
                  AnagArtForm.CodiceGruppo6.Field.Value := NULL;        // Annulla la selezione del livello successivo per ovvi motivi
                  AnagArtForm.DescGruppo6.Text          := '';
                  DM1.CodGruppoToDescrizione(AnagArtForm.QryArtCODICEGRUPPO1.AsString, AnagArtForm.QryArtCODICEGRUPPO2.AsString, AnagArtForm.QryArtCODICEGRUPPO3.AsString, AnagArtForm.QryArtCODICEGRUPPO4.AsString, AnagArtForm.QryArtCODICEGRUPPO5.AsString, '-1', AnagArtForm.DescGruppo5);
                  Close;
                  AnagArtForm.CodiceGruppo5.SetFocus;
               end;
               6:begin
                  AnagArtForm.CodiceGruppo6.Field.Value := QryGruppo6.FieldByName('Codice6').AsString;
                  DM1.CodGruppoToDescrizione(AnagArtForm.QryArtCODICEGRUPPO1.AsString, AnagArtForm.QryArtCODICEGRUPPO2.AsString, AnagArtForm.QryArtCODICEGRUPPO3.AsString, AnagArtForm.QryArtCODICEGRUPPO4.AsString, AnagArtForm.QryArtCODICEGRUPPO5.AsString, AnagArtForm.QryArtCODICEGRUPPO6.AsString, AnagArtForm.DescGruppo6);
                  Close;
                  AnagArtForm.CodiceGruppo6.SetFocus;
               end;
            end;
            // Abilita i pulsanti di selezione correttiin base alla situazione
            AnagArtForm.CheckButtonsGruppi;
         end;
         // Chiamante ---> GRUPPI NELLE CONDIZIONI DI VENDITA
         997:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  CondVendForm.CodiceGruppo1.Field.Value := QryGruppo1.FieldByName('Codice1').AsString;
                  CondVendForm.CodiceGruppo2.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
                  CondVendForm.DescGruppo2.Text          := '';
                  CondVendForm.CodiceGruppo3.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
                  CondVendForm.DescGruppo3.Text          := '';
//                  CondVendForm.CodiceGruppo4.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo4.Text          := '';
//                  CondVendForm.CodiceGruppo5.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo5.Text          := '';
//                  CondVendForm.CodiceGruppo6.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo6.Text          := '';
                  DM1.CodGruppoToDescrizione(CondVendForm.CodiceGruppo1.Field.Value, '-1', '-1', '-1', '-1', '-1', CondVendForm.DescGruppo1);
                  Close;
                  CondVendForm.CodiceGruppo1.SetFocus;
               end;
               2:begin
                  CondVendForm.CodiceGruppo2.Field.Value := QryGruppo2.FieldByName('Codice2').AsString;
                  CondVendForm.CodiceGruppo3.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
                  CondVendForm.DescGruppo3.Text          := '';
//                  CondVendForm.CodiceGruppo4.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo4.Text          := '';
//                  CondVendForm.CodiceGruppo5.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo5.Text          := '';
//                  CondVendForm.CodiceGruppo6.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo6.Text          := '';
                  // Aggiorna la descrizione
                  DM1.CodGruppoToDescrizione(CondVendForm.CodiceGruppo1.Field.Value, CondVendForm.CodiceGruppo2.Field.Value, '-1', '-1', '-1', '-1', CondVendForm.DescGruppo2);
                  Close;
                  CondVendForm.CodiceGruppo2.SetFocus;
               end;
               3:begin
                  CondVendForm.CodiceGruppo3.Field.Value := QryGruppo3.FieldByName('Codice3').AsString;
//                  CondVendForm.CodiceGruppo4.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo4.Text          := '';
//                  CondVendForm.CodiceGruppo5.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo5.Text          := '';
//                  CondVendForm.CodiceGruppo6.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo6.Text          := '';
                  // Aggiorna la descrizione
                  DM1.CodGruppoToDescrizione(CondVendForm.CodiceGruppo1.Field.Value, CondVendForm.CodiceGruppo2.Field.Value, CondVendForm.CodiceGruppo3.Field.Value, '-1', '-1', '-1', CondVendForm.DescGruppo3);
                  Close;
                  CondVendForm.CodiceGruppo3.SetFocus;
               end;
//               4:begin
//                  CondVendForm.CodiceGruppo4.Field.Value := QryGruppo4.FieldByName('Codice4').AsString;
//                  CondVendForm.CodiceGruppo5.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo5.Text          := '';
//                  CondVendForm.CodiceGruppo6.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo6.Text          := '';
//                  // Aggiorna la descrizione
//                  DM1.CodGruppoToDescrizione(CondVendForm.CodiceGruppo1.Field.Value, CondVendForm.CodiceGruppo2.Field.Value, CondVendForm.CodiceGruppo3.Field.Value, CondVendForm.CodiceGruppo4.Field.Value, '-1', '-1', CondVendForm.DescGruppo3);
//                  Close;
//                  CondVendForm.CodiceGruppo4.SetFocus;
//               end;
//               5:begin
//                  CondVendForm.CodiceGruppo5.Field.Value := QryGruppo5.FieldByName('Codice5').AsString;
//                  CondVendForm.CodiceGruppo6.Field.Value := -1;        // Annulla la selezione del livello successivo per ovvi motivi
//                  CondVendForm.DescGruppo6.Text          := '';
//                  // Aggiorna la descrizione
//                  DM1.CodGruppoToDescrizione(CondVendForm.CodiceGruppo1.Field.Value, CondVendForm.CodiceGruppo2.Field.Value, CondVendForm.CodiceGruppo3.Field.Value, CondVendForm.CodiceGruppo4.Field.Value, CondVendForm.CodiceGruppo5.Field.Value, '-1', CondVendForm.DescGruppo3);
//                  Close;
//                  CondVendForm.CodiceGruppo5.SetFocus;
//               end;
//               6:begin
//                  CondVendForm.CodiceGruppo6.Field.Value := QryGruppo6.FieldByName('Codice6').AsString;
//                  // Aggiorna la descrizione
//                  DM1.CodGruppoToDescrizione(CondVendForm.CodiceGruppo1.Field.Value, CondVendForm.CodiceGruppo2.Field.Value, CondVendForm.CodiceGruppo3.Field.Value, CondVendForm.CodiceGruppo4.Field.Value, CondVendForm.CodiceGruppo5.Field.Value, CondVendForm.CodiceGruppo6.Field.Value, CondVendForm.DescGruppo3);
//                  Close;
//                  CondVendForm.CodiceGruppo6.SetFocus;
//               end;
            end;
            // Abilita i pulsanti di selezione correttiin base alla situazione
            CondVendForm.CheckButtonsGruppi;
         end;
         // Chiamante ---> FILTRI DELLE CONDIZIONI DI VENDITA (ClientiForm)
         996:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  ClientiForm.CVCodiceGruppo1.Text := ' ' + QryGruppo1.FieldByName('Codice1').AsString;
                  ClientiForm.CVDescGruppo1.Text   := ' ' + QryGruppo1.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.CVCodiceGruppo2.Text := '';
                  ClientiForm.CVDescGruppo2.Text   := '';
                  ClientiForm.CVCodiceGruppo3.Text := '';
                  ClientiForm.CVDescGruppo3.Text   := '';
//                  ClientiForm.CVCodiceGruppo4.Text := '';
//                  ClientiForm.CVDescGruppo4.Text   := '';
//                  ClientiForm.CVCodiceGruppo5.Text := '';
//                  ClientiForm.CVDescGruppo5.Text   := '';
//                  ClientiForm.CVCodiceGruppo6.Text := '';
//                  ClientiForm.CVDescGruppo6.Text   := '';
                  Close;
                  ClientiForm.CVCodiceGruppo1.SetFocus;
               end;
               2:begin
                  ClientiForm.CVCodiceGruppo2.Text := ' ' + QryGruppo2.FieldByName('Codice2').AsString;
                  ClientiForm.CVDescGruppo2.Text   := ' ' + QryGruppo2.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.CVCodiceGruppo3.Text := '';
                  ClientiForm.CVDescGruppo3.Text   := '';
//                  ClientiForm.CVCodiceGruppo4.Text := '';
//                  ClientiForm.CVDescGruppo4.Text   := '';
//                  ClientiForm.CVCodiceGruppo5.Text := '';
//                  ClientiForm.CVDescGruppo5.Text   := '';
//                  ClientiForm.CVCodiceGruppo6.Text := '';
//                  ClientiForm.CVDescGruppo6.Text   := '';
                  Close;
                  ClientiForm.CVCodiceGruppo2.SetFocus;
               end;
               3:begin
                  ClientiForm.CVCodiceGruppo3.Text := ' ' + QryGruppo3.FieldByName('Codice3').AsString;
                  ClientiForm.CVDescGruppo3.Text   := ' ' + QryGruppo3.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
//                  ClientiForm.CVCodiceGruppo4.Text := '';
//                  ClientiForm.CVDescGruppo4.Text   := '';
//                  ClientiForm.CVCodiceGruppo5.Text := '';
//                  ClientiForm.CVDescGruppo5.Text   := '';
//                  ClientiForm.CVCodiceGruppo6.Text := '';
//                  ClientiForm.CVDescGruppo6.Text   := '';
                  Close;
                  ClientiForm.CVCodiceGruppo3.SetFocus;
               end;
//               4:begin
//                  ClientiForm.CVCodiceGruppo4.Text := ' ' + QryGruppo4.FieldByName('Codice4').AsString;
//                  ClientiForm.CVDescGruppo4.Text   := ' ' + QryGruppo4.FieldByName('Descrizione').AsString;
//                  // Annulla la selezione del livello successivo per ovvi motivi
//                  ClientiForm.CVCodiceGruppo5.Text := '';
//                  ClientiForm.CVDescGruppo5.Text   := '';
//                  ClientiForm.CVCodiceGruppo6.Text := '';
//                  ClientiForm.CVDescGruppo6.Text   := '';
//                  Close;
//                  ClientiForm.CVCodiceGruppo4.SetFocus;
//               end;
//               5:begin
//                  ClientiForm.CVCodiceGruppo5.Text := ' ' + QryGruppo5.FieldByName('Codice5').AsString;
//                  ClientiForm.CVDescGruppo5.Text   := ' ' + QryGruppo5.FieldByName('Descrizione').AsString;
//                  // Annulla la selezione del livello successivo per ovvi motivi
//                  ClientiForm.CVCodiceGruppo6.Text := '';
//                  ClientiForm.CVDescGruppo6.Text   := '';
//                  Close;
//                  ClientiForm.CVCodiceGruppo5.SetFocus;
//               end;
//               6:begin
//                  ClientiForm.CVCodiceGruppo6.Text := ' ' + QryGruppo6.FieldByName('Codice6').AsString;
//                  ClientiForm.CVDescGruppo6.Text   := ' ' + QryGruppo6.FieldByName('Descrizione').AsString;
//                  Close;
//                  ClientiForm.CVCodiceGruppo6.SetFocus;
//               end;
            end;
         end;
         // Chiamante ---> ARCHIVIO ARTICOLI (ClientiForm)
         995:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  ClientiForm.CodiceGruppo1.Text := ' ' + QryGruppo1.FieldByName('Codice1').AsString;
                  ClientiForm.DescGruppo1.Text   := ' ' + QryGruppo1.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.CodiceGruppo2.Text := '';
                  ClientiForm.DescGruppo2.Text   := '';
                  ClientiForm.CodiceGruppo3.Text := '';
                  ClientiForm.DescGruppo3.Text   := '';
                  ClientiForm.CodiceGruppo4.Text := '';
                  ClientiForm.DescGruppo4.Text   := '';
                  ClientiForm.CodiceGruppo5.Text := '';            //
                  ClientiForm.DescGruppo5.Text   := '';
                  ClientiForm.CodiceGruppo6.Text := '';
                  ClientiForm.DescGruppo6.Text   := '';
                  Close;
                  ClientiForm.CodiceGruppo1.SetFocus;
               end;
               2:begin
                  ClientiForm.CodiceGruppo2.Text := ' ' + QryGruppo2.FieldByName('Codice2').AsString;
                  ClientiForm.DescGruppo2.Text   := ' ' + QryGruppo2.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.CodiceGruppo3.Text := '';
                  ClientiForm.DescGruppo3.Text   := '';
                  ClientiForm.CodiceGruppo4.Text := '';
                  ClientiForm.DescGruppo4.Text   := '';
                  ClientiForm.CodiceGruppo5.Text := '';
                  ClientiForm.DescGruppo5.Text   := '';
                  ClientiForm.CodiceGruppo6.Text := '';
                  ClientiForm.DescGruppo6.Text   := '';
                  Close;
                  ClientiForm.CodiceGruppo2.SetFocus;
               end;
               3:begin
                  ClientiForm.CodiceGruppo3.Text := ' ' + QryGruppo3.FieldByName('Codice3').AsString;
                  ClientiForm.DescGruppo3.Text   := ' ' + QryGruppo3.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.CodiceGruppo4.Text := '';
                  ClientiForm.DescGruppo4.Text   := '';
                  ClientiForm.CodiceGruppo5.Text := '';
                  ClientiForm.DescGruppo5.Text   := '';
                  ClientiForm.CodiceGruppo6.Text := '';
                  ClientiForm.DescGruppo6.Text   := '';
                  Close;
                  ClientiForm.CodiceGruppo3.SetFocus;
               end;
               4:begin
                  ClientiForm.CodiceGruppo4.Text := ' ' + QryGruppo4.FieldByName('Codice4').AsString;
                  ClientiForm.DescGruppo4.Text   := ' ' + QryGruppo4.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.CodiceGruppo5.Text := '';
                  ClientiForm.DescGruppo5.Text   := '';
                  ClientiForm.CodiceGruppo6.Text := '';
                  ClientiForm.DescGruppo6.Text   := '';
                  Close;
                  ClientiForm.CodiceGruppo4.SetFocus;
               end;
               5:begin
                  ClientiForm.CodiceGruppo5.Text := ' ' + QryGruppo5.FieldByName('Codice5').AsString;
                  ClientiForm.DescGruppo5.Text   := ' ' + QryGruppo5.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ClientiForm.CodiceGruppo6.Text := '';
                  ClientiForm.DescGruppo6.Text   := '';
                  Close;
                  ClientiForm.CodiceGruppo5.SetFocus;
               end;
               6:begin
                  ClientiForm.CodiceGruppo6.Text := ' ' + QryGruppo6.FieldByName('Codice6').AsString;
                  ClientiForm.DescGruppo6.Text   := ' ' + QryGruppo6.FieldByName('Descrizione').AsString;
                  Close;
                  ClientiForm.CodiceGruppo6.SetFocus;
               end;
            end;
         end;
         // Chiamante ---> SELEZIONE ARTICOLI (ArticoliForm)
         994:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  ArticoliForm.CodiceGruppo1.Text := ' ' + QryGruppo1.FieldByName('Codice1').AsString;
                  ArticoliForm.DescGruppo1.Text   := ' ' + QryGruppo1.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ArticoliForm.CodiceGruppo2.Text := '';
                  ArticoliForm.DescGruppo2.Text   := '';
                  ArticoliForm.CodiceGruppo3.Text := '';
                  ArticoliForm.DescGruppo3.Text   := '';
                  ArticoliForm.CodiceGruppo4.Text := '';
                  ArticoliForm.DescGruppo4.Text   := '';
                  ArticoliForm.CodiceGruppo5.Text := '';
                  ArticoliForm.DescGruppo5.Text   := '';
                  ArticoliForm.CodiceGruppo6.Text := '';
                  ArticoliForm.DescGruppo6.Text   := '';
                  Close;
                  ArticoliForm.CodiceGruppo1.SetFocus;
               end;
               2:begin
                  ArticoliForm.CodiceGruppo2.Text := ' ' + QryGruppo2.FieldByName('Codice2').AsString;
                  ArticoliForm.DescGruppo2.Text   := ' ' + QryGruppo2.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ArticoliForm.CodiceGruppo3.Text := '';
                  ArticoliForm.DescGruppo3.Text   := '';
                  ArticoliForm.CodiceGruppo4.Text := '';
                  ArticoliForm.DescGruppo4.Text   := '';
                  ArticoliForm.CodiceGruppo5.Text := '';
                  ArticoliForm.DescGruppo5.Text   := '';
                  ArticoliForm.CodiceGruppo6.Text := '';
                  ArticoliForm.DescGruppo6.Text   := '';
                  Close;
                  ArticoliForm.CodiceGruppo2.SetFocus;
               end;
               3:begin
                  ArticoliForm.CodiceGruppo3.Text := ' ' + QryGruppo3.FieldByName('Codice3').AsString;
                  ArticoliForm.DescGruppo3.Text   := ' ' + QryGruppo3.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ArticoliForm.CodiceGruppo4.Text := '';
                  ArticoliForm.DescGruppo4.Text   := '';
                  ArticoliForm.CodiceGruppo5.Text := '';
                  ArticoliForm.DescGruppo5.Text   := '';
                  ArticoliForm.CodiceGruppo6.Text := '';
                  ArticoliForm.DescGruppo6.Text   := '';
                  Close;
                  ArticoliForm.CodiceGruppo3.SetFocus;
               end;
               4:begin
                  ArticoliForm.CodiceGruppo4.Text := ' ' + QryGruppo4.FieldByName('Codice4').AsString;
                  ArticoliForm.DescGruppo4.Text   := ' ' + QryGruppo4.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ArticoliForm.CodiceGruppo5.Text := '';
                  ArticoliForm.DescGruppo5.Text   := '';
                  ArticoliForm.CodiceGruppo6.Text := '';
                  ArticoliForm.DescGruppo6.Text   := '';
                  Close;
                  ArticoliForm.CodiceGruppo4.SetFocus;
               end;
               5:begin
                  ArticoliForm.CodiceGruppo5.Text := ' ' + QryGruppo5.FieldByName('Codice5').AsString;
                  ArticoliForm.DescGruppo5.Text   := ' ' + QryGruppo5.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ArticoliForm.CodiceGruppo6.Text := '';
                  ArticoliForm.DescGruppo6.Text   := '';
                  Close;
                  ArticoliForm.CodiceGruppo5.SetFocus;
               end;
               6:begin
                  ArticoliForm.CodiceGruppo6.Text := ' ' + QryGruppo6.FieldByName('Codice6').AsString;
                  ArticoliForm.DescGruppo6.Text   := ' ' + QryGruppo6.FieldByName('Descrizione').AsString;
                  Close;
                  ArticoliForm.CodiceGruppo6.SetFocus;
               end;
            end;
         end;
         // Chiamante ---> FILTRI DEL GIORNALE DI CANTIERE
         993:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  TabGCForm.GCCodiceGruppo1.Text := ' ' + QryGruppo1.FieldByName('Codice1').AsString;
                  TabGCForm.GCDescGruppo1.Text   := ' ' + QryGruppo1.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  TabGCForm.GCCodiceGruppo2.Text := '';
                  TabGCForm.GCDescGruppo2.Text   := '';
                  TabGCForm.GCCodiceGruppo3.Text := '';
                  TabGCForm.GCDescGruppo3.Text   := '';
                  TabGCForm.GCCodiceGruppo4.Text := '';
                  TabGCForm.GCDescGruppo4.Text   := '';
                  TabGCForm.GCCodiceGruppo5.Text := '';
                  TabGCForm.GCDescGruppo5.Text   := '';
                  TabGCForm.GCCodiceGruppo6.Text := '';
                  TabGCForm.GCDescGruppo6.Text   := '';
                  Close;
                  TabGCForm.GCCodiceGruppo1.SetFocus;
               end;
               2:begin
                  TabGCForm.GCCodiceGruppo2.Text := ' ' + QryGruppo2.FieldByName('Codice2').AsString;
                  TabGCForm.GCDescGruppo2.Text   := ' ' + QryGruppo2.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  TabGCForm.GCCodiceGruppo3.Text := '';
                  TabGCForm.GCDescGruppo3.Text   := '';
                  TabGCForm.GCCodiceGruppo4.Text := '';
                  TabGCForm.GCDescGruppo4.Text   := '';
                  TabGCForm.GCCodiceGruppo5.Text := '';
                  TabGCForm.GCDescGruppo5.Text   := '';
                  TabGCForm.GCCodiceGruppo6.Text := '';
                  TabGCForm.GCDescGruppo6.Text   := '';
                  Close;
                  TabGCForm.GCCodiceGruppo2.SetFocus;
               end;
               3:begin
                  TabGCForm.GCCodiceGruppo3.Text := ' ' + QryGruppo3.FieldByName('Codice3').AsString;
                  TabGCForm.GCDescGruppo3.Text   := ' ' + QryGruppo3.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  TabGCForm.GCCodiceGruppo4.Text := '';
                  TabGCForm.GCDescGruppo4.Text   := '';
                  TabGCForm.GCCodiceGruppo5.Text := '';
                  TabGCForm.GCDescGruppo5.Text   := '';
                  TabGCForm.GCCodiceGruppo6.Text := '';
                  TabGCForm.GCDescGruppo6.Text   := '';
                  Close;
                  TabGCForm.GCCodiceGruppo3.SetFocus;
               end;
               4:begin
                  TabGCForm.GCCodiceGruppo4.Text := ' ' + QryGruppo4.FieldByName('Codice4').AsString;
                  TabGCForm.GCDescGruppo4.Text   := ' ' + QryGruppo4.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  TabGCForm.GCCodiceGruppo5.Text := '';
                  TabGCForm.GCDescGruppo5.Text   := '';
                  TabGCForm.GCCodiceGruppo6.Text := '';
                  TabGCForm.GCDescGruppo6.Text   := '';
                  Close;
                  TabGCForm.GCCodiceGruppo4.SetFocus;
               end;
               5:begin
                  TabGCForm.GCCodiceGruppo5.Text := ' ' + QryGruppo5.FieldByName('Codice5').AsString;
                  TabGCForm.GCDescGruppo5.Text   := ' ' + QryGruppo5.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  TabGCForm.GCCodiceGruppo6.Text := '';
                  TabGCForm.GCDescGruppo6.Text   := '';
                  Close;
                  TabGCForm.GCCodiceGruppo5.SetFocus;
               end;
               6:begin
                  TabGCForm.GCCodiceGruppo6.Text := ' ' + QryGruppo6.FieldByName('Codice6').AsString;
                  TabGCForm.GCDescGruppo6.Text   := ' ' + QryGruppo6.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  Close;
                  TabGCForm.GCCodiceGruppo6.SetFocus;
               end;
            end;
         end;
         // Chiamante ---> FORM AUMENTO PREZZO DI LISTINO
         992:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  AumentoListiniForm.CodiceGruppo1.Text := ' ' + QryGruppo1.FieldByName('Codice1').AsString;
                  AumentoListiniForm.DescGruppo1.Text   := ' ' + QryGruppo1.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  AumentoListiniForm.CodiceGruppo2.Text := '';
                  AumentoListiniForm.DescGruppo2.Text   := '';
                  AumentoListiniForm.CodiceGruppo3.Text := '';
                  AumentoListiniForm.DescGruppo3.Text   := '';
                  AumentoListiniForm.CodiceGruppo4.Text := '';
                  AumentoListiniForm.DescGruppo4.Text   := '';
                  AumentoListiniForm.CodiceGruppo5.Text := '';
                  AumentoListiniForm.DescGruppo5.Text   := '';
                  AumentoListiniForm.CodiceGruppo6.Text := '';
                  AumentoListiniForm.DescGruppo6.Text   := '';
                  Close;
                  AumentoListiniForm.CodiceGruppo1.SetFocus;
               end;
               2:begin
                  AumentoListiniForm.CodiceGruppo2.Text := ' ' + QryGruppo2.FieldByName('Codice2').AsString;
                  AumentoListiniForm.DescGruppo2.Text   := ' ' + QryGruppo2.FieldByName('Descrizione').AsString;
                  // Annulla la selezne del livello successivo per ovvi motivi
                  AumentoListiniForm.CodiceGruppo3.Text := '';
                  AumentoListiniForm.DescGruppo3.Text   := '';
                  AumentoListiniForm.CodiceGruppo4.Text := '';
                  AumentoListiniForm.DescGruppo4.Text   := '';
                  AumentoListiniForm.CodiceGruppo5.Text := '';
                  AumentoListiniForm.DescGruppo5.Text   := '';
                  AumentoListiniForm.CodiceGruppo6.Text := '';
                  AumentoListiniForm.DescGruppo6.Text   := '';
                  Close;
                  AumentoListiniForm.CodiceGruppo2.SetFocus;
               end;
               3:begin
                  AumentoListiniForm.CodiceGruppo3.Text := ' ' + QryGruppo3.FieldByName('Codice3').AsString;
                  AumentoListiniForm.DescGruppo3.Text   := ' ' + QryGruppo3.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  AumentoListiniForm.CodiceGruppo4.Text := '';
                  AumentoListiniForm.DescGruppo4.Text   := '';
                  AumentoListiniForm.CodiceGruppo5.Text := '';
                  AumentoListiniForm.DescGruppo5.Text   := '';
                  AumentoListiniForm.CodiceGruppo6.Text := '';
                  AumentoListiniForm.DescGruppo6.Text   := '';
                  Close;
                  AumentoListiniForm.CodiceGruppo3.SetFocus;
               end;
               4:begin
                  AumentoListiniForm.CodiceGruppo4.Text := ' ' + QryGruppo4.FieldByName('Codice4').AsString;
                  AumentoListiniForm.DescGruppo4.Text   := ' ' + QryGruppo4.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  AumentoListiniForm.CodiceGruppo5.Text := '';
                  AumentoListiniForm.DescGruppo5.Text   := '';
                  AumentoListiniForm.CodiceGruppo6.Text := '';
                  AumentoListiniForm.DescGruppo6.Text   := '';
                  Close;
                  AumentoListiniForm.CodiceGruppo4.SetFocus;
               end;
               5:begin
                  AumentoListiniForm.CodiceGruppo5.Text := ' ' + QryGruppo5.FieldByName('Codice5').AsString;
                  AumentoListiniForm.DescGruppo5.Text   := ' ' + QryGruppo5.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  AumentoListiniForm.CodiceGruppo6.Text := '';
                  AumentoListiniForm.DescGruppo6.Text   := '';
                  Close;
                  AumentoListiniForm.CodiceGruppo5.SetFocus;
               end;
               6:begin
                  AumentoListiniForm.CodiceGruppo6.Text := ' ' + QryGruppo6.FieldByName('Codice6').AsString;
                  AumentoListiniForm.DescGruppo6.Text   := ' ' + QryGruppo6.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  Close;
                  AumentoListiniForm.CodiceGruppo6.SetFocus;
               end;
            end;
         end;
         // Chiamante ---> FORM AUMENTO PREZZO DI LISTINO
         991:begin
            // In base al Livello attivo assegna il codice giusto al controllo giusto
            case LivelloAttivo of
               1:begin
                  ModificaMarginiForm.CodiceGruppo1.Text := ' ' + QryGruppo1.FieldByName('Codice1').AsString;
                  ModificaMarginiForm.DescGruppo1.Text   := ' ' + QryGruppo1.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ModificaMarginiForm.CodiceGruppo2.Text := '';
                  ModificaMarginiForm.DescGruppo2.Text   := '';
                  ModificaMarginiForm.CodiceGruppo3.Text := '';
                  ModificaMarginiForm.DescGruppo3.Text   := '';
                  ModificaMarginiForm.CodiceGruppo4.Text := '';
                  ModificaMarginiForm.DescGruppo4.Text   := '';
                  ModificaMarginiForm.CodiceGruppo5.Text := '';
                  ModificaMarginiForm.DescGruppo5.Text   := '';
                  ModificaMarginiForm.CodiceGruppo6.Text := '';
                  ModificaMarginiForm.DescGruppo6.Text   := '';
                  Close;
                  ModificaMarginiForm.CodiceGruppo1.SetFocus;
               end;
               2:begin
                  ModificaMarginiForm.CodiceGruppo2.Text := ' ' + QryGruppo2.FieldByName('Codice2').AsString;
                  ModificaMarginiForm.DescGruppo2.Text   := ' ' + QryGruppo2.FieldByName('Descrizione').AsString;
                  // Annulla la selezne del livello successivo per ovvi motivi
                  ModificaMarginiForm.CodiceGruppo3.Text := '';
                  ModificaMarginiForm.DescGruppo3.Text   := '';
                  ModificaMarginiForm.CodiceGruppo4.Text := '';
                  ModificaMarginiForm.DescGruppo4.Text   := '';
                  ModificaMarginiForm.CodiceGruppo5.Text := '';
                  ModificaMarginiForm.DescGruppo5.Text   := '';
                  ModificaMarginiForm.CodiceGruppo6.Text := '';
                  ModificaMarginiForm.DescGruppo6.Text   := '';
                  Close;
                  ModificaMarginiForm.CodiceGruppo2.SetFocus;
               end;
               3:begin
                  ModificaMarginiForm.CodiceGruppo3.Text := ' ' + QryGruppo3.FieldByName('Codice3').AsString;
                  ModificaMarginiForm.DescGruppo3.Text   := ' ' + QryGruppo3.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ModificaMarginiForm.CodiceGruppo4.Text := '';
                  ModificaMarginiForm.DescGruppo4.Text   := '';
                  ModificaMarginiForm.CodiceGruppo5.Text := '';
                  ModificaMarginiForm.DescGruppo5.Text   := '';
                  ModificaMarginiForm.CodiceGruppo6.Text := '';
                  ModificaMarginiForm.DescGruppo6.Text   := '';
                  Close;
                  ModificaMarginiForm.CodiceGruppo3.SetFocus;
               end;
               4:begin
                  ModificaMarginiForm.CodiceGruppo4.Text := ' ' + QryGruppo4.FieldByName('Codice4').AsString;
                  ModificaMarginiForm.DescGruppo4.Text   := ' ' + QryGruppo4.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ModificaMarginiForm.CodiceGruppo5.Text := '';
                  ModificaMarginiForm.DescGruppo5.Text   := '';
                  ModificaMarginiForm.CodiceGruppo6.Text := '';
                  ModificaMarginiForm.DescGruppo6.Text   := '';
                  Close;
                  ModificaMarginiForm.CodiceGruppo4.SetFocus;
               end;
               5:begin
                  ModificaMarginiForm.CodiceGruppo5.Text := ' ' + QryGruppo5.FieldByName('Codice5').AsString;
                  ModificaMarginiForm.DescGruppo5.Text   := ' ' + QryGruppo5.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  ModificaMarginiForm.CodiceGruppo6.Text := '';
                  ModificaMarginiForm.DescGruppo6.Text   := '';
                  Close;
                  ModificaMarginiForm.CodiceGruppo5.SetFocus;
               end;
               6:begin
                  ModificaMarginiForm.CodiceGruppo6.Text := ' ' + QryGruppo6.FieldByName('Codice6').AsString;
                  ModificaMarginiForm.DescGruppo6.Text   := ' ' + QryGruppo6.FieldByName('Descrizione').AsString;
                  // Annulla la selezione del livello successivo per ovvi motivi
                  Close;
                  ModificaMarginiForm.CodiceGruppo6.SetFocus;
               end;
            end;
         end;
      end;
   end;
end;

end.
