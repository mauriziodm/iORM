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
  System.Classes, System.Rtti,

  iORM.DBBuilder.Interfaces,
  iORM.Context.Table.Interfaces,
  iORM.Context.Properties.Interfaces,
  iORM.Context.Map.Interfaces,
  iORM.Attributes,
  iORM.CommonTypes

  ;

type

  TioDBBuilderFactory = class
  private
  protected
  public
    class function NewContext(const AConnectionDefName: String; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderContext;
    class function NewDBBuilder: IioDBBuilder;
    class function NewIntrospector(const AContext: IioDBBuilderContext; const AStrategy: IioDBBuilderStrategy): IioDBBuilderIntrospector;
    class function NewPlan: IioDBBuilderPlan;
    class function NewPlanBuilder(const AContext: IioDBBuilderContext): IioDBBuilderPlanBuilder;
    class function NewReconciliation(const AConnectionDefName: String; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode;
      const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderReconciliation;
    // A bare schema (no SchemaBuilder / no ORM build): used for the Physical branch, which the
    // Introspector fills with catalog-backed table nodes via AddTable.
    class function NewSchema(const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderSchema;
    class function NewSchemaBuilder(const AConnectionDefName: String; const ASchema: IioDBBuilderSchema;
      const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderSchemaBuilder;
    class function NewSchemaField_ClassInfo(const AConnectionDefName: String; const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderSchemaField;
    class function NewSchemaField_Mapped(const AContextProperty: IioProperty; const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderSchemaField;
    class function NewSchemaField_Physical(const AConnectionDefName, AFieldName, AFieldTypeRaw, AFieldDefaultRaw: String;
      const AFieldType: TioMetadataFieldType; const AFieldLength, AFieldPrecision, AFieldScale: Integer;
      const AFieldNotNull: Boolean; const AFieldDefault: TValue; const AFieldSubtype, AFieldCustomType: String;
      const AFieldUnicode, APrimaryKey: Boolean): IioDBBuilderSchemaField;
    class function NewSchemaFK_Mapped(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty; const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
    class function NewSchemaFK_Physical(const AConnectionDefName, AName, ADependentTableName, ADependentFieldName,
      AReferenceTableName, AReferenceFieldName: String; const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
    class function NewSchemaIndex(const AIndex: ioIndex; const AConnectionDefName: String): IioDBBuilderSchemaIndex;
    class function NewSchemaRDBMSInfo(const AName, ARaw, AVersion: String; const AMajorVersion, AMinorVersion: Integer): IioDBBuilderSchemaRDBMSInfo;
    class function NewSchemaTable_Mapped(const AContextTable: IioTable;
      const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
    class function NewSchemaTable_Physical(const AConnectionDefName, AName: String): IioDBBuilderSchemaTable;
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
  iORM.Exceptions, iORM.DBBuilder, iORM.DBBuilder.Context, iORM.DBBuilder.Script,
  iORM.DBBuilder.Schema.Index,
  iORM.DBBuilder.SqlGenerator.MSSqlServer,
  iORM.DBBuilder.Strategy.MSSqlServer,
  iORM.DBBuilder.Schema.RDBMSInfo,
  iORM.DBBuilder.Plan,
  iORM.DBBuilder.Reconciliation,
  iORM.DBBuilder.Introspector.SqLite,
  iORM.DBBuilder.Introspector.Firebird,
  iORM.DBBuilder.PlanBuilder.WithAlterTable,
  iORM.DBBuilder.PlanBuilder.WithoutAlterTable

  ;

{ TioDBBuilderFactory }

class function TioDBBuilderFactory.NewContext(const AConnectionDefName: String; const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderContext;
begin
  Result := TioDBBuilderContext.Create(AConnectionDefName, AIndexesMode, AForeignKeysMode);
end;

class function TioDBBuilderFactory.NewDBBuilder: IioDBBuilder;
begin
  Result := TioDBBuilder.Create;
end;

class function TioDBBuilderFactory.NewIntrospector(const AContext: IioDBBuilderContext; const AStrategy: IioDBBuilderStrategy): IioDBBuilderIntrospector;
begin
  case TioConnectionManager.GetConnectionInfo(AContext.ConnectionDefName).ConnectionType of
    ctFirebird:
      Result := TioDBBuilderIntrospectorFirebird.Create(AContext, AStrategy);
    ctSQLite:
      Result := TioDBBuilderIntrospectorSqLite.Create(AContext, AStrategy);
  else
    raise EioDBBuilderException.Create(ClassName, 'NewIntrospector', 'Connection type not supported by the introspector yet.');
  end;
end;

class function TioDBBuilderFactory.NewPlan: IioDBBuilderPlan;
begin
  Result := TioDBBuilderPlan.Create;
end;

class function TioDBBuilderFactory.NewPlanBuilder(const AContext: IioDBBuilderContext): IioDBBuilderPlanBuilder;
begin
  // Pick the build shape by DBMS capability (mirrors NewStrategy's WithAlterTable/WithoutAlterTable split):
  // in-place ALTER -> fine-grained ops; no ALTER -> rename-create-copy rebuild ops. The dialect-specific
  // work still lives in the Introspector (catalog reads) and the SqlGenerator (comparison, name computation).
  if AContext.SqlGenerator.Supports_AlterTable then
    Result := TioDBBuilderPlanBuilderWithAlterTable.Create(AContext)
  else
    Result := TioDBBuilderPlanBuilderWithoutAlterTable.Create(AContext);
end;

class function TioDBBuilderFactory.NewReconciliation(const AConnectionDefName: String; const AIndexesMode,
  AForeignKeysMode: TioDBBuilderIndexesAndFKMode; const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderReconciliation;
var
  LMappedSchema: IioDBBuilderSchema;
begin
  // Physical is left nil here - the Introspector fills it in a later phase.
  LMappedSchema := NewSchema(AIndexesMode, AForeignKeysMode);
  NewSchemaBuilder(AConnectionDefName, LMappedSchema, ASqlGenerator).BuildSchema;
  Result := TioDBBuilderReconciliation.Create(LMappedSchema, NewPlan);
end;

// A bare schema (no SchemaBuilder / no ORM build): used for the Physical branch, which the Introspector
// fills with catalog-backed table nodes via AddTable.
class function TioDBBuilderFactory.NewSchema(const AIndexesMode, AForeignKeysMode: TioDBBuilderIndexesAndFKMode): IioDBBuilderSchema;
begin
  Result := TioDBBuilderSchema.Create(AIndexesMode, AForeignKeysMode);
end;

class function TioDBBuilderFactory.NewSchemaBuilder(const AConnectionDefName: String; const ASchema: IioDBBuilderSchema;
  const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderSchemaBuilder;
begin
  Result := TioDBBuilderSchemaBuilder.Create(AConnectionDefName, ASchema, ASqlGenerator);
end;

// ConnectionDefName is required to apply database-specific identifier normalization. FieldTypeRaw/
// FieldDefaultRaw are set here, not in the constructor: they require rendering the field through
// ASqlGenerator, which needs a stable interface reference to it - not Self mid-constructor (see
// TioDBBuilderSchemaField's class doc comment). Result already holds one by the time we pass it in.
class function TioDBBuilderFactory.NewSchemaField_ClassInfo(const AConnectionDefName: String;
  const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderSchemaField;
var
  LField: TioDBBuilderSchemaField;
begin
  LField := TioDBBuilderSchemaField.CreateClassInfo(AConnectionDefName);
  Result := LField;
  LField.SetFieldTypeRaw(ASqlGenerator.Translate_SchemaField_To_FieldType(Result, False));
  LField.SetFieldDefaultRaw(ASqlGenerator.Translate_SchemaField_To_DefaultValue(Result));
end;

// Same two-phase freeze as NewSchemaField_ClassInfo - see its comment.
class function TioDBBuilderFactory.NewSchemaField_Mapped(const AContextProperty: IioProperty;
  const ASqlGenerator: IioDBBuilderSqlGenerator): IioDBBuilderSchemaField;
var
  LField: TioDBBuilderSchemaField;
begin
  LField := TioDBBuilderSchemaField.CreateMapped(AContextProperty);
  Result := LField;
  LField.SetFieldTypeRaw(ASqlGenerator.Translate_SchemaField_To_FieldType(Result, False));
  LField.SetFieldDefaultRaw(ASqlGenerator.Translate_SchemaField_To_DefaultValue(Result));
end;

class function TioDBBuilderFactory.NewSchemaField_Physical(const AConnectionDefName, AFieldName, AFieldTypeRaw, AFieldDefaultRaw: String;
  const AFieldType: TioMetadataFieldType; const AFieldLength, AFieldPrecision, AFieldScale: Integer;
  const AFieldNotNull: Boolean; const AFieldDefault: TValue; const AFieldSubtype, AFieldCustomType: String;
  const AFieldUnicode, APrimaryKey: Boolean): IioDBBuilderSchemaField;
begin
  Result := TioDBBuilderSchemaField.CreatePhysical(AConnectionDefName, AFieldName, AFieldTypeRaw, AFieldDefaultRaw,
    AFieldType, AFieldLength, AFieldPrecision, AFieldScale, AFieldNotNull, AFieldDefault, AFieldSubtype,
    AFieldCustomType, AFieldUnicode, APrimaryKey);
end;

class function TioDBBuilderFactory.NewSchemaFK_Mapped(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
  const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
begin
  Result := TioDBBuilderSchemaFK.CreateMapped(AReferenceMap, ADependentMap, ADependentProperty, AOnDeleteAction, AOnUpdateAction);
end;

class function TioDBBuilderFactory.NewSchemaFK_Physical(const AConnectionDefName, AName, ADependentTableName, ADependentFieldName,
  AReferenceTableName, AReferenceFieldName: String; const AOnDeleteAction, AOnUpdateAction: TioFKAction): IioDBBuilderSchemaFK;
begin
  Result := TioDBBuilderSchemaFK.CreatePhysical(AConnectionDefName, AName, ADependentTableName, ADependentFieldName,
    AReferenceTableName, AReferenceFieldName, AOnDeleteAction, AOnUpdateAction);
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

class function TioDBBuilderFactory.NewSchemaTable_Mapped(const AContextTable: IioTable;
  const AKeyGenerationStrategy: TioKeyGenerationStrategyType): IioDBBuilderSchemaTable;
begin
  Result := TioDBBuilderSchemaTable.CreateMapped(AContextTable, AKeyGenerationStrategy);
end;

class function TioDBBuilderFactory.NewSchemaTable_Physical(const AConnectionDefName, AName: String): IioDBBuilderSchemaTable;
begin
  Result := TioDBBuilderSchemaTable.CreatePhysical(AConnectionDefName, AName);
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
