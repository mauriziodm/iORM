unit FormCausali;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGraphics, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxTextEdit, cxMemo, cxCurrencyEdit, cxDropDownEdit, cxCheckBox,
  cxDBLookupComboBox, cxButtonEdit, DB, cxDBData, cxGridDBTableView,
  cxGridLevel, cxGridCardView, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, IB_Components,
  IBODataset,  bmpPanel, cxLookupEdit, cxDBLookupEdit, StdCtrls,
  ExtCtrls, DBCtrls, cxDBEdit, Mask, cxContainer, cxMaskEdit, ComCtrls,
  Buttons, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, cxGridCustomLayoutView, Vcl.ImgList,
  dxDateRanges, dxScrollbarAnnotations, System.ImageList;

type
  TCausaliForm = class(TForm)
    QueryCausali: TIBOQuery;
    SourceCausali: TDataSource;
    ClientTopPanel: TbmpPanel;
    QueryCausaliDESCRIZIONE: TStringField;
    QueryCausaliSEGNOOPERAZIONE: TStringField;
    QueryCausaliDAFATTURARE: TStringField;
    QueryCausaliREADONLY: TStringField;
    QueryCausaliSINCHRO: TStringField;
    QueryCausaliREGISTRO: TStringField;
    QueryCausaliSEGNOOPERAZIONECANTIERE: TStringField;
    QueryCausaliASSEGNAAZIONEMAGAZZINO: TStringField;
    QueryCausaliASSEGNAAZIONECANTIERE: TStringField;
    QryMag: TIBOQuery;
    SourceMag: TDataSource;
    QryMagCODICE: TIntegerField;
    QryMagDESCRIZIONE: TStringField;
    QueryCausaliCODICEMAGAZZINO1: TIntegerField;
    QueryCausaliCODICEMAGAZZINO2: TIntegerField;
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
    QueryCausaliPA_TIPODOCUMENTO: TStringField;
    QueryCausaliEXPORT_CONTO: TStringField;
    ClientArea: TScrollBox;
    GridList: TcxGrid;
    tvDiBa: TcxGridTableView;
    tvDiBaMOVMAG: TcxGridColumn;
    tvDiBaCODICEMAGAZZINO: TcxGridColumn;
    tvDiBaCODICEMAGAZZINO2: TcxGridColumn;
    tvDiBaCODICEARTICOLO: TcxGridColumn;
    tvDiBaCODICEARTICOLOSTM: TcxGridColumn;
    tvDiBaDESCRIZIONE: TcxGridColumn;
    tvDiBaPREZZOUNITARIO: TcxGridColumn;
    tvDiBaPREZZOUNITARIOIVACOMPRESA: TcxGridColumn;
    tvDiBaPRZUNITNETTO: TcxGridColumn;
    tvDiBaUNITADIMISURA: TcxGridColumn;
    tvDiBaQTA: TcxGridColumn;
    tvDiBaQTAINEVASIONE: TcxGridColumn;
    tvDiBaQTAEVASA: TcxGridColumn;
    tvDiBaQTADAEVADERE: TcxGridColumn;
    tvDiBaSCONTORIGO: TcxGridColumn;
    tvDiBaSCONTORIGO2: TcxGridColumn;
    tvDiBaSCONTORIGO3: TcxGridColumn;
    tvDiBaIMPORTORIGO: TcxGridColumn;
    tvDiBaIMPORTORIGOIVACOMPRESA: TcxGridColumn;
    tvDiBaCODICEIVA: TcxGridColumn;
    tvDiBaDESCRIZIONEIVA: TcxGridColumn;
    tvDiBaALIQUOTAIVA: TcxGridColumn;
    tvDiBaNOTERIGO: TcxGridColumn;
    tvDiBaPREZZOACQUISTOARTICOLO: TcxGridColumn;
    tvDiBaMARGINE: TcxGridColumn;
    tvDiBaIMPORTOMARGINE: TcxGridColumn;
    tvDiBaPRZUNITOPERA: TcxGridColumn;
    tvDiBaQTAOPERA: TcxGridColumn;
    tvDiBaIMPORTOOPERA: TcxGridColumn;
    tvDiBaIMPORTOCOMPONENTI: TcxGridColumn;
    tvDiBaSELEZIONATO: TcxGridColumn;
    tvDiBaMINUTIPREVISTI: TcxGridColumn;
    tvDiBaSOTTOCANTIERE1: TcxGridColumn;
    tvDiBaSOTTOCANTIERE2: TcxGridColumn;
    tvDiBaSOTTOCANTIERE3: TcxGridColumn;
    tvDiBaSOTTOCANTIERE4: TcxGridColumn;
    tvDiBaSOTTOCANTIERE5: TcxGridColumn;
    tvDiBaSOTTOCANTIERE6: TcxGridColumn;
    tvDiBaS3RIF: TcxGridColumn;
    tvDiBaS3UBICAZIONE: TcxGridColumn;
    tvDiBaS3COMPONENTE: TcxGridColumn;
    tvDiBaS3MATERIALE: TcxGridColumn;
    tvDiBaS3QTA: TcxGridColumn;
    tvDiBaS3DIAMETRO: TcxGridColumn;
    tvDiBaS3LUNGHEZZA: TcxGridColumn;
    tvDiBaS3INSTALLAZIONE: TcxGridColumn;
    tvDiBaS3CERTIFICAZIONE: TcxGridColumn;
    tvDiBaS3VENTILAZIONE: TcxGridColumn;
    tvDiBaS3SCARICO: TcxGridColumn;
    tvDiBaS3TIPO: TcxGridColumn;
    tvDiBaS3MODELLO: TcxGridColumn;
    tvDiBaS3PORTATATERMICA: TcxGridColumn;
    tvDiBaS3TIPOCOLLEGAMENTO: TcxGridColumn;
    tvDiBaS3INSTALLATOINSTALLABILE: TcxGridColumn;
    tvDiBaS3MATERIALEAPPARECCHIO: TcxGridColumn;
    tvDiBaTIPO1: TcxGridColumn;
    tvDiBaTIPO2: TcxGridColumn;
    tvDiBaTIPO3: TcxGridColumn;
    tvDiBaTIPO4: TcxGridColumn;
    tvDiBaTIPO5: TcxGridColumn;
    tvDiBaTIPO6: TcxGridColumn;
    tvDiBaTODELETE: TcxGridColumn;
    tvDiBaGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvDiBaGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvDiBaGC_RICARICO_MOD: TcxGridColumn;
    tvDiBaGC_RICARICO: TcxGridColumn;
    tvDiBaGC_QTA_MOD: TcxGridColumn;
    tvDiBaGC_QTA: TcxGridColumn;
    tvDiBaGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvDiBaGC_DESCRIZIONE: TcxGridColumn;
    tvDiBaGUID: TcxGridColumn;
    tvDiBaGUID_REF: TcxGridColumn;
    tvDiBaGUID_ANCESTOR: TcxGridColumn;
    tvDiBaORDER: TcxGridColumn;
    tvDiBaIDAPPARECCHIO: TcxGridColumn;
    tvDiBaIDOPIMPEGNO: TcxGridColumn;
    cvTot: TcxGridCardView;
    cvTotCOMPONENTI: TcxGridCardViewRow;
    cvTotMARGINE: TcxGridCardViewRow;
    cvTotIMPORTOMARGINE: TcxGridCardViewRow;
    cvTotTOTALECOMPONENTI: TcxGridCardViewRow;
    cvTotPRZUNITOPERA: TcxGridCardViewRow;
    cvTotQTAOPERA: TcxGridCardViewRow;
    cvTotIMPORTOOPERA: TcxGridCardViewRow;
    cvTotTOTALE: TcxGridCardViewRow;
    tvOre: TcxGridTableView;
    tvOreCODDIPENDENTE: TcxGridColumn;
    tvOreDESCRIZDIPENDENTE: TcxGridColumn;
    tvOreQTA: TcxGridColumn;
    tvOreNOTE: TcxGridColumn;
    tvOreSOTTOCANTIERE1: TcxGridColumn;
    tvOreSOTTOCANTIERE2: TcxGridColumn;
    tvOreSOTTOCANTIERE3: TcxGridColumn;
    tvOreTIPOORE1: TcxGridColumn;
    tvOreTIPOORE2: TcxGridColumn;
    tvOreTIPOORE3: TcxGridColumn;
    tvOrePRZUNITVEND: TcxGridColumn;
    tvOreIMPORTOVEND: TcxGridColumn;
    tvOreCOSTOORARIO: TcxGridColumn;
    tvOreIMPORTOCOSTOORARIO: TcxGridColumn;
    tvOreOPERAINDEX: TcxGridColumn;
    tvOreGC_COSTONETTOUNITARIO_MOD: TcxGridColumn;
    tvOreGC_COSTONETTOUNITARIO: TcxGridColumn;
    tvOreGC_RICARICO_MOD: TcxGridColumn;
    tvOreGC_RICARICO: TcxGridColumn;
    tvOreGC_QTA_MOD: TcxGridColumn;
    tvOreGC_QTA: TcxGridColumn;
    tvOreGC_DESCRIZIONE_MOD: TcxGridColumn;
    tvOreGC_DESCRIZIONE: TcxGridColumn;
    tvOreGUID: TcxGridColumn;
    tvOreGUID_REF: TcxGridColumn;
    tvOreGUID_ANCESTOR: TcxGridColumn;
    tvList: TcxGridDBTableView;
    tvListDESCRIZIONE: TcxGridDBColumn;
    tvListDAFATTURARE: TcxGridDBColumn;
    tvListREGISTRO: TcxGridDBColumn;
    tvListASSEGNAAZIONEMAGAZZINO: TcxGridDBColumn;
    tvListSEGNOOPERAZIONE: TcxGridDBColumn;
    tvListCODICEMAGAZZINO1: TcxGridDBColumn;
    tvListCODICEMAGAZZINO2: TcxGridDBColumn;
    tvListASSEGNAAZIONECANTIERE: TcxGridDBColumn;
    tvListSEGNOOPERAZIONECANTIERE: TcxGridDBColumn;
    lvList: TcxGridLevel;
    PanelGruppo6: TPanel;
    LabelGruppo6: TLabel;
    RichEdit2: TRichEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    PanelGruppo5: TPanel;
    LabelGruppo5: TLabel;
    Panel7: TPanel;
    DBETipoMovimCantiere: TDBRadioGroup;
    cxDBCheckBox1: TcxDBCheckBox;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    cxDBCheckBox2: TcxDBCheckBox;
    Panel1: TPanel;
    DBRTipoMovim: TDBRadioGroup;
    dbeMagazzino1: TcxDBLookupComboBox;
    dbeMagazzino2: TcxDBLookupComboBox;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    RichEdit4: TRichEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    DbeRegistro: TcxDBComboBox;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    RichEdit3: TRichEdit;
    PanelFineMese: TPanel;
    Panel2: TPanel;
    DBRFatturazione: TDBRadioGroup;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    RichEdit1: TRichEdit;
    DBEditDescrizione: TDBEdit;
    PanelGruppo7: TPanel;
    LabelGruppo7: TLabel;
    Label9: TLabel;
    DBEdit6: TDBEdit;
    RichEdit5: TRichEdit;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    QueryCausaliEXPORT_SOTTOCONTO: TStringField;
    cbAttiva: TcxDBCheckBox;
    Label31: TLabel;
    QueryCausaliENABLED: TStringField;
    tvListENABLED: TcxGridDBColumn;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure EseguiQueryCausali;
    procedure DBEditDescrizioneEnter(Sender: TObject);
    procedure DBEditDescrizioneExit(Sender: TObject);
    procedure QueryCausaliBeforePost(DataSet: TDataSet);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure DbeRegistroPropertiesInitPopup(Sender: TObject);
    procedure cxDBCheckBox2PropertiesChange(Sender: TObject);
    procedure cxDBCheckBox1PropertiesChange(Sender: TObject);
    procedure tvListSEGNOOPERAZIONEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure tvListSEGNOOPERAZIONECANTIEREGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvListENABLEDGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
    procedure QueryCausaliBeforeDelete(DataSet: TDataSet);
    procedure tvListDataControllerSortingChanged(Sender: TObject);
    procedure tvListCustomDrawColumnHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
  private
    { Private declarations }
    procedure SetScrollBoxRange(const AEditMode:Boolean);
  public
    { Public declarations }
  end;

var
  CausaliForm: TCausaliForm;

implementation

uses main, DataModule1, FormHelp, SchedaPreventiviOrdini, SchedaClienti,
  FormConfirm, dxCore;

{$R *.DFM}

procedure TCausaliForm.EseguiQueryCausali;
begin
   if QueryCausali.Active then QueryCausali.Close;
   // Compone al query in base alle occasioni
   QueryCausali.SQL.Clear;
   QueryCausali.SQL.Add('SELECT * FROM CAUSALI');
   if Tag <> 0 then
     QueryCausali.SQL.Add('WHERE ENABLED = ''T''');
   // Apre la query
   QueryCausali.Open;
   tvList.DataController.GotoFirst;
end;


procedure TCausaliForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;
   
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBImpostazioni.Down := False;
   // Il puntatore alla form := nil
   CausaliForm := nil;
end;

procedure TCausaliForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(CausaliForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Causali documenti)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;
   PanelGruppo3.Color := COLOR_SUBPANEL_BG;
   PanelGruppo4.Color := COLOR_SUBPANEL_BG;
   PanelGruppo5.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo3.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo4.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo5.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo3.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo4.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo5.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TCausaliForm.FormKeyUp(Sender: TObject; var Key: Word;
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
            RxSpeedButtonNuovo.Down := not RxSpeedButtonNuovo.Down;
            RxSpeedButtonNuovoClick(Self);
         end;
      end;

      // F4 = Elimina
      115: begin
         if RxSpeedButtonElimina.Enabled then begin
            RxSpeedButtonElimina.Down := not RxSpeedButtonElimina.Down;
            RxSpeedButtonEliminaClick(Self);
         end;
      end;

   end;
end;

procedure TCausaliForm.FormShow(Sender: TObject);
begin
   // Rende visibile solo la griglia e nascosti i campi
   SetScrollBoxRange(False);
   GridList.Visible := True;
   GridList.Align := alClient;

   DM1.FocusRefresh;
   RxSpeedButtonTrovaClick(Self);
   // Se la proprietà Tag della form = 999 rende visibile la Label che avverte di fare doppioclick sulla voce desiderata
//   if (Tag > 0) then LabelSelezione.Visible := True else LabelSelezione.Visible := False;

   // Apri la query di loockup dei magazzini
   QryMag.Open; 
end;

procedure TCausaliForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
   if GridList.Visible then begin
      Close;
   end else begin
      SetScrollBoxRange(False);
      // Griglia visibile che copre il resto
      GridList.Visible                 := True;
      // Risistema i pulsanti per la fase di elenco
      RxSpeedModifica.Enabled           := False;
      RxSpeedButtonNuovo.Enabled        := True;
      RxSpeedButtonElimina.Enabled      := True;
      RxSpeedButtonVisualizza.Enabled   := True;
   end;
end;

procedure TCausaliForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('');
end;

procedure TCausaliForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // Se la query non è attiva esce
     if not QueryCausali.Active then begin
        RxSpeedModifica.Down := False;
        Exit;
     end;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     if RxSpeedModifica.Down then
     begin
       // -----------------------------------------------------------------
       // Le aliquote NON SONO MODIFICABILI DALL'UTENTE (1° e 2° messaggio)
       //  NB: La prima condizione serve per l'"aggiungi"
       if (not (QueryCausali.State in [dsInsert])) and (not TConfirmForm.AuthorizationRequest) then
       begin
         RxSpeedModifica.Down := False;
         Exit;
       end;
       // -----------------------------------------------------------------
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QueryCausali.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          GridList.Enabled                  := False;
          DM1.ColoraTuttiCampi(CausaliForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          DbeRegistro.SetFocus;
          DBEditDescrizione.SetFocus;
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
          QueryCausali.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               QueryCausali.Post;
               QueryCausali.ApplyUpdates;
               QueryCausali.CommitUpdates;
          end else if MR = mrNo then begin
               QueryCausali.Cancel;
               QueryCausali.CommitUpdates;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;

          RxSpeedButtonUscita.Enabled        := True;
          GridList.Enabled                  := True;
          DM1.ColoraTuttiCampi(CausaliForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          DbeRegistro.SetFocus;
          DBEditDescrizione.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QueryCausali.Edit;
          end;
       end;
     end;
end;

procedure TCausaliForm.SetScrollBoxRange(const AEditMode: Boolean);
begin
  if AEditMode then
    ClientArea.VertScrollBar.Range := PanelGruppo7.Top + PanelGruppo7.Height + 10
  else
    ClientArea.VertScrollBar.Range := 0;
end;

procedure TCausaliForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // -----------------------------------------------------------------
   // Le aliquote NON SONO MODIFICABILI DALL'UTENTE (1° e 2° messaggio)
   //  NB: La prima condizione serve per l'"aggiungi"
   if not TConfirmForm.AuthorizationRequest then
     Exit;
   // -----------------------------------------------------------------
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);

   DBEditdESCRIZIONE.SetFocus;                    // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)

   // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
   if not QueryCausali.Active then begin
      QueryCausali.Close;
      QueryCausali.SQL.Clear;
      QueryCausali.SQL.Add('SELECT *');
      QueryCausali.SQL.Add('FROM CAUSALI');
      QueryCausali.SQL.Add('WHERE DESCRIZIONE = ''Non deve trovare nulla''');
      QueryCausali.Open;
   end;

   QueryCausali.Append;
   QueryCausaliENABLED.Value := 'T';
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TCausaliForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Controlla se è una causale a sola lettura e se lo è non consente di eliminarla
  if QueryCausali.FieldByName('READONLY').AsString <> '1' then
    QueryCausali.Delete
  // Se è una causale di sula lettura visualizza un messaggio
  else
    MessageDlg('Questa causale non è eliminabile (read only).', mtInformation, [mbOk], 0);
end;

procedure TCausaliForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   EseguiQueryCausali;
   GridList.SetFocus;
   DM1.ChiudiAttendere;
end;

procedure TCausaliForm.DBEditDescrizioneEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TCausaliForm.DBEditDescrizioneExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

procedure TCausaliForm.QueryCausaliBeforeDelete(DataSet: TDataSet);
var
  LMessage: string;
begin
  inherited;
  // Operazione non autorizzata
  if not TConfirmForm.AuthorizationRequest then
    Abort;
  // 2° conferma con raccomandazioni
  LMessage := 'A T T E N Z I O N E !!!'#13#13'L''operazione potrebbe causare problemi se la causale è presente in documenti emessi in precedenza.'#13#13 +
    'I documenti potrebbero non essere più accessibili.'#13#13 +
    'CONSULTARE IL SERVIZIO DI ASSISTENZA prima di proseguire.'#13#13 +
    'Se vuoi proseguire ugualmente digita "ignora le raccomandazioni", poi clicca su "Conferma".';
  if not TConfirmForm.ConfirmationRequest(Format('Elimina la causale "%s"', [QueryCausaliDESCRIZIONE.AsString]), LMessage, 'ignora le raccomandazioni', 800, 450) then
    Abort;
end;

procedure TCausaliForm.QueryCausaliBeforePost(DataSet: TDataSet);
begin
   // Marca il record come modificato
   DataSet.FieldByName('SINCHRO').Value := RECORD_MODIFIED;
end;

procedure TCausaliForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
   // Aggiorna l'aspetto della form per farla passare alla modalità Anagrafica
   // ------------------------------------------------------------------------
   SetScrollBoxRange(True);
   // Griglia invisibile
   GridList.Visible := False;
   // Aggiorna lo stato dei pulsanti per la modalità Anagrafica
   RxSpeedModifica.Enabled           := True;
   RxSpeedButtonNuovo.Enabled        := False;
   RxSpeedButtonElimina.Enabled      := False;
   RxSpeedButtonVisualizza.Enabled   := False;
end;

procedure TCausaliForm.DbeRegistroPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT REGISTRO FROM PROGREG');
      Qry.Open;
      DbeRegistro.Properties.Items.Clear;
      while not Qry.Eof do begin
         DbeRegistro.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TCausaliForm.cxDBCheckBox2PropertiesChange(Sender: TObject);
begin
  DBRTipoMovim.Enabled := (Sender as TcxDBCheckBox).Checked;
end;

procedure TCausaliForm.cxDBCheckBox1PropertiesChange(Sender: TObject);
begin
  DBETipoMovimCantiere.Enabled := (Sender as TcxDBCheckBox).Checked;
end;

procedure TCausaliForm.tvListSEGNOOPERAZIONEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if      AText = '+' then AText := 'Carica'
  else if AText = '-' then AText := 'Scarica'
  else if AText = 'O' then AText := 'Ordina'
  else if AText = 'I' then AText := 'Impegna'
  else if AText = '=' then AText := '';
end;

procedure TCausaliForm.tvListSEGNOOPERAZIONECANTIEREGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if      AText = '+' then AText := 'Carica'
  else if AText = '-' then AText := 'Scarica'
  else if AText = 'C' then AText := 'Commessa'
  else if AText = 'M' then AText := 'Montaggio'
  else if AText = 'F' then AText := 'Fatturato'
  else if AText = '=' then AText := '';
end;

procedure TCausaliForm.tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // Se il record attuale è disabilitato..
  if AViewInfo.GridRecord.DisplayTexts[tvListENABLED.Index] <> 'T' then
  begin
    // Imposta un colore da secondo piano
    ACanvas.Font.Color := clGray;
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clSilver;
    // Se stiamo proprio traccianto la colonna ENABLED...
    if AViewInfo.Item.Index = tvListENABLED.Index then begin
      // Disegna il rettangolo di sfondo
      ACanvas.FillRect(AViewInfo.Bounds);
      // Disegna la Bitmap del divietino per indicare che è un apparecchio dismesso
      ACanvas.DrawImage(ImageList1, (AViewInfo.Bounds.Left + AViewInfo.Bounds.Right - ImageList1.Width) div 2, (AViewInfo.Bounds.Top + AViewInfo.Bounds.Bottom - ImageList1.Height) div 2, 0);
      // Custom Draw
      ADone := True;
    end;
  end
  // Se invece è una riga normale (abilitata) forso il colore dello sfondo
  //  perchè altrimenti sarebbe con lettura facilitata ma siccome ho aggiunto il grigio scuro per
  //  le righe disabilitate mi sembravano troppi colori
  else
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clWhite;
end;

procedure TCausaliForm.tvListCustomDrawColumnHeader(Sender: TcxGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TCausaliForm.tvListDataControllerSortingChanged(Sender: TObject);
begin
  inherited;
  tvListENABLED.SortOrder := TdxSortOrder.soDescending;
  tvListENABLED.SortIndex := 0;
end;

procedure TCausaliForm.tvListDblClick(Sender: TObject);
begin
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: DOCUMENTO FISCALE (FormPreventiviOrdini) ---> Dalla testata documento
      999: begin
              // Importa il dato
              PreventiviOrdiniForm.QryDocumentoCausale.Value := QueryCausali.FieldByName('DESCRIZIONE').AsString;
              Close;
              PreventiviOrdiniForm.DBEditCausale.SetFocus;
           end;
      // Form chiamante: GIORNALE DI MAGAZZINO (FormClienti) ---> Dai filtri
      998: begin
              // Importa il dato
              ClientiForm.GMCausale.Text := ' ' + QueryCausali.FieldByName('DESCRIZIONE').AsString;
              Close;
              ClientiForm.GMCausale.SetFocus;
           end;
      // Form chiamante: CHECK-IN DOCUMENTO FISCALE (FormPreventiviOrdini)
      997: begin
              // Importa il dato
              PreventiviOrdiniForm.QryDocumento.Edit;
              PreventiviOrdiniForm.QryDocumentoCausale.Value := QueryCausali.FieldByName('DESCRIZIONE').AsString;
              PreventiviOrdiniForm.QryDocumento.Post;
              Close;
//              ChekInForm.EditCausale.SetFocus;
           end;
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TCausaliForm.tvListENABLEDGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := '';
end;

procedure TCausaliForm.tvListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvListDblClick(tvList);
end;

end.
