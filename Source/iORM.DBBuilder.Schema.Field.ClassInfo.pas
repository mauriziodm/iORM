unit iORM.DBBuilder.Schema.Field.ClassInfo;

interface

uses
  System.Rtti, iORM.DBBuilder.Interfaces, iORM.Context.Properties.Interfaces;

type

  TioDBBuilderSchemaFieldClassInfo = class(TInterfacedObject, IioDBBuilderSchemaField)
  private
    FStatus: TioDBBuilderStatus;
    FAltered: TioDBBuilderFieldAlter;
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
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

uses
  iORM.CommonTypes;

{ TioDBBuilderSchemaFieldClassInfo }

procedure TioDBBuilderSchemaFieldClassInfo.AddAltered(const AAltered: TioDBBuilderFieldAlterStatus);
begin
  Include(FAltered, AAltered);
end;

function TioDBBuilderSchemaFieldClassInfo.Altered: TioDBBuilderFieldAlter;
begin
  Result := FAltered;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldCustomType: string;
begin
  Result := '';
end;

function TioDBBuilderSchemaFieldClassInfo.FieldDefault: TValue;
begin
  Result := nil;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldDefaultExists: Boolean;
begin
  Result := not FieldDefault.IsEmpty;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldLength: integer;
begin
  Result := IO_TRUECLASS_FIELDLENGTH;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldName(const AClearDelimiters: Boolean = False): String;
begin
  Result := IO_TRUECLASS_FIELDNAME;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldNotNull: Boolean;
begin
  Result := True;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldPrecision: integer;
begin
  Result := 0;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldScale: integer;
begin
  Result := 0;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldSubType: string;
begin
  Result := '';
end;

function TioDBBuilderSchemaFieldClassInfo.FieldType: TioMetadataFieldType;
begin
  Result := ioMdVarchar;
end;

function TioDBBuilderSchemaFieldClassInfo.FieldUnicode: boolean;
begin
  Result := True;
end;

function TioDBBuilderSchemaFieldClassInfo.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

function TioDBBuilderSchemaFieldClassInfo.PrimaryKey: Boolean;
begin
  Result := False;
end;

procedure TioDBBuilderSchemaFieldClassInfo.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

end.
