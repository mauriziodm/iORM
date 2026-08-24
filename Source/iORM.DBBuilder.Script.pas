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
    FWarnings: IioDBBuilderSqlText;

    // Full script clear
    procedure Clear;
    function GetBody: IioDBBuilderSqlText;
    function GetFooter: IioDBBuilderSqlText;
    function GetHeader: IioDBBuilderSqlText;
    function GetHints: IioDBBuilderSqlText;
    function GetLines: TStringList;
    function GetPlan: IioDBBuilderSqlText;
    function GetWarnings: IioDBBuilderSqlText;
    procedure SaveToFile(const AFileName: string);
    // This method works on header section
    procedure ScriptBegin(const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
      const AIndexesMode, AForeignKeysMode, APlanRenderMode: TioDBBuilderMode);
    // This method works on footer section
    procedure ScriptEnd;
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

function TioDBBuilderScript.GetWarnings: IioDBBuilderSqlText;
begin
  Result := FWarnings;
end;

function TioDBBuilderScript.GetLines: TStringList;

  // Renders one optional section (PLAN/WARNINGS/HINTS) as "<title-band>" + content + trailing blank
  // line, reusing AddTitle/AddComment instead of hand-building separators/prefixes. AContent's lines
  // (populated elsewhere via AddLine, e.g. FPlan/FWarnings/FHints) are plain text: the '--' comment
  // prefix is applied here, uniformly, because it's this section - the one turning content into a
  // SQL script - that knows the script runner strips lines starting with '--' (see
  // iORM.DB.Script.LoadScriptAndCleanFromComments) and PLAN/WARNINGS/HINTS must NEVER reach the DBMS
  // as executable SQL text. Upstream producers (e.g. TioDBBuilderPlan.Render) stay unaware of this.
  procedure AddSection(const ATitle: String; const AContent: IioDBBuilderSqlText);
  var
    LSection: IioDBBuilderSqlText;
    LLine: string;
  begin
    if AContent.IsEmpty then
      Exit;
    LSection := TioDBBuilderFactory.NewSqlText;
    LSection.AddTitle(ATitle);
    for LLine in AContent.Lines do
      LSection.AddComment(LLine);
    LSection.AddEmpty;
    FFullScript.AddStrings(LSection.Lines);
  end;

begin
  FFullScript.Clear;
  FFullScript.AddStrings(FHeader.Lines);

  AddSection('P L A N', FPlan);
  AddSection('W A R N I N G S !!!        W A R N I N G S !!!        W A R N I N G S !!!', FWarnings);
  AddSection('H I N T S', FHints);

  FFullScript.AddStrings(FBody.Lines);
  FFullScript.AddStrings(FFooter.Lines);

  Result := FFullScript;
end;

procedure TioDBBuilderScript.SaveToFile(const AFileName: string);
begin
  GetLines.SaveToFile(AFileName);
end;

procedure TioDBBuilderScript.ScriptBegin(const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
  const AIndexesMode, AForeignKeysMode, APlanRenderMode: TioDBBuilderMode);

  // Dialect-free, human-readable label for the header - mirrors the rendering style of
  // IioDBBuilderPlanOperation.Description (Plan.pas).
  function IndexesAndFKModeToLabel(const AMode: TioDBBuilderMode): String;
  begin
    case AMode of
      ifmDisabled:      Result := 'Disabled';
      ifmEnabled:       Result := 'Enabled';
      ifmEnabledStrict: Result := 'Enabled (strict)';
    else
      Result := '';
    end;
  end;

  function PlanRenderModeToLabel(const AMode: TioDBBuilderMode): String;
  begin
    case AMode of
      ifmDisabled:      Result := 'Disabled';
      ifmEnabled:       Result := 'Smart';
      ifmEnabledStrict: Result := 'Full';
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
  FHeader.AddComment('Plan render mode..: ' + PlanRenderModeToLabel(APlanRenderMode));
  FHeader.AddSeparator;
end;

procedure TioDBBuilderScript.ScriptEnd;
begin
  FFooter.AddSeparator;
  FFooter.AddComment('End of the script generated by iORM');
  FFooter.AddSeparator;
end;

end.
