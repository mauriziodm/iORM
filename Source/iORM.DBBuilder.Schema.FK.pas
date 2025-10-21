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
unit iORM.DBBuilder.Schema.FK;

interface

uses
  iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces, iORM.DBBuilder.Interfaces, iORM.Attributes;

type

  TioDBBuilderSchemaFK = class(TInterfacedObject, IioDBBuilderSchemaFK)
  private
    FDependentMap: IioMap;
    FDependentProperty: IioProperty;
    FOnDeleteAction: TioFKAction;
    FOnUpdateAction: TioFKAction;
    FReferenceMap: IioMap;
    FStatus: TioDBBuilderStatus;
    function GetStatus: TioDBBuilderStatus;
    procedure SetStatus(const Value: TioDBBuilderStatus);
  public
    constructor Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
      const AOnDeleteAction, AOnUpdateAction: TioFKAction);

    function GetDependentTableName: String;
    function GetDependentFieldName: String;
    function GetName: String;
    function GetOnDeleteAction: TioFKAction;
    function GetOnUpdateAction: TioFKAction;
    function GetReferenceTableName: String;
    function GetReferenceFieldName: String;

    property DependentTableName: String read GetDependentTableName;
    property DependentFieldName: String read GetDependentFieldName;
    property Name: String read GetName;
    property OnDeleteAction: TioFKAction read GetOnDeleteAction;
    property OnUpdateAction: TioFKAction read GetOnUpdateAction;
    property ReferenceTableName: String read GetReferenceTableName;
    property ReferenceFieldName: String read GetReferenceFieldName;
    property Status: TioDBBuilderStatus read GetStatus write SetStatus;
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderSchemaFK }

function TioDBBuilderSchemaFK.GetDependentFieldName: String;
begin
  Result := FDependentProperty.GetSqlFieldName;
end;

function TioDBBuilderSchemaFK.GetDependentTableName: String;
begin
  Result := FDependentMap.GetTable.TableName;
end;

function TioDBBuilderSchemaFK.GetName: String;
begin
  Result := Format('FK_%s_%s_%s', [DependentTableName, DependentFieldName, ReferenceTableName]);
end;

function TioDBBuilderSchemaFK.GetOnDeleteAction: TioFKAction;
begin
  Result := FOnDeleteAction;
end;

function TioDBBuilderSchemaFK.GetOnUpdateAction: TioFKAction;
begin
  Result := FOnUpdateAction;
end;

constructor TioDBBuilderSchemaFK.Create(const AReferenceMap, ADependentMap: IioMap; const ADependentProperty: IioProperty;
  const AOnDeleteAction, AOnUpdateAction: TioFKAction);
begin
  FStatus := stClean;
  FReferenceMap := AReferenceMap;
  FDependentMap := ADependentMap;
  FDependentProperty := ADependentProperty;
  FOnDeleteAction := AOnDeleteAction;
  FOnUpdateAction := AOnUpdateAction;
end;

function TioDBBuilderSchemaFK.GetReferenceFieldName: String;
begin
  Result := FReferenceMap.GetProperties.GetIdProperty.GetSqlFieldName;
end;

function TioDBBuilderSchemaFK.GetReferenceTableName: String;
begin
  Result := FReferenceMap.GetTable.TableName;
end;

function TioDBBuilderSchemaFK.GetStatus: TioDBBuilderStatus;
begin
  Result := FStatus;
end;

procedure TioDBBuilderSchemaFK.SetStatus(const Value: TioDBBuilderStatus);
begin
  FStatus := Value;
end;

end.
