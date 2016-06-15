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
  ObjMapperEngine;


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
