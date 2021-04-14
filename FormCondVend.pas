unit FormCondVend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask,
  Buttons, IB_Components, IBODataset, Db, bmpPanel, MAURI_SB;

type
  TCondVendForm = class(TForm)
    ClientArea: TPanel;
    QryCondVend: TIBOQuery;
    SourceCondVend: TDataSource;
    QryCondVendCODICESOGGETTO: TIntegerField;
    QryCondVendCODICEARTICOLO: TStringField;
    QryCondVendCODICEGRUPPO1: TIntegerField;
    QryCondVendCODICEGRUPPO2: TIntegerField;
    QryCondVendCODICEGRUPPO3: TIntegerField;
    QryCondVendDAQTA1: TIBOFloatField;
    QryCondVendSCONTO1: TIBOFloatField;
    QryCondVendIMPORTO1: TIBOFloatField;
    QryCondVendDAQTA2: TIBOFloatField;
    QryCondVendSCONTO2: TIBOFloatField;
    QryCondVendIMPORTO2: TIBOFloatField;
    QryCondVendDAQTA3: TIBOFloatField;
    QryCondVendSCONTO3: TIBOFloatField;
    QryCondVendIMPORTO3: TIBOFloatField;
    QryCondVendTIPO: TStringField;
    QryCondVendSINCHRO: TStringField;
    ClientTopPanel: TbmpPanel;
    PanelGruppi: TPanel;
    Label9: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label10: TLabel;
    BitBtnGruppo1: TSpeedButtonRollOver;
    BitBtnGruppo2: TSpeedButtonRollOver;
    BitBtnGruppo3: TSpeedButtonRollOver;
    CodiceGruppo1: TDBEdit;
    DescGruppo1: TEdit;
    CodiceGruppo2: TDBEdit;
    CodiceGruppo3: TDBEdit;
    DescGruppo3: TEdit;
    DescGruppo2: TEdit;
    PanelRiferimenti: TPanel;
    Label43: TLabel;
    Label15: TLabel;
    DBText1: TDBText;
    BitBtnCliente: TSpeedButtonRollOver;
    BitBtnEspandiCliente: TSpeedButtonRollOver;
    DBERagSocCli: TEdit;
    PanelCondizioni: TPanel;
    Label11: TLabel;
    Label23: TLabel;
    Label16: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label25: TLabel;
    Label17: TLabel;
    Qta1: TDBEdit;
    Qta2: TDBEdit;
    Qta3: TDBEdit;
    Sconto1: TDBEdit;
    Sconto2: TDBEdit;
    Sconto3: TDBEdit;
    Prezzo1: TDBEdit;
    Prezzo2: TDBEdit;
    Prezzo3: TDBEdit;
    PanelArticolo: TPanel;
    Label3: TLabel;
    CodiceArticolo: TDBEdit;
    BitBtnCodiceArticolo: TSpeedButtonRollOver;
    DescrizioneArticolo: TEdit;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    function  CaricaCondVend(TmpTipoCondizione:String; TmpCodiceSoggetto:Longint; TmpCodiceArticolo:String; TmpCodiceGruppo1,TmpCodiceGruppo2,TmpCodiceGruppo3:Longint): Boolean;
    procedure CheckButtonsGruppi;
    procedure BitBtnClienteClick(Sender: TObject);
    procedure QryCondVendBeforePost(DataSet: TDataSet);
    procedure BitBtnGruppo1Click(Sender: TObject);
    procedure BitBtnGruppo2Click(Sender: TObject);
    procedure BitBtnGruppo3Click(Sender: TObject);
    procedure BitBtnEspandiClienteClick(Sender: TObject);
    procedure SpeedButtonRollOver1Click(Sender: TObject);
    procedure BitBtnCodiceArticoloClick(Sender: TObject);
    procedure CodiceArticoloEnter(Sender: TObject);
    procedure CodiceArticoloExit(Sender: TObject);
    procedure QryCondVendCODICEGRUPPO1Change(Sender: TField);
    procedure QryCondVendCODICEGRUPPO2Change(Sender: TField);
    procedure QryCondVendCODICEGRUPPO3Change(Sender: TField);
    procedure QryCondVendCODICESOGGETTOChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    LocCodiceSoggetto, LocCodiceGruppo1, LocCodiceGruppo2, LocCodiceGruppo3: Longint;
    LocCodiceArticolo, LocTipoCondizione: String;
  end;

var
  CondVendForm: TCondVendForm;

implementation

uses DataModule1, FormGruppi, main, SchedaArticoli1, FormHelp;

{$R *.DFM}

procedure TCondVendForm.CheckButtonsGruppi;
begin
   // Il pulsante del 1° livello deve essere sempre abilitato (ovviamente se si è in modalità di modifica)
   BitBtnGruppo1.Enabled        := RxSpeedModifica.Down;
   if BitBtnGruppo1.Enabled then CodiceGruppo1.Color := COLOR_MODIFICA else CodiceGruppo1.Color := COLOR_NORMALE;
   // Il pulsante del 2° livello deve essere abilitato se il livello precedente è stato assegnato (non è nullo)
   BitBtnGruppo2.Enabled := RxSpeedModifica.Down and ((not QryCondVendCodiceGruppo1.IsNull)or(QryCondVendCodiceGruppo1.AsInteger > 0));
   if BitBtnGruppo2.Enabled then CodiceGruppo2.Color := COLOR_MODIFICA else CodiceGruppo2.Color := COLOR_NORMALE;
   // Il pulsante del 3° livello deve essere abilitato se il livello precedente è stato assegnato (non è nullo)
   BitBtnGruppo3.Enabled := RxSpeedModifica.Down and ((not QryCondVendCodiceGruppo2.IsNull)or(QryCondVendCodiceGruppo2.AsInteger > 0));
   if BitBtnGruppo3.Enabled then CodiceGruppo3.Color := COLOR_MODIFICA else CodiceGruppo3.Color := COLOR_NORMALE;
end;


function TCondVendForm.CaricaCondVend(TmpTipoCondizione:String; TmpCodiceSoggetto:Longint; TmpCodiceArticolo:String; TmpCodiceGruppo1,TmpCodiceGruppo2,TmpCodiceGruppo3:Longint): Boolean;
begin
   QryCondVend.Close;
   QryCondVend.SQL.Clear;
   QryCondVend.SQL.Add('SELECT * FROM CONDVEND WHERE');
   QryCondVend.SQL.Add('    Tipo           = ''' + TmpTipoCondizione + '''');
   QryCondVend.SQL.Add('AND CodiceSoggetto = ' + IntToStr(TmpCodiceSoggetto));
   QryCondVend.SQL.Add('AND CodiceArticolo = ''' + TmpCodiceArticolo + '''');
   QryCondVend.SQL.Add('AND CodiceGruppo1  = ' + IntToStr(TmpCodiceGruppo1));
   QryCondVend.SQL.Add('AND CodiceGruppo2  = ' + IntToStr(TmpCodiceGruppo2));
   QryCondVend.SQL.Add('AND CodiceGruppo3  = ' + IntToStr(TmpCodiceGruppo3));
   QryCondVend.Open;
   // Controlla di aver trovato il documento, altrimenti ritorna False
   Result := not QryCondVend.Eof;
end;


procedure TCondVendForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   // Se aperta chiude la query del documento
   QryCondVend.Close;

   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
//   MainForm.RipristinaIconaDocTipo;   PER IL MOMENTO NON C'è UN ICONA SPECIFICA

end;

procedure TCondVendForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Condizioni di vendita)';
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(CondVendForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;
   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
//   MainForm.SalvaIconaDocTipo;
//   MainForm.CaricaIconaDocTipo(DT_DOCUMENTO);
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TCondVendForm.FormKeyUp(Sender: TObject; var Key: Word;
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

      // F3 = Nuovo
      114: begin
         if RxSpeedButtonNuovo.Enabled then begin
            RxSpeedButtonNuovoClick(Self);
         end;
      end;

   end;
end;

procedure TCondVendForm.FormShow(Sender: TObject);
begin
   DM1.FocusRefresh;
   // In base al valore di 'Tag' apre la form in diverse modalità...
   case Tag of
      // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
      1: begin
         if not CaricaCondVend(LocTipoCondizione,LocCodiceSoggetto,LocCodiceArticolo,LocCodiceGruppo1,LocCodiceGruppo2,LocCodiceGruppo3) then begin
            // Se il documento invece non viene trovato, visualizza un messaggio di errore e chiude tutto
            MessageDlg('Documento non trovato !', mtError, [mbOK], 0);
            Close;
            Exit;
         end;
      end;
      // Mode = 2: Nuova condizione di vendita per gruppo
      2..5: begin
         // Cerca una condizione di vendita impossobile da trovare in modo che la query sia vuota
         CaricaCondVend('-9999',-9999,'-9999',-9999,-9999,-9999);
         // Crea la nuova condizione
         RxSpeedButtonNuovoClick(Self);
      end;
   end;
   // Carica i dati del cliente
   if not QryCondVendCODICESOGGETTO.IsNull then DM1.CaricaRagSocCli(QryCondVendCODICESOGGETTO.Value, DBERagSocCli);
   // Carica la descrizione dell'articolo
   DM1.CodArticoloToDescrizione(QryCondVendCODICEARTICOLO.AsString, DescrizioneArticolo);
   // Carica le descrizioni degli eventuali Gruppi
   if QryCondVendCODICEGRUPPO1.AsInteger <> -1 then DM1.CodGruppoToDescrizione(QryCondVendCODICEGRUPPO1.AsString, '-1', '-1', '-1', '-1', '-1', DescGruppo1);
   if QryCondVendCODICEGRUPPO2.AsInteger <> -1 then DM1.CodGruppoToDescrizione(QryCondVendCODICEGRUPPO1.AsString, QryCondVendCODICEGRUPPO2.AsString, '-1', '-1', '-1', '-1', DescGruppo2);
   if QryCondVendCODICEGRUPPO3.AsInteger <> -1 then DM1.CodGruppoToDescrizione(QryCondVendCODICEGRUPPO1.AsString, QryCondVendCODICEGRUPPO2.AsString, QryCondVendCODICEGRUPPO3.AsString, '-1', '-1', '-1', DescGruppo3);
   // Se i codice articolo e gruppi sono nulli li rende invisibili
   QryCondVendCODICEGRUPPO1Change(QryCondVendCODICEGRUPPO1);
   QryCondVendCODICEGRUPPO2Change(QryCondVendCODICEGRUPPO2);
   QryCondVendCODICEGRUPPO3Change(QryCondVendCODICEGRUPPO3);
   // Se si tratta di una nuova condizione per gruppo (Tag = 3 o 5) oppure se è una condizione già
   //  esistente e il codice articolo non è specificato, si assume la condizione come per gruppo
   //  e quindi rende invisibile il pannello del'articolo e la possibilità di inserire un prezzo netto
   if (Tag = 2) or (Tag = 4) or ((QryCondVendCODICEARTICOLO.AsString = '-1')and(Tag = 1)) then begin
      PanelArticolo.Visible := False;
      Prezzo1.Enabled := False;
      Prezzo2.Enabled := False;
      Prezzo3.Enabled := False;
      Prezzo1.Tag     := -1;
      Prezzo2.Tag     := -1;
      Prezzo3.Tag     := -1;
   // Se invece si tratta di una condizione per articolo rende invisibile il gruppo dei gruppi
   end else begin
      PanelGruppi.Visible := False;
   end;
   // In base ai permessi abilita o disabilita i pulsanti modifica/nuovo
   if DM1.ModCtrl(MOD_CONDIZIONI_VENDITA) > 1 then begin
      RxSpeedModifica.Enabled := True;
      RxSpeedButtonNuovo.Enabled := True;
   end else begin
      RxSpeedModifica.Enabled := False;
      RxSpeedButtonNuovo.Enabled := False;
   end;
end;

procedure TCondVendForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   Close;
end;

procedure TCondVendForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('');
end;

procedure TCondVendForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     if RxSpeedModifica.Down then begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryCondVend.Edit;
          RxSpeedButtonNuovo.Enabled         := False;
          RxSpeedButtonElimina.Enabled       := False;
          RxSpeedButtonUscita.Enabled        := False;
          BitBtnCliente.Enabled              := True;
          BitBtnCodiceArticolo.Enabled       := True;
          DM1.ColoraTuttiCampi(CondVendForm, COLOR_MODIFICA);
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end else begin
        // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Disabilita la modifica dei campi
          QryCondVend.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               QryCondVend.Post;
          end else if MR = mrNo then begin
             if QryCOndVend.State = dsInsert then begin
                QryCondVend.Cancel;
                Close;
                Exit;
             end else begin
                QryCondVend.Cancel;
             end;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;
          RxSpeedButtonNuovo.Enabled         := True;
          RxSpeedButtonElimina.Enabled       := True;
          RxSpeedButtonUscita.Enabled        := True;
          BitBtnCliente.Enabled              := False;
          BitBtnCodiceArticolo.Enabled       := False;
          DM1.ColoraTuttiCampi(CondVendForm, COLOR_NORMALE);
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryCondVend.Edit;
          end;
       end;
     end;
     // Abilita i pulsanti di selezione correttiin base alla situazione
     CheckButtonsGruppi;
end;

procedure TCondVendForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // NUova condizione
   QryCondVend.Append;
   // Valori di default
   QryCondVendTipo.Value           := LocTipoCondizione;     
   QryCondVendCodiceSoggetto.Value := LocCodiceSoggetto;
   QryCondVendCodiceArticolo.Value := '-1';
   QryCondVendCodiceGruppo1.Value  := -1;
   QryCondVendCodiceGruppo2.Value  := -1;
   QryCondVendCodiceGruppo3.Value  := -1;
   QryCondVendDaQta1.Value         := 0;

   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TCondVendForm.BitBtnClienteClick(Sender: TObject);
begin
   DM1.SelezionaCliente(QryCondVendCodiceSoggetto, nil, nil, '');
end;

procedure TCondVendForm.QryCondVendBeforePost(DataSet: TDataSet);
begin
   // Marca il record come modificato
   DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
end;

procedure TCondVendForm.BitBtnGruppo1Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 997;   // Abilita la selezione
      GruppiForm.LivelloAttivo := 1;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TCondVendForm.BitBtnGruppo2Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 997;   // Abilita la selezione
      GruppiForm.Selezionato1  := CodiceGruppo1.Field.AsInteger;
      GruppiForm.LivelloAttivo := 2;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TCondVendForm.BitBtnGruppo3Click(Sender: TObject);
begin
      DM1.Attendere;

      // Visualizza la form che permette di selezionare il magazzino da inserire nel documento
      Application.CreateForm(TGruppiForm, GruppiForm);
      GruppiForm.Parent := MainForm;
      GruppiForm.Tag := 997;   // Abilita la selezione
      GruppiForm.Selezionato1  := CodiceGruppo1.Field.AsInteger;
      GruppiForm.Selezionato2  := CodiceGruppo2.Field.AsInteger;
      GruppiForm.LivelloAttivo := 3;
      GruppiForm.Show;

      DM1.ChiudiAttendere;
end;

procedure TCondVendForm.BitBtnEspandiClienteClick(Sender: TObject);
begin
   DM1.VisualizzaCliente(QryCondVendCodiceSoggetto.Value);
end;

procedure TCondVendForm.SpeedButtonRollOver1Click(Sender: TObject);
begin
   DM1.SelezionaCliente(QryCondVendCodiceSoggetto, nil, nil, '');
end;

procedure TCondVendForm.BitBtnCodiceArticoloClick(Sender: TObject);
begin
   DM1.Attendere;

   // Visualizza la form che permette di selezionare l'articolo da inserire
   //  nel documento.
   Application.CreateForm(TArticoliForm, ArticoliForm);
   ArticoliForm.Parent := MainForm;
   ArticoliForm.Tag := 996;       // Abilita la selezione dell'articolo
   ArticoliForm.Show;

   DM1.ChiudiAttendere;
end;

procedure TCondVendForm.CodiceArticoloEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TCondVendForm.CodiceArticoloExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TCondVendForm.QryCondVendCODICEGRUPPO1Change(Sender: TField);
begin
   if QryCondVendCODICEGRUPPO1.AsInteger = -1 then begin
      CodiceGruppo1.Font.Color := CodiceGruppo1.Color;
   end else begin
      CodiceGruppo1.Font.Color := clBlack;
   end;
end;

procedure TCondVendForm.QryCondVendCODICEGRUPPO2Change(Sender: TField);
begin
   if QryCondVendCODICEGRUPPO2.AsInteger = -1 then begin
      CodiceGruppo2.Font.Color := CodiceGruppo2.Color;
   end else begin
      CodiceGruppo2.Font.Color := clBlack;
   end;
end;

procedure TCondVendForm.QryCondVendCODICEGRUPPO3Change(Sender: TField);
begin
   if QryCondVendCODICEGRUPPO3.AsInteger = -1 then begin
      CodiceGruppo3.Font.Color := CodiceGruppo3.Color;
   end else begin
      CodiceGruppo3.Font.Color := clBlack;
   end;
end;

procedure TCondVendForm.QryCondVendCODICESOGGETTOChange(Sender: TField);
begin
   // Carica la descrizione pagamento
   if not QryCondVendCODICESOGGETTO.IsNull then DM1.CaricaRagSocCli(QryCondVendCODICESOGGETTO.Value, DBERagSocCli);
end;

end.
