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
  private
    FIndentLevel: Integer;
    FLines: TStringList;
    FAddLinePrefix: String;
    function GetLines: TStringList;
    function GetText: string;
    function GetIndentationChars: string;
  public
    constructor Create(const AAddLinePrefix: String);
    destructor Destroy; override;

    procedure Clear;

    // Fluent interface methods (return Self)
    function Add(const AText: String): IioDBBuilderSqlText; virtual;      // Append inline to last line
    function AddComment(const AText: String): IioDBBuilderSqlText; virtual;
    function AddLine(const AText: string): IioDBBuilderSqlText; virtual;
    function AddEmpty: IioDBBuilderSqlText;
    function AddSeparator: IioDBBuilderSqlText; virtual;
    function AddTitle(const AText: String): IioDBBuilderSqlText; virtual;
    function DecIndent: IioDBBuilderSqlText;
    function IncIndent: IioDBBuilderSqlText;

    // Properties
    property Lines: TStringList read GetLines;
    property Text: string read GetText;
  end;

  TioDBBuilderSqlScript = class(TInterfacedObject, IioDBBuilderSqlScript)
  private
    FConnectionDefName: string;
    FFullScript: TStringList;
    FScriptBody: IioDBBuilderSqlText;
    FScriptFooter: IioDBBuilderSqlText;
    FScriptHeader: IioDBBuilderSqlText;
    FScriptHints: IioDBBuilderSqlText;
    FScriptWarnings: IioDBBuilderSqlText;

    function GetBody: IioDBBuilderSqlText;
    function GetFooter: IioDBBuilderSqlText;
    function GetHeader: IioDBBuilderSqlText;
    function GetHints: IioDBBuilderSqlText;
    function GetLines: TStringList;
    function GetWarnings: IioDBBuilderSqlText;
  public
    constructor Create(const AConnectionDefName: string);
    destructor Destroy; override;

    // Full script clear
    procedure Clear;
    procedure Execute;
    procedure SaveToFile(const AFileName: string);
    // This method works on header section
    procedure ScriptBegin(const AConnectionDefName: string; const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo); virtual;
    // This method works on footer section
    procedure ScriptEnd; virtual;

    property Body: IioDBBuilderSqlText read GetBody;
    property Footer: IioDBBuilderSqlText read GetFooter;
    property Header: IioDBBuilderSqlText read GetHeader;
    property Hints: IioDBBuilderSqlText read GetHints;
    property Lines: TStringList read GetLines;
    property Warnings: IioDBBuilderSqlText read GetWarnings;
  end;




implementation

uses
  System.SysUtils,

  iORM.DB.ConnectionContainer,
  iORM.DB.Factory

  ;


{ TioDBBuilderSqlText }

constructor TioDBBuilderSqlText.Create(const AAddLinePrefix: String);
begin
  inherited Create;
  FIndentLevel := 0;
  FLines := TStringList.Create;
  FAddLinePrefix := AAddLinePrefix;
end;

destructor TioDBBuilderSqlText.Destroy;
begin
  FLines.Free;
  inherited;
end;

// Getters for properties
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

{ TioDBBuilderSqlScript }

procedure TioDBBuilderSqlScript.Clear;
begin
  Header.Clear;
  Warnings.Clear;
  Hints.Clear;
  Body.Clear;
  Footer.Clear;
end;

constructor TioDBBuilderSqlScript.Create(const AConnectionDefName: string);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
  FFullScript := TStringList.Create;
  FScriptHeader := TioDBBuilderFactory.NewSqlText;
  FScriptWarnings := TioDBBuilderFactory.NewSqlText('WARNING: ');
  FScriptHints := TioDBBuilderFactory.NewSqlText('Hint: ');
  FScriptBody := TioDBBuilderFactory.NewSqlText;
  FScriptFooter := TioDBBuilderFactory.NewSqlText;
end;

destructor TioDBBuilderSqlScript.Destroy;
begin
  FFullScript.Free;

  inherited;
end;

function TioDBBuilderSqlScript.GetFooter: IioDBBuilderSqlText;
begin
  Result := FScriptFooter;
end;

function TioDBBuilderSqlScript.GetHeader: IioDBBuilderSqlText;
begin
  Result := FScriptHeader;
end;

function TioDBBuilderSqlScript.GetBody: IioDBBuilderSqlText;
begin
  Result := FScriptBody;
end;

function TioDBBuilderSqlScript.GetHints: IioDBBuilderSqlText;
begin
  Result := FScriptHints;
end;

function TioDBBuilderSqlScript.GetWarnings: IioDBBuilderSqlText;
begin
  Result := FScriptWarnings;
end;

function TioDBBuilderSqlScript.GetLines: TStringList;
begin
  FFullScript.Clear;
  FFullScript.AddStrings(FScriptHeader.Lines);

  // Add warnings section with title
  if FScriptWarnings.Lines.Count > 0 then
  begin
    FFullScript.Add('');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('-- W A R N I N G S !!!        W A R N I N G S !!!        W A R N I N G S !!!');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('');
    FFullScript.AddStrings(FScriptWarnings.Lines);
    FFullScript.Add('');
  end;

  // Add hints section with title
  if FScriptHints.Lines.Count > 0 then
  begin
    FFullScript.Add('');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('-- H I N T S');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('');
    FFullScript.AddStrings(FScriptHints.Lines);
    FFullScript.Add('');
  end;

  FFullScript.AddStrings(FScriptBody.Lines);
  FFullScript.AddStrings(FScriptFooter.Lines);

  Result := FFullScript;
end;

procedure TioDBBuilderSqlScript.Execute;
begin
  TioDBFactory.Script(FConnectionDefName, Lines).Execute;
end;

procedure TioDBBuilderSqlScript.SaveToFile(const AFileName: string);
begin
  Lines.SaveToFile(AFileName);
end;

procedure TioDBBuilderSqlScript.ScriptBegin(const AConnectionDefName: string; const ARDBMSInfo: IioDBBuilderSchemaRDBMSInfo);
begin
  Header.AddSeparator;
  Header.AddComment('Start of the script generated by iORM');
  Header.AddSeparator;
  Header.AddComment('Date - time....: ' + FormatDateTime('d mmm yyyy - hh:nn:ss', Now));
  Header.AddComment('Connection name: ' + AConnectionDefName);
  Header.AddComment('DBMS...........: ' + ARDBMSInfo.ToString);
  Header.AddSeparator;
end;

procedure TioDBBuilderSqlScript.ScriptEnd;
begin
  Footer.AddSeparator;
  Footer.AddComment('End of the script generated by iORM');
  Footer.AddSeparator;
end;

end.
