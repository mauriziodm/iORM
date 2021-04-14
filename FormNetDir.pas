unit FormNetDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DBCtrls, IniFiles, Buttons,
  MAURI_SB;

type
  TNetDirForm = class(TForm)
    PanelRete: TPanel;
    Label2: TLabel;
    EditServerAddress: TEdit;
    Memo1: TMemo;
    SBUtenteCancel: TSpeedButtonRollOver;
    SBUtenteOK: TSpeedButtonRollOver;
    Shape2: TShape;
    TitoloAzienda: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBUtenteOKClick(Sender: TObject);
    procedure SBUtenteCancelClick(Sender: TObject);
    procedure SBAziendaOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NetDirForm: TNetDirForm;

implementation

uses DataModule1, main;

{$R *.DFM}

procedure TNetDirForm.FormCreate(Sender: TObject);
begin
   // Posiziona e dimensione la finestra
   MainForm.StartFrame.PosizionaSottopannelli(Self);
   // Imposta i colori dello sfondo della form
   PanelRete.Color      := COLOR_LOGIN_OPZIONI;
   PanelRete.Align      := alClient;
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Percorso di rete)';
end;

procedure TNetDirForm.FormShow(Sender: TObject);
var
   P: TMemIniFile;
begin
     DM1.FocusRefresh;
     // Carica l'indirizo del server nel controllo
     // NB: Il ServerAddress è l'unico parametro che prende ancor dal param.ini originario
     //      presente nella cartella di esecuzione di Levante.
     P := TMemIniFile.Create(DM1.CurrDir + 'param.ini');
      EditServerAddress.Text := P.ReadString('ARCPATH', 'ServerAddress', '');
     P. Free;
     // Imposta i colori dello sfondo della form
     PanelRete.Color   := COLOR_LOGIN_OPZIONI;
     PanelRete.Left    := 0;
     PanelRete.Top     := 0;
     PanelRete.Align   := alClient;
end;

procedure TNetDirForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   NetDirForm := nil;
end;

procedure TNetDirForm.SBUtenteOKClick(Sender: TObject);
var
   P:TMemIniFile;
begin
   // Se il parametro è vuoto lo imposta automaticamente a LOCAL
   if Trim(EditServerAddress.Text) = '' then EditServerAddress.Text := 'LOCAL';
   // Salva
   //  NB: IL ServerAddress è l'unico parametri che prende ancora dal param.ini originario
   //       nella cartella di esecuzione di Levante,
   P := TMemIniFile.Create(DM1.CurrDir + 'param.ini');
    P.WriteString('ARCPATH', 'ServerAddress', EditServerAddress.Text);
    P.UpdateFile;
   P.Free;
   // Chiude la form
   Close;
   // Riavvia tutto
//   MainForm.FormShow(Self);
   MainForm.VisualizzaAvvio(False);
end;

procedure TNetDirForm.SBUtenteCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TNetDirForm.SBAziendaOKClick(Sender: TObject);
var
   P:TMemIniFile;
begin
   // Se il parametro è vuoto lo imposta automaticamente a LOCAL
   if Trim(EditServerAddress.Text) = '' then EditServerAddress.Text := 'LOCAL';
   // Salva
   //  NB: il ServerAddress è l'unico parametro che prende ancora dal param.ini originario
   //       dalla directory di esecuzione di Levante.
   P := TMemIniFile.Create(DM1.CurrDir + 'param.ini');
    P.WriteString('ARCPATH', 'ServerAddress', EditServerAddress.Text);
    P.UpdateFile;
   P.Free;
   // Chiude la form
   Close;
   // Riavvia tutto
//   MainForm.FormShow(Self);
   MainForm.VisualizzaAvvio(False);
end;

end.
