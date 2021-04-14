unit FormGEvent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxGDIPlusClasses, cxControls, cxContainer, cxEdit,
  cxImage, StdCtrls, Buttons, cxMemo, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, UnitGoogleCal, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TGEventForm = class(TForm)
    LabelTitle: TLabel;
    cxImage1: TcxImage;
    TimerAutoClose: TTimer;
    eEventTitle: TcxTextEdit;
    eEventStartTime: TcxDateEdit;
    Label1: TLabel;
    eEventEndTime: TcxDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    eEventAllDay: TcxCheckBox;
    eEventLocation: TcxTextEdit;
    Label4: TLabel;
    eEventDescription: TcxMemo;
    Label5: TLabel;
    btnAnnulla: TBitBtn;
    btnOK: TBitBtn;
    Shape1: TShape;
    eEventCalendar: TcxComboBox;
    eEventCalendarID: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eEventCalendarPropertiesInitPopup(Sender: TObject);
    procedure eEventCalendarPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure TimerAutoCloseTimer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    fGEvent: TGCal_Event;
    fInvisible: Boolean;
    procedure Prepare;
    procedure SaveDataToEventIfChanged;
    { Private declarations }
  public
    { Public declarations }
    property GEvent:TGCal_Event read fGEvent write fGEvent;
    // Proprietà che se impostata a True visualizza la form fuori dalla vista e conferma
    //  automaticamente
    property Invisible:Boolean read fInvisible write fInvisible;
  end;

var
  GEventForm: TGEventForm;

implementation

uses DataModule1, FormWait, SchedaClienti, cxSplitter;

{$R *.dfm}

procedure TGEventForm.FormCreate(Sender: TObject);
begin
  // Inizializzazione
  Self.Width  := 550;
  Self.Height := 550;
  // Crea il Task
  Gevent := TGCal_Event.Create;
end;

procedure TGEventForm.FormDestroy(Sender: TObject);
begin
  // Distrugge il Task
  GEvent.Free;
end;

procedure TGEventForm.FormShow(Sender: TObject);
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

// Procedure che esegue il "Prepare" della Form prima di poter essere visualizzata
procedure TGEventForm.Prepare;
begin
  // Se in questo punto il TaskID è vuoto significa che dobbiamo
  //  creare un nuovo Task
  if (GEvent.ID <> '') then begin
    try
      // Se è stato impostato il Master_ID usa quello per caricare il Task
      //  altrimenti  usa il TaskID sempre se è stato specificato
      //  altrimenti esce senza fare nulla
      if      (GEvent.Event_Master_ID <> 0) then GEvent.LoadByMaster_ID(GEvent.Event_Master_ID)
      else if (GEvent.ID <> '')             then GEvent.LoadByID(GEvent.ID, GEvent.CalendarID)
      else Exit;
    except
      DM1.Messaggi('Levante', 'Mi dispiace, non sono riuscito a trovare l''Evento desiderato.'#13#13'Probabilmente è stato eliminato.'#13#13'Ne ricreo uno nuovo.', '', [mbOk], 0, nil);
      // Azzera il TaskID e il TaskListID altrimenti ha dei problemi a crearne uno nuovo
      GEvent.ID         := '';
      GEvent.CalendarID := '';
      // A questo punto forza il CalendarID al valore impostato nel combo box relativo
      //  alla possibilità di scegliere appunto il CalendarID. In questo combobox è
      //  caricato il valore proveniente dal record della tabella IMPEGNI di Levante e
      //  non quello preso da GiigkeCalendar e questo mi risolve il problema che altrimenti
      //  non mi veniva impostato il Calendario corretto.
      Gevent.CalendarID := eEventCalendarID.Text; 
      // Esce
      Exit;
    end;
  end;

  // A questo punto forza il CalendarID al valore impostato nel combo box relativo
  //  alla possibilità di scegliere appunto il CalendarID. In questo combobox è
  //  caricato il valore proveniente dal record della tabella IMPEGNI di Levante e
  //  non quello preso da GiigkeCalendar e questo mi risolve il problema che altrimenti
  //  non mi veniva impostato il Calendario corretto.
  Gevent.CalendarID := eEventCalendarID.Text;

  // ---------------------------------------------------------------------------
  // NB: La parte qui sotto l'ho commentata perchè a differenza dei Tasks che una volta
  //     creati caricando i dati iniziali provenienti da Levante poi alle modifiche successive
  //     (su Levante) i dati (Title, Notes ecc) non vengono più aggiornati da Levante stesso
  //     e quindi poi il Task ha una vita propria, negli appuntamenti invece sono un
  //     tutt'uno con l'appuntamento di Levante e ne riflette sempre i valori.
  //     Quindi i dati presenti su Levante al momento hanno, in un certo senso, una priorità
  //     rispetto a quelli presenti su GoogleCalendar.
  {
  // Carica i dati sulla form
  //  NB: Solo se è stato trovato un Task pre-esistente altrimenti lo stiamo
  //       creando nuovo e i dati a video sono già impostati, altrimenti
  //       se carico i dati del Task (che non c'è in quanto non è stato
  //       trovato mi azzererebbe i valori di default):
  if GEvent.ID <> '' then begin
    Self.eEventTitle.Text         := GEvent.Title;
    Self.eEventDescription.Text   := GEvent.Description;
    Self.eEventLocation.Text      := GEvent.Location;
    Self.eEventAllDay.Checked     := GEvent.AllDay;
    Self.eEventCalendar.Text      := GEvent.CalendarTitle;

    Self.eEventStartTime.Date     := GEvent.StartTime;
    if Self.eEventStartTime.Date = 0 then Self.eEventStartTime.Clear;   // Altrimenti mi si vede la data corrispondente a 0

    Self.eEventEndTime.Date       := GEvent.EndTime;
    if Self.eEventEndTime.Date = 0 then Self.eEventEndTime.Clear;   // Altrimenti mi si vede la data corrispondente a 0
  end;
  }
end;


procedure TGEventForm.eEventCalendarPropertiesInitPopup(Sender: TObject);
begin
  // Se ci sono già delle voci non sta a ricaricarle di nuovo
  if (Sender as TcxComboBox).Properties.Items.Count > 0 then Exit;

  DM1.ShowWait('Levante', 'Sto comunicando con Google Calendar...');
  try
    // Altrimenti la WaitForm rimaneva sotto e non si vedeva
    WaitForm.BringToFront;
    WaitForm.Update;
    // Carica le liste delle liste
    GCal_LoadCalendarsTitleAndID(eEventCalendar.Properties.Items, eEventCalendarID.Properties.Items);
  finally
    DM1.CloseWait;
  end;
end;

procedure TGEventForm.eEventCalendarPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  // Sincronizza anche la selezione della ListBox relatica agli ID delle liste
  //  con la selezione fatta.
  GEvent.CalendarID := eEventCalendarID.Properties.Items[eEventCalendar.ItemIndex];
end;

procedure TGEventForm.TimerAutoCloseTimer(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Sto comunicando con Google Calendar...');
  try try
    TimerAutoClose.Enabled := False;
    btnOKClick(btnOK);
  except
    DM1.Messaggi('Levante', 'Google Calendar'#13#13'C''è stato un problema durante la creazione dell''evento .'#13#13'NB: L''EVENTO NON E'' STATO CREATO!', '', [mbOK], 0, nil);
  end;
  finally
    DM1.CloseWait;
    Self.Close;
  end;
end;

// Function che si occupa di salvare i dati a video nell'oggetto Task.
procedure TGEventForm.SaveDataToEventIfChanged;
var
  NewStartTime, NewEndTime: TDateTime;
begin
  // ALtrimenti c'erano problemi quando la data era vuota
  if VarIsNull(eEventStartTime.EditValue)
    then NewStartTime := 0
    else NewStartTime := eEventStartTime.Date;
  if VarIsNull(eEventEndTime.EditValue)
    then NewEndTime := 0
    else NewEndTime := eEventEndTime.Date;
  // Se i dati sono cambiati aggiorna l'oggetto ed
  //  esegue lo store su GoogleTasks.
  GEvent.StoreIfChanged(eEventTitle.Text, eEventDescription.Text, eEventLocation.Text, eEventAllDay.Checked, NewStartTime, NewEndTime, GEvent.CalendarID);
end;

procedure TGEventForm.btnOKClick(Sender: TObject);
begin
  DM1.ShowWait('Levante', 'Sto comunicando con Google Calendar...');
  try
    // Altrimenti la WaitForm rimaneva sotto e non si vedeva
    WaitForm.BringToFront;
    WaitForm.Update;
    // Esegue lo store del Task se i dati sono cambiati
    SaveDataToEventIfChanged;
    // Chiude la form
    Self.Close;
    // Se i Tasks laterali sono visibili allora li aggiorna
    if (ClientiForm.AgendaForm <> nil) and (ClientiForm.AgendaForm.Splitter.State = ssOpened) and (ClientiForm.AgendaForm.MainPageControl.ActivePage = ClientiForm.AgendaForm.TabAgenda) then begin
      ClientiForm.AgendaForm.sbAgenda_RefreshClick(ClientiForm.AgendaForm.sbAgenda_Refresh);
    end;
  finally
    DM1.CloseWait;
  end;
end;


end.
