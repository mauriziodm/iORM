unit QRRelazioneTopologicaIdro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRRelazioneTopologicaGas, QuickRpt, QRCtrls, ExtCtrls;

type
  TRelazioneTopologicaIdroQR = class(TRelazioneTopologicaGasQR)
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelazioneTopologicaIdroQR: TRelazioneTopologicaIdroQR;

implementation

uses DataModule1;

{$R *.dfm}

procedure TRelazioneTopologicaIdroQR.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  // Imposta i check per la sezione Idro
  CheckCE.Enabled     := (DM1.TableConformitaIDROTIPAPP_CE.AsString = '1');
  CheckUNI.Enabled    := (DM1.TableConformitaIDROTIPMAT_UNI.AsString = '1');
  CheckAltro.Enabled  := (DM1.TableConformitaIDROTIPMAT_ALTRO.AsString = '1');
end;

end.
