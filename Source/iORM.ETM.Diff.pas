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
  ETM_PROP_TYPE = '$etm_prop_type';
  ETM_OLD_CLASS = '$etm_old_class';
  ETM_NEW_CLASS = '$etm_new_class';

  ETM_ID = '$etm_id';
  ETM_OLD_ID = '$etm_old_id';
  ETM_NEW_ID = '$etm_new_id';

  ETM_OLD_VALUE = '$etm_old_value';
  ETM_NEW_VALUE = '$etm_new_value';

  ETM_DIFF_STATUS = '$etm_diff_status';
  ETM_DIFF_STATUS_ADDED = 'added';
  ETM_DIFF_STATUS_UPDATED = 'updated';
  ETM_DIFF_STATUS_DELETED = 'deleted';

type

  TioEtmDiff = class
  private
    FDiffJSON: TJSONObject;
    function TryExtractCurrentValue(const LProp: IioProperty; const ASourceOldJsonObj, ASourceNewJsonObj: TJSONObject;
      out OCurrentOldJsonValue, OCurrentNewJsonValue: TJSONValue): Boolean;
    function Diff_Object(const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
    function Diff_ValueProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
    function Diff_ObjectProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
    function Diff_ListProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONArray;
  public
  end;

implementation

uses
  iORM.Context.Map.Interfaces, iORM.Context.Container, iORM.Attributes, System.SysUtils,
  iORM.DuckTyped.Interfaces, iORM.Exceptions, iORM.DuckTyped.Factory,
  iORM.Utilities, DJSON, iORM.CommonTypes, System.Rtti;

{ TioEtmDiff }

function TioEtmDiff.Diff_Object(const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
var
  LMap: IioMap;
  LProp: IioProperty;
  LSourceOldValue, LSourceNewValue, LDiffValue: TJSONValue;
begin
  // Get the map then loop for all properties
  LMap := TioMapContainer.GetMap(ASourceNewObj.ClassName);
  for LProp in LMap.GetProperties do
  begin
    // Based on relation type do something...
    LDiffValue := nil;
    case LProp.GetRelationType of
      rtNone:
        LDiffValue := Diff_ValueProp(LProp, ASourceOldObj, ASourceNewObj);
      rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
        LDiffValue := Diff_ObjectProp(LProp, ASourceOldObj, ASourceNewObj);
//      rtHasMany, rtEmbeddedHasMany:
//        LDiffValue := Diff_ListProp(LProp, LSourceOldJsonObj, LSourceNewJsonObj);
    end;
    // If a DiffValue is detected then add it to the result JSONObject
    if Assigned(LDiffValue) then
      Result.AddPair(LProp.GetName, LDiffValue);
  end;
end;

function TioEtmDiff.TryExtractCurrentValue(const LProp: IioProperty; const ASourceOldJsonObj, ASourceNewJsonObj: TJSONObject;
  out OCurrentOldJsonValue, OCurrentNewJsonValue: TJSONValue): Boolean;
var
  LPropName: String;
begin
  LPropName := LProp.GetName;
  // Extract current json values
  OCurrentOldJsonValue := ASourceOldJsonObj.Values[LPropName];
  OCurrentNewJsonValue := ASourceNewJsonObj.Values[LPropName];
  // If both are not assigned then exist false
  if (not Assigned(OCurrentOldJsonValue)) and (not Assigned(OCurrentNewJsonValue)) then
    Exit(False);
  // If one of the two are assigned and the other one is not assigned...
  if Assigned(OCurrentOldJsonValue) and not Assigned(OCurrentNewJsonValue) then
    OCurrentNewJsonValue := OCurrentOldJsonValue.ClassType.Create as TJSONValue;
  if Assigned(OCurrentNewJsonValue) and not Assigned(OCurrentOldJsonValue) then
    OCurrentOldJsonValue := OCurrentNewJsonValue.ClassType.Create as TJSONValue;
  // Detect if the current prop/value must be inserted in the result
  // note: OID property always inserted
  Result := (OCurrentOldJsonValue.ToString <> OCurrentNewJsonValue.ToString) or (LProp.PropertyRole = prObjID);
end;

function TioEtmDiff.Diff_ValueProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
var
  LValue: TValue;
  LOldJsonValue, LNewJsonValue: TJSONValue;
begin
  // Get the old json value
  if Assigned(ASourceOldObj) then
  begin
    LValue := LProp.GetValue(ASourceOldObj);
    LOldJsonValue := dj.From(LValue).OpType(ssETM).byFields.ToJsonValue;
  end
  else
    LOldJsonValue := TJSONNull.Create;
  // Get the new json value
  if Assigned(ASourceNewObj) then
  begin
    LValue := LProp.GetValue(ASourceNewObj);
    LNewJsonValue := dj.From(LValue).OpType(ssETM).byFields.ToJsonValue;
  end
  else
    LNewJsonValue := TJSONNull.Create;
  // Build the result json object or nil
  if LOldJsonValue.ToJSON <> LNewJsonValue.ToJSON then
  begin
    Result := TJSONObject.Create;
    Result.AddPair(TYPE_PROP_NAME, LProp.GetTypeName);
    Result.AddPair(OLD_VALUE_PROP_NAME, LOldJsonValue);
    Result.AddPair(NEW_VALUE_PROP_NAME, LNewJsonValue);
  end
  else
    Result := nil;
end;

function TioEtmDiff.Diff_ObjectProp(const LProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
var
  LValue: TValue;
  LOldObj, LNewObj: TObject;
begin
  // Init
  LOldObj := nil;
  LNewObj := nil;
  // Get the old child object
  if Assigned(ASourceOldObj) then
  begin
    LValue := LProp.GetRelationChildObject(ASourceOldObj, False);
    if not LValue.IsEmpty then
      LOldObj := LValue.AsObject;
  end;
  // Get the new child object
  if Assigned(ASourceNewObj) then
  begin
    LValue := LProp.GetRelationChildObject(ASourceNewObj, False);
    if not LValue.IsEmpty then
      LNewObj := LValue.AsObject;
  end;
  // Detect differences (recursion)
  Result := Diff_Object(LOldObj, LNewObj);
  // If the Result json object is not empty then



  LSourceOldJsonObj := ASourceOldJsonValue as TJSONObject;
  LSourceNewJsonObj := ASourceNewJsonValue as TJSONObject;
  // If only the old one is not empty (count > 0) then return it (status := deleted)
  if (LSourceOldJsonObj.Count > 0) and (LSourceNewJsonObj.Count = 0) then
  begin
    Result := LSourceOldJsonObj;
    Result.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_DELETED);
    LSourceNewJsonObj.Free;
  end
  else
    // If only the new one is not empty (count > 0) then return it (status := added)
    if (LSourceNewJsonObj.Count > 0) and (LSourceOldJsonObj.Count = 0) then
    begin
      Result := LSourceNewJsonObj;
      Result.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_ADDED);
      LSourceOldJsonObj.Free;
    end
    else
    // else (if both old and new ones are not empty) then detect differences
    begin
      // Get the child objects
      LOldObj := LProp.GetRelationChildObject(ASourceOldObj);
      LNewObj := LProp.GetRelationChildObject(ASourceNewObj);
      // Dtect differences (recursion)
      Result := Diff_Object(LOldObj, LNewObj);
      Result.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_UPDATED);
      LSourceOldJsonObj.Free;
      LSourceNewJsonObj.Free;
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
        LNewListItemJsonObj := dj.From(LNewListItem).OpType(ssETM).byFields.ToJsonValue as TJSONObject
      else
        Continue;
      // Search for the same element in the old list (same class, same id), if exists then serialize it
      LOldListItem := _FindListItem(LOldDuckList, LNewListItem);
      if Assigned(LOldListItem) then
      begin
        LOldListItemJsonObj := dj.From(LOldListItem).OpType(ssETM).byFields.ToJsonValue as TJSONObject;
        // if the json of the new list item and json of the old list item are different then build a diff json object for that
        // element and add it to the json array (status := updated), else contintue to the next item
        if LNewListItemJsonObj.ToString <> LOldListItemJsonObj.ToString then
        begin
          LResultArrayElement := Diff_Object(LOldListItem, LNewListItem);
          LResultArrayElement.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_ADDED);
          Result.Add(LResultArrayElement);
          FreeAndNil(LOldListItemJsonObj);
          FreeAndNil(LNewListItemJsonObj);
        end;
      end
      else
      begin
        // Is the old list item is not assigned then add the new list item json to the json array (status := added)
        LResultArrayElement := LNewListItemJsonObj;
        LResultArrayElement.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_UPDATED);
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
        LOldListItemJsonObj := dj.From(LOldListItem).OpType(ssETM).byFields.ToJsonValue as TJSONObject
      else
        Continue;
      // Search for the same element in the new list (same class, same id), if exists then continue to the next item
      // else (if not exists into the new list) then current old item is added to the json array (status := deleted)
      LNewListItem := _FindListItem(LNewDuckList, LOldListItem);
      if not Assigned(LNewListItem) then
      begin
        LResultArrayElement := LOldListItemJsonObj;
        LResultArrayElement.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_DELETED);
        Result.Add(LResultArrayElement);
      end;
    end;
  end;
  // ======================================================
end;

end.
