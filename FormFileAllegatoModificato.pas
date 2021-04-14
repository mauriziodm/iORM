unit FormFileAllegatoModificato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxRadioGroup, ExtCtrls;

type
  TModFileMode = (mfNone, mfNonSalvare, mfSovrascrivi, mfNuovaVersione, mfNuovoProtocollo);

  TFileAllegatoModificatoForm = class(TForm)
    LabelTitolo: TLabel;
    LabelSottotitolo: TLabel;
    NoteLabel1: TLabel;
    Shape1: TShape;
    MainLabel1: TLabel;
    NoteLabel2: TLabel;
    Shape2: TShape;
    MainLabel2: TLabel;
    NoteLabel3: TLabel;
    Shape3: TShape;
    MainLabel3: TLabel;
    NoteLabel4: TLabel;
    Shape4: TShape;
    MainLabel4: TLabel;
    Shape5: TShape;
    procedure MainLabel1MouseEnter(Sender: TObject);
    procedure MainLabel2MouseEnter(Sender: TObject);
    procedure MainLabel3MouseEnter(Sender: TObject);
    procedure MainLabel4MouseEnter(Sender: TObject);
    procedure MainLabel1MouseLeave(Sender: TObject);
    procedure MainLabel2MouseLeave(Sender: TObject);
    procedure MainLabel3MouseLeave(Sender: TObject);
    procedure MainLabel4MouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MainLabel1Click(Sender: TObject);
    procedure MainLabel2Click(Sender: TObject);
    procedure MainLabel3Click(Sender: TObject);
    procedure MainLabel4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function GetSottotitolo: String;
    function GetSottotitoloButtonAnnulla: String;
    function GetSottotitoloButtonNuovaVersione: String;
    function GetSottotitoloButtonNuovo: String;
    function GetSottotitoloButtonSostituisci: String;
    function GetTitolo: String;
    function GetTitoloButtonAnnulla: String;
    function GetTitoloButtonNuovaVersione: String;
    function GetTitoloButtonNuovo: String;
    function GetTitoloButtonSostituisci: String;
    procedure SetSottotitolo(const Value: String);
    procedure SetSottotitoloButtonAnnulla(const Value: String);
    procedure SetSottotitoloButtonNuovaVersione(const Value: String);
    procedure SetSottotitoloButtonNuovo(const Value: String);
    procedure SetSottotitoloButtonSostituisci(const Value: String);
    procedure SetTitolo(const Value: String);
    procedure SetTitoloButtonAnnulla(const Value: String);
    procedure SetTitoloButtonNuovaVersione(const Value: String);
    procedure SetTitoloButtonNuovo(const Value: String);
    procedure SetTitoloButtonSostituisci(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    Risultato: TModFileMode;
    // Proprietà che contengono i titoli
    property Titolo:String read GetTitolo write SetTitolo;
    property Sottotitolo:String read GetSottotitolo write SetSottotitolo;

    property TitoloButtonSostituisci:String read GetTitoloButtonSostituisci write SetTitoloButtonSostituisci;
    property SottotitoloButtonSostituisci:String read GetSottotitoloButtonSostituisci write SetSottotitoloButtonSostituisci;

    property TitoloButtonNuovaVersione:String read GetTitoloButtonNuovaVersione write SetTitoloButtonNuovaVersione;
    property SottotitoloButtonNuovaVersione:String read GetSottotitoloButtonNuovaVersione write SetSottotitoloButtonNuovaVersione;

    property TitoloButtonNuovo:String read GetTitoloButtonNuovo write SetTitoloButtonNuovo;
    property SottotitoloButtonNuovo:String read GetSottotitoloButtonNuovo write SetSottotitoloButtonNuovo;

    property TitoloButtonAnnulla:String read GetTitoloButtonAnnulla write SetTitoloButtonAnnulla;
    property SottotitoloButtonAnnulla:String read GetSottotitoloButtonAnnulla write SetSottotitoloButtonAnnulla;
  end;

var
  FileAllegatoModificatoForm: TFileAllegatoModificatoForm;

implementation

{$R *.dfm}

procedure TFileAllegatoModificatoForm.MainLabel1MouseEnter(
  Sender: TObject);
begin
  Shape1.Pen.Width := 2;
end;

procedure TFileAllegatoModificatoForm.MainLabel2MouseEnter(
  Sender: TObject);
begin
  Shape2.Pen.Width := 2;
end;

procedure TFileAllegatoModificatoForm.MainLabel3MouseEnter(
  Sender: TObject);
begin
  Shape3.Pen.Width := 2;
end;

procedure TFileAllegatoModificatoForm.MainLabel4MouseEnter(
  Sender: TObject);
begin
  Shape4.Pen.Width := 2;
end;

procedure TFileAllegatoModificatoForm.MainLabel1MouseLeave(
  Sender: TObject);
begin
  Shape1.Pen.Width := 1;
end;

procedure TFileAllegatoModificatoForm.MainLabel2MouseLeave(
  Sender: TObject);
begin
  Shape2.Pen.Width := 1;
end;

procedure TFileAllegatoModificatoForm.MainLabel3MouseLeave(
  Sender: TObject);
begin
  Shape3.Pen.Width := 1;
end;

procedure TFileAllegatoModificatoForm.MainLabel4MouseLeave(
  Sender: TObject);
begin
  Shape4.Pen.Width := 1;
end;

procedure TFileAllegatoModificatoForm.FormShow(Sender: TObject);
begin
  MessageBeep(0);
end;

procedure TFileAllegatoModificatoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TFileAllegatoModificatoForm.MainLabel1Click(Sender: TObject);
begin
  Risultato := mfSovrascrivi;
  Close;
end;

procedure TFileAllegatoModificatoForm.MainLabel2Click(Sender: TObject);
begin
  Risultato := mfNuovaVersione;
  Close;
end;

procedure TFileAllegatoModificatoForm.MainLabel3Click(Sender: TObject);
begin
  Risultato := mfNuovoProtocollo;
  Close;
end;

procedure TFileAllegatoModificatoForm.MainLabel4Click(Sender: TObject);
begin
  Risultato := mfNonSalvare;
  Close;
end;

procedure TFileAllegatoModificatoForm.FormCreate(Sender: TObject);
begin
  // inizializzazione
  Risultato := mfNone;
end;

function TFileAllegatoModificatoForm.GetSottotitolo: String;
begin
  Result := LabelSottotitolo.Caption;
end;

function TFileAllegatoModificatoForm.GetSottotitoloButtonAnnulla: String;
begin
  Result := NoteLabel4.Caption;
end;

function TFileAllegatoModificatoForm.GetSottotitoloButtonNuovaVersione: String;
begin
  Result := NoteLabel2.Caption;
end;

function TFileAllegatoModificatoForm.GetSottotitoloButtonNuovo: String;
begin
  Result := NoteLabel3.Caption;
end;

function TFileAllegatoModificatoForm.GetSottotitoloButtonSostituisci: String;
begin
  Result := NoteLabel1.Caption;
end;

function TFileAllegatoModificatoForm.GetTitolo: String;
begin
  Result := LabelTitolo.Caption;
end;

function TFileAllegatoModificatoForm.GetTitoloButtonAnnulla: String;
begin
  Result := MainLabel4.Caption;
end;

function TFileAllegatoModificatoForm.GetTitoloButtonNuovaVersione: String;
begin
  Result := MainLabel2.Caption;
end;

function TFileAllegatoModificatoForm.GetTitoloButtonNuovo: String;
begin
  Result := MainLabel3.Caption;
end;

function TFileAllegatoModificatoForm.GetTitoloButtonSostituisci: String;
begin
  Result := MainLabel1.Caption;
end;

procedure TFileAllegatoModificatoForm.SetSottotitolo(const Value: String);
begin
  LabelSottotitolo.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetSottotitoloButtonAnnulla(
  const Value: String);
begin
  NoteLabel4.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetSottotitoloButtonNuovaVersione(
  const Value: String);
begin
  NoteLabel2.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetSottotitoloButtonNuovo(
  const Value: String);
begin
  NoteLabel3.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetSottotitoloButtonSostituisci(
  const Value: String);
begin
  NoteLabel1.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetTitolo(const Value: String);
begin
  LabelTitolo.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetTitoloButtonAnnulla(
  const Value: String);
begin
  MainLabel4.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetTitoloButtonNuovaVersione(
  const Value: String);
begin
  MainLabel2.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetTitoloButtonNuovo(
  const Value: String);
begin
  MainLabel3.Caption := Value;
end;

procedure TFileAllegatoModificatoForm.SetTitoloButtonSostituisci(
  const Value: String);
begin
  MainLabel1.Caption := Value;
end;

end.
