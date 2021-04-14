unit FormGMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, StdCtrls, ExtCtrls, MSHTML, cxControls,
  cxContainer, cxEdit, cxCheckBox, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxGridTableView;

type
  TGmapForm = class(TForm)
    PanelHeader: TPanel;
    LabelAddress: TLabel;
    LabelLatitude: TLabel;
    LabelLongitude: TLabel;
    ButtonGotoLocation: TButton;
    MemoAddress: TMemo;
    ButtonGotoAddress: TButton;
    Longitude: TEdit;
    Latitude: TEdit;
    CheckBoxTraffic: TCheckBox;
    CheckBoxBicycling: TCheckBox;
    CheckBoxStreeView: TCheckBox;
    ButtonClearMarkers: TButton;
    Button1: TButton;
    PanelMap: TPanel;
    WebBrowser1: TWebBrowser;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure ButtonGotoAddressClick(Sender: TObject);
    procedure ButtonClearMarkersClick(Sender: TObject);
    procedure CheckBoxStreeViewClick(Sender: TObject);
    procedure CheckBoxBicyclingClick(Sender: TObject);
    procedure CheckBoxTrafficClick(Sender: TObject);
    procedure ButtonGotoLocationClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    HTMLWindow2: IHTMLWindow2;
    fDestinazione_IndirizzoCompleto: String;

    // Indirizzo della sede dell'azienda
    fSedeAzienda: String;
    // Array di indirizzi
    DestArray: array of String;
    PrecDestArray: array of String;

    function GetDestinazione_IndirizzoCompleto: String;
    procedure SetDestinazione_IndirizzoCompleto(const Value: String);
    function GetSedeAzienda: String;
    procedure SetSedeAzienda(const Value: String);
    procedure SetPolylinesOn(Value: Boolean);
    procedure SetAvoidHighwaysOn(Value: Boolean);
    procedure SetAvoidTollsOn(Value: Boolean);
  public
    { Public declarations }
    property Destinazione_IndirizzoCompleto:String read GetDestinazione_IndirizzoCompleto write SetDestinazione_IndirizzoCompleto;
    property SedeAzienda:String read GetSedeAzienda write SetSedeAzienda;
    procedure AddDest(NewDest: String);
    procedure CalcolaPercorso;
    procedure PosizionaMarcatori;
    procedure PrintPreview;
    procedure PrintWithPrinterDialog;
    procedure PrintWithoutPrinterDialog;
    procedure PrintSetupDialog;
    // Funzioni nuovo script Fabietto
    procedure SetOrigin(NewDest: String);
    procedure SetDestination(NewDest: String);
    procedure WaypointAdd(NewDest: String);
    procedure ShowRoute;
    procedure CreaMappa(TC: TcxGridTableController; ProvinciaIdx, CittaIdx, CapIdx, IndirizzoIdx, NumCivicoIdx: Integer); overload;
    procedure CreaMappa(TC: TcxGridTableController; ColumnIdx: Integer); overload;
    procedure CreaMappa(Provincia,Citta,Cap,Indirizzo,NumCivico:String); overload;
    procedure CreaMappa(Address:String); overload;
    // Funzione che costruisce la destinazione in base ai dati forniti
    function CostruisciDestinazione(Nazione, Provincia, Citta, CAP, Indirizzo, NumCivico: String): String;
  end;


  // Procedure e funzioni fuori classe
  function GMap_CreateInParent(P: TCustomControl): TGmapForm;


var
  GmapForm: TGmapForm;

implementation

uses
   ActiveX, Types, DataModule1;

{$R *.dfm}




// =============================================================================
// INIZIO PROCEDURE E FUNZIONI FUORI CLASSE
// -----------------------------------------------------------------------------

// Function che crea la form delle mappe con il parent specificato e la ritorna
function GMap_CreateInParent(P: TCustomControl): TGmapForm;
begin
  Result := TGMapForm.Create(P);
  Result.Parent := P;
end;

// -----------------------------------------------------------------------------
// FINE PROCEDURE E FUNZIONI FUORI CLASSE
// =============================================================================






{
procedure TGmapForm.FormCreate(Sender: TObject);
var
  aStream     : TMemoryStream;
begin
   PanelCommands.ParentColor := True;

   WebBrowser1.Navigate('about:blank');
    if Assigned(WebBrowser1.Document) then
    begin
      aStream := TMemoryStream.Create;
      try
         aStream.WriteBuffer(Pointer(HTMLStr)^, Length(HTMLStr));
         //aStream.Write(HTMLStr[1], Length(HTMLStr));
         aStream.Seek(0, soFromBeginning);
         (WebBrowser1.Document as IPersistStreamInit).Load(TStreamAdapter.Create(aStream));
      finally
         aStream.Free;
      end;
      HTMLWindow2 := (WebBrowser1.Document as IHTMLDocument2).parentWindow;

    end;
end;
}
procedure TGmapForm.FormCreate(Sender: TObject);
var
  aStream     : TFileStream;
begin
   WebBrowser1.Navigate('about:blank');
    if Assigned(WebBrowser1.Document) then
    begin
      aStream := TFileStream.Create(DM1.CurrDir + 'GMapScript.html', fmOpenRead);
      try
         (WebBrowser1.Document as IPersistStreamInit).Load(TStreamAdapter.Create(aStream));
      finally
         aStream.Free;
      end;
      HTMLWindow2 := (WebBrowser1.Document as IHTMLDocument2).parentWindow;
    end;
end;

// Funzione che costruisce la destinazione in base ai dati forniti
function TGmapForm.CostruisciDestinazione(Nazione, Provincia, Citta, CAP, Indirizzo, NumCivico: String): String;
var
  TmpStr: String;
begin
  Result := '';
  // Nazione
  TmpStr := Trim(Nazione);
  if TmpStr <> '' then begin
    if Result <> '' then Result := Result + ',';
    Result := Result + TmpStr;
  end;
  // CAP
  TmpStr := Trim(CAP);
  if TmpStr <> '' then begin
    if Result <> '' then Result := Result + ',';
    Result := Result + TmpStr;
  end;
  // Citta
  TmpStr := Trim(Citta);
  if TmpStr <> '' then begin
    if Result <> '' then Result := Result + ',';
    Result := Result + TmpStr;
  end;
  // Provincia
  TmpStr := Trim(Provincia);
  if TmpStr <> '' then begin
    if Result <> '' then Result := Result + ',';
    Result := Result + TmpStr;
  end;
  // Indirizzo
  TmpStr := Trim(Indirizzo);
  if TmpStr <> '' then begin
    if Result <> '' then Result := Result + ',';
    Result := Result + TmpStr;
  end;
  // Numero civico
  TmpStr := Trim(NumCivico);
  if TmpStr <> '' then begin
    if Result <> '' then Result := Result + ',';
    Result := Result + TmpStr;
  end;
end;



procedure TGmapForm.PrintPreview;
var
   vIn, vOut: OleVariant;
begin
   WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINTPREVIEW, OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut) ;
end;

procedure TGmapForm.PrintWithPrinterDialog;
var
   vIn, vOut: OleVariant;
begin
  WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;

procedure TGmapForm.PrintWithoutPrinterDialog;
var
   vIn, vOut: OleVariant;
begin
  WebBrowser1.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER, vIn, vOut);
end;

procedure TGmapForm.PrintSetupDialog;
var
   vIn, vOut: OleVariant;
begin
  WebBrowser1.ControlInterface.ExecWB(OLECMDID_PAGESETUP, OLECMDEXECOPT_PROMPTUSER, vIn, vOut);
end;









procedure TGmapForm.ButtonGotoAddressClick(Sender: TObject);
var
   address    : string;
begin
   address := MemoAddress.Lines.Text;
   address := StringReplace(StringReplace(Trim(address), #13, ' ', [rfReplaceAll]), #10, ' ', [rfReplaceAll]);
   HTMLWindow2.execScript(Format('codeAddress(%s)',[QuotedStr(address)]), 'JavaScript');
end;









// Procedura che aggiunge una posizione all'array delle posizione tra cui deve calcolare il percorso
procedure TGmapForm.AddDest(NewDest:String);
begin
  // Verifica il parametro
  if Trim(NewDest) = '' then raise Exception.Create('Destinazione non valida.');
  // Elimina gli eventuali caratteri apostrofo che causano problemi
  NewDest := StringReplace(NewDest, '''', '', [rfReplaceAll]);
  // Elabora la posizione
  NewDest := StringReplace(StringReplace(Trim(NewDest), #13, ' ', [rfReplaceAll]), #10, ' ', [rfReplaceAll]);
  // Attende che il TWebBrowser sia libero
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;
  end;
  // Aggiunge la posizione al percorso
  HTMLWindow2.execScript(Format('addDest(%s)',[QuotedStr(NewDest)]), 'JavaScript');
end;


// =============================================================================
procedure TGmapForm.SetOrigin(NewDest:String);
begin
  // Verifica il parametro
  if Trim(NewDest) = '' then raise Exception.Create('Indirizzo origine non valido.');
  // Elimina gli eventuali caratteri apostrofo che causano problemi
  NewDest := StringReplace(NewDest, '''', '', [rfReplaceAll]);
  // Elabora la posizione
  NewDest := StringReplace(StringReplace(Trim(NewDest), #13, ' ', [rfReplaceAll]), #10, ' ', [rfReplaceAll]);
  // Attende che il TWebBrowser sia libero
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;
  end;
  // Aggiunge la posizione al percorso
  HTMLWindow2.execScript(Format('SetOrigin(%s)',[QuotedStr(NewDest)]), 'JavaScript');
end;

procedure TGmapForm.SetDestination(NewDest:String);
begin
  // Verifica il parametro
  if Trim(NewDest) = '' then raise Exception.Create('Indirizzo destinazione non valido.');
  // Elimina gli eventuali caratteri apostrofo che causano problemi
  NewDest := StringReplace(NewDest, '''', '', [rfReplaceAll]);
  // Elabora la posizione
  NewDest := StringReplace(StringReplace(Trim(NewDest), #13, ' ', [rfReplaceAll]), #10, ' ', [rfReplaceAll]);
  // Attende che il TWebBrowser sia libero
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;
  end;
  // Aggiunge la posizione al percorso
  HTMLWindow2.execScript(Format('SetDestination(%s)',[QuotedStr(NewDest)]), 'JavaScript');
end;

procedure TGmapForm.WaypointAdd(NewDest:String);
begin
  // Verifica il parametro
  if Trim(NewDest) = '' then raise Exception.Create('Indirizzo destinazione non valido.');
  // Elimina gli eventuali caratteri apostrofo che causano problemi
  NewDest := StringReplace(NewDest, '''', '', [rfReplaceAll]);
  // Elabora la posizione
  NewDest := StringReplace(StringReplace(Trim(NewDest), #13, ' ', [rfReplaceAll]), #10, ' ', [rfReplaceAll]);
  // Attende che il TWebBrowser sia libero
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;
  end;
  // Aggiunge la posizione al percorso
  HTMLWindow2.execScript(Format('WaypointAdd(%s)',[QuotedStr(NewDest)]), 'JavaScript');
end;

procedure TGmapForm.ShowRoute;
begin
  // Attende che il TWebBrowser sia libero
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;
  end;
  // Elabora il percorso
  HTMLWindow2.execScript(Format('ShowRoute()',[]), 'JavaScript');
end;


// Procedura che si occupa di  creare effettivamente la mappa con i dati passati.
procedure TGmapForm.CreaMappa(Provincia,Citta,Cap,Indirizzo,NumCivico:String);
var
  TmpStr: String;
begin
  // IMposta l'indirizzo dell'azienda (partenza)
  TmpStr := CostruisciDestinazione(
    '',
    DM1.TableDatiAziendaPROVINCIA.AsString,
    DM1.TableDatiAziendaCITTA.AsString,
    DM1.TableDatiAziendaCAP.AsString,
    DM1.TableDatiAziendaINDIRIZZO.AsString,
    DM1.TableDatiAziendaNUMCIVICO.AsString
  );
  SetOrigin(TmpStr);
  // Imposta la destinazione
  TmpStr := CostruisciDestinazione('', Provincia, Citta, Cap, Indirizzo, NumCivico);
  SetDestination(TmpStr);
  // CAlcola il percorso
  ShowRoute;
end;

// Procedura che si occupa di  creare effettivamente la mappa con i dati passati.
procedure TGmapForm.CreaMappa(Address:String);
var
  TmpStr: String;
begin
  // IMposta l'indirizzo dell'azienda (partenza)
  TmpStr := CostruisciDestinazione(
    '',
    DM1.TableDatiAziendaPROVINCIA.AsString,
    DM1.TableDatiAziendaCITTA.AsString,
    DM1.TableDatiAziendaCAP.AsString,
    DM1.TableDatiAziendaINDIRIZZO.AsString,
    DM1.TableDatiAziendaNUMCIVICO.AsString
  );
  SetOrigin(TmpStr);
  // Imposta la destinazione
  SetDestination(Address);
  // CAlcola il percorso
  ShowRoute;
end;

// Procedura che si occupa di  creare effettivamente la mappa con i dati passati.
procedure TGmapForm.CreaMappa(TC:TcxGridTableController; ProvinciaIdx,CittaIdx,CapIdx,IndirizzoIdx,NumCivicoIdx:Integer);
var
  TmpStr: String;
  i: Integer;
  CurrProvincia, CurrCitta, CurrCap, CurrIndirizzo, CurrNumCivico: String;
begin
  // IMposta l'indirizzo dell'azienda (partenza)
  TmpStr := CostruisciDestinazione(
    '',
    DM1.TableDatiAziendaPROVINCIA.AsString,
    DM1.TableDatiAziendaCITTA.AsString,
    DM1.TableDatiAziendaCAP.AsString,
    DM1.TableDatiAziendaINDIRIZZO.AsString,
    DM1.TableDatiAziendaNUMCIVICO.AsString
  );
  SetOrigin(TmpStr);
  // Carica tutti i righi selezionati
  for i := 0 to TC.SelectedRecordCount -1 do begin
    // Verifica e defaultizzazione
    if ProvinciaIdx <> 0  then CurrProvincia := TC.SelectedRecords[i].DisplayTexts[ProvinciaIdx]   else CurrProvincia := '';
    if CittaIdx <> 0      then CurrCitta := TC.SelectedRecords[i].DisplayTexts[CittaIdx]           else CurrCitta := '';
    if CapIdx <> 0        then CurrCap := TC.SelectedRecords[i].DisplayTexts[CapIdx]               else CurrCap := '';
    if IndirizzoIdx <> 0  then CurrIndirizzo := TC.SelectedRecords[i].DisplayTexts[IndirizzoIdx]   else CurrIndirizzo := '';
    if NumCivicoIdx <> 0  then CurrNumCivico := TC.SelectedRecords[i].DisplayTexts[NumCivicoIdx]   else CurrNumCivico := '';
    // Costruzione della destinazione
    TmpStr := CostruisciDestinazione('', CurrProvincia, CurrCitta, CurrCap, CurrIndirizzo, CurrNumCivico);
    // Assegnazione
    if i=0
    then SetDestination(TmpStr)
    else WaypointAdd(TmpStr);
  end;
  // CAlcola il percorso
  ShowRoute;
end;

// Procedura che si occupa di  creare effettivamente la mappa con i dati passati.
procedure TGmapForm.CreaMappa(TC:TcxGridTableController; ColumnIdx:Integer);
var
  TmpStr: String;
  i: Integer;
begin
  // IMposta l'indirizzo dell'azienda (partenza)
  TmpStr := CostruisciDestinazione(
    '',
    DM1.TableDatiAziendaPROVINCIA.AsString,
    DM1.TableDatiAziendaCITTA.AsString,
    DM1.TableDatiAziendaCAP.AsString,
    DM1.TableDatiAziendaINDIRIZZO.AsString,
    DM1.TableDatiAziendaNUMCIVICO.AsString
  );
  SetOrigin(TmpStr);
  // Carica tutti i righi selezionati
  for i := 0 to TC.SelectedRecordCount -1 do begin
    TmpStr := Trim(TC.SelectedRecords[i].DisplayTexts[ColumnIdx]);
    if i=0
    then SetDestination(TmpStr)
    else WaypointAdd(TmpStr);
  end;
  // CAlcola il percorso
  ShowRoute;
end;
// =============================================================================



// Procedura che calcola il percorso inserito attraverso la procedura AddDest e lo visualizza
procedure TGmapForm.CalcolaPercorso;
begin
  // Attende che il TWebBrowser sia libero
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;
  end;
  // Elabora il percorso
  HTMLWindow2.execScript(Format('calcRouteFromDestArray()',[]), 'JavaScript');
end;

// Procedura che calcola il percorso inserito attraverso la procedura AddDest e lo visualizza
procedure TGmapForm.PosizionaMarcatori;
begin
  // Attende che il TWebBrowser sia libero
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;
  end;
  // Elabora il percorso
  HTMLWindow2.execScript(Format('putMarkersFromDestArray()',[]), 'JavaScript');
  Timer1.Enabled := True;
end;





procedure TGmapForm.SetPolylinesOn(Value:Boolean);
begin
  if Value then HTMLWindow2.execScript('PolylinesOn(true)', 'JavaScript')
  else          HTMLWindow2.execScript('PolylinesOn(false)', 'JavaScript');
end;

procedure TGmapForm.SetAvoidHighwaysOn(Value:Boolean);
begin
  if Value then HTMLWindow2.execScript('AvoidHighwaysOn(true)', 'JavaScript')
  else          HTMLWindow2.execScript('AvoidHighwaysOn(false)', 'JavaScript');
end;

procedure TGmapForm.SetAvoidTollsOn(Value:Boolean);
begin
  if Value then HTMLWindow2.execScript('AvoidTollsOn(true)', 'JavaScript')
  else          HTMLWindow2.execScript('AvoidTollsOn(false)', 'JavaScript');
end;

procedure TGmapForm.ButtonClearMarkersClick(Sender: TObject);
begin
  HTMLWindow2.execScript('ClearMarkers()', 'JavaScript')
end;

procedure TGmapForm.CheckBoxStreeViewClick(Sender: TObject);
begin
    if CheckBoxStreeView.Checked then
     HTMLWindow2.execScript('StreetViewOn()', 'JavaScript')
    else
     HTMLWindow2.execScript('StreetViewOff()', 'JavaScript');
end;

procedure TGmapForm.CheckBoxBicyclingClick(Sender: TObject);
begin
    if CheckBoxBicycling.Checked then
     HTMLWindow2.execScript('BicyclingOn()', 'JavaScript')
    else
     HTMLWindow2.execScript('BicyclingOff()', 'JavaScript');
end;

procedure TGmapForm.CheckBoxTrafficClick(Sender: TObject);
begin
    if CheckBoxTraffic.Checked then
     HTMLWindow2.execScript('TrafficOn()', 'JavaScript')
    else
     HTMLWindow2.execScript('TrafficOff()', 'JavaScript');
end;

procedure TGmapForm.ButtonGotoLocationClick(Sender: TObject);
begin
   HTMLWindow2.execScript(Format('GotoLatLng(%s,%s)',[Latitude.Text,Longitude.Text]), 'JavaScript');
end;

function TGmapForm.GetDestinazione_IndirizzoCompleto: String;
begin
  Result := Trim(fDestinazione_IndirizzoCompleto);
end;

procedure TGmapForm.SetDestinazione_IndirizzoCompleto(const Value: String);
begin
  fDestinazione_IndirizzoCompleto := Trim(Value);
end;

function TGmapForm.GetSedeAzienda: String;
begin
  Result := Trim(fSedeAzienda);
end;

procedure TGmapForm.SetSedeAzienda(const Value: String);
begin
  fSedeAzienda := Trim(Value);
end;

procedure TGmapForm.Button1Click(Sender: TObject);
begin
   HTMLWindow2.execScript(Format('fitMapForMarkersArray()',[]), 'JavaScript');
end;

procedure TGmapForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  // Attende che il TWebBrowser sia libero
  while WebBrowser1.ReadyState <> READYSTATE_COMPLETE do begin
    Application.ProcessMessages;
    Sleep(100);
    Application.ProcessMessages;
  end;
  // Elabora il percorso
  HTMLWindow2.execScript(Format('fitMapForMarkersArray()',[]), 'JavaScript');
end;

procedure TGmapForm.FormResize(Sender: TObject);
begin
   PanelMap.Left :=  -3;
   PanelMap.Top := -3;
   PanelMap.Width := Self.ClientWidth + 6;
   PanelMap.Height := Self.ClientHeight;
end;

procedure TGmapForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;


end.
