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
  iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces, iORM.Attributes;

type

  TioDBBuilderSchemaFK = class(TInterfacedObject, IioDBBuilderSchemaFK)
  private
    FDependentMap: IioMap;
    FDependentProperty: IioProperty;
    FOnDeleteAction: TioFKAction;
    FOnUpdateAction: TioFKAction;
    FReferenceMap: IioMap;
    FStatus: TioDBBuilderStatus;
    // Raw names (case normalized, no delimiters)
    function GetDependentTableName: String;
    function GetDependentFieldName: String;
    function GetName: String;
    function GetReferenceTableName: String;
    function GetReferenceFieldName: String;
    // SQL names (case normalized + delimiters)
    function GetSqlDependentTableName: String;
    function GetSqlDependentFieldName: String;
    function GetSqlName: String;
    function GetSqlReferenceTableName: String;
    function GetSqlReferenceFieldName: String;
    // Other
    function GetOnDeleteAction: TioFKAction;
    function GetOnUpdateAction: TioFKAction;
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    constructor Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);

    // Raw properties
    property DependentTableName: String read GetDependentTableName;
    property DependentFieldName: String read GetDependentFieldName;
    property Name: String read GetName;
    property ReferenceTableName: String read GetReferenceTableName;
    property ReferenceFieldName: String read GetReferenceFieldName;
    // SQL properties
    property SqlName: String read GetSqlName;
    property SqlDependentTableName: String read GetSqlDependentTableName;
    property SqlDependentFieldName: String read GetSqlDependentFieldName;
    property SqlReferenceTableName: String read GetSqlReferenceTableName;
    property SqlReferenceFieldName: String read GetSqlReferenceFieldName;
    // Other
    property OnDeleteAction: TioFKAction read GetOnDeleteAction;
    property OnUpdateAction: TioFKAction read GetOnUpdateAction;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  System.SysUtils, iORM.DB.Factory;

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

function TioDBBuilderSchemaFK.GetSqlName: String;
begin
  // The raw name is already case normalized, just add delimiters
  Result := TioDbFactory.SqlDataConverter(FDependentMap.GetTable.GetTableConnectionName)
    .NormalizeSqlIdentifier(GetName, True);
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

function TioDBBuilderSchemaFK.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

procedure TioDBBuilderSchemaFK.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

end.
