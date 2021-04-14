unit FormQtaOpera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxMemo, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxCurrencyEdit, StdCtrls, Buttons, cxCustomData, DB, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters;

type
  TQtaOperaForm = class(TForm)
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    fQta: TcxCurrencyEdit;
    fDescrizione: TcxTextEdit;
    fCodice: TcxTextEdit;
    Label2: TLabel;
    fNote: TcxMemo;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    fDC: TcxCustomDataController;
    fOreItemIndex: Integer;
    FNoteItemIndex: Integer;
    FRecordIndex: Integer;
    fNoteField: TField;
    fOreField: TField;
    function GetCodiceDIpendente: Integer;
    procedure SetCodiceDipendente(const Value: Integer);
    function GetDescrizDipendente: String;
    procedure SetDescrizDipendente(const Value: String);
    function GetOre: Double;
    function GetNote: String;
    procedure SetNoteItemIndex(const Value: Integer);
    procedure SetRecordIndex(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    // Proprietà di accesso ai campi
    property CodiceDipendente:Integer read GetCodiceDIpendente write SetCodiceDipendente;
    property DescrizDipendente:String read GetDescrizDipendente write SetDescrizDipendente;
    property Ore:Double read GetOre;
    property Note:String read GetNote;
    // Proprietà per il salvataggio dati
    property DC:TcxCustomDataController read fDC write fDC;
    property RecordIndex:Integer read FRecordIndex write SetRecordIndex;
    property OreItemIndex:Integer read fOreItemIndex write fOreItemIndex;
    property NoteItemIndex:Integer read FNoteItemIndex write SetNoteItemIndex;
    property OreField:TField read fOreField write fOreField;
    property NoteField:TField read fNoteField write fNoteField;
  end;

var
  QtaOperaForm: TQtaOperaForm;

implementation

uses DataModule1;

{$R *.dfm}

procedure TQtaOperaForm.FormShow(Sender: TObject);
begin
  fQta.SetFocus;
  MessageBeep(MB_ICONEXCLAMATION);
end;

function TQtaOperaForm.GetCodiceDIpendente: Integer;
begin
  Result := StrToInt(fCodice.Text);
end;

function TQtaOperaForm.GetDescrizDipendente: String;
begin
  Result := fDescrizione.Text;
end;

function TQtaOperaForm.GetNote: String;
begin
  if fNote.Text <> '' then Result := fNote.Text else Result := '';
end;

function TQtaOperaForm.GetOre: Double;
begin
  if fQta.Text <> '' then Result := StrToFloat(fQta.Text) else Result := 0;
end;

procedure TQtaOperaForm.SetCodiceDipendente(const Value: Integer);
begin
  fCodice.Text := IntToStr(Value);
end;

procedure TQtaOperaForm.SetDescrizDipendente(const Value: String);
begin
  fDescrizione.Text := Value;
end;

procedure TQtaOperaForm.SetNoteItemIndex(const Value: Integer);
begin
  FNoteItemIndex := Value;
end;

procedure TQtaOperaForm.SetRecordIndex(const Value: Integer);
begin
  FRecordIndex := Value;
end;

procedure TQtaOperaForm.BitBtn1Click(Sender: TObject);
begin
  // Le ore devono essere maggiori di zero altrimenti darebbe dei problemi
  if not (ore > 0) then begin
    DM1.Messaggi('Levante', 'Numero di ore non valido.', 'NB: Il numero di ore specificato deve essere superiore a zero.', [mbOk], 0, nil);
    Exit;
  end;
  // Salva i dati inseriti
  if Assigned(DC) then begin
    DC.Values[RecordIndex, OreItemIndex] := Ore;
    DC.Values[RecordIndex, NoteItemIndex] := Note;
  end;
  if Assigned(OreField)   then OreField.AsFloat   := Ore;
  if Assigned(NoteField)  then NoteField.AsString := Note;
  // Chiude
  Close;
end;

procedure TQtaOperaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  QtaOperaFOrm.Close;
end;

end.
