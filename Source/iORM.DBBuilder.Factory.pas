unit iORM.DBBuilder.Factory;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.Context.Table.Interfaces, iORM.Context.Properties.Interfaces, iORM.Context.Map.Interfaces;

type

  TioDBBuilderFactory = class
  public
    class function NewSchemaField(const AContextProperty: IioContextProperty): IioDBBuilderSchemaField;
    class function NewSchemaFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty)
      : IioDBBuilderSchemaFK;
    class function NewSchemaTable(const AContextTable: IioContextTable): IioDBBuilderSchemaTable;
  end;

implementation

uses
  iORM.DBBuilder.Schema.Table, iORM.DBBuilder.Schema.Field, iORM.DBBuilder.Schema.FK;

{ TioDBBuilderFactory }

class function TioDBBuilderFactory.NewSchemaField(const AContextProperty: IioContextProperty): IioDBBuilderSchemaField;
begin
  Result := TioDBBuilderSchemaField.Create(AContextProperty);
end;

class function TioDBBuilderFactory.NewSchemaFK(const AReferenceMap, ADependentMap: IioMap;
  const ADependentProperty: IioContextProperty): IioDBBuilderSchemaFK;
begin
  Result := TioDBBuilderSchemaFK.Create(AReferenceMap, ADependentMap, ADependentProperty);
end;

class function TioDBBuilderFactory.NewSchemaTable(const AContextTable: IioContextTable): IioDBBuilderSchemaTable;
begin
  Result := TioDBBuilderSchemaTable.Create(AContextTable);
end;

end.
