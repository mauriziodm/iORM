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

  TioDBBuilderSchemaFK = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaFK)
  private
    FDependentMap: IioMap;
    FDependentProperty: IioProperty;
    FOnDeleteAction: TioFKAction;
    FOnUpdateAction: TioFKAction;
    FReferenceMap: IioMap;
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
  public
    constructor Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);

    property DependentFieldName: String read GetDependentFieldName;
    property DependentTableName: String read GetDependentTableName;
    property Name: String read GetName;
    property OnDeleteAction: TioFKAction read GetOnDeleteAction;
    property OnUpdateAction: TioFKAction read GetOnUpdateAction;
    property ReferenceFieldName: String read GetReferenceFieldName;
    property ReferenceTableName: String read GetReferenceTableName;
    property SqlDependentFieldName: String read GetSqlDependentFieldName;
    property SqlDependentTableName: String read GetSqlDependentTableName;
    property SqlReferenceFieldName: String read GetSqlReferenceFieldName;
    property SqlReferenceTableName: String read GetSqlReferenceTableName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderSchemaFK }

// ============================================================
// Raw names (case normalized, no delimiters) - for FK name construction
// ============================================================

function TioDBBuilderSchemaFK.GetDependentFieldName: String;
begin
  Result := FDependentProperty.GetSqlFieldName(False);  // Case normalized, no delimiters
end;

function TioDBBuilderSchemaFK.GetDependentTableName: String;
begin
  Result := FDependentMap.GetTable.TableName;  // Already case normalized (FASE 3)
end;

function TioDBBuilderSchemaFK.GetName: String;
begin
  // Built from raw names (case normalized, no delimiters)
  Result := Format('%s_%s_%s_%s', [DependentTableName, DependentFieldName, ReferenceTableName, ReferenceFieldName]);
end;

function TioDBBuilderSchemaFK.GetReferenceFieldName: String;
begin
  Result := FReferenceMap.GetProperties.GetIdProperty.GetSqlFieldName(False);  // Case normalized, no delimiters
end;

function TioDBBuilderSchemaFK.GetReferenceTableName: String;
begin
  Result := FReferenceMap.GetTable.TableName;  // Already case normalized (FASE 3)
end;

// ============================================================
// SQL names (case normalized + delimiters) - for SQL generation
// ============================================================

function TioDBBuilderSchemaFK.GetSqlDependentFieldName: String;
begin
  Result := FDependentProperty.GetSqlFieldName(True);  // Case normalized + delimiters
end;

function TioDBBuilderSchemaFK.GetSqlDependentTableName: String;
begin
  Result := FDependentMap.GetTable.GetSql;  // Already case normalized + delimiters (FASE 3)
end;

function TioDBBuilderSchemaFK.GetSqlReferenceFieldName: String;
begin
  Result := FReferenceMap.GetProperties.GetIdProperty.GetSqlFieldName(True);  // Case normalized + delimiters
end;

function TioDBBuilderSchemaFK.GetSqlReferenceTableName: String;
begin
  Result := FReferenceMap.GetTable.GetSql;  // Already case normalized + delimiters (FASE 3)
end;

// ============================================================
// Other methods
// ============================================================

function TioDBBuilderSchemaFK.GetOnDeleteAction: TioFKAction;
begin
  Result := FOnDeleteAction;
end;

function TioDBBuilderSchemaFK.GetOnUpdateAction: TioFKAction;
begin
  Result := FOnUpdateAction;
end;

constructor TioDBBuilderSchemaFK.Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  FStatus := stClean;
  FReferenceMap := AReferenceMap;
  FDependentMap := ADependentMap;
  FDependentProperty := ADependentProperty;
  FOnDeleteAction := AOnDeleteAction;
  FOnUpdateAction := AOnUpdateAction;
end;

end.
