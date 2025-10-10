unit iORM.TextBuilder;

interface

uses
  System.SysUtils,

  iORM.CommonTypes,
  iORM.TextBuilder.Interfaces

  ;


type
  TioTextBuilder = class(TInterfacedObject, IioTextBuilder)
  private
    FIndentation: TioIndentation;
    FStringBuilder: TStringBuilder;
    function GetText: string;
    function GetIndentationText: string;
  public
    constructor Create(const AIndentation: TioIndentation); reintroduce; overload;
    constructor Create(const AIndentationWidth: integer); overload; virtual;
    destructor Destroy; override;

    // Add the text witout indentation and carriage return
    function Add(const AText: string; const Indent: boolean = false): IioTextBuilder;
    // Add the text with indentation and carriage return
    function AddLine(const AText: string): IioTextBuilder;
    function AddEmptyLine: IioTextBuilder;
    // Decrement indentation level
    function DecIndent(const ADecrement: integer = 1): IioTextBuilder;
    // Increment indentation level
    function IncIndent(const AIncrement: integer = 1): IioTextBuilder;
    // Add indentation chars to the text
    function Indent: IioTextBuilder;

    property Text: string read GetText;
  end;



implementation

{ TioTextBuilder }

function TioTextBuilder.Add(const AText: string; const Indent: boolean): IioTextBuilder;
begin
  if Indent then
    FStringBuilder.Append(Format('%s%s', [GetIndentationText, AText]))
  else
    FStringBuilder.Append(AText);

  Result := Self;
end;

function TioTextBuilder.AddEmptyLine: IioTextBuilder;
begin
  FStringBuilder.AppendLine;
  Result := Self;
end;

function TioTextBuilder.AddLine(const AText: string): IioTextBuilder;
begin
  FStringBuilder.AppendLine(Format('%s%s', [GetIndentationText, AText]));
  Result := Self;
end;

constructor TioTextBuilder.Create(const AIndentation: TioIndentation);
begin
  inherited Create;

  FIndentation := AIndentation;
  FStringBuilder := TStringBuilder.Create;
end;

constructor TioTextBuilder.Create(const AIndentationWidth: integer);
begin
  Create(TioIndentation.Create(AIndentationWidth));
end;

function TioTextBuilder.DecIndent(const ADecrement: integer = 1): IioTextBuilder;
begin
  FIndentation.DecIndent(ADecrement);
  Result := Self;
end;

destructor TioTextBuilder.Destroy;
begin
  FStringBuilder.Free;

  inherited;
end;

function TioTextBuilder.GetIndentationText: string;
begin
  Result := StringOfChar(' ', FIndentation.CurrentLevel * FIndentation.Width);
end;

function TioTextBuilder.GetText: string;
begin
  Result := FStringBuilder.ToString;
end;

function TioTextBuilder.IncIndent(const AIncrement: integer = 1): IioTextBuilder;
begin
  FIndentation.IncIndent(AIncrement);
  Result := Self;
end;

function TioTextBuilder.Indent: IioTextBuilder;
begin
  FStringBuilder.Append(GetIndentationText);
  Result := Self;
end;

end.
