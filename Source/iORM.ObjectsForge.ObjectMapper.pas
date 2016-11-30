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
    class function SerializeEmbeddedObject(AObj:TObject): TJSONObject;
    class function DeserializeEmbeddedObject(AJObj:TJSONObject; AObj:TObject=nil): TObject;
    // List
    class function SerializeEmbeddedList(AList:TObject): TJSONValue;
    class function DeserializeEmbeddedList(AJValue:TJSONValue; AList:TObject=nil): TObject;
  end;

implementation

uses
  ObjMapper.Engine;


{ TioObjectMapper }


{ TioObjectMapperIntf }

class function TioObjectMapperIntf.DeserializeEmbeddedList(AJValue: TJSONValue; AList: TObject): TObject;
begin
  Result := omEngine.DeserializeList(AList, AJValue, nil, omEngine.DefaultByFields).AsObject;
end;

class function TioObjectMapperIntf.DeserializeEmbeddedObject(AJObj:TJSONObject; AObj:TObject): TObject;
begin
  Result := omEngine.DeserializeObject(AJObj, AObj, omEngine.DefaultByFields);
end;

class function TioObjectMapperIntf.SerializeEmbeddedObject(AObj: TObject): TJSONObject;
begin
  Result := omEngine.SerializeObject(AObj, omEngine.DefaultByFields);
end;

class function TioObjectMapperIntf.SerializeEmbeddedList(AList: TObject): TJSONValue;
begin
  Result := omEngine.SerializeList(AList, nil, omEngine.DefaultByFields);
end;



end.
