{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.DBBuilder.Factory;

interface

uses
  System.Classes,

  iORM.DBBuilder.Interfaces,
  iORM.Context.Table.Interfaces,
  iORM.Context.Properties.Interfaces,
  iORM.Context.Map.Interfaces,
  iORM.Attributes,
  iORM.CommonTypes

  ;

type

  TioDBBuilderFactory = class
  public
    class function NewContext(const AConnectionDefName: String; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderContext;
    class function NewDBAnalyzer(const AContext: IioDBBuilderContext; const AStrategy: IioDBBuilderStrategy): IioDBBuilderDBAnalyzer;
    class function NewDBBuilder: IioDBBuilder;
    class function NewSchema(const AConnectionDefName: String; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode;
      const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderSchema;
    class function NewSchemaBuilder: TioDBBuilderSchemaBuilderRef;
    class function NewSchemaField(const AContextProperty: IioProperty): IioDBBuilderSchemaField;
    class function NewSchemaFieldClassInfo(const AConnectionDefName: String): IioDBBuilderSchemaField;
    class function NewSchemaFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty; const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
    class function NewSchemaIndex(const AIndex: ioIndex; const AConnectionDefName: String): IioDBBuilderSchemaIndex;
    class function NewSchemaRDBMSInfo(const AName, ARaw, AVersion: String; const AMajorVersion, AMinorVersion: Integer): IioDBBuilderSchemaRDBMSInfo;
    class function NewSchemaTable(const AContextTable: IioTable;
      const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
    class function NewSqlGenerator(const AConnectionDefName: String): IioDBBuilderSqlGenerator;
    class function NewScript(const AConnectionDefName: String): IioDBBuilderScript;
    class function NewSqlText(const AAddLinePrefix: String = ''): IioDBBuilderSqlText;
    class function NewStrategy(const AContext: IioDBBuilderContext): IioDBBuilderStrategy;
  end;

implementation

uses
  iORM.DBBuilder.Schema, iORM.DBBuilder.Schema.Table, iORM.DBBuilder.Schema.Field, iORM.DBBuilder.Schema.FK,
  iORM.DBBuilder.Schema.Builder, iORM.DB.ConnectionContainer, iORM.DB.Interfaces, iORM.DBBuilder.SqlGenerator.Firebird,
  iORM.DBBuilder.SqlGenerator.SqLite, iORM.DBBuilder.Strategy.SqLite, iORM.DBBuilder.Strategy.Firebird,
  iORM.Exceptions, iORM.DBBuilder, iORM.DBBuilder.Context, iORM.DBBuilder.DBAnalyzer, iORM.DBBuilder.Script,
  iORM.DBBuilder.Schema.Index,
  iORM.DBBuilder.SqlGenerator.MSSqlServer,
  iORM.DBBuilder.Schema.Field.ClassInfo,
  iORM.DBBuilder.Strategy.MSSqlServer,
  iORM.DBBuilder.Schema.RDBMSInfo

  ;

{ TioDBBuilderFactory }

class function TioDBBuilderFactory.NewContext(const AConnectionDefName: String; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderContext;
begin
  Result := TioDBBuilderContext.Create(AConnectionDefName, AIndexesMode, AForeignKeysMode);
end;

class function TioDBBuilderFactory.NewDBAnalyzer(const AContext: IioDBBuilderContext; const AStrategy: IioDBBuilderStrategy): IioDBBuilderDBAnalyzer;
begin
  Result := TioDBBuilderDBAnalyzer.Create(AContext, AStrategy);
end;

class function TioDBBuilderFactory.NewDBBuilder: IioDBBuilder;
begin
  Result := TioDBBuilder.Create;
end;

class function TioDBBuilderFactory.NewSchema(const AConnectionDefName: String; const AIndexesMode,
  AForeignKeysMode: TioDBBuilderIndexesAndFKMode; const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderSchema;
begin
  Result := TioDBBuilderSchema.Create(AIndexesMode, AForeignKeysMode);
  NewSchemaBuilder.BuildSchema(AConnectionDefName, Result, ASqlGenerator);
end;

class function TioDBBuilderFactory.NewSchemaBuilder: TioDBBuilderSchemaBuilderRef;
begin
  Result := TioDBBuilderSchemaBuilder;
end;

class function TioDBBuilderFactory.NewSchemaField(const AContextProperty: IioProperty): IioDBBuilderSchemaField;
begin
  Result := TioDBBuilderSchemaField.Create(AContextProperty);
end;

// ConnectionDefName is required to apply database-specific identifier normalization
class function TioDBBuilderFactory.NewSchemaFieldClassInfo(const AConnectionDefName: String): IioDBBuilderSchemaField;
begin
  Result := TioDBBuilderSchemaFieldClassInfo.Create(AConnectionDefName);
end;

class function TioDBBuilderFactory.NewSchemaFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
  const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
begin
  Result := TioDBBuilderSchemaFK.Create(AReferenceMap, ADependentMap, ADependentProperty, AOnDeleteAction, AOnUpdateAction);
end;

class function TioDBBuilderFactory.NewSchemaIndex(const AIndex: ioIndex; const AConnectionDefName: String): IioDBBuilderSchemaIndex;
begin
  Result := TioDBBuilderSchemaIndex.Create(AIndex, AConnectionDefName);
end;

class function TioDBBuilderFactory.NewSchemaRDBMSInfo(const AName, ARaw, AVersion: String;
  const AMajorVersion, AMinorVersion: Integer): IioDBBuilderSchemaRDBMSInfo;
begin
  Result := TioDBBuilderSchemaRDBMSInfo.Create(AName, ARaw, AVersion, AMajorVersion, AMinorVersion);
end;

class function TioDBBuilderFactory.NewSchemaTable(const AContextTable: IioTable;
  const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
begin
  Result := TioDBBuilderSchemaTable.Create(AContextTable, AKeyGenerationStrategy);
end;

class function TioDBBuilderFactory.NewSqlGenerator(const AConnectionDefName: String): IioDBBuilderSqlGenerator;
begin
  case TioConnectionManager.GetConnectionInfo(AConnectionDefName).ConnectionType of
    ctFirebird:
      Result := TioDBBuilderSqlGenFirebird.Create(AConnectionDefName);
    ctSQLite:
      Result := TioDBBuilderSqlGenSQLite.Create(AConnectionDefName);
    ctSQLServer:
      Result := TioDBBuilderSqlGenMSSqlServer.Create(AConnectionDefName);
  else
    raise EioDBBuilderException.Create(ClassName, 'NewSqlGenerator', 'Connection type not found');
  end;
end;

class function TioDBBuilderFactory.NewScript(const AConnectionDefName: String): IioDBBuilderScript;
begin
  Result := TioDBBuilderScript.Create(AConnectionDefName);
end;

class function TioDBBuilderFactory.NewSqlText(const AAddLinePrefix: String = ''): IioDBBuilderSqlText;
begin
  Result := TioDBBuilderSqlText.Create(AAddLinePrefix);
end;

class function TioDBBuilderFactory.NewStrategy(const AContext: IioDBBuilderContext): IioDBBuilderStrategy;
begin
  case TioConnectionManager.GetConnectionInfo(AContext.ConnectionDefName).ConnectionType of
    ctSQLServer:
      Result := TioDBBuilderStrategyMSSqlServer.Create(AContext);
    ctFirebird:
      Result := TioDBBuilderStrategyFirebird.Create(AContext);
    ctSQLite:
      Result := TioDBBuilderStrategySqLite.Create(AContext);
  else
    raise EioDBBuilderException.Create(ClassName, 'NewStrategy', 'Connection type not found');
  end;
end;

end.
