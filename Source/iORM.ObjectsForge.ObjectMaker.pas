{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
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
  iORM.CommonTypes, iORM.Rtti.Utilities;

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
  AContext.ObjectStatus := osClean;
  // Load properties values
  for CurrProp in AContext.GetProperties do
  begin
    // If the property is not ReadEnabled then skip it
    if not CurrProp.IsReadEnabled then Continue;
    case CurrProp.GetRelationType of
// ------------------------------ NO RELATION --------------------------------------------------------------------------------------
      // If RelationType = ioRTNone then load normal property value (No relation)
      ioRTNone: begin
        // If it isn't related to a blob field then load as normal value
        if not CurrProp.IsBlob then
          CurrProp.SetValue(Result, AQuery.GetValue(CurrProp))
        // If it's related to a blob field and it is of TStream or descendant the load as stream
        else if CurrProp.IsStream then
          Self.LoadPropertyStream(AContext, AQuery, CurrProp)
        // If it's related to a blob field and it is a "streamable object" (has LoadFromStream and SaveToStream methods)
        else
          CurrProp.SetValue(Result, Self.LoadPropertyStreamable(AContext, AQuery, CurrProp));
        // Next property
        Continue;
      end;
// ------------------------------ RELATION -----------------------------------------------------------------------------------------
      // Load the related object/s
      ioRTBelongsTo:        AObj := Self.LoadPropertyBelongsTo(AContext, AQuery, CurrProp);
      ioRTHasMany:          AObj := Self.LoadPropertyHasMany(AContext, AQuery, CurrProp);
      ioRTHasOne:           AObj := Self.LoadPropertyHasOne(AContext, AQuery, CurrProp);
      ioRTEmbeddedHasMany:  AObj := Self.LoadPropertyEmbeddedHasMany(AContext, AQuery, CurrProp);
      ioRTEmbeddedHasOne:   AObj := Self.LoadPropertyEmbeddedHasOne(AContext, AQuery, CurrProp);
    end;
    // If is an Interface property then adjust the RefCount to prevent an access violation
    if CurrProp.IsInterface then
      TioRttiUtilities.ObjectAsIInterface(AObj)._Release;
    // Assign the related object/s to the property   (***ChildPropertyPath***)
    CurrProp.SetValue(Result, AObj);
// ---------------------------------------------------------------------------------------------------------------------------------
  end;
end;

end.

