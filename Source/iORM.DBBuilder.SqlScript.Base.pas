unit iORM.DBBuilder.SqlScript.Base;

interface

uses
  System.Classes,

  iORM.DBBuilder.Interfaces,
  iORM.CommonTypes,
  iORM.DB.Consts

  ;

const
  SCRIPT_SEPARATOR_LENGTH = 79; // Per allineamento con i warnings
  SCRIPT_INDENTATION_WIDTH = 4;

type
  TioDBBuilderScriptSection = class(TInterfacedObject, IioDBBuilderSqlScriptSection)
  private
    FIndentation: TioIndentation;
    FText: TStringList;
    function GetIndent: TioIndentation;
    function GetSQL: TStringList;
    function GetText: string;
  public
    constructor Create;
    destructor Destroy; override;

    // Fluent interface methods (return Self)
    function Add(const AText: String): IioDBBuilderSqlScriptSection; virtual;      // Append inline to last line
    function AddLine(const AText: string): IioDBBuilderSqlScriptSection; virtual;  // New line with indent
    function AddEmptyLine: IioDBBuilderSqlScriptSection;
    function IncIndent(const AIncrement: integer = 1): IioDBBuilderSqlScriptSection;
    function DecIndent(const ADecrement: integer = 1): IioDBBuilderSqlScriptSection;

    // Specialized methods (return Self for fluent)
    function AddComment(const AText: String): IioDBBuilderSqlScriptSection; virtual;
    function AddSeparator: IioDBBuilderSqlScriptSection; virtual;
    function AddTitle(const AText: String): IioDBBuilderSqlScriptSection; virtual;

    // Non-fluent methods
    procedure Clear;

    // Backwards compatibility (deprecated, use IncIndent/DecIndent instead)
    procedure IncIndentationLevel;
    procedure DecIndentationLevel;

    // Properties
    property Indent: TioIndentation read GetIndent;
    property SQL: TStringList read GetSQL;
    property Text: string read GetText;
  end;

  // Specialized section that automatically prepends "WARNING: " to all added text
  TioDBBuilderScriptSectionWarnings = class(TioDBBuilderScriptSection)
  public
    function AddLine(const AText: String): IioDBBuilderSqlScriptSection; override;
  end;

  // Specialized section that automatically prepends "Hint: " to all added text
  TioDBBuilderScriptSectionHints = class(TioDBBuilderScriptSection)
  public
    function AddLine(const AText: String): IioDBBuilderSqlScriptSection; override;
  end;

  TioDBBuilderSqlScript = class(TInterfacedObject, IioDBBuilderSqlScript)
  private
    FFullScript: TStringList;
    FScriptBody: IioDBBuilderSqlScriptSection;
    FScriptFooter: IioDBBuilderSqlScriptSection;
    FScriptHeader: IioDBBuilderSqlScriptSection;
    FScriptHints: IioDBBuilderSqlScriptSection;
    FScriptWarnings: IioDBBuilderSqlScriptSection;
    function GetBody: IioDBBuilderSqlScriptSection;
    function GetFooter: IioDBBuilderSqlScriptSection;
    function GetHeader: IioDBBuilderSqlScriptSection;
    function GetHints: IioDBBuilderSqlScriptSection;
    function GetSQL: TStringList;
    function GetWarnings: IioDBBuilderSqlScriptSection;
  public
    constructor Create;
    destructor Destroy; override;

    // Full script clear
    procedure Clear;
    procedure SaveToFile(const AFileName: string);
    // This method works on header section
    procedure ScriptBegin(const AConnectionDefName, ADriverID: string); virtual;
    // This method works on footer section
    procedure ScriptEnd; virtual;

    property Body: IioDBBuilderSqlScriptSection read GetBody;
    property Footer: IioDBBuilderSqlScriptSection read GetFooter;
    property Header: IioDBBuilderSqlScriptSection read GetHeader;
    property Hints: IioDBBuilderSqlScriptSection read GetHints;
    property SQL: TStringList read GetSQL;
    property Warnings: IioDBBuilderSqlScriptSection read GetWarnings;
  end;





implementation

uses
  System.SysUtils,

  iORM.DB.ConnectionContainer

  ;


{ TioDBBuilderScriptSection }

constructor TioDBBuilderScriptSection.Create;
begin
  inherited Create;
  FIndentation := TioIndentation.Create(SCRIPT_INDENTATION_WIDTH);
  FText := TStringList.Create;
end;

destructor TioDBBuilderScriptSection.Destroy;
begin
  FText.Free;
  inherited;
end;

// Getters for properties
function TioDBBuilderScriptSection.GetIndent: TioIndentation;
begin
  Result := FIndentation;
end;

function TioDBBuilderScriptSection.GetSQL: TStringList;
begin
  Result := FText;
end;

function TioDBBuilderScriptSection.GetText: string;
begin
  Result := FText.Text;
end;

// Add() - Append inline to last line (no newline, no indent)
function TioDBBuilderScriptSection.Add(const AText: String): IioDBBuilderSqlScriptSection;
var
  LLastIndex: Integer;
begin
  LLastIndex := FText.Count - 1;
  if LLastIndex >= 0 then
    FText[LLastIndex] := FText[LLastIndex] + AText
  else
    FText.Add(AText);
  Result := Self;
end;

// AddLine() - Add new line with indentation
function TioDBBuilderScriptSection.AddLine(const AText: string): IioDBBuilderSqlScriptSection;
begin
  FText.Add(FIndentation.IndentChars + AText);
  Result := Self;
end;

// AddEmptyLine() - Add empty line
function TioDBBuilderScriptSection.AddEmptyLine: IioDBBuilderSqlScriptSection;
begin
  FText.Add('');
  Result := Self;
end;

// IncIndent() - Increment indentation level (fluent)
function TioDBBuilderScriptSection.IncIndent(const AIncrement: integer): IioDBBuilderSqlScriptSection;
begin
  FIndentation.IncIndent(AIncrement);
  Result := Self;
end;

// DecIndent() - Decrement indentation level (fluent)
function TioDBBuilderScriptSection.DecIndent(const ADecrement: integer): IioDBBuilderSqlScriptSection;
begin
  FIndentation.DecIndent(ADecrement);
  Result := Self;
end;

// AddComment() - Add SQL comment line
function TioDBBuilderScriptSection.AddComment(const AText: String): IioDBBuilderSqlScriptSection;
begin
  FText.Add('-- ' + AText);
  Result := Self;
end;

// AddSeparator() - Add separator line
function TioDBBuilderScriptSection.AddSeparator: IioDBBuilderSqlScriptSection;
begin
  FText.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
  Result := Self;
end;

// AddTitle() - Add title with separators
function TioDBBuilderScriptSection.AddTitle(const AText: String): IioDBBuilderSqlScriptSection;
begin
  AddEmptyLine;
  AddSeparator;
  AddComment(AText);
  AddSeparator;
  AddEmptyLine;
  Result := Self;
end;

// Clear - Non-fluent method
procedure TioDBBuilderScriptSection.Clear;
begin
  FText.Clear;
end;

// Backwards compatibility (deprecated)
procedure TioDBBuilderScriptSection.IncIndentationLevel;
begin
  IncIndent(1);
end;

procedure TioDBBuilderScriptSection.DecIndentationLevel;
begin
  DecIndent(1);
end;

{ TioDBBuilderScriptSectionWarnings }

function TioDBBuilderScriptSectionWarnings.AddLine(const AText: String): IioDBBuilderSqlScriptSection;
begin
  FText.Add('WARNING: ' + AText);
  Result := Self;
end;

{ TioDBBuilderScriptSectionHints }

function TioDBBuilderScriptSectionHints.AddLine(const AText: String): IioDBBuilderSqlScriptSection;
begin
  FText.Add('Hint: ' + AText);
  Result := Self;
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

constructor TioDBBuilderSqlScript.Create;
begin
  inherited Create;

  FFullScript := TStringList.Create;
  FScriptHeader := TioDBBuilderScriptSection.Create;
  FScriptWarnings := TioDBBuilderScriptSectionWarnings.Create;
  FScriptHints := TioDBBuilderScriptSectionHints.Create;
  FScriptBody := TioDBBuilderScriptSection.Create;
  FScriptFooter := TioDBBuilderScriptSection.Create;
end;

destructor TioDBBuilderSqlScript.Destroy;
begin
  FFullScript.Free;

  inherited;
end;

function TioDBBuilderSqlScript.GetFooter: IioDBBuilderSqlScriptSection;
begin
  Result := FScriptFooter;
end;

function TioDBBuilderSqlScript.GetHeader: IioDBBuilderSqlScriptSection;
begin
  Result := FScriptHeader;
end;

function TioDBBuilderSqlScript.GetBody: IioDBBuilderSqlScriptSection;
begin
  Result := FScriptBody;
end;

function TioDBBuilderSqlScript.GetHints: IioDBBuilderSqlScriptSection;
begin
  Result := FScriptHints;
end;

function TioDBBuilderSqlScript.GetWarnings: IioDBBuilderSqlScriptSection;
begin
  Result := FScriptWarnings;
end;

function TioDBBuilderSqlScript.GetSQL: TStringList;
begin
  FFullScript.Clear;
  FFullScript.AddStrings(FScriptHeader.SQL);

  // Add warnings section with title
  if FScriptWarnings.SQL.Count > 0 then
  begin
    FFullScript.Add('');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('-- W A R N I N G S !!!        W A R N I N G S !!!        W A R N I N G S !!!');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('');
    FFullScript.AddStrings(FScriptWarnings.SQL);
    FFullScript.Add('');
  end;

  // Add hints section with title
  if FScriptHints.SQL.Count > 0 then
  begin
    FFullScript.Add('');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('-- H I N T S');
    FFullScript.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
    FFullScript.Add('');
    FFullScript.AddStrings(FScriptHints.SQL);
    FFullScript.Add('');
  end;

  FFullScript.AddStrings(FScriptBody.SQL);
  FFullScript.AddStrings(FScriptFooter.SQL);

  Result := FFullScript;
end;

procedure TioDBBuilderSqlScript.SaveToFile(const AFileName: string);
begin
  SQL.SaveToFile(AFileName);
end;

procedure TioDBBuilderSqlScript.ScriptBegin(const AConnectionDefName, ADriverID: string);
begin
  Header.AddSeparator;
  Header.AddComment('Start of the script generated by iORM');
  Header.AddSeparator;
  Header.AddComment('Date - time....: ' + FormatDateTime('d mmm yyyy - hh:nn:ss', Now));
  Header.AddComment('Connection name: ' + AConnectionDefName);
  Header.AddComment('DBMS...........: ' + ADriverID);
  Header.AddSeparator;
end;

procedure TioDBBuilderSqlScript.ScriptEnd;
begin
  Footer.AddSeparator;
  Footer.AddComment('End of the script generated by iORM');
  Footer.AddSeparator;
end;

end.
