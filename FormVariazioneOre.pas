unit FormVariazioneOre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  IB_Components, DB, IBODataset, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters;

type
  TVariazioneOreForm = class(TForm)
    Label9: TLabel;
    fCostoOrarioNormale: TcxCurrencyEdit;
    Label1: TLabel;
    fCostoOrarioStraordinario: TcxCurrencyEdit;
    Label2: TLabel;
    fCostoOrarioPermessi: TcxCurrencyEdit;
    Label3: TLabel;
    fCostoOrarioFerie: TcxCurrencyEdit;
    Label4: TLabel;
    fCostoOrarioTrasferte: TcxCurrencyEdit;
    Label5: TLabel;
    ButtonOk: TBitBtn;
    ButtonCancel: TBitBtn;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    fRichiamaDipendente: TcxComboBox;
    Label12: TLabel;
    T: TIB_Transaction;
    Q: TIBOQuery;
    procedure FormShow(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure fRichiamaDipendentePropertiesInitPopup(Sender: TObject);
    procedure fRichiamaDipendentePropertiesEditValueChanged(
      Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VariazioneOreForm: TVariazioneOreForm;

implementation

uses DataModule1, StrUtils, SchedaClienti;

{$R *.dfm}

procedure TVariazioneOreForm.FormShow(Sender: TObject);
begin
  fCostoOrarioNormale.SetFocus;
  MessageBeep(MB_ICONEXCLAMATION);
end;

procedure TVariazioneOreForm.ButtonOkClick(Sender: TObject);
var
  i: Integer;
begin
  // Controlla se c'è qualche rigo selezionato
  if ClientiForm.tvOre.Controller.SelectedRecordCount = 0 then begin
    DM1.Messaggi('Levante', 'Nessun rigo selezionato.'#13#13'Operazione annullata.', '', [mbOk], 0, nil);
    Exit;
  end;
  // Chiede conferma
  if DM1.Messaggi('Variazione costo manodopera', 'Confermi di voler continuare?', 'NB: Prima di continuare assicurarsi di aver selezionato le righe da modificare in modo corretto.', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  try try
    ButtonOK.SetFocus;
    DM1.ShowWait('Variazione costo ore manodopera', 'Operazione in corso...');
    // Avvia la transazione
    T.StartTransaction;
    // Se non sono stati specificati alcuni valori li pne uguali al costo
    //  orario ordinario.
    if fCostoOrarioNormale.Value = 0 then raise Exception.Create('ATTENZIONE!!!'#13#13'Costo orario normale (ordinario) uguale e 0 (zero).'#13#13'Operazione annullata.');
    if fCostoOrarioStraordinario.Value = 0  then fCostoOrarioStraordinario.Value := fCostoOrarioNormale.Value;
    if fCostoOrarioPermessi.Value = 0       then fCostoOrarioPermessi.Value := fCostoOrarioNormale.Value;
    if fCostoOrarioFerie.Value = 0          then fCostoOrarioFerie.Value := fCostoOrarioNormale.Value;
    if fCostoOrarioTrasferte.Value = 0      then fCostoOrarioTrasferte.Value := fCostoOrarioNormale.Value;
    // Effettua il prepare della query
    if not Q.Prepared then Q.Prepare;
    // Cicla per tutti i righi selezionati e li varia nei costi unitari
    for i := 0 to ClientiForm.tvOre.Controller.SelectedRecordCount -1 do begin
      Q.Params.ParamByName('P_COSTOORARIO').AsFloat         := fCostoOrarioNormale.Value;
      Q.Params.ParamByName('P_COSTOSTRAORDINARIO').AsFloat  := fCostoOrarioStraordinario.Value;
      Q.Params.ParamByName('P_COSTOPERMESSI').AsFloat       := fCostoOrarioPermessi.Value;
      Q.Params.ParamByName('P_COSTOFERIE').AsFloat          := fCostoOrarioFerie.Value;
      Q.Params.ParamByName('P_COSTOTRASFERTE').AsFloat      := fCostoOrarioTrasferte.Value;
      Q.Params.ParamByName('P_TIPODOC').AsString            := ClientiForm.tvOre.Controller.SelectedRecords[i].Values[ClientiForm.tvOreTIPODOC.Index];
      Q.Params.ParamByName('P_NUMDOC').AsInteger            := ClientiForm.tvOre.Controller.SelectedRecords[i].Values[ClientiForm.tvOreNUMDOC.Index];
      Q.Params.ParamByName('P_DATADOC').AsDateTime          := ClientiForm.tvOre.Controller.SelectedRecords[i].Values[ClientiForm.tvOreDATADOC.Index];
      Q.Params.ParamByName('P_REGISTRO').AsString           := ClientiForm.tvOre.Controller.SelectedRecords[i].Values[ClientiForm.tvOreREGISTRO.Index];
      Q.Params.ParamByName('P_NUMRIGO').AsInteger           := ClientiForm.tvOre.Controller.SelectedRecords[i].Values[ClientiForm.tvOreNUMRIGO.Index];
      Q.Params.ParamByName('P_NUMRIGO2').AsInteger          := ClientiForm.tvOre.Controller.SelectedRecords[i].Values[ClientiForm.tvOreNUMRIGO2.Index];
      Q.ExecSQL;
    end;
    // Commit della transazione
    T.Commit;
    // Messaggio finale
    DM1.Messaggi('Variazione costo ore manodopera', 'Operazione terminata.', '', [mbOk], 0, nil);
    Close;
  except
    // Se qualcosa è andato storto effettua il Rollback
    T.Rollback;
    raise;
  end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TVariazioneOreForm.fRichiamaDipendentePropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT CODICE, COGNOME, NOME FROM DIPENDENTI');
      Qry.Open;
      fRichiamaDipendente.Properties.Items.Clear;
      while not Qry.Eof do begin
         fRichiamaDipendente.Properties.Items.Add(   Qry.FieldByName('NOME').AsString + ' ' + Qry.FieldByName('COGNOME').AsString + '                                                        ' + Qry.FieldByName('CODICE').AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TVariazioneOreForm.fRichiamaDipendentePropertiesEditValueChanged(
  Sender: TObject);
var
   Qry : TIB_Cursor;
   Cod: Integer;
begin
   if (Trim(fRichiamaDipendente.Text) = '') then Exit;
   Cod := StrToInt(RightStr(fRichiamaDipendente.Text, 10));
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT FIRST 1 COSTOORARIO, COSTOSTR, COSTOPERMESSI, COSTOFERIE, COSTOTRASFERTE FROM DIPENDENTI WHERE CODICE = ' + IntToStr(Cod));
      Qry.Open;
      if Qry.Eof then raise Exception.Create('Dipendente non trovato.');
      fCostoOrarioNormale.Value       := Qry.FieldByName('COSTOORARIO').AsCurrency;
      fCostoOrarioStraordinario.Value := Qry.FieldByName('COSTOSTR').AsCurrency;
      fCostoOrarioPermessi.Value      := Qry.FieldByName('COSTOPERMESSI').AsCurrency;
      fCostoOrarioFerie.Value         := Qry.FieldByName('COSTOFERIE').AsCurrency;
      fCostoOrarioTrasferte.Value     := Qry.FieldByName('COSTOTRASFERTE').AsCurrency;
   finally
      Qry.Close;
      Qry.Free;
   end;
end;

end.
