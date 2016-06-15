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



unit iORM.Context.Container;

interface

uses
  System.Rtti,
  iORM.CommonTypes, System.Generics.Collections,
  iORM.Context.Map.Interfaces;

type

  // Class representing a slot for a Context (ioContexts) (lazy)
  TioMapSlot = class
  strict private
    FClassRef: TioClassRef;
    FMap: IioMap;
  public
    constructor Create(AClassRef:TioClassRef); overload;
    function GetClassRef: TioClassRef;
    function GetMap: IioMap;
  end;

  // Real ContextContainer instance
  TioMapContainerInstance = TObjectDictionary<String, TioMapSlot>;

  // Class for external access to the ContextContainer
  // The ContextContainer contain all the Entities of the application
  //  for efficient ClassRef reference and is initializated at the start
  //  of the application itself
  TioMapContainer = class
  protected
    class function IsValidEntity(AType:TRttiInstanceType): Boolean;
    class procedure Init;
    class procedure SetPropertiesFieldData;
    class procedure SetPropertiesLoadSqlData;
    class procedure SetRelationIndexes;
  public
    class procedure Add(AClassRef: TioClassRef);
    class function GetContainer: TioMapContainerInstance;
    class function Exist(AClassName:String): Boolean;
    class function GetClassRef(AClassName:String): TioClassRef;
    class function GetMap(AClassName:String; RaiseAnExceptionIfNotFound:Boolean=True): IioMap;
  end;

implementation

uses
  iORM.Context.Factory, iORM.Exceptions,
  iORM.RttiContext.Factory, iORM.Attributes;

var
  ioMapContainerInstance: TioMapContainerInstance;

{ TioContextContainer }

class procedure TioMapContainer.Add(AClassRef: TioClassRef);
begin
  if Self.Exist(AClassRef.ClassName) then Exit;
  ioMapContainerInstance.Add(AClassRef.ClassName, TioMapSlot.Create(AClassRef));
end;

class function TioMapContainer.Exist(AClassName: String): Boolean;
begin
  Result := ioMapContainerInstance.ContainsKey(AClassName);
end;

class function TioMapContainer.GetClassRef(AClassName: String): TioClassRef;
begin
  if Self.Exist(AClassName)
    then Result := ioMapContainerInstance.Items[AClassName].GetClassRef
    else raise EioException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
end;

class function TioMapContainer.GetContainer: TioMapContainerInstance;
begin
  Result := ioMapContainerInstance;
end;

class function TioMapContainer.GetMap(AClassName: String; RaiseAnExceptionIfNotFound:Boolean): IioMap;
begin
  Result := nil;
  if Self.Exist(AClassName)
    then Result := ioMapContainerInstance.Items[AClassName].GetMap
    else if RaiseAnExceptionIfNotFound then
      raise EioException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
end;

class procedure TioMapContainer.Init;
var
  Ctx: TRttiContext;
  Typ: TRttiType;
  Inst: TRttiInstanceType;
begin
  // Init ContextContainer loading all ClassRef relative to the entities (classes)
  //  in the application
  Ctx := TioRttiContextFactory.RttiContext;
  for Typ in Ctx.GetTypes do
  begin
    // Only instance type
    if not Typ.IsInstance then Continue;
    Inst := Typ.AsInstance;
    // Only classes with explicit ioTable attribute
    if not Self.IsValidEntity(Inst) then Continue;
    // Load the current class (entity) into the ContextContainer
    Self.Add(Inst.MetaclassType);
  end;
end;

class function TioMapContainer.IsValidEntity(AType: TRttiInstanceType): Boolean;
var
  Attr: TCustomAttribute;
begin
  Result := False;
  for Attr in AType.GetAttributes do
    if Attr is ioTable then
    begin
      Result := True;
      Exit;
    end;
end;

class procedure TioMapContainer.SetPropertiesFieldData;
var
  AMapSlot: TioMapSlot;
begin
  // Calculate field data for all properties in the container
  for AMapSlot in ioMapContainerInstance.Values
    do AMapSlot.GetMap.GetProperties.SetFieldData;
end;

class procedure TioMapContainer.SetPropertiesLoadSqlData;
var
  AMapSlot: TioMapSlot;
begin
  // Calculate field data for all properties in the container
  for AMapSlot in ioMapContainerInstance.Values
    do AMapSlot.GetMap.GetProperties.SetLoadSqlData;
end;

class procedure TioMapContainer.SetRelationIndexes;
begin

end;

{ TioContextSlot }

function TioMapSlot.GetClassRef: TioClassRef;
begin
  Result := FClassRef;
end;

function TioMapSlot.GetMap: IioMap;
begin
  if not Assigned(FMap)
    then FMap := TioContextFactory.Map(FClassRef);
  Result := FMap;
end;

constructor TioMapSlot.Create(AClassRef:TioClassRef);
begin
  inherited Create;
  FClassRef := AClassRef;
end;


initialization
  // Create the ContextXontainer Instance and Init it by loading
  //  all entities declarated in the application
  ioMapContainerInstance := TioMapContainerInstance.Create([doOwnsValues]);
  TioMapContainer.Init;
  TioMapContainer.SetPropertiesFieldData;
  TioMapContainer.SetPropertiesLoadSqlData;

finalization
  ioMapContainerInstance.Free;

end.
