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
unit iORM.ETM.Diff.Oneway;

interface

uses
  iORM.ETM.Interfaces, System.JSON, iORM.Context.Properties.Interfaces;

type

  TioEtmOnewayDiff = class(TioEtmCustomDiff)
  private
    class function IsEmpty(const AJSONObject: TJSONObject): Boolean;
    class function IsToBeSkipped(const AProp: IioProperty): Boolean;
    class function Diff_Status(const AOld, ANew: Pointer): String;
    class function Diff_Object(const LPrevOldProp, LPrevNewProp: IioProperty; const AOldObj, ANewObj: TObject; const AMoreInfo: Boolean): TJSONObject;
    class function Diff_ValueProp(const LOldProp, LNewProp: IioProperty; const AOldObj, ANewObj: TObject; const AMoreInfo: Boolean): TJSONObject;
    class function Diff_ObjectProp(const LOldProp, LNewProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject; const AMoreInfo: Boolean)
      : TJSONObject;
    class function Diff_ListProp(const LOldProp, LNewProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject; const AMoreInfo: Boolean): TJSONValue;
  public
    class function Diff(const AOldObj, ANewObj: TObject; const AMoreInfo: Boolean): TJSONObject; override;
  end;

implementation

uses
  iORM.Context.Map.Interfaces, iORM.Context.Container, iORM.Attributes, System.SysUtils,
  iORM.DuckTyped.Interfaces, iORM.Exceptions, iORM.DuckTyped.Factory,
  iORM.Utilities, iORM.CommonTypes, System.Rtti, DJSON, DJSON.Params,
  iORM.ETM.Factory;

{ TioEtmDiff }

class function TioEtmOnewayDiff.Diff(const AOldObj, ANewObj: TObject; const AMoreInfo: Boolean): TJSONObject;
begin
  Result := Diff_Object(nil, nil, AOldObj, ANewObj, AMoreInfo);
end;

class function TioEtmOnewayDiff.IsEmpty(const AJSONObject: TJSONObject): Boolean;
var
  LJSONPair: TJSONPair;
begin
  Result := True;
  for LJSONPair in AJSONObject                do
    if not LJSONPair.JsonString.Value.StartsWith('$etm_') then
      Exit(False);
end;

class function TioEtmOnewayDiff.IsToBeSkipped(const AProp: IioProperty): Boolean;
var
  LdjParams: IdjParams;
begin
  LdjParams := dj.Default;
  LdjParams.OpType := TdjSkipScope.ssETM;
  Result := AProp.isHasManyChildVirtualProperty or LdjParams.IsToBeSkipped(AProp.GetInternalRttiPropField);
end;

class function TioEtmOnewayDiff.Diff_Status(const AOld, ANew: Pointer): String;
begin
  if (AOld <> nil) and (ANew <> nil) then
    Result := ETM_DIFF_STATUS_UPDATED
  else if (AOld <> nil) then
    Result := ETM_DIFF_STATUS_REMOVED
  else if (ANew <> nil) then
    Result := ETM_DIFF_STATUS_NEW
  else
    Result := String.Empty;
end;

class function TioEtmOnewayDiff.Diff_Object(const LPrevOldProp, LPrevNewProp: IioProperty; const AOldObj, ANewObj: TObject; const AMoreInfo: Boolean)
  : TJSONObject;
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
  // ====================================================================
  // INFO
  // --------------------------------------------------------------------
  // Status (sempre)
  Result.AddPair(ETM_DIFF_STATUS, Diff_Status(LOldMap, LNewMap));
  // Solo se si vogliono più informazioni
  if AMoreInfo then
  begin
    // Old
    if Assigned(LPrevOldProp) then
      Result.AddPair(ETM_LABEL_OLD_PROP_TYPE, LPrevOldProp.GetTypeName);
    if Assigned(LOldMap) then
      Result.AddPair(ETM_LABEL_OLD_CLASS, AOldObj.ClassName)
    else
      Result.AddPair(ETM_LABEL_OLD_CLASS, TJSONNull.Create);
    // New
    if Assigned(LPrevNewProp) then
      Result.AddPair(ETM_LABEL_NEW_PROP_TYPE, LPrevNewProp.GetTypeName);
    if Assigned(LNewMap) then
      Result.AddPair(ETM_LABEL_NEW_CLASS, ANewObj.ClassName)
    else
      Result.AddPair(ETM_LABEL_NEW_CLASS, TJSONNull.Create);
  end
  else
  // Se non vogliamo MoreInfo mette cmq il nome della classe dell'oggetto corrente e lo prende
  //  dal nuovo o dal vecchio in base a quello che c'è
  begin
    if Assigned(LNewMap) then
      Result.AddPair(ETM_LABEL_CLASS, ANewObj.ClassName)
    else
    if Assigned(LOldMap) then
      Result.AddPair(ETM_LABEL_CLASS, AOldObj.ClassName)
  end;
  // ID (sempre anche se non si vogliono le info)
  //  NB: Una qualunque delle due ma deve esserci
  if Assigned(LOldMap) then
    Result.AddPair(ETM_LABEL_ID, LOldMap.GetProperties.GetIdProperty.GetValue(AOldObj).AsInteger)
  else
  if Assigned(LNewMap) then
    Result.AddPair(ETM_LABEL_ID, LNewMap.GetProperties.GetIdProperty.GetValue(ANewObj).AsInteger);
  // ====================================================================
  // ====================================================================
  // FIRST LOOP FOR PROPERTIES OF THE NEW OBJECT (added or updated props)
  // --------------------------------------------------------------------
  if Assigned(LNewMap) then
  begin
    for LNewProp in LNewMap.GetProperties do
    begin
      // If the current property is to be skipped...
      if IsToBeSkipped(LNewProp) then
        Continue;
      // Search for the same property into the old map (nil if not found)
      LOldProp := nil;
      if Assigned(LOldMap) then
        LOldProp := LOldMap.GetProperties.GetPropertyByName(LNewProp.GetName, False);
      // Detect differences
      LDiffValue := nil;
      case LNewProp.GetRelationType of
        rtNone:
          LDiffValue := Diff_ValueProp(LOldProp, LNewProp, AOldObj, ANewObj, AMoreInfo);
        rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
          LDiffValue := Diff_ObjectProp(LOldProp, LNewProp, AOldObj, ANewObj, AMoreInfo);
        rtHasMany, rtEmbeddedHasMany:
          LDiffValue := Diff_ListProp(LOldProp, LNewProp, AOldObj, ANewObj, AMoreInfo);
      end;
      // If a diff is detected then add it to the result JSONObject
      if Assigned(LDiffValue) then
        Result.AddPair(LNewProp.GetName, LDiffValue);
    end;
  end;
  // ====================================================================
  // ====================================================================
  // SECOND LOOP FOR PROPERTIES OF THE OLD OBJECT (deleted props)
  // --------------------------------------------------------------------
  if Assigned(LOldMap) then
  begin
    for LOldProp in LOldMap.GetProperties do
    begin
      // If the current property is to be skipped...
      if IsToBeSkipped(LOldProp) then
        Continue;
      // Search for the same property into the new map (nil if not found)
      LNewProp := nil;
      if Assigned(LNewMap) then
        LNewProp := LNewMap.GetProperties.GetPropertyByName(LOldProp.GetName, False);
      // Only if a new prop was not found (only the deleted ones)
      if Assigned(LNewProp) then
        Continue;
      // Detect differences
      LDiffValue := nil;
      case LOldProp.GetRelationType of
        rtNone:
          LDiffValue := Diff_ValueProp(LOldProp, LNewProp, AOldObj, ANewObj, AMoreInfo);
        rtBelongsTo, rtHasOne, rtEmbeddedHasOne:
          LDiffValue := Diff_ObjectProp(LOldProp, LNewProp, AOldObj, ANewObj, AMoreInfo);
        rtHasMany, rtEmbeddedHasMany:
          LDiffValue := Diff_ListProp(LOldProp, LNewProp, AOldObj, ANewObj, AMoreInfo);
      end;
      // If a diff is detected then add it to the result JSONObject
      if Assigned(LDiffValue) then
        Result.AddPair(LOldProp.GetName, LDiffValue);
    end;
  end;
  // ====================================================================
end;

class function TioEtmOnewayDiff.Diff_ValueProp(const LOldProp, LNewProp: IioProperty; const AOldObj, ANewObj: TObject; const AMoreInfo: Boolean)
  : TJSONObject;
var
  LValue: TValue;
  LOldJsonValue, LNewJsonValue: TJSONValue;
begin
  Result := nil;
  // Get the old json value
  if Assigned(LOldProp) then
  begin
    LValue := LOldProp.GetValue(AOldObj);
    LOldJsonValue := dj.From(LValue, TioEtmFactory.djParamsDiff).ToJsonValue;
  end
  else
    LOldJsonValue := TJSONNull.Create;
  // Get the new json value
  if Assigned(LNewProp) then
  begin
    LValue := LNewProp.GetValue(ANewObj);
    LNewJsonValue := dj.From(LValue, TioEtmFactory.djParamsDiff).ToJsonValue;
  end
  else
    LNewJsonValue := TJSONNull.Create;
  // Build the result json object or nil
  if LOldJsonValue.ToJSON <> LNewJsonValue.ToJSON then
  begin
    Result := TJSONObject.Create;

    // Status
    if AMoreInfo then
      Result.AddPair(ETM_DIFF_STATUS, Diff_Status(LOldProp, LNewProp));

    // Old
    if AMoreInfo then
    begin
      // Old type
      if Assigned(LOldProp) then
        Result.AddPair(ETM_LABEL_OLD_PROP_TYPE, LOldProp.GetTypeName)
      else
        Result.AddPair(ETM_LABEL_OLD_PROP_TYPE, TJSONNull.Create);
    end;
    // Old value
    Result.AddPair(ETM_OLD_VALUE, LOldJsonValue);

    // New
    if AMoreInfo then
    begin
      // New type
      if Assigned(LNewProp) then
        Result.AddPair(ETM_LABEL_NEW_PROP_TYPE, LNewProp.GetTypeName)
      else
        Result.AddPair(ETM_LABEL_NEW_PROP_TYPE, TJSONNull.Create);
    end;
    // New value
    Result.AddPair(ETM_NEW_VALUE, LNewJsonValue);

  end
  else
  begin
    LOldJsonValue.Free;
    LNewJsonValue.Free;
  end;
end;

class function TioEtmOnewayDiff.Diff_ObjectProp(const LOldProp, LNewProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject; const AMoreInfo: Boolean)
  : TJSONObject;
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
  Result := Diff_Object(LOldProp, LNewProp, LOldObj, LNewObj, AMoreInfo);
  // FreeAndnil then result json object if empty
  if IsEmpty(Result) then
    FreeAndNil(Result);
end;

class function TioEtmOnewayDiff.Diff_ListProp(const LOldProp, LNewProp: IioProperty; const ASourceOldObj, ASourceNewObj: TObject; const AMoreInfo: Boolean)
  : TJSONValue;
var
  LOldList, LNewList, LOldListItem, LNewListItem: TObject;
  LOldDuckList, LNewDuckList: IioDuckTypedList;
  LDiffJsonObj: TJSONObject;
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
      LCurrID := TioUtilities.ExtractOID(Result);
      if (Result.ClassName = AObjToSearch.ClassName) and (LCurrID = LSearchID) then
        Exit;
    end;
    Result := nil;
  end;

begin
  // Init
  LOldList := nil;
  LNewList := nil;
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
  if AMoreInfo then
  begin
    Result := TJSONObject.Create;
    TJSONObject(Result).AddPair(ETM_DIFF_STATUS, Diff_Status(LOldList, LNewList));
    // Old
    if Assigned(LOldProp) then
      TJSONObject(Result).AddPair(ETM_LABEL_OLD_PROP_TYPE, LOldProp.GetTypeName)
    else
      TJSONObject(Result).AddPair(ETM_LABEL_OLD_PROP_TYPE, TJSONNull.Create);
    if Assigned(LOldList) then
      TJSONObject(Result).AddPair(ETM_LABEL_OLD_CLASS, LOldList.ClassName)
    else
      TJSONObject(Result).AddPair(ETM_LABEL_OLD_CLASS, TJSONNull.Create);
    // New
    if Assigned(LNewProp) then
      TJSONObject(Result).AddPair(ETM_LABEL_NEW_PROP_TYPE, LNewProp.GetTypeName)
    else
      TJSONObject(Result).AddPair(ETM_LABEL_NEW_PROP_TYPE, TJSONNull.Create);
    if Assigned(LNewList) then
      TJSONObject(Result).AddPair(ETM_LABEL_NEW_CLASS, LNewList.ClassName)
    else
      TJSONObject(Result).AddPair(ETM_LABEL_NEW_CLASS, TJSONNull.Create);
    // Items
    TJSONObject(Result).AddPair(ETM_ITEMS, LResultJsonArray);
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
      // Get the diff between the two version of the same object
      LDiffJsonObj := Diff_Object(nil, nil, LOldListItem, LNewListItem, AMoreInfo);
      // Add the diff to the resoult json array (or freeit if empty)
      if not IsEmpty(LDiffJsonObj) then
        LResultJsonArray.Add(LDiffJsonObj)
      else
        FreeAndNil(LDiffJsonObj);
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
      // Get the diff between the two version of the same object
      LDiffJsonObj := Diff_Object(nil, nil, LOldListItem, LNewListItem, AMoreInfo);
      // Add the diff to the resoult json array (or freeit if empty)
      if not IsEmpty(LDiffJsonObj) then
        LResultJsonArray.Add(LDiffJsonObj)
      else
        FreeAndNil(LDiffJsonObj);
    end;
  end;
  // ======================================================
  // FreeAndnil then result json object if empty
  if LResultJsonArray.Count = 0 then
    FreeAndNil(Result);
end;

end.
