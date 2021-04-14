unit FormCategoria1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, DB,
  IniFiles, IB_Components, IBODataset, bmpPanel, 
  cxEdit, cxTextEdit, cxMemo,
  cxCurrencyEdit, cxDropDownEdit, cxCheckBox, cxDBLookupComboBox,
  cxButtonEdit, cxDBData, cxGridDBTableView, cxGridLevel, cxGridCardView,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Buttons, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters,
  cxNavigator, cxGridCustomLayoutView;

type
  TCategoria1Form = class(TForm)
    ClientArea: TPanel;
    PanelCustom: TPanel;
    LabelCampo1: TLabel;
    DBECampo1: TDBEdit;
    LabelCampo2: TLabel;
    DBECampo2: TDBEdit;
    LabelCampo3: TLabel;
    DBECampo3: TDBEdit;
    LabelCampo4: TLabel;
    DBECampo4: TDBEdit;
    LabelCampo5: TLabel;
    DBECampo5: TDBEdit;
    LabelCampo6: TLabel;
    DBECampo6: TDBEdit;
    LabelCampo7: TLabel;
    DBECampo7: TDBEdit;
    LabelCampo8: TLabel;
    DBECampo8: TDBEdit;
    LabelCampo9: TLabel;
    DBECampo9: TDBEdit;
    LabelCampo10: TLabel;
    DBECampo10: TDBEdit;
    LabelTitolo1: TLabel;
    LabelTitolo2: TLabel;
    LabelTitolo3: TLabel;
    LabelTitolo4: TLabel;
    LabelTitolo5: TLabel;
    QryCat: TIBOQuery;
    SourceCat: TDataSource;
    QryCatCAMPO1: TStringField;
    QryCatCAMPO2: TStringField;
    QryCatCAMPO3: TStringField;
    QryCatCAMPO4: TStringField;
    QryCatCAMPO5: TStringField;
    QryCatCAMPO6: TStringField;
    QryCatCAMPO7: TStringField;
    QryCatCAMPO8: TStringField;
    QryCatCAMPO9: TStringField;
    QryCatCAMPO10: TStringField;
    ClientTopPanel: TbmpPanel;
    PanelCategorie: TPanel;
    Label44: TLabel;
    Shape1: TShape;
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
    tvListCAMPO1: TcxGridDBColumn;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure CaricaLayout;
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure DBECampo1Enter(Sender: TObject);
    procedure DBECampo1Exit(Sender: TObject);     // Personale
  private
    { Private declarations }
  public
    { Public declarations }
    // Tabeòòa alla quale deve puntare la form
    Tabella:String;
  end;

var
  Categoria1Form: TCategoria1Form;

implementation

uses DataModule1, main;

{$R *.DFM}



procedure TCategoria1Form.CaricaLayout;     // Personale
var
   LO : TMemIniFile;
   Contatore, YY, Sep, YYY, TmpInt: Integer;
   Sez, TmpStr, TitoloStr : String;
   TmpDBE : TDBEdit;
   TmpLabel, TmpTitolo : TLabel;
begin
   // Inizializza la stringa che contiene il nome delle sezione nel file *.INI dove sono
   //  contenuti i parametri che ci interessano
   if      Tabella = 'CATEG1'     then Sez := 'Categoria1'
   else if Tabella = 'CATEG2'     then Sez := 'Categoria2'
   else if Tabella = 'CATEG3'     then Sez := 'Categoria3'
   else if Tabella = 'CATEG4'     then Sez := 'Categoria4'
   else if Tabella = 'CATEG5'     then Sez := 'Categoria5'
   else if Tabella = 'CATEG6'     then Sez := 'Categoria6'
   else if Tabella = 'CATEG7'     then Sez := 'Categoria7'
   else if Tabella = 'CATEG8'     then Sez := 'Categoria8'
   else if Tabella = 'CATEGCANT1' then Sez := 'CategCant1'
   else if Tabella = 'CATEGCANT2' then Sez := 'CategCant2'
   else if Tabella = 'CATEGCANT3' then Sez := 'CategCant3'
   else if Tabella = 'CATEGCANT4' then Sez := 'CategCant4'
   else if Tabella = 'CATEGCANT5' then Sez := 'CategCant5'
   else if Tabella = 'CATEGCANT6' then Sez := 'CategCant6';
   // Apre il file che contiene i layouts di stampa e visualizzazione dei documenti.
   LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
    // Inizializza la variabile che contiene il valore della posizione attuale
    //  del pennello di  visualizzazione tramite il quale ci si regola per la visualizzazione
    //  dei componenti.
    YY := LO.ReadInteger(Sez, 'Top', 50);
    // Carica la separazione verticale tra i componenti su una variabile locale per comodità
    Sep := LO.ReadInteger(Sez, 'SeparazioneVerticale', 5);

    // ----- CAMPI JOLLY -----
    if LO.ReadString(Sez, 'Campo1', '0') <> '0' then begin
          TmpInt := 1;
          YYY := 0;
          // Cicla per tutte i 10 possibili campi jolly
          for Contatore := 1 to 10 do begin
             // Rimappa su variabili locali i componenti Label e DBEdit che si
             //  stanno impostando.
             TmpDBE   := (FindComponent('DBECampo'+IntToStr(Contatore)) as TDBEdit);
             TmpLabel := (FindComponent('LabelCampo'+IntToStr(Contatore)) as TLabel);
             // Carica in TmpStr la riga del file *.INI da elaborare e se è <> 0 la elabora,
             TmpStr := LO.ReadString(Sez, 'Campo'+IntToStr(Contatore), '0');
             if TmpStr <> '0' then begin
                // Cicla finchè non vi siano più eventuali titoli da visualizzare contenuti nella
                //  riga del file *.INI attuale (titoli da visualizzare prima del campo attuale stesso.
                while DM1.RitornaTestoPrimaDi('_', TmpStr, False) <> '' do begin
                   // Prende la prima label di titolo disponibile, la imposta, la visualizza
                   TitoloStr := DM1.RitornaTestoPrimaDi('_', TmpStr, True);
                   TmpTitolo := (FindComponent('LabelTitolo'+IntToStr(TmpInt)) as TLabel);
                   TmpInt := TmpInt + 1;
                   TmpTitolo.Caption := ' ' + DM1.StrRight(TitoloStr, Length(TitoloStr)-3);
                   if TitoloStr[1] = 'L' then TmpTitolo.Alignment := taLeftJustify
                    else if TitoloStr[1] = 'C' then TmpTitolo.Alignment := taCenter
                    else if TitoloStr[1] = 'R' then TmpTitolo.Alignment := taRightJustify;
                   if TitoloStr[2] = 'N' then TmpTitolo.Font.Style := []
                   else if TitoloStr[2] = 'B' then TmpTitolo.Font.Style := [fsBold];
                   TmpTitolo.Top := YYY
                   ;
                   TmpTitolo.Visible := True;
                   YYY := YYY + TmpTitolo.Height;
                end;
                // Imposta il campo attuale e lo rende visibile
                Inc(YYY, 5);
                TmpLabel.Caption := TmpStr + ' ';
                TmpLabel.Top := YYY;
                TmpLabel.Visible := True;
                TmpDBE.Top := YYY;
                TmpDBE.Visible := True;
                YYY := YYY + TmpLabel.Height;
                // Dimensiona il pannello opportunamente
                PanelCustom.Height := YYY+6;
             end else begin
                // Se invece il campo attuale è disabilitato lo rende invisibile
                TmpLabel.Visible := False;
                TmpDBE.Visible := False;
             end;
          end;
          // Posiziona il pannello e lo visualizza
          YY := YY + Sep;
          PanelCustom.Top := YY;
          YY := YY + PanelCustom.Height;
    end else begin
       DBECampo2.Visible := False;
       DBECampo3.Visible := False;
       DBECampo4.Visible := False;
       DBECampo5.Visible := False;
       DBECampo6.Visible := False;
       DBECampo7.Visible := False;
       DBECampo8.Visible := False;
       DBECampo9.Visible := False;
       DBECampo10.Visible := False;
       PanelCustom.Height := 17;
    end;
    // ------------------------------
   LO.Free;
end;




procedure TCategoria1Form.FormClose(Sender: TObject;
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
   // Il puntatore alla form := nil
   Categoria1Form := nil;
end;

procedure TCategoria1Form.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);

   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(Categoria1Form, COLOR_NORMALE);

   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione;

   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TCategoria1Form.FormKeyUp(Sender: TObject; var Key: Word;
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
               RxSpeedButtonEliminaClick(Self);
            end;
         end;

      end;
end;

procedure TCategoria1Form.FormShow(Sender: TObject);
begin
   GridList.SetFocus;
   DM1.FocusRefresh;
   CaricaLayout;
   // IMposta la query e i componenti correlati in modo che puntino alla tabella corretta
   QryCat.SQL[0]             := 'SELECT * FROM ' + Tabella;
   QryCat.DeleteSQL[0]       := 'DELETE FROM ' + Tabella;
   QryCat.InsertSQL[0]       := 'INSERT INTO ' + Tabella;
   QryCat.EditSQL[0]         := 'UPDATE ' + Tabella + ' SET';
   // Apre la query
   QryCat.Open;
end;

procedure TCategoria1Form.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     Close;
end;

procedure TCategoria1Form.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          QryCat.Edit;
          RxSpeedButtonNuovo.Enabled            := False;
          RxSpeedButtonElimina.Enabled          := False;
          RxSpeedButtonUscita.Enabled           := False;
          GridList.Visible                         := False;
          DM1.ColoraTuttiCampi(Categoria1Form, COLOR_MODIFICA);
          // Visualizza il dettaglio e ci sposta sopra il focus
          PanelCustom.Visible                   := True;
          if DBECampo2.Visible and DBECampo2.Enabled then DBECampo2.SetFocus;
          DBECampo1.SetFocus;
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
          QryCat.Edit;
          // ---------------------------------------------------------------------------------------------
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               QryCat.Post;
               QryCat.ApplyUpdates;
               QryCat.CommitUpdates;
          end else if MR = mrNo then begin
               QryCat.Cancel;
               QryCat.CommitUpdates;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;
          // Varia i colori dei componenti per mettere il tutto in NON MODIFICA
          RxSpeedButtonNuovo.Enabled         := True;
          RxSpeedButtonElimina.Enabled       := True;
          RxSpeedButtonUscita.Enabled        := True;
          // Se non metto questa riga me dà errore
          Application.ProcessMessages;
          // Rivisualizza la griglia e ci sposta sopra il focus
          PanelCustom.Visible := False;
          GridList.Visible := True;
          GridList.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryCat.Edit;
          end;
       end;
     end;
end;

procedure TCategoria1Form.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   PanelCustom.Visible := True;
   DBECampo1.SetFocus;           // Altrimenti se il focus è sulla griglia non aggiunge il record nuovo
   QryCat.Append;
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TCategoria1Form.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Chiede prima conferma
  MessageBeep(0);
  if MessageDlg('Vuoi veramente cancellare la categoria ?', mtWarning, [mbOk, mbNo], 0) = mrOk then
  begin
       // Elimina l'articolo corrente
       QryCat.Delete;
  end;
end;

procedure TCategoria1Form.DBECampo1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TCategoria1Form.DBECampo1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;

end.
