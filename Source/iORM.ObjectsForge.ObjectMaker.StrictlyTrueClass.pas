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
unit iORM.ObjectsForge.ObjectMaker.StrictlyTrueClass;

interface

uses
  iORM.ObjectsForge.Interfaces,
  iORM.Context.Interfaces,
  iORM.DB.Interfaces;

type

  // Standard Object Maker
  TioObjectMakerStrictlyTrueClass = class(TioObjectMakerIntf)
  public
    class procedure MakeObject(const AContext:IioContext; const AQuery:IioQuery); override;
  end;

implementation

uses
  System.Rtti, iORM, System.SysUtils,
  iORM.RttiContext.Factory, iORM.Where.Factory;

{ TioObjectMakerTrueClass }

//class procedure TioObjectMakerStrictlyTrueClass.MakeObject(const AContext:IioContext; const AQuery:IioQuery);
//var
//  LClassName: String;
//  LRttiInstanceType: TRttiInstanceType;
//  LWhere: IioWhere;
//begin
//  // Get full qualified class name
//  LClassName := AQuery.Fields.FieldByName(AContext.GetTrueClass.GetFieldName).Value;
//  LClassName := AContext.GetTrueClass.QualifiedClassNameFromClassInfoFieldValue(LClassName);
//  // Get rtti class type for classref
//  LRttiInstanceType := TioRttiFactory.GetRttiContext.FindType(LClassName) as TRttiInstanceType;
//  if not Assigned(LRttiInstanceType) then
//    raise EioGenericException.Create(Self.ClassName + ': RttiType not found (' + LClassName + ')');
//  // Load object
//  AContext.DataObject := io.Load(LRttiInstanceType.MetaclassType).ByID(AQuery.GetValue(AContext.GetProperties.GetIdProperty, AContext).AsInteger)
//                                           .SetDetailsContainer(AContext.Where.Details)  // Copy the details from the Where  of the Context
//                                           .DisableStrictlyTrueClass
//                                           .Cacheable
//                                           ._ToObjectInternalByClassOnly(AContext.Intent, AContext.DataObject);
//end;
class procedure TioObjectMakerStrictlyTrueClass.MakeObject(const AContext:IioContext; const AQuery:IioQuery);
var
  LWhere: IioWhere;
begin
  // Build where conditions (with previous AuthCache propagation)
  LWhere := TioWhereFactory.NewWhere(AContext.PSRequest);
  LWhere.TypeName := AContext.GetTrueClass.GetClassName;
  LWhere.ByID(AQuery.GetValue(AContext.GetProperties.GetIdProperty, AContext).AsInteger)
        .SetDetailsContainer(AContext.Where.Details)  // Copy the details from the Where  of the Context
        .DisableStrictlyTrueClass
        .Cacheable;
  // Execute
  AContext.DataObject := LWhere._ToObjectInternalByClassOnly(AContext.Intent, AContext.DataObject);
end;

end.




