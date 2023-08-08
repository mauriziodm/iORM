unit iORM.ETM.Diff.Twoway;

interface

uses
  iORM.ETM.Interfaces, System.JSON;

type

  TioEtmTwowayDiff = class(TioEtmCustomDiff)
  private
    class function _IsEtmAnnotation(const AJSONPair: TJSONPair): Boolean;
    class function _IsValueProp(const AJSONPair: TJSONPair): Boolean;
    class function _IsListProp(const AJSONPair: TJSONPair): Boolean;
    class function _HasNewStatus(const AJSONValue: TJSONValue): Boolean;
    class function _HasRemovedStatus(const AJSONValue: TJSONValue): Boolean;
    class procedure Diff_EtmAnnotation(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject);
    class procedure Diff_ValueProp(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
    class procedure Diff_ObjectProp(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
    class procedure Diff_ListProp(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
    class procedure Diff_Object(const ASourceJsonObj: TJSONObject; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
  public
    class function Diff(const AOldObj, ANewObj: TObject; const AIncludeInfo: Boolean): TJSONObject; override;
  end;

implementation

uses
  System.SysUtils, iORM.ETM.Diff.Oneway;

{ TioEtmTwowayDiff }

class procedure TioEtmTwowayDiff.Diff_EtmAnnotation(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject);
begin
  // Old
  if Assigned(ATargetOldJsonObj) then
    if AJSONPair.JsonString.Value.StartsWith('$etm_old_') or (AJSONPair.JsonString.Value = ETM_LABEL_ID) or (AJSONPair.JsonString.Value = ETM_LABEL_CLASS) or (AJSONPair.JsonString.Value = ETM_DIFF_STATUS) then
      ATargetOldJsonObj.AddPair(AJSONPair.Clone as TJSONPair);
  // New
  if Assigned(ATargetNewJsonObj) then
    if AJSONPair.JsonString.Value.StartsWith('$etm_new_') or (AJSONPair.JsonString.Value = ETM_LABEL_ID) or (AJSONPair.JsonString.Value = ETM_LABEL_CLASS) or (AJSONPair.JsonString.Value = ETM_DIFF_STATUS) then
      ATargetNewJsonObj.AddPair(AJSONPair.Clone as TJSONPair);
end;

class function TioEtmTwowayDiff.Diff(const AOldObj, ANewObj: TObject; const AIncludeInfo: Boolean): TJSONObject;
var
  LSourceJSONObject, LOldJsonObj, LNewJsonObj: TJSONObject;
begin
  // Get the Oneway diff jsonobject
  LSourceJSONObject := TioEtmOnewayDiff.Diff(AOldObj, ANewObj, AIncludeInfo);
  try
    // Create the result json object and add the two root properties
    Result := TJSONObject.Create;
    LOldJsonObj := TJSONObject.Create;
    Result.AddPair(ETM_OLD_VALUE, LOldJsonObj);
    LNewJsonObj := TJSONObject.Create;
    Result.AddPair(ETM_OLD_VALUE, LNewJsonObj);
    // Diff
    Diff_Object(LSourceJSONObject, LOldJsonObj, LNewJsonObj, AIncludeInfo);
  finally
    LSourceJSONObject.Free;
  end;
end;

class procedure TioEtmTwowayDiff.Diff_Object(const ASourceJsonObj: TJSONObject; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
var
  LJSONPair: TJSONPair;
begin
  for LJSONPair in ASourceJsonObj do
  begin
    // Note: "_IsValueProp" must be before "_IsEtmAnnotation"
    if _IsValueProp(LJSONPair) then
      Diff_ValueProp(LJSONPair, ATargetOldJsonObj, ATargetNewJsonObj, AIncludeInfo)
    else
    if _IsEtmAnnotation(LJSONPair) then
      Diff_EtmAnnotation(LJSONPair, ATargetOldJsonObj, ATargetNewJsonObj)
    else
    if _IsListProp(LJSONPair) then
      Diff_ListProp(LJSONPair, ATargetOldJsonObj, ATargetNewJsonObj, AIncludeInfo)
    else
      Diff_ObjectProp(LJSONPair, ATargetOldJsonObj, ATargetNewJsonObj, AIncludeInfo);
  end;
end;

class procedure TioEtmTwowayDiff.Diff_ObjectProp(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject;
  const AIncludeInfo: Boolean);
var
  LOldJsonObj, LNewJsonObj: TJSONObject;
begin
  LOldJsonObj := nil;
  LNewJsonObj := nil;
  // Add target JSONObjects
  if Assigned(ATargetOldJsonObj) then
  begin
    LOldJsonObj := TJSONObject.Create;
    ATargetOldJsonObj.AddPair(AJSONPair.JsonString.Value, LOldJsonObj);
  end;
  if Assigned(ATargetOldJsonObj) then
  begin
    LNewJsonObj := TJSONObject.Create;
    ATargetNewJsonObj.AddPair(AJSONPair.JsonString.Value, LNewJsonObj);
  end;
  // Diff objects
  Diff_Object(AJSONPair.JsonValue as TJSONOBject, LOldJsonObj, LNewJsonObj, AIncludeInfo);
end;

class procedure TioEtmTwowayDiff.Diff_ListProp(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
var
  LSourceJsonArray, LTargetOldJsonArray, LTargetNewJsonArray: TJSONArray;
  LItemJsonValue: TJSONValue;
  LOldJsonObj, LNewJsonObj: TJSONObject;
begin
  LTargetOldJsonArray := nil;
  LTargetNewJsonArray := nil;
  // Get the source json array
  LSourceJsonArray := AJSONPair.JsonValue as TJSONArray;
  // Add target JSONArrays
  if Assigned(ATargetOldJsonObj) then
  begin
    LTargetOldJsonArray := TJSONArray.Create;
    ATargetOldJsonObj.AddPair(AJSONPair.JsonString.Value, LTargetOldJsonArray);
  end;
  if Assigned(ATargetNewJsonObj) then
  begin
    LTargetNewJsonArray := TJSONArray.Create;
    ATargetNewJsonObj.AddPair(AJSONPair.JsonString.Value, LTargetNewJsonArray);
  end;
  // Loop for all items
  for LItemJsonValue in LSourceJsonArray do
  begin
    LOldJsonObj := nil;
    LNewJsonObj := nil;
    // Create the json objects, add they to the respective array
    if not _HasNewStatus(LItemJsonValue) then
    begin
      LOldJsonObj := TJSONObject.Create;
      LTargetOldJsonArray.Add(LOldJsonObj);
    end;
    if not _HasRemovedStatus(LItemJsonValue) then
    begin
      LNewJsonObj := TJSONObject.Create;
      LTargetNewJsonArray.Add(LNewJsonObj);
    end;
    // Diff the current item
    Diff_Object(LItemJsonValue as TJSONObject, LOldJsonObj, LNewJsonObj, AIncludeInfo);
  end;
end;

class procedure TioEtmTwowayDiff.Diff_ValueProp(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
var
  LOldJsonObj, LNewJsonObj: TJSONOBject;
begin
  if AIncludeInfo then
  begin
    LOldJsonObj := nil;
    LNewJsonObj := nil;
    // Old
    if Assigned(ATargetOldJsonObj) then
    begin
      LOldJsonObj := TJSONObject.Create;
      ATargetOldJsonObj.AddPair(AJSONPair.JsonString.Value, LOldJsonObj);
    end;
    // New
    if Assigned(ATargetNewJsonObj) then
    begin
      LNewJsonObj := TJSONObject.Create;
      ATargetNewJsonObj.AddPair(AJSONPair.JsonString.Value, LNewJsonObj);
    end;
    // Diff
    Diff_Object(AJSONPair.JsonValue as TJSONObject, LOldJsonObj, LNewJsonObj, AIncludeInfo);
  end
  else
  begin
    if Assigned(ATargetOldJsonObj) then
      ATargetOldJsonObj.AddPair(AJSONPair.JsonString.Value, (AJSONPair.JsonValue as TJSONObject).GetValue(ETM_OLD_VALUE).Clone as TJSONValue);
    if Assigned(ATargetNewJsonObj) then
      ATargetNewJsonObj.AddPair(AJSONPair.JsonString.Value, (AJSONPair.JsonValue as TJSONObject).GetValue(ETM_NEW_VALUE).Clone as TJSONValue);
  end;
end;

class function TioEtmTwowayDiff._HasNewStatus(const AJSONValue: TJSONValue): Boolean;
var
  LJSONObject: TJSONOBject;
  LStatusJsonValue: TJSONValue;
begin
  Result := False;
  if AJSONValue is TJSONObject then
  begin
    LJSONObject := AJSONValue as TJSONObject;
    LStatusJsonValue := LJSONObject.GetValue(ETM_DIFF_STATUS);
    Result := Assigned(LStatusJsonValue) and (LStatusJsonValue.Value = ETM_DIFF_STATUS_NEW);
  end;
end;

class function TioEtmTwowayDiff._HasRemovedStatus(const AJSONValue: TJSONValue): Boolean;
var
  LJSONObject: TJSONOBject;
  LStatusJsonValue: TJSONValue;
begin
  Result := False;
  if AJSONValue is TJSONObject then
  begin
    LJSONObject := AJSONValue as TJSONObject;
    LStatusJsonValue := LJSONObject.GetValue(ETM_DIFF_STATUS);
    Result := Assigned(LStatusJsonValue) and (LStatusJsonValue.Value = ETM_DIFF_STATUS_REMOVED);
  end;
end;

class function TioEtmTwowayDiff._IsEtmAnnotation(const AJSONPair: TJSONPair): Boolean;
begin
  Result := AJSONPair.JsonString.Value.StartsWith('$etm_') and (AJSONPair.JsonString.Value <> ETM_ITEMS);
end;

class function TioEtmTwowayDiff._IsListProp(const AJSONPair: TJSONPair): Boolean;
begin
  Result := AJSONPair.JsonValue is TJSONArray;
end;

class function TioEtmTwowayDiff._IsValueProp(const AJSONPair: TJSONPair): Boolean;
var
  LJSONObject: TJSONOBject;
begin
  Result := False;
  if AJSONPair.JsonValue is TJSONObject then
  begin
    LJSONObject := AJSONPair.JsonValue as TJSONObject;
    Result := Assigned(LJSONObject.GetValue(ETM_NEW_VALUE)) or Assigned(LJSONObject.GetValue(ETM_OLD_VALUE));
  end;
end;

end.
