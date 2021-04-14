unit FormBeforeNewDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls,
  cxMaskEdit, cxDropDownEdit, MAURI_SB, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxDBEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TBeforeNewDocForm = class(TForm)
    Label6: TLabel;
    Label1: TLabel;
    BtnSoggetto: TSpeedButtonRollOver;
    BtnCantiere: TSpeedButtonRollOver;
    DbeAzioneMagazzino: TcxComboBox;
    DBEditSegnoOperazione: TDBEdit;
    DbeAzioneCantiere: TcxComboBox;
    DBEdit27: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    fDescrizioneCantiere: TcxTextEdit;
    Timer1: TTimer;
    procedure BtnSoggettoClick(Sender: TObject);
    procedure BtnCantiereClick(Sender: TObject);
    procedure DbeAzioneMagazzinoPropertiesChange(Sender: TObject);
    procedure DbeAzioneCantierePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BeforeNewDocForm: TBeforeNewDocForm;

implementation

uses SchedaPreventiviOrdini;

{$R *.dfm}

procedure TBeforeNewDocForm.BtnSoggettoClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  PreventiviOrdiniForm.BitBtnClienteClick(Sender);
end;

procedure TBeforeNewDocForm.BtnCantiereClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  PreventiviOrdiniForm.BitBtnPratica1Click(Sender);
  fDescrizioneCantiere.Text := PreventiviOrdiniForm.DbeDescrizioneCantiere.Text;
end;

procedure TBeforeNewDocForm.DbeAzioneMagazzinoPropertiesChange(
  Sender: TObject);
begin
  PreventiviOrdiniForm.DbeAzioneMagazzinoPropertiesChange(Sender);
end;

procedure TBeforeNewDocForm.DbeAzioneCantierePropertiesChange(
  Sender: TObject);
begin
  PreventiviOrdiniForm.DbeAzioneCantierePropertiesChange(Sender);
end;

procedure TBeforeNewDocForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  BeforeNewDocForm := nil;
end;

procedure TBeforeNewDocForm.FormShow(Sender: TObject);
begin
  fDescrizioneCantiere.Text := PreventiviOrdiniForm.DbeDescrizioneCantiere.Text;
  DbeAzioneMagazzino.Text := PreventiviOrdiniForm.DbeAzioneMagazzino.Text;
  DbeAzioneCantiere.Text := PreventiviOrdiniForm.DbeAzioneCantiere.Text;
end;

procedure TBeforeNewDocForm.Timer1Timer(Sender: TObject);
begin
  if not Self.Focused then Self.SetFocus;
end;

procedure TBeforeNewDocForm.FormActivate(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TBeforeNewDocForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

end.
