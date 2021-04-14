unit FormFatturaImpegni;

interface

uses
  Forms, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls, Vcl.Buttons, Vcl.Controls, cxLabel, System.Classes,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, IB_Components;

type
  TFatturaImpegniForm = class(TForm)
    cxLabel1: TcxLabel;
    BtnSI: TBitBtn;
    BtnAnnulla: TBitBtn;
    Label2: TLabel;
    eDataFatturazione: TcxDateEdit;
    Label1: TLabel;
    cxLabel2: TcxLabel;
    LabelDataUltimaFatturaEmessa: TLabel;
    procedure BtnSIClick(Sender: TObject);
    procedure BtnAnnullaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eDataFatturazionePropertiesEditValueChanged(Sender: TObject);
  private
    FRegistro: String;
    procedure CaricaParametri;
    function GetDataFatturazione: TDate;
    procedure EnableYesButton;
    function getDataUltimaFattura(const ARegistro: String; const AData: TDate): TDate;
    { Private declarations }
  public
    { Public declarations }
    class function ShowFatturaImpegniForm(const ARegistro: String): TModalResult;
    property DataFatturazione: TDate read GetDataFatturazione;
  end;

var
  FatturaImpegniForm: TFatturaImpegniForm;

implementation

uses
  IniFiles, DataModule1, System.SysUtils, Vcl.Dialogs, System.Variants, System.DateUtils, Vcl.Graphics,
  FormConfirm;

{$R *.dfm}

procedure TFatturaImpegniForm.CaricaParametri;
var
  LO : TMemIniFile;
begin
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
  finally
    LO.Free;
  end;
end;

procedure TFatturaImpegniForm.eDataFatturazionePropertiesEditValueChanged(Sender: TObject);
begin
  EnableYesButton;
end;

procedure TFatturaImpegniForm.EnableYesButton;
var
  LDataUltimaFatturaEmessa, LDataSelezionata: TDate;
  LDataVuota, LDataValida: Boolean;
begin
  LDataVuota := VarIsNull(eDataFatturazione.EditValue);
  if LDataVuota then
    LDataSelezionata := Date
  else
    LDataSelezionata := eDataFatturazione.Date;
  LDataUltimaFatturaEmessa := getDataUltimaFattura(FRegistro, LDataSelezionata);
  LDataValida := (not LDataVuota) and (LDataSelezionata >= LDataUltimaFatturaEmessa);
  // Aggiorna la label che indica la data dell'ultima fattura emessa
  if LDataUltimaFatturaEmessa > 0 then
    LabelDataUltimaFatturaEmessa.Caption := 'Data ultima fattura emessa: ' + DateTostr(LDataUltimaFatturaEmessa)
  else
    LabelDataUltimaFatturaEmessa.Caption := 'Ancora nessuna fattura emessa';
  if LDataValida or LDataVuota then
    LabelDataUltimaFatturaEmessa.Font.Color := clBlue
  else
    LabelDataUltimaFatturaEmessa.Font.Color := clRed;
  // Abilita/disabilita il bonnote "SI"
  BtnSI.Enabled := LDataValida;
end;

procedure TFatturaImpegniForm.BtnSIClick(Sender: TObject);
begin
  // Chiude la form
  ModalResult := mrYes;
end;

procedure TFatturaImpegniForm.BtnAnnullaClick(Sender: TObject);
begin
  // Chiude la form
  ModalResult := mrAbort;
end;

procedure TFatturaImpegniForm.FormCreate(Sender: TObject);
begin
  Width  := 500;
  Height := 250;
  EnableYesButton;
end;

function TFatturaImpegniForm.GetDataFatturazione: TDate;
begin
  Result := eDataFatturazione.Date;
end;

function TFatturaImpegniForm.getDataUltimaFattura(const ARegistro: String; const AData: TDate): TDate;
var
  Qry: TIB_Cursor;
begin
  Qry := DM1.NewQuery;
  try
    Qry.SQL.Add('SELECT MAX(DATADOCUMENTO) FROM PRVORDCL');
    Qry.SQL.Add('WHERE TIPODOCUMENTO = :P_TIPODOCUMENTO');
    Qry.SQL.Add('AND REGISTRO = :P_REGISTRO');
    Qry.SQL.Add('AND DATADOCUMENTO >= :P_STARTOFTHEYEAR');
    Qry.SQL.Add('AND DATADOCUMENTO <= :P_ENDOFTHEYEAR');
    Qry.Prepare;
    Qry.ParamByName('P_TIPODOCUMENTO').AsString := 'Fattura';
    Qry.ParamByName('P_REGISTRO').AsString := ARegistro;
    Qry.ParamByName('P_STARTOFTHEYEAR').AsDateTime := StartOfTheYear(AData);
    Qry.ParamByName('P_ENDOFTHEYEAR').AsDateTime := EndOfTheYear(AData);
    Qry.Open;
    Result := Qry.Fields[0].AsDate;
  finally
    Qry.Free;
  end;
end;

class function TFatturaImpegniForm.ShowFatturaImpegniForm(const ARegistro: String): TModalResult;
begin
  // Inizializzazione
  Result := mrNone;
  // Prima chiede conferma dell'esecuzione di un backupè
  if not TConfirmForm.ConfirmationRequest('Hai fatto un backup?',
    'Prima di proseguire è consigliabile effettuare una copia di sicurezza.'#13#13'Se il backup è già stato fatto digitare "backup fatto" per proseguire, altrimenti tornare indietro ed eseguirlo.',
    'backup fatto', 600, 350) then
    Exit;
  // Crea la form, ne imposta alcune proprietà
  Application.CreateForm(TFatturaImpegniForm, FatturaImpegniForm);
  try
    FatturaImpegniForm.FRegistro := ARegistro;
    // Visualizza la form
    Result := FatturaImpegniForm.ShowModal;
  finally
    // Pulizie finali
    FreeAndNil(FatturaImpegniForm);
  end;
end;

end.
