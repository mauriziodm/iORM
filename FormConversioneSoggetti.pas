unit FormConversioneSoggetti;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  IBODataset, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxDBEdit, cxTextEdit,
  cxMaskEdit, cxSpinEdit, Vcl.Buttons, IB_Components;

type
  TConversioneSoggettiForm = class(TForm)
    Qry: TIBOQuery;
    QryCODICE: TIntegerField;
    QryRAGIONESOCIALE: TStringField;
    QryCOGNOME: TStringField;
    QryNOME: TStringField;
    QryTIPOPERSONA: TStringField;
    QryPARTITAIVA: TStringField;
    QryCODICEFISCALE: TStringField;
    DataSource1: TDataSource;
    Label1: TLabel;
    eCodice: TcxDBSpinEdit;
    Label2: TLabel;
    eRagioneSociale: TcxDBTextEdit;
    Label3: TLabel;
    eCognome: TcxDBTextEdit;
    Label4: TLabel;
    eNome: TcxDBTextEdit;
    Label6: TLabel;
    ePartitaIVA: TcxDBTextEdit;
    Label7: TLabel;
    eCodiceFiscale: TcxDBTextEdit;
    LabelTipoPersona: TLabel;
    eTipoPersona: TcxDBRadioGroup;
    btnStart: TBitBtn;
    btnAnnulla: TBitBtn;
    btnNext: TBitBtn;
    LabelProgression: TLabel;
    Label5: TLabel;
    QryPrat: TIBOQuery;
    ConvSoggTrans: TIBOTransaction;
    procedure eTipoPersonaPropertiesChange(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAnnullaClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
    FRecordCount, FCurrentRecord: Integer;
    function SplitCognomeNome(const ARagSoc: String; var ACognome, ANome: String): boolean;
    function PossibilePersonaFisica(var ACodiceFiscale, APartitaIVA: String): boolean;
    function ControlloCodFiscInPartitaIVA(var ACodiceFiscale, APartitaIVA: String): Boolean;
    function DoConversioneAutomatica: boolean;
    procedure DoConversioneManuale;
    procedure UpdateManualProgression;
  public
    { Public declarations }
  end;

var
  ConversioneSoggettiForm: TConversioneSoggettiForm;

implementation

{$R *.dfm}

uses DataModule1, StrUtils;

{ TConversioneSoggettiForm }

procedure TConversioneSoggettiForm.btnAnnullaClick(Sender: TObject);
begin
  if DM1.Messaggi('Annullamento/Interruzione conversione', 'Vuoi annullare/interrompere l''operazione?', '', [mbYes,mbNo], 0, nil) = mrYes then
  begin  
    if Qry.Active then
      Qry.Close;
    Self.Close;
  end;
end;

procedure TConversioneSoggettiForm.btnNextClick(Sender: TObject);
begin
//  ConvSoggTrans.StartTransaction;
//  try
    // Post soggetti
    Qry.Post;
    // Post pratiche (impianti)
//    if not QryPrat.Prepared then
//      QryPrat.Prepare;
//    QryPrat.ParamByName('P_TIPOPERSONA').Value := QryTIPOPERSONA.Value;
//    QryPrat.ParamByName('P_RAGIONESOCIALE').Value := QryRAGIONESOCIALE.Value;
//    QryPrat.ParamByName('P_COGNOME').Value := QryCOGNOME.Value;
//    QryPrat.ParamByName('P_NOME').Value := QryNOME.Value;
//    QryPrat.ParamByName('P_CODICE').Value := QryCODICE.Value;
//    QryPrat.ExecSQL;
    // Commit
//    ConvSoggTrans.Commit;
//  except
    // Rollback
//    ConvSoggTrans.Rollback;
//  end;
  // Next
  if Qry.Eof then
  begin
    DM1.Messaggi('Operazione completata.', 'Operazione completata.', '', [mbOk], 0, nil);
    Qry.Close;
    Self.Close;
  end
  else
  begin
    Qry.Next;
    Inc(FCurrentRecord);
    Qry.Edit;
    Self.UpdateManualProgression;
  end;
end;

procedure TConversioneSoggettiForm.btnStartClick(Sender: TObject);
var
  ConvertitiTutti: Boolean;
begin
  if DM1.Messaggi('Conversione soggetti', 'Avviare la conversione automatica dei soggetti?', '', [mbYes,mbNo], 0, nil) <> mrYes then
    Exit;
  // Disabilita i bottoni
  btnStart.Enabled := False;
  btnAnnulla.Enabled := False;
  // Avvia la conversione
  DM1.ShowWait('Conversione soggetti', 'Avvio...');
  try
    ConvertitiTutti := Self.DoConversioneAutomatica;
  finally
    DM1.CloseWait;
  end;
  // Se la conversione è stata completa finisce qui, altrimenti
  //  si predispone per la conversione manuale dei soggetti rimasti.
  if ConvertitiTutti then
  begin
    DM1.Messaggi('Operazione completata.', 'Operazione completata.', '', [mbOk], 0, nil);
    Self.Close;
  end
  else
  begin
    DM1.Messaggi('Conversione soggetti.', 'Sono rimasti soggetti che non è stato possibile convertire automaticamente.'#13#13'Ora la procedura permetterà di proseguire manualmente.', '', [mbOk], 0, nil);
    btnStart.Visible := False;
    btnAnnulla.Enabled := True;
    btnNext.Visible := True;
    Self.DoConversioneManuale;
  end;
end;

function TConversioneSoggettiForm.DoConversioneAutomatica: boolean;
var
  LCognome, LNome, LCodiceFiscale, LPartitaIVA: String;
begin
  // Inizializzazione
  Result := True;
  // Apre la query
  if Qry.Active then
    Qry.Close;
  Qry.DisableControls;
  try
    Qry.Open;
    FRecordCount := Qry.RecordCount;
    FCurrentRecord := 1;
    // Cicla per tutti i records
    while not Qry.Eof do
    begin
      // Update the screen progress
      DM1.ShowWait('', 'Record ' + IntToStr(FCurrentRecord) + '/' + IntToStr(FRecordCount));
      // CArica alcuni dati
      LCodiceFiscale := Trim(QryCODICEFISCALE.AsString);
      LPartitaIVA := Trim(QryPARTITAIVA.AsString);
      // Se è una possibile persona fisica
      if Self.PossibilePersonaFisica(LCodiceFiscale, LPartitaIVA) then
      begin
        LCognome := '';
        LNome := '';
        // Se è possibile splittare senza problemi la RagSoc in cognome e nome lo fa e imposta
        //  il record corrente come persona fisica, altrimenti si ferma e chiede all'operatore
        if SplitCognomeNome(QryRAGIONESOCIALE.AsString, LCognome, LNome) then
        begin
//          ConvSoggTrans.StartTransaction;
//          try
            Qry.Edit;
            QryCOGNOME.Value := LCognome;
            QryNOME.Value := LNome;
            QryCODICEFISCALE.Value := LCodiceFiscale;
            QryPARTITAIVA.Value := LPartitaIVA;
            QryTIPOPERSONA.Value := 'F';
            Qry.Post;
            // Post pratiche (impianti)
//            if not QryPrat.Prepared then
//              QryPrat.Prepare;
//            QryPrat.ParamByName('P_TIPOPERSONA').Value := QryTIPOPERSONA.Value;
//            QryPrat.ParamByName('P_RAGIONESOCIALE').Value := QryRAGIONESOCIALE.Value;
//            QryPrat.ParamByName('P_COGNOME').Value := QryCOGNOME.Value;
//            QryPrat.ParamByName('P_NOME').Value := QryNOME.Value;
//            QryPrat.ParamByName('P_CODICE').Value := QryCODICE.Value;
//            QryPrat.ExecSQL;
//            ConvSoggTrans.Commit;
//          except
//            ConvSoggTrans.Rollback;
//          end;
        end
        else
          // Se ci sono records potenziali persone fisiche la cui elaborazione
          //  automatica è fallita pone Result := False in modo che venga
          //  successivamente avviata anche una elaborazione manuale.
          Result := False;
      end
      else
        // Se ci sono records potenziali persone fisiche la cui elaborazione
        //  automatica è fallita pone Result := False in modo che venga
        //  successivamente avviata anche una elaborazione manuale.
        Result := False;
      // Avanti il prossimo
      Qry.Next;
      Inc(FCurrentRecord);
    end;
  finally
    Qry.EnableControls;
    Qry.Close;
  end;
end;

procedure TConversioneSoggettiForm.DoConversioneManuale;
begin
  // Apre la query
  if Qry.Active then
    Qry.Close;
  Qry.Open;
  FRecordCount := Qry.RecordCount;
  FCurrentRecord := 1;
  Qry.Edit;
  Self.UpdateManualProgression;
end;

procedure TConversioneSoggettiForm.eTipoPersonaPropertiesChange(
  Sender: TObject);
begin
  // Show depending....
  case eTipoPersona.ItemIndex of
    // Persona fisica
    0: begin
      eRagioneSociale.Enabled := False;
      eCognome.Enabled := True;
      eNome.Enabled := True;
    end;
    // Persona giuridica
    1: begin
      eRagioneSociale.Enabled := True;
      eCognome.Enabled := False;
      eNome.Enabled := False;
    end;
  end;
end;

procedure TConversioneSoggettiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

function TConversioneSoggettiForm.ControlloCodFiscInPartitaIVA(var ACodiceFiscale, APartitaIVA: String): Boolean;
var
  LCodFisc: String;
  i: Integer;
begin
  ACodiceFiscale := Trim(ACodiceFiscale);
  APartitaIVA := Trim(APartitaIVA);

  LCodFisc := LeftStr(Trim(ACodiceFiscale), 6);
  for i := 1 to Length(LCodFisc) do
    if not CharInSet(LCodFisc[i], ['a'..'z', 'A'..'Z']) then
      Exit(False);
  if ACodiceFiscale <> '' then
    Exit(False);

  ACodiceFiscale := APartitaIVA;
  APartitaIVA := '';
  Result := True;
end;

function TConversioneSoggettiForm.PossibilePersonaFisica(var ACodiceFiscale,
  APartitaIVA: String): boolean;
begin
  ACodiceFiscale := Trim(ACodiceFiscale);
  APartitaIVA := Trim(APartitaIVA);
  Result := ((ACodiceFiscale <> '') and (ACodiceFiscale <> APartitaIVA))   or   Self.ControlloCodFiscInPartitaIVA(ACodiceFiscale, APartitaIVA);
end;

function TConversioneSoggettiForm.SplitCognomeNome(const ARagSoc: String;
  var ACognome, ANome: String): boolean;
var
  LStrList: TStrings;
begin
  Result := False;
  LStrList := TStringList.Create;
  try
    LStrList.Delimiter := ' ';
    LStrList.DelimitedText := ARagSoc;
    if LStrList.Count = 2 then
    begin
      ACognome := Trim(LStrList[0]);
      ANome := Trim(LStrList[1]);
      Result := ((ACognome <> '') and (ANome <> ''));
    end;
  finally
    LStrList.Free;
  end;
end;

procedure TConversioneSoggettiForm.UpdateManualProgression;
begin
  LabelProgression.Caption := 'Record ' + IntToStr(FCurrentRecord) + '/' + IntToStr(FRecordCount);
end;

end.
