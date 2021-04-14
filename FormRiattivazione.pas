unit FormRiattivazione;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UnitDemoProtection, ExtCtrls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit;

type
  TRiattivazioneForm = class(TForm)
    BtnOK: TButton;
    BtnAnnulla: TButton;
    PanelAnswerCode: TPanel;
    EditAnsw1: TEdit;
    EditAnsw2: TEdit;
    EditAnsw3: TEdit;
    EditAnsw4: TEdit;
    EditAnsw5: TEdit;
    EditAnsw6: TEdit;
    EditAnsw7: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    PanelRequestCode: TPanel;
    LabelRequestCode: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure BtnAnnullaClick(Sender: TObject);
    procedure EditAnsw1Change(Sender: TObject);
  private
    { Private declarations }
    RequestCode : String;
  public
    { Public declarations }
    DP : TDemoProt;
  end;

var
  RiattivazioneForm: TRiattivazioneForm;

implementation

uses DataModule1;

{$R *.dfm}

procedure TRiattivazioneForm.FormShow(Sender: TObject);
begin
   // =========================================================================================================
   // Visualizza il codice di richiesta di attivazione
   // ---------------------------------------------------------------------------------------------------------
   RequestCode := DP.GenerateActivationRequestCode(DP.DataOraPrimoAvvio, DP.UserID);
   LabelRequestCode.Caption := DP.AggiungiSeparatoriGruppi(RequestCode, 5);
   // =========================================================================================================
end;

procedure TRiattivazioneForm.BtnOKClick(Sender: TObject);
var
   DPA : TDemoProt;
   AC : String;
   P_ID:String;       // Identificatore programma
   DK : String;       // Demo Key
begin
   // Crea l'oggetto
   DPA := TDemoProt.Create;
   try
      // Per sicurezza compone il program ID in più passaggi
      P_ID := 'T';
      P_ID := P_ID + 'H';
      P_ID := P_ID + 'C';
      P_ID := P_ID + 'L';
      // Per sicurezza compone la chiave in più passaggi
      DK := 'M';
      DK := DK + 'A';
      DK := DK + 'U';
      DK := DK + 'R';
      DK := DK + '0';  // zero
      DK := DK + 'S';
      DK := DK + 'T';
      DK := DK + 'R';
      DK := DK + '0';  // zero
      DK := DK + 'N';
      DK := DK + 'Z';
      DK := DK + '0';  // zero
      // IMposta la chiave
      DPA.Key := DK;
      // RC e AC conterranno i codici senza separatori
      AC := EditAnsw1.Text + EditAnsw2.Text + EditAnsw3.Text + EditAnsw4.Text + EditAnsw5.Text + EditAnsw6.Text + EditAnsw7.Text;
      // Se il codice iserito è valido, provvede a generare
      //  dei nuovi marcatori e visualizza un messaggio di attivazione avvenuta
      if DPA.CheckActivationAnswerCode(P_ID, RequestCode, AC) then begin
         DM1.Messaggi('Attivazione Versione Dimostrativa', 'Attivazione effettuata.'#13#13#13'Ora il programma si chiuderà automaticamente.', '', [mbOK], 0, nil);
         Application.Terminate;
      // Se invece il codice non è corretto avvisa l'utente e rimane in attesa di un codice valido.
      end else begin
         DM1.Messaggi('Attivazione Versione Dimostrativa', 'Codice di attivazione NON CORRETTO.', '', [mbOK], 0, nil);
      end;
   finally
      // Pulizie finali
      DPA.Free;
   end;
end;

procedure TRiattivazioneForm.BtnAnnullaClick(Sender: TObject);
begin
   Close;
end;

procedure TRiattivazioneForm.EditAnsw1Change(Sender: TObject);
begin
   // Se il contenuto supera i 5 caratteri sposta il focus sul prossimo
   if Length((Sender as TEdit).Text) >= 5 then SelectNext((Sender as TEdit), True, True);
end;

end.
