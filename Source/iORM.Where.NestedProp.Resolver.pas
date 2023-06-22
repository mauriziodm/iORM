{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }
unit iORM.Where.NestedProp.Resolver;

interface

uses
  System.Classes, iORM.Context.Map.Interfaces, iORM.Where.SqlItems.Interfaces,
  iORM, iORM.Where.Interfaces;

type

  TioWhereNestedPropResolver = class(TInterfacedObject, IioWhereNestedPropResolver)
  private
    FNestedCriteria: IioSqlItemCriteria;
    FResultStrings: TStrings;
    function _IsFirstLoop(const ABuildingResult: String): Boolean;
    function _IsLastLoop(const AFullPathPropertyName: String): Boolean;
    function _ExtractNextPropName(var AFullPathPropName: String): String;
    procedure _GenerateMiddleJoins(const AMasterMap: IioMap; const AMasterProp: IioProperty; AFullPathPropName: String; const APreviousBuildingResult: String);
    function _ComposeWhereConditions: String;
  public
    constructor Create(const ANestedCriteria: IioSqlItemCriteria);
    destructor Destroy; override;
    function GenerateSqlNestedWhere(const AMap: IioMap): String;
  end;

implementation

uses
  iORM.Utilities, System.SysUtils, iORM.Resolver.Interfaces,
  iORM.Resolver.Factory, iORM.Context.Container, iORM.Exceptions, System.StrUtils;

{ TioWhereNestedPropResolver }

constructor TioWhereNestedPropResolver.Create(const ANestedCriteria: IioSqlItemCriteria);
begin
  FNestedCriteria := ANestedCriteria;
  FResultStrings := TSTringList.Create;
end;

destructor TioWhereNestedPropResolver.Destroy;
begin
  FResultStrings.Free;
  inherited;
end;

function TioWhereNestedPropResolver._ExtractNextPropName(var AFullPathPropName: String): String;
var
  LDotPos: Integer;
begin
  LDotPos := Pos('.', AFullPathPropName);
  if LDotPos > 0 then
  begin
    Result := Copy(AFullPathPropName, 1, LDotPos - 1);
    AFullPathPropName := AFullPathPropName.Remove(0, LDotPos);
  end
  else
  begin
    Result := AFullPathPropName;
    AFullPathPropName := String.Empty;
  end;
end;

function TioWhereNestedPropResolver.GenerateSqlNestedWhere(const AMap: IioMap): String;
var
  LMasterProp: IioProperty;
  LMasterPropName: String;
  LFullPathPropertyName: String;
  LWhereText: String;
begin
  // Work with a copy of the FullPathPropertyName reached from the criteria
  LFullPathPropertyName := FNestedCriteria.PropertyName;
  // Get the master prop
  LMasterPropName := _ExtractNextPropName(LFullPathPropertyName);
  LMasterProp := AMap.GetProperties.GetPropertyByName(LMasterPropName);
  // Generate the where condition collection
  _GenerateMiddleJoins(AMap, LMasterProp, LFullPathPropertyName, String.Empty);
  // Compose the where conditions
  Result := _ComposeWhereConditions;
end;

procedure TioWhereNestedPropResolver._GenerateMiddleJoins(const AMasterMap: IioMap; const AMasterProp: IioProperty; AFullPathPropName: String; const APreviousBuildingResult: String);
var
  LDetailProp, LRelationChildProp: IioProperty;
  LDetailPropName: String;
  LDetailMap: IioMap;
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LResult: String;
begin
  // Get the master and detail prop name
  LDetailPropName := _ExtractNextPropName(AFullPathPropName);
  // Resolve the type and alias then loop for all classes in the resolved type list
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AMasterProp.GetRelationChildTypeName,
    AMasterProp.GetRelationChildTypeAlias, rmAllDistinctByConnectionAndTable);
  for LResolvedTypeName in LResolvedTypeList do
  begin
    // Get the detail Map but if the current resolved class is not a persisted entity then skip it
    LDetailMap := TioMapContainer.GetMap(LResolvedTypeName);
    if LDetailMap.GetTable.IsNotPersistedEntity then
      Continue;
    // Get the detail Property but if not exists in the current resolved class then skip it
    if not LDetailMap.GetProperties.PropertyExists(LDetailPropName) then
      Continue;
    LDetailProp := LDetailMap.GetProperties.GetPropertyByName(LDetailPropName);
    // If the current resolved type is not for the same connection the skip it
    if not LDetailMap.GetTable.IsForThisConnection(AMasterMap.GetTable.GetConnectionDefName) then
      Continue;
    // Depending on relation type...
    case AMasterProp.GetRelationType of
      // BelongsTo relation type...
      rtBelongsTo:
        begin
          if _IsFirstLoop(APreviousBuildingResult) then
            LResult := Format('EXISTS (SELECT 1 FROM %s WHERE %s = %s',
              [LDetailMap.GetTable.GetSql, LDetailMap.GetProperties.GetIdProperty.GetSqlQualifiedFieldName, AMasterProp.GetSqlQualifiedFieldName])
          else
            LResult := APreviousBuildingResult.Replace('WHERE', Format('JOIN %s ON (%s = %s) WHERE',
              [LDetailMap.GetTable.GetSql, LDetailMap.GetProperties.GetIdProperty.GetSqlQualifiedFieldName, AMasterProp.GetSqlQualifiedFieldName]))
        end;
      // HasOne or HasMany relation type...
      rtHasMany, rtHasOne:
        begin
          LRelationChildProp := LDetailMap.GetProperties.GetPropertyByName(AMasterProp.GetRelationChildPropertyName);
          if _IsFirstLoop(APreviousBuildingResult) then
            LResult := Format('EXISTS (SELECT 1 FROM %s WHERE %s = %s', [LDetailMap.GetTable.GetSql, LRelationChildProp.GetSqlQualifiedFieldName,
              AMasterMap.GetProperties.GetIdProperty.GetSqlQualifiedFieldName])
          else
            LResult := APreviousBuildingResult.Replace('WHERE', Format('JOIN %s ON (%s = %s) WHERE',
              [LDetailMap.GetTable.GetSql, LRelationChildProp.GetSqlQualifiedFieldName, AMasterMap.GetProperties.GetIdProperty.GetSqlQualifiedFieldName]))
        end
    else
      raise EioException.Create(ClassName, '_GenerateMiddleJoins', Format('Wrong relation type (%s) on property "%s" of class "%s"',
        [TioUtilities.EnumToString<TioRelationType>(AMasterProp.GetRelationType), AMasterProp.GetName, AMasterMap.GetClassName]));
    end;
    // If this is the last recursion (there no other remaining nested properties) then call the generation of the final
    // part of this nested where condition else call itself (recursion) to process the next level
    if _IsLastLoop(AFullPathPropName) then
    begin
      LResult := Format('%s AND %s%s%s)', [LResult, LDetailProp.GetSqlQualifiedFieldName, FNestedCriteria.CompareOpSqlItem.GetSql,
        FNestedCriteria.ValueSqlItem.GetSql(LDetailMap)]);
      FResultStrings.Add(LResult);
    end
    else
      _GenerateMiddleJoins(LDetailMap, LDetailProp, AFullPathPropName, LResult);
  end;
end;

function TioWhereNestedPropResolver._ComposeWhereConditions: String;
var
  LCurrentWhereText: String;
begin
  Result := String.Empty;
  for LCurrentWhereText in FResultStrings do
    Result := Format('%s%s%s', [Result, IfThen(Result.IsEmpty, '', ' OR '), LCurrentWhereText]);
  // Enclose in a rounds brackets
  if not Result.IsEmpty then
    Result := Format('(%s)', [Result])
  else
    raise EioException.Create(ClassName, 'GenerateSqlNestedWhere', 'The resulting where text is empty');
end;

function TioWhereNestedPropResolver._IsFirstLoop(const ABuildingResult: String): Boolean;
begin
  Result := ABuildingResult.IsEmpty;
end;

function TioWhereNestedPropResolver._IsLastLoop(const AFullPathPropertyName: String): Boolean;
begin
  Result := AFullPathPropertyName.IsEmpty;
end;

end.
