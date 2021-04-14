unit FormModelWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase,  ExtCtrls, bmpPanel, Buttons, StdCtrls,
  cxPC, cxControls, cxPCdxBarPopupMenu, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TModelWizardForm = class(TModelBaseForm)
    WizardPageControl: TcxPageControl;
    TabWizard1: TcxTabSheet;
    LabelWzard1: TLabel;
    PanelAvanti1: TPanel;
    BtnAvanti1: TSpeedButton;
    PanelIndietro1: TPanel;
    BtnIndietro1: TSpeedButton;
    procedure BtnIndietro1Click(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure BtnAvanti1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelWizardForm: TModelWizardForm;

implementation

uses FormHelp;

{$R *.dfm}

procedure TModelWizardForm.BtnIndietro1Click(Sender: TObject);
begin
  inherited;
  // Se siamo sulla prima pagina chiude la form, altrimenti torna alla pagina precedente
  if Self.WizardPageControl.ActivePageIndex = 0
  then RxSpeedButtonUscitaClick(RxSpeedButtonUscita)
  else WizardPageControl.ActivePageIndex := WizardPageControl.ActivePageIndex - 1;
end;

procedure TModelWizardForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TModelWizardForm.BtnAvanti1Click(Sender: TObject);
begin
  inherited;
  // Se non siamo all'ultima pagina va a quella successiva
  if Self.WizardPageControl.ActivePageIndex < (Self.WizardPageControl.PageCount -1)
  then Self.WizardPageControl.ActivePageIndex := Self.WizardPageControl.ActivePageIndex + 1;
end;

procedure TModelWizardForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  // Rende invisibili tutti i Tabs e si posiziona sulla prima pagina
  for i := 0 to Self.WizardPageControl.PageCount -1 do Self.WizardPageControl.Pages[i].TabVisible := False;
  Self.WizardPageControl.ActivePageIndex := 0;
end;

procedure TModelWizardForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
  inherited;
   HelpForm.Aiuto('');
end;

end.
