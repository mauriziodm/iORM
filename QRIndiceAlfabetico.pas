unit QRIndiceAlfabetico;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, grimgctrl, DB, IBODataset;

type
  TIndiceAlfabeticoQR = class(TQuickRep)
    QRBandHeader1: TQRBand;
    QRGrImageLogoAzienda: TQRGrImage;
    QRGrImage1: TQRGrImage;
    QRLabel1: TQRLabel;
    BandGruppo3: TQRBand;
    QRLabel2: TQRLabel;
    QRDBTextCodiceFornitore: TQRDBText;
    QRDBText2: TQRDBText;
    BandGruppo1: TQRGroup;
    QRShapeGruppo5: TQRPDFShape;
    QRDBTextGruppo5: TQRDBText;
    Qry: TIBOQuery;
    QryID: TIntegerField;
    QryCODICEGRUPPO3: TIntegerField;
    QryDESCRIZIONEGRUPPO3: TStringField;
    QryPAGINA: TIntegerField;
    procedure QRDBTextGruppo5Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure WinControlForm_3Close(Sender: TObject;
      var Action: TCloseAction);
  private

  public

  end;

var
  IndiceAlfabeticoQR: TIndiceAlfabeticoQR;

implementation

uses StrUtils, Dialogs;

{$R *.DFM}

procedure TIndiceAlfabeticoQR.QRDBTextGruppo5Print(sender: TObject;
  var Value: String);
begin
  Value := LeftStr(Value, 2);
end;

procedure TIndiceAlfabeticoQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  Qry.Open;
end;

procedure TIndiceAlfabeticoQR.WinControlForm_3Close(Sender: TObject;
  var Action: TCloseAction);
begin
  IndiceAlfabeticoQR := nil;
end;

end.
