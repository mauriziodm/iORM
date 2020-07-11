unit iORM.DBBuilder.Schema.Field;

interface

uses
  iORM.Context.Properties.Interfaces;

type

  TioDBBuilderSchemaField = class(TInterfacedObject)
  private
    FProperty: IioContextProperty;
    FIsConcreteField: Boolean;
    // IsSqlField
    function GetIsConcreteField: Boolean;
    procedure SetIsConcreteField(AValue: Boolean);
  public
    constructor Create(const AProperty: IioContextProperty);
    function FieldName: String;
    function GetProperty: IioContextProperty;
    property IsConcreteField: Boolean read GetIsConcreteField write SetIsConcreteField;
  end;

implementation

{ TioDBBuilderSchemaField }

constructor TioDBBuilderSchemaField.Create(const AProperty: IioContextProperty);
begin
  FProperty := AProperty;
end;

function TioDBBuilderSchemaField.FieldName: String;
begin
  Result := FProperty.GetSqlFieldName;
end;

function TioDBBuilderSchemaField.GetIsConcreteField: Boolean;
begin
  Result := FIsConcreteField;
end;

function TioDBBuilderSchemaField.GetProperty: IioContextProperty;
begin
  Result := FProperty;
end;

procedure TioDBBuilderSchemaField.SetIsConcreteField(AValue: Boolean);
begin
  FIsConcreteField := AValue;
end;

end.
