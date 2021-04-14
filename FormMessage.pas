unit FormMessage;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  // DIchiara un puntatore a procedura
  TKeyPressProcedure = Procedure (KeyPressed:Word) of object;

  TMessageForm = class(TForm)
    Cornice: TBevel;
    BtnSi: TButton;
    BtnNO: TButton;
    BtnAnnulla: TButton;
    Msg: TMemo;
    BtnOK: TButton;
    Note: TMemo;
    procedure CalcolaDimensioniVerticali;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CalcolaPosizionePulsanti;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    KeyPressProcedure : TKeyPressProcedure;
    KeyPressChar : Word;
  end;

var
  MessageForm: TMessageForm;

implementation



{$R *.DFM}

procedure TMessageForm.CalcolaPosizionePulsanti;
const
   SEPARAZIONE = 6;
var
   XX:Integer;
begin
   // Calcola la larghezza totale occupata dai pulsanti attivi
   XX := 0;
   if BtnSi.Visible             then Inc(XX, (BtnSi.Width + SEPARAZIONE));
   if BtnNo.Visible             then Inc(XX, (BtnNo.Width + SEPARAZIONE));
   if BtnOK.Visible             then Inc(XX, (BtnOK.Width + SEPARAZIONE));
   if BtnAnnulla.Visible        then Inc(XX, (BtnAnnulla.Width + SEPARAZIONE));
   // Toglie l'ultima separazione
   Dec(XX, SEPARAZIONE);
   // Inizializzazione variabile posizione XX corrente
   XX := Round((Width - XX) / 2);
   // Posiziona e rende visibile i pulsanti attivi
   if BtnSi.Visible then begin
      BtnSi.Left := XX;
      Inc(XX, BtnSi.Width + SEPARAZIONE);
   end;
   if BtnNO.Visible then begin
      BtnNO.Left := XX;
      Inc(XX, BtnNO.Width + SEPARAZIONE);
   end;
   if BtnOK.Visible then begin
      BtnOK.Left := XX;
      Inc(XX, BtnOK.Width + SEPARAZIONE);
   end;
   if BtnAnnulla.Visible then begin
      BtnAnnulla.Left := XX;
      Inc(XX, BtnAnnulla.Width + SEPARAZIONE);
   end;
end;

procedure TMessageForm.CalcolaDimensioniVerticali;
begin
   // Calcola la dimensione verticale della parte occupata dal messaggio
   Msg.Height := Msg.Lines.Count * 14;
   // Calcola la dimensione verticale della cornice
   Cornice.Height := Msg.Height + 20;
   // Calcola la posizione verticale delle note
   Note.Top := Cornice.Top + Cornice.Height;
   // Calcola la dimensione verticale delle note
   Note.Height := Note.Lines.Count * 14;
   // Calcola la posizione verticale dei pulsanti
   BtnSi.Top            := Note.Top + Note.Height + 10;
   BtnNO.Top            := BtnSi.Top;
   BtnOK.Top            := BtnSi.Top;
   BtnAnnulla.Top       := BtnSi.Top;
   // Calcola la dimensione verticale della forms
   Height := BtnSi.Top + BtnSi.Height + 45;
end;

procedure TMessageForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   
   Action := caFree;
   MessageForm := nil;
end;

procedure TMessageForm.FormShow(Sender: TObject);
begin
   // Beep
   MessageBeep(MB_ICONEXCLAMATION);
   // Calcola le dimensionei verticali
   CalcolaDimensioniVerticali;
   CalcolaPosizionePulsanti;
end;

procedure TMessageForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se l'utente preme uno dei tasti contenuti nella lista dei tasti da tenere d'occhio richiama
   //  la procedura specificata dal parametro
   //  NB: Se invece viene premuto un qualunque altro pulsante non previsto, annulla
   //       tutto assegnando a Key il valore 0 (zero)
   // -------------------------------------------------------------------------------------------
   if (Key = KeyPressChar) and (@KeyPressProcedure <> nil) and (ssAlt in Shift) then KeyPressProcedure(Key)
   else Key := 0;
end;

end.
