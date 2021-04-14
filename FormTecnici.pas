unit FormTecnici;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxTextEdit, cxMemo, cxCurrencyEdit,
  cxDropDownEdit, cxCheckBox, cxDBLookupComboBox, cxButtonEdit, DB,
  cxDBData, cxGridDBTableView, cxGridLevel, cxGridCardView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, IB_Components, IBODataset, bmpPanel,
  cxColorComboBox, cxDBColorComboBox, Mask, DBCtrls, Buttons, cxLookupEdit,
  cxDBLookupEdit, cxDBEdit, ExtCtrls, cxContainer, cxMaskEdit, StdCtrls,
  ComCtrls, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  cxGridCustomLayoutView, Vcl.ImgList, dxDateRanges, dxScrollbarAnnotations, System.ImageList;

type
  TTecniciForm = class(TForm)
    ClientArea: TPanel;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    RichEdit1: TRichEdit;
    ClientTopPanel: TbmpPanel;
    QryTecnici: TIBOQuery;
    SourceTecnici: TDataSource;
    QryTecniciRESOURCEID: TIntegerField;
    QryTecniciRESOURCENAME: TStringField;
    QryTecniciINDIRIZZO: TStringField;
    QryTecniciCITTA: TStringField;
    QryTecniciCAP: TStringField;
    QryTecniciPROVINCIA: TStringField;
    QryTecniciTELEFONO: TStringField;
    QryTecniciCELLULARE: TStringField;
    QryTecniciALTROTELEFONO: TStringField;
    QryTecniciEMAIL: TStringField;
    QryTecniciNOME: TStringField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    QryTecniciRESOURCECOLOR: TIntegerField;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RichEdit2: TRichEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    LabelSoprannome: TLabel;
    Label11: TLabel;
    RichEdit3: TRichEdit;
    eSoprannome: TDBEdit;
    eColore: TcxDBColorComboBox;
    Label3: TLabel;
    DBEdit11: TDBEdit;
    QryTecniciESTREMIDOCQUALIFICA: TStringField;
    Label9: TLabel;
    QryTecniciGRUPPO: TStringField;
    eGruppo: TcxDBComboBox;
    SBAnnullaColore: TSpeedButton;
    QryTecniciRAGIONESOCIALE: TStringField;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    QryTecniciIMPTERM_MANUT_CODICEOPERATORE: TStringField;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Shape30: TShape;
    Shape31: TShape;
    Shape32: TShape;
    Shape33: TShape;
    cxDBCheckBox2: TcxDBCheckBox;
    dbeMagazzino1: TcxDBLookupComboBox;
    dbeMagazzino2: TcxDBLookupComboBox;
    QryMag: TIBOQuery;
    QryMagCODICE: TIntegerField;
    QryMagDESCRIZIONE: TStringField;
    SourceMag: TDataSource;
    QryTecniciASSEGNAMAGAZZINO: TStringField;
    QryTecniciCODICEMAGAZZINO1: TIntegerField;
    QryTecniciCODICEMAGAZZINO2: TIntegerField;
    QryTecniciREGISTRO: TStringField;
    PanelGruppo5: TPanel;
    LabelGruppo5: TLabel;
    RichEdit4: TRichEdit;
    DbeRegistro: TcxDBComboBox;
    QryTecniciGCAL_CALENDAR_ID: TStringField;
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
    lvList: TcxGridLevel;
    tvListRESOURCEID: TcxGridDBColumn;
    tvListRESOURCENAME: TcxGridDBColumn;
    tvListNOME: TcxGridDBColumn;
    tvListGRUPPO: TcxGridDBColumn;
    tvListRAGIONESOCIALE: TcxGridDBColumn;
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
    Label16: TLabel;
    eOperatoreCorrelato: TcxDBComboBox;
    QryTecniciOPERATORECORRELATO: TStringField;
    Label17: TLabel;
    eGoogleCalendarID: TDBEdit;
    eAbilitato: TcxDBCheckBox;
    QryTecniciABILITATO: TStringField;
    tvListABILITATO: TcxGridDBColumn;
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
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure EseguiQueryTecnici;
    procedure cxDBComboBox1PropertiesInitPopup(Sender: TObject);
    procedure SBAnnullaColoreClick(Sender: TObject);
    procedure DbeRegistroPropertiesInitPopup(Sender: TObject);
    procedure QryTecniciBeforePost(DataSet: TDataSet);
    procedure QryTecniciBeforeDelete(DataSet: TDataSet);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvListCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure eOperatoreCorrelatoPropertiesInitPopup(Sender: TObject);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvListABILITATOGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
  private
    { Private declarations }
    function OperatoreCorrelatoDuplicato(const AResourceID: Integer; const AIDOperatore: String): boolean;
  public
    { Public declarations }
  end;

var
  TecniciForm: TTecniciForm;

implementation

uses main, DataModule1, FormHelp, SchedaClienti, FormAllegatiFG, UnitGoogleCal, FormConfirm;

{$R *.dfm}

procedure TTecniciForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;

   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBImpostazioni.Down := False;

   // Refresh della query tecnici dell'agenda
   DM1.ShowWait('Levante', 'Refresh archivio tecnici...');
   try
     if ClientiForm.QryTecnici.Active then begin
       ClientiForm.QryTecnici.Refresh;
     end;
   finally
     DM1.CloseWait;
   end;

   // Il puntatore alla form := nil
   TecniciForm := nil;
end;

procedure TTecniciForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(Self, COLOR_NORMALE);
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

procedure TTecniciForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TTecniciForm.FormShow(Sender: TObject);
begin
   // Rende visibile solo la griglia e nascosti i campi
   GridList.Visible := True;
   GridList.Align := alClient;

   DM1.FocusRefresh;
   RxSpeedButtonTrovaClick(Self);

   // Imposta il titolo della colonna del Nome del tecnico
   tvListRESOURCENAME.Caption     := DM1.GridsColumnTecnicoCaption;
   LabelSoprannome.Caption        := DM1.GridsColumnTecnicoCaption;

   // Apri la query di loockup dei magazzini
   QryMag.Open;
end;

procedure TTecniciForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
   if GridList.Visible then begin
      Close;
   end else begin
      // Griglia visibile che copre il resto
      GridList.Visible                     := True;
      // Risistema i pulsanti per la fase di elenco
      RxSpeedModifica.Enabled           := False;
      RxSpeedButtonNuovo.Enabled        := True;
      RxSpeedButtonElimina.Enabled      := True;
      RxSpeedButtonVisualizza.Enabled   := True;
   end;
end;

procedure TTecniciForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('');
end;

procedure TTecniciForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // Se la query non è attiva esce
     if not QryTecnici.Active then begin
        RxSpeedModifica.Down := False;
        Exit;
     end;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryTecnici.Edit;
          RxSpeedButtonUscita.Enabled    := False;
          SBAnnullaColore.Enabled        := True;
          GridList.Enabled                  := False;
          DM1.ColoraTuttiCampi(TecniciForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          eGruppo.SetFocus;
          eSoprannome.SetFocus;
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
          QryTecnici.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice non c'è lo assegna automaticamente
               if Trim(QryTecnici.FieldByName('RESOURCEID').AsString) = '' then begin
                  QryTecnici.FieldByName('RESOURCEID').Value := DM1.NextCodice('TECNICI', 'RESOURCEID');
               end;
               // Verifica l'univocità dell'operatore correlato (mobile RDP)
               if OperatoreCorrelatoDuplicato(QryTecniciRESOURCEID.AsInteger, QryTecniciOPERATORECORRELATO.AsString) then
                 raise Exception.Create('Operatore correlato già utilizzato da un altro tecnico');
               QryTecnici.Post;
               QryTecnici.ApplyUpdates;
               QryTecnici.CommitUpdates;
          end else if MR = mrNo then begin
               QryTecnici.Cancel;
               QryTecnici.CommitUpdates;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;

          RxSpeedButtonUscita.Enabled    := True;
          SBAnnullaColore.Enabled        := False;
          GridList.Enabled                  := True;
          DM1.ColoraTuttiCampi(TecniciForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          eGruppo.SetFocus;
          eSoprannome.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryTecnici.Edit;
          end;
       end;
     end;
end;

procedure TTecniciForm.EseguiQueryTecnici;
begin
   // Esegue la query
   if QryTecnici.Active then
     QryTecnici.Close;
   QryTecnici.Open;
end;


procedure TTecniciForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);

   eSoprannome.SetFocus;                    // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)

   // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
   if not QryTecnici.Active then begin
      QryTecnici.Close;
      QryTecnici.SQL.Clear;
      QryTecnici.SQL.Add('SELECT *');
      QryTecnici.SQL.Add('FROM TECNICI');
      QryTecnici.SQL.Add('WHERE RESOURCEID = -9999');
      QryTecnici.Open;
   end;

   QryTecnici.Append;
   QryTecniciABILITATO.Value := 'T';
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TTecniciForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  QryTecnici.Delete;
end;

procedure TTecniciForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   try
     EseguiQueryTecnici;
     GridList.SetFocus;
   finally
     DM1.ChiudiAttendere;
   end;
end;

procedure TTecniciForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
   // Aggiorna l'aspetto della form per farla passare alla modalità Anagrafica
   // ------------------------------------------------------------------------
   // Griglia invisibile
   GridList.Visible := False;
   // Aggiorna lo stato dei pulsanti per la modalità Anagrafica
   RxSpeedModifica.Enabled           := True;
   RxSpeedButtonNuovo.Enabled        := False;
   RxSpeedButtonElimina.Enabled      := False;
   RxSpeedButtonVisualizza.Enabled   := False;
end;

procedure TTecniciForm.cxDBComboBox1PropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
   LComboBox: TcxDBComboBox;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(GRUPPO) FROM TECNICI');
      Qry.Open;
      LComboBox := Sender as TcxDBComboBox;
      LComboBox.Properties.Items.Clear;
      while not Qry.Eof do
      begin
         LComboBox.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTecniciForm.SBAnnullaColoreClick(Sender: TObject);
begin
  QryTecniciRESOURCECOLOR.Clear;
end;

procedure TTecniciForm.DbeRegistroPropertiesInitPopup(Sender: TObject);
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

procedure TTecniciForm.eOperatoreCorrelatoPropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
   LComboBox: TcxDBComboBox;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.GenDBFile;
      Qry.IB_Connection := DM1.DBGenerale;
      Qry.SQL.Add('SELECT NOMEUTENTE FROM SECURITY ORDER BY NOMEUTENTE');
      Qry.Open;
      LComboBox := Sender as TcxDBComboBox;
      LComboBox.Properties.Items.Clear;
      LComboBox.Properties.Items.Add('');
      while not Qry.Eof do
      begin
         LComboBox.Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TTecniciForm.QryTecniciBeforePost(DataSet: TDataSet);
begin
  // ===========================================================================
  // GOOGLE CALENDAR
  // ---------------------------------------------------------------------------
  // Crea/Aggiorna il calendario di Google Calendar relativoal tecnico
  //  NB: Ovviamente solo se abilitato
  if  DM1.GoogleCalendar_Enabled
  and (DM1.Messaggi('Google Calendar - Crea o modifica calendario', 'Vuoi che lo crea/modifico anche su Google Calendar?', '', [mbYes,mbNo], 0, nil) = mrYes)
  then begin
    try
      DM1.ShowWait('Levante', 'Sto comunicando con Google Calendar...');
      QryTecniciGCAL_CALENDAR_ID.Value := GCal_Calendar_CreateOrModify(QryTecniciGCAL_CALENDAR_ID.AsString, QryTecniciRESOURCENAME.AsString);
    finally
      DM1.CloseWait;
    end;
  end;
  // ===========================================================================
end;

procedure TTecniciForm.QryTecniciBeforeDelete(DataSet: TDataSet);
var
  LMessage: string;
begin
  inherited;
  // Operazione non autorizzata
  if not TConfirmForm.AuthorizationRequest then
    Abort;
//  // 1° conferma
//  if not TConfirmForm.ConfirmationRequest(
//    Format('Elimina %s', [QryTecniciRESOURCENAME.AsString]),
//    Format('Per confermare digita "elimina %s", poi clicca sul bottone "Conferma".', [QryTecniciRESOURCENAME.AsString]),
//    Format('elimina %s', [QryTecniciRESOURCENAME.AsString]),
//    800, 300)
//    then
//      Abort;
  // 2° conferma con raccomandazioni
  LMessage := 'A T T E N Z I O N E !!!'#13#13'L''operazione potrebbe causare problemi se la persona è presente in chiamate, appuntamenti o interventi registrati in precedenza.'#13#13 +
    'Potrebbero non essere più accessibili.'#13#13 +
    'CONSULTARE IL SERVIZIO DI ASSISTENZA prima di proseguire.'#13#13 +
    'Se vuoi proseguire ugualmente digita "ignora le raccomandazioni", poi clicca su "Conferma".';
  if not TConfirmForm.ConfirmationRequest(Format('Elimina %s', [QryTecniciRESOURCENAME.AsString]), LMessage, 'ignora le raccomandazioni', 800, 480) then
    Abort;

  // ===========================================================================
  // GOOGLE CALENDAR
  // ---------------------------------------------------------------------------
  // Elimina il calendario relatico al tecnico e ma chiede prima conferma
  if  DM1.GoogleCalendar_Enabled
  and (QryTecniciGCAL_CALENDAR_ID.AsString <> '')
  and (DM1.Messaggi('Google Calendar - Elimina calendario', 'Vuoi che lo alimino anche da Google Calendar?', '', [mbYes,mbNo], 0, nil) = mrYes)
  then begin
    try
      DM1.ShowWait('Levante', 'Sto comunicando con Google Calendar...');
      GCal_Calendar_Delete(QryTecniciGCAL_CALENDAR_ID.AsString);
    finally
      DM1.CloseWait;
    end;
  end;
  // ===========================================================================
end;

procedure TTecniciForm.tvListDblClick(Sender: TObject);
begin
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: SCHEDA CLIENTI - ELENCO IMPEGNI - FILTRO PER TECNICO
      999: begin
              // Importa l'aliquotaIVA nel rigo corrente
              ClientiForm.FilterCodiceTecnico.Text := QryTecnici.FieldByName('RESOURCEID').AsString;
              ClientiForm.FilterTecnico.Text := QryTecnici.FIeldByName('RESOURCENAME').AsString;
              Close;
              ClientiForm.FilterCodiceTecnico.SetFocus;
           end;
      // Form chiamante: ALLEGATO F/G
      998: begin
              AllegatiFGForm.QryAllTECNICO_RESOURCEID.Value           :=  QryTecniciRESOURCEID.Value;
              AllegatiFGForm.QryAllTECNICO_NOMECOGNOME.Value          :=  QryTecniciNOME.AsString;
              AllegatiFGForm.QryAllTECNICO_RAGSOC.Value               :=  QryTecniciRAGIONESOCIALE.AsString;
              AllegatiFGForm.QryAllTECNICO_INDIRIZZO.Value            :=  QryTecniciINDIRIZZO.AsString + ' - ' + QryTecniciCITTA.AsString + ' (' + QryTecniciPROVINCIA.AsString + ')';
              AllegatiFGForm.QryAllTECNICO_TELEFONO.Value             :=  QryTecniciTELEFONO.Value;
              AllegatiFGForm.QryAllTECNICO_ESTREMIDOCQUALIFICA.Value  :=  QryTecniciESTREMIDOCQUALIFICA.Value;
              Close;
           end;
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TTecniciForm.tvListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvListDblClick(tvList);
end;

function TTecniciForm.OperatoreCorrelatoDuplicato(const AResourceID: Integer; const AIDOperatore: String): boolean;
var
   Qry : TIB_Cursor;
begin
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add(Format('SELECT COUNT(*) FROM TECNICI WHERE RESOURCEID <> %d AND OPERATORECORRELATO = ''%s''', [AResourceID, AIDOperatore]));
      Qry.Open;
      Result := Qry.Fields[0].AsInteger > 0;
   finally
      Qry.Free;
   end;
end;

procedure TTecniciForm.tvListABILITATOGetDisplayText(Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  AText := '';
end;

procedure TTecniciForm.tvListCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  // Se il record attuale è disabilitato..
  if AViewInfo.GridRecord.DisplayTexts[tvListABILITATO.Index] <> 'T' then
  begin
    // Imposta un colore da secondo piano
    ACanvas.Font.Color := clGray;
    if not AViewInfo.EditViewInfo.IsSelected then
      ACanvas.Brush.Color := clSilver;
    // Se stiamo proprio traccianto la colonna ENABLED...
    if AViewInfo.Item.Index = tvListABILITATO.Index then begin
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

procedure TTecniciForm.tvListCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  // Richiama la gestione predefinita dell'evento
  DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

end.
