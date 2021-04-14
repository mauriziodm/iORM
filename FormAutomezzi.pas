unit FormAutomezzi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag, cxCustomData, 
  cxEdit, DB, cxDBData, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, DBCtrls, Mask, StdCtrls, ComCtrls, Menus, cxStyles,
  cxGraphics, cxFilter, cxData, cxDataStorage, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxSchedulerLnk,
  dxPScxPivotGridLnk, dxPScxEditorProducers, dxPScxExtEditorProducers, dxPSCore,
  dxPScxCommon, cxContainer, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit;

type
  TAutomezziForm = class(TLevanteListAnagForm)
    QCODICE: TIntegerField;
    QMARCA: TStringField;
    QMODELLO: TStringField;
    QTARGA: TStringField;
    QSCADENZABOLLO: TDateTimeField;
    QSCADENZAASSICURAZIONE: TDateTimeField;
    QPROSSIMAMANUTENZIONEKM: TIntegerField;
    QPROSSIMOCOLLAUDO: TDateTimeField;
    QPROSSIMOBOLLINOBLU: TDateTimeField;
    QKMATTUALI: TIntegerField;
    QNOTE: TMemoField;
    tvListCODICE: TcxGridDBColumn;
    tvListMARCA: TcxGridDBColumn;
    tvListMODELLO: TcxGridDBColumn;
    tvListTARGA: TcxGridDBColumn;
    tvListSCADENZABOLLO: TcxGridDBColumn;
    tvListSCADENZAASSICURAZIONE: TcxGridDBColumn;
    tvListPROSSIMAMANUTENZIONEKM: TcxGridDBColumn;
    tvListPROSSIMOCOLLAUDO: TcxGridDBColumn;
    tvListPROSSIMOBOLLINOBLU: TcxGridDBColumn;
    tvListKMATTUALI: TcxGridDBColumn;
    tvListNOTE: TcxGridDBColumn;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    DBEMarca: TDBEdit;
    DBEModello: TDBEdit;
    DBEdit2: TDBEdit;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    RichEdit2: TRichEdit;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    Panel2: TPanel;
    Label14: TLabel;
    RichEdit3: TRichEdit;
    DBMemo1: TDBMemo;
    QSINCHRO: TStringField;
    DBText1: TDBText;
    eScadenzaBollo: TcxDBDateEdit;
    eScadenzaAssicurazione: TcxDBDateEdit;
    eProxCollaudoEntro: TcxDBDateEdit;
    eProxBollinoEntro: TcxDBDateEdit;
    procedure QBeforePost(DataSet: TDataSet);
    procedure tvListDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AutomezziForm: TAutomezziForm;

implementation

uses DataModule1, FormRappGiorn, SchedaClienti;

{$R *.dfm}

procedure TAutomezziForm.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Se il codice non c'è lo assegna automaticamente
  if Trim(Q.FieldByName('CODICE').AsString) = '' then begin
    Q.FieldByName('CODICE').Value := DM1.NextCodice('AUTOMEZZI', 'CODICE');
  end;
end;

procedure TAutomezziForm.tvListDblClick(Sender: TObject);
var
   Automezzo:String;
begin
  inherited;
  // Se è in modalità archivio esce subito
  if Self.DblClickMode = DblClickModeArchive then Exit;
  // Construisce il Nome e cognome del dipendente
  Automezzo := '';
  if not QMARCA.IsNull then Automezzo := Trim(QMARCA.AsString);
  if not QMODELLO.IsNull then begin
    if Length(Trim(Automezzo)) > 0 then Automezzo := Automezzo + ' ';
    Automezzo := Automezzo + Trim(QMODELLO.AsString);
  end;
  if not QTARGA.IsNull then begin
    if Length(Trim(Automezzo)) > 0 then Automezzo := Automezzo + ' ';
    Automezzo := Automezzo + '  (' + Trim(QTARGA.AsString) + ')';
  end;
  // ===========================================================================
  // Se invece è in modalità di selezione...
  // ---------------------------------------------------------------------------
  // RIGO RAPPORTO GIORNALIERO SPESE
  if Self.CallerCode = 2 then begin
    with RappGiornForm.tvSpese.DataController do begin
      // Imposta valori ottenuti
      Values[FocusedRecordIndex, RappGiornForm.tvSpeseCODAUTOMEZZO.Index] := QCODICE.AsInteger;
      Values[FocusedRecordIndex, RappGiornForm.tvSpeseDESCRIZAUTOMEZZO.Index] := Automezzo;
    end;

  // FILTRO GOS SPESE
  end else if Self.CallerCode = 3 then begin
    ClientiForm.FilterGosSpeseCodiceAutomezzo.Text := QCODICE.AsString;
    ClientiForm.FilterGosSpeseDescrizAutomezzo.Text := Automezzo;

  end;
  // ===========================================================================
  // Chiude la form per formare alla form chiamante
  Self.Close;
end;

procedure TAutomezziForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AutomezziForm := nil;
end;

end.
