unit FormStampaDichiarazione;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase, ExtCtrls, bmpPanel, DBCtrls,
  StdCtrls, ComCtrls, cxControls, cxContainer, cxEdit, cxCheckBox, cxLabel,
  Quickrpt, QRCtrls, cxGroupBox, cxRadioGroup, Buttons, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TStampaDichiarazioneForm = class(TModelBaseForm)
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    Check_1_01_00: TcxCheckBox;
    Check_1_02_00: TcxCheckBox;
    Panel1: TPanel;
    Label1: TLabel;
    RichEdit2: TRichEdit;
    Check_2_01_00: TcxCheckBox;
    Check_2_08_00: TcxCheckBox;
    Check_2_09_00: TcxCheckBox;
    Check_2_10_00: TcxCheckBox;
    Panel2: TPanel;
    Label2: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Check_00_1: TcxCheckBox;
    Check_00_2: TcxCheckBox;
    Check_00_3: TcxCheckBox;
    Check_00_4: TcxCheckBox;
    Check_00_5: TcxCheckBox;
    Check_00_6: TcxCheckBox;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    Shape34: TShape;
    Label3: TLabel;
    cxLabel2: TcxLabel;
    Check_1_01_01: TcxCheckBox;
    Check_1_02_01: TcxCheckBox;
    Check_2_01_01: TcxCheckBox;
    Check_2_08_01: TcxCheckBox;
    Check_2_09_01: TcxCheckBox;
    Check_2_10_01: TcxCheckBox;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Check_1_01_02: TcxCheckBox;
    Check_1_02_02: TcxCheckBox;
    Check_2_01_02: TcxCheckBox;
    Check_2_08_02: TcxCheckBox;
    Check_2_09_02: TcxCheckBox;
    Check_2_10_02: TcxCheckBox;
    Check_1_01_03: TcxCheckBox;
    Check_1_01_04: TcxCheckBox;
    Check_1_02_03: TcxCheckBox;
    Check_1_02_04: TcxCheckBox;
    Check_2_01_03: TcxCheckBox;
    Check_2_01_04: TcxCheckBox;
    Check_2_08_03: TcxCheckBox;
    Check_2_08_04: TcxCheckBox;
    Check_2_09_03: TcxCheckBox;
    Check_2_09_04: TcxCheckBox;
    Check_2_10_03: TcxCheckBox;
    Check_2_10_04: TcxCheckBox;
    Check_1_01_05: TcxCheckBox;
    Check_1_01_06: TcxCheckBox;
    Check_1_02_05: TcxCheckBox;
    Check_1_02_06: TcxCheckBox;
    Check_2_01_05: TcxCheckBox;
    Check_2_01_06: TcxCheckBox;
    Check_2_08_05: TcxCheckBox;
    Check_2_08_06: TcxCheckBox;
    Check_2_09_05: TcxCheckBox;
    Check_2_09_06: TcxCheckBox;
    Check_2_10_05: TcxCheckBox;
    Check_2_10_06: TcxCheckBox;
    Shape29: TShape;
    Check_2_11_00: TcxCheckBox;
    Check_2_12_00: TcxCheckBox;
    Check_2_13_00: TcxCheckBox;
    Shape11: TShape;
    Shape12: TShape;
    Check_2_11_01: TcxCheckBox;
    Check_2_11_02: TcxCheckBox;
    Check_2_11_03: TcxCheckBox;
    Check_2_11_04: TcxCheckBox;
    Check_2_11_05: TcxCheckBox;
    Check_2_11_06: TcxCheckBox;
    Check_2_12_06: TcxCheckBox;
    Check_2_12_05: TcxCheckBox;
    Check_2_12_04: TcxCheckBox;
    Check_2_12_03: TcxCheckBox;
    Check_2_12_02: TcxCheckBox;
    Check_2_12_01: TcxCheckBox;
    Check_2_13_01: TcxCheckBox;
    Check_2_13_02: TcxCheckBox;
    Check_2_13_03: TcxCheckBox;
    Check_2_13_04: TcxCheckBox;
    Check_2_13_05: TcxCheckBox;
    Check_2_13_06: TcxCheckBox;
    Shape13: TShape;
    Shape14: TShape;
    Check_2_14_00: TcxCheckBox;
    Check_2_16_00: TcxCheckBox;
    Check_2_17_00: TcxCheckBox;
    Check_2_14_01: TcxCheckBox;
    Check_2_14_02: TcxCheckBox;
    Check_2_14_03: TcxCheckBox;
    Check_2_14_04: TcxCheckBox;
    Check_2_14_05: TcxCheckBox;
    Check_2_14_06: TcxCheckBox;
    Check_2_16_01: TcxCheckBox;
    Check_2_16_02: TcxCheckBox;
    Check_2_16_03: TcxCheckBox;
    Check_2_16_04: TcxCheckBox;
    Check_2_16_05: TcxCheckBox;
    Check_2_16_06: TcxCheckBox;
    Check_2_17_01: TcxCheckBox;
    Check_2_17_02: TcxCheckBox;
    Check_2_17_03: TcxCheckBox;
    Check_2_17_04: TcxCheckBox;
    Check_2_17_05: TcxCheckBox;
    Check_2_17_06: TcxCheckBox;
    Panel3: TPanel;
    Label4: TLabel;
    RichEdit3: TRichEdit;
    Check_2_18_00: TcxCheckBox;
    Check_2_19_00: TcxCheckBox;
    Panel4: TPanel;
    Label5: TLabel;
    RichEdit4: TRichEdit;
    Check_2_20_00: TcxCheckBox;
    Check_2_21_00: TcxCheckBox;
    Check_2_18_01: TcxCheckBox;
    Check_2_19_01: TcxCheckBox;
    Check_2_18_02: TcxCheckBox;
    Check_2_19_02: TcxCheckBox;
    Check_2_18_03: TcxCheckBox;
    Check_2_19_03: TcxCheckBox;
    Check_2_18_04: TcxCheckBox;
    Check_2_19_04: TcxCheckBox;
    Check_2_18_05: TcxCheckBox;
    Check_2_19_05: TcxCheckBox;
    Check_2_18_06: TcxCheckBox;
    Check_2_19_06: TcxCheckBox;
    Check_2_20_01: TcxCheckBox;
    Check_2_20_02: TcxCheckBox;
    Check_2_20_03: TcxCheckBox;
    Check_2_20_04: TcxCheckBox;
    Check_2_20_05: TcxCheckBox;
    Check_2_20_06: TcxCheckBox;
    Check_2_21_06: TcxCheckBox;
    Check_2_21_05: TcxCheckBox;
    Check_2_21_04: TcxCheckBox;
    Check_2_21_03: TcxCheckBox;
    Check_2_21_02: TcxCheckBox;
    Check_2_21_01: TcxCheckBox;
    RGLegge: TcxRadioGroup;
    Shape1: TShape;
    Shape2: TShape;
    Check_1_03_00: TcxCheckBox;
    Check_1_03_01: TcxCheckBox;
    Check_1_03_02: TcxCheckBox;
    Check_1_03_03: TcxCheckBox;
    Check_1_03_04: TcxCheckBox;
    Check_1_03_05: TcxCheckBox;
    Check_1_03_06: TcxCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure Check_00_1PropertiesChange(Sender: TObject);
    procedure Check_1_01_00PropertiesChange(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxLabel2DblClick(Sender: TObject);
    procedure RGLeggePropertiesChange(Sender: TObject);
  private
    procedure StampaModuli(Preview:Boolean);
    function CiStannoGliElenchi: Boolean;
    procedure GeneraBitmapSchemi;
    { Private declarations }
  public
    { Public declarations }
    CopiaPer: Byte;
    procedure EventoQRBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
  end;

var
  StampaDichiarazioneForm: TStampaDichiarazioneForm;

implementation

uses FormHelp, QRDichiarazioneConformita, QRElencoMateriale, QRAll4690Pag1,
  ARAll4690S2QB, QRAll4690Pag3, DataModule1, FormConformita,
  QRRichiestaPrimaAccensione, QRGasDisegno, QRRelazioneTopologicaGas,
  QRRelazioneTopologicaTermo, QRRelazioneTopologicaIdro,
  QRDIchiarazioneConformita4690, QRElencoMateriale_DM37,
  QRNoteDichiarazioneConformita;

{$R *.dfm}

procedure TStampaDichiarazioneForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  StampaDichiarazioneForm := nil;
end;

procedure TStampaDichiarazioneForm.RxSpeedButtonUscitaClick(
  Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TStampaDichiarazioneForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
  inherited;
   HelpForm.Aiuto('');
end;

procedure TStampaDichiarazioneForm.Check_00_1PropertiesChange(
  Sender: TObject);
var
  CurrCheck: TcxCheckBox;
  CC: String;
begin
  inherited;
  CurrCheck := Sender as TcxCheckBox;
  CC := IntToStr(CurrCheck.Tag);
  if Length(CC) = 1 then CC := '0' + CC;

  if (FindComponent('Check_1_01_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_1_01_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_1_02_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_1_02_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_1_03_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_1_03_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;

  if (FindComponent('Check_2_01_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_01_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_08_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_08_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_09_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_09_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_10_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_10_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_11_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_11_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_12_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_12_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_13_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_13_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_14_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_14_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_16_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_16_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_17_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_17_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;

  if (FindComponent('Check_2_18_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_18_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_19_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_19_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;

  if (FindComponent('Check_2_20_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_20_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_2_21_00') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_2_21_'+CC) as TcxCheckBox).Checked := CurrCheck.Checked;
end;

procedure TStampaDichiarazioneForm.Check_1_01_00PropertiesChange(
  Sender: TObject);
var
  CurrCheck: TcxCheckBox;
  CP, CR: String;
begin
  inherited;
  CurrCheck := Sender as TcxCheckBox;
  CP := IntToStr(Trunc(CurrCheck.Tag / 100));
  CR := IntToStr(CurrCheck.Tag - (StrToInt(CP) * 100));
  if Length(CR) = 1 then CR := '0' + CR;

  if (FindComponent('Check_00_1') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_'+CP+'_'+CR+'_01') as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_00_2') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_'+CP+'_'+CR+'_02') as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_00_3') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_'+CP+'_'+CR+'_03') as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_00_4') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_'+CP+'_'+CR+'_04') as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_00_5') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_'+CP+'_'+CR+'_05') as TcxCheckBox).Checked := CurrCheck.Checked;
  if (FindComponent('Check_00_6') as TcxCheckBox).Checked or not CurrCheck.Checked then  (FindComponent('Check_'+CP+'_'+CR+'_06') as TcxCheckBox).Checked := CurrCheck.Checked;
end;


function TStampaDichiarazioneForm.CiStannoGliElenchi: Boolean;
begin
  Result := not (
                  (ConformitaForm.tvApp.DataController.RecordCount       > APPARECCHI_MAX_RIGHE)   // Apparecchi MAX 16 righe
               or (ConformitaForm.tvMateriali.DataController.RecordCount > MATERIALI_MAX_RIGHE)    // Materiali MAX 32 righe
                );
end;



// Procedura che salva le bitmap degli schemo Gas + Termo + Idro per la successiva
//  stampa
procedure TStampaDichiarazioneForm.GeneraBitmapSchemi;
var
  SchemaBMP: TBitMap;
begin
  try
    // Calcola i nomi attuali per le bitmaps degli schemi
    ConformitaForm.SetBitmapsSchemaFileName;
    // Sezione GAS
    SchemaBMP := TBitMap.Create;
    ConformitaForm.StampaSchema(ConformitaForm.Puzzle1, SchemaBMP);
    SchemaBMP.SaveToFile(DM1.CartellaTmp + ConformitaForm.BmpSchemaGasFileName);
    FreeAndNil(SchemaBMP);
    // Sezione TERMO
    SchemaBMP := TBitMap.Create;
    ConformitaForm.StampaSchema(ConformitaForm.PuzzleTermo, SchemaBMP);
    SchemaBMP.SaveToFile(DM1.CartellaTmp + ConformitaForm.BmpSchemaTermoFileName);
    FreeAndNil(SchemaBMP);
    // Sezione IDRO
    SchemaBMP := TBitMap.Create;
    ConformitaForm.StampaSchema(ConformitaForm.PuzzleIdro, SchemaBMP);
    SchemaBMP.SaveToFile(DM1.CartellaTmp + ConformitaForm.BmpSchemaIdroFileName);
    FreeAndNil(SchemaBMP);
  finally
    if Assigned(SchemaBMP) then SchemaBmp.Free;
  end;
end;



procedure TStampaDichiarazioneForm.StampaModuli(Preview:Boolean);
var
  i: Byte;
begin
  // Genera i nome dei files delle bitmaps per la stampa
  GeneraBitmapSchemi;
  // Cicla per tutti i possibili destinatari dei moduli
  for i := 1 to 6 do begin
    // CopiaPer indica quual'è il destinatario della stampa
    CopiaPer := i;
    // =========================================================================
    // Stampa Dichiarazione di Conformità
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_1_01_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_1_01_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      // In base alla selezione di quale legge fa da riferimento stampa la versione corretta della dichiarazione di cofnormità
      if RGLegge.ItemIndex = 0 then begin
        Application.CreateForm(TDichiarazioneConformitaQR, DichiarazioneConformitaQR);
        try
          if Preview then DichiarazioneConformitaQR.Preview else DichiarazioneConformitaQR.Print;
        finally
          DichiarazioneConformitaQR.Free;
        end;
      end else begin
        Application.CreateForm(TDichiarazioneConformita4690QR, DichiarazioneConformita4690QR);
        try
          if Preview then DichiarazioneConformita4690QR.Preview else DichiarazioneConformita4690QR.Print;
        finally
          DichiarazioneConformita4690QR.Free;
        end;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa NOTE Dichiarazione di Conformità
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_1_03_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_1_03_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      // In base alla selezione di quale legge fa da riferimento stampa la versione corretta della dichiarazione di cofnormità
      if RGLegge.ItemIndex = 0 then begin
        Application.CreateForm(TNoteDichiarazioneConformitaQR, NoteDichiarazioneConformitaQR);
        try
          if Preview then NoteDichiarazioneConformitaQR.Preview else NoteDichiarazioneConformitaQR.Print;
        finally
          NoteDichiarazioneConformitaQR.Free;
        end;
      end else begin
        // Nel caso di riferimento alla legge 46/90
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Relazione tipologica materiale utilizzato
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_1_02_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_1_02_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      // In base alla selezione di quale legge fa da riferimento stampa la versione corretta della dichiarazione di cofnormità
      if RGLegge.ItemIndex = 0 then begin
        Application.CreateForm(TElencoMaterialeQR_DM37, ElencoMaterialeQR_DM37);
        try
          ElencoMaterialeQR_DM37.CodiceConf := ConformitaForm.CodiceConformita;
          ElencoMaterialeQR_DM37.DataConf := ConformitaFOrm.DataConformita;
          if Preview then ElencoMaterialeQR_DM37.Preview else ElencoMaterialeQR_DM37.Print;
        finally
          ElencoMaterialeQR_DM37.Free;
        end;
      end else begin
        Application.CreateForm(TElencoMaterialeQR, ElencoMaterialeQR);
        try
          ElencoMaterialeQR.CodiceConf := ConformitaForm.CodiceConformita;
          ElencoMaterialeQR.DataConf := ConformitaFOrm.DataConformita;
          if Preview then ElencoMaterialeQR.Preview else ElencoMaterialeQR.Print;
        finally
          ElencoMaterialeQR.Free;
        end;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato Obbligatorio Gas
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_01_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_01_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      // Prima di tutto controlla se gli elenchi di apparecchi e materiali ci stanno
      //  nei moduli normali, se non ci stano imposta automaticamente la stampa degli elenchi esterni.
      if not CiStannoGliElenchi then (FindComponent('Check_2_14_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked := True;
      // Pag. 1
      try
        Application.CreateForm(TAll4690Pag1QR, All4690Pag1QR);
        if Preview then All4690Pag1QR.Preview else All4690Pag1QR.Print;
      finally
        All4690Pag1QR.Free;
      end;
      // Pag. 2
      try
        Application.CreateForm(TAll4690S2QBQR, All4690S2QBQR);
        All4690S2QBQR.StampaElenchiEsterni := (   (FindComponent('Check_2_14_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked and (FindComponent('Check_2_14_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible   );
        if Preview then All4690S2QBQR.Preview else All4690S2QBQR.Print;
      finally
        All4690S2QBQR.Free;
      end;
      // Pag. 3
      try
        Application.CreateForm(TAll4690Pag3QR, All4690Pag3QR);
        All4690Pag3QR.StampaElenchiEsterni := (   (FindComponent('Check_2_14_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked and (FindComponent('Check_2_14_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible   );
        if Preview then All4690Pag3QR.Preview else All4690Pag3QR.Print;
      finally
        All4690Pag3QR.Free;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Elenco materiali separato allegato obbligatorio
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_14_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_14_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      try
        Application.CreateForm(TRelazioneTopologicaGasQR, RelazioneTopologicaGasQR);
        RelazioneTopologicaGasQR.QRBandDichiara.Enabled := False;
        RelazioneTopologicaGasQR.QRBandCheckGas.Enabled := False;
        RelazioneTopologicaGasQR.QRBandFirmeGas.Enabled := False;
        if Preview then RelazioneTopologicaGasQR.Preview else RelazioneTopologicaGasQR.Print;
      finally
        RelazioneTopologicaGasQR.Free;
      end;
    end;
    // =========================================================================
{
    // =========================================================================
    // Stampa Allegato A
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_02_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_02_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_A.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_A.QR2')
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato B
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_03_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_03_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_B.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_B.QR2')
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato B Note
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_04_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_04_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_B_Note.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_B_Note.QR2')
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato C
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_05_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_05_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_C.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_C.QR2')
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato D
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_06_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_06_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_D.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_D.QR2')
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato D Note
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_07_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_07_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_D_Note.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_D_Note.QR2')
    end;
}
    // =========================================================================
    // =========================================================================
    // Stampa Allegato E
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_08_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_08_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_E.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_E.QR2');
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato I Pag. 1
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_11_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_11_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      // Stampa la prima pagina dell'allegato I
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_I_Pag1.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_I_Pag1.QR2');
      // Stampa la seconda pagina dell'allegato I
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_I_Pag2.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_I_Pag2.QR2');
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato I Pag. 2
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_12_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_12_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_I_Pag2.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_I_Pag2.QR2');
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Allegato I  versione ridotta 1 pag.
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_13_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_13_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'Allegato_I.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'Allegato_I.QR2');
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Autodichiarazione dei requisiti tecnico/professionali
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_09_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_09_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      if   Preview then ConformitaForm.ReportDesignerDialog1.PreviewReport(DM1.ReportDir + 'AutoDichRequisiti.QR2')
      else ConformitaForm.ReportDesignerDialog1.PrintReport(DM1.ReportDir + 'AutoDichRequisiti.QR2');
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Richiesta prima accensione caldaia
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_10_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_10_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      try
        Application.CreateForm(TRichiestaPrimaAccensioneQR, RichiestaPrimaAccensioneQR);
        if Preview then RichiestaPrimaAccensioneQR.Preview else RichiestaPrimaAccensioneQR.Print;
      finally
        RichiestaPrimaAccensioneQR.Free;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Schema impianto GAS
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_16_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_16_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      try
        Application.CreateForm(TGasDisegnoQR, GasDisegnoQR);
        GasDisegnoQR.Sezione := 'Gas';
        if Preview then GasDisegnoQR.Preview else GasDisegnoQR.Print;
      finally
        GasDisegnoQR.Free;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Relazione tipologica GAS
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_17_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_17_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      try
        Application.CreateForm(TRelazioneTopologicaGasQR, RelazioneTopologicaGasQR);
        if Preview then RelazioneTopologicaGasQR.Preview else RelazioneTopologicaGasQR.Print;
      finally
        RelazioneTopologicaGasQR.Free;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Schema impianto TERMO
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_18_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_18_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      try
        Application.CreateForm(TGasDisegnoQR, GasDisegnoQR);
        GasDisegnoQR.Sezione := 'Termo';
        if Preview then GasDisegnoQR.Preview else GasDisegnoQR.Print;
      finally
        GasDisegnoQR.Free;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Relazione tipologica TERMO
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_19_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_19_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      try
        Application.CreateForm(TRelazioneTopologicaTermoQR, RelazioneTopologicaTermoQR);
        if Preview then RelazioneTopologicaTermoQR.Preview else RelazioneTopologicaTermoQR.Print;
      finally
        RelazioneTopologicaTermoQR.Free;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Schema impianto IDRO
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_20_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_20_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      try
        Application.CreateForm(TGasDisegnoQR, GasDisegnoQR);
        GasDisegnoQR.Sezione := 'Idro';
        if Preview then GasDisegnoQR.Preview else GasDisegnoQR.Print;
      finally
        GasDisegnoQR.Free;
      end;
    end;
    // =========================================================================
    // =========================================================================
    // Stampa Relazione tipologica IDRO
    // -------------------------------------------------------------------------
    if  (FindComponent('Check_2_21_0'+IntToStr(CopiaPer)) as TcxCheckBox).Checked
    and (FindComponent('Check_2_21_0'+IntToStr(CopiaPer)) as TcxCheckBox).Visible then begin
      try
        Application.CreateForm(TRelazioneTopologicaIdroQR, RelazioneTopologicaIdroQR);
        if Preview then RelazioneTopologicaIdroQR.Preview else RelazioneTopologicaIdroQR.Print;
      finally
        RelazioneTopologicaIdroQR.Free;
      end;
    end;
    // =========================================================================
  end;
end;

procedure TStampaDichiarazioneForm.EventoQRBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  // Questo gestore di evento imposta la dicitura che indica il destinatario del documento
  //  es: Copia per l'impresa ecc.
  with (Sender.FindComponent('LabelCopiaPer') as TQRLabel) do begin
    case CopiaPer of
      1: Caption := 'Copia per il committente';
      2: Caption := 'Copia per il comune';
      3: Caption := 'Copia per l''impresa';
      4: Caption := 'Copia per la C.C.I.A.A.';
      5: Caption := 'Copia per il distributore';
      6: Caption := '';
    end;
  end;
end;

procedure TStampaDichiarazioneForm.RxSpeedButtonStampaClick(
  Sender: TObject);
begin
  inherited;
  StampaModuli(False);
end;

procedure TStampaDichiarazioneForm.RxSpeedButtonStampaMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if Button = mbRight then StampaModuli(True);
end;

procedure TStampaDichiarazioneForm.cxLabel2DblClick(Sender: TObject);
begin
  inherited;
  ConformitaFOrm.ReportDesignerDialog1.NewReport('', False);
end;

procedure TStampaDichiarazioneForm.RGLeggePropertiesChange(
  Sender: TObject);
var
  RifDM37: Boolean;
begin
  inherited;
  with (Sender as TcxRadioGroup) do begin
    RifDM37 := (ItemIndex = 0);
    Check_1_03_00.Enabled := RifDM37;
    Check_1_03_01.Enabled := RifDM37;
    Check_1_03_02.Enabled := RifDM37;
    Check_1_03_03.Enabled := RifDM37;
    Check_1_03_04.Enabled := RifDM37;
    Check_1_03_05.Enabled := RifDM37;
    Check_1_03_06.Enabled := RifDM37;
  end;
end;

end.
