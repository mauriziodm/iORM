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
unit iORM.DBBuilder.Plan;

interface

uses
  System.Generics.Collections, iORM.DBBuilder.Interfaces;

type

  /// <summary>
  ///  A single schema-change operation: a plain data record of *what* must change. It carries only
  ///  references to the Schema node(s) it concerns plus (for opAlterField) the altered-attribute set,
  ///  and holds no knowledge of *how* to render itself - realization is the dialect's job. Constructed
  ///  only through TioDBBuilderPlan's typed factory methods, which pass exactly the slots each Kind
  ///  needs and leave the rest empty.
  /// </summary>
  TioDBBuilderPlanOperation = class(TInterfacedObject, IioDBBuilderPlanOperation)
  private
    FKind: TioDBBuilderPlanOpKind;
    FSchemaField: IioDBBuilderSchemaField;
    FSchemaField_Changes: TioDBBuilderFieldChanges;
    FSchemaForeignKey: IioDBBuilderSchemaFK;
    FSchemaIndex: IioDBBuilderSchemaIndex;
    FSchemaTable: IioDBBuilderSchemaTable;
    FSequenceName: String;
  protected
    function GetDescription: String;
    function GetKind: TioDBBuilderPlanOpKind;
    function GetSchemaField: IioDBBuilderSchemaField;
    function GetSchemaField_Changes: TioDBBuilderFieldChanges;
    function GetSchemaForeignKey: IioDBBuilderSchemaFK;
    function GetSchemaIndex: IioDBBuilderSchemaIndex;
    function GetSchemaTable: IioDBBuilderSchemaTable;
    function GetSequenceName: String;
  public
    constructor Create(const AKind: TioDBBuilderPlanOpKind; const ATable: IioDBBuilderSchemaTable = nil;
      const AField: IioDBBuilderSchemaField = nil; const AIndex: IioDBBuilderSchemaIndex = nil;
      const AForeignKey: IioDBBuilderSchemaFK = nil; const ASchemaField_Changes: TioDBBuilderFieldChanges = [];
      const ASequenceName: String = '');
  end;

  /// <summary>
  ///  The ordered, dialect-independent list of schema-change operations (the "Plan" of the
  ///  Desired/Actual/Plan reconciliation). Operations are appended through typed factories only, so a
  ///  malformed operation cannot be built by callers. Insertion order IS execution order; producing
  ///  that order (dependency sequencing) is the PlanBuilder's responsibility, not this container's.
  /// </summary>
  TioDBBuilderPlan = class(TInterfacedObject, IioDBBuilderPlan)
  private
    FOperations: TioDBBuilderPlanOperations;
    function AddOp(const AOperation: IioDBBuilderPlanOperation): IioDBBuilderPlanOperation;
  protected
    // TABLE
    function AddCreateTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    // FIELD
    function AddAlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
      const ASchemaField_Changes: TioDBBuilderFieldChanges): IioDBBuilderPlanOperation;
    function AddCreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
    // INDEX
    function AddCreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
    function AddDropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
    // FOREIGN KEY
    function AddCreateForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
    function AddDropForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
    // SEQUENCE
    function AddCreateSequence(const ASequenceName: String): IioDBBuilderPlanOperation;
    function AddDropSequence(const ASequenceName: String): IioDBBuilderPlanOperation;
    // PLAN-WIDE
    procedure Clear;
    function GetCount: Integer;
    function GetIsEmpty: Boolean;
    function GetOperations: TioDBBuilderPlanOperations;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderPlanOperation }

constructor TioDBBuilderPlanOperation.Create(const AKind: TioDBBuilderPlanOpKind; const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField; const AIndex: IioDBBuilderSchemaIndex; const AForeignKey: IioDBBuilderSchemaFK;
  const ASchemaField_Changes: TioDBBuilderFieldChanges; const ASequenceName: String);
begin
  inherited Create;
  FKind := AKind;
  FSchemaTable := ATable;
  FSchemaField := AField;
  FSchemaIndex := AIndex;
  FSchemaForeignKey := AForeignKey;
  FSchemaField_Changes := ASchemaField_Changes;
  FSequenceName := ASequenceName;
end;

function TioDBBuilderPlanOperation.GetDescription: String;
begin
  // Dialect-independent, human-readable summary built from iORM's standard metadata (no SqlGenerator).
  case FKind of
    opCreateTable:      Result := Format('Create table %s', [QuotedStr(FSchemaTable.Name)]);
    opCreateField:      Result := Format('Add field %s to %s', [QuotedStr(FSchemaField.FieldName), QuotedStr(FSchemaTable.Name)]);
    opAlterField:       Result := Format('Alter field %s on %s', [QuotedStr(FSchemaField.FieldName), QuotedStr(FSchemaTable.Name)]);
    opCreateIndex:      Result := Format('Create index on %s (%s)', [QuotedStr(FSchemaTable.Name), FSchemaIndex.CommaSepFieldList]);
    opDropIndex:        Result := Format('Drop index on %s (%s)', [QuotedStr(FSchemaTable.Name), FSchemaIndex.CommaSepFieldList]);
    opCreateForeignKey: Result := Format('Create foreign key on %s referencing %s', [QuotedStr(FSchemaTable.Name), QuotedStr(FSchemaForeignKey.ReferenceTableName)]);
    opDropForeignKey:   Result := Format('Drop foreign key %s on %s', [QuotedStr(FSchemaForeignKey.Name), QuotedStr(FSchemaTable.Name)]);
    opCreateSequence:   Result := Format('Create sequence %s', [QuotedStr(FSequenceName)]);
    opDropSequence:     Result := Format('Drop sequence %s', [QuotedStr(FSequenceName)]);
  else
    Result := '';
  end;
end;

function TioDBBuilderPlanOperation.GetKind: TioDBBuilderPlanOpKind;
begin
  Result := FKind;
end;

function TioDBBuilderPlanOperation.GetSchemaField: IioDBBuilderSchemaField;
begin
  Result := FSchemaField;
end;

function TioDBBuilderPlanOperation.GetSchemaField_Changes: TioDBBuilderFieldChanges;
begin
  Result := FSchemaField_Changes;
end;

function TioDBBuilderPlanOperation.GetSchemaForeignKey: IioDBBuilderSchemaFK;
begin
  Result := FSchemaForeignKey;
end;

function TioDBBuilderPlanOperation.GetSchemaIndex: IioDBBuilderSchemaIndex;
begin
  Result := FSchemaIndex;
end;

function TioDBBuilderPlanOperation.GetSchemaTable: IioDBBuilderSchemaTable;
begin
  Result := FSchemaTable;
end;

function TioDBBuilderPlanOperation.GetSequenceName: String;
begin
  Result := FSequenceName;
end;

{ TioDBBuilderPlan }

constructor TioDBBuilderPlan.Create;
begin
  inherited Create;
  FOperations := TioDBBuilderPlanOperations.Create;
end;

destructor TioDBBuilderPlan.Destroy;
begin
  FOperations.Free;
  inherited;
end;

function TioDBBuilderPlan.AddOp(const AOperation: IioDBBuilderPlanOperation): IioDBBuilderPlanOperation;
begin
  FOperations.Add(AOperation);
  Result := AOperation;
end;

function TioDBBuilderPlan.AddCreateTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opCreateTable, ATable));
end;

function TioDBBuilderPlan.AddAlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField;
  const ASchemaField_Changes: TioDBBuilderFieldChanges): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opAlterField, ATable, AField, nil, nil, ASchemaField_Changes));
end;

function TioDBBuilderPlan.AddCreateField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opCreateField, ATable, AField));
end;

function TioDBBuilderPlan.AddCreateIndex(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opCreateIndex, ATable, nil, AIndex));
end;

function TioDBBuilderPlan.AddDropIndex(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opDropIndex, ATable, nil, AIndex));
end;

function TioDBBuilderPlan.AddCreateForeignKey(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opCreateForeignKey, ATable, nil, nil, AForeignKey));
end;

function TioDBBuilderPlan.AddDropForeignKey(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opDropForeignKey, ATable, nil, nil, AForeignKey));
end;

function TioDBBuilderPlan.AddCreateSequence(const ASequenceName: String): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opCreateSequence, nil, nil, nil, nil, [], ASequenceName));
end;

function TioDBBuilderPlan.AddDropSequence(const ASequenceName: String): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opDropSequence, nil, nil, nil, nil, [], ASequenceName));
end;

procedure TioDBBuilderPlan.Clear;
begin
  FOperations.Clear;
end;

function TioDBBuilderPlan.GetCount: Integer;
begin
  Result := FOperations.Count;
end;

function TioDBBuilderPlan.GetIsEmpty: Boolean;
begin
  Result := FOperations.Count = 0;
end;

function TioDBBuilderPlan.GetOperations: TioDBBuilderPlanOperations;
begin
  Result := FOperations;
end;

end.
