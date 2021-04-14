unit ExtTerm_Zebex_Z2031;

interface

uses SysUtils, Dialogs, Windows, IB_Components, DataMOdule1;

// =============================================================================
// INIZIO FUNZIONI DI GESTIONE DELLO ZEBEX Z-2031 E ZEBEX Z-1060
// -----------------------------------------------------------------------------
function PDX_Download_Checkdata(): Longint; stdcall;  external 'Remot.dll';  //stdcall;
//function PDX_Remot_Set_Comm(Port : PChar;Baud : Longint;DataBit,StopBit,Parity : Byte):Longint; external 'Remot.dll';  //stdcall;
//function PDX_Remot_Set_Comm(Port : string;Baud : integer;DataBit,StopBit,Parity : Byte):integer; stdcall; external 'Remot.dll';  //stdcall;
function PDX_Remot_Set_Comm(Port : PAnsiChar;Baud : integer;DataBit,StopBit,Parity : Byte):integer; stdcall; external 'Remot.dll';  //stdcall;
function PDX_Remot_Online():Longint; stdcall; external 'Remot.dll';  //stdcall;
function PDX_Remot_Offline():Longint; stdcall; external 'Remot.dll';  //stdcall;
function PDX_Wait_Time(WaitTime : Longint):Longint; stdcall; external 'Remot.dll';  //stdcall;
function PDX_Upload(FromIndex : PAnsiChar):Longint; stdcall; external 'Remot.dll';  //stdcall;
//function PDX_Get_Field(lpBuffer : string):Longint; stdcall; external 'Remot.dll';  //stdcall;
function PDX_Get_Field(lpBuffer : PAnsiChar):Longint; stdcall; external 'Remot.dll';  //stdcall;
//Function PDX_Get_Data(lpcommand:String;lpbuffer:String):Integer; stdcall; external 'Remot.dll';  //stdcall;
//Function PDX_Get_Data(lpcommand:PChar;lpbuffer:PChar):Integer; stdcall; external 'Remot.dll';  //stdcall;
Function PDX_Get_Data(lpcommand:PAnsiChar;lpbuffer:PAnsiChar):Integer; stdcall; external 'Remot.dll';  //stdcall;
Function PDX_Upload_Finish():Integer; stdcall; external 'Remot.dll';
Function PDX_Upload_Terminate():Integer; stdcall; external 'Remot.dll';
Function PDX_Upload_Pause():Integer; stdcall; external 'Remot.dll';
Function PDX_Upload_Continue():Integer; stdcall; external 'Remot.dll';
//Function PDX_Upload_Deletedata(lpFormSelect:String):Integer; stdcall; external 'Remot.dll';
Function PDX_Upload_Deletedata(lpFormSelect:PAnsiChar):Integer; stdcall; external 'Remot.dll';
//Function PDX_Download_Openfile(lpFileName : String):Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Openfile(lpFileName : PAnsiChar):Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Barcode():Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Dataform():Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Variable():Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Constant():Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Procdure():Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Table():Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Deletedata():Integer; stdcall; external 'Remot.dll';
//Function PDX_Download_Freetask(lpFileName:String):Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Freetask(lpFileName:PAnsiChar):Integer; stdcall; external 'Remot.dll';
Function PDX_Download_Finish():Integer; stdcall; external 'Remot.dll';
Function PDX_Get_Last_Error():Integer; stdcall; external 'Remot.dll';
// -----------------------------------------------------------------------------
// FINE FUNZIONI DI GESTIONE DELLO ZEBEX Z-2031 E ZEBEX Z-1060
// =============================================================================

function Zebex_2031_TotalFieldsNum(FormNumber:Integer): Integer;
function Zebex_2031_FieldsPerRecord(FormNumber:Integer): Integer;
function Zebex_2031_RecordCount(FormNumber:Integer): Integer;
function Zebex_2031_Upload_String_Field: String;
function Zebex_2031_Upload_Float_Field: Double;
function Zebex_2031_ScaricaArticoliInBacheca(FormNumber:Integer; ComPort:String): Integer;

implementation


function Zebex_2031_ScaricaArticoliInBacheca(FormNumber:Integer; ComPort:String): Integer;
type
  Article = record
    Codice:String;
    Qta:Double;
  end;
var
  i, TotalRecords, ProssimoNumeroDocumento: Integer;
  CodiceArticolo:String;
  QtaArticolo:Double;
  Articles: array of Article;
  Q:TIB_Cursor;
begin
  // Inizializzazione
  Result := 0;
  // ===========================================================================
  // INIZIO SCARICAMENTO DATI DAL TERMINALE
  // ---------------------------------------------------------------------------
  // Imposta il timeout delle operazioni
  if PDX_Wait_Time(5000) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' durante l''impostazione del tempo di timeout.');
  // Impostazione dei parametri della porta COM
//  if PDX_Remot_Set_Comm(ComPort, 9600, 8, 0, 0) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' nell''impostazione dei parametri della porta.');
  if PDX_Remot_Set_Comm(PAnsiChar('COM1'), 9600, 8, 0, 0) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' nell''impostazione dei parametri della porta.');
  // Entra in modalità ON-LINE
  if PDX_Remot_Online = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' non è stato possibile entrare in modalità ON-LINE.');
  // Prima ricava il numero totale dei records
  //  e dimensiona di conseguenza l'array
  TotalRecords := Zebex_2031_RecordCount(FormNumber);
  SetLength(Articles, TotalRecords);
  // Entra in modalità UPLOAD
  if PDX_Upload(PAnsiChar(IntToStr(FormNumber))) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' non è stato possibile entrare in modalità UPLOAD.');
  // Legge il primo campo che è una intestazione del programma
  Zebex_2031_Upload_String_Field;
  // Cicla per tutti i records da scaricare
  for i := 0 to TotalRecords-1 do begin
    // Esegue la lettura del codice articolo del record corrente
    CodiceArticolo := Zebex_2031_Upload_String_Field;
    // Esegue la lettura della qtà del record corrente
    QtaArticolo := Zebex_2031_Upload_Float_Field;
    // Carica l'articolo corrente sull'array
    Articles[i].Codice := CodiceArticolo;
    Articles[i].Qta := QtaArticolo;
  end;
  // Termina la modalità di Upload
  if PDX_Upload_Terminate = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' non è stato possibile uscire dalla modalità UPLOAD.');
  // Cancella i dati appena scaricati
  if PDX_Upload_Deletedata(PAnsiChar(IntToStr(FormNumber))) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' non è stato possibile cancellare i dati dal terminale.');
  // Esce anche dalla modalità ON-LINE
  if PDX_Remot_Offline = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' non è stato possibile uscire dalla modalità ON-LINE.');
  // ---------------------------------------------------------------------------
  // FINE SCARICAMENTO DATI DAL TERMINALE
  // ===========================================================================

  // ===========================================================================
  // INIZIO IMPORTAZIONE NELLA BACHECA
  // ---------------------------------------------------------------------------
  DM1.DBGenerale.StartTransaction;
  try
  // Crea e imposta la query che inserirà gli articoli nella bacheca
  Q := TIB_Cursor.Create(nil);
  try
    Q.DatabaseName := DM1.GenDBFile;
    Q.IB_Connection := DM1.DBGenerale;
    Q.SQL.Add('insert into tmprighi (STATION_ID, TipoDocumento, Registro, NumOrdPrev, DataDocumento, ProgRigo, ProgRigo2, CodiceArticolo, Qta)');
    Q.SQL.Add('values (');
    Q.SQL.Add(DM1.CodiceUtente + ',');   // STATION_ID
    Q.SQL.Add('''Palmare'',');   // Tipo documento
    Q.SQL.Add(''''',');   // Registro
    Q.SQL.Add(':P_NUMDOC,');   // NumOrdPrev
    Q.SQL.Add('''' + FormatDateTime('mm/dd/yyyy', Now) + ''',');   // Data documento
    Q.SQL.Add(':P_PROGRIGO,');   // ProgRigo
    Q.SQL.Add('-1,');   // ProgRIgo2
    Q.SQL.Add(':P_CODICEARTICOLO,');   // COdice articolo
    Q.SQL.Add(':P_QTA');   // Qta
    Q.SQL.Add(')');
    // Inizializzazione di alcune variabili necessarie
    ProssimoNumeroDocumento := DM1.MaxNumDocOfTypeInBacheca('Palmare') + 1;
    // Riturna il numero del primo documento importato
    Result := ProssimoNumeroDocumento;
    // Cicla per tutti gli articoli letti dal palmare
    for i := 0 to Length(Articles)-1 do begin
      // Se l'articolo corrente è il separatore aggiorna il numero del documento
      if (Articles[i].Codice = '...') and (i > 0) then begin
        Inc(ProssimoNumeroDocumento);
      // Se invece è un articolo normale lo carica nella bacheca
      end else begin
        // Inserisce l'articolo corrente
        if not Q.Prepared then Q.Prepare;
        Q.Params.ParamByName('P_NUMDOC').AsInteger        := ProssimoNumeroDocumento;
        Q.Params.ParamByName('P_PROGRIGO').AsInteger      := i;
        Q.Params.ParamByName('P_CODICEARTICOLO').AsString := Articles[i].Codice;
        Q.Params.ParamByName('P_QTA').AsFloat             := Articles[i].Qta;
        Q.ExecSQL;
      end;
    end;
    DM1.DBGenerale.Commit;
  finally
    Q.Free;
  end;
  except
    DM1.DBGenerale.Rollback;
  end;
  // ---------------------------------------------------------------------------
  // FINE IMPORTAZIONE NELLA BACHECA
  // ===========================================================================
end;

function Zebex_2031_Upload_String_Field: String;
var
  Buffer:array[0..255] of AnsiChar;
begin
  Result := '';
  if PDX_Upload_Continue() = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Upload Continue.');
  if PDX_Get_Field(Buffer) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Get_Field.');
  if PDX_Upload_Pause() = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Upload Pause.');
  Result := Trim(Buffer);
end;

function Zebex_2031_Upload_Float_Field: Double;
var
  Buffer:array[0..255] of AnsiChar;
  formatSettings : TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);
  formatSettings.DecimalSeparator := '.';
  Result := 0;
  if PDX_Upload_Continue() = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Upload Continue.');
  if PDX_Get_Field(Buffer) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Get_Field.');
  if PDX_Upload_Pause() = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Upload Pause.');
  Result := StrToFloatDef(Trim(Buffer), 0, formatSettings);
end;

function Zebex_2031_TotalFieldsNum(FormNumber:Integer): Integer;
var
  Buffer:array[0..255] of AnsiChar;
  RecordCount, FieldsPerRecord: Integer;
begin
  if PDX_Get_Data(PAnsiChar('RX'), Buffer) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Get_Data.');
  RecordCount := StrToInt(Copy(Buffer, (17*FormNumber+9), 5));
  FieldsPerRecord := StrToInt(Copy(Buffer, (17*FormNumber+15), 2));
  Result := RecordCount * FieldsPerRecord;
end;

function Zebex_2031_RecordCount(FormNumber:Integer): Integer;
var
  Buffer:array[0..255] of AnsiChar;
begin
  if PDX_Get_Data(PAnsiChar('RX'), Buffer) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Get_Data.');
  Result := StrToInt(Copy(Buffer, (17*FormNumber+9), 5));
end;

function Zebex_2031_FieldsPerRecord(FormNumber:Integer): Integer;
var
  Buffer:array[0..255] of AnsiChar;
begin
  if PDX_Get_Data(PAnsiChar('RX'), Buffer) = 0 then raise Exception.Create('Errore ' + IntTostr(PDX_Get_Last_Error) + ' comando Get_Data.');
  Result := StrToInt(Copy(Buffer, (17*FormNumber+15), 2));
end;

end.
