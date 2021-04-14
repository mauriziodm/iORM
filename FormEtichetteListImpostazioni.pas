unit FormEtichetteListImpostazioni;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormEtichetteBase, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxTextEdit, Vcl.Menus, IBODataset, Vcl.Buttons, bmpPanel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.ExtCtrls, cxContainer, cxGroupBox, cxRadioGroup,
  cxDBEdit, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls, MAURI_SB,
  frxClass, frxDBSet, frxBarcode, frxDesgn, cxMaskEdit, cxDropDownEdit,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon;

type
  TEtichetteListImpostazioniForm = class(TEtichetteBaseForm)
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    dbeNome: TDBEdit;
    Label1: TLabel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    SBShowReport: TSpeedButtonRollOver;
    dbePrinter: TcxDBComboBox;
    Label2: TLabel;
    SBShowReportExternalSave: TSpeedButtonRollOver;
    procedure QAfterInsert(DataSet: TDataSet);
    procedure SBShowReportClick(Sender: TObject);
    function frxDesigner1SaveReport(Report: TfrxReport;
      SaveAs: Boolean): Boolean;
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure dbePrinterPropertiesInitPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBShowReportExternalSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EtichetteListImpostazioniForm: TEtichetteListImpostazioniForm;

implementation

{$R *.dfm}

uses DataModule1, Vcl.Printers;

procedure TEtichetteListImpostazioniForm.dbePrinterPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  with Sender as TcxDBComboBox do begin
    Properties.Items.Clear;
    Properties.Items.Add('');
    Properties.Items.AddStrings(Printer.Printers);
  end;
end;

procedure TEtichetteListImpostazioniForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EtichetteListImpostazioniForm := nil;
end;

function TEtichetteListImpostazioniForm.frxDesigner1SaveReport(
  Report: TfrxReport; SaveAs: Boolean): Boolean;
begin
  inherited;
  DM1.ShowWait('Levante', 'Sto salvando l''etichetta...');
  try
    try
      Q.Edit;
      Self.SaveReport;
      Q.Post;
    except
      DM1.Messaggi('Levante', 'C''è stato un problema durante il salvataggio dell''etichetta.'#13#13'L''etichetta non è stato salvata.', '', [mbOk], 0, nil);
      Q.Cancel;
    end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TEtichetteListImpostazioniForm.QAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Disabilita pulsante show report editing
  SBShowReport.Enabled := False;
  SBShowReportExternalSave.Enabled := False;
  // Defaultizzazione campi
  if QFILEPATH.IsNull then QFILEPATH.Value := '';
  if QTIPOFILE.IsNull then QTIPOFILE.Value := 'LABART';
end;

procedure TEtichetteListImpostazioniForm.RxSpeedModificaClick(Sender: TObject);
begin
  inherited;
  SBShowReport.Enabled := not RxSpeedModifica.Down;
  SBShowReportExternalSave.Enabled := not RxSpeedModifica.Down;
end;

procedure TEtichetteListImpostazioniForm.SBShowReportClick(
  Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Caricamento...');
  try
    Self.LoadReport;
    frxDesigner1.OnSaveReport := frxDesigner1SaveReport;
    frxReport1.DesignReport();
  finally
    DM1.CloseWait;
  end;
end;


procedure TEtichetteListImpostazioniForm.SBShowReportExternalSaveClick(
  Sender: TObject);
begin
  inherited;
  DM1.ShowWait('Levante', 'Caricamento...');
  try
    Self.LoadReport;
    frxDesigner1.OnSaveReport := nil;
    frxReport1.DesignReport();
  finally
    DM1.CloseWait;
  end;
end;

end.
