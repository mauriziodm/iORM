unit FormPuzzleTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormLeftSide, ExtCtrls, bmpPanel, dxNavBar,
  dxNavBarStyles, dxNavBarCollns, IB_Components, 
  cxPC, cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, DB, ImgList, ClassPuzzle,
  IBODataset, cxCurrencyEdit, cxGraphics, cxPCdxBarPopupMenu, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxBarBuiltInMenu,
  System.ImageList;

type
  TPuzzleToolsForm = class(TLeftSideForm)
    Q: TIB_Cursor;
    cxPageControl1: TcxPageControl;
    TabMaterialiApparecchi: TcxTabSheet;
    NavBarMateriali: TdxNavBar;
    TabMuri: TcxTabSheet;
    NavBarMuri: TdxNavBar;
    QMuri: TIB_Cursor;
    QMatApp: TIB_Cursor;
    ImageListPerDimensionare: TImageList;
    TabDatiMateriali: TcxTabSheet;
    TabDatiApparecchi: TcxTabSheet;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel31: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel33: TcxLabel;
    cxLabel34: TcxLabel;
    cxLabel35: TcxLabel;
    Mat_Riferimento: TcxTextEdit;
    Mat_Ubicazione: TcxComboBox;
    Mat_Componente: TcxComboBox;
    Mat_Materiale: TcxComboBox;
    Mat_Diametro: TcxComboBox;
    Mat_Installazione: TcxComboBox;
    Mat_Certificazione: TcxComboBox;
    cxLabel36: TcxLabel;
    cxLabel37: TcxLabel;
    cxLabel38: TcxLabel;
    cxLabel39: TcxLabel;
    cxLabel40: TcxLabel;
    cxLabel41: TcxLabel;
    cxLabel42: TcxLabel;
    cxLabel43: TcxLabel;
    cxLabel44: TcxLabel;
    App_Riferimento: TcxTextEdit;
    App_Ubicazione: TcxComboBox;
    App_Componente: TcxComboBox;
    cxLabel45: TcxLabel;
    App_Tipo: TcxComboBox;
    App_Modello: TcxComboBox;
    App_TipoCollegamento: TcxComboBox;
    App_Installato: TcxComboBox;
    App_Ventilazione: TcxComboBox;
    App_Scarico: TcxComboBox;
    Mat_Qta: TcxCurrencyEdit;
    Mat_Lunghezza: TcxCurrencyEdit;
    App_Portata: TcxCurrencyEdit;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NavBarMaterialiLinkClick(Sender: TObject; ALink: TdxNavBarItemLink);
    procedure cxPageControl1Change(Sender: TObject);
    procedure TabDatiMaterialiOldExit(Sender: TObject);
    procedure TabDatiApparecchiOldExit(Sender: TObject);
    procedure Mat_UbicazionePropertiesInitPopup(Sender: TObject);
    procedure Mat_ComponentePropertiesInitPopup(Sender: TObject);
    procedure Mat_MaterialePropertiesInitPopup(Sender: TObject);
    procedure Mat_DiametroPropertiesInitPopup(Sender: TObject);
    procedure Mat_InstallazionePropertiesInitPopup(Sender: TObject);
    procedure Mat_CertificazionePropertiesInitPopup(Sender: TObject);
    procedure App_UbicazionePropertiesInitPopup(Sender: TObject);
    procedure App_ComponentePropertiesInitPopup(Sender: TObject);
    procedure App_TipoPropertiesInitPopup(Sender: TObject);
    procedure App_ModelloPropertiesInitPopup(Sender: TObject);
    procedure App_PortataPropertiesInitPopup(Sender: TObject);
    procedure App_TipoCollegamentoPropertiesInitPopup(Sender: TObject);
    procedure App_InstallatoPropertiesInitPopup(Sender: TObject);
    procedure App_VentilazionePropertiesInitPopup(Sender: TObject);
    procedure App_ScaricoPropertiesInitPopup(Sender: TObject);
    procedure App_PortataKeyPress(Sender: TObject; var Key: Char);
    procedure App_UbicazionePropertiesEditValueChanged(Sender: TObject);
    procedure Mat_UbicazionePropertiesEditValueChanged(Sender: TObject);
  private
    FSezione: String;  // Contiene la sezione
    FPuzzle: TPuzzle;  // Punta al Puzzle relativo
    FDSApparecchi: TIBOQuery;
    FDSMateriali: TIBOQuery;
    fOnChangeEventEnabled: Boolean;
    procedure CaricaMaterialiApparecchi;
    procedure CaricaMuri;
    procedure CaricaMaterialiApparecchiElenco(DS:TDataset; NBGroup:TdxNavBarGroup);
    { Private declarations }
  protected
    procedure LoadComboBoxItems(CB: TcxComboBox; FieldName, MapApp: String);
    procedure UpdateAppFromPuzzleToolsToConform; Virtual;
    procedure UpdateMatFromPuzzleToolsToConform; Virtual;
  public
    { Public declarations }
    property OnChangeEventEnabled : Boolean read fOnChangeEventEnabled write fOnChangeEventEnabled;
    property Sezione:String read FSezione write FSezione;
    property Puzzle:TPuzzle read FPuzzle write FPuzzle;
    property DSApparecchi: TIBOQuery read FDSApparecchi write FDSApparecchi;
    property DSMateriali: TIBOQuery read FDSMateriali write FDSMateriali;
    procedure CaricaMaterialiApparecchiGiaInElenco;
    procedure CaricaTuttiGliElementi;
    procedure CaricaDatiMateriale(DS: TDataSet); Virtual;
    procedure CaricaDatiApparecchio(DS: TDataSet); Virtual;
  end;

var
  PuzzleToolsForm: TPuzzleToolsForm;

implementation

uses DataModule1, FormConformita, ClassPuzzleLayer, ClassPuzzleObject, StrUtils;

{$R *.dfm}


// Procedura che aggiorna i dati dell'elemento selezionato
procedure TPuzzleToolsForm.CaricaDatiMateriale(DS:TDataSet);
begin
  // Disabilita gli eventi OnChange nella form
  Self.OnChangeEventEnabled := False;
  try
    // Aggiorna i valori dei campi
    Mat_Riferimento.Text      := DS.FieldByName('S3RIF').AsString;
    Mat_Ubicazione.Text       := DS.FieldByName('S3UBICAZIONE').AsString;
    Mat_Componente.Text       := DS.FieldByName('S3COMPONENTE').AsString;
    Mat_Materiale.Text        := DS.FieldByName('S3MATERIALE').AsString;
    Mat_Qta.Text              := DS.FieldByName('S3QTA').AsString;
    Mat_Diametro.Text         := DS.FieldByName('S3DIAMETRO').AsString;
    Mat_Lunghezza.Text        := DS.FieldByName('S3LUNGHEZZA').AsString;
    Mat_Installazione.Text    := DS.FieldByName('S3INSTALLAZIONE').AsString;
    Mat_Certificazione.Text   := DS.FieldByName('S3CERTIFICAZIONE').AsString;
  finally
    // Ripristina gli eventi OnChange nella form
    Self.OnChangeEventEnabled := True;
  end;
end;

// Procedura che aggiorna i dati dell'elemento selezionato
procedure TPuzzleToolsForm.CaricaDatiApparecchio(DS:TDataSet);
begin
  // Disabilita gli eventi OnChange nella form
  Self.OnChangeEventEnabled := False;
  try
    // Aggiorna i valori dei campi
    App_Riferimento.Text      := DS.FieldByName('S3RIF').AsString;
    App_Ubicazione.Text       := DS.FieldByName('S3UBICAZIONE').AsString;
    App_Componente.Text       := DS.FieldByName('S3COMPONENTE').AsString;
    App_Tipo.Text             := DS.FieldByName('S3TIPO').AsString;
    App_Modello.Text          := DS.FieldByName('S3MODELLO').AsString;
    App_Portata.Text          := DS.FieldByName('S3PORTATATERMICA').AsString;
    App_TipoCollegamento.Text := DS.FieldByName('S3TIPOCOLLEGAMENTO').AsString;
    App_Installato.Text       := DS.FieldByName('S3INSTALLATOINSTALLABILE').AsString;
    App_Ventilazione.Text     := DS.FieldByName('S3VENTILAZIONE').AsString;
    App_Scarico.Text          := DS.FieldByName('S3SCARICO').AsString;
  finally
    // Ripristina gli eventi OnChange nella form
    Self.OnChangeEventEnabled := True;
  end;
end;




procedure TPuzzleToolsForm.FormResize(Sender: TObject);
begin
  inherited;
  cxPageControl1.Left := 10;
  cxPageControl1.Top := 95;
  cxPageControl1.Width := Self.Width - 17;
  cxPageControl1.Height := Self.Height - 25;
end;



procedure TPuzzleToolsForm.CaricaMaterialiApparecchiGiaInElenco;
var
  CurrentGroup:TdxNavBarGroup;
  CurrentItem:TdxNavBarItem;
  i: Smallint;
  GroupPresent:Boolean;
begin
  // ===========================================================================
  // Carica i materiali e gli apparecchi nel pannello di selezione
  // ---------------------------------------------------------------------------
  // Inizializzazione
  GroupPresent := False;
  // Verifica se c'è già il gruppo *** ELENCHI ***
  for i := 0 to NavBarMateriali.Groups.Count -1 do begin
    if NavBarMateriali.Groups[i].Caption = '*** ELENCHI ***' then begin
      CurrentGroup := NavBarMateriali.Groups[i];
      GroupPresent := True;
    end;
  end;
  // Se il gruppo *** ELENCHI *** esiste già lo ripulisce altrimenti lo crea nuovo.
  if GroupPresent then begin
    // Distrugge tutte le items relative al gruppo precedentemente esistenti
    while CurrentGroup.LinkCount > 0 do CurrentGroup.Links[CurrentGroup.LinkCount-1].Free;
    // Distrugge tutti i links relativi al gruppo (dovrebbero essere già spariti
    //  eliminando tutte le items ma per sicurezza li elimino di nuovo)
    CurrentGroup.ClearLinks;
  // Se il gruppo non c'è ancora lo crea
  end else begin
    CurrentGroup := NavBarMateriali.Groups.Add;
    CurrentGroup.Caption := '*** ELENCHI ***';
  end;
  // Crea sempre come prima voce la voce SELEZIONA
  CurrentItem := NavBarMateriali.Items.Add;
  CurrentItem.Caption := 'Selezione';
  CurrentItem.Hint := '<SELECTOR>';
  CurrentGroup.CreateLink(CurrentItem);
  // Carica gli Apparecchi già presenti in elenco ma non nel disegno
  CaricaMaterialiApparecchiElenco(DSApparecchi, CurrentGroup);
  // Carica i Materiali già presenti in elenco ma non nel disegno
  CaricaMaterialiApparecchiElenco(DSMateriali, CurrentGroup);
  // ===========================================================================
end;

procedure TPuzzleToolsForm.CaricaMaterialiApparecchiElenco(DS:TDataset; NBGroup:TdxNavBarGroup);
var
  CurrentItem:TdxNavBarItem;
  PrecPos:TBookmark;
begin
  // ===========================================================================
  // Carica gli Apparecchi e i Materiali presenti negli elenchi ma non nel disegno
  // ---------------------------------------------------------------------------
  // Memorizza la posizione
  DS.DisableControls;
  PrecPos := DS.GetBookmark;
  // Si posiziona all'inizio
  DS.First;
  try
    // Cicla per tutti gli apparecchi/materiali contenuto nel dataset dell'elenco
    while not DS.Eof do begin
      // Carica solo quello che hanno il riferimento che comincia con la 'X'.
      if LeftStr(DS.FieldByName('S3RIF').AsString, 1) = 'X' then begin
        // IMposta e apre la query che contiene i dati del Materiale/apparecchio necessari e
        //  mancanti negli elenchi.
        if QMatApp.Active then QMatApp.Close;
        QMatApp.ParamValues['P_DESCRIZIONE'] := DS.FieldByName('S3COMPONENTE').AsString;
        QMatApp.ParamValues['P_SEZIONE'] := FSezione;
        if not QMatApp.Prepared then QMatApp.Prepare;
        QMatApp.Open;
        if not QMatApp.Eof then begin
          // Crea la nuova voce e la linka al grupop corrente
          CurrentItem := NavBarMateriali.Items.Add;
          CurrentItem.Caption := QMatApp.FieldByName('DESCRIZIONE').AsString + ' (' + DS.FieldByName('S3RIF').AsString + ')';
          // Compone il contenuto della proprietà Hint dove memorizza i seguenti dati:
          //  - MaterialeApparecchio: Indica se l'oggetto fa parte dei materiali o degli apparecchi
          //  - Tipo di componente: 0 = Apparecchio o materiale normale; 1 = Tubo
          //  - RifLetter: Lettera da usare per il riferimento degli oggetti del disegno
          //  - Nome della prima Bitmap (Componenti normali e tubi)
          //  - Nome della secodna Bitmap (Solo tubi)
          CurrentItem.Hint := QMatApp.FieldByName('MATERIALEAPPARECCHIO').AsString;
          CurrentItem.Hint := CurrentItem.Hint + ';' + QMatApp.FieldByName('TIPO').AsString;
          CurrentItem.Hint := CurrentItem.Hint + ';' + QMatApp.FieldByName('RIFLETTER').AsString;
          CurrentItem.Hint := CurrentItem.Hint + ';' + DM1.PuzzleDir + QMatApp.FieldByName('BITMAPFILENAME').AsString;
          if Trim(QMatApp.FieldByName('BITMAPFILENAME').AsString) <> '' then CurrentItem.Hint := CurrentItem.Hint + ';' + Trim(DM1.PuzzleDir + QMatApp.FieldByName('BITMAPFILENAME2').AsString);
          NBGroup.CreateLink(CurrentItem);
        end;
      end;
      // Avanti il prossimo
      DS.Next;
    end;
  finally
    // Ripristina tutto
    QMatApp.Close;
    DS.GotoBookmark(PrecPos);
    DS.FreeBookmark(PrecPos);
    DS.EnableControls;
  end;
end;

procedure TPuzzleToolsForm.CaricaMaterialiApparecchi;
var
  CurrentGroupName:String;
  CurrentGroup:TdxNavBarGroup;
  CurrentItem:TdxNavBarItem;
  CurrentLink: TdxNavBarItemLink;
begin
  // ===========================================================================
  // Carica i materiali e gli apparecchi nel pannello di selezione
  // ---------------------------------------------------------------------------
  // Inizializzazione
  CurrentGroupName := '###';
  // Apre la query con l'elenco dei materiali e degli apparecchi
  if Q.Active then Q.Close;
  Q.ParamByName('P_SEZIONE').AsString := FSezione;
  Q.Open;
  try
    // Svuota tutto
    NavBarMateriali.Items.Clear;
    NavBarMateriali.Groups.Clear;
    // Cicla per tutti i records
    while not Q.Eof do begin
      // Se il gruppo della voce attuale è diverso dal gruppo della voce precedente
      //  crea un nuovo gruppo
      if Q.FieldByName('CATEGORIA').AsString <> CurrentGroupName then begin
        CurrentGroupName := Q.FieldByName('CATEGORIA').AsString;
        CurrentGroup := NavBarMateriali.Groups.Add;
        CurrentGroup.Caption := CurrentGroupName;
        CurrentGroup.UseSmallImages := True;
        CurrentGroup.LinksUseSmallImages := True;
        // Crea sempre come prima voce la voce SELEZIONA
        CurrentItem := NavBarMateriali.Items.Add;
        CurrentItem.Caption := 'Selezione';
        CurrentItem.Hint := '<SELECTOR>';
        CurrentGroup.CreateLink(CurrentItem);
      end;
      // Crea la nuova voce e la linka al grupop corrente
      CurrentItem := NavBarMateriali.Items.Add;
      CurrentItem.Caption := Q.FieldByName('DESCRIZIONE').AsString;
      // Compone il contenuto della proprietà Hint dove memorizza i seguenti dati:
      //  - MaterialeApparecchio: Indica se l'oggetto fa parte dei materiali o degli apparecchi
      //  - Tipo di componente: 0 = Apparecchio o materiale normale; 1 = Tubo
      //  - RifLetter: Lettera da usare per il riferimento degli oggetti del disegno
      //  - Nome della prima Bitmap (Componenti normali e tubi)
      //  - Nome della secodna Bitmap (Solo tubi)
      CurrentItem.Hint := Q.FieldByName('MATERIALEAPPARECCHIO').AsString;
      CurrentItem.Hint := CurrentItem.Hint + ';' + Q.FieldByName('TIPO').AsString;
      CurrentItem.Hint := CurrentItem.Hint + ';' + Q.FieldByName('RIFLETTER').AsString;
      CurrentItem.Hint := CurrentItem.Hint + ';' + DM1.PuzzleDir + Q.FieldByName('BITMAPFILENAME').AsString;
      if Trim(Q.FieldByName('BITMAPFILENAME').AsString) <> '' then CurrentItem.Hint := CurrentItem.Hint + ';' + Trim(DM1.PuzzleDir + Q.FieldByName('BITMAPFILENAME2').AsString);
      CurrentLink := CurrentGroup.CreateLink(CurrentItem);
      // Avanti il prossimo
      Q.Next;
    end;
  finally
    Q.Close;
  end;
  // ===========================================================================
end;

procedure TPuzzleToolsForm.CaricaMuri;
var
  CurrentGroupName:String;
  CurrentGroup:TdxNavBarGroup;
  CurrentItem:TdxNavBarItem;
begin
  // ===========================================================================
  // Carica i muri nel pannello di selezione
  // ---------------------------------------------------------------------------
  // Inizializzazione
  CurrentGroupName := '###';
  // Apre la query con l'elenco dei materiali e degli apparecchi
  if QMuri.Active then QMuri.Close;
  // NB: HO FATTO IN MODO CHE TUTTE LE SEZIONI CARICHINO I COMPONENTI
  //      DEL LAYER MURI DELLA SEZIONE GAS, ALTRIMENTI BISOGNAVA DUPLICARLI
  //      PER OGNI SEZIONE.
  //  QMuri.ParamByName('P_SEZIONE').AsString := FSezione;
  QMuri.ParamByName('P_SEZIONE').AsString := 'GAS';
  QMuri.Open;
  try
    // Svuota tutto
    NavBarMuri.Items.Clear;
    NavBarMuri.Groups.Clear;
    // Cicla per tutti i records
    while not QMuri.Eof do begin
      // Se il gruppo della voce attuale è diverso dal gruppo della voce precedente
      //  crea un nuovo gruppo
      if QMuri.FieldByName('CATEGORIA').AsString <> CurrentGroupName then begin
        CurrentGroupName := QMuri.FieldByName('CATEGORIA').AsString;
        CurrentGroup := NavBarMuri.Groups.Add;
        CurrentGroup.Caption := CurrentGroupName;
        CurrentGroup.UseSmallImages := True;
        CurrentGroup.LinksUseSmallImages := True;
        // Crea sempre come prima voce la voce SELEZIONA
        CurrentItem := NavBarMuri.Items.Add;
        CurrentItem.Caption := 'Selezione';
        CurrentItem.Hint := '<SELECTOR>';
        CurrentGroup.CreateLink(CurrentItem);
        // Se si tratta della categoria "Etichette" aggiunge anche
        //  la voce "Testo libero"
        if CurrentGroupName = 'Etichette' then begin
          CurrentItem := NavBarMuri.Items.Add;
          CurrentItem.Caption := 'Testo libero';
          // Compone il contenuto della proprietà Hint dove memorizza i seguenti dati:
          //  - MaterialeApparecchio: Indica se l'oggetto fa parte dei materiali o degli apparecchi
          //  - Tipo di componente: 0 = Apparecchio o materiale normale; 1 = Tubo
          //  - RifLetter: Lettera da usare per il riferimento degli oggetti del disegno
          //  - Nome della prima Bitmap (Componenti normali e tubi)
          //  - Nome della secodna Bitmap (Solo tubi)
          CurrentItem.Hint := 'W';
          CurrentItem.Hint := CurrentItem.Hint + ';' + '2';  // Tipo 2 = Testo Libero
          CurrentItem.Hint := CurrentItem.Hint + ';' + 'W';
          CurrentItem.Hint := CurrentItem.Hint + ';' + '';   // Nessuna Bitmap
          // Aggiunge all'elenco la voce appena creata
          CurrentGroup.CreateLink(CurrentItem);
        end;
      end;
      // Crea la nuova voce e la linka al grupop corrente
      CurrentItem := NavBarMuri.Items.Add;
      CurrentItem.Caption := QMuri.FieldByName('DESCRIZIONE').AsString;
      // Compone il contenuto della proprietà Hint dove memorizza i seguenti dati:
      //  - MaterialeApparecchio: Indica se l'oggetto fa parte dei materiali o degli apparecchi
      //  - Tipo di componente: 0 = Apparecchio o materiale normale; 1 = Tubo
      //  - RifLetter: Lettera da usare per il riferimento degli oggetti del disegno
      //  - Nome della prima Bitmap (Componenti normali e tubi)
      //  - Nome della secodna Bitmap (Solo tubi)
      CurrentItem.Hint := QMuri.FieldByName('MATERIALEAPPARECCHIO').AsString;
      CurrentItem.Hint := CurrentItem.Hint + ';' + QMuri.FieldByName('TIPO').AsString;
      CurrentItem.Hint := CurrentItem.Hint + ';' + QMuri.FieldByName('RIFLETTER').AsString;
      CurrentItem.Hint := CurrentItem.Hint + ';' + DM1.PuzzleDir + QMuri.FieldByName('BITMAPFILENAME').AsString;
      if Trim(QMuri.FieldByName('BITMAPFILENAME').AsString) <> '' then CurrentItem.Hint := CurrentItem.Hint + ';' + Trim(DM1.PuzzleDir + QMuri.FieldByName('BITMAPFILENAME2').AsString);
      CurrentGroup.CreateLink(CurrentItem);
      // Avanti il prossimo
      QMuri.Next;
    end;
  finally
    QMuri.Close;
  end;
  // ===========================================================================
end;


procedure TPuzzleToolsForm.CaricaTuttiGliElementi;
begin
  // CArica gli strumenti
  CaricaMaterialiApparecchi;
  CaricaMaterialiApparecchiGiaInElenco;
  CaricaMuri;
end;

procedure TPuzzleToolsForm.FormCreate(Sender: TObject);
begin
  inherited;
  // Inizializzazione
  OnChangeEventEnabled := True;
  // Imposta la pagina dei materiali/apparecchi visibile
  cxPageControl1.ActivePage := TabMaterialiApparecchi;
end;

procedure TPuzzleToolsForm.NavBarMaterialiLinkClick(Sender: TObject;
  ALink: TdxNavBarItemLink);
var
  SL: TStrings;
  Descrizione, BmpFileName, BmpFileName2, RifLetter, Riferim, MaterialeApparecchio: String;
  Tipo, ParPos: Byte;
begin
  inherited;
  // Crea la stringlist che conterrà le varie informazioni contenute nella proprietà
  //  Hint dell'elemento.
  SL := TStringList.Create;
  try
    // Se si è selezionato la modalità di Selezione..
    if Alink.Item.Hint = '<SELECTOR>' then begin
      // Imposta le proprietà del prossimo oggetto da inserire ed esce
      Puzzle.SetNextPuzzleObject(ALink.Item.Caption, '<SELECTOR>', '', '', 0, '');
      Exit;
    end;
    // Imposta il carattere delimitatore
    SL.Delimiter := ';';
    // Carica la riga corrente nella StringList
    SL.DelimitedText := ALink.Item.Hint;
    // Imposta le variabili che verranno passate come parametri
    BmpFileName := '';
    BmpFileName2 := '';
    Tipo := 0;
    if SL.Count > 0 then MaterialeApparecchio := SL.Strings[0];
    if SL.Count > 1 then Tipo := StrToInt(SL.Strings[1]);
    if SL.Count > 2 then RifLetter := SL.Strings[2];
    if SL.Count > 3 then BmpFileName := SL.Strings[3];
    if SL.Count > 4 then BmpFileName2 := SL.Strings[4];
    // Se la Caption del link della NavBar contiene un Riferimento tra parentesi che comibcia
    //  con la X ne estrae la Descrizione dell'oggetto selezionato e il riferimento e imposta
    //  le apposite variabili che poi vengono passate alla funzione di selezione con i valori ottenuti,
    ParPos := Pos('(', ALink.Item.Caption);
    if ParPos <> 0 then begin
      Descrizione := Trim(LeftStr(ALink.Item.Caption, ParPos-1));
      Riferim := Copy(ALink.Item.Caption, ParPos+1, Length(ALink.Item.Caption)-ParPos-1);
    end else begin
      Descrizione := ALink.Item.Caption;
      Riferim := '';
    end;
    // IMposta le proprietà dell'oggetto selezionato, cioè il prossimo ad essere inserito
    //  nel disegno
    Puzzle.SetNextPuzzleObject(Descrizione, BmpFileName, BmpFileName2, MaterialeApparecchio, Tipo, RifLetter, Riferim);
  finally
    SL.Free;
  end;
end;

{
procedure TPuzzleToolsForm.cxPageControl1Change(Sender: TObject);
begin
  inherited;
  // In base al Tab selezionato imposta il Layer corrente
  if cxPageControl1.ActivePage = TabMaterialiApparecchi then begin

    if Assigned(Puzzle) then begin
      try
        // Visualizza un messaggio di attesa quando si passa da un layer all'altro
        if Puzzle.ActiveLayer.Name = 'LayerMuri' then DM1.ShowWait('Levante', 'Elaborazione in corso...');
        // Effettua il cambio di PuzzleLayer attivo
        Puzzle.ActiveLayer := Puzzle.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
      finally
        // Pulizie
        DM1.CloseWait;
      end;
    end;

  end else if cxPageControl1.ActivePage = TabMuri then begin

    if Assigned(Puzzle) then begin
      try
        // Visualizza un messaggio di attesa quando si passa da un layer all'altro
        if Puzzle.ActiveLayer.Name = 'LayerMaterialiApparecchi' then DM1.ShowWait('Levante', 'Elaborazione in corso...');
        // Effettua il cambio di PuzzleLayer attivo
        if Assigned(Puzzle) then Puzzle.ActiveLayer := Puzzle.FindComponent('LayerMuri') as TPuzzleLayer;
      finally
        // Pulizie
        DM1.CloseWait;
      end;
    end;

  end;
  // Se la form della conformità non è più quella con il focus (ad es: perchè
  //  l'operatore si è spostato su una proprietà dell'oggetto per cambiarla nel pannello
  //  laterale del disegno) provvede a reimpostarla come attiva, altrimenti non funzionano
  //  più alcune cose come ad es: la rotazione dell'oggetto attualmente selezionato in quanto
  //  non essendo più la form selezionata non riceve gli eventi di gestione della rotellina del mouase ad esempio.
  if not ConformitaForm.Active then ConformitaForm.SetFocus;
end;
}
procedure TPuzzleToolsForm.cxPageControl1Change(Sender: TObject);
begin
  inherited;
  // In base al Tab selezionato imposta il Layer corrente
  if cxPageControl1.ActivePage = TabMaterialiApparecchi then begin

    if Assigned(Puzzle) then begin
      try
        // Visualizza un messaggio di attesa quando si passa da un layer all'altro
        if Puzzle.ActiveLayer.Name = 'LayerMuri' then begin
          DM1.ShowWait('Levante', 'Elaborazione in corso...');
          // Annulla l'eventuale selezione delprossimo oggetto da inserire perchè
          //  altrimenti rimaneva attiva anche nel nuovo layer e questo creava problemi
          //  tipo oggetti dei muri che finivano nel LayerMateriali/Apparecchi e viceversa.
          //  NB: La prima voce di un gruppo è sempre il <SELECTOR>
          NavBarMuri.ActiveGroup.Links[0].Selected := True;
          NavBarMaterialiLinkClick(NavBarMuri, NavBarMuri.ActiveGroup.Links[0]);
        end;
        // Effettua il cambio di PuzzleLayer attivo
        Puzzle.ActiveLayer := Puzzle.FindComponent('LayerMaterialiApparecchi') as TPuzzleLayer;
      finally
        // Pulizie
        DM1.CloseWait;
      end;
    end;

  end else if cxPageControl1.ActivePage = TabMuri then begin

    if Assigned(Puzzle) then begin
      try
        // Visualizza un messaggio di attesa quando si passa da un layer all'altro
        if Puzzle.ActiveLayer.Name = 'LayerMaterialiApparecchi' then begin
          DM1.ShowWait('Levante', 'Elaborazione in corso...');
          // Annulla l'eventuale selezione delprossimo oggetto da inserire perchè
          //  altrimenti rimaneva attiva anche nel nuovo layer e questo creava problemi
          //  tipo oggetti dei muri che finivano nel LayerMateriali/Apparecchi e viceversa.
          //  NB: La prima voce di un gruppo è sempre il <SELECTOR>
          NavBarMateriali.ActiveGroup.Links[0].Selected := True;
          NavBarMaterialiLinkClick(NavBarMateriali, NavBarMateriali.ActiveGroup.Links[0]);
        end;
        // Effettua il cambio di PuzzleLayer attivo
        if Assigned(Puzzle) then Puzzle.ActiveLayer := Puzzle.FindComponent('LayerMuri') as TPuzzleLayer;
      finally
        // Pulizie
        DM1.CloseWait;
      end;
    end;

  end;
  // Se la form della conformità non è più quella con il focus (ad es: perchè
  //  l'operatore si è spostato su una proprietà dell'oggetto per cambiarla nel pannello
  //  laterale del disegno) provvede a reimpostarla come attiva, altrimenti non funzionano
  //  più alcune cose come ad es: la rotazione dell'oggetto attualmente selezionato in quanto
  //  non essendo più la form selezionata non riceve gli eventi di gestione della rotellina del mouase ad esempio.
  if not ConformitaForm.Active then ConformitaForm.SetFocus;
end;


procedure TPuzzleToolsForm.TabDatiMaterialiOldExit(Sender: TObject);
begin
  inherited;
  // Quando la form perde il focus è perchè di solito l'utente è tornato
  //  ad operare sul disegno o altro, in questo caso forza il Post del Dataset
  //  collegato altrimenti in alcuni casi il dato andava perso.
  if DSMateriali.State <> dsBrowse then begin
    DSMateriali.Post;
  end;
end;

procedure TPuzzleToolsForm.TabDatiApparecchiOldExit(Sender: TObject);
begin
  inherited;
  // Quando la form perde il focus è perchè di solito l'utente è tornato
  //  ad operare sul disegno o altro, in questo caso forza il Post del Dataset
  //  collegato altrimenti in alcuni casi il dato andava perso.
  if DSApparecchi.State <> dsBrowse then begin
    DSApparecchi.Post;
  end;
end;



// Procedura che carica le voci nel ComboBox
procedure TPuzzleToolsForm.LoadComboBoxItems(CB:TcxComboBox; FieldName:String; MapApp:String);
var
   Qry : TIB_Cursor;
begin
  inherited;
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT DISTINCT(' + FieldName + ') FROM RIGHIPRV WHERE S3MATERIALEAPPARECCHIO = ''' + MapApp + '''');
      Qry.Open;
      with (CB.Properties as TcxComboBoxProperties) do begin
        Items.Clear;
        Items.Add('');
        while not Qry.Eof do begin
           Items.Add(Qry.Fields[0].AsString);
           Qry.Next;
        end;
      end;
   finally
      Qry.Free;
   end;
end;


procedure TPuzzleToolsForm.Mat_UbicazionePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3UBICAZIONE', 'M');
end;

procedure TPuzzleToolsForm.Mat_ComponentePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3COMPONENTE', 'M');
end;

procedure TPuzzleToolsForm.Mat_MaterialePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3MATERIALE', 'M');
end;

procedure TPuzzleToolsForm.Mat_DiametroPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3DIAMETRO', 'M');
end;

procedure TPuzzleToolsForm.Mat_InstallazionePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3INSTALLAZIONE', 'M');
end;

procedure TPuzzleToolsForm.Mat_CertificazionePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3CERTIFICAZIONE', 'M');
end;

procedure TPuzzleToolsForm.App_UbicazionePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3UBICAZIONE', 'A');
end;

procedure TPuzzleToolsForm.App_ComponentePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3COMPONENTE', 'A');
end;

procedure TPuzzleToolsForm.App_TipoPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3TIPO', 'A');
end;

procedure TPuzzleToolsForm.App_ModelloPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3MODELLO', 'A');
end;

procedure TPuzzleToolsForm.App_PortataPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3PORTATATERMICA', 'A');
end;

procedure TPuzzleToolsForm.App_TipoCollegamentoPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3TIPOCOLLEGAMENTO', 'A');
end;

procedure TPuzzleToolsForm.App_InstallatoPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3INSTALLATOINSTALLABILE', 'A');
end;

procedure TPuzzleToolsForm.App_VentilazionePropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3VENTILAZIONE', 'A');
end;

procedure TPuzzleToolsForm.App_ScaricoPropertiesInitPopup(Sender: TObject);
begin
  inherited;
  // Carica le voci del COmboBox
  LoadComboBoxItems((Sender as TcxComboBox), 'S3SCARICO', 'A');
end;

procedure TPuzzleToolsForm.App_PortataKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  // Accetta solo in numeri
  if not (key in ['0'..'9', #8, #9, '.', ',']) then key:=#0;
end;

procedure TPuzzleToolsForm.App_UbicazionePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  // Se il gestore di evento è abilitato
  if not OnChangeEventEnabled then Exit;
  // Procede con l'aggiornamento degli elementi selezionati
  // NB: Ho sostituito la finestra di attesa richiamata da ShowWait perchè causava dei problemi
  //     quindi NON RIMETTERLA ASSOLUTAMENTE.
  DM1.Attendere;
  try
    // Imposta la propetà Tag del controllo a 1 per segnalare che è lui il campo modificato
    //  in modo che poi venga aggiornato solo quel campo per tutti gli oggetti selezionati
    (Sender as TControl).Tag := 1;
    // Procedura che effettua l'aggiornamento degli oggetti selezionati e solo per i controlli
    //  marcati con la proprietà Tag = 1
    UpdateAppFromPuzzleToolsToConform;
  finally
    DM1.ChiudiAttendere;
  end;
end;



// Procedura che aggiorna i campi degli elementi attualmente selezionati
procedure TPuzzleToolsForm.UpdateAppFromPuzzleToolsToConform;
var
  PrecPos: TBookmark;
  i: Integer;
  CurrPuzzleObject: TPuzzleObject;
  DS: TDataSet;
  IntValue, Code: Integer;
  RealValue: Double;
begin
  inherited;
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
        // S3VENTILAZIONE
        if App_Ventilazione.Tag = 1 then begin
          DS.FieldByName('S3VENTILAZIONE').Value := App_Ventilazione.Text;
        end;
        // S3SCARICO
        if App_Scarico.Tag = 1 then begin
          DS.FieldByName('S3SCARICO').Value := App_Scarico.Text;
        end;
        // Esegue il post del record
        DS.Post;
      except
        // Se qualcosa invece è andato storto elimina le modifiche
        DS.Cancel;
        raise;
      end;
    end;
    // Azzera la proprietà Tag di tutti i campi
    App_Ubicazione.Tag        := 0;
    App_Componente.Tag        := 0;
    App_Tipo.Tag              := 0;
    App_Modello.Tag           := 0;
    App_Portata.Tag           := 0;
    App_TipoCollegamento.Tag  := 0;
    App_Installato.Tag        := 0;
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
    // Pulizie finali
    DS.FreeBookmark(PrecPos);
    // Riabilita i controlli associati al dataset
    DS.EnableControls;
  end;
end;


// Procedura che aggiorna i campi degli elementi attualmente selezionati
procedure TPuzzleToolsForm.UpdateMatFromPuzzleToolsToConform;
var
  PrecPos: TBookmark;
  i: Integer;
  CurrPuzzleObject: TPuzzleObject;
  DS: TDataSet;
  IntValue, Code: Integer;
  RealValue: Double;
begin
  inherited;
  // Inizializzazione
  DS := DSMateriali;
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
        if Mat_Ubicazione.Tag = 1 then begin
          DS.FieldByName('S3UBICAZIONE').Value := Mat_Ubicazione.Text;
        end;
        // S3COMPONENTE
        if Mat_Componente.Tag = 1 then begin
          DS.FieldByName('S3COMPONENTE').Value := Mat_Componente.Text;
        end;
        // S3MATERIALE
        if Mat_Materiale.Tag = 1 then begin
          DS.FieldByName('S3MATERIALE').Value := Mat_Materiale.Text;
        end;
        // S3QTA
        // NB: Nel caso l'utente abbia messo un campo vuoto (cioè nemmeno zero, proprio vuoto)
        //      allora mette il campo a NULL altrimenti si vede lo zero ed è brutto
        if (Mat_Qta.Tag = 1) then begin
          if (Trim(Mat_Qta.Text) <> '')
          then DS.FieldByName('S3QTA').Value := Mat_Qta.Value
          else DS.FieldByName('S3QTA').Clear;
        end;
        // S3DIAMETRO
        if Mat_Diametro.Tag = 1 then begin
          DS.FieldByName('S3DIAMETRO').Value := Mat_Diametro.Text;
        end;
        // S3LUNGHEZZA
        // NB: Nel caso l'utente abbia messo un campo vuoto (cioè nemmeno zero, proprio vuoto)
        //      allora mette il campo a NULL altrimenti si vede lo zero ed è brutto
        if (Mat_Lunghezza.Tag = 1) then begin
          if (Trim(Mat_Lunghezza.Text) <> '')
          then DS.FieldByName('S3LUNGHEZZA').Value := Mat_Lunghezza.Value
          else DS.FieldByName('S3LUNGHEZZA').Clear;
        end;
        // S3INSTALLAZIONE
        if Mat_Installazione.Tag = 1 then begin
          DS.FieldByName('S3INSTALLAZIONE').Value := Mat_Installazione.Text;
        end;
        // S3CERTIFICAZIONE
        if Mat_Certificazione.Tag = 1 then begin
          DS.FieldByName('S3CERTIFICAZIONE').Value := Mat_Certificazione.Text;
        end;
        // =====================================================================

        // Esegue il post del record
        DS.Post;
      except
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
    Mat_Ubicazione.Tag      := 0;
    Mat_Componente.Tag      := 0;
    Mat_Materiale.Tag       := 0;
    Mat_Qta.Tag             := 0;
    Mat_Diametro.Tag        := 0;
    Mat_Lunghezza.Tag       := 0;
    Mat_Installazione.Tag   := 0;
    Mat_Certificazione.Tag  := 0;
    // Pulizie finali
    DS.FreeBookmark(PrecPos);
    // Riabilita i controlli associati al dataset
    DS.EnableControls;
  end;
end;


procedure TPuzzleToolsForm.Mat_UbicazionePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  // Se il gestore di evento è abilitato
  if not OnChangeEventEnabled then Exit;
  // Procede con l'aggiornamento degli elementi selezionati
  // NB: Ho sostituito la finestra di attesa richiamata da ShowWait perchè causava dei problemi
  //     quindi NON RIMETTERLA ASSOLUTAMENTE.
  DM1.Attendere;
  try
    // Imposta la propetà Tag del controllo a 1 per segnalare che è lui il campo modificato
    //  in modo che poi venga aggiornato solo quel campo per tutti gli oggetti selezionati
    (Sender as TControl).Tag := 1;
    // Procedura che effettua l'aggiornamento degli oggetti selezionati e solo per i controlli
    //  marcati con la proprietà Tag = 1
    UpdateMatFromPuzzleToolsToConform;
  finally
    DM1.ChiudiAttendere; 
  end;
end;

end.

