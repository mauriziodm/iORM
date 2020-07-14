unit iORM.DBBuilder.Schema.Field;

interface

uses
  iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces;

type

  TioDBBuilderSchemaField = class(TInterfacedObject, IioDBBuilderSchemaField)
  private
    FContextProperty: IioContextProperty;
    FStatus: TioDBBuilderStatus;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    constructor Create(const AContextProperty: IioContextProperty);
    function FieldName: String;
    function GetProperty: IioContextProperty;
    function IsPrimaryKey: Boolean;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

{ TioDBBuilderSchemaField }

constructor TioDBBuilderSchemaField.Create(const AContextProperty: IioContextProperty);
begin
  FStatus := dbsClean;
  FContextProperty := AContextProperty;
end;

function TioDBBuilderSchemaField.FieldName: String;
begin
  Result := FContextProperty.GetSqlFieldName;
end;

function TioDBBuilderSchemaField.GetProperty: IioContextProperty;
begin
  Result := FContextProperty;
end;

function TioDBBuilderSchemaField.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchemaField.IsPrimaryKey: Boolean;
begin
  Result := FContextProperty.IsID;
end;

procedure TioDBBuilderSchemaField.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

end.
