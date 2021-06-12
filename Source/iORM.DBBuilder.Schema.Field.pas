unit iORM.DBBuilder.Schema.Field;

interface

uses
  iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces, System.Rtti;

type

  TioDBBuilderSchemaField = class(TInterfacedObject, IioDBBuilderSchemaField)
  private
    FContextProperty: IioContextProperty;
    FStatus: TioDBBuilderStatus;
    FAltered: TioDBBuilderFieldAlter;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    constructor Create(const AContextProperty: IioContextProperty);
    procedure AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
    function Altered: TioDBBuilderFieldAlter;
    function FieldCustomType: string;
    function FieldDefault: TValue;
    function FieldDefaultExists: Boolean;
    function FieldLength: integer;
    function FieldName(const AClearDelimiters: Boolean = False): String;
    function FieldPrecision: integer;
    function FieldScale: integer;
    function FieldSubType: string;
    function FieldType: TioMetadataFieldType;
    function FieldUnicode: boolean;
    function FieldNotNull: Boolean;
    function PrimaryKey: Boolean;

    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

{ TioDBBuilderSchemaField }

procedure TioDBBuilderSchemaField.AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
begin
  Include(FAltered, AAltered);
end;

function TioDBBuilderSchemaField.Altered: TioDBBuilderFieldAlter;
begin
  Result := FAltered;
end;

constructor TioDBBuilderSchemaField.Create(const AContextProperty: IioContextProperty);
begin
  FStatus := stClean;
  FContextProperty := AContextProperty;
end;

function TioDBBuilderSchemaField.FieldCustomType: string;
begin
  Result := FContextProperty.GetMetadata_CustomFieldType;
end;

function TioDBBuilderSchemaField.FieldDefault: TValue;
begin
  Result := FContextProperty.GetMetadata_Default;
end;

function TioDBBuilderSchemaField.FieldDefaultExists: Boolean;
begin
  Result := not FieldDefault.IsEmpty;
end;

function TioDBBuilderSchemaField.FieldLength: integer;
begin
  Result := FContextProperty.GetMetadata_FieldLength;
end;

function TioDBBuilderSchemaField.FieldName(const AClearDelimiters: Boolean = False): String;
begin
  Result := FContextProperty.GetSqlFieldName(AClearDelimiters);
end;

function TioDBBuilderSchemaField.FieldPrecision: integer;
begin
  Result := FContextProperty.GetMetadata_FieldPrecision;
end;

function TioDBBuilderSchemaField.FieldScale: integer;
begin
  Result := FContextProperty.GetMetadata_FieldScale;
end;

function TioDBBuilderSchemaField.FieldSubType: string;
begin
  Result := FContextProperty.GetMetadata_FieldSubType;
end;

function TioDBBuilderSchemaField.FieldType: TioMetadataFieldType;
begin
  Result := FContextProperty.GetMetadata_FieldType;
end;

function TioDBBuilderSchemaField.FieldUnicode: boolean;
begin
  Result := FContextProperty.GetMetadata_FieldUnicode;
end;

function TioDBBuilderSchemaField.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchemaField.PrimaryKey: Boolean;
begin
  Result := FContextProperty.IsID;
end;

function TioDBBuilderSchemaField.FieldNotNull: Boolean;
begin
  Result := FContextProperty.GetMetadata_FieldNotNull;
end;

procedure TioDBBuilderSchemaField.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

end.
