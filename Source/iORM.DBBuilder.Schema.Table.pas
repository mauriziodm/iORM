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
  iORM.Attributes, iORM.CommonTypes;

type

  TioDBBuilderSchemaTable = class(TInterfacedObject, IioDBBuilderSchemaTable)
  private
    FContextTable: IioTable;
    FFields: TioDBBuilderSchemaFields;
    FForeignKeys: TioDBBuilderSchemaForeignKeys;
    FIndexes: TioDBBuilderSchemaIndexes;
    FIsTrueClass: Boolean;
    FKeyGenerationStrategy: TioKeyGenerationStrategyType;
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
    constructor Create(const AContextTable: IioTable; const AKeyGenerationStrategy: TioKeyGenerationStrategyType);
    destructor Destroy; override;

    procedure AddChange(const AChange: TioDBBuilderTableChange);
    procedure AddField(ASchemaField: IioDBBuilderSchemaField);
    procedure AddForeignKey(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);
    procedure AddIndex(const AIndexAttr: ioIndex);
    function GetFields: TioDBBuilderSchemaFields;
    function GetForeignKeys: TioDBBuilderSchemaForeignKeys;
    function GetContextTable: IioTable;
    function GetKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetRequestedKeyGenerationStrategy: TioKeyGenerationStrategyType;
    function GetSequenceName: String;
    function UsesSequenceForKeyGeneration: Boolean;
    function UsesIdentityForKeyGeneration: Boolean;
    function IsKeyGenerationStrategyFallback: Boolean;
    function GetIndexes: TioDBBuilderSchemaIndexes;
    function GetPrimaryKeyField: IioDBBuilderSchemaField;
    function GetName: String;
    function GetSqlName: String;

    property ContextTable: IioTable read GetContextTable;
    property Changes: TioDBBuilderTableChanges read GetChanges;
    property Fields: TioDBBuilderSchemaFields read GetFields;
    property ForeignKeys: TioDBBuilderSchemaForeignKeys read GetForeignKeys;
    property Indexes: TioDBBuilderSchemaIndexes read GetIndexes;
    property IsTrueClass: Boolean read GetIsTrueClass write SetIsTrueClass;
    property KeyGenerationStrategy: TioKeyGenerationStrategyType read GetKeyGenerationStrategy;
    property RequestedKeyGenerationStrategy: TioKeyGenerationStrategyType read GetRequestedKeyGenerationStrategy;
    property Name: string read GetName;
    property SqlName: string read GetSqlName;
    property PrimaryKeyField: IioDBBuilderSchemaField read GetPrimaryKeyField;
    property SequenceName: string read GetSequenceName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  System.SysUtils, iORM.DBBuilder.Factory, iORM.Exceptions;

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

constructor TioDBBuilderSchemaTable.Create(const AContextTable: IioTable;
  const AKeyGenerationStrategy: TioKeyGenerationStrategyType);
begin
  FChanges := [];
  FStatus := stClean;
  FContextTable := AContextTable;
  FIsTrueClass := AContextTable.IsTrueClass;
  FKeyGenerationStrategy := AKeyGenerationStrategy;
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
  if not FIndexes.ContainsKey(AIndexAttr.Name) then
    FIndexes.Add(AIndexAttr.Name, TioDBBuilderFactory.NewSchemaIndex(AIndexAttr, FContextTable.GetTableConnectionName));
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
  Result := FContextTable.TableName;  // Case normalized, no delimiters
end;

function TioDBBuilderSchemaTable.GetSqlName: String;
begin
  Result := FContextTable.GetSql;  // Case normalized + delimiters
end;

function TioDBBuilderSchemaTable.GetChanges: TioDBBuilderTableChanges;
begin
  Result := FChanges;
end;

function TioDBBuilderSchemaTable.GetContextTable: IioTable;
begin
  Result := FContextTable;
end;

function TioDBBuilderSchemaTable.GetKeyGenerationStrategy: TioKeyGenerationStrategyType;
begin
  Result := FKeyGenerationStrategy;
end;

function TioDBBuilderSchemaTable.GetIsTrueClass: Boolean;
begin
  Result := FIsTrueClass;
end;

function TioDBBuilderSchemaTable.GetSequenceName: String;
begin
  if not UsesSequenceForKeyGeneration then
    raise EioDBBuilderException.Create(ClassName, 'GetSequenceName',
      Format('Table "%s" uses Identity for key generation, not Sequence.', [Name]));
  Result := FContextTable.GetKeyGenerator;
end;

function TioDBBuilderSchemaTable.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

// --- Key generation strategy query methods ---
// These methods query the *resolved* strategy (FKeyGenerationStrategy) which was determined
// by Resolve_KeyGenerationStrategy at schema build time. The resolution applies fallback logic:
// if the entity requests a strategy unsupported by this DBMS, the DBMS default is used instead.
// Therefore UsesSequenceForKeyGeneration/UsesIdentityForKeyGeneration always reflect what will
// actually be generated in the DDL, not necessarily what the entity attribute originally requested.
function TioDBBuilderSchemaTable.UsesSequenceForKeyGeneration: Boolean;
begin
  Result := GetKeyGenerationStrategy = kgsSequence;
end;

function TioDBBuilderSchemaTable.UsesIdentityForKeyGeneration: Boolean;
begin
  Result := GetKeyGenerationStrategy = kgsIdentity;
end;

// The strategy the entity originally requested, before Resolve_KeyGenerationStrategy applied
// any DBMS-specific fallback. Notification/diagnostic code must read THIS (not the resolved
// GetKeyGenerationStrategy) to reason about what the developer asked for, otherwise it looks at
// a value the resolver may have already overwritten.
function TioDBBuilderSchemaTable.GetRequestedKeyGenerationStrategy: TioKeyGenerationStrategyType;
begin
  Result := FContextTable.GetKeyGenerationStrategy;
end;

// Returns True if the entity explicitly requested a specific strategy (not kgsAuto) but the
// resolved strategy differs (i.e., fallback was applied). Used by
// SqlGenerator.CheckKeyGenerationCompatibility to emit an informative hint to the user.
function TioDBBuilderSchemaTable.IsKeyGenerationStrategyFallback: Boolean;
begin
  Result := (GetRequestedKeyGenerationStrategy <> kgsAuto) and
            (GetRequestedKeyGenerationStrategy <> FKeyGenerationStrategy);
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
