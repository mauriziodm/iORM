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



unit iORM.ObjectsForge.ObjectMakerClassFromField;

interface

uses
  iORM.ObjectsForge.Interfaces,
  iORM.Context.Interfaces,
  iORM.DB.Interfaces;

type

  // Standard Object Maker
  TioObjectMakerClassFromField = class(TioObjectMakerIntf)
  public
    class function MakeObject(const AContext:IioContext; const AQuery:IioQuery): TObject; override;
  end;

implementation

uses
  System.Rtti, iORM.Exceptions, iORM, System.SysUtils,
  iORM.RttiContext.Factory;

{ TioObjectMakerClassFromField }

class function TioObjectMakerClassFromField.MakeObject(const AContext: IioContext;
  const AQuery: IioQuery): TObject;
var
  Ctx: TRttiContext;
  Typ: TRttiInstanceType;
  AClassName: String;
begin
  // Get full qualified class name
  AClassName := AQuery.GetValueByFieldNameAsVariant(AContext.ClassFromField.GetSqlFieldName);
  AClassName := AContext.ClassFromField.QualifiedClassNameFromClassInfoFieldValue(AClassName);
  // Get rtti class type for classref
  Ctx := TioRttiContextFactory.RttiContext;
  Typ := Ctx.FindType(AClassName) as TRttiInstanceType;
  if not Assigned(Typ) then EioException.Create(Self.ClassName + ': RttiType not found (' + AClassName + ')');
  // Load object
  Result := io.Load(Typ.MetaclassType).ByOID(AQuery.GetValue(AContext.GetProperties.GetIdProperty).AsInteger)
                                           .SetDetailsContainer(AContext.Where.Details)  // Copy the details from the Where  of the Context
                                           .DisableClassFromField
                                           ._ToObjectInternalByClassOnly(AContext.DataObject);
end;

end.



