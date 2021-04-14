unit FormPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, MAURI_SB, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TPasswordForm = class(TForm)
    MainPanel: TPanel;
    MainImage: TImage;
    SBExit: TSpeedButtonRollOver;
    LabelMsg: TLabel;
    ePassword: TcxTextEdit;
    SBCreaIntervento: TSpeedButtonRollOver;
    procedure SBExitClick(Sender: TObject);
    procedure SBCreaInterventoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ePasswordKeyPress(Sender: TObject; var Key: Char);
  private
    FPassword: String;
    procedure SetPassword(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Password:String read FPassword write SetPassword;
  end;

var
  PasswordForm: TPasswordForm;

implementation

{$R *.dfm}

{ TPasswordForm }

procedure TPasswordForm.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TPasswordForm.SBExitClick(Sender: TObject);
begin
  Self.ModalResult := mrNo;
end;

procedure TPasswordForm.SBCreaInterventoClick(Sender: TObject);
begin
  if ePassword.Text = Password
  then Self.ModalResult := mrYes
  else raise Exception.Create('Password errata!');
end;

procedure TPasswordForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  PasswordForm := nil;
end;

procedure TPasswordForm.FormShow(Sender: TObject);
begin
  MessageBeep(MB_ICONEXCLAMATION);
end;

procedure TPasswordForm.ePasswordKeyPress(Sender: TObject; var Key: Char);
begin
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then SBCreaInterventoClick(SBCreaIntervento);
end;

end.
