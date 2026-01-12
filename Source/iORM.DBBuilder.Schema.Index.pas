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
    FChanges: TioDBBuilderIndexChanges;
    FCommaSepFieldList: String;
    FContextProperty: IioProperty;
    FHasExplicitName: boolean;
    FName: String;
    FOrientation: TioOrientation;
    FStatus: TioDBBuilderStatus;
    FUnique: Boolean;
    // Status
    function GetChanges: TioDBBuilderIndexChanges;
    function GetCommaSepFieldList: String;
    function GetName: String;
    function GetOrientation: TioOrientation;
    function GetStatus: TioDBBuilderStatus;
    function GetUnique: Boolean;
    function GetHasExplicitName: boolean;

    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    constructor Create(const AIndexAttr: ioIndex);

    procedure AddChange(const AChange: TioDBBuilderIndexChange);

    property Changes: TioDBBuilderIndexChanges read GetChanges;
    property CommaSepFieldList: String read GetCommaSepFieldList;
    property HasExplicitName: boolean read GetHasExplicitName;
    property Name: String read GetName;
    property Orientation: TioOrientation read GetOrientation;
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

function TioDBBuilderSchemaIndex.GetCommaSepFieldList: String;
begin
  Result := FCommaSepFieldList;
end;

function TioDBBuilderSchemaIndex.GetHasExplicitName: boolean;
begin
  Result := FHasExplicitName;
end;

function TioDBBuilderSchemaIndex.GetName: String;
begin
  Result := FName;
end;

function TioDBBuilderSchemaIndex.GetOrientation: TioOrientation;
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
