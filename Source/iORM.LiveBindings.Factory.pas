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



unit iORM.LiveBindings.Factory;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.CommonTypes, System.Classes,
  System.Generics.Collections, iORM.Context.Properties.Interfaces,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource,
  iORM.Rtti.Utilities, iORM.MVVM.Interfaces, iORM.Where,
  iORM.Where.Interfaces, iORM.MVVM.Components.ModelPresenter;

type

  TioLiveBindingsFactory = class
  public
    class function DetailAdaptersContainer(const AMasterAdapter:IioContainedBindSourceAdapter): IioDetailBindSourceAdaptersContainer;
    class function ContainedListBindSourceAdapter(const AOwner:TComponent; const AMasterProperty:IioContextProperty; const AWhere:IioWhere): IioContainedBindSourceAdapter;
    class function ContainedObjectBindSourceAdapter(const AOwner:TComponent; const AMasterProperty:IioContextProperty; const AWhere:IioWhere): IioContainedBindSourceAdapter;
    class function NaturalObjectBindSourceAdapter(const AOwner:TComponent; const ASourceAdapter:IioNaturalBindSourceAdapterSource): TBindSourceAdapter;
    class function Notification(ASender:TObject; ASubject:TObject; ANotificationType:TioBSANotificationType): IioBSANotification;
    class function GetBSAfromMasterModelPresenter(const AOwner:TComponent; const AMasterModelPresenter:TioModelPresenter; const AMasterPropertyName:String=''; const AWhere:IioWhere=nil): IioActiveBindSourceAdapter;
    class function GetBSAfromMasterBindSource(const AOwner:TComponent; const AMAsterBindSource:TioMasterBindSource; const AMasterPropertyName:String=''; const AWhere:IioWhere=nil): TBindSourceAdapter;
    class function GetBSAfromMasterBindSourceAdapter(const AOwner:TComponent; const AMAsterBindSourceAdapter:IioActiveBindSourceAdapter; const AMasterPropertyName:String=''; const AWhere:IioWhere=nil): TBindSourceAdapter;
    class function GetBSAfromDB(const AOwner:TComponent; const ATypeName, ATypeAlias:String; const AWhere:IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean): TBindSourceAdapter;
    class function GetBSAByTypeName(const ATypeName, ATypeAlias:String; const AWhere:IioWhere; const AViewDataType:TioViewDataType; const AAutoLoadData:Boolean; const AOwner: TComponent): IioActiveBindSourceAdapter;
    class function BSAToDataSetLinkContainer: IioBSAToDataSetLinkContainer;
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
  iORM.LiveBindings.ActiveInterfaceObjectBindSourceAdapter,
  System.SysUtils, iORM.Exceptions, iORM.LiveBindings.BSAToDataSetLink;

{ TioLiveBindingsFactory }

class function TioLiveBindingsFactory.BSAToDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := TioBSAToDataSetLinkContainer.Create;
end;

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

class function TioLiveBindingsFactory.GetBSAByTypeName(const ATypeName,
  ATypeAlias: String; const AWhere: IioWhere;
  const AViewDataType: TioViewDataType; const AAutoLoadData: Boolean;
  const AOwner: TComponent): IioActiveBindSourceAdapter;
var
  LBindSourceAdapter: TBindSourceAdapter;
begin
  case AViewDataType of
    dtSingle:
      LBindSourceAdapter := io.Load(ATypeName, ATypeAlias)._Where(AWhere).ToActiveObjectBindSourceAdapter(AOwner, AAutoLoadData);
    dtList:
      LBindSourceAdapter := io.Load(ATypeName, ATypeAlias)._Where(AWhere).ToActiveListBindSourceAdapter(AOwner, AAutoLoadData);
  end;
  if not Supports(LBindSourceAdapter, IioActiveBindSourceAdapter, Result) then
    raise EioException.Create(Self.ClassName + '.GetBSAByTypeName: "IioActiveBindSourceAdapter" interface not implemented by object.');
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

class function TioLiveBindingsFactory.GetBSAfromMasterModelPresenter(
  const AOwner: TComponent; const AMasterModelPresenter: TioModelPresenter;
  const AMasterPropertyName: String;
  const AWhere: IioWhere): IioActiveBindSourceAdapter;
begin
  // If the MasterPropertyName property is empty then get a NaturalActiveBindSourceAdapter
  //  from the MasterBindSource else get a detail ActiveBindSourceAdapter even from the
  //  MasterBindSource.
  if (AMasterPropertyName <> '')
    then Result := AMasterModelPresenter.GetDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere)
    else Result := AMasterModelPresenter.GetNaturalObjectBindSourceAdapter(AOwner);
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
