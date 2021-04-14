unit FormModelPannelliWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase, ExtCtrls, bmpPanel, StdCtrls, Buttons,
  ComCtrls, Main, SACS;

type
  TModelPannelliWizardForm = class(TModelBaseForm)
    PanelSicurezza: TPanel;
    RichEditSicurezza: TRichEdit;
    Panel13: TPanel;
    SiCopia: TSpeedButton;
    Panel14: TPanel;
    NoCopia: TSpeedButton;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    TitoloGruppo1: TRichEdit;
    Panel7: TPanel;
    AvantiGruppo1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure AvantiGruppo1Click(Sender: TObject);
    procedure SiCopiaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    YY:Integer;
    fLivelloAttivo:Shortint;   // Contiene l'indicazione di quale livello sia attualmente attivo
    fPanelsCount:Byte;   // COntiene il numero di pannelli presenti nel form
    procedure CalcolaPosizioneAltezzaPannelloAttivo(var PanelIndex:Byte);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; FormType:Byte; LivelloIniziale:Byte); overload;
    procedure RefreshScreen;
  end;

var
  ModelPannelliWizardForm: TModelPannelliWizardForm;

implementation

{$R *.dfm}


procedure TModelPannelliWizardForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Ricava il numero di pannelli presenti nel form
  fPanelsCount := 1;
  while FindComponent('PanelGruppo' + IntToStr(fPanelsCount)) <> nil do inc(fPanelsCount);
  Dec(fPanelsCount);
end;

procedure TModelPannelliWizardForm.RefreshScreen;
var
  i:Byte;
begin
   // Inizializzazione
   YY := 0;
   // Imposta la visualizzazione dei pannelli
   for i := 1 to fPanelsCount do CalcolaPosizioneAltezzaPannelloAttivo(i);
   // Forza il painting della form
   Update;
end;


procedure TModelPannelliWizardForm.CalcolaPosizioneAltezzaPannelloAttivo(var PanelIndex:Byte);
const
  // Costanti per la visualizzazione dei pannelli.
  PANEL_SEPARATOR = 5;
var
  CP:TPanel;
  CL:TLabel;
begin
  // Se il livello attivo è = 0 allora visualizza solo il pannello con la richiesta
  //  di effettuare la copia di sicurezza.
  PanelSicurezza.Top := 0;
  PanelSicurezza.Visible := (fLivelloAttivo = 0);
  // CP Punta al pannello da calcolare, CL punta alla LabelGruppo corrente
  CP := FindComponent('PanelGruppo' + IntToStr(PanelIndex)) as TPanel;
  CL := FindComponent('LabelGruppo' + IntToStr(PanelIndex)) as TLabel;
  // Se il pannello che si sta elaborando è quello attivo...
  if PanelIndex = fLivelloAttivo then begin

    // IMposta il pannello
    CP.Top               := YY;
    CP.Visible           := True;
    CP.Enabled           := True;
    CP.BevelOuter        := bvRaised;
    CP.Color             := COLOR_SUBPANEL_BG;
    // Imposta la label con il numerone
    CL.Color := COLOR_SUBPANEL_STEP_BG;
    CL.Font.Color := COLOR_SUBPANEL_STEP_FONT;
    // Aggiorna YY
    Inc(YY, (CP.Height + PANEL_SEPARATOR));

  // Se invece si tratta di un pannello già selezionato...
  end else if PanelIndex < fLivelloAttivo then begin

    // IMposta il pannello
    CP.Top               := YY;
    CP.Visible           := True;
    CP.Enabled           := False;
    CP.BevelOuter        := bvNone;
    CP.Color             := COLOR_SUBPANEL_BG_SELECTED;
    // Imposta la label con il numerone
    CL.Color := COLOR_SUBPANEL_STEP_BG_SELECTED;
    CL.Font.Color := COLOR_SUBPANEL_STEP_FONT_SELECTED;
    // Aggiorna YY
    Inc(YY, (CP.Height + PANEL_SEPARATOR));

  // Altrimenti se è un pannello da non visualizzare...
  end else begin

    CP.Visible := False;

  end;
end;


constructor TModelPannelliWizardForm.Create(AOwner: TComponent;
  FormType: Byte; LivelloIniziale: Byte);
begin
  // Richiama il create dell'antenato
  Self.Create(AOwner, FormType);
  // Imposta il livello iniziale
  fLivelloAttivo := LivelloIniziale;
end;

procedure TModelPannelliWizardForm.RxSpeedButtonUscitaClick(
  Sender: TObject);
begin
  inherited;

  if fLivelloAttivo <= 1 then begin
    Close;
  end else begin
    Dec(fLivelloAttivo);
    RefreshScreen;
  end;
end;

procedure TModelPannelliWizardForm.AvantiGruppo1Click(Sender: TObject);
begin
  inherited;
   // Incrementa il livello attivo
   Inc(fLivelloAttivo);
   // Aggiorna lo schermo
   RefreshScreen;
end;

procedure TModelPannelliWizardForm.SiCopiaClick(Sender: TObject);
var
   MR : TModalResult;
begin
  inherited;
   // Invia il messaggio di richiesta di esecuzione del backup al Guardian
   MR := SendBackupRequest;
   if MR = mrOk then NoCopia.OnClick(NoCopia);
end;

procedure TModelPannelliWizardForm.FormShow(Sender: TObject);
begin
  inherited;
  // Rinfresca lo schermo
  Self.RefreshScreen;
end;

end.
