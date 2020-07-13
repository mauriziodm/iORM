unit iORM.DBBuilder.Schema.Table;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.Context.Table.Interfaces, iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Attributes;

type

  TioDBBuilderSchemaTable = class(TInterfacedObject, IioDBBuilderSchemaTable)
  private
    FFieldList: TioDBBuilderSchemaFieldList;
    FFKList: TioDBBuilderSchemaFKList;
    FIndexList: TioDBBuilderSchemaIndexList;
    FIsClassFromField: Boolean;
    FContextTable: IioContextTable;
    // IsClassFromField
    procedure SetIsClassFromField(const AValue: Boolean);
    function GetIsClassFromField: Boolean;
  public
    constructor Create(const AContextTable: IioContextTable);
    destructor Destroy; override;
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function FieldExists(AFieldName: String): Boolean;
    function FieldList: TioDBBuilderSchemaFieldList;
    function FKList: TioDBBuilderSchemaFKList;
    // function IDField: IioDBBuilderSchemaField;
    function IndexList: TioDBBuilderSchemaIndexList;
    function TableName: String;

    property IsClassFromField: Boolean read GetIsClassFromField write SetIsClassFromField;
  end;

implementation

uses
  iORM.CommonTypes, System.SysUtils, iORM.DBBuilder.Factory;

{ TioDBBuilderSchemaTable }

procedure TioDBBuilderSchemaTable.AddField(ASchemaField: IioDBBuilderSchemaField);
begin
  FFieldList.Add(ASchemaField.FieldName, ASchemaField);
end;

constructor TioDBBuilderSchemaTable.Create(const AContextTable: IioContextTable);
begin
  FContextTable := AContextTable;
  FIsClassFromField := AContextTable.IsClassFromField;
  FFieldList := TioDBBuilderSchemaFieldList.Create;
  FFKList := TioDBBuilderSchemaFKList.Create;
  FIndexList := TioDBBuilderSchemaIndexList.Create;
end;

destructor TioDBBuilderSchemaTable.Destroy;
begin
  FFieldList.Free;
  FFKList.Free;
  inherited;
end;

function TioDBBuilderSchemaTable.FieldExists(AFieldName: String): Boolean;
begin
  Result := FFieldList.ContainsKey(AFieldName);
end;

function TioDBBuilderSchemaTable.FieldList: TioDBBuilderSchemaFieldList;
begin
  Result := FFieldList;
end;

procedure TioDBBuilderSchemaTable.AddIndex(const AIndexAttr: ioIndex);
begin
  // Add index if not already exists
  if FIndexList.IndexOf(AIndexAttr) = -1 then
    FIndexList.Add(AIndexAttr);
end;

procedure TioDBBuilderSchemaTable.AddFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty);
var
  LFKName: String;
begin
  LFKName := ADependentProperty.GetName + '_' + AReferenceMap.GetTable.TableName;
  if not FFKList.ContainsKey(LFKName) then
    FFKList.Add(LFKName, TioDBBuilderFactory.NewSchemaFK(AReferenceMap, ADependentMap, ADependentProperty));
end;

function TioDBBuilderSchemaTable.FKList: TioDBBuilderSchemaFKList;
begin
  Result := FFKList;
end;

function TioDBBuilderSchemaTable.IndexList: TioDBBuilderSchemaIndexList;
begin
  Result := FIndexList;
end;

function TioDBBuilderSchemaTable.TableName: String;
begin
  Result := FContextTable.TableName;
end;

// function TioDBBuilderSchemaTable.IDField: IioDBBuilderSchemaField;
// var
// AField: IioDBBuilderSchemaField;
// begin
// Result := nil;
// for AField in FFieldList.Values do
// if AField.IsKeyField then
// Exit(AField);
// end;

function TioDBBuilderSchemaTable.GetIsClassFromField: Boolean;
begin
  Result := FIsClassFromField;
end;

procedure TioDBBuilderSchemaTable.SetIsClassFromField(const AValue: Boolean);
begin
  // Una volta a true rimane sempre a true
  FIsClassFromField := AValue or FIsClassFromField;
end;

end.
