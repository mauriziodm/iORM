unit FormPagamRisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IB_Components, IBODataset, Db, bmpPanel, StdCtrls,
  ComCtrls, DBCtrls, ExtCtrls, Mask, Buttons, MAURI_SB,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxCurrencyEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxCore, cxDateUtils;

const
  MODE_NORMALE = 0;
  MODE_CUMULATIVO_RIBA = 1;

type
  TPagamRiscForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    ClientArea: TPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    LabelCassa: TLabel;
    LabelFuoriCassa: TLabel;
    LabelAbbuono: TLabel;
    Label21: TLabel;
    ShapeSaldo: TShape;
    LabelSaldo: TLabel;
    REPanel2: TRichEdit;
    PanelRicevutaBancaria: TPanel;
    PanelBanca1: TPanel;
    CBBanca1: TComboBox;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    RichEdit3: TRichEdit;
    ENoteCassa: TEdit;
    PanelPagamentoRiscossione: TPanel;
    BitBtnConfermaPagamento: TSpeedButton;
    Panel11: TPanel;
    Annulla: TSpeedButton;
    Panel1: TPanel;
    LabelImportoDaRiscuotere: TLabel;
    PanelStartPagCumulativo: TPanel;
    BitBtnPagCumulativo: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    CEImportoDaRiscuotere: TcxCurrencyEdit;
    CECassa: TcxCurrencyEdit;
    CEFuori1: TcxCurrencyEdit;
    CEAbbuono: TcxCurrencyEdit;
    CESaldo: TcxCurrencyEdit;
    DEData: TcxDateEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnConfermaPagamentoClick(Sender: TObject);
    procedure AnnullaClick(Sender: TObject);
    procedure CBBanca1DropDown(Sender: TObject);
    procedure DEDataKeyPress(Sender: TObject; var Key: Char);
    procedure ENoteCassaEnter(Sender: TObject);
    procedure ENoteCassaExit(Sender: TObject);
    procedure BitBtnPagCumulativoClick(Sender: TObject);
    procedure CECassaKeyPress(Sender: TObject; var Key: Char);
    procedure CECassaPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FRelativoFattAcqui: Boolean;
  public
    { Public declarations }
     // Queste contengono i riferimenti al record da visualizzare/editare
     CodiceScadenza,RifNumDoc,Cliente,Pratica:Longint;
     RifTipoDoc,RifRegDoc,CodiceCliente,TipoScadenza,RagSocCli,EntUsc,PagRisc,Agente,Agente2,Agente3,Agente4:String;
     RifDataDoc, DataScadenza, DataPratica:TDate;
     Importo:Double;
     Mode: Integer;
  end;

var
  PagamRiscForm: TPagamRiscForm;

implementation

uses main, DataModule1, SchedaClienti, Variants, cxGridCustomTableView;

{$R *.DFM}

procedure TPagamRiscForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
//   MainForm.RipristinaIconaDocTipo;   PER IL MOMENTO NON C'è UN ICONA SPECIFICA

end;

procedure TPagamRiscForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(PagamRiscForm, COLOR_MODIFICA);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Pagamento / Riscossione)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;
   PanelGruppo3.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo3.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo3.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo(Self.Name);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TPagamRiscForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

   end;
end;

procedure TPagamRiscForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   Close;
end;

procedure TPagamRiscForm.FormShow(Sender: TObject);
var
   Qry:TIB_Cursor;
   i: Integer;
   TmpDaRiscuotere: Double;
begin
   DM1.FocusRefresh;

   // IMposta per default la data odierna nelle date per la generazione della primanota
   DEData.Text   := DateToStr(Date);

   // Se si è in modalità normale (MODE_NORMALE)...
   if Mode = MODE_NORMALE then begin

     // Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
     Qry := TIB_Cursor.Create(Self);
     Qry.DatabaseName := DM1.ArcDBFile;
     Qry.IB_Connection := DM1.DBAzienda;
     Qry.SQL.Add('SELECT C.RAGIONESOCIALE, S.TIPODOC, S.NUMDOC, S.REGISTRO, S.DATADOC, CAST((S.IMPORTO-S.IMPORTOPAGATO+S.SPESEPROTESTO) AS NUMERIC(15,4)) AS IMPORTO, S.CLIENTE, S.PRATICA, S.DATAPRATICA1, S.AGENTE, S.AGENTE2, S.AGENTE3, S.AGENTE4');
     Qry.SQL.Add('FROM SCADENZ S');
     Qry.SQL.Add('LEFT JOIN CLIENTI C ON S.CLIENTE = C.CODICE');
     Qry.SQL.Add('WHERE S.TIPO = ''' + TipoScadenza + ''' AND S.CODICE = ' + IntToStr(CodiceScadenza) + ' AND S.DATASCADENZA = ''' + FormatDateTime('mm/dd/yyyy', DataScadenza) + '''');
     Qry.Open;
     // Se trova il record procede, altrimenti visualizza un errore ed esce dalla form
     if Qry.Eof then begin
        MessageDlg('Scadenza non trovata!', mtError, [mbOK], 0);
        PagamRiscForm.Close;
        Exit;
     end;
     // Carica i valori del riferimento al documento in alcune variabili
     RifTipoDoc := Qry.FieldByName('TIPODOC').AsString;
     RifNumDoc  := Qry.FieldByName('NUMDOC').AsInteger;
     RifRegDoc  := Qry.FieldByName('REGISTRO').AsString;
     RifDataDoc := Qry.FieldByName('DATADOC').AsDate;
     RagSocCli  := Qry.FieldByName('RAGIONESOCIALE').AsString;
     Importo    := Qry.FieldByName('IMPORTO').Value;
     Cliente    := Qry.FieldByName('CLIENTE').AsInteger;
     Pratica    := Qry.FieldByName('PRATICA').AsInteger;
     DataPratica:= Qry.FieldByName('DATAPRATICA1').AsDate;
     Agente     := Qry.FieldByName('AGENTE').AsString;
     Agente2    := Qry.FieldByName('AGENTE2').AsString;
     Agente3    := Qry.FieldByName('AGENTE3').AsString;
     Agente4    := Qry.FieldByName('AGENTE4').AsString;
     // Aggiorna il valore del del debito residuo nel pagamento/riscossione e l'importo da versare/riscuotere
     CEImportoDaRiscuotere.Value  := Importo;
     CESaldo.Value                := Importo;
     // Carica il flag che indica se la scadenza era relativa a una fattura di acquisto
     FRelativoFattAcqui := (Qry.FieldByName('TIPODOC').AsString = 'Fatt.acqui');
     // Chiude la query
     Qry.Close;
     Qry.Free;

     // Adatta la form alla situazione
     PanelStartPagCumulativo.Visible := False;

     // In base al tipo di scadenze imposta una variabile temporanea che indica se gli importi
     //  da inserire in primanota sono in entrata opure in uscita.
     if TipoScadenza = 'Scad.attiv' then begin
        EntUsc  := 'Entrate';
        PagRisc := 'Risc. ';
        RichEdit1.Lines.Clear;
        RichEdit1.Lines.Add('Effettuata in data                           la riscossione della ' + RifTipoDoc + ' N° ' + IntToStr(RifNumDoc) + RifRegDoc);
        RichEdit1.Lines.Add('');
        RichEdit1.Lines.Add('del ' + DateToStr(RifDataDoc) + ' della ditta ' + RagSocCli);
        LabelImportoDaRiscuotere.Caption  := 'Importo da riscuotere';
        LabelCassa.Caption                := 'Importo ricevuto per CASSA';
        LabelFuoriCassa.Caption           := 'Importo ricevuto FUORI CASSA';
        LabelAbbuono.Caption              := 'Eventuale ABBUONO PASSIVO';
     end else begin
        EntUsc := 'Uscite';
        PagRisc := 'Pag. ';
        RichEdit1.Lines.Clear;
        RichEdit1.Lines.Add('Effettuato in data                           il pagamento della ' + RifTipoDoc + ' N° ' + IntToStr(RifNumDoc) + RifRegDoc);
        RichEdit1.Lines.Add('');
        RichEdit1.Lines.Add('del ' + DateToStr(RifDataDoc) + ' della ditta ' + RagSocCli);
        LabelImportoDaRiscuotere.Caption  := 'Importo da pagare';
        LabelCassa.Caption                := 'Importo pagato per CASSA';
        LabelFuoriCassa.Caption           := 'Importo pagato FUORI CASSA';
        LabelAbbuono.Caption              := 'Eventuale ABBUONO ATTIVO';
     end;
     // DECassa contiene la data odierna per default
     DEData.EditText := DateToStr(Now);
     // Sposta il focus sul primo campo editabile
     DEData.SetFocus;

   // Se invece si è in modalità di pagamento cumulativo di tutte le RIBA selezionate (MODE_CUMULATIVO_RIBA)
   end else if Mode = MODE_CUMULATIVO_RIBA then begin

     // Adatta la form alla situazione
     PanelPagamentoRiscossione.Visible := False;
     PanelStartPagCumulativo.Top := PanelPagamentoRiscossione.Top;
     PanelStartPagCumulativo.Left := PanelPagamentoRiscossione.Left;
     PanelStartPagCumulativo.Visible := True;

     // Imposta la visualizzazione delle form opportunamente
     RichEdit1.Lines.Clear;
     RichEdit1.Lines.Add('Effettuata in data                           la riscossione/pagamento delle RI.BA. selezionate');
     REPanel2.Lines.Clear;
     REPanel2.Lines.Add('Dati bancari');
     LabelImportoDaRiscuotere.Enabled  := False;
     LabelCassa.Enabled                := False;
     LabelFuoriCassa.Enabled           := False;
     LabelAbbuono.Enabled              := False;
     LabelSaldo.Enabled                := False;
     CEImportoDaRiscuotere.Enabled     := False;
     CECassa.Enabled                   := False;
     CEFuori1.Enabled                  := False;
     CEAbbuono.Enabled                 := False;
     CESaldo.Enabled                   := False;
     CECassa.ParentColor               := True;
     CEFuori1.ParentColor              := True;
     CEAbbuono.ParentColor             := True;
     CBBanca1.Enabled := True;
     CBBanca1.Color := COLOR_MODIFICA;
     ShapeSaldo.Enabled                := False;             
     // DECassa contiene la data odierna per default
     DEData.EditText := DateToStr(Now);
     // Imposta l'importo totale cumulativo da riscuotere
     TmpDaRiscuotere := 0;
     for i := 0 to ClientiForm.tvScad.Controller.SelectedRecordCount -1 do begin
       if not VarIsNull(ClientiForm.tvScad.Controller.SelectedRecords[i].Values[ClientiForm.tvScadRESIDUO.Index])
       then TmpDaRiscuotere := TmpDaRiscuotere + ClientiForm.tvScad.Controller.SelectedRecords[i].Values[ClientiForm.tvScadRESIDUO.Index];
     end;
     CEImportoDaRiscuotere.Value  := TmpDaRiscuotere;
     CEFuori1.Value               := TmpDaRiscuotere;
     CESaldo.Value                := 0;
     // Sposta il focus sul primo campo editabile
     DEData.SetFocus;

   end;
end;

procedure TPagamRiscForm.BitBtnConfermaPagamentoClick(Sender: TObject);
var
   Qry:TIBOQuery;
   ImportoPag:Double;
begin
   // Se il saldo non è 0 avvisa...
   if CESaldo.Value > 0 then begin
      MessageBeep(0);
      if MessageDlg('A T T E N Z I O N E !!!'#13#13'Il saldo è maggiore di 0 (zero).'#13#13'Continuare ugualmente?', mtWarning, [mbOk, mbNo], 0) <> mrOk then Exit;
   end;
   // Se il saldo < 0 avvisa...
   if CESaldo.Value < 0 then begin
      MessageBeep(0);
      if MessageDlg('A T T E N Z I O N E !!!'#13#13'Il saldo è negativo.'#13#13'Continuare ugualmente?', mtWarning, [mbOk, mbNo], 0) <> mrOk then Exit;
   end;
   // Se l'importo fuori cassa <> 0 e non è stata indicata la banca...
   if (CEFuori1.Value <> 0) and (Trim(CBBanca1.Text) = '') then begin
      MessageBeep(0);
      if MessageDlg('A T T E N Z I O N E !!!'#13#13'La banca non è stata inserita.'#13#13'Continuare ugualmente?', mtWarning, [mbOk, mbNo], 0) <> mrOk then Exit;
   end;
   // Chiede prima conferma (NB: Solo se è in modalità normale)
   if (Mode = MODE_NORMALE) then if (DM1.Messaggi('Pagamento/Riscossione', 'Confermi?', '', [mbOk], 0, nil) <> mrOk) then Exit;
   DM1.Attendere;
   Qry := TIBOQuery.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Se è stato specificato un valore compone la query inserendo o meno i vari campi in base ai valori inseriti
      if (CECassa.Value > 0)or(CEFuori1.Value > 0)or(CEAbbuono.Value > 0) then begin
         // ----- Inizio Query che aggiorna lo stato della scadenza
         // Totale Pagato
         ImportoPag := CECassa.Value + CEFuori1.Value + CEAbbuono.Value;
         // Il Totale pagato non può essere > dell'importo della scadenza
         if ImportoPag > Importo then ImportoPag := Importo;
         Qry.SQL.Add('UPDATE SCADENZ SET');
         Qry.SQL.Add('  IMPORTOPAGATO=IMPORTOPAGATO+' + DM1.VirgolaPunto(ImportoPag));
         Qry.SQL.Add(' ,DATAPAGAMENTO=''' + FormatDateTime('mm/dd/yyyy', StrToDate(DEData.EditText)) + '''');
         Qry.SQL.Add('WHERE TIPO = ''' + TipoScadenza + ''' AND CODICE = ' + IntToStr(CodiceScadenza) + ' AND DATASCADENZA = ''' + FormatDateTime('mm/dd/yyyy', DataScadenza) + '''');
         Qry.ExecSQL;
         // ----- Fine Query che aggiorna lo stato della scadenza
         // Se è abilitata la generazione automatica della primanota
         //  durante il pagamento/riscossione delle scadenze...
         if DM1.TableProgressiviGENERAZAUTOMATICAPRIMANOTA.AsString <> 'F' then begin
           Qry.SQL.Clear;
           // ----- Inizio Costruzione comando INSERT ----------------------------------------------------------------
           Qry.SQL.Add('INSERT INTO PRIMANOT (Codice, Data, Descrizione, Note, Agente, Agente2, Agente3, Agente4, RelativoFattAcqui');
           // Inserisce nel comando INSERT il campo Cassa se è stato inserito il relativo importo
           if CECassa.Value > 0 then begin
              Qry.SQL.Add(', Cassa' + EntUsc);
           end;
           // Inserisce nel comando INSERT il campo FuoriCassa se è stato inserito il relativo importo
           if CEFuori1.Value > 0 then begin
              Qry.SQL.Add(', DescFuori, Fuori' + EntUsc);
           end;
           // Inserisce nel comando INSERT il campo Abbuono se è stato inserito il relativo importo
           if CEAbbuono.Value > 0 then begin
              if EntUsc = 'Entrate' then EntUsc := 'Passivi' else EntUsc := 'Attivi'; // Prima converte il valore di EntUsc per puntare al campo corretto
              Qry.SQL.Add(', Abbuoni' + EntUsc);
           end;
           // Se il cliente corrente > 0 aggiorna anche questo campo
           if Cliente > 0 then Qry.SQL.Add(', CLIENTE');
           // Se la scadenza fà parte di una pratica, anche il movimento di primanota generato ne farà parte
           if Pratica > 0 then Qry.SQL.Add(', PRATICA, DATAPRATICA1');
           // INserisce la parentesi finale del comando INSERT
           Qry.SQL.Add(')');
           // ----- Fine Costruzione comando INSERT ----------------------------------------------------------------
           // ----- Inizio Costruzione corpo query ----------------------------------------------------------------
           Qry.SQL.Add('VALUES (');
           Qry.SQL.Add(IntToStr(DM1.NextCodice('PRIMANOT', 'CODICE')));
           Qry.SQL.Add(', ''' + FormatDateTime('mm/dd/yyyy', StrToDate(DEData.EditText)) + '''');
           Qry.SQL.Add(', ''' + PagRisc + RifTipoDoc + ' N.' + IntToStr(RifNumDoc) + RifRegDoc + ' del ' + DateToStr(RifDataDoc) + '''');
           Qry.SQL.Add(', ''' + ENoteCassa.Text + '''');
           Qry.SQL.Add(', ''' + Agente + '''');
           Qry.SQL.Add(', ''' + Agente2 + '''');
           Qry.SQL.Add(', ''' + Agente3 + '''');
           Qry.SQL.Add(', ''' + Agente4 + '''');
           // Inserisce il flag che indica se il movimento è relativo a una fattura di acquisto o meno
           if FRelativoFattAcqui then
             Qry.SQL.Add(',''T''')
           else
             Qry.SQL.Add(',''F''');
           // Inserisce il valore del campo CASSA se è stato specificato il valore
           if CECassa.Value > 0 then begin
              Qry.SQL.Add(', ' + DM1.VirgolaPunto(CECassa.Value));
           end;
           // Inserisce il valore del campo FUORICASSA se è stato specificato il valore
           if CEFuori1.Value > 0 then begin
              Qry.SQL.Add(', "' + CBBanca1.Text + '", ' + DM1.VirgolaPunto(CEFuori1.Value));
           end;
           // Inserisce il valore del campo CASSA se è stato specificato il valore
           if CEAbbuono.Value > 0 then begin
              Qry.SQL.Add(', ' + DM1.VirgolaPunto(CEAbbuono.Value));
           end;
           // Se il cliente corrente > 0 aggiorna anche questo campo
           if Cliente > 0 then Qry.SQL.Add(', ' + IntToStr(Cliente));
           // Se la scadenza fà parte di una pratica, anche il movimento di primanota generato ne farà parte
           if Pratica > 0 then Qry.SQL.Add(', ' + IntToStr(Pratica) + ', ''' + FormatDateTime('mm/dd/yyyy', DataPratica) + '''');
           // INserisce la parentesi finale
           Qry.SQL.Add(')');
           // ----- Fine Costruzione corpo query ----------------------------------------------------------------
           Qry.ExecSQL;
         end;
      end;
   finally
      // Distrugge la query
      Qry.Free;
      DM1.ChiudiAttendere;
      if Mode = MODE_NORMALE then begin
        Close;
      end;
   end;
end;

procedure TPagamRiscForm.AnnullaClick(Sender: TObject);
begin
   RxSpeedButtonUscitaClick(Self);
end;

procedure TPagamRiscForm.CBBanca1DropDown(Sender: TObject);
var
   Qry:TIBOQuery;
begin
   // Crea l'oggetto Query e lo imposta
   Qry := TIBOQuery.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DescBreve');
      Qry.SQL.Add('FROM Banche');
      Qry.SQL.Add('WHERE MiaBanca = ''T''');
      Qry.SQL.Add('ORDER BY DescBreve');
      Qry.Open;
      // Carica le banche trovate
      if Qry.Active then begin
         CBBanca1.Items.Clear;
         while not(Qry.Eof) do begin
            CBBanca1.Items.Add(Qry.FieldByName('DescBreve').AsString);
            Qry.Next;
         end;
      end;
   finally
      // Distrugge l'oggetto query
      Qry.Close;
      Qry.Free;
   end;
end;

procedure TPagamRiscForm.DEDataKeyPress(Sender: TObject; var Key: Char);
begin
   // Se viene premuto il pulsante INVIO preme il pulsante di conferma
   if Key = chr(13) then BitBtnConfermaPagamentoClick(Self);
end;

procedure TPagamRiscForm.ENoteCassaEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlEnter(Sender);
end;

procedure TPagamRiscForm.ENoteCassaExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlExit(Sender);
end;

procedure TPagamRiscForm.BitBtnPagCumulativoClick(Sender: TObject);
var
   i, SelRec:Longint;
begin
   // Se l'importo fuori cassa <> 0 e non è stata indicata la banca...
   if (Trim(CBBanca1.Text) = '') then begin
      DM1.Messaggi('Pagamento/Riscossione', 'La banca non è stata selezionata.', '', [mbOk], 0, nil);
      Exit;
   end;
   // Chiede prima conferma
   if DM1.Messaggi('Pagamento/Riscossione', 'Confermi di voler effettuare il pagamento/riscossione cumulativo delle scadenze selezionate?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;

   // Disabilita alcuni controlli
   DEData.ParentColor := True;
   DEData.Enabled := False;
   ENoteCassa.ParentColor := True;
   ENoteCassa.Enabled := False;

   // SelRec contiene il numeero di records selezionati
   SelRec := ClientiForm.tvScad.Controller.SelectedRecordCount;
   // Ovviamente procede solo se vi sono documenti selezionati
   if SelRec > 0 then begin
      // Cicla per tutti i documenti selezionati e li esporta
      for i := 0 to SelRec-1 do begin
         // Focus sul record attuale
         ClientiForm.tvScad.Controller.SelectedRecords[i].Focused := True;
         // Assegna il tipo, numero, data e registro del documento a delle variabili locali per comodità successiva
         TipoScadenza   := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('TIPO').Index];
         CodiceScadenza := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('CODICE').Index];
         DataScadenza   := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('DATASCADENZA').Index];
         // Carica i valori del riferimento al documento in alcune variabili
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('TIPODOC').Index])        then RifTipoDoc := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('TIPODOC').Index]        else RifTipoDoc := '';
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('NUMDOC').Index])         then RifNumDoc  := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('NUMDOC').Index]         else RifNumDoc  := 0;
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('REGISTRO').Index])       then RifRegDoc  := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('REGISTRO').Index]       else RifRegDoc  := '';
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('DATADOC').Index])        then RifDataDoc := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('DATADOC').Index];
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('RAGIONESOCIALE').Index]) then RagSocCli  := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('RAGIONESOCIALE').Index] else RagSocCli  := '';
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('IMPORTO').Index])        then Importo    := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('RESIDUO').Index]        else Importo    := 0;
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('CLIENTE').Index])        then Cliente    := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('CLIENTE').Index]        else Cliente    := 0;
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('PRATICA').Index])        then Pratica    := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('PRATICA').Index]        else Pratica    := 0;
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('DATAPRATICA1').Index])   then DataPratica:= ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('DATAPRATICA1').Index];
         if not VarIsNull(ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('AGENTE').Index])         then Agente     := ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('AGENTE').Index];
         // In base al tipo di scadenze imposta una variabile temporanea che indica se gli importi
         //  da inserire in primanota sono in entrata opure in uscita.
         if TipoScadenza = 'Scad.attiv' then begin
            EntUsc  := 'Entrate';
            PagRisc := 'Risc. ';
            RichEdit1.Lines.Clear;
            RichEdit1.Lines.Add('Effettuata in data                           la riscossione della ' + RifTipoDoc + ' N° ' + IntToStr(RifNumDoc) + RifRegDoc);
            RichEdit1.Lines.Add('');
            RichEdit1.Lines.Add('del ' + DateToStr(RifDataDoc) + ' della ditta ' + RagSocCli);
            LabelImportoDaRiscuotere.Caption  := 'Importo da riscuotere';
            LabelCassa.Caption                := 'Importo ricevuto per CASSA';
            LabelFuoriCassa.Caption           := 'Importo ricevuto FUORI CASSA';
            LabelAbbuono.Caption              := 'Eventuale ABBUONO PASSIVO';
         end else begin
            EntUsc := 'Uscite';
            PagRisc := 'Pag. ';
            RichEdit1.Lines.Clear;
            RichEdit1.Lines.Add('Effettuato in data                           il pagamento della ' + RifTipoDoc + ' N° ' + IntToStr(RifNumDoc) + RifRegDoc);
            RichEdit1.Lines.Add('');
            RichEdit1.Lines.Add('del ' + DateToStr(RifDataDoc) + ' della ditta ' + RagSocCli);
            LabelImportoDaRiscuotere.Caption  := 'Importo da pagare';
            LabelCassa.Caption                := 'Importo pagato per CASSA';
            LabelFuoriCassa.Caption           := 'Importo pagato FUORI CASSA';
            LabelAbbuono.Caption              := 'Eventuale ABBUONO ATTIVO';
         end;
         // Aggiorna il valore del del debito residuo nel pagamento/riscossione e l'importo da versare/riscuotere
         CEImportoDaRiscuotere.Value  := Importo;
         CECassa.Value                := 0;
         CEFuori1.Value               := Importo;
         CEAbbuono.Value              := 0;
         CESaldo.Value                := 0;
         // Solo se è una RIBA *** NO ADESSO E' PER TUTTE LE SCADENZE
//         if ClientiForm.tvScad.Controller.FocusedRow.Values[ClientiForm.tvScad.GetColumnByFieldName('RICEVUTABANCARIA').Index] = 'T' then begin
            BitBtnConfermaPagamentoClick(BitBtnConfermaPagamento);
            Update;
            Application.ProcessMessages;
            // Ritardo estetico per permettere di leggere i dati
            Sleep(250);
//         end;
      end;
      // Messaggio di fine lavoro
      DM1.Messaggi('Pagamento/Riscossione', 'Operazione terminata.', '', [mbOk], 0, nil);
      Close;
   end;
end;

procedure TPagamRiscForm.CECassaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = '.' then Key := ',';
   // Se viene premuto il pulsante INVIO preme il pulsante di conferma
//   if Key = chr(13) then BitBtnConfermaPagamentoClick(Self);
end;

procedure TPagamRiscForm.CECassaPropertiesChange(Sender: TObject);
begin
   // Aggiorna il saldo
   CESaldo.Value := Importo - CECassa.Value - CEFuori1.Value - CEAbbuono.Value;
   // Se c'è almeno un importo inserito abilita il  pulsante di Pagamento/Riscossione e se il saldo non è negativo
   BitBtnConfermaPagamento.Enabled := ((CECassa.Value > 0)or(CEFuori1.Value > 0)or(CEAbbuono.Value > 0));
   // Se il saldo è negativo lo visualizza in rosso e fà un beep
   if CESaldo.Value < 0 then begin
      CESaldo.Style.Font.Color := clRed;
   end else begin
      CESaldo.Style.Font.Color := clBlack;
   end;
   // Se l'importo fuori cassa > 0 abilita l'inserimento della banca altrimenti lo disabilita
   if CEFuori1.Value <> 0 then begin
      CBBanca1.Enabled := True;
      CBBanca1.Color := COLOR_MODIFICA;
   end else begin
      CBBanca1.Enabled := False;
      CBBanca1.Color := $00F7F7F7;
      if Mode = MODE_NORMALE then CBBanca1.Text := '';
   end;
end;

end.
