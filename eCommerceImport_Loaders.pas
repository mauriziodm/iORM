unit eCommerceImport_Loaders;

interface

uses
  Data.SqlExpr, eCommerceImport_Common, eCommerceImport_Items, eCommerceImport_Savers, IBODataset;

type
  TShowWaitMessageProcedure = reference to procedure(Messaggio: String);

  TecLoader = class abstract (TecBaseClass)
  public
  strict private
  var
  var
    FDB: TSqlConnection;
    fSaverDB: TIBODatabase;
    fImportList: TecImportExportItemList;
    fShowWaitMessageProcedure: TShowWaitMessageProcedure;
  strict protected
    property  DB: TSqlConnection read FDB;
    property  SaverDB: TIBODatabase read fSaverDB;
    procedure CreateConnectionToMySQL(ServerName: String; DatabaseName: String; UserName: String; Password: String);
    procedure DestroyConnection;
    function  CreateAndInitQuery: TSQLQuery;
    procedure ShowWaitMessage(Messaggio:String);
  public
    property ImportList: TecImportExportItemList read fImportList;
    property ShowWaitMessageProcedure: TShowWaitMessageProcedure
      read fShowWaitMessageProcedure write fShowWaitMessageProcedure;
    /// <url>element://model:project::levante/delphi:e_class:src:levante:eCommerceImport_Items.TecImportExportItemList</url>
    procedure PrepareImportList; virtual;
    procedure ImportItem(Item: TecImportExportItem); virtual;
    procedure ImportItems; virtual;
    function IsOnlyDigitsString(AValue:String): Boolean;
    constructor Create(ServerName: String; DatabaseName: String;
      UserName: String; Password: String; SaverDB:TIBODatabase); virtual;
    destructor Destroy; override;
  end;

  TecLoaderShoppy = class abstract(TecLoader)
  public
    constructor Create(ServerName: string; DatabaseName: string;
      UserName: string; Password: string; SaverDB: TIBODatabase); override;
  end;

  TecLoaderShoppyInvoices = class(TecLoaderShoppy)
  strict protected
    procedure LoadItemToSaverObject(Saver:TecSaverDoc; Item: TecImportExportItem);
    procedure LoadItemDetailsToSaverObject(Saver:TecSaverDoc; Item: TecImportExportItem);
    procedure RecalcRow(Row:TecSaverDocRow);
    procedure Recalc(Saver:TecSaverDoc);
    procedure MarkAsExported(Item: TecImportExportItem);
  public
    procedure PrepareImportList; override;
    procedure ImportItem(Item: TecImportExportItem); override;
  end;

implementation

uses
  Vcl.Dialogs, System.SysUtils, System.Character;

{ TecLoader }

constructor TecLoader.Create(ServerName, DatabaseName, UserName, Password: String; SaverDB:TIBODatabase);
begin
  inherited Create;
  fImportList := TecImportExportItemList.Create;
  fSaverDB := SaverDB;
end;

function TecLoader.CreateAndInitQuery: TSQLQuery;
begin
  Result := TSQLQuery.Create(nil);
  Result.Close;
  Result.SQLConnection := FDB;
end;

procedure TecLoader.CreateConnectionToMySQL(ServerName, DatabaseName, UserName, Password: String);
begin
  // Crea la connessione al database
  FDB := TSqlConnection.Create(nil);
  FDB.Close;
  FDB.DriverName := 'MySQL';
  FDB.GetDriverFunc := 'getSQLDriverMYSQL';
  FDB.LibraryName := 'dbxmys.dll';
  FDB.VendorLib := 'LIBMYSQL.dll';
  FDB.LoginPrompt := false;
  FDB.Params.Values['HostName'] := ServerName;
  FDB.Params.Values['Database'] := DatabaseName;
  FDB.Params.Values['User_Name'] := UserName;
  FDB.Params.Values['Password'] := Password;
  FDB.Open;
end;

destructor TecLoader.Destroy;
begin
  // Distrugge la ImportList
  fImportList.Free;
  // Distrugge la connessione al database
  DestroyConnection;
  // Eredita
  inherited;
end;

procedure TecLoader.DestroyConnection;
begin
  if FDB.Connected then FDB.Close;
  FDB.Free;
end;

procedure TecLoader.ImportItem(Item: TecImportExportItem);
begin
  inherited;
  // Visualizza in messaggio i attesa per l'utente
  ShowWaitMessage(#13'Importazione:'#13 + Item.ItemDescription);
end;

procedure TecLoader.ImportItems;
var
  CurrImportItem: TecImportExportItem;
begin
  // Cicla per tutte le ImportItems e le importa
  for CurrImportItem in Self.fImportList.ItemList do
  begin
    Self.ImportItem(CurrImportItem);
  end;
end;

function TecLoader.IsOnlyDigitsString(AValue: String): Boolean;
var
  C: Char;
begin
  Result := True;
  for C in AValue do
  begin
    if not IsDigit(C) then
    begin
      Result := False;
      Exit;
    end;
  end;
end;

procedure TecLoader.PrepareImportList;
begin
  // Visualizza in messaggio i attesa per l'utente
  ShowWaitMessage(#13'Importazione:'#13'Sto individuando le voci da importare...');
end;

procedure TecLoader.ShowWaitMessage(Messaggio:String);
begin
  if Assigned(fShowWaitMessageProcedure)
  then fShowWaitMessageProcedure(Messaggio);
end;

{ TecLoaderShoppy }
{ TecLoaderShoppyInvoices }

procedure TecLoaderShoppyInvoices.ImportItem(Item: TecImportExportItem);
var
  Saver: TecSaverDoc;
  CurrRow: TecSaverDocRow;
begin
  inherited;
  // Crea l'oggetto saver
  Saver := TecSaverDoc.Create(Self.SaverDB);
  try
    // Carica i dati della ImportExportItem nel Saver
    Self.LoadItemToSaverObject(Saver, Item);
    // Carica i dati dettaglio (righi)
    LoadItemDetailsToSaverObject(Saver, Item);
    // Ricalcolo dei righi con i dati mancanti
    for CurrRow in Saver.Rows do Self.RecalcRow(CurrRow);
    // RIcalcolo dei totali documento e del castelletto IVA
    Recalc(Saver);
    // Salva il tutto su Levante
    Saver.Save;
    // Marca la voce (documento) come esportata
    Self.MarkAsExported(Item);
  finally
    Saver.Free;
  end;
end;

procedure TecLoaderShoppyInvoices.LoadItemDetailsToSaverObject(Saver: TecSaverDoc; Item: TecImportExportItem);
var
  Qry: TSQLQuery;
  CurrRowSaver: TecSaverDocRow;
begin
  Qry := Self.CreateAndInitQuery;
  try
    // IMposta la query per ricavare i dettagli
    Qry.SQL.Add('SELECT * FROM shoppy_order_product WHERE');
    Qry.SQL.Add(Item.ItemDetailsSqlWhere);
    Qry.Open;
    if Qry.Eof then raise Exception.Create(Self.ClassName + '.LoadItemDetailsToSaverObject - Import/Export item detail not found.');
    // Cicla per tutti i righi trovati
    while not Qry.Eof do
    begin
      // Crea il saver della riga attuale
      CurrRowSaver := Saver.CreateRow(Saver.Rows.Count);
      CurrRowSaver.CodiceArticolo := Qry.FieldByName('model').AsString;
      CurrRowSaver.Descrizione := Qry.FieldByName('name').AsString;
      CurrRowSaver.UnitaDiMisura := '';
      CurrRowSaver.Qta := Qry.FieldByName('quantity').AsFloat;
      CurrRowSaver.PrezzoUnitario := Qry.FieldByName('price').AsFloat;
      CurrRowSaver.PrezzoUnitarioIvaCompresa := (Qry.FieldByName('price').AsFloat + Qry.FieldByName('tax').AsFloat);
      // AVanti il prossimo
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TecLoaderShoppyInvoices.LoadItemToSaverObject(Saver: TecSaverDoc; Item: TecImportExportItem);
var
  Qry: TSQLQuery;
  TmpStr: String;
begin
  Qry := Self.CreateAndInitQuery;
  try
    Qry.SQL.Add('SELECT * FROM shoppy_order WHERE');
    Qry.SQL.Add(Item.ItemSqlWhere);
    Qry.Open;
    if Qry.Eof then raise Exception.Create(Self.ClassName + '.LoadItemToSaverObject - Import/Export item not found.');
    // Caricamento dati
    Saver.TipoDocumento := 'Fattura';
//    Saver.Registro := '/EC';
    Saver.Registro := '';
    Saver.NumOrdPrev := Qry.FieldByName('invoice_no').AsInteger;
    Saver.DataDocumento := Qry.FieldByName('date_modified').AsDateTime;

    Saver.Causale := 'Vendita Internet';
    Saver.Listino := 1;

    Saver.RifDoc_Tipo := 'Ordine';
//    Saver.RifDoc_Reg := '/EC';
    Saver.RifDoc_Reg := '';
    Saver.RifDoc_Num := Qry.FieldByName('order_id').AsInteger;
    Saver.RifDoc_Data := Qry.FieldByName('date_modified').AsDateTime;

    Saver.TotaleDocumento := Qry.FieldByName('total').AsCurrency;
    Saver.TotaleDaPagare := Qry.FieldByName('total').AsCurrency;

    Saver.Soggetto.Indirizzo := Trim(Qry.FieldByName('payment_address_1').AsString + ' ' + Qry.FieldByName('payment_address_2').AsString);
    Saver.Soggetto.NumCivico := '';
    Saver.Soggetto.Cap := Qry.FieldByName('payment_postcode').AsString;
    Saver.Soggetto.Citta := Qry.FieldByName('payment_city').AsString;
    Saver.Soggetto.Provincia := Qry.FieldByName('payment_zone').AsString;


    // =========================================================================
    // CARICAMENTO CODICE FISCALE E PARTITA IVA
    // -------------------------------------------------------------------------
    // Codice Fiscale:
    Saver.Soggetto.CodiceFiscale := Uppercase(Trim(Qry.FieldByName('codicefiscale').AsString));
    if (Saver.Soggetto.CodiceFiscale = '') then Saver.Soggetto.CodiceFiscale := Uppercase(Trim(Qry.FieldByName('payment_tax_id').AsString));
    // Partita IVA
    Saver.Soggetto.PartitaIVA := Uppercase(Trim(Qry.FieldByName('partitaiva').AsString));
    if (Saver.Soggetto.PartitaIVA = '') then Saver.Soggetto.PartitaIVA := Uppercase(Trim(Qry.FieldByName('payment_company_id').AsString));
    // Se il codice fiscale è solo numerico e la partita IVA non è stata inserita
    //  carica il codice fiscale anche come partita IVA
    if Self.IsOnlyDigitsString(Saver.Soggetto.CodiceFiscale) and (Saver.Soggetto.PartitaIVA = '') then
    begin
      Saver.Soggetto.PartitaIVA := Saver.Soggetto.CodiceFiscale;
      // Se la partita IVA è vuota lo segnala
      if Saver.Soggetto.PartitaIVA = '' then Saver.Soggetto.PartitaIVA := '*** PI ***';
    end;
    // Se il Codice Fiscale è vuoto lo segnala
    if Saver.Soggetto.CodiceFiscale = '' then Saver.Soggetto.CodiceFiscale := '*** NO C.F. ***';
    // =========================================================================


    Saver.Soggetto.Email := Qry.FieldByName('email').AsString;
    Saver.Soggetto.Telefono := Qry.FieldByName('telephone').AsString;
    Saver.Soggetto.Fax := Qry.FieldByName('fax').AsString;


    // =========================================================================
    // CARICAMENTO RAGIONE SOCIALE O COGNOME E NOME
    // -------------------------------------------------------------------------
    // Se è una persona fisica
    if  (Saver.Soggetto.PartitaIVA <> Saver.Soggetto.CodiceFiscale)
    and (not Self.IsOnlyDigitsString(Saver.Soggetto.CodiceFiscale))
    then
    begin
      Saver.Soggetto.RagioneSociale := Uppercase(Trim(Qry.FieldByName('payment_lastname').AsString + ' ' + Qry.FieldByName('payment_firstname').AsString));
    end else
    begin
      Saver.Soggetto.RagioneSociale := Uppercase(Trim(Qry.FieldByName('payment_company').AsString));
    end;
    // Verifica che la Ragione Sociale o il nome e cognome non siano vuoti
    if Saver.Soggetto.RagioneSociale = '' then Saver.Soggetto.RagioneSociale := '*** DATO NON PRESENTE ***';
    // =========================================================================


    Saver.DestinazioneMerce.RagioneSociale := Uppercase(Trim(Qry.FieldByName('shipping_company').AsString));
    if Saver.DestinazioneMerce.RagioneSociale = ''
      then Saver.DestinazioneMerce.RagioneSociale := Uppercase(Trim(Qry.FieldByName('shipping_firstname').AsString + ' ' + Qry.FieldByName('shipping_lastname').AsString));


    Saver.DestinazioneMerce.Indirizzo := Trim(Qry.FieldByName('shipping_address_1').AsString + ' ' + Qry.FieldByName('shipping_address_2').AsString);
    Saver.DestinazioneMerce.NumCivico := '';
    Saver.DestinazioneMerce.Cap := Qry.FieldByName('shipping_postcode').AsString;
    Saver.DestinazioneMerce.Citta := Qry.FieldByName('shipping_city').AsString;
    Saver.DestinazioneMerce.Provincia := '';
    // Chiusura query
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TecLoaderShoppyInvoices.PrepareImportList;
var
  Qry: TSQLQuery;
  NewDescription, NewSqlWhere, NewDetailsSqlWhere: String;
begin
  inherited;

  Qry := Self.CreateAndInitQuery;
  try
    // Imposta la query che preleverà l'elenco delle fatture ancora da importare
    Qry.SQL.Add('SELECT order_id, invoice_no, firstname, lastname, date_modified, total');
    Qry.SQL.Add('FROM shoppy_order');
    Qry.SQL.Add('WHERE COALESCE(invoice_no,0) <> 0');
    Qry.SQL.Add('  AND COALESCE(stato_fattura,0) = 0');
    Qry.Open;
    // Cicla per tutte le fatture trovate e le carica nella ImportList
    while not Qry.Eof do begin
      NewDescription := 'Fatt. ' + Qry.FieldByName('invoice_no').AsString + ' del ' + Qry.FieldByName('date_modified').AsString + ' ' + Qry.FieldByName('firstname').AsString + ' ' + Qry.FieldByName('lastname').AsString + ' (order_id = ' + Qry.FieldByName('order_id').AsString + ')';
      NewSqlWhere :=  'order_id = ' + Qry.FieldByName('order_id').AsString;
      NewDetailsSqlWhere :=  'order_id = ' + Qry.FieldByName('order_id').AsString;
      ImportList.Add(NewDescription, NewSqlWhere, NewDetailsSqlWhere);
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;







{
// COmpleta/ricalcola i campi mancanti
procedure TecLoaderShoppyInvoices.Recalc(Saver: TecSaverDoc);
var
  Row: TecSaverDocRow;
begin
  // Cicla per tutti i righi per costruire il castelletto IVA
  // ---------------------------------------------------------------------------
  for Row in Saver.Rows do
  begin
    // Aliquota IVA 1
    if (Saver.CodiceIva1 = 0) or (Saver.CodiceIva1 = Row.CodiceIva) then
    begin
      Saver.CodiceIva1 := Row.CodiceIva;
      Saver.TotaleRighi1 := Saver.TotaleRighi1 + Row.ImportoRigo;
      Saver.ImportoIva1 := Saver.ImportoIva1 + (Row.ImportoRigoIvaCompresa - Row.ImportoRigo);
      Continue;
    end
    // Aliquota IVA 2
    else if (Saver.CodiceIva2 = 0) or (Saver.CodiceIva2 = Row.CodiceIva) then
    begin
      Saver.CodiceIva2 := Row.CodiceIva;
      Saver.TotaleRighi2 := Saver.TotaleRighi2 + Row.ImportoRigo;
      Saver.ImportoIva2 := Saver.ImportoIva2 + (Row.ImportoRigoIvaCompresa - Row.ImportoRigo);
      Continue;
    end
    // Aliquota IVA 3
    else if (Saver.CodiceIva3 = 0) or (Saver.CodiceIva3 = Row.CodiceIva) then
    begin
      Saver.CodiceIva3 := Row.CodiceIva;
      Saver.TotaleRighi3 := Saver.TotaleRighi3 + Row.ImportoRigo;
      Saver.ImportoIva3 := Saver.ImportoIva3 + (Row.ImportoRigoIvaCompresa - Row.ImportoRigo);
      Continue;
    end
    // Aliquota IVA 4
    else if (Saver.CodiceIva4 = 0) or (Saver.CodiceIva4 = Row.CodiceIva) then
    begin
      Saver.CodiceIva4 := Row.CodiceIva;
      Saver.TotaleRighi4 := Saver.TotaleRighi4 + Row.ImportoRigo;
      Saver.ImportoIva4 := Saver.ImportoIva4 + (Row.ImportoRigoIvaCompresa - Row.ImportoRigo);
      Continue;
    end;
  end;
  Saver.ScontoAliquota1 := 0;
  Saver.ScontoAliquota2 := 0;
  Saver.ScontoAliquota3 := 0;
  Saver.ScontoAliquota4 := 0;
  Saver.TotaleImponibile1 := Saver.TotaleRighi1;
  Saver.TotaleImponibile2 := Saver.TotaleRighi2;
  Saver.TotaleImponibile3 := Saver.TotaleRighi3;
  Saver.TotaleImponibile4 := Saver.TotaleRighi4;
  // ---------------------------------------------------------------------------
  // Totali documento
  Saver.TotaleMargine := 0;
  Saver.TotaleMerce := Saver.TotaleRighi1 + Saver.TotaleRighi2 + Saver.TotaleRighi3 + Saver.TotaleRighi4;
  Saver.TotaleSconti := 0;
  Saver.TotaleNettoMerce := Saver.TotaleMerce;
  Saver.Spese := 0;
  Saver.TotaleImponibile := Saver.TotaleImponibile1 + Saver.TotaleImponibile2 + Saver.TotaleImponibile3 + Saver.TotaleImponibile4;
  Saver.TotaleIva := Saver.ImportoIva1 + Saver.ImportoIva2 + Saver.ImportoIva3 + Saver.ImportoIva4;
  Saver.TotaleDocumento := Saver.TotaleImponibile + Saver.TotaleIva;
  Saver.TotaleDaPagare := Saver.TotaleDocumento;
end;
}
// COmpleta/ricalcola i campi mancanti
//  NB: Prezzi IVA compresa con scorporo IVA
procedure TecLoaderShoppyInvoices.Recalc(Saver: TecSaverDoc);
var
  Row: TecSaverDocRow;
  TotRighiIvaComp1, TotRighiIvaComp2, TotRighiIvaComp3, TotRighiIvaComp4: Double;
  AliquotaIva1, AliquotaIva2, AliquotaIva3, AliquotaIva4: Double;
begin
  // Inizializzazione
  TotRighiIvaComp1 := 0;
  TotRighiIvaComp2 := 0;
  TotRighiIvaComp3 := 0;
  TotRighiIvaComp4 := 0;
  AliquotaIva1 := 0;
  AliquotaIva2 := 0;
  AliquotaIva3 := 0;
  AliquotaIva4 := 0;
  // Cicla per tutti i righi per costruire il castelletto IVA
  // ---------------------------------------------------------------------------
  for Row in Saver.Rows do
  begin
    // Aliquota IVA 1
    if (Saver.CodiceIva1 = 0) or (Saver.CodiceIva1 = Row.CodiceIva) then
    begin
      Saver.CodiceIva1  := Row.CodiceIva;
      AliquotaIva1      := Row.AliquotaIva;
      TotRighiIvaComp1  := Arrotonda( TotRighiIvaComp1 + Row.ImportoRigoIvaCompresa ,2);
      Continue;
    end
    // Aliquota IVA 2
    else if (Saver.CodiceIva2 = 0) or (Saver.CodiceIva2 = Row.CodiceIva) then
    begin
      Saver.CodiceIva2  := Row.CodiceIva;
      AliquotaIva2      := Row.AliquotaIva;
      TotRighiIvaComp2  := Arrotonda( TotRighiIvaComp2 + Row.ImportoRigoIvaCompresa ,2);
      Continue;
    end
    // Aliquota IVA 3
    else if (Saver.CodiceIva3 = 0) or (Saver.CodiceIva3 = Row.CodiceIva) then
    begin
      Saver.CodiceIva3  := Row.CodiceIva;
      AliquotaIva3      := Row.AliquotaIva;
      TotRighiIvaComp3  := Arrotonda( TotRighiIvaComp3 + Row.ImportoRigoIvaCompresa ,2);
      Continue;
    end
    // Aliquota IVA 4
    else if (Saver.CodiceIva4 = 0) or (Saver.CodiceIva4 = Row.CodiceIva) then
    begin
      Saver.CodiceIva4  := Row.CodiceIva;
      AliquotaIva4      := Row.AliquotaIva;
      TotRighiIvaComp4  := Arrotonda( TotRighiIvaComp4 + Row.ImportoRigoIvaCompresa ,2);
      Continue;
    end;
  end;
  // Calcolo imponibili (scorporo)
  Saver.TotaleImponibile1 := Arrotonda( TotRighiIvaComp1/((100+AliquotaIva1)/100), 2);
  Saver.TotaleImponibile2 := Arrotonda( TotRighiIvaComp2/((100+AliquotaIva2)/100), 2);
  Saver.TotaleImponibile3 := Arrotonda( TotRighiIvaComp3/((100+AliquotaIva3)/100), 2);
  Saver.TotaleImponibile4 := Arrotonda( TotRighiIvaComp4/((100+AliquotaIva4)/100), 2);
  // Calcolo importo IVA
  Saver.ImportoIva1 := TotRighiIvaComp1 - Saver.TotaleImponibile1;
  Saver.ImportoIva2 := TotRighiIvaComp2 - Saver.TotaleImponibile2;
  Saver.ImportoIva3 := TotRighiIvaComp3 - Saver.TotaleImponibile3;
  Saver.ImportoIva4 := TotRighiIvaComp4 - Saver.TotaleImponibile4;
  // Totale righi
  Saver.TotaleRighi1 :=  Saver.TotaleImponibile1;
  Saver.TotaleRighi2 :=  Saver.TotaleImponibile2;
  Saver.TotaleRighi3 :=  Saver.TotaleImponibile3;
  Saver.TotaleRighi4 :=  Saver.TotaleImponibile4;
  // Sconti
  Saver.ScontoAliquota1 := 0;
  Saver.ScontoAliquota2 := 0;
  Saver.ScontoAliquota3 := 0;
  Saver.ScontoAliquota4 := 0;
  // ---------------------------------------------------------------------------
  // Totali documento
  Saver.TotaleMargine := 0;
  Saver.TotaleMerce := Saver.TotaleRighi1 + Saver.TotaleRighi2 + Saver.TotaleRighi3 + Saver.TotaleRighi4;
  Saver.TotaleSconti := 0;
  Saver.TotaleNettoMerce := Saver.TotaleMerce;
  Saver.Spese := 0;
  Saver.TotaleImponibile := Saver.TotaleImponibile1 + Saver.TotaleImponibile2 + Saver.TotaleImponibile3 + Saver.TotaleImponibile4;
  Saver.TotaleIva := Saver.ImportoIva1 + Saver.ImportoIva2 + Saver.ImportoIva3 + Saver.ImportoIva4;
  Saver.TotaleDocumento := TotRighiIvaComp1 + TotRighiIvaComp2 + TotRighiIvaComp3 + TotRighiIvaComp4;
  Saver.TotaleDaPagare := Saver.TotaleDocumento;
end;














// COmpleta/ricalcola i campi mancanti
procedure TecLoaderShoppyInvoices.RecalcRow(Row: TecSaverDocRow);
var
  CurrCodiceIva: Integer;
  CurrDescrizioneIva: String;
  CurrAliquotaIva: Double;
begin
  // Aliquota IVA
  Row.SetIvaByPriceAndTax(Row.PrezzoUnitario
                         ,Row.PrezzoUnitarioIvaCompresa - Row.PrezzoUnitario
                         ,CurrCodiceIva
                         ,CurrDescrizioneIva
                         ,CurrAliquotaIva
                         );
  Row.CodiceIva := CurrCodiceIva;
  Row.DescrizioneIva := CurrDescrizioneIva;
  Row.AliquotaIva := CurrAliquotaIva;
  // Totali rigo
  Row.ImportoRigo := Arrotonda( Row.PrezzoUnitario * Row.Qta   ,2);
  Row.ImportoRigoIvaCompresa := Arrotonda( Row.PrezzoUnitarioIvaCompresa * Row.Qta   ,2);
  // Margine
  Row.PrezzoAcquistoArticolo := Row.PrezzoUnitario;
  Row.Margine := 0;
  Row.ImportoMargine := 0;
end;

procedure TecLoaderShoppyInvoices.MarkAsExported(Item: TecImportExportItem);
var
  Qry: TSQLQuery;
begin
  Qry := Self.CreateAndInitQuery;
  try
    Qry.SQL.Add('UPDATE shoppy_order SET stato_fattura = 1 WHERE');
    Qry.SQL.Add(Item.ItemSqlWhere);
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

constructor TecLoaderShoppy.Create(ServerName, DatabaseName, UserName,
  Password: string; SaverDB: TIBODatabase);
begin
  inherited;
  // Crea la connessione al database
  Self.CreateConnectionToMySQL(ServerName, DatabaseName, UserName, Password);
end;

end.
