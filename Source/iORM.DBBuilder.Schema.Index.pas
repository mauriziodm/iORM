unit iORM.DBBuilder.Schema.Index;

interface

uses
  System.Rtti,

  iORM.Attributes,
  iORM.CommonTypes,
  iORM.Context.Properties.Interfaces,
  iORM.DBBuilder.Interfaces;

type

  TioDBBuilderSchemaIndex = class(TInterfacedObject, IioDBBuilderSchemaIndex)
  private
    FContextProperty: IioProperty;
    FStatus: TioDBBuilderStatus;
    FChanges: TioDBBuilderIndexChanges;
    FIndexName: String;
    FCommaSepFieldList: String;
    FIndexOrientation: TioIndexOrientation;
    FUnique: Boolean;
    FExplicitName: boolean;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
    function GetChanges: TioDBBuilderIndexChanges;
    function GetCommaSepFieldList: String;
    function GetName: String;
    function GetIndexOrientation: TioIndexOrientation;
    function GetUnique: Boolean;
    function GetExplicitName: boolean;
  public
    constructor Create(const AIndexAttr: ioIndex);

    procedure AddChange(const AChange: TioDBBuilderIndexChange);

    property Changes: TioDBBuilderIndexChanges read GetChanges;
    property CommaSepFieldList: String read GetCommaSepFieldList;
    property ExplicitName: boolean read GetExplicitName;
    property IndexOrientation: TioIndexOrientation read GetIndexOrientation;
    property Name: String read GetName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
    property Unique: Boolean read GetUnique;
  end;

implementation

uses
  System.SysUtils,
  System.StrUtils,
  System.Classes

  ;


{ TioDBBuilderSchemaIndex }

procedure TioDBBuilderSchemaIndex.AddChange(const AChange: TioDBBuilderIndexChange);
begin
  Include(FChanges, AChange);
end;

constructor TioDBBuilderSchemaIndex.Create(const AIndexAttr: ioIndex);
begin
  inherited Create;

  FStatus := stClean;
  FExplicitName := AIndexAttr.ExplicitName;
  FIndexName := AIndexAttr.IndexName;
  FCommaSepFieldList := AIndexAttr.CommaSepFieldList;
  FUnique := AIndexAttr.Unique;
  FIndexOrientation := AIndexAttr.IndexOrientation;
end;

function TioDBBuilderSchemaIndex.GetChanges: TioDBBuilderIndexChanges;
begin
  Result := FChanges;
end;

function TioDBBuilderSchemaIndex.GetCommaSepFieldList: String;
begin
  Result := FCommaSepFieldList;
end;

function TioDBBuilderSchemaIndex.GetExplicitName: boolean;
begin
  Result := FExplicitName;
end;

function TioDBBuilderSchemaIndex.GetName: String;
var
  LFieldList: TArray<string>;
begin
  Result := EmptyStr;

  if ExplicitName then
    Result := FIndexName
  else
  begin
    // Split fields list
    LFieldList := CommaSepFieldList.Replace(' ', '').Split([',']);
    // Join fields separated by '_'
    Result := Result.Join('_', LFieldList);
  end;
end;

function TioDBBuilderSchemaIndex.GetIndexOrientation: TioIndexOrientation;
begin
  Result := FIndexOrientation
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
