unit FormQtaArticolo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxCurrencyEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, cxMemo, Data.DB, IBODataset;

type
  TQtaArticoloForm = class(TForm)
    BitBtn1: TBitBtn;
    fPrezzoUnitario: TcxCurrencyEdit;
    Label1: TLabel;
    fQta: TcxCurrencyEdit;
    Label2: TLabel;
    Label3: TLabel;
    fSconto1: TcxCurrencyEdit;
    Label4: TLabel;
    fSconto2: TcxCurrencyEdit;
    Label5: TLabel;
    fSconto3: TcxCurrencyEdit;
    fDescrizione: TcxTextEdit;
    Label6: TLabel;
    fCodice: TcxTextEdit;
    Label7: TLabel;
    fUM: TLabel;
    EvitaFalsiInvio: TTimer;
    eNote: TcxMemo;
    Qry: TIBOQuery;
    QryDATAULTMOD_COSTO: TDateTimeField;
    QryDATAULTMOD_VENDITA: TDateTimeField;
    QryDATAULTMOD_LISTINO: TDateTimeField;
    QryGRUPPO1: TStringField;
    QryGRUPPO2: TStringField;
    QryGRUPPO3: TStringField;
    QryGRUPPO4: TStringField;
    QryGRUPPO5: TStringField;
    QryGRUPPO6: TStringField;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure fQtaKeyPress(Sender: TObject; var Key: Char);
  private
    function GetCodice: String;
    procedure SetCodice(const Value: String);
    function GetDescrizione: String;
    procedure SetDescrizione(const Value: String);
    function GetPrezzoUnitario: Double;
    function GetQta: Double;
    function GetSconto1: Double;
    function GetSconto2: Double;
    function GetSconto3: Double;
    procedure SetPrezzoUnitario(const Value: Double);
    procedure SetQta(const Value: Double);
    procedure SetSconto1(const Value: Double);
    procedure SetSconto2(const Value: Double);
    procedure SetSconto3(const Value: Double);
    function getUnitaDiMisura: String;
    procedure SetUnitaDiMisura(const Value: String);
    procedure LoadNoteArticolo(ACodiceArticolo:String);
    { Private declarations }
  public
    { Public declarations }
    property Codice:String read GetCodice write SetCodice;
    property Descrizione:String read GetDescrizione write SetDescrizione;
    property UnitaDiMisura:String read getUnitaDiMisura write SetUnitaDiMisura;
    property Qta:Double read GetQta write SetQta;
    property PrezzoUnitario:Double read GetPrezzoUnitario write SetPrezzoUnitario;
    property Sconto1:Double read GetSconto1 write SetSconto1;
    property Sconto2:Double read GetSconto2 write SetSconto2;
    property Sconto3:Double read GetSconto3 write SetSconto3;
  end;

var
  QtaArticoloForm: TQtaArticoloForm;

implementation



{$R *.dfm}

procedure TQtaArticoloForm.FormShow(Sender: TObject);
begin
  LoadNoteArticolo(fCodice.Text);
  fQta.SetFocus;
  MessageBeep(MB_ICONEXCLAMATION);
end;

function TQtaArticoloForm.GetCodice: String;
begin
  Result := fCodice.Text;
end;

procedure TQtaArticoloForm.SetCodice(const Value: String);
begin
  fCodice.Text := Value;
end;

function TQtaArticoloForm.GetDescrizione: String;
begin
  Result := fDescrizione.Text;
end;

procedure TQtaArticoloForm.SetDescrizione(const Value: String);
begin
  fDescrizione.Text := Value;
end;

function TQtaArticoloForm.GetPrezzoUnitario: Double;
begin
  Result := fPrezzoUnitario.Value;
end;

function TQtaArticoloForm.GetQta: Double;
begin
  Result := fQta.Value;
end;

function TQtaArticoloForm.GetSconto1: Double;
begin
  Result := fSconto1.Value;
end;

function TQtaArticoloForm.GetSconto2: Double;
begin
  Result := fSconto2.Value;
end;

function TQtaArticoloForm.GetSconto3: Double;
begin
  Result := fSconto3.Value;
end;

procedure TQtaArticoloForm.SetPrezzoUnitario(const Value: Double);
begin
  fPrezzoUnitario.Value := Value;
end;

procedure TQtaArticoloForm.SetQta(const Value: Double);
begin
  fQta.Value := Value;
  // Se è zero così non appare lo zero che non mi piace
  if Value = 0 then fQta.Clear;
end;

procedure TQtaArticoloForm.SetSconto1(const Value: Double);
begin
  fSconto1.Value := Value;
end;

procedure TQtaArticoloForm.SetSconto2(const Value: Double);
begin
  fSconto2.Value := Value;
end;

procedure TQtaArticoloForm.SetSconto3(const Value: Double);
begin
  fSconto3.Value := Value;
end;

function TQtaArticoloForm.getUnitaDiMisura: String;
begin
  Result := fUM.Caption;
end;

procedure TQtaArticoloForm.LoadNoteArticolo(ACodiceArticolo: String);
var
  NewLine: String;
begin
  // Carica alcuni dati dell'articolo per mostrarlo nella form
  Qry.Params.ParamByName('P_CODICEARTICOLO').AsString := ACodiceArticolo;
  Qry.Open;
  try
    eNote.Lines.Clear;
    // Gruppi sottogruppi ecc.
    NewLine := '';
    if Qry.FieldByName('GRUPPO1').AsString <> '' then NewLine := NewLine + Qry.FieldByName('GRUPPO1').AsString;
    if Qry.FieldByName('GRUPPO2').AsString <> '' then NewLine := NewLine + ' - ' + Qry.FieldByName('GRUPPO2').AsString;
    if Qry.FieldByName('GRUPPO3').AsString <> '' then NewLine := NewLine + ' - ' + Qry.FieldByName('GRUPPO3').AsString;
    if Qry.FieldByName('GRUPPO4').AsString <> '' then NewLine := NewLine + ' - ' + Qry.FieldByName('GRUPPO4').AsString;
    if Qry.FieldByName('GRUPPO5').AsString <> '' then NewLine := NewLine + ' - ' + Qry.FieldByName('GRUPPO5').AsString;
    if Qry.FieldByName('GRUPPO6').AsString <> '' then NewLine := NewLine + ' - ' + Qry.FieldByName('GRUPPO6').AsString;
    if NewLine <> '' then eNote.Lines.Add(NewLine);
    // Date ore ultime variazioni
    if (not Qry.FieldByName('DATAULTMOD_COSTO').IsNull) then eNote.Lines.Add('Ult.var. prezzo di costo: ' + Qry.FieldByName('DATAULTMOD_COSTO').AsString);
    if (not Qry.FieldByName('DATAULTMOD_VENDITA').IsNull) then eNote.Lines.Add('Ult.var. prezzo di vend.: ' + Qry.FieldByName('DATAULTMOD_VENDITA').AsString);
    if (not Qry.FieldByName('DATAULTMOD_LISTINO').IsNull) then eNote.Lines.Add('Ult.agg. listino fornitore: ' + Qry.FieldByName('DATAULTMOD_LISTINO').AsString);
  finally
    Qry.Close;
  end;
end;

procedure TQtaArticoloForm.SetUnitaDiMisura(const Value: String);
begin
  fUM.Caption := Value;
end;

procedure TQtaArticoloForm.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TQtaArticoloForm.fQtaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
    Key := #0;
    BitBtn1Click(BitBtn1);
  end;
end;

end.
