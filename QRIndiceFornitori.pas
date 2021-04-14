unit QRIndiceFornitori;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBODataset, grimgctrl;

type
  TIndiceFornitoriQR = class(TQuickRep)
    QRBandHeader1: TQRBand;
    QRGrImageLogoAzienda: TQRGrImage;
    QRGrImage1: TQRGrImage;
    QRLabel1: TQRLabel;
    Qry: TIBOQuery;
    QryID: TIntegerField;
    QryCODICEGRUPPO4: TIntegerField;
    QryCODICEGRUPPO3: TIntegerField;
    QryDESCRIZIONEGRUPPO4: TStringField;
    QryDESCRIZIONEGRUPPO3: TStringField;
    QryPAGINA: TIntegerField;
    BandLettera: TQRGroup;
    QRShapeGruppo5: TQRPDFShape;
    QRDBTextGruppo5: TQRDBText;
    BandGruppo2: TQRGroup;
    QRDBText1: TQRDBText;
    BandGruppo3: TQRBand;
    QRLabel2: TQRLabel;
    QRDBTextCodiceFornitore: TQRDBText;
    QRDBText2: TQRDBText;
    procedure WinControlForm_1Close(Sender: TObject;
      var Action: TCloseAction);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBTextGruppo5Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  IndiceFornitoriQR: TIndiceFornitoriQR;

implementation

uses StrUtils;

{$R *.DFM}

procedure TIndiceFornitoriQR.WinControlForm_1Close(Sender: TObject;
  var Action: TCloseAction);
begin
  IndiceFornitoriQR := nil;
end;

procedure TIndiceFornitoriQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Qry.Open;
end;

procedure TIndiceFornitoriQR.QRDBTextGruppo5Print(sender: TObject;
  var Value: String);
begin
  Value := LeftStr(Value, 2);
end;

end.
