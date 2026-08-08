unit iORM.DBBuilder.Schema.Index;

interface

uses
  System.Rtti,

  iORM.Attributes,
  iORM.CommonTypes,
  iORM.DBBuilder.Interfaces;

type

  TioDBBuilderSchemaIndex = class(TInterfacedObject, IioDBBuilderSchemaIndex)
  private
    FChanges: TioDBBuilderIndexChanges;
    FCommaSepFieldList: String;
    FConnectionDefName: String;
    FHasExplicitName: boolean;
    FName: String;
    FOrientation: TioIndexOrientation;
    FStatus: TioDBBuilderStatus;
    FUnique: Boolean;
    function GetChanges: TioDBBuilderIndexChanges;
    function GetCommaSepFieldList: String;
    function GetHasExplicitName: boolean;
    function GetName: String;
    function GetOrientation: TioIndexOrientation;
    function GetSqlCommaSepFieldList: String;
    function GetSqlName: String;
    function GetStatus: TioDBBuilderStatus;
    function GetUnique: Boolean;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    constructor Create(const AIndexAttr: ioIndex; const AConnectionDefName: String);
    procedure AddChange(const AChange: TioDBBuilderIndexChange);

    property Changes: TioDBBuilderIndexChanges read GetChanges;
    property CommaSepFieldList: String read GetCommaSepFieldList;
    property HasExplicitName: boolean read GetHasExplicitName;
    property Name: String read GetName;
    property Orientation: TioIndexOrientation read GetOrientation;
    property SqlCommaSepFieldList: String read GetSqlCommaSepFieldList;
    property SqlName: String read GetSqlName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    property Unique: Boolean read GetUnique;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes,
  iORM.Exceptions,
  iORM.DB.Factory;


{ TioDBBuilderSchemaIndex }

procedure TioDBBuilderSchemaIndex.AddChange(const AChange: TioDBBuilderIndexChange);
begin
  Include(FChanges, AChange);
end;

constructor TioDBBuilderSchemaIndex.Create(const AIndexAttr: ioIndex; const AConnectionDefName: String);
begin
  inherited Create;

  if AIndexAttr.CommaSepFieldList.IsEmpty then
    raise EioDBBuilderException.Create(Self.ClassName, 'Create', 'Cannot create index: no fields list specified.');

  FStatus := stClean;
  FConnectionDefName := AConnectionDefName;
  FHasExplicitName := AIndexAttr.HasExplicitName;
  FName := AIndexAttr.Name;
  FCommaSepFieldList := AIndexAttr.CommaSepFieldList;
  FUnique := AIndexAttr.Unique;
  FOrientation := AIndexAttr.Orientation;
end;

function TioDBBuilderSchemaIndex.GetChanges: TioDBBuilderIndexChanges;
begin
  Result := FChanges;
end;

// ============================================================
// Raw names (case normalized, no delimiters)
// ============================================================

function TioDBBuilderSchemaIndex.GetCommaSepFieldList: String;
var
  LField, LComma: String;
begin
  // Normalize case of each field, no delimiters
  Result := '';
  LComma := '';
  for LField in FCommaSepFieldList.Split([',']) do
  begin
    Result := Result + LComma +
      TioDbFactory.SqlDataConverter(FConnectionDefName)
        .NormalizeSqlIdentifier(LField.Trim, False);  // Case only
    LComma := ', ';
  end;
end;

function TioDBBuilderSchemaIndex.GetName: String;
begin
  // Normalize case of the name, no delimiters
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName)
    .NormalizeSqlIdentifier(FName, False);
end;

// ============================================================
// SQL names (case normalized + delimiters)
// ============================================================

function TioDBBuilderSchemaIndex.GetSqlCommaSepFieldList: String;
var
  LField, LComma: String;
begin
  // Normalize case + add delimiters to each field
  Result := '';
  LComma := '';
  for LField in FCommaSepFieldList.Split([',']) do
  begin
    Result := Result + LComma +
      TioDbFactory.SqlDataConverter(FConnectionDefName)
        .NormalizeSqlIdentifier(LField.Trim, True);  // Case + delimiters
    LComma := ', ';
  end;
end;

function TioDBBuilderSchemaIndex.GetSqlName: String;
begin
  // Normalize case + add delimiters to the name
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName)
    .NormalizeSqlIdentifier(FName, True);
end;

// ============================================================
// Other methods
// ============================================================

function TioDBBuilderSchemaIndex.GetHasExplicitName: boolean;
begin
  Result := FHasExplicitName;
end;

function TioDBBuilderSchemaIndex.GetOrientation: TioIndexOrientation;
begin
  Result := FOrientation
end;

function TioDBBuilderSchemaIndex.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchemaIndex.GetUnique: Boolean;
begin
  Result := FUnique;
end;

procedure TioDBBuilderSchemaIndex.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

end.
