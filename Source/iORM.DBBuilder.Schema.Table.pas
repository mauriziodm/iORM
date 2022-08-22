unit iORM.DBBuilder.Schema.Table;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.Context.Table.Interfaces, iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Attributes;

type

  TioDBBuilderSchemaTable = class(TInterfacedObject, IioDBBuilderSchemaTable)
  private
    FContextTable: IioTable;
    FFields: TioDBBuilderSchemaFields;
    FForeignKeys: TioDBBuilderSchemaForeignKeys;
    FIndexes: TioDBBuilderSchemaIndexes;
    FIsTrueClass: Boolean;
    FPrimaryKeyField: IioDBBuilderSchemaField;
    FStatus: TioDBBuilderStatus;
    function FieldExists(const AFieldName: String): boolean;
    // IsTrueClass
    function GetIsTrueClass: Boolean;
    procedure SetIsTrueClass(const AValue: Boolean);
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);
  public
    constructor Create(const AContextTable: IioTable);
    destructor Destroy; override;
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function Fields: TioDBBuilderSchemaFields;
    function ForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetContextTable: IioTable;
    function GetSequenceName: String;
    function Indexes: TioDBBuilderSchemaIndexes;
    function PrimaryKeyField: IioDBBuilderSchemaField;
    function TableName: String;
    property IsTrueClass: Boolean read GetIsTrueClass write SetIsTrueClass;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  iORM.CommonTypes, System.SysUtils, iORM.DBBuilder.Factory;

{ TioDBBuilderSchemaTable }

procedure TioDBBuilderSchemaTable.AddField(ASchemaField: IioDBBuilderSchemaField);
begin
  // Add field if not already exists
  if not FieldExists(ASchemaField.FieldName) then
    FFields.Add(ASchemaField);
  // If this field is the primary key field
  if ASchemaField.PrimaryKey then
    FPrimaryKeyField := ASchemaField;
end;

constructor TioDBBuilderSchemaTable.Create(const AContextTable: IioTable);
begin
  FStatus := stClean;
  FContextTable := AContextTable;
  FIsTrueClass := AContextTable.IsTrueClass;
  FFields := TioDBBuilderSchemaFields.Create;
  FForeignKeys := TioDBBuilderSchemaForeignKeys.Create;
  FIndexes := TioDBBuilderSchemaIndexes.Create;
end;

destructor TioDBBuilderSchemaTable.Destroy;
begin
  FFields.Free;
  FForeignKeys.Free;
  FIndexes.Free;
  inherited;
end;

function TioDBBuilderSchemaTable.FieldExists(const AFieldName: String): boolean;
var
  LField: IioDBBuilderSchemaField;
begin
  for LField in FFields do
    if LField.FieldName.Equals(AFieldName) then
      Exit(True);
  Result := False;
end;

function TioDBBuilderSchemaTable.Fields: TioDBBuilderSchemaFields;
begin
  Result := FFields;
end;

procedure TioDBBuilderSchemaTable.AddIndex(const AIndexAttr: ioIndex);
begin
  // Add index if not already exists
  if FIndexes.IndexOf(AIndexAttr) = -1 then
    FIndexes.Add(AIndexAttr);
end;

procedure TioDBBuilderSchemaTable.AddForeignKey(const AReferenceMap, ADependentMap: IioMap;
  const ADependentProperty: IioProperty; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  // Add tne FK if not already exists
  LForeignKey := TioDBBuilderFactory.NewSchemaFK(AReferenceMap, ADependentMap, ADependentProperty, AOnDeleteAction, AOnUpdateAction);
  if not FForeignKeys.ContainsKey(LForeignKey.Name) then
    FForeignKeys.Add(LForeignKey.Name, LForeignKey);
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

function TioDBBuilderSchemaTable.GetContextTable: IioTable;
begin
  Result := FContextTable;
end;

function TioDBBuilderSchemaTable.GetIsTrueClass: Boolean;
begin
  Result := FIsTrueClass;
end;

function TioDBBuilderSchemaTable.GetSequenceName: String;
begin
  Result := FContextTable.GetKeyGenerator;
end;

function TioDBBuilderSchemaTable.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

procedure TioDBBuilderSchemaTable.SetIsTrueClass(const AValue: Boolean);
begin
  // Una volta a true rimane sempre a true
  FIsTrueClass := AValue or FIsTrueClass;
end;

procedure TioDBBuilderSchemaTable.SetStatus(const AValue: TioDBBuilderStatus);
begin
  if AValue > FStatus then
    FStatus := AValue;
end;

end.
