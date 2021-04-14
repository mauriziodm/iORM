unit FormContatti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls,
  Buttons, IBODataset, IniFiles,
  Variants;

type
  TContattiForm = class(TForm)
    Panel1: TPanel;
    PanelParlatoDi: TPanel;
    Label4: TLabel;
    PanelNumeroData: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit17: TDBEdit;
    PanelOggetto: TPanel;
    Label3: TLabel;
    Label10: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit16: TDBEdit;
    PanelStato: TPanel;
    Label8: TLabel;
    DBEditStatoDocumento: TDBEdit;
    BitBtnSelezioneStato: TBitBtn;
    PanelPratiche: TPanel;
    Label41: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    BitBtnPratica1: TBitBtn;
    BitBtnPratica2: TBitBtn;
    BitBtnPratica3: TBitBtn;
    PanelDatiAnagrafici: TPanel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBMemo1: TDBMemo;
    PanelPulsanti: TPanel;
    BitBtnCliente: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    TipoContatto: TDBRadioGroup;
    PanelMezzo: TPanel;
    Label2: TLabel;
    DBComboBoxMezzo: TDBComboBox;
    PanelAllarme: TPanel;
    Label9: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    PanelContattoSuccessivo: TPanel;
    Label16: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label18: TLabel;
    EditTipoSucc: TEdit;
    Label19: TLabel;
    EditMezzoSucc: TEdit;
    Label20: TLabel;
    EditOggettoSucc: TEdit;
    PanelContattoPrecedente: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    EditTipoPrec: TEdit;
    EditMezzoPrec: TEdit;
    EditOggettoPrec: TEdit;
    EditOraSucc: TEdit;
    EditOraPrec: TEdit;
    DBEdit8: TDBEdit;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    RxLabel2: TLabel;
    RxLabel3: TLabel;
    RxLabel4: TLabel;
    RxLabel5: TLabel;
    RxLabel6: TLabel;
    RxLabel7: TLabel;
    RxLabel8: TLabel;
    RxLabel9: TLabel;
    RxLabel10: TLabel;
    RxLabel11: TLabel;
    RxLabel12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnPratica1Click(Sender: TObject);
    procedure BitBtnPratica2Click(Sender: TObject);
    procedure BitBtnPratica3Click(Sender: TObject);
    procedure DBEditStatoDocumentoChange(Sender: TObject);
    procedure BitBtnSelezioneStatoClick(Sender: TObject);
    procedure BitBtnClienteClick(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure GeneraContattoSuccessivo;
    procedure VisualizzaPrecSucc;
    procedure DBComboBoxMezzoDropDown(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     // Queste contengono i riferimenti al record da visualizzare/editare
     CodiceContatto:Longint;
     DataContatto:TDate;
     CodiceCliente,CodicePratica,DataPratica, TipoCont : String;
  end;

var
  ContattiForm: TContattiForm;

implementation

uses DataModule1, main, FormHelp;

{$R *.DFM}


procedure TContattiForm.VisualizzaPrecSucc;
var
   Qry:TIBOQuery;
begin
   // Crea l'oggetto query che poi andrà a cercare il contatto precedente e quello successivo per poi
   //  visualizzarne i valori di alcuni campi nella form.
   Qry := TIBOQuery.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;

   // Contatto successivo
   //  Solo se il codice del contatto successivo e la data non sono nulli
   if not DM1.TableContattiContattoSuccessivo.IsNull then begin
      Qry.SQL.Add('SELECT Tipo, Ora, Mezzo, Oggetto');
      Qry.SQL.Add('FROM Contatti');
      Qry.SQL.Add('WHERE Codice = ' + IntToStr(DM1.TableContattiContattoSuccessivo.Value));
      Qry.SQL.Add('  AND Data = ''' + FormatDateTime('mm/dd/yyyy', DM1.TableContattiDataSuccessivo.Value) + '''');
      Qry.Open;
      // Visualizzazione dati
      EditTipoSucc.Text         := Qry.FieldByName('Tipo').AsString;
      EditOraSucc.Text          := Qry.FieldByName('Ora').AsString;
      EditMezzoSucc.Text        := Qry.FieldByName('Mezzo').AsString;
      EditOggettoSucc.Text      := Qry.FieldByName('Oggetto').AsString;

      // Azzera la query
      Qry.Close;
      Qry.SQL.Clear;
   end;

   // Contatto Precedente
   //  Solo se il codice del contatto precedente e la data non sono nulli
   if not DM1.TableContattiContattoPrecedente.IsNull then begin
      Qry.SQL.Add('SELECT Tipo, Ora, Mezzo, Oggetto');
      Qry.SQL.Add('FROM Contatti');
      Qry.SQL.Add('WHERE Codice = ' + IntToStr(DM1.TableContattiContattoPrecedente.Value));
      Qry.SQL.Add('  AND Data = ''' + FormatDateTime('mm/dd/yyyy', DM1.TableContattiDataPrecedente.Value) + '''');
      Qry.Open;
      // Visualizzazione dati
      EditTipoPrec.Text         := Qry.FieldByName('Tipo').AsString;
      EditOraPrec.Text          := Qry.FieldByName('Ora').AsString;
      EditMezzoPrec.Text        := Qry.FieldByName('Mezzo').AsString;
      EditOggettoPrec.Text      := Qry.FieldByName('Oggetto').AsString;
   end;

   // Distrugge la query
   Qry.Close;
   Qry.Free;
end;



procedure TContattiForm.GeneraContattoSuccessivo;
var
   Qry:TIBOQuery;
begin
   // Crea l'oggetto query che poi farà l'insert nella tabella dei contatti per inserire il nuovo contatto
   //  preimpostando alcuni campi in base al contenuto del record corrente e calcolando la data in base alla periodicità.
   Qry := TIBOQuery.Create(Self);
   Qry.DatabaseName := DM1.ArcDBFile;
   Qry.IB_Connection := DM1.DBAzienda;

   Qry.SQL.Add('INSERT');
   Qry.SQL.Add('INTO Contatti (Codice, Tipo, Data, Cliente, RagSocCli, IndirizzoCli, CittaCli, CAPCli, ProvinciaCli,');
   Qry.SQL.Add('               Oggetto, Mezzo, Periodicita, Allarme, AnticipoAllarme, Pratica, DataPratica1, Pratica2, DataPratica2,');
   Qry.SQL.Add('               Pratica3, DataPratica3, ContattoPrecedente, DataPrecedente)');
   Qry.SQL.Add('VALUES (');
      Qry.SQL.Add(IntToStr(DM1.NextCodice('CONTATTI', 'CODICE')) + ',');
      Qry.SQL.Add('''Cont.fare'',');
      Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', (DM1.TableContattiData.Value + DM1.TableContattiPeriodicita.Value)) + ''',');
      Qry.SQL.Add(IntToStr(DM1.TableContattiCliente.Value)         + ',');
      Qry.SQL.Add('''' + DM1.TableContattiRagSocCli.Value           + ''',');
      Qry.SQL.Add('''' + DM1.TableContattiIndirizzoCli.Value        + ''',');
      Qry.SQL.Add('''' + DM1.TableContattiCittaCli.Value            + ''',');
      Qry.SQL.Add('''' + DM1.TableContattiCAPCli.Value              + ''',');
      Qry.SQL.Add('''' + DM1.TableContattiProvinciaCli.Value        + ''',');
      Qry.SQL.Add('''' + DM1.TableContattiOggetto.Value             + ''',');
      Qry.SQL.Add('''' + DM1.TableContattiMezzo.Value               + ''',');
      Qry.SQL.Add(IntToStr(DM1.TableContattiPeriodicita.Value)     + ',');
      Qry.SQL.Add('''' + DM1.TableContattiAllarme.Value             + ''',');

      if DM1.TableContattiAnticipoAllarme.IsNull then begin
         Qry.SQL.Add('NULL,');
      end else begin
         Qry.SQL.Add(IntToStr(DM1.TableContattiAnticipoAllarme.Value) + ',');
      end;

      if DM1.TableContattiPratica.IsNull then begin
         Qry.SQL.Add('NULL ,');
         Qry.SQL.Add('NULL ,');
      end else begin
         Qry.SQL.Add(IntToStr(DM1.TableContattiPratica.Value) + ',');
         Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DM1.TableContattiDataPratica1.Value) + ''',');
      end;

      if DM1.TableContattiPratica2.IsNull then begin
         Qry.SQL.Add('NULL ,');
         Qry.SQL.Add('NULL ,');
      end else begin
         Qry.SQL.Add(IntToStr(DM1.TableContattiPratica2.Value) + ',');
         Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DM1.TableContattiDataPratica2.Value) + ''',');
      end;

      if DM1.TableContattiPratica3.IsNull then begin
         Qry.SQL.Add('NULL ,');
         Qry.SQL.Add('NULL ,');
      end else begin
         Qry.SQL.Add(IntToStr(DM1.TableContattiPratica3.Value) + ',');
         Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DM1.TableContattiDataPratica3.Value) + ''',');
      end;

     Qry.SQL.Add(IntToStr(DM1.TableContattiCodice.Value)          + ',');
      Qry.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', DM1.TableContattiData.Value) + '''');
   Qry.SQL.Add(')');
   Qry.ExecSQL;

   Qry.Free;

   // Aggiorna i campi del contatto successivo
   DM1.TableContatti.Edit;
//    DM1.TableContattiContattoSuccessivo.Value      := DM1.TableProgressiviProgContatti.Value;
    DM1.TableContattiDataSuccessivo.Value          := DM1.TableContattiData.Value + DM1.TableContattiPeriodicita.Value;
   DM1.TableContatti.Post;

end;



procedure TContattiForm.FormCreate(Sender: TObject);
begin
   Left     := 2;
   Top      := 2;
   Width    := 708;
   Height   := 534;
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Contatti)';
   // Carica le bitmap dei pulsanti
   RxSpeedButtonUscita.Glyph            := DM1.B1;
   RxSpeedButtonHelp.Glyph              := DM1.B2;
   RxSpeedModifica.Glyph                := DM1.B3;
   RxSpeedButtonNuovo.Glyph             := DM1.B4;
   RxSpeedButtonElimina.Glyph           := DM1.B5;
   RxSpeedButtonTrova.Glyph             := DM1.B6;
   RxSpeedButtonResetQuery.Glyph        := DM1.B7;
   RxSpeedButtonStampa.Glyph            := DM1.B8;
   RxSpeedButtonFax.Glyph               := DM1.B9;
   RxSpeedButtonMail.Glyph              := DM1.B10;
   RxSpeedButtonVisualizza.Glyph        := DM1.B11;
end;

procedure TContattiForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     Close;
end;

procedure TContattiForm.RxSpeedModificaClick(Sender: TObject);
begin
     DM1.Attendere;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          DM1.TableContatti.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          BitBtnSelezioneStato.Enabled       := True;
          BitBtnPratica1.Enabled             := True;
          BitBtnPratica2.Enabled             := True;
          BitBtnPratica3.Enabled             := True;
          BitBtnCliente.Enabled              := True;
          TipoContatto.Color            := clWhite;
          PanelMezzo.Color                   := clWhite;
          PanelAllarme.Color                 := clWhite;
          PanelNumeroData.Color              := clWhite;
          PanelOggetto.Color                 := clWhite;
          PanelParlatoDi.Color               := clWhite;
          // sposta il focus sul primo campo editabile
          DBEdit5.SetFocus;
          TipoContatto.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end
     else
     begin
        // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Disabilita la modifica dei campi
          DM1.TableContatti.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MessageBeep(0);
          If MessageDlg('Confermi le modifiche apportate ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOK then
          begin
               // Se il codice è nullo (nuovo record) ne assegna uno nuovo.
               if DM1.TableContattiCodice.IsNull then begin
                  DM1.TableContattiCodice.Value := DM1.NextCodice('CONTATTI', 'CODICE');
               end;

               DM1.TableContatti.Post;

               // Se il tipo di contatto è = 'Cont.fatto' e la periodicità è > 0 e il campo 'ContattoSoccessivo' è nullo oppure = 0
               //  allora genera automaticamente il contatto sucessivo previa comunicazione di richiesta di conferma.
               if (DM1.TableContattiTipo.Value = 'Cont.fatto')and(DM1.TableContattiPeriodicita.Value > 0)and((DM1.TableContattiContattoSuccessivo.IsNull)or(DM1.TableContattiContattoSuccessivo.Value = 0)) then begin
                  MessageBeep(0);
                  If MessageDlg('Creo automaticamente il prossimo contatto ?', mtConfirmation, [mbOK, mbCancel], 0) = mrOK then begin
                     // Genera automaticamente il contatto successivo
                     GeneraContattoSuccessivo;
                  end;
               end;
          end else begin
               DM1.TableContatti.Cancel;
               Close;
          end;
          // Se il codice è nullo lo elimina
          if DM1.TableContattiCodice.IsNull then DM1.TableContatti.Delete;
          // Ripristina pulsanti e campi
          RxSpeedButtonUscita.Enabled        := True;
          BitBtnSelezioneStato.Enabled       := False;
          BitBtnPratica1.Enabled             := False;
          BitBtnPratica2.Enabled             := False;
          BitBtnPratica3.Enabled             := False;
          BitBtnCliente.Enabled              := False;
          TipoContatto.Color                 := clSilver;
          PanelMezzo.Color                   := clSilver;
          PanelAllarme.Color                 := clSilver;
          PanelNumeroData.Color              := clSilver;
          PanelOggetto.Color                 := clSilver;
          PanelParlatoDi.Color               := clSilver;
          // sposta il focus sul primo campo editabile
          DBEdit10.SetFocus;
          DBEdit5.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               DM1.TableContatti.Edit;
          end;
       end;
     end;
     DM1.ChiudiAttendere;
end;

procedure TContattiForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

      // F2 = Modifica
      113: begin
         if RxSpeedModifica.Enabled then begin
            RxSpeedModifica.Down := not RxSpeedModifica.Down;
            RxSpeedModificaClick(Self);
         end;
      end;

   end;
end;

procedure TContattiForm.FormShow(Sender: TObject);
begin
      DM1.FocusRefresh;
      // In base al valore di 'Tag' apre la form in diverse modalità...
      case Tag of
         // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
         1: begin
            if not DM1.TableContatti.Locate('Codice;Data', VarArrayOf([CodiceContatto,DataContatto]), []) then begin
               MessageDlg('Contatto non trovato !', mtError, [mbOK], 0)
            end;
            VisualizzaPrecSucc;
         end;
         // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
         2: begin
            DM1.TableContatti.Append;
             DM1.TableContattiCliente.Value      := StrToInt(CodiceCliente);
             if CodicePratica <> '' then DM1.TableContattiPratica.Value      := StrToInt(CodicePratica);
             if DataPratica <> ''   then DM1.TableContattiDataPratica1.Value := StrToDate(DataPratica);
             DM1.TableContattiData.Value         := Date;
             DM1.TableContattiOra.Value          := TimeToStr(Time);
             DM1.TableContattiTipo.Value         := TipoCont;
             DM1.TableContattiAllarme.Value      := '0';
//            DM1.TableContatti.Post;
            RxSpeedModifica.Down := True;
            RxSpeedModificaClick(Self);
         end;
      end;

   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo/elimina
   if DM1.ModCtrl(MOD_CONTATTI) > 1 then begin
      RxSpeedModifica.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
   end;
end;

procedure TContattiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TContattiForm.BitBtnPratica1Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(DM1.TableContattiPratica,
                        DM1.TableContattiDataPratica1,
                        nil,
                        DM1.TableContattiCliente,
                        DM1.TableContattiCliente.Value);
end;

procedure TContattiForm.BitBtnPratica2Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(DM1.TableContattiPratica2,
                        DM1.TableContattiDataPratica2,
                        nil,
                        nil,
                        DM1.TableContattiCliente.Value);
end;

procedure TContattiForm.BitBtnPratica3Click(Sender: TObject);
begin
   DM1.SelezionaCantiereImpianto(DM1.TableContattiPratica3,
                        DM1.TableContattiDataPratica3,
                        nil,
                        nil,
                        DM1.TableContattiCliente.Value);
end;

procedure TContattiForm.DBEditStatoDocumentoChange(Sender: TObject);
begin
   DBEditStatoDocumento.Font.Color := DM1.StrToColor(DM1.TableContattiStatoForeground.Value, clBlack);
   DBEditStatoDocumento.Color      := DM1.StrToColor(DM1.TableContattiStatoBackground.Value, clSilver);
end;

procedure TContattiForm.BitBtnSelezioneStatoClick(Sender: TObject);
begin
   // Richiama la selezione dello stato del documento
//   DM1.SelezionaStato('Contatti', DM1.TableContatti);
//   DBEditStatoDocumento.Font.Color := DM1.StrToColor(DM1.TableContattiStatoForeground.Value, clBlack);
//   DBEditStatoDocumento.Color      := DM1.StrToColor(DM1.TableContattiStatoBackground.Value, clSilver);
end;

procedure TContattiForm.BitBtnClienteClick(Sender: TObject);
begin
   DM1.SelezionaCliente(DM1.TableContattiCliente, DM1.TableContattiPratica, DM1.TableContattiDataPratica1, '');
end;

procedure TContattiForm.DBEdit5Enter(Sender: TObject);
begin
   if Sender is TDBComboBox then begin
      if (Sender as TDBComboBox).Color = clWhite then (Sender as TDBComboBox).Color := clYellow;
   end else if Sender is TDBEdit then begin
      if (Sender as TDBEdit).Color = clWhite then (Sender as TDBEdit).Color := clYellow;
   end else if Sender is TDBLookupComboBox then begin
      if (Sender as TDBLookupComboBox).Color = clWhite then (Sender as TDBLookupComboBox).Color := clYellow;
   end else if Sender is TDBCheckBox then begin
      if (Sender as TDBCheckBox).Color = clWhite then (Sender as TDBCheckBox).Color := clYellow;
   end else if Sender is TDBMemo then begin
      if (Sender as TDBMemo).Color = clWhite then (Sender as TDBMemo).Color := clYellow;
   end else if Sender is TDBRadioGroup then begin
      if (Sender as TDBRadioGroup).Color = clWhite then (Sender as TDBRadioGroup).Color := clYellow;
   end;
end;

procedure TContattiForm.DBEdit5Exit(Sender: TObject);
begin
   if Sender is TDBComboBox then begin
      if (Sender as TDBComboBox).Color = clYellow then (Sender as TDBComboBox).ParentColor := True;
   end else if Sender is TDBEdit then begin
      if (Sender as TDBEdit).Color = clYellow then (Sender as TDBEdit).ParentColor := True;
   end else if Sender is TDBLookupComboBox then begin
      if (Sender as TDBLookupComboBox).Color = clYellow then (Sender as TDBLookupComboBox).ParentColor := True;
   end else if Sender is TDBCheckBox then begin
      if (Sender as TDBCheckBox).Color = clYellow then (Sender as TDBCheckBox).ParentColor := True;
   end else if Sender is TDBMemo then begin
      if (Sender as TDBMemo).Color = clYellow then (Sender as TDBMemo).ParentColor := True;
   end else if Sender is TDBRadioGroup then begin
      if (Sender as TDBRadioGroup).Color = clYellow then (Sender as TDBRadioGroup).Color := clSilver;
   end;
end;

procedure TContattiForm.DBComboBoxMezzoDropDown(Sender: TObject);
var
   LO:TMemIniFile;
   Contatore:Integer;
begin
   DBComboBoxMezzo.Items.Clear;
   // Carica la lista delle voci disponibili dal file layouts.ini
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
   LO.ReadSectionValues('CONTATTI_MEZZI', DBComboBoxMezzo.Items);
   LO.Free;

   // Elimina i primo 2 caratteri dalle voci in modo da eliminare "1=" ecc.
   for Contatore := 0 to DBComboBoxMezzo.Items.Count - 1 do begin
      DBComboBoxMezzo.Items[Contatore] := DM1.StrRight(DBComboBoxMezzo.Items[Contatore], Length(DBComboBoxMezzo.Items[Contatore]) - 2);  
   end;
end;

procedure TContattiForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('CONTATTI');
end;

end.
