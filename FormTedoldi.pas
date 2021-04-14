unit FormTedoldi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxMaskEdit, cxDropDownEdit, cxCalendar, cxControls,
  cxContainer, cxEdit, cxTextEdit, StdCtrls, Buttons, cxRadioGroup,
  cxCurrencyEdit, cxMemo, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TTedoldiForm = class(TForm)
    btnAnnulla: TBitBtn;
    bntOk: TBitBtn;
    Label7: TLabel;
    Label2: TLabel;
    eRifNum: TcxTextEdit;
    eRifData: TcxDateEdit;
    Label1: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    eRifMittDest: TcxTextEdit;
    Label4: TLabel;
    eDatiTratta: TcxTextEdit;
    Label5: TLabel;
    eCheckKm: TcxRadioButton;
    Label6: TLabel;
    eCheckColli: TcxRadioButton;
    Label8: TLabel;
    eCheckKg: TcxRadioButton;
    Label9: TLabel;
    eDatiPrzUnit: TcxCurrencyEdit;
    Shape2: TShape;
    Label10: TLabel;
    Shape3: TShape;
    Label11: TLabel;
    eDatiUm: TcxTextEdit;
    Label12: TLabel;
    Shape4: TShape;
    Label15: TLabel;
    Shape5: TShape;
    eDatiNote: TcxMemo;
    eCheckUm: TcxRadioButton;
    eDatiKm: TcxCurrencyEdit;
    eDatiColli: TcxCurrencyEdit;
    eDatiKg: TcxCurrencyEdit;
    eDatiQta: TcxCurrencyEdit;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
    procedure bntOkClick(Sender: TObject);
  private
    procedure CheckForQtaEnabled;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TedoldiForm: TTedoldiForm;

implementation

uses cxCustomData, SchedaPreventiviOrdini, DataModule1;

{$R *.dfm}

// IN base ai checks determina se la Qtà e l'unità di misura sono
//  abilitati
procedure TTedoldiForm.CheckForQtaEnabled;
begin
  // Qtà e UM adbilitati o no
  eDatiUm.Enabled   := eCheckUm.Checked;
  eDatiQta.Enabled  := eCheckUm.Checked;
  // In base ai checks copia i dati opportuno nella Qtà e in UM
  if          eCheckKm.Checked then begin
    eDatiUm.Text  := 'Km';
    eDatiQta.Value := eDatiKm.Value;
  end else if eCheckColli.Checked then begin
    eDatiUm.Text  := 'Pz';
    eDatiQta.Value := eDatiColli.Value;
  end else if eCheckKg.Checked then begin
    eDatiUm.Text  := 'Kg';
    eDatiQta.Value := eDatiKg.Value;
  end;
end;

procedure TTedoldiForm.TimerTimer(Sender: TObject);
begin
  // IN base ai checks determina se la Qtà e l'unità di misura sono
  //  abilitati
  CheckForQtaEnabled;
end;

procedure TTedoldiForm.bntOkClick(Sender: TObject);
var
  TmpStr, TmpStr2, CurrStr: String;
  DC: TcxCustomDataController;
  RI: Integer;
  ROW:Integer;
begin
  // Inizializzazione
  DC := PreventiviOrdiniForm.tvCorpo.DataController;
  RI := DC.FocusedRecordIndex;
  ROW := DC.FocusedRowIndex;
  // Se non c'è alcun record focused esce
  if RI = -1 then begin
    DM1.Messaggi('Levante', 'Prima seleziona il rigo.', '', [mbOk], 0, nil);
    Exit;
  end;
  // Sposta il focus per postare il dato
  eDatiNote.SetFocus;
  eRifNum.SetFocus;

  // ===========================================================================
  // COMPOSIZIONE DESCRIZIONE RIGO
  // ---------------------------------------------------------------------------
  // V. riferimento
  TmpStr := 'Vs.rif. ' + eRifNum.Text + ' del ' + FormatDateTime('dd/mm/yy',eRifData.Date) + ' - ' + eRifMittDest.Text + '  ';
  // Provincia (tratta)
  CurrStr := Trim(eDatiTratta.Text);
  if CurrStr <> '' then begin
    if TmpStr2 <> '' then TmpStr2 := TmpStr2 + ';  ';
    TmpStr2 := TmpStr2 + 'pr. ' + CurrStr;
  end;
  // Colli
  CurrStr := Trim(eDatiColli.Text);
  if CurrStr <> '' then begin
    if TmpStr2 <> '' then TmpStr2 := TmpStr2 + ';  ';
    TmpStr2 := TmpStr2 + CurrStr + ' colli';
  end;
  // Kg
  CurrStr := Trim(eDatiKg.Text);
  if CurrStr <> '' then begin
    if TmpStr2 <> '' then TmpStr2 := TmpStr2 + ';  ';
    TmpStr2 := TmpStr2 + CurrStr + ' Kg';
  end;
  // Km
  CurrStr := Trim(eDatiKm.Text);
  if CurrStr <> '' then begin
    if TmpStr2 <> '' then TmpStr2 := TmpStr2 + ';  ';
    TmpStr2 := TmpStr2 + CurrStr + ' Km';
  end;
  // Note (se ci sono)
  if Trim(eDatiNote.Text) <> '' then begin
    TmpStr2 := TmpStr2 + #13'Note: ' + eDatiNote.Text;
  end;
  // Compone la descrizione
  TmpStr  := Trim(TmpStr);
  TmpStr2 := Trim(TmpStr2);
  if (TmpStr <> '') and (TmpStr2 <> '') then TmpStr := TmpStr + '  ';
  TmpStr := TmpStr + TmpStr2;
  // ===========================================================================

  // ===========================================================================
  // ASSEGNAZIONE CAMPI
  // ---------------------------------------------------------------------------
  // Con questa parte di codice risolvo il problema che se creavo un nuovo record
  //  vuoto col KEYDOWN sulla tastiera quando uscivo dalla griglia o facevo il Post
  //  perdevo il record (se non avev modificato almeno un campo non da codice).
  // ---------------------------------------------------------------------------
  DC.Values[RI,PreventiviOrdiniForm.tvCorpoMINUTIPREVISTI.Index] := -99999;
  DC.Post;
  if (not PreventiviOrdiniForm.tvCorpo.ViewData.IsRecordIndexValid(RI))
  or (VarToStr(DC.Values[RI,PreventiviOrdiniForm.tvCorpoMINUTIPREVISTI.Index]) <> '-99999')
  then begin
    RI := DC.AppendRecord;
    if ROW > 0 then DC.Values[RI,PreventiviOrdiniForm.tvCorpoORDER.Index] := DC.Values[ROW-1,PreventiviOrdiniForm.tvCorpoORDER.Index] + 0.001;
  end;
  // ---------------------------------------------------------------------------
  // Descrizione
  DC.Values[RI,PreventiviOrdiniForm.tvCorpoDESCRIZIONE.Index] := TmpStr;
  // UM
  DC.Values[RI,PreventiviOrdiniForm.tvCorpoUNITADIMISURA.Index] := eDatiUm.EditValue;
  // Qta
  DC.Values[RI,PreventiviOrdiniForm.tvCorpoQTA.Index] := eDatiQta.EditValue;
  // Prezzo unitazioe
  DC.Values[RI,PreventiviOrdiniForm.tvCorpoPREZZOUNITARIO.Index] := eDatiPrzUnit.EditValue;
  // Riporta il testo della descrizione nelle note del documento
  PreventiviOrdiniForm.QryDocumentoNOTE.Value := TmpStr;
  // ===========================================================================

  // Esce
  Self.Close;
end;

end.
