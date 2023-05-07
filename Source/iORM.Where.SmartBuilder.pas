unit iORM.Where.SmartBuilder;

interface

uses
  iORM.Where.Interfaces, iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces,
  System.Rtti;

type
  TioOnWhereBuildEventAnonymousMethod = reference to procedure(const AFilterObj: TObject; const AWhere: IioWhere; const AProp: IioProperty;
    const AValue: TValue; var ADone: Boolean);

  TioWhereSmartBuilderRef = class of TioWhereSmartBuilder;
  TioWhereSmartBuilder = class
  private
    class function BuildGroupWhere(const AObj: TObject; const AMap: IioMap; const AGroupName: String; const AOnWhereBuildEventAnonymousMethod: TioOnWhereBuildEventAnonymousMethod): IioWhere;
    class procedure BuildPropWhere(const AWhere: IioWhere; const AObj: TObject; const AProp: IioProperty; const AOnWhereBuildEventAnonymousMethod: TioOnWhereBuildEventAnonymousMethod);
    class procedure CheckWhereNullValueAffinity(const AProp: IioProperty);
  public
    class procedure BuildWhere(const AWhere: IioWhere; const AObj: TObject; const AOnWhereBuildEventAnonymousMethod: TioOnWhereBuildEventAnonymousMethod = nil);
  end;

implementation

uses
  iORM.Context.Container, iORM.Where.Factory, System.SysUtils, iORM.Attributes,
  iORM.DB.Factory, iORM.Exceptions, iORM.Utilities;

{ TioWhereSmartBuilder }

class procedure TioWhereSmartBuilder.CheckWhereNullValueAffinity(const AProp: IioProperty);
begin
  // Check enumerations
  if AProp.IsEnumeration and AProp.WhereNullValue.IsType<Integer> then
    Exit;
  // Check all other types
  if not AProp.WhereNullValue.IsType(AProp.GetTypeInfo, True) then
    raise EioException.Create(ClassName, 'CheckWhereNullValueAffinity',
      Format('Oops, there''s a type incompatibility problem.' +
      #13#13'"WhereNullValue" for property named "%s" is of type "%s" while property is of type "%s".',
      [AProp.GetName, TioUtilities.TypeInfoToTypeName(AProp.WhereNullValue.TypeInfo), AProp.GetTypeName]));
end;

class procedure TioWhereSmartBuilder.BuildPropWhere(const AWhere: IioWhere; const AObj: TObject; const AProp: IioProperty;
  const AOnWhereBuildEventAnonymousMethod: TioOnWhereBuildEventAnonymousMethod);
var
  LDone: Boolean;
  LValue: TValue;
begin
  LDone := False;
  LValue := AProp.GetValue(AObj);
  // Call OnWhereBuildEvent if assigned
  if Assigned(AOnWhereBuildEventAnonymousMethod) then
    AOnWhereBuildEventAnonymousMethod(AObj, AWhere, AProp, LValue, LDone);
  if LDone then
    Exit;
  // Check if the value of the prop is null
  if (not AProp.WhereSkip) and (not LValue.IsEmpty) then
  begin
    case AProp.GetRttiType.TypeKind of
      // String
      tkString, tkUString, tkWString, tkLString, tkChar, tkWChar:
        if LValue.AsString.Trim.ToUpper = AProp.WhereNullValue.AsString.Trim.ToUpper then
          Exit;
      // Integer
      tkInteger, tkInt64:
        if LValue.AsInteger.ToString = AProp.WhereNullValue.AsInteger.ToString then
          Exit;
      // Float/DateTime
      tkFloat:
        if LValue.AsExtended.ToString = AProp.WhereNullValue.AsExtended.ToString then
          Exit;
      // Enumeration
      tkEnumeration:
//        if AProp.WhereNullValue.IsEmpty or (LValue.AsOrdinal = AProp.WhereNullValue.AsOrdinal) then
        if (LValue.AsOrdinal = AProp.WhereNullValue.AsOrdinal) then
          Exit;
    else
      Exit;
    end;
    // If the value of the prop is non null then add the criteria
    (AWhere as IioWhereInternal)._AddCriteria(AProp.WhereLogicOp, AProp.WhereTargetPropName, AProp.WhereCompareOp, LValue);
  end;
end;

class function TioWhereSmartBuilder.BuildGroupWhere(const AObj: TObject; const AMap: IioMap; const AGroupName: String;
  const AOnWhereBuildEventAnonymousMethod: TioOnWhereBuildEventAnonymousMethod): IioWhere;
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
          BuildPropWhere(Result, AObj, LProp, AOnWhereBuildEventAnonymousMethod);
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
        (Result as IioWhereInternal)._AddCriteria(LProp.WhereGroupLogicOp, BuildGroupWhere(AObj, AMap, LProp.WhereGroupName, AOnWhereBuildEventAnonymousMethod)
          ); // Recursion
  end;
end;

class procedure TioWhereSmartBuilder.BuildWhere(const AWhere: IioWhere; const AObj: TObject;
  const AOnWhereBuildEventAnonymousMethod: TioOnWhereBuildEventAnonymousMethod = nil);
var
  LMap: IioMap;
begin
  LMap := TioMapContainer.GetMap(AObj.ClassName, True);
  // Begin from the main group named '' (empty string)
  (AWhere as IioWhereInternal)._AddCriteria(BuildGroupWhere(AObj, LMap, String.Empty, AOnWhereBuildEventAnonymousMethod));
end;

end.
