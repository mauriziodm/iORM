unit FormRepository;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag,
  cxEdit, DB, cxDBData, Menus, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, Mask, DBCtrls, StdCtrls, ComCtrls, cxContainer,
  cxMemo, cxMaskEdit, cxDropDownEdit, cxRichEdit, cxDBRichEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, Buttons,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, dxDateRanges, dxScrollbarAnnotations;

type
  TRepositoryForm = class(TLevanteListAnagForm)
    QNOMEFILE: TStringField;
    QVERSIONE: TIntegerField;
    QTIPOFILE: TStringField;
    tvListNOMEFILE: TcxGridDBColumn;
    tvListVERSIONE: TcxGridDBColumn;
    tvListTIPOFILE: TcxGridDBColumn;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    DBEMarca: TDBEdit;
    QCONTENUTO: TBlobField;
    eSezione: TcxComboBox;
    eMemo: TcxDBRichEdit;
    QFILEPATH: TStringField;
    QALTROFILE1: TBlobField;
    QALTROFILE2: TBlobField;
    QALTROFILE3: TBlobField;
    QALTROFILE4: TBlobField;
    QALTROFILE5: TBlobField;
    QALTROFILE6: TBlobField;
    tvListFILEPATH: TcxGridDBColumn;
    Conversioni1: TMenuItem;
    N1: TMenuItem;
    Conversioneimpiantipernuovagestioneassistenzasolo1volta1: TMenuItem;
    ConversionegeneratoridicaloredaallegatiFGaRCEE11: TMenuItem;
    Conver1: TMenuItem;
    PanelTop: TPanel;
    Panel18: TPanel;
    ButtonRepository: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure eSezionePropertiesInitPopup(Sender: TObject);
    procedure eSezionePropertiesEditValueChanged(Sender: TObject);
    procedure QBeforePost(DataSet: TDataSet);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure Conversioneimpiantipernuovagestioneassistenzasolo1volta1Click(
      Sender: TObject);
    procedure ConversionegeneratoridicaloredaallegatiFGaRCEE11Click(
      Sender: TObject);
    procedure Conver1Click(Sender: TObject);
    procedure ButtonRepositoryClick(Sender: TObject);
    procedure ClientAreaResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RepositoryForm: TRepositoryForm;

implementation

uses DataModule1, IniFiles, DataModule2, IB_Components,
  FormConversioneSoggetti;

{$R *.dfm}

procedure TRepositoryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  RepositoryForm := nil;
end;

procedure TRepositoryForm.eSezionePropertiesInitPopup(Sender: TObject);
var
  T: TMemIniFile;
begin
  inherited;
  // Per caricare l'elenco delle sezioni, prima bisogna che salva
  //  il file in modo temporaneo
  eMemo.Lines.SaveToFile(DM1.CartellaTmp + 'tmpini.ini');
  // Poi apre il file INI temporaneo e ne carica l'elenco delle sezioni.
  T := TMemIniFile.Create(DM1.CartellaTmp + 'tmpini.ini');
  try
    eSezione.Properties.Items.Clear;
    T.ReadSections(eSezione.Properties.Items);
    eSezione.Properties.Sorted := True;
  finally
    T.Free;
  end;
end;

procedure TRepositoryForm.eSezionePropertiesEditValueChanged(
  Sender: TObject);
var
  FindAt: Longint;
  SearchFor: String;
begin
  inherited;
  SearchFor := Trim(eSezione.Text);
  if SearchFor = '' then Exit;
  SearchFor := '[' + SearchFor + ']';
  FindAt := eMemo.FindText(SearchFor, 0, Length(eMemo.Text), []);
  if FindAt <> -1 then begin
    eMemo.SetFocus;
    eMemo.SelStart := Length(eMemo.Text)-1;
    eMemo.SelLength := 0;
    eMemo.SelStart := FindAt;
    eMemo.SelLength := Length(SearchFor);  
  end else begin
    ShowMessage('Testo non trovato!');
  end;
end;

procedure TRepositoryForm.QBeforePost(DataSet: TDataSet);
begin
  // Incrementa la versione
  QVERSIONE.Value := QVERSIONE.AsInteger + 1;
end;

procedure TRepositoryForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
   if PanelGriglia.Visible then begin
      inherited;
   end else begin
      // Griglia visibile che copre il resto
      PanelGriglia.Visible                     := True;
      // Disattiva la scroll bar verticale della Client Area
      ClientArea.VertScrollBar.Visible := False;
      // Risistema i pulsanti per la fase di elenco
      RxSpeedModifica.Enabled           := False;
      RxSpeedButtonVisualizza.Enabled   := True;
   end;
end;

procedure TRepositoryForm.ButtonRepositoryClick(Sender: TObject);
begin
  inherited;
  // Va alla nuova conformità
  DM1.Attendere;
  try
    DM1.LDE_EmbeddedParams;
  finally
    DM1.ChiudiAttendere;
  end;
end;

procedure TRepositoryForm.ClientAreaResize(Sender: TObject);
begin
  inherited;
  PanelGruppo1.Height := ClientArea.Height;
end;

procedure TRepositoryForm.Conver1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TConversioneSoggettiForm, ConversioneSoggettiForm);
  ConversioneSoggettiForm.ShowModal;
end;

procedure TRepositoryForm.ConversionegeneratoridicaloredaallegatiFGaRCEE11Click(
  Sender: TObject);
var
  Qry: TIB_Cursor;
begin
  // Conferme
  if DM1.Messaggi('Conversione Impianti', 'Proseguire con la conversione?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  if DM1.Messaggi('Conversione Impianti', 'ATTENZIONE!!!'#13#13'Questa procedura deve essere eseguita una sola volta.'#13#13'Sei sicuro che non sia mai stata eseguita prima d''ora?', 'NB: Se è stata eseguita precedentemente si potrebbe verificare una PERDITA DI DATI!!!', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  if DM1.Messaggi('Conversione Impianti', 'Ultima conferma'#13#13'Prima di avviare la procedura eseguire una COPIA DI SICUREZZA.'#13#13'Proseguire?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    DM1.ShowWait('Conversione da allegati F/G a RCEE1 per i generatori di calore', 'Start transaction');
    // Avvia la transazione
    DM1.DBAzienda.StartTransaction;
    try
      // Imposta la query per avere il numero degli impainti da convertire
      Qry.SQL.Add('UPDATE PRATAPPARECCHI SET ALLEGATO = ''RCEE1 - gruppi termici'' WHERE ALLEGATO = ''G - impianti termici'' OR ALLEGATO = ''F - impianti termici''');
      Qry.ExecSQL;
      // Commit
      DM1.ShowWait('Conversione da allegati F/G a RCEE1 per i generatori di calore', 'Commit transaction');
      DM1.DBAzienda.Commit;
      // Messaggio finale
      DM1.Messaggi('Conversione da allegati F/G a RCEE1 per i generatori di calore', 'Operazione completata.', '', [mbOk], 0, nil);
    except
      // Rollback
      DM1.ShowWait('Conversione da allegati F/G a RCEE1 per i generatori di calore', 'Rollback transaction');
      DM1.DBAzienda.Rollback;
      // Re-Raise dell'eccezione altrimenti non ci accorgiamo che c'è stato un errore
      raise;
    end;
  finally
    // Pulizie finali
    DM1.CloseWait;
    Qry.Free;
  end;
end;

procedure TRepositoryForm.Conversioneimpiantipernuovagestioneassistenzasolo1volta1Click(
  Sender: TObject);
begin
  inherited;
  // Avvia la conversione
  DM2.AvviaConversioneImpianti;
end;

end.
