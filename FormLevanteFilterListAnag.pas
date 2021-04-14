unit FormLevanteFilterListAnag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag,
  cxEdit, DB, cxDBData, Menus, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, Buttons, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon, dxDateRanges,
  dxScrollbarAnnotations;

type
  TLevanteFilterListAnagForm = class(TLevanteListAnagForm)
    PanelFiltri: TPanel;
    SubPanelFiltri: TPanel;
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject); override;
    procedure RxSpeedButtonUscitaClick(Sender: TObject); override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LevanteFilterListAnagForm: TLevanteFilterListAnagForm;

implementation



{$R *.dfm}

{ TLevanteFilterListAnagForm }


procedure TLevanteFilterListAnagForm.RxSpeedButtonVisualizzaClick(
  Sender: TObject);
begin
  inherited;

  RxSpeedButtonResetQuery.Enabled := False;
end;

procedure TLevanteFilterListAnagForm.RxSpeedButtonUscitaClick(
  Sender: TObject);
begin
  // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
  if not PanelGriglia.Visible then begin
    // Risistema i pulsanti per la fase di elenco
    RxSpeedButtonResetQuery.Enabled := True;
  end;

  inherited;
end;

end.
