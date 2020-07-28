unit iORM.DBBuilder.Factory;

interface

uses
  System.Classes, iORM.DBBuilder.Interfaces, iORM.Context.Table.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Context.Map.Interfaces, iORM.Attributes;

type

  TioDBBuilderFactory = class
  public
    class function NewEngine: TioDBBuilderEngineRef;
    class function NewDBAnalyzer(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator)
      : IioDBBuilderDBAnalyzer;
    class function NewSchema(const ASqlScriptToFill: TStrings; const AConnectionDefName: String;
      const AIndexesEnabled, AForeignKeysEnabled: Boolean): IioDBBuilderSchema;
    class function NewSchemaBuilder: TioDBBuilderSchemaBuilderRef;
    class function NewSchemaField(const AContextProperty: IioContextProperty): IioDBBuilderSchemaField;
    class function NewSchemaFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
    class function NewSchemaTable(const AContextTable: IioContextTable): IioDBBuilderSchemaTable;
    class function NewSqlGenerator(const ASchema: IioDBBuilderSchema): IioDBBuilderSqlGenerator;
    class function NewStrategy(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderStrategy;
  end;

implementation

uses
  iORM.DBBuilder.Schema, iORM.DBBuilder.Schema.Table, iORM.DBBuilder.Schema.Field, iORM.DBBuilder.Schema.FK,
  iORM.DBBuilder.Schema.Builder, iORM.DB.ConnectionContainer, iORM.DB.Interfaces, iORM.DBBuilder.SqlGenerator.Firebird,
  iORM.DBBuilder.SqlGenerator.SqLite, iORM.DBBuilder.SqlGenerator.MSSqlServer, iORM.DBBuilder.Strategy.WithoutAlterTable,
  iORM.Exceptions, iORM.DBBuilder.DBAnalyzer, iORM.DBBuilder.Engine;

{ TioDBBuilderFactory }

class function TioDBBuilderFactory.NewDBAnalyzer(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator)
  : IioDBBuilderDBAnalyzer;
begin
  Result := TioDBBuilderDBAnalyzer.Create(ASchema, ASqlGenerator);
end;

class function TioDBBuilderFactory.NewEngine: TioDBBuilderEngineRef;
begin
  Result := TioDBBuilderEngine;
end;

class function TioDBBuilderFactory.NewSchema(const ASqlScriptToFill: TStrings; const AConnectionDefName: String;
  const AIndexesEnabled, AForeignKeysEnabled: Boolean): IioDBBuilderSchema;
begin
  Result := TioDBBuilderSchema.Create(ASqlScriptToFill, AConnectionDefName, AIndexesEnabled, AForeignKeysEnabled);
  NewSchemaBuilder.BuildSchema(Result);
end;

class function TioDBBuilderFactory.NewSchemaBuilder: TioDBBuilderSchemaBuilderRef;
begin
  Result := TioDBBuilderSchemaBuilder;
end;

class function TioDBBuilderFactory.NewSchemaField(const AContextProperty: IioContextProperty): IioDBBuilderSchemaField;
begin
  Result := TioDBBuilderSchemaField.Create(AContextProperty);
end;

class function TioDBBuilderFactory.NewSchemaFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioContextProperty;
  const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
begin
  Result := TioDBBuilderSchemaFK.Create(AReferenceMap, ADependentMap, ADependentProperty, AOnDeleteAction, AOnUpdateAction);
end;

class function TioDBBuilderFactory.NewSchemaTable(const AContextTable: IioContextTable): IioDBBuilderSchemaTable;
begin
  Result := TioDBBuilderSchemaTable.Create(AContextTable);
end;

class function TioDBBuilderFactory.NewSqlGenerator(const ASchema: IioDBBuilderSchema): IioDBBuilderSqlGenerator;
begin
  case TioConnectionManager.GetConnectionInfo(ASchema.ConnectionDefName).ConnectionType of
    cdtFirebird:
      Result := TioDBBuilderSqlGenFirebird.Create(ASchema);
    cdtSQLite:
      Result := TioDBBuilderSqlGenSQLite.Create(ASchema);
    cdtSQLServer:
      Result := TioDBBuilderSqlGenMSSqlServer.Create(ASchema);
  else
    raise EioException.Create(ClassName, 'NewSqlGenerator', 'Connection type not found');
  end;
end;

class function TioDBBuilderFactory.NewStrategy(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator)
  : IioDBBuilderStrategy;
begin
  case TioConnectionManager.GetConnectionInfo(ASchema.ConnectionDefName).ConnectionType of
    // cdtFirebird:
    // Result := TioDBBuilderSqlGenFirebird.Create(ASchema);
    cdtSQLite:
      Result := TioDBBuilderStrategyWithoutAlter.Create(ASchema, ASqlGenerator);
    // cdtSQLServer:
    // Result := TioDBBuilderSqlGenMSSqlServer.Create(ASchema);
  else
    raise EioException.Create(ClassName, 'NewStrategy', 'Connection type not found');
  end;
end;

end.
