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



unit iORM.Where.Destinations;

interface

type

  TioWhereGenericListDestination = class
  strict private
    FWhere: TObject;   // TObject to avoid circular receference
  public
    constructor Create(const AWhere:TObject);
    function OfType<TRESULT>(const AAlias:String=''; const AOwnsObjects:Boolean=True): TRESULT;
  end;

implementation

uses
  iORM.Rtti.Utilities, iORM.RttiContext.Factory, System.TypInfo,
  iORM.Where;

{ TioWhereGenericListDestination }

constructor TioWhereGenericListDestination.Create(const AWhere: TObject);
begin
  inherited Create;
  FWhere := AWhere;
end;

function TioWhereGenericListDestination.OfType<TRESULT>(const AAlias: String;
  const AOwnsObjects: Boolean): TRESULT;
begin
  try
    if TioRttiUtilities.IsAnInterface<TRESULT> then
      Result := TioRttiUtilities.CastObjectToGeneric<TRESULT>(
                  (FWhere as TioWhere).ToList(    // TObject and Cast to avoid circular receference
                    TioRttiUtilities.GenericToString<TRESULT>,
                    AAlias,
                    AOwnsObjects
                  )
                )
    else
      Result := TioRttiUtilities.CastObjectToGeneric<TRESULT>(
                  (FWhere as TioWhere).ToList(   // TObject and Cast to avoid circular receference
                    TioRttiContextFactory.RttiContext.GetType(PTypeInfo(TypeInfo(TRESULT))),
                    AOwnsObjects
                  )
                );
  finally
    Self.Free;
  end;
end;

end.
