unit FormAbout;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, MAURI_SB, JclSysInfo;

type
  TAboutForm = class(TForm)
    MainPanel: TPanel;
    STop: TShape;
    Logo: TImage;
    Shape1: TShape;
    LabelExit: TLabel;
    SBExit: TSpeedButtonRollOver;
    Version: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    IPAddress: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBExitClick(Sender: TObject);
    procedure LabelExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutForm: TAboutForm;

implementation

uses main;

{$R *.DFM}

procedure TAboutForm.OKButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
begin
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Version.Caption := 'Versione:  ' + MainForm.VersioneApplicazione;
   IPAddress.Caption := 'Indirizzo IP:   ' + GetIPAddress('');
   // Calcola le dimensioni della form
   Self.Width  := MainPanel.Width;
   Self.Height := MainPanel.Height;
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   ABoutForm := nil;
end;

procedure TAboutForm.SBExitClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutForm.LabelExitClick(Sender: TObject);
begin
  Close;
end;

end.
 
