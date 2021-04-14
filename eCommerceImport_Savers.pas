unit eCommerceImport_Savers;

interface

uses
  IBODataset, System.Generics.Collections, eCommerceImport_Common;

type

  TecSaver = class abstract (TecBaseClass)
  public
  strict private
  var
    FDB: TIBODatabase;
  strict protected
    procedure SetDB1(const Value: TIBODatabase);
    function CreateAndInitQuery: TIBOQuery;
    function VirgolaPunto(Numero:Extended): String;
  public
    property DB: TIBODatabase read FDB write SetDB1;
    procedure SaveOrLoad; virtual;
    procedure Save; virtual;
    procedure SetIvaByAliquota(NewAliquota:Integer; var CodiceIva:Integer; var DescrizioneIVA:String; var AliquotaIVA:Double);
    procedure SetIvaByPriceAndTax(Price, Tax: Currency; var CodiceIva:Integer; var DescrizioneIVA:String; var AliquotaIVA:Double);
    constructor Create(DB:TIBODatabase); virtual;
  end;

  TecSaverSoggetto = class(TecSaver)
  strict private
    FCap: String;
    FCellulare: String;
    FCitta: String;
    FCodice: Integer;
    FCodiceFiscale: String;
    FEmail: String;
    FFax: String;
    FIndirizzo: String;
    FNumCivico: String;
    FPartitaIVA: String;
    FProvincia: String;
    FRagioneSociale: String;
    FTelefono: String;
  strict
  private
    procedure SetCodiceFiscale(const Value: String);
    procedure SetPartitaIVA(const Value: String); protected
    function Exists: Boolean;
  public
    property Codice: Integer read FCodice write FCodice;
    property RagioneSociale: String read FRagioneSociale write FRagioneSociale;
    property Indirizzo: String read FIndirizzo write FIndirizzo;
    property NumCivico: String read FNumCivico write FNumCivico;
    property Citta: String read FCitta write FCitta;
    property Cap: String read FCap write FCap;
    property Provincia: String read FProvincia write FProvincia;
    property Telefono: String read FTelefono write FTelefono;
    property Fax: String read FFax write FFax;
    property Cellulare: String read FCellulare write FCellulare;
    property PartitaIVA: String read FPartitaIVA write SetPartitaIVA;
    property CodiceFiscale: String read FCodiceFiscale write SetCodiceFiscale;
    property Email: String read FEmail write FEmail;
    procedure SaveOrLoad; override;
  end;

  TecSaverDocRow = class(TecSaver)
  strict private
    FCodiceArticolo: String;
    FProgRigo: Integer;
    FDescrizione: String;
    FPrezzoUnitario: Currency;
    FPrezzoUnitarioIvaCompresa: Currency;
    FUnitaDiMisura: String;
    FQta: Double;
    FScontoRigo1: Double;
    FScontoRigo2: Integer;
    FScontoRigo3: Double;
    FImportoRigo: Currency;
    FImportoRigoIvaCompresa: Currency;
    FCodiceIva: Integer;
    FDescrizioneIva: String;
    FAliquotaIva: Double;
    FMargine: Double;
    FImportoMargine: Currency;
    FPrezzoAcquistoArticolo: Currency;
  public
    property CodiceArticolo: String read FCodiceArticolo write FCodiceArticolo;
    property ProgRigo: Integer read FProgRigo write FProgRigo;
    property Descrizione: String read FDescrizione write FDescrizione;
    property PrezzoUnitario: Currency read FPrezzoUnitario write FPrezzoUnitario;
    property PrezzoUnitarioIvaCompresa: Currency read FPrezzoUnitarioIvaCompresa write FPrezzoUnitarioIvaCompresa;
    property UnitaDiMisura: String read FUnitaDiMisura write FUnitaDiMisura;
    property Qta: Double read FQta write FQta;
    property ScontoRigo1: Double read FScontoRigo1 write FScontoRigo1;
    property ScontoRigo2: Integer read FScontoRigo2 write FScontoRigo2;
    property ScontoRigo3: Double read FScontoRigo3 write FScontoRigo3;
    property ImportoRigo: Currency read FImportoRigo write FImportoRigo;
    property ImportoRigoIvaCompresa: Currency read FImportoRigoIvaCompresa write FImportoRigoIvaCompresa;
    property CodiceIva: Integer read FCodiceIva write FCodiceIva;
    property DescrizioneIva: String read FDescrizioneIva write FDescrizioneIva;
    property AliquotaIva: Double read FAliquotaIva write FAliquotaIva;
    property Margine: Double read FMargine write FMargine;
    property ImportoMargine: Currency read FImportoMargine write FImportoMargine;
    property PrezzoAcquistoArticolo: Currency read FPrezzoAcquistoArticolo write FPrezzoAcquistoArticolo;
    procedure Save(DocTipo: String; DocReg: String; DocNum: Integer;
      DocData: TDateTime; CodiceCliente, ProgRigo: Integer); Overload;
  end;

  TecSaverDoc = class(TecSaver)
  strict private
    FRows: TObjectList<TecSaverDocRow>;
    FTipoDocumento: String;
    FRegistro: String;
    FNumOrdPrev: Integer;
    FDataDocumento: TDateTime;
    FListino: Integer;
    FCausale: String;
    FSoggetto: TecSaverSoggetto;
    FDestinazioneMerce: TecSaverSoggetto;
    FRifDoc_Reg: String;
    FRifDoc_Tipo: String;
    FRifDoc_Data: TDateTime;
    FRifDoc_Num: Integer;
    FTotaleRighi4: Currency;
    FImportoIva4: Currency;
    FCodiceIva2: Integer;
    FCodiceIva3: Integer;
    FCodiceIva1: Integer;
    FScontoAliquota2: Double;
    FScontoAliquota3: Double;
    FCodiceIva4: Integer;
    FScontoAliquota1: Double;
    FTotaleImponibile2: Currency;
    FTotaleImponibile3: Currency;
    FScontoAliquota4: Double;
    FTotaleRighi2: Currency;
    FImportoIva2: Currency;
    FTotaleImponibile1: Currency;
    FTotaleRighi3: Currency;
    FImportoIva3: Currency;
    FTotaleRighi1: Currency;
    FImportoIva1: Currency;
    FTotaleImponibile4: Currency;
    FTotaleImponibile: Currency;
    FTotaleSconti: Currency;
    FTotaleMargine: Currency;
    FTotaleIva: Currency;
    FSpese: Currency;
    FTotaleDocumento: Currency;
    FTotaleNettoMerce: Currency;
    FTotaleDaPagare: Currency;
    FTotaleMerce: Currency;
  strict protected
    procedure SaveMaster;
    procedure SaveDetails;
  public
    /// <supplierCardinality>0..*</supplierCardinality>
    /// <clientCardinality>1</clientCardinality>
    /// <directed>True</directed>
    /// <link>aggregationByValue</link>
    /// <clientQualifier>Rows</clientQualifier>
    property Rows: TObjectList<TecSaverDocRow> read FRows write FRows;
    property TipoDocumento:String read FTipoDocumento write FTipoDocumento;
    property Registro:String read FRegistro write FRegistro;
    property NumOrdPrev:Integer read FNumOrdPrev write FNumOrdPrev;
    property DataDocumento:TDateTime read FDataDocumento write FDataDocumento;
    property Causale:String read FCausale write FCausale;
    property Listino:Integer read FListino write FListino;
    property Soggetto:TecSaverSoggetto read FSoggetto write FSoggetto;
    property DestinazioneMerce:TecSaverSoggetto read FDestinazioneMerce write FDestinazioneMerce;
    property RifDoc_Tipo:String read FRifDoc_Tipo write FRifDoc_Tipo;
    property RifDoc_Num:Integer read FRifDoc_Num write FRifDoc_Num;
    property RifDoc_Reg:String read FRifDoc_Reg write FRifDoc_Reg;
    property RifDoc_Data:TDateTime read FRifDoc_Data write FRifDoc_Data;
    property CodiceIva1:Integer read FCodiceIva1 write FCodiceIva1;
    property CodiceIva2:Integer read FCodiceIva2 write FCodiceIva2;
    property CodiceIva3:Integer read FCodiceIva3 write FCodiceIva3;
    property CodiceIva4:Integer read FCodiceIva4 write FCodiceIva4;
    property TotaleRighi1:Currency read FTotaleRighi1 write FTotaleRighi1;
    property TotaleRighi2:Currency read FTotaleRighi2 write FTotaleRighi2;
    property TotaleRighi3:Currency read FTotaleRighi3 write FTotaleRighi3;
    property TotaleRighi4:Currency read FTotaleRighi4 write FTotaleRighi4;
    property ScontoAliquota1:Double read FScontoAliquota1 write FScontoAliquota1;
    property ScontoAliquota2:Double read FScontoAliquota2 write FScontoAliquota2;
    property ScontoAliquota3:Double read FScontoAliquota3 write FScontoAliquota3;
    property ScontoAliquota4:Double read FScontoAliquota4 write FScontoAliquota4;
    property TotaleImponibile1:Currency read FTotaleImponibile1 write FTotaleImponibile1;
    property TotaleImponibile2:Currency read FTotaleImponibile2 write FTotaleImponibile2;
    property TotaleImponibile3:Currency read FTotaleImponibile3 write FTotaleImponibile3;
    property TotaleImponibile4:Currency read FTotaleImponibile4 write FTotaleImponibile4;
    property ImportoIva1:Currency read FImportoIva1 write FImportoIva1;
    property ImportoIva2:Currency read FImportoIva2 write FImportoIva2;
    property ImportoIva3:Currency read FImportoIva3 write FImportoIva3;
    property ImportoIva4:Currency read FImportoIva4 write FImportoIva4;
    property TotaleMargine:Currency read FTotaleMargine write FTotaleMargine;
    property TotaleMerce:Currency read FTotaleMerce write FTotaleMerce;
    property TotaleSconti:Currency read FTotaleSconti write FTotaleSconti;
    property TotaleNettoMerce:Currency read FTotaleNettoMerce write FTotaleNettoMerce;
    property Spese:Currency read FSpese write FSpese;
    property TotaleImponibile:Currency read FTotaleImponibile write FTotaleImponibile;
    property TotaleIva:Currency read FTotaleIva write FTotaleIva;
    property TotaleDocumento:Currency read FTotaleDocumento write FTotaleDocumento;
    property TotaleDaPagare:Currency read FTotaleDaPagare write FTotaleDaPagare;

    constructor Create(DB:TIBODatabase); override;
    destructor Destroy; override;
    function CreateRow(ProgRigo:Integer): TecSaverDocRow;
    procedure Save; override;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils, DataModule1, StrUtils;




{ TecSaverAbstract }

procedure TecSaver.SaveOrLoad;
begin
  ShowMessage('Funzionalità non implementata!');
end;

procedure TecSaver.SetDB1(const Value: TIBODatabase);
begin
  FDB := Value;
end;


procedure TecSaver.SetIvaByAliquota(NewAliquota: Integer;
  var CodiceIva: Integer; var DescrizioneIVA: String; var AliquotaIVA: Double);
var
  Qry: TIBOQuery;
begin
  Qry := Self.CreateAndInitQuery;
  try
    Qry.SQL.Add('SELECT AI.CODICEIVA, AI.DESCRIZIONEIVA, AI.ALIQUOTAIVA FROM ALIQIVA AI WHERE AI.ALIQUOTAIVA = ' + IntToStr(NewAliquota));
    Qry.Open;
    if Qry.Eof then raise Exception.Create('TecSaver (SetIvaByAliquota): Aliquota IVA non trovata.');
    CodiceIVA       := Qry.FieldByName('CODICEIVA').Value;
    DescrizioneIVA  := Qry.FieldByName('DESCRIZIONEIVA').Value;
    AliquotaIVA     := Qry.FieldByName('ALIQUOTAIVA').Value;
  finally
    Qry.Free;
  end;
end;

procedure TecSaver.SetIvaByPriceAndTax(Price, Tax: Currency;
  var CodiceIva: Integer; var DescrizioneIVA:String; var AliquotaIVA: Double);
var
  NewAliquota: Integer;
begin
  // Verifiche iniziali
  if Price = 0 then Exit;
  // Calcola l'aliquota IVA applicata
  NewAliquota := Round(Tax * 100 / Price);
  // Ritornai valori
  SetIvaByAliquota(NewAliquota, CodiceIva, DescrizioneIva, AliquotaIva);
end;

function TecSaver.VirgolaPunto(Numero: Extended): String;
var
  PrecDecimalSeparator: Char;
begin
  PrecDecimalSeparator := FormatSettings.DecimalSeparator;
  FormatSettings.DecimalSeparator := '.';
  Result := Format('%f', [Numero]);
  FormatSettings.DecimalSeparator := PrecDecimalSeparator;
end;

procedure TecSaver.Save;
begin
  ShowMessage('Funzionalità non implementata!');
end;


{ TecSaverSoggetto }

procedure TecSaverSoggetto.SaveOrLoad;
var
  Qry: TIBOQuery;
begin
  // Se ne trova uno che la stssa Partita IVA oppure in seconda
  //  battuta lo stesso CodiceFiscale assume che sia lo stesso soggetto
  //  e quindi ne carica il Codice e non lo crea nuovo.
  if Self.Exists then Exit;
  // Se non è già stato impostato il codice del soggetto lo ricava
  if Self.FCodice = 0 then Self.Codice := DM1.NextCodice('CLIENTI', 'CODICE');
  // Altrimenti lo crea nuovo e ne ritorna il codice
  Qry := Self.CreateAndInitQuery;
  try
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO CLIENTI (');
    Qry.SQL.Add(' CODICE');
    Qry.SQL.Add(',CLIENTEFORNITORE');
    Qry.SQL.Add(',RAGIONESOCIALE');
    Qry.SQL.Add(',INDIRIZZO');
    Qry.SQL.Add(',NUMCIVICO');
    Qry.SQL.Add(',CITTA');
    Qry.SQL.Add(',CAP');
    Qry.SQL.Add(',PROVINCIA');
    Qry.SQL.Add(',TELEFONO');
    Qry.SQL.Add(',FAX');
    Qry.SQL.Add(',CELLULARE');
    Qry.SQL.Add(',PARTITAIVA');
    Qry.SQL.Add(',CODICEFISCALE');
    Qry.SQL.Add(',EMAIL');
    Qry.SQL.Add(') VALUES (');
    Qry.SQL.Add(IntToStr(Self.FCodice));
    Qry.SQL.Add(',' + QuotedStr('Cliente'));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FRagioneSociale, 60)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FIndirizzo, 80)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FNumCivico, 10)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FCitta, 60)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FCap, 5)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FProvincia, 3)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FTelefono, 30)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FFax, 30)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FCellulare, 30)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FPartitaIVA, 16)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FCodiceFiscale, 16)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FEmail, 60)));
    Qry.SQL.Add(')');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TecSaverSoggetto.SetCodiceFiscale(const Value: String);
begin
  // Per essere sicuri che il dato sia pulito visto che viene usato
  //  per controllare l'esistenza del soggetto
  FCodiceFiscale := Trim(Value);
end;

procedure TecSaverSoggetto.SetPartitaIVA(const Value: String);
begin
  // Per essere sicuri che il dato sia pulito visto che viene usato
  //  per controllare l'esistenza del soggetto
  FPartitaIVA := Trim(Value);
end;

function TecSaverSoggetto.Exists: Boolean;
var
  Qry:TIBOQuery;
begin
  Result := False;
  Qry := Self.CreateAndInitQuery;
  try
    // Prima lo cerca per Partita IVA
    if Self.FPartitaIVA <> '' then
    begin
      Qry.SQL.Add('SELECT C.CODICE FROM CLIENTI C WHERE C.PARTITAIVA = ' + QuotedStr(Self.FPartitaIVA));
      Qry.Open;
      if not Qry.Eof then
      begin
        Self.Codice := Qry.Fields[0].AsInteger;
        Result := True;
        Exit;
      end;
    // Poi per codice fiscale
    end
    else
    if Self.FCodiceFiscale <> '' then
    begin
      Qry.SQL.Clear;
      Qry.SQL.Add('SELECT C.CODICE FROM CLIENTI C WHERE C.CODICEFISCALE = ' + QuotedStr(Self.FCodiceFiscale));
      Qry.Open;
      if not Qry.Eof then
      begin
        Self.Codice := Qry.Fields[0].AsInteger;
        Result := True;
        Exit;
      end;
    end;
    // Altrimenti restituisce False
  finally
    Qry.Free;
  end;
end;

constructor TecSaver.Create(DB: TIBODatabase);
begin
  inherited Create;
  FDB := DB;
end;

function TecSaver.CreateAndInitQuery: TIBOQuery;
begin
  Result := TIBOQuery.Create(nil);
  Result.IB_Connection := Self.DB;
end;

procedure TecSaverDocRow.Save(DocTipo: String; DocReg: String; DocNum: Integer; DocData: TDateTime; CodiceCliente, ProgRigo: Integer);
var
  Qry: TIBOQuery;
  NewGUID: String;
begin
  Qry := Self.CreateAndInitQuery;
  try
    Qry.SQL.Add('INSERT INTO RIGHIPRV (');
    Qry.SQL.Add(' TIPODOCUMENTO');
    Qry.SQL.Add(',REGISTRO');
    Qry.SQL.Add(',NUMORDPREV');
    Qry.SQL.Add(',DATADOCUMENTO');
    Qry.SQL.Add(',CODICECLIENTE');
    Qry.SQL.Add(',CODICEARTICOLO');
    Qry.SQL.Add(',CODICEARTICOLOSTM');
    Qry.SQL.Add(',PROGRIGO');
    Qry.SQL.Add(',PROGRIGO2');
    Qry.SQL.Add(',DESCRIZIONE');
    Qry.SQL.Add(',PREZZOUNITARIO');
    Qry.SQL.Add(',PREZZOUNITARIOIVACOMPRESA');
    Qry.SQL.Add(',UNITADIMISURA');
    Qry.SQL.Add(',QTA');
    Qry.SQL.Add(',SCONTORIGO');
    Qry.SQL.Add(',SCONTORIGO2');
    Qry.SQL.Add(',SCONTORIGO3');
    Qry.SQL.Add(',IMPORTORIGO');
    Qry.SQL.Add(',IMPORTORIGOIVACOMPRESA');
    Qry.SQL.Add(',CODICEIVA');
    Qry.SQL.Add(',DESCRIZIONEIVA');
    Qry.SQL.Add(',ALIQUOTAIVA');
    Qry.SQL.Add(',MARGINE');
    Qry.SQL.Add(',IMPORTOMARGINE');
    Qry.SQL.Add(',PREZZOACQUISTOARTICOLO');
    Qry.SQL.Add(',GUID');
    Qry.SQL.Add(',GUID_REF');
    Qry.SQL.Add(') VALUES (');
    Qry.SQL.Add(      QuotedStr(LeftStr(DocTipo, 25)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(DocReg, 5)));
    Qry.SQL.Add(',' + IntToStr(DocNum));
    Qry.SQL.Add(',' + QuotedStr(FormatDateTime('mm/dd/yyyy', DocData)));
    Qry.SQL.Add(',' + IntToStr(CodiceCliente));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FCodiceArticolo, 25)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FCodiceArticolo, 25)));
    Qry.SQL.Add(',' + IntToStr(ProgRigo));
    Qry.SQL.Add(', -1');
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FDescrizione, 5000)));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FPrezzoUnitario));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FPrezzoUnitarioIvaCompresa));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FUnitaDiMisura, 2)));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FQta));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FScontoRigo1));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FScontoRigo2));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FScontoRigo3));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FImportoRigo));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FImportoRigoIvaCompresa));
    Qry.SQL.Add(',' + IntToStr(Self.FCodiceIva));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FDescrizioneIva, 40)));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FAliquotaIva));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FMargine));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FImportoMargine));
    Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FPrezzoAcquistoArticolo));
    NewGUID := Self.GUIDAsString;
    Qry.SQL.Add(',' + QuotedStr(LeftStr(NewGUID, 40)));
    Qry.SQL.Add(',' + QuotedStr(LeftStr(NewGUID, 40)));
    Qry.SQL.Add(')');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;


{ TecSaverDoc }

constructor TecSaverDoc.Create(DB:TIBODatabase);
begin
  inherited;
  // Crea il soggetto
  FSoggetto := TecSaverSoggetto.Create(DB);
  FDestinazioneMerce := TecSaverSoggetto.Create(DB);
  // Crea la lista dei righi
  FRows := TObjectList<TecSaverDocRow>.Create(True);
end;

destructor TecSaverDoc.Destroy;
begin
  FreeAndNil(FSoggetto);
  FreeAndNil(FDestinazioneMerce);
  FreeAndNil(FRows);
  inherited Destroy;
end;

function TecSaverDoc.CreateRow(ProgRigo: Integer): TecSaverDocRow;
begin
  Result := TecSaverDocRow.Create(DB);
  Result.ProgRigo := ProgRigo;
  FRows.Add(Result);
end;

procedure TecSaverDoc.SaveMaster;
var
  Qry: TIBOQuery;
begin
  Qry := Self.CreateAndInitQuery;
  try
     // Salvataggio testata documento
     Qry.SQL.Add('INSERT INTO PRVORDCL (');
     Qry.SQL.Add(' TIPODOCUMENTO');
     Qry.SQL.Add(',TIPODOCUMENTOESTESO');
     Qry.SQL.Add(',REGISTRO');
     Qry.SQL.Add(',NUMORDPREV');
     Qry.SQL.Add(',DATADOCUMENTO');
     Qry.SQL.Add(',CAUSALE');
     Qry.SQL.Add(',LISTINO');
     Qry.SQL.Add(',CODICEIVA1');
     Qry.SQL.Add(',CODICEIVA2');
     Qry.SQL.Add(',CODICEIVA3');
     Qry.SQL.Add(',CODICEIVA4');
     Qry.SQL.Add(',TOTALERIGHI1');
     Qry.SQL.Add(',TOTALERIGHI2');
     Qry.SQL.Add(',TOTALERIGHI3');
     Qry.SQL.Add(',TOTALERIGHI4');
     Qry.SQL.Add(',SCONTOALIQUOTA1');
     Qry.SQL.Add(',SCONTOALIQUOTA2');
     Qry.SQL.Add(',SCONTOALIQUOTA3');
     Qry.SQL.Add(',SCONTOALIQUOTA4');
     Qry.SQL.Add(',TOTALEIMPONIBILE1');
     Qry.SQL.Add(',TOTALEIMPONIBILE2');
     Qry.SQL.Add(',TOTALEIMPONIBILE3');
     Qry.SQL.Add(',TOTALEIMPONIBILE4');
     Qry.SQL.Add(',IMPORTOIVA1');
     Qry.SQL.Add(',IMPORTOIVA2');
     Qry.SQL.Add(',IMPORTOIVA3');
     Qry.SQL.Add(',IMPORTOIVA4');
     Qry.SQL.Add(',TOTALEMARGINE');
     Qry.SQL.Add(',TOTALEMERCE');
     Qry.SQL.Add(',TOTALESCONTI');
     Qry.SQL.Add(',TOTALENETTOMERCE');
     Qry.SQL.Add(',SPESE');
     Qry.SQL.Add(',TOTALEIMPONIBILE');
     Qry.SQL.Add(',TOTALEIVA');
     Qry.SQL.Add(',TOTALEDOCUMENTO');
     Qry.SQL.Add(',TOTALEDAPAGARE');
     Qry.SQL.Add(',RIFDOC_TIPO');
     Qry.SQL.Add(',RIFDOC_NUM');
     Qry.SQL.Add(',RIFDOC_REG');
     Qry.SQL.Add(',RIFDOC_DATA');
     Qry.SQL.Add(',CODICECLIENTE');
     Qry.SQL.Add(',RAGSOCCLI');
     Qry.SQL.Add(',INDIRIZZOCLI');
     Qry.SQL.Add(',NUMCIVICOCLI');
     Qry.SQL.Add(',CAPCLI');
     Qry.SQL.Add(',CITTACLI');
     Qry.SQL.Add(',PROVINCIACLI');
     Qry.SQL.Add(',PARTITAIVACLI');
     Qry.SQL.Add(',CODICEFISCALECLI');
     Qry.SQL.Add(',CODICEDESTMERCI');
     Qry.SQL.Add(',RAGSOCDESTMERCI');
     Qry.SQL.Add(',INDIRIZZODESTMERCI');
     Qry.SQL.Add(',NUMCIVICODESTMERCI');
     Qry.SQL.Add(',CAPDESTMERCI');
     Qry.SQL.Add(',CITTADESTMERCI');
     Qry.SQL.Add(',PROVINCIADESTMERCI');
     Qry.SQL.Add(') VALUES (');
     Qry.SQL.Add(      QuotedStr(LeftStr(Self.FTipoDocumento, 25)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FTipoDocumento, 25)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FRegistro, 5)));
     Qry.SQL.Add(',' + IntToStr(Self.FNumOrdPrev));
     Qry.SQL.Add(',' + QuotedStr(FormatDateTime('mm/dd/yyyy', Self.FDataDocumento)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FCausale, 40)));
     Qry.SQL.Add(',' + IntToStr(Self.FListino));
     Qry.SQL.Add(',' + IntToStr(Self.FCodiceIva1));
     Qry.SQL.Add(',' + IntToStr(Self.FCodiceIva2));
     Qry.SQL.Add(',' + IntToStr(Self.FCodiceIva3));
     Qry.SQL.Add(',' + IntToStr(Self.FCodiceIva4));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleRighi1));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleRighi2));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleRighi3));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleRighi4));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FScontoAliquota1));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FScontoAliquota2));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FScontoAliquota3));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FScontoAliquota4));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleImponibile1));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleImponibile2));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleImponibile3));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleImponibile4));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FImportoIva1));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FImportoIva2));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FImportoIva3));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FImportoIva4));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleMargine));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleMerce));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleSconti));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleNettoMerce));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FSpese));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleImponibile));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleIva));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleDocumento));
     Qry.SQL.Add(',' + Self.VirgolaPunto(Self.FTotaleDaPagare));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FRifDoc_Tipo, 25)));
     Qry.SQL.Add(',' + IntToStr(Self.FRifDoc_Num));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FRifDoc_Reg, 5)));
     Qry.SQL.Add(',' + QuotedStr(FormatDateTime('mm/dd/yyyy', Self.FRifDoc_Data)));
     Qry.SQL.Add(',' + IntToStr(Self.FSoggetto.Codice));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FSoggetto.RagioneSociale, 60)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FSoggetto.Indirizzo, 80)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FSoggetto.NumCivico, 10)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FSoggetto.Cap, 5)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FSoggetto.Citta, 60)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FSoggetto.Provincia, 3)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FSoggetto.PartitaIVA, 16)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FSoggetto.CodiceFiscale, 16)));
     Qry.SQL.Add(',' + IntToStr(Self.FDestinazioneMerce.Codice));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FDestinazioneMerce.RagioneSociale, 60)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FDestinazioneMerce.Indirizzo, 80)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FDestinazioneMerce.NumCivico, 10)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FDestinazioneMerce.Cap, 5)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FDestinazioneMerce.Citta, 60)));
     Qry.SQL.Add(',' + QuotedStr(LeftStr(Self.FDestinazioneMerce.Provincia, 3)));
     Qry.SQL.Add(')');
     Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TecSaverDoc.SaveDetails;
var
  Row: TecSaverDocRow;
  i: Integer;
begin
  i := 0;
  for Row in FRows do begin
    Row.Save(Self.FTipoDocumento, Self.Registro, Self.NumOrdPrev, Self.DataDocumento, Self.Soggetto.Codice, i);
    Inc(i);
  end;
end;

procedure TecSaverDoc.Save;
var
  InTransaction: Boolean;
begin
  InTransaction := Self.DB.InTransaction;
  if not InTransaction then Self.DB.StartTransaction;
  try
    // Salvataggio soggetto
    Self.Soggetto.SaveOrLoad;
    // Salvataggio testata documento
    Self.SaveMaster;
    // Salvataggio righi documento
    Self.SaveDetails;
    if not InTransaction then Self.DB.Commit;
  except
    if not InTransaction then Self.DB.Rollback;
    raise;
  end;
end;




end.
