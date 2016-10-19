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



unit iORM.Rtti.Utilities;

interface

uses
  iORM.CommonTypes, System.Rtti, System.Classes, iORM.Exceptions,
  System.TypInfo, iORM.MVVM.Interfaces;

type

  TioRttiUtilities = class
  public
    class function ObjectAsIInterface(const AObj:Tobject): IInterface;
    class function ObjectAsIioViewModel(const AObj:Tobject): IioViewModel;
    class function IsAnInterface<T>: Boolean;
    class function GenericToString<T>(const AQualified:Boolean=False): String;
    class function GenericInterfaceToGUI<T:IInterface>: String;
    class function ClassRefToRttiType(const AClassRef:TioClassRef): TRttiInstanceType;
    class function CastObjectToGeneric<T>(const AObj:TObject): T;
    class function IsAnInterfaceTypeName(const ATypeName:String): Boolean;
    class function ResolveChildPropertyPath(const ARootObj:TObject; const AChildPropertyPath:TStrings): TObject;
    class function TValueToObject(const AValue: TValue; const ASilentException:Boolean=True): TObject;
    class function TypeInfoToTypeName(const ATypeInfo:PTypeInfo; const AQualified:Boolean=False): String;
  end;

implementation

uses
  System.SysUtils, iORM.RttiContext.Factory;

{ TioRttiUtilities }


class function TioRttiUtilities.CastObjectToGeneric<T>(const AObj: TObject): T;
begin
  if Self.IsAnInterface<T> then
  begin
    if not Supports(AObj, GetTypeData(TypeInfo(T))^.Guid, Result) then
      raise EioException.Create(Self.ClassName + ': Interface not supported.');
  end
  else
    Result := TValue.From<TObject>(AObj).AsType<T>;
end;

class function TioRttiUtilities.ClassRefToRttiType(const AClassRef: TioClassRef): TRttiInstanceType;
begin
  Result := TioRttiContextFactory.RttiContext.GetType(AClassref).AsInstance;
end;

class function TioRttiUtilities.GenericInterfaceToGUI<T>: String;
begin
  Result := GUIDToString(   GetTypeData(   PTypeInfo(TypeInfo(T))   ).Guid   );

  // ----------------------------------------------------------------------------------
  // Old code
  // ----------------------------------------------------------------------------------
//  pinfo := TypeInfo(T);
//  if pinfo = nil then Exit(Self.ClassName + ': TypeInfo (GUI) not found!');
//  pdata := GetTypeData(pinfo);
//  Result := GUIDtoString(pdata.Guid);
  // ----------------------------------------------------------------------------------
end;

class function TioRttiUtilities.GenericToString<T>(const AQualified:Boolean=False): String;
begin
  Result := Self.TypeInfoToTypeName(TypeInfo(T), AQualified);
end;

class function TioRttiUtilities.IsAnInterfaceTypeName(const ATypeName: String): Boolean;
begin
  Result := ATypeName.StartsWith('I');
end;

class function TioRttiUtilities.ObjectAsIInterface(
  const AObj: Tobject): IInterface;
begin
  if not Supports(AObj, IInterface, Result) then
    raise EioException.Create(Self.ClassName + ': IInterface not implemented by the object ( + AObj.ClassName + ).');
end;

class function TioRttiUtilities.ObjectAsIioViewModel(
  const AObj: Tobject): IioViewModel;
begin
  if not Supports(AObj, IioViewModel, Result) then
    raise EioException.Create(Self.ClassName + ': IioViewModel not implemented by the object ( + AObj.ClassName + ).');
end;

// Questa funzione, a partire dal RootObject, restituisce l'oggetto a relativo al ChildPropertyPath navigando le proprietà
//  dei vari livelli di oggetti.
class function TioRttiUtilities.ResolveChildPropertyPath(const ARootObj: TObject; const AChildPropertyPath: TStrings): TObject;
var
  Ctx: TRttiContext;
  ACurrPropName: String;
  function GetChildObject(const AMasterObj:TObject; const AMasterPropertyName:String): TObject;
  var
    Typ: TRttiType;
    Prop: TRttiProperty;
    AValue: TValue;
  begin
    // Get the object RttiType
    Typ := Ctx.GetType(AMasterObj.ClassType);
    // Get the RttiProperty
    Prop := Typ.GetProperty(AMasterPropertyName);
    // Extract the object/interface (it must be an object or an interface)
    AValue := Prop.GetValue(AMasterObj);
    // Return the resolved child object
    Result := Self.TValueToObject(AValue, True);
  end;
begin
  // Init
  Result := ARootObj;
  // If the AChildPropertyPath is not assigned then Exit
  if not Assigned(AChildPropertyPath) then Exit;
  // Get the RttiContext
  Ctx := TioRttiContextFactory.RttiContext;
  // Loop for properties on the path
  for ACurrPropName in AChildPropertyPath do
  begin
    if not Assigned(Result) then Exit;
    Result := GetChildObject(Result, ACurrPropName);
  end;
end;

class function TioRttiUtilities.TValueToObject(const AValue: TValue; const ASilentException:Boolean): TObject;
begin
  Result := nil;
  case AValue.TypeInfo.Kind of
    tkInterface: Result := AValue.AsInterface As TObject;
    tkClass: Result := AValue.AsObject;
    else if not ASilentException then
      raise EioException.Create(Self.ClassName + '.TValueToObject: The TValue does not contain an object or interfaced object.');
  end;
end;

class function TioRttiUtilities.TypeInfoToTypeName(
  const ATypeInfo: PTypeInfo; const AQualified:Boolean=False): String;
begin
// From XE7
{$IF CompilerVersion >= 28.0}
  // Get the type name
  Result := ATypeInfo.NameFld.ToString;
  // Ig a qualifiedname is required...
  if AQualified then
  begin
    // If it is an interface then link the Interface unit to the TypeName
    if  ATypeInfo.Kind = tkInterface then
      Result := ATypeInfo.TypeData.IntfUnitFld.ToString + '.' + Result
    // else (class) link the class unit to the TypeName
    else
      Result := ATypeInfo.TypeData.UnitNameFld.ToString + '.' + Result;
  end;
// Before XE7
{$ELSE}
  Result := ATypeInfo.Name;
{$IFEND}
end;

class function TioRttiUtilities.IsAnInterface<T>: Boolean;
begin
  // Result is True if T si an interface
//  Result := (   TioRttiContextFactory.RttiContext.GetType(TypeInfo(T)) is TRttiInterfaceType   );
  Result := PTypeInfo(TypeInfo(T)).Kind = tkInterface;
end;

end.
