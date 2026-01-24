unit iORM.DBBuilder.SqlScript.Base;

interface

uses
  System.Classes,

  iORM.DBBuilder.Interfaces,
  iORM.DB.Consts

  ;

const
  SCRIPT_SEPARATOR_LENGTH = 79; // Per allineamento con i warnings
  SCRIPT_INDENTATION_WIDTH = 4;

type
  TioDBBuilderSqlText = class(TInterfacedObject, IioDBBuilderSqlText)
  private
    FIndentLevel: Integer;
    FText: TStringList;
    function GetSQL: TStringList;
    function GetText: string;
    function GetIndentationChars: string;
  public
    constructor Create;
    destructor Destroy; override;

    // Fluent interface methods (return Self)
    function Add(const AText: String): IioDBBuilderSqlText; virtual;      // Append inline to last line
    function AddLine(const AText: string): IioDBBuilderSqlText; virtual;  // New line with indent
    function AddEmpty: IioDBBuilderSqlText;
    function IncIndent(const AIncrement: integer = 1): IioDBBuilderSqlText;
    function DecIndent(const ADecrement: integer = 1): IioDBBuilderSqlText;

    // Specialized methods (return Self for fluent)
    function AddComment(const AText: String): IioDBBuilderSqlText; virtual;
    function AddSeparator: IioDBBuilderSqlText; virtual;
    function AddTitle(const AText: String): IioDBBuilderSqlText; virtual;

    // Non-fluent methods
    procedure Clear;

    // Backwards compatibility (deprecated, use IncIndent/DecIndent instead)
    procedure IncIndentationLevel;
    procedure DecIndentationLevel;

    // Properties
    property SQL: TStringList read GetSQL;
    property Text: string read GetText;
  end;

  // Specialized section that automatically prepends "WARNING: " to all added text
  TioDBBuilderSqlTextWarnings = class(TioDBBuilderSqlText)
  public
    function AddLine(const AText: String): IioDBBuilderSqlText; override;
  end;

  // Specialized section that automatically prepends "Hint: " to all added text
  TioDBBuilderSqlTextHints = class(TioDBBuilderSqlText)
  public
    function AddLine(const AText: String): IioDBBuilderSqlText; override;
  end;

  TioDBBuilderSqlScript = class(TInterfacedObject, IioDBBuilderSqlScript)
  private
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
    function GetSQL: TStringList;
    function GetWarnings: IioDBBuilderSqlText;
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

    property Body: IioDBBuilderSqlText read GetBody;
    property Footer: IioDBBuilderSqlText read GetFooter;
    property Header: IioDBBuilderSqlText read GetHeader;
    property Hints: IioDBBuilderSqlText read GetHints;
    property SQL: TStringList read GetSQL;
    property Warnings: IioDBBuilderSqlText read GetWarnings;
  end;





implementation

uses
  System.SysUtils,

  iORM.DB.ConnectionContainer

  ;


{ TioDBBuilderSqlText }

constructor TioDBBuilderSqlText.Create;
begin
  inherited Create;
  FIndentLevel := 0;
  FText := TStringList.Create;
end;

destructor TioDBBuilderSqlText.Destroy;
begin
  FText.Free;
  inherited;
end;

// Getters for properties
function TioDBBuilderSqlText.GetSQL: TStringList;
begin
  Result := FText;
end;

function TioDBBuilderSqlText.GetText: string;
begin
  Result := FText.Text;
end;

// Helper method for indentation
function TioDBBuilderSqlText.GetIndentationChars: string;
begin
  Result := StringOfChar(' ', FIndentLevel * SCRIPT_INDENTATION_WIDTH);
end;

// Add() - Append inline to last line (no newline, no indent)
function TioDBBuilderSqlText.Add(const AText: String): IioDBBuilderSqlText;
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
function TioDBBuilderSqlText.AddLine(const AText: string): IioDBBuilderSqlText;
begin
  FText.Add(GetIndentationChars + AText);
  Result := Self;
end;

// AddEmpty() - Add empty line
function TioDBBuilderSqlText.AddEmpty: IioDBBuilderSqlText;
begin
  FText.Add('');
  Result := Self;
end;

// IncIndent() - Increment indentation level (fluent)
function TioDBBuilderSqlText.IncIndent(const AIncrement: integer): IioDBBuilderSqlText;
begin
  Inc(FIndentLevel, AIncrement);
  Result := Self;
end;

// DecIndent() - Decrement indentation level (fluent)
function TioDBBuilderSqlText.DecIndent(const ADecrement: integer): IioDBBuilderSqlText;
begin
  if FIndentLevel - ADecrement >= 0 then
    Dec(FIndentLevel, ADecrement)
  else
    FIndentLevel := 0;
  Result := Self;
end;

// AddComment() - Add SQL comment line
function TioDBBuilderSqlText.AddComment(const AText: String): IioDBBuilderSqlText;
begin
  FText.Add('-- ' + AText);
  Result := Self;
end;

// AddSeparator() - Add separator line
function TioDBBuilderSqlText.AddSeparator: IioDBBuilderSqlText;
begin
  FText.Add(StringOfChar('-', SCRIPT_SEPARATOR_LENGTH));
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
  FText.Clear;
end;

// Backwards compatibility (deprecated)
procedure TioDBBuilderSqlText.IncIndentationLevel;
begin
  IncIndent(1);
end;

procedure TioDBBuilderSqlText.DecIndentationLevel;
begin
  DecIndent(1);
end;

{ TioDBBuilderSqlTextWarnings }

function TioDBBuilderSqlTextWarnings.AddLine(const AText: String): IioDBBuilderSqlText;
begin
  FText.Add('WARNING: ' + AText);
  Result := Self;
end;

{ TioDBBuilderSqlTextHints }

function TioDBBuilderSqlTextHints.AddLine(const AText: String): IioDBBuilderSqlText;
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
  FScriptHeader := TioDBBuilderSqlText.Create;
  FScriptWarnings := TioDBBuilderSqlTextWarnings.Create;
  FScriptHints := TioDBBuilderSqlTextHints.Create;
  FScriptBody := TioDBBuilderSqlText.Create;
  FScriptFooter := TioDBBuilderSqlText.Create;
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
