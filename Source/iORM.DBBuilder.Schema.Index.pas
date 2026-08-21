unit iORM.DBBuilder.Schema.Index;

interface

uses
  System.Rtti,

  iORM.Attributes,
  iORM.CommonTypes,
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Schema.Base;

type

  TioDBBuilderSchemaIndex = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaIndex)
  private
    FChanges: TioDBBuilderIndexChanges;
    FCommaSepFieldList: String;
    FConnectionDefName: String;
    FHasExplicitName: boolean;
    FName: String;
    FOrientation: TioIndexOrientation;
    FUnique: Boolean;
    procedure AddChange(const AChange: TioDBBuilderIndexChange);
    function GetChanges: TioDBBuilderIndexChanges;
    function GetCommaSepFieldList: String;
    function GetHasExplicitName: boolean;
    function GetName: String;
    function GetOrientation: TioIndexOrientation;
    function GetSqlCommaSepFieldList: String;
    function GetUnique: Boolean;
  protected
  public
    constructor Create(const AIndexAttr: ioIndex; const AConnectionDefName: String); overload;
    // Value-based constructor for the Physical branch: the Introspector passes the catalog values
    // directly (there is no ioIndex attribute behind a catalog index).
    constructor Create(const AName, ACommaSepFieldList: String; const AUnique: Boolean;
      const AOrientation: TioIndexOrientation; const AConnectionDefName: String); overload;
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

  Status := stClean;
  FConnectionDefName := AConnectionDefName;
  FHasExplicitName := AIndexAttr.HasExplicitName;
  FName := AIndexAttr.Name;
  FCommaSepFieldList := AIndexAttr.CommaSepFieldList;
  FUnique := AIndexAttr.Unique;
  FOrientation := AIndexAttr.Orientation;
end;

constructor TioDBBuilderSchemaIndex.Create(const AName, ACommaSepFieldList: String; const AUnique: Boolean;
  const AOrientation: TioIndexOrientation; const AConnectionDefName: String);
begin
  inherited Create;

  if ACommaSepFieldList.IsEmpty then
    raise EioDBBuilderException.Create(Self.ClassName, 'Create', 'Cannot create index: no fields list specified.');

  Status := stClean;
  FConnectionDefName := AConnectionDefName;
  FHasExplicitName := True;  // a physical (catalog) index always has a concrete name
  FName := AName;
  FCommaSepFieldList := ACommaSepFieldList;
  FUnique := AUnique;
  FOrientation := AOrientation;
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

function TioDBBuilderSchemaIndex.GetUnique: Boolean;
begin
  Result := FUnique;
end;

end.
