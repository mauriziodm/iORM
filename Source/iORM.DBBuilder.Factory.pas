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
  System.Classes, iORM.DBBuilder.Interfaces, iORM.Context.Table.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Context.Map.Interfaces, iORM.Attributes;

type

  TioDBBuilderFactory = class
  public
    class function NewEngine(const AAddIndexes: Boolean = True; const AAddForeignKeys: Boolean = True): IioDBBuilderEngine; overload;
    class function NewEngine(const AConnectionDefName: String; const AAddIndexes: Boolean = True; const AAddForeignKeys: Boolean = True)
      : IioDBBuilderEngine; overload;
    class function NewDBAnalyzer(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator)
      : IioDBBuilderDBAnalyzer;
    class function NewSchema(const AConnectionDefName: String; const AIndexesEnabled, AForeignKeysEnabled: Boolean): IioDBBuilderSchema;
    class function NewSchemaBuilder: TioDBBuilderSchemaBuilderRef;
    class function NewSchemaField(const AContextProperty: IioProperty): IioDBBuilderSchemaField;
    class function NewSchemaFieldClassInfo: IioDBBuilderSchemaField;
    class function NewSchemaFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
    class function NewSchemaTable(const AContextTable: IioTable): IioDBBuilderSchemaTable;
    class function NewSqlGenerator(const ASchema: IioDBBuilderSchema): IioDBBuilderSqlGenerator;
    class function NewStrategy(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderStrategy;
  end;

implementation

uses
  iORM.DBBuilder.Schema, iORM.DBBuilder.Schema.Table, iORM.DBBuilder.Schema.Field, iORM.DBBuilder.Schema.FK,
  iORM.DBBuilder.Schema.Builder, iORM.DB.ConnectionContainer, iORM.DB.Interfaces, iORM.DBBuilder.SqlGenerator.Firebird,
  iORM.DBBuilder.SqlGenerator.SqLite, iORM.DBBuilder.Strategy.WithoutAlterTable,
  iORM.DBBuilder.Strategy.WithAlterTable, iORM.Exceptions, iORM.DBBuilder.DBAnalyzer, iORM.DBBuilder.Engine,
{$IFNDEF ioDelphiProfessional}
  iORM.DBBuilder.SqlGenerator.MSSqlServer,
{$ENDIF}
  iORM.DBBuilder.Schema.Field.ClassInfo;




{ TioDBBuilderFactory }

class function TioDBBuilderFactory.NewDBAnalyzer(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator)
  : IioDBBuilderDBAnalyzer;
begin
  Result := TioDBBuilderDBAnalyzer.Create(ASchema, ASqlGenerator);
end;

class function TioDBBuilderFactory.NewEngine(const AConnectionDefName: String; const AAddIndexes: Boolean;
  const AAddForeignKeys: Boolean): IioDBBuilderEngine;
begin
  Result := TioDBBuilderEngine.Create(AConnectionDefName, AAddIndexes, AAddForeignKeys);
end;

class function TioDBBuilderFactory.NewEngine(const AAddIndexes, AAddForeignKeys: Boolean): IioDBBuilderEngine;
begin
  Result := NewEngine('', AAddIndexes, AAddForeignKeys);
end;

class function TioDBBuilderFactory.NewSchema(const AConnectionDefName: String; const AIndexesEnabled, AForeignKeysEnabled: Boolean)
  : IioDBBuilderSchema;
begin
  Result := TioDBBuilderSchema.Create(AConnectionDefName, AIndexesEnabled, AForeignKeysEnabled);
  NewSchemaBuilder.BuildSchema(Result);
end;

class function TioDBBuilderFactory.NewSchemaBuilder: TioDBBuilderSchemaBuilderRef;
begin
  Result := TioDBBuilderSchemaBuilder;
end;

class function TioDBBuilderFactory.NewSchemaField(const AContextProperty: IioProperty): IioDBBuilderSchemaField;
begin
  Result := TioDBBuilderSchemaField.Create(AContextProperty);
end;

class function TioDBBuilderFactory.NewSchemaFieldClassInfo: IioDBBuilderSchemaField;
begin
  Result := TioDBBuilderSchemaFieldClassInfo.Create;
end;

class function TioDBBuilderFactory.NewSchemaFK(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
  const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
begin
  Result := TioDBBuilderSchemaFK.Create(AReferenceMap, ADependentMap, ADependentProperty, AOnDeleteAction, AOnUpdateAction);
end;

class function TioDBBuilderFactory.NewSchemaTable(const AContextTable: IioTable): IioDBBuilderSchemaTable;
begin
  Result := TioDBBuilderSchemaTable.Create(AContextTable);
end;

class function TioDBBuilderFactory.NewSqlGenerator(const ASchema: IioDBBuilderSchema): IioDBBuilderSqlGenerator;
begin
  case TioConnectionManager.GetConnectionInfo(ASchema.ConnectionDefName).ConnectionType of
    ctFirebird:
      Result := TioDBBuilderSqlGenFirebird.Create(ASchema);
    ctSQLite:
      Result := TioDBBuilderSqlGenSQLite.Create(ASchema);
{$IFNDEF ioDelphiProfessional}
    ctSQLServer:
      Result := TioDBBuilderSqlGenMSSqlServer.Create(ASchema);
{$ENDIF}
  else
    raise EioException.Create(ClassName, 'NewSqlGenerator', 'Connection type not found');
  end;
end;

class function TioDBBuilderFactory.NewStrategy(const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator)
  : IioDBBuilderStrategy;
begin
  case TioConnectionManager.GetConnectionInfo(ASchema.ConnectionDefName).ConnectionType of
    ctFirebird {$IFNDEF ioDelphiProfessional}, ctSQLServer {$ENDIF}:
      Result := TioDBBuilderStrategyWithAlter.Create(ASchema, ASqlGenerator);
    ctSQLite:
      Result := TioDBBuilderStrategyWithoutAlter.Create(ASchema, ASqlGenerator);
  else
    raise EioException.Create(ClassName, 'NewStrategy', 'Connection type not found');
  end;
end;

end.
