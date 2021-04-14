unit UnitGoogleCal;

interface

uses
  Classes, IBODataset;

const
  LevGoogleDll = 'LevGoogle.dll';

type

  // ===========================================================================
  // PARTE CHE DEVE ESSERE UGUALE SIA SU LEVANTE CHE NELLA DLL
  // NB: Dati usati per ricevere su levante l'elenco dei Task da visualizzare
  //      nella TableView di Gestione dei Task
  // ---------------------------------------------------------------------------
  // Definizione del record contenente tutti i dati di un Task
  TEventRecord = record
    ID: String;
    Title: String;
    Description: String;
    Location: String;
    AllDay: Boolean;
    StartTime: TDateTime;
    EndTime: TDateTime;
    CalendarID: String;
    CalendarTitle: String;
  end;
  // Array di Records contenenti i dati dei Tasks
  TEventRecordArray = array of TEventRecord;
  // ===========================================================================

  // Definizione di classe che rappresenta un singolo Task di GoogleTask.
  // Sarà usato per caricare o modificare i dati di un singolo Task.
  TGCal_Event = class(TObject)
  private
    fID: String;
    fTitle: String;
    fDescription: String;
    fLocation: String;
    fAllDay: Boolean;
    fStartTime: TDateTime;
    fEndTime: TDateTime;
    fCalendarID: String;
    fCalendarID_Old: String;
    fCalendarTitle: String;
    fDB: TIBODatabase;
    fEvent_Master_ID: Integer;
    procedure Event_Ref_Store;
  protected
  public
    // Proprietà normali del Task
    property ID:String read fID write fID;
    property Title:String read fTitle write fTitle;
    property Description:String read fDescription write fDescription;
    property Location:String read fLocation write fLocation;
    property AllDay:Boolean read fAllDay write fAllDay;
    property StartTime:TDateTime read fStartTime write fStartTime;
    property EndTime:TDateTime read fEndTime write fEndTime;
    property CalendarID:String read fCalendarID write fCalendarID;
    property CalendarID_Old:String read fCalendarID_Old;
    property CalendarTitle:String read fCalendarTitle;
    property DB:TIBODatabase read fDB write fDB;
    // Riferimenti a documenti di Levante
    property Event_Master_ID:Integer read fEvent_Master_ID write fEvent_Master_ID;

    // Procedure che ritorna i valori del Task desiderato
    procedure LoadByID(EventID, EventCalendatID: String);
    procedure LoadByMaster_ID(Master_ID:Integer);
    // Function che Crea o Modifica il Task e ne ritorna l'ID (Nel caso sia un nuovo Task oppure uno esistente che ha cambiato ID ad esempio perchè è stato spostato in un'altra Lista)
    function Store: String;
    // Funcrion come la "Store" ma che in più esegue il salvataggio solo se i dati ricevuti sono diversi dagli attuali
    function StoreIfChanged(Title_New, Description_New, Location_new: String; AllDay_New: Boolean; StartTime_New, EndTimeNew: TDateTime; CalendarID_New: String): String;
  end;



{ Funzioni e Procedure di libreria (nessun oggetto) }

// Procedure che inizializza il sistema di Google Calendar impostando i dati per il
//  login e salvando il RefreshToken sul database
procedure GCal_Init(DB: TIBODatabase);
// Function che riceve l'ID e il nome di un calendario, se l'ID è vuoto significa che
//  il calendario deve essere creato nuovo, altrimenti modifica l'esistente
//  in ogni caso ritorna l'ID del calendario stesso
//  NB: Per calendario in questo caso si intende il TECNICO
function GCal_Calendar_CreateOrModify(CalID, CalName: String): String;
// Procedure che riceve l'ID di un calendario da eliminare e lo elimina
procedure GCal_Calendar_Delete(ID: String);
// Procedure riempie una StringList con l'elenco dei titoli delle liste
procedure GCal_LoadCalendarsTitleAndID(SLTitle, SLID:TStrings);
// Procedure che visualizza la form di editing del task in forma modale
//  e alla fine ritorna nella variabili ricevute per riferimento l'ID e
//  il ListID del task che è stato creato/modificato
procedure GCal_ShowEventForm_Impegno(Master_ID:Integer; NewEventTitle:String=''; NewEventDescription:String=''; NewEventLocation:String=''; NewEventAllDay:Boolean=False; NewEventStartTime:TDateTime=0; NewEventEndTime:TDateTime=0; NewEventCalendarID:String=''; NewEventCalendarName:String=''; Invisible:Boolean=False);
// Procedure che visualizza la form di editing del task in forma modale
//  e alla fine ritorna nella variabili ricevute per riferimento l'ID e
//  il ListID del task che è stato creato/modificato
procedure GCal_ShowEventForm(EventID:String; EventCalendarID, NewEventCalendarName:String; NewEventTitle:String=''; NewEventDescription:String=''; NewEventLocation:String=''; NewEventAllDay:Boolean=False; NewEventStartTime:TDateTime=0; NewEventEndTime:TDateTime=0);
// Procedure che elimina il Task specificato
procedure GCal_DeleteEventByEventID(EventID, EventCalendarID: String);
// Procedure che elimina il Task relativo all'impegno il cui Master_ID viene ricevuto
//  nel parametro
procedure GCal_DeleteEventByMaster_ID(Master_ID:Integer; DeleteFromImpegniGCalTable:Boolean=True);
// Procedura che sposta l'appuntamento in un altro momento o calendario per Master_ID
function GCal_MoveEventByMasterID(Master_ID:Integer; EventCalendarID_New:String; EventAllDay_New:Boolean; EventStartTime_New:TDateTime; EventEndTime_New:TDateTime): String;
// Procedura che riempie l'array di Tasks ricevuto come parametro
//  NB: Usato per popolare la TableView della gestione dei tasks
//      su Levante
procedure GCal_LoadEventRecordArray(var ERA: TEventRecordArray);
// Procedura che esegue un refresh generale degli eventi presenti su Google Calendar
//  aggiornando i dati contenuti negli impegni di Levante.
//  In pratica, se eseguito a intervalli regolari, si occupa di tenere sincronizzato
//  Levante con le eventuli modifiche effettuate sui dispositivi mobili.
procedure GCal_RefreshImpegniFromGoogleCal(DB: TIBODatabase);
// Crea l'evento di Google Calendar a partire dal MasterID dell'appuntamento
//  ricevuto come parametro.
//  NB: Viene usata quando si trascina una chiamata sull'agenda laterale e quindi
//       la chiamata si trasforma in appuntamento
procedure GCal_CreateOrOpenEvent(MasterID:Integer; Invisible:Boolean=False);




implementation

uses SysUtils, IB_Components, DataModule1, Forms, FormGEvent, SchedaClienti, cxSplitter, DateUtils;

var
  GobalRefreshToken: String;





{ Funzioni e Procedure da LevGoogle.dll }

  // Function che  crea l'oggetto Calendar e lo inizializza
  function GoogleCal_Init (ClientID, ClientSecret, RefreshToken: String): String; external LevGoogleDll;
  // Function che riceve l'ID e il nome di un calendario, se l'ID è vuoto significa che
  //  il calendario deve essere creato nuovo, altrimenti modifica l'esistente
  //  in ogni caso ritorna l'ID del calendario stesso
  function GoogleCal_Calendar_CreateOrModify (ID, Name: String): String; external LevGoogleDll;
  // Procedure che riceve l'ID di un calendario da eliminare e lo elimina
  procedure GoogleCal_Calendar_Delete (ID: String); external LevGoogleDll;
  // Procedura che aggiorna o crea l'evento specificato
  //  NB: Se viene specificato un EventID da modificare ne esegue l'update, altrimenti lo crea nuovo
  //  NB: Se viene creato un nuovo Event ne ritorna l'ID altrimenti ritorna una stringa vuota.
  //  NB: Se viene spostato un Event da un calendario all'altro, siccome non era possibile farlo, lo distruggo da un
  //       calendario e lo ricreo nell'altro e quindi ritorno il nuovo EventID
  function GoogleCal_SetEventData (EventID:String; EventCalendarID_Old:String; EventCalendarID_New:String; EventTitle:String; EventDescription:String; EventLocation:String; EventAllDay:Boolean; EventStartTime:TDateTime; EventEndTime:TDateTime): String; external LevGoogleDll;
  // Procedura che sposta l'appuntamento in un altro momento o calendario
  //  NB: Se l'ID non viene specificato non fa nulla
  //  NB: Se viene spostato un Event da un calendario all'altro, siccome non era possibile farlo, lo distruggo da un
  //       calendario e lo ricreo nell'altro e quindi ritorno il nuovo EventID
  function GoogleCal_MoveEvent (EventID:String; EventCalendarID_Old:String; EventCalendarID_New:String; EventAllDay_New:Boolean; EventStartTime_New:TDateTime; EventEndTime_New:TDateTime): String; external LevGoogleDll;
  // Procedura che sposta l'appuntamento in un altro momento o calendario per Master_ID
  function GoogleCal_MoveEventByMasterID (Master_ID:Integer; EventCalendarID_New:String; EventAllDay_New:Boolean; EventStartTime_New:TDateTime; EventEndTime_New:TDateTime): String; external LevGoogleDll;
  // Procedura che riceve il Master_ID e ritorna il TaskID e TaskListID del Task relativo all'impegno.
  //  Se il Task non esiste ritorna delle stringhe vuote.
  procedure GoogleCal_Master_ID_To_EventID(Master_ID:Integer; var EventID:String; var EventCalendarID:String); external LevGoogleDll;
  // Procedura che riceve l'ID di un task e ne ritorna i dati al chiamante
  //  nelle variabili ricevute per riferimento
  procedure GoogleCal_GetEventData(var EventID:String; var EventCalendarID:String; var EventTitle:String; var EventDescription:String;
                                   var EventLocation:String; var EventAllDay:Boolean; var EventStartTime:TDateTime;
                                   var EventEndTime:TDateTime; var EventCalendarTitle:String); external LevGoogleDll;
  // Procedura che riceve il Master_ID dell'impegno e ne ricerca l'eventuale Task allegato.
  // Se lo trova ne ritorna i valori nelle variabili ricevute come parametro per riferimento.
  // Se non lo trova lo crea nuovo.
  procedure GoogleCal_GetEventDataByMaster_ID(Master_ID:Integer;var EventID:String; var EventCalendarID:String; var EventTitle:String; var EventDescription:String;
                                              var EventLocation:String; var EventAllDay:Boolean; var EventStartTime:TDateTime;
                                              var EventEndTime:TDateTime; var EventCalendarTitle:String); external LevGoogleDll;
  // Procedura che riceve una StringList e la riempie con l'elenco degli ID delle Liste
  //  presenti nell'account.
  procedure GoogleCal_LoadCalendarsTitleOnStringList (SL: TStrings); external LevGoogleDll;
  // Procedura che riceve una StringList e la riempie con l'elenco degli ID delle Liste
  //  presenti nell'account.
  procedure GoogleCal_LoadCalendarsIdOnStringList (SL: TStrings); external LevGoogleDll;
  // Procedura che riceve una StringList e la riempie con l'elenco del TITOLO=ID delle Liste
  //  presenti nell'account.
  procedure GoogleCal_LoadCalendarsTitleIdOnStringList (SLTitle, SLID: TStrings); external LevGoogleDll;
  // Procedura che elimina il task specificato
  procedure GoogleCal_DeleteEvent (EventID:String; EventCalendarID:String); external LevGoogleDll;
  // Procedura che elimina il task specificato dal parametro Master_ID
  procedure GoogleCal_DeleteEventByMasterID (Master_ID:Integer); external LevGoogleDll;
  // Procedura che riempie l'array di Tasks ricevuto come parametro
  //  NB: Usato per popolare la TableView della gestione dei tasks
  //      su Levante
  procedure GoogleCal_EventRecordArray_Load (var ERA: TEventRecordArray); external LevGoogleDll;











{ Funzioni e Procedure di libreria (nessun oggetto) }



// Crea l'evento di Google Calendar a partire dal MasterID dell'appuntamento
//  ricevuto come parametro.
//  NB: Viene usata quando si trascina una chiamata sull'agenda laterale e quindi
//       la chiamata si trasforma in appuntamento
procedure GCal_CreateOrOpenEvent(MasterID:Integer; Invisible:Boolean=False);
var
  NewEventTitle, NewEventDescrizione, NewEventLocation, NewEventCalendarID, NewEventCalendarName, StrToAdd, Urgente, TmpStr: String;
  NewEventStartTime, NewEventEndTime: TDateTime;
  NewEventAllDay: Boolean;
  Qry: TIB_Cursor;
begin
  try
    // Query che recupera i dati dell'impegno
    Qry                := TIB_Cursor.Create(nil);
    Qry.IB_Connection  := DM1.DBAzienda;
    Qry.SQL.Add('SELECT');

    Qry.SQL.Add(' IMP.URGENTE');
    Qry.SQL.Add(',IMP.EVENTMESSAGE');
    Qry.SQL.Add(',IMP.LOCATION');
    Qry.SQL.Add(',IMP.START_EVENT');
    Qry.SQL.Add(',IMP.FINISH_EVENT');
    Qry.SQL.Add(',IMP.RAGSOCCLI');

    Qry.SQL.Add(',SOGG.RAGIONESOCIALE AS SOGG_RAGIONESOCIALE');

    Qry.SQL.Add(',PRAT.TIPO AS PRAT_TIPO');
    Qry.SQL.Add(',PRAT.RAGSOCRESPIMP AS PRAT_RAGSOCRESPIMP');
    Qry.SQL.Add(',PRAT.DESCRIZIONE AS PRAT_DESCRIZIONE');

    Qry.SQL.Add(',TECNICI.RESOURCEID AS TECNICI_RESOURCEID');
    Qry.SQL.Add(',TECNICI.RESOURCENAME AS TECNICI_RESOURCENAME');
    Qry.SQL.Add(',TECNICI.GCAL_CALENDAR_ID AS TECNICI_GCAL_CALENDAR_ID');

    Qry.SQL.Add('FROM IMPEGNI IMP');
    Qry.SQL.Add('LEFT JOIN CLIENTI SOGG ON (SOGG.CODICE = IMP.CLIENTE)');
    Qry.SQL.Add('LEFT JOIN PRATICHE PRAT ON (PRAT.ID = IMP.IDPRATICA)');
    Qry.SQL.Add('LEFT JOIN TECNICI ON (TECNICI.RESOURCEID = IMP.RESOURCEID)');

    Qry.SQL.Add('WHERE IMP.MASTER_ID = ' + IntToStr(MasterID));

    // Apre la query
    Qry.Open;
    // Se non trova nulla
    if Qry.Eof then raise Exception.Create('Appuntamento non trovato!');

    // Se la chiamata è marcata come urgente lo mette nel titolo
    if Qry.FieldByName('URGENTE').AsString = 'T' then Urgente := 'Urgente - ';

    // COstruisce il titolo dell'evento in base alla situazione
    if      Qry.FieldByName('PRAT_TIPO').AsString = 'A'   // Se l'impegno è di un impianto
      then NewEventTitle := IntToStr(MasterID) +': '+ Urgente + Trim(Qry.FieldByName('PRAT_RAGSOCRESPIMP').AsString) +' - '+ Trim(Qry.FieldByName('PRAT_DESCRIZIONE').AsString)
    else if Qry.FieldByName('PRAT_TIPO').AsString = 'P'   // Se l'impegno è di una pratica/cantiere
      then NewEventTitle := IntToStr(MasterID) +': '+ Urgente + Trim(Qry.FieldByName('SOGG_RAGIONESOCIALE').AsString) +' - '+ Trim(Qry.FieldByName('PRAT_DESCRIZIONE').AsString)
    else if Qry.FieldByName('SOGG_RAGIONESOCIALE').AsString <> ''   // Se l'impegno è di un soggetto
      then NewEventTitle := IntToStr(MasterID) +': '+ Urgente + Trim(Qry.FieldByName('SOGG_RAGIONESOCIALE').AsString)
    else  // Altrimenti se non è ne di un impianto ne di una pratica e nemmeno di un soggetto...
           NewEventTitle := IntToStr(MasterID) +': '+ Urgente + Trim(Qry.FieldByName('RAGSOCCLI').AsString);

    // Descrizione
    NewEventDescrizione   := Trim(Qry.FieldByName('EVENTMESSAGE').AsString);
    // Location
    NewEventLocation      := Trim(Qry.FieldByName('LOCATION').AsString);
    // StartTime
    NewEventStartTime     := Qry.FieldByName('START').AsDateTime;
    // EndTime
    NewEventEndTime       := Qry.FieldByName('FINISH').AsDateTime;
    // AllDay
    NewEventAllDay        := (NewEventStartTime = DateOf(NewEventStartTime)) and (NewEventEndTime = DateOf(NewEventEndTime));

    // Calendar
    if Qry.FieldByName('TECNICI_RESOURCEID').IsNotNull and (Qry.FieldByName('TECNICI_RESOURCEID').AsInteger <> 0) then begin
      NewEventCalendarID    := Qry.FieldByName('TECNICI_GCAL_CALENDAR_ID').AsString;
      NewEventCalendarName  := Qry.FieldByName('TECNICI_RESOURCENAME').AsString;
    end;

    // Ora può chiudere la query
    Qry.Close;

    // Procede con la creazione/modifica del Task
    GCal_ShowEventForm_Impegno(MasterID, NewEventTitle, NewEventDescrizione, NewEventLocation,
                               NewEventAllDay, NewEventStartTime, NewEventEndTime, NewEventCalendarID,
                               NewEventCalendarName, Invisible);
  finally
    Qry.Free;
  end;
end;



// Procedure che visualizza la form di editing del task in forma modale
//  e alla fine ritorna nella variabili ricevute per riferimento l'ID e
//  il ListID del task che è stato creato/modificato
procedure GCal_ShowEventForm(EventID:String; EventCalendarID, NewEventCalendarName:String; NewEventTitle:String=''; NewEventDescription:String=''; NewEventLocation:String=''; NewEventAllDay:Boolean=False; NewEventStartTime:TDateTime=0; NewEventEndTime:TDateTime=0);
begin
  // Crea la form e la visualizza
  Application.CreateForm(TGEventForm, GEventForm);
  try
    // Imposta alcune proprietà della form
    GEventForm.GEvent.DB          := DM1.DBAzienda;
    GEventForm.GEvent.ID          := EventID;
    GEventForm.GEvent.CalendarID  := EventCalendarID;
    // Carica i campi delle form a video
    GEventForm.eEventTitle.Text         := NewEventTitle;
    GEventForm.eEventDescription.Text   := NewEventDescription;
    GEventForm.eEventLocation.Text      := NewEventLocation;
    GEventForm.eEventAllDay.Checked     := NewEventAllDay;
    GEventForm.eEventStartTime.Date     := NewEventStartTime;
    GEventForm.eEventEndTime.Date       := NewEventEndTime;
    GEventForm.eEventCalendar.Text      := NewEventCalendarName;
    // Se deve essere invisibile e confermare automaticamente...
    GEventForm.Invisible := False;
    // Visualizza la form
    GEventForm.ShowModal;
  finally
    FreeAndNil(GEventForm);
  end;
  // -----------------------------------------------
end;


// Procedure che visualizza la form di editing del task in forma modale
//  e alla fine ritorna nella variabili ricevute per riferimento l'ID e
//  il ListID del task che è stato creato/modificato
procedure GCal_ShowEventForm_Impegno(Master_ID:Integer; NewEventTitle:String=''; NewEventDescription:String=''; NewEventLocation:String=''; NewEventAllDay:Boolean=False; NewEventStartTime:TDateTime=0; NewEventEndTime:TDateTime=0; NewEventCalendarID:String=''; NewEventCalendarName:String=''; Invisible:Boolean=False);
var
  EventID, EventCalendarID: String;
  Qry: TIB_Cursor;
begin
  // Se non è stato specificato un Master_ID si incazza come una iena
  if Master_ID = 0 then raise Exception.Create('GoogleTasks_ShowTaskForm_Impegno - Master_ID non valido!');
  // -----------------------------------------------
  // NB: Il TaskID e il TaskListID in realtà non vengono usati per reperire il Task
  //      ma solo per verificare se il un task precedente esisteva già oppure no perchè
  //      se non esisteva lo deve creare nuovo mentre se esisteva (TaskID<>'') e ora invece
  //      non lo trova più significa che c'era ma è stato eliminato.
  // Per prima cosa ricava il TaskID e il TaskListID dalla tabella dei riferimenti
  //  incrociati tra Impegni e Tasks, se c'è ovviamente altrimenti li lascia vuoti.
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT EVENT_ID, EVENT_CALID FROM IMPEGNI_GCAL WHERE MASTER_ID = ' + IntToStr(Master_ID));
    Qry.Open;
    if not Qry.Eof then begin
      EventID         := Qry.FieldByName('EVENT_ID').AsString;
      EventCalendarID := Qry.FieldByName('EVENT_CALID').AsString;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
  // -----------------------------------------------
  // Crea la form e la visualizza
  Application.CreateForm(TGEventForm, GEventForm);
  try
    // Imposta alcune proprietà della form
    GEventForm.GEvent.DB          := DM1.DBAzienda;
    GEventForm.GEvent.ID          := EventID;
    GEventForm.GEvent.CalendarID  := EventCalendarID;
    // Riferimenti a documneti di Levante
    GEventForm.GEvent.Event_Master_ID := Master_ID;
    // Carica i campi delle form a video
    GEventForm.eEventTitle.Text         := NewEventTitle;
    GEventForm.eEventDescription.Text   := NewEventDescription;
    GEventForm.eEventLocation.Text      := NewEventLocation;
    GEventForm.eEventAllDay.Checked     := NewEventAllDay;
    GEventForm.eEventStartTime.Date     := NewEventStartTime;
    GEventForm.eEventEndTime.Date       := NewEventEndTime;
    GEventForm.eEventCalendarID.Text    := NewEventCalendarID;
    GEventForm.eEventCalendar.Text      := NewEventCalendarName;
    // Se deve essere invisibile e confermare automaticamente...
    GEventForm.Invisible := Invisible;
    // Visualizza la form
    GEventForm.ShowModal;
  finally
    FreeAndNil(GEventForm);
  end;
  // -----------------------------------------------
end;



// Procedure che inizializza il sistema di Google Calendar impostando i dati per il
//  login e salvando il RefreshToken sul database
procedure GCal_Init(DB: TIBODatabase);
var
  Qry: TIB_Cursor;
  NewRefreshToken: String;
begin
  // ------------
  // Se la variabile globale che contiene il RefreshToken è vuota significa che siamo al primo accesso
  //  a Google Calendar e quindi la carica dai parametri (quindi solo al primo accesso)
  if GobalRefreshToken = '' then begin
    Qry := TIB_Cursor.Create(nil);
    try
      Qry.IB_Connection := DB;
      Qry.SQL.Add('SELECT Google_Calendar_RefreshToken FROM PROGRESS2');
      Qry.Open;
      if not Qry.Eof then GobalRefreshToken := Qry.Fields[0].AsString;
      Qry.Close;
    finally
      Qry.Free;
    end;
  end;
  // ------------
  // Ora inizializza l'oggetto per l'accesso a GoogleCalendar
  NewRefreshToken := GoogleCal_Init('689529138705.apps.googleusercontent.com', 'WvnNlcJC5oZYGsbbuKoGcqpq', GobalRefreshToken);
  // ------------
  // Ora se il refresh token ritornato è diverso da quello iniziale provvede a memorizzarlo
  //  per gli accessi futuri
  if NewRefreshToken <> GobalRefreshToken then begin
    GobalRefreshToken := NewRefreshToken;
    Qry := TIB_Cursor.Create(nil);
    try
      Qry.IB_Connection := DB;
      Qry.SQL.Add('UPDATE PROGRESS2 SET');
      Qry.SQL.Add('Google_Calendar_RefreshToken = ' + QuotedStr(NewRefreshToken));
      Qry.ExecSQL;
    finally
      Qry.Free;
    end;
  end;
  // ------------
end;



// Function che riceve l'ID e il nome di un calendario, se l'ID è vuoto significa che
//  il calendario deve essere creato nuovo, altrimenti modifica l'esistente
//  in ogni caso ritorna l'ID del calendario stesso
//  NB: Per calendario in questo caso si intende il TECNICO
function GCal_Calendar_CreateOrModify(CalID, CalName: String): String;
begin
  // Inizializza Google Calendar
  GCal_Init(DM1.DBAzienda);
  // Function che riceve l'ID e il nome di un calendario, se l'ID è vuoto significa che
  //  il calendario deve essere creato nuovo, altrimenti modifica l'esistente
  //  in ogni caso ritorna l'ID del calendario stesso
  Result := GoogleCal_Calendar_CreateOrModify (CalID, CalName);
end;

// Procedure che riceve l'ID di un calendario da eliminare e lo elimina
procedure GCal_Calendar_Delete(ID: String);
begin
  // Inizializza Google Calendar
  GCal_Init(DM1.DBAzienda);
  // Elimina il calendario
  GoogleCal_Calendar_Delete(ID);
end;

// Procedure riempie una StringList con l'elenco dei titoli e degli ID delle liste
procedure GCal_LoadCalendarsTitleAndID(SLTitle, SLID:TStrings);
begin
  // Inizializza Google Calendar
  GCal_Init(DM1.DBAzienda);
  // Carica la lista delle liste
  GoogleCal_LoadCalendarsTitleIdOnStringList(SLTitle, SLID);
end;

// Procedure che elimina il Task specificato
procedure GCal_DeleteEventByEventID(EventID, EventCalendarID: String);
begin
  // Inizializza Google Calendar
  GCal_Init(DM1.DBAzienda);
  // Elimina l'evento
  GoogleCal_DeleteEvent(EventID, EventCalendarID);
  // Se i Tasks laterali sono visibili allora li aggiorna
  if (ClientiForm.AgendaForm <> nil) and (ClientiForm.AgendaForm.Splitter.State = ssOpened) and (ClientiForm.AgendaForm.MainPageControl.ActivePage = ClientiForm.AgendaForm.TabAgenda) then begin
    ClientiForm.AgendaForm.sbAgenda_RefreshClick(ClientiForm.AgendaForm.sbAgenda_Refresh);
  end;
end;

// Procedure che elimina il Task relativo all'impegno il cui Master_ID viene ricevuto
//  nel parametro
procedure GCal_DeleteEventByMaster_ID(Master_ID:Integer; DeleteFromImpegniGCalTable:Boolean=True);
var
  Qry: TIB_Cursor;
  EventID, EventCalendarID: String;
begin
  // Se non è stato specificato un Master_ID si incazza come una iena
  if Master_ID = 0 then raise Exception.Create('GCal_DeleteEventByMaster_ID - Master_ID non valido!');
  // -----------------------------------------------
  // Se questa query non trova nulla nella tabella dei riferimento incrociati dei Tasks con gli Impegni
  //  allora non provvede all'eliminazione del Task
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*) FROM IMPEGNI_GCAL WHERE MASTER_ID = ' + IntToStr(Master_ID));
    Qry.Open;
    if Qry.Fields[0].AsInteger = 0 then Exit;
  finally
    Qry.Close;
    Qry.Free;
  end;
  // -----------------------------------------------
  // Inizializza Google Calendar
  GCal_Init(DM1.DBAzienda);
  // Elimina l'evento
  GoogleCal_DeleteEventByMasterID(Master_ID);
  // -----------------------------------------------
  if DeleteFromImpegniGCalTable then begin
    // Query che elimina il riferimento all'impegno nella tabella dei
    //  riferimenti incrociati tra Tasks e Impegni
    Qry := TIB_Cursor.Create(nil);
    try
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('DELETE FROM IMPEGNI_GCAL WHERE MASTER_ID = ' + IntToStr(Master_ID));
      Qry.ExecSQL;
    finally
      Qry.Free;
    end;
  end;
  // -----------------------------------------------
  // Se i Tasks laterali sono visibili allora li aggiorna
  if (ClientiForm.AgendaForm <> nil) and (ClientiForm.AgendaForm.Splitter.State = ssOpened) and (ClientiForm.AgendaForm.MainPageControl.ActivePage = ClientiForm.AgendaForm.TabAgenda) then begin
    ClientiForm.AgendaForm.sbAgenda_RefreshClick(ClientiForm.AgendaForm.sbAgenda_Refresh);
  end;
end;


// Procedura che sposta l'appuntamento in un altro momento o calendario per Master_ID
function GCal_MoveEventByMasterID(Master_ID:Integer; EventCalendarID_New:String; EventAllDay_New:Boolean; EventStartTime_New:TDateTime; EventEndTime_New:TDateTime): String;
begin
  // Se non è stato specificato un Master_ID si incazza come una iena
  if Master_ID = 0 then raise Exception.Create('GCal_MoveEventByMasterID - Master_ID non valido!');
  // Inizializza Google Calendar
  GCal_Init(DM1.DBAzienda);
  // Sposta l'evento
  Result := GoogleCal_MoveEventByMasterID(Master_ID, EventCalendarID_New, EventAllDay_New, EventStartTime_New, EventEndTime_New);
end;

// Procedura che riempie l'array di Tasks ricevuto come parametro
//  NB: Usato per popolare la TableView della gestione dei tasks
//      su Levante
procedure GCal_LoadEventRecordArray(var ERA: TEventRecordArray);
begin
  // Inizializza Google Calendar
  GCal_Init(DM1.DBAzienda);
  // Rilancia sulla tessa procedure nella DLL
  GoogleCal_EventRecordArray_Load(ERA);
end;

// Procedura che esegue un refresh generale degli eventi presenti su Google Calendar
//  aggiornando i dati contenuti negli impegni di Levante.
//  In pratica, se eseguito a intervalli regolari, si occupa di tenere sincronizzato
//  Levante con le eventuli modifiche effettuate sui dispositivi mobili.
procedure GCal_RefreshImpegniFromGoogleCal(DB: TIBODatabase);
var
  ERA: TEventRecordArray;
  Qry: TIB_Cursor;
  i: Integer;
  Trans: TIB_Transaction;
  ER: TEventRecord;
  MasterID: Integer;
begin
  // Carica tutti gli Eventi da GoogleCal sull'apposito array di eventi
  GCal_LoadEventRecordArray(ERA);
  try
    // Crea l'oggetto transazione
    Trans := TIB_Transaction.Create(nil);
    Trans.Isolation := tiCommitted;
    Trans.IB_Connection := DB;
    // Crea l'oggetto query che  aggiornerà il database
    Qry := TIB_Cursor.Create(nil);
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.IB_Transaction := Trans;
    // Avvia la transazione, poi sarà in ogni caso fatto il Commit
    Trans.StartTransaction;
    try
      // Cicla per tutti gli eventi
      for i := 0 to Length(ERA) -1 do begin
        // Per comidità
        ER := ERA[i];
        try
          // Ricava il MasterID e se non lo trova salta questo evento
          MasterID := StrToInt(DM1.RitornaTestoPrimaDi(':', ER.Title, False));
          // Imposta ed esegue la query
          Qry.SQL.Clear;
          Qry.SQL.Add('EXECUTE PROCEDURE EVENT_UPDATE (' + IntToStr(MasterID)
                                                     +','+ QuotedStr(ER.CalendarID)
                                                     +','+ QuotedStr(ER.Description)
                                                     +','+ QuotedStr(ER.Location)
                                                     +','+ QuotedStr(FormatDateTime('mm/dd/yyyy hh.nn.ss',ER.StartTime))
                                                     +','+ QuotedStr(FormatDateTime('mm/dd/yyyy hh.nn.ss',ER.EndTime))
                                                     +')');
          Qry.ExecSQL;
        except
          // NON FA NULLA, LO USO SOLO PER FARE IN MODO CHE SE ANCHE
          // CI FOSSERO ERRORI NON SUCCEDA NULLA
        end;
      end;
    finally
      // In ogni caso esegue il commit della Transazione in modo che
      //  quello che è riuscito a fare bene, il resto non importa.
      Trans.Commit;
    end;
  finally
    if Assigned(Trans) then Trans.Free;
    if Assigned(Qry) then Qry.Free;
  end;
end;


















{ TGCal_Event }

// Procedure che salva il riferimento incrociato tra l'impegno e il Task
//  specificati.
procedure TGCal_Event.Event_Ref_Store;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.IB_Connection := Self.DB;
    Qry.SQL.Add('EXECUTE PROCEDURE EVENT_IMPEGNO_REF_STORE(' + IntToStr(Self.Event_Master_ID) + ',' + QuotedStr(Self.ID) + ',' + QuotedStr(Self.CalendarID) + ')');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

// Procedure che ritorna i valori del Task desiderato
procedure TGCal_Event.LoadByID(EventID, EventCalendatID: String);
var
  Loc_ID, Loc_CalendarID, Loc_Title, Loc_Description, Loc_Location, Loc_CalendarTitle: String;
  Loc_StartTime, Loc_EndTime: TDateTime;
  Loc_AllDay: Boolean;
begin
  // Inizializzazione
  Loc_ID          := EventID;
  Loc_CalendarID  := EventCalendatID;

  // Inizializza Google Calendar
  GCal_Init(Self.DB);

  // Carica i dati dell'oggetto dal server in alcune variabili locali
  //  NB: Se mettevo direttamente le proprietà dell'iggetto mi dava errore
  GoogleCal_GetEventData(Loc_ID, Loc_CalendarID, Loc_Title, Loc_Description, Loc_Location, Loc_AllDay, Loc_StartTime, Loc_EndTime, Loc_CalendarTitle);
  
  // Carica le proprietà reali dell'oggetto
  Self.fID              := Loc_ID;
  Self.fCalendarID      := Loc_CalendarID;
  Self.fCalendarID_Old  := Loc_CalendarID;
  Self.fTitle           := Loc_Title;
  Self.fDescription     := Loc_Description;
  Self.fLocation        := Loc_Location;
  Self.fAllDay          := Loc_AllDay;
  Self.fStartTime       := Loc_StartTime;
  Self.fEndTime         := Loc_EndTime;
  Self.fCalendarTitle   := Loc_CalendarTitle;
end;

// Procedure che ritorna i valori del Task desiderato cercandolo con il Master_ID
procedure TGCal_Event.LoadByMaster_ID(Master_ID:Integer);
var
  Loc_ID, Loc_CalendarID, Loc_Title, Loc_Description, Loc_Location, Loc_CalendarTitle: String;
  Loc_StartTime, Loc_EndTime: TDateTime;
  Loc_AllDay: Boolean;
begin
  // Inizializza Google Calendar
  GCal_Init(Self.DB);

  // Carica i dati dell'oggetto dal server in alcune variabili locali
  //  NB: Se mettevo direttamente le proprietà dell'oggetto mi dava errore
  GoogleCal_GetEventDataByMaster_ID(Master_ID, Loc_ID, Loc_CalendarID, Loc_Title, Loc_Description, Loc_Location, Loc_AllDay, Loc_StartTime, Loc_EndTime, Loc_CalendarTitle);

  // Carica le proprietà reali dell'oggetto
  Self.fID              := Loc_ID;
  Self.fCalendarID      := Loc_CalendarID;
  Self.fCalendarID_Old  := Loc_CalendarID;
  Self.fTitle           := Loc_Title;
  Self.fDescription     := Loc_Description;
  Self.fLocation        := Loc_Location;
  Self.fAllDay          := Loc_AllDay;
  Self.fStartTime       := Loc_StartTime;
  Self.fEndTime         := Loc_EndTime;
  Self.fCalendarTitle   := Loc_CalendarTitle;
end;


// Function che Crea o Modifica il Task e ne ritorna l'ID (Nel caso sia un nuovo Task oppure uno esistente che ha cambiato ID ad esempio perchè è stato spostato in un'altra Lista)
function TGCal_Event.Store: String;
begin
  // Inizializza Google Calendar
  GCal_Init(Self.DB);

  // Salva i dati del Task e imposta il valore da ritornare (è l'ID che potrebbe essere cambiato)
  Self.ID := GoogleCal_SetEventData(ID, CalendarID_Old, CalendarID, Title, Description, Location, AllDay, StartTime, EndTime);
  Result := Self.ID;
  // Se è stato specificato un componente DB e anche il Master_ID di un impegno
  //  a cui il Task fa riferimento provvede a creare sull'apposita tabella il record
  //  di riferimento reciproco tra le due entità
  if Assigned(Self.DB) and (Self.Event_Master_ID <> 0) then begin
    Self.Event_Ref_Store;
  end;
end;


// Function come la "Store" ma che in più esegue il salvataggio solo se i dati ricevuti sono diversi dagli attuali
function TGCal_Event.StoreIfChanged(Title_New, Description_New, Location_new: String; AllDay_New: Boolean; StartTime_New, EndTimeNew: TDateTime; CalendarID_New: String): String;
begin
  // Verifica se i dati sono cambiati e se sono cambiati
  //  esegue lo store sul server
  if (Title_New       <> Title)
  or (Description_New <> Description)
  or (Location_new    <> Location)
  or (AllDay_New      <> AllDay)
  or (StartTime_New   <> StartTime)
  or (EndTimeNew      <> EndTime)
  or (CalendarID_New  <> CalendarTitle)
  then begin
    // Assegna i nuovi valori
    Title         := Title_New;
    Description   := Description_New;
    Location      := Location_new;
    AllDay        := AllDay_New;
    StartTime     := StartTime_New;
    EndTime       := EndTimeNew;
    CalendarID    := CalendarID_New;
    // Esedgue lo store e assegna il valore da ritornare
    Result := Self.Store;
  end;
end;




end.
