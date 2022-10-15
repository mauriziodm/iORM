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
  iORM.LiveBindings.Interfaces, iORM.CommonTypes, System.Classes, System.Generics.Collections, iORM.Context.Properties.Interfaces,
  Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.Utilities, iORM.MVVM.Interfaces, iORM.Where,
  iORM.Where.Interfaces, iORM.MVVM.ModelPresenter.Custom, iORM.LiveBindings.CommonBSAPaging;

type

  TioLiveBindingsFactory = class
  public
    class function DetailAdaptersContainer(const AMasterAdapter: IioContainedBindSourceAdapter): IioDetailBindSourceAdaptersContainer;
    class function ContainedListBindSourceAdapter(const AOwner: TComponent; const AMasterProperty: IioProperty; const AWhere: IioWhere)
      : IioContainedBindSourceAdapter;
    class function ContainedObjectBindSourceAdapter(const AOwner: TComponent; const AMasterProperty: IioProperty; const AWhere: IioWhere)
      : IioContainedBindSourceAdapter;
    class function NaturalObjectBindSourceAdapter(const AOwner: TComponent; const ASourceAdapter: IioNaturalBindSourceAdapterSource)
      : IioActiveBindSourceAdapter;
// ----- OLD CODE -----
//    class function GetBSAfromMasterBindSourceAdapter(const ASenderBSName: String; const AOwner: TComponent; const AMasterBindSource: IioNotifiableBindSource;
//      const AMasterPropertyName: String = ''; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
// ----- OLD CODE -----
    class function GetNaturalBSAfromMasterBindSource(const AOwner: TComponent; const ASenderBSName: String; const AMasterBS: IioNotifiableBindSource): IioActiveBindSourceAdapter;
    class function GetDetailBSAfromMasterBindSource(const AOwner: TComponent; const ASenderBSName: String; const AMasterBS: IioNotifiableBindSource;
      const AMasterPropertyName: String = ''; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
    class function GetBSA(const AOwner: TComponent; const ASenderBSName, ATypeName, ATypeAlias: String; const AWhere: IioWhere; const ATypeOfCollection: TioTypeOfCollection;
      const ADataObject: TObject; const AOwnsObject: Boolean): IioActiveBindSourceAdapter;
    class function BSAToDataSetLinkContainer: IioBSAToDataSetLinkContainer;
    class function GetBSAPageManagerStrategy(const APagingType: TioBSAPagingType): IioBSAPageManagerStrategy;
  end;

implementation

uses
  iORM,
  iORM.LiveBindings.DetailAdaptersContainer,
  iORM.LiveBindings.ActiveListBindSourceAdapter,
  iORM.LiveBindings.ActiveObjectBindSourceAdapter,
  iORM.LiveBindings.NaturalActiveObjectBindSourceAdapter,
  iORM.Context.Container, iORM.Context.Interfaces,
  iORM.Resolver.Interfaces, iORM.Resolver.Factory, iORM.Context.Factory,
  iORM.LiveBindings.ActiveInterfaceListBindSourceAdapter,
  iORM.LiveBindings.ActiveInterfaceObjectBindSourceAdapter,
  System.SysUtils, iORM.Exceptions, iORM.LiveBindings.BSAToDataSetLink,
  iORM.LiveBindings.NaturalActiveInterfaceObjectBindSourceAdapter;

{ TioLiveBindingsFactory }

class function TioLiveBindingsFactory.BSAToDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := TioBSAToDataSetLinkContainer.Create;
end;

class function TioLiveBindingsFactory.ContainedListBindSourceAdapter(const AOwner: TComponent; const AMasterProperty: IioProperty; const AWhere: IioWhere)
  : IioContainedBindSourceAdapter;
begin
  // If the master property type is an interface...
  if TioUtilities.IsAnInterfaceTypeName(AMasterProperty.GetRelationChildTypeName) then
    Result := TioActiveInterfaceListBindSourceAdapter.Create(AMasterProperty.GetRelationChildTypeName, AMasterProperty.GetRelationChildTypeAlias, AWhere,
      AOwner, TList<IInterface>.Create)
    // else if the master property type is a class...
  else
  begin
    Result := TioActiveListBindSourceAdapter.Create(TioUtilities.ClassNameToClassRef(AMasterProperty.GetRelationChildTypeName), AWhere, AOwner,
      TList<TObject>.Create);
  end;
  // Set MasterProperty for the adapter
  Result.SetMasterProperty(AMasterProperty);
end;

class function TioLiveBindingsFactory.ContainedObjectBindSourceAdapter(const AOwner: TComponent; const AMasterProperty: IioProperty; const AWhere: IioWhere)
  : IioContainedBindSourceAdapter;
begin
  // If the master property type is an interface...
  if TioUtilities.IsAnInterfaceTypeName(AMasterProperty.GetRelationChildTypeName) then
    Result := TioActiveInterfaceObjectBindSourceAdapter.Create(AMasterProperty.GetRelationChildTypeName, AMasterProperty.GetRelationChildTypeAlias, AWhere,
      AOwner, nil) // AObject:TObject;
    // else if the master property type is a class...
  else
    Result := TioActiveObjectBindSourceAdapter.Create(TioUtilities.ClassNameToClassRef(AMasterProperty.GetRelationChildTypeName), AWhere, AOwner, nil);
  // AObject:TObject;
  // Set MasterProperty for the adapter
  Result.SetMasterProperty(AMasterProperty);
end;

class function TioLiveBindingsFactory.DetailAdaptersContainer(const AMasterAdapter: IioContainedBindSourceAdapter): IioDetailBindSourceAdaptersContainer;
begin
  Result := TioDetailAdaptersContainer.Create(AMasterAdapter);
end;

class function TioLiveBindingsFactory.GetBSA(const AOwner: TComponent; const ASenderBSName, ATypeName, ATypeAlias: String; const AWhere: IioWhere; const ATypeOfCollection: TioTypeOfCollection;
      const ADataObject: TObject; const AOwnsObject: Boolean): IioActiveBindSourceAdapter;
var
  LIntfDataObject: IInterface;
  LDataObject: TObject;
begin
  // Check for type name
  if ATypeName.IsEmpty then
    raise EioException.Create(ClassName, 'GetBSA',
      Format('In component "%s" the "LoadType" property has been set to "ltAuto" or "ltManual" but the "TypeName" property has been left blank.'
      + #13#13'iORM is therefore unable to load (from the RDBMS) the instance to expose for binding.'#13#13'Please set the property and then try again.',
      [ASenderBSName]));

  // Depending of the DataType (list or single object)...
  case ATypeOfCollection of

    // LIST
    TioTypeOfCollection.tcList:
      begin
        // Interfaced
        if TioUtilities.IsAnInterfaceTypeName(ATypeName) then
        begin
          if Assigned(ADataObject) then
            LDataObject := ADataObject
          else
            LDataObject := TList<IInterface>.Create;
          Result := TioActiveInterfaceListBindSourceAdapter.Create(ATypeName, ATypeAlias, AWhere, AOwner, LDataObject, AOwnsObject);
        end
        // Class
        else
        begin
          if Assigned(ADataObject) then
            LDataObject := ADataObject
          else
            LDataObject := TObjectList<TObject>.Create(True);
          Result := TioActiveListBindSourceAdapter.Create(TioUtilities.ClassNameToClassRef(ATypeName), AWhere, AOwner, TObjectList<TObject>(LDataObject),
            AOwnsObject);
        end;
      end;

    // SINGLE OBJECT
    TioTypeOfCollection.tcSingleObject:
      begin
        // Interfaced
        if TioUtilities.IsAnInterfaceTypeName(ATypeName) then
        begin
          if Assigned(ADataObject) and not Supports(ADataObject, IInterface, LIntfDataObject) then
            raise EioException.Create(Self.ClassName, 'GetBSA', 'TypeName is an interface but ADataObject does not implement any interface.');
          Result := TioActiveInterfaceObjectBindSourceAdapter.Create(ATypeName, ATypeAlias, AWhere, AOwner, LIntfDataObject);
        end
        // Class
        else
        begin
          Result := TioActiveObjectBindSourceAdapter.Create(TioUtilities.ClassNameToClassRef(ATypeName), AWhere, AOwner, ADataObject, AOwnsObject);
          // False);
        end;

      end;
  end;
end;

class function TioLiveBindingsFactory.GetBSAPageManagerStrategy(const APagingType: TioBSAPagingType): IioBSAPageManagerStrategy;
begin
  case APagingType of
    ptHardPaging:
      Result := TioCommonBSAPageManagerStrategy_HardPaging.Create;
    ptProgressiveManual:
      Result := TioCommonBSAPageManagerStrategy_ProgressiveManual.Create;
    ptProgressiveAuto:
      Result := TioCommonBSAPageManagerStrategy_ProgressiveAuto.Create;
  else
    Result := nil;
  end;
end;

class function TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(const AOwner: TComponent; const ASourceAdapter: IioNaturalBindSourceAdapterSource)
  : IioActiveBindSourceAdapter;
begin
  if ASourceAdapter.IsInterfaceBSA then
    Result := TioNaturalActiveInterfaceObjectBindSourceAdapter.Create(AOwner, ASourceAdapter)
  else
    Result := TioNaturalActiveObjectBindSourceAdapter.Create(AOwner, ASourceAdapter);
end;

// ----- OLD CODE -----
//class function TioLiveBindingsFactory.GetBSAfromMasterBindSourceAdapter(const ASenderBSName: String; const AOwner: TComponent;
//  const AMasterBindSource: IioNotifiableBindSource; const AMasterPropertyName: String = ''; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
//begin
//  // If the MasterPropertyName property is empty then get a NaturalActiveBindSourceAdapter
//  // from the MasterBindSource else get a detail ActiveBindSourceAdapter even from the
//  // MasterBindSource.
//  if AMasterPropertyName.IsEmpty then
//  begin
//    if not Assigned(AMasterBindSource) then
//      raise EioException.Create(ClassName, 'GetBSAfromMasterBindSourceAdapter',
//        Format('In bind source "%s" the "LoadType" property has been set to one of his values ("ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance") but the "SourceXXX" property has been left blank.'
//        + ' iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the "SourceXXX" property of bind source "%s" and then try again.',
//        [ASenderBSName, ASenderBSName]));
//    Result := AMasterBindSource.GetActiveBindSourceAdapter.NewNaturalObjectBindSourceAdapter(AOwner);
//  end
//  else
//  begin
//    Result := AMasterBindSource.GetActiveBindSourceAdapter.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere);
//  end;
//end;
// ----- OLD CODE -----

class function TioLiveBindingsFactory.GetNaturalBSAfromMasterBindSource(const AOwner: TComponent; const ASenderBSName: String; const AMasterBS: IioNotifiableBindSource): IioActiveBindSourceAdapter;
begin
  // Check if the MasterBS property is set
  if not Assigned(AMasterBS) then
    raise EioException.Create(ClassName, 'GetNaturalBSAfromMasterBindSource',
      Format('In component "%s" the "LoadType" property has been set to one of this values ("ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance") but the "SourceXXX" property (maybe SourceDataSet, SourcePBS or SourcePresenter) has been left blank.'
      + #13#13'iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the "SourceXXX" property of bind source "%s" and then try again.',
      [ASenderBSName, ASenderBSName]));
  // Return the requested natural bind source adapter
  Result := AMasterBS.GetActiveBindSourceAdapter.NewNaturalObjectBindSourceAdapter(AOwner);
end;

class function TioLiveBindingsFactory.GetDetailBSAfromMasterBindSource(const AOwner: TComponent; const ASenderBSName: String; const AMasterBS: IioNotifiableBindSource;
      const AMasterPropertyName: String = ''; const AWhere: IioWhere = nil): IioActiveBindSourceAdapter;
begin
  // Check if the MasterPropertyName property is set
  if AMasterPropertyName.IsEmpty then
   raise EioException.Create(ClassName, 'GetDetailBSAfromMasterBindSource',
     Format('The "MasterPropertyName" property has not been set in the component "%s".'
      + #13#13'iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the property and try again.',
     [ASenderBSName]));
  // Return the requested bind source adapter
  Result := AMasterBS.GetActiveBindSourceAdapter.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere);
end;

end.
