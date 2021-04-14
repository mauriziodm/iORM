unit FormSettaStampante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, StdCtrls;

type
  TSettaStampanteForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    StaticText3: TStaticText;
    Panel3: TPanel;
    SBCopieUp: TSpeedButton;
    SBCopieDown: TSpeedButton;
    Panel4: TPanel;
    SBPagDaUp: TSpeedButton;
    SBPagDaDown: TSpeedButton;
    Panel5: TPanel;
    SBPagAUp: TSpeedButton;
    SBPagADown: TSpeedButton;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    ListaStampanti: TComboBox;
    Label1: TLabel;
    LCDCopie: TLabel;
    LCDPagDa: TLabel;
    LCDPagA: TLabel;
    procedure AggiornaSchermo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBCopieUpClick(Sender: TObject);
    procedure SBCopieDownClick(Sender: TObject);
    procedure SBPagDaUpClick(Sender: TObject);
    procedure SBPagDaDownClick(Sender: TObject);
    procedure SBPagAUpClick(Sender: TObject);
    procedure SBPagADownClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Copie, PagDa, PagA, MaxPag : Integer;
  end;

var
  SettaStampanteForm: TSettaStampanteForm;

implementation

uses main;

{$R *.DFM}


procedure TSettaStampanteForm.AggiornaSchermo;
begin
   // Aggiorna i valori sui displays
   LCDCopie.Caption := IntToStr(Copie);
   LCDPagDa.Caption := IntToStr(PagDa);
   LCDPagA.Caption  := IntToStr(PagA);
   Update;
end;


procedure TSettaStampanteForm.FormShow(Sender: TObject);
begin
   AggiornaSchermo;
end;

procedure TSettaStampanteForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TSettaStampanteForm.SBCopieUpClick(Sender: TObject);
begin
   if Copie < 99 then Copie := Copie + 1;
   AggiornaSchermo;
end;

procedure TSettaStampanteForm.SBCopieDownClick(Sender: TObject);
begin
   if Copie > 1 then Copie := Copie - 1;
   AggiornaSchermo;
end;

procedure TSettaStampanteForm.SBPagDaUpClick(Sender: TObject);
begin
   if PagDa < PagA then PagDa := PagDa + 1;
   AggiornaSchermo;
end;

procedure TSettaStampanteForm.SBPagDaDownClick(Sender: TObject);
begin
   if PagDa > 1 then PagDa := PagDa - 1;
   AggiornaSchermo;
end;

procedure TSettaStampanteForm.SBPagAUpClick(Sender: TObject);
begin
   if PagA < MaxPag then PagA := PagA + 1;
   AggiornaSchermo;
end;

procedure TSettaStampanteForm.SBPagADownClick(Sender: TObject);
begin
   if PagA > PagDa then PagA := PagA - 1;
   AggiornaSchermo;
end;

procedure TSettaStampanteForm.FormCreate(Sender: TObject);
begin
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Impostazioni di stampa)';
end;

end.
