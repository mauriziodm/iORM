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



unit iORM.LiveBindings.PrototypeBindSource.DesignTime;

interface

uses
  DesignEditors, DesignIntf, System.Classes;

type

  TioBindSourceMasterPropertyEditor = class(TComponentProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
//    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure Register;

implementation

uses
  iORM.LiveBindings.PrototypeBindSource, Data.Bind.ObjectScope,
  System.Rtti, iORM.RttiContext.Factory, iORM.Exceptions,
  iORM.Context.Properties.Interfaces, iORM.Context.Factory,
  iORM.Context.Interfaces, iORM.Attributes;

  procedure Register;
  begin
    RegisterComponents('iORM', [TioPrototypeBindSource]);
//    RegisterPropertyEditor(TypeInfo(String), TioPrototypeBindSource, 'ioMasterPropertyName', TioBindSourceMasterPropertyEditor);
  end;

{ TioBindSourceMasterPropertyEditor }

function TioBindSourceMasterPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paValueList,paSortList] - [paMultiSelect];
end;

//procedure TioBindSourceMasterPropertyEditor.GetValues(Proc: TGetStrProc);
//var
//  AMasterBindSource: TioPrototypeBindSource;
//  ADetailBindSource: TioPrototypeBindSource;
//  Ctx: TRttiContext;
//  Typ: TRttiType;
//  AContext: IioContext;
//  AProperty: IioContextProperty;
//begin
//  // Get the current BindSource component for which we want to set the property (detail)
//  ADetailBindSource := Self.GetComponent(0) as TioPrototypeBindSource;
//  // Get the Master BindSource (from the detail)
//  AMasterBindSource := ADetailBindSource.ioMasterBindSource as TioPrototypeBindSource;
//  // If the DetailBindSource.ioMasterBindSource property is defined...
//  if Assigned(AMasterBindSource) then
//  begin
//    Ctx := TioRttiContextFactory.RttiContext;
//    Typ := Ctx.FindType(AMasterBindSource.ioClassName);
//    if not Assigned(Typ) then raise EioException.Create(Self.ClassName + ': RttiType not found.');
//    if not Typ.IsInstance then raise EioException.Create(Self.ClassName + ': RttiType is not a RttiInstanceType.');
//    AContext := TioContextFactory.Context(Typ.AsInstance.MetaclassType.ClassName);
//    for AProperty in AContext.GetProperties do
//    begin
//      if AProperty.GetRelationType = ioRTNone then Continue;
//      Proc(AProperty.GetName);
//    end;
//  end else inherited GetValues(Proc);
//end;

end.
