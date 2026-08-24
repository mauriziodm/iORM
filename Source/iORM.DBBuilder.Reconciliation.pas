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
unit iORM.DBBuilder.Reconciliation;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  /// <summary>
  ///  Holds the two schema views and the plan that reconciles them (the desired/actual/plan triad):
  ///  Mapped (built from the ORM entity maps), Physical (introspected from the live DB), and Plan
  ///  (the ordered operations to converge Physical to Mapped). Physical is filled later by the
  ///  Introspector, so it starts nil.
  /// </summary>
  TioDBBuilderReconciliation = class(TInterfacedObject, IioDBBuilderReconciliation)
  private
    FForeignKeysMode: TioDBBuilderMode;
    FIndexesMode: TioDBBuilderMode;
    FMappedSchema: IioDBBuilderSchema;
    FPhysicalSchema: IioDBBuilderSchema;
    FPlan: IioDBBuilderPlan;
    FPlanRenderMode: TioDBBuilderMode;

    function GetForeignKeysMode: TioDBBuilderMode;
    function GetIndexesMode: TioDBBuilderMode;
    function GetMappedSchema: IioDBBuilderSchema;
    function GetPhysicalSchema: IioDBBuilderSchema;
    function GetPlan: IioDBBuilderPlan;
    function GetPlanRenderMode: TioDBBuilderMode;
    procedure SetPhysicalSchema(const AValue: IioDBBuilderSchema);
  protected
  public
    constructor Create(const AMappedSchema: IioDBBuilderSchema; const APlan: IioDBBuilderPlan;
      const AIndexesMode, AForeignKeysMode: TioDBBuilderMode);
  end;

implementation

{ TioDBBuilderReconciliation }

constructor TioDBBuilderReconciliation.Create(const AMappedSchema: IioDBBuilderSchema; const APlan: IioDBBuilderPlan;
  const AIndexesMode, AForeignKeysMode: TioDBBuilderMode);
begin
  inherited Create;
  FMappedSchema := AMappedSchema;
  FPlan := APlan;
  FIndexesMode := AIndexesMode;
  FForeignKeysMode := AForeignKeysMode;
  // Not yet a user-facing setting (no caller varies it) - defaulted here rather than exposed as a
  // constructor parameter until something real needs to pass a different value.
  FPlanRenderMode := ifmEnabled;
  // FPhysicalSchema stays nil until the Introspector builds it in a later phase.
end;

function TioDBBuilderReconciliation.GetForeignKeysMode: TioDBBuilderMode;
begin
  Result := FForeignKeysMode;
end;

function TioDBBuilderReconciliation.GetIndexesMode: TioDBBuilderMode;
begin
  Result := FIndexesMode;
end;

function TioDBBuilderReconciliation.GetMappedSchema: IioDBBuilderSchema;
begin
  Result := FMappedSchema;
end;

function TioDBBuilderReconciliation.GetPhysicalSchema: IioDBBuilderSchema;
begin
  Result := FPhysicalSchema;
end;

function TioDBBuilderReconciliation.GetPlan: IioDBBuilderPlan;
begin
  Result := FPlan;
end;

function TioDBBuilderReconciliation.GetPlanRenderMode: TioDBBuilderMode;
begin
  Result := FPlanRenderMode;
end;

procedure TioDBBuilderReconciliation.SetPhysicalSchema(const AValue: IioDBBuilderSchema);
begin
  FPhysicalSchema := AValue;
end;

end.
