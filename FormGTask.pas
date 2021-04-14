unit FormGTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxMemo, cxControls, cxContainer, cxEdit, cxTextEdit,
  StdCtrls, Buttons, UnitGoogleTasks, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCheckBox, dxGDIPlusClasses, cxImage, cxListBox, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TGTaskForm = class(TForm)
    Shape1: TShape;
    LabelTitle: TLabel;
    eTaskTitle: TcxTextEdit;
    eTaskNotes: TcxMemo;
    btnOK: TBitBtn;
    eTaskDueDate: TcxDateEdit;
    eTaskCompleted: TcxCheckBox;
    btnAnnulla: TBitBtn;
    cxImage1: TcxImage;
    eTaskList: TcxComboBox;
    eTaskListID: TcxListBox;
    TimerAutoClose: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure eTaskListPropertiesInitPopup(Sender: TObject);
    procedure eTaskListPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure TimerAutoCloseTimer(Sender: TObject);
  private
    { Private declarations }
    fTask: TGoogleTasks_Task;
    fInvisible: Boolean;
    procedure SaveDataToTaskIfChanged;
  protected
    { Protected declaration }
  public
    { Public declarations }
    property Task:TGoogleTasks_Task read fTask write fTask;
    // Proprietà che se impostata a True visualizza la form fuori dalla vista e conferma
    //  automaticamente
    property Invisible:Boolean read fInvisible write fInvisible;

    procedure Prepare;
  end;

var
  GTaskForm: TGTaskForm;

implementation

uses DataModule1, FormWait, DateUtils, SchedaClienti, cxSplitter;

{$R *.dfm}


// Procedure che esegue il "Prepare" della Form prima di poter essere visualizzata
procedure TGTaskForm.Prepare;
begin
  // Se in questo punto il TaskID è vuoto significa che dobbiamo
  //  creare un nuovo Task
  if (Task.ID <> '') then begin
    try
      // Se è stato impostato il Master_ID usa quello per caricare il Task
      //  altrimenti  usa il TaskID sempre se è stato specificato
      //  altrimenti esce senza fare nulla
      if     (Task.Impegni_Master_ID <> 0) then Task.LoadByMaster_ID(Task.Impegni_Master_ID)
      else if( Task.ID <> '')              then Task.LoadByID(Task.ID, Task.ListID)
      else Exit;
    except
      DM1.Messaggi('Levante', 'Mi dispiace, non sono riuscito a trovare il Task desiderato.'#13#13'Probabilmente è stato eliminato.'#13#13'Ne ricreo uno nuovo.', '', [mbOk], 0, nil);
      // Azzera il TaskID e il TaskListID altrimenti ha dei problemi a crearne uno nuovo
      Task.ID     := '';
      Task.ListID := '';
      // Esce
      Exit;
    end;
  end;
  // Carica i dati sulla form
  //  NB: Solo se è stato trovato un Task pre-esistente altrimenti lo stiamo
  //       creando nuovo e i dati a video sono già impostati, altrimenti
  //       se carico i dati del Task (che non c'è in quanto non è stato
  //       trovato mi azzererebbe i valori di default):
  if Task.ID <> '' then begin
    Self.eTaskTitle.Text        := Task.Title;
    Self.eTaskNotes.Text        := Task.Notes;
    Self.eTaskCompleted.Checked := Task.Completed;
    Self.eTaskList.Text         := Task.ListTitle;
    Self.eTaskDueDate.Date      := Task.DueDate;
    if Self.eTaskDueDate.Date = 0 then Self.eTaskDueDate.Clear;   // Altrimenti mi si vede la data corrispondente a 0
  end;
end;

// Function che si occupa di salvare i dati a video nell'oggetto Task.
procedure TGTaskForm.SaveDataToTaskIfChanged;
var
  NewDueDate: TDateTime;
begin
  // ALtrimenti c'erano problemi quando la data era vuota
  if VarIsNull(eTaskDueDate.EditValue)
    then NewDueDate := 0
    else NewDueDate := DateOf(eTaskDueDate.Date);
  // Se i dati sono cambiati aggiorna l'oggetto ed
  //  esegue lo store su GoogleTasks.
  Task.StoreIfChanged(eTaskTitle.Text, eTaskNotes.Text, NewDueDate, eTaskCompleted.Checked, Task.ListID);
end;


procedure TGTaskForm.FormCreate(Sender: TObject);
begin
  // Inizializzazione
  Self.Width  := 550;
  Self.Height := 550;
  // Crea il Task
  Task := TGoogleTasks_Task.Create;
end;

procedure TGTaskForm.FormDestroy(Sender: TObject);
begin
  // Distrugge il Task
  Task.Free;
end;

procedure TGTaskForm.FormShow(Sender: TObject);
begin
  Prepare;
  btnOK.SetFocus;
  if Invisible then begin
    Self.Left   := 0;
    Self.Top    := 0;
    Self.Width  := 5;
    Self.Height := 5;
    Self.Update;
    TimerAutoClose.Enabled := True;
  end;
end;

procedure TGTaskForm.btnOKClick(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Sto comunicando con Google Tasks...');
  try
    // Altrimenti la WaitForm rimaneva sotto e non si vedeva
    WaitForm.BringToFront;
    WaitForm.Update;
    // Esegue lo store del Task se i dati sono cambiati
    SaveDataToTaskIfChanged;
    // Chiude la form
    Self.Close;
    // Se i Tasks laterali sono visibili allora li aggiorna
    if (ClientiForm.AgendaForm <> nil) and (ClientiForm.AgendaForm.Splitter.State = ssOpened) and (ClientiForm.AgendaForm.MainPageControl.ActivePage = ClientiForm.AgendaForm.TabTasks) then begin
      ClientiForm.AgendaForm.sbTasksRefreshClick(ClientiForm.AgendaForm.sbTasksRefresh);
    end;
  finally
    DM1.CloseWait;
  end;
end;

procedure TGTaskForm.eTaskListPropertiesInitPopup(Sender: TObject);
begin
  // Se ci sono già delle voci non sta a ricaricarle di nuovo
  if (Sender as TcxComboBox).Properties.Items.Count > 0 then Exit;

  DM1.ShowWait('Levante', 'Sto comunicando con Google Tasks...');
  try
    // Altrimenti la WaitForm rimaneva sotto e non si vedeva
    WaitForm.BringToFront;
    WaitForm.Update;
    // Carica le liste delle liste
    GoogleTasks_LoadListsTitleAndID(eTaskList.Properties.Items, eTaskListID.Items);
  finally
    DM1.CloseWait;
  end;
end;

procedure TGTaskForm.eTaskListPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  // Sincronizza anche la selezione della ListBox relatica agli ID delle liste
  //  con la selezione fatta.
  Task.ListID := eTaskListID.Items[eTaskList.ItemIndex];
end;

procedure TGTaskForm.TimerAutoCloseTimer(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Sto comunicando con Google Tasks...');
  try try
    TimerAutoClose.Enabled := False;
    btnOKClick(btnOK);
  except
    DM1.Messaggi('Levante', 'Google Tasks'#13#13'C''è stato un problema durante la creazione del Task.'#13#13'NB: IL TASK NON E'' STATO CREATO!', '', [mbOK], 0, nil);
  end;
  finally
    DM1.CloseWait;
    Self.Close;
  end;
end;

end.
