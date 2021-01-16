{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.LiveBindings.Factory;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.CommonTypes, System.Classes,
  System.Generics.Collections, iORM.Context.Properties.Interfaces,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource,
  iORM.Utilities, iORM.MVVM.Interfaces, iORM.Where,
  iORM.Where.Interfaces, iORM.MVVM.Components.ModelPresenter;

type

  TioLiveBindingsFactory = class
  public
    class function DetailAdaptersContainer(const AMasterAdapter: IioContainedBindSourceAdapter)
      : IioDetailBindSourceAdaptersContainer;
    class function ContainedListBindSourceAdapter(const AOwner: TComponent; const AMasterProperty: IioContextProperty;
      const AWhere: IioWhere): IioContainedBindSourceAdapter;
    class function ContainedObjectBindSourceAdapter(const AOwner: TComponent; const AMasterProperty: IioContextProperty;
      const AWhere: IioWhere): IioContainedBindSourceAdapter;
    class function NaturalObjectBindSourceAdapter(const AOwner: TComponent; const ASourceAdapter: IioNaturalBindSourceAdapterSource)
      : TBindSourceAdapter;
    class function Notification(ASender: TObject; ASubject: TObject; ANotificationType: TioBSANotificationType): IioBSANotification;
    class function GetBSAfromMasterModelPresenter(const AOwner: TComponent; const AMasterModelPresenter: TioModelPresenter;
      const AMasterPropertyName: String = ''; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
    class function GetBSAfromMasterBindSource(const AOwner: TComponent; const AMAsterBindSource: TioMasterBindSource;
      const AMasterPropertyName: String = ''; const AWhere: IioWhere = nil): TBindSourceAdapter;
    class function GetBSAfromMasterBindSourceAdapter(const AOwner: TComponent;
      const AMAsterBindSourceAdapter: IioActiveBindSourceAdapter; const AMasterPropertyName: String = '';
      const AWhere: IioWhere = nil): TBindSourceAdapter;
    class function GetBSA(const AOwner: TComponent; const ATypeName, ATypeAlias: String; const AWhere: IioWhere;
      const AViewDataType: TioViewDataType; const AAutoLoadData: Boolean; const ADataObject: TObject; const AOwnsObject: Boolean)
      : IioActiveBindSourceAdapter;
    class function BSAToDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    class function GetBSAPageManagerStrategy(const APagingType: TioBSAPagingType): IioBSAPageManagerStrategy;
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
  System.SysUtils, iORM.Exceptions, iORM.LiveBindings.BSAToDataSetLink,
  iORM.LiveBindings.CommonBSAPaging;

{ TioLiveBindingsFactory }

class function TioLiveBindingsFactory.BSAToDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := TioBSAToDataSetLinkContainer.Create;
end;

class function TioLiveBindingsFactory.ContainedListBindSourceAdapter(const AOwner: TComponent;
  const AMasterProperty: IioContextProperty; const AWhere: IioWhere): IioContainedBindSourceAdapter;
var
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioUtilities.IsAnInterfaceTypeName(AMasterProperty.GetRelationChildTypeName) then
    Result := TioActiveInterfaceListBindSourceAdapter.Create(AMasterProperty.GetRelationChildTypeName,
      AMasterProperty.GetRelationChildTypeAlias, AWhere, // Where
      AOwner, TList<IInterface>.Create, False)
    // else if the master property type is a class...
  else
  begin
    AContext := TioContextFactory.Context(AMasterProperty.GetRelationChildTypeName);
    Result := TioActiveListBindSourceAdapter.Create(AContext.GetClassRef, AWhere // where
      , AOwner, TList<TObject>.Create, False);
  end;
  // Set MasterProperty for the adapter
  Result.SetMasterProperty(AMasterProperty);
end;

class function TioLiveBindingsFactory.ContainedObjectBindSourceAdapter(const AOwner: TComponent;
  const AMasterProperty: IioContextProperty; const AWhere: IioWhere): IioContainedBindSourceAdapter;
var
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioUtilities.IsAnInterfaceTypeName(AMasterProperty.GetRelationChildTypeName) then
    Result := TioActiveInterfaceObjectBindSourceAdapter.Create(AMasterProperty.GetRelationChildTypeName,
      AMasterProperty.GetRelationChildTypeAlias, AWhere, // where
      AOwner, nil, // AObject:TObject;
      False)
    // else if the master property type is a class...
  else
  begin
    AContext := TioContextFactory.Context(AMasterProperty.GetRelationChildTypeName);
    Result := TioActiveObjectBindSourceAdapter.Create(AContext.GetClassRef, AWhere // where
      , AOwner, nil // AObject:TObject;
      , False);
  end;
  // Set MasterProperty for the adapter
  Result.SetMasterProperty(AMasterProperty);
end;

class function TioLiveBindingsFactory.DetailAdaptersContainer(const AMasterAdapter: IioContainedBindSourceAdapter)
  : IioDetailBindSourceAdaptersContainer;
begin
  Result := TioDetailAdaptersContainer.Create(AMasterAdapter);
end;

class function TioLiveBindingsFactory.GetBSA(const AOwner: TComponent; const ATypeName, ATypeAlias: String; const AWhere: IioWhere;
  const AViewDataType: TioViewDataType; const AAutoLoadData: Boolean; const ADataObject: TObject; const AOwnsObject: Boolean)
  : IioActiveBindSourceAdapter;
var
  LIntfDataObject: IInterface;
  LContext: IioContext;
  LDataObject: TObject;
begin
  // Depending of the DataType (list or single object)...
  case AViewDataType of

    // LIST
    TioViewDataType.dtList:
      begin
        // Interfaced
        if TioUtilities.IsAnInterfaceTypeName(ATypeName) then
        begin
          if Assigned(ADataObject) then
            LDataObject := ADataObject
          else
            LDataObject := TList<IInterface>.Create;
          Result := TioActiveInterfaceListBindSourceAdapter.Create(ATypeName, ATypeAlias, AWhere, AOwner, LDataObject,
            AAutoLoadData, AOwnsObject);
        end
        // Class
        else
        begin
          LContext := TioContextFactory.Context(ATypeName);
          if Assigned(ADataObject) then
            LDataObject := ADataObject
          else
            LDataObject := TObjectList<TObject>.Create(True);
          Result := TioActiveListBindSourceAdapter.Create(LContext.GetClassRef, AWhere, AOwner, TObjectList<TObject>(LDataObject),
            AAutoLoadData, AOwnsObject);
        end;
      end;

    // SINGLE OBJECT
    TioViewDataType.dtSingle:
      begin
        // Interfaced
        if TioUtilities.IsAnInterfaceTypeName(ATypeName) then
        begin
          if Assigned(ADataObject) and not Supports(ADataObject, IInterface, LIntfDataObject) then
            raise EioException.Create(Self.ClassName, 'GetBSA',
              'TypeName is an interface but ADataObject does not implement any interface.');
          Result := TioActiveInterfaceObjectBindSourceAdapter.Create(ATypeName, ATypeAlias, AWhere, AOwner, LIntfDataObject,
            AAutoLoadData);
        end
        // Class
        else
        begin
          LContext := TioContextFactory.Context(ATypeName);
          Result := TioActiveObjectBindSourceAdapter.Create(LContext.GetClassRef, AWhere, AOwner, ADataObject, AAutoLoadData,
            AOwnsObject);
          // False);
        end;

      end;
  end;
end;

class function TioLiveBindingsFactory.GetBSAfromMasterBindSource(const AOwner: TComponent;
  const AMAsterBindSource: TioMasterBindSource; const AMasterPropertyName: String; const AWhere: IioWhere): TBindSourceAdapter;
begin
  // If the MasterPropertyName property is empty then get a NaturalActiveBindSourceAdapter
  // from the MasterBindSource else get a detail ActiveBindSourceAdapter even from the
  // MasterBindSource.
  if (AMasterPropertyName <> '') then
    Result := AMAsterBindSource.GetDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere)
  else
    Result := AMAsterBindSource.GetNaturalObjectBindSourceAdapter(AOwner);
end;

class function TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(const AOwner: TComponent;
  const AMAsterBindSourceAdapter: IioActiveBindSourceAdapter; const AMasterPropertyName: String; const AWhere: IioWhere)
  : TBindSourceAdapter;
begin
  // If the MasterPropertyName property is empty then get a NaturalActiveBindSourceAdapter
  // from the MasterBindSource else get a detail ActiveBindSourceAdapter even from the
  // MasterBindSource.
  if (AMasterPropertyName <> '') then
    Result := AMAsterBindSourceAdapter.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere)
  else
    Result := AMAsterBindSourceAdapter.NewNaturalObjectBindSourceAdapter(AOwner);
end;

class function TioLiveBindingsFactory.GetBSAfromMasterModelPresenter(const AOwner: TComponent;
  const AMasterModelPresenter: TioModelPresenter; const AMasterPropertyName: String; const AWhere: IioWhere)
  : IioActiveBindSourceAdapter;
begin
  // If the MasterPropertyName property is empty then get a NaturalActiveBindSourceAdapter
  // from the MasterBindSource else get a detail ActiveBindSourceAdapter even from the
  // MasterBindSource.
  if (AMasterPropertyName <> '') then
    Result := AMasterModelPresenter.GetDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere)
  else
    Result := AMasterModelPresenter.GetNaturalObjectBindSourceAdapter(AOwner);
end;

class function TioLiveBindingsFactory.GetBSAPageManagerStrategy(const APagingType: TioBSAPagingType): IioBSAPageManagerStrategy;
begin
  case APagingType of
    ptHardPaging:
      Result := TioCommonBSAPageManagerStrategy_HardPaging.Create;
    ptProgressiveManual:
      Result := TioCommonBSAPageManagerStrategy_ProgressiveManual.Create;
  else
    Result := nil;
  end;
end;

class function TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(const AOwner: TComponent;
  const ASourceAdapter: IioNaturalBindSourceAdapterSource): TBindSourceAdapter;
begin
  Result := TioNaturalActiveObjectBindSourceAdapter.Create(AOwner, ASourceAdapter);
end;

class function TioLiveBindingsFactory.Notification(ASender, ASubject: TObject; ANotificationType: TioBSANotificationType)
  : IioBSANotification;
begin
  Result := TioBSANotification.Create(ASender, ASubject, ANotificationType);
end;

end.
