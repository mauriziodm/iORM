unit FormQtaArticoloGC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxCurrencyEdit,
  StdCtrls, Buttons, cxMemo, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TQtaArticoloGCForm = class(TForm)
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    fQta: TcxCurrencyEdit;
    fCodice: TcxTextEdit;
    Label8: TLabel;
    Label9: TLabel;
    fCostoUnitario: TcxCurrencyEdit;
    Label10: TLabel;
    fRicarico: TcxCurrencyEdit;
    fUM: TcxTextEdit;
    BitBtn2: TBitBtn;
    fDescrizione: TcxMemo;
    fData: TcxDateEdit;
    Label2: TLabel;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    function GetCodice: String;
    function GetCostoUnitario: Double;
    function GetDescrizione: String;
    function GetQta: Double;
    function GetRicarico: Double;
    function GetUnitaDiMisura: String;
    procedure SetCodice(const Value: String);
    procedure SetCostoUnitario(const Value: Double);
    procedure SetDescrizione(const Value: String);
    procedure SetQta(const Value: Double);
    procedure SetRicarico(const Value: Double);
    procedure SetUnitaDiMisura(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Codice:String read GetCodice write SetCodice;
    property Descrizione:String read GetDescrizione write SetDescrizione;
    property UnitaDiMisura:String read GetUnitaDiMisura write SetUnitaDiMisura;
    property Qta:Double read GetQta write SetQta;
    property CostoUnitario:Double read GetCostoUnitario write SetCostoUnitario;
    property Ricarico:Double read GetRicarico write SetRicarico;
  end;

var
  QtaArticoloGCForm: TQtaArticoloGCForm;

implementation

uses DataModule1, FormTabGC, cxDBData, StrUtils;

{$R *.dfm}

procedure TQtaArticoloGCForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    Key := 0;
    Close;
  end;
end;

procedure TQtaArticoloGCForm.FormShow(Sender: TObject);
begin
  fData.SetFocus;
  MessageBeep(MB_ICONEXCLAMATION);
end;

procedure TQtaArticoloGCForm.FormCreate(Sender: TObject);
begin
  // Inizializzazione
  fData.Date := DM1.GC_UltimaDataInsert;
  fCostoUnitario.Properties.DecimalPlaces := DM1.DecMicroPrz;
  fCostoUnitario.Properties.DisplayFormat := DM1.DisplayFormatMicroPrz;
end;

function TQtaArticoloGCForm.GetCodice: String;
begin
  Result := fCodice.Text;
end;

function TQtaArticoloGCForm.GetCostoUnitario: Double;
begin
  Result := fCostoUnitario.Value;
end;

function TQtaArticoloGCForm.GetDescrizione: String;
begin
  Result := fDescrizione.Text;
end;

function TQtaArticoloGCForm.GetQta: Double;
begin
  Result := fQta.Value;
end;

function TQtaArticoloGCForm.GetRicarico: Double;
begin
  Result := fRicarico.Value;
end;

function TQtaArticoloGCForm.GetUnitaDiMisura: String;
begin
  Result := fUM.Text;
end;

procedure TQtaArticoloGCForm.SetCodice(const Value: String);
begin
  fCodice.Text := Value;
end;

procedure TQtaArticoloGCForm.SetCostoUnitario(const Value: Double);
begin
  fCostoUnitario.Value := Value;
end;

procedure TQtaArticoloGCForm.SetDescrizione(const Value: String);
begin
  fDescrizione.Text := Value;
end;

procedure TQtaArticoloGCForm.SetQta(const Value: Double);
begin
  fQta.Value := Value;
end;

procedure TQtaArticoloGCForm.SetRicarico(const Value: Double);
begin
  fRicarico.Value := Value;
end;

procedure TQtaArticoloGCForm.SetUnitaDiMisura(const Value: String);
begin
  fUM.Text := Value;
end;

procedure TQtaArticoloGCForm.BitBtn1Click(Sender: TObject);
var
  y : Integer;
  DC: TcxDBDataController;
begin
  // Controlla inserimento campi
  if (Trim(fDescrizione.Text) = '') and (DM1.Messaggi('Levante', 'ATTENZIONE!!!'#13#13'Descrizione articolo non inserita'#13#13'Continuare ugualmente?', '', [mbYes,mbNo], 0, nil) <> mrYes) then Exit;
  if (fQta.Value = 0) and (DM1.Messaggi('Levante', 'ATTENZIONE!!!'#13#13'La quantità è uguale a zero.'#13#13'Continuare ugualmente?', '', [mbYes,mbNo], 0, nil) <> mrYes) then Exit;
  if (fCostoUnitario.Value = 0) and (DM1.Messaggi('Levante', 'ATTENZIONE!!!'#13#13'La quantità è uguale a zero.'#13#13'Continuare ugualmente?', '', [mbYes,mbNo], 0, nil) <> mrYes) then Exit;
  // Salvataggio ultima data utilizzata
  DM1.GC_UltimaDataInsert := fData.Date;  
  // Inizializzazione
  DC := TabGCForm.btvGCRighi.DataController as TcxDBDataController;
  // Y contiene la coordinata Y della cella selezionata
  y := DC.FocusedRecordIndex;
  // Questa riga è stata aggiunta per risolvere alcuni problemi.
  //  Non ho ben capito perchè funziona però funziona quindi non toglierla.
  //  Il problema accadeva quando ad esempio avevo un documento con 1 riga
  //  e quando io aggiungevo un articolo con il codice dopo aver aver modificato
  //  un campo del rigo già esistente il nuovo articolo appariva prima del rigo
  //  e non in fondo. Così va tutto bene.
  DC.FocusedRecordIndex := -1;
  // Crea il nuovo rigo
  DC.DataSet.Append;
  try
    // y punta al record corrente
    y := DC.FocusedRecordIndex;
    // Procedura che imposta la proprietà InsertSQL della IBOQuery per poter inserire
    //  un rigo di Materiali / Apparecchi
    //  NB: Prima era all'inizio della procedura ma dava dei problemi con i righi inseriti
    //       direttamente nel GC ora qui va bene
    TabGCForm.SetMaterialiApparecchiInsertSQL;
    TabGCForm.SetMaterialiApparecchiUpdateSQL;
    // Inizializzazione del nuovo record
    DC.DataSet.FieldByName('GC_SEZIONE').Value  := 'Giacenza';
    DC.DataSet.FieldByName('TIPOLOGIA').Value  := 'Materiali / Apparecchi';
    DC.DataSet.FieldByName('DATADOCUMENTO').Value  := fData.Date;
    // Prima di tutto imposta il magazzino che il rigo deve movimentare
    DC.DataSet.FieldByName('CODICEMAGAZZINO').AsInteger  := StrToInt(DM1.MagazzinoDefault);
    // Inizia ad importare l'articolo
    DC.DataSet.FieldByName('CODICEARTICOLO').AsString       := Trim(fCodice.Text);
    DC.DataSet.FieldByName('CODICEARTICOLOREALE').AsString  := Trim(fCodice.Text);
    // Se è impostato un limite per la lunghezza della descrizione...
    if DM1.LunghezzaMaxDescrizioneArticolo <> 0
    then DC.DataSet.FieldByName('DESCRIZIONE').AsString  := LeftStr(Trim(fDescrizione.Text), DM1.LunghezzaMaxDescrizioneArticolo)
    else DC.DataSet.FieldByName('DESCRIZIONE').AsString  := Trim(fDescrizione.Text);
    DC.DataSet.FieldByName('GC_DESCRIZIONE').AsString := DC.DataSet.FieldByName('DESCRIZIONE').AsString;
    // Continua con il caricamento dell'articolo
    DC.DataSet.FieldByName('UNITADIMISURA').AsString           := Trim(fUM.Text);
    DC.DataSet.FieldByName('GC_COSTONETTOUNITARIO').AsFloat    := fCostoUnitario.Value;
    DC.DataSet.FieldByName('GC_QTA').AsFloat                   := fQta.Value;
    if (fRicarico.Value <> TabGCForm.GcVisRicaricoPerc.Value)
      then DC.DataSet.FieldByName('GC_RICARICO').AsFloat       := fRicarico.Value;
    // Conferma il dato e si posiziona su di esso
    DC.DataSet.Post;
    TabGCForm.btvGCRighi.Controller.ClearSelection;
    TabGCForm.btvGCRighi.Controller.FocusedRecord.Selected := True;
    TabGCForm.GridGC.SetFocus;
  except
    DC.DataSet.Cancel;
  end;
  // Conferma ed esce
  ModalResult := mrOk;
end;

end.
