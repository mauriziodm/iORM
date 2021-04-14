unit FormBackup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, IniFiles, ExtCtrls,
  MAURI_SB, IB_Components, SACS;

const
   // Costanti per il posizionamento dei pannelli
   PANEL_TOP    = 86;
   PANEL_LEFT   = 22;

type
  TBackupForm = class(TForm)
    Image1: TImage;
    LabelCaption: TLabel;
    Shape2: TShape;
    LabelAzienda: TLabel;
    Shape1: TShape;
    Contorno: TShape;
    LabelGiorniTrascorsi: TLabel;
    Label2: TLabel;
    SBAvvisoNO: TSpeedButtonRollOver;
    SBAvvisoSI: TSpeedButtonRollOver;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SBAvvisoNOClick(Sender: TObject);
    procedure AggiornaDataUltimoBackup;
    procedure SBAvvisoSIClick(Sender: TObject);
  private
    { Private declarations }
    SearchRec:TSearchRec;
  public
    { Public declarations }
    Giorni : Integer;
  end;

var
  BackupForm: TBackupForm;

implementation

uses DataModule1, main;

{$R *.DFM}

// Aggiorna la data dell'ultimo backup eseguito
procedure TBackupForm.AggiornaDataUltimoBackup;
var
   Qry : TIB_Cursor;
begin
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.GenDBFile;
      Qry.IB_Connection := DM1.DBGenerale;
      // IMposta la query che preleva i dati del sistema di backup
      Qry.SQL.Add('SELECT BACKUPULTIMO FROM PARAMETRI WHERE RECORDID = 1');
      Qry.Open;
      if Qry.Eof then raise Exception.Create('Record dei parametri non trovato.');
      // Visualizza la data dell'ultimo Backup
      LabelAzienda.Caption := 'L''ultima copia di sicurezza è stata effettuata il:  ' + Qry.FieldByName('BACKUPULTIMO').AsString;
      LabelAzienda.Update;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;


procedure TBackupForm.FormShow(Sender: TObject);
var
   F:TMemIniFile;
   DriveString:String;
begin
   // Visualizza la form in modo che visualizzi il messaggio
   //  del backup scaduto.
   LabelCaption.Caption         := 'ATTENZIONE !';
   LabelGiorniTrascorsi.Caption := 'Sono trascorsi ' + IntToStr(Giorni) + ' giorni dall''ultima copia di sicurezza.';
   // Aggiorna la data dell'ultimo backup
   AggiornaDataUltimoBackup;
   // Emette un suono per attirare l'attenzione
   MessageBeep(MB_ICONEXCLAMATION);
end;

procedure TBackupForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   // Il puntatore alla form := nil
   BackupForm := nil;
end;

procedure TBackupForm.FormCreate(Sender: TObject);
begin
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Copie di sicurezza)';
   // Imposta le dimensioni della form
   Width        := Contorno.Width;
   Height       := Contorno.Height;
end;

procedure TBackupForm.SBAvvisoNOClick(Sender: TObject);
begin
   Close;
end;

procedure TBackupForm.SBAvvisoSIClick(Sender: TObject);
var
   MR : TModalResult;
begin
   // Invia il messaggio di richiesta di esecuzione del backup al Guardian
   MR := SendBackupRequest;
   // Se l'operazione è stata eseguita correttamente chiude tutto e prosegue.
   if MR = mrOk then begin
     Close;
   // Se invece l'operazione è stata annullata dall'utente per qualche motivo...
   end else if MR = mrCancel then begin
     DM1.Messaggi('Levante', 'ATTENZIONE !!!'#13#13'La copia di sicurezza è stata ANNULLATA!', '', [mbOk], 0, nil);
   // Se invece l'operazione è stata annullata dall'utente per qualche motivo...
   end else if MR = mrAbort then begin
     DM1.Messaggi('Levante', 'ATTENZIONE !!!'#13#13'Non è stato possibile effettuare/completare la copia di sicurezza perchè Levante Guardian è occupato oppure si è verificato un errore.', '', [mbOk], 0, nil);
   end;
end;

end.
