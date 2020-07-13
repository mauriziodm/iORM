unit iORM.DBBuilder.Schema.Field;

interface

uses
  iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces;

type

  TioDBBuilderSchemaField = class(TInterfacedObject, IioDBBuilderSchemaField)
  private
    FContextProperty: IioContextProperty;
//    FIsConcreteField: Boolean;
    // IsSqlField
//    function GetIsConcreteField: Boolean;
//    procedure SetIsConcreteField(AValue: Boolean);
  public
    constructor Create(const AContextProperty: IioContextProperty);
    function FieldName: String;
    function GetProperty: IioContextProperty;
//    property IsConcreteField: Boolean read GetIsConcreteField write SetIsConcreteField;
  end;

implementation

{ TioDBBuilderSchemaField }

constructor TioDBBuilderSchemaField.Create(const AContextProperty: IioContextProperty);
begin
  FContextProperty := AContextProperty;
end;

function TioDBBuilderSchemaField.FieldName: String;
begin
  Result := FContextProperty.GetSqlFieldName;
end;

//function TioDBBuilderSchemaField.GetIsConcreteField: Boolean;
//begin
//  Result := FIsConcreteField;
//end;

function TioDBBuilderSchemaField.GetProperty: IioContextProperty;
begin
  Result := FContextProperty;
end;

//procedure TioDBBuilderSchemaField.SetIsConcreteField(AValue: Boolean);
//begin
//  FIsConcreteField := AValue;
//end;

end.
