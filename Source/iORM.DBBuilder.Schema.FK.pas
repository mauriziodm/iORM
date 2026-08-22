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
unit iORM.DBBuilder.Schema.FK;

interface

uses
  iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Schema.Base, iORM.Attributes;

type

  /// <summary>
  ///  A foreign key node of either branch of the schema diff. One class, one shape, two constructors:
  ///  CreateMapped populates it from the ORM maps at schema-build time, CreatePhysical from the DB
  ///  catalog at introspect time. Every value is frozen to a plain value at construction - nothing
  ///  outside this unit ever reaches into a live IioMap/IioProperty. Name differs by branch: Mapped
  ///  synthesizes it from the structural raw names (dependent table/field, reference table/field) since
  ///  no ORM-level FK name exists; Physical stores the actual constraint name from the catalog (needed
  ///  for DROP) - the two are not expected to match as strings, which is exactly why the PlanBuilder
  ///  matches a mapped FK to its physical counterpart structurally, never by Name.
  /// </summary>
  TioDBBuilderSchemaFK = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaFK)
  private
    FDependentFieldName: String;
    FDependentTableName: String;
    FName: String;
    FOnDeleteAction: TioFKAction;
    FOnUpdateAction: TioFKAction;
    FReferenceFieldName: String;
    FReferenceTableName: String;
    FSqlDependentFieldName: String;
    FSqlDependentTableName: String;
    FSqlReferenceFieldName: String;
    FSqlReferenceTableName: String;
    function GetDependentFieldName: String;
    function GetDependentTableName: String;
    function GetName: String;
    function GetOnDeleteAction: TioFKAction;
    function GetOnUpdateAction: TioFKAction;
    function GetReferenceFieldName: String;
    function GetReferenceTableName: String;
    function GetSqlDependentFieldName: String;
    function GetSqlDependentTableName: String;
    function GetSqlReferenceFieldName: String;
    function GetSqlReferenceTableName: String;
  protected
  public
    // Mapped branch: built from the ORM maps at schema-build time. Name is synthesized from the raw
    // (no-delimiter) dependent/reference table+field names, since the ORM has no FK-name concept.
    constructor CreateMapped(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    // Physical branch: built from the DB catalog at introspect time. AName is the actual constraint
    // name (used for DROP); the other names are normalized/quoted per the connection's dialect so they
    // compare like-for-like with the Mapped side.
    constructor CreatePhysical(const AConnectionDefName, AName, ADependentTableName, ADependentFieldName,
      AReferenceTableName, AReferenceFieldName: String; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
  end;

implementation

uses
  System.SysUtils, iORM.DB.Factory;

{ TioDBBuilderSchemaFK }

constructor TioDBBuilderSchemaFK.CreateMapped(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
  const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  inherited Create;
  FDependentFieldName := ADependentProperty.GetSqlFieldName(False);  // Case normalized, no delimiters
  FDependentTableName := ADependentMap.GetTable.TableName;  // Already case normalized (FASE 3)
  FOnDeleteAction := AOnDeleteAction;
  FOnUpdateAction := AOnUpdateAction;
  FReferenceFieldName := AReferenceMap.GetProperties.GetIdProperty.GetSqlFieldName(False);  // Case normalized, no delimiters
  FReferenceTableName := AReferenceMap.GetTable.TableName;  // Already case normalized (FASE 3)
  FSqlDependentFieldName := ADependentProperty.GetSqlFieldName(True);  // Case normalized + delimiters
  FSqlDependentTableName := ADependentMap.GetTable.GetSql;  // Already case normalized + delimiters (FASE 3)
  FSqlReferenceFieldName := AReferenceMap.GetProperties.GetIdProperty.GetSqlFieldName(True);  // Case normalized + delimiters
  FSqlReferenceTableName := AReferenceMap.GetTable.GetSql;  // Already case normalized + delimiters (FASE 3)
  // Built from raw names (case normalized, no delimiters) - no ORM-level FK name to read
  FName := Format('%s_%s_%s_%s', [FDependentTableName, FDependentFieldName, FReferenceTableName, FReferenceFieldName]);
end;

constructor TioDBBuilderSchemaFK.CreatePhysical(const AConnectionDefName, AName, ADependentTableName, ADependentFieldName,
  AReferenceTableName, AReferenceFieldName: String; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  inherited Create;
  FDependentFieldName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(ADependentFieldName, False);
  FDependentTableName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(ADependentTableName, False);
  FName := AName;  // Actual catalog constraint name, not synthesized - see the class doc comment
  FOnDeleteAction := AOnDeleteAction;
  FOnUpdateAction := AOnUpdateAction;
  FReferenceFieldName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AReferenceFieldName, False);
  FReferenceTableName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AReferenceTableName, False);
  FSqlDependentFieldName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(ADependentFieldName, True);
  FSqlDependentTableName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(ADependentTableName, True);
  FSqlReferenceFieldName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AReferenceFieldName, True);
  FSqlReferenceTableName := TioDbFactory.SqlDataConverter(AConnectionDefName).NormalizeSqlIdentifier(AReferenceTableName, True);
end;

function TioDBBuilderSchemaFK.GetDependentFieldName: String;
begin
  Result := FDependentFieldName;
end;

function TioDBBuilderSchemaFK.GetDependentTableName: String;
begin
  Result := FDependentTableName;
end;

function TioDBBuilderSchemaFK.GetName: String;
begin
  Result := FName;
end;

function TioDBBuilderSchemaFK.GetOnDeleteAction: TioFKAction;
begin
  Result := FOnDeleteAction;
end;

function TioDBBuilderSchemaFK.GetOnUpdateAction: TioFKAction;
begin
  Result := FOnUpdateAction;
end;

function TioDBBuilderSchemaFK.GetReferenceFieldName: String;
begin
  Result := FReferenceFieldName;
end;

function TioDBBuilderSchemaFK.GetReferenceTableName: String;
begin
  Result := FReferenceTableName;
end;

function TioDBBuilderSchemaFK.GetSqlDependentFieldName: String;
begin
  Result := FSqlDependentFieldName;
end;

function TioDBBuilderSchemaFK.GetSqlDependentTableName: String;
begin
  Result := FSqlDependentTableName;
end;

function TioDBBuilderSchemaFK.GetSqlReferenceFieldName: String;
begin
  Result := FSqlReferenceFieldName;
end;

function TioDBBuilderSchemaFK.GetSqlReferenceTableName: String;
begin
  Result := FSqlReferenceTableName;
end;

end.
