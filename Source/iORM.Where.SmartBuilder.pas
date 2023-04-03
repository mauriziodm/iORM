unit iORM.Where.SmartBuilder;

interface

uses
  iORM.Where.Interfaces, iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces;

type

  TioWhereSmartBuilderRef = class of TioWhereSmartBuilder;

  TioWhereSmartBuilder = class
  private
    class function BuildGroupWhere(const AObj: TObject; const AMap: IioMap; const AGroupName: String): IioWhere;
    class procedure BuildPropWhere(const AObj: TObject; const AProp: IioProperty; const AWhere: IioWhere);
    class procedure CheckWhereNullValueAffinity(const AProp: IioProperty);
  public
    class function BuildWhere(const AObj: TObject): IioWhere;
  end;

implementation

uses
  iORM.Context.Container, iORM.Where.Factory, System.SysUtils, iORM.Attributes, System.Rtti,
  iORM.DB.Factory, iORM.Exceptions, iORM.Utilities;

{ TioWhereSmartBuilder }

class procedure TioWhereSmartBuilder.CheckWhereNullValueAffinity(const AProp: IioProperty);
begin
  if not AProp.WhereNullValue.IsType(AProp.GetTypeInfo, True) then
    raise EioException.Create(ClassName, 'CheckWhereNullValueAffinity',
      Format('Oops, there''s a type incompatibility problem.' +
      #13#13'"WhereNullValue" for property named "%s" is of type "%s" while property is of type "%s".',
      [AProp.GetName, TioUtilities.TypeInfoToTypeName(AProp.WhereNullValue.TypeInfo), AProp.GetTypeName]));
end;

class procedure TioWhereSmartBuilder.BuildPropWhere(const AObj: TObject; const AProp: IioProperty; const AWhere: IioWhere);
var
  LValue: TValue;
begin
  LValue := AProp.GetValue(AObj);
  // Check if the value of the prop is null
  if (not AProp.WhereSkip) and (not LValue.IsEmpty) then
  begin
    case AProp.GetRttiType.TypeKind of
      // String
      tkString, tkUString, tkWString, tkLString, tkChar, tkWChar:
        if LValue.AsString.Trim.ToUpper = AProp.WhereNullValue.AsString.Trim.ToUpper then
          Exit;
      // Integer/Float/DateTime
      tkInteger, tkInt64, tkFloat:    
        if LValue.AsInteger.ToString = AProp.WhereNullValue.AsInteger.ToString then
          Exit;
      // Enumeration
      tkEnumeration:
        if AProp.WhereNullValue.IsEmpty or (LValue.AsOrdinal = AProp.WhereNullValue.AsOrdinal) then
          Exit;
    else
      Exit;
    end;
    // If the value of the prop is non null then add the criteria
    (AWhere as IioWhereInternal)._AddCriteria(AProp.WhereLogicOp, AProp.WhereTargetPropName, AProp.WhereCompareOp, LValue);
  end;
end;

class function TioWhereSmartBuilder.BuildGroupWhere(const AObj: TObject; const AMap: IioMap; const AGroupName: String): IioWhere;
var
  LProp: IioProperty;
begin
  // Create a new IioWhere instance for the current group
  Result := TioWhereFactory.NewWhere;
  // Loop for all properties
  for LProp in AMap.GetProperties do
  begin
    // If the current prop is of the current group then create the criteria
    if LProp.WhereGroupName.Equals(AGroupName) then
    begin
      CheckWhereNullValueAffinity(LProp);
      case LProp.GetRelationType of
        rtNone:
          BuildPropWhere(AObj, LProp, Result);
        rtBelongsTo:
          { To be implemented };
        rtHasOne, rtEmbeddedHasOne:
          { To be implemented };
        rtHasMany, rtEmbeddedHasMany:
          { To be implemented };
      end;
    end
    else
      // If the current property is of a child group nested into the current group
      if LProp.WhereMasterGroupName.Equals(AGroupName) then
        (Result as IioWhereInternal)._AddCriteria(LProp.WhereGroupLogicOp, BuildGroupWhere(AObj, AMap, LProp.WhereGroupName)); // Recursion
  end;
end;

class function TioWhereSmartBuilder.BuildWhere(const AObj: TObject): IioWhere;
var
  LMap: IioMap;
begin
  LMap := TioMapContainer.GetMap(AObj.ClassName, True);
  Result := BuildGroupWhere(AObj, LMap, String.Empty); // Begin from the main group named '' (empty string)
end;

end.
