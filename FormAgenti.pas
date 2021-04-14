unit FormAgenti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLevanteListAnag, cxGraphics,
  cxEdit, DB, cxDBData, Menus, IBODataset,
  bmpPanel, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ExtCtrls, cxTextEdit, Mask, DBCtrls, StdCtrls, ComCtrls, IB_Components,
  cxContainer, cxMaskEdit, cxDropDownEdit, 
  cxDBLookupComboBox, cxDBEdit, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, Buttons, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon;

type
  TAgentiForm = class(TLevanteListAnagForm)
    QNOME: TStringField;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label4: TLabel;
    RichEdit1: TRichEdit;
    DBENome: TDBEdit;
    tvListNOME: TcxGridDBColumn;
    QSINCHRO: TStringField;
    QCODICE: TIntegerField;
    MenuStampe: TPopupMenu;
    Stampaetichettecliente1: TMenuItem;
    Label1: TLabel;
    DBEQualifica: TDBEdit;
    QQUALIFICA: TStringField;
    LabelLinkedToNome: TLabel;
    dbeLinkedToNome: TcxDBComboBox;
    QLINKEDTONOME: TStringField;
    tvListLINKEDTONOME: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QBeforePost(DataSet: TDataSet);
    procedure Stampaetichettecliente1Click(Sender: TObject);
    procedure RxSpeedButtonStampaClick(Sender: TObject);
    procedure RxSpeedButtonStampaMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject); override;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeLinkedToNomePropertiesInitPopup(Sender: TObject);
    procedure tvListLINKEDTONOMECustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure tvListLINKEDTONOMEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
  private
    AbilitaLinkedTo: Boolean;
    procedure SetNomeTabella;
    procedure CaricaLayout;
    procedure EnableDisableLinkedToFields;
    { Private declarations }
  public
    { Public declarations }
    IndiceTabella: String;
  end;

var
  AgentiForm: TAgentiForm;

implementation

uses DataModule1, Main, DataModule2, SchedaProgressivi;

{$R *.dfm}

procedure TAgentiForm.SetNomeTabella;
begin
  // Imposta la query
  Q.SQL.Clear;
  Q.SQL.Add('SELECT * FROM AGENTI' + IndiceTabella);
  // Imposta la query Insert
  Q.EditSQL[0] := 'UPDATE AGENTI' + IndiceTabella + ' SET';
  // Imposta la query Delete
  Q.DeleteSQL[0] := 'DELETE FROM AGENTI' + IndiceTabella;
end;

procedure TAgentiForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  AgentiForm := nil;
end;

procedure TAgentiForm.QBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Se il codice non c'è lo assegna automaticamente
  if Trim(Q.FieldByName('CODICE').AsString) = '' then begin
    Q.FieldByName('CODICE').Value := DM1.NextCodice(('AGENTI' + IndiceTabella), 'CODICE');
  end;
end;

procedure TAgentiForm.Stampaetichettecliente1Click(Sender: TObject);
var
   Qry: TIB_Cursor;
   Barcode:String;
begin
   DM1.Attendere;
   try
      // Svuota la tabella delle etichette
      DM2.SvuotaTabellaEtichette(IDX_ETICHETTA_SOGGETTO);
      // Costruisce il codice a barre
      Barcode := '#' + BARCODE_TIPOCODICE_AGENTE + DM1.PadR(Trim(QCODICE.AsString), '0', 4) + '#';
      // -----------------------------------------------------------------------------------------------------------------------------------
      // Crea la query e cicla per aggiungere a questa tutti gli articoli che servono
      Qry := TIB_Cursor.Create(Self);
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('INSERT INTO LABSOGG (CODICESTAZIONE, PROGRIGO, JOLLY1, JOLLY2, JOLLY3)');
      Qry.SQL.Add('VALUES (');
      Qry.SQL.Add('''' + DM1.CodiceUtente + ''',');
      Qry.SQL.Add('0,');
      Qry.SQL.Add('''' + Barcode + ''',');
      Qry.SQL.Add(QuotedStr(Uppercase(Trim(QNOME.AsString))) + ',');
      Qry.SQL.Add(QuotedStr(Uppercase(Trim(QQUALIFICA.AsString))));
      Qry.SQL.Add(')');
      Qry.ExecSQL;
      // -----------------------------------------------------------------------------------------------------------------------------------
      // Crea e avvia la form per la stampa delle etichette
      DM2.StampaEtichettaSilent((MenuStampe.Tag = 0), DM1.TableProgressiviDEFAULTLABELOPERATOREFILENAME.AsString, DM1.DefaultLabelPrinterName);
   finally
      DM1.ChiudiAttendere;
      if Assigned(Qry) then Qry.Free;
   end;
end;

procedure TAgentiForm.RxSpeedButtonStampaClick(Sender: TObject);
var
   ClientPoint, ScreenPoint: TPoint;
begin
   // Esegue la conversione delle coordinate dove dovrà apparire il menù
   //  da coordinate client della finestra a coordinate assolute dello schermo.
   //  (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
   ClientPoint.X  := RxSpeedButtonStampa.Left + POPUP_X_OFFSET + ClientTopPanel.Left;
   ClientPoint.Y  := RxSpeedButtonStampa.Top + POPUP_Y_OFFSET;
   ScreenPoint    := ClientToScreen(ClientPoint);
   // Imposta la proprietà TAG del menù (0=Anteprima, 1=Stampa, 2=Fax, 3=Email)
   MenuStampe.Tag := 1;
   MenuStampe.Popup(ScreenPoint.X, ScreenPoint.Y);
end;

procedure TAgentiForm.RxSpeedButtonStampaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   ClientPoint, ScreenPoint: TPoint;
begin
   // *************************************************************************
   //   NB: FACENDO CLICK COL DX RICHIAMA IL MENU' DI STAMPA
   // *************************************************************************
   if Button = mbRight then begin
      // Esegue la conversione delle coordinate dove dovrà apparire il menù
      //  da coordinate client della finestra a coordinate assolute dello schermo.
      //  (NB: Il menù popup apparirà in prossimità del tasto NUOVO)
      ClientPoint.X := RxSpeedButtonStampa.Left + POPUP_X_OFFSET + ClientTopPanel.Left;
      ClientPoint.Y := RxSpeedButtonStampa.Top + POPUP_Y_OFFSET;
      ScreenPoint   := ClientToScreen(ClientPoint);
      // Imposta la proprietà TAG del menù (0=Anteprima, 1=Stampa, 2=Fax, 3=Email)
      MenuStampe.Tag := 0;
      MenuStampe.Popup(ScreenPoint.X, ScreenPoint.Y);
   end;
end;

procedure TAgentiForm.RxSpeedButtonVisualizzaClick(Sender: TObject);
begin
  inherited;
   // Aggiorna lo stato dei pulsanti per la modalità Anagrafica
   RxSpeedButtonStampa.Enabled := True;
end;

procedure TAgentiForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
  // Risistema i pulsanti per la fase di elenco
  RxSpeedButtonStampa.Enabled := False;
end;

procedure TAgentiForm.RxSpeedModificaClick(Sender: TObject);
var
  MR: TModalResult;
begin
     // Se la query non è attiva esce
     if not Q.Active then begin
        RxSpeedModifica.Down := False;
        Exit;
     end;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     if RxSpeedModifica.Down then begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          Q.Edit;
          RxSpeedButtonUscita.Enabled    := False;
          RxSpeedButtonStampa.Enabled    := False;
          PanelGriglia.Enabled           := False;
          DM1.ColoraTuttiCampi(Self, COLOR_MODIFICA);
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
          Q.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
            // Se è attivata la gestione del LINKEDTO e non è stato
            //  specificato l'agente collegato non permette la conferma
            if AbilitaLinkedTo and (QLINKEDTONOME.AsString = '') then begin
              DM1.Messaggi('Levante', 'Il campo "Collegato a..." è obbligatorio!', '', [mbOk], 0, nil);
              RxSpeedModifica.Down := True;
              Exit;
            end;
            // Conferma le modifiche
            Q.Post;
            Q.CommitUpdates;
          end else if MR = mrNo then begin
            Q.Cancel;
            Q.CommitUpdates;
          end else begin
            RxSpeedModifica.Down := True;
            Exit;
          end;

          RxSpeedButtonUscita.Enabled := True;
          RxSpeedButtonStampa.Enabled := True;
          PanelGriglia.Enabled        := True;
          DM1.ColoraTuttiCampi(Self, COLOR_NORMALE);
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               Q.Edit;
          end;
       end;
     end;
end;

procedure TAgentiForm.FormShow(Sender: TObject);
begin
  CaricaLayout;
  SetNomeTabella;
  EnableDisableLinkedToFields;
  inherited;
end;


procedure TAgentiForm.CaricaLayout;
begin
  if IndiceTabella = '' then begin
    // Imposta il titolo della colonna del Nome del tecnico
    tvListNOME.Caption := DM1.AgentiMenuCaption;
    RichEdit1.Lines.Clear;
    RichEdit1.Lines.Add(DM1.GridsColumnAgenteCaption);
  end else if IndiceTabella = '2' then begin
    // Imposta il titolo della colonna del Nome del tecnico
    tvListNOME.Caption := DM1.Agenti2MenuCaption;
    RichEdit1.Lines.Clear;
    RichEdit1.Lines.Add(DM1.GridsColumnAgente2Caption);
  end else if IndiceTabella = '3' then begin
    // Imposta il titolo della colonna del Nome del tecnico
    tvListNOME.Caption := DM1.Agenti3MenuCaption;
    RichEdit1.Lines.Clear;
    RichEdit1.Lines.Add(DM1.GridsColumnAgente3Caption);
  end else if IndiceTabella = '4' then begin
    // Imposta il titolo della colonna del Nome del tecnico
    tvListNOME.Caption := DM1.Agenti4MenuCaption;
    RichEdit1.Lines.Clear;
    RichEdit1.Lines.Add(DM1.GridsColumnAgente4Caption);
  end;
end;


procedure TAgentiForm.EnableDisableLinkedToFields;
begin
  // Abilita o disabilita la parte di gestione dei LINKEDTONOME in base a come impostato
  AbilitaLinkedTo :=     (DM1.Agente2LinkedToAgente1 and (IndiceTabella = '2'))
                      or (DM1.Agente3LinkedToAgente2 and (IndiceTabella = '3'))
                      or (DM1.Agente4LinkedToAgente3 and (IndiceTabella = '4'));
  // Rende visibili o meno i campi
  LabelLinkedToNome.Visible := AbilitaLinkedTo;
  dbeLinkedToNome.Visible   := AbilitaLinkedTo;
end;


procedure TAgentiForm.dbeLinkedToNomePropertiesInitPopup(Sender: TObject);
var
   Qry : TIB_Cursor;
   NomeTabella: String;
begin
   // Determina il nome della tabella
   NomeTabella := 'AGENTI' + IntToStr(StrToInt(IndiceTabella)-1);
   if NomeTabella = 'AGENTI1' then
     NomeTabella := 'AGENTI';
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT NOME FROM ' + NomeTabella);
      Qry.Open;
      (Sender as TcxDBComboBox).Properties.Items.Clear;
      while not Qry.Eof do begin
         (Sender as TcxDBComboBox).Properties.Items.Add(Qry.Fields[0].AsString);
         Qry.Next;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TAgentiForm.tvListLINKEDTONOMECustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  // UN pò più in secondo piano
  ACanvas.Font.Color := clSilver;
end;

procedure TAgentiForm.tvListLINKEDTONOMEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  inherited;
  if not ARecord.IsData then Exit;
  if Trim(AText) <> '' then AText := '(' + AText + ')';
end;

procedure TAgentiForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  inherited;
  // Altrimenti rimane attivo
  RxSpeedButtonStampa.Enabled    := False;
end;

end.
