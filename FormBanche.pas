unit FormBanche;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, StdCtrls, Mask,
  DBCtrls, Db, IBODataset, IB_Components, bmpPanel, Buttons;

type
  TBancheForm = class(TForm)
    ClientArea: TPanel;
    QryBanche: TIBOQuery;
    DataSourceBanche: TDataSource;
    QryBancheABI: TStringField;
    QryBancheCAB: TStringField;
    QryBancheBANCA: TStringField;
    QryBancheDESCBREVE: TStringField;
    QryBancheMIABANCA: TStringField;
    QryBancheSINCHRO: TStringField;
    ClientTopPanel: TbmpPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    RichEdit2: TRichEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    QryBancheBANCACODSIA: TStringField;
    QryBancheBANCANOMESUPPORTO: TStringField;
    QryBancheBANCACC: TStringField;
    QryBancheBANCACIN: TStringField;
    Label24: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    DBECodiceSia: TDBEdit;
    DBNumCC: TDBEdit;
    DBENomeSupporto: TDBEdit;
    Label2: TLabel;
    DBECodCIN: TDBEdit;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    QryBancheBANCABIC: TStringField;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    QryBancheBANCAIBAN: TStringField;
    Label7: TLabel;
    DBIBAN: TDBEdit;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    Label9: TLabel;
    RichEdit3: TRichEdit;
    DBEdit6: TDBEdit;
    QryBancheEXPORT_CONTO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Abi,Cab: String;
  end;

var
  BancheForm: TBancheForm;

implementation

uses DataModule1, main, FormHelp;

{$R *.DFM}

procedure TBancheForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(BancheForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Anagrafica banca)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TBancheForm.FormShow(Sender: TObject);
begin
      DM1.FocusRefresh;
      // In base al valore di 'Tag' apre la form in diverse modalità...
      case Tag of
         // Mode = 1: Apre le tabelle necessarie, si posiziona sul record giusto, visualizza la form.
         1: begin
            // IMposta la query per richiamare il record da modificare
            QryBanche.Close;
            QryBanche.SQL.Clear;
            QryBanche.SQL.Add('SELECT BANCA,ABI,CAB,DESCBREVE,MIABANCA,SINCHRO,BANCACODSIA,BANCANOMESUPPORTO,BANCACC,BANCACIN,BANCABIC,BANCAIBAN,EXPORT_CONTO FROM BANCHE WHERE ABI = ''' + Abi + ''' AND CAB = ''' + Cab + '''');
            QryBanche.Open;
            // Se trova il record procede, altrimenti visualizza un errore ed esce dalla form
            if QryBanche.Eof then begin
               MessageDlg('Banca non trovata!', mtError, [mbOK], 0);
               BancheForm.Close;
               Exit;
            end;
         end;
         // Mode = 2: Apre le tabelle necessarie, crea un nuovo record, visualizza la form in modalità MODIFICA
         2: begin
            // Se non è aperta, apre la query vuota in modo da poter inserire un nuovo record
            if not QryBanche.Active then begin QryBanche.SQL.Clear; QryBanche.SQL.Add('SELECT BANCA,ABI,CAB,DESCBREVE,MIABANCA,SINCHRO,BANCACODSIA,BANCANOMESUPPORTO,BANCACC,BANCACIN,BANCABIC,BANCAIBAN,EXPORT_CONTO FROM BANCHE WHERE ABI = ''ZXZXZXZX'''); QryBanche.Open; end;
            // Agiungle il nuovo record
            QryBanche.Append;
            // Default
            QryBancheMIABANCA.Value := 'F';
            //  Pone la form direttamente in modalità di modifica
            RxSpeedModifica.Down := True;
            RxSpeedModificaClick(Self);
         end;
      end;
end;

procedure TBancheForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     Close;
end;

procedure TBancheForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryBanche.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          DM1.ColoraTuttiCampi(BancheForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          DBEdit4.SetFocus;
          DBEdit2.SetFocus;
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
          QryBanche.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice articolo è nullo...
               if (QryBancheABI.IsNull)or(Trim(QryBancheABI.Value) = '') or (QryBancheCAB.IsNull) or (Trim(QryBancheCAB.Value) = '') then begin
                  DM1.Messaggi('Errore', 'I codici ABI e CAB sono obbligatori.', '', [mbOK], 0, nil);
                  RxSpeedModifica.Down := True;
                  Exit;
               end;
               // Marca il record come modificato
               QryBancheSINCHRO.Value := RECORD_MODIFIED;
               QryBanche.Post;
               QryBanche.ApplyUpdates;
               QryBanche.CommitUpdates;
          end else if MR = mrNo then begin
             if QryBanche.State = dsInsert then begin
                QryBanche.Cancel;
                QryBanche.CommitUpdates;
                Close;
                Exit;
             end else begin
                QryBanche.Cancel;
                QryBanche.CommitUpdates;
             end;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;
          // Sincronizza i controlli a video con la situazione reali degli archivi
          RxSpeedButtonUscita.Enabled        := True;
          DM1.ColoraTuttiCampi(BancheForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          DBEdit4.SetFocus;
          DBEdit2.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryBanche.Edit;
          end;
       end;
     end;
end;

procedure TBancheForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TBancheForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;
end;

procedure TBancheForm.DBEdit1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TBancheForm.DBEdit1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TBancheForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('BANCHE');
end;

end.
