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
  System.TypInfo, iORM.MVVM.Interfaces, System.Types;

type

  TioRttiUtilities = class
  public
    class function ObjectAsIInterface(const AObj:Tobject): IInterface; static;
    class function ObjectAsIioViewModel(const AObj:Tobject): IioViewModel; static;
    class function IsAnInterface<T>: Boolean; static;
    class function CastObjectToGeneric<T>(const AObj:TObject): T; overload; static;
    class function CastObjectToGeneric<T>(const AObj:TObject; IID:TGUID): T; overload; static;
    class function TypeInfoToGUID(const ATypeInfo:PTypeInfo):TGUID; static;
    class function GenericToString<T>(const AQualified:Boolean=False): String; static;
    class function ClassRefToRttiType(const AClassRef:TioClassRef): TRttiInstanceType; static;
    class function IsAnInterfaceTypeName(const ATypeName:String): Boolean; static;
    class function ResolveChildPropertyPath(const ARootObj:TObject; const AChildPropertyPath:TStrings): TObject; static;
    class function TValueToObject(const AValue: TValue; const ASilentException:Boolean=True): TObject; static;
    class function TypeInfoToTypeName(const ATypeInfo:PTypeInfo; const AQualified:Boolean=False): String; static;
    class function SameObject(const AObj1, AObj2: TObject): boolean;
  end;

implementation

uses
  System.SysUtils, iORM.RttiContext.Factory;

{ TioRttiUtilities }


class function TioRttiUtilities.CastObjectToGeneric<T>(const AObj: TObject; IID:TGUID): T;
begin
  if IsAnInterface<T> then
  begin
    if IID = GUID_NULL then
    begin
      IID := TypeInfoToGUID(TypeInfo(T));
      if IID = GUID_NULL then
        raise EioException.Create('TioRttiUtilities.CastObjectToGeneric: The interface does not have the GUID.');
    end;
    if not Supports(AObj, IID, Result) then
      raise EioException.Create('TioRttiUtilities.CastObjectToGeneric: Interface not supported.');
  end
  else
    Result := TValue.From<TObject>(AObj).AsType<T>;
end;

class function TioRttiUtilities.CastObjectToGeneric<T>(const AObj: TObject): T;
begin
  Result := CastObjectToGeneric<T>(AObj, GUID_NULL);
end;

class function TioRttiUtilities.ClassRefToRttiType(const AClassRef: TioClassRef): TRttiInstanceType;
begin
  Result := TioRttiContextFactory.RttiContext.GetType(AClassref).AsInstance;
end;

class function TioRttiUtilities.GenericToString<T>(const AQualified:Boolean=False): String;
begin
  Result := TypeInfoToTypeName(TypeInfo(T), AQualified);
end;

class function TioRttiUtilities.IsAnInterfaceTypeName(const ATypeName: String): Boolean;
begin
  Result := ATypeName.StartsWith('I');
end;

class function TioRttiUtilities.ObjectAsIInterface(
  const AObj: Tobject): IInterface;
begin
  if not Supports(AObj, IInterface, Result) then
    raise EioException.Create('TioRttiUtilities: IInterface not implemented by the object (' + AObj.ClassName + ').');
end;

class function TioRttiUtilities.ObjectAsIioViewModel(
  const AObj: Tobject): IioViewModel;
begin
  if not Supports(AObj, IioViewModel, Result) then
    raise EioException.Create('TioRttiUtilities: IioViewModel not implemented by the object (' + AObj.ClassName + ').');
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
    Result := TValueToObject(AValue, True);
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

class function TioRttiUtilities.SameObject(const AObj1,
  AObj2: TObject): boolean;
begin
  Result := (@AObj1 = @AObj2);
end;

class function TioRttiUtilities.TValueToObject(const AValue: TValue; const ASilentException:Boolean): TObject;
begin
  Result := nil;
  case AValue.TypeInfo.Kind of
    tkInterface: Result := AValue.AsInterface As TObject;
    tkClass: Result := AValue.AsObject;
    else if not ASilentException then
      raise EioException.Create('TioRttiUtilities.TValueToObject: The TValue does not contain an object or interfaced object.');
  end;
end;

class function TioRttiUtilities.TypeInfoToGUID(
  const ATypeInfo: PTypeInfo): TGUID;
var
  LTyp: TRttiType;
begin
  if ATypeInfo.Kind <> tkInterface then
    raise EioException.Create('TioRttiUtilities.TypeInfoToGUID: ATypeInfo is not relative to an interface.');
  LTyp := TioRttiContextFactory.RttiContext.GetType(ATypeInfo);
  if not Assigned(LTyp) then
    raise EioException.Create('TioRttiUtilities.TypeInfoToGUID: RTTI type info not found, derive it from IInvokable or insert the {M+} directive before its declaration to solve the problem.');
  Result := TRttiInterfaceType(LTyp).GUID;
end;

class function TioRttiUtilities.TypeInfoToTypeName(
  const ATypeInfo: PTypeInfo; const AQualified:Boolean=False): String;
begin
// From XE7
{$IFDEF NEXTGEN}
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
{$ELSE  NEXTGEN}
  Result := ATypeInfo.Name;
{$ENDIF NEXTGEN}
end;

class function TioRttiUtilities.IsAnInterface<T>: Boolean;
begin
  // Result is True if T si an interface
//  Result := (   TioRttiContextFactory.RttiContext.GetType(TypeInfo(T)) is TRttiInterfaceType   );
  Result := PTypeInfo(TypeInfo(T)).Kind = tkInterface;
end;

end.
