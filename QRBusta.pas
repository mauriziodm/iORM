unit QRBusta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, Quickrpt, QRCtrls, IniFiles;

type
  TBustaQR = class(TQuickRep)
    QRBandLogo: TQRBand;
    ImageIntestazione: TQRImage;
    procedure BustaQRBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  BustaQR: TBustaQR;

implementation

uses DataModule1;

{$R *.DFM}

procedure TBustaQR.BustaQRBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
   LO : TMemIniFile;
begin
   // Qpre il file che contiene il layout del documento
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   // ----- LOGO AZIENDA -----
    ImageIntestazione.Height := LO.ReadInteger('TestataBusta', 'HeadHeight', 0);
    ImageIntestazione.Width  := LO.ReadInteger('TestataBusta', 'HeadWidth', 0);
    ImageIntestazione.Left   := 339 - ImageIntestazione.Width;
    if (ImageIntestazione.Width > 0)and(ImageIntestazione.Height > 0) then begin
       QRBandLogo.Height  := ImageIntestazione.Height + 6;
       QRBandLogo.Enabled := True;
       ImageIntestazione.Picture.LoadFromFile(DM1.CurrDir + 'Busta.bmp');
    end else begin
       QRBandLogo.Height  := 0;
    end;
end;

end.
