unit FormModelBaseAllegati;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase, ExtCtrls, bmpPanel, cxControls,
  cxSplitter, FormAllegati, Buttons, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TModelBaseAllegatiForm = class(TModelBaseForm)
    FormMainPanel: TPanel;
    PanelAllegati: TPanel;
    SplitterAllegati: TcxSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  protected

    // =========================================================================
    // PARTE DELLA FORM ALLEGATI
    // -------------------------------------------------------------------------
    // Puntatore alla form degli Allegati relativa a questa form stessa
    fAllegatiForm: TAllegatiForm;
    procedure Allegati_AggiornaDatiFiltri; virtual; abstract;
    procedure Allegati_CreaForm; virtual;
    procedure Allegati_VerificaAbilitazione; virtual; abstract;
    // =========================================================================

  public
    { Public declarations }
  end;

var
  ModelBaseAllegatiForm: TModelBaseAllegatiForm;

implementation

uses main;

{$R *.dfm}




// =============================================================================
// INIZIO PARTE PER GESTIONE DEGLI ALLEGATI
// -----------------------------------------------------------------------------
  // Procedure che crea la form degli allegati se questa non esiste già e la
  //  apre, alla fine esegue l'interrogazione per mostrare gli allegati.
  procedure TModelBaseAllegatiForm.Allegati_CreaForm;
  begin
    // Se la form degli allegati non è stata ancora creata la crea.
    if not Assigned(fAllegatiForm) then begin
      // Crea la form degli allegati
      fAllegatiForm := MainForm.Allegati_CreaForm(PanelAllegati);
      // Passa lo Splitter alla finestra degli allegati
      fAllegatiForm.Splitter := SplitterAllegati;
      // Parte con lo splitter chiuso
//      SplitterAllegati.CloseSplitter;
    end;
    // Imposta i filtri
    Allegati_AggiornaDatiFiltri;
  end;

// -----------------------------------------------------------------------------
// FINE PARTE PER GESTIONE DEGLI ALLEGATI
// =============================================================================












procedure TModelBaseAllegatiForm.FormCreate(Sender: TObject);
begin
  inherited;
  ClientArea.Parent := FormMainPanel;
  ClientArea.SendToBack;
end;

procedure TModelBaseAllegatiForm.FormResize(Sender: TObject);
begin
  inherited;
  // IMposta la posizione della client area e i relativi margini
  MainForm.CalcolaDimensioniFormMainPanelAndClientAreaChildForm(Self, FormMainPanel, ClientArea, SplitterAllegati, True, True);
end;

procedure TModelBaseAllegatiForm.FormDestroy(Sender: TObject);
begin
  inherited;
  // Senza questo codice mi da un errore alla distruzione della Form
  if fAllegatiForm <> nil then begin
    fAllegatiForm.Free;
  end;
end;

end.
