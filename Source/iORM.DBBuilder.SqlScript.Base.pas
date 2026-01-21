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
    FSeparatorLength: integer;
    function GetSQL: TStringList;
    function GetCurrentIndentation: TioIndentation;
  protected
    function GetIndentation: String;
  public
    constructor Create(const AIndentationWidth: integer = SCRIPT_INDENTATION_WIDTH; const ASeparatorLength: integer = SCRIPT_SEPARATOR_LENGTH);
    destructor Destroy; override;

    procedure Add(const AText: String; const UseIndent: boolean = True); virtual;
    procedure AddComment(const AText: String); virtual;
    procedure AddEmpty; virtual;
    procedure AddSeparator; virtual;
    procedure AddTitle(const AText: String); virtual;
    procedure Clear;

    procedure DecIndentationLevel;
    procedure IncIndentationLevel;

    property CurrentIndentation: TioIndentation read GetCurrentIndentation;
    property SQL: TStringList read GetSQL;
  end;

  // Specialized section that automatically prepends "WARNING: " to all added text
  TioDBBuilderScriptSectionWarnings = class(TioDBBuilderScriptSection)
  public
    procedure Add(const AText: String; const UseIndent: boolean = True); override;
  end;

  // Specialized section that automatically prepends "Hint: " to all added text
  TioDBBuilderScriptSectionHints = class(TioDBBuilderScriptSection)
  public
    procedure Add(const AText: String; const UseIndent: boolean = True); override;
  end;

  TioDBBuilderSqlScript = class(TInterfacedObject, IioDBBuilderSqlScript)
  private
    FFullScript: TStringList;
    FScriptBody: IioDBBuilderSqlScriptSection;
    FScriptFooter: IioDBBuilderSqlScriptSection;
    FScriptHeader: IioDBBuilderSqlScriptSection;
    FScriptHints: IioDBBuilderSqlScriptSection;
    FScriptWarnings: IioDBBuilderSqlScriptSection;
    FSeparatorLength: integer;
    function GetBody: IioDBBuilderSqlScriptSection;
    function GetFooter: IioDBBuilderSqlScriptSection;
    function GetHeader: IioDBBuilderSqlScriptSection;
    function GetHints: IioDBBuilderSqlScriptSection;
    function GetSQL: TStringList;
    function GetWarnings: IioDBBuilderSqlScriptSection;
  public
    constructor Create(const AIndentationWidth: integer = SCRIPT_INDENTATION_WIDTH; const ASeparatorLength: integer = SCRIPT_SEPARATOR_LENGTH);
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

procedure TioDBBuilderScriptSection.Add(const AText: String; const UseIndent: boolean = True);
begin
  if UseIndent then
    FText.Add(GetIndentation + AText)
  else
    FText.Add(AText);
end;

procedure TioDBBuilderScriptSection.AddComment(const AText: String);
begin
  FText.Add('-- ' + AText);
end;

procedure TioDBBuilderScriptSection.AddEmpty;
begin
  FText.Add('');
end;

procedure TioDBBuilderScriptSection.AddSeparator;
begin
  FText.Add(StringOfChar('-', FSeparatorLength));
end;

procedure TioDBBuilderScriptSection.AddTitle(const AText: String);
begin
  AddEmpty;
  AddSeparator;
  AddComment(AText);
  AddSeparator;
  AddEmpty;
end;

procedure TioDBBuilderScriptSection.Clear;
begin
  FText.Clear;
end;

constructor TioDBBuilderScriptSection.Create(const AIndentationWidth: integer; const ASeparatorLength: integer);
begin
  inherited Create;

  FIndentation := TioIndentation.Create(AIndentationWidth);
  FSeparatorLength := ASeparatorLength;
  FText := TStringList.Create;
end;

procedure TioDBBuilderScriptSection.DecIndentationLevel;
begin
  FIndentation.DecIndent;
end;

destructor TioDBBuilderScriptSection.Destroy;
begin
  FText.Free;

  inherited;
end;

function TioDBBuilderScriptSection.GetCurrentIndentation: TioIndentation;
begin
  Result := FIndentation;
end;

function TioDBBuilderScriptSection.GetIndentation: String;
begin
  Result := FIndentation.IndentChars;
end;

function TioDBBuilderScriptSection.GetSQL: TStringList;
begin
  Result := FText;
end;

procedure TioDBBuilderScriptSection.IncIndentationLevel;
begin
  FIndentation.IncIndent;
end;

{ TioDBBuilderScriptSectionWarnings }

procedure TioDBBuilderScriptSectionWarnings.Add(const AText: String; const UseIndent: boolean);
begin
  inherited Add('WARNING: ' + AText, UseIndent);
end;

{ TioDBBuilderScriptSectionHints }

procedure TioDBBuilderScriptSectionHints.Add(const AText: String; const UseIndent: boolean);
begin
  inherited Add('Hint: ' + AText, UseIndent);
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

constructor TioDBBuilderSqlScript.Create(const AIndentationWidth, ASeparatorLength: integer);
begin
  inherited Create;

  FFullScript := TStringList.Create;
  FSeparatorLength := ASeparatorLength;
  FScriptHeader := TioDBBuilderScriptSection.Create(AIndentationWidth, ASeparatorLength);
  FScriptWarnings := TioDBBuilderScriptSectionWarnings.Create(AIndentationWidth, ASeparatorLength);
  FScriptHints := TioDBBuilderScriptSectionHints.Create(AIndentationWidth, ASeparatorLength);
  FScriptBody := TioDBBuilderScriptSection.Create(AIndentationWidth, ASeparatorLength);
  FScriptFooter := TioDBBuilderScriptSection.Create(AIndentationWidth, ASeparatorLength);
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
    FFullScript.Add(StringOfChar('-', FSeparatorLength));
    FFullScript.Add('-- W A R N I N G S !!!        W A R N I N G S !!!        W A R N I N G S !!!');
    FFullScript.Add(StringOfChar('-', FSeparatorLength));
    FFullScript.Add('');
    FFullScript.AddStrings(FScriptWarnings.SQL);
    FFullScript.Add('');
  end;

  // Add hints section with title
  if FScriptHints.SQL.Count > 0 then
  begin
    FFullScript.Add('');
    FFullScript.Add(StringOfChar('-', FSeparatorLength));
    FFullScript.Add('-- H I N T S');
    FFullScript.Add(StringOfChar('-', FSeparatorLength));
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
