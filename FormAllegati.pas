unit FormAllegati;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxStyles, cxGraphics, cxFilter,
  cxEdit, DB, cxDBData, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridCardView, cxGridDBCardView, cxClasses,
  cxGridLevel, cxGrid, IBODataset, IB_Components, cxTextEdit, cxMemo, DataModule1,
  cxNavigator, cxDBNavigator, ExtCtrls, cxButtonEdit, FormFileAllegatoModificato,
  ImgList, cxSplitter, ComCtrls, Buttons, cxContainer, Menus,
  cxCheckBox, cxCustomData, cxData, cxDataStorage, cxLookAndFeels,
  cxLookAndFeelPainters, cxGridCustomLayoutView, dxDateRanges,
  dxScrollbarAnnotations, cxImageList, System.ImageList, ZLIBArchive;

const
  BTN_IMPORT_FILE_INDEX = 0;
  BTN_EXPORT_FILE_INDEX = 1;
  BTN_OPEN_FILE_INDEX = 2;
  BTN_ALARM_EDIT_INDEX = 3;

  DEFAULT_PA_ALLEGA = 'F';

type

  // Questa variabile indica il modo di visualizzazione della form
  //  i modi modi possibili sono: amDocumento, amSoggetto, amPratica, amExtFile
  TAllegatiMode = (amNormal, amExtFile);

  TAllegatiForm = class(TForm)
    TransAllegati: TIB_Transaction;
    QryAllegati: TIBOQuery;
    SourceAllegati: TDataSource;
    QryAllegatiNUMPROT: TIntegerField;
    QryAllegatiREVPROT: TIntegerField;
    QryAllegatiANNOPROT: TStringField;
    QryAllegatiTIPODOC: TStringField;
    QryAllegatiNUMDOC: TIntegerField;
    QryAllegatiREGDOC: TStringField;
    QryAllegatiDATADOC: TDateTimeField;
    QryAllegatiALL_DOCUMENTO: TStringField;
    QryAllegatiCODSOGG: TIntegerField;
    QryAllegatiALL_SOGGETTO: TStringField;
    QryAllegatiCODPRAT: TIntegerField;
    QryAllegatiDATAPRAT: TDateTimeField;
    QryAllegatiALL_RIFPRATICA: TStringField;
    QryAllegatiNOTE: TStringField;
    QryAllegatiFILE_EXT: TStringField;
    QryAllegatiFILE_NAME: TStringField;
    QryAllegatiCREAZ_OPERATORE: TStringField;
    QryAllegatiCREAZ_DATAORA: TDateTimeField;
    QryAllegatiTRACK_CREAZIONE: TStringField;
    QryAllegatiULTMOD_OPERATORE: TStringField;
    QryAllegatiULTMOD_DATAORA: TDateTimeField;
    QryAllegatiTRACK_ULTIMAMODIFICA: TStringField;
    QryAllegatiDOC_SOGGETTO: TStringField;
    QryAllegatiDOC_RIFPRATICA: TStringField;
    QryAllegatiFULLPROT: TStringField;
    PanelTop: TPanel;
    dbNavAppend: TcxDBNavigator;
    qNewAll: TIB_Cursor;
    qFilePresent: TIB_Cursor;
    qGetAll: TIB_Cursor;
    Shape1: TShape;
    QryAllegatiFILE_BLOB_PRESENT: TStringField;
    ImageListForScreen: TImageList;
    dbNavRefresh: TcxDBNavigator;
    dbNavDelete: TcxDBNavigator;
    PanelFilters1: TPanel;
    sbFilterSoggetto: TSpeedButton;
    sbFilterPratica: TSpeedButton;
    sbFilterDocumento: TSpeedButton;
    Shape2: TShape;
    Shape3: TShape;
    PanelTrova: TPanel;
    Shape4: TShape;
    Shape5: TShape;
    eFilterTrova: TcxTextEdit;
    Label1: TLabel;
    PanelCancel: TPanel;
    sbResetFilter: TBitBtn;
    sbFilterNulla: TSpeedButton;
    QryAllegatiALARM_DATAORA: TDateTimeField;
    QryAllegatiALARM_FATTO: TStringField;
    PanelAlarm: TPanel;
    Shape6: TShape;
    Shape7: TShape;
    sbAlarm: TSpeedButton;
    QryRefresh: TIB_Cursor;
    ExtFilesMenu: TPopupMenu;
    Modello1: TMenuItem;
    QryAllegatiPA_ALLEGA: TStringField;
    QryExtPrg: TIBOQuery;
    QryExtPrgDESCRIZIONE: TStringField;
    QryExtPrgESTENSIONE: TStringField;
    QryExtPrgBLANKFILE: TBlobField;
    cxImageList1: TcxImageList;
    SaveDialog1: TSaveDialog;
    sbFilterArticolo: TSpeedButton;
    QryAllegatiCODICEARTICOLO: TStringField;
    GridAllegati: TcxGrid;
    cvAllegati: TcxGridDBCardView;
    cvAllegatiFULLPROT: TcxGridDBCardViewRow;
    cvAllegatiPA_ALLEGA: TcxGridDBCardViewRow;
    cvAllegatiNOTE: TcxGridDBCardViewRow;
    cvAllegatiCategory1: TcxGridDBCardViewRow;
    cvAllegatiFILE_EXT: TcxGridDBCardViewRow;
    cvAllegatiFILE_NAME: TcxGridDBCardViewRow;
    cvAllegatiALL_SOGGETTO: TcxGridDBCardViewRow;
    cvAllegatiALL_RIFPRATICA: TcxGridDBCardViewRow;
    cvAllegatiALL_DOCUMENTO: TcxGridDBCardViewRow;
    cvAllegatiTRACK_ULTIMAMODIFICA: TcxGridDBCardViewRow;
    cvAllegatiTRACK_CREAZIONE: TcxGridDBCardViewRow;
    cvAllegatiCREAZ_OPERATORE: TcxGridDBCardViewRow;
    cvAllegatiCREAZ_DATAORA: TcxGridDBCardViewRow;
    cvAllegatiULTMOD_OPERATORE: TcxGridDBCardViewRow;
    cvAllegatiULTMOD_DATAORA: TcxGridDBCardViewRow;
    cvAllegatiDOC_SOGGETTO: TcxGridDBCardViewRow;
    cvAllegatiDOC_RIFPRATICA: TcxGridDBCardViewRow;
    cvAllegatiNUMPROT: TcxGridDBCardViewRow;
    cvAllegatiANNOPROT: TcxGridDBCardViewRow;
    cvAllegatiTIPODOC: TcxGridDBCardViewRow;
    cvAllegatiNUMDOC: TcxGridDBCardViewRow;
    cvAllegatiREGDOC: TcxGridDBCardViewRow;
    cvAllegatiDATADOC: TcxGridDBCardViewRow;
    cvAllegatiCODSOGG: TcxGridDBCardViewRow;
    cvAllegatiCODPRAT: TcxGridDBCardViewRow;
    cvAllegatiDATAPRAT: TcxGridDBCardViewRow;
    cvAllegatiREVPROT: TcxGridDBCardViewRow;
    cvAllegatiFILE_BLOB_PRESENT: TcxGridDBCardViewRow;
    cvAllegatiALARM_DATAORA: TcxGridDBCardViewRow;
    cvAllegatiALARM_FATTO: TcxGridDBCardViewRow;
    lvAllegatiCard: TcxGridLevel;
    cvAllegatiCODICEARTICOLO: TcxGridDBCardViewRow;
    QryAllegatiALL_ARTICOLO: TStringField;
    cvAllegatiALL_ARTICOLO: TcxGridDBCardViewRow;
    ZLB1: TZLBArchive;
    procedure FormCreate(Sender: TObject);
    procedure EseguiQuery(AutoOpenClose:Boolean=True);
    procedure AzzeraFiltri;
    procedure QryAllegatiBeforePost(DataSet: TDataSet);
    procedure QryAllegatiAfterPost(DataSet: TDataSet);
    procedure cvAllegatiCategory1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cvAllegatiCategory1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormResize(Sender: TObject);
    procedure cvAllegatiEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure cvAllegatiDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cvAllegatiDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure GridAllegatiDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure cvAllegatiFULLPROTGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cvAllegatiFULLPROTGetCellHint(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord;
      ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
      var AHintText: TCaption; var AIsHintMultiLine: Boolean;
      var AHintTextRect: TRect);
    procedure eFilterTrovaPropertiesChange(Sender: TObject);
    procedure ImpostaFiltri;
    procedure sbFilterSoggettoClick(Sender: TObject);
    procedure sbResetFilterClick(Sender: TObject);
    procedure sbAlarmClick(Sender: TObject);
    procedure cvAllegatiDataControllerDataChanged(Sender: TObject);
    procedure cvAllegatiEditing(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; var AAllow: Boolean);
    procedure LinkedAllegatiForm_Update(Refresh:Boolean=False);
    procedure QryAllegatiAfterDelete(DataSet: TDataSet);
    procedure QryAllegatiAfterOpen(DataSet: TDataSet);
    procedure QryAllegatiAfterRefresh(DataSet: TDataSet);
    procedure Modello1Click(Sender: TObject);
    procedure ExtFilesMenuPopup(Sender: TObject);
    procedure QryAllegatiAfterInsert(DataSet: TDataSet);
  private
    // Mantiene il collegamento alla WindowsProcedure originale della
    originalPanelWindowProc : TWndMethod;

    fSplitter: TcxSplitter;
    fPrecSplitter: TcxSplitter;
    fPrecAllegatiForm: TAllegatiForm;
    fPrecAllegatiFormIndex: Integer;
    fLinkedAllegatiForm: TallegatiForm;
    fUpdatingFromLinkedAllegatiForm: Boolean;
    procedure AggiornaDatiSoggPratDoc;
    procedure CaricaNuovoFileAllegato(Anno: String; Prot, RevProt: Integer);
    procedure PutFileNameOnDatabase(Anno: String; Prot, RevProt: Integer; FullPathFilename:String);
    function BlobEsistente(Anno: String; Prot, RevProt: Integer): Boolean;
    procedure OpenFileAndWait(Anno: String; Prot, RevProt: Integer; OriginalFileName: String);
    function EliminaProtocolloDaNomeFile(NomeFile: String): String;
    procedure DuplicaAllegato(AnnoProt: String; NumProt, RevProt: Integer; NuovaRevisione, DuplicaAncheFile:Boolean; FullPathFileAllegato: String);
    function FileModificatoCosaFare: TModFileMode;
    procedure EsportaAllegato(Anno: String; NumProt, RevProt: Integer);
    procedure EsportaAllegatiSelezionati;
    procedure ImportaAllegatiSelezionati;
    procedure EliminaAllegatoDallaBacheca(Anno: String; NumProt, RevProt: Integer);
    procedure GridAllegatiWindowProc(var Msg: TMessage);
    procedure GridAllegatiFileDrop(var Msg: TWMDROPFILES);
    procedure CreaAllegatoDaFile(FullPathFileName: String);
    procedure SetSplitter(const Value: TcxSplitter);
    procedure AggiornaAllegatiCount(Forza:Boolean=False);
    function RefreshBeforeEdit: Boolean;
    procedure SetLinkedAllegatiForm(const Value: TallegatiForm);
    procedure CaricaSubMenuExtDoc;
    { Private declarations }
  public
    { Public declarations }
    // Questa variabile indica il modo di visualizzazione della form
    //  i modi modi possibili sono: amDocumento, amSoggetto, amPratica, amExtFile
    Mode: TAllegatiMode;
    // Filtri di ricerca per gli allegati
    Filter_CodiceArticolo: String;
    Filter_CodSogg: Integer;
    Filter_CodPrat: Integer;
    Filter_DataPrat: TDate;
    Filter_TipoDoc: String;
    Filter_RegDoc: String;
    Filter_NumDoc: Integer;
    Filter_DataDoc: TDate;

    property Splitter:TcxSplitter read fSplitter write SetSplitter;
    property PrecSplitter:TcxSplitter read fPrecSplitter write fPrecSplitter;
    property PrecAllegatiForm:TAllegatiForm read fPrecAllegatiForm write fPrecAllegatiForm;
    property PrecAllegatiFormIndex:Integer read fPrecAllegatiFormIndex write fPrecAllegatiFormIndex;
    property LinkedAllegatiForm:TallegatiForm read fLinkedAllegatiForm write SetLinkedAllegatiForm;

    // Proprietà che indica (True) che la formALlegati attuale è in updating da un'altra
    //  FormAllegati a cui è linkata
    property UpdatingFromLinkedAllegatiForm:Boolean read fUpdatingFromLinkedAllegatiForm write fUpdatingFromLinkedAllegatiForm;

    procedure SplitterAllegatiMoved(Sender: TObject);
    function GetFileFromDatabase(Anno: String; Prot, RevProt: Integer; OriginalFileName:String): String;
    procedure ExportFileFromDatabase(Anno: String; Prot, RevProt: Integer);

    class function NextProt(Anno:String): Integer;
    class function NextRevProt(Anno: String; Prot: Integer): Longint;
  end;

var
  AllegatiForm: TAllegatiForm;

implementation

uses StrUtils, main, ShellApi, Types, FormAllegatiAlarm, System.DateUtils;

{$R *.dfm}


// Funzione che calcola e ritorna un nuovo numero di protocollo per un nuovo
//  allegato.
class function  TAllegatiForm.NextProt(Anno:String):Integer;
var
   Qry : TIB_Cursor;
begin
   // Query che restituirà l'ultimo numero usato
   Qry := TIB_Cursor.Create(nil);
   try
     Qry.DatabaseName := DM1.ArcDBFile;
     Qry.IB_Connection := DM1.DBAzienda;
     Qry.SQL.Add('SELECT COALESCE(MAX(NUMPROT),0) FROM ALLEGATI');
     Qry.SQL.Add('WHERE ANNOPROT = ' + QuotedStr(Anno)   );
     Qry.Open;
     Result := Qry.Fields[0].AsInteger + 1;
     Qry.Close;
   finally
     Qry.Free;
   end;
end;

// Funzione che calcola e ritorna una nuova revisione di protocollo per un nuovo
//  allegato.
class function  TAllegatiForm.NextRevProt(Anno:String; Prot:Integer):Longint;
var
   Qry : TIB_Cursor;
begin
   // Query che restituirà l'ultimo numero usato
   Qry := TIB_Cursor.Create(nil);
   try
     Qry.DatabaseName := DM1.ArcDBFile;
     Qry.IB_Connection := DM1.DBAzienda;
     Qry.SQL.Add('SELECT COALESCE(MAX(REVPROT),0) FROM ALLEGATI');
     Qry.SQL.Add('WHERE ANNOPROT = ' + QuotedStr(Anno)   );
     Qry.SQL.Add('  AND NUMPROT  = ' + IntToStr(Prot)   );
     Qry.Open;
     Result := Qry.Fields[0].AsInteger + 1;
     Qry.Close;
   finally
     Qry.Free;
   end;
end;



// Procedura che effettua la ricerca in base ai filtri impostati
procedure TAllegatiForm.AzzeraFiltri;
begin
  Filter_CodSogg  := 0;
  Filter_CodPrat  := 0;
  Filter_DataPrat := 0;
  Filter_TipoDoc  := '';
  Filter_RegDoc   := '';
  Filter_NumDoc   := 0;
  Filter_DataDoc  := 0;
  Filter_CodiceArticolo := '';
end;

procedure TAllegatiForm.ImpostaFiltri;
begin
  // DOCUMENTO
  // NB: Nel caso del filtro per documento l'Intervento è un caso particolare per il quale non si deve tener conto della data del documento.
  if (Filter_TipoDoc <> '') and (Filter_NumDoc <> 0) and ((Filter_DataDoc <> 0) or (Filter_TipoDoc='Intervento')) then begin
    sbFilterDocumento.Down  := DM1.AllDocumento_FiltroDoc;
    sbFilterPratica.Down    := DM1.AllDocumento_FiltroPrat;
    sbFilterSoggetto.Down   := DM1.AllDocumento_FiltroSogg;
    sbFilterArticolo.Down   := DM1.AllDocumento_FiltroArticolo;
    sbFilterNulla.Down      := DM1.AllDocumento_FiltroNulla;
  // PRATICA
  end else if (Filter_CodPrat <> 0) and (Filter_DataPrat <> 0) then begin
    sbFilterDocumento.Down  := DM1.AllPratica_FiltroDoc;
    sbFilterPratica.Down    := DM1.AllPratica_FiltroPrat;
    sbFilterSoggetto.Down   := DM1.AllPratica_FiltroSogg;
    sbFilterArticolo.Down   := DM1.AllPratica_FiltroArticolo;
    sbFilterNulla.Down      := DM1.AllPratica_FiltroNulla;
  // SOGGETTO
  end else if (Filter_CodSogg <> 0) then begin
    sbFilterDocumento.Down  := DM1.AllSoggetto_FiltroDoc;
    sbFilterPratica.Down    := DM1.AllSoggetto_FiltroPrat;
    sbFilterSoggetto.Down   := DM1.AllSoggetto_FiltroSogg;
    sbFilterArticolo.Down   := DM1.AllSoggetto_FiltroArticolo;
    sbFilterNulla.Down      := DM1.AllSoggetto_FiltroNulla;
  // ARTICOLO
  end else if (Filter_CodiceArticolo <> '') then begin
    sbFilterDocumento.Down  := DM1.AllArticolo_FiltroDoc;
    sbFilterPratica.Down    := DM1.AllArticolo_FiltroPrat;
    sbFilterSoggetto.Down   := DM1.AllArticolo_FiltroSogg;
    sbFilterArticolo.Down   := DM1.AllArticolo_FiltroArticolo;
    sbFilterNulla.Down      := DM1.AllArticolo_FiltroNulla;
  // NULLA
  end else begin
    sbFilterDocumento.Down  := DM1.AllNulla_FiltroDoc;
    sbFilterPratica.Down    := DM1.AllNulla_FiltroPrat;
    sbFilterSoggetto.Down   := DM1.AllNulla_FiltroSogg;
    sbFilterArticolo.Down   := DM1.AllNulla_FiltroArticolo;
    sbFilterNulla.Down      := DM1.AllNulla_FiltroNulla;
  end;
end;



procedure TAllegatiForm.EseguiQuery(AutoOpenClose:Boolean=True);
var
  WhereCond: TStrings;
begin
  // Se la query è aperta, la chiude
  if QryAllegati.Active then QryAllegati.Close;

  // Inizializzazione
  WhereCond := TStringList.Create;
  try
    // =========================================================================
    // FILTRI PER DOCUMENTO
    // -------------------------------------------------------------------------
    // Se si è scelto di visualizzare gli allegati relativi a un documento...
    if sbFilterDocumento.Down then begin
      if WhereCond.Count > 0 then WhereCond.Add('OR');
      WhereCond.Add('(');
      WhereCond.Add('  A.TIPODOC IS NOT NULL');
      if Filter_TipoDoc <> ''   then WhereCond.Add('  AND A.TIPODOC = ' + QuotedStr(Filter_TipoDoc));
      if Filter_RegDoc <> ''    then WhereCond.Add('  AND A.REGDOC  = ' + QuotedStr(Filter_RegDoc));
      if Filter_NumDoc <> 0     then WhereCond.Add('  AND A.NUMDOC  = ' + IntToStr(Filter_NumDoc));
      if Filter_DataDoc <> 0    then WhereCond.Add('  AND A.DATADOC = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Filter_DataDoc)));
      if Filter_CodPrat <> 0    then WhereCond.Add('  AND A.CODPRAT  = ' + IntToStr(Filter_CodPrat));
      if Filter_DataPrat <> 0   then WhereCond.Add('  AND A.DATAPRAT = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Filter_DataPrat)));
      if Filter_CodSogg <> 0    then WhereCond.Add('  AND A.CODSOGG = ' + IntToStr(Filter_CodSogg));
      WhereCond.Add(')');
    end;
    // =========================================================================

    // =========================================================================
    // FILTRI PER PRATICA
    // -------------------------------------------------------------------------
    // Se si è scelto di visualizzare gli allegati relativi a un documento...
    if sbFilterPratica.Down
    and (not (   (Filter_TipoDoc <> '') and (Filter_CodPrat = 0)   ))  // Questa riga fa in modo che se sono in un documento senza pratica e chiedo di visualizzare gli allegati delle pratiche non mi visualizza gli allegati delle altre pratiche.
    then begin
      if WhereCond.Count > 0 then WhereCond.Add('OR');
      WhereCond.Add('(');
      WhereCond.Add('  A.CODPRAT IS NOT NULL');
      if Filter_CodPrat <> 0  then WhereCond.Add('  AND A.CODPRAT  = ' + IntToStr(Filter_CodPrat));
      if Filter_DataPrat <> 0 then WhereCond.Add('  AND A.DATAPRAT = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', Filter_DataPrat)));
      if Filter_CodSogg <> 0  then WhereCond.Add('  AND A.CODSOGG = ' + IntToStr(Filter_CodSogg));
      if (not sbFilterDocumento.Down) or (Filter_TipoDoc <> '') then WhereCond.Add('  AND A.TIPODOC IS NULL');
      WhereCond.Add(')');
    end;
    // =========================================================================

    // =========================================================================
    // FILTRI PER SOGGETTO
    // -------------------------------------------------------------------------
    // Se si è scelto di visualizzare gli allegati relativi a un documento...
    if sbFilterSoggetto.Down
    and (not (   (Filter_TipoDoc <> '') and (Filter_CodSogg = 0)   ))  // Questa riga fa in modo che se sono in un documento senza pratica e chiedo di visualizzare gli allegati delle pratiche non mi visualizza gli allegati delle altre pratiche.
    and (not (   (Filter_CodPrat <> 0) and (Filter_CodSogg = 0)   ))   // Questa riga fa in modo che se sono in un documento senza pratica e chiedo di visualizzare gli allegati delle pratiche non mi visualizza gli allegati delle altre pratiche.
    then begin
      if WhereCond.Count > 0 then WhereCond.Add('OR');
      WhereCond.Add('(');
      WhereCond.Add('  A.CODSOGG IS NOT NULL');
      if Filter_CodSogg <> 0  then WhereCond.Add('  AND A.CODSOGG = ' + IntToStr(Filter_CodSogg));
      if (not sbFilterPratica.Down)   or (Filter_CodPrat <> 0)  then WhereCond.Add('  AND A.CODPRAT IS NULL');
      if (not sbFilterDocumento.Down) or (Filter_TipoDoc <> '') then WhereCond.Add('  AND A.TIPODOC IS NULL');
      WhereCond.Add(')');
    end;
    // =========================================================================

    // =========================================================================
    // FILTRI PER ARTICOLO
    // -------------------------------------------------------------------------
    // Se si è scelto di visualizzare gli allegati relativi a un documento...
    if sbFilterArticolo.Down then begin
      if WhereCond.Count > 0 then WhereCond.Add('OR');
      WhereCond.Add('(');
      WhereCond.Add('  A.CODICEARTICOLO IS NOT NULL');
      if Filter_CodiceArticolo <> '' then WhereCond.Add('  AND A.CODICEARTICOLO = ' + QuotedStr(Filter_CodiceArticolo));
      WhereCond.Add(')');
    end;
    // =========================================================================

    // =========================================================================
    // FILTRI PER NULLA
    // -------------------------------------------------------------------------
    // Se si è scelto di visualizzare gli allegati relativi a un documento...
    if sbFilterNulla.Down then begin
      if WhereCond.Count > 0 then WhereCond.Add('OR');
      WhereCond.Add('(');
      WhereCond.Add('      A.CODSOGG IS NULL');
      WhereCond.Add('  AND A.CODPRAT IS NULL');
      WhereCond.Add('  AND A.TIPODOC IS NULL');
      WhereCond.Add('  AND A.CODICEARTICOLO IS NULL');
      WhereCond.Add(')');
    end;
    // =========================================================================

    // =========================================================================
    // FILTRI PER ALLARMI
    // -------------------------------------------------------------------------
    // Se si è scelto di visualizzare gli allegati in allarme...
    if sbAlarm.Down then begin
      // Azzera le eventuali condizioni where presenti
      WhereCond.Clear;
      // Imposta le condizioni where
      WhereCond.Add('      A.ALARM_DATAORA <= CURRENT_TIMESTAMP');
      WhereCond.Add('  AND A.ALARM_FATTO <> ''T''');
    end;
    // =========================================================================

    // Se non è stato selezionato alcun filtro inserisce una clausola WHERE in modo
    //  che non visualizzi nulla (altrimenti li visualizzava tutti.
    if WhereCond.Count = 0 then WhereCond.Add('1=2');

    // IMposta la query
    QryAllegati.SQL.Clear;
    QryAllegati.SQL.Add('SELECT A.NUMPROT, A.REVPROT, A.ANNOPROT, A.FULLPROT, A.TIPODOC, A.NUMDOC, A.REGDOC, A.DATADOC');
    QryAllegati.SQL.Add('      ,A.ALL_DOCUMENTO, A.CODSOGG, A.ALL_SOGGETTO, A.CODICEARTICOLO, A.ALL_ARTICOLO, A.CODPRAT, A.DATAPRAT, A.ALL_RIFPRATICA');
    QryAllegati.SQL.Add('      ,A.NOTE, A.FILE_EXT, A.FILE_NAME, A.FILE_BLOB_PRESENT, A.CREAZ_OPERATORE, A.CREAZ_DATAORA, A.TRACK_CREAZIONE, A.ULTMOD_OPERATORE, A.ULTMOD_DATAORA, A.TRACK_ULTIMAMODIFICA');
    QryAllegati.SQL.Add('      ,A.DOC_SOGGETTO, A.DOC_RIFPRATICA, A.ALARM_DATAORA, A.ALARM_FATTO, A.PA_ALLEGA');
    QryAllegati.SQL.Add('FROM ALLEGATI_VIEW A');

    // Se presenti inserisce anche le clausole WHERE
    if WhereCond.Count > 0 then begin
      QryAllegati.SQL.Add('WHERE');
      QryAllegati.SQL.AddStrings(WhereCond);
    end;

    // Esegue la query
//QryAllegati.SQL.SaveToFile('c:\sql.sql');
    QryAllegati.Open;

    // Se impostato apre/chiude automaticamente il pannello a seconda che si siano trovati
    //  degli allegati o meno.
    if DM1.AllegatiApriChiudiAutomatico and AutoOpenClose then begin
      if cvAllegati.DataController.RecordCount > 0
        then Splitter.OpenSplitter
        else Splitter.CloseSplitter;
    end;

  finally
    // Pulizie finali
    WhereCond.Free;
  end;
end;







procedure TAllegatiForm.FormCreate(Sender: TObject);
begin
  // Inizializzazione
  Mode := amNormal;
  AzzeraFiltri;
  fLinkedAllegatiForm := nil;
  UpdatingFromLinkedAllegatiForm := False;

  // Inizializzazione riguardante il drag and drop di files  dal desktop
  //  di windows.
  originalPanelWindowProc := GridAllegati.WindowProc;
  GridAllegati.WindowProc := GridAllegatiWindowProc;
  DragAcceptFiles(GridAllegati.Handle,true) ;

  // Registra la FormAllegati dall'array che contiene la lista delle FormAllegati
  //  presenti e necessario per far funzionare il drag and drop del files dall'esterno
  //  del programma.
  MainForm.AllegatiFormStack_Registra(Self);
end;


// Windows Procedure per la Griglia che aggiunge la gestione
//  del Drag And Drop esterno per ricevere files dal desktop
//  di windows.
procedure TAllegatiForm.GridAllegatiWindowProc(var Msg: TMessage);
begin
   if Msg.Msg = WM_DROPFILES then
     GridAllegatiFileDrop(TWMDROPFILES(Msg))
   else
     originalPanelWindowProc(Msg) ;
end;

// Procedure che riceve il drag and drop dal desktop di
//  windows e ne carica il file sugli allegati
procedure TAllegatiForm.GridAllegatiFileDrop(var Msg: TWMDROPFILES) ;
var
    LNumFiles : longInt;
    LFileNameBuffer : array[0..MAX_PATH] of char;
begin
    LNumFiles := DragQueryFile(Msg.Drop, $FFFFFFFF, nil, 0) ;
    if LNumFiles > 1 then
    begin
      ShowMessage('E'' possibile trascinare solo 1 file alla volta!') ;
    end
    else
    begin
      DragQueryFile(Msg.Drop, 0, @LFileNameBuffer, sizeof(LFileNameBuffer)) ;
      try
        CreaAllegatoDaFile(LFileNameBuffer) ;
      except
        on EInvalidGraphic do ShowMessage('Unsupported image file, or not an image!') ;
      end;
    end;
end; (*PanelImageDrop*)

// Procedure che crea un nuovo allegato con il file specificato come parametro
//  allegato all'allegato stesso.
procedure TAllegatiForm.CreaAllegatoDaFile(FullPathFileName:String);
var
   qIns: TIB_Cursor;
   NewAnnoProt: String;
   NewNumProt, NewRevProt: Integer;
begin
  try
    // Crea gli oggetti query
    qIns                := TIB_Cursor.Create(Self);
    qIns.DatabaseName   := DM1.ArcDBFile;
    qIns.IB_Connection  := DM1.DBAzienda;

    // Imposta la query che inserirà il nuovo Allegato
    qIns.SQL.Add('INSERT INTO ALLEGATI (ANNOPROT, NUMPROT, REVPROT, TIPODOC, REGDOC, NUMDOC, DATADOC, CODSOGG, CODICEARTICOLO, CODPRAT, DATAPRAT');
    qIns.SQL.Add('  ,NOTE, CREAZ_OPERATORE, CREAZ_DATAORA, PA_ALLEGA');
    qIns.SQL.Add(') VALUES (');
    qIns.SQL.Add(':P_ANNOPROT, :P_NUMPROT, :P_REVPROT, :P_TIPODOC, :P_REGDOC, :P_NUMDOC, :P_DATADOC, :P_CODSOGG, :P_CODICEARTICOLO, :P_CODPRAT, :P_DATAPRAT');
    qIns.SQL.Add(', :P_NOTE, :P_CREAZ_OPERATORE, CURRENT_TIMESTAMP, :P_PA_ALLEGA');
    qIns.SQL.Add(')');
    // Determinazione del nuovo protocollo per il nuovo allegato
    NewAnnoProt := FormatDateTime('yyyy', Now);
    NewNumProt  := NextProt(NewAnnoProt);
    NewRevProt  := NextRevProt(NewAnnoProt, NewNumProt);

    // Imposta i parametri della query di inserimento nuovo allegato
    qIns.Prepare;
    qIns.Params.ParamByName('P_ANNOPROT').AsString := NewAnnoProt;
    qIns.Params.ParamByName('P_NUMPROT').AsInteger := NewNumProt;
    qIns.Params.ParamByName('P_REVPROT').AsInteger := NewRevProt;
    if Filter_TipoDoc <> ''   then qIns.Params.ParamByName('P_TIPODOC').AsString    := Filter_TipoDoc;
    if Filter_RegDoc <> ''    then qIns.Params.ParamByName('P_REGDOC').AsString     := Filter_RegDoc;
    if Filter_NumDoc <> 0     then qIns.Params.ParamByName('P_NUMDOC').AsInteger    := Filter_NumDoc;
    if Filter_DataDoc <> 0    then qIns.Params.ParamByName('P_DATADOC').AsDateTime  := Filter_DataDoc;
    if Filter_CodSogg <> 0    then qIns.Params.ParamByName('P_CODSOGG').AsInteger   := Filter_CodSogg;
    if Filter_CodiceArticolo <> '' then qIns.Params.ParamByName('P_CODICEARTICOLO').AsString := Filter_CodiceArticolo;
    if Filter_CodPrat <> 0    then qIns.Params.ParamByName('P_CODPRAT').AsInteger   := Filter_CodPrat;
    if Filter_DataPrat <> 0   then qIns.Params.ParamByName('P_DATAPRAT').AsDateTime := Filter_DataPrat;
    qIns.Params.ParamByName('P_NOTE').Value := ExtractFileName(FullPathFileName);
    qIns.Params.ParamByName('P_CREAZ_OPERATORE').Value  := DM1.IDOperatoreCorrente;
    qIns.Params.ParamByName('P_PA_ALLEGA').Value  := DEFAULT_PA_ALLEGA;
    // Esegue la queri di inserimento del nuovo allegato
    qIns.Execute;
    
    // Carica il file
    PutFileNameOnDatabase(NewAnnoProt, NewNumProt, NewRevProt, FullPathFileName);
  finally
    // Pulizie finali
    if Assigned(qIns) then qIns.Free;
    // Aggiornamento della schermo
    EseguiQuery;
  end;
end;




procedure TAllegatiForm.QryAllegatiBeforePost(DataSet: TDataSet);
var
  LAssegnaAdArticolo: Boolean;
begin
  // ===========================================================================
  // CALCOLO E ASSEGNAZIONE PROTOCOLLO A UN NUOVO RECORD
  // ---------------------------------------------------------------------------
  // Se l'anno del record è nullo lo assegna nuovo
  if QryAllegatiANNOPROT.IsNull or (Trim(QryAllegatiANNOPROT.AsString) = '') then begin
    QryAllegatiANNOPROT.Value := FormatDateTime('yyyy', Now);
  end;
  // Se il numero di protocollo è vuoto gli assegna il prossimo
  if QryAllegatiNUMPROT.IsNull then begin
    QryAllegatiNUMPROT.Value := NextProt(QryAllegatiANNOPROT.AsString);
  end;
  // Se la revisione del protocollo è nulla gli assegna la prossima
  if QryAllegatiREVPROT.IsNull then begin
    QryAllegatiREVPROT.Value := NextRevProt(QryAllegatiANNOPROT.AsString, QryAllegatiNUMPROT.AsInteger);
  end;
  // ===========================================================================

  // Flag che determina se l'allegato deve essere assegnato SOLO all'articolo
  //  corrente (se siamo nell'anagrafica articolo) oppure no.
  //  NB: L'assegnazione all'articolo è sempre esclusiva per cui se viene
  //       assegnato all'articolo non verrà assegnato a nientaltro (clienti, pratiche ecc.)
  LAssegnaAdArticolo := Filter_CodiceArticolo <> '';

  // ===========================================================================
  // ASSEGNAZIONE A ARTICOLO
  // ---------------------------------------------------------------------------
  if DM1.AllCreazione_LegaAlArticoloCorrente and LAssegnaAdArticolo then begin
    if (Filter_CodiceArticolo <> '') and ((not QryAllegatiCODICEARTICOLO.IsNull) or (QryAllegati.State = dsInsert)) then QryAllegatiCODICEARTICOLO.Value := Filter_CodiceArticolo;
  end;
  // ===========================================================================

  // ===========================================================================
  // ASSEGNAZIONE A SOGGETTO
  // ---------------------------------------------------------------------------
  if DM1.AllCreazione_LegaAlSoggettoCorrente and not LAssegnaAdArticolo then begin
    if (Filter_CodSogg <> 0) and ((not QryAllegatiCODSOGG.IsNull) or (QryAllegati.State = dsInsert))      then QryAllegatiCODSOGG.Value := Filter_CodSogg;
  end;
  // ===========================================================================

  // ===========================================================================
  // ASSEGNAZIONE A PRATICA
  // ---------------------------------------------------------------------------
  if DM1.AllCreazione_LegaAllaPraticaCorrente and not LAssegnaAdArticolo then begin
    if (Filter_CodPrat  <> 0) and ((not QryAllegatiCODPRAT.IsNull) or (QryAllegati.State = dsInsert))     then QryAllegatiCODPRAT.Value  := Filter_CodPrat;
    if (Filter_DataPrat <> 0) and ((not QryAllegatiDATAPRAT.IsNull) or (QryAllegati.State = dsInsert))    then QryAllegatiDATAPRAT.Value := Filter_DataPrat;
  end;
  // ===========================================================================

  // ===========================================================================
  // ASSEGNAZIONE A DOCUMENTO
  // ---------------------------------------------------------------------------
  if DM1.AllCreazione_LegaAlDocumentoCorrente and not LAssegnaAdArticolo then begin
    if (Filter_TipoDoc <> '') and ((not QryAllegatiTIPODOC.IsNull) or (QryAllegati.State = dsInsert))     then QryAllegatiTIPODOC.Value := Filter_TipoDoc;
    if (Filter_RegDoc  <> '') and ((not QryAllegatiREGDOC.IsNull) or (QryAllegati.State = dsInsert))      then QryAllegatiREGDOC.Value  := Filter_RegDoc;
    if (Filter_NumDoc  <> 0)  and ((not QryAllegatiNUMDOC.IsNull) or (QryAllegati.State = dsInsert))      then QryAllegatiNUMDOC.Value  := Filter_NumDoc;
    if (Filter_DataDoc <> 0)  and ((not QryAllegatiDATADOC.IsNull) or (QryAllegati.State = dsInsert))     then QryAllegatiDATADOC.Value := Filter_DataDoc;
  end;
  // ===========================================================================

  // ===========================================================================
  // ANNOTAZIONE CREAZIONE / ULTIMA MODIFICA
  // ---------------------------------------------------------------------------
  if QryAllegati.State = dsEdit then begin
    QryAllegatiULTMOD_OPERATORE.AsString  := DM1.IDOperatoreCorrente;
  end else begin
    QryAllegatiCREAZ_OPERATORE.AsString   := DM1.IDOperatoreCorrente;
  end;
  // ===========================================================================

  // ===========================================================================
  // ASSEGNAZIONE DEFAULT PA_ALLEGA
  // ---------------------------------------------------------------------------
  if QryAllegatiPA_ALLEGA.IsNull then
    QryAllegatiPA_ALLEGA.Value := DEFAULT_PA_ALLEGA;
  // ===========================================================================
end;


// Procedura che cicla per tutti gli allegati presenti e ne riassegna
//  i campi di collegamento a soggetto, pratica, documento.
procedure TAllegatiForm.AggiornaDatiSoggPratDoc;
var
  PrecPos: TBookmark;
  InEditingMode: Boolean;
begin
  // Inizializzazioen
  InEditingMode := False;
  // Se il dataset degli allegati è in Editing o similari forza il post del record
  if (QryAllegati.State = dsEdit) or (QryAllegati.State = dsInsert) then begin
    QryAllegati.Post;
  end;
  // Salva la posizione attuale
  PrecPos := QryAllegati.GetBookmark;
  // Disattiva tutti i controlli legati al dataset
  QryAllegati.DisableControls;
  try
    // Si posiziona all'inizio
    QryAllegati.First;
    // Cicla per tutti gli allegati visibile
    while not QryAllegati.Eof do begin
      // =========================================================================
      // Se qualche dato è diverso lo aggiorna
      // -------------------------------------------------------------------------
      // Codice Soggetto
      if (Filter_CodSogg <> 0)  and (QryAllegatiCODSOGG.IsNull  or (QryAllegatiCODSOGG.AsInteger <> Filter_CodSogg))      then begin
        if not InEditingMode then begin QryAllegati.Edit; InEditingMode := True; end;
        QryAllegatiCODSOGG.Value := Filter_CodSogg;
      end;
      // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      // Codice Articolo
      if (Filter_CodiceArticolo <> '')  and (QryAllegatiCODICEARTICOLO.IsNull  or (QryAllegatiCODICEARTICOLO.AsString <> Filter_CodiceArticolo))      then begin
        if not InEditingMode then begin QryAllegati.Edit; InEditingMode := True; end;
        QryAllegatiCODICEARTICOLO.Value := Filter_CodiceArticolo;
      end;
      // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      // Codice Pratica
      if (Filter_CodPrat <> 0)  and (QryAllegatiCODPRAT.IsNull  or (QryAllegatiCODPRAT.AsInteger <> Filter_CodPrat))      then begin
        if not InEditingMode then begin QryAllegati.Edit; InEditingMode := True; end;
        QryAllegatiCODPRAT.Value := Filter_CodPrat;
      end;
      // Codice DataPratica
      if (Filter_DataPrat <> 0) and (QryAllegatiDATAPRAT.IsNull   or (QryAllegatiDATAPRAT.AsDateTime <> Filter_DataPrat)) then begin
        if not InEditingMode then begin QryAllegati.Edit; InEditingMode := True; end;
        QryAllegatiDATAPRAT.Value := Filter_DataPrat;
      end;
      // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      // Tipo documento
      if (Filter_TipoDoc <> '') and (QryAllegatiTIPODOC.IsNull  or (QryAllegatiTIPODOC.AsString <> Filter_TipoDoc))       then begin
        if not InEditingMode then begin QryAllegati.Edit; InEditingMode := True; end;
        QryAllegatiTIPODOC.Value := Filter_TipoDoc;
      end;
      // Registro documento
      if (Filter_RegDoc <> '')  and (QryAllegatiREGDOC.IsNull   or (QryAllegatiREGDOC.AsString <> Filter_RegDoc))         then begin
        if not InEditingMode then begin QryAllegati.Edit; InEditingMode := True; end;
        QryAllegatiREGDOC.Value := Filter_RegDoc;
      end;
      // Numero documento
      if (Filter_NumDoc <> 0)   and (QryAllegatiNUMDOC.IsNull   or (QryAllegatiNUMDOC.AsInteger <> Filter_NumDoc))        then begin
        if not InEditingMode then begin QryAllegati.Edit; InEditingMode := True; end;
        QryAllegatiNUMDOC.Value := Filter_NumDoc;
      end;
      // Codice Data documento
      if (Filter_DataDoc <> 0)  and (QryAllegatiDATADOC.IsNull  or (QryAllegatiDATADOC.AsDateTime <> Filter_DataDoc))     then begin
        if not InEditingMode then begin QryAllegati.Edit; InEditingMode := True; end;
        QryAllegatiDATADOC.Value := Filter_DataDoc;
      end;
      // =========================================================================
      // Se è in editing effettua il post del record
      if InEditingMode then QryAllegati.Post;
      // Avanti il prossimo
      QryAllegati.Next;
    end;
  finally
    // Ripristina la posizione iniziale
    QryAllegati.GotoBookmark(PrecPos);
    QryAllegati.FreeBookmark(PrecPos);
    // Riabilita i controlli legati al dataset
    QryAllegati.EnableControls;
  end;
end;


// Function che elimina, se presente, il riferimento al protocollo nel nome di
//  file ricevuto come parametro.
function TAllegatiForm.EliminaProtocolloDaNomeFile(NomeFile:String): String;
var
  MarkerPos: Integer;
  FileExt, FileNameNoProt: String;
begin
  // Inizializzazione
  Result := NomeFile;
  FileExt := ExtractFileExt(NomeFile);
  // Determina la posizione del primo carattere della serie di di caratteri
  //  underscore che fanno sa separatatore tra il nome del file e il riferimento
  //  al protocollo.
  MarkerPos := Pos('_____', NomeFile);
  // Se la sequenza marcatore non è presente esce subito.
  if MarkerPos = 0 then Exit;
  // Estrare la parte del nome file prima del marcatore
  FileNameNoProt := Copy(NomeFile, 0, (MarkerPos-1));
  // Al nome file ottenuto senza marcatore rimette l'estensione alla file.
  FileNameNoProt := FileNameNoProt + FileExt;
  // Ritorna il risultato.
  Result := FileNameNoProt;
end;


procedure TAllegatiForm.QryAllegatiAfterPost(DataSet: TDataSet);
begin
  // Rinfresca i dati
  //  NB: Lo uso perchè altrimenti senza se io inserisco un nuovo allegato
  //      quando confermavo non mi apparivano subito anche i dati relativi
  //      ai dati del documento, del soggetto e della pratica (quelli assegnati
  //      automaticamente).
  QryAllegati.Refresh;
  // Metodo che aggiorna l'eventuale AllegatiForm linkata con la presente
  LinkedAllegatiForm_Update(True);
end;


// Procedure che allega un file all'allegato corrente
procedure TAllegatiForm.CaricaNuovoFileAllegato(Anno:String; Prot,RevProt:Integer);
var
  FullPathFileName, CompressedFileName, FullPathCompressedFileName: String;
  Q: TIB_Cursor;
begin
  // Se il blob dell'allegato contiene già qualcosa chiede all'utente
  //  se continuare o meno.
  if BlobEsistente(Anno, Prot, RevProt) and (DM1.Messaggi('Carica nuovo allegato', 'Sovrascrivere il file esistente?', 'NB: Un file è già contenuto nell''allegato, se si rispondi "SI" il nuovo file sostituirà quello esistente.', [mbYes,mbNo], 0, nil) <> mrYes)
  then Exit;
  // Visualizza la dialog per aprire il file
  if not DM1.OpenDialog1.Execute then Exit;
  // Informa l'utente
  DM1.ShowWait('Allegati', 'Sto caricando il file...');
  try
    // Carica il nome file su una variabile per comodità
    FullPathFileName := DM1.OpenDialog1.FileName;
    // Comprime il file e lo carica nel database
    PutFileNameOnDatabase(Anno, Prot, RevProt, FullPathFileName);
  finally
    DM1.CloseWait;
  end;
end;


// Function che verifica la presenza o meno di un file all'interno del
//  campo blob per prevenirne la sovrascrittura
function TAllegatiForm.BlobEsistente(Anno:String; Prot,RevProt:Integer): Boolean;
begin
  // Inizializzazione
  Result := False;
  // Impostazione query per il caricamento del file compresso nel database
  if qFilePresent.Active then qFilePresent.Close;
  if not qFilePresent.Prepared then qFilePresent.Prepare;
  qFilePresent.Params.ParamByName('P_ANNO').AsString := Anno;
  qFilePresent.Params.ParamByName('P_NUMPROT').AsInteger := Prot;
  qFilePresent.Params.ParamByName('P_REVPROT').AsInteger := RevProt;
  qFilePresent.Open;
  try
    // Se non è stato proprio trovato l'allegato ritorna un errore
    if qFilePresent.Eof then raise Exception.Create('Verifica presenza file: Record non trovato!');
    // Imposta il valore di ritorno
    Result := (qFilePresent.Fields[0].AsString = 'T');
  finally
    qFilePresent.Close;
  end;
end;





// Procedure che carica un nuovo file in un allegato già esistente
procedure TAllegatiForm.PutFileNameOnDatabase(Anno:String; Prot,RevProt:Integer; FullPathFilename:String);
var
  FullPathCompressedFileName, FileExt, FileName: String;
  FullPathFileNameNoProt: String;
begin
  // Verifica la presenza del file
  if not FileExists(FullPathFilename) then raise Exception.Create('File non trovato!');
  // Genera il nome del file temporaneo da utilitzzare per la creazione del file compresso
  FullPathCompressedFileName := DM1.GetTempFileName('zlb', DM1.CartellaTmp);
  // Ricava il valore di alcune variabili
  FileName := ExtractFileName(FullPathFilename);
  FileExt  := ExtractFileExt(FullPathFilename);
  FullPathFileNameNoProt := EliminaProtocolloDaNomeFile(FullPathFilename);
  // Elimina il punto iniziale nell'estensione del file
  FileExt := RightStr(FileExt, Length(FileExt)-1);
  // Crea il file compresso e ci carica dentro il file da salvare.
  //  NB: Se il nome del file da salvare contiene il riferimento al protocollo
  //       lo elimina.
  ZLB1.CreateArchive(FullPathCompressedFileName);
  try
    if (FullPathFileNameNoProt <> FullPathFilename) then begin
      if FileExists(FullPathFileNameNoProt) then begin
        if not DeleteFile(FullPathFileNameNoProt) then raise Exception.Create('Non è stato possibile eliminare il file "' + ExtractFileName(FullPathFileNameNoProt) + '"');
      end;
      if not RenameFile(FullPathFilename, FullPathFileNameNoProt) then raise Exception.Create('Non è stato possibile rinominare il file "' + FileName + '"');
    end;
    ZLB1.AddFile(FullPathFileNameNoProt);
//    ZLB1.RenameFileByName(FileName, EliminaProtocolloDaNomeFile(FileName));
  finally
    ZLB1.CloseArchive;
  end;
  // Impostazione query per il caricamento del file compresso nel database
  if not qNewAll.Prepared then qNewAll.Prepare;
  qNewAll.Params.ParamByName('P_ANNO').AsString := Anno;
  qNewAll.Params.ParamByName('P_NUMPROT').AsInteger := Prot;
  qNewAll.Params.ParamByName('P_REVPROT').AsInteger := RevProt;
  qNewAll.Params.ParamByName('P_FILE_EXT').AsString := FileExt;
  qNewAll.Params.ParamByName('P_FILE_NAME').AsString := ExtractFileName(FullPathFileNameNoProt);
  qNewAll.Params.ParamByName('P_FILE_BLOB').LoadFromFile(FullPathCompressedFileName);
  qNewAll.Params.ParamByName('P_ULTMOD_OPERATORE').AsString := DM1.IDOperatoreCorrente;
  qNewAll.Execute;
end;


// Function che preleva il file dell'allegato dal database, lo decomprime e
//  ne ritorna il nome completo di percorso.
function TAllegatiForm.GetFileFromDatabase(Anno:String; Prot,RevProt:Integer; OriginalFileName:String): String;
var
  CompressedFileName, FullPathCompressedFileName, FileName, FileNameNoExt, FileExt,
  FullPathFileName, FullPathOriginalFileName: String;
begin
  // Prima di tutto verifica se l'allegato contiene qualcosa nel campo blob oppure no
  if not BlobEsistente(Anno, Prot, RevProt) then begin
    DM1.Messaggi('Apri file allegato', 'La nota/allegato non contiene file.', '', [mbOk], 0, nil);
    Exit;
  end;
  // inizializzazione
  Result := '';
  FileExt := ExtractFileExt(OriginalFileName);
  FullPathOriginalFileName := DM1.CartellaTmp + OriginalFileName;
  FileNameNoExt := LeftStr(OriginalFileName, (Length(OriginalFileName) - Length(FileExt)));
  FileName := FileNameNoExt + '_____Prot_' + Anno + '_' + IntToStr(Prot) + '_' + IntToStr(RevProt) + FileExt;
  FullPathFileName := DM1.CartellaTmp + FileName;
  // Prima si assicura che il file non esista e se esiste lo elimina
  if FileExists(FullPathFileName) then begin
    if not DeleteFile(FullPathFileName) then raise Exception.Create('Non è stato possibile eliminare il file "' + FileName + '"');
  end;
  // Genera il nome del file temporaneo da utilitzzare per la creazione del file compresso
  FullPathCompressedFileName := DM1.GetTempFileName('zlb', DM1.CartellaTmp);
  // Preleva il file compresso dal campo blob
  if qGetAll.Active then qGetAll.Close;
  if not qGetAll.Prepared then qGetAll.Prepare;
  qGetAll.Params.ParamByName('P_ANNO').AsString := Anno;
  qGetAll.Params.ParamByName('P_NUMPROT').AsInteger := Prot;
  qGetAll.Params.ParamByName('P_REVPROT').AsInteger := RevProt;
  qGetAll.Open;
  try
    // Se non è stato proprio trovato l'allegato ritorna un errore
    if qGetAll.Eof then raise Exception.Create('Verifica presenza file: Record non trovato!');
    // Salva il file contenuto nel campo blob nella cartella temporanea
    qGetAll.Fields[0].SaveToFile(FullPathCompressedFileName);
  finally
    qGetAll.Close;
  end;
  // Decomprime il file compresso
  //  NB: Prima di estrarre il file lo rinomina aggiungendogli il riferimento
  //      al protocollo alla fine del nome.
  ZLB1.OpenArchive(FullPathCompressedFileName);
  try
//    ZLB1.RenameFileByName(OriginalFileName, FileName);
    ZLB1.ExtractFileByIndex(DM1.CartellaTmp, 0);
    if not RenameFile(FullPathOriginalFileName, FullPathFileName) then raise Exception.Create('Non è stato possibile rinominare il file.');
  finally
    ZLB1.CloseArchive;
  end;
  // Ritorna il nome del file decompresso
  Result := FullPathFileName;
end;

procedure TAllegatiForm.ExportFileFromDatabase(Anno: String; Prot, RevProt: Integer);
var
  LFullPathCompressedFileName, LFileName: String;
begin
  // Prima di tutto verifica se l'allegato contiene qualcosa nel campo blob oppure no
  if not BlobEsistente(Anno, Prot, RevProt) then begin
    DM1.Messaggi('Apri file allegato', 'La nota/allegato non contiene file.', '', [mbOk], 0, nil);
    Exit;
  end;
  // Inizializzazione
  LFileName := QryAllegatiFILE_NAME.AsString;
  LFullPathCompressedFileName := DM1.GetTempFileName('zlb', DM1.CartellaTmp);
  // SaveDialog
  SaveDialog1.FileName := LFileName;
  if not SaveDialog1.Execute then
    Exit;
  // Preleva il file compresso dal campo blob
  if qGetAll.Active then qGetAll.Close;
  if not qGetAll.Prepared then qGetAll.Prepare;
  qGetAll.Params.ParamByName('P_ANNO').AsString := Anno;
  qGetAll.Params.ParamByName('P_NUMPROT').AsInteger := Prot;
  qGetAll.Params.ParamByName('P_REVPROT').AsInteger := RevProt;
  qGetAll.Open;
  try
    // Se non è stato proprio trovato l'allegato ritorna un errore
    if qGetAll.Eof then raise Exception.Create('Verifica presenza file: Record non trovato!');
    // Salva il file contenuto nel campo blob nella cartella temporanea
    qGetAll.Fields[0].SaveToFile(LFullPathCompressedFileName);
  finally
    qGetAll.Close;
  end;
  // Decomprime il file compresso
  //  NB: Prima di estrarre il file lo rinomina aggiungendogli il riferimento
  //      al protocollo alla fine del nome.
  ZLB1.OpenArchive(LFullPathCompressedFileName);
  try
//    ZLB1.ExtractFileByIndex(ExtractFileDir(SaveDialog1.FileName), 0);
    ZLB1.ExtractFileByIndex(DM1.CartellaTmp, 0);
    DM1.CopiaFile(DM1.CartellaTmp + LFileName, SaveDialog1.FileName);
  finally
    ZLB1.CloseArchive;
  end;
end;


// Procedure che apre il file allegato
procedure TAllegatiForm.OpenFileAndWait(Anno:String; Prot,RevProt:Integer; OriginalFileName:String);
var
  FullPathFileName: String;
  PrecFileDateTime: Integer;
  Risultato: TModFileMode;
begin
  // Preleva il file allegato dal database e lo decomprime
  FullPathFileName := GetFileFromDatabase(Anno, Prot, RevProt, OriginalFileName);
  // Memorizza la data e ora dell'ultima midifica al file per controllare poi
  //  se è stato modificato o meno.
  PrecFileDateTime := FileAge(FullPathFileName);
  // Apre il file allegato e aspetta
//  DM1.WinExecAndWait32(NomeExtFile + Qry.FieldByName('ESTENSIONE').AsString, SW_SHOW);
  DM1.RunAndWaitShell(FullPathFileName, '', Self.Handle, SW_MAXIMIZE);
  // Se a questo punto la data e ora dell'ultima modifica del file è diversa
  //  da quella memorizzata all'apertira del file stesso significa che il file
  //  è stato variato.
  if FileAge(FullPathFileName) = PrecFileDateTime then Exit;
  // Chiede all'utente se, visto che il file è stato modificato, lo vuole risalvare
  //  nello stesso allegato oppure se deve essere creato un nuovo allegato e in quest'ultimo
  //  caso se il nuovo allegato deve essere una nuova revisione dello stesso protocollo
  //  oppure proprio un nuovo protocollo.
  Risultato := FileModificatoCosaFare;
  // In base al risultato...
  if          Risultato = mfSovrascrivi then begin
    PutFileNameOnDatabase(Anno, Prot, RevProt, FullPathFileName);
    QryAllegati.Refresh;
  end else if Risultato = mfNuovaVersione then begin
    DuplicaAllegato(Anno, Prot, RevProt, True, False, FullPathFileName);
    QryAllegati.Refresh;
  end else if Risultato = mfNuovoProtocollo then begin
    DuplicaAllegato(Anno, Prot, RevProt, False, False, FullPathFileName);
    QryAllegati.Refresh;
  end;
end;


// Function che richiede cosa fare in caso di modifica di un file allegato
function TAllegatiForm.FileModificatoCosaFare: TModFileMode;
begin
  // Inizializzazione
  Result := mfNone;
  // Crea la form per chiedere cosa fare
  Application.CreateForm(TFileAllegatoModificatoForm, FileAllegatoModificatoForm);
  try
    FileAllegatoModificatoForm.ShowModal;
    Result := FileAllegatoModificatoForm.Risultato;
  finally
    FreeAndNil(FileAllegatoModificatoForm);
  end;
end;


procedure TAllegatiForm.cvAllegatiCategory1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Anno, OriginalFileName, Note: String;
  Prot, RevProt: Integer;
begin
  // Verifica che l'allegato attuale abbia tutto il necessario
  //  NB: Se non ci sono significa che stiamo inserendo un nuovo allegato e ne causa il post
  //       in modo che vengano assegnati i valori dei campi chiave
  if QryAllegatiANNOPROT.IsNull or (QryAllegatiANNOPROT.AsString = '')
  or QryAllegatiNUMPROT.IsNull  or (QryAllegatiNUMPROT.AsInteger = 0)
  or QryAllegatiREVPROT.IsNull  or (QryAllegatiREVPROT.AsInteger = 0)
  then
//    raise Exception.Create('Dati chiave dell''allegato non validi.');
    QryAllegati.Post;
  // Inizializzazione
  Anno              := QryAllegatiANNOPROT.AsString;
  Prot              := QryAllegatiNUMPROT.AsInteger;
  RevProt           := QryAllegatiREVPROT.AsInteger;
  Note              := QryAllegatiNOTE.AsString;
  // Ricava il nome originale del file se esistente altrimenti ritorna un errore
  if (not QryAllegatiFILE_NAME.IsNull) and (QryAllegatiFILE_NAME.AsString <> '') then
    OriginalFileName  := QryAllegatiFILE_NAME.AsString
  else
    OriginalFileName := '';
  // Click sul pulsante apri file allegato
  if (AButtonIndex = BTN_OPEN_FILE_INDEX) then begin
    if OriginalFileName = '' then raise Exception.Create('La nota/allegato non contiene file.');
    OpenFileAndWait(Anno, Prot, RevProt, OriginalFileName);
  // Click sul pulsante caricamento nuovo file allegato
  end else if (AButtonIndex = BTN_IMPORT_FILE_INDEX) then begin
    CaricaNuovoFileAllegato(Anno, Prot, RevProt);
    QryAllegati.Refresh;
  // Click sul pulsante esporta file allegato
  end else if (AButtonIndex = BTN_EXPORT_FILE_INDEX) then begin
    ExportFileFromDatabase(Anno, Prot, RevProt);
  // Click sul pulsante Alarm Settings
  end else if (AButtonIndex = BTN_ALARM_EDIT_INDEX) then begin
    if AllegatiAlarmForm = nil then begin
      Application.CreateForm(TAllegatiAlarmForm, AllegatiAlarmForm);
      try
        if not QryAllegatiALARM_DATAORA.IsNull then AllegatiAlarmForm.dbeDataOra.Date := QryAllegatiALARM_DATAORA.AsDateTime else AllegatiAlarmForm.dbeDataOra.Date := Now;
        AllegatiAlarmForm.dbeFatto.Checked := (QryAllegatiALARM_FATTO.AsString = 'T');
        AllegatiAlarmForm.ShowModal;
        if (AllegatiAlarmForm.ModalResult <> mrOk) and (AllegatiAlarmForm.ModalResult <> mrAbort) then Exit;
        if QryAllegati.State = dsBrowse then QryAllegati.Edit;
        try
          if AllegatiAlarmForm.ModalResult = mrAbort
            then QryAllegatiALARM_DATAORA.Clear
            else QryAllegatiALARM_DATAORA.Value := AllegatiAlarmForm.dbeDataOra.Date;
          if AllegatiAlarmForm.dbeFatto.Checked
            then QryAllegatiALARM_FATTO.Value := 'T'
            else QryAllegatiALARM_FATTO.Value := 'F';
          QryAllegati.Post;
        except
          QryAllegati.Cancel;
        end;
      finally
        AllegatiAlarmForm.Close;
        FreeAndNil(AllegatiAlarmForm);
      end;
    end else AllegatiAlarmForm.BringToFront;
  end;
end;



// Procedura che duplica un allegato
procedure TAllegatiForm.DuplicaAllegato(AnnoProt:String; NumProt,RevProt:Integer; NuovaRevisione,DuplicaAncheFile:Boolean; FullPathFileAllegato:String);
var
   qSrc, qIns: TIB_Cursor;
   NewAnnoProt, CopiaDi: String;
   NewNumProt, NewRevProt: Integer;
begin
  try
    // Crea gli oggetti query
    qSrc                := TIB_Cursor.Create(Self);
    qSrc.DatabaseName   := DM1.ArcDBFile;
    qSrc.IB_Connection  := DM1.DBAzienda;
    qIns                := TIB_Cursor.Create(Self);
    qIns.DatabaseName   := DM1.ArcDBFile;
    qIns.IB_Connection  := DM1.DBAzienda;

    // Imposta la query che ricaverà i dati dell'allegato da duplicare.
    qSrc.SQL.Add('SELECT NOTE');
    if DuplicaAncheFile then qSrc.SQL.Add('  ,FILE_EXT, FILE_NAME, FILE_BLOB');
    qSrc.SQL.Add('FROM ALLEGATI');
    qSrc.SQL.Add('WHERE ANNOPROT = ' + QuotedStr(AnnoProt));
    qSrc.SQL.Add('  AND NUMPROT  = ' + IntToStr(NumProt));
    qSrc.SQL.Add('  AND REVPROT  = ' + IntToStr(RevProt));
    qSrc.Open;
    // Se non trova alcun record ritorna un errore ed esce
    if qSrc.Eof then raise Exception.Create('Allegato da duplicare non trovato!');

    // Imposta la query che inserirà il nuovo Allegato
    qIns.SQL.Add('INSERT INTO ALLEGATI (ANNOPROT, NUMPROT, REVPROT, TIPODOC, REGDOC, NUMDOC, DATADOC, CODSOGG, CODICEARTICOLO, CODPRAT, DATAPRAT');
    qIns.SQL.Add('  ,NOTE, CREAZ_OPERATORE, CREAZ_DATAORA');
    if DuplicaAncheFile then qIns.SQL.Add('  ,FILE_EXT, FILE_NAME, FILE_BLOB');
    qIns.SQL.Add(') VALUES (');
    qIns.SQL.Add(':P_ANNOPROT, :P_NUMPROT, :P_REVPROT, :P_TIPODOC, :P_REGDOC, :P_NUMDOC, :P_DATADOC, :P_CODSOGG, :P_CODICEARTICOLO, :P_CODPRAT, :P_DATAPRAT');
    qIns.SQL.Add(', :P_NOTE, :P_CREAZ_OPERATORE, CURRENT_TIMESTAMP');
    if DuplicaAncheFile then qIns.SQL.Add(', :P_FILE_EXT, :P_FILE_NAME, :P_FILE_BLOB');
    qIns.SQL.Add(')');
    // Determinazione del nuovo protocollo per il nuovo allegato
    if NuovaRevisione then begin
      NewAnnoProt := AnnoProt;
      NewNumProt  := NumProt;
    end else begin
      NewAnnoProt := FormatDateTime('yyyy', Now);
      NewNumProt  := NextProt(NewAnnoProt);
    end;
    NewRevProt := NextRevProt(NewAnnoProt, NewNumProt);
    // Imposta i parametri della query di inserimento nuovo allegato
    qIns.Prepare;
    qIns.Params.ParamByName('P_ANNOPROT').AsString := NewAnnoProt;
    qIns.Params.ParamByName('P_NUMPROT').AsInteger := NewNumProt;
    qIns.Params.ParamByName('P_REVPROT').AsInteger := NewRevProt;
    if Filter_TipoDoc <> ''   then qIns.Params.ParamByName('P_TIPODOC').AsString    := Filter_TipoDoc;
    if Filter_RegDoc <> ''    then qIns.Params.ParamByName('P_REGDOC').AsString     := Filter_RegDoc;
    if Filter_NumDoc <> 0     then qIns.Params.ParamByName('P_NUMDOC').AsInteger    := Filter_NumDoc;
    if Filter_DataDoc <> 0    then qIns.Params.ParamByName('P_DATADOC').AsDateTime  := Filter_DataDoc;
    if Filter_CodSogg <> 0    then qIns.Params.ParamByName('P_CODSOGG').AsInteger   := Filter_CodSogg;
    if Filter_CodiceArticolo <> '' then qIns.Params.ParamByName('P_CODICEARTICOLO').AsString := Filter_CodiceArticolo;
    if Filter_CodPrat <> 0    then qIns.Params.ParamByName('P_CODPRAT').AsInteger   := Filter_CodPrat;
    if Filter_DataPrat <> 0   then qIns.Params.ParamByName('P_DATAPRAT').AsDateTime := Filter_DataPrat;

    // Aggiunge alle note la diciture copie di...
    if not qSrc.FieldByName('NOTE').IsNull then CopiaDi := qSrc.FieldByName('NOTE').Value;
    if NuovaRevisione
      then CopiaDi := '... nuova versione di ' + AnnoProt + '.' + IntToStr(NumProt) + '.' + IntToStr(RevProt) + ':'#13 + CopiaDi
      else CopiaDi := '... copia di ' + AnnoProt + '.' + IntToStr(NumProt) + '.' + IntToStr(RevProt) + ':'#13 + CopiaDi;
    qIns.Params.ParamByName('P_NOTE').Value := CopiaDi;

    qIns.Params.ParamByName('P_CREAZ_OPERATORE').Value  := DM1.IDOperatoreCorrente;
    if DuplicaAncheFile then begin
      qIns.Params.ParamByName('P_FILE_EXT').Value       := qSrc.FieldByName('FILE_EXT').Value;
      qIns.Params.ParamByName('P_FILE_NAME').Value      := qSrc.FieldByName('FILE_NAME').Value;
      qIns.Params.ParamByName('P_FILE_BLOB').Value      := qSrc.FieldByName('FILE_BLOB').Value;
    end;
    // Esegue la queri di inserimento del nuovo allegato
    qIns.Execute;
    
    // Se è impostato anche un nome di file da inserire nell'allegato lo inserisce
    if FullPathFileAllegato <> '' then begin
      PutFileNameOnDatabase(NewAnnoProt, NewNumProt, NewRevProt, FullPathFileAllegato);
    end;
  finally
    if Assigned(qSrc) then qSrc.Free;
    if Assigned(qIns) then qIns.Free;
  end;
end;


procedure TAllegatiForm.cvAllegatiCategory1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  I: Integer;
  BM: TBitmap;
  X, Y: Integer;
  TmpStr: String;
  CurrDataOra: TDateTime;
begin
  // COn questa riga non da più il problema che disegna i pulsanti e la graffetta
  //  anche più a SX in alcune occasioni.
  if AViewInfo is TcxGridCardRowCaptionViewInfo then Exit;

  ADone := True;

  // Cicla per tutti i bottoni presenti per impostare alcune proprietà...
  // Rende trasparenti i bottoni che altrimenti non lo sono e non mi piacevano...
  for I := 0 to Length(AViewInfo.EditViewInfo.ButtonsInfo) - 1 do begin
    AViewInfo.EditViewInfo.ButtonsInfo[I].Data.Transparent := True;
  end;

  // Disegna il contenuto della cella in modo standard
  AViewInfo.EditViewInfo.Paint(ACanvas); // Paint the default cell's contents

  // Se l'allegato ha un allarme impostato visualizza la data e ora dell'allarme stesso
  if True and (not cvAllegatiCategory1.Expanded) then begin
    // RIcava il testo
    if (not VarIsNull(AViewInfo.GridRecord.Values[cvAllegatiALARM_DATAORA.Index])) then begin
      // Dato in una variabile per comodità
      CurrDataOra := AViewInfo.GridRecord.Values[cvAllegatiALARM_DATAORA.Index];
      // Ricava il testo da visualizzare
      // Se è oggi...
      if IsToday(CurrDataOra) then begin
        TmpStr := FormatDateTime('hh:nn "di oggi"', CurrDataOra);
      // Se è domani
      end else if IsToday(CurrDataOra-1) then begin
        TmpStr := FormatDateTime('hh:nn "di domani"', CurrDataOra);
      // Se è dopodomani
      end else if IsToday(CurrDataOra-2) then begin
        TmpStr := FormatDateTime('hh:nn "di dopodomani"', CurrDataOra);
      // Se è ieri
      end else if IsToday(CurrDataOra+1) then begin
        TmpStr := FormatDateTime('hh:nn "di ieri"', CurrDataOra);
      // Se è l'altro ieri
      end else if IsToday(CurrDataOra+2) then begin
        TmpStr := FormatDateTime('hh:nn "di 2 giorni fa"', CurrDataOra);
      end else begin
        TmpStr := FormatDateTime('hh:nn "del" dd/mm/yy', CurrDataOra);
      end;
      // Determina il colore del testo
      if CurrDataOra <= Now then begin
        ACanvas.Font.Color := clRed;
        ACanvas.Font.Style := [fsUnderline];
      end else begin
        ACanvas.Font.Color := DM1.cvEnCardProtocollo.TextColor;
        ACanvas.Font.Style := [];
      end;
    end;
    // Se è marcato come fatto...
    if (not VarIsNull(AViewInfo.GridRecord.Values[cvAllegatiALARM_FATTO.Index])) and (AViewInfo.GridRecord.Values[cvAllegatiALARM_FATTO.Index] = 'T') then begin
      TmpStr := 'Fatto';
      ACanvas.Font.Color := DM1.cvEnCardProtocollo.TextColor;
      ACanvas.Font.Style := [];
    end;
    // RIcava le coordinate
    X := AViewInfo.Bounds.Left  + 22;
    Y := AViewInfo.Bounds.Top + 5;
    ACanvas.Font.Name := 'Arial';
    ACanvas.Font.Size := 7;
    ACanvas.Canvas.TextOut(X, Y, TmpStr);
  end;

  // Se l'allegato contiene un file visualizza il simbolo opportuno.
  if (AViewInfo.GridRecord.Values[cvAllegatiFILE_BLOB_PRESENT.Index] = 'T') then begin
    // RIcava le coordinate per posizionare il flag
    X := AViewInfo.Bounds.Right - 110; //65
    Y := AViewInfo.Bounds.Top + 3;
    // Disegna il simbolo che indica che un file è presente nell'allegato
    BM := TBitmap.Create;
    try
      ACanvas.Brush.Color := Sender.Styles.Content.Color;
      ImageListForScreen.GetBitmap(0, BM);
      BM.Transparent := True;
      ACanvas.Draw(X, Y, BM);
    finally
      FreeAndNil(BM);
    end;
  end;

end;

procedure TAllegatiForm.FormResize(Sender: TObject);
begin
  // Posiziona i dbNav
  dbNavAppend.Top     := 7;
  dbNavDelete.Top     := 11;
  dbNavRefresh.Top    := 7;

  dbNavAppend.Left    := 7;
  dbNavDelete.Left    := dbNavAppend.Left + dbNavAppend.Width + 7;
  dbNavRefresh.Left   := dbNavDelete.Left + dbNavDelete.Width + 7;

  // Posiziona il filtri 1
  PanelFilters1.Top  := 7;
  PanelFilters1.Left := PanelTop.ClientWidth - PanelFilters1.Width - 6;
  PanelAlarm.Top     := 7;
  PanelAlarm.Left    := PanelFilters1.Left - PanelAlarm.Width;

  // Posiziona il TROVA
  PanelTrova.Top  := 7;
  PanelTrova.Left := Round(   (PanelTop.ClientWidth - PanelTrova.Width) / 2   );
end;

procedure TAllegatiForm.cvAllegatiEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   // Prima di tutto controlla che il bersaglio non sia nullo
   if Target <> nil then begin
     // In base al bersaglio attiva la funzione corretta.
     if Target is TSpeedButton then begin
       TSpeedButton(Target).OnClick(Self);
     // Se il target è una TListView...
     end else if Target is TListView then begin
       // Se il target è la TListView che contiene i documenti esportati, esporta i documenti
       //  selezionati
       if (Target as TListView).Name = 'ListViewExpDoc' then begin
         EsportaAllegatiSelezionati;
       end;
     end;
     // Aggiorna  i documenti esportati
     MainForm.AggiornaDocumentiEsportati;
   end;
end;


// Procedure che elimina l'allegato dalla bacheca
procedure TAllegatiForm.EliminaAllegatoDallaBacheca(Anno:String; NumProt,RevProt:Integer);
var
   QryOut: TIB_Cursor;
begin
   // Crea la query che inserisce i righi del documento da esportare dall'archivio temporaneo dei righi esportati
   QryOut := TIB_Cursor.Create(Self);
   try
     QryOut.DatabaseName := DM1.GenDBFile;
     QryOut.IB_Connection := DM1.DBGenerale;
     // Pirma verifica che lo stesso allegato non sia già nella bacheca
     QryOut.SQL.Add('DELETE FROM TMPRIGHI');
     QryOut.SQL.Add('WHERE STATION_ID = ' + DM1.CodiceUtente);
     QryOut.SQL.Add('  AND TIPODOCUMENTO = ' + QuotedStr('Allegato'));
     QryOut.SQL.Add('  AND REGISTRO = ' + QuotedStr(Anno));
     QryOut.SQL.Add('  AND NUMORDPREV = ' + IntToStr(NumProt));
     QryOut.SQL.Add('  AND PROGRIGO = ' + IntToStr(RevProt));
     QryOut.Execute;
   finally
     QryOut.Free;
   end;
end;


// Procedure che esporta un allegato nella bacheca
procedure TAllegatiForm.EsportaAllegato(Anno:String; NumProt,RevProt:Integer);     // Personale
var
   QryOut: TIB_Cursor;
begin
   // Crea la query che inserisce i righi del documento da esportare dall'archivio temporaneo dei righi esportati
   QryOut := TIB_Cursor.Create(Self);
   try
     QryOut.DatabaseName := DM1.GenDBFile;
     QryOut.IB_Connection := DM1.DBGenerale;
     // Pirma verifica che lo stesso allegato non sia già nella bacheca
     QryOut.SQL.Add('SELECT COUNT(*) AS QUANTI FROM TMPRIGHI');
     QryOut.SQL.Add('WHERE STATION_ID = ' + DM1.CodiceUtente);
     QryOut.SQL.Add('  AND TIPODOCUMENTO = ' + QuotedStr('Allegato'));
     QryOut.SQL.Add('  AND REGISTRO = ' + QuotedStr(Anno));
     QryOut.SQL.Add('  AND NUMORDPREV = ' + IntToStr(NumProt));
     QryOut.SQL.Add('  AND PROGRIGO = ' + IntToStr(RevProt));
     QryOut.Open;
     if (not QryOut.Eof) and (QryOut.Fields[0].AsInteger > 0) then Exit;
     QryOut.Close;
     QryOut.SQL.Clear;
     // Query che esporta l'allegato
     QryOut.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, ProgRigo)');
     QryOut.SQL.Add('values (');
     QryOut.SQL.Add(DM1.CodiceUtente + ',');
     QryOut.SQL.Add(QuotedStr('Allegato') + ',');
     QryOut.SQL.Add(QuotedStr(Anno) + ',');
     QryOut.SQL.Add(IntToStr(NumProt) + ',');
     QryOut.SQL.Add(IntToStr(RevProt));
     QryOut.SQL.Add(')');
     QryOut.ExecSQL;
   finally
     QryOut.Free;
   end;
end;

// Esporta tutti gli allegati selezionati
procedure TAllegatiForm.EsportaAllegatiSelezionati;     // Personale
var
   i, NumProt, RevProt:Integer;
   Anno: String;
   inTransaction: Boolean;
begin
  with Self.cvAllegati do begin
    DM1.ShowWait('Bacheca', 'Esportazione...');
    try
      inTransaction := DM1.DBAzienda.InTransaction;
      if not inTransaction then DM1.DBAzienda.StartTransaction;
      try
        for i := 0 to Controller.SelectedRecordCount -1 do begin
          // Assegna il tipo, numero, data e registro del documento a delle variabili locali per comodità successiva
          Anno    := Controller.SelectedRecords[i].Values[cvAllegatiANNOPROT.Index];
          NumProt := Controller.SelectedRecords[i].Values[cvAllegatiNUMPROT.Index];
          RevProt := Controller.SelectedRecords[i].Values[cvAllegatiREVPROT.Index];
          DM1.ShowWait('Bacheca', 'Esportazione protocollo:   ' + Anno + '.' + IntToStr(NumProt) + '.' + IntToStr(RevProt));
          // Esporta l'allegato corrente
          EsportaAllegato(Anno, NumProt, RevProt);
        end;
        if not inTransaction then DM1.DBAzienda.Commit;
      except
        if not inTransaction then DM1.DBAzienda.Rollback;
      end;
    finally
      DM1.CloseWait;
    end;
  end;
end;



procedure TAllegatiForm.cvAllegatiDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := False;
   // Controlla il mittente per accettare o meno l'operazione
   if (Source is TListView) then begin
      if (Source as TListView).Name = 'ListViewExpDoc' then begin
         Accept := True;
      end;
   end;
end;

procedure TAllegatiForm.cvAllegatiDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   // In base al tipo del mittente
   if Source is TListView then begin
      // Se il mittente è la Bacheca...
      if (Source as TListView).Name = 'ListViewExpDoc' then begin
         // Provvede all'importazione
         ImportaAllegatiSelezionati;
      end;
   end;
end;



procedure TAllegatiForm.ImportaAllegatiSelezionati;
var
   Capt, Anno: String;
   NumProt, RevProt: Integer;
begin
   DM1.ShowWait('Bacheca', 'Importazione...');
   try
     // Cicla per tutti i documenti esportati indicati nella ListView della MainForm
     //  e importa quelli selezionati nel documento attuale.
     while MainForm.ListViewExpDoc.SelCount > 0 do begin
        // Capt contiene la caption della voce selezionata corrente
        Capt := MainForm.ListViewExpDoc.Selected.Caption;
        // Informa l'utente
        DM1.ShowWait('', 'Importazione ' + Capt);
        // Se è un allegato lo importa
        if (MainForm.ListViewExpDoc.Selected.ImageIndex = 5)
        then begin
           // RIcava i dati identificativi del documento da importare
           DM1.RitornaTestoPrimaDi(' ', Capt, True);  // Elimina la dicitura 'Allegato' all'inizio
           Anno     := DM1.RitornaTestoPrimaDi('.', Capt, True);
           NumProt  := StrToInt(DM1.RitornaTestoPrimaDi('.', Capt, True));
           RevProt  := StrToInt(Capt);
           // Importa un duplicato dell'allegato originario come
           //  un nuovo protocollo.
           DuplicaAllegato(Anno, NumProt, RevProt, False, True, '');
           // Elimina l'articolo appena importato
           EliminaAllegatoDallaBacheca(Anno, NumProt, RevProt);
        end;
        // Elimina la voce
        MainForm.ListViewExpDoc.Selected.Delete;
     end;
   finally
     // Pulizie finali
     DM1.CloseWait;
     // Aggiorna la bacheca
     MainForm.AggiornaDocumentiEsportati;
     // Rinfresca i dati
     //  NB: Lo uso perchè altrimenti senza se io inserisco un nuovo allegato
     //      quando confermavo non mi apparivano subito anche i dati relativi
     //      ai dati del documento, del soggetto e della pratica (quelli assegnati
     //      automaticamente).
     QryAllegati.Refresh;
   end;
end;




procedure TAllegatiForm.GridAllegatiDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

procedure TAllegatiForm.cvAllegatiFULLPROTGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var
  Creaz: TDatetime;
begin
  if not VarIsNull(ARecord.Values[cvAllegatiCREAZ_DATAORA.Index]) then begin
    Creaz := ARecord.Values[cvAllegatiCREAZ_DATAORA.Index];
    AText := AText + ' del ' + FormatDateTime('dd/mm/yy', Creaz) + ' ore ' + FormatDateTime('hh.nn', Creaz);
  end;
end;

procedure TAllegatiForm.cvAllegatiFULLPROTGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
var
  TmpStr: String;
begin
  // Inizializzazione
  AHintText := '';

  // Protocollo
  TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiFULLPROT.Index]);
  if TmpStr <> '' then begin
    AHintText := AHintText + 'Protocollo: ' + TmpStr;
  end;

  // Nome file
  TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiFILE_NAME.Index]);
  if TmpStr <> '' then begin
    AHintText := AHintText + #13#13'File allegato: "' + TmpStr + '"';
  end;

  // Documento
  TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiTIPODOC.Index]);
  if TmpStr <> '' then begin
    AHintText := AHintText + #13#13'Documento: ' + TmpStr;
    TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiNUMDOC.Index]);
    if TmpStr <> '' then AHintText := AHintText + ' n. ' + TmpStr + Trim(ARecord.DisplayTexts[cvAllegatiREGDOC.Index]);
    TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiDATADOC.Index]);
    if (TmpStr <> '') and (TmpStr <> '01/01/1900') then AHintText := AHintText + ' del ' + TmpStr;
  end;

  // Soggetto
  TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiALL_SOGGETTO.Index]);
  if TmpStr <> '' then begin
    AHintText := AHintText + #13#13'Soggetto: ' + TmpStr;
  end;

  // Pratica
  TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiALL_RIFPRATICA.Index]);
  if TmpStr <> '' then begin
    AHintText := AHintText + #13#13'Pratica: ' + TmpStr;
  end;

  // Creazione
  if not VarIsNull(ARecord.Values[cvAllegatiCREAZ_DATAORA.Index]) then begin
    TmpStr := FormatDatetime('dd/mm/yy', ARecord.Values[cvAllegatiCREAZ_DATAORA.Index]);
    if TmpStr <> '' then AHintText := AHintText + #13#13'Creato il ' + TmpStr;
    TmpStr := FormatDatetime('hh.nn', ARecord.Values[cvAllegatiCREAZ_DATAORA.Index]);
    if TmpStr <> '' then AHintText := AHintText + ' ore ' + TmpStr;
    TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiCREAZ_OPERATORE.Index]);
    if TmpStr <> '' then AHintText := AHintText + ' op. ' + TmpStr;
  end;

  // Ultima modifica
  if not VarIsNull(ARecord.Values[cvAllegatiULTMOD_DATAORA.Index]) then begin
    TmpStr := FormatDatetime('dd/mm/yy', ARecord.Values[cvAllegatiULTMOD_DATAORA.Index]);
    if TmpStr <> '' then AHintText := AHintText + #13#13'Ultima variazione il ' + TmpStr;
    TmpStr := FormatDatetime('hh.nn', ARecord.Values[cvAllegatiULTMOD_DATAORA.Index]);
    if TmpStr <> '' then AHintText := AHintText + ' ore ' + TmpStr;
    TmpStr := Trim(ARecord.DisplayTexts[cvAllegatiULTMOD_OPERATORE.Index]);
    if TmpStr <> '' then AHintText := AHintText + ' op. ' + TmpStr;
  end;

end;

procedure TAllegatiForm.eFilterTrovaPropertiesChange(Sender: TObject);
var
  FilterValue: String;
begin
  try
    // RIcava il testo per il filtro inseritodall'utente
    FilterValue := Trim(eFilterTrova.Text);
    // Azzera gli eventuali filtri precedenti
    cvAllegati.DataController.Filter.Root.Clear;
    // Se non è stato specificato nulla esce subito
    if FilterValue = '' then Exit;
    // IMposta l'operatore logico
    cvAllegati.DataController.Filter.Root.BoolOperatorKind := fboAnd;
    // Aggiunge la condizione di filtraggio
    cvAllegati.DataController.Filter.Root.AddItem(cvAllegatiNOTE, foLike, '%'+FilterValue+'%', FilterValue);
  finally
    // Abilita o disabilita il pulsante di azzeramento filtro in base al caso
    sbResetFilter.Enabled := (FilterValue <> ''); 
  end;
end;

procedure TAllegatiForm.sbFilterSoggettoClick(Sender: TObject);
begin
  EseguiQuery(False);
end;

procedure TAllegatiForm.sbResetFilterClick(Sender: TObject);
begin
  eFilterTrova.Text := '';
end;

procedure TAllegatiForm.FormDestroy(Sender: TObject);
begin
  // Se c'era una FormAllegati precedente ne imposta
  //  il relativo Splitter in modo che si presenti come quello della Form
  //  che si sta distruggendo
  // NB: Se siamo in modalità ExtFile esce subito in modo da disabilitare
  //      la connessione delle dimensioni e della posizione alle form
  //      allegati precedenti.
  // NB: Imposta anche il filtro che visualizza solo gli allarmi scaduti
  // NB: Verifica anche se la proprietà PrecAllegatiFormIndex che contiene ll'indice della
  //      formAllegati precedente (rispetto all'array che ne contiene uno stack) contenga
  //      ancora un indica valido e quindi che la FormAllegati a cui si riferisce sia ancora esistente e valida
  //      altrimenti darebbe un errore.
  if MainForm.AllegatiFormStack_ExistsByIndex(Self.PrecAllegatiFormIndex) and (PrecSplitter <> nil) and (Self.Mode <> amExtFile) then begin
    // Impostazione splitter
    PrecSplitter.PositionAfterOpen := fSplitter.PositionAfterOpen;
    if not DM1.AllegatiApriChiudiAutomatico then begin
      if fSplitter.State = ssOpened then begin
        if PrecSplitter.State = ssOpened
        then PrecSplitter.Control.Height := fSplitter.Control.Height
        else PrecSplitter.OpenSplitter;
      end else PrecSplitter.CloseSplitter;
    end;
    PrecSplitter.Update;
    // Impostazione filtro Allarmi Scaduti
    PrecAllegatiForm.sbAlarm.Down := Self.sbAlarm.Down;
    PrecAllegatiForm.sbAlarmClick(sbAlarm);
    PrecAllegatiForm.AggiornaAllegatiCount(True);
  end;
  // Elimina la FormAllegati dall'array che contiene la lista delle FormAllegati
  //  presenti
  MainForm.AllegatiFormStack_Elimina;
end;

procedure TAllegatiForm.SetSplitter(const Value: TcxSplitter);
begin
  fSplitter := Value;
  // Chiude gli allegati
  fSplitter.CloseSplitter;
  // Altrimenti in Win7 e Win Vista non si visualizzava correttamente (era invisibile).
  fSPlitter.NativeBackground := False;
  fSplitter.PositionAfterOpen := 148;
  // Se siamo in modalità ExtFile esce subito in modo da disabilitare
  //  la connessione delle dimensioni e della posizione alle form
  //  allegati precedenti.
  if Self.Mode = amExtFile then Exit;
  // Se esisteva una FormAllegati precedente ne usa alcune proprietà
  //  del splitter per inizializzare quello della form attuale
  // NB: Imposta anche il filtro che visualizza gli alarcmi scaduti
  if PrecSplitter <> nil then begin
    fSplitter.PositionAfterOpen := PrecSplitter.PositionAfterOpen;
    if PrecSplitter.State = ssOpened then begin
      fSplitter.Control.Height := PrecSplitter.Control.Height;
      fSplitter.OpenSplitter;
    end;
    // Filtro allarmi scaduti
    Self.sbAlarm.Down := PrecAllegatiForm.sbAlarm.Down;
    Self.sbAlarmClick(sbAlarm);
  end;
  // Assegna il gestore di evento onMoved se questo non è già
  //  speficicato
  if not Assigned(fSplitter.OnMoved) then fSplitter.OnMoved := SplitterAllegatiMoved;
end;


procedure TAllegatiForm.SplitterAllegatiMoved(Sender: TObject);
begin
  // Se siamo in modalità ExtFile esce subito in modo da disabilitare
  //  la connessione delle dimensioni e della posizione alle form
  //  allegati precedenti.
  if (Self <> nil) and (Self.Mode = amExtFile) then Exit;
  // Aggiorna la proprietà PositionAfterOpen in modo che alla eventuale
  //  riapertura dello splitter ritorni della stessa dimensione che aveva prima
  //  della chiusura
  with Sender as TcxSplitter do begin
    // Aggiorna la proprietà PositionAfterOpen in modo che alla eventuale
    //  riapertura dello splitter ritorni della stessa dimensione che aveva prima
    //  della chiusura
    if Control.Height <> 0 then begin
      PositionAfterOpen := Control.Height;
    end;
  end;
  // Se c'è una FormAlegati linkata alla presente la aggiorna
  if Assigned(fLinkedAllegatiForm) then begin
    LinkedAllegatiForm_Update(False);
  end;
end;


procedure TAllegatiForm.sbAlarmClick(Sender: TObject);
begin
  // Se il Button è Down...
  if (Sender as TSpeedButton).Down then begin
    // Disabilita gli altri filtri
    sbFilterNulla.Enabled     := False;
    sbFilterSoggetto.Enabled  := False;
    sbFilterPratica.Enabled   := False;
    sbFilterDocumento.Enabled := False;
    PanelFilters1.Color       := clSilver;
  // Se invece non è Down...
  end else begin
    // Riabilita gli altri filtri
    sbFilterNulla.Enabled     := True;
    sbFilterSoggetto.Enabled  := True;
    sbFilterPratica.Enabled   := True;
    sbFilterDocumento.Enabled := True;
    PanelFilters1.Color       := PanelAlarm.Color;
  end;
  // Riesegue la query
  EseguiQuery(False);
end;

procedure TAllegatiForm.cvAllegatiDataControllerDataChanged(
  Sender: TObject);
begin
  AggiornaAllegatiCount;
end;

// Procedure che aggiorna lo schermo con il numero degli allegati presenti
procedure TAllegatiForm.AggiornaAllegatiCount(Forza:Boolean=False);
var
  Quanti: Integer;
begin
  // Se siamo l'ultima FormAllegati e quindi la visibile
  if (Self = MainForm.AllegatiFormStack_GetLastAllegatiForm) or Forza then
  begin
    // Aggiorna la proprietà della MainForm che contiene il numero degli allegati
    //  presenti
    MainForm.Allegati_Count := cvAllegati.DataController.RecordCount;
    // Esegue anche un polling per vedere se ci sono degli allegati
    //  in allarme
    DM1.Allegati_EseguiPollingAlarm;
  end;
end;

procedure TAllegatiForm.cvAllegatiEditing(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; var AAllow: Boolean);
begin
  // Prima di andare in editing aggiorna i dati perchè potrebbero essere
  //  cambiati.
  RefreshBeforeEdit;
end;

// Funzione che aggiorna i valori del record (nel caso fossero cambiati) perchè
//  se quelli che stiamo vedendo non fossero aggiornati sarebbe facile una perdita di dati.
//  NB: Se tutto va beme restituisce 'T' altrimenti 'F'.
function TAllegatiForm.RefreshBeforeEdit: Boolean;
var
  aCampi: array[1..13] of String;
  i: Integer;
  CurrFieldName: String;
begin
  // Se non sono presenti i dati del protocollo ovviamento non procede
  if QryAllegatiANNOPROT.IsNull or QryAllegatiNUMPROT.IsNull or QryAllegatiREVPROT.IsNull then Exit;
  // Inizializzazione
  Result := False;
  aCampi[1]  := 'TIPODOC';
  aCampi[2]  := 'NUMDOC';
  aCampi[3]  := 'REGDOC';
  aCampi[4]  := 'DATADOC';
  aCampi[5]  := 'CODSOGG';
  aCampi[6]  := 'CODPRAT';
  aCampi[7]  := 'DATAPRAT';
  aCampi[8]  := 'NOTE';
  aCampi[9]  := 'FILE_EXT';
  aCampi[10] := 'FILE_NAME';
  aCampi[11] := 'ALARM_DATAORA';
  aCampi[12] := 'ALARM_FATTO';
  aCampi[13] := 'PA_ALLEGA';
  // Imposta ed apre la query per prelevare i valori aggiornati del protocollo che
  //  si intende modificare
  if QryRefresh.Active then QryRefresh.Close;
  if not QryRefresh.Prepared then QryRefresh.Prepare;
  QryRefresh.Params.ParamByName('P_ANNO').asString     := QryAllegatiANNOPROT.AsString;
  QryRefresh.Params.ParamByName('P_NUMPROT').AsInteger := QryAllegatiNUMPROT.AsInteger;
  QryRefresh.Params.ParamByName('P_REVPROT').AsInteger := QryAllegatiREVPROT.AsInteger;
  QryRefresh.Open;
  try
    // Cicla per tutti i campi e aggiorna i valori che sono cambiati
    for i := 1 to 13 do begin
      CurrFieldName := aCampi[i];
      if QryRefresh.FieldByName(CurrFieldName).Value <> QryAllegati.FieldByName(CurrFieldName).Value then begin
        if QryAllegati.State = dsBrowse then QryAllegati.Edit;
        QryAllegati.FieldByName(CurrFieldName).Value := QryRefresh.FieldByName(CurrFieldName).Value;
      end;
    end;
    // Effettua l'eventuale Post
    if QryAllegati.State = dsEdit then QryAllegati.Post;
    // Se tutto è andato bene restituisce True
    Result := True;
  finally
    QryRefresh.Close;
  end;
end;

// Metodo che aggiorna l'eventuale AllegatiForm linkata con la presente
procedure TAllegatiForm.LinkedAllegatiForm_Update(Refresh:Boolean=False);
begin
  // Se c'è una FormAllegati linkata la aggiorna con i dati
  //  della presente.
  // NB: Non procede se a sua volta è in updating da una AllegatiForm Linkata altrimenti andava in deadlock
  if (LinkedAllegatiForm <> nil) and not UpdatingFromLinkedAllegatiForm then begin
    // Blocca l'updating della Form Che andiamo a sinronizzare
    LinkedAllegatiForm.UpdatingFromLinkedAllegatiForm := True;
    try
      // Splitter
      if      (Self.Splitter.State = ssOpened)
      then LinkedAllegatiForm.Splitter.OpenSplitter
      else if (Self.Splitter.State = ssClosed)
      then LinkedAllegatiForm.Splitter.CloseSplitter;
      LinkedAllegatiForm.Splitter.Control.Height := Self.Splitter.Control.Height;
      // Filtri
      LinkedAllegatiForm.sbAlarm.Down := Self.sbAlarm.Down;
      LinkedAllegatiForm.sbFilterNulla.Down := Self.sbFilterNulla.Down;
      LinkedAllegatiForm.sbFilterSoggetto.Down := Self.sbFilterSoggetto.Down;
      LinkedAllegatiForm.sbFilterPratica.Down := Self.sbFilterPratica.Down;
      LinkedAllegatiForm.sbFilterDocumento.Down := Self.sbFilterDocumento.Down;
      // Se richiesto esegue il refresh dei dati
      if Refresh then LinkedAllegatiForm.EseguiQuery;
    finally
      // Sblocca l'updating della Form Che andiamo a sinronizzare
      LinkedAllegatiForm.UpdatingFromLinkedAllegatiForm := False;
    end;
  end;
end;

procedure TAllegatiForm.SetLinkedAllegatiForm(const Value: TallegatiForm);
begin
  fLinkedAllegatiForm := Value;
  // Fa in modo che siano linkate reciprocamente
  if (fLinkedAllegatiForm <> nil) and (fLinkedAllegatiForm.LinkedAllegatiForm = nil) then begin
    fLinkedAllegatiForm.LinkedAllegatiForm := Self;
    fLinkedAllegatiForm.LinkedAllegatiForm.LinkedAllegatiForm_Update(True);
  end;
end;

procedure TAllegatiForm.QryAllegatiAfterDelete(DataSet: TDataSet);
begin
  // Metodo che aggiorna l'eventuale AllegatiForm linkata con la presente
  LinkedAllegatiForm_Update(True);
end;

procedure TAllegatiForm.QryAllegatiAfterInsert(DataSet: TDataSet);
begin
  // In case di append/insert ne causa subito anche il post in modo che sia
  //  subito definitivo e abbia quindi i campi chiave
  DataSet.Post;
end;

procedure TAllegatiForm.QryAllegatiAfterOpen(DataSet: TDataSet);
begin
  // Metodo che aggiorna l'eventuale AllegatiForm linkata con la presente
  LinkedAllegatiForm_Update(True);
end;

procedure TAllegatiForm.QryAllegatiAfterRefresh(DataSet: TDataSet);
begin
  // Metodo che aggiorna l'eventuale AllegatiForm linkata con la presente
  LinkedAllegatiForm_Update(True);
end;

procedure TAllegatiForm.Modello1Click(Sender: TObject);
var
   NomeExtFile, Anno:String;
   Prot, RevProt: Integer;
begin
  // Crea il nome del file esterno da utilizzare in questa sessione (deve essere composto da 'Levante_' + HHMMSS + '.XXX' in modo che più copie
  //  del programma usino sempre un nome di file diverso senza collisioni)
  // NB: Il nome deve essere senza estensione perchè a questo punto non si sà ancora qual'è, l'estensione verrà aggiunta in seguito.
  NomeExtFile := DM1.CartellaTmp + 'Levante_' + FormatDateTime('hhmmsszzz', Now) + '.';
  // Crea il nuovo Allegato già con una copia del file selezionato
  // -------------------------------------------------------------
  DM1.Attendere;
  try
   // Crea la query che
   // Si sposta sul record relativo al programma associato al file
   //  che si vuole aprire.
   if QryExtPrg.Active then QryExtPrg.Close;
   QryExtPrg.SQL.Clear;
   QryExtPrg.SQL.Add('SELECT FIRST 1 DESCRIZIONE, ESTENSIONE, BLANKFILE FROM EXTPRG WHERE CODICE = ' + IntToStr((Sender as TMenuItem).Tag));
   QryExtPrg.Open;
   if not QryExtPrg.Eof then begin
     // Preleva dalla tabella dei collegamenti ai programmi esterni il file blank di default del collegamento
     //  e lo salva nella cartella temporanea per poi aprirlo con il programma prescelto
     QryExtPrgBLANKFILE.SaveToFile(NomeExtFile + QryExtPrgESTENSIONE.AsString);
     // Crea il nuovo allegato a cui assegnare già il file
     QryAllegati.Append;
     try
       // CALCOLO E ASSEGNAZIONE PROTOCOLLO A UN NUOVO RECORD
       Anno    := FormatDateTime('yyyy', Now);
       Prot    := NextProt(Anno);
       RevProt := NextRevProt(Anno, Prot);
       QryAllegatiANNOPROT.Value := Anno;
       QryAllegatiNUMPROT.Value  := Prot;
       QryAllegatiREVPROT.Value  := RevProt;
       // Imposta la descrizione
       if Trim(QryExtPrgDESCRIZIONE.AsString) <> ''
       then QryAllegatiNOTE.Value := Trim(QryExtPrgDESCRIZIONE.AsString)
       else QryAllegatiNOTE.Value := 'Nuovo allegato';
       // Post
       QryAllegati.Post;
     except
       QryAllegati.Cancel;
       raise;
     end;
     // Comprime il file e lo carica nel database
     PutFileNameOnDatabase(Anno, Prot, RevProt, NomeExtFile + QryExtPrgESTENSIONE.AsString);
     // Refresh dell'elenco allegati
     QryAllegati.Refresh;
   end else begin
     DM1.Messaggi('Documenti Esterni', 'Programma associato al file non trovato nell''archivio dei programmi esterni.', '', [mbOK], 0, nil);
   end;
 finally
   DM1.ChiudiAttendere;
   QryExtPrg.Close;
 end;
end;



procedure TAllegatiForm.CaricaSubMenuExtDoc;
var
  NewMenuItem: TMenuItem;
  Qry: TIB_Cursor;
begin
   Qry := TIB_Cursor.Create(Self);
   try
      // Imposta la query che ricaverà i tipi di documenti esterni tra cui scegliere
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT CODICE, DESCRIZIONE FROM EXTPRG');
      Qry.Open;
      // Azzera tutto
      ExtFilesMenu.Items.Clear;
      // Cicla per tutti i record trovati in modo da
      //  aggiungere le relative voci al sottomenù
      while not Qry.Eof do begin
        // Crea la nuova MenùItem
        NewMenuItem := TMenuItem.Create(Self);
        NewMenuItem.Tag := Qry.FieldByName('CODICE').AsInteger;
        NewMenuItem.Caption := Qry.FieldByName('DESCRIZIONE').AsString;
        NewMenuItem.OnClick := Modello1Click;
        ExtFilesMenu.Items.Add(NewMenuItem);
        // Avanti il prossimo
        Qry.Next;
      end;
   finally
     Qry.Free;
   end;
end;



procedure TAllegatiForm.ExtFilesMenuPopup(Sender: TObject);
begin
  CaricaSubMenuExtDoc;
end;

end.
