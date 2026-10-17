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
  ///  only through TioDBBuilderPlan's typed factory methods (the Add* family). There is one named
  ///  constructor per schema element (CreateFor<Element>), each taking only the slots that element's ops
  ///  can fill, with the _Mapped/_Physical pair of the same type always adjacent and named after its
  ///  branch: no positional chain of nil defaults, so a node cannot silently land in the wrong slot (two
  ///  slots of the same type never sit apart in one long argument list). Every slot not set stays nil.
  /// </summary>
  TioDBBuilderPlanOperation = class(TInterfacedObject, IioDBBuilderPlanOperation)
  strict private
    FKind: TioDBBuilderPlanOpKind;
    FSchemaField_Changes: TioDBBuilderFieldChanges;
    FSchemaField_Mapped: IioDBBuilderSchemaField;
    FSchemaField_Physical: IioDBBuilderSchemaField;
    FSchemaForeignKey: IioDBBuilderSchemaFK;
    FSchemaIndex: IioDBBuilderSchemaIndex;
    FSchemaSequence: IioDBBuilderSchemaSequence;
    FSchemaTable_Mapped: IioDBBuilderSchemaTable;
    FSchemaTable_Physical: IioDBBuilderSchemaTable;
    function GetDescription: String;
    function GetKind: TioDBBuilderPlanOpKind;
    function GetSchemaField_Changes: TioDBBuilderFieldChanges;
    function GetSchemaField_Mapped: IioDBBuilderSchemaField;
    function GetSchemaField_Physical: IioDBBuilderSchemaField;
    function GetSchemaForeignKey: IioDBBuilderSchemaFK;
    function GetSchemaIndex: IioDBBuilderSchemaIndex;
    function GetSchemaSequence: IioDBBuilderSchemaSequence;
    function GetSchemaTable_Mapped: IioDBBuilderSchemaTable;
    function GetSchemaTable_Physical: IioDBBuilderSchemaTable;
  strict protected
  public
    constructor CreateForField(const AKind: TioDBBuilderPlanOpKind; const ATable_Mapped: IioDBBuilderSchemaTable;
      const AField_Mapped, AField_Physical: IioDBBuilderSchemaField; const AField_Changes: TioDBBuilderFieldChanges);
    constructor CreateForForeignKey(const AKind: TioDBBuilderPlanOpKind; const ATable_Mapped: IioDBBuilderSchemaTable;
      const AForeignKey: IioDBBuilderSchemaFK);
    constructor CreateForIndex(const AKind: TioDBBuilderPlanOpKind; const ATable_Mapped: IioDBBuilderSchemaTable;
      const AIndex: IioDBBuilderSchemaIndex);
    constructor CreateForSequence(const AKind: TioDBBuilderPlanOpKind; const ASequence: IioDBBuilderSchemaSequence);
    constructor CreateForTable(const AKind: TioDBBuilderPlanOpKind; const ATable_Mapped, ATable_Physical: IioDBBuilderSchemaTable);
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
    function AddDropTable(const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    function AddRenameTableToOld(const AMappedTable, APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
    // FIELD
    function AddAlterField(const ATable: IioDBBuilderSchemaTable; const AMappedField, APhysicalField: IioDBBuilderSchemaField;
      const ASchemaField_Changes: TioDBBuilderFieldChanges): IioDBBuilderPlanOperation;
    function AddCreateField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
    function AddDropField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
    // INDEX
    function AddCreateIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
    function AddDropIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
    function AddDropOrphanIndex(const ATable: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
    // FOREIGN KEY
    function AddCreateForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
    function AddDropForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
    function AddDropOrphanForeignKey(const ATable: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
    // SEQUENCE
    function AddCreateSequence(const ASequence: IioDBBuilderSchemaSequence): IioDBBuilderPlanOperation;
    function AddDropOrphanSequence(const ASequence: IioDBBuilderSchemaSequence): IioDBBuilderPlanOperation;
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

constructor TioDBBuilderPlanOperation.CreateForField(const AKind: TioDBBuilderPlanOpKind;
  const ATable_Mapped: IioDBBuilderSchemaTable; const AField_Mapped, AField_Physical: IioDBBuilderSchemaField;
  const AField_Changes: TioDBBuilderFieldChanges);
begin
  inherited Create;
  FKind := AKind;
  FSchemaTable_Mapped := ATable_Mapped;
  FSchemaField_Mapped := AField_Mapped;
  FSchemaField_Physical := AField_Physical;
  FSchemaField_Changes := AField_Changes;
end;

constructor TioDBBuilderPlanOperation.CreateForForeignKey(const AKind: TioDBBuilderPlanOpKind;
  const ATable_Mapped: IioDBBuilderSchemaTable; const AForeignKey: IioDBBuilderSchemaFK);
begin
  inherited Create;
  FKind := AKind;
  FSchemaTable_Mapped := ATable_Mapped;
  FSchemaForeignKey := AForeignKey;
end;

constructor TioDBBuilderPlanOperation.CreateForIndex(const AKind: TioDBBuilderPlanOpKind;
  const ATable_Mapped: IioDBBuilderSchemaTable; const AIndex: IioDBBuilderSchemaIndex);
begin
  inherited Create;
  FKind := AKind;
  FSchemaTable_Mapped := ATable_Mapped;
  FSchemaIndex := AIndex;
end;

constructor TioDBBuilderPlanOperation.CreateForSequence(const AKind: TioDBBuilderPlanOpKind;
  const ASequence: IioDBBuilderSchemaSequence);
begin
  inherited Create;
  FKind := AKind;
  FSchemaSequence := ASequence;
end;

constructor TioDBBuilderPlanOperation.CreateForTable(const AKind: TioDBBuilderPlanOpKind;
  const ATable_Mapped, ATable_Physical: IioDBBuilderSchemaTable);
begin
  inherited Create;
  FKind := AKind;
  FSchemaTable_Mapped := ATable_Mapped;
  FSchemaTable_Physical := ATable_Physical;
end;

function TioDBBuilderPlanOperation.GetDescription: String;
begin
  // Dialect-independent, human-readable summary built from iORM's standard metadata (no SqlGenerator).
  case FKind of
    opCreateTable:      Result := Format('Create table %s', [QuotedStr(FSchemaTable_Mapped.Name)]);
    opDropTable:        Result := Format('Drop orphan table %s', [QuotedStr(FSchemaTable_Physical.Name)]);
    opCreateField:      Result := Format('Add field %s to %s', [QuotedStr(FSchemaField_Mapped.FieldName), QuotedStr(FSchemaTable_Mapped.Name)]);
    opAlterField:       Result := Format('Alter field %s on %s', [QuotedStr(FSchemaField_Mapped.FieldName), QuotedStr(FSchemaTable_Mapped.Name)]);
    opDropField:        Result := Format('Drop orphan field %s from %s', [QuotedStr(FSchemaField_Physical.FieldName), QuotedStr(FSchemaTable_Mapped.Name)]);
    opCreateIndex:      Result := Format('Create index on %s (%s)', [QuotedStr(FSchemaTable_Mapped.Name), FSchemaIndex.CommaSepFieldList]);
    // AIndex is always a Physical node here (see AddDropIndex), so .Name is always the real catalog name.
    opDropIndex:        Result := Format('Drop existing index %s on %s', [QuotedStr(FSchemaIndex.Name), QuotedStr(FSchemaTable_Mapped.Name)]);
    // AIndex is always a Physical node here too (see AddDropOrphanIndex).
    opDropOrphanIndex:  Result := Format('Drop orphan index %s on %s', [QuotedStr(FSchemaIndex.Name), QuotedStr(FSchemaTable_Mapped.Name)]);
    opCreateForeignKey: Result := Format('Create foreign key on %s referencing %s', [QuotedStr(FSchemaTable_Mapped.Name), QuotedStr(FSchemaForeignKey.ReferenceTableName)]);
    opDropForeignKey:   Result := Format('Drop foreign key %s on %s', [QuotedStr(FSchemaForeignKey.Name), QuotedStr(FSchemaTable_Mapped.Name)]);
    // AForeignKey is always a Physical node here (see AddDropOrphanForeignKey), so .Name is always the real catalog name.
    opDropOrphanForeignKey: Result := Format('Drop orphan foreign key %s on %s', [QuotedStr(FSchemaForeignKey.Name), QuotedStr(FSchemaTable_Mapped.Name)]);
    opCreateSequence:   Result := Format('Create sequence %s', [QuotedStr(FSchemaSequence.Name)]);
    // ASequence is always a Physical node here (see AddDropOrphanSequence), so .Name is the real catalog name.
    opDropOrphanSequence: Result := Format('Drop orphan sequence %s', [QuotedStr(FSchemaSequence.Name)]);
    opRenameTableToOld: Result := Format('Rename table %s to its temporary shadow (rebuild)', [QuotedStr(FSchemaTable_Mapped.Name)]);
    opCopyData:         Result := Format('Copy data into rebuilt table %s', [QuotedStr(FSchemaTable_Mapped.Name)]);
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

function TioDBBuilderPlanOperation.GetSchemaSequence: IioDBBuilderSchemaSequence;
begin
  Result := FSchemaSequence;
end;

function TioDBBuilderPlanOperation.GetSchemaTable_Mapped: IioDBBuilderSchemaTable;
begin
  Result := FSchemaTable_Mapped;
end;

function TioDBBuilderPlanOperation.GetSchemaTable_Physical: IioDBBuilderSchemaTable;
begin
  Result := FSchemaTable_Physical;
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
  Result := AddOp(TioDBBuilderPlanOperation.CreateForTable(opCopyData, ATable, nil));
end;

function TioDBBuilderPlan.AddCreateTable(const ATable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForTable(opCreateTable, ATable, nil));
end;

function TioDBBuilderPlan.AddDropTable(const APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForTable(opDropTable, nil, APhysicalTable));
end;

function TioDBBuilderPlan.AddRenameTableToOld(const AMappedTable, APhysicalTable: IioDBBuilderSchemaTable): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForTable(opRenameTableToOld, AMappedTable, APhysicalTable));
end;

function TioDBBuilderPlan.AddAlterField(const ATable: IioDBBuilderSchemaTable; const AMappedField, APhysicalField: IioDBBuilderSchemaField;
  const ASchemaField_Changes: TioDBBuilderFieldChanges): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForField(opAlterField, ATable, AMappedField, APhysicalField, ASchemaField_Changes));
end;

function TioDBBuilderPlan.AddCreateField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForField(opCreateField, ATable, AField, nil, []));
end;

function TioDBBuilderPlan.AddDropField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForField(opDropField, ATable, nil, AField, []));
end;

function TioDBBuilderPlan.AddCreateIndex(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForIndex(opCreateIndex, ATable, AIndex));
end;

function TioDBBuilderPlan.AddDropIndex(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForIndex(opDropIndex, ATable, AIndex));
end;

function TioDBBuilderPlan.AddDropOrphanIndex(const ATable: IioDBBuilderSchemaTable;
  const AIndex: IioDBBuilderSchemaIndex): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForIndex(opDropOrphanIndex, ATable, AIndex));
end;

function TioDBBuilderPlan.AddCreateForeignKey(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForForeignKey(opCreateForeignKey, ATable, AForeignKey));
end;

function TioDBBuilderPlan.AddDropForeignKey(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForForeignKey(opDropForeignKey, ATable, AForeignKey));
end;

function TioDBBuilderPlan.AddDropOrphanForeignKey(const ATable: IioDBBuilderSchemaTable;
  const AForeignKey: IioDBBuilderSchemaFK): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForForeignKey(opDropOrphanForeignKey, ATable, AForeignKey));
end;

function TioDBBuilderPlan.AddCreateSequence(const ASequence: IioDBBuilderSchemaSequence): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForSequence(opCreateSequence, ASequence));
end;

function TioDBBuilderPlan.AddDropOrphanSequence(const ASequence: IioDBBuilderSchemaSequence): IioDBBuilderPlanOperation;
begin
  Result := AddOp(TioDBBuilderPlanOperation.CreateForSequence(opDropOrphanSequence, ASequence));
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
    // information. opCreateSequence has no SchemaTable_Mapped (see AddCreateSequence) so it is never filtered.
    LSkip := (AMode = ifmEnabled) and (LOp.Kind in [opCreateIndex, opCreateForeignKey]) and
      (LOp.SchemaTable_Mapped <> nil) and (LOp.SchemaTable_Mapped.Status = stCreate);
    if not LSkip then
      ASink.AddLine(LOp.Description);
  end;
end;

end.
