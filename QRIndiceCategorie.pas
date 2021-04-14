unit QRIndiceCategorie;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, grimgctrl, DB, IBODataset;

type
  TIndiceCategorieQR = class(TQuickRep)
    QRBandHeader1: TQRBand;
    QRGrImageLogoAzienda: TQRGrImage;
    QRGrImage1: TQRGrImage;
    QRLabel1: TQRLabel;
    Qry: TIBOQuery;
    QryID: TIntegerField;
    QryCODICEGRUPPO1: TIntegerField;
    QryCODICEGRUPPO2: TIntegerField;
    QryCODICEGRUPPO3: TIntegerField;
    QryDESCRIZIONEGRUPPO1: TStringField;
    QryDESCRIZIONEGRUPPO2: TStringField;
    QryDESCRIZIONEGRUPPO3: TStringField;
    QryPAGINA: TIntegerField;
    BandGruppo1: TQRGroup;
    QRShapeGruppo5: TQRPDFShape;
    QRDBTextGruppo5: TQRDBText;
    BandGruppo2: TQRGroup;
    QRDBText1: TQRDBText;
    BandGruppo3: TQRBand;
    QRDBTextCodiceFornitore: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QryCATALOGO_ORD1: TIntegerField;
    QryCATALOGO_ORD2: TIntegerField;
    QryCATALOGO_ORD3: TIntegerField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure WinControlForm_2Close(Sender: TObject;
      var Action: TCloseAction);
  private

  public

  end;

var
  IndiceCategorieQR: TIndiceCategorieQR;

implementation

{$R *.DFM}

procedure TIndiceCategorieQR.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  Qry.Open;
  // Rende invisibile la prima categoria perchè non la vogliono più
//  BandGruppo1.Height := 0;
end;

procedure TIndiceCategorieQR.WinControlForm_2Close(Sender: TObject;
  var Action: TCloseAction);
begin
  IndiceCategorieQR := nil;
end;

end.
