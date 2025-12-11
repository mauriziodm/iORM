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
unit iORM.DBBuilder.Schema.Table;

interface

uses
  iORM.DBBuilder.Interfaces, iORM.Context.Table.Interfaces, iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Attributes;

type

  TioDBBuilderSchemaTable = class(TInterfacedObject, IioDBBuilderSchemaTable)
  private
    FContextTable: IioTable;
    FFields: TioDBBuilderSchemaFields;
    FForeignKeys: TioDBBuilderSchemaForeignKeys;
    FIndexes: TioDBBuilderSchemaIndexes;
    FIsTrueClass: Boolean;
    FPrimaryKeyField: IioDBBuilderSchemaField;
    FStatus: TioDBBuilderStatus;
    FChanges: TioDBBuilderTableChanges;
    function FieldExists(const AFieldName: String): boolean;
    // IsTrueClass
    function GetIsTrueClass: Boolean;
    procedure SetIsTrueClass(const AValue: Boolean);
    // Status
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const AValue: TioDBBuilderStatus);
    function GetChanges: TioDBBuilderTableChanges;
  public
    constructor Create(const AContextTable: IioTable);
    destructor Destroy; override;

    procedure AddChange(const AChange: TioDBBuilderTableChange);
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function GetFields: TioDBBuilderSchemaFields;
    function GetForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetContextTable: IioTable;
    function GetSequenceName: String;
    function GetIndexes: TioDBBuilderSchemaIndexes;
    function GetPrimaryKeyField: IioDBBuilderSchemaField;
    function GetName: String;

    property ContextTable: IioTable read GetContextTable;
    property Changes: TioDBBuilderTableChanges read GetChanges;
    property Fields: TioDBBuilderSchemaFields read GetFields;
    property ForeignKeys: TioDBBuilderSchemaForeignKeys read GetForeignKeys;
    property Indexes: TioDBBuilderSchemaIndexes read GetIndexes;
    property IsTrueClass: Boolean read GetIsTrueClass write SetIsTrueClass;
    property Name: string read GetName;
    property PrimaryKeyField: IioDBBuilderSchemaField read GetPrimaryKeyField;
    property SequenceName: string read GetSequenceName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  iORM.CommonTypes, System.SysUtils, iORM.DBBuilder.Factory;

{ TioDBBuilderSchemaTable }

procedure TioDBBuilderSchemaTable.AddChange(const AChange: TioDBBuilderTableChange);
begin
  Include(FChanges, AChange);
end;

procedure TioDBBuilderSchemaTable.AddField(ASchemaField: IioDBBuilderSchemaField);
begin
  // Add field if not already exists
  if not FieldExists(ASchemaField.FieldName) then
    FFields.Add(ASchemaField);
  // If this field is the primary key field
  if ASchemaField.PrimaryKey then
    FPrimaryKeyField := ASchemaField;
end;

constructor TioDBBuilderSchemaTable.Create(const AContextTable: IioTable);
begin
  FChanges := [];
  FStatus := stClean;
  FContextTable := AContextTable;
  FIsTrueClass := AContextTable.IsTrueClass;
  FFields := TioDBBuilderSchemaFields.Create;
  FForeignKeys := TioDBBuilderSchemaForeignKeys.Create;
  FIndexes := TioDBBuilderSchemaIndexes.Create;
end;

destructor TioDBBuilderSchemaTable.Destroy;
begin
  FFields.Free;
  FForeignKeys.Free;
  FIndexes.Free;
  inherited;
end;

function TioDBBuilderSchemaTable.FieldExists(const AFieldName: String): boolean;
var
  LField: IioDBBuilderSchemaField;
begin
  for LField in FFields do
    if LField.FieldName.Equals(AFieldName) then
      Exit(True);
  Result := False;
end;

function TioDBBuilderSchemaTable.GetFields: TioDBBuilderSchemaFields;
begin
  Result := FFields;
end;

procedure TioDBBuilderSchemaTable.AddIndex(const AIndexAttr: ioIndex);
begin
  // Add index if not already exists
  if not FIndexes.ContainsKey(AIndexAttr.IndexName) then
    FIndexes.Add(AIndexAttr.IndexName, TioDBBuilderFactory.NewSchemaIndex(AIndexAttr));
end;

procedure TioDBBuilderSchemaTable.AddForeignKey(const AReferenceMap, ADependentMap: IioMap;
  const ADependentProperty: IioProperty; const AOnDeleteAction, AOnUpdateAction: TioFKAction);
var
  LForeignKey: IioDBBuilderSchemaFK;
begin
  // Add tne FK if not already exists
  LForeignKey := TioDBBuilderFactory.NewSchemaFK(AReferenceMap, ADependentMap, ADependentProperty, AOnDeleteAction, AOnUpdateAction);
  if not FForeignKeys.ContainsKey(LForeignKey.Name) then
    FForeignKeys.Add(LForeignKey.Name, LForeignKey);
end;

function TioDBBuilderSchemaTable.GetForeignKeys: TioDBBuilderSchemaForeignKeys;
begin
  Result := FForeignKeys;
end;

function TioDBBuilderSchemaTable.GetIndexes: TioDBBuilderSchemaIndexes;
begin
  Result := FIndexes;
end;

function TioDBBuilderSchemaTable.GetPrimaryKeyField: IioDBBuilderSchemaField;
begin
  Result := FPrimaryKeyField;
end;

function TioDBBuilderSchemaTable.GetName: String;
begin
  Result := FContextTable.TableName;
end;

function TioDBBuilderSchemaTable.GetChanges: TioDBBuilderTableChanges;
begin
  Result := FChanges;
end;

function TioDBBuilderSchemaTable.GetContextTable: IioTable;
begin
  Result := FContextTable;
end;

function TioDBBuilderSchemaTable.GetIsTrueClass: Boolean;
begin
  Result := FIsTrueClass;
end;

function TioDBBuilderSchemaTable.GetSequenceName: String;
begin
  Result := FContextTable.GetKeyGenerator;
end;

function TioDBBuilderSchemaTable.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

procedure TioDBBuilderSchemaTable.SetIsTrueClass(const AValue: Boolean);
begin
  // Una volta a true rimane sempre a true
  FIsTrueClass := AValue or FIsTrueClass;
end;

procedure TioDBBuilderSchemaTable.SetStatus(const AValue: TioDBBuilderStatus);
begin
  if AValue > FStatus then
    FStatus := AValue;
end;

end.
