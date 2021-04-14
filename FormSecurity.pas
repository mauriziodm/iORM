unit FormSecurity;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, IB_Components, IBODataset, cxContainer, cxMemo, cxDBEdit,
  StdCtrls, ExtCtrls, DBCtrls, cxPC, Mask, Buttons, MAURI_SB, cxPCdxBarPopupMenu,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator, cxLabel, cxDBLabel, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.Menus, cxButtons,
  dxBarBuiltInMenu, dxDateRanges, dxScrollbarAnnotations;

const
  // Cosstanti per identificare il modo di apertura della form
  USERS_NUOVA         = 0;
  USERS_MODIFICA      = 1;
  USERS_ELIMINA       = 2;

type
  TSecurityForm = class(TForm)
    QuerySecurity: TIBOQuery;
    SourceSecurity: TDataSource;
    QuerySecurityNomeUtente: TStringField;
    QuerySecurityNote: TStringField;
    QuerySecurityMOD_Clienti: TStringField;
    QuerySecurityMOD_Cefalometrie: TStringField;
    QuerySecurityMOD_Articoli: TStringField;
    QuerySecurityMOD_Pratiche: TStringField;
    QuerySecurityMOD_Preventivi: TStringField;
    QuerySecurityMOD_Ordini: TStringField;
    QuerySecurityMOD_SAL: TStringField;
    QuerySecurityMOD_DDT: TStringField;
    QuerySecurityMOD_Fatture: TStringField;
    QuerySecurityMOD_Note_Accredito: TStringField;
    QuerySecurityMOD_Bolle_Entrata: TStringField;
    QuerySecurityMOD_Scadenzario: TStringField;
    QuerySecurityMOD_Testi: TStringField;
    QuerySecurityMOD_Fax: TStringField;
    QuerySecurityMOD_Contatti: TStringField;
    QuerySecurityMOD_Ext_File: TStringField;
    QuerySecurityMOD_Conformita: TStringField;
    QuerySecurityMOD_Fatt_Riepilogativa: TStringField;
    QuerySecurityMOD_Multiaziendale: TStringField;
    QuerySecurityMOD_Importazione_Archivi: TStringField;
    QuerySecurityMOD_Fatture_Acquisto: TStringField;
    QuerySecurityMOD_Ricevute_Fiscali: TStringField;
    QuerySecurityMOD_Scadenzario_Passivo: TStringField;
    QuerySecurityMOD_Ordini_Fornitori: TStringField;
    QuerySecurityMOD_Fatture_RF: TStringField;
    QuerySecurityMOD_Disco_Rifatturazione: TStringField;
    QuerySecurityMOD_Buono_Consegna: TStringField;
    QuerySecurityMOD_Segreteria: TStringField;
    QuerySecurityMOD_Password: TStringField;
    QuerySecurityMOD_Primanota: TStringField;
    QuerySecurityPswd: TStringField;
    QuerySecurityMOD_GIORNALE_MAGAZZINO: TStringField;
    QuerySecurityMOD_CONDIZIONI_VENDITA: TStringField;
    PanelUtente: TPanel;
    Label36: TLabel;
    DBEUserID: TDBEdit;
    Label37: TLabel;
    DBEPassword: TDBEdit;
    Label38: TLabel;
    DBENote: TDBEdit;
    SBUtenteCancel: TSpeedButtonRollOver;
    SBUtenteOK: TSpeedButtonRollOver;
    Label32: TLabel;
    PanelGrid: TPanel;
    SBGridCancel: TSpeedButtonRollOver;
    SBGridOK: TSpeedButtonRollOver;
    TitoloGrid: TLabel;
    QuerySecurityMOD_AGENDA: TStringField;
    QuerySecurityMOD_GIORNALE_CANTIERE: TStringField;
    QuerySecuritySOLOARTICOLI: TMemoField;
    QuerySecuritySOLORISORSEAGENDA: TMemoField;
    QuerySecurityABILITAMENUIMPOSTAZIONI: TStringField;
    QuerySecurityABILITAMENUUTILITA: TStringField;
    cxPageControl1: TcxPageControl;
    TabPermessi: TcxTabSheet;
    Shape4: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Label39: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    ScrollBoxPermessi: TScrollBox;
    Label45: TLabel;
    Label46: TLabel;
    Label44: TLabel;
    Label43: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label33: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    DBRadioGroup5: TDBRadioGroup;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    RGPassword: TDBRadioGroup;
    RGCefalometrie: TDBRadioGroup;
    RGPrimanota: TDBRadioGroup;
    RGSegreteria: TDBRadioGroup;
    RGScadPass: TDBRadioGroup;
    RGScadAttiv: TDBRadioGroup;
    RGImportazione: TDBRadioGroup;
    RGMultiaziendale: TDBRadioGroup;
    RGConformita: TDBRadioGroup;
    RGExtFiles: TDBRadioGroup;
    RGContatti: TDBRadioGroup;
    RGFax: TDBRadioGroup;
    RGTesti: TDBRadioGroup;
    RGFattRiep: TDBRadioGroup;
    RFRifatturazione: TDBRadioGroup;
    RGBuoniConsegna: TDBRadioGroup;
    RGFattureRicFisc: TDBRadioGroup;
    RGOrdiniFornitori: TDBRadioGroup;
    RGRicevuteFiscali: TDBRadioGroup;
    RGFattureAcquisto: TDBRadioGroup;
    RGBolleEntrata: TDBRadioGroup;
    RGNoteCredito: TDBRadioGroup;
    RGFatture: TDBRadioGroup;
    RGDDT: TDBRadioGroup;
    RGSAL: TDBRadioGroup;
    RGOrdini: TDBRadioGroup;
    RGPreventivi: TDBRadioGroup;
    RGPratiche: TDBRadioGroup;
    RGArticoli: TDBRadioGroup;
    RGClienti: TDBRadioGroup;
    TabArticoli: TcxTabSheet;
    TabAgenda: TcxTabSheet;
    cxDBMemo1: TcxDBMemo;
    Label47: TLabel;
    cxDBMemo2: TcxDBMemo;
    Label48: TLabel;
    GridUtenti: TcxGrid;
    tvUtenti: TcxGridDBTableView;
    lvUtenti: TcxGridLevel;
    tvUtentiNomeUtente: TcxGridDBColumn;
    QuerySecurityID: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    ButtonAbilitaTutto: TcxButton;
    ButtonDisabilitaTutto: TcxButton;
    ButtonCopiaDa: TcxButton;
    cbCopiaDa: TcxComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEUserIDEnter(Sender: TObject);
    procedure DBEUserIDExit(Sender: TObject);
    procedure SBGridCancelClick(Sender: TObject);
    procedure SBGridOKClick(Sender: TObject);
    procedure SBUtenteCancelClick(Sender: TObject);
    procedure SBUtenteOKClick(Sender: TObject);
    procedure tvUtentiDblClick(Sender: TObject);
    procedure tvUtentiKeyPress(Sender: TObject; var Key: Char);
    procedure QuerySecurityBeforePost(DataSet: TDataSet);
    procedure ButtonAbilitaTuttoClick(Sender: TObject);
    procedure ButtonDisabilitaTuttoClick(Sender: TObject);
    procedure cbCopiaDaPropertiesInitPopup(Sender: TObject);
    procedure ButtonCopiaDaClick(Sender: TObject);
    procedure cbCopiaDaPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Mode:Byte;
  end;

var
  SecurityForm: TSecurityForm;

implementation

uses main, DataModule1;

{$R *.DFM}

procedure TSecurityForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
   SecurityForm := nil;
end;

procedure TSecurityForm.FormCreate(Sender: TObject);
begin
   // Posiziona e dimensione la finestra
   MainForm.StartFrame.PosizionaSottopannelli(Self);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Sicurezza)';
end;

procedure TSecurityForm.FormShow(Sender: TObject);
begin
   DM1.FocusRefresh;
   // Si sposta sulla prima pagina del PageControl
   cxPageControl1.ActivePage := TabPermessi;
   ScrollBoxPermessi.VertScrollBar.Position := 0;
   // Esegue la query per avere l'elenco degli utenti
   QuerySecurity.Open;

   // Imposta i colori dello sfondo della form
   PanelGrid.Color      := COLOR_LOGIN_OPZIONI;
   PanelGrid.Align      := alClient;
   PanelUtente.Color   := COLOR_LOGIN_OPZIONI;
   PanelUtente.Align   := alClient;

   case Mode of
      // Se si è in modalità CREA NUOVA AZIENDA
      // ------------------------------------------------------------------------------
      USERS_NUOVA: begin
         try
            PanelGrid.Visible := False;
            PanelUtente.Visible := True;
            PanelUtente.BringToFront;
            QuerySecurity.Append;
            DBEPassword.SetFocus;
            DBEUserID.SetFocus;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna alla modifica
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 Close;
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità MODIFICA
      // ------------------------------------------------------------------------------
      USERS_MODIFICA: begin
         PanelUtente.Visible := False;
         PanelGrid.Visible := True;
         PanelGrid.BringToFront;
         GridUtenti.SetFocus;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità ELIMINA
      // ------------------------------------------------------------------------------
      USERS_ELIMINA: begin
         PanelUtente.Visible := False;
         PanelGrid.Visible := True;
         PanelGrid.BringToFront;
         GridUtenti.SetFocus;
      end;
   end;
end;

procedure TSecurityForm.QuerySecurityBeforePost(DataSet: TDataSet);
begin
  // Se l'ID è nullo ne assegna uno nuovo
  if DataSet.FieldByName('ID').IsNull then
    DataSet.FieldByName('ID').Value := DM1.Generators_NextGenID('GEN_ID_SECURITY', True);
end;

procedure TSecurityForm.ButtonAbilitaTuttoClick(Sender: TObject);
var
  LItem: TDBRadioGroup;
  LValue: String;
  I: Integer;
begin
  for I := 0 to ComponentCount-1 do
  begin
    if not (Components[I] is TDBRadioGroup) then
      Continue;
    LItem := Components[I] as TDBRadioGroup;
    LValue := LItem.Values[LItem.Values.Count-1];
    QuerySecurity.FieldByName(LItem.DataField).Value := LValue;
  end;
end;

procedure TSecurityForm.ButtonCopiaDaClick(Sender: TObject);
var
  Q: TIBOQuery;
  I: Integer;
  LField: TStringField;
begin
  // Imposta la query che ricava la versione di file di aggiornamento
  // presente nel repository
  Q := TIBOQuery.Create(Self);
  try
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    Q.SQL.Add('SELECT * FROM SECURITY WHERE NOMEUTENTE = ' + QuotedStr(cbCopiaDa.Text));
    Q.Open;
    if Q.Eof then
      raise Exception.Create('Nessun utente selezionato!');
    for I := 0 to Q.FieldCount -1 do
    begin
      if not (Q.Fields[I] is TStringField) then
        Continue;
      LField := TStringField(Q.Fields[I]);
      if LField.Size = 1 then
        QuerySecurity.FieldByName(LField.FieldName).Value := LField.Value;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TSecurityForm.ButtonDisabilitaTuttoClick(Sender: TObject);
var
  LItem: TDBRadioGroup;
  I: Integer;
begin
  for I := 0 to ComponentCount-1 do
  begin
    if not (Components[I] is TDBRadioGroup) then
      Continue;
    LItem := Components[I] as TDBRadioGroup;
    QuerySecurity.FieldByName(LItem.DataField).Value := '0';
  end;
end;

procedure TSecurityForm.cbCopiaDaPropertiesChange(Sender: TObject);
begin
  ButtonCopiaDa.Enabled := Trim(cbCopiaDa.Text) <> '';
end;

procedure TSecurityForm.cbCopiaDaPropertiesInitPopup(Sender: TObject);
var
  Q: TIB_Cursor;
begin
  cbCopiaDa.Properties.Items.Clear;
  // Imposta la query che ricava la versione di file di aggiornamento
  // presente nel repository
  Q := TIB_Cursor.Create(Self);
  try
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    Q.SQL.Add('SELECT NOMEUTENTE FROM SECURITY');
    Q.Open;
    while not Q.Eof do
    begin
      cbCopiaDa.Properties.Items.Add(Q.Fields[0].AsString);
      Q.Next;
    end;
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TSecurityForm.DBEUserIDEnter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlEnter(Sender);
end;

procedure TSecurityForm.DBEUserIDExit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   DM1.ControlExit(Sender);
end;

procedure TSecurityForm.SBGridCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TSecurityForm.SBGridOKClick(Sender: TObject);
begin
   case Mode of
      // Se si è in modalità MODIFICA
      // ------------------------------------------------------------------------------
      USERS_MODIFICA: begin
         // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
         //  tutto a posto.
         try
            // Si sposta sulla prima pagina del PageControl
            cxPageControl1.ActivePage := TabPermessi;
            ScrollBoxPermessi.VertScrollBar.Position := 0;
            // Visualizza il Pannello
            PanelUtente.Visible := True;
            PanelUtente.BringToFront;
            // Abilita la modifica dei campi
            QuerySecurity.Edit;
            // Sposta il focus sul primo campo editabile
            DBEPassword.SetFocus;
            DBEUserID.SetFocus;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna al pannello precedente
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 PanelUtente.Visible := False;
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità ELIMINA
      // ------------------------------------------------------------------------------
      USERS_ELIMINA: begin
         try
            // Chiede prima conferma
            MessageBeep(0);
            if MessageDlg('Vuoi veramente eliminare l''utente?', mtWarning, [mbOk, mbNo], 0) = mrOk then begin
               // Elimina l'articolo corrente
               QuerySecurity.Delete;
               QuerySecurity.ApplyUpdates;
               QuerySecurity.CommitUpdates;
            end;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna al pannello precedente
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
   end;
end;

procedure TSecurityForm.SBUtenteCancelClick(Sender: TObject);
begin
   case Mode of
      // Se si è in modalità NUOVA AZIENDA
      // ------------------------------------------------------------------------------
      USERS_NUOVA: begin
         // Annulla gli eventuali inserimenti
         QuerySecurity.Cancel;
         QuerySecurity.CommitUpdates;
         // Esce direttamente dalla form
         Close;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità MODIFICA
      // ------------------------------------------------------------------------------
      USERS_MODIFICA: begin
         // Annulla gli eventuali inserimenti
         QuerySecurity.Cancel;
         QuerySecurity.CommitUpdates;
         // Esce dall'azienda per tornare all'elenco
         PanelUtente.Visible := False;
         // Focus sulla griglia
         GridUtenti.SetFocus;
      end;
      // ------------------------------------------------------------------------------
   end;
end;

procedure TSecurityForm.SBUtenteOKClick(Sender: TObject);
begin
   case Mode of
      // Se si è in modalità NUOVA AZIENDA
      // ------------------------------------------------------------------------------
      USERS_NUOVA: begin
         try
            // Applica le modifiche effettuate
            QuerySecurity.Post;
            QuerySecurity.ApplyUpdates;
            QuerySecurity.CommitUpdates;
            // Esce direttamente dalla form
            Close;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna alla modifica
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
      // Se si è in modalità MODIFICA
      // ------------------------------------------------------------------------------
      USERS_MODIFICA: begin
         try
            // Applica le modifiche effettuate
            QuerySecurity.Post;
            QuerySecurity.ApplyUpdates;
            QuerySecurity.CommitUpdates;
            // Torna al pannello precedente
            PanelUtente.Visible := False;
         except
            // Se si verifica un errore visualizza un messaggio e ritorna alla modifica
            on E: Exception do begin
                 MessageBeep(0);
                 MessageDlg(E.Message, mtError, [mbOK], 0);
                 QuerySecurity.Edit;
            end;
         end;
      end;
      // ------------------------------------------------------------------------------
   end;
end;

procedure TSecurityForm.tvUtentiDblClick(Sender: TObject);
begin
   if SBGridOK.Enabled then SBGridOKClick(Self);
end;

procedure TSecurityForm.tvUtentiKeyPress(Sender: TObject; var Key: Char);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if SBGridOK.Enabled then begin
      if key = Chr(13) then SBGridOKClick(Self);
   end;
end;

end.
