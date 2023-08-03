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
  ETM_OLD_PROP_TYPE = '$etm_old_type';
  ETM_NEW_PROP_TYPE = '$etm_new_type';

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
    FIncludeInfo: Boolean;
    function IsEmpty(const AJSONObject: TJSONObject): Boolean;
    function Diff_Status(const AOld, ANew: Pointer): String;
    function Diff_Object(const LPrevOldProp, LPrevNewProp: IioProperty; const AOldObj, ANewObj: TObject): TJSONObject;
    function Diff_ValueProp(const LOldProp, LNewProp: IioProperty; const AOldObj, ANewObj: TObject): TJSONObject;
    function Diff_ObjectProp(const LOldProp, LNewProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
    function Diff_ListProp(const LOldProp, LNewProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONValue;
  public
    constructor Create(const AIncludeInfo: Boolean);
  end;

implementation

uses
  iORM.Context.Map.Interfaces, iORM.Context.Container, iORM.Attributes, System.SysUtils,
  iORM.DuckTyped.Interfaces, iORM.Exceptions, iORM.DuckTyped.Factory,
  iORM.Utilities, DJSON, iORM.CommonTypes, System.Rtti;

{ TioEtmDiff }

constructor TioEtmDiff.Create(const AIncludeInfo: Boolean);
begin
  FIncludeInfo := AIncludeInfo;
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
    Result := String.Empty;
end;

function TioEtmDiff.Diff_Object(const LPrevOldProp, LPrevNewProp: IioProperty; const AOldObj, ANewObj: TObject): TJSONObject;
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
  // Include info
  if FIncludeInfo then
  begin
    Result.AddPair(ETM_DIFF_STATUS, Diff_Status(LOldMap, LNewMap));
    if Assigned(LPrevOldProp) then
      Result.AddPair(ETM_OLD_PROP_TYPE, LPrevOldProp.GetTypeName);
    if Assigned(LPrevNewProp) then
      Result.AddPair(ETM_NEW_PROP_TYPE, LPrevNewProp.GetTypeName);
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
      case LNewProp.GetRelationType of
        rtNone:
          LDiffValue := Diff_ValueProp(LOldProp, LNewProp, AOldObj, ANewObj);
        rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
          LDiffValue := Diff_ObjectProp(LOldProp, LNewProp, AOldObj, ANewObj);
        rtHasMany, rtEmbeddedHasMany:
          LDiffValue := Diff_ListProp(LOldProp, LNewProp, AOldObj, ANewObj);
      end;
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
      case LNewProp.GetRelationType of
        rtNone:
          LDiffValue := Diff_ValueProp(LOldProp, LNewProp, AOldObj, ANewObj);
        rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
          LDiffValue := Diff_ObjectProp(LOldProp, LNewProp, AOldObj, ANewObj);
        rtHasMany, rtEmbeddedHasMany:
          LDiffValue := Diff_ListProp(LOldProp, LNewProp, AOldObj, ANewObj);
      end;
      // If a diff is detected then add it to the result JSONObject
      if Assigned(LDiffValue) then
        Result.AddPair(LOldProp.GetName, LDiffValue);
    end;
  end;
  // ====================================================================
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
    // Include info
    if FIncludeInfo then
    begin
      Result.AddPair(ETM_DIFF_STATUS, Diff_Status(LOldProp, LNewProp));
      Result.AddPair(ETM_OLD_PROP_TYPE, LOldProp.GetTypeName);
      Result.AddPair(ETM_NEW_PROP_TYPE, LNewProp.GetTypeName);
    end;
    // Values
    Result.AddPair(ETM_OLD_VALUE, LOldJsonValue);
    Result.AddPair(ETM_NEW_VALUE, LNewJsonValue);
  end
  else
    Result := nil;
end;

function TioEtmDiff.Diff_ObjectProp(const LOldProp, LNewProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONObject;
var
  LOldObj, LNewObj: TObject;
begin
  // Init
  LOldObj := nil;
  LNewObj := nil;
  // Get the old child object
  if Assigned(LOldProp) then
    LOldObj := LOldProp.GetRelationChildObject(ASourceOldObj, False);
  // Get the new child object
  if Assigned(LNewProp) then
    LNewObj := LNewProp.GetRelationChildObject(ASourceNewObj, False);
  // Detect differences (recursion)
  Result := Diff_Object(LOldProp, LNewProp, LOldObj, LNewObj);
  // FreeAndnil then result json object if empty
  if IsEmpty(Result) then
    FreeAndNil(Result);
end;

function TioEtmDiff.Diff_ListProp(const LOldProp, LNewProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject): TJSONValue;
var
  LOldList, LNewList, LOldListItem, LNewListItem: TObject;
  LOldDuckList, LNewDuckList: IioDuckTypedList;
  LResultJsonArray: TJSONArray;
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
  LOldList := LOldProp.GetRelationChildObject(ASourceOldObj);
  LNewList := LNewProp.GetRelationChildObject(ASourceNewObj);
  // Get list child objects
  if Assigned(LOldProp) then
    LOldList := LOldProp.GetRelationChildObject(ASourceOldObj, False);
  if Assigned(LNewProp) then
    LNewList := LNewProp.GetRelationChildObject(ASourceNewObj, False);
  // Get list child objects as duck lists
  if Assigned(LOldList) and TioDuckTypedFactory.IsList(LOldList) then
    LOldDuckList := TioDuckTypedFactory.DuckTypedList(LOldList)
  else
    LOldDuckList := nil;
  if Assigned(LNewList) and TioDuckTypedFactory.IsList(LNewList) then
    LNewDuckList := TioDuckTypedFactory.DuckTypedList(LNewList)
  else
    LNewDuckList := nil;
  // Create the result json array
  LResultJsonArray := TJSONArray.Create;
  // Include info
  if FIncludeInfo then
  begin
    Result := TJSONObject.Create;
    TJSONObject(Result).AddPair(ETM_DIFF_STATUS, Diff_Status(LOldList, LNewList));
    if Assigned(LOldProp) then
      TJSONObject(Result).AddPair(ETM_OLD_PROP_TYPE, LOldProp.GetTypeName);
    if Assigned(LNewProp) then
      TJSONObject(Result).AddPair(ETM_NEW_PROP_TYPE, LNewProp.GetTypeName);
    if Assigned(LOldList) then
      TJSONObject(Result).AddPair(ETM_OLD_CLASS, LOldList.ClassName);
    if Assigned(LNewList) then
      TJSONObject(Result).AddPair(ETM_NEW_CLASS, LNewList.ClassName);
    TJSONObject(Result).AddPair('items', LResultJsonArray);
  end
  else
    Result := LResultJsonArray;
  // ======================================================
  // LOOP NEW DUCK LIST
  // ------------------------------------------------------
  if Assigned(LNewDuckList) then
  begin
    for LNewListItem in LNewDuckList do
    begin
      // If the current new item is assigned
      if not Assigned(LNewListItem) then
        Continue;
      // Search for the same element in the old list (same class, same id)
      LOldListItem := _FindListItem(LOldDuckList, LNewListItem);
      // Get the diff between the two version of the same object then add it to the resul json array
      LResultJsonArray.Add( Diff_Object(nil, nil, LOldListItem, LNewListItem) );
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
      // If the current old item is assigned
      if not Assigned(LOldListItem) then
        Continue;
      // Search for the same element in the new list (same class, same id)
      LNewListItem := _FindListItem(LNewDuckList, LOldListItem);
      // Get the diff between the two version of the same object then add it to the resul json array
      LResultJsonArray.Add( Diff_Object(nil, nil, LOldListItem, LNewListItem) );
    end;
  end;
  // ======================================================
  // FreeAndnil then result json object if empty
  if LResultJsonArray.Count = 0 then
    FreeAndNil(Result);
end;

end.
