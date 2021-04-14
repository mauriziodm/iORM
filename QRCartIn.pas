unit QRCartIn;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IniFiles;

type
  TCartaIntestataQR = class(TQuickRep)
    QRBandLogo: TQRBand;
    QRBandLogoPiede: TQRBand;
    ImageIntestazione: TQRImage;
    ImagePiede: TQRImage;
    procedure CartaIntestataQRBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  CartaIntestataQR: TCartaIntestataQR;

implementation

uses DataModule1;

{$R *.DFM}

procedure TCartaIntestataQR.CartaIntestataQRBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   LO : TMemIniFile;
begin
   // Qpre il file che contiene il layout del documento
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   // ----- LOGO AZIENDA -----
    ImageIntestazione.Height := LO.ReadInteger('TestataDocumenti', 'HeadHeight', 0);
    ImageIntestazione.Width  := LO.ReadInteger('TestataDocumenti', 'HeadWidth', 0);
    if (ImageIntestazione.Width > 0)and(ImageIntestazione.Height > 0) then begin
       QRBandLogo.Height  := ImageIntestazione.Height + 6;
       QRBandLogo.Enabled := True;
    end else begin
       QRBandLogo.Height  := 0;
    end;
   // ----- LOGO AZIENDA PIEDE -----
    ImagePiede.Height := LO.ReadInteger('PiedeDocumenti', 'HeadHeight', 0);
    ImagePiede.Width  := LO.ReadInteger('PiedeDocumenti', 'HeadWidth', 0);
    if (ImagePiede.Width > 0)and(ImagePiede.Height > 0) then begin
       QRBandLogoPiede.Height  := ImagePiede.Height + 6;
       QRBandLogoPiede.Enabled := True;
    end else begin
       QRBandLogoPiede.Height  := 0;
       QRBandLogoPiede.Enabled := False;
    end;
    // Carica i Loghi
    ImageIntestazione.Picture.LoadFromFile(DM1.CurrDir + 'INTESTAZ.BMP');
    ImagePiede.Picture.LoadFromFile(DM1.CurrDir + 'piede.bmp');
end;

end.
