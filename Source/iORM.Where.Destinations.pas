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
