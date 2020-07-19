unit iORM.DBBuilder.Schema.Table;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.Context.Table.Interfaces, iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Attributes;

type

  TioDBBuilderSchemaTable = class(TInterfacedObject, IioDBBuilderSchemaTable)
  private
    FContextTable: IioContextTable;
    FFields: TioDBBuilderSchemaFields;
    FForeignKeys: TioDBBuilderSchemaForeignKeys;
    FIndexes: TioDBBuilderSchemaIndexes;
    FIsClassFromField: Boolean;
    FPrimaryKeyField: IioDBBuilderSchemaField;
    FStatus: TioDBBuilderStatus;
    // IsClassFromField
    function GetIsClassFromField: Boolean;
    procedure SetIsClassFromField(const AValue: Boolean);
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    constructor Create(const AContextTable: IioContextTable);
    destructor Destroy; override;
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function FieldList: TioDBBuilderSchemaFields;
    function ForeignKeys: TioDBBuilderSchemaForeignKeys;
    // function IDField: IioDBBuilderSchemaField;
    function Indexes: TioDBBuilderSchemaIndexes;
    function PrimaryKeyField: IioDBBuilderSchemaField;
    function TableName: String;

    property IsClassFromField: Boolean read GetIsClassFromField write SetIsClassFromField;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  iORM.CommonTypes, System.SysUtils, iORM.DBBuilder.Factory;

{ TioDBBuilderSchemaTable }

procedure TioDBBuilderSchemaTable.AddField(ASchemaField: IioDBBuilderSchemaField);
begin
  // Add field if not already exists
  if not FFields.ContainsKey(ASchemaField.FieldName) then
    FFields.Add(ASchemaField.FieldName, ASchemaField);
  // If this field is the primary key field
  if ASchemaField.PrimaryKey then
    FPrimaryKeyField := ASchemaField;
end;

constructor TioDBBuilderSchemaTable.Create(const AContextTable: IioContextTable);
begin
  FStatus := dbsClean;
  FContextTable := AContextTable;
  FIsClassFromField := AContextTable.IsClassFromField;
  FFields := TioDBBuilderSchemaFields.Create;
  FForeignKeys := TioDBBuilderSchemaForeignKeys.Create;
  FIndexes := TioDBBuilderSchemaIndexes.Create;
end;

destructor TioDBBuilderSchemaTable.Destroy;
begin
  FFields.Free;
  FForeignKeys.Free;
  inherited;
end;

function TioDBBuilderSchemaTable.FieldList: TioDBBuilderSchemaFields;
begin
  Result := FFields;
end;

procedure TioDBBuilderSchemaTable.AddIndex(const AIndexAttr: ioIndex);
begin
  // Add index if not already exists
  if FIndexes.IndexOf(AIndexAttr) = -1 then
    FIndexes.Add(AIndexAttr);
end;

procedure TioDBBuilderSchemaTable.AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty);
var
  LFKName: String;
begin
  // Add tne FK if not already exists
  LFKName := ADependentProperty.GetName + '_' + AReferenceMap.GetTable.TableName;
  if not FForeignKeys.ContainsKey(LFKName) then
    FForeignKeys.Add(LFKName, TioDBBuilderFactory.NewSchemaFK(AReferenceMap, ADependentMap, ADependentProperty));
end;

function TioDBBuilderSchemaTable.ForeignKeys: TioDBBuilderSchemaForeignKeys;
begin
  Result := FForeignKeys;
end;

function TioDBBuilderSchemaTable.Indexes: TioDBBuilderSchemaIndexes;
begin
  Result := FIndexes;
end;

function TioDBBuilderSchemaTable.PrimaryKeyField: IioDBBuilderSchemaField;
begin
  Result := FPrimaryKeyField;
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

function TioDBBuilderSchemaTable.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

procedure TioDBBuilderSchemaTable.SetIsClassFromField(const AValue: Boolean);
begin
  // Una volta a true rimane sempre a true
  FIsClassFromField := AValue or FIsClassFromField;
end;

procedure TioDBBuilderSchemaTable.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

end.
