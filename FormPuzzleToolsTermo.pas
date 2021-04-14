unit FormPuzzleToolsTermo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormPuzzleTools, ImgList, cxContainer, cxEdit,
  IB_Components, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel,
  dxNavBar, cxPC, cxControls, ExtCtrls, bmpPanel, DB, cxCurrencyEdit,
  cxGraphics, cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses;

type
  TPuzzleToolsTermoForm = class(TPuzzleToolsForm)
    cxLabel46: TcxLabel;
    cxLabel47: TcxLabel;
    cxLabel48: TcxLabel;
    cxLabel49: TcxLabel;
    cxLabel50: TcxLabel;
    App_NumElementi: TcxComboBox;
    App_NumColonne: TcxComboBox;
    App_NumLivelliTemp: TcxComboBox;
    App_Interasse: TcxCurrencyEdit;
    App_SuperficieScambio: TcxCurrencyEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure App_NumElementiPropertiesInitPopup(Sender: TObject);
    procedure App_NumColonnePropertiesInitPopup(Sender: TObject);
    procedure App_NumLivelliTempPropertiesInitPopup(Sender: TObject);
    procedure App_NumLivelliTempKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  protected
    procedure UpdateAppFromPuzzleToolsToConform; Override;
  public
    { Public declarations }
    procedure CaricaDatiApparecchio(DS: TDataSet); Override;
  end;

var
  PuzzleToolsTermoForm: TPuzzleToolsTermoForm;

implementation

uses ClassPuzzleObject;

{$R *.dfm}

procedure TPuzzleToolsTermoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PuzzleToolsTermoForm := nil;
end;

procedure TPuzzleToolsTermoForm.App_NumElementiPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3NUMELEMENTI', 'A');
end;

procedure TPuzzleToolsTermoForm.App_NumColonnePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3NUMCOLONNE', 'A');
end;

procedure TPuzzleToolsTermoForm.App_NumLivelliTempPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3NUMLIVELLITEMPERATURA', 'A');
end;

procedure TPuzzleToolsTermoForm.CaricaDatiApparecchio(DS: TDataSet);
begin
  inherited;
  // Disabilita gli eventi OnChange nella form
  Self.OnChangeEventEnabled := False;
  try
    // Aggiorna i valori dei campi
    App_NumElementi.Text        := DS.FieldByName('S3NUMELEMENTI').AsString;
    App_NumColonne.Text         := DS.FieldByName('S3NUMCOLONNE').AsString;
    App_Interasse.Text          := DS.FieldByName('S3INTERASSE').AsString;
    App_SuperficieScambio.Text  := DS.FieldByName('S3SUPERFICIESCAMBIO').AsString;
    App_NumLivelliTemp.Text     := DS.FieldByName('S3NUMLIVELLITEMPERATURA').AsString;
  finally
    // Ripristina gli eventi OnChange nella form
    Self.OnChangeEventEnabled := True;
  end;
end;

procedure TPuzzleToolsTermoForm.App_NumLivelliTempKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  // Accetta solo in numeri
  if not (key in ['0'..'9', #8, #9]) then key:=#0;
end;



// Procedura che aggiorna i campi degli elementi attualmente selezionati
//  NB: OVERRIDE dall'antenato con in più alcuni campi
procedure TPuzzleToolsTermoForm.UpdateAppFromPuzzleToolsToConform;
var
  PrecPos: TBookmark;
  i: Integer;
  CurrPuzzleObject: TPuzzleObject;
  DS: TDataSet;
  IntValue, Code: Integer;
  RealValue: Double;
begin
//  Non ci deve essere l'inherited
//  Inherited;
  // Inizializzazione
  DS := DSApparecchi;
  // Salva la posisione attuale sul Dataset
  PrecPos := DS.GetBookmark;
  // Disabilita i controlli collegati al Dataset per una maggiore efficienza
  DS.DisableControls;
  try

    // =========================================================================
    //  PARTE MODIFICA ELEMENTI SELEZIONATI
    // -------------------------------------------------------------------------
    // Cicla per tutti gli oggetti del disegno selezionati
    for i := 0 to Puzzle.ActiveLayer.SelectedObjectsCount -1 do begin
      // Per comodità CurrPuzzleObject punta all'oggetto selezionato corrente
      CurrPuzzleObject := Puzzle.ActiveLayer.SelectedObjects[i];
      // Si posiziona sul record relativo
      DS.First;
      if not DS.Locate('S3RIF', CurrPuzzleObject.Riferimento, []) then raise Exception.Create('Oggetto da aggiornare non trovato.   (' + CurrPuzzleObject.Riferimento +  ')');
      // Pone il record in Edit mode
      DS.Edit;
      try
        // =====================================================================
        // Aggiorna i dati sul dataset
        // NB: Solo per quei campi che hanno Tag = 1
        // ---------------------------------------------------------------------
        // S3UBICAZIONE
        if App_Ubicazione.Tag = 1 then begin
          DS.FieldByName('S3UBICAZIONE').Value := App_Ubicazione.Text;
        end;
        // S3COMPONENTE
        if App_Componente.Tag = 1 then begin
          DS.FieldByName('S3COMPONENTE').Value := App_Componente.Text;
        end;
        // S3TIPO
        if App_Tipo.Tag = 1 then begin
          DS.FieldByName('S3TIPO').Value := App_Tipo.Text;
        end;
        // S3MODELLO
        if App_Modello.Tag = 1 then begin
          DS.FieldByName('S3MODELLO').Value := App_Modello.Text;
        end;
        // S3PORTATATERMICA
        // NB: Nel caso l'utente abbia messo un campo vuoto (cioè nemmeno zero, proprio vuoto)
        //      allora mette il campo a NULL altrimenti si vede lo zero ed è brutto
        if (App_Portata.Tag = 1) then begin
          if (Trim(App_Portata.Text) <> '')
          then DS.FieldByName('S3PORTATATERMICA').Value := App_Portata.Value
          else DS.FieldByName('S3PORTATATERMICA').Clear;
        end;
        // S3TIPOCOLLEGAMENTO
        if App_TipoCollegamento.Tag = 1 then begin
          DS.FieldByName('S3TIPOCOLLEGAMENTO').Value := App_TipoCollegamento.Text;
        end;
        // S3INSTALLATOINSTALLABILE
        if App_Installato.Tag = 1 then begin
          DS.FieldByName('S3INSTALLATOINSTALLABILE').Value := App_Installato.Text;
        end;

        // *** Elementi aggiounti per la sezione termo ***

        // S3NUMELEMENTI
        // Prima di salvare questo campo verifica che il suo contenuto sia valido
        if (App_NumElementi.Tag = 1) and (Trim(App_NumElementi.Text) <> '') then begin
          if (Trim(App_NumElementi.Text) <> '') then begin
            Val(Trim(App_NumElementi.Text), IntValue, Code);
            if Code <> 0 then raise Exception.Create('Dato non valido nel campo: NUMERO ELEMENTI.');
            DS.FieldByName('S3NUMELEMENTI').Value := IntValue;
          end else begin
            DS.FieldByName('S3NUMELEMENTI').Clear;
          end;
        end;
        // S3NUMCOLONNE
        // Prima di salvare questo campo verifica che il suo contenuto sia valido
        if (App_NumColonne.Tag = 1) then begin
          if (Trim(App_NumColonne.Text) <> '') then begin
            Val(Trim(App_NumColonne.Text), IntValue, Code);
            if Code <> 0 then raise Exception.Create('Dato non valido nel campo: NUMERO COLONNE.');
            DS.FieldByName('S3NUMCOLONNE').Value := IntValue;
          end else begin
            DS.FieldByName('S3NUMCOLONNE').Clear;
          end;
        end;
        // S3INTERASSE
        // NB: Nel caso l'utente abbia messo un campo vuoto (cioè nemmeno zero, proprio vuoto)
        //      allora mette il campo a NULL altrimenti si vede lo zero ed è brutto
        if (App_Interasse.Tag = 1) then begin
          if (Trim(App_Interasse.Text) <> '')
          then DS.FieldByName('S3INTERASSE').Value := App_Interasse.Value
          else DS.FieldByName('S3INTERASSE').Clear;
        end;
        // S3SUPERFICIESCAMBIO
        // NB: Nel caso l'utente abbia messo un campo vuoto (cioè nemmeno zero, proprio vuoto)
        //      allora mette il campo a NULL altrimenti si vede lo zero ed è brutto
        if (App_SuperficieScambio.Tag = 1) then begin
          if (Trim(App_SuperficieScambio.Text) <> '')
          then DS.FieldByName('S3SUPERFICIESCAMBIO').Value := App_SuperficieScambio.Value
          else DS.FieldByName('S3SUPERFICIESCAMBIO').Clear;
        end;
        // S3NUMLIVELLITEMPERATURA
        // Prima di salvare questo campo verifica che il suo contenuto sia valido
        if (App_NumLivelliTemp.Tag = 1) then begin
          if (Trim(App_NumLivelliTemp.Text) <> '') then begin
            Val(Trim(App_NumLivelliTemp.Text), IntValue, Code);
            if Code <> 0 then raise Exception.Create('Dato non valido nel campo: NUMERO LIVELLI DI TEMPERATURA.');
            DS.FieldByName('S3NUMLIVELLITEMPERATURA').Value := IntValue;
          end else begin
            DS.FieldByName('S3NUMLIVELLITEMPERATURA').Clear;
          end;
        end;

        // Esegue il post del record
        DS.Post;
      Except
        // Se qualcosa invece è andato storto elimina le modifiche
        DS.Cancel;
        raise;
      end;
    end;
    // =========================================================================

    // Ripristina la posizione precedente sul dataset
    DS.GotoBookmark(PrecPos);
  finally
    // Azzera la proprietà Tag di tutti i campi
    App_Ubicazione.Tag        := 0;
    App_Componente.Tag        := 0;
    App_Tipo.Tag              := 0;
    App_Modello.Tag           := 0;
    App_Portata.Tag           := 0;
    App_TipoCollegamento.Tag  := 0;
    App_Installato.Tag        := 0;
    App_NumElementi.Tag       := 0;
    App_NumColonne.Tag        := 0;
    App_Interasse.Tag         := 0;
    App_SuperficieScambio.Tag := 0;
    App_NumLivelliTemp.Tag    := 0;
    // Pulizie finali
    DS.FreeBookmark(PrecPos);
    // Riabilita i controlli associati al dataset
    DS.EnableControls;
  end;
end;


end.
