unit FormApparecchi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag, 
  cxEdit, DB, cxDBData, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, cxContainer, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  Mask, DBCtrls, StdCtrls, ComCtrls, cxGroupBox, cxRadioGroup, Menus,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  Buttons, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon;

type
  TApparecchiForm = class(TLevanteListAnagForm)
    QDESCRIZIONE: TStringField;
    QCATEGORIA: TStringField;
    QMATERIALEAPPARECCHIO: TStringField;
    QSINCHRO: TStringField;
    tvListDESCRIZIONE: TcxGridDBColumn;
    tvListCATEGORIA: TcxGridDBColumn;
    tvListMATERIALEAPPARECCHIO: TcxGridDBColumn;
    tvListSINCHRO: TcxGridDBColumn;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    RichEdit1: TRichEdit;
    DBEDescrizione: TDBEdit;
    DBECategoria: TcxDBComboBox;
    cxDBRadioGroup1: TcxDBRadioGroup;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    Label3: TLabel;
    RichEdit2: TRichEdit;
    DBEBitmapFileName: TDBEdit;
    Image1: TImage;
    QBITMAPFILENAME: TStringField;
    Image2: TImage;
    LabelBitmapFileName2: TLabel;
    DBEBitmapFileName2: TDBEdit;
    QTIPO: TSmallintField;
    DBETipo: TcxDBRadioGroup;
    QBITMAPFILENAME2: TStringField;
    Label2: TLabel;
    DBELettera: TcxDBComboBox;
    QRIFLETTER: TStringField;
    QSEZIONE: TStringField;
    Label5: TLabel;
    DBESezione: TcxDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QBITMAPFILENAMEChange(Sender: TField);
    procedure QAfterScroll(DataSet: TDataSet);
    procedure QTIPOChange(Sender: TField);
    procedure QMATERIALEAPPARECCHIOChange(Sender: TField);
    procedure QBeforePost(DataSet: TDataSet);
  private
    procedure CaricaImmagineApparecchio(FileName, FileName2: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ApparecchiForm: TApparecchiForm;

implementation

uses Main, DataModule1;

{$R *.dfm}

procedure TApparecchiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ApparecchiForm := nil;
end;

procedure TApparecchiForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  inherited;
   // Valori di default
   QMaterialeApparecchio.Value := 'M';
   QSezione.Value := 'GAS';
   QTIPO.Value := 0;
end;

procedure TApparecchiForm.FormCreate(Sender: TObject);
begin
  inherited;
   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;

end;


procedure TApparecchiForm.CaricaImmagineApparecchio(FileName, FileName2:String);
begin
  // Prima controlla se il file esiste
  if (FileName <> '') and FileExists(DM1.PuzzleDir + FileName) then
    // Carica l'immagine dell'apparecchio nel TImage
    Image1.Picture.LoadFromFile(DM1.PuzzleDir + FileName)
  else Image1.Picture.Bitmap := nil;

  // Prima controlla se il file esiste
  if (FileName2 <> '') and FileExists(DM1.PuzzleDir + FileName2) then
    // Carica l'immagine dell'apparecchio nel TImage
    Image2.Picture.LoadFromFile(DM1.PuzzleDir + FileName2)
  else Image2.Picture.Bitmap := nil;
end;


procedure TApparecchiForm.QBITMAPFILENAMEChange(Sender: TField);
var
  BM1, BM2: String;
begin
  inherited;
  BM1 := '';
  BM2 := '';
  if not QBITMAPFILENAME.IsNull then BM1 := QBITMAPFILENAME.AsString;
  if not QBITMAPFILENAME2.IsNull then BM1 := QBITMAPFILENAME2.AsString;
  CaricaImmagineApparecchio(BM1, BM2);
end;

procedure TApparecchiForm.QAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CaricaImmagineApparecchio(QBITMAPFILENAME.AsString, QBITMAPFILENAME2.AsString);
end;

procedure TApparecchiForm.QTIPOChange(Sender: TField);
begin
  inherited;
  // Se l'oggetto attuale è di tipo "tubo" rende visibili anche i datiper la seconda Bitmap
  //  NB: Se l'oggetto corrente fa parte della cetagoria MURI non fa nulla.
  if Q.FieldByName('MATERIALEAPPARECCHIO').AsString <> 'W' then begin
    case QTIPO.AsInteger of
      0: begin
        LabelBitmapFileName2.Visible := False;
        DBEBitmapFileName2.Visible := False;
        Image2.Visible := False;
      end;
      1: begin
        LabelBitmapFileName2.Visible := True;
        DBEBitmapFileName2.Visible := True;
        Image2.Visible := True;
      end;
    end;
  end;
end;

procedure TApparecchiForm.QMATERIALEAPPARECCHIOChange(Sender: TField);
begin
  inherited;
  // Inizializzazione
  DBELettera.Enabled := True;
  // Se l'oggetto attuale è della categoria muro, imposta automaticamente la lettera di riferimento a W e
  //  disabilita il relativo controllo in modo che l'utente non la possa modificare (la W è obbligatoria per
  //  gli oggetti del layer dei muri.
  if Q.FieldByName('MATERIALEAPPARECCHIO').AsString = 'W' then begin
    QRIFLETTER.Value := 'W';
    DBELettera.Enabled := False;
  end else begin
    DBETipo.Visible := True;
    QTIPOChange(QTIPO);
    // Imposta anche l'oggetto come tubo altrimenti non funziona il tracciamento
    //  dei tubi che viene usato anche per i muri.
    QTIPO.Value := 0;
  end;
end;

procedure TApparecchiForm.QBeforePost(DataSet: TDataSet);
begin
  inherited;
   // Marca il record come modificato
   DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
end;

end.
