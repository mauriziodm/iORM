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



unit iORM.RttiContext.Factory;

interface

uses
  System.Rtti;

type

  TioRttiContextFactory = class
  public
    class function RttiContext: TRttiContext;
  end;

implementation

var ARttiContext: TRttiContext;

{ TioRttiContextFactory }

class function TioRttiContextFactory.RttiContext: TRttiContext;
begin
  Result := ARttiContext;
end;

initialization
  // Create the unique global instance of RttiContext
  ARttiContext := TRttiContext.Create;
  ARttiContext.FindType(''); // Workaround for thread safe: https://quality.embarcadero.com/browse/RSP-9815

finalization
  // GlobalRttiContext cleanup
  ARttiContext.Free;
end.

