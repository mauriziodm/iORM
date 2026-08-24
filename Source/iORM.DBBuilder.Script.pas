unit iORM.DBBuilder.Script;

interface

uses
  System.Classes,

  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Factory,
  iORM.DB.Consts

  ;

const
  SCRIPT_SEPARATOR_LENGTH = 79; // Per allineamento con i warnings
  SCRIPT_INDENTATION_WIDTH = 4;
  SCRIPT_INDENTATION_CHAR = ' ';

type
  TioDBBuilderSqlText = class(TInterfacedObject, IioDBBuilderSqlText)
  strict private
    FAddLinePrefix: String;
    FIndentLevel: Integer;
    FLines: TStringList;
    function Add(const AText: String): IioDBBuilderSqlText;      // Append inline to last line
    function AddComment(const AText: String): IioDBBuilderSqlText;
    function AddEmpty: IioDBBuilderSqlText;
    function AddLine(const AText: string): IioDBBuilderSqlText;
    function AddSeparator: IioDBBuilderSqlText;
    function AddTitle(const AText: String): IioDBBuilderSqlText;
    procedure Clear;
    function DecIndent: IioDBBuilderSqlText;
    function GetIndentationChars: string;
    function GetIsEmpty: Boolean;
    function GetLines: TStringList;
    function GetText: string;
    function IncIndent: IioDBBuilderSqlText;
  protected
  public
    constructor Create(const AAddLinePrefix: String);
    destructor Destroy; override;
  end;

  TioDBBuilderScript = class(TInterfacedObject, IioDBBuilderScript)
  strict private
    FBody: IioDBBuilderSqlText;
    FConnectionDefName: string;
    FFooter: IioDBBuilderSqlText;
    FFullScript: TStringList;
    FHeader: IioDBBuilderSqlText;
    FHints: IioDBBuilderSqlText;
    FPlan: IioDBBuilderSqlText;
    FPlanRenderMode: TioDBBuilderPlanRenderMode;
    FWarnings: IioDBBuilderSqlText;

    // Full script clear
    procedure Clear;
    function GetBody: IioDBBuilderSqlText;
    function GetFooter: IioDBBuilderSqlText;
    function GetHeader: IioDBBuilderSqlText;
    function GetHints: IioDBBuilderSqlText;
    function GetLines: TStringList;
    function GetPlan: IioDBBuilderSqlText;
    function GetPlanRenderMode: TioDBBuilderPlanRenderMode;
    function GetWarnings: IioDBBuilderSqlText;
    procedure SaveToFile(const AFileName: string);
    // This method works on header section
    procedure ScriptBegin(const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode);
    // This method works on footer section
    procedure ScriptEnd;
    procedure SetPlanRenderMode(const AValue: TioDBBuilderPlanRenderMode);
  protected
  public
    constructor Create(const AConnectionDefName: string);
    destructor Destroy; override;
  end;




implementation

uses
  System.SysUtils

  ;


{ TioDBBuilderSqlText }

constructor TioDBBuilderSqlText.Create(const AAddLinePrefix: String);
begin
  inherited Create;
  FAddLinePrefix := AAddLinePrefix;
  FIndentLevel := 0;
  FLines := TStringList.Create;
end;

destructor TioDBBuilderSqlText.Destroy;
begin
  FLines.Free;
  inherited;
end;

// Getters for properties
function TioDBBuilderSqlText.GetIsEmpty: Boolean;
begin
  Result := FLines.Count = 0;
end;

function TioDBBuilderSqlText.GetLines: TStringList;
begin
  Result := FLines;
end;

function TioDBBuilderSqlText.GetText: string;
begin
  Result := FLines.Text;
end;

// Helper method for indentation
function TioDBBuilderSqlText.GetIndentationChars: string;
begin
  Result := StringOfChar(SCRIPT_INDENTATION_CHAR, FIndentLevel * SCRIPT_INDENTATION_WIDTH);
end;

// Add() - Append inline to last line (no newline, no indent)
function TioDBBuilderSqlText.Add(const AText: String): IioDBBuilderSqlText;
var
  LLastIndex: Integer;
begin
  LLastIndex := FLines.Count - 1;
  if LLastIndex >= 0 then
    FLines[LLastIndex] := FLines[LLastIndex] + AText
  else
    FLines.Add(AText);
  Result := Self;
end;

// AddLine() - Add new line with indentation and optional prefix
function TioDBBuilderSqlText.AddLine(const AText: string): IioDBBuilderSqlText;
begin
  FLines.Add(FAddLinePrefix + GetIndentationChars + AText);
  Result := Self;
end;

// AddEmpty() - Add empty line
function TioDBBuilderSqlText.AddEmpty: IioDBBuilderSqlText;
begin
  FLines.Add('');
  Result := Self;
end;

// IncIndent() - Increment indentation level (fluent)
function TioDBBuilderSqlText.IncIndent: IioDBBuilderSqlText;
begin
  Inc(FIndentLevel);
  Result := Self;
end;

// DecIndent() - Decrement indentation level (fluent)
function TioDBBuilderSqlText.DecIndent: IioDBBuilderSqlText;
begin
  if FIndentLevel > 0 then
    Dec(FIndentLevel)
  else
    FIndentLevel := 0;

  Result := Self;
end;

// AddComment() - Add SQL comment line
function TioDBBuilderSqlText.AddComment(const AText: String): IioDBBuilderSqlText;
begin
  FLines.Add('-- ' + AText);
  Result := Self;
end;

// AddSeparator() - Add separator line
function TioDBBuilderSqlText.AddSeparator: IioDBBuilderSqlText;
begin
  FLines.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
  Result := Self;
end;

// AddTitle() - Add title with separators
function TioDBBuilderSqlText.AddTitle(const AText: String): IioDBBuilderSqlText;
begin
  AddEmpty;
  AddSeparator;
  AddComment(AText);
  AddSeparator;
  AddEmpty;
  Result := Self;
end;

// Clear - Non-fluent method
procedure TioDBBuilderSqlText.Clear;
begin
  FLines.Clear;
end;

{ TioDBBuilderScript }

procedure TioDBBuilderScript.Clear;
begin
  FHeader.Clear;
  FPlan.Clear;
  FWarnings.Clear;
  FHints.Clear;
  FBody.Clear;
  FFooter.Clear;
end;

constructor TioDBBuilderScript.Create(const AConnectionDefName: string);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
  FFullScript := TStringList.Create;
  FHeader := TioDBBuilderFactory.NewSqlText;
  FPlan := TioDBBuilderFactory.NewSqlText;
  FPlanRenderMode := prmSmart;
  FWarnings := TioDBBuilderFactory.NewSqlText('WARNING: ');
  FHints := TioDBBuilderFactory.NewSqlText('Hint: ');
  FBody := TioDBBuilderFactory.NewSqlText;
  FFooter := TioDBBuilderFactory.NewSqlText;
end;

destructor TioDBBuilderScript.Destroy;
begin
  FFullScript.Free;

  inherited;
end;

function TioDBBuilderScript.GetFooter: IioDBBuilderSqlText;
begin
  Result := FFooter;
end;

function TioDBBuilderScript.GetHeader: IioDBBuilderSqlText;
begin
  Result := FHeader;
end;

function TioDBBuilderScript.GetBody: IioDBBuilderSqlText;
begin
  Result := FBody;
end;

function TioDBBuilderScript.GetHints: IioDBBuilderSqlText;
begin
  Result := FHints;
end;

function TioDBBuilderScript.GetPlan: IioDBBuilderSqlText;
begin
  Result := FPlan;
end;

function TioDBBuilderScript.GetPlanRenderMode: TioDBBuilderPlanRenderMode;
begin
  Result := FPlanRenderMode;
end;

function TioDBBuilderScript.GetWarnings: IioDBBuilderSqlText;
begin
  Result := FWarnings;
end;

function TioDBBuilderScript.GetLines: TStringList;
var
  LLine: string;
begin
  FFullScript.Clear;
  FFullScript.AddStrings(FHeader.Lines);

  // Add plan section with title. Unlike warnings/hints below, FPlan's lines are already full SQL
  // comments (populated via AddComment, not AddLine) so they are added as-is, with no extra '-- ' prefix.
  if not FPlan.IsEmpty then
  begin
    FFullScript.Add('');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('-- P L A N');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('');
    FFullScript.AddStrings(FPlan.Lines);
    FFullScript.Add('');
  end;

  // Add warnings section with title
  if not FWarnings.IsEmpty then
  begin
    FFullScript.Add('');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('-- W A R N I N G S !!!        W A R N I N G S !!!        W A R N I N G S !!!');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('');
    // Emit each warning as a SQL comment line: the script stays human-readable AND
    // safely (re)executable, since the script runner strips lines starting with '--'
    // (see iORM.DB.Script.LoadScriptAndCleanFromComments). Warnings/Hints must NEVER
    // reach the DBMS as SQL text.
    for LLine in FWarnings.Lines do
      FFullScript.Add('-- ' + LLine);
    FFullScript.Add('');
  end;

  // Add hints section with title
  if not FHints.IsEmpty then
  begin
    FFullScript.Add('');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('-- H I N T S');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('');
    // Same as warnings above: hints are informational and must not be executed as SQL.
    for LLine in FHints.Lines do
      FFullScript.Add('-- ' + LLine);
    FFullScript.Add('');
  end;

  FFullScript.AddStrings(FBody.Lines);
  FFullScript.AddStrings(FFooter.Lines);

  Result := FFullScript;
end;

procedure TioDBBuilderScript.SaveToFile(const AFileName: string);
begin
  GetLines.SaveToFile(AFileName);
end;

procedure TioDBBuilderScript.ScriptBegin(const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode);

  // Dialect-free, human-readable label for the header - mirrors the rendering style of
  // IioDBBuilderPlanOperation.Description (Plan.pas).
  function IndexesAndFKModeToLabel(const AMode: TioDBBuilderIndexesAndFKMode): String;
  begin
    case AMode of
      ifmDisabled:      Result := 'Disabled';
      ifmEnabled:       Result := 'Enabled';
      ifmEnabledStrict: Result := 'Enabled (strict)';
    else
      Result := '';
    end;
  end;

  function PlanRenderModeToLabel(const AMode: TioDBBuilderPlanRenderMode): String;
  begin
    case AMode of
      prmDisabled: Result := 'Disabled';
      prmSmart:    Result := 'Smart';
      prmFull:     Result := 'Full';
    else
      Result := '';
    end;
  end;

begin
  FHeader.AddSeparator;
  FHeader.AddComment('Start of the script generated by iORM');
  FHeader.AddSeparator;
  FHeader.AddComment('Date - time....: ' + FormatDateTime('d mmm yyyy - hh:nn:ss', Now));
  FHeader.AddComment('Connection name: ' + FConnectionDefName);
  FHeader.AddComment('DBMS...........: ' + ARDBMSInfo.ToString);
  FHeader.AddComment('Indexes mode......: ' + IndexesAndFKModeToLabel(AIndexesMode));
  FHeader.AddComment('Foreign keys mode.: ' + IndexesAndFKModeToLabel(AForeignKeysMode));
  FHeader.AddComment('Plan render mode..: ' + PlanRenderModeToLabel(FPlanRenderMode));
  FHeader.AddSeparator;
end;

procedure TioDBBuilderScript.ScriptEnd;
begin
  FFooter.AddSeparator;
  FFooter.AddComment('End of the script generated by iORM');
  FFooter.AddSeparator;
end;

procedure TioDBBuilderScript.SetPlanRenderMode(const AValue: TioDBBuilderPlanRenderMode);
begin
  FPlanRenderMode := AValue;
end;

end.
