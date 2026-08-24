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
  strict private
    FKind: TioDBBuilderPlanOpKind;
    FSchemaField_Changes: TioDBBuilderFieldChanges;
    FSchemaField_Mapped: IioDBBuilderSchemaField;
    FSchemaField_Physical: IioDBBuilderSchemaField;
    FSchemaForeignKey: IioDBBuilderSchemaFK;
    FSchemaIndex: IioDBBuilderSchemaIndex;
    FSchemaTable: IioDBBuilderSchemaTable;
    FSequenceName: String;
    function GetDescription: String;
    function GetKind: TioDBBuilderPlanOpKind;
    function GetSchemaField_Changes: TioDBBuilderFieldChanges;
    function GetSchemaField_Mapped: IioDBBuilderSchemaField;
    function GetSchemaField_Physical: IioDBBuilderSchemaField;
    function GetSchemaForeignKey: IioDBBuilderSchemaFK;
    function GetSchemaIndex: IioDBBuilderSchemaIndex;
    function GetSchemaTable: IioDBBuilderSchemaTable;
    function GetSequenceName: String;
  strict protected
  public
    constructor Create(const AKind: TioDBBuilderPlanOpKind; const ATable: IioDBBuilderSchemaTable = nil;
      const AField: IioDBBuilderSchemaField = nil; const AIndex: IioDBBuilderSchemaIndex = nil;
      const AForeignKey: IioDBBuilderSchemaFK = nil; const ASchemaField_Changes: TioDBBuilderFieldChanges = [];
      const ASequenceName: String = ''; const AField_Physical: IioDBBuilderSchemaField = nil);
  end;

  /// <summary>
  ///  The ordered, dialect-independent list of schema-change operations (the "Plan" of the
  ///  Desired/Actual/Plan reconciliation). Operations are appended through typed factories only, so a
  ///  malformed operation cannot be built by callers. Insertion order IS execution order; producing
  ///  that order (dependency sequencing) is the PlanBuilder's responsibility, not this container's.
  /// </summary>
  TioDBBuilderPlan = class(TInterfacedObject, IioDBBuilderPlan)
  strict private
    FOperations: TioDBBuilderPlanOperations;

    function AddOp(const AOperation: IioDBBuilderPlanOperation): IioDBBuilderPlanOperation;
    // TABLE
    function AddCopyData(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    function AddCreateTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    function AddDropTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    function AddRenameTableToOld(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    // FIELD
    function AddAlterField(const ATable: IioDBBuilderSchemaTable; const AMappedField, APhysicalField: IioDBBuilderSchemaField;
      const ASchemaField_Changes: TioDBBuilderFieldChanges): IioDBBuilderPlanOperation;
    function AddCreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
    function AddDropField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
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
    procedure Render(const ASink: IioDBBuilderSqlText; const AMode: TioDBBuilderMode);
  strict protected
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
  const ASchemaField_Changes: TioDBBuilderFieldChanges; const ASequenceName: String; const AField_Physical: IioDBBuilderSchemaField);
begin
  inherited Create;
  FKind := AKind;
  FSchemaTable := ATable;
  FSchemaField_Mapped := AField;
  FSchemaField_Physical := AField_Physical;
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
    opDropTable:        Result := Format('Drop orphan table %s', [QuotedStr(FSchemaTable.Name)]);
    opCreateField:      Result := Format('Add field %s to %s', [QuotedStr(FSchemaField_Mapped.FieldName), QuotedStr(FSchemaTable.Name)]);
    opAlterField:       Result := Format('Alter field %s on %s', [QuotedStr(FSchemaField_Mapped.FieldName), QuotedStr(FSchemaTable.Name)]);
    opDropField:        Result := Format('Drop orphan field %s from %s', [QuotedStr(FSchemaField_Physical.FieldName), QuotedStr(FSchemaTable.Name)]);
    opCreateIndex:      Result := Format('Create index on %s (%s)', [QuotedStr(FSchemaTable.Name), FSchemaIndex.CommaSepFieldList]);
    // AIndex is always a Physical node here (see AddDropIndex), so .Name is always the real catalog name.
    opDropIndex:        Result := Format('Drop existing index %s on %s', [QuotedStr(FSchemaIndex.Name), QuotedStr(FSchemaTable.Name)]);
    opCreateForeignKey: Result := Format('Create foreign key on %s referencing %s', [QuotedStr(FSchemaTable.Name), QuotedStr(FSchemaForeignKey.ReferenceTableName)]);
    opDropForeignKey:   Result := Format('Drop foreign key %s on %s', [QuotedStr(FSchemaForeignKey.Name), QuotedStr(FSchemaTable.Name)]);
    opCreateSequence:   Result := Format('Create sequence %s', [QuotedStr(FSequenceName)]);
    opDropSequence:     Result := Format('Drop sequence %s', [QuotedStr(FSequenceName)]);
    opRenameTableToOld: Result := Format('Rename table %s to its temporary shadow (rebuild)', [QuotedStr(FSchemaTable.Name)]);
    opCopyData:         Result := Format('Copy data into rebuilt table %s', [QuotedStr(FSchemaTable.Name)]);
  else
    Result := '';
  end;
end;

function TioDBBuilderPlanOperation.GetKind: TioDBBuilderPlanOpKind;
begin
  Result := FKind;
end;

function TioDBBuilderPlanOperation.GetSchemaField_Changes: TioDBBuilderFieldChanges;
begin
  Result := FSchemaField_Changes;
end;

function TioDBBuilderPlanOperation.GetSchemaField_Mapped: IioDBBuilderSchemaField;
begin
  Result := FSchemaField_Mapped;
end;

function TioDBBuilderPlanOperation.GetSchemaField_Physical: IioDBBuilderSchemaField;
begin
  Result := FSchemaField_Physical;
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

function TioDBBuilderPlan.AddCopyData(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opCopyData, ATable));
end;

function TioDBBuilderPlan.AddCreateTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opCreateTable, ATable));
end;

function TioDBBuilderPlan.AddDropTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opDropTable, ATable));
end;

function TioDBBuilderPlan.AddRenameTableToOld(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opRenameTableToOld, ATable));
end;

function TioDBBuilderPlan.AddAlterField(const ATable: IioDBBuilderSchemaTable; const AMappedField, APhysicalField: IioDBBuilderSchemaField;
  const ASchemaField_Changes: TioDBBuilderFieldChanges): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opAlterField, ATable, AMappedField, nil, nil, ASchemaField_Changes, '', APhysicalField));
end;

function TioDBBuilderPlan.AddCreateField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opCreateField, ATable, AField));
end;

function TioDBBuilderPlan.AddDropField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.Create(opDropField, ATable, nil, nil, nil, [], '', AField));
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

procedure TioDBBuilderPlan.Render(const ASink: IioDBBuilderSqlText; const AMode: TioDBBuilderMode);
var
  LOp: IioDBBuilderPlanOperation;
  LSkip: Boolean;
begin
  if AMode = ifmDisabled then
    Exit;
  for LOp in FOperations do
  begin
    // ifmEnabled: a table being created from scratch (Status = stCreate) already implies its index/FK
    // creations via its own "Create table X" line, so listing each one adds noise without new
    // information. opCreateSequence has no SchemaTable (see AddCreateSequence) so it is never filtered.
    LSkip := (AMode = ifmEnabled) and (LOp.Kind in [opCreateIndex, opCreateForeignKey]) and
      (LOp.SchemaTable <> nil) and (LOp.SchemaTable.Status = stCreate);
    if not LSkip then
      ASink.AddLine(LOp.Description);
  end;
end;

end.
