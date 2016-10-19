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



unit iORM.LiveBindings.Factory;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.CommonTypes, System.Classes,
  System.Generics.Collections, iORM.Context.Properties.Interfaces,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource,
  iORM.Rtti.Utilities, iORM.MVVM.Interfaces, iORM.Where,
  iORM.Where.Interfaces;

type

  TioLiveBindingsFactory = class
  public
    class function DetailAdaptersContainer(const AMasterAdapter:IioContainedBindSourceAdapter): IioDetailBindSourceAdaptersContainer;
    class function ContainedListBindSourceAdapter(const AOwner:TComponent; const AMasterProperty:IioContextProperty; const AWhere:IioWhere): IioContainedBindSourceAdapter;
    class function ContainedObjectBindSourceAdapter(const AOwner:TComponent; const AMasterProperty:IioContextProperty; const AWhere:IioWhere): IioContainedBindSourceAdapter;
    class function NaturalObjectBindSourceAdapter(const AOwner:TComponent; const ASourceAdapter:IioNaturalBindSourceAdapterSource): TBindSourceAdapter;
    class function Notification(ASender:TObject; ASubject:TObject; ANotificationType:TioBSANotificationType): IioBSANotification;
    class function GetBSAfromMasterBindSource(const AOwner:TComponent; const AMAsterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''; const AWhere:IioWhere=nil): TBindSourceAdapter;
    class function GetBSAfromMasterBindSourceAdapter(const AOwner:TComponent; const AMAsterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String=''; const AWhere:IioWhere=nil): TBindSourceAdapter;
    class function GetBSAfromDB(const AOwner:TComponent; const ATypeName, ATypeAlias:String; const AWhere:IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean): TBindSourceAdapter;
  end;

implementation

uses
  iORM,
  iORM.LiveBindings.DetailAdaptersContainer,
  iORM.LiveBindings.ActiveListBindSourceAdapter,
  iORM.LiveBindings.ActiveObjectBindSourceAdapter,
  iORM.LiveBindings.Notification,
  iORM.LiveBindings.NaturalActiveObjectBindSourceAdapter,
  iORM.Context.Container, iORM.Context.Interfaces,
  iORM.Resolver.Interfaces, iORM.Resolver.Factory, iORM.Context.Factory,
  iORM.LiveBindings.ActiveInterfaceListBindSourceAdapter,
  iORM.LiveBindings.ActiveInterfaceObjectBindSourceAdapter;

{ TioLiveBindingsFactory }

class function TioLiveBindingsFactory.ContainedListBindSourceAdapter(const AOwner:TComponent; const AMasterProperty:IioContextProperty; const AWhere:IioWhere): IioContainedBindSourceAdapter;
var
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioRttiUtilities.IsAnInterfaceTypeName(AMasterProperty.GetRelationChildTypeName) then
    Result := TioActiveInterfaceListBindSourceAdapter.Create(
      AMasterProperty.GetRelationChildTypeName,
      AMasterProperty.GetRelationChildTypeAlias,
      AWhere, // Where
      AOwner,
      TList<IInterface>.Create,
      False)
  // else if the master property type is a class...
  else
  begin
    AContext := TioContextFactory.Context(AMasterProperty.GetRelationChildTypeName);
    Result := TioActiveListBindSourceAdapter.Create(
       AContext.GetClassRef
      ,AWhere  // where
      ,AOwner
      ,TList<TObject>.Create
      ,False);
  end;
  // Set MasterProperty for the adapter
  Result.SetMasterProperty(AMasterProperty);
end;

class function TioLiveBindingsFactory.ContainedObjectBindSourceAdapter(const AOwner:TComponent; const AMasterProperty:IioContextProperty; const AWhere:IioWhere): IioContainedBindSourceAdapter;
var
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioRttiUtilities.IsAnInterfaceTypeName(AMasterProperty.GetRelationChildTypeName) then
    Result := TioActiveInterfaceObjectBindSourceAdapter.Create(
      AMasterProperty.GetRelationChildTypeName,
      AMasterProperty.GetRelationChildTypeAlias,
      AWhere, // where
      AOwner,
      nil,     // AObject:TObject;
      False)
  // else if the master property type is a class...
  else
  begin
    AContext := TioContextFactory.Context(AMasterProperty.GetRelationChildTypeName);
    Result := TioActiveObjectBindSourceAdapter.Create(
       AContext.GetClassRef
      ,AWhere  // where
      ,AOwner
      ,nil     // AObject:TObject;
      ,False);
  end;
  // Set MasterProperty for the adapter
  Result.SetMasterProperty(AMasterProperty);
end;

class function TioLiveBindingsFactory.DetailAdaptersContainer(const AMasterAdapter:IioContainedBindSourceAdapter): IioDetailBindSourceAdaptersContainer;
begin
  Result := TioDetailAdaptersContainer.Create(AMasterAdapter);
end;

class function TioLiveBindingsFactory.GetBSAfromDB(const AOwner: TComponent; const ATypeName, ATypeAlias: String;
  const AWhere: IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean): TBindSourceAdapter;
begin
  // Get the adapter directly from iORM
  case AViewDataType of
    // For single object
    dtSingle: Result := io.Load(ATypeName, ATypeAlias)
                        ._Where(AWhere)
                        .ToActiveObjectBindSourceAdapter(AOwner, AAutoLoadData);
    // For list of objects
    dtList:   Result := io.Load(ATypeName, ATypeAlias)
                        ._Where(AWhere)
                        .ToActiveListBindSourceAdapter(AOwner, AAutoLoadData);
  end;
end;

class function TioLiveBindingsFactory.GetBSAfromMasterBindSource(const AOwner:TComponent; const AMAsterBindSource: TioMasterBindSource;
  const AMasterPropertyName: String; const AWhere:IioWhere): TBindSourceAdapter;
begin
  // If the MasterPropertyName property is empty then get a NaturalActiveBindSourceAdapter
  //  from the MasterBindSource else get a detail ActiveBindSourceAdapter even from the
  //  MasterBindSource.
  if (AMasterPropertyName <> '')
    then Result := AMAsterBindSource.GetDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere)
    else Result := AMAsterBindSource.GetNaturalObjectBindSourceAdapter(AOwner);
end;

class function TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(const AOwner: TComponent;
  const AMAsterBindSourceAdapter: IioActiveBindSourceAdapter; const AMasterPropertyName: String;
  const AWhere:IioWhere): TBindSourceAdapter;
begin
  // If the MasterPropertyName property is empty then get a NaturalActiveBindSourceAdapter
  //  from the MasterBindSource else get a detail ActiveBindSourceAdapter even from the
  //  MasterBindSource.
  if (AMasterPropertyName <> '')
    then Result := AMAsterBindSourceAdapter.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere)
    else Result := AMAsterBindSourceAdapter.NewNaturalObjectBindSourceAdapter(AOwner);
end;

class function TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(
  const AOwner: TComponent;
  const ASourceAdapter: IioNaturalBindSourceAdapterSource): TBindSourceAdapter;
begin
  Result := TioNaturalActiveObjectBindSourceAdapter.Create(AOwner, ASourceAdapter);
end;

class function TioLiveBindingsFactory.Notification(ASender, ASubject: TObject;
  ANotificationType: TioBSANotificationType): IioBSANotification;
begin
  Result := TioBSANotification.Create(ASender, ASubject, ANotificationType);
end;

end.
