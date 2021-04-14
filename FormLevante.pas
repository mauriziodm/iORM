unit FormLevante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bmpPanel, Buttons;

type
  TLevanteForm = class(TForm)
    ClientArea: TScrollBox;
    ClientTopPanel: TbmpPanel;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LevanteForm: TLevanteForm;

implementation

uses main, DataModule1, FormHelp;

{$R *.dfm}

procedure TLevanteForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Sblocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Self.Name);                                   
   // Ripristina l'iconaDocTipoPrecedente
   MainForm.RipristinaIconaDocTipo;
end;

procedure TLevanteForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(Self, COLOR_NORMALE);
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;
end;

procedure TLevanteForm.FormShow(Sender: TObject);
begin
   // Si posiziona all'inizio della form
   ClientArea.VertScrollBar.Position := 0;
   DM1.FocusRefresh;
end;

procedure TLevanteForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  Close;
end;

procedure TLevanteForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('');
end;

end.
