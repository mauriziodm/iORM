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
unit iORM.ObjectsForge.ObjectMaker;

interface

uses
  iORM.ObjectsForge.Interfaces,
  iORM.Context.Interfaces,
  iORM.DB.Interfaces;

type

  // Standard Object Maker
  TioObjectMaker = class(TioObjectMakerIntf)
  public
    class procedure MakeObject(const AContext: IioContext; const AQuery: IioQuery); override;
  end;

implementation

uses
  iORM.Context.Properties.Interfaces, System.Rtti, iORM.Attributes, iORM,
  iORM.CommonTypes, iORM.Utilities, System.StrUtils;

{ TObjectMaker }

class procedure TioObjectMaker.MakeObject(const AContext: IioContext; const AQuery: IioQuery);
var
  LProp: IioProperty;
  LDetailObj: TObject;
begin
  inherited;
  // DataObject creation if not already exists
  if not Assigned(AContext.DataObject) then
    AContext.DataObject := Self.CreateObjectByClassRef(AContext.GetClassRef);
  // ObjectStatus
  AContext.ObjStatus := osClean;
  // Load properties values
  for LProp in AContext.GetProperties do
  begin
    LDetailObj := nil;
    if LProp.isHasManyChildVirtualProperty or AContext.Where.IsLazyProp(AContext.Map.GetClassName, LProp) or not LProp.IsDBReadEnabled then
      Continue;
    case LProp.GetRelationType of
      // ------------------------------ NO RELATION --------------------------------------------------------------------------------------
      // If RelationType = ioRTNone then load normal property value (No relation)
      rtNone:
        begin
          // If it isn't related to a blob field then load as normal value
          if not LProp.IsBlob then
            LProp.SetValue(AContext.DataObject, AQuery.GetValue(LProp, AContext))
            // If it's related to a blob field and it is of TStream or descendant the load as stream
          else if LProp.IsStream then
            LoadPropertyStream(AContext, AQuery, LProp)
            // If it's related to a blob field and it is a "streamable object" (has LoadFromStream and SaveToStream methods)
          else
            LoadPropertyStreamable(AContext, AQuery, LProp);
          // Next property
          Continue;
        end;
      // ------------------------------ RELATION -----------------------------------------------------------------------------------------
      // Load the related object/s
      rtHasMany:
        LoadPropertyHasMany(AContext, AQuery, LProp);
      rtEmbeddedHasMany:
        LoadPropertyEmbeddedHasMany(AContext, AQuery, LProp);
      rtBelongsTo:
        LDetailObj := LoadPropertyBelongsTo(AContext, AQuery, LProp);
      rtHasOne:
        LDetailObj := LoadPropertyHasOne(AContext, AQuery, LProp);
      rtEmbeddedHasOne:
        LDetailObj := LoadPropertyEmbeddedHasOne(AContext, AQuery, LProp);
    end;
    if Assigned(LDetailObj) then
    begin
      // If is an Interface property then adjust the RefCount to prevent an access violation
      if LProp.IsInterface then
        TioUtilities.ObjectAsIInterface(LDetailObj)._Release;
      // Assign the related object/s to the property   (***ChildPropertyPath***)
      if LProp.IsWritable then
        LProp.SetValue(AContext.DataObject, LDetailObj);
    end;
    // ---------------------------------------------------------------------------------------------------------------------------------
  end;
end;

end.
