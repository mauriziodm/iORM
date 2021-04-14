unit UnitLevanteEInvoice;

interface

uses DForce.Mini.ei.Invoice, DForce.Mini.ei.Invoice.Interfaces, XMLIntf,
  System.SysUtils, IB_Components, DForce.ei.Invoice.Base;

type

  ILevanteInvoicePersister = interface
    ['{DB8A31E7-3575-4AAE-B4D6-BDBD616620A5}']
    function SaveToLevante(const AOpen: boolean; AFileName: string; const AStatus: string): boolean;
  end;

  TInvoicePersisterFactory = class
  public
    class function NewLevanteInvoicePersister(const AInvoice: IeiInvoiceMini; const AID: Integer = 0): ILevanteInvoicePersister;
  end;

  TLevanteInvoicePersister = class(TInterfacedObject, ILevanteInvoicePersister)
  private
    FInvoice: IeiInvoiceMini;
    FCurrentNode: IXMLNode;
    FFormatSettings: TFormatSettings;
    FID: Integer;
    // Base methods
    function PropertyExists(const APropertyName: string): boolean;
    function ExtractValue(const APropertyName: string; const ARequired: boolean = false): string;
    function ExtractValueAsString(const APropertyName: string; Const AMaxLength: integer = 9999; const ARequired: boolean = false): string;
    function ExtractValueAsInteger(const APropertyName: string; const ARequired: boolean = false): integer;
    function ExtractValueAsFloat(const APropertyName: string; const ARequired: boolean = false): Extended;
    function ExtractValueAsDateTime(const APropertyName: string; const ARequired: boolean = false): TDateTime;
    function ExtractValueAsDateTimeDefaultMsg(const APropertyName: string; const ADefaultValue: TDateTime; AMsgForTagNotPresent: String): TDateTime;
    procedure SetParamAsString(const ADestParam: TIB_Column; const APropertyName: string; const ARequired: boolean = false);
    procedure SetParamAsInteger(const ADestParam: TIB_Column; const APropertyName: string; const ARequired: boolean = false);
    procedure SetParamAsFloat(const ADestParam: TIB_Column; const APropertyName: string; const ARequired: boolean = false);
    procedure SetParamAsDateTime(const ADestParam: TIB_Column; const APropertyName: string; const ARequired: boolean = false);
    // Advanced extractors
    procedure ExtractNumRegDoc(const ANumeroXML: String; out ANumDoc: integer; out ARegDoc: string);
    function FindCodiceIVA(const AAliquota: double; ANatura: string): integer;
    function FindDescrizioneIVA(const AAliquota: double; ANatura: string): string;
    function FindCodiceSoggetto: integer;
    function CreaNuovoSoggetto: integer;
    function ExtractTipoDocumento: string;
    function ExtractTipoDocumentoEsteso: string;
    function ExtractRagSoc: string;
    function ExtractMeseCompetenza: SmallInt;
    procedure SetScontiRigo(const ADestParamSconto1, ADestParamSconto2, ADestParamSconto3: TIB_Column);
    function ExtractRiferimentoNumeroLinea(const ARiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList): String;
    // Getters
    function GetFormatSettings: TFormatSettings;
    function GetCausaleDefault: string;
    function GetAzioneMagazzino: string;
    function GetAzioneCantiere: string;
    // Savers
    procedure SalvaTestata(const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer; const AFileName: string; const AStatus: string);
    procedure SalvaRighe(const ATipoDoc, ARegDoc: string;const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer);
    procedure SalvaScadenze(const ATipoDoc, ARegDoc: string;const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer);
    procedure SalvaDDTCorrelati(const ATipoDoc, ARegDoc: string;const ANumDoc: integer; const ADataDoc: TDateTime; const ANode: IXMLDatiDDTTypeList);
    procedure SalvaDocumentiCorrelati(const ATipoDoc, ARegDoc: string;const ANumDoc: integer; const ADataDoc: TDateTime; const ANode: IXMLDatiDocumentiCorrelatiTypeList; const ATipoDocCorr: String);
    procedure SalvaDatiCassaPrevidenziale(const Qry: TIB_Cursor; const ACurrCount: Integer; const ATipoDoc, ARegDoc: string;const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer; const ANode: IXMLDatiCassaPrevidenzialeTypeList);
    procedure SalvaAttachments(const ATipoDoc, ARegDoc: string;const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer);
    procedure MarcaComeFatto(const AID: integer);
    procedure CreaNotificaCaricamentoDaFile(const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const AFileName: string; const AStatus: string);
  protected
    function FormatSettings: TFormatSettings;
    property CurrentNode: IXMLNode read FCurrentNode write FCurrentNode;
  public
    constructor Create(const AInvoice: IeiInvoiceMini; const AID: Integer);
    function SaveToLevante(const AOpen: boolean; AFileName: string; const AStatus: string): boolean;
  end;

implementation

uses
  System.Character, DataModule1, System.StrUtils,
  Dialogs, Controls, System.DateUtils, System.IniFiles,
  System.Classes, IB_Session, FormAllegati, Soap.EncdDecd, ZLIBArchive, Vcl.Forms, FormConfirmNumReg;

{ TLevanteInvoiceMini }

constructor TLevanteInvoicePersister.Create(const AInvoice: IeiInvoiceMini; const AID: Integer);
begin
  FID := AID;
  FInvoice := AInvoice;
end;

function TLevanteInvoicePersister.ExtractMeseCompetenza: SmallInt;
var
  LValue: TDateTime;
begin
  CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento;
  LValue := ExtractValueAsDateTime('Data', True);
  Result := MonthOf(LValue);
end;

procedure TLevanteInvoicePersister.ExtractNumRegDoc(const ANumeroXML: String; out ANumDoc: integer; out ARegDoc: string);
var
  I, LStep, LStartIndex, LStopIndex: integer;
  LEstraendoNumDoc: Boolean;
  LChar: Char;
  LNumStr: string;
  procedure ExtractNumRegDocSeparatingDigitFromOtherChars;
  var
    LI: Integer;
  begin
    for LI := 1 to Length(ANumeroXML) do
    begin
      if IsDigit(ANumeroXML[LI]) then
        LNumStr := LNumStr + ANumeroXML[LI]
      else
      if IsLetter(ANumeroXML[LI]) then
        ARegDoc := ARegDoc + ANumeroXML[LI];
    end;
  end;
begin
  LNumStr := '';
  ARegDoc := '';
  // Se comincia con una cifra (a sx) allora si suppone che l'eventuale registro sia a dx altrimenti a sx
  if IsDigit(ANumeroXML[1]) then
  begin
    LStartIndex := 1;
    LStopIndex := Length(ANumeroXML) + 1;
    LStep := 1;
  end
  else
  if IsDigit(ANumeroXML[Length(ANumeroXML)]) then
  begin
    LStartIndex := Length(ANumeroXML);
    LStopIndex := 0;
    LStep := -1;
  end
  else
  // Se anche a destra non c'è una cifra allora usa un'altra strategia
  begin
    ExtractNumRegDocSeparatingDigitFromOtherChars;
    Exit;
  end;
  // Loop
  LEstraendoNumDoc := True;
  I := LStartIndex;
  while I <> LStopIndex do
  begin
    LChar := ANumeroXML[I];
    LEstraendoNumDoc := LEstraendoNumDoc and IsDigit(LChar);
    if LEstraendoNumDoc then
      LNumStr := LNumStr + LChar
    else
    if IsLetter(LChar) or IsDigit(LChar) then
      ARegDoc := ARegDoc + LChar;
    Inc(I, LStep);
  end;
  if LStopIndex = 0 then
  begin
    LNumStr := ReverseString(LNumStr);
    ARegDoc := ReverseString(ARegDoc);
  end;

  if Length(LNumStr) > 9 then
    LNumStr := RightStr(LNumStr, 9);
  ARegDoc := LeftStr(Trim(ARegDoc), 5);
  ANumDoc := StrToInt(LNumStr);
end;

function TLevanteInvoicePersister.ExtractRagSoc: string;
var
  LDenominazione: string;
begin
  CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.Anagrafica;
  LDenominazione := ExtractValueAsString('Denominazione', 60);
  if Ldenominazione <> '' then
    Result := LDenominazione
  else
    Result := Trim(ExtractValueAsString('Cognome', 60) + ' ' + ExtractValueAsString('Nome', 60));
  Result := LeftStr(Result, 60);
end;

function TLevanteInvoicePersister.ExtractRiferimentoNumeroLinea(const ARiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList): String;
var
  I: Integer;
  LCommaChar: String;
begin
  Result := '';
  LCommaChar := '';
  for I := 0 to ARiferimentoNumeroLinea.Count-1 do
  begin
    Result := Result + LCommaChar + IntToStr(ARiferimentoNumeroLinea.Items[I]);
    LCommaChar := ',';
  end;
  // Se la dimensione massima è superata avisa e la tronca
  if Length(Result) > 5000 then
  begin
    Result := LeftStr(Result, 5000);
    DM1.Messaggi('Caricamento Documento', 'Il campo "RiferimentoNumeroLinea" presente nella fattura elettronica è più lungo del consentito, verrà troncato a 5000 caratteri.', '', [mbOk], 0, nil);
  end;
end;

function TLevanteInvoicePersister.FindCodiceIVA(const AAliquota: double; ANatura: string): integer;
var
  Qry: TIB_Cursor;
begin
  ANatura := Trim(ANatura);
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT CODICEIVA FROM ALIQIVA WHERE ALIQUOTAIVA = :P_ALIQUOTAIVA');
    if ANatura <> '' then
      Qry.SQL.Add('AND PA_NATURA = :P_NATURA');
    Qry.Prepare;
    Qry.Params.ParamByName('P_ALIQUOTAIVA').AsFloat := AAliquota;
    if ANatura <> '' then
      Qry.Params.ParamByName('P_NATURA').AsString := ANatura;
    Qry.Open;
    if Qry.Eof then
      raise Exception.Create('TLevanteInvoice.FindCodiceIVA: Codice IVA non trovato');
    result := Qry.Fields[0].AsInteger;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TLevanteInvoicePersister.FindDescrizioneIVA(const AAliquota: double; ANatura: string): string;
var
  Qry: TIB_Cursor;
begin
  ANatura := Trim(ANatura);
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT DESCRIZIONEIVA FROM ALIQIVA WHERE ALIQUOTAIVA = :P_ALIQUOTAIVA');
    if ANatura <> '' then
      Qry.SQL.Add('AND PA_NATURA = :P_NATURA');
    Qry.Prepare;
    Qry.Params.ParamByName('P_ALIQUOTAIVA').AsFloat := AAliquota;
    if ANatura <> '' then
      Qry.Params.ParamByName('P_NATURA').AsString := ANatura;
    Qry.Open;
    if Qry.Eof then
      raise Exception.Create('TLevanteInvoice.FindCodiceIVA: Codice IVA non trovato');
    result := Qry.Fields[0].AsString;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TLevanteInvoicePersister.FindCodiceSoggetto: integer;
var
  Qry: TIB_Cursor;
  LPartitaIVA: string;
begin
  CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.IdFiscaleIVA;
  LPartitaIVA := ExtractValue('IdCodice', True);
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT CODICE FROM CLIENTI WHERE PARTITAIVA = :P_PARTITAIVA');
    Qry.Prepare;
    Qry.Params.ParamByName('P_PARTITAIVA').AsString := LPartitaIVA;
    Qry.Open;
    if Qry.Eof then
      result := 0
    else
      result := Qry.Fields[0].AsInteger;
    Qry.Close;
    if  (result = 0)
    and (DM1.Messaggi('Caricamento Documento', 'Il mittente del documento non è presente nella rubrica.'#13#13'Vuoi che Levante lo inserisca automaticamente?', 'ATTENZIONE! - In caso di risposta negativa il documento verrà caricato senza nessun Mittente/Destinatario.', [mbYes,mbNo], 0, nil) = mrYes)
    then
      result := CreaNuovoSoggetto;
  finally
    Qry.Free;
  end;
end;

function TLevanteInvoicePersister.FormatSettings: TFormatSettings;
begin

end;

function TLevanteInvoicePersister.GetFormatSettings: TFormatSettings;
begin
  FFormatSettings.Create;
  // Float
  FFormatSettings.DecimalSeparator := '.';
  FFormatSettings.ThousandSeparator := ',';
  // DateTime
  FFormatSettings.DateSeparator := '-';
  FFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
  // Return the result
  Result := FFormatSettings;
end;

procedure TLevanteInvoicePersister.MarcaComeFatto(const AID: integer);
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add(Format('UPDATE PRVORDCL_FE SET DONE = ''T'' WHERE ID = %d', [AID]));
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

function TLevanteInvoicePersister.PropertyExists(const APropertyName: string): boolean;
begin
  Result := (CurrentNode.ChildNodes.IndexOf(APropertyName) > -1);
end;

function TLevanteInvoicePersister.ExtractTipoDocumento: string;
var
  LTipoDocumento: string;
begin
  CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento;
  LTipoDocumento := ExtractValue('TipoDocumento');
  if LTipoDocumento = 'TD04' then
    Exit('N.C.fornit')
  else
    Exit('Fatt.acqui');
end;

function TLevanteInvoicePersister.ExtractTipoDocumentoEsteso: string;
var
  LTipoDocumento: string;
begin
  CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento;
  LTipoDocumento := ExtractValue('TipoDocumento');
  if LTipoDocumento = 'TD04' then
    Exit('Nota di Credito fornitore')
  else
    Exit('Fattura di Acquisto');
end;

function TLevanteInvoicePersister.ExtractValueAsDateTime(const APropertyName: string; const ARequired: boolean): TDateTime;
begin
  if PropertyExists(APropertyName) or ARequired then
    Result := StrToDateTime(  ExtractValue(APropertyName, ARequired), GetFormatSettings  );
end;

function TLevanteInvoicePersister.ExtractValueAsDateTimeDefaultMsg(const APropertyName: string; const ADefaultValue: TDateTime; AMsgForTagNotPresent: String): TDateTime;
var
  LValueStr: String;
begin
  LValueStr := ExtractValue(APropertyName, False);
  if LValueStr <> '' then
    Result := StrToDateTime(  LValueStr, GetFormatSettings  )
  else
  begin
    Result := ADefaultValue;
    if AMsgForTagNotPresent <> '' then
      DM1.Messaggi('Levante', AMsgForTagNotPresent, '', [mbOk], 0, nil);
  end;
end;

function TLevanteInvoicePersister.ExtractValueAsFloat(const APropertyName: string; const ARequired: boolean): Extended;
var
  LStrValue: String;
begin
  LStrValue := ExtractValue(APropertyName, ARequired);
  if LStrValue <> '' then
    Result := StrToFloat(LStrValue, GetFormatSettings)
  else
    Result := 0;
end;

function TLevanteInvoicePersister.ExtractValueAsInteger(const APropertyName: string; const ARequired: boolean): integer;
var
  LStrValue: String;
begin
  LStrValue := ExtractValue(APropertyName, ARequired);
  if LStrValue <> '' then
    Result := StrToInt(LStrValue)
  else
    Result := 0;
end;

function TLevanteInvoicePersister.ExtractValueAsString(const APropertyName: string; const AMaxLength: integer; const ARequired: boolean): string;
begin
  Result := ExtractValue(APropertyName, ARequired);
  Result := LeftStr(Result, AMaxLength);
end;

function TLevanteInvoicePersister.ExtractValue(const APropertyName: string; const ARequired: boolean): string;
begin
  Result := '';  // Lasciare assolutamente
  if PropertyExists(APropertyName) then
//    Result := Trim(CurrentNode.ChildNodes[APropertyName].NodeValue)  // NB: Questa linea ritornava un errore se il campo era una stringa vuota
    Result := Trim(CurrentNode.ChildNodes[APropertyName].Text)
  else
  if ARequired then
    raise Exception.Create('Informazione mancante:'#13#13'Sezione: "' +
      CurrentNode.NodeName + '"'#13'Campo: "' + APropertyName + '"');
end;

function TLevanteInvoicePersister.GetAzioneCantiere: string;
var
  P: TMemIniFile;
begin
  P := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    Result := Uppercase(P.ReadString(ExtractTipoDocumento, 'AzioneCantiere', '='));
  finally
    P.Free;
  end;
end;

function TLevanteInvoicePersister.GetAzioneMagazzino: string;
var
  P: TMemIniFile;
begin
  P := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    Result := Uppercase(P.ReadString(ExtractTipoDocumento, 'AzioneMagazzino', '='));
  finally
    P.Free;
  end;
end;

function TLevanteInvoicePersister.GetCausaleDefault: string;
var
  P: TMemIniFile;
begin
  P := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    Result := P.ReadString(ExtractTipoDocumento, 'CausaleDefault', '');
    Result := LeftStr(Result, 40);
  finally
    P.Free;
  end;
end;

procedure TLevanteInvoicePersister.CreaNotificaCaricamentoDaFile(const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const AFileName: string; const AStatus: string);
var
  Qry: TIB_Cursor;
  LBlobStream: TStream;
begin
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('INSERT INTO PRVORDCL_FE (TipoDoc, RegDoc, NumDoc, DataDoc, ResponseDate, ResponseType, FileName, MsgCode, MsgText, MsgRaw, Done)');
    Qry.SQL.Add('VALUES');
    Qry.SQL.Add('(:P_TipoDoc, :P_RegDoc, :P_NumDoc, :P_DataDoc, :P_ResponseDate, :P_ResponseType, :P_FileName, :P_MsgCode, :P_MsgText, :P_MsgRaw, ''T'')');
    Qry.Prepare;
    Qry.ParamByName('P_TipoDoc').Value := ATipoDoc;
    Qry.ParamByName('P_RegDoc').Value := ARegDoc;
    Qry.ParamByName('P_NumDoc').Value := ANumDoc;
    Qry.ParamByName('P_DataDoc').Value := ADataDoc;
    Qry.ParamByName('P_ResponseDate').Value := Now;
    Qry.ParamByName('P_ResponseType').Value := AStatus;
    Qry.ParamByName('P_FileName').Value := AFileName;
    Qry.ParamByName('P_MsgCode').Value := ExtractRagSoc;
    Qry.ParamByName('P_MsgText').Value := Format('%s %d%s del %s', [ATipoDoc, ANumDoc, ARegDoc, DateToStr(ADataDoc)]);
    // ===========================================================================================
    // BLOCCO PER IL CARICAMENTO DEL MSGRAW
    // -------------------------------------------------------------------------------------------
    LBlobStream := Qry.CreateBlobStream(Qry.ParamByName('P_MsgRaw'), TIB_BlobStreamMode.bsmWrite );
    FInvoice.SaveToStream(LBlobStream);
    // ===========================================================================================
    Qry.ExecSQL;
  finally
    if Assigned(LBlobStream) then
      LBlobStream.Free;
    Qry.Free;
  end;
end;

function TLevanteInvoicePersister.CreaNuovoSoggetto: integer;
var
  Qry: TIB_Cursor;
  LDenominazione: string;
begin
  CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.Anagrafica;
  LDenominazione := ExtractValueAsString('Denominazione', 60);
  Result := DM1.NextCodice('CLIENTI', 'CODICE');
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('INSERT INTO CLIENTI(CODICE, CLIENTEFORNITORE, RAGIONESOCIALE, COGNOME, NOME, INDIRIZZO, NUMCIVICO, CITTA, CAP, PROVINCIA, NAZIONESIGLA, PARTITAIVA, CODICEFISCALE, TELEFONO, FAX, EMAIL, TIPOPERSONA)');
    Qry.SQL.Add('VALUES (:P_CODICE, :P_CLIENTEFORNITORE, :P_RAGIONESOCIALE, :P_COGNOME, :P_NOME, :P_INDIRIZZO, :P_NUMCIVICO, :P_CITTA, :P_CAP, :P_PROVINCIA, :P_NAZIONESIGLA, :P_PARTITAIVA, :P_CODICEFISCALE, :P_TELEFONO, :P_FAX, :P_EMAIL, :P_TIPOPERSONA)');
    Qry.Prepare;
    Qry.Params.ParamByName('P_CODICE').AsInteger := Result;
    Qry.Params.ParamByName('P_CLIENTEFORNITORE').AsString := 'Fornitore';
    Qry.Params.ParamByName('P_RAGIONESOCIALE').AsString := LDenominazione;
    Qry.Params.ParamByName('P_COGNOME').AsString := ExtractValueAsString('Cognome', 60);
    Qry.Params.ParamByName('P_NOME').AsString := ExtractValueAsString('Nome', 60);
    CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.Sede;
    Qry.Params.ParamByName('P_INDIRIZZO').AsString := ExtractValueAsString('Indirizzo', 80, True);
    Qry.Params.ParamByName('P_NUMCIVICO').AsString := ExtractValueAsString('NumeroCivico', 80);
    Qry.Params.ParamByName('P_CITTA').AsString := ExtractValueAsString('Comune', 60, True);
    Qry.Params.ParamByName('P_CAP').AsString := ExtractValueAsString('CAP', 5, True);
    Qry.Params.ParamByName('P_PROVINCIA').AsString := ExtractValueAsString('Provincia', 3);
    Qry.Params.ParamByName('P_NAZIONESIGLA').AsString := ExtractValueAsString('Nazione', 2, True);
    CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.IdFiscaleIVA;
    Qry.Params.ParamByName('P_PARTITAIVA').AsString := ExtractValueAsString('IdCodice', 16, True);
    CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici;
    Qry.Params.ParamByName('P_CODICEFISCALE').AsString := ExtractValueAsString('CodiceFiscale', 16);
    CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.Contatti;
    Qry.Params.ParamByName('P_TELEFONO').AsString := ExtractValueAsString('Telefono', 30);
    Qry.Params.ParamByName('P_FAX').AsString := ExtractValueAsString('Fax', 30);
    Qry.Params.ParamByName('P_EMAIL').AsString := ExtractValueAsString('Email', 60);
    // Determina il TIPOPERSONA
    if LeftStr(FInvoice.FatturaElettronicaHeader.DatiTrasmissione.FormatoTrasmissione, 3) = 'FPA' then
      Qry.Params.ParamByName('P_TIPOPERSONA').AsString := 'P'
    else
    if LDenominazione <> '' then
      Qry.Params.ParamByName('P_TIPOPERSONA').AsString := 'G'
    else
      Qry.Params.ParamByName('P_TIPOPERSONA').AsString := 'F';
    // Insert
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

procedure TLevanteInvoicePersister.SalvaScadenze(const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer);
var
  Qry, QryTestata: TIB_Cursor;
  I, II: integer;
  LCondizioniPagamento, LModalitaPagamento: string;
  LDataScadenza: TDate;
  LImportoScadenza: Double;
begin
  // Se la fattura elettronica non contiene scadenze avverte l'utente in modo che
  //  possa, se lo vuole, crearle manualmente o con gli automatismi di Levante
  if (FInvoice.FatturaElettronicaBody.Items[0].DatiPagamento.Count = 0) then
    DM1.Messaggi('Levante', 'Il documento non contiene scadenze di pagamento!!!',
    'NB: Se si desidera aggiornare lo scadenzario con i pagamenti di questo documento sarà necessario farlo manualmente o con gli automatismi di Levante.',
    [mbOk], 0, nil);
  // Imposta la query
  Qry := TIB_Cursor.Create(nil);
  QryTestata := TIB_Cursor.Create(nil);
  try
    // Query per dati scadenze nella testata documento
    QryTestata.DatabaseName := DM1.ArcDBFile;
    QryTestata.IB_Connection := DM1.DBAzienda;
    // Query scadenzario
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('INSERT INTO SCADENZ (' +
      'TIPO,' +
      'CODICE,' +
      'DATASCADENZA,' +
      'CLIENTE,' +
      'TIPODOC,' +
      'NUMDOC,' +
      'REGISTRO,' +
      'DATADOC,' +
      'IMPORTO,' +
      'IMPORTOPAGATO,' +
      'RICEVUTABANCARIA,' +
      'ABI,' +
      'CAB,' +
      'IBAN,' +
      'PRESENTATA,' +
      'INSOLUTO,' +
      'PA_CONDIZIONIPAGAMENTOSIGLA,' +
      'PA_MODALITAPAGAMENTOSICLA,' +
      'ID');
    Qry.SQL.Add(') VALUES (' +
      ':P_TIPO,' +
      ':P_CODICE,' +
      ':P_DATASCADENZA,' +
      ':P_CLIENTE,' +
      ':P_TIPODOC,' +
      ':P_NUMDOC,' +
      ':P_REGISTRO,' +
      ':P_DATADOC,' +
      ':P_IMPORTO,' +
      ':P_IMPORTOPAGATO,' +
      ':P_RICEVUTABANCARIA,' +
      ':P_ABI,' +
      ':P_CAB,' +
      ':P_IBAN,' +
      ':P_PRESENTATA,' +
      ':P_INSOLUTO,' +
      ':P_PA_CONDIZIONIPAGAMENTOSIGLA,' +
      ':P_PA_MODALITAPAGAMENTOSICLA,' +
      ':P_ID)');
    Qry.Prepare;

    // Imposta i parametri per i vari righi (loop)
    for I := 0 to FInvoice.FatturaElettronicaBody.Items[0].DatiPagamento.Count-1 do
    begin
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiPagamento.Items[I];
      LCondizioniPagamento := ExtractValueAsString('CondizioniPagamento', 4, True);
      for II := 0 to FInvoice.FatturaElettronicaBody.Items[0].DatiPagamento.Items[I].DettaglioPagamento.Count -1 do
      begin
        // Carica alcuni valori in variabili locali per comodità
        CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiPagamento.Items[I].DettaglioPagamento.Items[II];
        LModalitaPagamento := ExtractValueAsString('ModalitaPagamento', 4, True);
        LImportoScadenza := ExtractValueAsFloat('ImportoPagamento', True);
        LDataScadenza := ExtractValueAsDateTimeDefaultMsg('DataScadenzaPagamento', ADataDoc,
          'A T T E N Z I O N E !!!'#13#13'Nella fattura elettronica non è specificata la data scadenza pagamento.'#13#13'Verrà impostata la data del documento stesso (a vista documento).');
        // IMposta parametri scadenza corrente
        if ATipoDoc = 'N.C.fornit' then
          Qry.ParamByName('P_TIPO').AsString := 'Scad.attiv'
        else
          Qry.ParamByName('P_TIPO').AsString := 'Scad.passi';
        Qry.ParamByName('P_CODICE').AsInteger := DM1.NextCodice('SCADENZ', 'CODICE');
        Qry.ParamByName('P_DATASCADENZA').AsDateTime := LDataScadenza;
        Qry.ParamByName('P_CLIENTE').AsInteger := ACodiceCliente;
        Qry.ParamByName('P_TIPODOC').AsString := ATipoDoc;
        Qry.ParamByName('P_NUMDOC').AsInteger := ANumDoc;
        Qry.ParamByName('P_REGISTRO').AsString := ARegDoc;
        Qry.ParamByName('P_DATADOC').AsDateTime := ADataDoc;
        Qry.ParamByName('P_IMPORTO').AsFloat := LImportoScadenza;
        Qry.ParamByName('P_IMPORTOPAGATO').AsFloat := 0;
        if LModalitaPagamento = 'MP12' then
          Qry.ParamByName('P_RICEVUTABANCARIA').AsString := 'T'
        else
          Qry.ParamByName('P_RICEVUTABANCARIA').AsString := 'F';
        Qry.ParamByName('P_ABI').AsString := ExtractValueAsString('ABI', 10);
        Qry.ParamByName('P_CAB').AsString := ExtractValueAsString('CAB', 10);
        Qry.ParamByName('P_IBAN').AsString := ExtractValueAsString('IBAN', 34);
        Qry.ParamByName('P_PRESENTATA').AsString := '/';
        Qry.ParamByName('P_INSOLUTO').AsString := 'F';
        Qry.ParamByName('P_PA_CONDIZIONIPAGAMENTOSIGLA').AsString := LCondizioniPagamento;
        Qry.ParamByName('P_PA_MODALITAPAGAMENTOSICLA').AsString := LModalitaPagamento;
        Qry.ParamByName('P_ID').AsInteger := DM1.Generators_NextGenID('GEN_ID_SCADENZE');
        // Exec
        Qry.ExecSQL;

        // Query per aggiungere la scadenza anche alla testata documento
        if II <= 4 then
        begin
          QryTestata.Unprepare;
          QryTestata.SQL.Clear;
          QryTestata.SQL.Add('UPDATE PRVORDCL SET');
          QryTestata.SQL.Add(Format('DATASCAD%d = :P_DATASCAD', [II+1]));
          QryTestata.SQL.Add(Format(',IMPORTOSCAD%d = :P_IMPORTOSCAD', [II+1]));
          QryTestata.SQL.Add('WHERE TIPODOCUMENTO = :P_TIPODOC AND REGISTRO = :P_REGDOC AND NUMORDPREV = :P_NUMDOC AND DATADOCUMENTO = :P_DATADOC');
          QryTestata.Prepare;
          QryTestata.ParamByName('P_DATASCAD').AsDateTime := LDataScadenza;
          QryTestata.ParamByName('P_IMPORTOSCAD').AsDouble := LImportoScadenza;
          QryTestata.ParamByName('P_TIPODOC').AsString := ATipoDoc;
          QryTestata.ParamByName('P_REGDOC').AsString := ARegDoc;
          QryTestata.ParamByName('P_NUMDOC').AsInteger := ANumDoc;
          QryTestata.ParamByName('P_DATADOC').AsDateTime := ADataDoc;
          QryTestata.ExecSQL;
        end;
      end;
    end;
  finally
    Qry.Free;
    QryTestata.Free;
  end;
end;

procedure TLevanteInvoicePersister.SalvaAttachments(const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer);
var
  I: Integer;
  LNodeAllegato: IXMLAllegatiType;
  qIns: TIB_Cursor;
  NewAnnoProt: String;
  NewNumProt, NewRevProt: Integer;
  LEncoded: String;
  LFileStream: TFileStream;
  LBytes: TArray<Byte>;
  LZLB: TZLBArchive;
  LFileName: String;
  LFullPathFileName: String;
  LFullPathCompressedFileName: String;
begin
  // Crea gli oggetti query
  LFileStream := nil;
  qIns := TIB_Cursor.Create(nil);
  try
    qIns.DatabaseName   := DM1.ArcDBFile;
    qIns.IB_Connection  := DM1.DBAzienda;
    // Imposta la query che inserirà il nuovo Allegato
    qIns.SQL.Add('INSERT INTO ALLEGATI (ANNOPROT, NUMPROT, REVPROT, TIPODOC, REGDOC, NUMDOC, DATADOC, CODSOGG');
    qIns.SQL.Add('  ,NOTE, CREAZ_OPERATORE, CREAZ_DATAORA, PA_ALLEGA, FILE_NAME, FILE_EXT, FILE_BLOB');
    qIns.SQL.Add(') VALUES (');
    qIns.SQL.Add(':P_ANNOPROT, :P_NUMPROT, :P_REVPROT, :P_TIPODOC, :P_REGDOC, :P_NUMDOC, :P_DATADOC, :P_CODSOGG');
    qIns.SQL.Add(', :P_NOTE, :P_CREAZ_OPERATORE, CURRENT_TIMESTAMP, :P_PA_ALLEGA, :P_FILE_NAME, :P_FILE_EXT, :P_FILE_BLOB');
    qIns.SQL.Add(')');
    qIns.Prepare;
    // Cicla per tutti gli eventuali allegati presenti nella fattura elettronica
    for I := 0 to FInvoice.FatturaElettronicaBody[0].Allegati.Count -1 do
    begin
      // Estrae il nodo relativo all'allegato corrente
      LNodeAllegato := FInvoice.FatturaElettronicaBody[0].Allegati[I];
      // Determinazione del nuovo protocollo per il nuovo allegato
      NewAnnoProt := FormatDateTime('yyyy', Now);
      NewNumProt  := TAllegatiForm.NextProt(NewAnnoProt);
      NewRevProt  := TAllegatiForm.NextRevProt(NewAnnoProt, NewNumProt);
      // Determina il nome del file (con bonifica dei caratteri che danno problemi)
      LFileName := Trim(LNodeAllegato.NomeAttachment);
      LFileName := StringReplace(LFileName, '\', '-', [rfReplaceAll]);
      LFileName := StringReplace(LFileName, '/', '-', [rfReplaceAll]);
      LFullPathFileName := DM1.CartellaTmp + LFileName;
      // Genera il nome del file temporaneo da utilitzzare per la creazione del file compresso
      LFullPathCompressedFileName := DM1.GetTempFileName('zlb', DM1.CartellaTmp);
      // Decodifica l'allegato
      LEncoded := LNodeAllegato.Attachment;
      LBytes := DecodeBase64(LEncoded);
      LFileStream := TFileStream.Create(LFullPathFileName, fmCreate);
      try
        LFileStream.WriteBuffer(LBytes[0], Length(LBytes));
      finally
        LFileStream.Free;
      end;
      // Compressione
      LZLB := TZLBArchive.Create(nil);
      try
        Sleep(100);  // NB: Per risolvere un problema di Pianeta Ascensori (non so perchè funziona)
        LZLB.CreateArchive(LFullPathCompressedFileName);
        Sleep(100);  // NB: Per risolvere un problema di Pianeta Ascensori (non so perchè funziona)
        LZLB.AddFile(LFullPathFileName);
        Sleep(100);  // NB: Per risolvere un problema di Pianeta Ascensori (non so perchè funziona)
        LZLB.CloseArchive;
      finally
        lZLB.Free;
      end;
      // Salva il nuovo allegato
      qIns.ParamByName('P_ANNOPROT').AsString := NewAnnoProt;
      qIns.ParamByName('P_NUMPROT').AsInteger := NewNumProt;
      qIns.ParamByName('P_REVPROT').AsInteger := NewRevProt;
      qIns.ParamByName('P_TIPODOC').AsString := ATipoDoc;
      qIns.ParamByName('P_REGDOC').AsString := ARegDoc;
      qIns.ParamByName('P_NUMDOC').AsInteger := ANumDoc;
      qIns.ParamByName('P_DATADOC').AsDateTime := ADataDoc;
      qIns.ParamByName('P_CODSOGG').AsInteger := ACodiceCliente;
      qIns.ParamByName('P_NOTE').AsString := Trim(LNodeAllegato.DescrizioneAttachment);
      qIns.ParamByName('P_PA_ALLEGA').AsString := 'T';
      qIns.ParamByName('P_FILE_NAME').AsString := LFileName;
      qIns.ParamByName('P_FILE_EXT').AsString := ExtractFileExt(LNodeAllegato.FormatoAttachment);
      qIns.ParamByName('P_FILE_BLOB').LoadFromFile(LFullPathCompressedFileName);
      qIns.ExecSQL;
    end;
  finally
    qIns.Free;
  end;
end;

procedure TLevanteInvoicePersister.SalvaDatiCassaPrevidenziale(const Qry: TIB_Cursor; const ACurrCount: Integer; const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer;
  const ANode: IXMLDatiCassaPrevidenzialeTypeList);
var
  I: Integer;
  LImportoContributoCassa, LImponibileCassa, LAliquotaIVA, LAliquotaCassa: Extended;
  LNaturaIVA, LDescrizione, LRiferimentoAmministrazione: String;
begin
  // Cicla per tutti i nodi <DatiCassaPrevideniale> presenti
  for I := 0 to ANode.Count-1 do
  begin
    CurrentNode := ANode.Items[I];
    // Carica alcune variabili locali per comodità
    LAliquotaCassa := ExtractValueAsFloat('AlCassa', True);
    LImportoContributoCassa := ExtractValueAsFloat('ImportoContributoCassa', True);
    LImponibileCassa := ExtractValueAsFloat('ImponibileCassa', False);
    LAliquotaIVA := ExtractValueAsFloat('AliquotaIVA', True);
    LNaturaIVA := ExtractValueAsString('Natura', 4, False);
    LRiferimentoAmministrazione := ExtractValueAsString('RiferimentoAmministrazione', 20, False);
    // Calcola la descrizione del rigo
    LDescrizione := 'Contributo cassa previdenziale ' + FloatToStr(LAliquotaCassa) + '%';
    if LImponibileCassa > 0 then
      LDescrizione := LDescrizione + ' su ' + CurrToStrF(LImponibileCassa, ffCurrency, 2);
    // Carica i valori nella query...
    Qry.ParamByName('P_TIPODOCUMENTO').AsString := ATipoDoc;
    Qry.ParamByName('P_REGISTRO').AsString := ARegDoc;
    Qry.ParamByName('P_NUMORDPREV').AsInteger := ANumDoc;
    Qry.ParamByName('P_DATADOCUMENTO').AsDateTime := ADataDoc;
    Qry.ParamByName('P_PROGRIGO').AsInteger := (ACurrCount+I+1);
    Qry.ParamByName('P_PROGRIGO2').AsInteger := -1;
    Qry.ParamByName('P_CODICECLIENTE').AsInteger := ACodiceCliente;
    Qry.ParamByName('P_CODICEARTICOLO').Clear;
    Qry.ParamByName('P_CODICEARTICOLOSTM').Clear;
    Qry.ParamByName('P_DESCRIZIONE').AsString := LDescrizione;
    Qry.ParamByName('P_UNITADIMISURA').Clear;
    Qry.ParamByName('P_QTA').AsFloat := 1;
    Qry.ParamByName('P_PREZZOUNITARIO').AsFloat := LImportoContributoCassa;
    Qry.ParamByName('P_IMPORTORIGO').AsFloat := LImportoContributoCassa;
    Qry.ParamByName('P_SCONTORIGO').Clear;
    Qry.ParamByName('P_SCONTORIGO2').Clear;
    Qry.ParamByName('P_SCONTORIGO3').Clear;
    Qry.ParamByName('P_CODICEIVA').AsInteger := FindCodiceIVA(LAliquotaIVA, LNaturaIVA);
    Qry.ParamByName('P_DESCRIZIONEIVA').AsString := FindDescrizioneIVA(LAliquotaIVA, LNaturaIVA);
    Qry.ParamByName('P_ALIQUOTAIVA').AsFloat := LAliquotaIVA;
    Qry.ParamByName('P_MOVMAG').AsString := GetAzioneMagazzino;
    Qry.ParamByName('P_SEGNOOPERAZIONECANTIERE').AsString := GetAzioneCantiere;
    Qry.ParamByName('P_CODICEMAGAZZINO').AsString := DM1.MagazzinoDefault;
    Qry.ParamByName('P_NOTERIGO').AsString := LRiferimentoAmministrazione;
    // Margine
    Qry.ParamByName('P_PREZZOACQUISTOARTICOLO').AsFloat := LImportoContributoCassa;
    Qry.ParamByName('P_IMPORTOCOSTO').AsFloat := LImportoContributoCassa;
    Qry.ParamByName('P_MARGINE').AsFloat := 0;
    Qry.ParamByName('P_IMPORTOMARGINE').AsFloat := 0;
    // Componenti
    Qry.ParamByName('P_COMPONENTIUNIT').AsFloat := LImportoContributoCassa;
    Qry.ParamByName('P_IMPORTOCOMPONENTI').AsFloat := LImportoContributoCassa;
    Qry.ParamByName('P_COSTOCOMPONENTIUNIT').AsFloat := LImportoContributoCassa;
    Qry.ParamByName('P_IMPORTOCOSTOCOMPONENTI').AsFloat := LImportoContributoCassa;
    Qry.ParamByName('P_MARGINECOMPONENTI').AsFloat := 0;
    Qry.ParamByName('P_IMPORTOMARGINECOMPONENTI').AsFloat := 0;
    // Exec
    Qry.ExecSQL;
  end;
end;

procedure TLevanteInvoicePersister.SalvaDDTCorrelati(const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const ANode: IXMLDatiDDTTypeList);
var
  Qry: TIB_Cursor;
  I: Integer;
begin
  // Imposta la query
  Qry := TIB_Cursor.Create(nil);
  try
    // Query per dati scadenze nella testata documento
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta la query per il salvataggio dei nuovi righi
    Qry.SQL.Clear;
    Qry.SQL.Add('insert into PRVORDCL_DOCCORRELATI (TipoDocumento, Registro, NumOrdPrev, DataDocumento, Tipo, RiferimentoNumeroLinea, IdDocumento, Data)');
    Qry.SQL.Add('values (:P_TipoDocumento, :P_Registro, :P_NumOrdPrev, :P_DataDocumento, :P_Tipo, :P_RiferimentoNumeroLinea, :P_IdDocumento, :P_Data)');
    Qry.Prepare;
    // Cicla per tutti gli eventuali DDT correlati presenti nella fattura elettronica
    for I := 0 to ANode.Count-1 do
    begin
      CurrentNode := ANode.Items[I];
      // Carica i valori del documento corrente
      Qry.ParamValues['P_TipoDocumento'] := ATipoDoc;
      Qry.ParamValues['P_Registro'] := ARegDoc;
      Qry.ParamValues['P_NumOrdPrev'] := ANumDoc;
      Qry.ParamValues['P_DataDocumento'] := ADataDoc;
      Qry.ParamValues['P_Tipo'] := 'D.D.T.';
      Qry.ParamValues['P_IdDocumento'] := ExtractValueAsString('NumeroDDT', 20, True);
      Qry.ParamValues['P_Data'] := ExtractValueAsDateTime('DataDDT', True);
      Qry.ParamValues['P_RiferimentoNumeroLinea'] := ExtractRiferimentoNumeroLinea(FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiDDT.Items[I].RiferimentoNumeroLinea);
      // Exec
      Qry.ExecSQL;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TLevanteInvoicePersister.SalvaDocumentiCorrelati(const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const ANode: IXMLDatiDocumentiCorrelatiTypeList; const ATipoDocCorr: String);
var
  Qry: TIB_Cursor;
  I: Integer;
begin
  // Imposta la query
  Qry := TIB_Cursor.Create(nil);
  try
    // Query per dati scadenze nella testata documento
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Imposta la query per il salvataggio dei nuovi righi
    Qry.SQL.Clear;
    Qry.SQL.Add('insert into PRVORDCL_DOCCORRELATI (TipoDocumento, Registro, NumOrdPrev, DataDocumento, Tipo, RiferimentoNumeroLinea, IdDocumento, Data, NumItem, CodiceCommessaConvenzione, CodiceCUP, CodiceCIG)');
    Qry.SQL.Add('values (:P_TipoDocumento, :P_Registro, :P_NumOrdPrev, :P_DataDocumento, :P_Tipo, :P_RiferimentoNumeroLinea, :P_IdDocumento, :P_Data, :P_NumItem, :P_CodiceCommessaConvenzione, :P_CodiceCUP, :P_CodiceCIG)');
    Qry.Prepare;
    // Cicla per tutti gli eventuali DDT correlati presenti nella fattura elettronica
    for I := 0 to ANode.Count-1 do
    begin
      CurrentNode := ANode.Items[I];
      // Carica i valori del documento corrente
      Qry.ParamValues['P_TipoDocumento'] := ATipoDoc;
      Qry.ParamValues['P_Registro'] := ARegDoc;
      Qry.ParamValues['P_NumOrdPrev'] := ANumDoc;
      Qry.ParamValues['P_DataDocumento'] := ADataDoc;
      Qry.ParamValues['P_Tipo'] := ATipoDocCorr;
      Qry.ParamValues['P_IdDocumento'] := ExtractValueAsString('IdDocumento', 20, True);
      Qry.ParamValues['P_Data'] := ExtractValueAsDateTime('Data');
      Qry.ParamValues['P_NumItem'] := ExtractValueAsString('NumItem', 20);
      Qry.ParamValues['P_CodiceCommessaConvenzione'] := ExtractValueAsString('CodiceCommessaConvenzione', 100);
      Qry.ParamValues['P_CodiceCUP'] := ExtractValueAsString('CodiceCUP', 15);
      Qry.ParamValues['P_CodiceCIG'] := ExtractValueAsString('CodiceCIG', 15);
      Qry.ParamValues['P_RiferimentoNumeroLinea'] := ExtractRiferimentoNumeroLinea(ANode.Items[I].RiferimentoNumeroLinea);
      // Exec
      Qry.ExecSQL;
    end;
  finally
    Qry.Free;
  end;
end;

procedure TLevanteInvoicePersister.SalvaRighe(const ATipoDoc, ARegDoc: string;const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer);
var
  Qry: TIB_Cursor;
  I: integer;
  LQta, LCostoUnitario: Double;
begin
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // Inizio dell'impostazione della query che effettuerà l'inserimento
    Qry.SQL.Add('INSERT INTO RIGHIPRV (' +
      'TIPODOCUMENTO,' +
      'REGISTRO,' +
      'NUMORDPREV,' +
      'DATADOCUMENTO,' +
      'PROGRIGO,' +
      'PROGRIGO2,' +
      'CODICECLIENTE,' +
      'CODICEARTICOLO,' +
      'CODICEARTICOLOSTM,' +
      'DESCRIZIONE,' +
      'UNITADIMISURA,' +
      'QTA,' +
      'PREZZOUNITARIO,' +
      'IMPORTORIGO,' +
      'SCONTORIGO,' +
      'SCONTORIGO2,' +
      'SCONTORIGO3,' +
      'CODICEIVA,' +
      'DESCRIZIONEIVA,' +
      'ALIQUOTAIVA,' +
      'MOVMAG,' +
      'SEGNOOPERAZIONECANTIERE,' +
      'CODICEMAGAZZINO,' +
      'NOTERIGO,' +
      // Margine
      'PREZZOACQUISTOARTICOLO,' +
      'IMPORTOCOSTO,' +
      'MARGINE,' +
      'IMPORTOMARGINE,' +
      // Componenti
      'COMPONENTIUNIT,' +
      'IMPORTOCOMPONENTI,' +
      'COSTOCOMPONENTIUNIT,' +
      'IMPORTOCOSTOCOMPONENTI,' +
      'MARGINECOMPONENTI,' +
      'IMPORTOMARGINECOMPONENTI');
    Qry.SQL.Add(') VALUES (' +
      ':P_TIPODOCUMENTO,' +
      ':P_REGISTRO,' +
      ':P_NUMORDPREV,' +
      ':P_DATADOCUMENTO,' +
      ':P_PROGRIGO,' +
      ':P_PROGRIGO2,' +
      ':P_CODICECLIENTE,' +
      ':P_CODICEARTICOLO,' +
      ':P_CODICEARTICOLOSTM,' +
      ':P_DESCRIZIONE,' +
      ':P_UNITADIMISURA,' +
      ':P_QTA,' +
      ':P_PREZZOUNITARIO,' +
      ':P_IMPORTORIGO,' +
      ':P_SCONTORIGO,' +
      ':P_SCONTORIGO2,' +
      ':P_SCONTORIGO3,' +
      ':P_CODICEIVA,' +
      ':P_DESCRIZIONEIVA,' +
      ':P_ALIQUOTAIVA,' +
      ':P_MOVMAG,' +
      ':P_SEGNOOPERAZIONECANTIERE,' +
      ':P_CODICEMAGAZZINO,' +
      ':P_NOTERIGO,' +
      // Margine
      ':P_PREZZOACQUISTOARTICOLO,' +
      ':P_IMPORTOCOSTO,' +
      ':P_MARGINE,' +
      ':P_IMPORTOMARGINE,' +
      // Componenti
      ':P_COMPONENTIUNIT,' +
      ':P_IMPORTOCOMPONENTI,' +
      ':P_COSTOCOMPONENTIUNIT,' +
      ':P_IMPORTOCOSTOCOMPONENTI,' +
      ':P_MARGINECOMPONENTI,' +
      ':P_IMPORTOMARGINECOMPONENTI)');
    Qry.Prepare;

    // Set param values

    // Imposta i parametri per i vari righi (loop)
    for I := 0 to FInvoice.FatturaElettronicaBody.Items[0].DatiBeniServizi.DettaglioLinee.Count -1 do
    begin
      Qry.ParamByName('P_TIPODOCUMENTO').AsString := ATipoDoc;
      Qry.ParamByName('P_REGISTRO').AsString := ARegDoc;
      Qry.ParamByName('P_NUMORDPREV').AsInteger := ANumDoc;
      Qry.ParamByName('P_DATADOCUMENTO').AsDateTime := ADataDoc;
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiBeniServizi.DettaglioLinee.Items[I];
//      Qry.ParamByName('P_PROGRIGO').AsInteger := ExtractValueAsInteger('NumeroLinea', True);
      Qry.ParamByName('P_PROGRIGO').AsInteger := (I+1);
      Qry.ParamByName('P_PROGRIGO2').AsInteger := -1;
      Qry.ParamByName('P_CODICECLIENTE').AsInteger := ACodiceCliente;
      if CurrentNode.ChildNodes.IndexOf('CodiceArticolo') > -1 then
      begin
        CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiBeniServizi.DettaglioLinee.Items[I].CodiceArticolo.Items[0];
        Qry.ParamByName('P_CODICEARTICOLO').AsString := ExtractValueAsString('CodiceValore', 25, True);
        Qry.ParamByName('P_CODICEARTICOLOSTM').AsString := ExtractValueAsString('CodiceValore', 25, True);
      end
      else
      begin
        Qry.ParamByName('P_CODICEARTICOLO').Clear;
        Qry.ParamByName('P_CODICEARTICOLOSTM').Clear;
      end;
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiBeniServizi.DettaglioLinee.Items[I];
      Qry.ParamByName('P_DESCRIZIONE').AsString := ExtractValueAsString('Descrizione', 1000, True);
      Qry.ParamByName('P_UNITADIMISURA').AsString := ExtractValueAsString('UnitaMisura', 2);
      Qry.ParamByName('P_QTA').AsFloat := ExtractValueAsFloat('Quantita');
      Qry.ParamByName('P_PREZZOUNITARIO').AsFloat := ExtractValueAsFloat('PrezzoUnitario', True);
      Qry.ParamByName('P_IMPORTORIGO').AsFloat := ExtractValueAsFloat('PrezzoTotale', True);
      SetScontiRigo(Qry.ParamByName('P_SCONTORIGO'), Qry.ParamByName('P_SCONTORIGO2'), Qry.ParamByName('P_SCONTORIGO3'));
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiBeniServizi.DettaglioLinee.Items[I];
      Qry.ParamByName('P_CODICEIVA').AsInteger := FindCodiceIVA(  ExtractValueAsFloat('AliquotaIVA', True), ExtractValueAsString('Natura')  );
      Qry.ParamByName('P_DESCRIZIONEIVA').AsString := FindDescrizioneIVA(  ExtractValueAsFloat('AliquotaIVA', True), ExtractValueAsString('Natura')  );
      Qry.ParamByName('P_ALIQUOTAIVA').AsFloat := ExtractValueAsFloat('AliquotaIVA', True);
      Qry.ParamByName('P_MOVMAG').AsString := GetAzioneMagazzino;
      Qry.ParamByName('P_SEGNOOPERAZIONECANTIERE').AsString := GetAzioneCantiere;
      Qry.ParamByName('P_CODICEMAGAZZINO').AsString := DM1.MagazzinoDefault;
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiBeniServizi.DettaglioLinee.Items[I];
      Qry.ParamByName('P_NOTERIGO').AsString := ExtractValueAsString('RiferimentoAmministrazione', 20);
      // Calcola il costo unitario
      LQta := ExtractValueAsFloat('Quantita');
      if LQta <> 0 then
        LCostoUnitario := ExtractValueAsFloat('PrezzoTotale', True) / LQta
      else
        LCostoUnitario := ExtractValueAsFloat('PrezzoTotale', True) / 1;
      // Margine
      Qry.ParamByName('P_PREZZOACQUISTOARTICOLO').AsFloat := LCostoUnitario;
      Qry.ParamByName('P_IMPORTOCOSTO').AsFloat := ExtractValueAsFloat('PrezzoTotale', True);
      Qry.ParamByName('P_MARGINE').AsFloat := 0;
      Qry.ParamByName('P_IMPORTOMARGINE').AsFloat := 0;
      // Componenti
      Qry.ParamByName('P_COMPONENTIUNIT').AsFloat := LCostoUnitario;
      Qry.ParamByName('P_IMPORTOCOMPONENTI').AsFloat := ExtractValueAsFloat('PrezzoTotale', True);
      Qry.ParamByName('P_COSTOCOMPONENTIUNIT').AsFloat := LCostoUnitario;
      Qry.ParamByName('P_IMPORTOCOSTOCOMPONENTI').AsFloat := ExtractValueAsFloat('PrezzoTotale', True);
      Qry.ParamByName('P_MARGINECOMPONENTI').AsFloat := 0;
      Qry.ParamByName('P_IMPORTOMARGINECOMPONENTI').AsFloat := 0;
      // Exec
      Qry.ExecSQL;
    end;

    // Se è presente la sezione 2.1.1.7 <DatiCassaPrevidenziale> provede ad aggiungere un rigo alla fattura stessa
    //  valorizzandola con i dati della cassa previdenziale stessa
    CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento;
    if PropertyExists('DatiCassaPrevidenziale') then
      SalvaDatiCassaPrevidenziale(Qry, I, ATipoDoc, ARegDoc, ANumDoc, ADataDoc, ACodiceCliente, FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento.DatiCassaPrevidenziale);

  finally
    Qry.Free;
  end;
end;

procedure TLevanteInvoicePersister.SalvaTestata(const ATipoDoc, ARegDoc: string; const ANumDoc: integer; const ADataDoc: TDateTime; const ACodiceCliente: integer; const AFileName: string; const AStatus: string);
var
  Qry: TIB_Cursor;
  I, LCodiceIVA: integer;
  Istr: string;
  LTotaleMerce, LTotaleIVA, LRitenutaAccontoImporto: Extended;
  LO: TMemIniFile;
  function SearchIndexIVADoc(const ACodiceIVA: Integer): String;
  var
    CID: Integer;
    StrCID: String;
  begin
    for CID := 1 to 4 do
    begin
      StrCID := IntToStr(CID);
      if Qry.ParamByName('P_CODICEIVA'+StrCID).IsNull or (Qry.ParamByName('P_CODICEIVA'+StrCID).AsInteger = ACodiceIVA) then
        Exit(StrCID);
    end;
    // Se arriva qui significa che si sono superate le righe del castelletto IVA disponibili in Levante
    raise Exception.Create('Ci sono più di 4 aliquote IVA, impossibile caricare questa fattura!!!');
  end;
begin
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;

    Qry.SQL.Add('INSERT INTO PRVORDCL (' +
      'TIPODOCUMENTO,' +
      'TIPODOCUMENTOESTESO,' +
      'REGISTRO,' +
      'NUMORDPREV,' +
      'DATADOCUMENTO,' +
      // Intestatario
      'CODICECLIENTE,' +
      'RAGSOCCLI,' +
      'INDIRIZZOCLI,' +
      'NUMCIVICOCLI,' +
      'CITTACLI,' +
      'CAPCLI,' +
      'PROVINCIACLI,' +
      'PARTITAIVACLI,' +
      'CODICEFISCALECLI,' +
      // Altro
      'MESECOMPETENZA,' +
      'CODICEMAGAZZINO,' +
      'LISTINO,' +
      'CAUSALE,' +
      'SEGNOOPERAZIONE,' +
      'SEGNOOPERAZIONECANTIERE,' +
      // Dati trasporto
  //    'TRASPORTOACURA,' +
  //    'DATIVETTORE,' +
  //    'DATATRASP,' +
  //    'ORATRASP,' +
  //    'NUMCOLLI,' +
  //    'ASPETTOESTERIOREBENI,' +
  //    'PORTO,' +
      // Altro
      'OPERATORE,' +
      'DATAULTMOD_CREAZIONE,' +
      // RitenutaAcconto
      'RITACCPERC,' +
      'RITACC,' +
      'RITACCSUIMPORTOIMP,' +
      'RITACCIMPONIBILE,' +
      // DatiRiepilogo - Casteletto IVA
      'TOTALERIGHI1,' +
      'SCONTOALIQUOTA1,' +
      'TOTALEIMPONIBILE1,' +
      'CODICEIVA1,' +
      'IMPORTOIVA1,' +
      'TOTALERIGHI2,' +
      'SCONTOALIQUOTA2,' +
      'TOTALEIMPONIBILE2,' +
      'CODICEIVA2,' +
      'IMPORTOIVA2,' +
      'TOTALERIGHI3,' +
      'SCONTOALIQUOTA3,' +
      'TOTALEIMPONIBILE3,' +
      'CODICEIVA3,' +
      'IMPORTOIVA3,' +
      'TOTALERIGHI4,' +
      'SCONTOALIQUOTA4,' +
      'TOTALEIMPONIBILE4,' +
      'CODICEIVA4,' +
      'IMPORTOIVA4,' +
      // Totali documento
      'TOTALEMERCE,' +
      'TOTALENETTOMERCE,' +
      'TOTALEIMPONIBILE,' +
      'TOTALEDOCUMENTO,' +
      'ABBUONO,' +
      'TOTALEDAPAGARE,' +
      'FE_ID,' +
      'FE_STATUS,' +
      'PROTOCOLLO_DATA');
    Qry.SQL.Add(') VALUES (' +
      ':P_TIPODOCUMENTO,' +
      ':P_TIPODOCUMENTOESTESO,' +
      ':P_REGISTRO,' +
      ':P_NUMORDPREV,' +
      ':P_DATADOCUMENTO,' +
      // Intestatario
      ':P_CODICECLIENTE,' +
      ':P_RAGSOCCLI,' +
      ':P_INDIRIZZOCLI,' +
      ':P_NUMCIVICOCLI,' +
      ':P_CITTACLI,' +
      ':P_CAPCLI,' +
      ':P_PROVINCIACLI,' +
      ':P_PARTITAIVACLI,' +
      ':P_CODICEFISCALECLI,' +
      // Altro
      ':P_MESECOMPETENZA,' +
      ':P_CODICEMAGAZZINO,' +
      ':P_LISTINO,' +
      ':P_CAUSALE,' +
      ':P_SEGNOOPERAZIONE,' +
      ':P_SEGNOOPERAZIONECANTIERE,' +
      // Dati trasporto
  //    ':P_TRASPORTOACURA,' +
  //    ':P_DATIVETTORE,' +
  //    ':P_DATATRASP,' +
  //    ':P_ORATRASP,' +
  //    ':P_NUMCOLLI,' +
  //    ':P_ASPETTOESTERIOREBENI,' +
  //    ':P_PORTO,' +
      // Altro
      ':P_OPERATORE,' +
      ':P_DATAULTMOD_CREAZIONE,' +
      // RitenutaAcconto
      ':P_RITACCPERC,' +
      ':P_RITACC,' +
      ':P_RITACCSUIMPORTOIMP,' +
      ':P_RITACCIMPONIBILE,' +
      // DatiRiepilogo - Casteletto IVA
      ':P_TOTALERIGHI1,' +
      ':P_SCONTOALIQUOTA1,' +
      ':P_TOTALEIMPONIBILE1,' +
      ':P_CODICEIVA1,' +
      ':P_IMPORTOIVA1,' +
      ':P_TOTALERIGHI2,' +
      ':P_SCONTOALIQUOTA2,' +
      ':P_TOTALEIMPONIBILE2,' +
      ':P_CODICEIVA2,' +
      ':P_IMPORTOIVA2,' +
      ':P_TOTALERIGHI3,' +
      ':P_SCONTOALIQUOTA3,' +
      ':P_TOTALEIMPONIBILE3,' +
      ':P_CODICEIVA3,' +
      ':P_IMPORTOIVA3,' +
      ':P_TOTALERIGHI4,' +
      ':P_SCONTOALIQUOTA4,' +
      ':P_TOTALEIMPONIBILE4,' +
      ':P_CODICEIVA4,' +
      ':P_IMPORTOIVA4,' +
      // Totali documento
      ':P_TOTALEMERCE,' +
      ':P_TOTALENETTOMERCE,' +
      ':P_TOTALEIMPONIBILE,' +
      ':P_TOTALEDOCUMENTO,' +
      ':P_ABBUONO,' +
      ':P_TOTALEDAPAGARE,' +
      ':P_FE_ID,' +
      ':P_FE_STATUS,' +
      ':P_PROTOCOLLO_DATA)');
    Qry.Prepare;

    // Set param values

    // TipoNumData
    Qry.ParamByName('P_TIPODOCUMENTO').AsString := ATipoDoc;
    Qry.ParamByName('P_REGISTRO').AsString := ARegDoc;
    Qry.ParamByName('P_NUMORDPREV').AsInteger := ANumDoc;
    Qry.ParamByName('P_DATADOCUMENTO').AsDateTime := ADataDoc;
    Qry.ParamByName('P_TIPODOCUMENTOESTESO').AsString := ExtractTipoDocumentoEsteso;
    // Intestatario
    Qry.ParamByName('P_CODICECLIENTE').AsInteger := ACodiceCliente;
    Qry.ParamByName('P_RAGSOCCLI').AsString := ExtractRagSoc;
    CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.Sede;
    Qry.ParamByName('P_INDIRIZZOCLI').AsString := ExtractValueAsString('Indirizzo', 80, True);
    Qry.ParamByName('P_NUMCIVICOCLI').AsString := ExtractValueAsString('NumeroCivico', 10);
    Qry.ParamByName('P_CITTACLI').AsString := ExtractValueAsString('Comune', 60, True);
    Qry.ParamByName('P_CAPCLI').AsString := ExtractValueAsString('CAP', 5, True);
    Qry.ParamByName('P_PROVINCIACLI').AsString := ExtractValueAsString('Provincia', 3);
    CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.IdFiscaleIVA;
    Qry.ParamByName('P_PARTITAIVACLI').AsString := ExtractValueAsString('IdCodice', 16, True);
    CurrentNode := FInvoice.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici;
    Qry.ParamByName('P_CODICEFISCALECLI').AsString := ExtractValueAsString('CodiceFiscale', 16);
    // Altro
    Qry.ParamByName('P_MESECOMPETENZA').AsInteger := ExtractMeseCompetenza;
    Qry.ParamByName('P_CODICEMAGAZZINO').AsString := DM1.MagazzinoDefault;
    Qry.ParamByName('P_LISTINO').AsInteger := 0;
    Qry.ParamByName('P_CAUSALE').AsString := GetCausaleDefault;
    Qry.ParamByName('P_SEGNOOPERAZIONE').AsString := GetAzioneMagazzino;
    Qry.ParamByName('P_SEGNOOPERAZIONECANTIERE').AsString := GetAzioneCantiere;
    // Dati trasporto
//    Qry.ParamByName('P_TRASPORTOACURA').AsString := ;
//    Qry.ParamByName('P_DATIVETTORE').AsString := ;
//    Qry.ParamByName('P_DATATRASP').AsString := ;
//    Qry.ParamByName('P_ORATRASP').AsString := ;
//    Qry.ParamByName('P_NUMCOLLI').AsString := ;
//    Qry.ParamByName('P_ASPETTOESTERIOREBENI').AsString := ;
//    Qry.ParamByName('P_PORTO').AsString := ;
    // Altro
    Qry.ParamByName('P_OPERATORE').AsString := DM1.IDOperatoreCorrente;
    Qry.ParamByName('P_DATAULTMOD_CREAZIONE').AsDateTime := Now;

    // NB sul campo SPESE: Siccome nella fattura elettronica le spese accessorie sono inserite come righi con tipologia "AC" (ma pur sempre righi)
    //     oppure possono essere già comprese nei righi normali (il prezzo del bene è già comprensivo di spese accessorie) e poi, in entrambi
    //     i casi vengono riepilogati, come totale, nel campo "SpeseAccessorie" nei DatiRiepilogo (casteletto IVA) giungo alla conclusione
    //     di ignorare il campo "SpeseAccessorie" dei DatiRiepilogo perchè in ogni caso tali spese sono già presenti nei righi e quindi
    //     finiscono già nel castelletto IVA, altrimenti verrebbero calcolate 2 volte (nella fattura elettronica invece, contrariamente a Levante,
    //     le SpeseAccessorie nel riepilogo non vengono sommate al totale).

    // NB sul bollo: Siccome nella fattura elettronica il bollo non deve aumentare il totale documento (a carico del fornitore) oppure se lo fa
    //     (il rimborso bollo da parte del cliente) deve essere inserito come un rigo normale ho deciso di non importare in nessun modo l'importo
    //     dei bolli nel'apposito campo di Levante perchè altrimenti verrebbe calcolato 2 volte (perchè Levante lo aggiunge al totale).

    // Ritenuta acconto
    LRitenutaAccontoImporto := 0;
//    if FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento.ChildNodes.IndexOf('DatiRitenuta') > -1 then
    if FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento.DatiRitenuta.Count > 0 then
    begin
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento.DatiRitenuta.Items[0];
      Qry.ParamByName('P_RITACCPERC').AsFloat := ExtractValueAsFloat('AliquotaRitenuta', True);
      LRitenutaAccontoImporto := ExtractValueAsFloat('ImportoRitenuta', True);
      Qry.ParamByName('P_RITACC').AsFloat := LRitenutaAccontoImporto;
      if ExtractValueAsFloat('AliquotaRitenuta', True) > 0 then
      begin
        Qry.ParamByName('P_RITACCSUIMPORTOIMP').AsString := 'T';
        Qry.ParamByName('P_RITACCIMPONIBILE').AsFloat := DM1.Arrotonda(  100 * ExtractValueAsFloat('ImportoRitenuta', True) / ExtractValueAsFloat('AliquotaRitenuta', True)  , FormatSettings.CurrencyDecimals);
      end;
      // Se nella fattura è presente più di una ritenuta solleva una eccezzione
      if FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento.DatiRitenuta.Count > 1 then
        raise Exception.Create('TLevanteInvoicePersister.SalvaTestata: Nel documento è presente più di una ritenuta d''acconto.');
    end;

    // DatiRiepilogo - Casteletto IVA
    LTotaleMerce := 0;
    LTotaleIVA := 0;
    for I := 0 to FInvoice.FatturaElettronicaBody.Items[0].DatiBeniServizi.DatiRiepilogo.Count-1 do
    begin
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiBeniServizi.DatiRiepilogo.Items[I];

      LCodiceIVA := FindCodiceIVA(  ExtractValueAsFloat('AliquotaIVA', True), ExtractValueAsString('Natura')  );
      Istr := SearchIndexIVADoc(LCodiceIVA);  // Cerca l'indice del castelletto IVA che contiene lo stesso codice IVA, se non c'è ritorna il primo rigo libero del castelletto IVA
//      Istr := IntToStr(I+1);  // OLD CODE

      Qry.ParamByName('P_TOTALERIGHI'+Istr).AsFloat := Qry.ParamByName('P_TOTALERIGHI'+Istr).AsFloat + ExtractValueAsFloat('ImponibileImporto', True);
      Qry.ParamByName('P_SCONTOALIQUOTA'+Istr).AsFloat := 0;
      Qry.ParamByName('P_TOTALEIMPONIBILE'+Istr).AsFloat := Qry.ParamByName('P_TOTALEIMPONIBILE'+Istr).AsFloat + ExtractValueAsFloat('ImponibileImporto', True);
      Qry.ParamByName('P_CODICEIVA'+Istr).AsInteger := LCodiceIVA;
      Qry.ParamByName('P_IMPORTOIVA'+Istr).AsFloat := Qry.ParamByName('P_IMPORTOIVA'+Istr).AsFloat + ExtractValueAsFloat('Imposta', True);
      LTotaleMerce := LTotaleMerce + ExtractValueAsFloat('ImponibileImporto', True);
      LTotaleIVA := LTotaleIVA + ExtractValueAsFloat('Imposta', True);
    end;

    // Totali documento
    Qry.ParamByName('P_TOTALEMERCE').AsFloat := LTotaleMerce;
    Qry.ParamByName('P_TOTALENETTOMERCE').AsFloat := LTotaleMerce;
    Qry.ParamByName('P_TOTALEIMPONIBILE').AsFloat := LTotaleMerce;
    CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento;
    Qry.ParamByName('P_TOTALEDOCUMENTO').AsFloat := ExtractValueAsFloat('ImportoTotaleDocumento');
    Qry.ParamByName('P_ABBUONO').AsFloat := ExtractValueAsFloat('Arrotondamento');
    Qry.ParamByName('P_TOTALEDAPAGARE').AsFloat := ExtractValueAsFloat('ImportoTotaleDocumento') + ExtractValueAsFloat('Arrotondamento') - LRitenutaAccontoImporto;

    Qry.ParamByName('P_FE_ID').AsString := AFileName;
    Qry.ParamByName('P_FE_STATUS').AsString := AStatus;

    // Se abilitato imposta la data di registrazione del protocollo
    LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
    try
      if LO.ReadBool(ATipoDoc, 'ProtocolloAutomatico_Data', False) then
        Qry.ParamByName('P_PROTOCOLLO_DATA').AsDate := Date;
    finally
      LO.Free;
    end;

    // Exec
    Qry.ExecSQL;

  finally
    Qry.Free;
  end;
end;

function TLevanteInvoicePersister.SaveToLevante(const AOpen: boolean; AFileName: string; const AStatus: string): boolean;
var
  LTipoDoc, LRegDoc, LNumDocXML: string;
  LNumDoc, LCodiceCliente: integer;
  LDataDoc: TDateTime;
begin
  Result := False;
  // Estrae il numero fattura dall'XML
  CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento;
  LNumDocXML := ExtractValue('Numero', True);
  // Estrae solo il nome del file
  AFileName := ExtractFileName(AFileName);
  // Carica dati principali documento
  LTipoDoc := ExtractTipoDocumento;
  ExtractNumRegDoc(LNumDocXML, LNumDoc, LRegDoc);
  CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiGeneraliDocumento;
  LDataDoc := Trunc(ExtractValueAsDateTime('Data', True)); // NB: Tronca la data perchè è capitato che arrivassero fatture con anche l'ora oppure il fuso orario e dava problemi
  // Chiede all'utente di confermare o modificare la suddivisione tra numero e registro del docuemnto
  //  effettuata automaticamente da Levante
  if not TConfirmNumRegFE.ConfirmationRequest(LNumDocXML, LNumDoc, LRegDoc) then
    Exit(False);

  DM1.ShowWait('Importazione fattura elettronica', 'Operazione in corso...');
  try
    // Verifica se il documento che si stà importando esiste già e nel caso blocca tutto
    //  NB: IO e Andrea abbiamo scelto che in caso il documento esista già di bloccare tutto e se
    //       proprio lo si vuole importare di nuovo bisogna prima eliminare manualmente quello vecchio.
    if DM1.DocExist(LTipoDoc, LNumDoc, LRegDoc,  LDataDoc) then
    begin
      DM1.Messaggi('Levante', 'Documento già presente.'#13#13'Operazione ANNULLATA!!!', '', [mbOK], 0, nil);
      Exit;
    end;
    // Verifica che non ci siano già transazioni in atto e se ci sono lanca un allarme
    DM1.CheckForAlreadyInTransaction;
    DM1.DBAzienda.StartTransaction;
    try
      // Importa il documento
      LCodiceCliente := FindCodiceSoggetto;  // Lo carica qui perchè così se l'utente, nel messaggio sopra, decide di non caricare il documento almeno non mi chiede di caricare il cliente
      SalvaTestata(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, LCodiceCliente, AFileName, AStatus);
      SalvaRighe(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, LCodiceCliente);

      // Importa scadenze
      SalvaScadenze(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, LCodiceCliente);

      // Importa DDT correlati
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali;
      if PropertyExists('DatiDDT') then
        SalvaDDTCorrelati(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiDDT);

      // Importa documenti correlati (DatiOrdineAcquisto)
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali;
      if PropertyExists('DatiOrdineAcquisto') then
        SalvaDocumentiCorrelati(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiOrdineAcquisto, 'Ordine di acquisto');

      // Importa documenti correlati (DatiContratto)
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali;
      if PropertyExists('DatiContratto') then
        SalvaDocumentiCorrelati(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiContratto, 'Contratto');

      // Importa documenti correlati (DatiConvenzione)
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali;
      if PropertyExists('DatiConvenzione') then
        SalvaDocumentiCorrelati(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiConvenzione, 'Convenzione');

      // Importa documenti correlati (DatiRicezione)
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali;
      if PropertyExists('DatiRicezione') then
        SalvaDocumentiCorrelati(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiRicezione, 'Procedura di ricezione');

      // Importa documenti correlati (DatiFattureCollegate)
      CurrentNode := FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali;
      if PropertyExists('DatiFattureCollegate') then
        SalvaDocumentiCorrelati(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, FInvoice.FatturaElettronicaBody.Items[0].DatiGenerali.DatiFattureCollegate, 'Fattura collegata');

      // Importa i files allegati (Allegati)
      SalvaAttachments(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, LCodiceCliente);

      if FID <> 0 then
        MarcaComeFatto(FID)
      else
        CreaNotificaCaricamentoDaFile(LTipoDoc, LRegDoc, LNumDoc, LDataDoc, AFileName, AStatus);
      // Commit
      DM1.DBAzienda.Commit;
    except
      DM1.DBAzienda.Rollback;
      raise;
    end;
  finally
    DM1.CloseWait;
  end;
  // Apre il documento appena importato e lo mette in Modifica in modo che
  //  l'utente possa confermarlo o meno
  if AOpen then
    DM1.ApriDocFisc(LTipoDoc, LNumDoc, LRegDoc, LDataDoc, True, True);
  Result := True;
end;

procedure TLevanteInvoicePersister.SetParamAsDateTime(const ADestParam: TIB_Column; const APropertyName: string; const ARequired: boolean);
begin
  if PropertyExists(APropertyName) then
    ADestParam.AsDateTime := ExtractValueAsDateTime(APropertyName, ARequired)
  else
    ADestParam.Clear;
end;

procedure TLevanteInvoicePersister.SetParamAsFloat(const ADestParam: TIB_Column; const APropertyName: string; const ARequired: boolean);
begin
  if PropertyExists(APropertyName) then
    ADestParam.AsFloat := ExtractValueAsFloat(APropertyName, ARequired)
  else
    ADestParam.Clear;
end;

procedure TLevanteInvoicePersister.SetParamAsInteger(const ADestParam: TIB_Column; const APropertyName: string; const ARequired: boolean);
begin
  if PropertyExists(APropertyName) then
    ADestParam.AsInteger := ExtractValueAsInteger(APropertyName, ARequired)
  else
    ADestParam.Clear;
end;

procedure TLevanteInvoicePersister.SetParamAsString(const ADestParam: TIB_Column; const APropertyName: string; const ARequired: boolean);
begin
  if PropertyExists(APropertyName) then
    ADestParam.AsString := ExtractValue(APropertyName, ARequired)
  else
    ADestParam.Clear;
end;

procedure TLevanteInvoicePersister.SetScontiRigo(const ADestParamSconto1, ADestParamSconto2, ADestParamSconto3: TIB_Column);
var
  LRiga: IXMLDettaglioLineeType;
  procedure SetSconto(const ADestParamSconto: TIB_Column; const AIndex: Integer);
  var
    LSconto: Double;
  begin
    if (LRiga.ScontoMaggiorazione.Count > AIndex) then
    begin
      CurrentNode := LRiga.ScontoMaggiorazione.Items[AIndex];
      LSconto := ExtractValueAsFloat('Percentuale');
      if LSconto <> 0 then
        ADestParamSconto.AsFloat := LSconto;
    end;
  end;
begin
  if not Supports(CurrentNode, IXMLDettaglioLineeType, LRiga) then
    raise Exception.Create('Interfaccia "IXMLDettaglioLineeType" non implementata dall''oggetto');
  // Reset dei parametri (altrimenti ci sono dei problemi nel caso di una riga senza sconti ma con quella precedente che invece li aveva)
  ADestParamSconto1.Clear;
  ADestParamSconto2.Clear;
  ADestParamSconto3.Clear;
  // Se non ci sono sconti esce
  if LRiga.ChildNodes.IndexOf('ScontoMaggiorazione') = -1 then
    Exit;
  // Sconti
  SetSconto(ADestParamSconto1, 0);
  SetSconto(ADestParamSconto2, 1);
  SetSconto(ADestParamSconto3, 2);
end;

{ TInvoicePersisterFactory }

class function TInvoicePersisterFactory.NewLevanteInvoicePersister(const AInvoice: IeiInvoiceMini; const AID: Integer): ILevanteInvoicePersister;
begin
  Result := TLevanteInvoicePersister.Create(AInvoice, AID);
end;

end.
