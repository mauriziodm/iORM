unit FormBaseSetup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Winapi.ShlObj,
  cxShellCommon, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxShellComboBox,
  cxDBShellComboBox, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, MAURI_SB,
  Vcl.ExtCtrls;

type
  TBaseSetupForm = class(TForm)
    STop: TShape;
    Logo: TImage;
    SBottom: TShape;
    LabelExit: TLabel;
    SBExit: TSpeedButtonRollOver;
    Label14: TLabel;
    Label7: TLabel;
    Shape2: TShape;
    LabelNomeAzienda: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    eServerAddress: TEdit;
    eUserName: TEdit;
    ePassword: TEdit;
    Shape1: TShape;
    Label3: TLabel;
    Label8: TLabel;
    eVersione: TEdit;
    ButtonVerifica: TBitBtn;
    Label4: TLabel;
    eLevGenPath: TEdit;
    procedure SBExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonVerificaClick(Sender: TObject);
  private
    { Private declarations }
    procedure CaricaParametri;
    procedure SalvaParametri;
  public
    { Public declarations }
  end;

var
  BaseSetupForm: TBaseSetupForm;

implementation

uses
  DataModule1, System.IniFiles, DComCrypto, Levante.Version.InterfacesAndFactory;

{$R *.dfm}

procedure TBaseSetupForm.ButtonVerificaClick(Sender: TObject);
begin
  if DM1.Messaggi('Impostazioni di base', 'Salvare le impostazioni?', '', [mbYes,mbNo], 0, nil) = mrYes then
    SalvaParametri;
end;

procedure TBaseSetupForm.CaricaParametri;
begin
  // Param.ini
  eServerAddress.Text := DM1.ServerAddress;
  eUserName.Text := DM1.IBUser;
  ePassword.Text := DM1.IBPswd;
  eLevGenPath.Text := DM1.GenDBFile;
  eVersione.Text:= IntToStr(TLevDBVersionFactory.NewDBVersionCheck.GetDBVer);
end;

procedure TBaseSetupForm.FormCreate(Sender: TObject);
begin
  CaricaParametri;
end;

procedure TBaseSetupForm.SalvaParametri;
var
  P: TMemIniFile;
  Tmp: String;
begin
  // Param.ini
  P := TMemIniFile.Create(DM1.CurrDir + 'param.ini');
  try
    P.WriteString('ARCPATH', 'ServerAddress', Trim(eServerAddress.Text));
    P.WriteString('ARCPATH', 'LevGenPath', Trim(eLevGenPath.Text));
    P.WriteString('ARCPATH', 'UserName', Trim(eUserName.Text));
    Tmp := SimpleEncrypt(Trim(ePassword.Text));
    P.WriteString('ARCPATH', 'Password', Tmp);
    P.UpdateFile;
    TLevDBVersionFactory.NewDBVersionCheck.UpdateDBVer(StrToInt(eVersione.Text));
  finally
    FreeAndNil(P);
  end;
end;

procedure TBaseSetupForm.SBExitClick(Sender: TObject);
begin
  if DM1.Messaggi('Impostazioni di base', 'Uscire da Levante?', '', [mbYes,mbNo], 0, nil) = mrYes then
    ExitProcess(0); // Se non uso questo mi va avanti un pò e mi da degli errori
end;

end.
