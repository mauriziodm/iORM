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
unit iORM.DBBuilder.PlanBuilder.Firebird;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.PlanBuilder.Base;

type

  TioDBBuilderPlanBuilderFirebird = class(TioDBBuilderPlanBuilderBase)
  protected
    function FindPhysicalFK(const AMappedTable: IioDBBuilderSchemaTable; const AMappedFK: IioDBBuilderSchemaFK;
      const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK; override;
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderPlanBuilderFirebird }

function TioDBBuilderPlanBuilderFirebird.FindPhysicalFK(const AMappedTable: IioDBBuilderSchemaTable;
  const AMappedFK: IioDBBuilderSchemaFK; const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderSchemaFK;
var
  LMappedFKName: String;
  LPhysicalFK: IioDBBuilderSchemaFK;
begin
  // Firebird foreign keys are matched by their deterministic constraint name (the hash encodes the
  // structural properties), exactly as the current Check_ForeignKeyExists does: compute the name the
  // mapped FK would have, then look for it among the physical FKs.
  Result := nil;
  LMappedFKName := FContext.SqlGenerator.Translate_SchemaTableAndFK_To_FKName(AMappedTable, AMappedFK);
  for LPhysicalFK in APhysicalTable.ForeignKeys.Values do
    if SameText(LPhysicalFK.Name, LMappedFKName) then
      Exit(LPhysicalFK);
end;

end.
