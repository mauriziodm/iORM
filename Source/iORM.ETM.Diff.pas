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
unit iORM.ETM.Diff;

interface

uses
  System.JSON, iORM.Context.Properties.Interfaces;

const
  OLD_VALUE_PROP_NAME = '$OldValue';
  NEW_VALUE_PROP_NAME = '$NewValue';
  LIST_ITEM_STATUS_PROP_NAME = '$ItemStatus';

  LIST_ITEM_STATUS_ADDED = 'added';
  LIST_ITEM_STATUS_UPDATED = 'updated';
  LIST_ITEM_STATUS_DELETED = 'deleted';

type

  TioEtmDiff = class
  private
    FDiffJSON: TJSONObject;
    function TryExtractCurrentValue(const LProp: IioProperty; const ASourceOldJsonObj, ASourceNewJsonObj: TJSONObject;
      out OCurrentOld, OCurrentNew: TJSONValue): Boolean;
    function Diff_Object(const ASourceOldObj, ASourceNewObj: TObject; const ASourceOldJsonObj, ASourceNewJsonObj: TJSONObject): TJSONObject;
    function Diff_SimpleProp(const ASourceOldJsonValue, ASourceNewJsonValue: TJSONValue): TJSONObject;
    function Diff_ObjectProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
    function Diff_ListProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONArray;
    // protected
    // procedure NewNodePrepare(const LProp: IioProperty); virtual; abstract;
    // procedure NewConfirmOrRemove(const LProp: IioProperty); virtual; abstract;
    // procedure NewNodeAddValue(const LProp: IioProperty; const AOldJSONValue, ANewJSONValue: TJSONValue); virtual; abstract;
  public
  end;

implementation

uses
  iORM.Context.Map.Interfaces, iORM.Context.Container, iORM.Attributes, System.SysUtils,
  iORM.DuckTyped.Interfaces, iORM.Exceptions, iORM.DuckTyped.Factory,
  iORM.Utilities, DJSON, iORM.CommonTypes;

{ TioEtmDiff }

function TioEtmDiff.Diff_Object(const ASourceOldObj, ASourceNewObj: TObject; const ASourceOldJsonObj, ASourceNewJsonObj: TJSONObject): TJSONObject;
var
  LMap: IioMap;
  LProp: IioProperty;
  LSourceOldValue, LSourceNewValue, LDiffValue: TJSONValue;
begin
  LMap := TioMapContainer.GetMap(ASourceNewObj.ClassName);
  for LProp in LMap.GetProperties do
  begin
    // Extract current JSON values, skip if not found or equals
    if not TryExtractCurrentValue(LProp, ASourceOldJsonObj, ASourceNewJsonObj, LSourceOldValue, LSourceNewValue) then
      Continue;
    // Based on relation type do something...
    case LProp.GetRelationType of
      rtNone:
        LDiffValue := Diff_SimpleProp(LSourceOldValue, LSourceNewValue);
      rtHasMany, rtEmbeddedHasMany:
        LDiffValue := Diff_ListProp(LProp, ASourceOldJsonObj, ASourceNewJsonObj);
      rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
        ;
    end;
  end;
end;

function TioEtmDiff.TryExtractCurrentValue(const LProp: IioProperty; const ASourceOldJsonObj, ASourceNewJsonObj: TJSONObject;
  out OCurrentOld, OCurrentNew: TJSONValue): Boolean;
var
  LPropName: String;
begin
  LPropName := LProp.GetName;
  // Extract current json values
  OCurrentOld := ASourceOldJsonObj.Values[LPropName];
  OCurrentNew := ASourceNewJsonObj.Values[LPropName];
  // If both are not assigned then exist false
  if (not Assigned(OCurrentOld)) and (not Assigned(OCurrentNew)) then
    Exit(False);
  // If one of the two are assigned and the other one is not assigned...
  if Assigned(OCurrentOld) and not Assigned(OCurrentNew) then
    OCurrentNew := OCurrentOld.ClassType.Create as TJSONValue;
  if Assigned(OCurrentNew) and not Assigned(OCurrentOld) then
    OCurrentOld := OCurrentNew.ClassType.Create as TJSONValue;
  // Detect if the current prop/value must be inserted in the result
  Result := OCurrentOld.ToString <> OCurrentNew.ToString;
end;

function TioEtmDiff.Diff_SimpleProp(const ASourceOldJsonValue, ASourceNewJsonValue: TJSONValue): TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair(OLD_VALUE_PROP_NAME, ASourceOldJsonValue);
  Result.AddPair(NEW_VALUE_PROP_NAME, ASourceNewJsonValue);
end;

function TioEtmDiff.Diff_ObjectProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
var
  LOldObj, LNewObj: TObject;
begin
  // Get the child object
  LOldObj := LProp.GetRelationChildObject(ASourceOldObj);
  LNewObj := LProp.GetRelationChildObject(ASourceNewObj);

  if Assigned(LOldObj) and Assigned(LNewObj) then
  begin

  end;
end;

function TioEtmDiff.Diff_ListProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONArray;
var
  LOldList, LNewList, LOldListItem, LNewListItem: TObject;
  LOldDuckList, LNewDuckList: IioDuckTypedList;
  LOldListItemJsonObj, LNewListItemJsonObj: TJSONObject;
  LResultArrayElement: TJSONObject;
  function _FindListItem(const LDuckList: IioDuckTypedList; const AObjToSearch: TObject): TObject;
  var
    LSearchID, LCurrID: Integer;
  begin
    if (not Assigned(LDuckList)) or (not Assigned(AObjToSearch)) then
      Exit(nil);
    LSearchID := TioUtilities.ExtractOID(AObjToSearch);
    for Result in LDuckList do
    begin
      if not Assigned(Result) then
        Continue;
      LCurrID := TioUtilities.ExtractOID(AObjToSearch);
      if (Result.ClassName = AObjToSearch.ClassName) and (LCurrID = LSearchID) then
        Exit;
    end;
    Result := nil;
  end;

begin
  // Get the child lists
  LOldList := LProp.GetRelationChildObject(ASourceOldObj);
  LNewList := LProp.GetRelationChildObject(ASourceNewObj);
  // Get child lists as duck lists
  if Assigned(LOldList) and TioDuckTypedFactory.IsList(LOldList) then
    LOldDuckList := TioDuckTypedFactory.DuckTypedList(LOldList)
  else
    LOldDuckList := nil;
  if Assigned(LNewList) and TioDuckTypedFactory.IsList(LNewList) then
    LNewDuckList := TioDuckTypedFactory.DuckTypedList(LNewList)
  else
    LNewDuckList := nil;
  // Create the result json array
  Result := TJSONArray.Create;
  // ======================================================
  // LOOP NEW DUCK LIST
  // ------------------------------------------------------
  if Assigned(LNewDuckList) then
  begin
    for LNewListItem in LNewDuckList do
    begin
      // if new list item is assigned then serialize it, else continue to the next item
      if Assigned(LNewListItem) then
        LNewListItemJsonObj := dj.From(LNewListItem).OpType(ssETM).byFields.TypeAnnotationsON.ToJsonValue as TJSONObject
      else
        Continue;
      // Search for the same element in the old list (same class, same id), if exists then serialize it
      LOldListItem := _FindListItem(LOldDuckList, LNewListItem);
      if Assigned(LOldListItem) then
      begin
        LOldListItemJsonObj := dj.From(LOldListItem).OpType(ssETM).byFields.TypeAnnotationsON.ToJsonValue as TJSONObject;
        // if the json of the new list item and json of the old list item are different then build a diff json object for that
        // element and add it to the json array (status := updated), else contintue to the next item
        if LNewListItemJsonObj.ToString <> LOldListItemJsonObj.ToString then
        begin
          LResultArrayElement := Diff_Object(LOldListItem, LNewListItem, LOldListItemJsonObj, LNewListItemJsonObj);
          LResultArrayElement.AddPair(LIST_ITEM_STATUS_PROP_NAME, LIST_ITEM_STATUS_ADDED);
          Result.Add(LResultArrayElement);
          FreeAndNil(LOldListItemJsonObj);
          FreeAndNil(LNewListItemJsonObj);
        end;
      end
      else
      begin
        // Is the old list item is not assigned then add the new list item json to the json array (status := added)
        LResultArrayElement := LNewListItemJsonObj;
        LResultArrayElement.AddPair(LIST_ITEM_STATUS_PROP_NAME, LIST_ITEM_STATUS_UPDATED);
        Result.Add(LResultArrayElement);
        FreeAndNil(LOldListItemJsonObj);
      end;
    end;
  end;
  // ======================================================
  // ======================================================
  // LOOP OLD DUCK LIST
  // ------------------------------------------------------
  if Assigned(LOldDuckList) then
  begin
    for LOldListItem in LOldDuckList do
    begin
      // if old list item is assigned then serialize it, else continue to the next item
      if Assigned(LOldListItem) then
        LOldListItemJsonObj := dj.From(LOldListItem).OpType(ssETM).byFields.TypeAnnotationsON.ToJsonValue as TJSONObject
      else
        Continue;
      // Search for the same element in the new list (same class, same id), if exists then continue to the next item
      // else (if not exists into the new list) then current old item is added to the json array es deleted status
      LNewListItem := _FindListItem(LNewDuckList, LOldListItem);
      if not Assigned(LNewListItem) then
      begin
        LResultArrayElement := LOldListItemJsonObj;
        LResultArrayElement.AddPair(LIST_ITEM_STATUS_PROP_NAME, LIST_ITEM_STATUS_DELETED);
        Result.Add(LResultArrayElement);
      end;
    end;
  end;
  // ======================================================
end;

end.
