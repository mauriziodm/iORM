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



unit iORM.ObjectsForge.ObjectMapper;

interface

uses
  System.JSON;

type

  // ClassRef to ObjectMapper
  TioObjectMapperRef = class of TioObjectMapperIntf;

  // Object mapper (thank's to Daniele Teti)
  TioObjectMapperIntf = class
  public
    // Object
    class function SerializeEmbeddedObject(const AObj:TObject): String;
    class procedure DeserializeEmbeddedObject(const AJsonString: String; AObj:TObject = nil);
    // List
    class function SerializeEmbeddedList(const AList: TObject): String;
    class procedure DeserializeEmbeddedList(const AJsonString: String; AList:TObject = nil);
  end;

implementation

uses
  DJSON;


{ TioObjectMapper }


{ TioObjectMapperIntf }

class procedure TioObjectMapperIntf.DeserializeEmbeddedList(const AJsonString: String; AList: TObject);
begin
  dj.FromJson(AJsonString).byFields.TypeAnnotationsON.&To(AList);
end;

class procedure TioObjectMapperIntf.DeserializeEmbeddedObject(const AJsonString: String; AObj:TObject);
begin
  dj.FromJson(AJsonString).byFields.TypeAnnotationsON.&To(AObj);
end;

class function TioObjectMapperIntf.SerializeEmbeddedObject(const AObj:TObject): String;
begin
  Result := dj.From(AObj).byFields.TypeAnnotationsON.ToJson;
end;

class function TioObjectMapperIntf.SerializeEmbeddedList(const AList: TObject): String;
begin
  Result := dj.From(AList).byFields.TypeAnnotationsON.ToJson;
end;



end.
