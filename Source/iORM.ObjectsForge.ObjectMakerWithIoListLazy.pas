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

unit iORM.ObjectsForge.ObjectMakerWithIoListLazy;

interface

uses
  iORM.ObjectsForge.Interfaces, iORM.Context.Interfaces, iORM.DB.Interfaces,
  iORM.Context.Properties.Interfaces, iORM.Exceptions;

type

  // Standard Object Maker
  TioObjectMakerWithIioListLazy = class(TioObjectMakerIntf)
  protected
    class procedure LoadPropertyHasManyWithIioListLazy(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
  public
    class function MakeObject(const AContext: IioContext; const AQuery: IioQuery): TObject; override;
  end;

implementation

uses
  iORM.CommonTypes, iORM.Attributes, iORM.Utilities, iORM.LazyLoad.Interfaces,
  iORM.Where.Interfaces, System.SysUtils;

{ TioObjectMaker }

class function TioObjectMakerWithIioListLazy.MakeObject(const AContext: IioContext; const AQuery: IioQuery): TObject;
var
  LProp: IioProperty;
  LObj: TObject;
begin
  inherited;
  // DataObject creation if not already exists
  if not Assigned(AContext.DataObject) then
    AContext.DataObject := Self.CreateObjectByClassRef(AContext.GetClassRef);
  Result := AContext.DataObject;
  // ObjectStatus
  AContext.ObjStatus := osClean;
  // Load properties values
  for LProp in AContext.GetProperties do
  begin
    LObj := nil;
    if LProp.isHasManyChildVirtualProperty or not LProp.IsDBReadEnabled then
      Continue;
    case LProp.GetRelationType of
      // ------------------------------ NO RELATION --------------------------------------------------------------------------------------
      // If RelationType = ioRTNone then load normal property value (No relation)
      rtNone:
        begin
          if AContext.Where.IsLazyProp(AContext.Map.GetClassName, LProp) then
            Continue;
          if not LProp.IsBlob then
            LProp.SetValue(Result, AQuery.GetValue(LProp, AContext))
          else if LProp.IsStream then
            LoadPropertyStream(AContext, AQuery, LProp)
          else
            LoadPropertyStreamable(AContext, AQuery, LProp);
        end;
      // ------------------------------ RELATION -----------------------------------------------------------------------------------------
      // Load the related object/s
      rtHasMany:
        if AContext.Where.IsLazyProp(AContext.Map.GetClassName, LProp) then
          LoadPropertyHasManyWithIioListLazy(AContext, AQuery, LProp)
        else
          LoadPropertyHasMany(AContext, AQuery, LProp);
      rtEmbeddedHasMany:
        if not AContext.Where.IsLazyProp(AContext.Map.GetClassName, LProp) then
          LoadPropertyEmbeddedHasMany(AContext, AQuery, LProp);
      rtBelongsTo:
        if not AContext.Where.IsLazyProp(AContext.Map.GetClassName, LProp) then
          LObj := LoadPropertyBelongsTo(AContext, AQuery, LProp);
      rtHasOne:
        if not AContext.Where.IsLazyProp(AContext.Map.GetClassName, LProp) then
          LObj := LoadPropertyHasOne(AContext, AQuery, LProp);
      rtEmbeddedHasOne:
        if not AContext.Where.IsLazyProp(AContext.Map.GetClassName, LProp) then
          LObj := LoadPropertyEmbeddedHasOne(AContext, AQuery, LProp);
    end;
    if Assigned(LObj) then
    begin
      // If is an Interface property then adjust the RefCount to prevent an access violation
      if LProp.IsInterface then
        TioUtilities.ObjectAsIInterface(LObj)._Release;
      // Assign the related object/s to the property   (***ChildPropertyPath***)
      if LProp.IsWritable then
        LProp.SetValue(Result, LObj);
    end;
    // ---------------------------------------------------------------------------------------------------------------------------------
  end;
end;

class procedure TioObjectMakerWithIioListLazy.LoadPropertyHasManyWithIioListLazy(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
var
  LChildObject: TObject;
  LLazyLoadableObj: IioLazyLoadable;
  LWhere, LDetailWhere: IioWhere;
begin
  // Get the child object if already assigned
  LChildObject := AProperty.GetRelationChildObject(AContext.DataObject);
  // If the related child object not exists then exit (return 'NULL')
  if not Assigned(LChildObject) then
    raise EioException.Create(Self.ClassName, 'LoadPropertyHasManyLazyIioList', Format('Child collection object not assigned on property "%s", class "%s"',
      [AProperty.GetName, AContext.Map.GetClassName]));
  // Get the where conditions for the details if exists (nil if not exists)
  LDetailWhere := AContext.Where.Details.Get(AProperty.GetName);
  // If LazyLoadable then set LazyLoad data - Set the lazy load relation data
  if Supports(LChildObject, IioLazyLoadable, LLazyLoadableObj) then
    LLazyLoadableObj.SetRelationInfo(AProperty.GetRelationChildTypeName, AProperty.GetRelationChildTypeAlias, AProperty.GetRelationChildPropertyName,
      AQuery.GetValue(AContext.GetProperties.GetIdProperty, AContext).AsInteger, LDetailWhere); // Eventuale detail where
end;

end.
