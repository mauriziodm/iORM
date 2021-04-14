unit FormModelPerTabPageControlPrincipale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mauri_SB;

type
  TModelPerTabPageControlPrincipaleForm = class(TForm)
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    procedure CalcolaLeftFiltriSubPanel(PanelFiltriMain: TPanel);
    procedure CloseFilterPanel(P: TPanel; B: TSpeedButtonRollOver; Animation: Boolean=False; ClosedHeight:Integer=30; VerticalReverse:Boolean=False);
    procedure OpenFilterPanel(P: TPanel; B: TSpeedButtonRollOver; Animation: Boolean=False; VerticalReverse:Boolean=False);
    procedure SetFilterPanelForLevanteLight(P: TPanel);
  private
    { Private declarations }
  public
    { Public declarations }
    // =========================================================================
    // METODI VIRTUALI ASTRATTI PER INTERFACCIARE IL TUTTO ALLA CLIENTI FORM
    // -------------------------------------------------------------------------
    procedure UscitaButtonClick(Sender: TObject);     virtual; abstract;
    procedure HelpButtonClick(Sender: TObject);       virtual; abstract;
    procedure ModificaButtonClick(Sender: TObject);   virtual; abstract;
    procedure NuovoButtonClick(Sender: TObject);      virtual; abstract;
    procedure EliminaButtonClick(Sender: TObject);    virtual; abstract;
    procedure TrovaButtonClick(Sender: TObject);      virtual; abstract;
    procedure ResetQueryButtonClick(Sender: TObject); virtual; abstract;
    procedure StampaButtonClick(Sender: TObject);     virtual; abstract;
    procedure FaxButtonClick(Sender: TObject);        virtual; abstract;
    procedure MailButtonClick(Sender: TObject);       virtual; abstract;
    procedure VisualizzaButtonClick(Sender: TObject); virtual; abstract;
    // =========================================================================
  end;

var
  ModelPerTabPageControlPrincipaleForm: TModelPerTabPageControlPrincipaleForm;

implementation


{$R *.dfm}


uses main, DataModule1;


// Procedura che modifica l'apparenza dei filtri per adattarli alla modalità
//  LevanteLight e cioè abbassa il pannello dei filtri di ricerca per occupare meno spazio
//  e sposta verso l'alto tutti i componenti facendo sparire il campo "Trova" e la freccia.
procedure TModelPerTabPageControlPrincipaleForm.SetFilterPanelForLevanteLight(P:TPanel);
const
  DIMINUZIONE_PANNELLO = 30;
var
  i:Integer;
begin
  for i := 0 to P.ControlCount -1 do begin
    P.Controls[i].Top := P.Controls[i].Top - DIMINUZIONE_PANNELLO;
  end;
  P.Height := P.Height - DIMINUZIONE_PANNELLO;
end;


// Apre il pannello dei filtri di ricerca
procedure TModelPerTabPageControlPrincipaleForm.CloseFilterPanel(P: TPanel; B:TSpeedButtonRollOver; Animation: Boolean=False; ClosedHeight:Integer=30; VerticalReverse:Boolean=False);
const
  ANIM_STEP = 50;
var
  i: Integer;
begin
  // Carica la bitmap del pulsante
  if VerticalReverse
  then B.Glyph.LoadFromFile(DM1.TemaDir + 'FiltersClose.bmp')
  else B.Glyph.LoadFromFile(DM1.TemaDir + 'FiltersOpen.bmp');
  // Eventuale animazione
  if Animation then begin
    while P.Height > ClosedHeight do begin
      P.Height := P.Height - ANIM_STEP;
      P.Update;
    end;
  end;
  // Dimensioni finali del pannello
  P.Height := ClosedHeight;
  P.Update;
  P.Tag := -1;
end;

// Apre il pannello dei filtri di ricerca
procedure TModelPerTabPageControlPrincipaleForm.OpenFilterPanel(P: TPanel; B:TSpeedButtonRollOver; Animation: Boolean=False; VerticalReverse:Boolean=False);
const
  ANIM_STEP = 50;
var
  i, BottomCoord, HeightOpened: Integer;
begin
  // Ricava la dimensione del pannello aperto
  HeightOpened := 0;
  for i := 0 to P.ControlCount -1 do begin
    BottomCoord := P.Controls[i].Top + P.Controls[i].Height;
    if BottomCoord > HeightOpened then HeightOpened := BottomCoord;
  end;
  // Carica la bitmap del pulsante
  if VerticalReverse
  then B.Glyph.LoadFromFile(Dm1.TemaDir + 'FiltersOpen.bmp')
  else B.Glyph.LoadFromFile(Dm1.TemaDir + 'FiltersClose.bmp');
  // Eventuale animazione
  if Animation then begin
    while P.Height < HeightOpened do begin
      P.Height := P.Height + ANIM_STEP;
      P.Update;
    end;
  end;
  // Dimensioni finali del pannello
  P.Height := HeightOpened;
  // Se siamo in Levante Light corregge la visualizzazione del pannello in modo appropriato
  if MainForm.IsLevanteLight then SetFilterPanelForLevanteLight(P);
  P.Update;
  P.Tag := 1;
end;

procedure TModelPerTabPageControlPrincipaleForm.CalcolaLeftFiltriSubPanel(PanelFiltriMain:TPanel);
var
  WidthDiff: Integer;
  FiltriSubPanel: TPanel;
begin
  // Ricava il SubPanel da centrare
  FiltriSubPanel := PanelFiltriMain.Controls[0] as TPanel;
  // Calcolo della posizione del SubPanel
  WidthDiff := PanelFiltriMain.Width - FiltriSubPanel.Width;
  FiltriSubPanel.Left := Trunc(WidthDiff/2);
  if FiltriSubPanel.Left < 0 then FiltriSubPanel.Left := 0;
  PanelFiltriMain.Update;
  Application.ProcessMessages;
end;

procedure TModelPerTabPageControlPrincipaleForm.FormShow(Sender: TObject);
begin
  // Dimensiona e posiziona la form all'interno del Tab
  Self.Align := alClient;
end;

procedure TModelPerTabPageControlPrincipaleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
