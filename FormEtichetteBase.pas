unit FormEtichetteBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormLevanteFilterListAnag, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Vcl.Menus, IBODataset, Vcl.Buttons, bmpPanel, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, cxTextEdit, frxClass, frxDBSet, frxBarcode, frxDesgn,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon;

type
  TEtichetteBaseForm = class(TLevanteFilterListAnagForm)
    QNOMEFILE: TStringField;
    QFILEPATH: TStringField;
    QCONTENUTO: TBlobField;
    QTIPOFILE: TStringField;
    QPRINTER: TStringField;
    tvListNOMEFILE: TcxGridDBColumn;
    tvListFILEPATH: TcxGridDBColumn;
    tvListTIPOFILE: TcxGridDBColumn;
    tvListPRINTER: TcxGridDBColumn;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxDBDatasetSoggetti: TfrxDBDataset;
    QryLabSogg: TIBOQuery;
    QryLabSoggCODICESTAZIONE: TStringField;
    QryLabSoggPROGRIGO: TIntegerField;
    QryLabSoggCODICE: TIntegerField;
    QryLabSoggRAGIONESOCIALE: TStringField;
    QryLabSoggINDIRIZZO: TStringField;
    QryLabSoggNUMCIVICO: TStringField;
    QryLabSoggCITTA: TStringField;
    QryLabSoggCAP: TStringField;
    QryLabSoggPROVINCIA: TStringField;
    QryLabSoggJOLLY1: TStringField;
    QryLabSoggJOLLY2: TStringField;
    QryLabSoggJOLLY3: TStringField;
    QryLabSoggJOLLY4: TStringField;
    QryLabSoggJOLLY5: TStringField;
    QryLabSoggJOLLY6: TStringField;
    QryLabSoggJOLLY7: TStringField;
    QryLabSoggJOLLY8: TStringField;
    QryLabSoggJOLLY9: TStringField;
    QryLabSoggJOLLY10: TStringField;
    QryLabArt: TIBOQuery;
    QryLabArtCODICESTAZIONE: TStringField;
    QryLabArtPROGRIGO: TIntegerField;
    QryLabArtCODICEARTICOLO: TStringField;
    QryLabArtDESCRIZIONE: TStringField;
    QryLabArtDESCRIZIONE2: TStringField;
    QryLabArtDESCRIZIONE3: TStringField;
    QryLabArtDESCRIZIONE4: TStringField;
    QryLabArtDESCRIZIONE5: TStringField;
    QryLabArtUNITADIMISURA: TStringField;
    QryLabArtPREZZODIVENDITA: TIBOFloatField;
    QryLabArtPREZZODIVENDITA2: TIBOFloatField;
    QryLabArtPREZZODIVENDITA3: TIBOFloatField;
    QryLabArtPREZZODIVENDITA4: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP1: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP2: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP3: TIBOFloatField;
    QryLabArtPRZVENDIVACOMP4: TIBOFloatField;
    QryLabArtBARCODE: TStringField;
    QryLabArtMARCA: TStringField;
    QryLabArtTIPODOCUMENTO: TStringField;
    QryLabArtREGISTRO: TStringField;
    QryLabArtNUMORDPREV: TIntegerField;
    QryLabArtDATADOCUMENTO: TDateTimeField;
    QryLabArtCODICECLIENTE: TIntegerField;
    QryLabArtJOLLY1: TStringField;
    QryLabArtJOLLY2: TStringField;
    QryLabArtJOLLY3: TStringField;
    QryLabArtJOLLY4: TStringField;
    QryLabArtJOLLY5: TStringField;
    QryLabArtJOLLY6: TStringField;
    QryLabArtJOLLY7: TStringField;
    QryLabArtJOLLY8: TStringField;
    QryLabArtJOLLY9: TStringField;
    QryLabArtJOLLY10: TStringField;
    QryLabArtCODICEFORNITORE: TStringField;
    QryLabArtDESCRIZIONEFORNITORE: TStringField;
    frxDBDatasetArticoli: TfrxDBDataset;
    procedure tvListTIPOFILEGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure LoadReport; virtual;
    procedure SaveReport; virtual;
  public
    { Public declarations }
  end;

var
  EtichetteBaseForm: TEtichetteBaseForm;

implementation

{$R *.dfm}

uses DataModule1;

procedure TEtichetteBaseForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Impostazione query
  QryLabSogg.SQL.Clear;
  QryLabSogg.SQL.Add('SELECT LS.* FROM LABSOGG LS WHERE LS.CODICESTAZIONE = ' + QuotedStr(DM1.CodiceUtente) + ' ORDER BY LS.RAGIONESOCIALE, LS.PROGRIGO');
  QryLabArt.SQL.Clear;
  QryLabArt.SQL.Add('SELECT LA.* FROM LABART LA WHERE LA.CODICESTAZIONE = ' + QuotedStr(DM1.CodiceUtente) + ' ORDER BY LA.DESCRIZIONE, LA.PROGRIGO');
end;

procedure TEtichetteBaseForm.LoadReport;
var
  Stream: TMemoryStream;
begin
  // Campo vuoto, non è stato ancora salvato alcun report
  if QCONTENUTO.IsNull then begin
    frxReport1.Clear;
  // Se invece nel campo è contenuto qualcosa lo carica
  end else begin
    Stream := TMemoryStream.Create;
    try
      QCONTENUTO.SaveToStream(Stream);
      Stream.Position := 0;
      frxReport1.LoadFromStream(Stream);
      // Se specificata una stampante predefinita la carica
      //  e fa in modo che non la chieda ogni volta
      if (Trim(QPRINTER.AsString) <> '') then begin
        frxReport1.PrintOptions.Printer := QPRINTER.AsString;
        frxReport1.PrintOptions.ShowDialog := False;
      end;
    finally
      Stream.Free;
    end;
  end;
end;


procedure TEtichetteBaseForm.SaveReport;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  try
    frxReport1.SaveToStream(Stream);
    Stream.Position := 0;
    QCONTENUTO.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TEtichetteBaseForm.tvListTIPOFILEGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  inherited;
  if      AText = 'LABART'  then AText := 'Etichette articoli'
  else if AText = 'LABSOGG' then AText := 'Etichette soggetti';
end;

end.
