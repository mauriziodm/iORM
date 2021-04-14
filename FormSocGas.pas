unit FormSocGas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag, 
  cxEdit, DB, cxDBData, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, Mask, DBCtrls, StdCtrls, ComCtrls, ExtDlgs,
  Buttons, MAURI_SB, cxContainer, cxImage, cxDBEdit, cxCheckBox, Menus,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon;

type
  TSocGasForm = class(TLevanteListAnagForm)
    QCODICE: TIntegerField;
    QRAGIONESOCIALE: TStringField;
    QINDIRIZZO: TStringField;
    QLOCALITA: TStringField;
    QCAP: TStringField;
    QPROVINCIA: TStringField;
    QTELEFONO: TStringField;
    QFAX: TStringField;
    tvListCODICE: TcxGridDBColumn;
    tvListRAGIONESOCIALE: TcxGridDBColumn;
    tvListINDIRIZZO: TcxGridDBColumn;
    tvListLOCALITA: TcxGridDBColumn;
    tvListCAP: TcxGridDBColumn;
    tvListPROVINCIA: TcxGridDBColumn;
    tvListTELEFONO: TcxGridDBColumn;
    tvListFAX: TcxGridDBColumn;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    DBECodice: TDBEdit;
    Label1: TLabel;
    DBERagioneSociale: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    QSINCHRO: TStringField;
    QIMGINTESTAZIONE: TBlobField;
    QSTAMPAINTESTAZIONE: TStringField;
    QFILEREPORTCUSTOM: TStringField;
    QSTAMPAREPORTCUSTOM: TStringField;
    Panel1: TPanel;
    Label9: TLabel;
    RichEdit2: TRichEdit;
    Label10: TLabel;
    cxDBImage1: TcxDBImage;
    SBIntestazione: TSpeedButtonRollOver;
    OpenPictureDialog1: TOpenPictureDialog;
    cxDBCheckBox1: TcxDBCheckBox;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    procedure DBECodiceEnter(Sender: TObject);
    procedure DBECodiceExit(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure QBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tvListDblClick(Sender: TObject);
    procedure SBIntestazioneClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // Punta al componente Field in cui inserire il codice del cliente
    FieldCodice : TField;
  end;

var
  SocGasForm: TSocGasForm;

implementation

uses DataModule1;

{$R *.dfm}

procedure TSocGasForm.DBECodiceEnter(Sender: TObject);
begin
  inherited;
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TSocGasForm.DBECodiceExit(Sender: TObject);
begin
  inherited;
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TSocGasForm.RxSpeedModificaClick(Sender: TObject);
begin
  inherited;
  DBECodice.SetFocus;
  DBERagioneSociale.SetFocus;
  if RxSpeedModifica.Down then begin
    SBIntestazione.Enabled := True;
  end else begin
    SBIntestazione.Enabled := False;
  end;
end;

procedure TSocGasForm.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Se il codice non c'è lo assegna automaticamente
  if Trim(Q.FieldByName('CODICE').AsString) = '' then begin
    Q.FieldByName('CODICE').Value := DM1.NextCodice('SOCDISTRGAS', 'CODICE');
  end;
end;

procedure TSocGasForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SocGasForm := nil;
end;

procedure TSocGasForm.tvListDblClick(Sender: TObject);
begin
  inherited;
  if DblClickMode = DblClickModeSelection then begin
     // Effettua la selezione assegnando il codice selezionato
     //  ai campi appropriati puntati da 'FieldCodice'
     FieldCodice.Value := tvList.Controller.FocusedRow.Values[tvList.GetColumnByFieldName('CODICE').Index];
     Close;
  end;
end;

procedure TSocGasForm.SBIntestazioneClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then begin
    QIMGINTESTAZIONE.LoadFromFile(OpenPictureDialog1.FileName);
  end;
end;

end.
