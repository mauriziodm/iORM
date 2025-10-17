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
unit iORM.DBBuilder.DBAnalyzer;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  TioDBBuilderDBAnalyzer = class(TInterfacedObject, IioDBBuilderDBAnalyzer)
  private
    FSchema: IioDBBuilderSchema;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    FConnectionDefName: string;
    FStrategy: IioDBBuilderStrategy;
    function GetConnectionDefName: string;
    function GetSchema: IioDBBuilderSchema;
    function GetSqlGenerator: IioDBBuilderSqlGenerator;
    function GetStrategy: IioDBBuilderStrategy;
  protected
    procedure AnalyzeFields(const ATable: IioDBBuilderSchemaTable); virtual;
    function DatabaseExists: boolean; virtual;
    function FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual;
    function FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean; virtual;
    function TableExists(const ATable: IioDBBuilderSchemaTable): Boolean; virtual;

    property ConnectionDefName: string read GetConnectionDefName;
    property Schema: IioDBBuilderSchema read GetSchema;
    property SqlGenerator: IioDBBuilderSqlGenerator read GetSqlGenerator;
    property Strategy: IioDBBuilderStrategy read GetStrategy;
  public
    constructor Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);

    procedure Analyze(const ForceCreate: boolean = false); virtual;
  end;

implementation

uses
  iORM,
  iORM.DB.Factory,
  iORM.DB.Interfaces,
  iORM.DB.ConnectionContainer,
  iORM.DBBuilder.Factory,
  iORM.DBBuilder.QueryEngine

  ;

{ TioDBBuilderDBAnalyzer }

constructor TioDBBuilderDBAnalyzer.Create(const AConnectionDefName: string; const ASchema: IioDBBuilderSchema; const ASqlGenerator: IioDBBuilderSqlGenerator);
begin
  FSchema := ASchema;
  FSqlGenerator := ASqlGenerator;
  FConnectionDefName := AConnectionDefName;
  FStrategy := TioDBBuilderFactory.NewStrategy(AConnectionDefName, FSchema, FSqlGenerator);
end;

function TioDBBuilderDBAnalyzer.DatabaseExists: boolean;
begin
  Result := Strategy.DatabaseExists;
end;

function TioDBBuilderDBAnalyzer.FieldExists(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
begin
  Result := Strategy.FieldExists(ATable, AField);
end;

function TioDBBuilderDBAnalyzer.FieldModified(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): boolean;
begin
  Result := Strategy.FieldModified(ATable, AField);
end;

function TioDBBuilderDBAnalyzer.GetConnectionDefName: string;
begin
  Result := FConnectionDefName;
end;

function TioDBBuilderDBAnalyzer.GetSchema: IioDBBuilderSchema;
begin
  Result := FSchema;
end;

function TioDBBuilderDBAnalyzer.GetSqlGenerator: IioDBBuilderSqlGenerator;
begin
  Result := FSqlGenerator;
end;

function TioDBBuilderDBAnalyzer.GetStrategy: IioDBBuilderStrategy;
begin
  Result := FStrategy;
end;

function TioDBBuilderDBAnalyzer.TableExists(const ATable: IioDBBuilderSchemaTable): Boolean;
begin
  Result := Strategy.TableExists(ATable);
end;

procedure TioDBBuilderDBAnalyzer.Analyze(const ForceCreate: boolean);
begin
  // Analyze if the database exists and set  it's status
  if ForceCreate or not DatabaseExists then
    Schema.Status := stCreate;
end;

procedure TioDBBuilderDBAnalyzer.AnalyzeFields(const ATable: IioDBBuilderSchemaTable);
var
  LField: IioDBBuilderSchemaField;
begin
  // Loop for all fields in the table
  for LField in ATable.Fields do
  begin
    // Analyze the field and set it's status
    if not FieldExists(ATable, LField) then
      LField.Status := stCreate
    else if FieldModified(ATable, LField) then
      LField.Status := stUpdate;

    // If the field status is not dbsClean (field modified) then
    //  table status became dbsAlter
    if LField.Status > stClean then
      ATable.Status := stUpdate;
  end;
end;

end.
