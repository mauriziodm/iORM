unit iORM.DBBuilder.Schema.FK;

interface

uses
  iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces;

type

  TioDBBuilderSchemaFK = class(TInterfacedObject)
  private
    FReferenceMap: IioMap;
    FDependentMap: IioMap;
    FDependentProperty: IioContextProperty;
  public
    constructor Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty);
    function ReferenceTableName: String;
    function ReferenceFieldName: String;
    function DependentTableName: String;
    function DependentFieldName: String;
  end;

implementation

{ TioDBBuilderSchemaFK }

function TioDBBuilderSchemaFK.DependentFieldName: String;
begin
  Result := FDependentProperty.GetSqlFieldName;
end;

function TioDBBuilderSchemaFK.DependentTableName: String;
begin
  Result := FDependentMap.GetTable.TableName;
end;

constructor TioDBBuilderSchemaFK.Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty);
begin
  FReferenceMap := AReferenceMap;
  FDependentMap := ADependentMap;
  FDependentProperty := ADependentProperty;
end;

function TioDBBuilderSchemaFK.ReferenceFieldName: String;
begin
  Result := FReferenceMap.GetProperties.GetIdProperty.GetSqlFieldName;
end;

function TioDBBuilderSchemaFK.ReferenceTableName: String;
begin
  Result := FReferenceMap.GetTable.TableName;
end;

end.
