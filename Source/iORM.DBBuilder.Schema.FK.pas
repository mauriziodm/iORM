unit iORM.DBBuilder.Schema.FK;

interface

uses
  iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces;

type

  TioDBBuilderSchemaFK = class(TInterfacedObject, IioDBBuilderSchemaFK)
  private
    FDependentMap: IioMap;
    FDependentProperty: IioContextProperty;
    FName: String;
    FReferenceMap: IioMap;
  public
    constructor Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty);
    function DependentTableName: String;
    function DependentFieldName: String;
    function Name: String;
    function ReferenceTableName: String;
    function ReferenceFieldName: String;
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

function TioDBBuilderSchemaFK.Name: String;
begin
  Result := FName;
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
