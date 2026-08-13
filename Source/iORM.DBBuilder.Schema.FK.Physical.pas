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
unit iORM.DBBuilder.Schema.FK.Physical;

interface

uses
  iORM.Attributes, iORM.DBBuilder.Interfaces, iORM.DBBuilder.Schema.Base;

type

  /// <summary>
  ///  Foreign key of the Physical branch: NOT ORM-backed (no IioMap/IioProperty). Every value is
  ///  stored at construction, read from the live database catalog by the Introspector. Name is the
  ///  actual constraint name from the catalog (used for DROP); the raw names are normalized per the
  ///  connection's dialect so they compare like-for-like with the Mapped side. Status is inherited.
  /// </summary>
  TioDBBuilderSchemaFKPhysical = class(TioDBBuilderSchemaBaseObject, IioDBBuilderSchemaFK)
  private
    FConnectionDefName: String;
    FDependentFieldName: String;
    FDependentTableName: String;
    FName: String;
    FOnDeleteAction: TioFKAction;
    FOnUpdateAction: TioFKAction;
    FReferenceFieldName: String;
    FReferenceTableName: String;
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
    constructor Create(const AConnectionDefName, AName, ADependentTableName, ADependentFieldName,
      AReferenceTableName, AReferenceFieldName: String; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
  end;

implementation

uses
  iORM.DB.Factory;

{ TioDBBuilderSchemaFKPhysical }

constructor TioDBBuilderSchemaFKPhysical.Create(const AConnectionDefName, AName, ADependentTableName,
  ADependentFieldName, AReferenceTableName, AReferenceFieldName: String; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  inherited Create;
  FConnectionDefName := AConnectionDefName;
  FName := AName;
  FDependentTableName := ADependentTableName;
  FDependentFieldName := ADependentFieldName;
  FReferenceTableName := AReferenceTableName;
  FReferenceFieldName := AReferenceFieldName;
  FOnDeleteAction := AOnDeleteAction;
  FOnUpdateAction := AOnUpdateAction;
end;

// Raw names (case normalized, no delimiters)

function TioDBBuilderSchemaFKPhysical.GetDependentFieldName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FDependentFieldName, False);
end;

function TioDBBuilderSchemaFKPhysical.GetDependentTableName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FDependentTableName, False);
end;

function TioDBBuilderSchemaFKPhysical.GetName: String;
begin
  Result := FName;
end;

function TioDBBuilderSchemaFKPhysical.GetOnDeleteAction: TioFKAction;
begin
  Result := FOnDeleteAction;
end;

function TioDBBuilderSchemaFKPhysical.GetOnUpdateAction: TioFKAction;
begin
  Result := FOnUpdateAction;
end;

function TioDBBuilderSchemaFKPhysical.GetReferenceFieldName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FReferenceFieldName, False);
end;

function TioDBBuilderSchemaFKPhysical.GetReferenceTableName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FReferenceTableName, False);
end;

// SQL names (case normalized + delimiters)

function TioDBBuilderSchemaFKPhysical.GetSqlDependentFieldName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FDependentFieldName, True);
end;

function TioDBBuilderSchemaFKPhysical.GetSqlDependentTableName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FDependentTableName, True);
end;

function TioDBBuilderSchemaFKPhysical.GetSqlReferenceFieldName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FReferenceFieldName, True);
end;

function TioDBBuilderSchemaFKPhysical.GetSqlReferenceTableName: String;
begin
  Result := TioDbFactory.SqlDataConverter(FConnectionDefName).NormalizeSqlIdentifier(FReferenceTableName, True);
end;

end.
