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
  if AJSONPair.JsonString.Value.StartsWith('$etm_old_') then
    ATargetOldJsonObj.AddPair(AJSONPair.Clone as TJSONPair);
  if AJSONPair.JsonString.Value.StartsWith('$etm_new_') then
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
  // Add target JSONObjects
  LOldJsonObj := TJSONObject.Create;
  ATargetOldJsonObj.AddPair(AJSONPair.JsonString, LOldJsonObj);
  LNewJsonObj := TJSONObject.Create;
  ATargetNewJsonObj.AddPair(AJSONPair.JsonString, LNewJsonObj);
  // Diff objects
  Diff_Object(AJSONPair.JsonValue as TJSONOBject, LOldJsonObj, LNewJsonObj, AIncludeInfo);
end;

class procedure TioEtmTwowayDiff.Diff_ListProp(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
var
  LSourceJsonArray, LTargetOldJsonArray, LTargetNewJsonArray: TJSONArray;
  LItemJsonValue: TJSONValue;
  LOldJsonObj, LNewJsonObj: TJSONObject;
begin
  // Get the source json array
  LSourceJsonArray := AJSONPair.JsonValue as TJSONArray;
  // Add target JSONArrays
  LTargetOldJsonArray := TJSONArray.Create;
  ATargetOldJsonObj.AddPair(AJSONPair.JsonString, LTargetOldJsonArray);
  LTargetNewJsonArray := TJSONArray.Create;
  ATargetNewJsonObj.AddPair(AJSONPair.JsonString, LTargetNewJsonArray);
  // Loop for all items
  for LItemJsonValue in LSourceJsonArray do
  begin
    // Create the json objects, add they to the respective array
    LOldJsonObj := TJSONObject.Create;
    LTargetOldJsonArray.Add(LOldJsonObj);
    LNewJsonObj := TJSONObject.Create;
    LTargetNewJsonArray.Add(LNewJsonObj);
    // Diff the current item
    Diff_Object(LItemJsonValue as TJSONObject, LOldJsonObj, LNewJsonObj, AIncludeInfo);
  end;
end;

class procedure TioEtmTwowayDiff.Diff_ValueProp(const AJSONPair: TJSONPair; const ATargetOldJsonObj, ATargetNewJsonObj: TJSONObject; const AIncludeInfo: Boolean);
var
  LSourceJsonObject: TJSONObject;
  procedure _RemoveOldPairs(const AJSONObject: TJSONObject);
  var
    LJSONPair: TJSONPair;
  begin
    for LJSONPair in AJSONObject do
      if (LJSONPair.JsonString.Value = ETM_ITEMS) or not LJSONPair.JsonString.Value.StartsWith('$etm_old_') then
        AJSONObject.RemovePair(LJSONPair.JsonString.Value);
  end;
  procedure _RemoveNewPairs(const AJSONObject: TJSONObject);
  var
    LJSONPair: TJSONPair;
  begin
    for LJSONPair in AJSONObject do
      if (LJSONPair.JsonString.Value = ETM_ITEMS) or not LJSONPair.JsonString.Value.StartsWith('$etm_new_') then
        AJSONObject.RemovePair(LJSONPair.JsonString.Value);
  end;

begin
  if AIncludeInfo then
  begin
    // Add old value
    LSourceJsonObject := AJSONPair.JsonValue.Clone as TJSONObject;
    _RemoveNewPairs(LSourceJsonObject);
    ATargetOldJsonObj.AddPair(AJSONPair.JsonString, LSourceJsonObject);
    // Add new value
    LSourceJsonObject := AJSONPair.JsonValue.Clone as TJSONObject;
    _RemoveOldPairs(LSourceJsonObject);
    ATargetNewJsonObj.AddPair(AJSONPair.JsonString, LSourceJsonObject);
  end
  else
  begin
    ATargetOldJsonObj.AddPair(ETM_OLD_VALUE, (AJSONPair.JsonValue.Clone as TJSONObject).GetValue(ETM_OLD_VALUE));
    ATargetNewJsonObj.AddPair(ETM_NEW_VALUE, (AJSONPair.JsonValue.Clone as TJSONObject).GetValue(ETM_NEW_VALUE));
  end;
end;

class function TioEtmTwowayDiff._IsEtmAnnotation(const AJSONPair: TJSONPair): Boolean;
begin
  Result := AJSONPair.JsonString.Value.StartsWith('$etm_');
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
