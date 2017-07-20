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
  private
    class var FInternalContainer: TioMapContainerInstance;
  protected
    class function IsValidEntity_diAutoRegister(AType:TRttiInstanceType): Boolean;
    class procedure Init;
    class procedure SetPropertiesFieldData;
    class procedure SetPropertiesLoadSqlData;
    class procedure SetRelationIndexes;
  public
    class procedure Build;
    class procedure CleanUp;
    class procedure Add(AClassRef: TioClassRef);
    class function GetContainer: TioMapContainerInstance;
    class function Exist(AClassName:String): Boolean;
    class function GetClassRef(AClassName:String): TioClassRef;
    class function GetMap(AClassName:String; RaiseAnExceptionIfNotFound:Boolean=True): IioMap;
  end;

implementation

uses
  iORM.Context.Factory, iORM.Exceptions,
  iORM.RttiContext.Factory, iORM.Attributes, iORM;

{ TioContextContainer }

class procedure TioMapContainer.Add(AClassRef: TioClassRef);
begin
  if Self.Exist(AClassRef.ClassName) then Exit;
  FInternalContainer.Add(AClassRef.ClassName, TioMapSlot.Create(AClassRef));
end;

class procedure TioMapContainer.Build;
begin
  FInternalContainer := TioMapContainerInstance.Create([doOwnsValues]);
  TioMapContainer.Init;
  TioMapContainer.SetPropertiesFieldData;
  TioMapContainer.SetPropertiesLoadSqlData;
end;

class procedure TioMapContainer.CleanUp;
begin
  FInternalContainer.Free;
end;

class function TioMapContainer.Exist(AClassName: String): Boolean;
begin
  Result := FInternalContainer.ContainsKey(AClassName);
end;

class function TioMapContainer.GetClassRef(AClassName: String): TioClassRef;
begin
  if Self.Exist(AClassName)
    then Result := FInternalContainer.Items[AClassName].GetClassRef
    else raise EioException.Create(Self.ClassName + ': class "' + AClassName + '" not found.');
end;

class function TioMapContainer.GetContainer: TioMapContainerInstance;
begin
  Result := FInternalContainer;
end;

class function TioMapContainer.GetMap(AClassName: String; RaiseAnExceptionIfNotFound:Boolean): IioMap;
begin
  Result := nil;
  if Self.Exist(AClassName)
    then Result := FInternalContainer.Items[AClassName].GetMap
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
    if not Self.IsValidEntity_diAutoRegister(Inst) then Continue;
    // Load the current class (entity) into the ContextContainer
    Self.Add(Inst.MetaclassType);
  end;
end;

class function TioMapContainer.IsValidEntity_diAutoRegister(AType: TRttiInstanceType): Boolean;
type
  TdiImplementsItem = record
    IID: TGUID;
    Alias: String;
  end;
  TdiVVMforItemType = (vvmitView, vvmitViewModel);
  TdiVVMforItem = record
    ItemType: TdiVVMforItemType;
    Target: String;
    Alias: String;
  end;
var
  LAttr: TCustomAttribute;
  LdiRegister: Boolean;
  LdiAsSingleton: Boolean;
  LdiImplements: array of TdiImplementsItem;
  LdiVVMforItems: array of TdiVVMforItem;
  Index: Integer;
begin
  // Init
  Result := False;
  LdiRegister := False;
  LdiAsSingleton := False;
  SetLength(LdiImplements, 0);
  // Loop for attributes
  for LAttr in AType.GetAttributes do
  begin
    // ioTable or ioEntity attribute
    if LAttr is ioTable then
      Result := True;
    // DIC - diRegister
    if LAttr is diRegister then
      LdiRegister := True;
    // DIC - diIsSingleton
    if LAttr is diAsSingleton then
      LdiAsSingleton := True;
    // DIC - diRegister
    if LAttr is diImplements then
    begin
      Index := Length(LdiImplements);
      SetLength(LdiImplements, Index+1);
      LdiImplements[Index].IID := diImplements(LAttr).IID;
      LdiImplements[Index].Alias := diImplements(LAttr).Alias;
    end;
    // DIC - diViewFor
    if LAttr is diViewFor then
    begin
      Index := Length(LdiVVMforItems);
      SetLength(LdiVVMforItems, Index+1);
      LdiVVMforItems[Index].ItemType := vvmitView;
      LdiVVMforItems[Index].Target := diViewFor(LAttr).TargetClassName;
      LdiVVMforItems[Index].Alias := diViewFor(LAttr).Alias;
    end;
    // DIC - diViewModelFor
    if LAttr is diViewModelFor then
    begin
      Index := Length(LdiVVMforItems);
      SetLength(LdiVVMforItems, Index+1);
      LdiVVMforItems[Index].ItemType := vvmitViewModel;
      LdiVVMforItems[Index].Target := diViewModelFor(LAttr).TargetClassName;
      LdiVVMforItems[Index].Alias := diViewModelFor(LAttr).Alias;
    end;
  end;
  // Dependency Injection Container - Register the class as is without any interface
  if LdiRegister then
    io.di.RegisterClass(AType).AsSingleton(LdiAsSingleton).Execute;
  // Dependency Injection Container - Register the class as implenter of the interfaces
  if Length(LdiImplements) > 0 then
    for Index := Low(LdiImplements) to High(LdiImplements) do
      io.di
        .RegisterClass(AType)
        .Implements(LdiImplements[Index].IID, LdiImplements[Index].Alias)
        .AsSingleton(LdiAsSingleton)
        .Execute;
  // Dependency Injection Container - Register the class as View or ViewModel for som other classes
  if Length(LdiVVMforItems) > 0 then
    for Index := Low(LdiVVMforItems) to High(LdiVVMforItems) do
    begin
      case LdiVVMforItems[Index].ItemType of
        vvmitView:
          io.di
            .RegisterClass(AType)
            .AsViewFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias)
            .AsSingleton(LdiAsSingleton)
            .Execute;
        vvmitViewModel:
          io.di
            .RegisterClass(AType)
            .AsViewModelFor(LdiVVMforItems[Index].Target, LdiVVMforItems[Index].Alias)
            .AsSingleton(LdiAsSingleton)
            .Execute;
      end;
    end;
end;

class procedure TioMapContainer.SetPropertiesFieldData;
var
  AMapSlot: TioMapSlot;
begin
  // Calculate field data for all properties in the container
  for AMapSlot in FInternalContainer.Values
    do AMapSlot.GetMap.GetProperties.SetFieldData;
end;

class procedure TioMapContainer.SetPropertiesLoadSqlData;
var
  AMapSlot: TioMapSlot;
begin
  // Calculate field data for all properties in the container
  for AMapSlot in FInternalContainer.Values
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

  // NB: Spostato sulla initialize della unit iORM
  // Create the ContextXontainer Instance and Init it by loading
  //  all entities declarated in the application
//  TioMapContainer.Build;

finalization
  TioMapContainer.CleanUp;

end.
