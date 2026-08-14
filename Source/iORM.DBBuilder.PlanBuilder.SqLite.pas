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
unit iORM.DBBuilder.PlanBuilder.SqLite;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.PlanBuilder.Base;

type

  TioDBBuilderPlanBuilderSqLite = class(TioDBBuilderPlanBuilderBase)
  protected
    function FindPhysicalFK(const AMappedTable: IioDBBuilderSchemaTable; const AMappedFK: IioDBBuilderSchemaFK;
      const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK; override;
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderPlanBuilderSqLite }

function TioDBBuilderPlanBuilderSqLite.FindPhysicalFK(const AMappedTable: IioDBBuilderSchemaTable;
  const AMappedFK: IioDBBuilderSchemaFK; const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK;
var
  LPhysicalFK: IioDBBuilderSchemaFK;
begin
  // SQLite foreign keys are unnamed: match by dependent field + reference table, exactly as the current
  // Check_ForeignKeyExists does. (AMappedTable is unused - the name is irrelevant for the SQLite match.)
  Result := nil;
  for LPhysicalFK in APhysicalTable.ForeignKeys.Values do
    if SameText(LPhysicalFK.DependentFieldName, AMappedFK.DependentFieldName) and
       SameText(LPhysicalFK.ReferenceTableName, AMappedFK.ReferenceTableName) then
      Exit(LPhysicalFK);
end;

end.
