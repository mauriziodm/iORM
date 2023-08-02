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
  ETM_OLD_TYPE = '$etm_old_type';
  ETM_NEW_TYPE = '$etm_new_type';

  ETM_OLD_CLASS = '$etm_old_class';
  ETM_NEW_CLASS = '$etm_new_class';

  ETM_ID = '$etm_id';
  ETM_OLD_ID = '$etm_old_id';
  ETM_NEW_ID = '$etm_new_id';

  ETM_OLD_VALUE = '$etm_old_value';
  ETM_NEW_VALUE = '$etm_new_value';

  ETM_DIFF_STATUS = '$etm_diff_status';
  ETM_DIFF_STATUS_NEW = 'new';
  ETM_DIFF_STATUS_UPDATED = 'updated';
  ETM_DIFF_STATUS_REMOVED = 'removed';

type

  TioEtmDiff = class
  private
    FDiffJSON: TJSONObject;
    function IsEmpty(const AJSONObject: TJSONObject): Boolean;
    function Diff_Status(const AOld, ANew: Pointer): String;
    function Diff_Object(const AOldObj, ANewObj: TObject): TJSONObject;
    function Diff_ValueProp(const LOldProp, LNewProp: IioProperty; const AOldObj, ANewObj: TObject): TJSONObject;
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

function TioEtmDiff.Diff_Status(const AOld, ANew: Pointer): String;
begin
  if (AOld <> nil) and (ANew <> nil) then
    Result := ETM_DIFF_STATUS_UPDATED
  else
  if (AOld <> nil) then
    Result := ETM_DIFF_STATUS_NEW
  else
  if (ANew <> nil) then
    Result := ETM_DIFF_STATUS_REMOVED
  else
    Result := 'unknown';
end;

function TioEtmDiff.Diff_Object(const AOldObj, ANewObj: TObject): TJSONObject;
var
  LOldMap, LNewMap: IioMap;
  LOldProp, LNewProp: IioProperty;
  LDiffValue: TJSONValue;
begin
  // Init
  LOldMap := nil;
  LNewMap := nil;
  // Get maps (only mapped entities are accepted)
  if Assigned(AOldObj) then
    LOldMap := TioMapContainer.GetMap(AOldObj.ClassName);
  if Assigned(ANewObj) then
    LNewMap := TioMapContainer.GetMap(ANewObj.ClassName);
  // Create the result json object
  Result := TJSONObject.Create;
  Result.AddPair(ETM_DIFF_STATUS, Diff_Status(LOldMap, LNewMap));
  if Assigned(LOldMap) then
  begin
    Result.AddPair(ETM_OLD_CLASS, AOldObj.ClassName);
    Result.AddPair(ETM_OLD_ID, LOldMap.GetProperties.GetIdProperty.GetValue(AOldObj).AsInteger);
  end;
  if Assigned(LNewMap) then
  begin
    Result.AddPair(ETM_NEW_CLASS, ANewObj.ClassName);
    Result.AddPair(ETM_NEW_ID, LNewMap.GetProperties.GetIdProperty.GetValue(ANewObj).AsInteger);
  end;
  // ====================================================================
  // FIRST LOOP FOR PROPERTIES OF THE NEW OBJECT (added or updated props)
  // --------------------------------------------------------------------
  if Assigned(LNewMap) then
  begin
    for LNewProp in LNewMap.GetProperties do
    begin
      // Search for the same property into the old map (nil if not found)
      LOldProp := nil;
      if Assigned(LOldMap) then
        LOldProp := LOldMap.GetProperties.GetPropertyByName(LNewProp.GetName, False);
      // Detect differences
      LDiffValue := nil;
//      case LNewProp.GetRelationType of
//        rtNone:
//          LDiffValue := Diff_ValueProp(LNewProp, AOldObj, ANewObj);
//        rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
//          LDiffValue := Diff_ObjectProp(LNewProp, AOldObj, ANewObj);
//        rtHasMany, rtEmbeddedHasMany:
//          LDiffValue := Diff_ListProp(LProp, LSourceOldJsonObj, LSourceNewJsonObj);
//      end;
      // If a diff is detected then add it to the result JSONObject
      if Assigned(LDiffValue) then
        Result.AddPair(LNewProp.GetName, LDiffValue);
    end;
  end;
  // ====================================================================
  // ====================================================================
  // FIRST LOOP FOR PROPERTIES OF THE OLD OBJECT (deleted props)
  // --------------------------------------------------------------------
  if Assigned(LOldMap) then
  begin
    for LOldProp in LOldMap.GetProperties do
    begin
      // Search for the same property into the new map (nil if not found)
      LNewProp := nil;
      if Assigned(LNewMap) then
        LNewProp := LNewMap.GetProperties.GetPropertyByName(LOldProp.GetName, False);
      // Only if a new prop was not found (only the deleted ones)
      if Assigned(LNewProp) then
        Continue;
      // Detect differences
      LDiffValue := nil;
//      case LNewProp.GetRelationType of
//        rtNone:
//          LDiffValue := Diff_ValueProp(LNewProp, AOldObj, ANewObj);
//        rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
//          LDiffValue := Diff_ObjectProp(LNewProp, AOldObj, ANewObj);
//        rtHasMany, rtEmbeddedHasMany:
//          LDiffValue := Diff_ListProp(LProp, LSourceOldJsonObj, LSourceNewJsonObj);
//      end;
      // If a diff is detected then add it to the result JSONObject
      if Assigned(LDiffValue) then
        Result.AddPair(LOldProp.GetName, LDiffValue);
    end;
  end;
  // ====================================================================
  // FreeAndnil then result json object if empty
  if IsEmpty(Result) then
    FreeAndNil(Result);
end;

function TioEtmDiff.Diff_ValueProp(const LOldProp, LNewProp: IioProperty; const AOldObj, ANewObj: TObject): TJSONObject;
var
  LValue: TValue;
  LOldJsonValue, LNewJsonValue: TJSONValue;
begin
  // Get the old json value
  if Assigned(LOldProp) then
  begin
    LValue := LOldProp.GetValue(AOldObj);
    LOldJsonValue := dj.From(LValue).OpType(ssETM).byFields.ToJsonValue;
  end
  else
    LOldJsonValue := TJSONNull.Create;
  // Get the new json value
  if Assigned(LNewProp) then
  begin
    LValue := LNewProp.GetValue(ANewObj);
    LNewJsonValue := dj.From(LValue).OpType(ssETM).byFields.ToJsonValue;
  end
  else
    LNewJsonValue := TJSONNull.Create;
  // Build the result json object or nil
  if LOldJsonValue.ToJSON <> LNewJsonValue.ToJSON then
  begin
    Result := TJSONObject.Create;
    Result.AddPair(ETM_DIFF_STATUS, Diff_Status(LOldProp, LNewProp));
    Result.AddPair(ETM_OLD_TYPE, LOldProp.GetTypeName);
    Result.AddPair(ETM_NEW_TYPE, LNewProp.GetTypeName);
    Result.AddPair(ETM_OLD_VALUE, LOldJsonValue);
    Result.AddPair(ETM_NEW_VALUE, LNewJsonValue);
  end
  else
    Result := nil;
end;

function TioEtmDiff.IsEmpty(const AJSONObject: TJSONObject): Boolean;
var
  LJSONPair: TJSONPair;
begin
  Result := True;
  for LJSONPair in AJSONObject do
    if not LJSONPair.JsonString.Value.StartsWith('$etm') then
      Exit(False);
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



//  LSourceOldJsonObj := ASourceOldJsonValue as TJSONObject;
//  LSourceNewJsonObj := ASourceNewJsonValue as TJSONObject;
//  // If only the old one is not empty (count > 0) then return it (status := deleted)
//  if (LSourceOldJsonObj.Count > 0) and (LSourceNewJsonObj.Count = 0) then
//  begin
//    Result := LSourceOldJsonObj;
//    Result.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_DELETED);
//    LSourceNewJsonObj.Free;
//  end
//  else
//    // If only the new one is not empty (count > 0) then return it (status := added)
//    if (LSourceNewJsonObj.Count > 0) and (LSourceOldJsonObj.Count = 0) then
//    begin
//      Result := LSourceNewJsonObj;
//      Result.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_ADDED);
//      LSourceOldJsonObj.Free;
//    end
//    else
//    // else (if both old and new ones are not empty) then detect differences
//    begin
//      // Get the child objects
//      LOldObj := LProp.GetRelationChildObject(ASourceOldObj);
//      LNewObj := LProp.GetRelationChildObject(ASourceNewObj);
//      // Dtect differences (recursion)
//      Result := Diff_Object(LOldObj, LNewObj);
//      Result.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_UPDATED);
//      LSourceOldJsonObj.Free;
//      LSourceNewJsonObj.Free;
//    end;
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
//          LResultArrayElement.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_ADDED);
          Result.Add(LResultArrayElement);
          FreeAndNil(LOldListItemJsonObj);
          FreeAndNil(LNewListItemJsonObj);
        end;
      end
      else
      begin
        // Is the old list item is not assigned then add the new list item json to the json array (status := added)
        LResultArrayElement := LNewListItemJsonObj;
//        LResultArrayElement.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_UPDATED);
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
//        LResultArrayElement.AddPair(DIFF_STATUS_PROP_NAME, DIFF_STATUS_DELETED);
        Result.Add(LResultArrayElement);
      end;
    end;
  end;
  // ======================================================
end;

end.
