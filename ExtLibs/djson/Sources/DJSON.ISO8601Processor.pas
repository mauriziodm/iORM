unit DJSON.ISO8601Processor;

interface

type

  PdjISO8601Processor = ^TdjISO8601Processor;
  TdjISO8601Processor = record
  const
    StdTimePrefix: String = 'T';
    StdDateSeparator: String = '-';
    StdTimeSeparator: String = ':';
    StdMillisecSeparator: String = '.';
    StdMillisec: boolean = True;
    StdSeconds: boolean = True;
    StdTimeZoneIgnore: boolean = True;  // For ISOToDateTime use only
    StdTimeZonePrefix: string = '';
    StdTimeZoneSeparator: String = ':';
    StdZulu: string = 'Z';
  private
    FTimePrefix: String;
    procedure SetTimePrefix(const Value: String);
    function PosTimePrefix: Byte;
    function PosMillisec: Byte;
    function TimeLengthWithoutMillisec: Byte;
    function IsTimePrefixPresent(const AInputDateTime:String): Boolean;
    function StandardSettings: Boolean;
    // Pre-Processor
    function PreProcessInputDate(const AInputDate:String): String;
    function PreProcessInputTime(const AInputTime:String): String;
    function PreProcessInputTimeZone(const AInputTimeZone:String): String;
    procedure PreProcessSplitDateAndTime(const AValue:String; out OutDate, OutTime: String);
    procedure PreProcessSplitTimeAndTimeZone(AValue:String; out OutTime, OutTimeZone: String);
    procedure PreProcessSplitAll(AValue:String; out OutDate, OutTime, OutTimeZone: String);
    // Post-Processor
    function PostProcessOutputDate(const AOutputDate:String): String;
    function PostProcessOutputTime(AOutputTime:String): String;
    function PostProcessOutputTimeZone(const AOutputTimeZone:String): String;
    procedure PostProcessSplitAll(AValue:String; out OutDate, OutTime, OutTimeZone: String);
  public
    UTCTime: Boolean;
    DateSeparator: String;
    TimeSeparator: String;
    MillisecSeparator: String;
    Millisec: boolean;
    Seconds: boolean;
    TimeZoneIgnore: boolean;
    TimeZonePrefix: string;
    TimeZoneSeparator: String;
    Zulu: string;
    property TimePrefix:String read FTimePrefix write SetTimePrefix;
    procedure ResetToDefault;
    function FromISO8601ToDateTime(const AISODateTime: string): TDateTime;
    function FromISO8601ToDate(const AISODate: string): TDate;
    function FromISO8601ToTime(const AISOTime: string): TTime;
    function FromDateTimeToISO8601(const ADateTime: TDateTime): string;
    function FromDateToISO8601(const ADate: TDate): string;
    function FromTimeToISO8601(const ATime: TTime): string;
  end;

implementation

uses
  System.SysUtils, System.DateUtils;

{ TdjISO8601Params }

procedure TdjISO8601Processor.SetTimePrefix(const Value: String);
begin
  // Null char is not allowed
  if Value.IsEmpty then
    FTimePrefix := ' '
  else
    FTimePrefix := Value;
end;

function TdjISO8601Processor.StandardSettings: Boolean;
begin
  Result := (FTimePrefix = StdTimePrefix)
    and (DateSeparator = StdDateSeparator)
    and (TimeSeparator = StdTimeSeparator)
    and (MillisecSeparator = StdMillisecSeparator)
    and (Seconds = StdSeconds)
    and (Millisec = StdMillisec)
    and (TimeZonePrefix = StdTimeZonePrefix)
    and (TimeZoneSeparator = StdTimeZoneSeparator)
    and (Zulu = StdZulu);
end;

function TdjISO8601Processor.TimeLengthWithoutMillisec: Byte;
begin
  Result := 4 + TimeSeparator.Length;
  if Seconds then
    Result := Result + 2 + TimeSeparator.Length;
end;

{ TdjISO8601Params }

function TdjISO8601Processor.FromDateTimeToISO8601(const ADateTime: TDateTime): string;
var
  LDate, LTime, LTimeZone: String;
begin
  Result := DateToISO8601(ADateTime, UTCTime);
  // Split all parts
  PostProcessSplitAll(Result, LDate, LTime, LTimeZone);
  // Construct the result
  if LTimeZone.IsEmpty then
    Result := LDate + TimePrefix + LTime + Zulu
  else
    Result := LDate + TimePrefix + LTime + TimeZonePrefix + LTimeZone;
end;

function TdjISO8601Processor.FromDateToISO8601(const ADate: TDate): string;
var
  LDate, LTime, LTimeZone: String;
begin
  Result := DateToISO8601(ADate, True);
  // Split all parts
  PostProcessSplitAll(Result, LDate, LTime, LTimeZone);
  // ProstProcess
  Result := LDate;
end;

function TdjISO8601Processor.FromISO8601ToDate(const AISODate: string): TDate;
var
  LDate, LTime: String;
begin
  // Pre-process (only the date part)
  PreProcessSplitDateAndTime(AISODate, LDate, LTime);
  // Convert the real ISO 8601 value to Delphi TDateTime
  Result := ISO8601ToDate(LDate, True);
end;

function TdjISO8601Processor.FromISO8601ToDateTime(const AISODateTime: string): TDateTime;
var
  LDate, LTime, LTimeZone: String;
begin
  // Pre-process
  PreProcessSplitAll(AISODateTime, LDate, LTime, LTimeZone);
  if not LTime.IsEmpty then
  begin
    LDate := LDate + StdTimePrefix + LTime;
    if LTimeZone.IsEmpty then
      LDate := LDate + StdZulu
    else
      LDate := LDate + StdTimeZonePrefix + LTimeZone;
  end;
  // Convert the real ISO 8601 value to Delphi TDateTime
  Result := ISO8601ToDate(LDate, UTCTime);
end;

function TdjISO8601Processor.FromISO8601ToTime(const AISOTime: string): TTime;
var
  LDate, LTime, LTimeZone: String;
begin
  // Pre-process
  //  NB: Le funzioni di conversione standard del formato ISO8601 presenti
  //       in Delphi non accettano come input la sola aprte dell'orario
  //       quindi se la parte Data è assente ne crea una "dummy" per poter procedere.
  if IsTimePrefixPresent(AISOTime) then
    PreProcessSplitAll(AISOTime, LDate, LTime, LTimeZone)
  else
    PreProcessSplitTimeAndTimeZone(AISOTime, LTime, LTimeZone);
  LDate := '1970-10-22';  // Dummy date
  if not LTime.IsEmpty then
  begin
    LDate := LDate + StdTimePrefix + LTime;
    if LTimeZone.IsEmpty then
      LDate := LDate + StdZulu
    else
      LDate := LDate + StdTimeZonePrefix + LTimeZone;
  end;
  // Convert the real ISO 8601 value to Delphi TDateTime
  Result := Frac(ISO8601ToDate(LDate, UTCTime));
end;

function TdjISO8601Processor.FromTimeToISO8601(const ATime: TTime): string;
var
  LDate, LTime, LTimeZone: String;
begin
  Result := DateToISO8601(ATime, UTCTime);
  // Split all parts
  PostProcessSplitAll(Result, LDate, LTime, LTimeZone);
  // Construct the result
  if LTimeZone.IsEmpty then
    Result := LTime + Zulu
  else
    Result := LTime + TimeZonePrefix + LTimeZone;
end;

procedure TdjISO8601Processor.ResetToDefault;
begin
  // Set default values
  UTCTime := True;
  FTimePrefix := StdTimePrefix;
  DateSeparator := StdDateSeparator;
  TimeSeparator := StdTimeSeparator;
  MillisecSeparator := StdMillisecSeparator;
  Millisec := StdMillisec;
  Seconds := StdSeconds;
  TimeZoneIgnore := StdTimeZoneIgnore;
  TimeZonePrefix := StdTimeZonePrefix;
  TimeZoneSeparator := StdTimeZoneSeparator;
  Zulu := StdZulu;
end;

function TdjISO8601Processor.IsTimePrefixPresent(
  const AInputDateTime:String): Boolean;
begin
  Result := (AInputDateTime.Length > PosTimePrefix)
    and (AInputDateTime.Substring(PosTimePrefix, TimePrefix.Length) = TimePrefix);
end;

function TdjISO8601Processor.PosTimePrefix: Byte;
begin
  Result := 8 + (DateSeparator.Length * 2);
end;

function TdjISO8601Processor.PostProcessOutputDate(const AOutputDate: String): String;
begin
  if StandardSettings then
    Result := AOutputDate
  else
    Result := AOutputDate.Replace(StdDateSeparator, DateSeparator);
end;

function TdjISO8601Processor.PostProcessOutputTime(AOutputTime: String): String;
const
  HOUR_POS = 0;
  MIN_POS = 3;
  SEC_POS = 6;
  MSEC_POS = 9;
var
  LHour, LMin, LSec, LMillisec: String;
begin
  // Exclude the final "Z" char
  if AOutputTime.EndsWith(StdZulu) then
    AOutputTime := AOutputTime.Remove(AOutputTime.Length-1);
  // If StandardaSettings is True then exit
  if StandardSettings then
    Exit(AOutputTime);
  // Extract all the parts
  LHour := AOutputTime.Substring(HOUR_POS, 2);
  LMin := AOutputTime.Substring(MIN_POS, 2);
  LSec := AOutputTime.Substring(SEC_POS, 2);
  LMillisec := AOutputTime.Substring(MSEC_POS, 3);
  // Construct the result value
  Result := LHour + TimeSeparator + LMin;
  if Seconds then
  begin
    Result := Result + TimeSeparator + LSec;
    if Millisec then
      Result := Result + MillisecSeparator + LMillisec;
  end;
end;

function TdjISO8601Processor.PostProcessOutputTimeZone(
  const AOutputTimeZone: String): String;
begin
  if StandardSettings then
    Result := AOutputTimeZone
  else
    Result := AOutputTimeZone.Replace(StdTimeZoneSeparator, TimeZoneSeparator);
end;

procedure TdjISO8601Processor.PostProcessSplitAll(AValue: String; out OutDate,
  OutTime, OutTimeZone: String);
var
  LTimeZonePrefixPos: Integer;
  LSplitted: TArray<string>;
begin
  // Split Date & Time
  LSplitted := AValue.Split([StdTimePrefix], 2);
  OutDate := LSplitted[0];
  if Length(LSplitted) > 1 then  // Questa condizione è perchè se riceveva una stringa con la sola parte Data dava dei problemi
    OutTime := LSplitted[1]
  else
    OutTime := '';
  // Split Time & TimeZone
  LTimeZonePrefixPos := OutTime.LastIndexOfAny(['+','-']);
  if LTimeZonePrefixPos <> -1 then
  begin
    OutTimeZone := OutTime.Substring(LTimeZonePrefixPos);
    OutTime := OutTime.Substring(0, LTimeZonePrefixPos);
  end
  else
    OutTimeZone := '';
  // PostProcess the parts
  OutDate := PostProcessOutputDate(OutDate);
  OutTime := PostProcessOutputTime(OutTime);
  OutTimeZone := PostProcessOutputTimeZone(OutTimeZone);
end;

function TdjISO8601Processor.PosMillisec: Byte;
begin
  Result := TimeLengthWithoutMillisec + MillisecSeparator.Length;
end;

function TdjISO8601Processor.PreProcessInputDate(const AInputDate: String): String;
begin
  // Questa funzione sistema la data ricevuta in modo che sia trattabile
  //  dalle funzioni ISO8601 di Delphi.
  //  NB: Ho notato che se la data non ha alcun separatore va bene ugualmente
  //       mentre se il separatore c'è ma è diverso dal carattere '-' allora
  //       questo deve essere convertito con il separatore standard ('-' appunto)
  //       altrimenti si solleva una eccezione.
  Result := AInputDate;
  if (DateSeparator.Length > 0) and (DateSeparator <> StdDateSeparator) then
    Result := AInputDate.Replace(DateSeparator, StdDateSeparator);
end;

function TdjISO8601Processor.PreProcessInputTime(const AInputTime: String): String;
begin
  // Questa funzione sistema l'orario ricevuto in modo che sia trattabile
  //  dalle funzioni ISO8601 di Delphi.
  //  NB: Ho notato che se l'orario non ha alcun separatore va bene ugualmente
  //       mentre se il separatore c'è ma è diverso dal carattere ':' allora
  //       questo deve essere convertito con il separatore standard (':' appunto)
  //       altrimenti si solleva una eccezione.
  //       Invece per quanto riguarda il separatore dei millisecondi questi è
  //       obbligatorio altrimenti le funzioni ISO8601 sollevano una eccezione,
  //       per questo anche se il carattere di separazione dei millisecondi
  //       è nullo (#0) lo rimpiazza cmq con il separatore standard ('.').
  // ---------------------------------------------------------------------------
  // Extract the Time without milliseconds
  Result := AInputTime.Substring(0, TimeLengthWithoutMillisec);
  if (TimeSeparator.Length > 0) and (TimeSeparator <> StdTimeSeparator) then
    Result := Result.Replace(TimeSeparator, StdTimeSeparator);
  // Add the milliseconds if presents adding the std separator
  if Length(AInputTime) > PosMillisec then
    Result := Result + MillisecSeparator + AInputTime.Substring(PosMillisec, 3);
end;

function TdjISO8601Processor.PreProcessInputTimeZone(
  const AInputTimeZone: String): String;
var
  I: Integer;
begin
  // Questa funzione sistema il fuso orario ricevuto in modo che sia trattabile
  //  dalle funzioni ISO8601 di Delphi.
  //  NB: Ho notato che il fuso orario deve obbligatoriamente avere i separatore
  //       ':' altrimenti si solleva una eccezione,
  //       se il separatore c'è ma è diverso dal carattere ':' allora
  //       questo deve essere convertito con il separatore standard (':' appunto)
  //       altrimenti si solleva una eccezione.
  // ---------------------------------------------------------------------------
  Result := AInputTimeZone;
  // Se il TimeZoneSeparator è vuoto allora lo aggiunge
  //  considera che il primo carattere è sempre "+" oppure "-"
  if TimeZoneSeparator.IsEmpty then
  begin
    // Get the + or - and the hours
    Result := AInputTimeZone.Substring(0,3);
    // Gte the others
    I := 3;
    while AInputTimeZone.Length >= I do
    begin
      Result := Result + StdTimeZoneSeparator + AInputTimeZone.Substring(I,2);
      Inc(I, 2);
    end;
  end
  // Se invece il TimeZoneSeparator non è vuoto allora
  else
  if TimeZoneSeparator <> StdTimeZoneSeparator then
    Result := Result.Replace(TimeZoneSeparator, StdTimeZoneSeparator);
end;

procedure TdjISO8601Processor.PreProcessSplitAll(AValue: String; out OutDate,
  OutTime, OutTimeZone: String);
var
  LTime: String;
begin
  PreProcessSplitDateAndTime(AValue, OutDate, LTime);
  PreProcessSplitTimeAndTimeZone(LTime, OutTime, OutTimeZone);
end;

procedure TdjISO8601Processor.PreProcessSplitDateAndTime(const AValue: String; out OutDate,
  OutTime: String);
var
  LSplitted: TArray<string>;
begin
  LSplitted := AValue.Split([TimePrefix], 2);
  OutDate := LSplitted[0];
  if Length(LSplitted) > 1 then  // Questa condizione è perchè se riceveva una stringa con la sola parte Data dava dei problemi
    OutTime := LSplitted[1]
  else
    OutTime := '';
  // PreProcess the Date part only
  if not OutDate.IsEmpty then
    OutDate := PreProcessInputDate(OutDate);
end;

procedure TdjISO8601Processor.PreProcessSplitTimeAndTimeZone(AValue: String;
  out OutTime, OutTimeZone: String);
var
  LTimeZoneSeparatorPos: Integer;
begin
  // Se c'è il TimePrefix allora considera solo parte a DX di esso
  if IsTimePrefixPresent(AValue) then
    AValue := AValue.Substring(PosTimePrefix + TimePrefix.Length);
  // Individua l'eventuale "+" oppure "-" che segnano l'inizio del TimeZone
  LTimeZoneSeparatorPos := AValue.LastIndexOfAny(['+','-']);
  // Se TimeZone non è proprio possibile oppure è possibile ma non presente,
  //  non deve essere preso in considerazione allora ritorna tutto come Time ed esce
  if (not TimeZoneIgnore) or (LTimeZoneSeparatorPos = -1) then
  begin
    OutTime := AValue;
    OutTimeZone := '';
  end
  else
  begin
    // Se presente elimina il TimeZonePrefix
    if not TimeZonePrefix.IsEmpty then
      AValue := AValue.Replace(TimeZonePrefix, StdTimeZonePrefix);
    // Individua di nuovo l'eventuale "+" oppure "-" che segnano l'inizio del TimeZone
    //  se ha dovuto eliminare l'eventuale TimeZonePrefix la posizione è cambiata.
    LTimeZoneSeparatorPos := AValue.LastIndexOfAny(['+','-']);
    // Ritorna i valori
    OutTime := AValue.Substring(0, LTimeZoneSeparatorPos);
    OutTimeZone := AValue.Substring(LTimeZoneSeparatorPos);
  end;
  // PreProcess the values
  if not OutTime.IsEmpty then
    OutTime := PreProcessInputTime(OutTime);
  if not OutTimeZone.IsEmpty then
    OutTimeZone := PreProcessInputTimeZone(OutTimeZone);
end;

end.
