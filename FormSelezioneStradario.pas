unit FormSelezioneStradario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteFilterListAnag, FormLevanteListAnag,
  cxEdit, DB, cxDBData, cxTextEdit,
  StdCtrls, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  Menus, IBODataset, bmpPanel, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator;

type
  TSelezioneStradarioForm = class(TLevanteFilterListAnagForm)
    QCODICEISTATCOMUNECOMPLETO: TStringField;
    QDENOMINAZIONESTRADACOMPLETA: TStringField;
    QDENOMINAZIONECOMUNE: TStringField;
    QSIGLAPROVINCIA: TStringField;
    QDENOMINAZIONEREGIONE: TStringField;
    QCAP: TStringField;
    tvListCODICEISTATCOMUNECOMPLETO: TcxGridDBColumn;
    tvListDENOMINAZIONESTRADACOMPLETA: TcxGridDBColumn;
    tvListDENOMINAZIONECOMUNE: TcxGridDBColumn;
    tvListSIGLAPROVINCIA: TcxGridDBColumn;
    tvListDENOMINAZIONEREGIONE: TcxGridDBColumn;
    tvListCAP: TcxGridDBColumn;
    QDENOMINAZIONEPROVINCIA: TStringField;
    tvListDENOMINAZIONEPROVINCIA: TcxGridDBColumn;
    StaticText22: TStaticText;
    FilterComune: TEdit;
    StaticText1: TStaticText;
    FilterStrada: TEdit;
    StaticText2: TStaticText;
    FilterSiglaProvincia: TEdit;
    StaticText3: TStaticText;
    FilterProvinciaEstesa: TEdit;
    StaticText4: TStaticText;
    FilterCAP: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure FilterComuneKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonResetQueryClick(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  protected
      procedure EseguiQuery; virtual;
  public
    { Public declarations }
    // Campi
    FieldCodiceComune: TField;
    FieldDenominazioneComune: TField;
    FieldDenominazioneStrada: TField;
    FieldSiglaProvincia: TField;
    FieldCAP: TField;
  end;

var
  SelezioneStradarioForm: TSelezioneStradarioForm;

implementation

uses DataModule1;


{$R *.dfm}

procedure TSelezioneStradarioForm.EseguiQuery;
begin
  DM1.ShowWait('Levante', 'Operazione in corso...');
  try
    Q.Close;
    Q.SQL.Clear;
    Q.SQL.Add('SELECT * FROM STRADARIO_LIST_VIEW');
    // Filtri
    if FilterComune.Text <> ''          then DM1.AggiungiRicercaCampo(Q.SQL, 'DENOMINAZIONECOMUNE', FilterComune.Text, True);
    if FilterStrada.Text <> ''          then DM1.AggiungiRicercaCampo(Q.SQL, 'DENOMINAZIONESTRADACOMPLETA', FilterStrada.Text, True);
    if FilterSiglaProvincia.Text <> ''  then DM1.AggiungiRicercaCampo(Q.SQL, 'SIGLAPROVINCIA', FilterSiglaProvincia.Text, True);
    if FilterProvinciaEstesa.Text <> '' then DM1.AggiungiRicercaCampo(Q.SQL, 'DENOMINAZIONEPROVINCIA', FilterProvinciaEstesa.Text, True);
    if FilterCAP.Text <> ''             then DM1.AggiungiRicercaCampo(Q.SQL, 'CAP', FilterCAP.Text, True);
    // Esegue la query
    Q.Open;
  finally
    DM1.CloseWait;
  end;
end;

procedure TSelezioneStradarioForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SelezioneStradarioForm := nil;
end;

procedure TSelezioneStradarioForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
  inherited;
  EseguiQuery;
end;

procedure TSelezioneStradarioForm.FilterComuneKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   // Se viene premuto il pulsante INVIO preme il pulsante di avvio
   if Key = chr(13) then RxSpeedButtonTrovaClick(Self);
end;

procedure TSelezioneStradarioForm.FormShow(Sender: TObject);
begin
  inherited;
  FilterComune.SetFocus;
end;

procedure TSelezioneStradarioForm.RxSpeedButtonResetQueryClick(
  Sender: TObject);
begin
  inherited;
  FilterComune.Text := '';
  FilterStrada.Text := '';
  FilterSiglaProvincia.Text := '';
  FilterProvinciaEstesa.Text := '';
  FilterCAP.Text := '';
end;

procedure TSelezioneStradarioForm.tvListDblClick(Sender: TObject);
begin
  // Non eredita il comportamento degli antenati perchè ne voglio modificare  il comportamento
  //  in particolare non voglio che si apra alcuna sezione di anagrafica della riga selezionata se non
  //  sono in modalità di selezione
  // inherited;
  // ---------------------------------------------------------------------------
  // Se non siamo siamo in modalità di selezione esce subito
  if Self.DblClickMode <> DblClickModeSelection then Exit;

  // Altrimenti procede con la selezione

  // Se il CallerCode = 0 significa che si sono passati direttamente i puntatori ai campi
  if Self.CallerCode = 0 then begin
    // Assegnazione selezione ai campi ricevuti
    if Assigned(FieldCodiceComune)        then FieldCodiceComune.Value        := QCODICEISTATCOMUNECOMPLETO.AsString;
    if Assigned(FieldDenominazioneComune) then FieldDenominazioneComune.Value := QDENOMINAZIONECOMUNE.AsString;
    if Assigned(FieldDenominazioneStrada) then FieldDenominazioneStrada.Value := QDENOMINAZIONESTRADACOMPLETA.AsString;
    if Assigned(FieldSiglaProvincia)      then FieldSiglaProvincia.Value      := QSIGLAPROVINCIA.AsString;
    if Assigned(FieldCAP)                 then FieldCAP.Value                 := QCAP.AsString;
    // Chiude la form
    Self.Close;
  end;
end;

procedure TSelezioneStradarioForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  case key of

    // F11
    122: begin
      FilterComune.SetFocus;
    end;

  end;

end;

end.
