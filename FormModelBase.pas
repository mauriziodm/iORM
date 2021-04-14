unit FormModelBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bmpPanel, Buttons;

const
  TIPOFORM_IMPOSTAZIONI     = 1;
  TIPOFORM_UTILITA          = 2;
  TIPOFORM_ANAGRAFICA       = 3;
  TIPOFORM_LISTA            = 4;
  TIPOFORM_ANAGRAFICA_LISTA = 5;

type
  TModelBaseForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    ClientArea: TScrollBox;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    // Variabile che indica se la form è di tipo IMPOSTAZIONI, UTILITA', ANAGRAFICA, LISTA, ANAGRAFICA_LISTA
    fTipoForm: Byte;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; FormType:Byte); overload;
  end;

var
  ModelBaseForm: TModelBaseForm;

implementation

uses main, DataModule1, SchedaClienti;

{$R *.dfm}

procedure TModelBaseForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(Self, COLOR_NORMALE);
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;
   // Carica l'icona in alto a SX sulla MainForm.
   //  e blocca l'aggiornamento dell'IconaDocTipo
   if ClientiForm <> nil then begin
     MainForm.SalvaIconaDocTipo;
     // Se è la form delle Comunicazioni non fa nulla perchè ci pensa lei
     if Self.Name = 'ComunicazioneForm' then Exit;
     // In base al tipo di form...
     case fTipoForm of
       TIPOFORM_IMPOSTAZIONI:     MainForm.CaricaIconaDocTipo('Impostazioni');
       TIPOFORM_UTILITA:          MainForm.CaricaIconaDocTipo('Utilita');
       TIPOFORM_ANAGRAFICA:       MainForm.CaricaIconaDocTipo(Self.Name);
       TIPOFORM_LISTA:            MainForm.CaricaIconaDocTipo(Self.Name);
       TIPOFORM_ANAGRAFICA_LISTA: MainForm.CaricaIconaDocTipo(Self.Name);
     else
       MainForm.CaricaIconaDocTipo(Self.Name);
     end;
     MainForm.BloccaIconaDocTipo(True, Name);
   end;
end;

procedure TModelBaseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   // Altrimenti da un errore quando faccio la chiusura di magazzino
   //  durante la ristrutturazione
   if ClientiForm <> nil then begin
     // Sblocca l'icona in alto a sx della MainForme ripristina l'Icona precedente
     MainForm.BloccaIconaDocTipo(False, Name);
     MainForm.RipristinaIconaDocTipo;
     // Se la form è di tipo IMPOSTAZIONI oppure UTILITA' rimette a non premuto il
     //  relativo pulsante sul MainMenù
     case fTipoForm of
       TIPOFORM_IMPOSTAZIONI:     MainForm.SBImpostazioni.Down := False;
       TIPOFORM_UTILITA:          MainForm.SBUtilita.Down := False;
     end;
   end;
end;

procedure TModelBaseForm.FormShow(Sender: TObject);
begin
   DM1.FocusRefresh;
end;

constructor TModelBaseForm.Create(AOwner: TComponent; FormType: Byte);
begin
  // Richiama il Create originale per la creazione della form.
  Self.Create(AOwner);
  // Imposta il valore della variabile
  Self.fTipoForm := FormType;
  // La riga sottostante è stata sostituita con la successiva per risolvere l'errore
  //  che dava il programma quando girava su Win95/98/ME (Questo programma ha eseguito una operazione non valida...)
  //  Il problema lo dava solo quando assegnavo la proprietà Parent della form AnagArtForm.
  //  con le altre form andava bene.
  Windows.SetParent(Self.Handle, MainForm.Handle);
end;

procedure TModelBaseForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if Assigned(RxSpeedButtonUscita.OnClick) and RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscita.OnClick(RxSpeedButtonUscita);
         end;
      end;

      // F1 = Help
      112: begin
         if Assigned(RxSpeedButtonHelp.OnClick) and RxSpeedButtonHelp.Enabled then begin
            RxSpeedButtonHelp.OnClick(RxSpeedButtonHelp);
         end;
      end;

      // F2 = Modifica
      113: begin
         if Assigned(RxSpeedModifica.OnClick) and RxSpeedModifica.Enabled then begin
            RxSpeedModifica.Down := not RxSpeedModifica.Down;
            RxSpeedModifica.OnClick(RxSpeedModifica);
         end;
      end;

      // F3 = Nuovo
      114: begin
         if Assigned(RxSpeedButtonNuovo.OnClick) and RxSpeedButtonNuovo.Enabled then begin
            RxSpeedButtonNuovo.OnClick(RxSpeedButtonNuovo);
         end;
      end;

      // F4 = Elimina
      115: begin
         if Assigned(RxSpeedButtonNuovo.OnClick) and RxSpeedButtonElimina.Enabled then begin
            RxSpeedButtonElimina.OnClick(RxSpeedButtonElimina);
         end;
      end;

      // F5 = Trova
      116: begin
         if Assigned(RxSpeedButtonTrova.OnClick) and RxSpeedButtonTrova.Enabled then begin
            RxSpeedButtonTrova.OnClick(RxSpeedButtonTrova);
         end;
      end;

      // F6 = No filtri
      117: begin
         if Assigned(RxSpeedButtonResetQuery.OnClick) and RxSpeedButtonResetQuery.Enabled then begin
            RxSpeedButtonResetQuery.OnClick(RxSpeedButtonResetQuery);
         end;
      end;

      // F7 = Stampa
      118: begin
         if Assigned(RxSpeedButtonStampa.OnClick) and RxSpeedButtonStampa.Enabled then begin
            RxSpeedButtonStampa.OnClick(RxSpeedButtonStampa);
         end;
      end;

      // F8 = Fax
      119: begin
         if Assigned(RxSpeedButtonFax.OnClick) and RxSpeedButtonFax.Enabled then begin
            RxSpeedButtonFax.OnClick(RxSpeedButtonFax);
         end;
      end;

      // F9 = Email
      120: begin
         if Assigned(RxSpeedButtonMail.OnClick) and RxSpeedButtonMail.Enabled then begin
            RxSpeedButtonMail.OnClick(RxSpeedButtonMail);
         end;
      end;

      // F10 = Visualizza
      121: begin
         if Assigned(RxSpeedButtonVisualizza.OnClick) and RxSpeedButtonVisualizza.Enabled then begin
            RxSpeedButtonVisualizza.OnClick(RxSpeedButtonVisualizza);
         end;
      end;

   end;
end;

end.
