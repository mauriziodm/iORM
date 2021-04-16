unit FormTipiRighi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag, 
  cxEdit, DB, cxDBData, Menus, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, cxMemo, Mask, DBCtrls, StdCtrls, ComCtrls, DataMOdule1,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  Buttons, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, dxDateRanges, dxScrollbarAnnotations, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxPivotGridLnk, dxPScxSchedulerLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon, cxContainer, cxCheckBox, cxDBEdit, System.ImageList, Vcl.ImgList;

type
  TTipiRighiForm = class(TLevanteListAnagForm)
    QDESCRIZIONE: TStringField;
    QLIVELLO: TStringField;
    QNOTE: TMemoField;
    tvListDESCRIZIONE: TcxGridDBColumn;
    tvListLIVELLO: TcxGridDBColumn;
    tvListNOTE: TcxGridDBColumn;
    Panel2: TPanel;
    Label14: TLabel;
    RichEdit3: TRichEdit;
    DBMemo1: TDBMemo;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    DBEMarca: TDBEdit;
    QSINCHRO: TStringField;
    eAbilitato: TcxDBCheckBox;
    QABILITATO: TStringField;
    tvListABILITATO: TcxGridDBColumn;
    ImageList1: TImageList;
    procedure QBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure tvListABILITATOGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvListDataControllerSortingChanged(Sender: TObject);
  private
    fLivello: Byte;
    procedure SetLivello(const Value: Byte);
    procedure CaricaTitoli;
    { Private declarations }
  public
    { Public declarations }
    property Livello:Byte read fLivello write SetLivello;
  end;

var
  TipiRighiForm: TTipiRighiForm;

implementation

uses IniFiles, dxCore;

{$R *.dfm}

{ TTipiRighiForm }

procedure TTipiRighiForm.SetLivello(const Value: Byte);
begin
  fLivello := Value;
  if Q.Active then Q.Close;
  if not Q.Prepared then Q.Prepare;
  Q.Params.ParamByName('P_LIVELLO').AsInteger := Value;
end;

procedure TTipiRighiForm.tvListABILITATOGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := '';
end;

procedure TTipiRighiForm.tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Se il record attuale è disabilitato..
  if AViewInfo.GridRecord.DisplayTexts[tvListABILITATO.Index] <> 'T' then
  begin
    // Imposta un colore da secondo piano
    ACanvas.Font.Color := clGray;
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clSilver;
    // Se stiamo proprio traccianto la colonna ENABLED...
    if AViewInfo.Item.Index = tvListABILITATO.Index then begin
      // Disegna il rettangolo di sfondo
      ACanvas.FillRect(AViewInfo.Bounds);
      // Disegna la Bitmap del divietino per indicare che è un apparecchio dismesso
      ACanvas.DrawImage(ImageList1, (AViewInfo.Bounds.Left + AViewInfo.Bounds.Right - ImageList1.Width) div 2, (AViewInfo.Bounds.Top + AViewInfo.Bounds.Bottom - ImageList1.Height) div 2, 0);
      // Custom Draw
      ADone := True;
    end;
  end
  // Se invece è una riga normale (abilitata) forso il colore dello sfondo
  //  perchè altrimenti sarebbe con lettura facilitata ma siccome ho aggiunto il grigio scuro per
  //  le righe disabilitate mi sembravano troppi colori
  else
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clWhite;
end;

procedure TTipiRighiForm.tvListDataControllerSortingChanged(Sender: TObject);
begin
  inherited;
  tvListABILITATO.SortOrder := TdxSortOrder.soDescending;
  tvListABILITATO.SortIndex := 0;
end;

procedure TTipiRighiForm.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  QLIVELLO.AsInteger := Self.Livello;
end;

procedure TTipiRighiForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  inherited;
  QABILITATO.Value := 'T';
end;

procedure TTipiRighiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipiRighiForm := nil;
end;

procedure TTipiRighiForm.CaricaTitoli;
var
  MENU: TMemIniFile;
  ParamName, DefaultValue: String;
begin
  MENU := TMemIniFile.Create(DM1.Repository_Menu.FullLocalFileName);
  try
    ParamName := 'TipoRigo' + IntToStr(Livello) + 'MenuCaption';
    DefaultValue := 'Tipo di righi ' + IntToStr(Livello);
    RichEdit1.Text := MENU.ReadString('TitoliTipiRighi', ParamName, DefaultValue)
  finally
    MENU.Free;
  end;
end;

procedure TTipiRighiForm.FormShow(Sender: TObject);
begin
  inherited;
  CaricaTitoli;
end;

end.
