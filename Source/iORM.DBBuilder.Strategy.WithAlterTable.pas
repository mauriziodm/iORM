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
unit iORM.DBBuilder.Strategy.WithAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.DBBuilder.Strategy.Base;

type

  TioDBBuilderStrategyWithAlter = class(TioDBBuilderStrategyBase)
  protected
    procedure AlterTable(const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const ATable: IioDBBuilderSchemaTable); override;
  public
    procedure GenerateScript; override;
  end;

implementation

{ TioDBBuilderStrategyWithAlter }

procedure TioDBBuilderStrategyWithAlter.AlterTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;
  SqlGenerator.BeginAlterTable(ATable);
  AddOrAlterFields(ATable);
  SqlGenerator.EndAlterTable(ATable);
end;

procedure TioDBBuilderStrategyWithAlter.CreateTable(const ATable: IioDBBuilderSchemaTable);
begin
  inherited;
  SqlGenerator.BeginCreateTable(ATable);
  CreateFields(ATable);
  SqlGenerator.EndCreateTable(ATable);
  SqlGenerator.ScriptAddEmpty;
  SqlGenerator.AddPrimaryKey(ATable);
end;

procedure TioDBBuilderStrategyWithAlter.GenerateScript;
begin
  inherited;
  SqlGenerator.ScriptBegin;
  DropForeignKeys;
  DropIndexes;
  CreateOrAlterTables;
  CreateSequences;
  if Schema.IndexesEnabled then
    CreateIndexes;
  if Schema.ForeignKeysEnabled then
    CreateForeignKeys;
  SqlGenerator.ScriptEnd;;
end;

end.
