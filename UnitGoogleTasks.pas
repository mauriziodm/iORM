unit UnitGoogleTasks;

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
  TTaskRecord = record
    ID: String;
    Title: String;
    Notes: String;
    DueDate: TDateTime;
    Completed: Boolean;
    ListID: String;
    ListTitle: String;
  end;
  // Array di Records contenenti i dati dei Tasks
  TTaskRecordArray = array of TTaskRecord;
  // ===========================================================================

  // Definizione di classe che rappresenta un singolo Task di GoogleTask.
  // Sarà usato per caricare o modificare i dati di un singolo Task.
  TGoogleTasks_Task = class(TObject)
  private
    fID: String;
    fTitle: String;
    fNotes: String;
    fCompleted: Boolean;
    fParentID: String;
    fDueDate: TDateTime;
    fHidden: Boolean;
    fDeleted: Boolean;
    fUpdated: TDateTime;
    fPosition: String;
    fListID: String;
    fDB: TIBODatabase;
    fUserName: String;
    fPassword: String;
    fOAuthRefreshToken: String;
    fImpegni_Master_ID: Integer;
    fListTitle: String;
    fListID_Old: String;
    procedure Impegno_Ref_Store;
  protected
  public
    // Dati per il login normale
    property UserName:String read fUserName write fUserName;
    property Password:String read fPassword write fPassword;
    // Dati per il login con metodo OAuth
    property OAuthRefreshToken:String read fOAuthRefreshToken write fOAuthRefreshToken;
    // Proprietà normali del Task
    property ID:String read fID write fID;
    property Title:String read fTitle write fTitle;
    property Notes:String read fNotes write fNotes;
    property Completed:Boolean read fCompleted write fCompleted;
    property ParentID:String read fParentID write fParentID;
    property DueDate:TDateTime read fDueDate write fDueDate;
    property Hidden:Boolean read fHidden;
    property Deleted:Boolean read fDeleted;
    property Updated:TDateTime read fUpdated;
    property Position:String read fPosition;
    property ListID:String read fListID write fListID;
    property ListTitle:String read fListTitle;
    property ListID_Old:String read fListID_Old;
    property DB:TIBODatabase read fDB write fDB;
    // Riferimenti a documenti di Levante
    property Impegni_Master_ID:Integer read fImpegni_Master_ID write fImpegni_Master_ID;

    // Procedure che ritorna i valori del Task desiderato
    procedure LoadByID(TaskID: String; TaskListID: String = '');
    procedure LoadByMaster_ID(Master_ID:Integer);
    // Function che Crea o Modifica il Task e ne ritorna l'ID (Nel caso sia un nuovo Task oppure uno esistente che ha cambiato ID ad esempio perchè è stato spostato in un'altra Lista)
    function Store: String;
    // Funcrion come la "Store" ma che in più esegue il salvataggio solo se i dati ricevuti sono diversi dagli attuali
    function StoreIfChanged(Title_New, Notes_New: String; DueDate_New: TDateTime; Completed_New: Boolean; ListID_New: String): String;
  end;




{ Funzioni e Procedure di libreria (nessun oggetto) }

// Procedure che inizializza il sistema di Google Calendar impostando i dati per il
//  login e salvando il RefreshToken sul database
procedure GoogleTasks_InitAndConnect(DB: TIBODatabase);
// Procedure che visualizza la form di editing del task in forma modale
//  e alla fine ritorna nella variabili ricevute per riferimento l'ID e
//  il ListID del task che è stato creato/modificato
procedure GoogleTasks_ShowTaskForm_Impegno(Master_ID:Integer; NewTaskTitle:String=''; NewTaskNotes:String=''; NewTaskDueDate:TDateTime=0; Invisible:Boolean=False);
procedure GoogleTasks_ShowTaskForm(TaskID:String; TaskListID:String; NewTaskTitle:String=''; NewTaskNotes:String=''; NewTaskDueDate:TDateTime=0);
// Procedure riempie una StringList con l'elenco dei titoli delle liste
procedure GoogleTasks_LoadListsTitleAndID(SLTitle, SLID:TStrings);
// Procedure che elimina il Task relativo all'impegno il cui Master_ID viene ricevuto
//  nel parametro
procedure GoogleTasks_DeleteTaskByMaster_ID(Master_ID:Integer; DeleteFromImpegniTasksTable:Boolean=True);
procedure GoogleTasks_DeleteTaskByTaskID(TaskID, TaskListID: String);
// Procedura che riempie l'array di Tasks ricevuto come parametro
//  NB: Usato per popolare la TableView della gestione dei tasks
//      su Levante
procedure GoogleTasks_LoadTaskRecordArray(var TRA: TTaskRecordArray);




implementation

uses Forms, FormGTask, SysUtils, DataModule1, IB_Components, Dialogs, SchedaClienti, cxSplitter;

var
  GobalRefreshToken, GlobalUserName, GlobalPassword: String;

{ Funzioni e Procedure da LevGoogle.dll }

  // Si connette a GoogleTasks
  //  NB: Se vengono forniti UserName (la mail) e Password si connette con quelli, altrimenti utilizza il metodo OAuth
  //       e in questo caso ritorna al chiamante "OAuthRefreshToken" per le connessioni siccessive (poi il chiamante
  //       memorizzerà questo dato da qualche parte).
  function GoogleTasks_Connect (UserNameMail, Password, OAuthRefreshToken: String; const ProxyServer: String = ''; const ProxyPort: Integer = 0): String; external LevGoogleDll;
  // Procedure che si disconnette dal server
  procedure GoogleTasks_Disconnect; external LevGoogleDll;
  // Procedura che riceve il Master_ID e ritorna il TaskID e TaskListID del Task relativo all'impegno.
  //  Se il Task non esiste ritorna delle stringhe vuote.
  procedure GoogleTasks_Master_ID_To_TaskID (Master_ID:Integer; var TaskID:String; var TaskListID:String); external LevGoogleDll;
  // Procedura che riceve l'ID di un task e ne ritorna i dati al chiamante
  //  nelle variabili ricevute per riferimento
  procedure GoogleTasks_GetTaskData (var TaskID:String; var TaskListID:String; var TaskTitle:String; var TaskNotes:String; var TaskDueDate:TDateTime; var TaskCompleted:Boolean; var TaskHidden:Boolean; var TaskDeleted:Boolean; var TaskUpdated:TDateTime; var TaskPosition:String; var TaskParentID:String; var TaskListTitle:String); external LevGoogleDll;
  // Procedura che riceve il Master_ID dell'impegno e ne ricerca l'eventuale Task allegato.
  // Se lo trova ne ritorna i valori nelle variabili ricevute come parametro per riferimento.
  // Se non lo trova lo crea nuovo.
  procedure GoogleTasks_GetTaskDataByMaster_ID (Master_ID:Integer; var TaskID:String; var TaskListID:String; var TaskTitle:String; var TaskNotes:String; var TaskDueDate:TDateTime; var TaskCompleted:Boolean; var TaskHidden:Boolean; var TaskDeleted:Boolean; var TaskUpdated:TDateTime; var TaskPosition:String; var TaskParentID:String; var TaskListTitle:String); external LevGoogleDll;
  // Procedura che aggiorna o crea il task specificato
  //  NB: Se viene specificato un TaskID da modificare ne esegue l'update, altrimenti lo crea nuovo
  //  NB: Se viene creato un nuovo Task ne ritorna l'ID altrimenti ritorna una stringa vuota.
  function GoogleTasks_SetTaskData (TaskID:String; TaskListID_Old:String; TaskListID_New:String; TaskTitle:String; TaskNotes:String; TaskDueDate:TDateTime; TaskCompleted:Boolean): String; external LevGoogleDll;
  // Procedura che elimina il task specificato
  procedure GoogleTasks_DeleteTask (TaskID:String; TaskListID:String); external LevGoogleDll;
  // Procedura che elimina il task specificato dal parametro Master_ID
  procedure GoogleTasks_DeleteTaskByMasterID (Master_ID:Integer); external LevGoogleDll;
  // Procedura che riceve una StringList e la riempie con l'elenco dei TITOLI delle Liste
  //  presenti nell'account.
  procedure GoogleTasks_LoadListsTitleOnStringList(SL: TStrings); external LevGoogleDll;
  // Procedura che riceve una StringList e la riempie con l'elenco degli ID delle Liste
  //  presenti nell'account.
  procedure GoogleTasks_LoadListsIdOnStringList(SL: TStrings); external LevGoogleDll;
  // Procedura che riceve una StringList e la riempie con l'elenco del TITOLO=ID delle Liste
  //  presenti nell'account.
  procedure GoogleTasks_LoadListTitleIdOnStringList(SLTitle, SLID:TStrings); external LevGoogleDll;
  // Procedura che riempie l'array di Tasks ricevuto come parametro
  //  NB: Usato per popolare la TableView della gestione dei tasks
  //      su Levante
  procedure GoogleTasks_TaskRecordArray_Load (var TRA: TTaskRecordArray); external LevGoogleDll;




{ Funzioni e Procedure di libreria (nessun oggetto) }


// Procedure che inizializza il sistema di Google Calendar impostando i dati per il
//  login e salvando il RefreshToken sul database
procedure GoogleTasks_InitAndConnect(DB: TIBODatabase);
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
      Qry.SQL.Add('SELECT Google_UserName, Google_Password, Google_Tasks_RefreshToken FROM PROGRESS2');
      Qry.Open;
      if not Qry.Eof then begin
        GlobalUserName    := Qry.FieldByName('Google_UserName').AsString;
        GlobalPassword    := Qry.FieldByName('Google_Password').AsString;
        GobalRefreshToken := Qry.FieldByName('Google_Tasks_RefreshToken').AsString;
      end;
      Qry.Close;
    finally
      Qry.Free;
    end;
  end;
  // ------------
  // Si connette a google tasks e memorizza l'eventuale RefreshToken (OAuth)
  NewRefreshToken := GoogleTasks_Connect(GlobalUserName, GlobalPassword, GobalRefreshToken);
  // ------------
  // Ora se il refresh token ritornato è diverso da quello iniziale provvede a memorizzarlo
  //  per gli accessi futuri
  if NewRefreshToken <> GobalRefreshToken then begin
    GobalRefreshToken := NewRefreshToken;
    Qry := TIB_Cursor.Create(nil);
    try
      Qry.IB_Connection := DB;
      Qry.SQL.Add('UPDATE PROGRESS2 SET');
      Qry.SQL.Add('Google_Tasks_RefreshToken = ' + QuotedStr(NewRefreshToken));
      Qry.ExecSQL;
    finally
      Qry.Free;
    end;
  end;
  // ------------
end;



// Procedure che visualizza la form di editing del task in forma modale
//  e alla fine ritorna nella variabili ricevute per riferimento l'ID e
//  il ListID del task che è stato creato/modificato
procedure GoogleTasks_ShowTaskForm_Impegno(Master_ID:Integer; NewTaskTitle:String=''; NewTaskNotes:String=''; NewTaskDueDate:TDateTime=0; Invisible:Boolean=False);
var
  TaskID, TaskListID: String;
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
    Qry.SQL.Add('SELECT TASK_ID, TASK_LISTID FROM IMPEGNI_TASKS WHERE MASTER_ID = ' + IntToStr(Master_ID));
    Qry.Open;
    if not Qry.Eof then begin
      TaskID      := Qry.FieldByName('TASK_ID').AsString;
      TaskListID  := Qry.FieldByName('TASK_LISTID').AsString;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
  // -----------------------------------------------
  // Crea la form e la visualizza
  Application.CreateForm(TGTaskForm, GTaskForm);
  try
    // Imposta alcune proprietà della form
    GTaskForm.Task.UserName := 'mauriziodelmagno@gmail.com';
    GTaskForm.Task.Password := '14051973';
    GTaskForm.Task.DB       := DM1.DBAzienda;
    GTaskForm.Task.ID       := TaskID;
    GTaskForm.Task.ListID   := TaskListID;
    // Riferimenti a documneti di Levante
    GTaskForm.Task.Impegni_Master_ID := Master_ID;
    // Carica i campi delle form a video
    GTaskForm.eTaskTitle.Text         := NewTaskTitle;
    GTaskForm.eTaskNotes.Text         := NewTaskNotes;
    GTaskForm.eTaskDueDate.Date       := NewTaskDueDate;
    GTaskForm.eTaskCompleted.Checked  := False;
    // Se deve essere invisibile e confermare automaticamente...
    GTaskForm.Invisible := Invisible;
    // Visualizza la form
    GTaskForm.ShowModal;
  finally
    FreeAndNil(GTaskForm);
  end;
  // -----------------------------------------------
end;

// Procedure che visualizza la form di editing del task in forma modale
//  e alla fine ritorna nella variabili ricevute per riferimento l'ID e
//  il ListID del task che è stato creato/modificato
procedure GoogleTasks_ShowTaskForm(TaskID:String; TaskListID:String; NewTaskTitle:String=''; NewTaskNotes:String=''; NewTaskDueDate:TDateTime=0);
begin
  // Crea la form e la visualizza
  Application.CreateForm(TGTaskForm, GTaskForm);
  try
    // Imposta alcune proprietà della form
    GTaskForm.Task.UserName := 'mauriziodelmagno@gmail.com';
    GTaskForm.Task.Password := '14051973';
    GTaskForm.Task.DB       := DM1.DBAzienda;
    GTaskForm.Task.ID       := TaskID;
    GTaskForm.Task.ListID   := TaskListID;
    // Carica i campi delle form a video
    GTaskForm.eTaskTitle.Text         := NewTaskTitle;
    GTaskForm.eTaskNotes.Text         := NewTaskNotes;
    if NewTaskDueDate > 0 then GTaskForm.eTaskDueDate.Date := NewTaskDueDate;
    GTaskForm.eTaskCompleted.Checked  := False;
    // Se deve essere invisibile e confermare automaticamente...
    GTaskForm.Invisible := False;
    // Visualizza la form
    GTaskForm.ShowModal;
  finally
    FreeAndNil(GTaskForm);
  end;
  // -----------------------------------------------
end;


// Procedure riempie una StringList con l'elenco dei titoli e degli ID delle liste
procedure GoogleTasks_LoadListsTitleAndID(SLTitle, SLID:TStrings);
begin
  GoogleTasks_InitAndConnect(DM1.DBAzienda);
  try
    // Carica la lista delle liste
    GoogleTasks_LoadListTitleIdOnStringList(SLTitle, SLID);
  finally
    // Disconnessione e pulizie finali
    GoogleTasks_Disconnect;
  end;
end;

// Procedure che elimina il Task specificato
procedure GoogleTasks_DeleteTaskByTaskID(TaskID, TaskListID: String);
begin
  // Si connette al server di GoogleTasks per eliminare il Task
  GoogleTasks_InitAndConnect(DM1.DBAzienda);
  try
    GoogleTasks_DeleteTask(TaskID, TaskListID);
  finally
    GoogleTasks_Disconnect;
  end;
  // Se i Tasks laterali sono visibili allora li aggiorna
  if (ClientiForm.AgendaForm <> nil) and (ClientiForm.AgendaForm.Splitter.State = ssOpened) and (ClientiForm.AgendaForm.MainPageControl.ActivePage = ClientiForm.AgendaForm.TabTasks) then begin
    ClientiForm.AgendaForm.sbTasksRefreshClick(ClientiForm.AgendaForm.sbTasksRefresh);
  end;
end;

// Procedure che elimina il Task relativo all'impegno il cui Master_ID viene ricevuto
//  nel parametro
procedure GoogleTasks_DeleteTaskByMaster_ID(Master_ID:Integer; DeleteFromImpegniTasksTable:Boolean=True);
var
  Qry: TIB_Cursor;
  TaskID, TaskListID: String;
begin
  // Se non è stato specificato un Master_ID si incazza come una iena
  if Master_ID = 0 then raise Exception.Create('GoogleTasks_DeleteTaskByMaster_ID - Master_ID non valido!');
  // -----------------------------------------------
  // Se questa query non trova nulla nella tabella dei riferimento incrociati dei Tasks con gli Impegni
  //  allora non provvede all'eliminazione del Task
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('SELECT COUNT(*) FROM IMPEGNI_TASKS WHERE MASTER_ID = ' + IntToStr(Master_ID));
    Qry.Open;
    if Qry.Fields[0].AsInteger = 0 then Exit;
  finally
    Qry.Close;
    Qry.Free;
  end;
  // -----------------------------------------------
  // Si connette al server di GoogleTasks per eliminare il Task
  GoogleTasks_InitAndConnect(DM1.DBAzienda);
  try
    GoogleTasks_DeleteTaskByMasterID(Master_ID);
  finally
    GoogleTasks_Disconnect;
  end;
  // -----------------------------------------------
  if DeleteFromImpegniTasksTable then begin
    // Query che elimina il riferimento all'impegno nella tabella dei
    //  riferimenti incrociati tra Tasks e Impegni
    Qry := TIB_Cursor.Create(nil);
    try
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('DELETE FROM IMPEGNI_TASKS WHERE MASTER_ID = ' + IntToStr(Master_ID));
      Qry.ExecSQL;
    finally
      Qry.Free;
    end;
  end;
  // -----------------------------------------------
  // Se i Tasks laterali sono visibili allora li aggiorna
  if (ClientiForm.AgendaForm <> nil) and (ClientiForm.AgendaForm.Splitter.State = ssOpened) and (ClientiForm.AgendaForm.MainPageControl.ActivePage = ClientiForm.AgendaForm.TabTasks) then begin
    ClientiForm.AgendaForm.sbTasksRefreshClick(ClientiForm.AgendaForm.sbTasksRefresh);
  end;
end;

// Procedura che riempie l'array di Tasks ricevuto come parametro
//  NB: Usato per popolare la TableView della gestione dei tasks
//      su Levante
procedure GoogleTasks_LoadTaskRecordArray(var TRA: TTaskRecordArray);
begin
  GoogleTasks_InitAndConnect(DM1.DBAzienda);
  try
    // Rilancia sulla tessa procedure nella DLL
    GoogleTasks_TaskRecordArray_Load(TRA);
  finally
    // Disconnessione e pulizie finali
    GoogleTasks_Disconnect;
  end;
end;



{ TGoogleTasks_Task }

// Procedure che ritorna i valori del Task desiderato
procedure TGoogleTasks_Task.LoadByID(TaskID: String; TaskListID: String = '');
var
  Loc_ID, Loc_ListID, Loc_Title, Loc_Notes, Loc_Position, Loc_ParentID, Loc_ListTitle: String;
  Loc_DueDate, Loc_Updated: TDateTime;
  Loc_Completed, Loc_Hidden, Loc_Deleted: Boolean;
begin
  // Inizializzazione
  Loc_ID      := TaskID;
  Loc_ListID  := TaskListID;
  // Connessione
  GoogleTasks_InitAndConnect(DM1.DBAzienda);
  try
    // Carica i dati dell'oggetto dal server in alcune variabili locali
    //  NB: Se mettevo direttamente le proprietà dell'iggetto mi dava errore
    GoogleTasks_GetTaskData(Loc_ID, Loc_ListID, Loc_Title, Loc_Notes, Loc_DueDate, Loc_Completed, Loc_Hidden, Loc_Deleted, Loc_Updated, Loc_Position, Loc_ParentID, Loc_ListTitle);
    // Carica le proprietà reali dell'oggetto
    Self.fID         := Loc_ID;
    Self.fListID     := Loc_ListID;
    Self.fListID_Old := Loc_ListID;
    Self.fTitle      := Loc_Title;
    Self.fNotes      := Loc_Notes;
    Self.fDueDate    := Loc_DueDate;
    Self.fCompleted  := Loc_Completed;
    Self.fHidden     := Loc_Hidden;
    Self.fDeleted    := Loc_Deleted;
    Self.fUpdated    := Loc_Updated;
    Self.fPosition   := Loc_Position;
    Self.fParentID   := Loc_ParentID;
    Self.fListTitle  := Loc_ListTitle;
  finally
    // Disconnessione e pulizie finali
    GoogleTasks_Disconnect;
  end;
end;

// Procedure che ritorna i valori del Task desiderato cercandolo con il Master_ID
procedure TGoogleTasks_Task.LoadByMaster_ID(Master_ID:Integer);
var
  Loc_ID, Loc_ListID, Loc_Title, Loc_Notes, Loc_Position, Loc_ParentID, Loc_ListTitle: String;
  Loc_DueDate, Loc_Updated: TDateTime;
  Loc_Completed, Loc_Hidden, Loc_Deleted: Boolean;
begin
  // Connessione
  GoogleTasks_InitAndConnect(DM1.DBAzienda);
  try
    // Carica i dati dell'oggetto dal server in alcune variabili locali
    //  NB: Se mettevo direttamente le proprietà dell'oggetto mi dava errore
    GoogleTasks_GetTaskDataByMaster_ID(Master_ID, Loc_ID, Loc_ListID, Loc_Title, Loc_Notes, Loc_DueDate, Loc_Completed, Loc_Hidden, Loc_Deleted, Loc_Updated, Loc_Position, Loc_ParentID, Loc_ListTitle);
    // Carica le proprietà reali dell'oggetto
    Self.fID         := Loc_ID;
    Self.fListID     := Loc_ListID;
    Self.fListID_Old := Loc_ListID;
    Self.fTitle      := Loc_Title;
    Self.fNotes      := Loc_Notes;
    Self.fDueDate    := Loc_DueDate;
    Self.fCompleted  := Loc_Completed;
    Self.fHidden     := Loc_Hidden;
    Self.fDeleted    := Loc_Deleted;
    Self.fUpdated    := Loc_Updated;
    Self.fPosition   := Loc_Position;
    Self.fParentID   := Loc_ParentID;
    Self.fListTitle  := Loc_ListTitle;
  finally
    // Disconnessione e pulizie finali
    GoogleTasks_Disconnect;
  end;
end;





// Function che Crea o Modifica il Task e ne ritorna l'ID (Nel caso sia un nuovo Task oppure uno esistente che ha cambiato ID ad esempio perchè è stato spostato in un'altra Lista)
function TGoogleTasks_Task.Store: String;
begin
  // Connessione
  GoogleTasks_InitAndConnect(DM1.DBAzienda);
  try
    // Salva i dati del Task e imposta il valore da ritornare (è l'ID che potrebbe essere cambiato)
    Self.ID := GoogleTasks_SetTaskData(ID, ListID_Old, ListID, Title, Notes, DueDate, Completed);
    Result := Self.ID;
    // Se è stato specificato un componente DB e anche il Master_ID di un impegno
    //  a cui il Task fa riferimento provvede a creare sull'apposita tabella il record
    //  di riferimento reciproco tra le due entità
    if Assigned(Self.DB) and (Self.Impegni_Master_ID <> 0) then begin
      Self.Impegno_Ref_Store;
    end;
  finally
    // Disconnessione e pulizie finali
    GoogleTasks_Disconnect;
  end;
end;

// Funcrion come la "Store" ma che in più esegue il salvataggio solo se i dati ricevuti sono diversi dagli attuali
function TGoogleTasks_Task.StoreIfChanged(Title_New, Notes_New: String; DueDate_New: TDateTime; Completed_New: Boolean; ListID_New: String): String;
begin
  // Verifica se i dati sono cambiati e se sono cambiati
  //  esegue lo store sul server
  if (Title_New     <> Title)
  or (Notes_New     <> Notes)
  or (DueDate_New   <> DueDate)
  or (Completed_New <> Completed)
  or (ListID_New    <> ListID)
  then begin
    // Assegna i nuovi valori
    Title     := Title_New;
    Notes     := Notes_New;
    DueDate   := DueDate_New;
    Completed := Completed_New;
    ListID    := ListID_New;
    // Esedgue lo store e assegna il valore da ritornare
    Result := Self.Store;
  end;
end;

// Procedure che salva il riferimento incrociato tra l'impegno e il Task
//  specificati.
procedure TGoogleTasks_Task.Impegno_Ref_Store;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.IB_Connection := Self.DB;
    Qry.SQL.Add('EXECUTE PROCEDURE TASK_IMPEGNO_REF_STORE(' + IntToStr(Self.Impegni_Master_ID) + ',' + QuotedStr(Self.ID) + ',' + QuotedStr(Self.ListID) + ')');
    Qry.ExecSQL;
  finally
    Qry.Free;
  end;
end;

end.
