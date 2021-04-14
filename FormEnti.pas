unit FormEnti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteFilterListAnag, 
  cxEdit, DB, cxDBData, Menus, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, cxContainer, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  Mask, DBCtrls, StdCtrls, ComCtrls, main, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, qrddlgs, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  dxDateRanges, dxScrollbarAnnotations, dxPScxPivotGridLnk, dxPScxSchedulerLnk;

type
  TEntiForm = class(TLevanteFilterListAnagForm)
    QID: TIntegerField;
    QNOME: TStringField;
    QIMP_TERM_ALL_F_STMMOD_FILENAME: TStringField;
    QIMP_TERM_ALL_F_EXPORT_TRACCIATO: TStringField;
    QIMP_TERM_ALL_G_STMMOD_FILENAME: TStringField;
    QIMP_TERM_ALL_G_EXPORT_TRACCIATO: TStringField;
    QNOTE: TStringField;
    tvListID: TcxGridDBColumn;
    tvListNOME: TcxGridDBColumn;
    tvListNOTE: TcxGridDBColumn;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    DBText1: TDBText;
    RichEdit1: TRichEdit;
    dbeDenominazione: TDBEdit;
    dbeNote: TDBEdit;
    Panel1: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    RichEdit2: TRichEdit;
    dbeAllegatoF_ModuloStampa: TcxDBComboBox;
    cxDBComboBox2: TcxDBComboBox;
    dbeAllegatoG_ModuloStampa: TcxDBComboBox;
    cxDBComboBox4: TcxDBComboBox;
    Label5: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    QIMP_TERM_MANUTENTORE_CODICE: TStringField;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    MenuStampe: TPopupMenu;
    AllegatoFimpiantitermici1: TMenuItem;
    AllegatoGimpiantitermici1: TMenuItem;
    Anteprima1: TMenuItem;
    N1copia1: TMenuItem;
    N3copie1: TMenuItem;
    N6copie1: TMenuItem;
    N12copie1: TMenuItem;
    N24copie1: TMenuItem;
    N48copie1: TMenuItem;
    N96copie1: TMenuItem;
    Anteprima2: TMenuItem;
    N1copia2: TMenuItem;
    N3copie2: TMenuItem;
    N6copie2: TMenuItem;
    N12copie2: TMenuItem;
    N24copie2: TMenuItem;
    N48copie2: TMenuItem;
    N96copie2: TMenuItem;
    ReportDesignerDialog1: TReportDesignerDialog;
    QTERM_RCEE1_STMMOD_FILENAME: TStringField;
    QTERM_RCEE1_EXPORT_TRACCIATO: TStringField;
    QFRIGO_RCEE2_STMMOD_FILENAME: TStringField;
    QFRIGO_RCEE2_EXPORT_TRACCIATO: TStringField;
    QSCAMB_RCEE3_STMMOD_FILENAME: TStringField;
    QSCAMB_RCEE3_EXPORT_TRACCIATO: TStringField;
    QCOGEN_RCEE4_STMMOD_FILENAME: TStringField;
    QCOGEN_RCEE4_EXPORT_TRACCIATO: TStringField;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    dbeAllegatoRCEE1_ModuloStampa: TcxDBComboBox;
    cxDBComboBox3: TcxDBComboBox;
    RCEE1gruppitermici1: TMenuItem;
    Anteprima3: TMenuItem;
    N1copia3: TMenuItem;
    N3copie3: TMenuItem;
    N6copie3: TMenuItem;
    N12copie3: TMenuItem;
    N24copie3: TMenuItem;
    N40copie1: TMenuItem;
    N96copie3: TMenuItem;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    dbeAllegatoRCEE1B_ModuloStampa: TcxDBComboBox;
    cxDBComboBox5: TcxDBComboBox;
    Shape16: TShape;
    Panel2: TPanel;
    Label18: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    RichEdit3: TRichEdit;
    dbeAllegatoRCEE2_ModuloStampa: TcxDBComboBox;
    cxDBComboBox10: TcxDBComboBox;
    QTERM_RCEE1B_STMMOD_FILENAME: TStringField;
    QTERM_RCEE1B_EXPORT_TRACCIATO: TStringField;
    procedure cxDBComboBox1PropertiesInitPopup(Sender: TObject);
    procedure cxDBComboBox3PropertiesInitPopup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QBeforePost(DataSet: TDataSet);
    procedure Anteprima1Click(Sender: TObject);
    procedure Anteprima2Click(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ReportDesignerDialog1BeforeExecuteScript(Sender: TObject;
      EventName: string; Script: TStrings; var ExecuteScript: Boolean);
    procedure dbeAllegatoRCEE1_ModuloStampaPropertiesInitPopup(Sender: TObject);
    procedure Anteprima3Click(Sender: TObject);
    procedure dbeAllegatoRCEE1B_ModuloStampaPropertiesInitPopup(
      Sender: TObject);
    procedure dbeAllegatoRCEE2_ModuloStampaPropertiesInitPopup(Sender: TObject);
  private
    procedure StampaAllegatoFVanzotech(Preview:Boolean; PrinterName:String; Copie:Integer=3);
    procedure StampaAllegatoGVanzotech(Preview:Boolean; PrinterName:String; Copie:Integer=3);
    procedure StampaAllegato(NomeFile:String; Preview:Boolean; PrinterName:String; Copie:Integer=3);
    procedure StampaAllegatoFG(TipoAllegato:String; Preview:Boolean; Copie:Integer=3);
  public
    { Public declarations }
  end;

var
  EntiForm: TEntiForm;

implementation

uses DataModule1, QRAllegatoFVanz, Printers, QRAllegatoGVanz;

{$R *.dfm}

procedure TEntiForm.cxDBComboBox1PropertiesInitPopup(Sender: TObject);
var
  sr: TSearchRec;
  Curr: TcxDBComboBox;
begin
    Curr := Sender as TcxDBComboBox;
    Curr.Properties.Items.Clear;
    Curr.Properties.Items.Add('');
    Curr.Properties.Items.Add('Allegato_F a lettura ottica Vanzotech');
    if FindFirst(DM1.ReportDir + 'Allegato_F*.QR*', faAnyFile, sr) = 0 then begin
      try
        repeat
          Curr.Properties.Items.Add(sr.Name);
        until FindNext(sr) <> 0;
      finally
        FindClose(sr);
      end;
    end;
end;

procedure TEntiForm.cxDBComboBox3PropertiesInitPopup(Sender: TObject);
var
  sr: TSearchRec;
  Curr: TcxDBComboBox;
begin
    Curr := Sender as TcxDBComboBox;
    Curr.Properties.Items.Clear;
    Curr.Properties.Items.Add('');
    Curr.Properties.Items.Add('Allegato_G a lettura ottica Vanzotech');
    if FindFirst(DM1.ReportDir + 'Allegato_G*.QR*', faAnyFile, sr) = 0 then begin
      try
        repeat
          Curr.Properties.Items.Add(sr.Name);
        until FindNext(sr) <> 0;
      finally
        FindClose(sr);
      end;
    end;
end;

procedure TEntiForm.dbeAllegatoRCEE1B_ModuloStampaPropertiesInitPopup(
  Sender: TObject);
var
  sr: TSearchRec;
  Curr: TcxDBComboBox;
begin
    Curr := Sender as TcxDBComboBox;
    Curr.Properties.Items.Clear;
    Curr.Properties.Items.Add('');
    if FindFirst(DM1.ReportDir + 'RCEE1B_*.QR*', faAnyFile, sr) = 0 then begin
      try
        repeat
          Curr.Properties.Items.Add(sr.Name);
        until FindNext(sr) <> 0;
      finally
        FindClose(sr);
      end;
    end;
end;

procedure TEntiForm.dbeAllegatoRCEE1_ModuloStampaPropertiesInitPopup(
  Sender: TObject);
var
  sr: TSearchRec;
  Curr: TcxDBComboBox;
begin
    Curr := Sender as TcxDBComboBox;
    Curr.Properties.Items.Clear;
    Curr.Properties.Items.Add('');
    if FindFirst(DM1.ReportDir + 'RCEE1_*.QR*', faAnyFile, sr) = 0 then begin
      try
        repeat
          Curr.Properties.Items.Add(sr.Name);
        until FindNext(sr) <> 0;
      finally
        FindClose(sr);
      end;
    end;
end;

procedure TEntiForm.dbeAllegatoRCEE2_ModuloStampaPropertiesInitPopup(
  Sender: TObject);
var
  sr: TSearchRec;
  Curr: TcxDBComboBox;
begin
    Curr := Sender as TcxDBComboBox;
    Curr.Properties.Items.Clear;
    Curr.Properties.Items.Add('');
    if FindFirst(DM1.ReportDir + 'RCEE2_*.QR*', faAnyFile, sr) = 0 then begin
      try
        repeat
          Curr.Properties.Items.Add(sr.Name);
        until FindNext(sr) <> 0;
      finally
        FindClose(sr);
      end;
    end;
end;

procedure TEntiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  EntiForm := nil;
end;

procedure TEntiForm.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Se l'ID è nullo ne assegna uno nuovo
  if DataSet.FieldByName('ID').IsNull then begin
    DataSet.FieldByName('ID').Value := DM1.Generators_NextGenID('GEN_ID_ENTI');
  end;
end;



// =============================================================================
// INIZIO: STAMPA ALLEGATI VUOTI
// -----------------------------------------------------------------------------
procedure TEntiForm.StampaAllegatoFG(TipoAllegato:String; Preview:Boolean; Copie:Integer=3);
var
  NomeFileAllegato, DedicatedPrinterName: String;
begin
  inherited;
  // Inizializzazione
  TipoAllegato := Uppercase(TipoAllegato);
  // Stampa l'allageto F o G VUOTI
  // Carica il nome dell'eventuale stampante dedicata alla stampa dell'allegato
  DedicatedPrinterName := DM1.TableProgressiviDEFAULTALLEGATIFGPRINTERNAME.AsString;
  // In base al tipo di allegato (F/G) carica il nome del modulo impostato nell'ente
  if      (TipoAllegato) = 'RCEE1'  then NomeFileAllegato := QTERM_RCEE1_STMMOD_FILENAME.AsString
  else if (TipoAllegato) = 'F'      then NomeFileAllegato := QIMP_TERM_ALL_F_STMMOD_FILENAME.AsString
  else if (TipoAllegato) = 'G'      then NomeFileAllegato := QIMP_TERM_ALL_G_STMMOD_FILENAME.AsString
  else Exit;
  // Se è stato scelto di stampare l'allegato G Vanzotech
  if NomeFileAllegato = 'Allegato_G a lettura ottica Vanzotech' then begin
    StampaAllegatoGVanzotech(Preview, DedicatedPrinterName, Copie);
  // Se è stato scelto di stampare l'allegato F Vanzotech
  end else if NomeFileAllegato = 'Allegato_F a lettura ottica Vanzotech' then begin
    StampaAllegatoFVanzotech(Preview, DedicatedPrinterName, Copie);
  // Se invece è stato scelto un modulo normale...
  end else begin
    StampaAllegato(NomeFileAllegato, Preview, DedicatedPrinterName, Copie);
  end;
end;

// Stampa l'allegato F Vanzotech vuoto
procedure TEntiForm.StampaAllegatoFVanzotech(Preview:Boolean; PrinterName:String; Copie:Integer=3);
var
  i: Integer;
begin
  // Creazione report
  Application.CreateForm(TAllegatoFVanzQR, AllegatoFVanzQR);
  AllegatoFVanzQR.Empty := True;
  try
    // Preview
    if Preview then begin
      AllegatoFVanzQR.Preview;
    // Stampa
    end else begin
      DM1.Attendere;
      // Se è stata specificata una stampante apposita per la stampa dell'allegato la imposta
      if Trim(PrinterName) <> '' then AllegatoFVanzQR.PrinterSettings.PrinterIndex := Printer.Printers.IndexOf(PrinterName);
      // Stampa per il n° di copie volute
      for i := 1 to Copie do begin
        AllegatoFVanzQR.Print;
      end;
    end;
  finally
    // Pulizie finali
    DM1.ChiudiAttendere;
    AllegatoFVanzQR.Free;
  end;
end;

// Stampa l'allegato G Vanzotech vuoto
procedure TEntiForm.StampaAllegatoGVanzotech(Preview:Boolean; PrinterName:String; Copie:Integer=3);
var
  i: Integer;
begin
  // Creazione report
  Application.CreateForm(TAllegatoGVanzQR, AllegatoGVanzQR);
  AllegatoGVanzQR.Empty := True;
  try
    // Preview
    if Preview then begin
      AllegatoGVanzQR.Preview;
    // Stampa
    end else begin
      DM1.Attendere;
      // Se è stata specificata una stampante apposita per la stampa dell'allegato la imposta
      if Trim(PrinterName) <> '' then AllegatoGVanzQR.PrinterSettings.PrinterIndex := Printer.Printers.IndexOf(PrinterName);
      // Stampa per il n° di copie volute
      for i := 1 to Copie do begin
        AllegatoGVanzQR.Print;
      end;
    end;
  finally
    // Pulizie finali
    DM1.ChiudiAttendere;
    AllegatoGVanzQR.Free;
  end;
end;

// Stampa l'allegato da file esterno
procedure TEntiForm.StampaAllegato(NomeFile:String; Preview:Boolean; PrinterName:String; Copie:Integer=3);
var
  i: Integer;
  ListOfPrinters:TStrings;
begin
  inherited;
  // Se è stata specificata una stampante apposita per la stampa dell'allegato la imposta
  if Trim(PrinterName) <> '' then ReportDesignerDialog1.PrinterSettings.PrinterIndex := Printer.Printers.IndexOf(PrinterName);
  // Anteprima
  if Preview then begin
     ReportDesignerDialog1.PreviewReport(DM1.ReportDir + NomeFile);
  // Stampa
  end else begin
     DM1.Attendere;
     try
       for i := 1 to Copie do begin
         ReportDesignerDialog1.PrintReport(DM1.ReportDir + NomeFile);
       end;
     finally
       DM1.ChiudiAttendere;
     end;
  end;
end;

// -----------------------------------------------------------------------------
// FINE: STAMPA ALLEGATI VUOTI
// =============================================================================



procedure TEntiForm.Anteprima1Click(Sender: TObject);
var
  Copie: Integer;
  Preview: Boolean;
begin
  inherited;
  // Se necessario sposta il focus altrimenti a volte non prendeva il dato se
  //  era stato appena modificato
  if dbeAllegatoG_ModuloStampa.Focused then begin
    dbeDenominazione.SetFocus;
    dbeAllegatoG_ModuloStampa.SetFocus;
  end;
  // Inizializzazione variabili
  Copie   := (Sender as TMenuItem).Tag;
  Preview := (Copie = 0);
  // Esecuzione
  StampaAllegatoFG('G', Preview, Copie);
end;

procedure TEntiForm.Anteprima2Click(Sender: TObject);
var
  Copie: Integer;
  Preview: Boolean;
begin
  inherited;
  // Se necessario sposta il focus altrimenti a volte non prendeva il dato se
  //  era stato appena modificato
  if dbeAllegatoF_ModuloStampa.Focused then begin
    dbeDenominazione.SetFocus;
    dbeAllegatoF_ModuloStampa.SetFocus;
  end;
  // Inizializzazione variabili
  Copie   := (Sender as TMenuItem).Tag;
  Preview := (Copie = 0);
  // Esecuzione
  StampaAllegatoFG('F', Preview, Copie);
end;

procedure TEntiForm.Anteprima3Click(Sender: TObject);
var
  Copie: Integer;
  Preview: Boolean;
begin
  inherited;
  // Se necessario sposta il focus altrimenti a volte non prendeva il dato se
  //  era stato appena modificato
  if dbeAllegatoRCEE1_ModuloStampa.Focused then begin
    dbeDenominazione.SetFocus;
    dbeAllegatoRCEE1_ModuloStampa.SetFocus;
  end;
  // Inizializzazione variabili
  Copie   := (Sender as TMenuItem).Tag;
  Preview := (Copie = 0);
  // Esecuzione
  StampaAllegatoFG('RCEE1', Preview, Copie);
end;

procedure TEntiForm.ReportDesignerDialog1BeforeExecuteScript(Sender: TObject;
  EventName: string; Script: TStrings; var ExecuteScript: Boolean);
begin
  inherited;
  // IMPORTANTE !!!!!
  // Disabilita l'esecuzione degli scripts che altrimenti darebbero errore
  //  visto che da questa form non ci sono DataSets da usare.
  ExecuteScript := False;
end;

procedure TEntiForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   ClientPoint, ScreenPoint: TPoint;
begin
  inherited;
  // Esegue la conversione delle coordinate dove dovrà apparire il menù
  //  da coordinate client della finestra a coordinate assolute dello schermo.
  //  (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
  ClientPoint.X := RxSpeedButtonStampa.Left + POPUP_X_OFFSET + ClientTopPanel.Left;
  ClientPoint.Y := RxSpeedButtonStampa.Top + POPUP_Y_OFFSET;
  ScreenPoint   := ClientToScreen(ClientPoint);
  // Imposta la proprietà TAG del menù (0=Anteprima, 1=Stampa, 2=Fax, 3=Email)
  MenuStampe.Tag := 0;
  MenuStampe.Popup(ScreenPoint.X, ScreenPoint.Y);
end;

end.
