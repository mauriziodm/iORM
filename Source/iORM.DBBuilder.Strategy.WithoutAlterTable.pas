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
unit iORM.DBBuilder.Strategy.WithoutAlterTable;

interface

uses
  iORM.DBBuilder.Interfaces,
  iORM.DBBuilder.Strategy.Base

  ;

type
  TioDBBuilderStrategyWithoutAlter = class(TioDBBuilderStrategyBase)
  protected
    procedure AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    procedure CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable); override;
    procedure CopyDataFromOldToNewTables(const AScript: IioDBBuilderSqlScript);
    procedure CopyDataFromOldToNewTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
    procedure RenameAllTablesToOld(const AScript: IioDBBuilderSqlScript); // For SQLite, if the DB is to be modified (not created) it renames all tables with "_old"
    function Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
    procedure GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean); override;
  public
  end;

implementation

uses
  System.SysUtils,

  iORM.DB.ConnectionContainer

  ;


{ TioDBBuilderStrategyWithoutAlter }

procedure TioDBBuilderStrategyWithoutAlter.AlterTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  AScript.Add(SqlGenerator.BuildBeginAlterTableSql(ATable));
  AScript.IncIndentationLevel;
  AScript.Add(SqlGenerator.BuildCreateFieldsSql(ATable, AScript.CurrentIndentation));

  if Schema.ForeignKeysEnabled then
    CreateForeignKeys(AScript, ATable);

  AScript.DecIndentationLevel;
  AScript.Add(SqlGenerator.BuildEndAlterTableSql(ATable));
end;

procedure TioDBBuilderStrategyWithoutAlter.CopyDataFromOldToNewTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
  LComma: string;
begin
  AScript.AddComment(Format('Copying data from "%s" to "%s"', [Table2OldTableName(ATable), ATable.TableName]));
  // Insert into
  AScript.Add(Format('INSERT INTO %s (', [ATable.TableName]));
  AScript.IncIndentationLevel;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    AScript.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  AScript.DecIndentationLevel;

  // Select from
  AScript.Add(') SELECT');
  AScript.IncIndentationLevel;

  LComma := '  ';

  for LField in ATable.Fields do
  begin
    if LField.Status = stCreate then
      Continue;

    AScript.Add(Format('%s%s', [LComma, LField.FieldName]));
    LComma := ', ';
  end;

  AScript.DecIndentationLevel;

  AScript.Add(Format('FROM %s', [Table2OldTableName(ATable)]));
  AScript.Add(';');
  AScript.AddEmpty;
end;

procedure TioDBBuilderStrategyWithoutAlter.CopyDataFromOldToNewTables(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  AScript.AddTitle('Copying data from "_old" tables.');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stAlter then
      Continue;

    CopyDataFromOldToNewTable(AScript, LTable);
  end;
end;

procedure TioDBBuilderStrategyWithoutAlter.GenerateDatabaseObjects(const AScript: IioDBBuilderSqlScript; const Create: boolean);
begin
  if Create then
  begin
    if Schema.IndexesEnabled then
      CreateIndexes(AScript);
  end
  else
  begin
    DropIndexes(AScript);
    CreateOrAlterTables(AScript);

    if Schema.IndexesEnabled then
      CreateIndexes(AScript);
  end;
end;

procedure TioDBBuilderStrategyWithoutAlter.CreateTable(const AScript: IioDBBuilderSqlScript; const ATable: IioDBBuilderSchemaTable);
begin
  inherited;

  AScript.Add(SqlGenerator.BuildBeginCreateTableSql(ATable));
  AScript.IncIndentationLevel;
  AScript.Add(SqlGenerator.BuildCreateFieldsSql(ATable, AScript.CurrentIndentation), False);

  if Schema.ForeignKeysEnabled then
    CreateForeignKeys(AScript, ATable);

  AScript.DecIndentationLevel;
  AScript.Add(SqlGenerator.BuildEndCreateTableSql(ATable));
end;

procedure TioDBBuilderStrategyWithoutAlter.RenameAllTablesToOld(const AScript: IioDBBuilderSqlScript);
var
  LTable: IioDBBuilderSchemaTable;
begin
  AScript.AddTitle('Renaming table names to "_old"');

  for LTable in Schema.Tables.Values do
  begin
    if LTable.Status <> stAlter then
      Continue;

    AScript.AddComment(Format('Renaming from "%s" to "%s"', [LTable.TableName, Table2OldTableName(LTable)]));
    AScript.Add(Format('DROP TABLE IF EXISTS %s;', [Table2OldTableName(LTable)]));
    AScript.Add(Format('ALTER TABLE %s RENAME TO %s;', [LTable.TableName, Table2OldTableName(LTable)]));
    AScript.AddEmpty;
  end;
end;

function TioDBBuilderStrategyWithoutAlter.Table2OldTableName(const ATable: IioDBBuilderSchemaTable): String;
begin
  Result := Format('_%s_old', [ATable.TableName.ToLower]);
end;

end.
