unit FormEtichetteListStampa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormEtichetteBase, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxTextEdit, IBODataset, frxClass, frxDBSet, frxBarcode, frxDesgn, Vcl.Menus,
  Vcl.Buttons, bmpPanel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ComCtrls, MAURI_SB, IB_Components, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxSchedulerLnk, dxPScxPivotGridLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon;

type
  TEtichetteListStampaForm = class(TEtichetteBaseForm)
    UpDownCopie: TUpDown;
    Copie: TEdit;
    UpDownStarting: TUpDown;
    Starting: TEdit;
    SBStampaEtichette: TSpeedButtonRollOver;
    SBAnteprimaEtichette: TSpeedButtonRollOver;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBStampaEtichetteClick(Sender: TObject);
    procedure SBAnteprimaEtichetteClick(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FTipoEtichetta: Integer;
    FLastID: Integer;
    procedure StampaEtichette(Preview: Boolean);
    procedure InsertBlanksIntoDbTable(Qt: Integer);
    procedure SetTipoEtichetta(const Value: Integer);
    procedure DuplicaRecordsEtichette(Volte: Integer);
    procedure RilevaUltimoID;
    procedure EliminaDuplicatiBlanks;
    { Private declarations }
  public
    { Public declarations }
    property TipoEtichetta: Integer read FTipoEtichetta write SetTipoEtichetta;
    constructor Create(Owner: TComponent);
    procedure PrintSilent(Preview:Boolean; NomeEtichetta:String; NomeStampante:String='');
  end;

var
  EtichetteListStampaForm: TEtichetteListStampaForm;

implementation

{$R *.dfm}

uses DataModule1;



constructor TEtichetteListStampaForm.Create(Owner: TComponent);
begin
  inherited;
  FLastID := 0;
end;

procedure TEtichetteListStampaForm.EliminaDuplicatiBlanks;
var
   Qry:TIB_Cursor;
   Tabella:String;
begin
   // Imposta il nome della tabella
   case TipoEtichetta of
     IDX_ETICHETTA_ARTICOLO: Tabella := 'LABART';
     IDX_ETICHETTA_SOGGETTO: Tabella := 'LABSOGG';
   end;
   // Prosegue con la creazione della query
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Prima di tutto ricava l'ultimo ID assegnato (il più alto)
      Qry.SQL.Add('DELETE FROM ' + Tabella + ' L WHERE');
      Qry.SQL.Add('L.CODICESTAZIONE = ' + QuotedStr(DM1.CodiceUtente));
      Qry.SQL.Add('AND (L.ID < 0 OR L.ID > ' + IntToStr(FLastID) + ')');
      Qry.ExecSQL;
   finally
      Qry.Free;
   end;
end;

procedure TEtichetteListStampaForm.RilevaUltimoID;
var
   Qry:TIB_Cursor;
   Tabella:String;
begin
   // Imposta il nome della tabella
   case TipoEtichetta of
     IDX_ETICHETTA_ARTICOLO: Tabella := 'LABART';
     IDX_ETICHETTA_SOGGETTO: Tabella := 'LABSOGG';
   end;
   // Prosegue con la creazione della query
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // Prima di tutto ricava l'ultimo ID assegnato (il più alto)
      Qry.SQL.Add('SELECT COALESCE(MAX(L.ID),0) FROM ' + Tabella + ' L WHERE L.CODICESTAZIONE = ' + QuotedStr(DM1.CodiceUtente));
      Qry.Open;
      FLastID := Qry.Fields[0].AsInteger;
      Qry.Close;
   finally
      Qry.Free;
   end;
end;

procedure TEtichetteListStampaForm.DuplicaRecordsEtichette(Volte:Integer);
var
   Qry:TIB_Cursor;
   Tabella:String;
   I: Integer;
begin
   // Imposta il nome della tabella
   case TipoEtichetta of
     IDX_ETICHETTA_ARTICOLO: Tabella := 'LABART';
     IDX_ETICHETTA_SOGGETTO: Tabella := 'LABSOGG';
   end;
   // Prosegue con la creazione della query
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // IMposta la query per la duplicazione dei records
      Qry.SQL.Add('INSERT INTO ' + Tabella);
      Qry.SQL.Add('SELECT L.* FROM ' + Tabella + ' L WHERE L.CODICESTAZIONE = ' + QuotedStr(DM1.CodiceUtente) + ' AND L.ID <= ' + IntToStr(FLastID));
      // Esegue la query tante volte per arrivare al numero di etichette desiderate
      //  per ogni elemento.
      for I := 2 to Volte do Qry.ExecSQL;
   finally
      Qry.Free;
   end;
end;

procedure TEtichetteListStampaForm.InsertBlanksIntoDbTable(Qt:Integer);
var
   Qry:TIB_Cursor;
   Tabella:String;
   i: Integer;
begin
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      // IMposta il nome della tabella
      case TipoEtichetta of
         IDX_ETICHETTA_ARTICOLO: Tabella := 'LABART';
         IDX_ETICHETTA_SOGGETTO: Tabella := 'LABSOGG';
      end;
      Qry.SQL.Add('INSERT INTO ' + Tabella + ' (CODICESTAZIONE, PROGRIGO) VALUES (' + QuotedStr(DM1.CodiceUtente) + ', -1)');
      for i := 1 to Qt do Qry.ExecSql;
   finally
      Qry.Free;
   end;
end;



procedure TEtichetteListStampaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EtichetteListStampaForm := nil;
end;

procedure TEtichetteListStampaForm.FormShow(Sender: TObject);
begin
  inherited;
  RilevaUltimoID;
  GridList.SetFocus;
end;

procedure TEtichetteListStampaForm.SBAnteprimaEtichetteClick(Sender: TObject);
begin
  inherited;
  StampaEtichette(True);
end;

procedure TEtichetteListStampaForm.SBStampaEtichetteClick(Sender: TObject);
begin
  inherited;
  StampaEtichette(False);
end;


procedure TEtichetteListStampaForm.SetTipoEtichetta(const Value: Integer);
begin
  FTipoEtichetta := Value;
  // In base al tipo di etichetta modifica la query dell'elenco etichette
  case TipoEtichetta of
    IDX_ETICHETTA_ARTICOLO:
    begin
      Q.SQL.Add('AND TIPOFILE = ' + QuotedStr('LABART'));
    end;
    IDX_ETICHETTA_SOGGETTO:
    begin
      Q.SQL.Add('AND TIPOFILE = ' + QuotedStr('LABSOGG'));
    end;
  end;
end;

procedure TEtichetteListStampaForm.StampaEtichette(Preview:Boolean);
var
  Starting: Integer;
  Copie: Integer;
  i: Integer;
begin
  inherited;
  DM1.ShowWait('Levante', 'Preparazione stampa...');
  try
    // Inizializzazione
    Copie := UpDownCopie.Position;
    Starting := UpDownStarting.Position - 1;
    // Elimina i duplicati e Blanks Records
    EliminaDuplicatiBlanks;
    // DUplica o records delle etichette tante volte quante sono il numero di
    //  etichette volute per ogni elemento
    DuplicaRecordsEtichette(Copie);
    // Inserimento di records vuoti per spostare la stampa delle etichette
    InsertBlanksIntoDbTable(Starting);
    // Caricamento report
    LoadReport;
    // Stampa
    DM1.CloseWait;
    if Preview then begin
      frxReport1.ShowReport(True);
    end else begin
      frxReport1.PrepareReport(True);
      frxReport1.Print;
    end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TEtichetteListStampaForm.PrintSilent(Preview:Boolean; NomeEtichetta:String; NomeStampante:String='');
begin
  DM1.ShowWait('Levante', 'Preparazione stampa...');
  try
    // Verifica parametri
    if NomeEtichetta = '' then raise Exception.Create('Etichetta non specificata!');
    RilevaUltimoID;
    // IMposta la query in modo che rilevi l'etichetta impostata nei
    //  parametri e progressivi
    Q.SQL.Clear;
    Q.SQL.Add('SELECT');
    Q.SQL.Add(' R.NOMEFILE');
    Q.SQL.Add(',R.FILEPATH');
    Q.SQL.Add(',R.CONTENUTO');
    Q.SQL.Add(',R.TIPOFILE');
    Q.SQL.Add(',R.PRINTER');
    Q.SQL.Add('FROM REPOSITORY R');
    Q.SQL.Add('WHERE R.TIPOFILE LIKE ''LAB%''');
    Q.SQL.Add('  AND R.NOMEFILE = ' + QuotedStr(NomeEtichetta));
    Q.Open;
    // Se non trova l'etichetta da un errore ed esce
    if Q.Eof then raise Exception.Create('Etichetta non trovata!');
    // Caricamento report
    LoadReport;
    // Se ricevuta dal chiamante imposta la stampante che così ha la precedente
    if NomeStampante <> '' then begin
      frxReport1.PrintOptions.Printer := NomeStampante;
      frxReport1.PrintOptions.ShowDialog := False;
    end;
    // Stampa
    DM1.CloseWait;
    if Preview then begin
      frxReport1.ShowReport(True);
    end else begin
      frxReport1.PrepareReport(True);
      frxReport1.Print;
    end;
  finally
    DM1.CloseWait;
    Self.Close;
  end;
end;



procedure TEtichetteListStampaForm.tvListDblClick(Sender: TObject);
begin
  SBStampaEtichetteClick(SBStampaEtichette);
end;

end.
