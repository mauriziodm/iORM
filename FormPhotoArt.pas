unit FormPhotoArt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IB_Components, IBODataset, DB, bmpPanel,
  cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxColorComboBox, Mask,
  DBCtrls, StdCtrls, ComCtrls, ExtCtrls, 
  cxGraphics, cxDBData, cxCalendar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxImage, cxDBEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator;

type
  TPhotoArtForm = class(TForm)
    ClientArea: TPanel;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    DBEdit1: TDBEdit;
    ClientTopPanel: TbmpPanel;
    QryPhoto: TIBOQuery;
    SourcePhoto: TDataSource;
    Grid1: TcxGrid;
    tvPhoto: TcxGridDBTableView;
    lvPhoto: TcxGridLevel;
    QryPhotoCODICE: TStringField;
    QryPhotoDESCRIZIONE: TStringField;
    QryPhotoJPEG: TBlobField;
    tvPhotoCODICE: TcxGridDBColumn;
    tvPhotoDESCRIZIONE: TcxGridDBColumn;
    tvPhotoJPEG: TcxGridDBColumn;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    cxDBImage1: TcxDBImage;
    Button1: TButton;
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
    procedure FormShow(Sender: TObject);
    procedure RxSpeedButtonTrovaClick(Sender: TObject);
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
    procedure RxSpeedButtonEliminaClick(Sender: TObject);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject);
    procedure tvPhotoCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvPhotoCustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvPhotoCustomDrawPartBackground(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
    procedure tvPhotoDblClick(Sender: TObject);
    procedure tvPhotoKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
  private
    procedure EseguiQueryPhoto;
    procedure CaricaFotoDaDisco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PhotoArtForm: TPhotoArtForm;

implementation

uses main, DataModule1, FormHelp, FormAnagArt, StrUtils;

{$R *.dfm}

procedure TPhotoArtForm.EseguiQueryPhoto;
begin
   // Esegue la query
   if QryPhoto.Active then QryPhoto.Close;
   QryPhoto.Open;
end;


procedure TPhotoArtForm.FormClose(Sender: TObject;
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
   PhotoArtForm := nil;
end;

procedure TPhotoArtForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(PhotoArtForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Photo Album)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TPhotoArtForm.FormShow(Sender: TObject);
begin
   // Rende visibile solo la griglia e nascosti i campi
   Grid1.Visible := True;
   Grid1.Align := alClient;

   DM1.FocusRefresh;
   RxSpeedButtonTrovaClick(Self);
end;

procedure TPhotoArtForm.RxSpeedButtonTrovaClick(Sender: TObject);
begin
   DM1.Attendere;
   EseguiQueryPhoto;
   Grid1.SetFocus;
   DM1.ChiudiAttendere;
end;

procedure TPhotoArtForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
   // Se è nella fase di elenco, esce dalla form, altrimenti se è nell'anagrafica torna all'elenco
   if Grid1.Visible then begin
      Close;
   end else begin
      // Griglia visibile che copre il resto
      Grid1.Visible                     := True;
      // Risistema i pulsanti per la fase di elenco
      RxSpeedModifica.Enabled           := False;
      RxSpeedButtonNuovo.Enabled        := True;
      RxSpeedButtonElimina.Enabled      := True;
      RxSpeedButtonVisualizza.Enabled   := True;
   end;
end;

procedure TPhotoArtForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('');
end;

procedure TPhotoArtForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // Se la query non è attiva esce
     if not QryPhoto.Active then begin
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
          QryPhoto.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          Grid1.Enabled                  := False;
          DM1.ColoraTuttiCampi(PhotoArtForm, COLOR_MODIFICA);
          // Sposta il focus sul primo campo editabile
          DBEdit2.SetFocus;
          DBEdit1.SetFocus;
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
          QryPhoto.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Se il codice non c'è lo assegna automaticamente
//               if Trim(QryPhoto.FieldByName('CODICE').AsString) = '' then begin
//                  QryTecnici.FieldByName('CODICE').Value := DM1.NextCodice('PHOTOART', 'CODICE');
//               end;
               QryPhoto.Post;
               QryPhoto.ApplyUpdates;
               QryPhoto.CommitUpdates;
          end else if MR = mrNo then begin
               QryPhoto.Cancel;
               QryPhoto.CommitUpdates;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;

          RxSpeedButtonUscita.Enabled        := True;
          Grid1.Enabled                  := True;
          DM1.ColoraTuttiCampi(PhotoArtForm, COLOR_NORMALE);
          // Sposta il focus sul primo campo editabile
          DBEdit2.SetFocus;
          DBEdit1.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               QryPhoto.Edit;
          end;
       end;
     end;
end;

procedure TPhotoArtForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
   // Pone la form in modalità Anagrafica
   RxSpeedButtonVisualizzaClick(Self);

   DBEdit1.SetFocus;                    // Altrimenti non so perchè non aggiunge un nuovo record ma modifica quello esistente (BO!)

   // Se la query non è attiva la attiva senza nessun record (fà una interrogazione impossibile)
   if not QryPhoto.Active then begin
      QryPhoto.Close;
      QryPhoto.SQL.Clear;
      QryPhoto.SQL.Add('SELECT *');
      QryPhoto.SQL.Add('FROM PHOTOART');
      QryPhoto.SQL.Add('WHERE CODICE = ''-9999''');
      QryPhoto.Open;
   end;

   QryPhoto.Append;
   RxSpeedModifica.Down := True;
   RxSpeedModificaClick(Self);
end;

procedure TPhotoArtForm.RxSpeedButtonEliminaClick(Sender: TObject);
begin
  // Chiede prima conferma
  MessageBeep(0);
  if MessageDlg('Vuoi veramente eliminare il record ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
     MessageBeep(0);
     if MessageDlg('Sei sicuro/a ?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
        // Elimina l'articolo corrente
        QryPhoto.Delete;
        QryPhoto.ApplyUpdates;
        QryPhoto.CommitUpdates;
     end;
  end;
end;

procedure TPhotoArtForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
   // Aggiorna l'aspetto della form per farla passare alla modalità Anagrafica
   // ------------------------------------------------------------------------
   // Griglia invisibile
   Grid1.Visible := False;
   // Aggiorna lo stato dei pulsanti per la modalità Anagrafica
   RxSpeedModifica.Enabled           := True;
   RxSpeedButtonNuovo.Enabled        := False;
   RxSpeedButtonElimina.Enabled      := False;
   RxSpeedButtonVisualizza.Enabled   := False;
end;

procedure TPhotoArtForm.tvPhotoCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TPhotoArtForm.tvPhotoCustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TPhotoArtForm.tvPhotoCustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TPhotoArtForm.tvPhotoDblClick(Sender: TObject);
begin
   // In base alla proprietà Tag della form viene individuata la form chiamante
   //  alla quale dovrà essere aggiunto l'articolo selezionato
   case Tag of
      // Form chiamante: ANAGRAFICA ARTICOLI
      999: begin
              // Importa il dato
              AnagArtForm.QryArtCodicePhotoArt.Value := QryPhoto.FieldByName('CODICE').AsString;
              Close;
           end;
   else
      RxSpeedButtonVisualizzaClick(Self);
   end;
end;

procedure TPhotoArtForm.tvPhotoKeyPress(Sender: TObject; var Key: Char);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = Chr(13) then (Sender as TcxGridSite).GridView.OnDblClick(Self);
end;

procedure TPhotoArtForm.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TPhotoArtForm.Button1Click(Sender: TObject);
begin
  CaricaFotoDaDisco;
end;


// Procedura che carica le foto da una apposita cartella
procedure TPhotoArtForm.CaricaFotoDaDisco;
var
  qChk, qUpd, qIns: TIB_Cursor;
  sr: TSearchRec;
  NomeFile, NomeFileNoExt, FileExt, Path: String;
  i: Integer;
  Presente: Boolean;
begin
  // Chiede conferma all'operatore
  if DM1.Messaggi('Caricamento Foto', 'Confermi avvio caricamento foto?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  // Inizializzazione
  i := 0;
  Path := 'c:\fotolistinoromagnaconvertite\';
  Grid1.BeginUpdate;
  try
    // Inizializzazione query
    qChk := TIB_Cursor.Create(Self);
    qUpd := TIB_Cursor.Create(Self);
    qIns := TIB_Cursor.Create(Self);
    qChk.DatabaseName  := DM1.ArcDBFile;
    qUpd.DatabaseName  := DM1.ArcDBFile;
    qIns.DatabaseName  := DM1.ArcDBFile;
    qChk.IB_Connection := DM1.DBAzienda;
    qUpd.IB_Connection := DM1.DBAzienda;
    qIns.IB_Connection := DM1.DBAzienda;
    // IMpostazione query che verifica la presenza eventuale della foto corrente
    qChk.SQL.Add('SELECT COUNT(*) AS QUANTI FROM PHOTOART WHERE CODICE = :P_CODPHOTO');
    // Impostazione della query per inserimento di una nuova foto
    qIns.SQL.Add('INSERT INTO PHOTOART (CODICE,JPEG) VALUES (:P_CODPHOTO, :P_JPEG)');
    // Impostazione della query per la modifica di una foto già esistente
    qUpd.SQL.Add('UPDATE PHOTOART SET JPEG = :P_JPEG WHERE CODICE = :P_CODPHOTO');
    // -------------------------------------------------------------------------
    // Primo file della directory
    if FindFirst(Path+'*.*', faAnyFile, sr) = 0 then begin
      // Cicla per tutti i files della directory
      repeat
        // Incrementa il contatore
        inc(i);
        NomeFile := sr.Name;
        if (NomeFile <> '.') and (NomeFile <> '..') then begin
          FileExt := ExtractFileExt(NomeFile);
          NomeFileNoExt := LeftStr(NomeFile, (Length(NomeFile) - Length(FileExt)));
          NomeFileNoExt := UpperCase( NomeFileNoExt );
          DM1.ShowWait('Caricamento Foto', 'Caricamento: (' + IntToStr(i) + ') "' + NomeFile + '"');
          // Verifica se una foto con lo stesso codice è già presente
          qChk.Prepare;
          qChk.Params.ParamByName('P_CODPHOTO').AsString := NomeFileNoExt;
          qChk.Open;
          Presente := (qChk.Fields[0].asInteger > 0);
          qChk.Close;
          // Se è preente usa la query per aggiornare quella presente con il nuovo file
          if Presente then begin
            qUpd.Prepare;
            qUpd.Params.ParamByName('P_CODPHOTO').AsString := NomeFileNoExt;
            qUpd.Params.ParamByName('P_JPEG').LoadFromFile(Path+NomeFile);
            qUpd.ExecSQL;
          // Se invece la foto non è presente ma è nuova la aggiunge
          end else begin
            qIns.Prepare;
            qIns.Params.ParamByName('P_CODPHOTO').AsString := NomeFileNoExt;
            qIns.Params.ParamByName('P_JPEG').LoadFromFile(Path+NomeFile);
            qIns.ExecSQL;
          end;
        end;
      // Avanti il prossimo
      until FindNext(sr) <> 0;
      FindClose(sr);
    end else begin
      raise Exception.Create('Errore cercando di reperire l''elenco delle foto da importare.');
    end;
    // -------------------------------------------------------------------------
  finally
    DM1.CloseWait;
    Grid1.EndUpdate;
    if Assigned(qChk) then qChk.Free;
    if Assigned(qUpd) then qUpd.Free;
    if Assigned(qIns) then qIns.Free;
  end;
end;



end.
