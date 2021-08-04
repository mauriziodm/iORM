{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}



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
    class function MakeObject(const AContext:IioContext; const AQuery:IioQuery): TObject; override;
  end;

implementation

uses
  iORM.Context.Properties.Interfaces, System.Rtti, iORM.Attributes, iORM,
  iORM.CommonTypes, iORM.Utilities;

{ TObjectMaker }

class function TioObjectMaker.MakeObject(const AContext: IioContext; const AQuery: IioQuery): TObject;
var
  CurrProp: IioContextProperty;
  AObj: TObject;
begin
  inherited;
  // DataObject creation if not already exists
  if not Assigned(AContext.DataObject) then
    AContext.DataObject := Self.CreateObjectByClassRef(AContext.GetClassRef);
  Result := AContext.DataObject;
  // ObjectStatus
  AContext.ObjStatus := osClean;
  // Load properties values
  for CurrProp in AContext.GetProperties do
  begin
    AObj := nil;
    // If the property is not ReadEnabled then skip it
    if not CurrProp.IsDBReadEnabled then Continue;
    case CurrProp.GetRelationType of
// ------------------------------ NO RELATION --------------------------------------------------------------------------------------
      // If RelationType = ioRTNone then load normal property value (No relation)
      ioRTNone: begin
        // If it isn't related to a blob field then load as normal value
        if not CurrProp.IsBlob then
          CurrProp.SetValue(Result, AQuery.GetValue(CurrProp, AContext))
        // If it's related to a blob field and it is of TStream or descendant the load as stream
        else if CurrProp.IsStream then
          LoadPropertyStream(AContext, AQuery, CurrProp)
        // If it's related to a blob field and it is a "streamable object" (has LoadFromStream and SaveToStream methods)
        else
          LoadPropertyStreamable(AContext, AQuery, CurrProp);
        // Next property
        Continue;
      end;
// ------------------------------ RELATION -----------------------------------------------------------------------------------------
      // Load the related object/s
      ioRTHasMany:          LoadPropertyHasMany(AContext, AQuery, CurrProp);
      ioRTEmbeddedHasMany:  LoadPropertyEmbeddedHasMany(AContext, AQuery, CurrProp);
      ioRTBelongsTo:        AObj := LoadPropertyBelongsTo(AContext, AQuery, CurrProp);
      ioRTHasOne:           AObj := LoadPropertyHasOne(AContext, AQuery, CurrProp);
      ioRTEmbeddedHasOne:   AObj := LoadPropertyEmbeddedHasOne(AContext, AQuery, CurrProp);
    end;
    if Assigned(AObj) then
    begin
      // If is an Interface property then adjust the RefCount to prevent an access violation
      if CurrProp.IsInterface then
        TioUtilities.ObjectAsIInterface(AObj)._Release;
      // Assign the related object/s to the property   (***ChildPropertyPath***)
      if CurrProp.IsWritable then
        CurrProp.SetValue(Result, AObj);
    end;
// ---------------------------------------------------------------------------------------------------------------------------------
  end;
end;

end.

